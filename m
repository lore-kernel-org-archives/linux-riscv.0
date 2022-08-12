Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E29EC00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 19:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZiaXvgubboUsXLW75U2wYgksxN3XfY2uVtMNv95MYc=; b=k6XR8bTy25pyyu
	Z51W3hs+Q3VSJUZ0j2RM4eXlb+izKrKDshiYRkwEZ7+dg98H/XEJApgDVOLLdOo/tcj58PIEBHufs
	ZdvBwh2Ot0X5zFjFoaApsgMn15VxomEQvMNyobnMpzJAzAN//RUSIk8NZ1w683fnv8eyG+949cr0K
	6v8cyqzQ/4rqDSXDNfSiAbvp/EmBsImOKiObYkyKSb+ARqB8J3YTyDV7xTo3/U1f3B8i+Hul22jgQ
	ogcV6+fFSKUndTrXbtWTvIKywi0EHt4hI9VMzrXETbsVEjo7FoQIXUSNNe+n9Ybzp6GU0QHMETwE8
	lB16QR25bwp7yGNfYnZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMaXK-00Cefy-AD; Fri, 12 Aug 2022 19:41:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMaXJ-00Ceex-25
	for linux-riscv@bombadil.infradead.org; Fri, 12 Aug 2022 19:41:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dyWeHeSEqzkOaVmQzgXTJmaaVhu9et7hQ+Hb68AvpZA=; b=E1T1Z+LdvhLVr3bH2Qi9lb5BUj
	ow2F5p3FjU+3PU2+UNsDrnDHlcmkC9L+/QGuaUQJYUhR752jx74Mmqn1hAmSvJy+rKoufpc5oYDJ4
	hQI/Hz/5yRnO5f2EoQA6mTy/Gyq2W3zacG7BK/ld/Owu3xZyr+wCNCDY6rPrju3IzZgmVnKPEVY+P
	uYqQXhFvbhd7nNJa0uA7bFPqr9B+hIjNdW1dZvOeXl3cHyGso1T4Q/4LKch1Dppjb03DQDGcu2FPX
	vU4/XKC2PMEQ7J+MCA4IbPc8k7ZPTTGnUAzajRGIPAbY0mRC4TrxFYvXjTE9EmDJiQxxtFOMahDJa
	QBpalqnQ==;
