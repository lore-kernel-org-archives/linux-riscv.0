Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F66606A31C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 05:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yjh8p/hl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Svyb1KFO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=285Tp3r2opj/1zQGz8tdmn2FlW/cVz0CAgO+YbvOm1E=; b=Yjh8p/hlL8YFaXW8F5WOxqZgqH
	PP+D7JU+GLxkMyFddWo402cBvnnvIFBqouD96Y75uZWUF9e/BzLA86jDgNL3EWB7hkqHmCKdgSCnF
	NKM1XZJZj2rO4dejuujYaChDvz2hzOmL5EdFHrKV1Iy2+UgE3GNMe2Lnf3VK1JsnXaWsfBv9mXZ5E
	8ynmlL/Y2b4ggRO3oi41m7YdOkq5zOpUBHWZdY92qE49VqkeOEojr8MHR2NL6k77/WzAWGevy6/qo
	OnJy38Vre1kDoUA5BZzSUSiwtxB/gYqJE/hQC6vjmbrQjO0LgWaWg+0UmdERKRmx0fvLgXOwQAddR
	/FH8gscA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHfG-0000000HNd0-1moF;
	Mon, 09 Nov 2026 05:11:30 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHfD-0000000HNbp-1J2g
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 05:11:28 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so213704a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 21:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201086; x=1794805886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E5rfszlHLd8JDdF+Yl/0eyAbCVz/g6JSQG6eBITtUcM=;
        b=Svyb1KFOUNrybjtpcWR66Lio638TKsforjHoMOf/cWj0xuyZ5PKkNzzDoNo7lRKURP
         wqIHhDuT2Bnf21wT/Q4HJifQOdJB/axMgud9CjR0DIYlnnrDC5/x6c4jfub7hYXnMKM9
         +iLsN9AGLierXX0mpc7a6K6Mb8TooNtK9T4ANBQFBkbTtITNdnnuNeZJeULOYPZ/2SPC
         fLzWNmDDU6DEHeWjucMX9sMSLmT1Fp1CtJAVN8DVf8La8vRqAiKB3l8lf+6PrtQW4jxW
         Kh2lnBahySO/Q7G+dg6x05wEPTrSLiKr71Gj4ZTqx6fjrLMyoqHaw85aEgy83BX0bFAD
         1scw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201086; x=1794805886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E5rfszlHLd8JDdF+Yl/0eyAbCVz/g6JSQG6eBITtUcM=;
        b=PsXOSN/abn5jbGB/RG4EgHtHk0qWmlH35KBZyUHyNk3PuOKNQiHGHS1ChEWV3q6r3f
         1EBsyOTPxizYJ6ZKdu1vhQgi3dHi+5y9mDZ9Vhn7CVGBVLnx+L9R3BydzdmStMypxtGr
         AZeNqdn+m3yueziq9RapW9zoOLqChGjDGJTSAoVG/YKp1w1Jg5gQrGz1dPXUL/MGYx4o
         yGhj/GdNbpVwc+Lbp39fHg0talnbcPxOuUNEhjsHOGcrWET4749SAKi8o2lh9pejaT1N
         bWCTpUXjqdzPOP4nfNbN4gmz64G4TbCaFXgUwrjPmSgM5dAGLtIsQ12dNZI41PjmFpdS
         +tPA==
X-Forwarded-Encrypted: i=1; AL+hErFTdLqGY+hQzCwZ1mCUy5KpRp0W6toBudv6INm08c14CybFSIDNlkyeWe8fD9bgdNi/ZsBghr4GJaej1Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z8R4vEbtNdihprgWJhdGev0PjxKrVGja6xzctvP8xWeQWxRpsN7
	mAdj6jOlVRVOBOeY4O9MFrBqnAEuae8fH0yfwEsixeSss3pt9K6tjfak
