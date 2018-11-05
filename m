Return-Path: <SRS0=E0x1=NQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C32BC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 20:19:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54C4620819
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 20:19:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DU0llKNn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="lGVOY4RK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54C4620819
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=C2gOVqbedHuKKLijrUQXv0q4vrQulcCuQy+kCqCt688=; b=DU0llKNn+1RBawnaibU+jRHQU
	VHWGG+57iHHDgTDZA2wx8Op1Icuq60L/s57OysOygab1O5MgEac1CySApLmExr5igKN99HbWNu2w4
	JLbNTJ0AO8/SumKXaVVBGeOZ1iNSIqqqtN8WwqAfBnCbwjzgDwrXie6WNSSO2WKT6x+wDnr+sdQm9
	Iy3RtBNC5LJYuV1+LDKt6xaJXpoGrFBqQTZycvjU5gSE4UPdg32WPEj7dMV0q5PSzr2hF4pxSi09Y
	JpBAQG2GvYG4DRcORyHaZPGDvmvBf+sTHm+XkekjmnG3WPgXMyxaZ6YVhjZiM31VGIOS2XcqLZdHr
	euz9VABiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJlLH-0003rD-E0; Mon, 05 Nov 2018 20:19:23 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJkih-0008Au-8G
 for linux-riscv@lists.infradead.org; Mon, 05 Nov 2018 19:41:03 +0000
Received: by mail-pg1-x543.google.com with SMTP id w7so4663197pgp.13
 for <linux-riscv@lists.infradead.org>; Mon, 05 Nov 2018 11:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=qj/9dIqNEHYfnb/N1l0z7V3k6z6oAg5R+Y6p2XF246c=;
 b=lGVOY4RK6BPeffXxm4VI+TxIpJMexN+jXq/GiDxZl1UGfqzX3AW145CKgDbSqnTG2r
 9gQhyIV/W6do2xJl2Vgd3++36V8MGAvXpjGyh2mNgP0hMrQ7UMez6HIMWhHsBfGoaV8P
 HSAM8TcVFiQgeauSTmDzAqjxfzcp+4v/LpsNfLCh9eYjplz7naLasNGNMVY+1PNqO+2g
 J/yAsGuAQLolBSMYUSPtn37vTmaymjo2HE94bE2dStD8xm4jvm0UBwDE72a9TFTFDTZj
 +PFmvNEKFj+Js6BbiJd6jExd1ktb/UGV4FUrmfc1B0dY+ElUluSv/UQA9KcbuoW1B3Ms
 IYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=qj/9dIqNEHYfnb/N1l0z7V3k6z6oAg5R+Y6p2XF246c=;
 b=lY82cf46PsKqtHop2Bv4RltB7A099RRk+BXFC0xuYC2vkqHQ5z7JKPDUXZk0K3Sel1
 SPC5AlPbwOwqeuV1aJZ8sKKsTNcQsNcDdEpjshfDp6KAg6h1YPtw5x4QwLAXTq70fELs
 ZWwXgn5cRN8YRev90YX0dXTZVHPiXP2K+8lcvDD5Vn8dWf1cO+HVQb1pgcaAB+Hn8rUi
 PjQnDs032G4SLchiOpPG2okTaEr/UB/JcjTpxWs7BUEx9IGTTLWUzYNf6Q4mKIQkk8Hw
 CoEw/WnRYfOWjlO5uF9ryvlBNS29b96f3xFkTVyZF3z6eJ4raziBa4UTc/amljnOjth4
 JwNA==
X-Gm-Message-State: AGRZ1gLd94sP2OZhVx8f/Mp8rl+PyLseIvgyAc9MAjvzdESclwbAsDgO
 s73j1QVAlmzrcTKMngJZUCxITw==
X-Google-Smtp-Source: AJdET5eDsq7jVFyX+9Li09cYTtzBVDcgn4yhhDBElA6therplP3ECsnN3Y6iMCGo9x5lm3NPYRePRQ==
X-Received: by 2002:a63:4c6:: with SMTP id 189mr21472530pge.391.1541446721073; 
 Mon, 05 Nov 2018 11:38:41 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id x14-v6sm67470373pfe.178.2018.11.05.11.38.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Nov 2018 11:38:40 -0800 (PST)
