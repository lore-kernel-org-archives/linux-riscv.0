Return-Path: <SRS0=t+eB=NN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A85C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 20:54:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E56CA2082E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 20:54:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TOE/8/7L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="TXXYDJXF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E56CA2082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7wvX43gxhIvgAgsMUMjYGuc66QWKAOnhEKzptm+X8CU=; b=TOE/8/7L3kM35vOSjsICJCaZU
	V0v57yZWOncvSwdV066fJ0vNFvqTldiPjJiNUE5n6Rn6YpAUFDCqHw0BP8lrmbhOYCu6muzxUvtiP
	thAcbZ19jJwR2Azj/Xd7dcwdf5ffrzaJ3OfRBZP8M5npb+A/++GA6Wi+Th6Jf6roPaV1u2m7PQPTi
	W+6P2ah4wdbVLB97J3PU+ykoMCK6LQn3jO3B9vSOg22Fq8eef9GBXETLiO4d6TUqssJxYJOwOAbn0
	TBmYgOSGK0LQkbZ39/8AmNlRKjNeHqx2thyjFN/jLR7Ahg2D4+uY6A1UXA939FFS4eLxMdH9EYXg9
	5P5vpnt3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIgSE-0000tY-4H; Fri, 02 Nov 2018 20:54:06 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIgSB-0000rR-HW
 for linux-riscv@lists.infradead.org; Fri, 02 Nov 2018 20:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1541192044; x=1572728044;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=h21NZ+6tpNhp03nxgXgjSEzvrceBjFMbjb2yIRYXHWg=;
 b=TXXYDJXFyaKhOCNJotF0NhU44q+Hw92kap5sMH19Drnk6IjVk09f0Ul+
 i35iCHCXD2jRc/R0rlwnxYgnd5mpbZVmxsuUjpNLgcNtJj+lUxizL56zt
 K87sRofxOvPScKMol9w6rFW/ENgqd6KnLXsmZGbGiHLQoRyECxM01RSLp
 jFPhPmL3KcM3OA7DZ5Vg2P28kdIrZjPqsVA1JRUep/D0EEnfts7H/qWOu
 FlretbL5xh58QQuGfxfEn4YivBRHRXLJkjujDsLvvRTwxjfVb0dxvu6KY
 2yuGf2QCyK0+oywA0NHvtOIFpAdWUh0/mss9l7OvxylqfZPxCMTROZKUf g==;
X-IronPort-AV: E=Sophos;i="5.54,457,1534780800"; d="scan'208";a="94535813"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Nov 2018 04:53:53 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 02 Nov 2018 13:37:46 -0700
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.69.187])
 ([10.111.69.187])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Nov 2018 13:53:53 -0700
Subject: Re: [RFC 1/2] dt-bindings: topology: Add RISC-V cpu topology.
To: Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh+dt@kernel.org>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <1541113468-22097-2-git-send-email-atish.patra@wdc.com>
 <CAL_Jsq+wProNynprMjQnrz1jmbZT9TmmA-_=vPUxCEED_8xONg@mail.gmail.com>
 <20181102133100.GA13130@e107155-lin>
 <CAL_JsqLO+cOcHkr41ebPtONwrzOWGhksH1ypph+tihsuOVDOug@mail.gmail.com>
 <20181102155038.GA21067@e107155-lin>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <0c94f752-cc18-ae0c-36e7-7e0dd6b1d307@wdc.com>
Date: Fri, 2 Nov 2018 13:53:51 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181102155038.GA21067@e107155-lin>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181102_135403_595100_B38C8F6A 
X-CRM114-Status: GOOD (  21.06  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 "alankao@andestech.com" <alankao@andestech.com>, Zong Li <zong@andestech.com>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181102205351.H4JMC7gH6VR2Q_3g-uf4EkKi5v4n5RlrE7N8iReQYuM@z>

On 11/2/18 8:50 AM, Sudeep Holla wrote:
> On Fri, Nov 02, 2018 at 10:11:38AM -0500, Rob Herring wrote:
>> On Fri, Nov 2, 2018 at 8:31 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
>>>
>>> On Fri, Nov 02, 2018 at 08:09:39AM -0500, Rob Herring wrote:
>>>> On Thu, Nov 1, 2018 at 6:04 PM Atish Patra <atish.patra@wdc.com> wrote:
>>>>>
>>>>> Define a RISC-V cpu topology. This is based on cpu-map in ARM world.
>>>>> But it doesn't need a separate thread node for defining SMT systems.
>>>>> Multiple cpu phandle properties can be parsed to identify the sibling
>>>>> hardware threads. Moreover, we do not have cluster concept in RISC-V.
>>>>> So package is a better word choice than cluster for RISC-V.
>>>>
>>>> There was a proposal to add package info for ARM recently. Not sure
>>>> what happened to that, but we don't need 2 different ways.
>>>>
>>>
>>> We still need that, I can brush it up and post what Lorenzo had previously
>>> proposed[1]. We want to keep both DT and ACPI CPU topology story aligned.
>>
>> Frankly, I don't care what the ACPI story is. I care whether each cpu
> 
> Sorry I meant feature parity with ACPI and didn't refer to the mechanics.
> 
>> arch does its own thing in DT or not. If a package prop works for
>> RISC-V folks and that happens to align with ACPI, then okay. Though I
>> tend to prefer a package represented as a node rather than a property
>> as I think that's more consistent.
>>
> 
> Sounds good. One of the reason for making it *optional* property is for
> backward compatibility. But we should be able to deal with that even with
> node.
> 

If you are introducing a package node, can we make cluster node 
optional? I feel it is a redundant node for use cases where one doesn't 
have a different grouped cpus in a package.

We may have some architecture that requires cluster, it can be added to 
the DT at that time, I believe.

>> Any comments on the thread aspect (whether it has ever been used)?
>> Though I think thread as a node level is more consistent with each
>> topology level being a node (same with package).
>>
> Not 100% sure, the only multi threaded core in the market I know is
> Cavium TX2 which is ACPI.
> 

Any advantages of keeping thread node if it's not being used. If I am 
not wrong, we can always use multiple cpuN phandles to represent SMT 
nodes. It will result in less code and DT documentation as well.


Regards,
Atish
> --
> Regards,
> Sudeep
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
