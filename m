Return-Path: <SRS0=FYYd=4V=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF54C3F2CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2020 19:45:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4019C2166E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2020 19:45:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Km5o3z1z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="cyawjnOh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4019C2166E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=YMt1QcfgD8CO1RRJgcdaG9oJ0mhmegWlOlYWqqtGpE8=; b=Km5o3z1zWSIiZH
	kpGJqLZ7d76ydniARMoPfDY5Qd/FEWNA8alhBgcNX1cySKEnbCwcDbpfL8Qq8yzPEt3VT3/Fel4KC
	CX93sBUFqivYLk9xvF1z3exyz3/Bvl1+rez0hOxAHckaKfpgwgI9kXL/hWKEgmezsKK7M/8zZdvd1
	X34+caU7wg/f444t6lDjl7VrfIaJ8JX2xOo2Hr7KCGj9H09pEkLsyRwPdTaQrK43UTkOjX+g9OPbk
	UIQT35iUrpOxzQRdbSNpY33nbwGezmPG1ZS0dRo98pmAc1/yIfTbhWf4QV7Y/aRDBiCWdrXY2qSWo
	7ML3hhus2yocWecCRoxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9Zwr-0001kE-6q; Wed, 04 Mar 2020 19:44:53 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9Zwo-0001jO-NV
 for linux-riscv@lists.infradead.org; Wed, 04 Mar 2020 19:44:52 +0000
Received: by mail-pl1-x643.google.com with SMTP id g6so1483812plt.2
 for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2020 11:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=YMt1QcfgD8CO1RRJgcdaG9oJ0mhmegWlOlYWqqtGpE8=;
 b=cyawjnOhbRHv5n6R/O6P5IIwtAz5bwBl0wxFshJl/8X/Pw1lQI0Lforcs7hZK376uF
 9ivU/bcUSkpGBS/hkdyBNqD5x4Y8+NMqJ4KaShwZOMOdHrVxWog2kFRDJgwhxDcROclo
 nd64t9JpfNeg1+YM1+G9PdxMQS9OPPpH9Yya1nBvz344gAKF7t/DKb6cOr1xGtvqr4g7
 esLXOPOVA8AmXKWLY4LGHzX6Relh5zy2Lq1f2rMA/pOWNDIs6j40zrINojecUMVpifQz
 JwiCwjVWeumlPRuRNkYXnHFV8esPRyLHLPsDh/UA9EouQ3VH7IKiTvJV7nVfE+rczmIP
 hSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=YMt1QcfgD8CO1RRJgcdaG9oJ0mhmegWlOlYWqqtGpE8=;
 b=P7hcppdcwcN7vX1tN2GndrYVpRg2cUi/awJIoalzmI3b9qO3Lm2j4GgsTep8jyzEWZ
 Gx4AIbtqWB88BOpi7b+9hLgegDO9jIjy+BVSz1PWzCBCen6jxYtxk/ERpSHWHDCn0AVT
 XyCaRVhaodViWn0vGov7AW7Evlxbm32hRb14BFSSqj9BIb+BjMTzUL0xxJF5M35w7SaU
 F820otmFdCKXEOL5XJHflHnWOvHfevpgzIur4F6vq/e87Kg4cDNt8y93ojei95pfpX4d
 3WAea0eCL1+ry4h/AI+o0n5uJMQRuGdokFkA/VjUdAUcwuNQtSQUTCHcu0ME461JzgMJ
 Bazg==
X-Gm-Message-State: ANhLgQ3fKX5RG7XmSgPKORMk8fZIVqKeyDDvbCqY+pmtV7eUWkIqZHSO
 RFyyK6sEtiuAh4UQMphNX/dZNzhc9Aw=
X-Google-Smtp-Source: ADFU+vt7XMnjE6O5ruKhZCM6i/xjglbQExYbkY7ufIBJjVu0TdIX7Xmrs7kIedK+1V+JJDgYQbg8aQ==
X-Received: by 2002:a17:902:d902:: with SMTP id
 c2mr4540311plz.256.1583351089465; 
 Wed, 04 Mar 2020 11:44:49 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id e205sm21366342pfh.178.2020.03.04.11.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 11:44:48 -0800 (PST)
Date: Wed, 04 Mar 2020 11:44:48 -0800 (PST)
X-Google-Original-Date: Wed, 04 Mar 2020 11:39:04 PST (-0800)
Subject: Re: [PATCH 07/10] riscv: Select required drivers for Kendryte SOC
In-Reply-To: <20200212103432.660256-8-damien.lemoal@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-680af211-a152-4d60-9afc-f3dec277fc62@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_114450_815748_B11CE062 
X-CRM114-Status: GOOD (  14.39  )
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
Cc: linux-riscv@lists.infradead.org, Anup Patel <Anup.Patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 12 Feb 2020 02:34:29 PST (-0800), Damien Le Moal wrote:
> This patch selects drivers required for the Kendryte K210 SOC.
>
> Since K210 based boards do not provide a device tree, this patch
> also enables the BUILTIN_DTB option.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  arch/riscv/Kconfig.socs | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 4d5d4a65b2a2..8d83210467d9 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -13,6 +13,10 @@ config SOC_SIFIVE
>  config SOC_KENDRYTE
>  	bool "Kendryte K210 SoC"
>  	depends on !MMU
> +	select BUILTIN_DTB
> +	select SERIAL_SIFIVE if TTY
> +	select SERIAL_SIFIVE_CONSOLE if TTY
> +	select SIFIVE_PLIC
>  	help
>  	  This enables support for Kendryte K210 SoC hardware.

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

(modulo that option actually existing :))

