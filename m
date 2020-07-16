Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD811C43459
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 23:42:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 695C12063A
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 23:42:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z3A3ezE0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="QifFmqnO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 695C12063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1umPXkIVQHPQCS1yTh55sW4POQ14YuwTY5okvhadl7E=; b=z3A3ezE0vABnfVh7qOaKgyJxH
	0ISx06qvWlDLOBx7AFIxgOtLDn8vnXBID4+fnWxLk/AtYluCMLAsGZ1yrWqGx3LJyg0ZyBGzaMvbU
	WfwTGitHDwL5s7ud2ps7fcPfTtebOhN/LnScPT0sEjHdCmNDqY/A9Q+LfAUmbTSpTHdr3XjEze27H
	eGot7sYCSB5iZ9JrM5jBIVhokBlkEvJV+gnVTYwIcFNdSirabhQ8CqGRgFCDemrZHkqEd2p04FgpS
	UnaF6X27uVo0pM/QBkplna2n416dUyeCN/YZMkXQydWcLXbarvWxAFPhxZQiwb8tqmpQZRhdG5fbs
	x3YWmXmTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwDVs-0007yS-4W; Thu, 16 Jul 2020 23:42:04 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwDVD-0007hQ-J5; Thu, 16 Jul 2020 23:41:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594942883; x=1626478883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T6HBziqjPfpEOovieQwcPFPkqxzZPptEH0FVtMgRIac=;
 b=QifFmqnOLVJMGQdlmJOOHg2ktteShVuoXAmHXQLYFRmZlIGWudd1jcZc
 F1M/xIzzdQ0bU5ZLFNGGp1rp3Pv0NpgXVmPAWt1zQgD88yS6166xq+T9D
 Lzir5X4WychDxHd0wiDA5oJoPtXrusNdlJb/b3VRo+riWVRrWe28dYEX6
 ylOenMp9yCclO/tOhef5mGbpj7zNB27BMtNkejQWORuk/1MBGuTQmISBo
 5exXxkKwXpz5reOpqHFB7py5mxjkY2BUGIT86GeJQnASymSQFUQ9r7pe+
 qGKFKPZ8YeUYWxxPhEq/dyYDgy+ATPHTIayXvvtLMJ5sLQYQDOMREQIB7 A==;
IronPort-SDR: 2BUdCIhvg6DYOzVJAPrUcXr+rsirOriWRdRE2ZCnwZHC5bPFnr3J0fYz9MRGwMsJzpK8mV2/iH
 6Lm60Rqg/2HbhBHNMGRhRoJFFEehhlVuAVfi/MLv76AENJ4wYR+cv00p1tk5a8fH+Ny7mZlBkC
 J69mVGCQXRw9OHh9/WxUuVaJmr1ynOX8QNup7oDQvyy1ybcsyNgMYoTETuhDYIZVLz2qmYosXg
 tp6INlqcY2Xl/sIM5hhaRZRiNXsKpnlPUOt+nnarkWf1X7mgsREEYs34GmkJfq0KYRz7o4XopX
 Yfw=
X-IronPort-AV: E=Sophos;i="5.75,360,1589212800"; d="scan'208";a="142782187"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Jul 2020 07:41:22 +0800
IronPort-SDR: NbCbz6fuvUzt/qCXx9sgsO91DILStA7Sr8POjU9rkjXKR46551V86z4qNwZGcVi9AutEzXV5eP
 MwVZZ9J+gCw61mBQLxqW0T43yxOwCXDuk=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 16:29:46 -0700
IronPort-SDR: PWbuYNsxssCn40vWmXhVNZwgTUSQ6DTTbK/IitymYljqtYtk8TxEeJt5x8q1A0677CraTBfRp3
 lXWjdBsAHw/A==
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.54])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Jul 2020 16:41:21 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFT PATCH v3 7/9] efi: Rename arm-init to efi-init common for all
 arch
Date: Thu, 16 Jul 2020 16:41:02 -0700
Message-Id: <20200716234104.29049-8-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200716234104.29049-1-atish.patra@wdc.com>
References: <20200716234104.29049-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_194123_821856_AEA5A602 
X-CRM114-Status: GOOD (  10.73  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-efi@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Anup Patel <anup.patel@wdc.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

arm-init is responsible for setting up efi runtime and doesn't actually
do any ARM specific stuff. RISC-V can use the same source code as it is.

Rename it to efi-init so that RISC-V can use it.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 drivers/firmware/efi/Makefile                   | 2 +-
 drivers/firmware/efi/{arm-init.c => efi-init.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/firmware/efi/{arm-init.c => efi-init.c} (100%)

diff --git a/drivers/firmware/efi/Makefile b/drivers/firmware/efi/Makefile
index 7a216984552b..61fd1e8b26fb 100644
--- a/drivers/firmware/efi/Makefile
+++ b/drivers/firmware/efi/Makefile
@@ -32,7 +32,7 @@ obj-$(CONFIG_EFI_EMBEDDED_FIRMWARE)	+= embedded-firmware.o
 fake_map-y				+= fake_mem.o
 fake_map-$(CONFIG_X86)			+= x86_fake_mem.o
 
-arm-obj-$(CONFIG_EFI)			:= arm-init.o arm-runtime.o
+arm-obj-$(CONFIG_EFI)			:= efi-init.o arm-runtime.o
 obj-$(CONFIG_ARM)			+= $(arm-obj-y)
 obj-$(CONFIG_ARM64)			+= $(arm-obj-y)
 obj-$(CONFIG_EFI_CAPSULE_LOADER)	+= capsule-loader.o
diff --git a/drivers/firmware/efi/arm-init.c b/drivers/firmware/efi/efi-init.c
similarity index 100%
rename from drivers/firmware/efi/arm-init.c
rename to drivers/firmware/efi/efi-init.c
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
