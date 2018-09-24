Return-Path: <SRS0=VRtT=MG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3951ECE568
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 24 Sep 2018 20:46:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D19B2098A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 24 Sep 2018 20:46:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a0SxyLUX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MYoI4VPK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D19B2098A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:Subject:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ye8oUHt0qfsLiTAYV3eAbmgBfJjxPBc4flzt2ssWlF0=; b=a0SxyLUXoQtPyb
	oXx38KW+txjpa4rvAGdJyNuRLpKVO/0DfH3hAUmsjuCB2ruFaYrOcANvVbvpW+D8VCXY3WGLGI8eq
	MshAymnLwRr3do3EBXNgfoGWwWNfJyUqEtSi9NojweZjmuWw7FsWpyx34K7m5bSyGU2CuA5YUHUtP
	4+JK3GTL7lVI1Fkf8o4dzac4yrlWiGAMt41UF1S5LxB1C+dSamP4WCjtPnJBdGhtp0+w1LqGg7ytZ
	P2kkIpbLiQeurhCiqVCDjDX32uFkvg31xGZuw0hHDLM92J6Jq/INV3kSVGRtFs5hJF0g/3Vgo5W4b
	K6dOhRd0zuJh/H7a6FgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4XkH-00046h-1n; Mon, 24 Sep 2018 20:46:17 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4Xju-00045B-40
 for linux-riscv@lists.infradead.org; Mon, 24 Sep 2018 20:45:55 +0000
Received: by mail-pg1-x542.google.com with SMTP id z3-v6so4809106pgv.8
 for <linux-riscv@lists.infradead.org>; Mon, 24 Sep 2018 13:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:from:to:message-id;
 bh=azWPOKqWWFSGqe6aQhQ6tNpWbbpg2xrzIx5NPKK1yVA=;
 b=MYoI4VPKP7/MUGDOGiEa7js+IGy1l1v7MWisEgACRCkggLf3YR1Vl526C0tqawuPma
 38DekRfuuT4zPAFFHf/TBqusbcof6DgSw+4FW4PK9VSriiNnscBebLD4kTFZDPNUfZS5
 /O15GR0zcKxFbLTwgxSi+CdBEsN0v7wBaj03X4FPMZmRnjHvnFvmwgxVrY/cH13pqhDI
 xJVGgy0wWnd546ByhpLsuOGOFINtRf9Ja/csfcxBQn3f8EJZr+l+CJg4YMyezhjPagKe
 rCoF5faLbuLmUzD/UQUtyZZXYHMzLoAasldqyUS/umQXUtl6KNsHO8lsyYZ9EBmYveMq
 gSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:from:to:message-id;
 bh=azWPOKqWWFSGqe6aQhQ6tNpWbbpg2xrzIx5NPKK1yVA=;
 b=sMrE+1ebHLXsaw2dnu1TQ9hpqTYBM4S7OXmnC08Z0j/TrRctQn5XeEgq89rmsYgblL
 kOiHRHQzETB7/2lOKmfhV2Pp3rimj8hwcILZOd1C1IofTPqSOWtK8NigBMjSFiIn9WIR
 bpUQfxiepbxUNT681EU8gMnYXGqhlrBk7hlloouff7hqrbGemtkmi/kxBKhITgzh2xcT
 qspDUlwCNOf747wn5YcpOgbcY2Wo8fJhtvJimIiEJa1dVGx3L7Lu6F51MlwQEJTNEBhi
 MGDN9CEChEcnOAAq68CuexRCGe5Jct2xhQeQ21SHzYs+uHjjn/VbJ6h8P8fKabk2UkYw
 4U/A==
X-Gm-Message-State: ABuFfog7+3AkpkaP97/Ne5wXfePXsrWo65ESIoGGxesTxK2Cn1bc8nlo
 +jSfK6eyh5WvzJGHp19msWb6Eu5pL9A=
X-Google-Smtp-Source: ACcGV60iIVIHZBf8n/lE4f/Zy6PwNXBm80NpIA7d0polXWtFaWogAVwplA4ovqqvF1pj1fbBvIMowg==
X-Received: by 2002:a17:902:7796:: with SMTP id
 o22-v6mr434200pll.5.1537821932061; 
 Mon, 24 Sep 2018 13:45:32 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 8-v6sm253228pgu.10.2018.09.24.13.45.30
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Sep 2018 13:45:31 -0700 (PDT)
Date: Mon, 24 Sep 2018 13:45:31 -0700 (PDT)
X-Google-Original-Date: Mon, 24 Sep 2018 13:45:28 PDT (-0700)
Subject: [GIT PULL] A Single RISC-V Update for 4.19-rc6
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-e3afd7a0-8f32-43a2-98bc-ef162868bede@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180924_134554_191977_B6815E4B 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180924204531.gcO3qnr1iyvIwg53P0YTVwxDSy2V0M5tW0MlFkJJB3A@z>

The following changes since commit 6bf4ca7fbc85d80446ac01c0d1d77db4d91a6d84:

  Linux 4.19-rc5 (2018-09-23 19:15:18 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.19-rc6

for you to fetch changes up to 57a489786de9ec37d6e25ef1305dc337047f0236:

  RISC-V: include linux/ftrace.h in asm-prototypes.h (2018-09-24 13:12:27 -0700)

----------------------------------------------------------------
A Single RISC-V Update for 4.19-rc6

The Debian guys have been pushing on our port and found some unversioned
symbols leaking into modules.  This PR contains a single fix for that
issue.

----------------------------------------------------------------
James Cowgill (1):
      RISC-V: include linux/ftrace.h in asm-prototypes.h

 arch/riscv/include/asm/asm-prototypes.h | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 arch/riscv/include/asm/asm-prototypes.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
