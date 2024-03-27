Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D28C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 15:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kH8ewszQWz///+CCjPWY1EoNb19eBZIs2RqIPdTF258=; b=omTGozIAyrEADI
	33FdNDcTk7nmDhhzYQ+9LHZHOmyGgaQhjXm30UwQidJNCxHX0WknlF+E0PNvfujUthVknZIBLxjyK
	6UedMX7QV8Mx3EBH5f8vtgJhBcjTfOGPV71fqLtF9Gz2JHXmIe89f8OMtCxhU771mHGm54yFEbd/H
	TbTESXnMC+ipENz/oM+j6/flbZC9+2FiUuqhI8qMdgFr/+T8c1NKdg8CZPnWtfUw/HJyqdPUgKRu3
	llASvdgbRSvMMohxq1u+MvpZYdSW4OsVSZd/cZAt4EPRwK+bLqIgkcNVjJ6vtSJwIrsQtnhJKl3aL
	A9L7DjBgV3sOG/RoxrAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUvd-00000009hce-3ciN;
	Wed, 27 Mar 2024 15:11:01 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUvY-00000009ha3-3R7f;
	Wed, 27 Mar 2024 15:10:58 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6e740fff1d8so4975878b3a.1;
        Wed, 27 Mar 2024 08:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711552255; x=1712157055; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GhC1S2pW9btr9pVuDZELsqNgJuQdIsA6xlv8onmT65s=;
        b=XQLmreyjAkm4mMG5xdVPAO/Tl4BtOYIjJCZHDvR/PQW1XV6MGLjyQ59WRChxlrRzui
         uCatQhLt275OBR12eIMXqIywH0nVzfn5zzdnUSSH3UHH0V906aJpQur7a2rSM/dv6Nbz
         ZE5/kn6EbQlrhP8MGvhTNRXogz0V7Q96Q/cTI3AAJZfWcT6sJFDXZbOFv6F5Ye2v0iHV
         J4KsDhQ4NbCxYUCWKIw6d6dYSeCpNtu19JKYG1nw0LRsO2XkftiQPTRuQayn+i2tZT5P
         xe0mw7HAA5zTfO3M60TIGi+8vKtDGSYL4txOoRq0gbr2iR/R+9BU4zcyNICh83sSZf1f
         Gysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711552255; x=1712157055;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GhC1S2pW9btr9pVuDZELsqNgJuQdIsA6xlv8onmT65s=;
        b=Xq4BG2SvGxeaqfR2awZTRr6svqpnywNDHw5xi+LZYJjZnxJ+57IgRYikZh/U1DWsoM
         /+C3kmUIcoUeCuDXZxn1tYaIhiRLkkQZ6bbFIGn8CjdSHGW/xm+7OtawHdvoZGziqgaN
         +Bkf4AIgdvGqjkyRakmY8p4nQc5GNwrSdlygq1n9yhs6iUNF+3AEKHMIavKEVrGj+qSk
         +Cjfu4kEzBscxPW+0ns9HqSGLmFQHivftyhVaT4x9bxB1QJRmQQ6m0ZkXVPhzlWgmPXi
         bxxgxpZ5I5YRWDVdqg7P552CYa7C0KjcN0fiv7d81Sm6bfGu303uqLprnTMMQZcpLS5d
         xgzg==
X-Forwarded-Encrypted: i=1; AJvYcCUqJBgNRuG3lWbJ+d/dGtVOLsrKsdhVuJLulYPyBfTY+n+9XQI0vuhQKMlTe8QWpgQ6GhhIrpvpSbVYJMWtatCIfHEgwu2CIB/BB6KTiXY3yfuZtNC1mahpuA8rT3RdXNrPgxl/NDDJN7RUK+oEo0KjGfjnkiI=
X-Gm-Message-State: AOJu0YzZbyUAY3is4afCy6srZGDmGU+dtg7yzCOPvXv1IFBEI24E73UF
	GsUyib8a6bHNgfJpgwczTb1Oxan8z9vfWar+jwKnTsIG/GJmxXkY