X-Gm-Gg: AYBFou37QSBKfkJYiFJm5Sl/fUDIvE1u3lrMNgnD7JbcTwOWQv74KPnlorGm9aYo+6K
	085rJiV8AbFIB44YVOdfPWmrfBA7crDZAh4aktM/qliExyr8qQHwaKNBuaA0Gsc5Jk1MMr3noJ3
	n+OnSTJjvNwMGZY9RZObtGVgHlL3b3HikzvAMhY0zKr3GbCkscyLgc640Tdkq3Y8pWH4VlEKAXt
	omSsm+3I6oaRaOj9e/RQ6nVz+/hxAEAHwc1tpix5GtAOo2Y/nt4iePDxn0XVAb/SaBT7oES2bpG
	hT9qfKsaITdtru7pw24fGSRr57CT2gNY33WoYVCKb9hP3xWy26Bj5Pwf4F3KcRagLBxBBx685jP
	Arjg0/65EDT/SYnpkwb/qXuC5MB9Kh6zE050wheiigEWALdKz0u6KEpBNUyBhN4pZTxI6a2flLz
	s4FzqvAl6Zyeffz6/D5I0sp9GWTTl5PypmjsWmdsaVlvbANThbwdTHgp0YbmbCMWI+78+jAdXLO
	Awh1x8FKSRSmFnXIusyamzKAFL/2HW8fSPf20Bt3Dp5rvMHIO8UQgDpaRuIHPbXf/sELmyZlyy3
	BSpdeu1Iugtf9qITe9h5mMg8Kj/z8k724aQ/T+tcvD43Vf9VhTcrF21oX82nonBjLXMHGS+oW8J
	M0Puy/eSjS8kWQQBEvQbppBlpmJrBwlf6Mc0+tRhAjcvA88ZrdwuQeA3q1g==
X-Received: by 2002:a17:90b:4b0f:b0:3b0:9984:18c9 with SMTP id 98e67ed59e1d1-3b12d2cba5cmr2763825a91.11.1794201086140;
        Sun, 08 Nov 2026 21:11:26 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b12790befasm5247652a91.13.2026.11.08.21.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:11:25 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 4/7] dt-bindings: timer: Add RISC-V ACLINT mtimer bindings
Date: Mon,  9 Nov 2026 15:40:44 +1030
Message-ID: <20261109051050.105623-5-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109051050.105623-1-joel@jms.id.au>
References: <20261109051050.105623-1-joel@jms.id.au>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_211127_361537_A6BDD402 
X-CRM114-Status: GOOD (  14.95  )
X-Spam-Score: -1.7 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the RISC-V ACLINT mtimer and mtimecmp hardware, as described
by the riscv-aclint specification, commit 4e570bfd3201f2 [2].

Multiple vendors are shipping silicon with the hardware as described
by the specification, which was abandoned[1] as a standalone spec at
v1.0-rc4.  As we have multiple instances of hardware that implement
the spec, the widespread implementation of the spec is de facto
ratification, providing a stationary target for the bindings to document
and an exception to the policy of not accepting things that are
pre-ratification.

[1] https://lists.riscv.org/g/tech-aia/topic/connections_between_aia_and/107177435
[2] https://github.com/riscvarchive/riscv-aclint/blob/4e570bfd3201f2c09e5afd290b5091526b0f099a/riscv-aclint.adoc

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3:
  - Rework commit message following discussion at LPC
  - Add reg-names, rework description, fix example
---
 MAINTAINERS                                   |  1 +
 .../bindings/timer/riscv,aclint-mtimer.yaml   | 56 +++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..403875d5932e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24185,6 +24185,7 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git
 F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
 F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
+F:	Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
 F:	arch/riscv/boot/dts/tenstorrent/
 F:	drivers/clk/tenstorrent/
 F:	drivers/reset/reset-tenstorrent-atlantis.c
diff --git a/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
new file mode 100644
index 000000000000..e6f3d08d4f93
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/riscv,aclint-mtimer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Advanced Core Local Interruptor (ACLINT) timer
+
+maintainers:
+  - Joel Stanley <jms@oss.tenstorrent.com>
+
+description:
+  The RISC-V ACLINT specification defines a set of memory mapped devices which
+  provide timer functionality for each hart on a multi-hart RISC-V platform.
+  The mtimer device has a single mtime register and one mtimecmp register per
+  hart. The specification is at https://github.com/riscvarchive/riscv-aclint/
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - tenstorrent,atlantis-aclint-mtimer
+      - const: riscv,aclint-mtimer
+
+  reg:
+    items:
+      - description: mtime register
+      - description: mtimecmp registers
+
+  reg-names:
+    items:
+      - const: mtime
+      - const: mtimecmp
+
+  interrupts-extended:
+    minItems: 1
+    maxItems: 4095
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@a2180000 {
+      compatible = "tenstorrent,atlantis-aclint-mtimer", "riscv,aclint-mtimer";
+      reg = <0xa2180000 0x8000>, <0xa2188000 0x8000>;
+      reg-names = "mtime", "mtimecmp";
+      interrupts-extended = <&cpu1intc 7>,
+                            <&cpu2intc 7>,
+                            <&cpu3intc 7>,
+                            <&cpu4intc 7>;
+    };
+...
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
