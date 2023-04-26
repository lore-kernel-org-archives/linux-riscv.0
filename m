Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F793C7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 22:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3U1cZlzarWCysd9wvAbKNotORJsh9Qx69adHqZcSdg=; b=JNT+AHky9MxqPY
	EudY84XRaN5IM6YMgZ8k+l/OGWBJv5OyLBFS2nzS/xIv2ck3XRiUbXu34eB/h28QTbvaoaL6x61xf
	GfRyjpCxZqOmuN6C0qjwbzUza/8ljcxxx+649J+MqHIYhxFnqvdxN4lyVKncEp8ADJiYxfrHhu/g5
	N31UyFCGRPUtPFPtjrSV9j+mWPfu1SKPcResRSCx4kSXgFZNN+PdyL8Kia4SYMvDHkda693myQxm4
	WhwbyYXSrd9oyFnDlNkOm0cwyX03BJTEcyfRw3VkH4bYAmxuPJlyEu4+TpCHl3KXnQoE8RG+EqY/n
	hH6UqZ7N9lcvGcLvILsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pro3H-004zhE-1B;
	Wed, 26 Apr 2023 22:55:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pro3F-004zgn-2C
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 22:55:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BB5916227E;
	Wed, 26 Apr 2023 22:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64D3C433EF;
	Wed, 26 Apr 2023 22:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682549752;
	bh=mO31oiCqVL+zzEwTGzeQsA/0T08Xnt0P1wKcAF+Logc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UTx9xBDo4rTTgBZ6kYLPc/H0W27KPvUPha+gU/V9BiMCyIZMS+/C71u1MU1H9O89M
	 hLq1rTVA1fZYw63ZnNMOadUH/admvQdzc5vtd5JhEQXShF9hJVi+Xkr7a8BJfBbtQW
	 8BOScQvTLSkdz7gXDSB2y+vOryBE9JYykmj1jMxZHSrvZtADBwNyjcy84g1hjvWvD3
	 ps3r7IBomKD1ud3/vIa8ZeSD0Iqb+J8Je7kLq7irahYybUmi/nw5HZ2ZcK3gdrdB1Q
	 TvihtT9/JJC7KHpaPHamSYp8sGNmfSdMYWjX3DD2OR/cdldWF98lcB4xFo/x+aqKrW
	 jdODNyng+Mgvw==
Date: Wed, 26 Apr 2023 15:55:50 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 0/4] Implement GCM ghash using Zbc and Zbkb extensions
Message-ID: <20230426225550.GA65659@sol.localdomain>
References: <20230329140642.2186644-1-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230329140642.2186644-1-heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_155553_782337_2862DB7F 
X-CRM114-Status: GOOD (  12.09  )
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

Hi Heiko,

On Wed, Mar 29, 2023 at 04:06:38PM +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> This was originally part of my vector crypto series, but was part
> of a separate openssl merge request implementing GCM ghash as using
> non-vector extensions.
> 
> As that pull-request
>     https://github.com/openssl/openssl/pull/20078
> got merged recently into openssl, we could also check if this could
> go into the kernel as well and provide a base for further accelerated
> cryptographic support.

One more question.  It seems that this patchset uses the RISC-V scalar crypto
extensions.  I've been hearing rumors that the RISC-V scalar crypto extensions
have been superseded by the vector crypto extensions.  Is that accurate?  I
wonder if it's worth putting effort into implementations that use the scalar
crypto extensions when they might already be obsolete.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
