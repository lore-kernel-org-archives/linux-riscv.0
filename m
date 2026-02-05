Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26799EA795C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 03:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w9rZwZTHq1+Gch4NUvxgav1PYAq9oJV0mqAh615YgJI=; b=hj9vRw9syFOWzn
	Q+XAog5DiCTOmDnMNnJ7B9A0irundqxnh4XF3In2bGBorbXhwqrXHi/XNwG5lrrhF++2mfCpJJpTI
	LhAfcXLyR0pIiIgjIsFjR9KgH/KSwFQW8ZZJnpzsnsvVKPknjcV0vHVsgP4d/KmsPSETpNw30qazz
	cvYo7yvXt4Ierw75upSpQBwk3ySrhPX2xRL3z7aiqIFFMM1w+qCCFz5RjlKKUeB79NtoPJLAADihu
	NCDpTxxYY+K3+JXd1HFw/OQw6VG9dJ79yzVU9guoH1KpnAFVn3AJ8b/i3cxK032kcbQSRZ8pKz8OS
	poRm/I0NNVOv6+1KgApw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnq9Y-00000009NEw-1S8E;
	Thu, 05 Feb 2026 03:35:36 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnq9R-00000009N8f-1Gek
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 03:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1770262505;
	bh=SeKBOcdD84606pDtvdsjxdnWzrgEWvgidwbUdBKHQwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=c1Ae7rWLc4PENl0uLKYVmqIONpe2AROI52Qmt3qcVHpClHPHhIdmIzkuDP7AoBYPL
	 Jc4RvkMYHCbuNyonEMcWvYEbSVEsltzK+ulU/GhOKlBseb0mKRg0ZgIuScpgxenqgf
	 dJPdahwH9hUUQsU5SF2Q3i50nqWZqRF67yksw2j0=
