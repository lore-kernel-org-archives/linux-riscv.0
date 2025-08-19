Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77154CA0EFB
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 22:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1hP3H6n9RYq4HwNQQK32TXCYbDfM/fUQ5GgjCg9I+I=; b=luCinYsQWq+k/f
	sZ1t42BmJ73+0WogQFh43Ouxn+VMqpW2MQgKoAntAySY9tJzVJJFE6ZgVV9BvrPwmAi2Ufq4+LGXR
	PIChrGNweTuEdhAXw9MqcOkRjlU1ZUXKz8tZNaC//VluiK39sQtCf4krfF7kX7B7Mg/aDtILW1FlM
	+LtgqQNzArDw0+DMoD3mhdAFT0vpQsz4debgWtb9+HI4/vz3bjnttSjbT4rbOOv5p8SqGvXdILlD0
	Y/n+jVejJIt0psoNKfbU0s+uQooFekGSRZq3U8niZfscbyBCcjuzcDSLqyYx6xp/NXflQ9EJhxWhy
	JRt6lDbd4KDDnnToS51g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoV1l-0000000BkaA-208A;
	Tue, 19 Aug 2025 22:42:01 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoS9Q-0000000BRXU-2BsE
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 19:37:45 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3e56fe580b4so28031485ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Aug 2025 12:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755632263; x=1756237063; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nygGfsQ9+AzoHDnWCHHV3eOhpawLdpH8cctAohWM0f0=;
        b=o7MqaA2elpCwihZecXmjOJt2O/uG9xJtAL+26UyY/4fpjUOwVIkOHWip9sxaHFfUSl
         J8sCVg7lm8buApdUpUp/GMEsot3RxcqaNOycxjAI/9y5oeMdHIbiTOHNE5tZuOXVjHyG
         CzG458QZXwvLkFwZSRn8A8AGB+BN5TNusU+K4nlNgmnzzlJyejtkKPNXFfDLFwbzjP/g
         WigC9ieGybUYDx0pPuySzrs/YCoeHo+0LqMXJpKGKE5iMmJ2CbMdnioxMcY/eGEgPFCo
         ozwCuqIL2yDXkeOukoYw0sKbE4jXaO3rMDVQUEaDY4xhU0X2ZIE1vThZfcOPbYTZV3Un
         jZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755632263; x=1756237063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nygGfsQ9+AzoHDnWCHHV3eOhpawLdpH8cctAohWM0f0=;
        b=kVPVXIPIN1SMifqWfgNjYY+MOCeEWsQvMqlq6KJR+ECv6W/DwpB3JE5Fl9zoZx5t62
         jy41KmdUHtpv/u1xX8verSmfDKdwMN3ppeiiYg5b0wuHkP7iE89WS+ZqcU+GZO2ol7qd
         iWQBa/agPYzNhX44JxwzBm8r74ZUoudkxBeJ3siWXZoQ73fdKSTpGqf1Mccoi6ObE9Ed
         8YqpnmXe9DCpmlj5LJL0WDNGg9+pZkyf4rp/Egk41TYeZi8jdIIr4qarQtutotUxY+Xp
         LVIU1Duv37O7zNhDMC1KSdRgaMTDD+RhQSOAlRLk8j9HPNTs8B0xMEsaze72WzNvmZnD
         ACJA==
X-Gm-Message-State: AOJu0Yz8VhaYvC/9HckgXYam8BNKDYwaHj9e5LRpigflFgmU8meF10Ig
	wqrhgq4+JMYenUAYdnFyT3JtKIOj7EjHQaD5N+NIpwKvmMJGKfWGOYFWERYiBhOT2Fc=
X-Gm-Gg: ASbGncvrlaJjZ8mrZEG1PSe6Bx3iXw1DFd5v/1vGGB6vGFm3D6tzesXt43dFRfQ4v5D
	dxlkEte8MmqXyseyIpkRf/FWSCXW/RZYqaPmlyncm/ATuKhrhxzi0BMz+TKmCo6vrSYFcJZVGMA
	cMiBnYCaXbcP+wvPtm80wjlNVWamw95l0owHpkP0IwUsKz0MuakEB4K8CV6EMTeDS+XYqI/QKBy
	HEO12nyw+UL8w25AoMXFy6OOCoiEiY3oDJNkkZ0EVJacNSVTl6136gECFG+/6rTeaUJy96ocGEK
	VYwIZB008TxslAFv5xP0ZaMpJF5DnslXYwyKkD/Iv/yaD34VJNrzJDwMSwbn4/D4dSuJOTUAx1f
	RNnCwdP3ItQCtoUdAqWzlyz/G
X-Google-Smtp-Source: AGHT+IHHewQfS+MFcBYSs+K79ojhdGXOI3EddWtR2Rd6xchxzhlHI2WrFwEkh5bbrAxDD7TnAi6TAw==
X-Received: by 2002:a05:6e02:1a28:b0:3e5:7281:eb6b with SMTP id e9e14a558f8ab-3e67ca73a10mr6237665ab.23.1755632263389;
        Tue, 19 Aug 2025 12:37:43 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50c9477ef61sm3746634173.8.2025.08.19.12.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 12:37:43 -0700 (PDT)