Date: Mon, 05 Nov 2018 11:38:40 -0800 (PST)
X-Google-Original-Date: Mon, 05 Nov 2018 11:36:29 PST (-0800)
Subject: Re: [RFC 1/2] dt-bindings: topology: Add RISC-V cpu topology.
In-Reply-To: <CAL_Jsq+wProNynprMjQnrz1jmbZT9TmmA-_=vPUxCEED_8xONg@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: robh+dt@kernel.org
Message-ID: <mhng-799bd6f4-e4af-481e-90d8-bdc0e30f2530@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181105_114009_641579_6ECD2D24 
X-CRM114-Status: GOOD (  26.34  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Damien.LeMoal@wdc.com,
 alankao@andestech.com, zong@andestech.com, anup@brainfault.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 atish.patra@wdc.com, linux-riscv@lists.infradead.org, tglx@linutronix.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181105193840.oZ5ZZpFojzQibhi1tJR9oXOZud-d3rLkvBX1goQg9l4@z>

On Fri, 02 Nov 2018 06:09:39 PDT (-0700), robh+dt@kernel.org wrote:
> On Thu, Nov 1, 2018 at 6:04 PM Atish Patra <atish.patra@wdc.com> wrote:
>>
>> Define a RISC-V cpu topology. This is based on cpu-map in ARM world.
>> But it doesn't need a separate thread node for defining SMT systems.
>> Multiple cpu phandle properties can be parsed to identify the sibling
>> hardware threads. Moreover, we do not have cluster concept in RISC-V.
>> So package is a better word choice than cluster for RISC-V.
>
> There was a proposal to add package info for ARM recently. Not sure
> what happened to that, but we don't need 2 different ways.
>
> There's never going to be clusters for RISC-V? What prevents that?
> Seems shortsighted to me.
>
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>  .../devicetree/bindings/riscv/topology.txt         | 154 +++++++++++++++++++++
>>  1 file changed, 154 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/riscv/topology.txt
>>
>> diff --git a/Documentation/devicetree/bindings/riscv/topology.txt b/Documentation/devicetree/bindings/riscv/topology.txt
>> new file mode 100644
>> index 00000000..96039ed3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/riscv/topology.txt
>> @@ -0,0 +1,154 @@
>> +===========================================
>> +RISC-V cpu topology binding description
>> +===========================================
>> +
>> +===========================================
>> +1 - Introduction
>> +===========================================
>> +
>> +In a RISC-V system, the hierarchy of CPUs can be defined through following nodes that
>> +are used to describe the layout of physical CPUs in the system:
>> +
>> +- packages
>> +- core
>> +
>> +The cpu nodes (bindings defined in [1]) represent the devices that
>> +correspond to physical CPUs and are to be mapped to the hierarchy levels.
>> +Simultaneous multi-threading (SMT) systems can also represent their topology
>> +by defining multiple cpu phandles inside core node. The details are explained
>> +in paragraph 3.
>
> I don't see a reason to do this differently than ARM. That said, I
> don't think the thread part is in use on ARM, so it could possibly be
> changed.
>
>> +
>> +The remainder of this document provides the topology bindings for ARM, based
>
> for ARM?
>
>> +on the Devicetree Specification, available from:
>> +
>> +https://www.devicetree.org/specifications/
>> +
>> +If not stated otherwise, whenever a reference to a cpu node phandle is made its
>> +value must point to a cpu node compliant with the cpu node bindings as
>> +documented in [1].
>> +A topology description containing phandles to cpu nodes that are not compliant
>> +with bindings standardized in [1] is therefore considered invalid.
>> +
>> +This cpu topology binding description is mostly based on the topology defined
>> +in ARM [2].
>> +===========================================
>> +2 - cpu-topology node
>
> cpu-map. Why change this?
>
> What I would like to see is the ARM topology binding reworked to be
> common or some good reasons why it doesn't work for RISC-V as-is.

I think it would be great if CPU topologies were not a RISC-V specific thing.  
We don't really do anything different than anyone else, so it'd be great if we 
could all share the same spec and code.  Looking quickly at the ARM cpu-map 
bindings, I don't see any reason why we can't just use the same thing on RISC-V 
-- it's not quite how I'd do it, but I don't think the differences are worth 
having another implementation.  Mechanically I'm not sure how to do this: 
should there just be a "Documentation/devicetree/bindings/cpu-map.txt"?

If everyone is OK with that then I vote we just go ahead and genericise the ARM 
"cpu-map" stuff for CPU topology.  Sharing the implementation looks fairly 
straight-forward as well.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
