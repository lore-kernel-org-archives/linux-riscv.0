Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80ABC5AC7C
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 07:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KbqBL6xu9uhewBIAmRCbkXrLo68hCi1lKuZ3xD3kXNQ=; b=R5SuVx30xjZI2d
	v4aT71pAZlZrF0M01kgUirQqJfDRxrszWgAF+DaK9g3vjH4uP1S4sjqW5f3TQdaTfC9tZvt48thTA
	iyX/aCuX1a618QFsJN3R0oABUpVAZNCBBNAXX9XMGTH7RsiWobK3FMjMJS85ekYElDISwPzrgT3sF
	iDLi0DhFiMpO3UFJEraMv57PLZ0k7NiSCypjXXReHkLAdsDTD8AxGHxOEgBtfqNPA6/rozvwYfN7d
	Aj2S84Ee1eWs5rkGPNj/LQcGqclQ9uub6X0pMr4kuA8dT+v3JXDiODi3jfX/gfWOXEysV1zt9UKao
	IwqpNIiJMTYAiGrDBz3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFEn-00000007HY9-2578;
	Fri, 07 Aug 2026 07:43:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFEl-00000007HWR-2Pkg
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Aug 2026 07:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7S8dBK6YhaGNGXZXuOaaURDNFzX4xHQ7yoGCrlFysFs=; b=YcA+n/qdCCUTZQzB2SO7RSWyYd
	Sqz//OwPq3ItNxLBu4WoD3VPY/D8xeSpo2+NJW4RehTLIl3G9uZxqkGjKfWmrX0ES0g2BER0sTM7D
	w/aQiu8Wu5O78Ch5OC7eY/hcLNbl2izSJdmbTJXQrJ9e0vzw9BbiuFKJadeQdGhxP7BppL0bWTXX3
	7Rf3cfhAoR2pXybmCjgmM1t6KQa58BxbG/rHyaybPKYABdux51RUCj1wzTqg/j9Teyc6wV0SBQ5yJ
	MP09x4cuCSjfEgi6EFGGTrgqy4vHKNkdibzIOitWDWFkImNmS83CxBPKCB8nYJ2obsnVni4j9ZW6r
	rtpkNENw==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFEi-0000000C9RX-3ZeA
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 07:43:26 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso1570512f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 00:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088603; x=1786693403; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7S8dBK6YhaGNGXZXuOaaURDNFzX4xHQ7yoGCrlFysFs=;
        b=i6DyVHB1ZxJ2nIsVGI7vVvtS+JyUymsnTI+k9yintYPkDz1vjmWAcd/hv47dN6uXLz
         KitWX05hDkgDvk3+AKK1b0nl4ghwqGyyHjVZtlv5Pn5CMmrDODeKkqMH5PRaM+TiLz4F
         NrIektZtRIub3mocUu6phus70b64TmNlDefHg3dcNh5hJtsoPNuW73fbP4Y/Y2Axg7gi
         TqVoDmJR9SvYdCeR2LAWKsDboyxDYuJAlUP85TcyoIfHdh/xvsRCGZVBqSZwqXoKBSRB
         srnlnnj3kmg5J48IFntfUNY7yieDCpjMjI6X5f/9/A0BV7BAiepz1Nynz2E0gGMBUF1R
         45vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088603; x=1786693403;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7S8dBK6YhaGNGXZXuOaaURDNFzX4xHQ7yoGCrlFysFs=;
        b=o8D28qrucctv1OgIA1Heu2UUmGUZ1OooIaHDx+Kf9cFm6pkyoJ3CmvMyphE4/BDdF9
         1PeAxtdQLtYf1xihAx5SLxUCqxidfaEVgU2XxOWFWD7a5ZcLOO/+YWHPgyZY3LNGKP6A
         GtkFTjgp/p5dM6Hc2ITJqu6EhylzkVtNleyDPhs3D3IvyXtBoDYVMVtiNmgqymAYejUC
         KPv56c8H4wI2uMiicydQ+3bG6wL9DSCk6ulyy9gnlRjQdMiAjkC/n91704zKxj8fQHsT
         9gJTf46HLR0guCs6Zm+RnuTmkYCbowwQ/Pau4gXK3NkEHIJhUxJz49f/SVzC54FXFe14
         N6lQ==
