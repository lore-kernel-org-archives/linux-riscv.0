Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D14EC021A0
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 19:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GQA2wVGp1yXkkoy0X24DNMARBCUzMtBbK4xx/a37fXI=; b=BPaj4Sht+NodVI
	kCli/hJGPMhLlCMiGSBkbhlgE3oAtdsKs0F2qI6jDEO98CKyRX6TV7hRGrw/zzYAsC0YCOcrxjNOe
	T973JrKTrNmyKTTrda9zm2M+DPOSOsd8FAIG8U3uvtTyzNV3n+F5x563EBbtpMBYzp0NAMXm44XAg
	Z4wzPKZ6RiDR1RAScNYg+vMYRnR6ydzP/BK3EFq5ZHCInxgxJBOU+6ReOZWDp4kSqChRqXcN8srcN
	n6z2uKr2uLtowQSDpfessJfYRUK8UWQffrXSav0KDxnyBfRCTw8J2dnrzpz9wVEGkjE8VcuVnn5rD
	Rfkc2Fk8B42x7NPsfOjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiImK-00000008hTI-47lp;
	Wed, 12 Feb 2025 19:52:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiImJ-00000008hSU-2hw4
	for linux-riscv@lists.infradead.org;
	Wed, 12 Feb 2025 19:52:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8D807A419AC;
	Wed, 12 Feb 2025 19:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7D8C4CEDF;
	Wed, 12 Feb 2025 19:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739389930;
	bh=MirLEMBUS3CsZ4GfrxE0VRsF/YJXIM51BRXXjBFtms0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JY+xLVufez0k6fR6Q7DZTWkhD/tkqmn1ZSdVQuGm0SJiBCXXT7u9mRKJi5LdZh9g+
	 1j/WnvF3nlLY2GZmdv4Gp6x9LzP19Izd5YOEGBYRjYfxPSio5rlxLj27g/HxG/ZtNy
	 2rW1C1WXYxOjqtnfbDDDDV9Xxv+IqQn/cQ6eFgu/TgQvzZGQLPC4jUAHK+1O82+k+q
	 4/ja/hr9jM12BqcyOGrIr4sv6XO5n96bDiup6lVZKMGxV7V7ofdhkuqfc83avPfKDx
	 85LttHzAgol5RRUiCDxcSYV91onhVTTEbGWfo3zxFieG/3zkpJZ9wkoepfzvvFdbc5
	 bMI1vq04B7GlA==
Date: Wed, 12 Feb 2025 11:52:08 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Zhihang Shao <zhihang.shao.iscas@gmail.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, ardb@kernel.org
Subject: Re: [PATCH v3] riscv: Optimize crct10dif with zbc extension
Message-ID: <20250212195208.GA128826@sol.localdomain>
References: <20250205065815.91132-1-zhihang.shao.iscas@gmail.com>
 <20250205163012.GB1474@sol.localdomain>
 <f827cbb0-f6ad-4397-9f30-ca43223c4853@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f827cbb0-f6ad-4397-9f30-ca43223c4853@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_115211_743389_1A8CC2B5 
X-CRM114-Status: GOOD (  13.94  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 12, 2025 at 04:08:51PM +0800, Zhihang Shao wrote:
> On 2025/2/6 0:30, Eric Biggers wrote:
> 
> > Maybe use 'const __be64 *' and 'const __be32 *' for the pointer, and use
> > be64_to_cpu() and be32_to_cpu().  Then the __force cast won't be needed.
> Maybe this problem seems dumb, but I have no idea to adapt both riscv32 and
> riscv64. I have tried to use 'const __be64 *' and 'const __be32 *' pointer
> in patch v4, but I forgot to test them in riscv32, and it turns out the code
> failed to compile due to my mistake of defining 'const __be64 * p_ul' and of
> course it wouldn't be work for riscv32. Maybe I need some inspiration for
> this problem, or I still think it better to use 'unsigned long const *'
> since it works fine in both riscv64 and riscv32.
> 
> Looking forward to your reply and guidance.
> 
> Yours,
> 
> Zhihang
> 

I'm working on this patch and am going to send out a cleaned-up version.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
