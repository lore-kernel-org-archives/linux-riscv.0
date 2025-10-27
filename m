Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E59CCF9E9
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 01:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UvGLyan7oMDbrLd+HH7/h0XT52oMlIhxDTGS5ZbOS5U=; b=K1Tk7OCuMo7RKT
	eMHp7FwByxCXF3wq8DT05A9mt60bzdwltbg/4O4GgqlZjO1R4WF07jj3yCqOQEIYJS+ppPJb8PKQn
	S3cSAAmm9Qhz8uorvTf1nTbIpjPtjDTnQoLyBpQWlwv13uuHBHW3M7CsG5omTs/WMw1g0+TfusoB0
	/QUT5R0AhsgebB5Ol2kqva8xf+yHQDeeU1sUNCLNyt+EXOaUXYxlCVQHIlxvOzylBG3Qm8hnEaxKX
	GC2uN5VWp1f5mg8zT0bXeLITx499N3vwcd8dI5ZzIB848S+MF/cL+V/jOhqWxy8Vec+r3vhxQ3DlL
	JiWD/PfIDiRIIu6VE9nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDCD8-0000000Cxg7-3F2p;
	Mon, 27 Oct 2025 01:39:50 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDCD6-0000000Cxfh-0Xnt
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 01:39:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761529176; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=I1To7CQ/N9w65YjOf4u0X+eyxsyw8XxE6qSgTzz2kMc2i6d6hbkXFJhfnlfS02L/aYGX2PivK41MIeeOl60IRdBhEydgJRq8HTTKhy6wfBQTEFuHdOBapcz1J7vKiECna8FQJ95C3jJwakyeRZPNJ/kZAqzBLUtVkmKd3hchCqM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761529176; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JoGIXRFcAng7DM+SqkhKz/acJkJyRWeHRK0Hc2jgQto=; 
	b=aBPPCjDPxXAeuPupkg5noJartf1AgACcmGtlAn3fIBpgoX1xEHN3FaEZtT3EjJxSPtTt/gqF6/n7I3wUnwAgoThoRxTKau0Hp8JLTMUT3jciB8rtLW59sAsIAB2fmegqsKo2As4xma016PSuq/hr3Wox8134ehnRjfguF8+DXWI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761529176;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=JoGIXRFcAng7DM+SqkhKz/acJkJyRWeHRK0Hc2jgQto=;
	b=fwssSO/0UmKwpLR5wHtQKh++2OabRrMc2Ts5aM6FcEwkyjt2Xwfnwhjlm8uPo84a
	mFmuDEdcPjDejWNHcD88lNIsQw8ZgwIN+yH7IKoHWXVM0BUKUfQKvhdBN9wsqbk2KWj
	gQIz6+YmomITZUGyjlztFJvDDFZg64rpw+A9Py9w=
Received: by mx.zohomail.com with SMTPS id 1761529174228823.0757477108508;
	Sun, 26 Oct 2025 18:39:34 -0700 (PDT)
Message-ID: <1bceed11-e7d2-4d10-93fc-b40c6e102bc5@pigmoral.tech>
Date: Mon, 27 Oct 2025 09:39:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] clk/reset: anlogic: add support for DR1V90 SoC
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20251026-dr1v90-cru-v2-0-43b67acd6ddd@pigmoral.tech>
 <0E60AA15166FED21+aP7JRmPzDIq2WhWw@kernel.org>
From: Junhui Liu <junhui.liu@pigmoral.tech>
In-Reply-To: <0E60AA15166FED21+aP7JRmPzDIq2WhWw@kernel.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_183948_547886_171B064A 
X-CRM114-Status: GOOD (  15.93  )
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

Hi Troy,

On 10/27/25 9:22 AM, Troy Mitchell wrote:
> On Sun, Oct 26, 2025 at 10:00:40PM +0800, Junhui Liu wrote:
>> This adds Clock and Reset Unit (CRU) support for the Anlogic DR1V90 SoC,
>> as well as corresponding dts bindings and dts integration.
>>
>> The CRU driver framework is built around the clock controller as the
>> primary device, with the reset controller implemented as an auxiliary
>> device. The clock part refers to the vendor's code [1] to determine the
>> structure of the clock tree.
>>
>> The Anlogic DR1 series includes not only the DR1V90 (based on the Nuclei
>> UX900 RISC-V core), but also the DR1M90 (based on the Cortex-A35 ARM64
>> core). Most of the clock tree and CRU design can be shared between them.
>> This series only adds CRU support for DR1V90. Nevertheless, the driver
>> is structured to make future extension to other DR1 variants like
>> DR1M90.
>>
>> This depends on the basic dt series for DR1V90 SoC [2].
>>
>> Link: https://gitee.com/anlogic/linux/blob/anlogic-6.1.54/drivers/clk/anlogic/anl_dr1x90_crp.c [1]
>> Link: https://lore.kernel.org/all/20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech/ [2]
>> ---
> Do we really need a cover-letter? Since you only have one patch, Is it
> better to put the above information below the --- line in the actual patch?

Yes, we do need a cover letter since there are 6 patches in this series.
I think the b4 tool only added you to the To list in patch 0 and 1 because
you gave a Reviewed-by to patch 1 in v1. You can check the full patch
series from the mailing list [1]. Thanks.

[1] 
https://lore.kernel.org/all/20251026-dr1v90-cru-v2-0-43b67acd6ddd@pigmoral.tech

>
>                                        - Troy

-- 
Best regards,
Junhui Liu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
