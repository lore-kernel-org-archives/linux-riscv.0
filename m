Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61001C54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 06:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=boF4KNabWfsSqmPGSphXsW181j7D1ljgSj4EnDTq15I=; b=RzDHp4sjsU0ii/
	nnWuHbozayU2j/W+bUBgqnWBtCIrKnTanoYANMoRXt7CH6a5Eea3SHvFuiQf+kjE7BBI/SO5h4m66
	4mI8X8LVSzmyNl0L0AdRbQOF2PDO1m9EPF4gNVxMjOkO21ebZ9wY+4otl/9lOR71XpOQuWi4L6Z8s
	s2TONsHkYvEXwIEJhndDIHs8PX69OtNAN+ubmtXdElKT/WczYcXdA625o78jBPaqFfidSEoQftwgM
	OnsgFNlggrzte+kZRAAr8RCdjhikBUhVsxD9h7el/hr+2FyAMRpupBaoyRVW2WrGrh1TBfdyho6J4
	lrowE9WmjhIrFhOlodVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpjFh-0000000CiNz-0DSD;
	Thu, 28 Mar 2024 06:28:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpjFd-0000000CiND-2hgX
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 06:28:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F136B60DCD;
	Thu, 28 Mar 2024 06:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8414C433F1;
	Thu, 28 Mar 2024 06:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711607316;
	bh=alkregifthNoKgf0knvmSztmwMl6qxa+qfrKKKmyuOY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=pdYeJAAPvle33p3XncMyP/d/A165zS0CTX+VwrnSAVDMgWuHaJWudMfJHD6qKcbql
	 AOd2aNGZstAVTuHPVChrrB90F3wcr7ruu3czVfVHXij/MJ6wgSoh3Ugz1cDDHGryCD
	 59Y3hjOMK4BfQ6/qN946LnUfViCeYC1cwtnT9/0Y1tUBe1lYQa8o2i3CshS82BtfjI
	 4R9xSLqXW/jX3JnUsTk2MIp3qR3Si1BD033rvl0Hhrq4bNZ2y5l6hSqSo/JWzZVg0N
	 ECwMNdRcINOFXUKSbTNQL6YPTFwBwqeELBjSVGbyvSlPahXavufap/O+M8QAInwjJd
	 E5e5ddZYZAKxA==
Date: Thu, 28 Mar 2024 06:28:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: Conor Dooley <conor.dooley@microchip.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: =?UTF-8?Q?Re=3A_=E5=9B=9E=E5=A4=8D=3A_=E5=9B=9E=E5=A4=8D=3A_?=
 =?UTF-8?Q?=E5=9B=9E=E5=A4=8D=3A_=5BPATCH_v?=
 =?UTF-8?Q?1_1/2=5D_dt-bindings=3A_medi?=
 =?UTF-8?Q?a=3A_starfive=3A_Match_driver_and_yaml_property_names?=
User-Agent: K-9 Mail for Android
In-Reply-To: <SHXPR01MB0671EA5AED87CE14113148E7F23BA@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>
References: <20240119100639.84029-1-changhuang.liang@starfivetech.com> <20240119100639.84029-2-changhuang.liang@starfivetech.com> <20240119-despair-festival-59ab2d4d896b@wendy> <SHXPR01MB0671E2150D9A2707F12E0901F270A@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn> <20240119-preamble-calm-7724e17fcebc@wendy> <BJXPR01MB0662E6EEEEF888BD90A1FCE5F275A@BJXPR01MB0662.CHNPR01.prod.partner.outlook.cn> <20240122-uncivil-almost-631137081fd9@spud> <20240327-unlucky-bulge-2bf99a8649be@spud> <SHXPR01MB0671EA5AED87CE14113148E7F23BA@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>
Message-ID: <C3D2F0B5-CB35-488E-842E-D049CA067475@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_232837_799251_B48480D5 
X-CRM114-Status: GOOD (  17.89  )
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



On 28 March 2024 01:06:42 GMT, Changhuang Liang <changhuang.liang@starfivetech.com> wrote:
>Hi, Conor,
>
>> On Mon, Jan 22, 2024 at 08:24:51AM +0000, Conor Dooley wrote:
>[...]
>> > > > > > Do these clocks etc exist but are not used by the driver?
>> > > > > >
>> > > > > > Or do they not exist at all?
>> > > > > >
>> > > > > > The two are very different!
>> > > >
>> > > > > These clocks etc exist but are not used by the driver.
>> > > >
>> > > > That's not an acceptable reason for removing them from the
>> > > > binding. If they exist, they should be documented, regardless of
>> > > > whether the driver makes use of them. NAK.
>> > >
>> > > If so, how to avoid the warning of dtbs_check.
>> >
>> > By also adding the clocks, resets and interrupts to the dts.
>> 
>> Going through patchwork stuff now that the merge window is done. I'm gonna
>> mark the dts patch as changes requeted. The binding (and dts) should
>> describe all of the clocks the hardware has, whether or not you choose to use
>> them all in software does not matter. Can you please resend the dts patch,
>> with all of the clocks, resets and interrupts present?
>> 
>
>You have applied the dts patch.
>https://lore.kernel.org/all/20240219032741.18387-1-changhuang.liang@starfivetech.com/

Oh, sorry for the noise then. I guess I was
mislead by patchwork marking this as new :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
