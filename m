Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75EEFC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 17:47:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B1392145D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 17:47:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dE4PnjHQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uJOYhESA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="luWa4PxW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B1392145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BrUVab6vvCFbBBPNgNJ9JAMdWfoWUyFOW1aB764UpSw=; b=dE4PnjHQjTc8iNuHAF5GhUg8D
	/ZlI7TqnKVgsXdl3YW+XufDDa6mPLHMr3tH4zreVxqXYFR20ATv2jE90fPVQfJx/hIuWCRfmYm0W3
	J3GuoDMEHMI9kaaTkSLUnrKBHIkLScyD05U+oSpPdnvGAtrMLZzDwlsWkwBcO5bxrRZfYP9t3wSA2
	pFWVH8cQ7YPzE1xlrvf8JE0+D9ORRqaQcfgEfDdsx9ayLo/gzJq0HTkacPtZeEpgz4z9LcrybVRTa
	dY6+WtIlVqyO9XT+Y/0sm9ao2xTYeoT+AgVuqtADcFzQUdYeRiA1S4jqiZ6XonAy61ouvbT6SBlKu
	5ixXzRQkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOndg-0001H6-9K
	for infradead-linux-riscv@archiver.kernel.org; Mon, 19 Nov 2018 17:47:12 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOndX-00019V-Ha; Mon, 19 Nov 2018 17:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7NYXMVGPJnCcxPd2uMjM96qYuCQjdqIpEXjrcTrJKsg=; b=uJOYhESAkC+KcYh9xScrSi6Jc4
 2zGCPxDuVXEp/oYal7bdTiJsk+AtEAs0UR9fOUWEYpx9HH9tXjaQa72AXb55xKqegp9zAD3dYRVYh
 rfkv8Nf8lo7+Rcp2CikbOq6VBraPTe9lreYoQzktx9/S97w2pM1iHaeV5c8KYuzkWOWAeu0Tywsb1
 xK91s5nTm0+Ph2SRdXd/h/Ei70ef6VudJNTu1cAqEQbtfk1M+ENcfLm/Y0rip6KOAXN3OLapkGNxG
 9J9MjNvVyk9LobPwWzVXmQl6rDeoTxu/40pkvgtjkh3BlpJIvQHiLnwHzXMTVjjE3pFHd4zCqgik4
 pFhHVA9Q==;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOndU-0003wD-PE; Mon, 19 Nov 2018 17:47:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1542649621; x=1574185621;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=zS1A7Tv4Czs1FEpfMs3Ntne1PZcf7XNMjDhuanEGfQs=;
 b=luWa4PxWysJCMn8CJrPspSb96wpa+qzfc3allBl9y4TY9FmZKFmwOGyD
 QNoXjJK2W573Dx1WY3JFKN7MhewnhYKBODE48CPJi0wZqvxHAR8Bmb1Tl
 6OIDJJ2bc43M4ILmjHuOeXZUHsvhoB8EMMqf2FatKHQ9dIIcP5SO1jsNb
 /gtLvT7CjooaZKJ6JCI6YQ1DLOuQC1yuuNiQdQ/GIzxksd9Sv137DQBAh
 J11AWqe2Ii2fyyUsygodTjo1ICB074Jy2Nm8257qD2wdWCARRbRV+VMOA
 hfYA4Pv6gLlGuhJjqaZ3vvE8s2RmOXYO8AynTRsB95+UaqhwwuaPn4mAT Q==;
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; d="scan'208";a="94619325"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Nov 2018 01:46:46 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 19 Nov 2018 09:30:02 -0800
Received: from cnf003109.ad.shared (HELO [10.86.54.248]) ([10.86.54.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Nov 2018 09:46:45 -0800
Subject: Re: [RFC 0/3] Unify CPU topology across ARM64 & RISC-V
To: Jeffrey Hugo <jhugo@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <1541728209-3224-1-git-send-email-atish.patra@wdc.com>
 <07d92dd4-f943-47ee-e168-46bfaf4ed755@codeaurora.org>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <40f24d50-eb1b-cef6-81e2-1bc9930bcbf5@wdc.com>
Date: Mon, 19 Nov 2018 09:46:44 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <07d92dd4-f943-47ee-e168-46bfaf4ed755@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_124700_992128_9BF4AA60 
X-CRM114-Status: GOOD (  26.04  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 "juri.lelli@arm.com" <juri.lelli@arm.com>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "jeremy.linton@arm.com" <jeremy.linton@arm.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
 "mick@ics.forth.gr" <mick@ics.forth.gr>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181119174644.eGZTHqA047PPRq0Hi6tdpH0OrJ9uV6QbOhgQy-la9ZM@z>

On 11/15/18 10:31 AM, Jeffrey Hugo wrote:
> On 11/8/2018 6:50 PM, Atish Patra wrote:
>> The cpu-map DT entry in ARM64 can describe the CPU topology in
>> much better way compared to other existing approaches. RISC-V can
>> easily adopt this binding to represent it's own CPU topology.
>> Thus, both cpu-map DT binding and topology parsing code can be
>> moved to a common location so that RISC-V or any other
>> architecture can leverage that.
>>
>> The relevant discussion regarding unifying cpu topology can be
>> found in [1].
>>
>> arch_topology seems to be a perfect place to move the common
>> code. I have not introduced any functional changes in the moved
>> to code. The only downside in this approach is that the capacity
>> code will be executed for RISC-V as well. But, it will exit
>> immediately after not able to find the appropriate DT node. If
>> the overhead is considered too much, we can always compile out
>> capacity related functions under a different config for the
>> architectures that do not support them.
>>
>> The patches have been tested for RISC-V and compile tested for
>> ARM64.
>>
>> The socket changes[2] can be merged on top of this series or vice
>> versa.
>>
>> [1] https://lkml.org/lkml/2018/11/6/19
>> [2] https://lkml.org/lkml/2018/11/7/918
>>
>> Atish Patra (3):
>>     dt-binding: cpu-topology: Move cpu-map to a common binding.
>>     cpu-topology: Move cpu topology code to common code.
>>     RISC-V: Parse cpu topology during boot.
>>
>>    Documentation/devicetree/bindings/arm/topology.txt | 475 -------------------
>>    .../devicetree/bindings/cpu/cpu-topology.txt       | 526 +++++++++++++++++++++
>>    arch/arm64/include/asm/topology.h                  |  23 +-
>>    arch/arm64/kernel/topology.c                       | 305 +-----------
>>    arch/riscv/Kconfig                                 |   1 +
>>    arch/riscv/kernel/smpboot.c                        |   6 +-
>>    drivers/base/arch_topology.c                       | 303 ++++++++++++
>>    include/linux/arch_topology.h                      |  23 +
>>    include/linux/topology.h                           |   1 +
>>    9 files changed, 864 insertions(+), 799 deletions(-)
>>    delete mode 100644 Documentation/devicetree/bindings/arm/topology.txt
>>    create mode 100644 Documentation/devicetree/bindings/cpu/cpu-topology.txt
>>
> 
> I was interested in testing these on QDF2400, an ARM64 platform, since
> this series touches core ARM64 code and I'd hate to see a regression.
> However, I can't figure out what baseline to use to apply these.
> Different patches cause different conflicts of a variety of baselines I
> attempted.
> 
> What are these intended to apply to?
> 
I had rebased them on top of 4.20-rc1.

> Also, you might want to run them through checkpatch next time.  There
> are several whitespace errors.
> 
Sorry I missed couple of them.
Thanks for trying to test the patches. I will send a next version as Rob 
suggested. Please test that.


Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
