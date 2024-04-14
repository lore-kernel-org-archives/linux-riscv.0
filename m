Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C213C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Apr 2024 05:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rq3oR7otfoOgl4lLrY7SSj/kOm2ijwR5qRcGgV3oKCM=; b=o9i+AvNVzB1d9T
	jvPX2bah+6Jyl4odUCTD1EU6FtJ7vG2q8Rted0zxr/O6fsUIjJoivm4yqfij8s8kcJUwPTnRHNBuC
	hu8pT2s6Zw0anVpWLUqSLpSTt0mgNHTgG3HljkULr+RbtoAQ+hGg0ZmSPTgrL5S5BUcJ5PjZPjJYd
	R25WL9fExtMAGpQ4QZDikCRrqwQpIqCEAynsZW8u/nwBcjhjV4F6bW18WAMWQNaLKnBos7VrPPbRp
	DEvgc9p9L+UFr6z1dZE1OG4IhhDOuRy2hz1m1w8cww4B0mXkyZrdCAO4/g9hlpPyDnSRE/jc/TUPM
	qT18nvbbW/mkCf0mWMvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvsrG-00000004he8-1rxZ;
	Sun, 14 Apr 2024 05:56:54 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvsrB-00000004hd6-2BHf
	for linux-riscv@lists.infradead.org;
	Sun, 14 Apr 2024 05:56:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8745920002;
	Sun, 14 Apr 2024 05:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713074206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ahOKYxBn7JZUHImIDt0FCgSBhZDBBJgrqm5xrYRKkWE=;
	b=iy2qiJFmK21YvMN0hZOOobn/LeF21mvLEm6Zk3j8GVB+vYIpE1rDSCDaTkxyAWgr0kLDdi
	56z8HgTXbA0Aplo13lOU/St+OUTJ0xDHEbF5jkl+2hZlRj+CZzHjZcNcprle4idD8rV+IB
	6rcMYIsjlfThfC4W2iAqvwCf/pTwtHTbH7bWlw+XfgbNxdLOKnRmTwmiUvLr+7RdnecIYI
	EpT7JdyASLX71WhZKbv+Z5NiAj99zziCgN41YOKe7sX32IeoXaMU+C4/aLxC1LBT31I5z6
	75MeNwc3L7A98cRmcgeIJpa7qlZARUuZX3Lf2zMetTgxFBU/A3lTPOqKbcdp3w==
Message-ID: <2696c0e0-0f15-44d1-ba40-dcab4be802d2@bootlin.com>
Date: Sun, 14 Apr 2024 07:56:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v9 0/6] riscv: sophgo: add clock support for
 Sophgo CV1800/SG2000 SoCs
To: Inochi Amaoto <inochiama@outlook.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
 Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>, Liu Gui <kenneth.liu@sophgo.com>,
 Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <IA1PR20MB4953512A4DCAF293D7B1CBC2BB262@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953E5E78F930EE25A86EE1CBB052@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
In-Reply-To: <IA1PR20MB4953E5E78F930EE25A86EE1CBB052@IA1PR20MB4953.namprd20.prod.outlook.com>
X-GND-Sasl: michael.opdenacker@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_225650_069452_B2F70059 
X-CRM114-Status: UNSURE (   8.30  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Inochi

On 4/11/24 at 09:38, Inochi Amaoto wrote:
> On Sat, 9 Mar 2024 17:01:21 +0800, Inochi Amaoto wrote:
>> Add clock controller support for the Sophgo CV1800B, CV1812H and SG2000.
>>
>> Changed from v8:
>> 1. improve code.
>> 2. remove default config in Kconfig.
>> 3. merge patch 2-4 of v8 into one.
>>
>> [...]
> 
> Applied to sophgo/for-next, thanks!
> 
> [5/6] riscv: dts: sophgo: add clock generator for Sophgo CV1800 series SoC
>        https://github.com/sophgo/linux/commit/bb7b3419627eb34f3466022d1f4b3c942c09712d
> [6/6] riscv: dts: sophgo: add uart clock for Sophgo CV1800 series SoC
>        https://github.com/sophgo/linux/commit/18e8c6d2cced6c57d62813f49b57eeb8ee02f984

Oops, for your information, this last change
([6/6] riscv: dts: sophgo: add uart clock for Sophgo CV1800 series SoC) 
breaks my Milk-V Duo S board when I boot it with cv1812h-huashan-pi.dtb 
as I believe you suggested.

I don't know whether the board actually boots, but at least I don't get 
any more output in the console.

Has someone tested this on the real Huashan Pi board?

Cheers
Michael.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
