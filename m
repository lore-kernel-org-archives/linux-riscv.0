Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BD7CD98F8
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 18:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RH1u9B08PLqwEfzij/708ftbT80nT1uWX9tyycZY2s8=; b=maS3sAD4kwnlH1
	UbuO/ctcqW3J2khFgmM3kBndzGAyfBN5kYqxS5tMlZHbnEloeDcb+veJ7Vq5EC0U2lYPY66WMoRso
	S1BUp2OYJHz4dnd8ASserSb5f/hBD92al6Yo4wwPc9LoGjp2e5PVfOfG9dXsNREU9/SAel/tpAuxt
	oKVyskIt9Um+VGcn1JOco05Sij7vAth4biWjPwV78QWpGSTbY6ow39oFdSJuWxXkYP3Ux1HXYFzqe
	vUBzb8ahFcQtHxdfc9VSlInNV/a/0bKON4lEIBnfoCOj9KBBcLI1NZRiPUu6Sv4US4Xbc45wdCWKq
	21OnccYMoRSSWluYubMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wadyT-00000002rx7-3rUA;
	Fri, 19 Jun 2026 18:29:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wadyS-00000002rwO-1VeU
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jun 2026 18:29:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 20EF044528;
	Fri, 19 Jun 2026 18:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BD81F00ADF;
	Fri, 19 Jun 2026 18:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781893792;
	bh=FHASCoT2hpjqe3g0pZSejYTwgoS9bxzyrN/pYid+Zvg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BgL36/MdtkXnliB3muWgnlfl6C4aF9t93w31WTSM4HaW8ALqeNqV1F3hl2xyoyaXa
	 OY8iy2TBxwShD0gNJB6BD8pSoWCUDUqBC4OPmpO2x9ql8WiVlbyT4Ib4qwsuajIM2D
	 5OlqhfJBzMgnlNkdeOlJv9FSRoWpD7qHXeiz3SoaqHF2KZzglbzXhjIasCyVWGO9Xz
	 TQfHZoyGUx1l4SQMRQuRvr+9Ay+rTjtwJdECPje4OBJqvFtyQONjO9aySRGZf91dbh
	 8voSCzq+E1WaaVYSwFcEBjYPedqlTuPd5hCvwPQhT0SWznNprGi6ksgfheY/L2C+PV
	 FVuF9aQgsSlOg==
From: Drew Fustini <fustini@kernel.org>
Date: Fri, 19 Jun 2026 11:29:41 -0700
Subject: [PATCH 6/8] riscv: Enable resctrl filesystem for Ssqosid
MIME-Version: 1.0
Message-Id: <20260619-dfustini-atl-sc-cbqri-dt-v1-6-e79a7723fab0@kernel.org>
References: <20260619-dfustini-atl-sc-cbqri-dt-v1-0-e79a7723fab0@kernel.org>
In-Reply-To: <20260619-dfustini-atl-sc-cbqri-dt-v1-0-e79a7723fab0@kernel.org>
To: Adrien Ricciardi <aricciardi@baylibre.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
 Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
 Chen Pei <cp0613@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, 
 guo.wenjia23@zte.com.cn, James Morse <james.morse@arm.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Newman <peternewman@google.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Tony Luck <tony.luck@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, 
 Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=876; i=fustini@kernel.org;
 h=from:subject:message-id; bh=XzD8qxhMVFjGTkcUSWhD7808N9wJROgN3KTUSR29OyQ=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWSZds2ScJ7qpp9w9l7uG0Fz9munnv0xzGNZKSj7Z96M1
 rQfCtfvdJSyMIhxMciKKbJs+pB3YYlX6NcF819sg5nDygQyhIGLUwAmEtjDyLDv+PXNygsDvjZt
 jL1y3PPx3G2h0jt27VP7l/LFccWe65taGRkOnVBcs0Bjx4aIspaKkKl+LBZfV1Up7gxZEvQuVLj
 26VEOAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
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
index 9eb65d0eaa07..cc261de01107 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -595,6 +595,7 @@ config RISCV_ISA_SSQOSID
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
