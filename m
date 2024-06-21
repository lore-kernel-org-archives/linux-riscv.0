Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47078C2BA1A
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 08:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NwsX0Y4kyn/uqzLVr6If49/jADyjc52Vu3THZJshb8E=; b=czZy06OxQRlWSN
	iyfSKUXlSU2tILdCKVL8wCsw426AnMx48YaRL5/8AHiS06uh/ZS1SBNyJ/GowRuRo1pWmvvGe2F/D
	Od7AGvEsHjpUa71dyNTouO7JKN6Spug9ObIvQpARX/iarmfBWZfO+1J2NItbRe15uE42wUC0lNMp9
	prLDXkWObRq3uahJGDMOQ3aU2TpDmpojZ2PWXa4tXX4LHJ1/ZDeqEqp+3y1XPRazE5AebnR/FzAvr
	F2AegAv8S/5wV5Q9azBxv4QXVAlkRHEYHNXSVHnsJWguUPp38AB9I75FVeQ/g9f4MUkOcXwp3QL9t
	R4rn80g2u1l2dh6hbhpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZJt-00000008Gwe-2KjI;
	Fri, 21 Jun 2024 08:08:29 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZJp-00000008Grv-1Jbf;
	Fri, 21 Jun 2024 08:08:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43368C0004;
	Fri, 21 Jun 2024 08:08:04 +0000 (UTC)
Message-ID: <ed87b4d8-1a74-4d9a-9beb-296db1f12043@ghiti.fr>
Date: Fri, 21 Jun 2024 10:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] RISC-V: Add Svade and Svadu Extensions Support
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Yong-Xuan Wang <yongxuan.wang@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, apatel@ventanamicro.com, ajones@ventanamicro.com,
 greentime.hu@sifive.com, vincent.chen@sifive.com,
 Jinyu Tang <tjytimi@163.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Atish Patra <atishp@rivosinc.com>, wchen <waylingii@gmail.com>,
 Samuel Ortiz <sameo@rivosinc.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, Evan Green <evan@rivosinc.com>,
 Xiao Wang <xiao.w.wang@intel.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Jisheng Zhang <jszhang@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Leonardo Bras <leobras@redhat.com>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-2-yongxuan.wang@sifive.com>
 <09f427cd-74ad-4aa5-81b1-995af2b6e1d1@ghiti.fr>
 <20240621-enchanted-unfasten-6d71b1ecd791@wendy>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240621-enchanted-unfasten-6d71b1ecd791@wendy>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_010825_508043_E6B53AF5 
X-CRM114-Status: GOOD (  16.64  )
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

Hi Conor,

On 21/06/2024 10:01, Conor Dooley wrote:
> On Fri, Jun 21, 2024 at 09:52:01AM +0200, Alexandre Ghiti wrote:
>> On 05/06/2024 14:15, Yong-Xuan Wang wrote:
>>> Svade and Svadu extensions represent two schemes for managing the PTE A/D
>>> +/*
>>> + * Both Svade and Svadu control the hardware behavior when the PTE A/D bits need to be set. By
>>> + * default the M-mode firmware enables the hardware updating scheme when only Svadu is present in
>>> + * DT.
>>> + */
>>> +#define arch_has_hw_pte_young arch_has_hw_pte_young
>>> +static inline bool arch_has_hw_pte_young(void)
>>> +{
>>> +	return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU) &&
>>> +	       !riscv_has_extension_likely(RISCV_ISA_EXT_SVADE);
>>> +}
>>
>> AFAIK, the riscv_has_extension_*() macros will use the content of the
>> riscv,isa string. So this works fine for now with the description you
>> provided in the cover letter, as long as we don't have the FWFT SBI
>> extension. I'm wondering if we should not make sure it works when FWFT lands
>> because I'm pretty sure we will forget about this.
>>
>> So I think we should check the availability of SBI FWFT and use some global
>> variable that tells if svadu is enabled or not instead of this check.
> No. If FWFT stuff arrives, it should be plumbed into exactly the same
> interface. "Users" should not have to think about where the extension is
> probed from and be able to use the same interface regardless.
>
> The interfaces we have have already caused some confusion, we should not
> make them worse.


Understood, we need to keep that in mind then.


>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
