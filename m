Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989A6C25B48
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 11:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3i/pWP3pmPnQb6NGj4CcJ8muQkVjDZLuJus5AwLbepU=; b=UtsN6TxCaAgh4/
	6sCjzCurfJx1KjxmjB7TL1MLVU+aC/n5wjRWCYXRosi6iwW7iwR8StwGv3QavRIDYi2GdyxPR80Ag
	PxjGlwCImxCebdr5t8mAqev5mXbdBBpFWLdi9yKYUBHVK2q7UQ5czNAyo9zV1N9cZ5E8MHohx6qDP
	L3Hun3jtLlTIGiCkXnSPM0GXhjwkJ2TfsfE0SjuLacT8+rTXYrwV4KGrubinHXorlsdyDQgApceyV
	XzvKd0dYPJV9Dm4GaNkgcg2RscxYNdkh1Y0PY20V5Bx/9Tz+Cet//INmh8ttcZTjIICxBSsXu0vO2
	4e8w9rHB7uNp9EGNrOqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvyPF-00ELrM-1h;
	Thu, 26 Oct 2023 11:20:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvyPB-00ELps-1m;
	Thu, 26 Oct 2023 11:20:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B8D12F4;
	Thu, 26 Oct 2023 04:20:37 -0700 (PDT)
Received: from [192.168.178.6] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CA653F738;
	Thu, 26 Oct 2023 04:19:50 -0700 (PDT)
Message-ID: <c000f7a3-caeb-4d75-8c88-40ed02950ec1@arm.com>
Date: Thu, 26 Oct 2023 13:19:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 6/6] arm64/amu: use capacity_ref_freq to set AMU ratio
Content-Language: en-US
To: Vincent Guittot <vincent.guittot@linaro.org>,
 Ionela Voinescu <ionela.voinescu@arm.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
 mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 bristot@redhat.com, vschneid@redhat.com, viresh.kumar@linaro.org,
 lenb@kernel.org, robert.moore@intel.com, lukasz.luba@arm.com,
 pierre.gondois@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
 acpica-devel@lists.linuxfoundation.org, conor.dooley@microchip.com,
 suagrfillet@gmail.com, ajones@ventanamicro.com, lftan@kernel.org
References: <20231018162540.667646-1-vincent.guittot@linaro.org>
 <20231018162540.667646-7-vincent.guittot@linaro.org>
 <ZTbebQrK3K+JwWxR@arm.com>
 <CAKfTPtA0KBE8TFifOEXddF9d_wqDjb4QUvgK8c0DTtyLrX0atA@mail.gmail.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <CAKfTPtA0KBE8TFifOEXddF9d_wqDjb4QUvgK8c0DTtyLrX0atA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_042001_638982_42EAF56A 
X-CRM114-Status: UNSURE (   8.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 24/10/2023 11:58, Vincent Guittot wrote:
> On Mon, 23 Oct 2023 at 22:58, Ionela Voinescu <ionela.voinescu@arm.com> wrote:
>>
>> Hi,
>>
>> On Wednesday 18 Oct 2023 at 18:25:40 (+0200), Vincent Guittot wrote:
>>> Use the new capacity_ref_freq to set the ratio that is used by AMU for
>>> computing the arch_scale_freq_capacity().
>>> This helps to keep everything aligned using the same reference for
>>> computing CPUs capacity.
>>>
>>> The default value of the ratio ensures that arch_scale_freq_capacity()
>>> returns max capacity until it is set to its correct value with the
>>> cpu capacity and capacity_ref_freq.

Nitpick: Could you mention that arch_max_freq_scale is the default value
for this ratio? Took me a while to recreate the (not so simple) story
for this change, i.e. make the connection between ratio and
arch_max_freq_scale.

init_cpu_capacity_callback()

  freq_inv_set_max_ratio()

    u64 ratio
    ...
    per_cpu(arch_max_freq_scale, cpu) = (unsigned long)ratio
            ^^^^^^^^^^^^^^^^^^^


static struct scale_freq_data amu_sfd = {
        .set_freq_scale = amu_scale_freq_tick,
}

#define arch_scale_freq_tick topology_scale_freq_tick

topology_scale_freq_tick()

  sfd->set_freq_scale()


amu_scale_freq_tick()

  ...
  scale *= this_cpu_read(arch_max_freq_scale)
                         ^^^^^^^^^^^^^^^^^^^
  ...
  this_cpu_write(arch_freq_scale, (unsigned long)scale);


#define arch_scale_freq_capacity topology_get_freq_scale

topology_get_freq_scale(cpu)

  return per_cpu(arch_freq_scale, cpu)

[...]


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
