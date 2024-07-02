Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A26C2BD09
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 02:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCAHt2Ilf5EMLf4+RfoT+ORNjX7gNMtuFj81wD4m2JY=; b=goAgbfgEyjlB0+
	JxFh7AHMOw2E4CFEKqqtK1uEnKphzzW1ckH30mcpriqIcG4yO5qL+ltFN8jTZurllEYtM7LsHsma8
	aV/OBIopaVrknEMr8cWmQL3QwLBkkZFyP5sf7Synw1QEsJaNSKYv60Ut2yt0rZsadWCzccvet/APm
	xJLoZ0oyeYREqczC767tGtv6J/bEVU3wgBCTFKt8PQ7AoRubJEFUHggNMlIpk4ODbqHI+ox/aT09I
	vjdTPnQne7GzkBYVYGoB6+ozSWRy4gho9ZIEPfu5EJMdcorCx6bn9Ev8QjM0tWpOMRTwYEtXi4bpq
	+5Un/xS6NzpgzgeH3Z8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOSqb-00000005JW6-3MBF;
	Tue, 02 Jul 2024 02:02:21 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOSqY-00000005JUs-2dzM
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 02:02:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=milkv.io;
	s=pmbt2212; t=1719885686;
	bh=+ldizvF9YSD27PIyYZfFpk4CAQwaf/+/iVcCjRts9Mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=KQNPgMJMPZb8efgo7dvlsschYUUT/QkyrcfMF6J2KJVu1EoxzJmrPYi/ejuhKKZyZ
	 g4dazPRnzV+UepnxhO+o/Av/i6GGMpD4qWgNFPZYsGTb0IiHRF6tWx4DPGxQArixEd
	 /8pSOT5KGqvDyKOS88cyyp5OmSbyNltLx9/UPqlA=
X-QQ-mid: bizesmtp91t1719885684tw3ogjgs
X-QQ-Originating-IP: E6SzRYR6PU3puRvXZ7Hqec3cV+kso3CiffS6Xe0I0HQ=
Received: from [192.168.159.131] ( [106.150.157.243])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 02 Jul 2024 10:01:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2448114111142640459
Message-ID: <86A69C6CEBC812CF+32fec2e6-0bee-46da-83a2-336838b6339d@milkv.io>
Date: Tue, 2 Jul 2024 11:01:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] riscv: dts: starfive: enable heartbeat LED for
 Milk-V Mars
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, kernel@esmil.dk
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20240627115236.618-1-naoki@milkv.io>
 <20240627115236.618-2-naoki@milkv.io>
 <CAJM55Z_NaimQJkoykU1+THY_WqNMVsvENpJHJYFPTD3YuXOMnw@mail.gmail.com>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@milkv.io>
In-Reply-To: <CAJM55Z_NaimQJkoykU1+THY_WqNMVsvENpJHJYFPTD3YuXOMnw@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:milkv.io:qybglogicsvrgz:qybglogicsvrgz8a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_190219_198814_6B3F98FA 
X-CRM114-Status: GOOD (  10.00  )
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

Hi

On 7/1/24 21:28, Emil Renner Berthing wrote:
(snip)
> Hi Naoki
> 
> Thanks for adding the other boards too. As mentioned previously [1] boards
> should not add functions to LEDs unless the hardware clearly defines a function
> for them, and nothing on these boards mention that it should be a heartbeeat.
> As you said on IRC userland can easily add whatever function they want.

on behalf of MilkV Technology, what should we do to add function to LED?

I think even if hardware clearly defines a function, you'll say userland 
can easily do it. any objections?

--
FUKAUMI Naoki
Shenzhen MilkV Technology Co., Ltd.

> 
> Also please add a cover letter when you're sending multiple patches.
> Eg. use git format-patch --cover-letter
> 
> /Emil
> 
> [1]: https://lore.kernel.org/linux-riscv/CAJM55Z_j8gWFyKvsiu-oGDV7Hacr4Amt5FdkHdjKnhZwZgxncA@mail.gmail.com/
> 
>>   };
>>
>>   &gmac0 {
>> --
>> 2.43.0
>>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
