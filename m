Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FBACA1013
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 17:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=utuNtxqncKICvLQuh82Sm8NY6S1d/ZuV3fiKeSfNqKs=; b=VC9BBdEdvJp2t0
	pVbJF08gVbPqNx6YahYRYfCEzYBOTA0aDZoC2U9RutTzBAsdIJQ86akMFdROPEee3wi2LmfCL6i67
	J2aXjFCVSJj+m3BjgDPOxcVL55U2o3hSR3kxBBw2qm+T9OAbypeF5TxnXT2prpvCKfqsmVwwrq78i
	mN40xUJXdW3qw96o9Dl60kz4b4UznhONaWlmnuoK7sBpHORn2A16YtBFUnMiOr1c9B716Sqif2G4B
	2jQVqJnM6QZBaJNcF+Dm/sS8FNMjWKKwosiLRtl4WaciKye692XGuNMB09bPo3nK59CIaEbLFMqOZ
	UwEjgdoET70igB0toktg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzIVv-00000000lkv-42jo;
	Thu, 18 Sep 2025 17:33:47 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzIVu-00000000lkN-0GOV
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 17:33:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758216818; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IoqDInUzbSjfXo4SKiiwDqhYG7FfiqcuR8Cghf+1+RHm4YntQqEXI3e6pAxiWeU+7B8XRyEyevx7/5YzjLTSHfF6Zkd6BnwAQuUc9+A1pmwf9d5RJPBqOUxoLZ9HCCGelP51cbC3kZltifJCCTLJwaaa8HnQhNooCsL7GebxaOY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758216818; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yUthklRovuuMcuH7eOn/Jmb2HQ/kbKqWsy+DVuHow6M=; 
	b=nr0LYtbLXgpCsN3r28VZRLHxrbg1cSV7FhoBamc/Xlmc8DF/RrRjJDhnuSogdArbuEJOqRltadXX1gjcxM7IFZ/ZYywGVPWvkgjfsqXYNXplJdv+7vKQPp6TqmiHUcJuGhJFr96s7hs6t03Yf3RUgqOl9OzU1VdtbD473IKGKAw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758216818;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=yUthklRovuuMcuH7eOn/Jmb2HQ/kbKqWsy+DVuHow6M=;
	b=NpoRcLF0/Bz5x9s/3XaPoQS0wCr177wsdE6bNvS5v438GjmlZ6aul7KruSXXp0yq
	+FeBL32EnQV9GacpgIVv36LTQM6k3EFZnbfZft1QFQ4oV9Npa8OGi9HLxSMsEnikWUh
	prbzCf79pWV5JtBcOTc1laZeB3dwRSRPeY76Qp0K8cNwBPJkjsPB2on27mez5G0tKO6
	yQ4i3Cl3v7QrrZX0vlQpafiAmd2lX7kwSmjBvOkOkw3d6vGojXCP59Gr0GiGq9oyqFh
	8x7GFV4OYBrUoeKIE1jhXCtDVf1PoKS1nFg/JrnE+cqXftsl/SeHZucaEknz8bM7n0Y
	OS7RqOLIQA==
Received: by mx.zohomail.com with SMTPS id 1758216817402958.4122287213521;
	Thu, 18 Sep 2025 10:33:37 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 0/2] Poweroff/reboot support for TH1520 via AON
Date: Fri, 19 Sep 2025 01:33:21 +0800
Message-ID: <20250918173323.340738-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_103346_171771_B82D467D 
X-CRM114-Status: UNSURE (   9.36  )
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

This patchset tries to add support for poweroff/reboot on T-Head TH1520
SoC by calling the AON firmware.

The first patch creates an auxiliary driver for this, and the second
patch makes the driver currently matching thead,th1520-aon create an
auxiliary device.

Icenowy Zheng (2):
  driver: reset: th1520-aon: add driver for poweroff/reboot via AON FW
  pmdomain: thead: create auxiliary device for rebooting

 MAINTAINERS                                |  1 +
 drivers/pmdomain/thead/th1520-pm-domains.c | 14 ++++
 drivers/power/reset/Kconfig                |  7 ++
 drivers/power/reset/Makefile               |  1 +
 drivers/power/reset/th1520-aon-reboot.c    | 98 ++++++++++++++++++++++
 5 files changed, 121 insertions(+)
 create mode 100644 drivers/power/reset/th1520-aon-reboot.c

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