X-QQ-mid: zesmtpgz3t1770262504tda838170
X-QQ-Originating-IP: sxlYbrvtbg41P12uiR73+y1ZhiH/TyOcK1oNHEb3XfY=
Received: from [10.3.91.191] ( [101.70.125.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Feb 2026 11:35:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2640687866442751431
Message-ID: <4D87481E9AABE2C6+72d18f72-9407-4d68-8195-edc6c171df14@linux.spacemit.com>
Date: Thu, 5 Feb 2026 11:35:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] iommu/riscv: Add HPM support for performance
 monitoring
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Jingyu Li <joey.li@spacemit.com>,
 iommu@lists.linux.dev, linux-perf-users@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 devicetree@vger.kernel.org, zong.li@sifive.com
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <9C0A2AD4850D179B+524146e74e808db90d5f28fcb6ee791cf1d1bfaa.1770195980.git.lv.zheng@linux.spacemit.com>
 <p74snip7yykhogvzqld4gyjlygmd2z4kqnat7w3qj63fwebnmm@dlz6tloevgbs>
Content-Language: en-US
From: Lv Zheng <lv.zheng@linux.spacemit.com>
In-Reply-To: <p74snip7yykhogvzqld4gyjlygmd2z4kqnat7w3qj63fwebnmm@dlz6tloevgbs>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: Nc4Sv39/e83WoUzhDMado5tF9zXVjuQge2N8Wn4you2MtSDWDloiRU3M
	OLF1PQZ84zrsXzNg4RxRNy9TFfzqIhfs/3vkF4CqHE5MH/ko46qkKoSSMSHcjsQis7SJlbR
	WRS2XpM19KxCB0FEq71N2ntkICxyBFkZf4yJCPByx+mDufZsmnnuDQL+bUj6fRIcoiQ4RGl
	MGCtj2QzuK9B5auT+qBrPkQmSnwcgvbRugoHsVM86Kaon0NDekY7T9b++uhaxd9niHnJj/5
	qtnyQz365JWx4ehbyCxiXZpjidbmwG7JajmT+rFMEHbc1asSIoGVtyodY4dS5p7mQmDf4vJ
	q+7MsVbrf8Z1vh7I8QKRTcmw9XxGIEFA0jk9riOiE/agmjIfp9bSKc861dAdASJP/LJkWd9
	wSp3HHJk48lUSRn0RvklWTlGjaKvtRLSlAOpfNFLC193nUse129Licc3HUOxHRjeywmSM1y
	FndjaxzgqFh+mssahNZqm/8/Lq1i3dmJ/fnf5EES8qPvwrK7eIVh/3QnTmepeEah1bYXca8
	SdK4HjDVtLlpyCKAjuveK7epcbJWqbqrliF6oUdSb3d+evSll/JftNT2BQ4k0pB1KLJ95Gn
	bn/N6Wi5QoFBm63NuIXw7rxuWnon+8i/Z9G72HT/sIybkKQkfvOoTt58Y1meTfcBLe+rn7w
	pw4WCRzVS9/K71UbDjGjhBW6TfBlAEh3Nb4Sp7OBHnTqSk1D9WIegZ1V2D+oEKGVFY0WJY7
	AtjHESPndVAuO+5oVjiV1g/cPqFudfUQ3BlTtLYi8Tn+sE+LDEyApMggkOunsrhhs4jfnqJ
	lE9RC2ZQjS0DLTQxpwgtbNltWvmgNt/ta6bKaTbHr10nsPwzSQo0tO7f8sTSuhZ+HxO7ZZs
	X/ekB5GMJ4mXPzCIwDITW6SxvbF55v/X5tTZZXIKy/cpk9mZmr45PUfWxMbySXCUXtYJc++
	SDWY3xHGDUucoDiQ0Ba/QsxEtS4IcOHl60Kyx5q9vpDzUjetqn2AtXnNB5BRzXGrflJL6eL
	pGYarTSGqKRoTHLYOj7bfMqJ5NkVVVaJ+9N0OFuw==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_193530_241042_A6CF3250 
X-CRM114-Status: GOOD (  15.33  )
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

On 2/5/2026 2:39 AM, Andrew Jones wrote:
> How does this relate to
> 
> https://lore.kernel.org/all/20250115030306.29735-1-zong.li@sifive.com/
> 
>  From a quick skim it looks like there's plenty of overlap.

We developed the driver in 2024 and demonstrated it in China summit. We 
didn't notice that a patch is on-going now in the community.

Now it looks our approach solved more issues, and we'll check and update 
if there are any community concerns still not addressed in this patchset.

We can add Reviewed-by/Tested-by and Signed-off-by of Zong Li to this 
patch if he wishes.

Thanks,
Lv

> 
> Thanks,
> drew
> 
> 
> On Wed, Feb 04, 2026 at 05:09:01PM +0800, Lv Zheng wrote:
>> From: Jingyu Li <joey.li@spacemit.com>
>>
>> Introduces perf-based HPM driver for RISC-V IOMMU, enabling performance
>> monitoring capabilities.
>>
>> Note that the RISC-V IOMMU HPM module uses COUNTER_MAX-1 as a static
>> counter index of HPMCYCLES, and 0~COUNTER_MAX-2 as the dynamic counter
>> indexes of other HPMEVENTS in order to correctly index into IOHPMEVT and
>> IOHPMCTR registers that have already been defined in the iommu-bits.h.
>> However the users treat 0 as the index of HPMCYCLES and 1~COUNTER_MAX-1 as
>> the indexes of other HPMEVENTS, thus care should be taken in dealing with
>> counter indexes between userspace and kernel space.
>>
>> Signed-off-by: Jingyu Li <joey.li@spacemit.com>
>> Signed-off-by: Lv Zheng <lv.zheng@linux.spacemit.com>
>> Link: https://github.com/riscv-non-isa/riscv-iommu
>> ---
>>   drivers/iommu/riscv/Kconfig          |   9 +
>>   drivers/iommu/riscv/Makefile         |   1 +
>>   drivers/iommu/riscv/iommu-bits.h     |   6 +
>>   drivers/iommu/riscv/iommu-hpm.c      | 843 +++++++++++++++++++++++++++
>>   drivers/iommu/riscv/iommu-pci.c      |  13 +-
>>   drivers/iommu/riscv/iommu-platform.c |   8 +-
>>   drivers/iommu/riscv/iommu.h          |  42 ++
>>   7 files changed, 919 insertions(+), 3 deletions(-)
>>   create mode 100644 drivers/iommu/riscv/iommu-hpm.c
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
