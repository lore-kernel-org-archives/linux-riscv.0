Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7662EDB7CC
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 07:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0RNwVEMR3lZyeu2t0V1PQcIajdon6wHSqGDn4kK/g50=; b=Gvo6iX/p79J2gV
	A9kNLQNCLVOMPtJOvthBOaNSvbNEvn4tQ4tJ+0NdfTYrI5VDCoGjINY+eEC8GvPvCpqgNSj2bm8Pv
	KTXDgwpK0Evehj3DIIhNwxyoTX9jURxpklX6hH7YICvQu+xfRFLoK5F4pAyUWBHi8ZFGg6mwX87bh
	vM54EUsWvatsq4CeWJrzotGvE2oFFV9BaIf5PX8FmZ98aBZYht1xWU+cwxlrDhSYsn48aPJHzdjco
	lRESTEJNJIiHn56UegPuOUQS72CNJPzcgnB+e8AAov2ACmGsWOma4tEhNib1/WDb27oo5Hk6wMpdV
	tumjZQ8AAuFLsQkxeACw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA18d-000000066AU-3nnZ;
	Tue, 07 Apr 2026 07:46:19 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA18b-0000000669J-2npK
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 07:46:19 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4888375f735so42294805e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2026 00:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775547975; x=1776152775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oDRTVatnaVdVRoKqoryBgcipBx9RDK2t4fM6mlrK2lU=;
        b=pUO6H/iWvzPN9JwT+TArdEMsSaIKa4WLcOsdfGpYE2c9VN5AC/hTDtKKJUJDI62Sql
         0VtG6Wvi4yN9aOmni4bfWtj3ACJWxzu8nSMxBXBD/xYrOJQLh5Nh+6GNcXRYAS/GizsS
         v6PJ83KjeyNIqbC5K8rGUUolAWmnNTyUs4wG5vkEshSN8Wk2vFcjSrlnkcfuzPmosgsX
         HHYod15xSvJejsZKU97XpGp855t/s07XbE4/OKdySkLCjl7v/727KuZD/HY6k8+qyI58
         ZF+snDfLKYzaE7vmnmj3uuDW/dgZDnEQ85mvJ6LiTBe91yvUcmN+v3ywHhKINwrQrz1M
         /AsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775547975; x=1776152775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDRTVatnaVdVRoKqoryBgcipBx9RDK2t4fM6mlrK2lU=;
        b=W2Eh9Kyn23KxsaqKHwSXREyZ2E5EARessLsS99bRQtWnq4ho163t0+RuZQcxhjpozX
         ue8LqT2hWRvmIrnoQSTUtEMjTluVakcx4EAVEPt9+EJqlQbNNPgzYIo/SwPCBqaKVwSW
         8HiAJdy6nHccXdJtzzwE5pHLkY4EdRfMP2ntM1kfEsPBn3fXW+8l0ycU+qvXAUPeoJbW
         QTQqBqSOisFTi+TDCRKZRcIfBU6N++Jebx6u4oLRILsbPaQN0x/ijy0NGHs+32eDe6N9
         5rKINauk6wgXODiEVrSQaw7/7KH4gT6/KDmELOWs/ppNW1/WHq26F8iuIeXbV9RD/CXt
         MYHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBsH8p+IEdwEkYEiBgLTSyqjqu6cGWpdSwGwOdZ4cEZkPI70rls3GfU7BWD8e3Tn33aHjnQEy/U/5xPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/ZxNzC31fPo60tegnfi0XWy2ilKqCUxEsCKIih7za6ZqFDrf0
	EIgMchnUCUf95esn935jZqGwR7MEAPEP4p0Ghn5pj+5CGb2yLyfmtEIu
X-Gm-Gg: AeBDievL79A6Iu8+Xzh8dGNaIdSVABMDSn9e6h1eVMsGL1X26R5D1FJw9MoeXR0tEEG
	3vgpcbL3PgapN9srtGUz/P0gPfg6VOr/QdydPJqASo3fp/iw7qoqzTMW9vipJJQ9AGQpBPX1E6S
	96AimSjNMAW2YkPWfhdy4ofa831TkijvxtzurfLkL/SaVGDVpvEp97nDzh7oLXriEKCv/xzZIzB
	9YAGGtByFkT6mWGD79HWPyB69E5KGFMLbFyS9gFyuLPS/2L87Cn/RY6rcAlCDXCFl2Q6Hrdh8JB
	Fv1scu8BBGEMZJDwzK+eCk63Yn/sBqSiQygiLolgG1HV2m4Qbkt6ZRknXG+vXlHh2y/kFOPtMae
	6TYkrCqoCQXevX2jUXaexdBYpEjfh0NtnaHln+V6Llb6ldu0eI5KacvuUcD33Y3s11HTRgLntr3
	m4fOwwyBtKOpCVb0WEv9WRQYPb5yzliWSkMlvu4Kl+Oj/OSiWvVDXnDl4LYVLSADAlLnHuTelAk
	A9VGL6eN3S9H0Y4qLSdc976ObLWkY9PehfcaQ==
X-Received: by 2002:a05:600c:a418:b0:488:ae4e:51a5 with SMTP id 5b1f17b1804b1-488ae4e5464mr78747145e9.15.1775547974835;
        Tue, 07 Apr 2026 00:46:14 -0700 (PDT)
Received: from fedora.homenet.telecomitalia.it (host-82-53-109-192.retail.telecomitalia.it. [82.53.109.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a7165aasm522040385e9.14.2026.04.07.00.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:46:14 -0700 (PDT)
From: Adriano Vero <litaliano00.contact@gmail.com>
To: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adriano Vero <litaliano00.contact@gmail.com>
Subject: [PATCH] riscv: Add WFI to secondary hart spinwait loop
Date: Tue,  7 Apr 2026 09:45:34 +0200
Message-ID: <20260407074534.59179-1-litaliano00.contact@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_004617_722074_064378B8 
X-CRM114-Status: GOOD (  11.30  )
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

The .Lwait_for_cpu_up loop in the RISCV_BOOT_SPINWAIT path busy-polls
__cpu_spinwait_stack_pointer and __cpu_spinwait_task_pointer, burning
power on all non-boot harts while they wait for the primary hart to
complete early boot setup.

Add a WFI instruction before each polling iteration to allow the
hardware to enter a low-power state while waiting. Per the RISC-V
privileged specification, WFI wakes on any pending interrupt even
with global interrupts disabled (SIE=0), and implementations are
permitted to treat it as a NOP, so this is safe in all contexts.

The same pattern is already used in .Lsecondary_park in the same
file.

Signed-off-by: Adriano Vero <litaliano00.contact@gmail.com>
---
 arch/riscv/kernel/head.S | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 9c99c5ad6..ca208da7c 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -385,7 +385,14 @@ SYM_CODE_START(_start_kernel)
 	 * get far enough along the boot process that it should continue.
 	 */
 .Lwait_for_cpu_up:
-	/* FIXME: We should WFI to save some energy here. */
+	/*
+	 * Wait for the boot hart to populate the stack and task pointers.
+	 * Use WFI to avoid burning power in a busy-wait loop. Per the
+	 * RISC-V privileged spec, WFI wakes on a pending interrupt even
+	 * with global interrupts disabled (e.g. SIE=0), and implementations
+	 * are permitted to treat it as a NOP, so this is always safe.
+	 */
+	wfi
 	REG_L sp, (a1)
 	REG_L tp, (a2)
 	beqz sp, .Lwait_for_cpu_up
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
