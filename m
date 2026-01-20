Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA45D2ED0F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 04:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qOH9RNHTz6bk8w3qrtML7JP1xs9x4O0Jlqo4OR7uguI=; b=0uO2WpK49C8tdb
	VMRhc7tr53cj6mRRhKY2Q36XS0rUqrFqN0y33wF/dmyEhMFwMUALBt/zuCgbe6KJY/BFIYuhPB4xi
	OBunLoDTIas5C1ONOKxLuxDOaO+tSunRPB7B/aFSv8pLrNmhRRkKksOee7aacfGip8hu8/7mXbdli
	Sy43oySWbAUttwf83jLJL6lVFPmfU83Xz1MwntcDMorG1vbqEvcDbtOgjmr7BQz0k1lVTTJGnxAA8
	XzwtYZQKyfJL/pcwJHr0hfbuXgGZ3taV49SQCIw3y4aThMQVH2Yc5v552uc+QWIVybaUuvdYECmkK
	DyUF9T61yuTlySngyweA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3B3-000000039s4-2ei2;
	Tue, 20 Jan 2026 04:17:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39c-000000039Og-1iGt
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 04:15:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88DA544550;
	Tue, 20 Jan 2026 04:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0649CC19424;
	Tue, 20 Jan 2026 04:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768882528;
	bh=vOomva/hR4ZN3wCiusAiE7WWWgswq+7ShOke7S7qUXU=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=M/h1V+PqX4zXCxzDt8NUnxPgoXVnQhg8WoUICA3PhEemyl3VhMSjOI+Jhe2Z/juZu
	 4LzN06174ZXaIUomWcFT6yWpULBfZLnKcJq4MwvkZzJU+zL6GgcmiqWS7BmB0zX3ay
	 c3W25/l9jvnz+XskL4ygAJKq2U9z/cZWxzZm3MkuttSw7kX0fXcBUPQjXap6qENSVd
	 aGdHVuClMkeF865an2gkhILh0i0Gk+6M3LWWMoL88VbborkXjYpkt+zBeJftYDmnEl
	 neaBBG41Qb/GBi20/OQ8qtkbzg7XVHrwr2/0KFMknZ4Kjb9386ohhInvLs6XO6n5TF
	 uK2cKiLbdKAtQ==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 19 Jan 2026 20:14:56 -0800
Subject: [PATCH NFU RFC 19/19] riscv: dts: build qemu dtb for
 CONFIG_ARCH_VIRT
MIME-Version: 1.0
Message-Id: <20260119-ssqosid-cbqri-v1-19-aa2a75153832@kernel.org>
References: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
In-Reply-To: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Atish Kumar Patra <atishp@rivosinc.com>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, liu.qingtao2@zte.com.cn, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Drew Fustini <fustini@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, x86@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1198; i=fustini@kernel.org;
 h=from:subject:message-id; bh=vOomva/hR4ZN3wCiusAiE7WWWgswq+7ShOke7S7qUXU=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTmMwZb9fXLx8458y/0Pfe5tgalmf87g9JnbxHbYqs6L
 XJ21GyFjlIWBjEuBlkxRZZNH/IuLPEK/bpg/ottMHNYmUCGMHBxCsBEbqxl+O/57GxiscP8Tb3V
 knN/5t+90yOx1HDzHp+elU+MXJZnRSYwMnzd8TT9wTaPd2YLMy/lvH8bdczy/q5F/ZPdHptcYE8
 9GMUCAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_201544_566091_4DD008A2 
X-CRM114-Status: GOOD (  10.22  )
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

[NOT FOR UPSTREAM]

Build DTB based on Qemu generated DTS when CONFIG_ARCH_VIRT is enabled.
The resulting dtb will be consumed by qemu-system-riscv64.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 arch/riscv/boot/dts/Makefile      | 1 +
 arch/riscv/boot/dts/qemu/Makefile | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 69d8751fb17c..edd25cf000cc 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -5,6 +5,7 @@ subdir-y += anlogic
 subdir-y += canaan
 subdir-y += eswin
 subdir-y += microchip
+subdir-y += qemu
 subdir-y += renesas
 subdir-y += sifive
 subdir-y += sophgo
diff --git a/arch/riscv/boot/dts/qemu/Makefile b/arch/riscv/boot/dts/qemu/Makefile
new file mode 100644
index 000000000000..a6b06ef1a75a
--- /dev/null
+++ b/arch/riscv/boot/dts/qemu/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_VIRT) += qemu-virt-cbqri.dtb
+obj-$(CONFIG_BUILTIN_DTB) += $(addsuffix .o, $(dtb-y))

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