Date: Tue, 19 Aug 2025 14:37:42 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Paris Oplopoios <parisoplop@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
Subject: Re: [PATCH] riscv: hwprobe: allow querying available
 RISCV_HWPROBE_KEY_IMA_EXT_0 bits
Message-ID: <20250819-fa2f9d3392614bd654c530c9@orel>
References: <CAAbFZ0iFJbpqxqTUYhB+tUZSiL1qQJ=PeABCCjkeSpf4_TNiyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAbFZ0iFJbpqxqTUYhB+tUZSiL1qQJ=PeABCCjkeSpf4_TNiyQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_123744_564602_8D44D471 
X-CRM114-Status: GOOD (  33.05  )
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

On Wed, Aug 13, 2025 at 07:33:48PM +0300, Paris Oplopoios wrote:
> When probing for extensions using RISCV_HWPROBE_KEY_IMA_EXT_0, a missing
> bit in the resulting bitmask means extension is not available or the kernel is
> not recent enough to support the bit. Currently, there's no way to
> differentiate between the two.
> 
> This adds a new riscv_hwprobe key, RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL, which
> returns a bitmask of all queryable supported by the kernel
> in RISCV_HWPROBE_KEY_IMA_EXT_0. This can allow programs to use a fallback
> extension detection method when the bit they want to query is not available
> in the kernel they are running on.
> 
> Example usage:
> 
>     struct riscv_hwprobe req = { RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL, 0 };
>     int ret = syscall(__NR_riscv_hwprobe, &req, 1, 0, NULL, 0);
>     if (ret == 0) {
>         uint64_t bitmask = req.value;
>         if (bitmask & RISCV_HWPROBE_EXT_ZABHA) {
>             // Check for existence of Zabha extension using riscv_hwprobe
>         } else {
>             // Fallback to checking if an instruction in the Zabha
>             // extension results in an illegal instruction exception

The new key allows us to know when the kernel is aware of an extension
or not. When the kernel is aware of the extension, then a hwprobe of
the extension's key generates a result that unambiguously states whether
or not the extension is available. However, when the kernel is unaware of
the extension, then we still know nothing about its availability. IOW,
how does the new key help? The fact that this example use still has this
fallback path in it implies it doesn't.

What I think we need is a way to better automatically expose Z-extensions
which are in the DT/ACPI. I like the idea of generating a sysfs node for
each extension string. Those nodes could then have properties such as the
kernel's awareness of it, etc. I proposed something in the past like that,
but it was considered too Linux-specific.

Thanks,
drew

>         }
>     }
> 
> Signed-off-by: Paris Oplopoios <parisoplop@gmail.com>
> 
> ---
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst
> b/Documentation/arch/riscv/hwprobe.rst
> index 2aa9be272d5d..6d77def0a46e 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -360,4 +360,7 @@ The following keys are defined:
> 
>      * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
>          vendor extension is supported in version 1.0 of Matrix
> Multiply Accumulate
> -    Instruction Extensions Specification.
> \ No newline at end of file
> +    Instruction Extensions Specification.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL`: A bitmask containing
> the extensions
> +  that can be probed using the :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0` key.
> \ No newline at end of file
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index 7fe0a379474a..501d49b7a02a 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,8 @@
> 
>  #include <uapi/asm/hwprobe.h>
> 
> -#define RISCV_HWPROBE_MAX_KEY 13
> +#define RISCV_HWPROBE_MAX_KEY 14
> +#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE    ((1ULL << 59) - 1)
> 
>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>  {
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h
> b/arch/riscv/include/uapi/asm/hwprobe.h
> index aaf6ad970499..a3b92df4dc05 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -82,6 +82,7 @@ struct riscv_hwprobe {
>  #define        RISCV_HWPROBE_EXT_ZAAMO        (1ULL << 56)
>  #define        RISCV_HWPROBE_EXT_ZALRSC    (1ULL << 57)
>  #define        RISCV_HWPROBE_EXT_ZABHA        (1ULL << 58)
> +/* Change RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE when adding items. */
>  #define RISCV_HWPROBE_KEY_CPUPERF_0    5
>  #define        RISCV_HWPROBE_MISALIGNED_UNKNOWN    (0 << 0)
>  #define        RISCV_HWPROBE_MISALIGNED_EMULATED    (1 << 0)
> @@ -106,6 +107,7 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0    11
>  #define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE    12
>  #define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0    13
> +#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL 14
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
> 
>  /* Flags */
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 0b170e18a2be..40e7fa5f85f3 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -310,6 +310,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>          hwprobe_isa_vendor_ext_thead_0(pair, cpus);
>          break;
> 
> +    case RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL:
> +        pair->value = RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE;
> +        break;
> +
>      /*
>       * For forward compatibility, unknown keys don't fail the whole
>       * call, but get their element key set to -1 and value set to 0
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