Received: from [187.19.239.32] (helo=quaco.ghostprotocols.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMaXH-002Z7K-59; Fri, 12 Aug 2022 19:41:35 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 82F644035A; Fri, 12 Aug 2022 16:41:31 -0300 (-03)
Date: Fri, 12 Aug 2022 16:41:31 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>, linux@yadro.com,
	Genevieve Chan <genevieve.chan@starfivetech.com>,
	=?iso-8859-1?Q?Jo=E3o_M=E1rio?= Domingos <joao.mario@tecnico.ulisboa.pt>,
	Nikita Shubin <n.shubin@yadro.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	Kautuk Consul <kconsul@ventanamicro.com>
Subject: Re: [PATCH v5] perf arch events: riscv sbi firmware std event files
Message-ID: <Yvas60duFUkSzuz+@kernel.org>
References: <20220628114625.166665-1-nikita.shubin@maquefel.me>
 <20220628114625.166665-4-nikita.shubin@maquefel.me>
 <18c8e9c74955c08fdbd631a35c51b30f3cff3cd3.camel@ventanamicro.com>
 <20220811112303.4e5f0566@redslave.neermore.group>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220811112303.4e5f0566@redslave.neermore.group>
X-Url: http://acmel.wordpress.com
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

Em Thu, Aug 11, 2022 at 11:23:03AM +0300, Nikita Shubin escreveu:
> Hello Mayuresh!
> 
> On Wed, 10 Aug 2022 20:26:18 +0530
> Mayuresh Chitale <mchitale@ventanamicro.com> wrote:
> 
> > On Tue, 2022-06-28 at 14:45 +0300, Nikita Shubin wrote:
> > > From: Nikita Shubin <n.shubin@yadro.com>
> > > 
> > > Firmware events are defined by "RISC-V Supervisor Binary Interface
> > > Specification", which means they should be always available as long
> > > as
> > > firmware supports >= 0.3.0 SBI.
> > > 
> > > Expose them to arch std events, so they can be reused by particular
> > > PMU bindings.
> > > 
> > > Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> > > ---
> > > v4->v5:
> > > - changed EventCode to ConfigCode, as 63 bit exceeds event code
> > > format
> > > ---
> > >  .../arch/riscv/riscv-sbi-firmware.json        | 134
> > > ++++++++++++++++++
> > >  1 file changed, 134 insertions(+)
> > >  create mode 100644 tools/perf/pmu-events/arch/riscv/riscv-sbi-
> > > firmware.json
> > > 
> > > diff --git
> > > a/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
> > > b/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json new file
> > > mode 100644 index 000000000000..b9d305f1ada8
> > > --- /dev/null
> > > +++ b/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
> > > @@ -0,0 +1,134 @@
> > > +[
> > > +  {
> > > +    "PublicDescription": "Misaligned load trap",
> > > +    "ConfigCode": "0x8000000000000000",
> > > +    "EventName": "FW_MISALIGNED_LOAD",
> > > +    "BriefDescription": "Misaligned load trap event"
> > > +  },
> > > +  {
> > > +    "PublicDescription": "Misaligned store trap",
> > > +    "ConfigCode": "0x8000000000000001",
> > > +    "EventName": "FW_MISALIGNED_STORE",
> > > +    "BriefDescription": "Misaligned store trap event"
> > > +  },
> > > +  {
> > > +    "PublicDescription": "Load access trap",
> > > +    "ConfigCode": "0x8000000000000002",
> > > +    "EventName": "FW_ACCESS_LOAD",
> > > +    "BriefDescription": "Load access trap event"
> > > +  },
> > > +  {
> > > +    "PublicDescription": "Store access trap",
> > > +    "ConfigCode": "0x8000000000000003",
> > > +    "EventName": "FW_ACCESS_STORE",
> > > +    "BriefDescription": "Store access trap event"
> > > +  },
> > > +  {
> > > +    "PublicDescription": "Illegal instruction trap",
> > > +    "ConfigCode": "0x8000000000000004",
> > > +    "EventName": "FW_ILLEGAL_INSN",
> > > +    "BriefDescription": "Illegal instruction trap event"
> > > +  },
> > > +  {
> > > +    "PublicDescription": "Set timer event",
> > > +    "ConfigCode": "0x8000000000000005",
> > > +    "EventName": "FW_SET_TIMER",
> > > +    "BriefDescription": "Set timer event"
> > > +  },
> > > +  {
> > > +    "PublicDescription": "Sent IPI to other HART event",
> > > +    "ConfigCode": "0x8000000000000006",
> > > +    "EventName": "FW_IPI_SENT",
> > > +    "BriefDescription": "Sent IPI to other HART event"
> > > +  },
> > > +  {
> > > +    "PublicDescription": "Received IPI from other HART event",
> > > +    "ConfigCode": "0x8000000000000007",
> > > +    "EventName": "FW_IPI_RECEIVED",
> > > +    "BriefDescription": "Received IPI from other HART event"
> > > +  },
> > > +  {
> > > +    "PublicDescription": "Sent FENCE.I request to other HART
> > > event",
> > > +    "ConfigCode": "0x8000000000000008",
> > > +    "EventName": "FW_FENCE_I_SENT",
> > > +    "BriefDescription": "Sent FENCE.I request to other HART event"
> > > +  },
> > > +  {
> > > +    "PublicDescription": "Received FENCE.I request from other HART
> > > event",
> > > +    "ConfigCode": "0x8000000000000009",
> > > +    "EventName": "FW_FENCE_I_RECEIVED",
> > > +    "BriefDescription": "Received FENCE.I request from other HART
> > > event"
> > > +  },
> > > +  {
> > > +    "PublicDescription": "Sent SFENCE.VMA request to other HART
> > > event",
> > > +    "ConfigCode": "0x80000000000000a",
> > > +    "EventName": "FW_SFENCE_VMA_SENT",
> > > +    "BriefDescription": "Sent SFENCE.VMA request to other HART
> > > event"
> > > +  },
> > > +  {
> > > +    "PublicDescription": "Received SFENCE.VMA request from other
> > > HART event",
> > > +    "ConfigCode": "0x800000000000000b",
> > > +    "EventName": "FW_SFENCE_VMA_RECEIVED",
> > > +    "BriefDescription": "Received SFENCE.VMA request from other
> > > HART event"
> > > +  },
> > > +  {
> > > +    "PublicDescription": "Sent SFENCE.VMA with ASID request to
> > > other HART event",
> > > +    "ConfigCode": "0x800000000000000c",
> > > +    "EventName": "FW_SFENCE_VMA_RECEIVED",
> > > +    "BriefDescription": "Sent SFENCE.VMA with ASID request to other
> > > HART event"
> > > +  },
> > > +  {
> > > +    "PublicDescription": "Received SFENCE.VMA with ASID request
> > > from other HART event",
> > > +    "ConfigCode": "0x800000000000000d",
> > > +    "EventName": "FW_SFENCE_VMA_ASID_RECEIVED",
> > > +    "BriefDescription": "Received SFENCE.VMA with ASID request from
> > > other HART event"
> > > +  },
> > > +  {
> > > +    "PublicDescription": "Sent HFENCE.GVMA request to other HART
> > > event",
> > > +    "ConfigCode": "0x800000000000000e",
> > > +    "EventName": "FW_HFENCE_GVMA_SENT",
> > > +    "BriefDescription": "Sent HFENCE.GVMA request to other HART
> > > event"
> > > +  },
> > > +  {
> > > +    "PublicDescription": "Received HFENCE.GVMA request from other
> > > HART event",
> > > +    "ConfigCode": "0x800000000000000f",
> > > +    "EventName": "FW_HFENCE_GVMA_RECEIVED",
> > > +    "BriefDescription": "Received HFENCE.GVMA request from other
> > > HART event"
> > > +  },
> > > +  {
> > > +    "PublicDescription": "Sent HFENCE.GVMA with VMID request to
> > > other HART event",
> > > +    "ConfigCode": "0x8000000000000010",
> > > +    "EventName": "FW_HFENCE_GVMA_VMID_SENT",
> > > +    "BriefDescription": "Sent HFENCE.GVMA with VMID request to
> > > other HART event"
> > > +  },
> > > +  {
> > > +    "PublicDescription": "Received HFENCE.GVMA with VMID request
> > > from other HART event",
> > > +    "ConfigCode": "0x8000000000000011",
> > > +    "EventName": "FW_HFENCE_GVMA_VMID_RECEIVED",
> > > +    "BriefDescription": "Received HFENCE.GVMA with VMID request
> > > from other HART event"
> > > +  },
> > > +  {
> > > +    "PublicDescription": "Sent HFENCE.VVMA request to other HART
> > > event",
> > > +    "ConfigCode": "0x8000000000000012",
> > > +    "EventName": "FW_HFENCE_VVMA_SENT",
> > > +    "BriefDescription": "Sent HFENCE.VVMA request to other HART
> > > event"
> > > +  },
> > > +  {
> > > +    "PublicDescription": "Received HFENCE.VVMA request from other
> > > HART event",
> > > +    "ConfigCode": "0x8000000000000013",
> > > +    "EventName": "FW_HFENCE_VVMA_RECEIVED",
> > > +    "BriefDescription": "Received HFENCE.VVMA request from other
> > > HART event"
> > > +  },
> > > +  {
> > > +    "PublicDescription": "Sent HFENCE.VVMA with ASID request to
> > > other HART event",
> > > +    "ConfigCode": "0x8000000000000014",
> > > +    "EventName": "FW_HFENCE_VVMA_ASID_SENT",
> > > +    "BriefDescription": "Sent HFENCE.VVMA with ASID request to
> > > other HART event"
> > > +  },
> > > +  {
> > > +    "PublicDescription": "Received HFENCE.VVMA with ASID request
> > > from other HART event",
> > > +    "ConfigCode": "0x8000000000000015",
> > > +    "EventName": "FW_HFENCE_VVMA_ASID_RECEIVED",
> > > +    "BriefDescription": "Received HFENCE.VVMA with ASID request
> > > from other HART event"
> > > +  }
> > > +]  
> > 
> > When testing with perf using firmware events we saw this error: 
> > WARNING: event 'N/A' not valid (bits 59 of config '80000000000000a'
> > not supported by kernel)!
> > 
> > It looks it is due to a typo and applying the below patch resolved the
> > issue for us.
> 
> Thanks for catching this - indeed this is a correct fix.
> 
> > 
> > Tested-by: Kautuk Consul <kconsul@ventanamicro.com>
> 
> Thank you for testing!

Can you please resubmit with the fixes, rebased to the current
acme/perf/core branch?

If I get this today it may even get into v6.0. :-)

Thanks,

- Arnaldo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
