Return-Path: <SRS0=qdQm=OM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1706C04EBF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Dec 2018 17:00:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4F8220834
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Dec 2018 17:00:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dLcyFqVz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4F8220834
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3n5Qljcn6UhE6S3AJ6mlNpu4xsRwrfNpr7BYrBQQKYI=; b=dLcyFqVzICJ+jP
	nuzg6HqvmtNybl7aZiKfdsVIVHwvtC4Vv3OxwnQoUI8nfoWHnML0coFJIpPu+TPNSR5DJfxWje1Zn
	NOgDK9K0wTMdg0n4vAEOFqR64pUnJE0UPussLl3vq5I6vJw0ppS5azI84v3KCBTHIb2adK/SoLsf6
	90Tdlr12aYg36m/MMIz6ezfZj2hnNuqJCUcLAbL/VMd7UkwjDsfMSeqEFJduu8+Ceo8PhhGjehVIZ
	6v+C+k7LQ8+CmmrW4A70iVpKUehT1xZXIwL2P8QtWZoc+Qe2m2gRy2B9iZIyO8VX2Gz9vp0nYH5qQ
	2uf4vKGVIgJXD8hGQefA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTra5-0004dx-Ki; Mon, 03 Dec 2018 17:00:25 +0000
Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTrZu-0003ak-Vz; Mon, 03 Dec 2018 17:00:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5FD81682;
 Mon,  3 Dec 2018 09:00:03 -0800 (PST)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42E053F59C;
 Mon,  3 Dec 2018 09:00:00 -0800 (PST)
Date: Mon, 3 Dec 2018 16:59:57 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFT PATCH v1 4/4] RISC-V: Parse cpu topology during boot.
Message-ID: <20181203165957.GC17883@e107155-lin>
References: <1543534100-3654-1-git-send-email-atish.patra@wdc.com>
 <1543534100-3654-5-git-send-email-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1543534100-3654-5-git-send-email-atish.patra@wdc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_090015_037383_B0CDCA1C 
X-CRM114-Status: GOOD (  10.22  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, linux-riscv@lists.infradead.org,
 Morten Rasmussen <morten.rasmussen@arm.com>, Juri Lelli <juri.lelli@arm.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Ingo Molnar <mingo@kernel.org>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "moderated list:ARM64 PORT \(AARCH64 ARCHITECTURE\)"
 <linux-arm-kernel@lists.infradead.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Jeremy Linton <jeremy.linton@arm.com>, Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 29, 2018 at 03:28:20PM -0800, Atish Patra wrote:
> Currently, there are no topology defined for RISC-V.
> Parse the cpu-map node from device tree and setup the
> cpu topology.
>
> CPU topology after applying the patch.
> $cat /sys/devices/system/cpu/cpu2/topology/core_siblings_list
> 0-3
> $cat /sys/devices/system/cpu/cpu3/topology/core_siblings_list
> 0-3
> $cat /sys/devices/system/cpu/cpu3/topology/physical_package_id
> 0
> $cat /sys/devices/system/cpu/cpu3/topology/core_id
> 3
>

That looks simple. Good reuse and thanks for unifying.

FWIW,

Acked-by:Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
