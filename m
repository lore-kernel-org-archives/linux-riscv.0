Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434A4105A591
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 12:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vyfCclycdOaI8HoZXz7If8/RDCyAELSGSMfrgD5482k=; b=0bDQ6NpqZ37mMd
	pweroHUxo5GVrja+J1W8DB4eTIF2vJd8py6UdkhGpAMpmssHFq1wc8p0j5CNMcWYBRUgJekFFna8A
	Xgn88MHY3YoYJvBQkPC6jQM+it8QhydGBISC/UmQfDawgtEIDZopo7Ifh1f0fqtGHDWJj9Pq5nxC+
	J7B1U+nt0O5j8/sb9lX3ZqY4jfauLw4peY3iIxB5aeE0zE1HXFqj6hGuo9zi0/jupNV52XQpZ/7Nc
	j+mtbW39ny80uJby7cYU1oyysjjWsXpaoHwP6uTLaiqwd6C9XrtwV7XOGMvWydpZuuP5xjVDtZILH
	oev3ZUXmnjhn4TJqSmkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fXw-0000000E4zu-4BRw;
	Thu, 12 Mar 2026 12:53:49 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fXu-0000000E4yv-3dyT
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 12:53:48 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-40f1ffba6a0so628458fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Mar 2026 05:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773320025; x=1773924825; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ky7U0hmCeNi6OyUrf2MxogfDAlaxZWXxIQIvc2Y9k8Y=;
        b=PqKx9b8gCq1X4S5smoMl8y9rJhMPkJWPaAbrXVvWDmsnPs4tUnMako8OB+pUeId1eE
         7hVu8O6udJf/FOiFcNn6OdZCI8Th2KAKOAL5GscD75vh8H7wtOEo0rmv2MdsnaurOhb9
         kJr22L1Nxjw8UCfTn82G0B0lz8su5MWy68nURKKpNkryEhavSRp+MTJqzxHdUYOqp8WE
         XvVwwrsBIgu9NwNkHo1j+RBY1dRr3WOuV8f0ixBnXPZQFboAsPsITPzw2++37PjR1uqN
         zzuiW3E932+orTLSpT8roXMh5IpJW+LAIZ/IqDzSWKjrUCHMD9gImWCgOWF1yi+2sCJM
         wFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773320025; x=1773924825;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ky7U0hmCeNi6OyUrf2MxogfDAlaxZWXxIQIvc2Y9k8Y=;
        b=W7BrAuoCWtgxuWxeLtkCeGiAe7YxaixHDsAWbkuLTGq44pwAzsp+NfVBbeLaAO4T2/
         HBe26ucVnHmE2egyH2wBJ4cqv/K9AVjxxT1v6oFUWGXAoc3Nbz7MWHjk66MWDb/6ZFhQ
         jEYhF0dXK/5Kd7eYvT+iTlvZrKX1hdKsSjXNZbMYjBjwVJ8sZfY3CRObQyuOkHBygDsa
         GVLj3Q+f84Ueze3K8RAtEso0eBSRlrnfKfkBlioxKqS/q9Risz8xR0Vt+kFmxCtEWDXl
         K608zbWkLndcjlGFz2pFdoPMaiJ300ve+AsNk5q/Nq7BD6Qr+NZyxbs8tUAxe15U3s51
         IwiA==
X-Forwarded-Encrypted: i=1; AJvYcCXteTQsaML7dAN8yqi0SZ70WJxqlfTjbNVH51U8powgnHWEM0q713KHg6JI3jLjaSVkyF4/rJTU9qLY5g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRQ/ZSAbvyhkLl1RHibRK6C5Y9jwE8chJ83C/6dUO3WfKZgCcx
	55JHEWUoSEsxjlGHuKZCeX/z49LJgrqmL3OCF89KanS8xBYN+VChxJ83/KVNOTHD/4g=
