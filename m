Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D4AC10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 21:52:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A285D2186A
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 21:52:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XaXbxEKp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="iOwaAnI7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A285D2186A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uOItINJ6jeSxFkdODVIZ3pSiUOhvOyqmWXQSFNZnZeo=; b=XaXbxEKpK2vgvNEKy7f+hxKZ4
	gGaynfV9mYe++6RUPWwYucxgEnnPwfC9FNLoIUWIGiG9vsK/NXOdZdGG/fEIirhW0mm/cmXX7IjXT
	86gLQ3SKOoBBu15cfgRAnbCie7IWKkMKPSOec29HH0LLtlBZFiE+q2CYimLdK4guB9v5QpSAchakf
	0xk3i3zfYdyenMVyWolpCA38iW0CTZjXQMe4QMXlSwsDzEmmwkogSnw2anzf2IJJvQNKc1i0Nn220
	cfBye3bFbOTi68Duglz3B7g/vyL/qHCEGHHluONsLaQ4HLccQwT2C5mIOkOGXZyIO4IqnwqJl69ja
	5uSfOgeAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEhcR-0000vU-UV; Thu, 11 Apr 2019 21:52:27 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEhcO-0000v9-IL
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 21:52:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555019589; x=1586555589;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ilspfxUHJKcoo3sL9+0K8u6s2ce0sqEfsxwX6p5DqYo=;
 b=iOwaAnI7jFGx4A7eeqCs/+x4zH2VoRsO7Y2Gwt3lRyikdPyA+8heZCWw
 kmgS1wQN16DTejAWfdQlgrw99E9xixlI8tFkUbjmfnm06MnDU+fBDnah2
 cRlwt+w/2DiHt6F92qRugWaLOadQbERWyZq2FnwG2gTjIRrRKkb1UcCwQ
 HOX6qp8bmNNXKmK0g2lmmnfq1de88x746g2mZbAyCd2W1GkyPs8QUPXDq
 V7xawNNjBqR4fOqxY/ooLDFHhzlJWL+sn139596Bz/kJc3Cleo4Nz5dcM
 5USueCvbb8ELQQpOcN93QOusSlFN6+o0n0YDUKHDGFDxc/4kxvt2OMN45 Q==;
X-IronPort-AV: E=Sophos;i="5.60,338,1549900800"; d="scan'208";a="204596613"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Apr 2019 05:53:08 +0800
IronPort-SDR: YeUv8J6czWn0yPlgPEs6949F6VGqQO6H8Sn34E8xu7o+zM/iJ5WHLiAcZ3AXvUPznxOlnRcjJp
 1gy47NasixU288H98WzcRndG2pPs/ivvlEca3yVpEeVYzppXHeJ/U80Un/RqbEN+aigBGDYT3I
 CMT0WKpuc9kbhIxlJQLIJWRwjUR/7sqAGqU0meFXomVVMlZzVX4NVab7NmvpT7qerOLzT2JnRd
 tRJiHSHKicAGRioeQ8Vuic/I7Q8Eq6RiCau7a9Wtp4HOxnyMhlmyOl/vGF20ideyO4WERrknQ5
 RdkF5UiYBWCy7mJQ5eDaTCMV
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 11 Apr 2019 14:31:24 -0700
IronPort-SDR: mlk5eErLAOCUZGN+IRjlNKCz8j2zAdKDBGCygi4RdMre8e99ja9Gd541fsaqmrlOzrkavfte9T
 s0nTr6Q6z0gVyKEjvJ4OlmJSqrLDYJ2lFzQ3+x2vsvBtLThfBUMWwp0GG8piU01MPhKXD+aidl
 oilvUtv0O3JSrt8whRKKvDdl9/0FBLsitzxaG46ImNMT/LGkkA/ItAM6hFMGcYven/LrxO5zd5
 CBWsFS2JypM6p6e/o2qnKbCtXZxvVBmgEQOHVPXLpZYDAquSd+kxIa+wOqrWvcu08tGdqPmJl/
 +zY=
Received: from usa001883.ad.shared (HELO [10.86.51.17]) ([10.86.51.17])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 Apr 2019 14:52:23 -0700
Subject: Re: [PATCH 1/6] arch: riscv: add support for building DTB files from
 DT source data
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Christoph Hellwig <hch@infradead.org>
References: <20190411084304.5072-2-paul.walmsley@sifive.com>
 <20190411114616.GA10032@infradead.org>
 <alpine.DEB.2.21.9999.1904111405470.19990@viisi.sifive.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <3cf7f2d8-3039-7dd7-e243-77433b1f23a6@wdc.com>
Date: Thu, 11 Apr 2019 14:52:22 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.9999.1904111405470.19990@viisi.sifive.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_145224_653794_7886B350 
X-CRM114-Status: GOOD (  19.53  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/11/19 2:12 PM, Paul Walmsley wrote:
> On Thu, 11 Apr 2019, Christoph Hellwig wrote:
> 
>> On Thu, Apr 11, 2019 at 01:42:59AM -0700, Paul Walmsley wrote:
>>> Similar to ARM64, add support for building DTB files from DT source
>>> data for RISC-V boards.
>>>
>>> This patch starts with the infrastructure needed for SiFive boards.
>>> Boards from other vendors would add support here in a similar form.
>>
>> What do we build it for?  We'd really need something like this:
>>
>> http://git.infradead.org/users/hch/misc.git/commitdiff/d6242aa147baf57e05e2932199c74d8d24b9926e
>> http://git.infradead.org/users/hch/misc.git/commitdiff/0cd5413c8094ab57b68e0629dacfed695f4c1ef1
>>
>> To actually use the DT files.
> 
> Those patches might be useful - I have not reviewed them closely - but
> they are not necessary.
> 
> The FSBL already supplies a DTB to Linux.  I assume the U-boot port works
> the same way.
> 

I am bit confused here. I thought the idea behind putting the the DTS in 
kernel so that Kernel don't need to depend on DT passed from boot 
loaders. Currently, DTB passed from FSBL is modified by OpenSBI/BBL 
before passing to U-Boot or Linux.

If Linux kernel can boot from the DTS contained within its source code 
as is, that would be much more helpful.

> I haven't switched to U-boot yet for these driver tests, so I personally
> have been using the open-source FSBL (freedom-u540-c000-bootloader) with
> the following trivial patches applied:
> 
> https://github.com/sifive/freedom-u540-c000-bootloader/tree/dev/paulw/supply-fsbl-dtb-v5.1-rc4
>


> The fsbl/ux00_fsbl.dtb file can be symlinked to the kernel DTB output,
> e.g., ~/linux/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dtb.
> 
> 

This assumes that FSBL has to be rebuilt every time I want to change the 
DT. I was hoping to avoid that.

Regards,
Atish

> - Paul
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
