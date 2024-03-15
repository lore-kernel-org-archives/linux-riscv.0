Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99DFC54E58
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 11:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XNjG0KMQJnSjwL77sHnjgToQkNu5kElMsqtJz9tz4Gw=; b=pihh94j0EJjMCL
	ZNtVN2fBekc/sv35jt2koIKOH6KyWlBqzeYc9GVyvtOz9FbBuONCQOZFF1b6pqEnkq5mTOFMpo4RW
	39FevljAHsv6aWiSJBv10KxFgicHTET0L+GEMAl5B93SRL97YfUx/z7/WHBIkVKUPLz05Yda00POP
	W9i+xsznSPYEYQ/Xd3HFOu+tBKxgXPLyQxhE/l/1yrkwfw0nrtWi8fzhIHU7XwXdjjDu3K9U+soyb
	PtA6YPVQS28zsd8m3gZ0IUqCAI6lbu8O7xpZ06CAhHVhGeQO8O9I7uSncqzVpvdQafyss4XePH/3o
	KwYAzELFxHHkOMtSUijQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl617-000000004n9-2mFf;
	Fri, 15 Mar 2024 11:46:29 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl612-000000004kC-31he;
	Fri, 15 Mar 2024 11:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1710503142; x=1711107942; i=deller@gmx.de;
	bh=7qGxCcL79dacW1v0qhsaH7joRGKSBJXder9Wljx7Ons=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=McITOoD1wQOPR5qsD5lJhrmT4u/2I6i5oTsCyoNQ+HyXnnYr9lHABJxJNEfBVmE1
	 bnJ1MnmdGbKRpaekbFqJ1Sc+YOT1phsYE+jnd8d6asLVVMKrY40M8xgREptIDnbvH
	 y2mErimBTccXiuWpmxUyFOdhtGVN+4463Qd0hpgSpmcplUGnYfMiAp+tngIYhhhNY
	 pTEncmqpqTVo8ts2zW4JmtQY4Lbszh3JX7Wwh1SGisRNpGW+I3Ws6naI1vcEx94jS
	 in2nmK4ujOjNzcgmIbahRICBxVzYe1HEkJgrelpkTzJ9xyTl7FxGwxIDRdG1Cv2cw
	 feVm70l0GQvaQdmRfQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.155.107]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mo6ux-1r1oxZ2Eln-00pdXJ; Fri, 15
 Mar 2024 12:45:42 +0100
Message-ID: <d6436a8f-a1d3-421c-a5e0-5bebd18134bf@gmx.de>
Date: Fri, 15 Mar 2024 12:45:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] parisc: Add support for suppressing warning
 backtraces
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>,
 Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
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
 loongarch@lists.linux.dev, netdev@lists.linux.dev
References: <20240312170309.2546362-1-linux@roeck-us.net>
 <20240312170309.2546362-11-linux@roeck-us.net>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240312170309.2546362-11-linux@roeck-us.net>
X-Provags-ID: V03:K1:qslnWwQiqg/DP5uqDNLV3ORiPULWbHV951NE0QBTZs+dRkfEELc
 Ui2EMTRqay5IFJgqBwNMOkZVxe2c2qIfhYvjWW11LmmVcUomylCerubebwaET5SdJ38HAfD
 biq5BtQDRRP7q1ov0JwyIPdpf3SRZ5rDbJ6vwSOAbcLsxrExJtjMmO4CHxfr09ugU+u+RTP
 QxkoLU7U56gOrWo57hroQ==
UI-OutboundReport: notjunk:1;M01:P0:wcEf58u/OD8=;/Vsuh9wNc66rAcyGNGklDP7P14y
 /KBt0M11EmbCmzLloMdXx4rUW/NT78LYr0GB36xaGvqIn+7+J10HViYMoBef4puW+1Zy+ERmU
 uCXPBCihgVu3H/tHpbrx7bQVb06U4Fe3PY9DeOnQN/AUubRpBj2Rs4xe7Rklg9dw2ak6y+FDH
 p6J2fQ/4hN/oaJv4Q0RYeZ2c+7Gsj9OcOVk5yv2q9P5gbpwbCrz+zdvIgeqV0IWNePAXeGLDZ
 Knwkvjmpt4FHk6T6GRU4nHOKpcR139cvr2sNU1GNyYLwU6LZmOtm8Knrm2XY0W4/z3Yz/QAUZ
 8NtDanG36laI9TlZEesDorYKUVcjiZLhO/SW+ejfUMU5w11qdv5iouwWykFJjScDCk2rTsKyP
 Ob/kkVyAkyZpQBV6eWLvvkxksEdC8e+kBpMuB4zA/7SAuNwm8muKntfI2AP/nHnmMPmJVDgpS
 R957ToiHNzK38Im3ZMOOvrxjeHFQPGcJSI16olUHuvsUqbU8e7DCw3ZbDUub7HAizDcjnT1To
 YYIzxaQC4VoEQfmXNYZLQTFN7E0Y7NfVdNAgFho96LriyB+oNgtLnz2CHpPtxLbr0Cw6fx9P3
 i5SQarSEbvdxpOjqBmI4m1AVvAaJ9M0+aZ8Bntm8DFLec27wgKSKsaxIgy01c089l/7pD0787
 enyXVSs1ynlfngUb7TBdFbbaxID7J+fg/jdqQ2Qh2ej5EI6n8+19vo0FOS5YP4EE+1vARK9FA
 /6h5HW8J6ILML8R/YmYavoxbPMJ+ayDR53mwD0Prwij9SmhTtbk+2zLY5cRUJuXCQQAXWgikZ
 Bi6lPrjOdd/CuHHo38k1VOtLEpGzkK7j/EfuuR6AghFNI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_044625_430210_683048FC 
