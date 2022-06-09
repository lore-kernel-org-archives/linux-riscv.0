Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F55DC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 13:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pe6iYIcVjX6dfSVlGTqYfBrykYEsxOy1WyCKNCJAz2Q=; b=zEE80adMmSsgfG
	w0O+XmFcxFFITIyk6CROhb1DIM0KulmimMd2N60UD49HBvsNldbN4/vOb0RW5W0QdH6YWIIxYWNHw
	DnhOcKgQgkjTODMidDaKRq1MhjcWto79l1NNO2+Ooy1z0kMiiWv4/+Lu4zm+Ta7RmsJb6gr0m8wgY
	DCtAolVXE9z1oqk2BVilGCKuX6foP7hO2OmnWyz81miwCX1EbY93HXZ4hsps3S35t06vaZhk40c9/
	jp3tNyuqV2gLldzc/uAWyRT664X56/eB697zm8b278EvuVcBK9asp39GuRmN3k/NRxux3WomlZvqK
	CHMd+AC4lv6Gquh55FPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzIZv-002JbO-FD; Thu, 09 Jun 2022 13:52:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzIZs-002JWq-Fi
	for linux-riscv@lists.infradead.org; Thu, 09 Jun 2022 13:52:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E03A1B82DD4;
	Thu,  9 Jun 2022 13:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45DEC3411B;
	Thu,  9 Jun 2022 13:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654782717;
	bh=Gc7pkwVKw7goUZjfI06x1B7/bd+4gUEXa31OZI6JBp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rePiUSeVJYQ5OCj/9/lBtjqh9nLQjkfzT/0dIVFI5n/+Z3nr1eXNiYvGaiLixdfln
	 KeLXIWKmxyv08MGYCRGb/Sdnjjg0H+V+dY/KfAXXnMAq/K4BGAComEJ/P4owjB6utY
	 fm2RoDeALap9ClV/mS/Hv6pWPjz/uKb6JItDxLxy8MLAznyjFkCC/qGjdDBdGm6cm7
	 roDonxJ+1ucsMDh+Ond7bUxEW8zP17CTFdCZHVR+M4epOVGtt2gNfEMNEero3T2fn0
	 POLEfjv6bnzH3FwsAYXOR8VyQqfd5kCHH2LT7IS/SVcCgol5nKOx7B1u8ohUmVrCMp
	 iNnhWVHIri63A==
Date: Thu, 9 Jun 2022 14:51:51 +0100
From: Will Deacon <will@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Atish Patra <atishp@rivosinc.com>, mark.rutland@arm.com,
	linux-kernel@vger.kernel.org, atishp@atishpatra.org,
	anup@brainfault.org, jszhang@kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>, robh+dt@kernel.org
Subject: Re: [PATCH v2  0/3] Miscellaneous fixes for PMU driver
Message-ID: <20220609135151.GA3064@willie-the-truck>
References: <20220513015522.910856-1-atishp@rivosinc.com>
 <mhng-ba83da39-dadf-4d6e-99be-a1b5fdf9b62c@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-ba83da39-dadf-4d6e-99be-a1b5fdf9b62c@palmer-ri-x1c9>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_065200_761782_37ABEDA7 
X-CRM114-Status: GOOD (  20.86  )
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

Hey Palmer,

On Wed, Jun 01, 2022 at 10:58:08PM -0700, Palmer Dabbelt wrote:
> On Thu, 12 May 2022 18:55:19 PDT (-0700), Atish Patra wrote:
> > This series fixes issues PMU driver code.
> > PATCH 1 & 3 are fixes for rv32 while PATCH 2 fixes a redundant
> > user page update issue during counter start.
> > 
> > Changes from v1->v2:
> > 1. Add proper compile time rv32 checks.
> > 
> > Atish Patra (3):
> > RISC-V: Fix counter restart during overflow for RV32
> > RISC-V: Update user page mapping only once during start
> > RISC-V: Fix SBI PMU calls for RV32
> > 
> > drivers/perf/riscv_pmu.c     |  1 -
> > drivers/perf/riscv_pmu_sbi.c | 16 ++++++++++++++++
> > 2 files changed, 16 insertions(+), 1 deletion(-)
> 
> +Will and Mark.
> 
> Will recently took some stuff for drivers/perf/riscv_* into his
> for-next/perf tree (which I didn't even know about until then, oops), but
> the previous stuff I took through the RISC-V tree.  Always happy to get
> stuff out of my tree, just LMK what you want me to do here.
> 
> I did some minor cleanups to the commit text and put them over at
> palmer/riscv-pmu_fixes, it's all passing my tests.  These generally look
> fine to me and they're all stable backports, so no big rush on the merge
> window (which I still have stuff for).

I don't have any perf driver fixes queued at the moment, so please just
include these changes along with any other riscv fixes you have.

Thanks,

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
