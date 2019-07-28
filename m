Return-Path: <SRS0=hpeE=VZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9A1C7618B
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 28 Jul 2019 13:30:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C376B2077C
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 28 Jul 2019 13:30:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OkjJHDio";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBszeDWn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C376B2077C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VeGwtQNPN7sKEzaC8H8e1jhiwvMzJnWLGpqkGAmQaU0=; b=OkjJHDioixSY7Q
	yrzHl0DraVkyc+drzx2a01g6nmla3oWtK3BAqdYO/Ie/UTK3gaIqFUlXnq7Kxe6pSdvXGHppItVYh
	Eoh1D4iCR/2AQEkRu5oCCCCCqKtwvX4eqFoTJg6yRgzQWgps0jgUC5dNtxjWt9XLZd7ggiml6f+Mm
	D4Bap1XTxiqTAecO7kxSFB/uOkfCR0UcbaZomJdWQg6AxvQBF3R5Sm9S8Xc+j9W5yUnsZ4jKgY8/Y
	I+l5uPZblOKL+zdxLCbywSYT1vHxTnLozE0MmIXVHh7MK1Y6jUREgHQnyGKsSafxHGbe3xP9CWzAx
	2vvnTunhUhLyWeoYDzGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrjFP-00083L-7r; Sun, 28 Jul 2019 13:29:59 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrjFM-00082k-3s
 for linux-riscv@lists.infradead.org; Sun, 28 Jul 2019 13:29:57 +0000
Received: by mail-ed1-x543.google.com with SMTP id p15so57007584eds.8
 for <linux-riscv@lists.infradead.org>; Sun, 28 Jul 2019 06:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mvXJ3/c4rpFRGGh2Wow0lkZGjKN4V1iCfYC7Oigz+iA=;
 b=WBszeDWnp4ZcGvcJBBrX+sXfsbbQGBMwyvnvu5/GlXW+VqkFGoJ8GdKapq1oALPyLs
 G13dv5CGaW0XI9qGkQjgfORNTLQSkyLQBRt4yga/lHpBKVCHdP0ISR+gjVgNVHf7jz/J
 1FOV6JAnaQz1URcB+qsDQwlchxqMm5zXThFNYTPPRz97RXNFYqpxpkgOj4bbxWbgu6w9
 k0Oiu87maWJR/CL23+qO++5TWMr7OI5On+em7+hrcB8JfxQEqx3evrr5ovkdhrHXHk58
 ZvD1rxgN9YY2VsQu7k7jHc4IOUtWyDvAgJS2gHt7VV1y7O5ondyGju0TCnndQoRw4g/k
 UDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mvXJ3/c4rpFRGGh2Wow0lkZGjKN4V1iCfYC7Oigz+iA=;
 b=XuAxlo7bfyG+GNskUhd/JoNiNJ0OltmMJMBSo5rgeRFwdmucY5Y7YZKMQFHMijZAPd
 fvF5bALJVXTtiY0xs6Y3evO63IM8q/g00/LcYBops8zsyVCV5MOqx9i2ylaqgOh5VFyc
 rfQDxuHSApeE68GAm2K/pseGZQLKhQA1Wk5YejQeWOngIl6RGlwk/yoozm/217OwEQ4V
 1s2KVpZsISoGMtFC7bZaVt1UGEfPreFF6ODCB0Gf1VeEWjats4WtGuzE/L8gAS/N0zr2
 mlpa51RMSqkz0mLHNrauZwfPIJ/qCzrF5MtobGAn1qM+o6JajP1vNEzTkCB95nrigwYn
 O0/g==
X-Gm-Message-State: APjAAAWrUv2RCsSdHNljvDUvuIvUHvsFZwqIkDuNqKDFRXwHK07lsE3w
 Fgfm1U0adiaZy7gPmrimhB6/rdrm5nbqLwO7/MptGQqv
X-Google-Smtp-Source: APXvYqzUHdn0K/6jv1Ayf0caTyzE54mDGtV0LNSQdgaxs59ZSKla4UqaBrYnMXVctxpaI0W6SGAuv6R1sbGMKAUdF+Y=
X-Received: by 2002:a50:ad01:: with SMTP id y1mr89286757edc.180.1564320592940; 
 Sun, 28 Jul 2019 06:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.9999.1907251535421.32766@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1907251535421.32766@viisi.sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 28 Jul 2019 21:29:42 +0800
Message-ID: <CAEUhbmUeAFtmFci78phyLdxTFwh4rfztsMZAy5ekfbmyX1VZeA@mail.gmail.com>
Subject: Re: [PATCH] riscv: defconfig: align RV64 defconfig to the output of
 "make savedefconfig"
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190728_062956_181410_3204CD24 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 26, 2019 at 6:36 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
>
> Align the RV64 defconfig to the output of "make savedefconfig" to
> avoid unnecessary deltas for future defconfig patches.  This patch
> should have no runtime functional impact.
>
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> ---
>  arch/riscv/configs/defconfig | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
