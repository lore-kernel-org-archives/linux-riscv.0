Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16912C5AD5A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 12:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XTzG1krwMRHFBfiO6dThSVERkTUFdqZZk3Q+sf+u8bc=; b=jZFjae5NdoLvqW
	PvWjsA8QGmp9GAK6BoeAynWNyJH826yqdSRuLjh3oexwFn+zHnnQTcMkShJKII6RrrNAx/4CjlcHb
	VvFae3wtCwo6ZAIl/NCeUz4BWpKkrhbCda1B88yCgObQLS3pSyEPfd05FC57CllvnobX8QvfiB5qn
	xqx4F5ZKLsIrdRKiC2RgcbMbV1mPJUBW6PRqf2wa9sfDNRT16C9mxLYtbixNBRQnnTRF7XFPf5rFJ
	gOejW99f7Ipa9562sFe2WeOPRmT/LtuJkqCG1yy6x53/V1vLtWLhL9so1UBhxX57opc6xkhvIegVC
	+cJ4+aNT1SBQgOeUSqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7y4-0000000GAyK-1CFY;
	Wed, 12 Aug 2026 12:22:00 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7y2-0000000GAxX-389z
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 12:21:59 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-495590dde14so10926255e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 05:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786537317; x=1787142117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LCdL4VbOsSqHHyMYXFoVto3PKZeUgpsQP3ESoT9xVbU=;
        b=R/vPOBho07i1Js7SWJ1Q61F+/BHB7qKVK72/LNLljLhJ/ZcJVLJkw59zX1+IWUQp9O
         kLNd/9N4dZllqZGKpda0oO/C8+MrhvvGC8MZGmbUcL0S9piZy+UorD//ez6CrLtUXyEF
         Ge4G7afQVcOBW7O0H1ZpVZcByMXpeoY+o29U0L+1IunF98LUAclP7j7dB7bS0fqEiLub
         Rw0rNXqT+LAbVPR8vymmuGndOpcv6yZDdl+V9Gh2AgBUM+UEbypKUgHYt30tp6/otTMc
         2CxdIfFeR4Et/1kQx4yqV3YcEbxmAq5FPBbRVptcObhKoPUoaRFdiUjboQsh1nAeFVCM
         Re8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786537317; x=1787142117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LCdL4VbOsSqHHyMYXFoVto3PKZeUgpsQP3ESoT9xVbU=;
        b=LYqRjrr31KqyrBVDhLQVYL98SVK0JjmJF/Rwr4jaPGZ6qi8w9XBKYug2QottbRkKnj
         /nPGx6aOvaLTuTk6Lt8Dh81G6jGjUw0RXlJ0lhq2X7RzCovaa1vGh3BQ2n+HDhkOXpj2
         DA+oJXdAgxFcOIhV6dPcNNybkc9RSJyo3wLFi+bqPncubvDAGWbVSPSLLRhdWaN3K32a
         39t0rkM7huEMcwBU4KxZUAW058ocNNbOuWqe1VyStpt4b41ym7sXK/mvayrEbon9wTah
         un4L4N+YaMMMb/4JzSEOz4HUVuJFqOWbBy0OhzV45ePCErXYe71D2ueKjC57VkidjXRP
         7vbg==
X-Forwarded-Encrypted: i=1; AHgh+RoBjbU6iHd065Ez80J91jeWMDc6KpRXwAUzt+hUY94ygggNDNJBEXQVxUuEZAcVfDAp0EhCqdRsUX+jkg==@lists.infradead.org
X-Gm-Message-State: AOJu0YziYlCMsgHLGQcW0R8YJkwZr6bBqAM/Wyw5d2wu1Znkv/uLCylz
	SOkWtayTezvJmY8+DPL8dpxBpa8F2fXZNZJJc4dlJeLFPqdj4EH2C6ZQotjl8/e2+IU=
