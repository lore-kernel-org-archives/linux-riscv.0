Return-Path: <SRS0=dKKk=FS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46602C4361B
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Dec 2020 15:24:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D308D22B2C
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Dec 2020 15:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D308D22B2C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embecosm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2nHr/ksuPT7JDIdmywKlkoIxth7YES+51mO9qKJiKII=; b=RJ259+v/BvjIjGBrKW0ooDRCFz
	AK9DVbYEWrSDqoLAsDzTfQw7nENHC75u20kkINJezYdTLCFmBMG0+BsiZkm/cRaJHNKT0UGw9QeLf
	Jjw4d971y6zKYmvl/CgNxqqZvAqtduaxD0DFDaW74nm6Rnr3x4Dj2V+UYfKO87Oxv3kYJhsTWUxP2
	StgPQ0VqIZG9IityyM9x0KRSUkh/jn91StxRvTjkIh0YLeb8jcQp40oc+1g8kT49Lgf+RxbAB+Gld
	7Lm8idw+CKsWgzUZeXPT/AnDCQcN0Bf8pISwuG2pA+Fj++ZBe0/V9UTYSSmDfQW27vKNa6zuyPaq0
	ZxdcF2sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kopiT-00015o-Fo; Mon, 14 Dec 2020 15:24:49 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kopiR-000152-2P
 for linux-riscv@lists.infradead.org; Mon, 14 Dec 2020 15:24:47 +0000
Received: by mail-wr1-x441.google.com with SMTP id y17so16794651wrr.10
 for <linux-riscv@lists.infradead.org>; Mon, 14 Dec 2020 07:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=embecosm.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8H2LBI9VeDuPINomw3QTGahebwzxmIJkoeZt/7hmvXk=;
 b=WUgM/7QBHsjJiJwvJv3g1qHHA3Uk3hjGVs8lvBpFqVzLgJ3uRpFsLQfRD5/t2njcB2
 JmK+L0wt1GnuvhCv9tlAjbOrJ7iuCcEehDsDScyyIbtwCpb4GfrlTD/+lDdg06iGxz10
 d0OmSVaGi+E+CTckDXHoAyrd++QyZWjBlKd7gEgaUWEJDOgRwVHqEzB/KxnQNK/XLeH/
 SVuVtEIKnJYjcvLOI0SMebE1G5TzmJ2VOcQNU3JrpwBMS0j669+2ZVUOG33ekmF4ie8R
 mlCymf/TwiL2j8huRc7NAh5HIePPFo7ahRxMDp3v78sE5kYtqRk6sCtdGGkQibX14vhI
 KIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8H2LBI9VeDuPINomw3QTGahebwzxmIJkoeZt/7hmvXk=;
 b=r9zCXi/M9/QiyD1iDFNzrUEg25szTRBtz/6Mzy4bMu3tGmtFP0oQmeFbEFGtfWCxlt
 wwzxi4WYg90m2jesVsMGgy8KXHbZUpdyAg7f747HC732gs3mgnduoCca8zxUZI2djb53
 G2IiSDDN/8cB3YGmndiCDKa74UigGe5LRaQHCEcMDByfUOXvRTe8vy7WV0bEBnlianEn
 6mBdrw1063iXs2BemqQdMd7OnyldNhFuGuidc3NUwt89oaNQLP9F+eDum9IistEfcXW9
 k1nvJE96Nvo6eRkRon8uFNDmCIuKWjJWIcJFWbYjsoSwriHUPW0rL2m/d88DrjglLSaq
 4Tew==
X-Gm-Message-State: AOAM530Q/I3IakmnLZoOs58SuIKskTFAZZg3XOxCtib5Ad/Zb7AiBCfY
 uC2dN2oPif0s14xu/KhBFD/HVi7Nk1xaYw==
X-Google-Smtp-Source: ABdhPJwU7vhExIc899Hi1k/EnUudnaag2DnCUy70QGf6z0NgMPEE7GBeIo4JsaphhGCDg64zfqt3Ew==
X-Received: by 2002:adf:8342:: with SMTP id 60mr29979704wrd.140.1607959484047; 
 Mon, 14 Dec 2020 07:24:44 -0800 (PST)
Received: from localhost (host86-180-62-188.range86-180.btcentralplus.com.
 [86.180.62.188])
 by smtp.gmail.com with ESMTPSA id o8sm20031899wrm.17.2020.12.14.07.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 07:24:43 -0800 (PST)
From: Andrew Burgess <andrew.burgess@embecosm.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: add NT_RISCV_CSR constant
Date: Mon, 14 Dec 2020 15:24:37 +0000
Message-Id: <20201214152437.1526146-1-andrew.burgess@embecosm.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_102447_233102_430182FE 
X-CRM114-Status: GOOD (  15.47  )
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
Cc: Andrew Burgess <andrew.burgess@embecosm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

I am currently working on adding support to GDB for dumping bare metal
core files for RISC-V.  As part of this work I would like to include
support for dumping RISC-V CSRs.

The format of these bare metal core files is planned to be ELF + NOTES
very similar to the core file format use by Linux.

As such I need to pick a number to use for the CSR note.  Currently
Linux for RISC-V doesn't support writing out CSRs, and so no number
has been assigned for a CSR note.

In this patch I propose reserving a note number for RISC-V CSRs.  This
note isn't currently used within Linux, but might be one day.  Given
how the per-architecture notes are allocated this patch not only
reserves a note number for the CSRs, but as the first RISC-V specific
note number, it reserves the whole 0x9?? number range for RISC-V
specific notes.

Reserving this constant now will allow for coordination between Linux
and user-space tools that work with core files (like GDB) without
risking possible number conflicts in the future.

I don't know if it's acceptable to have reserved, but otherwise
unused, constants like this in the kernel or not.
---
 include/uapi/linux/elf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index 34c02e4290fe..7db3752108c8 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -428,6 +428,7 @@ typedef struct elf64_shdr {
 #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */
 #define NT_MIPS_FP_MODE	0x801		/* MIPS floating-point mode */
 #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
+#define NT_RISCV_CSR	0x900		/* RISC-V Control Status Registers */
 
 /* Note header in a PT_NOTE section */
 typedef struct elf32_note {
-- 
2.25.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
