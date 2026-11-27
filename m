Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C7A606A31E
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 06:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oE8s8/mv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x3hNSCbn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TKUctkqzI/hSY7lAXBWBLXc5TEXgGUkcwPry1+FSQPg=; b=oE8s8/mvFNHeGQMnhkCUlQ2z7L
	ZkwlLwtvrNxcBEGYaC5eN68QhZUs9ntHMu1PIMju0LrSehDkjRly97kGe1Y1Or3fm0D212VWc1J3D
	p6l7pLU89HxF5wiO+vQ2A+WC2BvG6bqKUQeI4MDea4NLtn/XXVKkMjeA54E05hyGVHwVO7hXlm5DZ
	CSdzqijKin4na6BjRnTuT+e5RN/EBFXUekCWsKchPWZWBDQjVWd5rL/Ovk+gbedyB9wG8aLpsjBI8
	gUb+JjE/KkKA8y7TpqP/0w3bFX3aRe/0SufUEiedqpnlnFx/RrJi6bAQ+9Os917h77z4hStUaHjgS
	Dp7jy2BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpG6-0000000F0w8-2rpM;
	Fri, 27 Nov 2026 06:16:34 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpG4-0000000F0ux-1lSr
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 06:16:33 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2f02b9c1f6fso52133635ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 22:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795760192; x=1796364992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JeIuJYZrmd+Vl74IJcsqnRgjjahxnjf4N+emXH7zUV0=;
        b=x3hNSCbn3C5KvPoZFlVO39liH1wlWCTIH5Rv1Ltq5oFsk3yAFhjJlwlIp/oFh97hGF
         liMOftDhRVA8k6t+IPuJbjlGDFrwbEHU/t/RfEXsrLSx8X6nU+3/0Xo/rvcOUzxwFYpM
         vYmyAKoFPojlwh8H7g7jh4jijGjSGt1ZW+l1283LEq2SMaRvCr4zlQihx5Xt1oIiazKy
         Qy1MsyQLFq/ISCgmDYOw5QZTztcqMcGrUe9OD22oixiyTRbYzzRlp+q1xDXfffX/EuHR
         YH5OSZ04hyNxdQER7EAg62/6s9019lEQXPJmxtzWRjotGOpIIqjTKRviT+M9GG5MRSbC
         TuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760192; x=1796364992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JeIuJYZrmd+Vl74IJcsqnRgjjahxnjf4N+emXH7zUV0=;
        b=buA7quhfNNAtBevMbsma/wwkZzQ3XTpd66D9SPwKeKZ/Bx4iStK9WHoGGB0yDGRWkl
         dEtfQINNd6u3TcgvspsVqUhY42+tsSYyr+YBLH2T2JSTnx/s48PCe2cakxZvTzQpDhbm
         PTkRVYwIeBsz6HQQNQ9wfC7h7P6AKty7Dv7pYKB8oLMB+ZZ2zwy4UXzuhG9CmzCL231j
         6YvXusJ/3SMEgnTgn9wlPiJtSYkCu270LgrPrwJdB/oecZW7DmpcPy8WZmqN0MijWFVI
         6Z2E2tLBn5tLsWeXZbfa+/sicK9oDA6BX2Bx2hbrLlVl2Tr2nflumQrZYDZDjlmx6ahF
         ycEA==
X-Forwarded-Encrypted: i=1; AL+hErED889bbQzx2xcnqYoIfDMPIi78/m3JRxqp2zkK6c1bwihuf6YGBfR4mD/o/efHQ1r/qHy85u259P17jA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9N8IFNut60g+V0+Q6inkHX2KrolHML+FQ6i6FEsm6SglzJC0LS
	oq8AwYJSl/IoaBogk4ScRjWrzpYnln9XBh3+4IF2PeEmQ9pNP5UjPYEu
X-Gm-Gg: AZFdTZc1rgyc1HB560zUIAkqsagKp90utfEKSv6ywhRWUdW44rZukXJZdGda7DzM1Vi
	nFNDola25TtYIbGjL7iClQuGZFpc5KpeNsOzvoMpsyxOxoUlRI+y4DpnTJ+enwr2mfyReiwAddJ
	UArxKDxo1JO6p+lg2faz1JXePyeeIRMSmmi8pWi5b1i4ihDcyMVQK/JnnXBh7Yi2Jt5/fXZrRaq
	5dqcXC6U2JwkgbCNrgw886O5gPi5jOZeqzfXz2b0G0kAi2zds1+hXbuEBH+RsxAeieB/5h/aiM7
	gwEAZYJFz25P9B9f2qUdPpiOXv1SIiaZgO0NgqaN50NOtCIAiMBmvP3Xyzqe3thUCdfTcunoGao
	FHUsM0FnmqDy/fCOOaRaIJx0BRNvuwRZ9EJGI48xaY+DGIYvHEacEdJPw9coiMD/vIdz72KAbUe
	z9sQwrrYstK2SjGv4vwlth1hlZt5wcVx307gxa2wmCrL/3Vk3FYHJF9CMayeS+y+1T/O92CEAeF
	rX04ENEZcSff9IpzsXlIdZSGImyAevKWb5hX5a0v98/Mi3AnXfH0lyWegRZ2kNPC3GXyo8nT/1r
	jd23MVEFvZDgv1FdZ/gpuVLk6aUjdiuyU6WkdlK6n4UZH3F3qTOmoo7B7S17gjRl8d1nZIE0Ezj
	R4vXD8qYKlrifuSxg1XJMVJi5OzLyPASetanUSxNXJL4qCWZvwtH0iyMYAKxykjk=
X-Received: by 2002:a17:903:2f06:b0:2f0:a36e:6e08 with SMTP id d9443c01a7336-2f0a36e746cmr110652605ad.30.1795760191815;
        Thu, 26 Nov 2026 22:16:31 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dcbe3sm114829495ad.28.2026.11.26.22.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:16:31 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 3/6] dt-bindings: riscv: cpus: Add Tenstorrent Ascalon
Date: Fri, 27 Nov 2026 16:44:23 +1030
Message-ID: <20261127061432.17306-4-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127061432.17306-1-joel@jms.id.au>
References: <20261127061432.17306-1-joel@jms.id.au>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_221632_459712_FD4CB649 
X-CRM114-Status: UNSURE (   7.34  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add Tenstorrent Ascalon microarchitecture and the Tenstorrent Ascalon-XG
core.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v4: No changes
v3: No changes, pick up review tags
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae6769..2d2e4606a53e 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -75,6 +75,11 @@ properties:
               - sifive,x280
           - const: sifive,rocket0
           - const: riscv
+      - items:
+          - enum:
+              - tenstorrent,ascalon-xg
+          - const: tenstorrent,ascalon
+          - const: riscv
       - const: riscv    # Simulator only
     description:
       Identifies that the hart uses the RISC-V instruction set
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
