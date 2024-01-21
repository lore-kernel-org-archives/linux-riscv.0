Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216ECC47422
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Jan 2024 18:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NVZDHhamBRnyFEs2MOZrW5BYyN5CZ6sZnYUVFhhGpHI=; b=rl5hKUACxF4l7J
	ibu0bnZuYgCWlavdhrbnCcZq7cKoRKhLbz9bhtzP+u3xUDxO+jBn9XJpYNNLyvAKxHnX8tp8gQ6Ug
	4FSvckjLb+cb/nWwVpAaIGGma3yQYW+AisL1tabsfTPA7pxIDsmIVkOI41M6wcmL2CYhKwYNg0D/4
	1b7Jk/RQQt0TYQ5eXlz6cx+RXDtiBqAXPv6YoRrJnS2oa/xHCk8QR6PfThqxOM64mhY/0IQZo6yzF
	nPaWNiViQM9us6Z32pofEXCabWpFZ6fNbb4XmN/UbEw56N+6kckAcfSFpZw9+LQUJHgH5JtXznc7+
	c6JeFu6R8F23dmQwpoSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRcH6-009qRt-0T;
	Sun, 21 Jan 2024 18:10:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRcH2-009qPL-0a;
	Sun, 21 Jan 2024 18:10:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E3E11B80AE6;
	Sun, 21 Jan 2024 18:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F66EC433C7;
	Sun, 21 Jan 2024 18:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705860616;
	bh=Rl/v6qrmQdewiBGrXL8EVM0U481qtb9GIY3m4jYIpvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eYRRY3l+M5kL8+syomvwfSBrYc0/NFWHYsdbeeexl4QKwdhXJYuMvxqJHS2C9Aj5B
	 h6LFLrgwMfAKoVC46zmLDDQGH+VM2iry/k2POnqayiCO3qobdjpQaVchjYSPltew8c
	 dkagHSdXmj1KpztNCW1kfS5zNNoUMnZYn+9Frtr63CLD/xLdBgYpb8nkEyxyrPWIxP
	 SH+YFbAryQ1dI/qWfP91ZQ5RtAO3DxmzIgIhccmr1gvwv4dEBgWWZVhNFLUid1BiA6
	 511sj5khDRML/QDN3GvvMglR+kAt4BQtOsqU+YZyQXJH9j0OEXNJ6oA9P/EJGHveai
	 +kGNLGzkyl4OA==
Date: Sun, 21 Jan 2024 10:10:09 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Nelson Chu <nelson.chu@sifive.com>,
	linux-riscv@lists.infradead.org, anup@brainfault.org,
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, Vineet Gupta <vineetg@rivosinc.com>,
	greentime.hu@sifive.com, guoren@linux.alibaba.com,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com
Subject: Re: [PATCH -next v21 23/27] riscv: detect assembler support for
 .option arch
Message-ID: <20240121181009.GA1469@sol.localdomain>
References: <20240121011341.GA97368@sol.localdomain>
 <mhng-e4b5de69-859d-43ea-b35d-b568e6a621ef@palmer-ri-x1c9>
 <CABgGipW0pZCESu7dyiUdta2JtrpeMsJ3EABNjj_0GO9fbbTwQg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABgGipW0pZCESu7dyiUdta2JtrpeMsJ3EABNjj_0GO9fbbTwQg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_101024_355483_61289262 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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

On Sun, Jan 21, 2024 at 10:32:59PM +0800, Andy Chiu wrote:
> 
> Maybe what we really should do is to upgrade the condition check to a
> one liner shell script and grep if "Warning" is being printed. Sadly
> this warning is not failing the compilation with -Werror.
> 
> I can try forming a patch on this if it feels alright to people.

What about -Wa,--fatal-warnings ?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
