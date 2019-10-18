Return-Path: <SRS0=JNhR=YL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBB0CA9EC8
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2019 02:53:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BEEE21897
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2019 02:53:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W9Xm97vG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="cm6uu8Lp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BEEE21897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DLeXSiYvrgO/A+/w0HHhS4AzY9BcBrIdBOriXKqnlQY=; b=W9Xm97vGEeQXti
	DkwS9b4Ycfy/R6gPs1DIaTvvA2vVQW7ffxX6nXuQPMja2iviCGlln4JbDSPv5FgfX6hHQ7yYL7dDe
	Cb7DNjodgQ83g9BqFKfkqTMLVuU2oJDUHwZux4TR2/0ygHG9vljzTrjHi/VXA8eootPRN6uCvnJDJ
	OUWvwHejV7Kr71oOizUR6vsFESZ9/+hs5y0iWF7dNAhuqlpxvkg/dihdU9CAhB3PngUbuPHbt/OKp
	LF6UXA1FQejZZzshP9wHxveyjlGhNpqV2A+AOtwZ00Of+yzO6pkqzyJBp1w1jeP7iVRHRZ4HgZIg4
	7dVbhYWk24IM+mvuBTOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLIOB-0000Kd-FO; Fri, 18 Oct 2019 02:53:15 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLIO9-0000KG-1m
 for linux-riscv@lists.infradead.org; Fri, 18 Oct 2019 02:53:14 +0000
Received: by mail-wr1-x441.google.com with SMTP id z9so4482868wrl.11
 for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2019 19:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4IN8nkOuZaw4qMQqgoM+lr6oMWm+8vooDBY/2Fj6u8A=;
 b=cm6uu8LpVpbMuL7DTMw6/Q94OH+JJ/d/EbywAS5toHgB/ZqGU2lf3f/Y7MvvSD8lq0
 zNa9dTRgHlPFKlPi86zmTIIkzEww9tHfPahEgiexjHmiad5TCjHzyaOZqtatTvUT+Hpd
 3gK91DBP38CMpuk5/U6gqYK7VIe9sq2MO2Iu5sNIR1MhEQOVzhbghc+gB1RZPw8AFrqx
 imhGyqmHueePDv38KOcLpANTNfPnCBMsQY3LwE8BQktBZ9vBz/ffbZuew4YQAZ5/+IG3
 trx2cV7+nnnj9WZC90wmQxPUY+Xz3PEerkymbiEcJxxiop6/tPvpOhwfFgKfL54zUZzk
 ig2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4IN8nkOuZaw4qMQqgoM+lr6oMWm+8vooDBY/2Fj6u8A=;
 b=TOMQ0+uO3UyNwahHNAfcnt3JJDWHCO3uv+jxv+DHfQqms482qwgN9SneoE36VlGQ8y
 afvG+ckQnNaoi5En5tJJp3fDGkfGPManoQF8wvbwYz+0xVKjZAzYzdLaa3ZsQIyVJoiD
 OHO+3kFgfNIEUJKwe9bK6XEkVBk7PPXoGn46n4mTyP/EFag8i5p4p4YfF1DmyF1zhnM6
 X9IibMJTbuSYp+N6fdZGJlhVt6E7F4ssvyiGuL+IIovJ3OAJarNfH1Ps15O4MlTq2JdN
 M+j6+mnwXWE71sbKtXzY4SWN9UtJxk0DlAViC5s/CG+riXbz4FL9MjCzY/rLYS8EM/GC
 Pd0A==
X-Gm-Message-State: APjAAAXznAnRp+j/rnZH0s9XPXgfJHz3wSIuk+X2HEryW7d8WSO/AVM1
 MKMdt4oq+Yw7aZNKJbYUJBOppIs6Y7NkK3QbYkq/nw==
X-Google-Smtp-Source: APXvYqxZtU4Zdishzaj1EdrbSwuCs4hJmh3Nm9boGXA21TSzBjIiq3CCeMGIKdggwniwp7AwhXHQUGRPWxdMMSIGcIQ=
X-Received: by 2002:adf:f145:: with SMTP id y5mr5400621wro.330.1571367191529; 
 Thu, 17 Oct 2019 19:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20191017173743.5430-1-hch@lst.de>
 <20191017173743.5430-6-hch@lst.de>
In-Reply-To: <20191017173743.5430-6-hch@lst.de>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 18 Oct 2019 08:23:00 +0530
Message-ID: <CAAhSdy3MjGvPuAtsfdtbxe9N8LG3FYjQh=6rLpUqx7r73nNiWw@mail.gmail.com>
Subject: Re: [PATCH 05/15] riscv: poison SBI calls for M-mode
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_195313_096036_DEBA350D 
X-CRM114-Status: GOOD (  14.02  )
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
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 17, 2019 at 11:08 PM Christoph Hellwig <hch@lst.de> wrote:
>
> There is no SBI when we run in M-mode, so fail the compile for any code
> trying to use SBI calls.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/include/asm/sbi.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 21134b3ef404..b167af3e7470 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -8,6 +8,7 @@
>
>  #include <linux/types.h>
>
> +#ifdef CONFIG_RISCV_SBI
>  #define SBI_SET_TIMER 0
>  #define SBI_CONSOLE_PUTCHAR 1
>  #define SBI_CONSOLE_GETCHAR 2
> @@ -93,5 +94,5 @@ static inline void sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
>  {
>         SBI_CALL_4(SBI_REMOTE_SFENCE_VMA_ASID, hart_mask, start, size, asid);
>  }
> -
> -#endif
> +#endif /* CONFIG_RISCV_SBI */
> +#endif /* _ASM_RISCV_SBI_H */
> --
> 2.20.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
