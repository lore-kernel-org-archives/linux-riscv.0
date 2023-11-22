Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702CCC61D9C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 09:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PoE7WxPJbRfnOUo80Z9XjaGy5LylNXnXUKlDQ3jlYrU=; b=cBhG0oURS5I+1H
	Bl1GPbrkkZtwALfwORGMfrm57qRsJLmJQw8P6SZIvvwpBCUysiccJ3aMFCKqe4MqngEJHXMUmjyAp
	OgXt0OHUHXue7hLtGJnMDOXtOCHpOuAKHgoia8yiYKrweuzOGMLheCyijxH6XpKD8tscnXzWXKlXS
	L6dyR0nyZBnC2yKh0EOuJa5+GG13Z6qEPFDaFJt1OXM2bgm9lyuaCgPz9KFQ5O/kZEniKi/ChATeI
	TjWqCHV2N/o0yFOyzdDLptMArK0Idv115ciclYHpKLNevzu7hhuaauD8sZP7Ixy2pRXcefKMw8wot
	XTi0LRGnD3MM7sJeOKhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jlr-001FiT-32;
	Wed, 22 Nov 2023 09:43:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jlk-001FYj-1H;
	Wed, 22 Nov 2023 09:43:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A5BC5B8118F;
	Wed, 22 Nov 2023 09:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130AEC4339A;
	Wed, 22 Nov 2023 09:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700646218;
	bh=sAPCPg94+tnQw67CJNTbw1zQ3juZmRAe+Eh6kRT4gRc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IkXRbg5bBWSUR+v3gfhiN3UWClgOifXCfJYdSSioSWvlRRW0PeQTS3840LnJeHTZ4
	 VoP/bZznXx/D8Zmd8/wg3SHiiXpdq9G7qXu0SHuGSzY3E9t8R3OaZw8DlZc41Hl497
	 kdEEsWXJpHK1VK2rDYLui9+R7Uo9Mlb9NwLVVUh7IldVFd9eFzYERwTx68oGWAaxwD
	 4cHNbjRbM4lBZ8/5G5l4KIIIyrrEi3vmyEqksXhSzmqSPbiTjemvRhc3jDYyfjIY4f
	 tzU5DbkQd+AXeKkMRQ8qtIW90WHtI6KFwV0/j7Om0fl0b/6+HV2Eid1Lr4gKKzkPUb
	 iKqusnHn1iNIg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 22 Nov 2023 09:42:16 +0000
Subject: [PATCH v7 06/39] arm64/sysreg: Add new system registers for GCS
MIME-Version: 1.0
Message-Id: <20231122-arm64-gcs-v7-6-201c483bd775@kernel.org>
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
In-Reply-To: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
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
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sAPCPg94+tnQw67CJNTbw1zQ3juZmRAe+Eh6kRT4gRc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlXcz7ZHl1qts3vCkTyLrvdIYGWOcI1zxCo5W7w
 MWcYuLMMqmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZV3M+wAKCRAk1otyXVSH
 0Ni7B/4s8EgRGzCroRrqSGQDamkc26auatPOVjhjcDAF4UzqAGfqte6xSPGtlM654rV6oxw4S74
 ScqJVKLmOfCAkvCwX5BxxAlOSdeMqOK/FgKj9J+cM2W5+0AVlvUZv8vAGZIelYeutlHEFoMLD9P
 r+ONekQALp7T/WiFNBAEbhIqQK7O3EUizX/yHODMJPOzkRMgvLifseFZkrbV5bTKSKVr0pCB18m
 MCcrHY/O0TwRVMvKL5AYsOCdHTbLkn+Bj+t4hMu50SoZTrAN/9sJa+XlLNgT2Sm5DtgJNxunb1g
 ownRsis25uUJ0pSZSxZzqvPmmuSJZVa/rIVWAMDmhxRNHGC4
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_014340_754944_9EFB0470 
X-CRM114-Status: UNSURE (   8.05  )
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
index 96cbeeab4eec..d2ee46b63482 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1790,6 +1790,41 @@ Sysreg	SMCR_EL1	3	0	1	2	6
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
@@ -2020,6 +2055,10 @@ Field	4	DZP
 Field	3:0	BS
 EndSysreg
 
+Sysreg	GCSPR_EL0	3	3	2	5	1
+Fields	GCSPR_ELx
+EndSysreg
+
 Sysreg	SVCR	3	3	4	2	2
 Res0	63:2
 Field	1	ZA
@@ -2348,6 +2387,14 @@ Sysreg	SMCR_EL2	3	4	1	2	6
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
@@ -2407,6 +2454,14 @@ Sysreg	SMCR_EL12	3	5	1	2	6
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
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
