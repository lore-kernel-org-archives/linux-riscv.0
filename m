Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC9AC19F2D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 08:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rs/k+LbSsX3Jw6T4Ht45xdzI9RBj9I5MWuSn8kDbyk4=; b=cDeu2epGCQSk//
	SpMMDOyky4THg9vb8oqRjMfNUDZpU5wMOS4ms9qgyH2xF1U80dTPJYUs4EH8sx++V5fj50NjUDHlA
	Gl64x4gRghzZS/4GESXDW3Bgt878q4ErPVf2eXXPjdJO5+Ya9rlt7oZdzI5TPQGBRmGDcy2Gug+SY
	94UBy39Mn8CTbRfwKq8NNDubuVg6e2sUUp+S6v3HA8CHjo0mvkIMysxzGaJ2Ep/855ZLICqdxy+fo
	ErWs5Psf0M2qHz7kW3BtJnX7GJCZ3F3jB52brl/rrBQqa9a4Qtb6P9yEcRtzNINDeYC0JOOlpQhPX
	C4t8SRLoH6wEeD8i15Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM3TW-00ALon-Hc; Thu, 11 Aug 2022 08:23:30 +0000
Received: from forward105j.mail.yandex.net ([2a02:6b8:0:801:2::108])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM3TR-00ALld-9j
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 08:23:28 +0000
Received: from forward502j.mail.yandex.net (forward502j.mail.yandex.net [IPv6:2a02:6b8:0:801:2::112])
	by forward105j.mail.yandex.net (Yandex) with ESMTP id 3CBEA4EC8E7E;
	Thu, 11 Aug 2022 11:23:17 +0300 (MSK)
Received: from myt5-ca5ec8faf378.qloud-c.yandex.net (myt5-ca5ec8faf378.qloud-c.yandex.net [IPv6:2a02:6b8:c12:2514:0:640:ca5e:c8fa])
	by forward502j.mail.yandex.net (Yandex) with ESMTP id 58CA91121660;
	Thu, 11 Aug 2022 11:23:11 +0300 (MSK)
Received: by myt5-ca5ec8faf378.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id IswyNOuXR0-N5iW18LY;
	Thu, 11 Aug 2022 11:23:09 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1660206190;
	bh=rZvkAnRgFuIGmVLfU2EdMsDzDf3zUw3Dpp3B3RWQkLs=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=AwaIkaEaQ71adi5y5BQN9OMuCdVOjMG9Cen7fgwsTpmrHbLWzmNrDfVCstj3YFeSC
	 MHwkImLJGpXQlu7snsqzAfiMSrCb2fxSsQsIegLrfMhdedrXdmou7Kvxw/ypCmNKPg
	 Fapj2UPvckyaxZ4gxyfzraG0lBchocNsQO2oDdjk=
Authentication-Results: myt5-ca5ec8faf378.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Date: Thu, 11 Aug 2022 11:23:03 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux@yadro.com, Genevieve Chan <genevieve.chan@starfivetech.com>,
 =?UTF-8?B?Sm/Do28gTcOhcmlv?= Domingos <joao.mario@tecnico.ulisboa.pt>,
 Nikita Shubin <n.shubin@yadro.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, Kautuk
 Consul <kconsul@ventanamicro.com>
Subject: Re: [PATCH v5] perf arch events: riscv sbi firmware std event files
Message-ID: <20220811112303.4e5f0566@redslave.neermore.group>
In-Reply-To: <18c8e9c74955c08fdbd631a35c51b30f3cff3cd3.camel@ventanamicro.com>
References: <20220628114625.166665-1-nikita.shubin@maquefel.me>
	<20220628114625.166665-4-nikita.shubin@maquefel.me>
	<18c8e9c74955c08fdbd631a35c51b30f3cff3cd3.camel@ventanamicro.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_012326_275967_3E442EA1 
X-CRM114-Status: GOOD (  24.06  )
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

Hello Mayuresh!

On Wed, 10 Aug 2022 20:26:18 +0530
Mayuresh Chitale <mchitale@ventanamicro.com> wrote:

> On Tue, 2022-06-28 at 14:45 +0300, Nikita Shubin wrote:
> > From: Nikita Shubin <n.shubin@yadro.com>
> > 
> > Firmware events are defined by "RISC-V Supervisor Binary Interface
> > Specification", which means they should be always available as long
> > as
> > firmware supports >= 0.3.0 SBI.
> > 
> > Expose them to arch std events, so they can be reused by particular
> > PMU bindings.
> > 
> > Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> > ---
> > v4->v5:
> > - changed EventCode to ConfigCode, as 63 bit exceeds event code
> > format
> > ---
> >  .../arch/riscv/riscv-sbi-firmware.json        | 134
> > ++++++++++++++++++
> >  1 file changed, 134 insertions(+)
> >  create mode 100644 tools/perf/pmu-events/arch/riscv/riscv-sbi-
> > firmware.json
> > 
> > diff --git
> > a/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
> > b/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json new file
> > mode 100644 index 000000000000..b9d305f1ada8
> > --- /dev/null
> > +++ b/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
> > @@ -0,0 +1,134 @@
> > +[
> > +  {
> > +    "PublicDescription": "Misaligned load trap",
> > +    "ConfigCode": "0x8000000000000000",
> > +    "EventName": "FW_MISALIGNED_LOAD",
> > +    "BriefDescription": "Misaligned load trap event"
> > +  },
> > +  {
> > +    "PublicDescription": "Misaligned store trap",
> > +    "ConfigCode": "0x8000000000000001",
> > +    "EventName": "FW_MISALIGNED_STORE",
> > +    "BriefDescription": "Misaligned store trap event"
> > +  },
> > +  {
> > +    "PublicDescription": "Load access trap",
> > +    "ConfigCode": "0x8000000000000002",
> > +    "EventName": "FW_ACCESS_LOAD",
> > +    "BriefDescription": "Load access trap event"
> > +  },
> > +  {
> > +    "PublicDescription": "Store access trap",
> > +    "ConfigCode": "0x8000000000000003",
> > +    "EventName": "FW_ACCESS_STORE",
> > +    "BriefDescription": "Store access trap event"
> > +  },
> > +  {
> > +    "PublicDescription": "Illegal instruction trap",
> > +    "ConfigCode": "0x8000000000000004",
> > +    "EventName": "FW_ILLEGAL_INSN",
> > +    "BriefDescription": "Illegal instruction trap event"
> > +  },
> > +  {
> > +    "PublicDescription": "Set timer event",
> > +    "ConfigCode": "0x8000000000000005",
> > +    "EventName": "FW_SET_TIMER",
> > +    "BriefDescription": "Set timer event"
> > +  },
> > +  {
> > +    "PublicDescription": "Sent IPI to other HART event",
> > +    "ConfigCode": "0x8000000000000006",
> > +    "EventName": "FW_IPI_SENT",
> > +    "BriefDescription": "Sent IPI to other HART event"
> > +  },
> > +  {
> > +    "PublicDescription": "Received IPI from other HART event",
> > +    "ConfigCode": "0x8000000000000007",
> > +    "EventName": "FW_IPI_RECEIVED",
> > +    "BriefDescription": "Received IPI from other HART event"
> > +  },
> > +  {
> > +    "PublicDescription": "Sent FENCE.I request to other HART
> > event",
> > +    "ConfigCode": "0x8000000000000008",
> > +    "EventName": "FW_FENCE_I_SENT",
> > +    "BriefDescription": "Sent FENCE.I request to other HART event"
> > +  },
> > +  {
> > +    "PublicDescription": "Received FENCE.I request from other HART
> > event",
> > +    "ConfigCode": "0x8000000000000009",
> > +    "EventName": "FW_FENCE_I_RECEIVED",
> > +    "BriefDescription": "Received FENCE.I request from other HART
> > event"
> > +  },
> > +  {
> > +    "PublicDescription": "Sent SFENCE.VMA request to other HART
> > event",
> > +    "ConfigCode": "0x80000000000000a",
> > +    "EventName": "FW_SFENCE_VMA_SENT",
> > +    "BriefDescription": "Sent SFENCE.VMA request to other HART
> > event"
> > +  },
> > +  {
> > +    "PublicDescription": "Received SFENCE.VMA request from other
> > HART event",
> > +    "ConfigCode": "0x800000000000000b",
> > +    "EventName": "FW_SFENCE_VMA_RECEIVED",
> > +    "BriefDescription": "Received SFENCE.VMA request from other
> > HART event"
> > +  },
> > +  {
> > +    "PublicDescription": "Sent SFENCE.VMA with ASID request to
> > other HART event",
> > +    "ConfigCode": "0x800000000000000c",
> > +    "EventName": "FW_SFENCE_VMA_RECEIVED",
> > +    "BriefDescription": "Sent SFENCE.VMA with ASID request to other
> > HART event"
> > +  },
> > +  {
> > +    "PublicDescription": "Received SFENCE.VMA with ASID request
> > from other HART event",
> > +    "ConfigCode": "0x800000000000000d",
> > +    "EventName": "FW_SFENCE_VMA_ASID_RECEIVED",
> > +    "BriefDescription": "Received SFENCE.VMA with ASID request from
> > other HART event"
> > +  },
> > +  {
> > +    "PublicDescription": "Sent HFENCE.GVMA request to other HART
> > event",
> > +    "ConfigCode": "0x800000000000000e",
> > +    "EventName": "FW_HFENCE_GVMA_SENT",
> > +    "BriefDescription": "Sent HFENCE.GVMA request to other HART
> > event"
> > +  },
> > +  {
> > +    "PublicDescription": "Received HFENCE.GVMA request from other
> > HART event",
> > +    "ConfigCode": "0x800000000000000f",
> > +    "EventName": "FW_HFENCE_GVMA_RECEIVED",
> > +    "BriefDescription": "Received HFENCE.GVMA request from other
> > HART event"
> > +  },
> > +  {
> > +    "PublicDescription": "Sent HFENCE.GVMA with VMID request to
> > other HART event",
> > +    "ConfigCode": "0x8000000000000010",
> > +    "EventName": "FW_HFENCE_GVMA_VMID_SENT",
> > +    "BriefDescription": "Sent HFENCE.GVMA with VMID request to
> > other HART event"
> > +  },
> > +  {
> > +    "PublicDescription": "Received HFENCE.GVMA with VMID request
> > from other HART event",
> > +    "ConfigCode": "0x8000000000000011",
> > +    "EventName": "FW_HFENCE_GVMA_VMID_RECEIVED",
> > +    "BriefDescription": "Received HFENCE.GVMA with VMID request
> > from other HART event"
> > +  },
> > +  {
> > +    "PublicDescription": "Sent HFENCE.VVMA request to other HART
> > event",
> > +    "ConfigCode": "0x8000000000000012",
> > +    "EventName": "FW_HFENCE_VVMA_SENT",
> > +    "BriefDescription": "Sent HFENCE.VVMA request to other HART
> > event"
> > +  },
> > +  {
> > +    "PublicDescription": "Received HFENCE.VVMA request from other
> > HART event",
> > +    "ConfigCode": "0x8000000000000013",
> > +    "EventName": "FW_HFENCE_VVMA_RECEIVED",
> > +    "BriefDescription": "Received HFENCE.VVMA request from other
> > HART event"
> > +  },
> > +  {
> > +    "PublicDescription": "Sent HFENCE.VVMA with ASID request to
> > other HART event",
> > +    "ConfigCode": "0x8000000000000014",
> > +    "EventName": "FW_HFENCE_VVMA_ASID_SENT",
> > +    "BriefDescription": "Sent HFENCE.VVMA with ASID request to
> > other HART event"
> > +  },
> > +  {
> > +    "PublicDescription": "Received HFENCE.VVMA with ASID request
> > from other HART event",
> > +    "ConfigCode": "0x8000000000000015",
> > +    "EventName": "FW_HFENCE_VVMA_ASID_RECEIVED",
> > +    "BriefDescription": "Received HFENCE.VVMA with ASID request
> > from other HART event"
> > +  }
> > +]  
> 
> When testing with perf using firmware events we saw this error: 
> WARNING: event 'N/A' not valid (bits 59 of config '80000000000000a'
> not supported by kernel)!
> 
> It looks it is due to a typo and applying the below patch resolved the
> issue for us.

Thanks for catching this - indeed this is a correct fix.

> 
> Tested-by: Kautuk Consul <kconsul@ventanamicro.com>

Thank you for testing!


Yours,
Nikita Shubin.

> 
> diff --git a/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
> b/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
> index b9d305f1ada8..a9939823b14b 100644
> --- a/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
> +++ b/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
> @@ -61,7 +61,7 @@
>    },
>    {
>      "PublicDescription": "Sent SFENCE.VMA request to other HART
> event",
> -    "ConfigCode": "0x80000000000000a",
> +    "ConfigCode": "0x800000000000000a",
>      "EventName": "FW_SFENCE_VMA_SENT",
>      "BriefDescription": "Sent SFENCE.VMA request to other HART event"
>    },
> 
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
