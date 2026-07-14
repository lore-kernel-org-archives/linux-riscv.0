Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D089BC44501
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 15:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9HIZYdO9TnWAkTK4Poys+CcoNEvWB15XciVO4JfREq0=; b=xt4nsutgrG833+
	tExVjKaLo+MQEzGz8cKhsA3t212zCm3y56c6FQ8Su/RdY/3HUPFOFyzhtt/6CCexiyyt/oaUdp1qb
	DUxPxby5UMT4Fry3P7JB4t8HsEo3xZ9nA8CMZcigAtZ9Vgu8ilWzmUmQwHOiDxSWgTqx2yaRvAdl3
	IM9t/ziJZ/lUbZy3oagqqKIGqx5faZs5l9pQG7kHW+3iFVuw8Pg5JUTszqlF0ItfEU/7OQhYAiV1O
	PDtKW67keikc7/yeyxX0LsWOlKJm/O0nmhXyP6zd74HRNYQLbNYd7T43hHqurANW4sfzDoQgTxX8O
	WiwkO4CK2YcmvEcA8GlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfMn-0000000CaU6-2cyc;
	Tue, 14 Jul 2026 15:48:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfMm-0000000CaTM-3764
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Jul 2026 15:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=55kFwZcyLAenN43ZLuEjv7BCAgpfuHgW7xOgo1PJo20=; b=a6TEqIRYr7ifYxRDE0N/lFwJnh
	mYPnZkaUty2bJkWfNhGJ86uU6lC0w+C+EtP2FVR3pBcZENq4Fnan1LJzAwwmgaaOyhbVYfYa8V3Dz
	QP5yocXh5IeI512Q6/FBwWvHeWx4sRzM8jsgbDsGJtQuwXzHtrJAGDdySfBUPmM6IomYdBUn4qssz
	dOR5Qun5FT0IB8ZgGwBVZxMXIv3mHgeMdGWRw7MB3tN0ArGV00WZQ2kCUtZ3vP3AYzLVPsND/h94M
	Klecr8rBHpCjAlfDFlIMfb5drMRmVySipZ5yGDFTBMBW5iDTbLyTKGTndx03oIEQAcyeTxDR2VfWh
	WSL1t12g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjfMj-0000000Cf3a-3xbd
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 15:48:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14FD7339;
	Tue, 14 Jul 2026 08:48:08 -0700 (PDT)
Received: from fedora (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DA393F915;
	Tue, 14 Jul 2026 08:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784044092; bh=9aXdBWEwsJumyCg9xLtSRXFaeIdV2MMmJsPDDfWFekQ=;
	h=From:To:Cc:Subject:Date:From;
	b=UhCtz/qg/acRgMI7Pp6smqYU+PiwBete9G16MDCQ6cx7suMrutm1GT77hMTP6v7f0
	 auwz1TaacU4NdPpMHTvlTHaPEdSvful3nzSEibza4/cQmNx7ivjQNex0jmc5LHfLIW
	 B866ynTrO3WWgy9hz2n19hbHm8uH4Sc1Ts6rP/5M=
From: Bill Roberts <bill.roberts@arm.com>
To: "H. Peter Anvin" <hpa@zytor.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Bill Roberts <bill.roberts@arm.com>
Subject: [PATCH 0/2] x86: Support shstk via prctl
Date: Tue, 14 Jul 2026 10:47:38 -0500
Message-ID: <20260714154740.140431-1-bill.roberts@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_164814_201173_A05E25AA 
X-CRM114-Status: UNSURE (   8.74  )
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

The motivation for having a common interface between x86 and others is:
1. Common permission checking for an LSM (future patches)
2. Common userspace

This leaves the arch_prctl interface intact, so older userspaces will
continue to work. However, for item 1, when we introduce LSM hooks, they
will need to reside on both the prctl and arch_prctl interfaces but will
both call into the LSM with all of the same permission bits and checks.

The SE Linux patches will follow these, after I address any feedback on
these patches, since they can stand alone.

Bill Roberts (2):
  x86/shstk: support via prctl
  selftests/x86: add generic prctl shadow stack test

 arch/x86/kernel/shstk.c                       | 35 ++++++++++++
 tools/testing/selftests/x86/Makefile          |  3 +-
 .../testing/selftests/x86/test_shadow_stack.c | 55 +++++++++++++++----
 .../selftests/x86/test_shadow_stack_prctl.c   |  3 +
 4 files changed, 85 insertions(+), 11 deletions(-)
 create mode 100644 tools/testing/selftests/x86/test_shadow_stack_prctl.c

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
