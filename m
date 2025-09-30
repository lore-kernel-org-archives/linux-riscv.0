Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A708CCA470
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 10:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OmsK7YlxZGlO03jtt9FMNfKGi0YmzF4RAosYJRl/co0=; b=Tn4xMSz3aYluqj
	laL3SlapSpO7iTYJCz1sztBbw65d6nl/U7pe1JzihxUSf+0fec+YVOYBA9tlHkWus7KTY7vZ316ej
	cghHQsYDfsiYFdAEPc/eztblsk16T7bZqLKQ/AbKTywUqgEwnzYnDPd4odCWgzCq8tHDi52gqcEqi
	JbYkgdwgK+CBx2Q8FlG9DCYwpta+fS8E3IQmyKkZgZt/Z5KEd0DatTvYlbZTHwfeOjD5Rd2UH7euu
	cfws+5PbJHS1v1tXI09GLVKuLWduh7YWw7wPCp7b4Wze9/3slqwq/phNKuh7fW90/qVDA273kQurC
	wLSHB2QIG43+QDjpA+xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3XDC-00000004x3o-2FIb;
	Tue, 30 Sep 2025 10:03:58 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3XDA-00000004x3U-2Wfh
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 10:03:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1759226622; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jFyA5s13TGp4YMP4M/gm0d2i+4oQiLGVPkahAPQhgE2OVdXLvhNYusWZzfFwH8T3XNoZU3wutiasCbIZAtI08Gpl+sL5y6oQVxL6f2yvR+KSyYf+uCGRrqHSbiFkFFSdWXqyIYGsUIs7kZr++iMMXj7Zi3z9XEAUqUjhaNbIIII=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759226622; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Tl+f+Pgxhudu6lRBZrTcBlIXtgXTfSiaBeAZSwRQqlw=; 
	b=T2iFLgEw5e5KL0hai8TOt9xyPfszNKlneXtT/3L4i/LG88Y7nvZGlTMJbNtpCQbFIcPapRsncizGClTZGG0VUjEgT2Z6ltxoGnzR/cPOmnDcIy3G1uqEwyY8hmSOeXngBH2T6jJQv447erGV7D/Vr68Rd8c+o3/9Bdkd4yr0/oE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759226622;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Tl+f+Pgxhudu6lRBZrTcBlIXtgXTfSiaBeAZSwRQqlw=;
	b=p9VxmwBwBbyjrOuf06SdFrfMNjMgfUqtGRZ4/WKhRCgTvww3DiXvHh0kxi2l4ePU
	Oxiugjd8Vy/s3j6qwmnpbAuj2SlGeJGnjz5NW6SKf81eJ8mgSCmbarEqk/X1JnVPEeY
	ZKlFF0BZIN9j0kM7tm1M7dlsP4Z5tiUDoDyN0T0qLXDH1KBOdPyrxxkuUKKmWqOCxpY
	y+1/NwDtkVDEx+b+ob8QMcblk2JNPZPIKM3Jpy6pHZpkL5q55QPpAOhLT0jMuGMs1yo
	Br60e+cnQhBGQwv9xoEcVlNRpywBPkdgbC2v05gxQHvq17fYd293L499u3s9lMPXWsn
	tnk8e/ZPnA==
Received: by mx.zohomail.com with SMTPS id 1759226619881894.4752828267287;
	Tue, 30 Sep 2025 03:03:39 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Yao Zi <ziyao@disroot.org>,
	E Shattow <e@freeshell.de>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 1/2] dt-bindings: riscv: starfive: add Orange Pi RV board compatible
Date: Tue, 30 Sep 2025 18:03:17 +0800
Message-ID: <20250930100318.2131968-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_030356_703652_81AA8E03 
X-CRM114-Status: UNSURE (   7.10  )
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

Orange Pi RV is a newly released JH7110 board by Xunlong.

Add a compatible string to the starfive platform DT binding.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
No changes in v2.

 Documentation/devicetree/bindings/riscv/starfive.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 7ef85174353de..dd5cd51e38797 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -31,6 +31,7 @@ properties:
               - pine64,star64
               - starfive,visionfive-2-v1.2a
               - starfive,visionfive-2-v1.3b
+              - xunlong,orangepi-rv
           - const: starfive,jh7110
 
 additionalProperties: true
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
