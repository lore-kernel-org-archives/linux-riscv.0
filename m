Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640D8C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 12:39:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F61320873
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 12:39:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y7bVxnW+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyT0aiJ8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F61320873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4jckDOnYa7XrCIuIBkskSUXQB5+0OHnDgTx5yz6Q8fE=; b=Y7bVxnW+xWH+/j
	1UsdGvn7JDOSQyEZQudxJ4x5gMVQozTYZRjVg0vMtTVkSaplRyOfig9bpCz/EsGz3bEQE6kNpDbSQ
	Bc51arm30yyOO9lefjUv+iKj8YQ7AB9EWonR2I8x3CTvYjWtxJ29e5JCDHD1M1qfxDPx5L0G49FyM
	CgJC7E9tng3z31VnhcL8hLFjdfSZ/bgTrg4oSmjF9ARuvGH1KYrTvsVLXzeqUJOSrIJk3MAufVXTl
	IaWFQvl/0+6v/6tgwf7Cp/ELERH6Ry8aPAJAy7U75yWjFDkhT13mMlKLa7SSkR1cQAPdOrBqpXMEk
	zcXyVDzsZevKHgnTj5SA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtArX-0002Iz-Sq; Mon, 11 Feb 2019 12:39:03 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtApr-0000jz-9i
 for linux-riscv@lists.infradead.org; Mon, 11 Feb 2019 12:37:29 +0000
Received: by mail-wm1-x342.google.com with SMTP id x10so11674099wmg.2
 for <linux-riscv@lists.infradead.org>; Mon, 11 Feb 2019 04:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mafssbFI0/5Upvl43xji75QR+ahPYg9BWqhkb9yv5FM=;
 b=fyT0aiJ8K9n5VGEdtz8YU+/2FCwIGLJs2OJyx43z5MxceH6K0oufWFIhbDVHXuz4Nr
 Y656bKVQUT8Rr81HWldHQ4Sln+04r1IEUFJOCE2QM36bYn4t916c8OLHU2toNf6mJAHF
 mA/LaQZONikW6VFq8Gfm2MDLnwHcdScahStebhA6e3DlCmroIoUB8bqsAxUfvL4R48BG
 SrMimlnfRAI+7Uljb8r4mYja3XOJf6P2cdKk0acUDV4eZw8Zy1JuKvTclxcLPEmfULag
 6SMnYKrkMQfkyBBGblJUeBB1epXHGH5TRxznvUQ2aQ2eetuielMFcYF0ReMdHoTkv7SG
 w+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mafssbFI0/5Upvl43xji75QR+ahPYg9BWqhkb9yv5FM=;
 b=W5g0KbkwGvrJHYJqk5y+xfATEoV4Qu7/ZobqrhanXLiUy6DlEXXGf9leKmjTKSi9mJ
 bgSFhvtDHZq6cNYGX++K13mqJcY+fbyPWXvDfVc512btEXIzIpSNXQ5yDpf3qFFgiTK3
 YdnxGdR2IzBUJ4uuK6kwyxT/VnJLHaUN0hCYpGah4jX8FcJYyHth52H6OTaYTEYNKLMi
 Xsa8bbG0HBMvIfjbQAK1S6myt7rPnNKv8SeuJGr4LLvhdW/Yy4R1VjgOwCE9FM+2Dt/x
 UBRKugsldQcZ6dkTC6VvbtalMjYpTxi+zfofC7FXbTKs45DY/XkHYw3xYwdqXx/uJhaO
 hlrw==
X-Gm-Message-State: AHQUAubWpIJYwGRXrYWRvx5jzNVkzUWuNS1fJ0DQqHLgn5hn/sWbQRPb
 j60qP0b4h1REJPEh2M03crqI7Qtg1tZxGOo9vqI=
X-Google-Smtp-Source: AHgI3Ib3BQ6Hq6M5ICVWN9fNu6Xd6cBwFUFwxmPRtiX0RcxdX6O0nFilRZ2q3pK31nMSGBlebQWxrs0FAqoXbQJZ9Xc=
X-Received: by 2002:a7b:cb01:: with SMTP id u1mr8921065wmj.55.1549888636659;
 Mon, 11 Feb 2019 04:37:16 -0800 (PST)
MIME-Version: 1.0
References: <20190211043829.30096-1-michaeljclark@mac.com>
 <20190211043829.30096-4-michaeljclark@mac.com>
In-Reply-To: <20190211043829.30096-4-michaeljclark@mac.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 11 Feb 2019 13:37:08 +0100
Message-ID: <CAOiHx==dx10No8AO-5OP8BcuNbfnQdgVG2TiMkjz=Svqd0uKDg@mail.gmail.com>
Subject: Re: [PATCH 3/3] MIPS: fix truncation in __cmpxchg_small for short
 values
To: Michael Clark <michaeljclark@mac.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_043719_856633_40E3FF4B 
X-CRM114-Status: GOOD (  17.34  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: RISC-V Patches <patches@groups.riscv.org>,
 Linux RISC-V <linux-riscv@lists.infradead.org>,
 Linux MIPS <linux-mips@linux-mips.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, 11 Feb 2019 at 05:39, Michael Clark <michaeljclark@mac.com> wrote:
>
> __cmpxchg_small erroneously uses u8 for load comparison which can
> be either char or short. This patch changes the local varialble to

varialble => variable

> u32 which is sufficiently sized, as the loaded value is already
> masked and shifted appropriately. Using an integer size avoids
> any unnecessary canonicalization from use of non native widths.
>
> This patch is part of a series that adapts the MIPS small word
> atomics code for xchg and cmpxchg on short and char to RISC-V.
>
> Cc: RISC-V Patches <patches@groups.riscv.org>
> Cc: Linux RISC-V <linux-riscv@lists.infradead.org>
> Cc: Linux MIPS <linux-mips@linux-mips.org>
> Signed-off-by: Michael Clark <michaeljclark@mac.com>
> ---
>  arch/mips/kernel/cmpxchg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/kernel/cmpxchg.c b/arch/mips/kernel/cmpxchg.c
> index 0b9535bc2c53..1169958fd748 100644
> --- a/arch/mips/kernel/cmpxchg.c
> +++ b/arch/mips/kernel/cmpxchg.c
> @@ -57,7 +57,7 @@ unsigned long __cmpxchg_small(volatile void *ptr, unsigned long old,
>         u32 mask, old32, new32, load32;
>         volatile u32 *ptr32;
>         unsigned int shift;
> -       u8 load;
> +       u32 load;

There already is a u32 line above, so maybe move it there.

Also reading the code to understand this, isn't the old code broken
for cmpxchg_small calls for 16-bit variables, where old is > 0xff?

because it does later

        /*
         * Ensure the byte we want to exchange matches the expected
         * old value, and if not then bail.
         */
        load = (load32 & mask) >> shift;
        if (load != old)
            return load;

and if load is a u8, it can never be old if old contains a larger
value than what can fit in a u8.

After re-reading your commit log, it seems you say something similar,
but it wasn't quite obvious for me that this means the function is
basically broken for short values where the old value does not fit in
u8.

So this should have an appropriate "Fixes:" tag. And Cc: stable. Seems
like quite a serious issue to me.


Regards
Jonas


Jonas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
