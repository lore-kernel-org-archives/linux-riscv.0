Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D868ACAC5A0
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 22:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=QGmNFLTymoWlNMv66yzahdfHdlLRORkSwIL/ck031bw=; b=ApQRbMgplOOQuO
	0svPnVyfbKVbFCQNTL6BgvIrzJq88RjoLkGTMl+6pK/ML92htzgAXgEzXkt6ajDjD0gtN7avo6lg1
	7ju0VIvDeCLMUlyOvWFLULw5DfWAzHMgg8n9oOq9WmjG9vQ4xxCY39CvHI66FzkxU5/x+iqOISuU+
	hcv3GXyRoMjnZXWnepw/da75NCbylBuuRBbT4SySw0W5W5PnTQ4aB9iknau6nmi8jdR8y/w0d61KC
	t7iYub8KNnY4s/DvnvtcHFUJN6rlitpPON9uVy8KE8FIKFgbc16LQrVHR3jm24mb0MWIu2XF+UN/a
	AbC0GMcCxJrE+omD6BuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0CL-0000000F66R-3LQO;
	Wed, 17 Sep 2025 22:00:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0Bl-0000000F5Zu-0rFd
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 21:59:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5789D601E9;
	Wed, 17 Sep 2025 21:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C626EC4CEE7;
	Wed, 17 Sep 2025 21:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758146384;
	bh=Ms4zIK3ciyF4BwpMHGeMZVIXlgJkP7aXFnQ2D+V8mU0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ls+BvwCq0KajkMJX+MJcdaNZJeNvvWmelGxPaw0KYIcfi0TR1mG8iBybm6PU/7JDl
	 9hwdxfqo9t8VEHhn3NufnGjQ7KOfkA0R+g5HFl4awduYen4103ZyvbfT21a22u1h25
	 Qsk91Cp7xbexljBnzFdwXdtMDZXEskw567jHbT4f4sC1hKnjV0Z8ehPKkTdPi62mqr
	 CU18Rh9h+AUdRq8sfyA6c/oyU8++9jTMTibx7OJ9cz2sUI/J08IwQQG7LyxeHeGPEm
	 qm/O4761b7qaTRgd/jGUCcpg7d4PZOkKG0plU9tY94tENGkauKV8wqfr5vMaG4Roly
	 tR1XesySusK9A==
Date: Wed, 17 Sep 2025 16:59:42 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Randolph Lin <randolph@andestech.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alex@ghiti.fr,
	aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
	ben717@andestech.com, inochiama@gmail.com,
	thippeswamy.havalige@amd.com, namcao@linutronix.de,
	shradha.t@samsung.com, randolph.sklin@gmail.com,
	tim609@andestech.com
Subject: Re: [PATCH v2 2/5] dt-bindings: Add Andes QiLai PCIe support
Message-ID: <20250917215942.GA1877367@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250916100417.3036847-3-randolph@andestech.com>
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

Suggest following convention for subject lines (run "git log --oneline
Documentation/devicetree/bindings/pci/"), e.g.,

  dt-bindings: PCI: andes: Add Andes QiLai PCIe controller

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
