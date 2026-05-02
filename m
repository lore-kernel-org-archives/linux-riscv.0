Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC37CD13DA
	for <linux-riscv@archiver.kernel.org>; Sat,  2 May 2026 11:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DpOa00QuMBB8hIYdLLtV10liKmnl3rfQnx2f+l9A7Uw=; b=fIgUEtEUz2BW52
	EISlgnsBBU5pXZAC+fUsr3Pb/UFKjPE17SPn37gejB5ierjTPSqQuV6B61ENfwY/Od+svKRnzsCyF
	9oiurAVQlYjeKgKk/4icYOh6sdtkyVKY+9OyfXxDI2127n8rKDGe8HoDZP+4G63ATLkhIMACg+Q58
	IQTwzKCeNQ1zp1YtI/u70SHyIBpHLuVCTvcVZ2+wPrI4Yr7I/qjJ5bKGIDJbNqv5qQELEh84m+AM3
	QtzP1n2qXxwz2AdjMmUge9AFieK+ZSI3Ufy5xe861TF+QI2YG/LGR3h/4T8H8Xcozt3OFmQH+bGAI
	9yrr6K7kGk/lu4g7i6eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ8Zq-00000008uaN-2ENb;
	Sat, 02 May 2026 11:32:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ8Zp-00000008uZr-1WFX
	for linux-riscv@lists.infradead.org;
	Sat, 02 May 2026 11:32:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 383DB60126;
	Sat,  2 May 2026 11:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03E3C19425;
	Sat,  2 May 2026 11:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777721523;
	bh=9D6m49EpCS2agbuFMF6TMaS57eerDfloBvYKv2rxZNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uDLo3XuNIlDMqMtt7vkRuIvt0FEhRxZ8JHg4wZ+qEg3QbyeiuFibOhXsuvm1sS3Y+
	 rn7AKd+EcHl8033XvY5fQ7/BouDkCLv9ZIMZ4NgGVH99PxThqvyqBMiMogPtwk7gSV
	 9rmiQ7qxE9SYdpXWOvmI5UCOZFlS9nd8mPPIR54gHAhFYEHTuN7mDRgGVky9CTup8Y
	 ys0am7iqd8/Wex442QdGtpgh11LBJuMMn+ponirVZCWa3HqI3oomEeEG/+Vdbno/dH
	 RACWiYxCedxmlu1Zxewp/6dTdyV/ADiXVPsxDNNbCM+Jq3fsDM8SOra06Is3FiFNZZ
	 XhC17t05Ezypw==
Date: Sat, 2 May 2026 11:32:01 +0000
From: Yixun Lan <dlan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: soc: spacemit: k3: Add PCIe DBI clock
 IDs
Message-ID: <20260502113201-GKB3266396@kernel.org>
References: <20260430-06-pci-clk-fix-v1-0-32fdc77c02ab@kernel.org>
 <20260430-06-pci-clk-fix-v1-1-32fdc77c02ab@kernel.org>
 <20260430-plug-bolt-8ff9137717fa@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260430-plug-bolt-8ff9137717fa@spud>
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

On 19:55 Thu 30 Apr     , Conor Dooley wrote:
> On Thu, Apr 30, 2026 at 10:30:26AM +0000, Yixun Lan wrote:
> > Add clock IDs of PCIe DBI (Data Bus Interface) clock.
> > 
> > Fixes: efe897b557e2 ("dt-bindings: soc: spacemit: k3: add clock support")
> 
> Why is this a fix? As-is, this looks like you're abusing the Fixes tag
> so that this gets backported alongside things that are a fix that depend
> on it.
Ok, will drop the Fixes tag, since the PCIe isn't actually activated yet

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
