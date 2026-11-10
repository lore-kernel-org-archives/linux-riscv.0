Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF14606A326
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 13:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IKwvzSpL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DJsoUFBUxPjvfZNVy/W+K1jrDg4OUjlvngXCE13Kixs=; b=IKwvzSpLwB3aelAavn3Mp9x0Uy
	X1Tjp+HVol1PvOaaJKEl6BL5sGVr7NJP/v3xQersiVsn8G12KkhU+91/J2CE9Nn0tgn0ofwnKIRIv
	bSx4duC6vWR/BPBMsZ7jL4y/TMO5t/LKFTkO2VkP0vhAZDFSagmsujvWLCdWkJMG1GgQcdHJcG5qI
	q24LOWQUB2OHA3tBEH2gmVZkX29fWkeOXaXxI4MxNuFNB1HTtZQMHrsHa3Rq3SXPSkMftNQc9Eebs
	PvTyqXQtlcLoG59wCHD+iuPn0t5CW8rvMPJu6Zdmk1RL4Gp327bwJquzPpZewFldVCJpFV6bojbUx
	OvECoFGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQm90-000000046bD-0f7Q;
	Tue, 10 Nov 2026 13:44:14 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQm8w-000000046ah-2gYz
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 13:44:13 +0000
Received: from [127.0.1.1] (unknown [223.166.93.97])
	by APP-01 (Coremail) with SMTP id qwCowACXwfubH_NqRy+3AA--.4075S2;
	Tue, 10 Nov 2026 21:44:02 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Tue, 10 Nov 2026 21:43:54 +0800
Subject: [PATCH] platform/wmi: Allow consumers to load without ACPI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-wmi-no-acpi-v1-1-eebea07db551@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAJkf82oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0MD3fLcTN28fN3E5IJMXUNTy0ST5DRDS1MLAyWgjoKi1LTMCrBp0bG
 1tQAnfNK4XQAAAA==
X-Change-ID: 20261110-wmi-no-acpi-159a4cf19580
To: Armin Wolf <W_Armin@gmx.de>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Han Gao <rabenda.cn@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowACXwfubH_NqRy+3AA--.4075S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr18XF1kAw13uFWxWrW3KFg_yoW8ZryxpF
	4Utay0krWrXa9FkwsrA3ZrW3y5uF1fu348Wry8C343Za1rWw1kW3Z7tas8XF98Jr4xAa1S
	yFWkGay7ZFs8ZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUb_Ma5UUUUU==
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBwIHDGry2F7bZwABst
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_054411_076689_47C934FF 
X-CRM114-Status: GOOD (  11.40  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit 4ea18e604272 ("ACPI: video: Remove CONFIG_X86 handling from
nvidia_wmi_ec_supported()"), the ACPI video module uses WMI on all
architectures. When ACPI is disabled, e.g. on a devicetree boot,
acpi_wmi_init() returns -ENODEV, so the wmi module fails to load and so
do video, amdgpu and radeon, which depend on it.

Return 0 without registering the WMI bus instead. The exported helpers
then report that no WMI device exists. Skip the teardown on module exit
accordingly.

Fixes: 4ea18e604272 ("ACPI: video: Remove CONFIG_X86 handling from nvidia_wmi_ec_supported()")
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
Tested on a HiFive Premier P550 booted with devicetree and an RX550,
with ACPI_WMI, ACPI_VIDEO and DRM_AMDGPU built as modules. Without
this patch, wmi fails to load and so do video and amdgpu. With it,
wmi, video and amdgpu load and the RX550 is initialized.
---
 drivers/platform/wmi/core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index a99da9b7039d787ce3c1e0ece74ffbd79fafd3f7..6668789904a903c8d4e7810976f4e485d7a1b32a 100644
--- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -1598,8 +1598,9 @@ static int __init acpi_wmi_init(void)
 {
 	int error;
 
+	/* ACPI video still needs the exported helpers when ACPI is disabled. */
 	if (acpi_disabled)
-		return -ENODEV;
+		return 0;
 
 	error = class_register(&wmi_bus_class);
 	if (error)
@@ -1628,6 +1629,9 @@ static int __init acpi_wmi_init(void)
 
 static void __exit acpi_wmi_exit(void)
 {
+	if (acpi_disabled)
+		return;
+
 	platform_driver_unregister(&acpi_wmi_driver);
 	bus_unregister(&wmi_bus_type);
 	class_unregister(&wmi_bus_class);

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261110-wmi-no-acpi-159a4cf19580

Best regards,
-- 
Han Gao <gaohan@iscas.ac.cn>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
