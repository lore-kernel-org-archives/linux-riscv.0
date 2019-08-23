Return-Path: <SRS0=dhz4=WT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_ADSP_ALL,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AEAEC3A5A2
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 23 Aug 2019 11:49:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF81121848
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 23 Aug 2019 11:49:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HkPiUDtt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="hd7ZNair"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF81121848
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WakRs+DdGgnRXTSPCqXJdSOK5iz+cO+hpNRubBUK+eY=; b=HkPiUDttTCU3/7ADt9y5mqqLf
	3TL0jhSjAkM+Iputq0Wrs5tMo+6msfRiLBuj/xSHAyfX2ZEIsu4pW3vwKwgD9lcU8RqWpA+myCieB
	Y50WNc/gm4REtQ+Xk8U1VtC6c55s9/4XcQPGW5Juyp86WX/peMwsKTZu4TulvF1Gf/akcf4f0emJ3
	CkLVbM6ecf+G3e9KK4O+ekAHf7KTRn/c4ROUhTs7GvXg1OrHnrHnRLYqLvJ15QcbzW6+CyESI9HTV
	vqczyt9U+LyywglgF0gTXRHnWgG/hQCJFcqZYuDSFxZgrwmPL6NahMWTUFuBwuEeydJbib7oUhzPh
	s5sWI8+Ug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i184S-00068b-K8; Fri, 23 Aug 2019 11:49:32 +0000
Received: from smtp-fw-6001.amazon.com ([52.95.48.154])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i184P-00067x-Mb
 for linux-riscv@lists.infradead.org; Fri, 23 Aug 2019 11:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1566560969; x=1598096969;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=WGp2zkWa2ECKauTuMBEUl0blHa+636KXTt6ESzxZ+Pk=;
 b=hd7ZNairtlPyGdwGSYNG3t2qTHh6jJaQmpTjbcLAeH/HK0J6vvVYGlUe
 HEu9hPfj2iNNAGUiXAxJJe0qhFD8RPTpoOMA8ga2l2CIH+XdNr0fOkDWx
 7n4VNJ1BrBEHoPjpiqZqojlKs3ZrBNBEkLcI2n92ZZQjNn94vDkn9zMem 8=;
X-IronPort-AV: E=Sophos;i="5.64,421,1559520000"; d="scan'208";a="411324227"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 23 Aug 2019 11:49:28 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 33B19281DB4; Fri, 23 Aug 2019 11:49:23 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 23 Aug 2019 11:49:23 +0000
Received: from 38f9d3867b82.ant.amazon.com (10.43.162.222) by
 EX13D20UWC001.ant.amazon.com (10.43.162.244) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 23 Aug 2019 11:49:19 +0000
Subject: Re: [PATCH v5 15/20] RISC-V: KVM: Add timer functionality
To: Anup Patel <anup@brainfault.org>
References: <20190822084131.114764-1-anup.patel@wdc.com>
 <20190822084131.114764-16-anup.patel@wdc.com>
 <09d74212-4fa3-d64c-5a63-d556e955b88c@amazon.com>
 <CAAhSdy36q5-x8cXM=M5S3cnE2nvCMhcsfuQayVt7jahd58HWFw@mail.gmail.com>
 <CA3A6A8A-0227-4B92-B892-86A0C7CA369E@amazon.com>
 <CAAhSdy2FFmCZJhNnMojp8QbiD-t6=4XrNtE9KGnCG_-mPb19-A@mail.gmail.com>
From: Alexander Graf <graf@amazon.com>
Message-ID: <e369eba6-e659-2892-9cb9-a631dd10153a@amazon.com>
Date: Fri, 23 Aug 2019 13:49:17 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy2FFmCZJhNnMojp8QbiD-t6=4XrNtE9KGnCG_-mPb19-A@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.43.162.222]
X-ClientProxiedBy: EX13D22UWB003.ant.amazon.com (10.43.161.76) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Precedence: Bulk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_044929_868684_C8005406 
X-CRM114-Status: GOOD (  13.02  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Radim K <rkrcmar@redhat.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 23.08.19 13:46, Anup Patel wrote:
> On Fri, Aug 23, 2019 at 5:03 PM Graf (AWS), Alexander <graf@amazon.com> wrote:
>>
>>
>>
>>> Am 23.08.2019 um 13:05 schrieb Anup Patel <anup@brainfault.org>:
>>>
>>>> On Fri, Aug 23, 2019 at 1:23 PM Alexander Graf <graf@amazon.com> wrote:
>>>>
>>>>> On 22.08.19 10:46, Anup Patel wrote:
>>>>> From: Atish Patra <atish.patra@wdc.com>
>>>>>
>>>>> The RISC-V hypervisor specification doesn't have any virtual timer
>>>>> feature.
>>>>>
>>>>> Due to this, the guest VCPU timer will be programmed via SBI calls.
>>>>> The host will use a separate hrtimer event for each guest VCPU to
>>>>> provide timer functionality. We inject a virtual timer interrupt to
>>>>> the guest VCPU whenever the guest VCPU hrtimer event expires.
>>>>>
>>>>> The following features are not supported yet and will be added in
>>>>> future:
>>>>> 1. A time offset to adjust guest time from host time
>>>>> 2. A saved next event in guest vcpu for vm migration
>>>>
>>>> Implementing these 2 bits right now should be trivial. Why wait?
>>>

[...]

>>>> ... in fact, I feel like I'm missing something obvious here. How does
>>>> the guest trigger the timer event? What is the argument it uses for that
>>>> and how does that play with the tbfreq in the earlier patch?
>>>
>>> We have SBI call inferface between Hypervisor and Guest. One of the
>>> SBI call allows Guest to program time event. The next event is specified
>>> as absolute cycles. The Guest can read time using TIME CSR which
>>> returns system timer value (@ tbfreq freqency).
>>>
>>> Guest Linux will know the tbfreq from DTB passed by QEMU/KVMTOOL
>>> and it has to be same as Host tbfreq.
>>>
>>> The TBFREQ config register visible to user-space is a read-only CONFIG
>>> register which tells user-space tools (QEMU/KVMTOOL) about Host tbfreq.
>>
>> And it's read-only because you can not trap on TB reads?
> 
> There is no TB registers.
> 
> The tbfreq can only be know through DT/ACPI kind-of HW description
> for both Host and Guest.
> 
> The KVM user-space tool needs to know TBFREQ so that it can set correct
> value in generated DT for Guest Linux.

So what access methods do get influenced by TBFREQ? If it's only the SBI 
timer, we can control the frequency, which means we can make TBFREQ 
read/write.


Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
