Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57419CC6B34
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 07:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NSkXpA9lTLejNqzR4rxIIDT9W3SNg2zj1k/qRT8BsCo=; b=ACnlKbNKNEcjlh
	Hm/uayodbDMGQpmz6BYJdeK++Zv9C5olTfViQhROalkN1JCqbpYIh75cTXJThg1zICCmdHeITntaz
	+iC83nk/B7+k5T5RbOe/6W90nf8nXoFsJyuYLxSWyIlsTxsx1xcyXP+LIFRy4VC4epJ5yZu4f00sw
	U9B0GslZMit+bBqzLnfGFPGLiu2zHY+B53RdBydYhKC5/4VxP1d7FERzD7TUpHRfr1jaQGcktpPIG
	owmECPHGdyeA0I66Ol5S9j/sop7M8DqZGbEwBX9hA3bBFnmQk6q4Wo8rQqYhyIySKUmdEzotgpuwj
	NcDvqoboIsG2vDRQL1HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFTo-0000000H0Mj-1YEk;
	Thu, 15 Oct 2026 07:02:20 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFTk-0000000H0LX-1ljk
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 07:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792047689;
	bh=Zzp0L9M7LCZLAz1+fyG+z2Ldl+Dr8gXyzVSa/cx+BAI=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=AsZGOelYNpNtHSIqZXhUVXZuQ24YNNYApzhxYmlF04bH/7bQ0fXkXLPu7XvjSWkoC
	 m2GmZSimDs9F2JvjZM+/0tAIdcdL07VYVmUewyZ15dx38rXz+JaHsyx5ouGZPOc1zd
	 ppDTVJCaZ77iKepnfFf3KYNxz6vCWNHLSdZwH2sU=
X-QQ-mid: zesmtpsz2t1792047681t67a10fc5
X-QQ-Originating-IP: cWp66OV/6Aggbj6coctuU/KnlwtlAhnPiyugqKJoQmU=
Received: from LT-LIANGBAIHUI.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 15 Oct 2026 15:01:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15740401673765768943
EX-QQ-RecipientCnt: 18
From: Baihui Liang <liangbaihui@linux.spacemit.com>
Date: Thu, 15 Oct 2026 15:00:48 +0800
Subject: [PATCH] dt-bindings: gpu: img,powervr-rogue: add spacemit,k1-gpu
 and spacemit,k3-gpu
MIME-Version: 1.0
Message-Id: <20261015-spacemit-gpu-binding-v1-1-a7a23c7e7788@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAB960GoC/yXMywrCMBBG4Vcps3YgKbWgryIucvkbRzCGTFsKp
 e9u1OW3OGcnRRUoXbudKlZReecGe+ooPFxOYInN1Jt+tMYa1uICXjJzKgt7yVFyYkSH82VwcfQ
 TtbRUTLL9trf737r4J8L8fdFxfACERUukeAAAAA==
X-Change-ID: 20261010-spacemit-gpu-binding-edae594ad6bf
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Baihui Liang <liangbaihui@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792047678; l=2486;
 i=liangbaihui@linux.spacemit.com; s=20261015; h=from:subject:message-id;
 bh=4lzXBUcyTaSG7VDzl4/QKL5wIysU87ym0aR2Y7KYb4s=;
 b=T7UNM2+erl662vpWbMH+VuS+cHUxBjWDJJZYbdPe16Jl4P6ELNEUlES5jj5Pg8Iyg8c6rnCVp
 sBFwWDugRZ9DePWoJM11FWC5i35SdCAe1w5+AIXbg18wgL23a5g0yvU
