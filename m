Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D47F45A12
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Apr 2026 01:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FmnsbfDs1fu0u2+4U0duXcowMqQuLn44oMfNRUCIEIg=; b=h72J6c+M+fo/ks
	3tKTlQtkSlMivyyNpANO1tcpgWwRRtMx9QAFCoEK+6YOMSBEO52cn25jmmK/z0aP0NrhMqRuhqg6c
	KZddgds+D5HP6chIy4tM5dEqRXZ6InP5DW4BMXieiHwersmkpXr8G2q/ftH+6D3fZ6oZEBpH04pwN
	3SprhfFaCtTspeNROLgLYUBZwA1lWQeBflTx9JNNqaIlueHOGzOeH6ZF2y+hpUxeVhsKFF9Sd0ALu
	J5hm2bTPZAWTUXpY/fxZ8QhAEqiFMlqpbQxHynFQftOH74eo3DVOJFcgo1huFRVbl6OcbAlVmm/pd
	glI5quOUU5cdBCmJfyOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBNJ1-0000000D1Fk-3nVy;
	Sat, 11 Apr 2026 01:38:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBNJ0-0000000D1FY-40Sq
	for linux-riscv@lists.infradead.org;
	Sat, 11 Apr 2026 01:38:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 171A6600AE;
	Sat, 11 Apr 2026 01:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D961C19421;
	Sat, 11 Apr 2026 01:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775871517;
	bh=PEj9Q7l3Q+I2cu0wKuAmFE3doQ9Vwu+3owJxUeXmIyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jHLVwyIhKCNKGtBR3YzUsLyMJMQTDSo0iU1iFRAzarY4ihN/IjbjJ3AYJ3cD3yLR9
	 67LlS3eNMhcHHk7NOZrVqgM+tk/XAWQg9V0Rpx32qYbhApGNWP/R3+KRmgbGB247PQ
	 pEq8mP7InWWjy7Mvb3gpbtCenmiP29bc18uVXc02KcQK+JR+86Gmps6v3FPOWl3RiV
	 yYOR+wzMX72poQHKH84HmS4vJ6WRv5f+50Cne/0iNDCqtFixvUPcho1zl2a9HQZZxt
	 Ni+sDcNh7xzff+2/rlRYBaO+LG/IX82RpO6FHDAJUyQw6dPKK49qO00kSswYJaAWsQ
	 16MOvVP6kVurg==
Date: Fri, 10 Apr 2026 18:38:35 -0700
From: Drew Fustini <fustini@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Michael Neuling <mikey@neuling.org>
Subject: Re: [PATCH] riscv: dts: tenstorrent: Add PMU node to blackhole for
 Linux perf support
Message-ID: <admmG0jkzpx0OzXi@x1>
References: <20260409-blackhole_pmu-v1-1-01a34bf46a1c@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260409-blackhole_pmu-v1-1-01a34bf46a1c@oss.tenstorrent.com>
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

On Thu, Apr 09, 2026 at 09:49:59PM -0500, Anirudh Srinivasan wrote:
> From: Michael Neuling <mikey@neuling.org>
> 
> Add a riscv,pmu device tree node with SBI PMU event mappings for the
> SiFive X280 hardware performance counters. This enables OpenSBI to
> expose the SBI PMU extension, allowing Linux perf to use the 4
> programmable counters (mhpmcounter3-6) across 3 event classes:
> instruction commit, microarchitectural, and memory system events.
> 
> Event encodings are derived from the SiFive Tenstorrent X280 MC Manual
> (21G3.04.00) Table 13, section 3.10.5.
> 
> Assisted-by: Claude:claude-opus-4-6[1m]
> Signed-off-by: Michael Neuling <mikey@neuling.org>
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
> Added a dependency of [1] to b4 so that checkpatch doesn't complain
> about the Assisted-by tag
> 
> [1] https://lore.kernel.org/all/20260311152039.254244-1-sashal@kernel.org/
> ---
>  arch/riscv/boot/dts/tenstorrent/blackhole.dtsi | 48 ++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>

If there are no objections, then I will apply it to
tenstorrent-dt-for-next.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
