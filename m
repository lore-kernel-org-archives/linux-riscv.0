Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED48C04EBB
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 17:57:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A07220831
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 17:57:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VNlB3eQk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RI6+aSjU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="qb8Ij+Fm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A07220831
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dxzVO7dTQIs0ifMYVOzv77PFNcV5J4mm+TYUUUjXqoU=; b=VNlB3eQkq9cLKzm8/w21YR76W
	XRR1CB5EtoaUtl3hu6f27kWON/SUrgkCPx5j7vDU10+PO7b+D3eKCp/S9i+MCok7m/yKVvvYZzmx5
	RmCR4wBNsUt7975LupaGRfsgobWl6XnzxDFeuds0tz3iET0AHbo8PAYLyvF5HqJoPmFQ6l/5IZt5w
	g1ZAZHQhVQuYcygNtwMPVeljj+aDL1T5veHXftaSmRw+WVwP7A6jGUlSdueUFejMd+WrPXtUjThAQ
	QnUktPwwP/BQWAikVl05TWjcjf573qN+yR99BUdzrACQqKYJ/u1QQIM/AkM8rvUbZCMkGLamFkyKc
	fZv1kdcqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOno4-0007bG-Qj; Mon, 19 Nov 2018 17:57:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOnnu-0007QY-ET; Mon, 19 Nov 2018 17:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4DVQ1S2fVYM0o8/90+6xuIIUUxqQrWpwcMtOdtUTPug=; b=RI6+aSjUI/jxE3a7xx2+LjCPv0
 65+jH3yNYGRDeunoJd21bEWRFFyxOW0+XYzkEPz7Q/RdxZ3isfWroW9IS7wia5/K8C4vhCcetiFaE
 4hY7xqWk3p5eLcNAjv0LU24PhvWJtWUiymEFz9aMKAzr/qbGMEWBMmS6YG1K9zVelNG7GsSTGnQAo
 fKB3fC/UCqhyJ/sw4gvlKkYPwgmD8U1Ns42UDnejiEs3HYbJ9dIe9FMHRUBIKbHDsZlvat/Ywvoxa
 +VHIxLZyjD3N2Y//kHaTE9szgOXTfKGzBNthqJcRNSg7W98GOnNZdo0YH0cofoZrFp5OATrYmRpUY
 f6q3HDLg==;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOnnq-0007vA-OV; Mon, 19 Nov 2018 17:57:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1542650263; x=1574186263;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=vYiBfd68G62rKpPbQqXKzB2dDjgyrs+tLAKK35k4PrM=;
 b=qb8Ij+FmmrBxwjFeLY4MRF1WN8vV1DWIAH1sefxc/UALpg/85/eyd40Z
 nw25GgumNYXA7s4StJXdZLjoBWTEMUK+2TXtRSo0eTls2E/etNd/2tqrT
 V3NSkh9y5nFVPCGrAkg4/FKjg+bDxZgMqSU/tkHW7c1+2r14NFKmJ7uXW
 anSRx68fFeWUd6cry7wuolqHL/8JYjxRcnz5ZObcQnVx07GYnX8KkAI7q
 1iBp7pGyoiQ/+XZ3mX+ZzwcKZqZcNiww4LLfMCQoTlum74VPlWL4LlMYh
 J9O07wjWxSFiw57zIYdccbKfhi2fiZ4dHi1m7YtlQKBw8Kl3NtYBH5crD g==;
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; d="scan'208";a="95784702"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Nov 2018 01:57:28 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 19 Nov 2018 09:40:44 -0800
Received: from cnf003109.ad.shared (HELO [10.86.54.248]) ([10.86.54.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Nov 2018 09:57:27 -0800
Subject: Re: [RFC 1/3] dt-binding: cpu-topology: Move cpu-map to a common
 binding.
To: Rob Herring <robh@kernel.org>
References: <1541728209-3224-1-git-send-email-atish.patra@wdc.com>
 <1541728209-3224-2-git-send-email-atish.patra@wdc.com>
 <20181117163253.GA6713@bogus>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <92a4a24d-6619-876f-18df-1326914f5cc1@wdc.com>
Date: Mon, 19 Nov 2018 09:57:26 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181117163253.GA6713@bogus>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_175743_095899_9FF46073 
X-CRM114-Status: GOOD (  16.08  )
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jeremy.linton@arm.com" <jeremy.linton@arm.com>,
 "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
 "mick@ics.forth.gr" <mick@ics.forth.gr>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181119175726.agOKPxeZiZ7272NoxcyBlQ7FKSMoIB78DdVO_pq_WXw@z>

On 11/17/18 8:33 AM, Rob Herring wrote:
> On Thu, Nov 08, 2018 at 05:50:07PM -0800, Atish Patra wrote:
>> cpu-map binding can be used to described cpu topology for both
>> RISC-V & ARM. It makes more sense to move the binding to document
>> to a common place.
>>
>> The relevant discussion can be found here.
>> https://lkml.org/lkml/2018/11/6/19
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>   Documentation/devicetree/bindings/arm/topology.txt | 475 -------------------
>>   .../devicetree/bindings/cpu/cpu-topology.txt       | 526 +++++++++++++++++++++
>>   2 files changed, 526 insertions(+), 475 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/arm/topology.txt
>>   create mode 100644 Documentation/devicetree/bindings/cpu/cpu-topology.txt
> 
> Please send this with '-M' option so we just get the real changes.
> 

Sure. I will resend it.

Regards,
Atish
> Rob
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
