Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CD5CCD183
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 20:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gcPqmuGysIwtdmihpwZCR+DMPdpOeZAR42pZrVlPQlM=; b=DUa1V2nc1ojm1G
	ocWAHzp3NfGwatuQSc9VN/LVOLUPBDcy6oDvRq6rGq9XbFMkei4pvsKRhRadrRhciIxeqgkHkuypw
	Vag3OPyi5QRS1Jq1vdrJRxu8bXpL9U3+z+pRBu+lgJkgWyNR2Ra2TINEh5IgX06ZfqxKShpMybKFa
	OIRrz3l2RWNrhgZb8kVOYqypttrBquCdwUQcUYaDx4DXw6oUs9I9j9tfaHsOJNAZcJYVehbhwPol0
	HT8oNppSSLEy4t6nskgJWxcWD9CmTJJDSoYUuPEjyeRgx21UUs5d4NYGhytejJlNUcZ0jNQg44MGG
	lU/bzjp/G12RwYUVXWXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6xhM-000000076sX-0sou;
	Thu, 09 Oct 2025 20:57:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6xhJ-000000076rW-2RBi
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 20:57:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 432F4491A2;
	Thu,  9 Oct 2025 20:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6ED3C4CEFE;
	Thu,  9 Oct 2025 20:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760043433;
	bh=lBI1eCHf+aO2ITFQm4OLOPGZVt4N95diGCPMOVo2W/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIveV+BNg17Ru92Km71oihk9DiiSLbwqT02UzgdvMxjmgHzaDS5b59dqnEQNdfLyU
	 qSZWAHieuUqI6mJacQ3E5y0Rna5r678zB2CYAzh+pkDHugqwJt8Ebu+kS/GB1URCve
	 cLwLftPz1LHHGgwq4S0oaoP/0uKZEUWbvIDh2MhHpkB5EQiVDpGXjofX0fRrBtlBeq
	 oro20Dyn8JLwie1GXZRAf0Yl7kqTWW2Uoje4KaYxUXBuKlTHhlCWuW11+ZwbUA0G/4
	 PZSkAaYOVl03rOE/abY3jwHSnFPxhcAOZDNVO4SQoke69CyCSFIpbyNhpAX6iWf48F
	 oVTmPgfhc0hEg==
Date: Thu, 9 Oct 2025 15:57:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Neuling <mikey@neuling.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anirudh Srinivasan <asrinivasan@tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <joel@jms.id.au>, Andy Gross <agross@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>
Subject: Re: [PATCH v2 5/8] dt-bindings: interrupt-controller: Add
 Tenstorrent Blackhole compatible
Message-ID: <176004343108.3328456.14834767754119467373.robh@kernel.org>
References: <20251006-tt-bh-dts-v2-0-ed90dc4b3e22@oss.tenstorrent.com>
 <20251006-tt-bh-dts-v2-5-ed90dc4b3e22@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251006-tt-bh-dts-v2-5-ed90dc4b3e22@oss.tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_135713_635400_6B7F7E45 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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


On Mon, 06 Oct 2025 14:21:45 -0700, Drew Fustini wrote:
> From: Drew Fustini <dfustini@oss.tenstorrent.com>
> 
> Document compatible for the PLIC in the Tenstorrent Blackhole SoC.
> 
> Signed-off-by: Drew Fustini <dfustini@oss.tenstorrent.com>
> ---
>  .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
