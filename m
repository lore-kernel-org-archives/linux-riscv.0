Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DE0C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Apr 2022 04:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GvH6T0TTPb59qfqkpXAM3vEDBThm1lXsx+6DQEyEP+o=; b=k1eGsVzBdOxLGY
	bqFhLiaKXbr/bkVA+k7tLWCMA6Sv/ev7MecgsciE/POYR/hhySSspQJvHEsJslDvZeyo60x9W+6hv
	/yTC64xpvehk8FI2BSfa8MeWKk4pAJ36y/K0a+Yft+TOoE8fuhD6LzzQ7XMtFMHiFaIK3lv13UR3x
	+DbKiRswaaFdF/AloPw2gm5WtLKaGQWbPsIzUJQGLDzEZsC4J7OK64rz7sXDxvQuGYNptM6otaSLx
	R1qJDKlSyurrLdyidolQAinNuGP80TVXXPXV4kIk+uwrbpSYq+lqy2rE4D0NX89Qa0HXx8HfYa3fX
	DjsFBgyACINCeCFkuxWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhlB0-00G6GP-T7; Fri, 22 Apr 2022 04:45:50 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhlAp-00G6Db-Hj; Fri, 22 Apr 2022 04:45:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 586821570;
 Thu, 21 Apr 2022 21:45:38 -0700 (PDT)
Received: from [10.163.40.48] (unknown [10.163.40.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEC4F3F5A1;
 Thu, 21 Apr 2022 21:45:30 -0700 (PDT)
Message-ID: <17625223-cc3d-d62a-57db-f7bb5274369f@arm.com>
Date: Fri, 22 Apr 2022 10:16:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH -next v5 1/5] mm: page_table_check: using PxD_SIZE instead
 of PxD_PAGE_SIZE
Content-Language: en-US
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
 Tong Tiangen <tongtiangen@huawei.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-riscv@lists.infradead.org,
 Guohanjun <guohanjun@huawei.com>
References: <20220421082042.1167967-1-tongtiangen@huawei.com>
 <20220421082042.1167967-2-tongtiangen@huawei.com>
 <CA+CK2bCWRL_vXW1BUhxb-zLiywXTCQdaa+9feEwQytYW=K46-g@mail.gmail.com>
 <bbd67c4e-6adf-dc1f-7104-427e3e598d9a@soleen.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <bbd67c4e-6adf-dc1f-7104-427e3e598d9a@soleen.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_214539_683071_91D1F0AD 
X-CRM114-Status: GOOD (  12.04  )
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



On 4/22/22 00:10, Pasha Tatashin wrote:
> On 4/21/22 11:28, Pasha Tatashin wrote:
>> On Thu, Apr 21, 2022 at 4:02 AM Tong Tiangen <tongtiangen@huawei.com> wrote:
>>> Macro PUD_SIZE/PMD_SIZE is more general in various architectures. Using
>>> PUD_SIZE/PMD_SIZE instead of PUD_PAGE_SIZE/PMD_PAGE_SIZE can better
>>> support page table check in architectures other than x86 and it is no
>>> functional impact on x86.
>>>
>>> Suggested-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
>> Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> 
> To avoid similar problems in the future, please also include the following patch after the current series:
> 
> ----------------8<-------------[ cut here ]------------------
>>From cccef7ba2433f8e97d1948f85e3bfb2ef5d32a0a Mon Sep 17 00:00:00 2001
> From: Pasha Tatashin <pasha.tatashin@soleen.com>
> Date: Thu, 21 Apr 2022 18:04:43 +0000
> Subject: [PATCH] x86: removed P*D_PAGE_MASK and P*D_PAGE_SIZE
> 
> Other architectures and the common mm/ use P*D_MASK, and P*D_SIZE.
> Remove the duplicated P*D_PAGE_MASK and P*D_PAGE_SIZE which are only
> used in x86/*.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Absolutely, helps in minimizing arch specific stuff wrt to page table mapping.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
