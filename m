Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872FFC41513
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 15:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Djad8UgdSIhRi2gHsZgzORAMaKdROWlOso2N0Jfi8og=; b=nk+v3N1AMtYYSI
	Rxv4Wr419/cN2SUkvmdAYsPHXuCm3Js9To1cXsS5pWY6I/o7+T/Lgji9jucelNlZUON/Xzn+qnnpM
	8rfK16wsuFrFPoDlLa0eKu2mw6TM4HNNHtD6S6gtql6DZJL8nylbW25uZEVoM+T3tH0xcXtaorzbe
	Q/vsan7yeM/dCyy3GMh2qR7cx9Pea+9Elx7gsJAHy50Wba6wIwwGx2WX6VWqgaMFrThS8XfbcWcQ9
	5yF6GCgvtBMZEn2cbTeEtsuU7EkMegJoStOBuGn4SLX7NBgjtmw8DAC36k5HfyGNOB/uZWZmFox6u
	SOj4ZTMAzZL6FljlXZSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7iz-00000003MIl-3wGk;
	Tue, 25 Jun 2024 15:04:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7gc-00000003KP0-3fgM;
	Tue, 25 Jun 2024 15:02:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 744CDCE1ACB;
	Tue, 25 Jun 2024 15:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E37DC32786;
	Tue, 25 Jun 2024 15:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719327739;
	bh=TfNpxv0/YFgIFj+ehQEMyQU6+Dwt53rcvRO+chZ3qhs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=STatpgD2i8PfRN0VLtvr3/xO4Z576aE4SkCdSBU+uuppRnLcsEIl09YBQW4P3cJV/
	 5nPYryHHx8XOBERPro9tvUe7WHZE9e5zrrsmu7uDiDGlt1rb2tHMZJyRsZFXpQEZbv
	 Lfh5wJSR/w+YIO2f5HKJz3uW0rCPkXav7nCEaYXnujgz7Vxlwu6k8bfME/aWKN5ZK4
	 +2Vo7VpnCsfDzZhfVcVlex8iIkQZT7mslYD9IJbK3Wc8cUNQI++3PPJT5fRkID/Tew
	 +NOBLkJNPrtlIgMIPIPBPIpmMOxPyPr2D7FfuK1tqs8YknrdtCYI4ZF7jIhEJFDKm/
	 WGGoVGXke1AWw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 25 Jun 2024 15:57:42 +0100
Subject: [PATCH v9 14/39] arm64/gcs: Allow GCS usage at EL0 and EL1
MIME-Version: 1.0
Message-Id: <20240625-arm64-gcs-v9-14-0f634469b8f0@kernel.org>
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
In-Reply-To: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Ross Burton <ross.burton@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.14-dev-d4707
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TfNpxv0/YFgIFj+ehQEMyQU6+Dwt53rcvRO+chZ3qhs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmett9AN60q5kvIlR1ZcHcKPpCsET41XbuQScM991y
 JwD1yJmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZnrbfQAKCRAk1otyXVSH0PcTB/
 9cpj20UTw99E9XrZQ4iq0JEfF+LAfyUcO1sE6bwkbyJu9xmMka/NS5vgBpaOVjWQHlLEA6PK8spBiM
 JKjkW5k7zeUW013lpa/iWiADA05kVin3SSzAVcRf9B/NoQ54ZJZjL/mHEhbeli16FDg4o3tJB5JOdv
 rddkE38qEE2zTtwySZ4pPFsqhi0Q44wMfZMrK0kuM+OPrCiPeoNUhtmczNkkW8l7SJ39SMwuNex5IP
 hWJE6EQjChRcge1YsVTmS/BdZdzg7R9HuIcMkXpq9JMQ2N6RpiOLZTx5hO97OoApANlVjDrX2w+rdp
 lXc8DUnhi7lkYJ83O1dvM78CD4A9ri
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_080223_605637_E4E08B5F 
X-CRM114-Status: UNSURE (   9.82  )
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

There is a control HCRX_EL2.GCSEn which must be set to allow GCS
features to take effect at lower ELs and also fine grained traps for GCS
usage at EL0 and EL1.  Configure all these to allow GCS usage by EL0 and
EL1.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/el2_setup.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index fd87c4b8f984..36aa40c19e85 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -27,6 +27,14 @@
 	ubfx	x0, x0, #ID_AA64MMFR1_EL1_HCX_SHIFT, #4
 	cbz	x0, .Lskip_hcrx_\@
 	mov_q	x0, HCRX_HOST_FLAGS
+
+        /* Enable GCS if supported */
+	mrs_s	x1, SYS_ID_AA64PFR1_EL1
+	ubfx	x1, x1, #ID_AA64PFR1_EL1_GCS_SHIFT, #4
+	cbz	x1, .Lset_hcrx_\@
+	orr	x0, x0, #HCRX_EL2_GCSEn
+
+.Lset_hcrx_\@:
 	msr_s	SYS_HCRX_EL2, x0
 .Lskip_hcrx_\@:
 .endm
@@ -191,6 +199,15 @@
 	orr	x0, x0, #HFGxTR_EL2_nPIR_EL1
 	orr	x0, x0, #HFGxTR_EL2_nPIRE0_EL1
 
+	/* GCS depends on PIE so we don't check it if PIE is absent */
+	mrs_s	x1, SYS_ID_AA64PFR1_EL1
+	ubfx	x1, x1, #ID_AA64PFR1_EL1_GCS_SHIFT, #4
+	cbz	x1, .Lset_fgt_\@
+
+	/* Disable traps of access to GCS registers at EL0 and EL1 */
+	orr	x0, x0, #HFGxTR_EL2_nGCS_EL1_MASK
+	orr	x0, x0, #HFGxTR_EL2_nGCS_EL0_MASK
+
 .Lset_fgt_\@:
 	msr_s	SYS_HFGRTR_EL2, x0
 	msr_s	SYS_HFGWTR_EL2, x0

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
