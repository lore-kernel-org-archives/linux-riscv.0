Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A840C433DB
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 07:06:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACFFA64FB9
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 07:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACFFA64FB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=1UMtv3K1hrExDmED/yiwMNb/KXWAPwiH2ufUq31Yf6A=; b=DEMDriwcPICf0CNtZKc70qgWh
	qpsJGV+AshoInDsdSj2wYAQdFJx3KB6OC0b06xlXSuiwswwZ2+zMZ59udTsJoziGY61Y2A/YXhT8B
	SYRy0yFZXHbcKYf7rPDu5WwPE7G0NmTVy61XrGmAHJQpSHsPOOuO5v+RlUFPrJ60POiYOazj8aW21
	Ori+rDjVM0aO2wweWvgXlPrj7EPRR48LO6NbBioiMFjQ8mOIbOV5WVB9ikOSKHOnm8N9tzHwD+w65
	LjvpwEJGdgQXq7znrobfmq23M5+pIgCQwVdmhlMOAc3Q1qP1ry3G3i/FfvuvbTokbKIvz7MiICsCw
	B2QKf8bHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7vCV-0005bS-KS; Fri, 05 Feb 2021 07:06:43 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7vCS-0005aY-KE
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 07:06:41 +0000
Received: by mail-pj1-x1033.google.com with SMTP id m12so3117914pjs.4
 for <linux-riscv@lists.infradead.org>; Thu, 04 Feb 2021 23:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=MZ4P6Lw/6UiS8JyJfX3U5rtRFO+IqLNE8qsO+NPVXGk=;
 b=fjeV+W4m/Dfueub4G9bVMQnTATX1tYc2umM/k2buTydgbNxkOTmz14dNxg9/wi+TaG
 3R6vlfL+eJiVmyerGorSI9Ot9ISmEGu/a5fp/3Fh+Yi2787Ho3Pj2xUzMysM/BpfJJoE
 R8S/1IAWO6NNC03LRzIMJ1j/OSXeyRTWttpiiVyVzOJ0BiIGv7+Axyxn7VzFzk82O/al
 QtmB+UE9IuL7dWKS3GGaoWGSMcfrFFAPwcH39HdHaXSo6QnY1KK7RbYCsnolBpHH2iM9
 jQXvZGjda+wBfrP8VbfYw0FMQaw59QpSQHNMEFy2VMgLGoPc4p334HZ/uN6+Qru8eZie
 NdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=MZ4P6Lw/6UiS8JyJfX3U5rtRFO+IqLNE8qsO+NPVXGk=;
 b=L7JTJsFrKwxd0u5jXI8TrkBarmSqdJuzlWHWq2lONysXk+GjsG39cxiYAZE1DIn7wO
 b/BJ4/Gc7ttwa/pZpyFXet4DI/mgqpEyMqYQbBGKAxjRte4jjbQcCEKZAJX9qVW/RsX4
 ICot4jIOYVBJleOPaEQRvkinAYugowKTQ7XRNU9MPgrlj06xlOdCUjmTJYmYaH6Ow6Gy
 DoGlWAd7Uk/a+W2dxCAOredfnY9E20JHAQJmWARs7w7VZ3RzK+dmjqXAdtm8cRsl5XDj
 bLrntb19n/ZtLbInwJKoIre72UfyuQRR/s/Rqh0AiUgGUUAqSi3qugIbvAyKErSAMgHK
 GPSw==
X-Gm-Message-State: AOAM532jNyoekWJ/LN4TKVi1GKz1RrNnlwt+yXZBZCFykkVe1wMLu2FH
 H75jalUHfbT+hOOuH3lsrm6Ydg==
X-Google-Smtp-Source: ABdhPJy+i1SyBhBl58mdtGk+jbnEdRYyq/TwOIas1FPrSVUyC1ZHmq30hMp0QYPogXZRl4PpMztVyw==
X-Received: by 2002:a17:90b:1c0d:: with SMTP id
 oc13mr2843615pjb.156.1612508798561; 
 Thu, 04 Feb 2021 23:06:38 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t15sm7210137pjy.37.2021.02.04.23.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 23:06:37 -0800 (PST)
