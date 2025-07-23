Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAE3C83F27
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 02:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:In-Reply-To:
	To:From:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=qwszCHOcD+hoOUl8W6hLioq1qMAaFlKysP28kuktlK8=; b=i+RbdReXh3P1fp
	df8/Tazw9rqVc4Awzb5sQDmv7D0Tegc+9iHEmD9OW52T3RZ0o/mbzDXPrueY0dIOeT/isDVaUtppO
	bsbiWsxnsuKFSuziB81vU7+sgScG2APmeM/lJnE2gVSaQFLhUTGA8INU0UkAgq/iUjS3PE+ls3o9+
	VpP6IpaPP3rBGjvpKA5C+lAK5p+EoGgNp9VXkBdJnC6GziLjSzLpTFD5VrDSaHBgRDBBspzGqEMr0
	w5XsHAYjaHmYunU0+SlMcJrEhySFF0ZLoL8UhNnAi3Jufiu1dfzoXS29WRgbBfGeMeuAr6o2olH2v
	TYgJoBjdiPQG/qrFN3Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uePMa-00000003rYs-1cwu;
	Wed, 23 Jul 2025 02:37:48 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uePMX-00000003rYY-2hXn
	for linux-riscv@lists.infradead.org;
	Wed, 23 Jul 2025 02:37:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753238256; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nXNlbIJ2gBelqjEBEVD2ZZqHhYpHfqLNhyRL02/HrWePPrbBVzn9UFlpWLLQQqMgFkVOHgI7EPs11uxDJT2hAD3HxsnglyiqNvXHhO2Rh1o7CKVO9e2P7f9kJ1aPsC003SbwyrEkydGjlmMb2sEMdR1SO8Aw2Ums9FF/CqIAILk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753238256; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jHHlBhF2vPEqFOO6kTk6KJpYRHF8+DAv7zaVRV3Y9Vc=; 
	b=iYfXamsvsiKsG75/ndrpRp1zxp5gBp37UyESssCCFbcHYBxAjRGCXTX3cWLDK5FMl7iYfEkAFwVZK+Gj5fuwxDKK5QTNuuNCMtui3MilTN6mzPrwa+B8CnTNZPVvv/xCFFTIiBlE0+DDcDIlzSaUif03wrRLmEkOIqh9XXl4ITM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753238256;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=jHHlBhF2vPEqFOO6kTk6KJpYRHF8+DAv7zaVRV3Y9Vc=;
	b=LJSC674veqzVU7kyyZ0gi5lDSLjcElD+OaUS/4BfyPH46K1FfJodeapXXZVhFXCB
	/r+z4lqTFUSDMeeukCcmEEap8Jat18rKa/sj9mu4ads9dqs4MAiMFDBWQISGKzfATUh
	KpX2Qb0Aeeg5RvkQkDXIBaNMggYP33lbFLTSYZpc=
Received: by mx.zohomail.com with SMTPS id 175323825315690.31617852682825;
	Tue, 22 Jul 2025 19:37:33 -0700 (PDT)
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Conor Dooley" <conor@kernel.org>
In-Reply-To: <20250722-proposal-gothic-e0c3725e0874@spud>
Cc: "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, 
	"Daniel Lezcano" <daniel.lezcano@linaro.org>, 
	"Thomas Gleixner" <tglx@linutronix.de>, 
	"Samuel Holland" <samuel.holland@sifive.com>, 
	"Anup Patel" <anup@brainfault.org>, 
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, 
	"Jiri Slaby" <jirislaby@kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Palmer Dabbelt" <palmer@sifive.com>, 
	<linux-riscv@lists.infradead.org>, <linux-serial@vger.kernel.org>
Subject: Re: [PATCH RFC 08/10] riscv: dts: Add initial Anlogic DR1V90 SoC device
	 tree
Message-ID: <1854c0e4c92fe7d0.4d402317a33bdba0.106dbab4984c351f@Jude-Air.local>
Date: Wed, 23 Jul 2025 02:37:23 +0000
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_193746_099136_DE7C0F20 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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



On 22/07/2025 16:21, Conor Dooley wrote:
> On Mon, Jul 21, 2025 at 11:46:14PM +0800, Junhui Liu wrote:
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		timebase-frequency = <800000000>;
>> +
>> +		cpu@0 {
>> +			compatible = "nuclei,ux900", "riscv";
>> +			device_type = "cpu";
>> +			reg = <0>;
>> +			riscv,isa = "rv64imafdc";
>> +			riscv,isa-base = "rv64i";
>> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zbc",
>> +					       "zbkc", "zbs", "zicntr", "zicsr", "zifencei",
>> +					       "zihintpause", "zihpm";
> 
> Why do riscv,isa and riscv,isa-extensions differ?
> If riscv,isa is not even accurate, why not just remove it entirely?

You're right, they should be the same. I will remove "riscv,isa" and
keep only "riscv,isa-base" and "riscv,isa-extensions".
Thanks for pointing it out, I will fix this in the next version.

> 
>> +			i-cache-block-size = <64>;
>> +			i-cache-size = <32768>;
>> +			i-cache-sets = <256>;
>> +			d-cache-block-size = <64>;
>> +			d-cache-size = <32768>;
>> +			d-cache-sets = <256>;
>> +			mmu-type = "riscv,sv39";
>> +
>> +			cpu0_intc: interrupt-controller {
>> +				compatible = "riscv,cpu-intc";
>> +				interrupt-controller;
>> +				#interrupt-cells = <1>;
>> +			};
>> +		};
>> +	};

-- 
Best regards,
Junhui Liu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