X-Gm-Gg: ATEYQzzZ9KlYeTyH1NslHYB6byoPFvXM8jRkZj7tyW4uMn4j7iwwey3Gr5thwlacoXi
	TWkYSeiUrltFrKdH74ekNzPvyjQjwSwmuB2gR9px9d2H8ZnUgjFc9ntFjCuq63IYc3GsiSa1QUk
	jNw7Lfc+cLX0kRvlGghJxxpZ3vh5zLFuG81/ogTElBE4D/1GMg3AxnGum/xyO4MKHtDfJPWHb49
	+guCm8oUrB4YhSGqSD0A4/68zHfu61b2yeoqKAeEO8qr063QxyhVOP1yWjUARmQxg+/5XLcPPdJ
	0etGzue18qNRXCBhtClxaIxMXmyxHSwgdWW+SH/guCfUD5J++Lc9XiZwvDgKIgA+RU/MMPcDIcW
	sWcAO8kjRSV1kQl0yJyUznBokLem3ir2Y7swSro9zrvJudEhXV+YMxHmPPxA0DkzyRW67Loxzaf
	kC1zBQnmPNXBm8qJZ9x3uPAMHaowDSTrSCM8Z9zDU=
X-Received: by 2002:a05:6870:649f:b0:409:74c7:1cbb with SMTP id 586e51a60fabf-4177c6f1d08mr3392540fac.7.1773320024820;
        Thu, 12 Mar 2026 05:53:44 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41791432d87sm3765785fac.1.2026.03.12.05.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 05:53:44 -0700 (PDT)
Message-ID: <f7054184-dca2-4c7c-9e2e-4a5e3e1c81da@sifive.com>
Date: Thu, 12 Mar 2026 07:53:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/15] mm/kasan: add document into
 kernel-parameters.txt
To: Baoquan He <bhe@redhat.com>, kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org, andreyknvl@gmail.com, ryabinin.a.a@gmail.com,
 glider@google.com, dvyukov@google.com, linux-kernel@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, chris@zankel.net,
 jcmvbkbc@gmail.com, linux-s390@vger.kernel.org, hca@linux.ibm.com
References: <20260225081412.76502-1-bhe@redhat.com>
 <20260225081412.76502-15-bhe@redhat.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260225081412.76502-15-bhe@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_055346_951985_139D646A 
X-CRM114-Status: GOOD (  15.99  )
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

Hi Baoquan,

On 2026-02-25 2:14 AM, Baoquan He wrote:
> And also remove the relevant description in dev-tools/kasan.rst
> which is hw_tags specificially.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 4 ++++
>  Documentation/dev-tools/kasan.rst               | 2 --
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index cb850e5290c2..e0115fad9e60 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2899,6 +2899,10 @@ Kernel parameters
>  	js=		[HW,JOY] Analog joystick
>  			See Documentation/input/joydev/joystick.rst.
>  
> +	kasan=		[KNL] controls whether KASAN is enabled.
> +			Format: off | on
> +			default: on
> +
>  	kasan_multi_shot
>  			[KNL] Enforce KASAN (Kernel Address Sanitizer) to print
>  			report on every invalid memory access. Without this
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> index a034700da7c4..eaae83fcb5e4 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -129,8 +129,6 @@ Hardware Tag-Based KASAN mode is intended for use in production as a security
>  mitigation. Therefore, it supports additional boot parameters that allow
>  disabling KASAN altogether or controlling its features:

The sentence above is now incorrect as well. I would recommend documenting the
parameter earlier in the "Boot parameters" section instead of removing it from
this document entirely.

Regards,
Samuel

>  
> -- ``kasan=off`` or ``=on`` controls whether KASAN is enabled (default: ``on``).
> -
>  - ``kasan.mode=sync``, ``=async`` or ``=asymm`` controls whether KASAN
>    is configured in synchronous, asynchronous or asymmetric mode of
>    execution (default: ``sync``).


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
