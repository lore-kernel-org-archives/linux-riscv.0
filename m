Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40E3C61DB2
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 05:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=igDn2K7NHfmmit1Ecpu7M6JHHnXjFhqv3tAtFfgjjII=; b=uPidHU4iMJ8wYA
	lS9zgu/Su6xPzeI4dPhmgDQGUIa/1G9l2HRUDnwa1R+bzAkze4HVBbBmGbRq/lnBUPfOAP3fQ15r0
	5M3DiHDpQsZq+UDkhYHAVPzLCbTVuKFOrEwzb7FEwrb+PGOvZBAVws8ple5oq4k9jM7blsr4aVFyy
	msfgOjHFzSSiafJj2PZnmiwiFNvj+en0l3tDZq1c6W5cbiHT/Fc3kdI5n0lZfOPbVtKK4G3tzqqpw
	o7ihLUw8tUxCuhIlT7BejOcFUFlxLuIzoOJKkU+3eNEq/yDaOwJNr62HO/oAEb4GcBiddAwmmmcGg
	4tKzwOqiDwqgX37h+mkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPwZP-0000000FLSN-3VmM;
	Fri, 13 Jun 2025 05:03:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPwZN-0000000FLRz-0sNM
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 05:03:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DE37450DA;
	Fri, 13 Jun 2025 05:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888CDC4CEED;
	Fri, 13 Jun 2025 05:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749790991;
	bh=28rc7+v2kVerXbyWw3H3/T6kr4GP6Mq7cNkFNrIXQNg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HE2jeHGpZEIpEa7JSqyBP6T/bb04h6phgaAJVRf8pB34y1utOutI5D7WNH9Bu6yFi
	 1K6N84HfvDGSEL9GTJ60egmOOykPwwCURDOLzjiAX0ACTkxIbm5KdFkzgPyvZTLZEq
	 8xkVvtiuxgeWCMVZ7Hd+cYopqEBpAjo/njYAl7x3fGSkMSXTsoU7BUW1lsb5uXKs9m
	 DohChY2Ptfp0wC/uCNJZ3q9+0DrX2qqu9Izj6/Ia60v6QyQHxXdrDtLNNEjXAqmexn
	 so2m4sfzyeFoyv1FKH3dFyLk/OLNHG1DGOSy4qtkTNuUBWiWzT+ntZZpu83WhO05EX
	 Z2HOOEtG2IX0g==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Niklas Cassel <cassel@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Shradha Todi <shradha.t@samsung.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3 0/2] riscv: sophgo Add PCIe support to Sophgo SG2044 SoC
Date: Fri, 13 Jun 2025 10:32:54 +0530
Message-ID: <174979096373.22387.8666752122012744282.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504004420.202685-1-inochiama@gmail.com>
References: <20250504004420.202685-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_220313_269358_B4027981 
X-CRM114-Status: UNSURE (   6.05  )
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


On Sun, 04 May 2025 08:44:17 +0800, Inochi Amaoto wrote:
> Sophgo's SG2044 SoC uses Synopsys Designware PCIe core
> to implement RC mode.
> 
> For legacy interrupt, the PCIe controller on SG2044 implement
> its own legacy interrupt controller. For MSI/MSI-X, it use an
> external interrupt controller to handle.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: pci: Add Sophgo SG2044 PCIe host
      commit: a202f09e3e30622fdcae7d740dbf87fb0f032dd5
[2/2] PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver
      commit: 74ab255bab3082fa6bd2a925a986526e093d615b

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
