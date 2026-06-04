Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD3BCD6E77
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 14:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7VqS82QaTR/jkQO/W2a+XeV6sEuQ04RGqo0vw/1Qbnk=; b=ZRIAz1HiDVBRMu
	ObmibpgabP8mjW3lv88ZoeTC7G0Qr72n9VBpyVhZm9osbP0FA3YWRaqh5xu/u1sp1j33ypdx2OJrN
	v3QfOnC/rX3sdQbsiCwdUFXP8ST9nvGMt8rfPKZK06E+ft7I5KcD2wy3I0oro3st+zZQEfBsZUWek
	WiY8rwPQTW5uRsLM2kVOIMWsM87huQ1u8Wx7vwryRDC+3MbvPNR2I1VEWj6bmZ2wH8WLCuZnnb8df
	xSrR210sxmenuYFNmdTVAVu1M1pTaWPo4FaIlbsEfF3RWzpi4PLe9O4sGmuLWRya5n+wYo062dhn6
	QVUJh+0Vz9BzLF4Z2xyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9G8-0000000GvEk-0qEk;
	Thu, 04 Jun 2026 14:41:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9G6-0000000GvDZ-399b
	for linux-riscv@bombadil.infradead.org;
	Thu, 04 Jun 2026 14:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LY+FwvOmIKq0AqGLFd+uu0Ju7LhFArzDov2I7oKwjys=; b=G0PZX1Q3t9EHBgw5eEtAVY4Z2c
	cW5pc0TZ6VVJHFVbqmf3BN9hP/8MuL+aHH5WHW4GJlD3EMtPYKaKO1pvQjFASbeI9ch9R7qZTuqcY
	O/zeMNaxBWwiWR9nJdbgZZKGWONVUsVwSrLVvotuTLDIY9xCKa0bmyLbxynjM5HK3hKKknz8zPT0a
	rvBpRfzp6o9ErXXOmOz7yYYQ8n9b1AbZPWM3kVh35gjp0ODa0Bw3F4kuRcj7ztjT68/EC8bY5lJtU
	VPORbYL4AsMde501+HBjYbKcqrIo5HHErey/0HNO1B2t+3xRQJm2fejHm/8onoTwM83alueudDtVA
	Dso9QpZw==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV9G3-0000000ES8c-1ckz
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 14:41:21 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-842338c18e0so585492b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jun 2026 07:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780584077; x=1781188877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LY+FwvOmIKq0AqGLFd+uu0Ju7LhFArzDov2I7oKwjys=;
        b=CuC8xZFhLA0yYvPcoozeebRxi7AAy7r46ylLqIlPHgSTJGI5ZZvrihROCrQ4359IE4
         72FsfFgU0p0ZqmJ8DhOHM18wYtSDDQb2z/H1VPaGSmeU2KRAevRY72SJhe7G+l3vhf24
         1itmGFujhnsxhQJulheGPdz+O3qLRNSdh6NNH2kGuwWNDbAiZgNnNcVM/VggJZcfZu+h
         j81mRPKrUZkFV3XaLYypaeK+WGmj04ulZqhwpIbiC0gp5dn7TGyPdrIxKcYQOFPmyi7X
         E7wdwi4y8kphrZjmTmHrwK7MKqKWy1cuFARf4KmklzRkUx4riXN2bpsUwPADzOzp0HnW
         5Ysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780584077; x=1781188877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LY+FwvOmIKq0AqGLFd+uu0Ju7LhFArzDov2I7oKwjys=;
        b=ebeKlHI/6gq5z1jORmr+ba+BCbDheLnKs8w/gJaAS9y5vw5D7W8V0y9e5pMzPIziDk
         5g1Ssc0NFrzPvTrz/N39ul/606ar93PWb3SjB7GmaK0LYvqBQKFxnOajl01ITEVr3Rk/
         ZlgCu1ZGTHFvGTGtaomP7ppAkLZKFOmEoZfWIgU9iWLwzr3MS5t9DYSQC4S+Pnae0DtV
         luo4PyVDHc7Fi8ZtApWN5ju7owT2VOkN104XY6nH8PV0Ay7bA9OdlDJxRlGpYYv3j8hY
         CrvUum9/QMqP32caF5b4y27V+RELSpPp2B8rPtDvt+QGY0kKtfodgYdo2iDR5vkXpHvM
         tCzw==
