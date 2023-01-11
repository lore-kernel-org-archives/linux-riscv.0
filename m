Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FCBC46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 05:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LiW6bywN0xvZuq0tTCVFF58zgIAnxRd5eI/nvq72kYM=; b=kzIMT/YdsCOB7n
	4NUFb2O/koxc+ItU/nRAfzyxOJZj91yPJwkTsRmTRgHxqYiJAseeMbnl1EiVlj5hdSGpsK5GWsQPS
	GpuZt/bGyOClYThqtWEVJDINVDobCB8mJDwiUrA5Y9cl0EIb371gUsLtzSdRJ2W7KPEDAZSuxUbzX
	y788Pbg5UHf+3gMhZsWVfKxeawsZ6qcHX+olFw9ZbXImxQ/BD/vI1yc+GOrcTle1fiMrDfGjc4PBF
	86QWJYei4dv2Gb8E6Q/SwNgN/t/PBMmrPkm0LNs3km7ZzXequyWLGk/llCrVNXs3vkYbSk8kzUiXo
	no06Uv6GQdKJTRTAwlwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFTJI-009dKw-1f; Wed, 11 Jan 2023 05:06:00 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFTJC-009dHm-4S
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 05:05:58 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 8B56624E1A6;
	Wed, 11 Jan 2023 13:05:17 +0800 (CST)
Received: from EXMBX167.cuchost.com (172.16.6.77) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 11 Jan
 2023 13:05:17 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX167.cuchost.com
 (172.16.6.77) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 11 Jan
 2023 13:05:16 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Wed, 11 Jan 2023 13:05:17 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Andrew Jones <ajones@ventanamicro.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>, Mason Huo <mason.huo@starfivetech.com>
Subject: RE: [PATCH v2 3/3] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Thread-Topic: [PATCH v2 3/3] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Thread-Index: AQHZI/MH11WdbApPuUeV8qMdKhtSOK6V9U4AgAFQMgCAAE7gAIABF1UA
Date: Wed, 11 Jan 2023 05:05:16 +0000
Message-ID: <6952df4474b54a31894d71e7cfe6077a@EXMBX066.cuchost.com>
References: <20230109062407.3235-1-jeeheng.sia@starfivetech.com>
 <20230109062407.3235-4-jeeheng.sia@starfivetech.com>
 <20230109193624.iiuguwgimpn7zbyw@orel>
 <6638291f6a3c463994919ba0a875472c@EXMBX066.cuchost.com>
 <Y73I6H+X+qswIst0@spud>
In-Reply-To: <Y73I6H+X+qswIst0@spud>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_210554_525468_6B139E95 
X-CRM114-Status: GOOD (  26.37  )
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



> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Wednesday, 11 January, 2023 4:22 AM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> Cc: Andrew Jones <ajones@ventanamicro.com>; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; linux-
> riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Mason Huo
> <mason.huo@starfivetech.com>
> Subject: Re: [PATCH v2 3/3] RISC-V: Add arch functions to support hibernation/suspend-to-disk
> 
> Hey JeeHeng,
> 
> On Tue, Jan 10, 2023 at 08:37:01AM +0000, JeeHeng Sia wrote:
> > > From: Andrew Jones <ajones@ventanamicro.com>
> > > On Mon, Jan 09, 2023 at 02:24:07PM +0800, Sia Jee Heng wrote:
> 
> > > > +/* Helper parameters that help us to restore the image.
> > >
> > > Separate line for /*
> > ok
> 
> I'm not sure why this one struct has an actual description that
> resembles kerneldoc, when nothing else does - but why not make it
> actually kerneldoc, as you're almost there as things stand:
> https://docs.kernel.org/doc-guide/kernel-doc.html#structure-union-and-enumeration-documentation
Thanks. This is a good info, will work on it.
> 
> > > > + * @hartid: To make sure same boot_cpu executing the hibernate/restore
> > > code.
> > > > + * @saved_satp: Original page table used by the hibernated image.
> > > > + * @restore_cpu_addr: The kernel's image address to restore the CPU
> > > context.
> 
> ^^ also your mail client is doing some really odd things wrapping wise.
Oops. Hope I have fixed it in this round..
> 
> > > > +static unsigned long temp_pgtable_map_pmd(pmd_t *pmdp, unsigned
> > > long vaddr, pgprot_t prot)
> > > > +{
> > > > +	uintptr_t pmd_idx = pmd_index(vaddr);
> > > > +	pte_t *ptep;
> > > > +
> > > > +	if (pmd_none(pmdp[pmd_idx])) {
> > > > +		ptep = (pte_t *) get_safe_page(GFP_ATOMIC);
> > >
> > > No space between cast and function. Same comment for following functions.
> > > I thought checkpatch complained about that.
> > Ok. But it is weird that checkpatch doesn't report the issue.
> 
> It does:
ok, will double check again.
> 20:08:17 conor /stuff/linux$ ./scripts/checkpatch.pl --strict --terse -g HEAD~3..HEAD
> 7481f133eb0310496742c27d15a20fdd2c499d29:97: CHECK: Alignment should match open parenthesis
> [...]
> 7481f133eb0310496742c27d15a20fdd2c499d29:370: CHECK: No space is necessary after a cast
> [...]
> 7481f133eb0310496742c27d15a20fdd2c499d29:460: CHECK: No space is necessary after a cast
> 7481f133eb0310496742c27d15a20fdd2c499d29:467: CHECK: No space is necessary after a cast
> 7481f133eb0310496742c27d15a20fdd2c499d29:475: CHECK: Blank lines aren't necessary after an open brace '{'
> 7481f133eb0310496742c27d15a20fdd2c499d29:480: CHECK: No space is necessary after a cast
> 7481f133eb0310496742c27d15a20fdd2c499d29:487: CHECK: No space is necessary after a cast
> 7481f133eb0310496742c27d15a20fdd2c499d29:499: CHECK: No space is necessary after a cast
> 7481f133eb0310496742c27d15a20fdd2c499d29:506: CHECK: No space is necessary after a cast
> 7481f133eb0310496742c27d15a20fdd2c499d29:518: CHECK: No space is necessary after a cast
> 7481f133eb0310496742c27d15a20fdd2c499d29:525: CHECK: No space is necessary after a cast
> 7481f133eb0310496742c27d15a20fdd2c499d29:577: CHECK: No space is necessary after a cast
> 7481f133eb0310496742c27d15a20fdd2c499d29:591: CHECK: Alignment should match open parenthesis
> 7481f133eb0310496742c27d15a20fdd2c499d29:596: CHECK: Alignment should match open parenthesis
> total: 0 errors, 1 warnings, 21 checks, 545 lines checked
> 
> The patchwork automation seems to have ignored this patchset for some
> reason. It was stuck on a patchset for some reason and this one may
> have got skipped when I tried to sort that out.
> Ordinarily, you'd see it complaining about these sorts of things.
> 
> Thanks,
> Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
