Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0B7C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 08:44:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E446222B6
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 08:44:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V70K8UgJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E446222B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZN17Kax+XT61EEJCJiO8FHJLvbFpJ7U9hSVmiw5UKo=; b=V70K8UgJ0U/+0d
	6VDFWiSNceUyAZCGTML3B1naYy0K0h4+YP9eWDTmkuROvJhgsBqR4ErN9WjmkN5MbHIFyDWm57wpK
	xWNW2B5ZVk2RshzDfV8RaKsKUYHrBYnas/5dI33/is/ionsX/BBm2FPX+ZFGv3anrAWr1+oPCpM/I
	PmfQHWC0CyzWH+mIOPS3qSp3ECycyFt261Q+FrRDBs1HFz0mFjeyQdPy4N9U/mNVhP9xuPuoJxxub
	3mYVnN9GVHxP3aE9IICAGTH+xBiOuk59LnOo7dWJr/SwHBua9iATc/jU2DnvNDu0GfkTKjqzFIJtd
	gjNf94bGQB//2e7cslaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtqA2-0007Bk-HC; Wed, 13 Feb 2019 08:44:54 +0000
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtq9z-0007BJ-VS
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 08:44:53 +0000
Received: by mail-lj1-f196.google.com with SMTP id g11-v6so1287621ljk.3
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 00:44:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Izvgryl2iiTiX+PEw/PVUMFMisAtBv+xAMEzVWOHECE=;
 b=NoqdhJAJ9NkGNAxt/33vu28lut18qE+m9bUCq3PIyJpAjdLAc1/wVUnF/dojOray8c
 CBdcwlRwlcEZYqmtO8LGkj8wY66SgbZhaG9fn8VDS9Kde27Do8Yf3vp9Trbrt1jMKQLw
 DsxKNSohJAbS31unMOEw8+KTckHHH/UYB1EG0Oo062f9nDaryC2Lbj+Guif6qXO7OWR5
 wVQqDwf9Nci0HGE43Lx8M1y/k54282N66pfNqTHNiczyvtEQW191jiXkwX1MrUESXp2W
 NAbDGYi48iQFadljHM14P+3RtSKjGVk7LxeFDH3vCVVoOvv85YX6SCQAuoAp9UcR4H7W
 KjmA==
X-Gm-Message-State: AHQUAuaPPx7LI/Y3hClDe+tzBs7uQjouixTAOYnesWnbEYraCwY7NqtD
 0iN/IzHU9hbTiTP9WY/3lrM=
X-Google-Smtp-Source: AHgI3IZwB4eU9yM/xPqwCI8H6mFu49zMH3KaR9qsu+No+msoLEIPRgPLErKmcDBcq0CkQ2wgHHRswA==
X-Received: by 2002:a2e:4942:: with SMTP id
 b2-v6mr4487935ljd.168.1550047489794; 
 Wed, 13 Feb 2019 00:44:49 -0800 (PST)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.190.116])
 by smtp.gmail.com with ESMTPSA id t14sm347210lft.96.2019.02.13.00.44.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Feb 2019 00:44:48 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.91)
 (envelope-from <johan@kernel.org>)
 id 1gtq9q-0002gA-9M; Wed, 13 Feb 2019 09:44:42 +0100
Date: Wed, 13 Feb 2019 09:44:42 +0100
From: Johan Hovold <johan@kernel.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [v4 PATCH 8/8] RISC-V: Assign hwcap as per comman capabilities.
Message-ID: <20190213084442.GD28278@localhost>
References: <1549969812-22502-1-git-send-email-atish.patra@wdc.com>
 <1549969812-22502-9-git-send-email-atish.patra@wdc.com>
 <20190212112534.GB28278@localhost>
 <61766631-42f4-ec25-3b5c-ae892da44ccb@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61766631-42f4-ec25-3b5c-ae892da44ccb@wdc.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_004452_013829_2DA3B46F 
X-CRM114-Status: GOOD (  21.49  )
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
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Andreas Schwab <schwab@suse.de>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Johan Hovold <johan@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marc Zyngier <marc.zyngier@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 12, 2019 at 11:58:10AM -0800, Atish Patra wrote:
> On 2/12/19 3:25 AM, Johan Hovold wrote:
> > On Tue, Feb 12, 2019 at 03:10:12AM -0800, Atish Patra wrote:
> >> Currently, we set hwcap based on first valid hart from DT. This may not
> >> be correct always as that hart might not be current booting cpu or may
> >> have a different capability.
> >>
> >> Set hwcap as the capabilities supported by all possible harts with "okay"
> >> status.
> >>
> >> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> >> ---
> >>   arch/riscv/kernel/cpufeature.c | 41 ++++++++++++++++++++++-------------------
> >>   1 file changed, 22 insertions(+), 19 deletions(-)
> >>
> >> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> >> index e7a4701f..a1e4fb34 100644
> >> --- a/arch/riscv/kernel/cpufeature.c
> >> +++ b/arch/riscv/kernel/cpufeature.c
> >> @@ -20,6 +20,7 @@
> >>   #include <linux/of.h>
> >>   #include <asm/processor.h>
> >>   #include <asm/hwcap.h>
> >> +#include <asm/smp.h>
> >>   
> >>   unsigned long elf_hwcap __read_mostly;
> >>   #ifdef CONFIG_FPU
> >> @@ -42,28 +43,30 @@ void riscv_fill_hwcap(void)
> >>   
> >>   	elf_hwcap = 0;
> >>   
> >> -	/*
> >> -	 * We don't support running Linux on hertergenous ISA systems.  For
> >> -	 * now, we just check the ISA of the first "okay" processor.
> >> -	 */
> >>   	for_each_of_cpu_node(node) {
> >> -		if (riscv_of_processor_hartid(node) >= 0)
> >> -			break;
> >> -	}
> >> -	if (!node) {
> >> -		pr_warn("Unable to find \"cpu\" devicetree entry\n");
> >> -		return;
> >> -	}
> >> +		unsigned long this_hwcap = 0;
> >>   
> >> -	if (of_property_read_string(node, "riscv,isa", &isa)) {
> >> -		pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> >> -		of_node_put(node);
> >> -		return;
> >> -	}
> >> -	of_node_put(node);
> >> +		if (riscv_of_processor_hartid(node) < 0)
> >> +			continue;
> >>
> 
> >> -	for (i = 0; i < strlen(isa); ++i)
> >> -		elf_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
> >> +		if (of_property_read_string(node, "riscv,isa", &isa)) {
> >> +			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> >> +			return;
> > 
> > Did you want "continue" here to continue processing the other harts?
> 
> Hmm. If a cpu node doesn't have isa in DT, that means DT is wrong. A 
> "continue" here will let user space use other harts just with a warning 
> message?
> 
> Returning here will not set elf_hwcap which forces the user to fix the 
> DT. I am not sure what should be the defined behavior in this case.
>
> Any thoughts ?

The problem is that the proposed code might still set elf_hwcap -- it
all depends on the order of the hart nodes in dt (i.e. it will only be
left unset if the first node is malformed).

For that reason, I'd say it's better to either bail out (hard or at
least with elf_hwcap unset) or to continue processing the other nodes.

The former might break current systems with malformed dt, though.

And since the harts are expected to have the same ISA, continuing the
processing while warning and ignoring the malformed node might be
acceptable.

Johan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
