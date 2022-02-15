Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39B4C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 16:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJCVm/PEbr1RRxxR/X83xZkEge+dPcnDnem8f7baqgQ=; b=pHvMxub0FVM5Dn
	hdxlGr3fp4dKdR01MQlw3eQ5juPG/8s7GlIjADsqYcNK/ENthuzV2xJMKkLZwQ7Vr8sp+DCH8sU0t
	pZvdr5oq5F0Lty+6123gvI0BdMI1uEH2XtnlzhBzalw/6DaYVZvy6MsmMZaeJs9IDP23ygaaJVZc4
	Fm7U4506RqCTEJD6bmEM8EHA1r6siKnNxuMWT5TW2Kli+ekCMcKTBn7ZRJCogG3SXycMFtshUGnUm
	4/bzVjMIMt0Fe6BFYREGtDk09das+LEsuYpMoD/aDRqKCXc4ilWE2+vbU+pAggKnknPDyO3B1rdf2
	hdkEtZq525YryvBbCFHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK0NI-003Zir-Ef; Tue, 15 Feb 2022 16:08:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK0Jw-003Y97-ED
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 16:04:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CE8EAB81AE6;
 Tue, 15 Feb 2022 16:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8326EC340EB;
 Tue, 15 Feb 2022 16:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644941089;
 bh=4Fn2tQZHYMpisfGny9s7PMSOteToJFxy1fpDT9qsL/M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LyqJauKIRL7zzFOxSSzuV4sPvHKSMks6LI3MMs8fyKao/BGBPT0csBYTLJQeTW/JD
 ps+YGpJ5YBqPHliptwQ/eEcJ275mryrK2t2bGi62nvnUp6UWafLdCEbzz079z6ucVd
 Dgb69zOS6zpYfDdiUVv33JTYt0LEOCCjhyULPgUGwhI52lDB4T6ix82Fmjv230cqCd
 XRqyoV+TClHwmZvAiic80eERxMH09CdM3xcQgxP3Pt0zBu8KeFI9q4ymsXYWSbj66/
 OYnLtWQ34FueotGYUpxbz1zXQKuJ8XIOJXWE/ZBq/FrjFM2V65wBZJcXWSfDmzFkt1
 DY7YI5Qr7mL9g==
Date: Tue, 15 Feb 2022 23:56:57 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 0/6] Provide a fraemework for RISC-V ISA extensions
Message-ID: <YgvNSeUekqEVS1yE@xhacker>
References: <20220215090211.911366-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220215090211.911366-1-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_080452_872851_75D444FC 
X-CRM114-Status: GOOD (  18.95  )
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

On Tue, Feb 15, 2022 at 01:02:05AM -0800, Atish Patra wrote:
> This series implements a generic framework to parse multi-letter ISA
> extensions. This series is based on Tsukasa's v3 isa extension improvement
> series[1]. I have fixed few bugs and improved comments from that series
> (PATCH1-3). I have not used PATCH 4 from that series as we are not using
> ISA extension versioning as of now. We can add that later if required.
> 
> PATCH 4 allows the probing of multi-letter extensions via a macro.
> It continues to use the common isa extensions between all the harts.
> Thus hetergenous hart systems will only see the common ISA extensions.
> 
> PATCH 6 improves the /proc/cpuinfo interface for the available ISA extensions
> via /proc/cpuinfo.
> 
> Here is the example output of /proc/cpuinfo:
> (with debug patches in Qemu and Linux kernel)
> 
> / # cat /proc/cpuinfo
> processor	: 0
> hart		: 0
> isa		: rv64imafdcsu
> isa-ext		: sstc,sscofpmf
> mmu		: sv48
> 
> processor	: 1
> hart		: 1
> isa		: rv64imafdcsu
> isa-ext		: sstc,sscofpmf
> mmu		: sv48
> 
> processor	: 2
> hart		: 2
> isa		: rv64imafdcsu
> isa-ext		: sstc,sscofpmf
> mmu		: sv48
> 
> processor	: 3
> hart		: 3
> isa		: rv64imafdcsu
> isa-ext		: sstc,sscofpmf
> mmu		: sv48
> 
> Anybody adding support for any new multi-letter extensions should add an
> entry to the riscv_isa_ext_id and the isa extension array. 
> E.g. The patch[2] adds the support for various ISA extensions.

Hi Atish,

Thanks for this series. I'm thinking cpu features VS ISA extenstions.
I'm converting the sv48 to static key:
https://lore.kernel.org/linux-riscv/20220125165036.987-1-jszhang@kernel.org/

Previously, I thought the SV48 as a cpu feature, and there will be
more and more cpu features, so I implemented an unified static key
mechanism for CPU features. But after reading this series, I think
I may need to rebase(even reimplement) the above patch to your series.
But I'm a bit confused by CPU features VS ISA extenstions now:

1. Is cpu feature  == ISA extension?

2. Is SV48 considered as ISA extension?
If yes, now SV48 or not is determined during runtime, but current ISA
extensions seem parsed from DT. So how to support those ISA extensions
which can be determined during runtime?

Could you please share your thought?

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
