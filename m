Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2666CCA0FFE
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 08:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kv6lq0it5U7Ydmoq0SRgJ1XGnvGecHcogtnv9eKLorw=; b=yfrEsMd3qsTo2R
	cfvjbpNj3sP4PklQ9M8EEXp6/td3UUZ8bNHy/DKYiwM+x/b8nQT+SL/2X+xpHiAGkjMI+kA42YsGf
	4iJi1SqAtDR/TTO5e1aZGFlUnmCtmiIvUgDV1+7Mv9sr4pCkf+5sOZSmC3FHtzEniSIUDnWgxOz2q
	TJ5myXLO7gKJAVq4bfZCCq9NMN0YlSpda6IVQ9jhhEbkW7Tc8H2tnRfOgsuxucBPm9G4EDfHGkXG/
	CcPdlpB9YgusSf82QOoUc7rcwNMJVR7PLKSHeEpYMOeASDiF0saNWbbmHpkYaFSjvvqTSYdCRXjsC
	ZrqHJLlHL1AXIJfmFvBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMhk-0000000GAfF-3ZlV;
	Tue, 02 Sep 2025 08:49:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMMv-0000000G2tD-1J1C
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 08:27:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 84FE6601FF;
	Tue,  2 Sep 2025 08:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95254C4CEED;
	Tue,  2 Sep 2025 08:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756801676;
	bh=LRzJOBxtCeh0osBT/DCK+SnqLQnyRNU+e7M/gZRt1JY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ouuy/hTdTiZsA9kGnTozVS6D5DWVfamu5aHp0HV1Nba9G2UmuiU5kJo34P4KfhVvy
	 TTuD3pROCPNaLCGL0d64ovtRta6TlwuVm0KZHsNZg51n8TRA18o3rHq0Wr853kJl4Q
	 HxFK+SNopggX/MRq26OqAjsGIcUmeFK9i6gFdhD9myMMGy0kKVJIo/u9Aa0EE5W3VN
	 WGjmNtu2FFOpAgALZZ2u9URVjQDJVPrJgw8fXhza1EryxGcuSpJaumwUPjMkYZyei4
	 CYXGdgLqOyyOsgfL5D7E2VzaSYxe+8AJBwLVIgVyBArruhM/cxDC+6jWkOKAiAor1J
	 oz+mUKqoxSVtQ==
Date: Tue, 2 Sep 2025 10:27:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 1/4] dt-bindings: reset: thead,th1520-reset: Add
 controllers for more subsys
Message-ID: <20250902-peach-jackal-of-judgment-8aee13@kuoka>
References: <20250901042320.22865-1-ziyao@disroot.org>
 <20250901042320.22865-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250901042320.22865-2-ziyao@disroot.org>
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
Cc: Drew Fustini <fustini@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michal Wilczynski <m.wilczynski@samsung.com>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Guo Ren <guoren@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 01, 2025 at 04:23:17AM +0000, Yao Zi wrote:
> +/* VO Subsystem */
>  #define TH1520_RESET_ID_GPU		0
>  #define TH1520_RESET_ID_GPU_CLKGEN	1
> -#define TH1520_RESET_ID_NPU		2
> -#define TH1520_RESET_ID_WDT0		3
> -#define TH1520_RESET_ID_WDT1		4

This is ABI break and deserves explanation and its own patchset.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
