Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EDCC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 16:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fw53C0HJ/igeV7H13Pv+f5jl59BIedvDD2PFKKWvp5s=; b=stMYWqhAiv7nID
	DkVlUE/EbxytEGVuFoTBBn4tbrg9ix+uPw1NF+wxCcotTl44QC0eAk0bkPkY8klmOomzbfC8LiX6U
	tTKBsUxEelZ3Co9KZ+/5zkm5RplFaiP31iE086ZwFLlLrllw9m7IyfscVOhykxkQo/x3KMIOv2f4R
	3uKbEe37MGprCmeAO7vHGhGjSf3e+o4Aw1gQNsty2ZxkVvcsY319nlXHe9rnPTknS4OIhAAe8W7jG
	OQ1ZaVvgyZ9MvxQC1TCsy4FYCtQxe9E7c0hBZfBrLo1yfX6H+fvc98yuqv/AYRAzHQ5NVnpdyICcR
	Qf51o9Q5N2xmiYVB0AZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r80VS-005kwy-1K;
	Tue, 28 Nov 2023 16:00:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r80VK-005ktJ-2L;
	Tue, 28 Nov 2023 16:00:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5472A169E;
	Tue, 28 Nov 2023 08:00:52 -0800 (PST)
Received: from localhost (ionvoi01-desktop.cambridge.arm.com [10.2.78.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E1E43F6C4;
	Tue, 28 Nov 2023 08:00:04 -0800 (PST)
Date: Tue, 28 Nov 2023 16:00:03 +0000
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	viresh.kumar@linaro.org, lenb@kernel.org, robert.moore@intel.com,
	lukasz.luba@arm.com, pierre.gondois@arm.com,
	beata.michalska@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
	conor.dooley@microchip.com, suagrfillet@gmail.com,
	ajones@ventanamicro.com, lftan@kernel.org
Subject: Re: [PATCH v6 1/7] topology: Add a new arch_scale_freq_reference
Message-ID: <ZWYOg1gIIgI1qXn7@arm.com>
References: <20231109101438.1139696-1-vincent.guittot@linaro.org>
 <20231109101438.1139696-2-vincent.guittot@linaro.org>
 <ZWYM0hn28RHjAalh@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZWYM0hn28RHjAalh@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_080006_837578_54BC12F4 
X-CRM114-Status: GOOD (  17.05  )
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

On Tuesday 28 Nov 2023 at 15:52:52 (+0000), Ionela Voinescu wrote:
> Hi Vincent,
> 
> I have a small request on this patch, which is useful for [1].
> I'll detail what is needed lower in the code.
> 
> [1] https://lore.kernel.org/lkml/ZWYDr6JJJzBvsqf0@arm.com/
> 
> On Thursday 09 Nov 2023 at 11:14:32 (+0100), Vincent Guittot wrote:
> > @@ -279,13 +278,13 @@ void topology_normalize_cpu_scale(void)
> >  
> >  	capacity_scale = 1;
> >  	for_each_possible_cpu(cpu) {
> > -		capacity = raw_capacity[cpu] * per_cpu(freq_factor, cpu);
> > +		capacity = raw_capacity[cpu] * per_cpu(capacity_freq_ref, cpu);
> 
> The only affected code that I could find is here and below.
> 
> The above line would have to change to:
> capacity = raw_capacity[cpu] * per_cpu(capacity_freq_ref, cpu) ?: 1;
> 
> >  		capacity_scale = max(capacity, capacity_scale);
> >  	}
> >  
> >  	pr_debug("cpu_capacity: capacity_scale=%llu\n", capacity_scale);
> >  	for_each_possible_cpu(cpu) {
> > -		capacity = raw_capacity[cpu] * per_cpu(freq_factor, cpu);
> > +		capacity = raw_capacity[cpu] * per_cpu(capacity_freq_ref, cpu);
> 
> and here:
> capacity = raw_capacity[cpu] * per_cpu(capacity_freq_ref, cpu) ?: 1;
> 
> I think it's nicer to start with capacity_freq_ref as 0 and compensate here
> for uninitialized capacity_freq_ref.
> 
> Let me know if this is alright of if you'd prefer us to make this change
> in a separate patch.
> 
> Thanks,
> Ionela.
> 

Correction - both will need to be:
capacity = raw_capacity[cpu] * (per_cpu(capacity_freq_ref, cpu) ?: 1);

Thanks,
Ionela.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