X-Developer-Key: i=liangbaihui@linux.spacemit.com; a=ed25519;
 pk=L9Pa1YBHFuJrRPNu/FfSW/likBvv9j2dUrR3r+YyJ5M=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NAtipnnbTPeap8sin7gfhxxovHr8IfZftexpwPT+F3DB2S7/lKFHwOjX
	FtuoMHzWxoMOY3XXO2LoIy7zjO3V8itb7CGM2RyezL8YiW/vhqbeBAWepAMQjLruUQm6iDk
	ujYMIBE5OgZ6EMPpUfMnzo3BgDkVnx57lzBQY+ifR6rFWgj19TR67xiTmOpS2oJo2xmIsI6
	x6aYkpSDlSXiB6PRM31/HTwWVa3mzRB1R1Nyy9oSoTNxFORwssZHYIWYJ6hb2/ZVEOi7zen
	q+mmsFcKKEERkwDO7x520uAvzBR4W8aI9X1fFik2fG8sHBQPmm29ASHyOncDSDG7mePdZop
	FOYvN1ZCL2NTztkNhFf7Y6Sw3k4OXitUcrVkoZE7PSkh1WYZ+Q7KiCsBiSNuAaxgozYH3tL
	EtumW0PiQSBP/LOdRYpXLeBBYBX51jbTFvV/CcPnpBEGWpKdXePBqpceE2MD7qUqVyJROJG
	CpsZ1+L5bd39PhDBtDnITX5Gf5wvuoAnxMFQJmBqNamHBhvXa4FPYg1EWofPB20jP0bZFwB
	U+yh9zTx6mTeXl48esd1Yp7tjVbSHjQCt43rwDsSkHjiUh9Yh2JYEWzFPhp2kvnBM1Adb7F
	LoHVcd8UbkuY0FOh5gV4ObC9Wp81g4uiF/HkebPneRFx3W7mNmh7u/ShFC78tEQXon+bGBQ
	5/dl0EGoQK7I3qknLsqoSHpa4lVIAE/U6sezQg4D6t6ZZU2vtfsW52BGdTZMTeNQ0HOz2hx
	jdG85dTUi6IKKQF5llKHL5G1PtY62nQTGO/G6JA2rwbZ65Zzk1X3tJ1tKf1COgoETIgi0Cu
	VnQlz5Y2ouOwa72twaMoj0DTQrH7TMs/iJrWmmmajxvn5GYS5d+bT0JzJcQd7eA3SH77n/B
	Sqx5Nw3ukJA1eHd+SrD/RCvUZgcbTsyIfk5e3fCMdTOngH8vGgk2B1igOICc5Lyu6pdeFSJ
	QeYvytwE4kNxVNYwRrZVWXG9r0EJe9OMqcYvE0FNAWdCceKCaQCdM4ANBmW7x5OrhFmhRGY
	g/stjM9w==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_000217_315754_378FA6BE 
X-CRM114-Status: UNSURE (   8.20  )
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

Add compatible strings for the IMG GPUs in SpacemiT K1 and K3 SoCs:
- K1: IMG BXE-2-32 (adds a dedicated entry for a single core
  clock and power domain).
- K3: IMG BXM-4-64 (shares the same configuration and entry as
  the T-Head TH1520).

Both SoCs require a single power domain provided by the APMU driver
(currently pending mainline):
Link: https://lore.kernel.org/all/20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org/

Signed-off-by: Baihui Liang <liangbaihui@linux.spacemit.com>
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml      | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index e9218e0f363..600445cd506 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -37,6 +37,12 @@ properties:
           - const: img,img-rogue
       - items:
           - enum:
+              - spacemit,k1-gpu
+          - const: img,img-bxe-2-32
+          - const: img,img-rogue
+      - items:
+          - enum:
+              - spacemit,k3-gpu
               - thead,th1520-gpu
           - const: img,img-bxm-4-64
           - const: img,img-rogue
@@ -102,6 +108,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - spacemit,k1-gpu
+              - spacemit,k3-gpu
               - ti,am62-gpu
               - ti,am62p-gpu
               - ti,j721s2-gpu
@@ -162,13 +170,16 @@ allOf:
       properties:
         compatible:
           contains:
-            const: thead,th1520-gpu
+            enum:
+              - spacemit,k1-gpu
+              - spacemit,k3-gpu
+              - thead,th1520-gpu
     then:
       properties:
         power-domains:
           items:
-            - description: The single, unified power domain for the GPU on the
-                TH1520 SoC, integrating all internal IP power domains.
+            - description: The single, unified power domain for the GPU,
+                integrating all internal IP power domains.
         power-domain-names: false
       required:
         - power-domains

---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20261010-spacemit-gpu-binding-edae594ad6bf

Best regards,
--  
Baihui Liang <liangbaihui@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
