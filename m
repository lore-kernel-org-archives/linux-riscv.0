Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79629CD6E55
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 20:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1Fvo2pGy5tORxdkKFkNXjtXz0PHk/N+YIMU0x+RxL0=; b=tpwq8MQkrnKb2f
	mNPcI+QvjlTBjTT7A6+Ch8zP4rtcI3WFLeZEAiERBtuKWz2bmUzVYbHcPqN6Cf8D4otieSuzLh0xJ
	D3uxmpm6OafpCcY+kQrqPvJ12xK55SnlzsjDGHUzA2nK/utRzMrKhn/K/ffghmLVkjaJzcVp3KGim
	k7fjapqJB9JJWrNW6GNqUE9BTEB1qIkf3JKY7OIllO7ympeBffyUMooeZBOKTP4gToVrpUZn8Y0/H
	u+ZG92HTHxFqZDqTUhHp84mfuVNcNnbb6KriR1fxB093CbKr1XAo2YCoGmhffokggNaSrJ69usRJZ
	92LxOUTMEG59d4yMsiXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9N4-0000000Bmq4-2OoW;
	Mon, 01 Jun 2026 20:36:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9N2-0000000Bmp7-0xw7
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 20:36:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A806840B09;
	Mon,  1 Jun 2026 20:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8BB91F0089E;
	Mon,  1 Jun 2026 20:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780346183;
	bh=srvdFyNcKWrG6UhIb2zhEmit0iT5/TwfHnN+QzKDIL4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Vu5fMjrPL7VYm/NMsk+fNiF3uq5/IkU3WA5AHlPBzQfbiMgcVhdNxvtBgtkEa0UZY
	 m2cUjSf6mFXgxr00SFaRZgk2hXmFKuhFhHiw3wF3fgQjuq1PUEX9WqjICXhm+2xx2i
	 alJK209yKLmVdvEdDTzmQKPtIKpdyRjtOIgqLUo0ppBpt2sFin53t351+FVffLpHF7
	 8abIWTN3Al45EAIc6Az/5+4AeUNy7TBWhWqLEl4RfbY9Hhg5uwx50fJRLyCFGXPYjA
	 JVMKxykKaHpSxUeGGRRBrXjDkFIo0U8/saHHeNYk2WKibfjLYBf2vBgQZ1vf6dsU0F
	 YBTx0X6Noe4dQ==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 01 Jun 2026 13:35:55 -0700
Subject: [PATCH RFC v6 01/18] dt-bindings: riscv: Add Ssqosid extension
 description
MIME-Version: 1.0
Message-Id: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-1-baf00f50028a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227; i=fustini@kernel.org;
 h=from:subject:message-id; bh=oVWQwUJrVLgt2ds0hOtdw/u3HLWC21FLWSsgjsdIJHo=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTJvnWS+l7dmmLiodpjdaLoX/znPxLpDTs/NbouDP55T
 f5w3MfKjlIWBjEuBlkxRZZNH/IuLPEK/bpg/ottMHNYmUCGMHBxCsBEhGYw/BVkVMk5d8m4M+Cp
 TZ/FIv2r7/lCtiifuLQ4hGuuV5bRyjkMf6Usfviqzo4MM3SLy/dO/rSueJ/FJdOSK09TNWxU+FT
 c2QE=
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_133624_313997_648C35C4 
X-CRM114-Status: UNSURE (   7.87  )
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

Document the ratified Supervisor-mode Quality of Service ID (Ssqosid)
extension v1.0.

Link: https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2b0a8a93bb21..1c6f091518d4 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -232,6 +232,12 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: ssqosid
+          description: |
+            The standard Ssqosid extension for Quality of Service ID is
+            ratified as v1.0 in commit d9c616497fde ("Merge pull
+            request #7 from ved-rivos/Ratified") of riscv-ssqosid.
+
         - const: ssstateen
           description: |
             The standard Ssstateen extension for supervisor-mode view of the

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
