Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0CCC83F1A
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 18:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kAbfeMy+WnHOWo8iaWEoIsHljrHUhOqf3jhLowFasio=; b=UyCfqi9FtQISJZ
	NFBlt/irpfbHwYy+yqSj2qjzYQlAUzrHgbh0U2zBAx//XnP8QSQpivzkWgFa0u1GD63Qj96skpumw
	fHijWtw+U1dxOsRk3DOaRMPFuxvjV8rbopyCU7w2HGps/LggSxGyQDmoJHdtgensGk96VDuI0c1GJ
	AjG7XekYvQ4NCx0yeQbt/mqwCL2ZwRA7ch+EReozg8uT8BZ6vH0Q9uVi9URghtEtRCw5wFCVxtzIg
	6aO4FiBU1zquwmeeLVGCw7WZ71eNQKJyeKS7VqQnFN0AqSJCQgWTaRoVtZ+97n03YcF9fK/1eKwqz
	AITLCafuIwYpvbkoBaKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvho-00000000RhD-0oVA;
	Mon, 21 Jul 2025 18:57:44 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtlq-00000000EpH-1qXC
	for linux-riscv@lists.infradead.org;
	Mon, 21 Jul 2025 16:53:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753116821; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iUvIANf/UohhbAp9WLb3mxlfflIZVgugomZL7H/7/D925ABL2YUJwBpRMW77ZNebNxlAoO48tv6HOqldadqNlujzs8Id9wZbhCYNQCS/BDKT9UeDJ2fZPwHpV7bMbmyuzMZ/2hLIoV4Yt1cWIN/VyPym8pSwFaPTK0+uRZeolDM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753116821; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jK9MI/i332eSghzqERwT+oHGxGUIkN8gQxI+ICWuRh0=; 
	b=jSUIsc+od0rqIuzZpO/yj5m+l60G/a0hFq3fuMHUFI6/XebZPuTU1zDn7SlrH5713vQ91Df1EMc9533Sd8j5kDyJQ1ihJKqeihYlwCjelCDaHcQEU8P9pB1EvHIA0G6hQLe9hHES2FwaJ0gNEVmxdMj3zx/tWoMlCHj/qF3T+sk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753116821;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=jK9MI/i332eSghzqERwT+oHGxGUIkN8gQxI+ICWuRh0=;
	b=ofOcuukbYdfeHUw5ctjHaiqkMjDzMog9JxCKEe6Mech40Z9eBc4a0qtVmD3D+UWX
	8C+2f+eTw7BBaT+mkuYz6Ds1EbdK8lV4Pb03IOkBPA8fztNoHRCKHjnE/ULAu/IyS9r
	BMNPg90PNNuejQwx948e+1zK6G5kATRhMb23uMg0=
Received: by mx.zohomail.com with SMTPS id 1753116818500238.90791555807152;
	Mon, 21 Jul 2025 09:53:38 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH 0/2] riscv: mm: Use mmu-type from FDT as SATP mode limit
Date: Tue, 22 Jul 2025 00:53:09 +0800
Message-Id: <20250722-satp-from-fdt-v1-0-5ba22218fa5f@pigmoral.tech>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHVwfmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc0Nj3eLEkgLdtKL8XN20lBLdZCOjZCMT02Qj81RLJaCegqLUtMwKsHn
 RsbW1AGANRSxfAAAA
X-Change-ID: 20250713-satp-from-fdt-c22c245c27e9
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753116810; l=1644;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=19jOsKrKtynMRfxEP0aFVCM8oG7JBgUvsydmWunvLQA=;
 b=iQ9Sejx7hOZnVqg+hrtYgFd0q5I5kI/dsYk89Xm5dNG1f1KnKUIO9Z5zHZ1cFpNQClN8aaWDx
 vfEUHXIWdxAAmmKVGaAt3RqnJisMwJhH9hxGrWEDjllNw/zV6f7YJqU
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_095346_871565_E5030120 
X-CRM114-Status: GOOD (  10.72  )
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

This patch series improves RISC-V kernel compatibility and robustness by
refining how the SATP mode is determined during early boot. Some RISC-V
implementations, such as the Anlogic DR1V90 FPSoC with a UX900 RISC-V
core designed by Nuclei, which I am currently attempting to run the
mainline kernel on [1], may hang when attempting to write an unsupported
SATP mode.

To address this, the patch determines the SATP mode limit by taking the
minimum of the value specified by the kernel command line option
("noXlvl", e.g., "no4lvl" or "no5lvl") and the "mmu-type" property in
the device tree for the first enabled CPU. If only one is specified,
that value will be used as the limit.

- If the resulting SATP mode limit is sv48 or higher, the kernel will
  probe SATP modes from this limit down to lower modes until a supported
  mode is found.
- If the limit is sv39, the kernel will directly use sv39 without
  probing lower modes.

Link: https://lore.kernel.org/r/20250721-dr1v90-basic-dt-v1-0-5740c5199c47@pigmoral.tech [1]
---
Junhui Liu (2):
      riscv: mm: Return intended SATP mode for noXlvl options
      riscv: mm: Use mmu-type from FDT to limit SATP mode

 arch/riscv/kernel/pi/cmdline_early.c |  4 ++--
 arch/riscv/kernel/pi/fdt_early.c     | 40 ++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/pi/pi.h            |  1 +
 arch/riscv/mm/init.c                 | 11 +++++++---
 4 files changed, 51 insertions(+), 5 deletions(-)
---
base-commit: 89be9a83ccf1f88522317ce02f854f30d6115c41
change-id: 20250713-satp-from-fdt-c22c245c27e9

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
