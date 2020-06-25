Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76284C433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 11:07:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 448A72053B
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 11:07:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QA0wk8bQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="VYxkfV4H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 448A72053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=QimIfoUAOP+zE/RLoa/xUb7QUjxkOBbIbYwSg+WB64Q=; b=QA0wk8bQYmlXRubK0bolnmOPS
	TL4cAq/VmQIZC6wc6yGnUUR+gsn8CT95TxeY7A/AXfOiqHnZAyU5EzJ3z4r2wyTvzuFZyDK349Hp7
	vH76GartpcEWqPsvqeh/maKt+Bzldho11eUqG1Xy6JC68jJJj89QUaipW4PGSbgsCw3MzdxTT7WXy
	yThNrT676uWzlTXaWR/kEam3idHp4aUWXSN/Lxfi2j7UaHkay5OXcHFbVgBH8K0uGJJAGqLzzcW0O
	tvDmzCYs0UKcYevmbn0Jwb+2xCYRFauFubpDDcUbM++7OjLAvL9J2CnIUZscGi9gRjsf/j+4QxYqF
	8yPVqGkBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jomCW-00034f-ES; Fri, 26 Jun 2020 11:07:20 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jokjE-00034Y-Vg
 for linux-riscv@lists.infradead.org; Fri, 26 Jun 2020 09:33:21 +0000
Received: by mail-oi1-x243.google.com with SMTP id k4so7535288oik.2
 for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2020 02:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=NjWCVJjXbsjnvvdRW5c+1RZ1DL9ltdDP/CfEoKSVzpM=;
 b=VYxkfV4HM9reTzZsbhil85rawqgF/fGmRZAZNeMJ9sjjkAijqusdlmHQ5N1/R0L7hr
 eWs8vXIqH+hZqw1L0rntfaZMDCBKBD5slVhDIRXrGqK29Jjx+PRrtiue9Z/w5aGv2k+X
 upqL69wfgjNUv7Q01qIearHnWxFBAo/KMniJ7ejDHv4B+zDHQllmmGMvP/cClx8lA1Sr
 g3G7veXxm7F1Wo/FWdx8EUm8yVPB3yuN+YpfzQb8hdhqil3A8E+e2ptlLECqyQB3Afna
 k/A3SK7JCLTG8G2ZKjoqw2LV0u0b816rtBljpotRaZHNMuh4pZ9HjBEqbbK8V8KYuxD2
 FkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=NjWCVJjXbsjnvvdRW5c+1RZ1DL9ltdDP/CfEoKSVzpM=;
 b=rKKpDOPPqnRxmIqDH34+IBR0r3luhmSDvb0cnwKmH3k98Q9Ifr/EOfiP7hufeHxPhk
 W5tWsHwxijS0l4DqjC6VTOq6V9dEnjtbn3PGTgJ1nHXMKP3YQouQPoVrIptUix780p6W
 WHdJPPtUWvNzgMiagBbshfnNDHJ7+kgvkTAmifr7fmAS/0z+BUSNfCy7qzf6aa/fwltS
 xfwipDHin3tu+lbsQ2onlEyFMbXnpPpnmK/opJpSUvcngXWZiW0nZrMz5jYeSLHY77D5
 PchHytHCtHhDwoIQE3a5pFX69Z1sfhqyH+5TJQK6A3dHWNT7gQL7xuTC4SzA7o3Hff2y
 gnmg==
X-Gm-Message-State: AOAM532DiTnlvPadqWip1/VvOKEi1A9Ojj380KVmNZYOlzbnd0Znh+p7
 Qiz2quzmG5SVW0OxKHMjUFkiDzrC3puv4w==
X-Google-Smtp-Source: ABdhPJyWkODB8c9H3yExnaWmPeUJA3JDeKI+Ap8CrqPK6M7AxsUsNAWFvrq0vYDjL8n/9nQ+/RNppg==
X-Received: by 2002:a17:90a:f282:: with SMTP id
 fs2mr197810pjb.132.1593124486170; 
 Thu, 25 Jun 2020 15:34:46 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id r1sm9061421pjd.47.2020.06.25.15.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 15:34:44 -0700 (PDT)
Date: Thu, 25 Jun 2020 15:34:44 -0700 (PDT)
X-Google-Original-Date: Thu, 25 Jun 2020 15:34:04 PDT (-0700)
Subject: Re: [PATCH] riscv: Add extern declarations for vDSO time-related
 functions
In-Reply-To: <1592890821-32537-1-git-send-email-vincent.chen@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vincent.chen@sifive.com
Message-ID: <mhng-4263b6a0-3229-45bf-8663-a5611ff60b2c@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
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
Cc: vincent.chen@sifive.com, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 22 Jun 2020 22:40:21 PDT (-0700), vincent.chen@sifive.com wrote:
> Add extern declarations for vDSO time-related functions to notify the
> compiler these functions will be used in somewhere to avoid
> "no previous prototype" compile warning.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  arch/riscv/kernel/vdso/vgettimeofday.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/riscv/kernel/vdso/vgettimeofday.c b/arch/riscv/kernel/vdso/vgettimeofday.c
> index d264943e2e47..cc0d80699c31 100644
> --- a/arch/riscv/kernel/vdso/vgettimeofday.c
> +++ b/arch/riscv/kernel/vdso/vgettimeofday.c
> @@ -9,16 +9,22 @@
>  #include <linux/time.h>
>  #include <linux/types.h>
>
> +extern
> +int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts);
>  int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
>  {
>  	return __cvdso_clock_gettime(clock, ts);
>  }
>
> +extern
> +int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz);
>  int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
>  {
>  	return __cvdso_gettimeofday(tv, tz);
>  }
>
> +extern
> +int __vdso_clock_getres(clockid_t clock_id, struct __kernel_timespec *res);
>  int __vdso_clock_getres(clockid_t clock_id, struct __kernel_timespec *res)
>  {
>  	return __cvdso_clock_getres(clock_id, res);

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
