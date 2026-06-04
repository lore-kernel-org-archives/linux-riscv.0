Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E12CD6E4A
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 14:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ce5o/5sHyAGxNuHH7LOQufK+C/kG7EQjb7uVN35NeBk=; b=BlgtnU7nrSy5vr
	m82tVJMJsExWxiZqDJqh8+3JlA1jH45OwrR5GIt7hbygTCslbGMe7RDygLjF/ZdHlf7HhNHpccvkX
	IRjMqPJy09VoLwAiBmKUchtqdflZ837uJ40ICVYGFw273e7t4c9EDVcoJx62sfT59Llm8p9ns8+fj
	YbEOpF6SirHYD7+HaONdW9Spxb1rTflAqLHxQVt2YO1yQypOnb1OpHRcsvkfa6HcE171eZrvTIukY
	QRY5VhzpY+m3edboCiMbYq3pGOSw3W1adaP1pOikAjpjmh1zRUqI1jIGmAAitdDD8yCPOUf4eyaj1
	j9wyaPzQ0teyKmh49jUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9G3-0000000GvBr-0PoW;
	Thu, 04 Jun 2026 14:41:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9G2-0000000GvAj-02vV
	for linux-riscv@bombadil.infradead.org;
	Thu, 04 Jun 2026 14:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Y17sO1CSyHWex3fTMtGBSYStxy9Oe09MAYCGKv492cY=; b=ByXU9bBq49Wd0m7CbQMoshzhXi
	5yYVQDlHO9as64Z1OhRfC7FZHwfmKB779wttIMJIL0z1eFtTt99XG9kYkl5xeuO/GuIwY++TIroS2
	caO/8NA4W20Wnr8vFhNwwN/rRpt7kWDV9ODy/dbK5Kch4XLF+SNolaH65KaoUvdvjhlSpmegDE53x
	htfpCYqKsR4pXbKb22EdCUL7V10h2TxZ3WxVyf8WujusJ64A6FxiQjBCYlWt5XBO/Wff3kcY3Fcdx
	oLJxnPDIpOuk+5vzOPWassEgMyYCsUoE8Sx3xFWgU9Uu1CdXPzlOQNTk91YbdTj2m950pOobXRX+Y
	P8T/vqhw==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV9Fy-0000000ES7M-1f96
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 14:41:16 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84230ab8857so362687b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jun 2026 07:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780584072; x=1781188872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y17sO1CSyHWex3fTMtGBSYStxy9Oe09MAYCGKv492cY=;
        b=hm2EHQB4qQIoYGNzcOFUWpSgG4VubIzn+ks2YI5hewQ70A5gruR9ps4dWAtfVI10lm
         ETtWyUT3/VVzxQ2dI4zrx2Mcx9pgWVzhv+LCJv2QHgWqPXiUPkwRH+ExSRHsR6x8OH+N
         FK3EY42Alqbp3xnwLyoAnmVwYI7SVbcvLjfTHtgvSwsrmVxwx8/8ydViLKVMisjtd8vs
         VSSUvfcm+wLx5pgSQAMmUvWKxr8HJ8Pk+5qqHa9aBMQ5QQgxp710ScBfP6YZM6KnUg5P
         2e/RV6tcxQN/WaKChIIegs9XxEO4MqRt3PnkD7HJ4sNM2t4DgqhT4gDe3h5zalvoBMps
         wPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780584072; x=1781188872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y17sO1CSyHWex3fTMtGBSYStxy9Oe09MAYCGKv492cY=;
        b=ZumU2IJq6/LaNyo/fBXkyp61SjBTSD/kCjnNJ490+TtmEWte/iexl8z+wbQ9rldS4/
         jrJHzdtOAtwiBJg7V9sdR9AOdDaU03Ia0ArtgXNvd31s0k+aKKYAHQItos1SRKwutP9a
         JynYoeed2/GZzOOUZTIieoxdk8+05zczdzZ/NP9nvXpScs0Ng8UjXlxzW84ze0rj5HnO
         VNNmBkVRRMsNMyBXPcGTuNqt0p6/sfs4Q2KpvqpCUEigALVGJp+tnrJNsBRC5oLAqAwf
         +B1j93H1a7wt7mpqoFF9D/66LUVje4HTyXpbYfb2JCz90ds/7FcbiBO6cCfQ/51x2avT
         S8QQ==
X-Forwarded-Encrypted: i=1; AFNElJ+1M7FV4b7EaWw7iaIAv6reVhX9Apme95VEclQ2nKyeMFdcqA0VDsWfXClbULKSMEUF8ZkJc44sjOcigA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYBvJi5xfRY9LdS1hXrnsDg596nrqQP/FXDkOIkQEU9d6K9HTw
	Fs3NQfwlPlgEg4ovZT0REnI8omTV+GjVu6wBCqvoF8PRKj0A5OmfuFcl
