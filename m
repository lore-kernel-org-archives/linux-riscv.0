Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EEA7C64EB1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 13:46:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E51A620868
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 13:46:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f8eoYQ9k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E51A620868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQgshYmPiOuBEQYotoC3gloa983lM88278iOlzjVnQs=; b=f8eoYQ9k/fBuDQ
	dDkGZT86Zag36Yb8KloK3T1dyA/yPkl1vAb/kSAVgvXpj5oexDaifCVfKVtxYvIpYXCDNbyAU7Eew
	niTz6cddiUxknhyDvwzeOfiGcLviY/YVMC8xMX1F1iIrwHDKiL5376gtxi4zNmRSvTJZ5S2au0Qv3
	5D7jrSebCYnpZkO1LYSuNV7hRjTTGpSw3E6Gqi/lbbkFOLSYF1Y67p/ZUmfwsJuwYvdewKQ135n0j
	lstage4wuiWx6TUAahUWPhhzWXurdCsgN3TR5GT698JZHZBeitFyPjHKcureMarD6XOT0BwgRDiw5
	6P0qDk3hGVg7P2zxQwtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVGS6-0002TE-PB; Fri, 07 Dec 2018 13:45:58 +0000
Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVGRu-0002Dq-FN; Fri, 07 Dec 2018 13:45:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33EAF15AB;
 Fri,  7 Dec 2018 05:45:34 -0800 (PST)
Received: from e105550-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A608C3F5AF;
 Fri,  7 Dec 2018 05:45:30 -0800 (PST)
Date: Fri, 7 Dec 2018 13:45:21 +0000
From: Morten Rasmussen <morten.rasmussen@arm.com>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFT PATCH v1 0/4] Unify CPU topology across ARM64 & RISC-V
Message-ID: <20181207134509.GA5913@e105550-lin.cambridge.arm.com>
References: <1543534100-3654-1-git-send-email-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1543534100-3654-1-git-send-email-atish.patra@wdc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_054546_520767_6BDAF63A 
X-CRM114-Status: GOOD (  16.84  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Juri Lelli <juri.lelli@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, Jeremy Linton <jeremy.linton@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-riscv@lists.infradead.org,
 Ingo Molnar <mingo@kernel.org>,
 "moderated list:ARM64 PORT \(AARCH64 ARCHITECTURE\)"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On Thu, Nov 29, 2018 at 03:28:16PM -0800, Atish Patra wrote:
> The cpu-map DT entry in ARM64 can describe the CPU topology in
> much better way compared to other existing approaches. RISC-V can
> easily adopt this binding to represent it's own CPU topology.
> Thus, both cpu-map DT binding and topology parsing code can be
> moved to a common location so that RISC-V or any other
> architecture can leverage that.
> 
> The relevant discussion regarding unifying cpu topology can be
> found in [1].
> 
> arch_topology seems to be a perfect place to move the common
> code. I have not introduced any functional changes in the moved
> code. The only downside in this approach is that the capacity
> code will be executed for RISC-V as well. But, it will exit
> immediately after not able to find the appropriate DT node. If
> the overhead is considered too much, we can always compile out
> capacity related functions under a different config for the
> architectures that do not support them.
> 
> The patches have been tested for RISC-V and compile tested for
> ARM64 & x86.

The cpu-map bindings are used for arch/arm too, and so is
arch_topology.c. In fact, it was introduced to allow code-sharing
between arm and arm64. Applying patch three breaks arm.

Moving the DT parsing to arch_topology.c we have to unify all three
architectures. Be aware that arm and arm64 have some differences in how
they detect cpu capacities. I think we might have to look at the split
of code between arch/* and arch_topology.c again :-/

Morten

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
