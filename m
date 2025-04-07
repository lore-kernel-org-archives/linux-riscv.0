Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3C6C369A6
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 18:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DlCLBl1WGg3TZ569ZrM1ZD6tUOGz85rGayflFVNMZWA=; b=Sr8emNLecTTo4I
	4i5HKB6iK5IXVtgDPexG1pv1SWkOI9wkfqKN/0jEG1IlEpPDOGNfO18wpPmj9m9EvybvmO6U8CD8E
	Y1hZJXVAIP/mYf2XQb1yDXHUZXslOttdhMDSyY7jcOqhomkhwS9x8jQDnh2eYoPL8I0P2bZLDq/Ak
	t0HGJOoP/h7FiOYVyLCeqYFKIgoGz/M4Nx/tuMyoNFWg7vm6BbiPIQhP5+SmPvFtRG2cWwrPEEmRF
	iIJBENwLLmqBfHcYvhpHuv7UonFIAR3jDvYd6Skw35jfVz/Y1tspS2xi9z5eXpznscHAfOfyDoFRz
	IbPYYamvVwcmV4D8/+kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1r1W-00000001VJ6-3GUb;
	Mon, 07 Apr 2025 18:16:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1omo-000000011bO-3kpp
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 15:53:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B810461155;
	Mon,  7 Apr 2025 15:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B207C4CEE7;
	Mon,  7 Apr 2025 15:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744041201;
	bh=NIrIJzzmdQL32hJN2sevH3JixRQ0+8i8QHBKjFJpt5o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CcuoTgV47FXyu6zNK+dq2segR1GdghpPTPda+6XN00y2K+8rJo7H0kIZtgREE8ret
	 xiPrhuZeMJZiNO0f5SgpSU4bn+WB1SwVk9QMgsIRaJZrsRCCJJ5MQq22uaklCAWr3p
	 RCSa96y7/Tjg8eBgeGwWMTKuxoTPQfNUKrnK2m8a7G+FbugClJgP/pzrNVPMRreg5f
	 LGbpzKYe46OlGiCOLqdsWXslA7ZF8zXhprO5LZjFqafFLSBA1Nej6sP1BBnwgyG/Fv
	 xMB7FCT0vP8cSGaTEo3sT2/hSQVdC8tx7eAdlyNlmCuVUTpMigDARSS/KeuyfJ6Zgr
	 CmfeyiEeMcyjQ==
From: Conor Dooley <conor@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	drew@pdp7.com,
	guoren@kernel.org,
	wefu@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	jszhang@kernel.org,
	ulf.hansson@linaro.org,
	m.szyprowski@samsung.com,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v8 0/5] TH1520 SoC: Add AON firmware & power-domain support
Date: Mon,  7 Apr 2025 16:53:03 +0100
Message-ID: <20250407-diabolic-draw-200389f7d6f0@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250311171900.1549916-1-m.wilczynski@samsung.com>
References: <CGME20250311172030eucas1p12dda42760f751174e774b8d1a3d3f4cd@eucas1p1.samsung.com> <20250311171900.1549916-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=657; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=n+5hM5kQu6ehBQ3n8017RawWqIN18GKPHpFuSaJtspw=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOmfv9w78Ij31uJti0qcPn9UvyjW1zH94RHDDZG1DJ+6X /yfkxfp3lHKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJzCpk+M1mvj/LPvDz037h SRO3vs1+a+fS33fCuZm172lyo7OdYxsjQ8sti/PNp0IbLrEFvmBy6Db5KMIf8iaLq0X9ocBlnz5 1VgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Conor Dooley <conor.dooley@microchip.com>

On Tue, 11 Mar 2025 18:18:55 +0100, Michal Wilczynski wrote:
> This patch series introduces and documents power management (PM) support and
> the AON firmware driver for the T-Head TH1520 SoC, as used on the LicheePi 4A
> board. While part of a larger effort to enable the Imagination BXM-4-64 GPU
> upstream, these patches can merge independently.
> 
> Bigger series cover letter:
> https://lore.kernel.org/all/20250219140239.1378758-1-m.wilczynski@samsung.com/
> 
> [...]

Applied to riscv-config-for-next, thanks!

[5/5] riscv: Enable PM_GENERIC_DOMAINS for T-Head SoCs
      https://git.kernel.org/conor/c/54fe9380a50b

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
