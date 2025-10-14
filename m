Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF0CCCD190
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 03:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=opc/hfxzrzh2liH3DwHdqKFcsnepHidTiboZOv2wXaI=; b=ECAQFXgwHlwryM
	w+7GZxMPXWqJVxDjCPqNDf90+7f5Cu0sjae01dyp5Dna5B9y30QFgLt/0Iloi0CPcp+SS4cTJsjnm
	2ntG+xAeodjZMQ0g3MTncwCdjR0Q7azE4fhLoNI9lLWyZzzznUxN+XoZLoxqh3MnGuLA7hEPjVdOR
	Qwnu87uFFHsJL6qto3eo46Q/agygXrY0Yfvvb2iMVdgWxtziNLYf3VowqF5MO5aIIFZWIUWHaDIhc
	KB8GAwiUBpwLQbqK2autKFQHXoOLvBJmDkieTRZaYGJFQtch22MgSUsPiahmH/z2XVl6zDlX3PaDn
	1pi2DPDwBPzRiDLyr9pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VSg-0000000F1MN-3k1v;
	Tue, 14 Oct 2025 03:12:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VSd-0000000F1IT-3U4O
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 03:12:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3AFD86215A;
	Tue, 14 Oct 2025 03:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08CE0C16AAE;
	Tue, 14 Oct 2025 03:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760411546;
	bh=nV2p0fpU6/3+kXwweayj2niuZrElPFfqUNZw9N2j1qE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SmmWUMjip7JnHtECL30mUNkNSEPLXytoEw6OHD0CEvRv23fyoCvpnXII/A2iP8hz6
	 IREn4A9AtbohAZNmgxsQvGuP094lqjGk0R5lNp2YHIE2DQ2mAOFxEkuoeC9/5qDMPR
	 MP7aP765yWUoukTnBPIXoIgIVq0kUn1tOV3Bys+XPCGuEJ4tIoS2uxPE8PwyY1Wf4C
	 8oC04Rh76lhEBEzQLAc7hn1utiQJNujz92q88OGZci438EsEUsbbP0ketq9zJuoLNn
	 X3ssHKefSS1k6AkDR1QHbeRGr414zrE6LnByAKCZJT/RLSyOjXAtcewPK0GGFfXH5Q
	 YrJxb5+6kjVBQ==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 13 Oct 2025 20:12:00 -0700
Subject: [PATCH v3 8/8] riscv: defconfig: Enable Tenstorrent SoCs
MIME-Version: 1.0
Message-Id: <20251013-tt-bh-dts-v3-8-9f058d4bbbda@oss.tenstorrent.com>
References: <20251013-tt-bh-dts-v3-0-9f058d4bbbda@oss.tenstorrent.com>
In-Reply-To: <20251013-tt-bh-dts-v3-0-9f058d4bbbda@oss.tenstorrent.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, 
 Arnd Bergmann <arnd@arndb.de>, Joel Stanley <joel@jms.id.au>, 
 Joel Stanley <jms@oss.tenstorrent.com>, 
 Nicholas Piggin <npiggin@oss.tenstorrent.com>, 
 Michael Neuling <mikey@neuling.org>, Michael Ellerman <mpe@kernel.org>, 
 Andy Gross <agross@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Drew Fustini <dfustini@oss.tenstorrent.com>, Paul Walmsley <pjw@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.2
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

From: Drew Fustini <dfustini@oss.tenstorrent.com>

Enable support for Tenstorrent SoCs in the default configuration.

Reviewed-by: Joel Stanley <jms@oss.tenstorrent.com>
Signed-off-by: Drew Fustini <dfustini@oss.tenstorrent.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index fc2725cbca1879c181d179a3d59ac3a0ce206061..95d5230c00274893df0502174037fec348d700c7 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -29,6 +29,7 @@ CONFIG_ARCH_SOPHGO=y
 CONFIG_ARCH_SPACEMIT=y
 CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
+CONFIG_ARCH_TENSTORRENT=y
 CONFIG_ARCH_THEAD=y
 CONFIG_ARCH_VIRT=y
 CONFIG_ARCH_CANAAN=y

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
