Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CE1CD37AC
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 05:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1Fvo2pGy5tORxdkKFkNXjtXz0PHk/N+YIMU0x+RxL0=; b=15Sqaf30jED8EZ
	cNaEnd8C2d5Dz4SXSamfbEoVtTMIgzYRfR4feyWDy/HWSRnBNWAoetzK1Mok2PchQm8oh8DYohsNT
	+xr+UPG9Td0bMykWh+OmQzLVjnMy+eJIrEjDquzI1srs212LediiMaEi9Og7s9h0r+Qyesd8XNr3I
	VIvS6h4RXhd9bSm/GBaKmeQ5A5dwDXs5VB7f6rTLHMWXTZ6RHgRGy5ZrT+AHSYuSU9n7XR3FIwaBm
	dCsUbzFA03LUbxtpEy5j+7WSO+zUuvm66Q0LqS+i0UnjhXdhVCXr2XpZChPmvYe+oKF0VEBsRCT83
	nqjN/7bYnR0KtEooz0UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIvZ-0000000CLP7-2h7W;
	Mon, 11 May 2026 05:11:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIvX-0000000CLL6-29H0
	for linux-riscv@bombadil.infradead.org;
	Mon, 11 May 2026 05:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=srvdFyNcKWrG6UhIb2zhEmit0iT5/TwfHnN+QzKDIL4=; b=cdAdLcDyrlVa07zp7n4bhsx9kG
	HPX7h6dHPOd4s2ctTGmZlJEu9dwI3xQn3VUNbpXLtmrAdZkEVZ0UtppsaOXPzDkXS1jK+0LcSc7My
	6YQGI7uZNAfsrM2WZ6yVHad5LV5CUOts3b7XlX/ULUrgmdoB6/DOXen5oyQSpTFwEHQsDHj00lmwx
	hc7JEcy13DLlvamS/Eht96IwmdIybBCkZzWrvVFuDWmobqL2erOhQyjCcMeJoacsedc1fwJoXQg7K
	DO+UUWaMlZzT2e3FLeXyxkICD5l+/p29chOETQ2AY/kSeHErY4DGFuT89SjxaJ8MU0O8gt+czSQ80
	ndz966rg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIvB-0000000Ae1D-3428
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 05:11:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D2C584454E;
	Mon, 11 May 2026 05:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC25C4AF0B;
	Mon, 11 May 2026 05:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778476269;
	bh=oVWQwUJrVLgt2ds0hOtdw/u3HLWC21FLWSsgjsdIJHo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S7CDMUquQFxBeQXuBHcEEOQmSp06/rh179c+P7fYhN9EaL2F2yAGmdsuD3HhTFcvf
	 Avy4v2N4Otqn9O1+HAWyfqNZu5STDgQ9frHcGn3vgBljIWdD4IQP+7Kz3BtER6zEz1
	 qQtS8e3svEJcjNe84EcAvg61W+BrOWcs5B0fqFNjOrO6GM8DFRhzEv+MBB6qZL0K6Y
	 yblPKSKs8qEMhM7gSkRJCq7JroL8+3OSj0CiKN9ngVL+rQSavmGvRLJsdtVFOkyblN
	 CS4C8tajr0fq3kLde7nJaEdGZSATQlUKpg8siNj4tcGcHygL9i2NXlNiaNtgZSz9k6
	 oiIuowBx3hccw==
From: Drew Fustini <fustini@kernel.org>
Date: Sun, 10 May 2026 22:10:57 -0700
Subject: [PATCH RFC v4 01/18] dt-bindings: riscv: Add Ssqosid extension
 description
MIME-Version: 1.0
Message-Id: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-1-eb53831ef683@kernel.org>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-0-eb53831ef683@kernel.org>
In-Reply-To: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-0-eb53831ef683@kernel.org>
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
 linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227; i=fustini@kernel.org;
 h=from:subject:message-id; bh=oVWQwUJrVLgt2ds0hOtdw/u3HLWC21FLWSsgjsdIJHo=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWQxprza+/BWo+jrSn/ZLZnrnk4rWuFg3fl69yT571I9k
 WKajpq/O0pZGMS4GGTFFFk2fci7sMQr9OuC+S+2wcxhZQIZwsDFKQAT0XBk+O8qJtc8a+plF+b5
 iypK5mpIMYddP1N+XU71cNyRdfO69bIZ/rtZ3WuvOHOtKywo4qMRs/vEq4IPZqyLid+zQYtB1Gf
 1aj4A
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_061130_237275_DDA0360C 
X-CRM114-Status: UNSURE (   7.31  )
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