X-Gm-Gg: AR+sD12bXH9wnBrbZZm1qlum0fObFavJ06P9Ao5R5Aa9QNy9Q2RJgAgrrHCvlGftlB7
	kRwezYSzYLSzNyOmeebw9Nbrg9o4BXiYuDy+1kzRJ0rSv1lQavssgLiwyJO3gD2tdLRPbKLSioJ
	6+a6TUdexcdea355QDzJW9AkqSSTRQ4GgPwV/zIZOzNVwSo5U+Nch7jzLLJeSfYX+Dttpozo/k4
	jg3wXmRpn1jUijqiz5+MU4X09kczV4/Jv5/zMIJMCabLnftVPWLUTklzFGmtvoxtnN2zMi138F/
	J7Hb/hR7qgrvypIzbzmqvN0112eL49Y1UExVRisZhJFqkj8eRwMkLKSFwVXN8mVvyhNteThZkyz
	YqhpjVuXwDFQBiik55Vvt7f+/5nobCp8EjfJOwXCOPsGEiPB/erQ8Pn8xgFnvzDQ2tpsUmrcHEd
	7B3M07JVDP3kUzrwQfUvSwt+p1HVPmWsWGQQcyTuyr9BK0AxHGTUq3uIPdhwJyeinzaFTrpye1X
	LpacQD0RTT4
X-Received: by 2002:a05:600c:8b52:b0:493:e365:7630 with SMTP id 5b1f17b1804b1-4997c147d7emr72358545e9.14.1786537316768;
        Wed, 12 Aug 2026 05:21:56 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aaa5d04sm65858905e9.2.2026.08.12.05.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 05:21:56 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com,
	dlan@kernel.org,
	dfustini@oss.tenstorrent.com,
	michal.simek@amd.com,
	junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com,
	akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn,
	luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn,
	nick.hu@sifive.com,
	jim.shu@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	robin.randhawa@sifive.com,
	scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH v3 1/3] dt-bindings: riscv: Add Worlds ISA extensions
Date: Wed, 12 Aug 2026 20:21:29 +0800
Message-ID: <20260812122131.1534906-2-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260812122131.1534906-1-peter.lin@sifive.com>
References: <20260812122131.1534906-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_052158_816344_BBFF0F53 
X-CRM114-Status: UNSURE (   8.58  )
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

Add DT bindings for RISC-V Worlds ISA extensions
(Smwid, Smlwidlist, Smlwid, Smwiddeleg, Sswid) and
enforce their architectural dependency rules in the
schema.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
Changes v2->v3:
- Add extension dependency rules
- Fix alphabetical order
---
 .../devicetree/bindings/riscv/extensions.yaml | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 5ffc40d599c0..0408d1116527 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -181,6 +181,18 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smlwid
+          description: |
+            The standard Smlwid extension for M-mode control of lower
+            privilege World ID via the mlwid CSR as ratified at commit
+            TBD ("TBD") of riscv-worlds.
+
+        - const: smlwidlist
+          description: |
+            The standard Smlwidlist extension for M-mode control of lower
+            privilege World IDs via the mlwidlist CSR as ratified at commit
+            TBD ("TBD") of riscv-worlds.
+
         - const: smmpm
           description: |
             The standard Smmpm extension for M-mode pointer masking as
@@ -199,6 +211,17 @@ properties:
             added by other RISC-V extensions in H/S/VS/U/VU modes and as
             ratified at commit a28bfae (Ratified (#7)) of riscv-state-enable.
 
+        - const: smwid
+          description: |
+            The standard Smwid extension for M-mode World ID control via the
+            mwid CSR as ratified at commit TBD ("TBD") of riscv-worlds.
+
+        - const: smwiddeleg
+          description: |
+            The standard Smwiddeleg extension for M-mode delegation of lower
+            privilege World ID control to S-mode via the mwiddeleg CSR, as
+            ratified at commit TBD ("TBD") of riscv-worlds.
+
         - const: ssaia
           description: |
             The standard Ssaia supervisor-level extension for the advanced
@@ -262,6 +285,12 @@ properties:
             ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
             ("Updated to ratified state.")
 
+        - const: sswid
+          description: |
+            The standard Sswid extension for S-mode control of lower
+            privilege World IDs via the slwid CSR as ratified at commit
+            TBD ("TBD") of riscv-worlds.
+
         - const: supm
           description: |
             The standard Supm extension for pointer masking support in user
@@ -924,6 +953,30 @@ properties:
         then:
           contains:
             const: b
+      # Smlwidlist depends on Smwid and Smlwid
+      - if:
+          contains:
+            const: smlwidlist
+        then:
+          allOf:
+            - contains:
+                const: smwid
+            - contains:
+                const: smlwid
+      # Smwiddeleg depends on Smlwid
+      - if:
+          contains:
+            const: smwiddeleg
+        then:
+          contains:
+            const: smlwid
+      # Sswid depends on Smwiddeleg
+      - if:
+          contains:
+            const: sswid
+        then:
+          contains:
+            const: smwiddeleg
       # Supm depends on Smnpm or Ssnpm
       - if:
           contains:
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
