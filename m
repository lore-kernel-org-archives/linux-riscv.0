Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D705AF30297
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 01:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJ5VdRwgtha8vbgXYUTN5ELJwAHU3vx7zFIjs5xB5eA=; b=c5rdBwvQdb9KNM
	eZhf430+hiOJVMyWbWBPYx77UOS/dhQ7MvxKG5ZjickykeGNT9BhVhaRzI8U0xdpbfHWsr7fl9+GZ
	y1sumHFEbKVT9/Cb7de8Q/LsnCObj6ZKMa2y5FNVezsXOsGHFjz7UlH0fakYLwM89IrBpj7YMgzFn
	e+8XYKfDuTYw62opKSMZc5nTVizecC1QOKZB5rZsWkaxn5DPYextAR96eIUjTTap6UiYOqQOoo/t1
	kog3MX55Nh15hzuen40zStZP+e6y5USqcxduH4GZF+RxcH62hrZU4+E/4Il6hW6XlRcj1MfxZOMRR
	K3qO2FS7FCd4EsZ/Y3yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wwi-000000037ui-3ToW;
	Mon, 16 Mar 2026 01:40:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wwh-000000037u3-2NNM
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 01:40:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 758B9600AE;
	Mon, 16 Mar 2026 01:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52A9C4CEF7;
	Mon, 16 Mar 2026 01:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773625238;
	bh=ZPfHl5i+yhNvz8XVnNx77cuo9bMmwo9JExTG2xmxWdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OAu/F4aHmlmWHQxcnlZTuAnwdugHO0Ad0CNlSoMfqzipOIzDkfbfz6No9JTQ3wq+I
	 WtSDhQG0aX1jP7qhrlsvHPPwtkz4pk2tbXaejPimF/C/WwNTAkDJN0RPD2Z4zDwwgE
	 AiHJgFhIUMA9Quo1Rw2gQjOO/931x6C6ndUXrbQygtrwKNP31ptJ6W5ndfw8ZWAiTv
	 nyGcq9NPxaQRfCHD/JyPykq+8s6ie/eQSmeZypYBCEYwlG5GzqpuoaoKgTXJkWw/37
	 ZMjBEMEIdkVFvN4hfFJaiSZsfSuNM1+zQS09T5w6tWE9FA1K47QxlxiYL8WLVTnAvh
	 X8p+V2Attkgew==
Date: Mon, 16 Mar 2026 09:40:36 +0800
From: Yixun Lan <dlan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] reset: spacemit: k3: Decouple composite reset lines
Message-ID: <20260316014036-GKC415778@kernel.org>
References: <20260314-01-k3-reset-usb-pci-v2-1-9dc0976d524e@kernel.org>
 <20260315-crystal-ambrosial-hamster-4b970c@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260315-crystal-ambrosial-hamster-4b970c@quoll>
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

Hi Krzysztof, 

On 09:53 Sun 15 Mar     , Krzysztof Kozlowski wrote:
> On Sat, Mar 14, 2026 at 08:27:25AM +0000, Yixun Lan wrote:
> > Instead of grouping several different reset lines into one composite
> > reset, decouple them to individual ones which make it more aligned
> > with underlying hardware. And for DWC USB driver, it will match well
> > with the number of the reset property in the DT bindings.
> > 
> > The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
> > PHY. The PCIe controller also has three reset lines - DBI, Slave, Master.
> > Also three reset lines each for UCIE and RCPU block.
> > 
> > As an agreement with maintainer, the reset IDs has been rearranged as
> > contiguous number and pushed as a fix for the driver, and reason is that
> > there isn't any consumer of reset driver so far, so should not cause
> > any ABI breakage. Also, the changes of DT binding header file and reset
> > driver are merged together as one single commit to avoid git-bisect
> > breakage.
> > 
> > Fixes: 938ce3b16582 ("reset: spacemit: Add SpacemiT K3 reset driver)
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
I usually run "b4 prep --check" to do the check, but I do forget it this
time, sorry about this.. will be more cautious next time

With the check, the only problem I see is one double quotes missing 
at end of the line, for the code I didn't see any complaint, let me
know if I overlooked anything?

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
