Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D612CCD5BD1
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 20:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B6hzqMxOvFd1dpNVBQMAqPn0hg3BiV2L++TYUMv/i84=; b=DEu9nw9YuR+G7r
	rlWz5CJnKERSDij2u0TCKBoG3UE2Og0I8nxeqpQQmYfRQAVW7AtHwQPo2TU8/Q3n67AEluBrMuzKm
	jP7F7KjQPH+pZvAyr7TEJwcDGxNCO7oN56H/naRp8EtzSm42m8/kYGDer7aakbybSm/1FXsNCYNVG
	R3CFP4CUjUqaHJE7OjRr1CPWKnaniVVScmPOe2dNy6r1PHPgkVnXtxEPPdPYOhj5x+5U963bdqiyo
	hQo3JsAgms7qG4HI8E49HRE4ljrQYr/PRifSkPNCylzcDu9SNIG8nceHioHLPfGwOwAsCizI9YXKg
	veqONydRy/XypvK2nPAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9NJ-0000000Bn8c-1xb4;
	Mon, 01 Jun 2026 20:36:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9NG-0000000Bn2d-2NAf
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 20:36:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D68E41399;
	Mon,  1 Jun 2026 20:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8091F008A7;
	Mon,  1 Jun 2026 20:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780346198;
	bh=U+t+EwaLSa9WOo0VEMTYqUakFDohqsI+NxBxDSmeLYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Nl8wTyX/3fAHjM6xCDMCVHOCu3oJDWI+XRy1KZ9PvBnAqA4duBLSFcYQDXfH8LR3H
	 bmr/vkHgcmqlGVOPXOH7eCHLUrkofOuec9XEdAucwtz9xqZZHwYBth838JWjM42WrF
	 hRyA0hrHdvjTHSOwxDgjgflVsYBo75+Aupt/ay78vbAlWMnIJOnE8VIhCaoYlBKxcH
	 o8pRHP/gexjsttym3kyDtl8ZOM5k3lxZ1P95y0xEcdjTjfVFiPAHMIbFv+ZHgEkHDv
	 bM5jqFFfnUwjVLqNNStE9Sj4Yz0MjpUbRO5wwoFjBHhzrUAiD4jQtHRYj2dzZ60Xjk
	 vKo/0wGjioQwg==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 01 Jun 2026 13:36:12 -0700
Subject: [PATCH RFC v6 18/18] riscv: enable resctrl filesystem for Ssqosid
MIME-Version: 1.0
Message-Id: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-18-baf00f50028a@kernel.org>
References: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-0-baf00f50028a@kernel.org>
In-Reply-To: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-0-baf00f50028a@kernel.org>
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
 Conor Dooley <conor.dooley@microchip.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, Gong Shuai <gong.shuai@sanechips.com.cn>, 
 Gong Shuai <gsh517@gmail.com>, liu.qingtao2@zte.com.cn, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Drew Fustini <fustini@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, linux-rt-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=876; i=fustini@kernel.org;
 h=from:subject:message-id; bh=6CzKXhV0tXNwm1l8Ur8ud/xHZoolzjjof2zwrYxGHkE=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTJvnV52Za3ouVAzL3ilwppM5c5a08te3++5curp5eER
 TanbI9k6ShlYRDjYpAVU2TZ9CHvwhKv0K8L5r/YBjOHlQlkCAMXpwBMJOcGI0NvgXDqtYmLhE+G
 LVeYFdfqNWG+hJJ60TZPI6Nn2yMPnLNj+F8Q/2LCVN7dmtezuZ7369SkzJZ9d4PD4dLsk+rvZk8
 yEmYEAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_133638_677460_5073630F 
X-CRM114-Status: UNSURE (   8.57  )
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

RISCV_ISA_SSQOSID selects RISCV_CBQRI_DRIVER unconditionally.

The resctrl filesystem integration is gated separately by
RISCV_CBQRI_RESCTRL_FS, a silent option that defaults to y when both
RISCV_CBQRI_DRIVER and RESCTRL_FS are enabled. Enabling the resctrl
filesystem itself stays a user choice via the standard fs/Kconfig
MISC_FILESYSTEMS menu.

Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 390353a6153a..dd65248df117 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -596,6 +596,7 @@ config RISCV_ISA_SSQOSID
 	depends on 64BIT
 	default n
 	select ARCH_HAS_CPU_RESCTRL
+	select RISCV_CBQRI_DRIVER
 	help
 	  Adds support for the Ssqosid ISA extension (Supervisor-mode
 	  Quality of Service ID).

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
