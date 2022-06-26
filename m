Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71F5CCA489
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Jun 2022 09:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a2EWejluEVxvkM7vjcTdwwkgHB3ERbkKOHawKkvMAFs=; b=nGhqWclZS/RD7e
	9REc8xQ16BWAx2o1+qFhw5iO3XsFNfeOxD67d0e7h8EdDyhfnz3VterE+o+3PPeFx9DtsvjVCYQAl
	1WGNwDdOUwfzGweK3XrbX8nHecYIl0IwkGupGC/hmBq+f//qjTra4oj6af/NofuRQFIYTvWjwvkIg
	erCIw4evOl+fFpLS4xTnrJXxW1yPU2E5r7oLx7CS7v+NFJ+G/yZ3R+YttTN1a9knLp5737VOb2iKK
	erM6lLwcf9NkVX/yw8LysZz/UsGEnf6BOrneXqw9g9bq2aURWKwq4a3/xrLqbh20ZmG6wYlPUwppZ
	eGy/935A9F5seJPzWFiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5OIW-00AoG1-Gu; Sun, 26 Jun 2022 09:11:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5OIT-00AoAM-1e
	for linux-riscv@lists.infradead.org; Sun, 26 Jun 2022 09:11:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 904076119B;
	Sun, 26 Jun 2022 09:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65F3C341D0;
	Sun, 26 Jun 2022 09:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656234671;
	bh=PhI7xlCBz8s4EqXsemcBzFaZLbSNGrNWFqcVvz20FLU=;
	h=From:To:Cc:Subject:Date:From;
	b=HhAf8IklB9OEeSwUHmvWxlXncEZMnsUL3ruxIFgodyPNv9p+IrCpMlJ2Ee1QRPg4Y
	 hcLQjIGJsa57ccuYyM9Yyy/ROtPClfozh4WxentR1FyhgZLpBjfJOGg0x+KF4uJ/xK
	 kJvya0UqPXI61UML+5xdxeC865OaTGDrndLJQhHMXq2RYO88lEbM26jWxoanedVi+e
	 mtQoMumgkipZ4Bxf/XC3su3ouzdbhmQdJsOcFrbZpKeXoPTd+pXhJvNl4aEKmUZnEX
	 5AkPirLrYw/XgJk3fQoIdoqyPnzuUz7+aN/pwnstjak/isdyfdJp2rwGOaiGtxsqlk
	 h/pj4xfQ6G59g==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
	(envelope-from <mchehab@kernel.org>)
	id 1o5OIN-001coA-Qi;
	Sun, 26 Jun 2022 10:11:07 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Alex Shi <alexs@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dipen Patel <dipenp@nvidia.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Yanteng Si <siyanteng@loongson.cn>,
	devicetree@vger.kernel.org,
	keyrings@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-cachefs@redhat.com,
	linux-input@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-riscv@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 00/20] Update Documentation/ cross-references
Date: Sun, 26 Jun 2022 10:10:46 +0100
Message-Id: <cover.1656234456.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_021113_212855_4F230031 
X-CRM114-Status: GOOD (  12.85  )
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

Fix most broken documentation file cross references on next-20220624.

After this series, only 3 references will be broken:

Warning: Documentation/dev-tools/kunit/run_wrapper.rst references a file that doesn't exist: Documentation/dev-tools/kunit/non_uml.rst
Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
Warning: drivers/acpi/device_pm.c references a file that doesn't exist: Documentation/firmware-guide/acpi/low-power-probe.rst

All of them seem to be due to the lack of a patch actually adding the
documentation. Maybe the document file is still under review?

Regards,
Mauro

Mauro Carvalho Chehab (20):
  docs: netdev: update maintainer-netdev.rst reference
  docs: filesystems: update netfs-api.rst reference
  docs: zh_CN: page_frags.rst: fix a broken reference
  docs: zh_CN/riscv/pmu.rst: remove old docuementation
  docs: zh_CN/devicetree: fix typos
  docs: zh_CN: fix a broken reference
  docs: zh_CN/vm: fix a typo for page reporting ReST file
  docs: zh_CN/vm/zsmalloc.rst: fix a typo
  docs: zh_CN/vm/index.rst: fix a broken reference
  Documentation: update watch_queue.rst references
  Documentation: KVM: update s390-pv.rst reference
  Documentation: KVM: update amd-memory-encryption.rst references
  Documentation: KVM: update msr.rst reference
  Documentation: KVM: update s390-diag.rst reference
  objtool: update objtool.txt references
  arch: m68k: q40: README: drop references to IDE driver
  tegra194-hte.rst: fix reference to its binding
  dt-bindings: mfd: update dlg,da9063.yaml reference
  MAINTAINERS: update nvidia,tegra20-host1x.yaml reference
  MAINTAINERS: fix cross references to mfd/dlg,da9063.yaml

 .../admin-guide/kernel-parameters.txt         |   2 +-
 .../bindings/input/da9062-onkey.txt           |   2 +-
 Documentation/driver-api/hte/tegra194-hte.rst |   2 +-
 Documentation/security/keys/core.rst          |   2 +-
 Documentation/security/secrets/coco.rst       |   2 +-
 .../it_IT/networking/netdev-FAQ.rst           |   2 +-
 .../translations/zh_CN/devicetree/index.rst   |   2 +-
 .../zh_CN/devicetree/of_unittest.rst          |   2 +-
 .../zh_CN/devicetree/usage-model.rst          |   2 +-
 .../zh_CN/doc-guide/kernel-doc.rst            |   2 +-
 .../translations/zh_CN/riscv/index.rst        |   1 -
 .../translations/zh_CN/riscv/pmu.rst          | 235 ------------------
 .../zh_CN/vm/free_page_reporting.rst          |   2 +-
 .../translations/zh_CN/vm/frontswap.rst       |   2 +-
 Documentation/translations/zh_CN/vm/index.rst |   2 +-
 .../translations/zh_CN/vm/page_frags.rst      |   2 +-
 .../translations/zh_CN/vm/zsmalloc.rst        |   2 +-
 Documentation/virt/kvm/api.rst                |   4 +-
 Documentation/virt/kvm/s390/s390-pv-boot.rst  |   2 +-
 Documentation/virt/kvm/x86/hypercalls.rst     |   2 +-
 Documentation/x86/orc-unwinder.rst            |   2 +-
 MAINTAINERS                                   |   6 +-
 arch/m68k/q40/README                          |   5 +-
 include/linux/fscache.h                       |   2 +-
 include/linux/objtool.h                       |   2 +-
 include/linux/watch_queue.h                   |   2 +-
 init/Kconfig                                  |   2 +-
 kernel/watch_queue.c                          |   2 +-
 lib/Kconfig.debug                             |   2 +-
 tools/include/linux/objtool.h                 |   2 +-
 tools/objtool/check.c                         |   2 +-
 31 files changed, 33 insertions(+), 270 deletions(-)
 delete mode 100644 Documentation/translations/zh_CN/riscv/pmu.rst

-- 
2.36.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
