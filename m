Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1E4C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 06:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lp8sjQToNalFLPj2icO83Q+OTsBzaFBnkJ672zlWRkA=; b=dr6T7i9tzSpJV2
	C2b0QnaayIqd3kh/V6z2FB2k+aDeAgSXzR+MTv23XxaR2P+QGxc8F+5XmNgS2PYg4xIInRTnG+Etl
	O1/7tb7VC0r/GZfFFkimuTJD0cOLI1RhlVOI5p50FAz88itGREVR4g0nXRSUOByfJJsC6osLZBxmL
	FfYR7T58NJ0SZFe6KYhX0P9VjJvW4akqWXWZlPH31int18KvdHGXf7e8MUwE1fpY6Ao8tfpRODmfX
	dmS5hpAZqrhFpL1DRCB+kFZ/Y9PE03E2njFPlyvj+VpJGuoR3lYfU4P9HM0/87ivPqDkK2KzesYjR
	G4QVEFM6iu0qCunb68Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nweZw-001ogx-7U; Thu, 02 Jun 2022 06:45:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nweZJ-001o9Q-0N
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 06:44:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654152267;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VoyA/L0tlcMVaTBmlf7Z/ZHtCkE4mBDsIVQpvWHfbKo=;
	b=Ba3jGQ55AXirMh/YdaBdm7d/X3j9jwFByIRRYdM3m1HyoM7tuNJJdRXnZOhqyHQ+2uqXPB
	F407Ecn0Vx8GyNQD5VJcT13yAf8Tw50kizyRNQjZrv90mBgxyrOzBbrQY5FAnPuv9Oh/hQ
	bhukwfNlyOtl+9FSyIVgEXheffI6+vo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-Gb2az9dsP8-kaBxZr050Yw-1; Thu, 02 Jun 2022 02:44:14 -0400
X-MC-Unique: Gb2az9dsP8-kaBxZr050Yw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76CE11C006B1;
	Thu,  2 Jun 2022 06:44:13 +0000 (UTC)
Received: from [10.72.12.91] (ovpn-12-91.pek2.redhat.com [10.72.12.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8DC87AD8;
	Thu,  2 Jun 2022 06:44:07 +0000 (UTC)
Subject: Re: [PATCH v3 09/16] arch_topology: Drop LLC identifier stash from
 the CPU topology
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>,
 Atish Patra <atishp@rivosinc.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Qing Wang <wangqing@vivo.com>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>
References: <20220525081416.3306043-2-sudeep.holla@arm.com>
 <20220525081416.3306043-3-sudeep.holla@arm.com>
 <20220525081416.3306043-4-sudeep.holla@arm.com>
 <20220525081416.3306043-5-sudeep.holla@arm.com>
 <20220525081416.3306043-6-sudeep.holla@arm.com>
 <20220525081416.3306043-7-sudeep.holla@arm.com>
 <20220525081416.3306043-8-sudeep.holla@arm.com>
 <20220525081416.3306043-9-sudeep.holla@arm.com>
 <20220525081416.3306043-10-sudeep.holla@arm.com>
 <3860bfcc-a323-c031-0fdd-77001d338bec@redhat.com>
 <20220601120658.2x737nhyxmodoo7t@bogus>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <fab8ce3b-2c56-862e-afcd-9f05594c6044@redhat.com>
Date: Thu, 2 Jun 2022 14:44:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220601120658.2x737nhyxmodoo7t@bogus>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_234429_168281_3CDD8773 
X-CRM114-Status: GOOD (  19.40  )
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
Reply-To: Gavin Shan <gshan@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Sudeep,

On 6/1/22 8:06 PM, Sudeep Holla wrote:
> On Wed, Jun 01, 2022 at 11:35:20AM +0800, Gavin Shan wrote:
>> On 5/25/22 4:14 PM, Sudeep Holla wrote:
>>> Since the cacheinfo LLC information is used directly in arch_topology,
>>> there is no need to parse and store the LLC ID information only for
>>> ACPI systems in the CPU topology.
>>>
>>> Remove the redundant LLC ID from the generic CPU arch_topology information.
>>>
>>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>>> ---
>>>    drivers/base/arch_topology.c  | 1 -
>>>    include/linux/arch_topology.h | 1 -
>>>    2 files changed, 2 deletions(-)
>>>
>>
>> How about merge the changes to PATCH[08/16]? I don't see why we need put
>> the changes into separate patches.
>>
> 
> It took a while to remember as I was with the same opinion as yours but
> decided to split them for one reason: to keep arch specific change in a
> separate patch(if that becomes a need due to some conflict or some other
> non-technical reason)
> 

Ok. Thanks for the explanation, which sounds reasonable to me.

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
