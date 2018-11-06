Return-Path: <SRS0=W42x=NR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021D6C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 17:38:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C111A2081D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 17:38:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PzdjPJJe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EhwRDHqi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hOFUEPWd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C111A2081D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-ID:References:
	In-Reply-To:From:To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hitMnQAjdm8SBEibY+rjJ/JBaUoEJ/Pqbo1hWUX8XDI=; b=PzdjPJJeCdjd0T
	5M1+re0tWLguaTcSBstJfmrnw9d6efrXyutULdmjyMwy+adlv/56lBCRD0XUE9l8VMKOSG7GPsoWX
	rwPQbKXi3ibQZ8giQLlRmBE+dtvWODDh9537JGY0OU/zAnPYPPaE4u83zkcZRKRaUTMGgMUfv/kQ2
	GnU/y+Y37DYLaLTKKn7GD/QRU9wpdrL1CdmUgzEI6dy/xcRyHYFeoxNRx7sc1giaeGv9KzfeuDEXw
	0e0ksUNl6zrrB2iCEnvfxB1CKMcq9DYh/pUWg0Q3sPK//GonwmxDMW6JnoLfKsBCJ/mJUljM9MKBQ
	MLP49fuQqMhH8YHKE0eA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gK5JS-0005DF-2r; Tue, 06 Nov 2018 17:38:50 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK5EZ-0007o3-HU
 for linux-riscv@bombadil.infradead.org; Tue, 06 Nov 2018 17:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Subject:Message-ID:References:Cc:
 In-Reply-To:From:To:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+5bU382Nd/RMBexRqEHZQhOt+y1Q31unWejRbiDM/sw=; b=EhwRDHqiKeWKYH4L+xtftcjE6/
 gqAz1VJ4vcGV/jlRZG6vjaXScmd6Y3AgkpC7a8Mub+xmfekeWmt50ralfdC+DlTGpiLyQO8zqeYjP
 WhI+xBNW01spIp6mh183CQaeGOMnWcUTE+HV5IXEp1+paaBUHRqZmfHYjF8gfiUyUm/zRYXIxvbGO
 DqUe9vrvZtP5QSiMmItrDC2loWl5fBJ3gLrokCUExmVpZFl1G/F9kMyBHKzO2E2f4LYSzC9JfGNqF
 gYKj3P1sPhP7lmcBZNGFSfKdm6Qw8DXoOzHroZYqfIbbVaxtHByN09Oux04BL9N4+tNkMV0RVwHyN
 Dklo0xdQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK5EX-0000nl-2i
 for linux-riscv@lists.infradead.org; Tue, 06 Nov 2018 17:33:45 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 07CCB2085B;
 Tue,  6 Nov 2018 17:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1541525613;
 bh=n3TDijDUCf78B52Ea2HO0SYvgposIlMHA4/tTDQjAHY=;
 h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
 b=hOFUEPWddvn9M3NGbcME1uGq8+x+quIN/Pr2OxNpSd+c5KKpPT48Ud+BkQ8DMHwho
 vxOecj53YCmm39vnwn3hec6zAdITfdORI538kW7RzB1BSE40htA/TawgYG6v4krd3Z
 OWW1Kb0dS+uhWcPKnoJ6txUdqr3KqcbrNmRVMs7M=
MIME-Version: 1.0
To: Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181020135024.28573-3-paul.walmsley@sifive.com>
References: <20181020135024.28573-1-paul.walmsley@sifive.com>
 <20181020135024.28573-3-paul.walmsley@sifive.com>
Message-ID:
 <154152561238.88331.13239370518226908068@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v2 2/3] dt-bindings: clk: add documentation for the SiFive
 PRCI driver
Date: Tue, 06 Nov 2018 09:33:32 -0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181106_123345_189106_F9FED386 
X-CRM114-Status: GOOD (  13.75  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul@pwsan.com>,
 Megan Wachs <megan@sifive.com>, Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181106173332.ghIl0Rk9R919ApcTZuvktdk7DFqG9nKEkbtz7yFsJUU@z>

Quoting Paul Walmsley (2018-10-20 06:50:23)
> diff --git a/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
> new file mode 100644
> index 000000000000..d7c1e83fa5ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
> @@ -0,0 +1,43 @@
> +SiFive FU540 PRCI bindings
> +
> +On the FU540 family of SoCs, most system-wide clock and reset integration
> +is via the PRCI IP block.
> +
> +Required properties:
> +- compatible: Should be "sifive,<chip>-prci<version>".  As of the time this
> +              file was written, only one value is supported:

I don't think we need the "As of the time" sentence. It will become out
of date almost immediately so why not just say "The list of supported
values is:"?

> +             "sifive,fu540-c000-prci0"
> +- reg: Should describe the PRCI's register target physical address region
> +- clocks: Should point to the hfclk device tree node and the rtcclk
> +          device tree node.  The RTC clock here is not a time-of-day clock,
> +         but is instead a high-stability clock source for system timers
> +         and cycle counters.
> +- #clock-cells: Should be <1>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
