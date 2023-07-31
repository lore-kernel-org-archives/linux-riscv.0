Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C431EC001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 13:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a2sm6Lcewbbl7urY1a0OpqDR+65pp6ZUsf+BOrPIAfU=; b=TW3xRA1gN7enli
	15i4Pf/e5hOc20N8JrP0KAZLOsafU/SXw7rAu6f5xrOJcIkXrukM46C+zD2afFaDnrRjQg866AdZQ
	0rmz6YqmgqOUnOOsekuWWLzrC2kzkVJTvqIa7QC5yUkgJY5aRc3lK/BJd+xMTZMSQUwgyr/rG0mKh
	t80HGAfQ2yKUMFNzPxbHrlaILqoSs79yYOvB4/yaT6ew8iW8ysENtyjWDxQLO4eXGlEcSKu03fGz1
	x37miRK1nJT8R8LNPDfUdV4NBw8tTnU/g05fCAc79dh2DJ5V539GV/Zy3nSKPSLrQUS/qGQ5gwE8V
	mTb9Gj8Zm1mt7K7RV2Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQTJF-00FrsT-1Q;
	Mon, 31 Jul 2023 13:51:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQTIq-00Fras-0c;
	Mon, 31 Jul 2023 13:51:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A2B8A61158;
	Mon, 31 Jul 2023 13:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACA5C433C8;
	Mon, 31 Jul 2023 13:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690811475;
	bh=8dG7a5zhnwPAZeiNFnvKUhXNUal9236c6/e90HmcsCA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UNIlOmyxQlsDGZJJUlqtBQ3pKGu9374jbAVXpf249MEPk/7xOISrn7LV2miW34Rap
	 JCt/KtM7Z1890WzrDybSb/rdV0lg1nK864oQ1Xr+yw0hGvERsNGJCmbhh/HgKJYgsi
	 B/IE8cXFog7znQKMJee8kLLxJhIdas8q4jjEYDEhZ2IWxbLZDL1k3Ajg/kfAH80SY7
	 ewY5JqHbjoPQ0U32MHJMM4U8gI+3v9eZLqS5ipEBAprGwZyINGZfhUIMpIm5bqKhdJ
	 GmRXo0dmMr0LIVtM/RUi3JCM6bneJhkXdrK41dEx43Globcmw0xBTjeo9qrLGJJrQC
	 lsQBTeRA/Xy2g==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 31 Jul 2023 14:43:13 +0100
Subject: [PATCH v3 04/36] arm64/sysreg: Add new system registers for GCS
MIME-Version: 1.0
Message-Id: <20230731-arm64-gcs-v3-4-cddf9f980d98@kernel.org>
References: <20230731-arm64-gcs-v3-0-cddf9f980d98@kernel.org>
In-Reply-To: <20230731-arm64-gcs-v3-0-cddf9f980d98@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8dG7a5zhnwPAZeiNFnvKUhXNUal9236c6/e90HmcsCA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkx7wXrSTFXcgNytPlNbVq48jyprVFXs18BW465j/K
 XAkAlKiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZMe8FwAKCRAk1otyXVSH0KzsB/
 4tiNeZ4UMeFymPGXy+vrRR/CeqE1Eo2278HuFEFxg/jAeMprtm+Q2Fj+OKMW0OieY/iQho/4q1MI2t
 Ryg3boNagu4L7zayoqipT6iYmOnTZEiXNq6Ay7dZGKUVlwDCQyBS4R3yRBqSg1zFTyW5PAdEUtU/lr
 w3P6Jsn2bcskmRpz8xfmU5xEO2/9EMipd7qtZkZmhUUOu7inLemxyFMVa6a8jGJGYWjMWcyDASadE2
 90TEAvg02jv3I0ncnhZTsLPzhbwKfg5v+MajM37byix/EGh4307GV7NyPuhgbMBzdLccRPE7L5gS6+
 lsnNZAG/7AcRFugLOeeh3M6KxrQYhS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_065116_320510_D3CD514E 
X-CRM114-Status: UNSURE (   9.70  )
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

FEAT_GCS introduces a number of new system registers. Add the registers
available up to EL2 to sysreg as per DDI0601 2022-12.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 55 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 65866bf819c3..20c12e65a304 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1780,6 +1780,41 @@ Sysreg	SMCR_EL1	3	0	1	2	6
 Fields	SMCR_ELx
 EndSysreg
 
+SysregFields	GCSCR_ELx
+Res0	63:10
+Field	9	STREn
+Field	8	PUSHMEn
+Res0	7
+Field	6	EXLOCKEN
+Field	5	RVCHKEN
+Res0	4:1
+Field	0	PCRSEL
+EndSysregFields
+
+Sysreg	GCSCR_EL1	3	0	2	5	0
+Fields	GCSCR_ELx
+EndSysreg
+
+SysregFields	GCSPR_ELx
+Field	63:3	PTR
+Res0	2:0
+EndSysregFields
+
+Sysreg	GCSPR_EL1	3	0	2	5	1
+Fields	GCSPR_ELx
+EndSysreg
+
+Sysreg	GCSCRE0_EL1	3	0	2	5	2
+Res0	63:11
+Field	10	nTR
+Field	9	STREn
+Field	8	PUSHMEn
+Res0	7:6
+Field	5	RVCHKEN
+Res0	4:1
+Field	0	PCRSEL
+EndSysreg
+
 Sysreg	ALLINT	3	0	4	3	0
 Res0	63:14
 Field	13	ALLINT
@@ -2010,6 +2045,10 @@ Field	4	DZP
 Field	3:0	BS
 EndSysreg
 
+Sysreg	GCSPR_EL0	3	3	2	5	1
+Fields	GCSPR_ELx
+EndSysreg
+
 Sysreg	SVCR	3	3	4	2	2
 Res0	63:2
 Field	1	ZA
@@ -2209,6 +2248,14 @@ Sysreg	SMCR_EL2	3	4	1	2	6
 Fields	SMCR_ELx
 EndSysreg
 
+Sysreg	GCSCR_EL2	3	4	2	5	0
+Fields	GCSCR_ELx
+EndSysreg
+
+Sysreg	GCSPR_EL2	3	4	2	5	1
+Fields	GCSPR_ELx
+EndSysreg
+
 Sysreg	DACR32_EL2	3	4	3	0	0
 Res0	63:32
 Field	31:30	D15
@@ -2268,6 +2315,14 @@ Sysreg	SMCR_EL12	3	5	1	2	6
 Fields	SMCR_ELx
 EndSysreg
 
+Sysreg	GCSCR_EL12	3	5	2	5	0
+Fields	GCSCR_ELx
+EndSysreg
+
+Sysreg	GCSPR_EL12	3	5	2	5	1
+Fields	GCSPR_ELx
+EndSysreg
+
 Sysreg	FAR_EL12	3	5	6	0	0
 Field	63:0	ADDR
 EndSysreg

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