X-Google-Smtp-Source: AGHT+IFTcwPFOlfI6eRT+0rf0ZnAMCTISb8ttH9tKFaraPJRt460mqVcAAiNBuFiDAxZrRyiWoSPIw==
X-Received: by 2002:a05:6a20:f39d:b0:1a0:adbc:7a96 with SMTP id qr29-20020a056a20f39d00b001a0adbc7a96mr225466pzb.36.1711552255375;
        Wed, 27 Mar 2024 08:10:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u8-20020a62ed08000000b006e4e616e520sm7950526pfh.72.2024.03.27.08.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 08:10:54 -0700 (PDT)
Message-ID: <320aacc6-b7e5-4c3d-948e-d0743ab26c5d@roeck-us.net>
Date: Wed, 27 Mar 2024 08:10:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/14] sh: Add support for suppressing warning
 backtraces
Content-Language: en-US
To: Simon Horman <horms@kernel.org>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard
 <mripard@kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, netdev@vger.kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>
References: <20240325175248.1499046-1-linux@roeck-us.net>
 <20240325175248.1499046-13-linux@roeck-us.net>
 <20240327144431.GL403975@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240327144431.GL403975@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_081056_899197_B8E3AAA6 
X-CRM114-Status: GOOD (  23.20  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/27/24 07:44, Simon Horman wrote:
> On Mon, Mar 25, 2024 at 10:52:46AM -0700, Guenter Roeck wrote:
>> Add name of functions triggering warning backtraces to the __bug_table
>> object section to enable support for suppressing WARNING backtraces.
>>
>> To limit image size impact, the pointer to the function name is only added
>> to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
>> CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
>> parameter is replaced with a (dummy) NULL parameter to avoid an image size
>> increase due to unused __func__ entries (this is necessary because __func__
>> is not a define but a virtual variable).
>>
>> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
>> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> - Rebased to v6.9-rc1
>> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
>> - Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
>>
>>   arch/sh/include/asm/bug.h | 26 ++++++++++++++++++++++----
>>   1 file changed, 22 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
>> index 05a485c4fabc..470ce6567d20 100644
>> --- a/arch/sh/include/asm/bug.h
>> +++ b/arch/sh/include/asm/bug.h
>> @@ -24,21 +24,36 @@
>>    * The offending file and line are encoded in the __bug_table section.
>>    */
>>   #ifdef CONFIG_DEBUG_BUGVERBOSE
>> +
>> +#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
>> +# define HAVE_BUG_FUNCTION
>> +# define __BUG_FUNC_PTR	"\t.long %O2\n"
>> +#else
>> +# define __BUG_FUNC_PTR
>> +#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
>> +
> 
> Hi Guenter,
> 
> a minor nit from my side: this change results in a Kernel doc warning.
> 
>       .../bug.h:29: warning: expecting prototype for _EMIT_BUG_ENTRY(). Prototype was for HAVE_BUG_FUNCTION() instead
> 
> Perhaps either the new code should be placed above the Kernel doc,
> or scripts/kernel-doc should be enhanced?
> 

Thanks a lot for the feedback.

The definition block needs to be inside CONFIG_DEBUG_BUGVERBOSE,
so it would be a bit odd to move it above the documentation
just to make kerneldoc happy. I am not really sure that to do
about it.

I'll wait for comments from others before making any changes.

Thanks,
Guenter

>>   #define _EMIT_BUG_ENTRY				\
>>   	"\t.pushsection __bug_table,\"aw\"\n"	\
>>   	"2:\t.long 1b, %O1\n"			\
>> -	"\t.short %O2, %O3\n"			\
>> -	"\t.org 2b+%O4\n"			\
>> +	__BUG_FUNC_PTR				\
>> +	"\t.short %O3, %O4\n"			\
>> +	"\t.org 2b+%O5\n"			\
>>   	"\t.popsection\n"
>>   #else
>>   #define _EMIT_BUG_ENTRY				\
>>   	"\t.pushsection __bug_table,\"aw\"\n"	\
>>   	"2:\t.long 1b\n"			\
>> -	"\t.short %O3\n"			\
>> -	"\t.org 2b+%O4\n"			\
>> +	"\t.short %O4\n"			\
>> +	"\t.org 2b+%O5\n"			\
>>   	"\t.popsection\n"
>>   #endif
>>   
>> +#ifdef HAVE_BUG_FUNCTION
>> +# define __BUG_FUNC	__func__
>> +#else
>> +# define __BUG_FUNC	NULL
>> +#endif
>> +
>>   #define BUG()						\
>>   do {							\
>>   	__asm__ __volatile__ (				\
> 
> ...


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
