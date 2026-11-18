Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA904606A33F
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 08:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PHVF6OJY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=igxdQLaO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eCBXtSM3LAEZDM5lBh5UB5lAlM1Rv0mW4lJfDm7K2yQ=; b=PHVF6OJY3Bn4bl+2VXIVj9zbWC
	biuOGQdvUeIneiDVbkRN5amIOSNFBAgzHZgsP9WghQqm1WUYfivZfHLZeUXxIcbGfd8JD2KHtVC4I
	dZSH5osyJCNLnk7NF0ZCkV7weNpzkjv53MVRxsIxvptSHV5GrrV4zOI1WCWaF6eoDc7tAx4E3Wp1b
	E6EFGsJuFaY4pT6705vkGgzdMHOSNrx12g6kyii3cgzpN8tKnczKQ82ukgPQEk0y4pjotX3GfJ+Pi
	gqxJXZH33zsbTc209mJXBvMb87hbCUh3y0J9JSrOJfwHEOt5PJLbm4Kq6MrF+qz4kvaycEke8fVjj
	mN6bA4vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTani-000000086yr-1aUT;
	Wed, 18 Nov 2026 08:13:54 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTane-000000086yG-09B6
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 08:13:53 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso481767a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 00:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794989629; x=1795594429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrvbirXIkv4em6QifUd4OnpixRUwowvXHi+8bl2oRk4=;
        b=igxdQLaOkm1TEg58fsE9gL2nnZPeouUHPexEgjL6VWFKcPMaA3JIuJFDE0/XsU3Mpm
         8UDxa94Fdrc1Vz2GXXKYxxH2nuVgmOrM07J+Ac812LNOIsDtYrpLcn7Sv2lr8ndsceoc
         RUfUODlEHy0EP+yu3zx2j5X3aToIGUb2TBjPl6Rp4NOFs4Vt2o/p7M09hPq1Z9v+4adR
         /OpOCOUhJmjRiA3ueTcj7uxknqid9s1k6FyCIWApOnrP/QSmNnTD/5r4KdfeU+qCpGMJ
         S0WmbUhQeWDuBvJyosWabciFgUS06dERMTk52gXILJfNJmdfCgXBY1O+ySKjnIsVXT8A
         jLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989629; x=1795594429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LrvbirXIkv4em6QifUd4OnpixRUwowvXHi+8bl2oRk4=;
        b=Rctor3LjZnqX5CcUnHTZQaKjMLFM3bH/3ZQ4ZCrhoCPsSGhSuM0TMuI815G0d9TXjy
         d3bSEQXaFajYLGFg/ODJZ5oC5LrphTlOTSM3KHFoppXsYwWKaUSyvycUTSa11OFt3fgt
         J58MZtVepFtYlKdTkmW9R0pTca+NvjpPcH/xQZqXSQoh+SkYoQnjuSiDBb1II1Evwg+s
         wV4WlvtAEWM95cMVpZHhNyOqQWE03mhYoZGzmjE+NhwZtbLJhrbodM8reRSCUNhkjuuY
         gykM2MpAqJPq2PymauD88rzSWowO6ATK41lB+UuWWrdr2y2TQvyCEzlsXlofGBOuFqVG
         BQlA==
X-Gm-Message-State: APuU4Z/Oz3pbb9VsORvmEZN05HRdUlh2MLk85XhRSbX3mFlJXoOhXgtW
	M49eEwoMa7eyHwOthjjj4uEMStjQpuKfLGaT42fJ3qHpw9HEczAhcfONurz42D4lUKQk8g9PzBq
	wrCA1
X-Gm-Gg: AZFdTZe0o2mlXdQLw9xHqYfQg0Ne7HBbZr3SX04lRkw58gb1EGJPhcfUh2W7/q1zfoo
	L9KJTV+0y2ur82Gf1LfdXtgvZzid879UHg2B4YRDx8Fy3R46FEn3xxknB8Q3dIyKlVzwa0YTNSo
	WjyCkGj/u1mOnii5Kp59DmxsUQdTBxvbhbnEV0BPI26vDPu1+3yqPgtmboNOOupPKWAGZwBFM1k
	9Qf3m05Cfw4Ib/RhhLCkIAAInPnYQ7cT5YhoVG+CWe/cnInobRzWW8UiX3+yNS9C+ltMAwk4pjT
	oomaRnm4aZHf71ZY1wzghMA+h4lvpAl5JmyHlp5dmyem6G+1Q5aEXPZNBPAKGbeiSqZnIu1ZevU
	8GNfs/UaxaSZ2h8n2ANyzxbefGqYqWiIcRJJ+ZN3G/05Re/5srcN4HBuheDM4IAMSZ25wvNNA67
	GEBBdegD9uZhmQJFCFkkJprFVN3zHFBwe18mKv/ekiHo58xOcVkTOiWzCel/8RpXvZqOMT3CBYp
	fel5N2AN66JJFprX254v8V0FW2muFDLssm17xXoY210y+6K2TTY7Z11oetSLKrKI1j3LCqrUwwG
	tQnxqY+LtPsLCuq8lvzGmgksHINjSdNswe9y9qIyYkgBk+PnLKXRfGBxKb6in4YijIn6PkVgpDX
	JluOEPCA=
X-Received: by 2002:a17:90b:3943:b0:3b0:a7b5:c046 with SMTP id 98e67ed59e1d1-3b3d07e09f4mr2098689a91.54.1794989628976;
        Wed, 18 Nov 2026 00:13:48 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acde50sm3254680a91.14.2026.11.18.00.13.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 00:13:48 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	andrew.jones@linux.dev,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	atish.patra@linux.dev,
	anup@brainfault.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	yuanzhu@bytedance.com,
	cuiyunhui@bytedance.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	will@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: [RFC PATCH v1 1/5] dt-bindings: riscv: Add Smpdis and Sspdis ISA extensions
Date: Wed, 18 Nov 2026 16:13:29 +0800
Message-ID: <20261118081327.10684-8-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261118081327.10684-7-zhangzhanpeng.jasper@bytedance.com>
References: <20261118081327.10684-7-zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_001350_107221_E8132129 
X-CRM114-Status: UNSURE (   7.61  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the machine and supervisor PDIS extensions using the pinned
sampling draft. Machine support alone does not grant supervisor access.
These are draft bindings, not ratified extension or CSR allocations.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 79491ef8f86a..afda76b9c7c4 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -214,6 +214,15 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: smpdis
+          description: |
+            The draft Smpdis machine-level extension for Precise Decoded
+            Instruction Sampling, as described at commit
+            2de60e18118ce78e2da82ec33296345c94d8560c of the
+            riscv-performance-event-sampling specification. It defines
+            instruction selection, filtering and sample collection across
+            privilege levels. This does not imply supervisor access to PDIS.
+
         - const: smstateen
           description: |
             The standard Smstateen extension for controlling access to CSRs
@@ -269,6 +278,16 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: sspdis
+          description: |
+            The draft Sspdis supervisor-level extension for Precise Decoded
+            Instruction Sampling, as described at commit
+            2de60e18118ce78e2da82ec33296345c94d8560c of the
+            riscv-performance-event-sampling specification. It provides the
+            supervisor-visible PDIS registers and behavior, excluding the
+            machine-only state. Firmware must make this state accessible to
+            supervisor software before reporting this extension.
+
         - const: ssqosid
           description: |
             The standard Ssqosid extension for Quality of Service ID is
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