X-Forwarded-Encrypted: i=1; AHgh+RqucPqk1PY7VC2xLUhTe04uDa3GoboT1eOOF8X3lMcH2yOnEhfyX6UCkFY78uCvuTwpMfAGLFNYtxDcrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YylPS8Thg8qMv+CtXliLCdnw2hGoyTqDXm511sDId4Epd5mB2n2
	gG/uhslXaPHCstbY6YEreV6EoDlJF29iXBmOeG8BrbuDHtKItqRwt4upoSD+AOpk/ElL
X-Gm-Gg: AR+sD11Gd8ZaU0nzMSgu/sYTB+AV1yfRY4QczKMbgf2HuPGcZ640cP2JalNae2h14Qr
	AVDjeO+qPjI9+FDdPQxjsUgfPY4ApwUuIWgL72aInv1DsvZXoDfw326wRpjJyZ98LSIUjHfnIdk
	hxHKJgNRBHPgFXi8D/lV7zHRrVS9DP0eKXv35y6zoEo5GSDLe54wEl2FB2N8b5bxop7+DwtBd7d
	c/B8yznWE75qHQvlzVHYDQKXpx4X8ZNATEmRAAAa/hEwrloDiv8JaXTJP/fDTy1I4g2CKij+dbt
	wTG86aocpbmvIuDBbpN2ZdRuTymDNRBp1j8cBbkNjRBxoFRc5I4yIlGb7XP/YvTNPjexD6uZ+Y4
	GJONqLNQRG+nzWbTpmHKquIWNwJU/pCP+VKLgV769vN0LWb5A8ysunk3bmtXVUfKIivFSGPgZxC
	QwhueY4N6lQYBKGGMONbWNhDofIToTp5hcl7C69xY0k0kUDtSFg83Sxx+1jbdHWCVkvDLZ1/CXg
	ChZlzAGQ4qlb5+Xhndeq66DZrBReU+uHM6SPdq2OFIv
X-Received: by 2002:a05:6000:290d:b0:47f:f42e:9715 with SMTP id ffacd0b85a97d-47ff42e974fmr20538949f8f.12.1786088603193;
        Fri, 07 Aug 2026 00:43:23 -0700 (PDT)
Received: from ?IPV6:2001:8a0:f59c:a900:2600:fba1:8d1e:1692? ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002150952sm2814778f8f.15.2026.08.07.00.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:43:22 -0700 (PDT)
Message-ID: <79d79806-ceda-4e79-8e9f-6420265c8efa@osyx.tech>
Date: Fri, 7 Aug 2026 08:43:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>
Subject: Re: [PATCH 4/6] virt: bao: Add Bao I/O dispatcher driver
To: Andrew Jones <andrew.jones@oss.qualcomm.com>, joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
 aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com,
 conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com,
 davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io,
 gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de,
 jose@osyx.tech, kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-5-joaopeixoto@osyx.tech>
 <4rrof4lk2zxut63u7qwxlmygpslvq5owfraatbjq3sbybtac4u@2prxnxijartx>
Content-Language: en-US
In-Reply-To: <4rrof4lk2zxut63u7qwxlmygpslvq5owfraatbjq3sbybtac4u@2prxnxijartx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_084325_123003_43946736 
X-CRM114-Status: GOOD (  19.25  )
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