X-Gm-Gg: Acq92OG+AQYC4GJrlI+nCQSn9DnZcSnKa8NZqIvuFF0ksUuSzm27Cu6dCqwFtpAhTY8
	Icf2JOz2Rkk9FmS4bfTvHH3apI6Gn2FVYiew6TbTwUcFOrKMyQkngfu4rPywyIh/SYiv7Glc9Ua
	iAAYI5L8pEqryOPEDEWu41HAkIcqcOnbahouSFqNAi8+BpbrGBhz+oNIpHOBgkrkjZbZqqdyhBq
	3Qsr+0zFnBeWgVvvvb2Et/q9sbaOR7IlWWlVIbT+XsMEirMjU0su9bYcp4VeKkQ9mFEyttxDv5A
	J7SCRby2yebwp2svlNS5HcsgaPVCaGIU8zof0t/bJqSYqLZGWiE86XdIERWTB2AAiqliO3RiWn0
	wBn1MdM8zi1vVnklfTzdMgISSD46keojSz9sB3wNRpb5NC5mrCItgSnVj+IdtDdWAh78OU2V5GS
	LyaKCkJAe1kJbtEYJMAmh4b3P4pcgohTmSEoS0p6Y/89VNCVusoAlKI4uEgrwrotCy0itcpHhub
	VKn0yZgQKyK/M5wCiSufTAE545OWchfWaguKuZ9wvoloRYYl3k9R2f6wZU0Q4Sx
X-Received: by 2002:a05:6a00:3288:b0:82c:ebae:3cb with SMTP id d2e1a72fcca58-84284f0d090mr7529208b3a.43.1780584071769;
        Thu, 04 Jun 2026 07:41:11 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372868sm7279753b3a.17.2026.06.04.07.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:41:11 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 4/7] dt-bindings: timer: Add RISC-V ACLINT mtimer bindings
Date: Fri,  5 Jun 2026 00:09:50 +0930
Message-ID: <20260604143957.668047-5-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260604143957.668047-1-joel@jms.id.au>
References: <20260604143957.668047-1-joel@jms.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_154114_631434_DAD6CDE5 
X-CRM114-Status: GOOD (  16.37  )
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

The mtimer hardware is described in The RISC-V Instruction Set Manual,
Volume II Privileged Architecture, 3.2.1. Machine Timer (mtime and
mtimecmp) Registers.

The ACLINT was a standalone spec that made it to v1.0-rc4, but was never
ratified. As explained by Anup:

> Only the timer defined by ACLINT specification is relevant but the
> RISC-V privileged specification already provides a high-level
> definition of mtime and mtimecmp MMIO registers (see section "Machine
> Timer (mtime and mtimecmp) Registers").
>
> Due to the above reasons, we dropped our plans to ratify ACLINT
> specification in-favor of AIA IMSIC and RISC-V Privileged
> specification.

Link: https://lists.riscv.org/g/tech-aia/topic/connections_between_aia_and/107177435
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 - Use priv spec as reference
 - Add soc name to tenstorrent compatible
 - Fix reg property description
---
 MAINTAINERS                                   |  1 +
 .../bindings/timer/riscv,aclint-mtimer.yaml   | 56 +++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..43dd9873bbc5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23005,6 +23005,7 @@ M:	Joel Stanley <jms@oss.tenstorrent.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/tenstorrent/linux.git
+F:	Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
 F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
 F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 F:	arch/riscv/boot/dts/tenstorrent/
diff --git a/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
new file mode 100644
index 000000000000..1d645570b191
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/riscv,aclint-mtimer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Advanced Core Local Interruptor (ACLINT) Machine-level Timer
+
+maintainers:
+  - Joel Stanley <jms@oss.tenstorrent.com>
+
+description:
+  The RISC-V machine-level timer exposes the memory-mapped mtime and per-hart
+  mtimecmp registers defined in The RISC-V Instruction Set Manual, Volume II
+  Privileged Architecture, 3.2.1. Machine Timer (mtime and mtimecmp) Registers.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - tenstorrent,atlantis-aclint-mtimer
+          - qemu,aclint-mtimer
+      - const: riscv,aclint-mtimer
+
+  reg:
+    items:
+      - description: MTIMECMP registers, one per hart
+      - description: MTIME register
+
+  reg-names:
+    items:
+      - const: mtimecmp
+      - const: mtime
+
+  interrupts-extended:
+    minItems: 1
+    maxItems: 4095
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    timer@ac000000 {
+      compatible = "tenstorrent,atlantis-aclint-mtimer", "riscv,aclint-mtimer";
+      reg = <0xac000000 0x8000>, <0xac008000 0x8000>;
+      reg-names = "mtimecmp", "mtime";
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
