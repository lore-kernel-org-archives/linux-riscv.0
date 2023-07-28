Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F62C0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 09:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ykpJV3QWC7X2r0jLkHToDr0eNEjY1QebsF1VOPVJ5rQ=; b=u2YcjnSq66n50+
	VTQhFMa4+ZnK4PKPLBEP/UFGtnk8DqPaZLEjqkHmVMfhL0ru5DsMGex4CjqQe1eemzQP8pobFR4fe
	vZbbCaWYkC6T6OHfzooz2AwZuvgPk2rrV1UbNg8Mx7hRidiLbpsmzCkZDOZ94W6RBvGxXbpIgT/v7
	s4gN4jbhJ2jWQKqguo8LoGcS3JYbD1cbBX1/QRX19+jY+y02V80WvaeLTFp/FHawYPKnpXtAsBeUb
	I6kzIPd6hhI9GdtUvZuifENta7VxgmtyFAO05Rt2sIdIPup5lP7RZRhdcyrSgaKM5wmRGYYoNClii
	U2mWkbPXw2268swsjFkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJNW-002ZHO-1H;
	Fri, 28 Jul 2023 09:03:18 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJNR-002ZFh-2C
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 09:03:16 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 27C6624E31A;
	Fri, 28 Jul 2023 17:02:40 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 28 Jul
 2023 17:02:40 +0800
Received: from [192.168.120.59] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 28 Jul
 2023 17:02:39 +0800
Message-ID: <23769fc1-69cb-f237-6488-f2322368e309@starfivetech.com>
Date: Fri, 28 Jul 2023 17:02:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 2/3] spi: cadence-quadspi: Add clock configuration for
 StarFive JH7110 QSPI
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: <devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Mark Brown
	<broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Emil Renner Berthing" <kernel@esmil.dk>, Ziv Xu <ziv.xu@starfivetech.com>
References: <20230719092545.1961401-1-william.qiu@starfivetech.com>
 <20230719092545.1961401-3-william.qiu@starfivetech.com>
 <20230728-retread-starch-3399b921718a@wendy>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <20230728-retread-starch-3399b921718a@wendy>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_020314_010069_8F3ECCD7 
X-CRM114-Status: GOOD (  14.43  )
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



On 2023/7/28 16:58, Conor Dooley wrote:
> Hey William,
> 
> Since you pinged things, I had a quick look.
> 
> On Wed, Jul 19, 2023 at 05:25:44PM +0800, William Qiu wrote:
>> Add JH7110's clock initialization code to the driver.
>> 
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> 
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202306022017.UbwjjWRN-lkp@intel.com/
>> Reported-by: Julia Lawall <julia.lawall@inria.fr>
>> Closes: https://lore.kernel.org/r/202306040644.6ZHs55x4-lkp@intel.com/
> 
> These, as pointed out on the last version, should not be here.
> kernel test robot complaints about un-applied patches do not get a
> reported-by etc in subsequent versions of the same patchset, just as
> comments from human reviewers do not require reported-by tags.
> 
> These tags should only be used when the code has been merged & you need
> to create a new patch to fix the issue.
> 
> Hopefully, if the code is otherwise fine, Mark can fix this when he
> applies the patches.
> 
> Thanks,
> Conor.

Hi Conor,

Fine, I will drop it in next version.

Best regards,
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