X-Forwarded-Encrypted: i=1; AFNElJ8i48jXto65MLDpxoB0YYCONZWJSnLeD63Gg/TF4n97cshvkiggJAG/QkpQxqYkxZ9Z6974Y3L4JmOwiA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3DeqtYl6DU0cv9x6Hlqets8PVboqGwO9dW7masK64jIqWUAm+
	cxBEVEWmGCNbucJjxgXuOKcaRPI/HUBK+FDfg3vZ4/gg+F9qaU8eushC
X-Gm-Gg: Acq92OGAloolncQER1KnUOV13tMluDrOQNEnHlmv8747xuc9zRhox2XkFLmA4gz+It/
	r/KmtjX7GMwYwD/JKITpr4Kd6DQ2573ZqfOJPLM1AbmJcP3DEfkyglr1zfM4ebJXXCSsgLC/bzG
	Mosx/qMBMSpzG2bSiSPXsGc3Gyj2PUKnHGC1eRn7QYG8iZ/aDClIZJo4KSRrYcU+9pK8rimHz5f
	bzrNBfkedohE0yVDG4ecFPUCGw43QQf+MyVm8O/4Hl6bnGIjtWbos1U7nLW+8Mf6fofGv3IfOaE
	paHIQumE5LW1C8Ln3LwfOOLh9o7gtsvQ6qtifjnZUSh0v+BgosdoQuGGjgBRxOXBoXBLo4oiwB6
	DknLdNAucekp7dfNyJoj1qd3x4zacBQvYzY6cSYpKol0Y9TNhG893Io9ZsmmTVXF3K8xwW9R5k6
	TNopEm3t9NpASMsdpxt0YJsTqiYyo/qO4dRlnC4LLBkiIRIzMEr5V6hN3FJuEugbKnHyk+fiR2c
	4j7M1uwI6XeWMIY57Lu6YMy314f2dmrXCJ5RlDi1fU6MDYl+6sYVcfzM0C0hORD
X-Received: by 2002:a05:6a00:439b:b0:835:cc47:6ff7 with SMTP id d2e1a72fcca58-84284f34484mr8149841b3a.50.1780584077224;
        Thu, 04 Jun 2026 07:41:17 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372868sm7279753b3a.17.2026.06.04.07.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:41:16 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Drew Fustini <fustini@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 5/7] dt-bindings: riscv: add Smrnmi extension description
Date: Fri,  5 Jun 2026 00:09:51 +0930
Message-ID: <20260604143957.668047-6-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260604143957.668047-1-joel@jms.id.au>
References: <20260604143957.668047-1-joel@jms.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_154119_628721_531C6552 
X-CRM114-Status: UNSURE (   8.50  )
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

From: Drew Fustini <fustini@kernel.org>

Add description for the Smrnmi extension (Resumable Non-Maskable
Interrupts) as ratified in 35eb3948bf0b ("Merge pull request #1492 from
riscv/smrnmi-ratified") of the riscv-isa-manual.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2b0a8a93bb21..3e3b4481724f 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -193,6 +193,12 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: smrnmi
+          description: |
+            The standard Smrnmi extension for Resumable Non-Maskable Interrupts
+            as ratified in commit 35eb3948bf0b ("Merge pull request #1492 from
+            riscv/smrnmi-ratified") of the riscv-isa-manual.
+
         - const: smstateen
           description: |
             The standard Smstateen extension for controlling access to CSRs
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