Date: Thu, 04 Feb 2021 23:06:37 -0800 (PST)
X-Google-Original-Date: Thu, 04 Feb 2021 23:06:06 PST (-0800)
Subject: Re: [PATCH] selftests/vDSO: fix ABI selftest on riscv
In-Reply-To: <20210204145042.7345-1-tklauser@distanz.ch>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tklauser@distanz.ch, shuah@kernel.org
Message-ID: <mhng-1ed0f9e8-84ec-4f2e-ac42-5a608726e2fe@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_020640_690710_3EDA23DE 
X-CRM114-Status: GOOD (  18.73  )
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
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 04 Feb 2021 06:50:42 PST (-0800), tklauser@distanz.ch wrote:
> Only older versions of the RISC-V GCC toolchain define __riscv__. Check
> for __riscv as well, which is used by newer GCC toolchains. Also set
> VDSO_32BIT based on __riscv_xlen.
>
> Before (on riscv64):
>
> $ ./vdso_test_abi
> [vDSO kselftest] VDSO_VERSION: LINUX_4
> Could not find __vdso_gettimeofday
> Could not find __vdso_clock_gettime
> Could not find __vdso_clock_getres
> clock_id: CLOCK_REALTIME [PASS]
> Could not find __vdso_clock_gettime
> Could not find __vdso_clock_getres
> clock_id: CLOCK_BOOTTIME [PASS]
> Could not find __vdso_clock_gettime
> Could not find __vdso_clock_getres
> clock_id: CLOCK_TAI [PASS]
> Could not find __vdso_clock_gettime
> Could not find __vdso_clock_getres
> clock_id: CLOCK_REALTIME_COARSE [PASS]
> Could not find __vdso_clock_gettime
> Could not find __vdso_clock_getres
> clock_id: CLOCK_MONOTONIC [PASS]
> Could not find __vdso_clock_gettime
> Could not find __vdso_clock_getres
> clock_id: CLOCK_MONOTONIC_RAW [PASS]
> Could not find __vdso_clock_gettime
> Could not find __vdso_clock_getres
> clock_id: CLOCK_MONOTONIC_COARSE [PASS]
> Could not find __vdso_time
>
> After (on riscv32):
>
> $ ./vdso_test_abi
> [vDSO kselftest] VDSO_VERSION: LINUX_4.15
> The time is 1612449376.015086
> The time is 1612449376.18340784
> The resolution is 0 1
> clock_id: CLOCK_REALTIME [PASS]
> The time is 774.842586182
> The resolution is 0 1
> clock_id: CLOCK_BOOTTIME [PASS]
> The time is 1612449376.22536565
> The resolution is 0 1
> clock_id: CLOCK_TAI [PASS]
> The time is 1612449376.20885172
> The resolution is 0 4000000
> clock_id: CLOCK_REALTIME_COARSE [PASS]
> The time is 774.845491269
> The resolution is 0 1
> clock_id: CLOCK_MONOTONIC [PASS]
> The time is 774.849534200
> The resolution is 0 1
> clock_id: CLOCK_MONOTONIC_RAW [PASS]
> The time is 774.842139684
> The resolution is 0 4000000
> clock_id: CLOCK_MONOTONIC_COARSE [PASS]
> Could not find __vdso_time
>
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
>  tools/testing/selftests/vDSO/vdso_config.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/vDSO/vdso_config.h b/tools/testing/selftests/vDSO/vdso_config.h
> index 6a6fe8d4ff55..6188b16827d1 100644
> --- a/tools/testing/selftests/vDSO/vdso_config.h
> +++ b/tools/testing/selftests/vDSO/vdso_config.h
> @@ -47,10 +47,12 @@
>  #elif defined(__x86_64__)
>  #define VDSO_VERSION		0
>  #define VDSO_NAMES		1
> -#elif defined(__riscv__)
> +#elif defined(__riscv__) || defined(__riscv)
>  #define VDSO_VERSION		5
>  #define VDSO_NAMES		1
> +#if __riscv_xlen == 32
>  #define VDSO_32BIT		1
> +#endif
>  #else /* nds32 */
>  #define VDSO_VERSION		4
>  #define VDSO_NAMES		1

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Not sure if you want this through the RISC-V tree, so I'm leaving it out for
now and assuming it'll go through a kselftest tree.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
