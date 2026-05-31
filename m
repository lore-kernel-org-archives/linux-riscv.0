Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C310CD6E4A
	for <linux-riscv@archiver.kernel.org>; Sun, 31 May 2026 01:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GkO8A7aiuM8nOp4zFFuIoEfnFrh8J4oAI1FVPYYuSoQ=; b=FprVK+HhnXvoap
	GOhlqECMHX5HhOETF5K5RXGTeTwVrJZQ5xtYAEHNJ22DKSJQS98AArF+N7M0sSzj63i8jZurcwA0x
	OHujVzWJbuar1UevzA0+H+w5Yau1zbgQN8gWZggfrNWkkblGLqk2Nt+NHDPrXPOLyfLi2fIkrza/9
	R0CxZf995Z1X7kSUs2WWYVKTi/ComvnDpMoBbFM1iqtwNspwFevC3sg3Vf1QrlLlBvwgyyTiIpf33
	2K+qKX470khdkZ/831LoiB5OTAVb4atOaBEzNbbT5vf5eIerb2oJ/urixKrkDgDGcixG75n1xepHy
	J+b9xVW7L/57yx4el+Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTVKg-00000009A8Y-1qy8;
	Sun, 31 May 2026 01:51:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTVKd-00000009A85-36sQ
	for linux-riscv@lists.infradead.org;
	Sun, 31 May 2026 01:51:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6956E408F4;
	Sun, 31 May 2026 01:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 766BE1F00893;
	Sun, 31 May 2026 01:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780192272;
	bh=1miKEZAnGiSRcJQWtswcD5dFRkY3BK0eDKYXOh7h6zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kLY60WfhyXnSawaNZl+ilX4Ak1L0nLfHZVo5wooZbVNLdLl6+VwBm6FBMlSa46wp2
	 RhTtMwa0RiiIopa/dJ6a4pY7B1OWJ6JG6HV0TQp+U2W/HKI248r6TyYHbRTreyNyVz
	 yUz2338GeKxTE6CjYYCC6b361QBAF7FbhAnXKsfdt2WOCXOxGmOr6XE4nuBsWSm68w
	 aiWbuaU68w9QP8FiUzIoZ1Bv2H7Ru5HQw2gQGmLT2bdMaYe7+sdfPcvgs8KQZWMZpX
	 upA3cR23f39TzrUVNIHAGvC/dbMTqphfDDHLjSUuECnm+NaeIS8qJ8xIn5Vit4bcaE
	 MoQcXwuCuMEJw==
Date: Sat, 30 May 2026 18:51:01 -0700
From: Drew Fustini <fustini@kernel.org>
To: Sunil V L <sunilvl@oss.qualcomm.com>
Subject: Re: [PATCH RFC v5 16/18] ACPI: RISC-V: Parse RISC-V Quality of
 Service Controller (RQSC) table
Message-ID: <ahuUBV8QYo_ToOrB@gen8>
References: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-0-78d3a7ba9dbe@kernel.org>
 <20260524-ssqosid-cbqri-rqsc-v7-0-v5-16-78d3a7ba9dbe@kernel.org>
 <CAB19ukE9r_V=0eop3=f8zohhnCavd=9GjDEK1VMMbOb0ReOtDA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB19ukE9r_V=0eop3=f8zohhnCavd=9GjDEK1VMMbOb0ReOtDA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_185115_825771_8204BBB8 
X-CRM114-Status: GOOD (  11.40  )
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
Cc: x86@kernel.org, Atish Patra <atish.patra@linux.dev>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-kernel@vger.kernel.org, Gong Shuai <gong.shuai@sanechips.com.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, "H. Peter Anvin" <hpa@zytor.com>, guo.wenjia23@zte.com.cn, Krzysztof Kozlowski <krzk+dt@kernel.org>, Ingo Molnar <mingo@redhat.com>, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, linux-acpi@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rafael@kernel.org>, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, Dave Hansen <dave.hansen@linux.intel.com>, Ben Horgan <ben.horgan@arm.com>, linux-rt-devel@lists.linux.dev, James Morse <james.morse@arm.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Dave Martin <Dave.Martin@arm.com>, Clark Williams <clrkwllms@kernel.org>, Len Brown <lenb@kernel.org>, Gong Shuai <gsh517@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>, Steven Rostedt <rostedt@goodmis.org>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, Borislav Petkov <bp@alien8.de>, yunhui cui <cuiyunhui@bytedance.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Reinette Chatre <reinette.chatre@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Tony Luck <tony.luck@intel.com>, Peter Newman <peternewman@google.com>, linux-doc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, May 25, 2026 at 01:53:09PM +0530, Sunil V L wrote:
> > +               if (info.mcid_count > CBQRI_MAX_MCID) {
> > +                       pr_warn("controller at %pa: mcid_count %u exceeds CBQRI_MAX_MCID %u, skipping\n",
> > +                               &info.addr, info.mcid_count, CBQRI_MAX_MCID);
> > +                       continue;
> > +               }
> > +
> Do you also want to add a check for the statement in the spec "At
> least one of RCID Count or MCID Count must be non-zero." ?

Good idea, I'll add a skip with pr_warn when both are zero.

> > +/* RQSC v0.9.2 Table 4: Resource Type values for acpi_rqsc_resource.type. */
> > +#define ACPI_RQSC_RESOURCE_TYPE_CACHE  0
> > +#define ACPI_RQSC_RESOURCE_TYPE_MEMORY 1
> > +
> > +/* RQSC v0.9.2 Table 4: Resource ID Type values for .id_type. */
> > +#define ACPI_RQSC_RESOURCE_ID_TYPE_PROCESSOR_CACHE     0
> > +#define ACPI_RQSC_RESOURCE_ID_TYPE_MEMORY_RANGE                1
> > +
> Memory-Side Cache, ACPI, PCI devices missing?

I'll add the constants for the future.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