X-CRM114-Status: GOOD (  14.15  )
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

On 3/12/24 18:03, Guenter Roeck wrote:
> Add name of functions triggering warning backtraces to the __bug_table
> object section to enable support for suppressing WARNING backtraces.
>
> To limit image size impact, the pointer to the function name is only added
> to the __bug_table section if both CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE
> are enabled. Otherwise, the __func__ assembly parameter is replaced with a
> (dummy) NULL parameter to avoid an image size increase due to unused
> __func__ entries (this is necessary because __func__ is not a define but a
> virtual variable).
>
> While at it, declare assembler parameters as constants where possible.
> Refine .blockz instructions to calculate the necessary padding instead
> of using fixed values.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>


Acked-by: Helge Deller <deller@gmx.de>

Helge


> ---
>   arch/parisc/include/asm/bug.h | 29 +++++++++++++++++++++--------
>   1 file changed, 21 insertions(+), 8 deletions(-)
>
> diff --git a/arch/parisc/include/asm/bug.h b/arch/parisc/include/asm/bug.h
> index 833555f74ffa..792dacc2a653 100644
> --- a/arch/parisc/include/asm/bug.h
> +++ b/arch/parisc/include/asm/bug.h
> @@ -23,8 +23,17 @@
>   # define __BUG_REL(val) ".word " __stringify(val)
>   #endif
>
> -
>   #ifdef CONFIG_DEBUG_BUGVERBOSE
> +
> +#if IS_ENABLED(CONFIG_KUNIT)
> +# define HAVE_BUG_FUNCTION
> +# define __BUG_FUNC_PTR	__BUG_REL(%c1)
> +# define __BUG_FUNC	__func__
> +#else
> +# define __BUG_FUNC_PTR
> +# define __BUG_FUNC	NULL
> +#endif /* IS_ENABLED(CONFIG_KUNIT) */
> +
>   #define BUG()								\
>   	do {								\
>   		asm volatile("\n"					\
> @@ -33,10 +42,12 @@
>   			     "\t.align 4\n"				\
>   			     "2:\t" __BUG_REL(1b) "\n"			\
>   			     "\t" __BUG_REL(%c0)  "\n"			\
> -			     "\t.short %1, %2\n"			\
> -			     "\t.blockz %3-2*4-2*2\n"			\
> +			     "\t" __BUG_FUNC_PTR  "\n"			\
> +			     "\t.short %c2, %c3\n"			\
> +			     "\t.blockz %c4-(.-2b)\n"			\
>   			     "\t.popsection"				\
> -			     : : "i" (__FILE__), "i" (__LINE__),	\
> +			     : : "i" (__FILE__), "i" (__BUG_FUNC),	\
> +			     "i" (__LINE__),				\
>   			     "i" (0), "i" (sizeof(struct bug_entry)) );	\
>   		unreachable();						\
>   	} while(0)
> @@ -58,10 +69,12 @@
>   			     "\t.align 4\n"				\
>   			     "2:\t" __BUG_REL(1b) "\n"			\
>   			     "\t" __BUG_REL(%c0)  "\n"			\
> -			     "\t.short %1, %2\n"			\
> -			     "\t.blockz %3-2*4-2*2\n"			\
> +			     "\t" __BUG_FUNC_PTR  "\n"			\
> +			     "\t.short %c2, %3\n"			\
> +			     "\t.blockz %c4-(.-2b)\n"			\
>   			     "\t.popsection"				\
> -			     : : "i" (__FILE__), "i" (__LINE__),	\
> +			     : : "i" (__FILE__), "i" (__BUG_FUNC),	\
> +			     "i" (__LINE__),				\
>   			     "i" (BUGFLAG_WARNING|(flags)),		\
>   			     "i" (sizeof(struct bug_entry)) );		\
>   	} while(0)
> @@ -74,7 +87,7 @@
>   			     "\t.align 4\n"				\
>   			     "2:\t" __BUG_REL(1b) "\n"			\
>   			     "\t.short %0\n"				\
> -			     "\t.blockz %1-4-2\n"			\
> +			     "\t.blockz %c1-(.-2b)\n"			\
>   			     "\t.popsection"				\
>   			     : : "i" (BUGFLAG_WARNING|(flags)),		\
>   			     "i" (sizeof(struct bug_entry)) );		\


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