On 1/14/26 20:32, Andrew Jones wrote:
> On Wed, Jan 07, 2026 at 04:28:27PM +0000,joaopeixoto@osyx.tech wrote:
> ...
>> diff --git a/arch/riscv/include/asm/bao.h b/arch/riscv/include/asm/bao.h
>> index 35658f37e1bd..f04e6cd33fa9 100644
>> --- a/arch/riscv/include/asm/bao.h
>> +++ b/arch/riscv/include/asm/bao.h
>> @@ -14,6 +14,7 @@
>>   #define __ASM_RISCV_BAO_H
>>   
>>   #include <asm/sbi.h>
>> +#include <linux/bao.h>
>>   
>>   #define BAO_SBI_EXT_ID 0x08000ba0
>>   
>> @@ -28,4 +29,33 @@ static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
>>   	return ret.error;
>>   }
>>   
>> +static inline unsigned long
>> +bao_remio_hypercall(struct bao_remio_hypercall_ctx *ctx)
>> +{
>> +	register uintptr_t a0 asm("a0") = (uintptr_t)(ctx->dm_id);
>> +	register uintptr_t a1 asm("a1") = (uintptr_t)(ctx->addr);
>> +	register uintptr_t a2 asm("a2") = (uintptr_t)(ctx->op);
>> +	register uintptr_t a3 asm("a3") = (uintptr_t)(ctx->value);
>> +	register uintptr_t a4 asm("a4") = (uintptr_t)(ctx->request_id);
>> +	register uintptr_t a5 asm("a5") = (uintptr_t)(0);
>> +	register uintptr_t a6 asm("a6") = (uintptr_t)(BAO_REMIO_HYPERCALL_ID);
>> +	register uintptr_t a7 asm("a7") = (uintptr_t)(0x08000ba0);
>                                                        ^ BAO_SBI_EXT_ID
>
> Using the experimental extension ID space would be fine for an RFC, but
> this can't be merged until an SBI implementation ID for Bao is added to
> the RISC-V SBI spec. Then the Bao EID would be '0xA000000 | <Bao-IMP-ID>'
Understood. For now the RISC-V backend uses the experimental extension 
space,
and I have made that explicit: BAO_SBI_EXT_ID carries a comment noting a
permanent EID must be assigned through the SBI spec before RISC-V can be
considered stable, and I am marking this revision RFC for that reason. I 
will
start the process of getting a Bao implementation ID registered and 
switch to
'0xA000000 | <Bao-IMP-ID>' once it is assigned.
> I think we'll also need to discuss whether or not firmware/hypervisor-
> specific extensions are exempt from all rules in chapter 3 of the SBI
> spec other than a7 being the EID. If not, then this function should
> just call __sbi_ecall() and the Bao hypercalls will not be allowed to
> modify any registers except a0 and a1.
>
>> +
>> +	asm volatile("ecall"
>> +		     : "+r"(a0), "+r"(a1), "+r"(a2), "+r"(a3), "+r"(a4),
>> +		       "+r"(a5), "+r"(a6), "+r"(a7)
>> +		     : "r"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5),
>> +		       "r"(a6), "r"(a7)
>> +		     : "memory");
>> +
>> +	ctx->addr = a2;
>> +	ctx->op = a3;
>> +	ctx->value = a4;
>> +	ctx->access_width = a5;
>> +	ctx->request_id = a6;
>> +	ctx->npend_req = a7;
>> +
>> +	return a0;
>> +}
> Thanks,
> drew
Good point, and I would value your view before I respin the ABI. The Remote
I/O hypercall currently returns several values in a2-a7, which does violate
the calling convention if Bao extensions must follow chapter 3. If they 
must,
I will change the hypervisor-side ABI so the call only returns via a0/a1 and
move the extra results into a shared-memory region, then switch the helper
to __sbi_ecall(). Since that is a hypervisor ABI change I would rather agree
the direction first. Do you know of precedent for hypervisor/firmware
extensions being exempted here, or should I assume the full chapter-3 rules
apply?

(Separately, I removed the redundant input constraints from the ecall asm -
the operands are already "+r", so the extra "r" inputs were unnecessary.)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
