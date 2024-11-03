Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A30CD11101
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Nov 2024 14:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WfX/Ah556/Ah8ZMdrByD2befs0yjr1KQCmAUhoZYtrI=; b=K7tr3w3RuggZ5H
	LNkcncJX18L1YNtyVADMSsv8jcySrZmMFpa9/TvkKAcUfVOwjJRaMLb53xNPs02rI+M2oQF0kb3xQ
	TIl0ekOFW169gBqm9ftW/TB9Jg1c82wQwVi7fEuNnELkviNqglg7nECSsGUFGNpO56JhSd0+BKyu5
	AxYGPsdWpdpRbYCeQ6TwjQNgmH1lVuG+FiwgQ+52ku0X5mUH0IpAeIm348RseZGDihzmTmq9fr0Nk
	te//dHf0Ze3sls4vJcnZBPT5uT4NxZmij1Yp6vQmURgsVCrffdt9ROrInOfjKetHQFP6bTcxbU0sS
	N4bpFhp5CLiWWDkW5/AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7c1M-0000000BZhb-33Jy;
	Sun, 03 Nov 2024 14:56:04 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7c1K-0000000BZgu-34C5
	for linux-riscv@lists.infradead.org;
	Sun, 03 Nov 2024 14:56:03 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43158625112so29019475e9.3
        for <linux-riscv@lists.infradead.org>; Sun, 03 Nov 2024 06:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730645761; x=1731250561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lAswjGp3xf0DHvJRryPePimKYUd7lF/oN62wU2lB88=;
        b=U5G84sT4SDp9kDNGuySDO8rvdx6vQPdMvfROnJZ2aYAhE2AwFTIfJeJ1f+9UeN7tOP
         5YJEDZ7C15c4+DW/0TRAIXPLqYFJXY4L5BjahSPtX7BYlsUTHugg+uG1l4q61GSLmqhB
         q3ni/752FDVziAUGsDYY83AuRk3cjZzFyaUXI03f4KmkQOFLYtNSl1W5O6WB8+UzVaWE
         kf7lIhYpEJJOhfkZUDO8u1vQyiXnaCr5vxLyRp38ZdD46XQhDHPJmlcvxfddvvTq3fWN
         FgrewTcJeIHEzeV8XjJqTMcIW5Z4VclsUd9A9RbCfMR8rejcOd5BenvIX580w7S+UMU6
         xFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730645761; x=1731250561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lAswjGp3xf0DHvJRryPePimKYUd7lF/oN62wU2lB88=;
        b=nPiMi17BVLzu4OFFhgzTQmsVSvz1ZZVNUgEajQPn6SIWDzYE4ZJuAHkgk/J5d6i8nx
         Nhc4Dsu8gZUqv3eMA9lT1t0wK1C/3EgI2WDSEg6jq2MtLcmphRBTESCJldiESo09hcUR
         eDSgfa7t+Go5lMKbyCZQ9rL1SIsvXv69VY9JCexb9ILbYe+X9vC8+RoA89VBDi2KQCQO
         T/gBbU2tydlbLWWVp1rjHsEysEOtMm6axdNAXkaIRUwHSpkoMIdbvZ82cHaKEX3rY6OE
         nSyY7eTa9xYUCxtzukKyOY3nauWjY/G4wlH1KKkt8J7cYdRussuTph8MVF8MJO9qR+Ps
         hPxg==
X-Forwarded-Encrypted: i=1; AJvYcCX0YXrAZwVUEjHKnZ8vu1sLLKrkPjlMd6nXOAUEij3mkrCoiN/+TJEq2AVL0KbYXWqp30ZJ39nZeksoNw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc38keva79HKWaZRBj0Xvp4NRJEl071JozQamIV0bq0naolWPG
	scEIFQMYiFL2lgTuJbBV0qj7vR8ha4Iqeu7aoBmEep1STlMsM8PdxW0vfQU27C8=
X-Google-Smtp-Source: AGHT+IFXcE4yQOkwclhHZgMus+XU93hkWLBdlkgkjwLbfRe2UgNWPomwyzpyojRGnPIQGSxet5Zozw==
X-Received: by 2002:a05:600c:3b04:b0:431:6083:cd38 with SMTP id 5b1f17b1804b1-43283242a52mr72748635e9.6.1730645760870;
        Sun, 03 Nov 2024 06:56:00 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116ad6fsm10730912f8f.98.2024.11.03.06.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 06:56:00 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v6 04/13] dt-bindings: riscv: Add Zabha ISA extension description
Date: Sun,  3 Nov 2024 15:51:44 +0100
Message-Id: <20241103145153.105097-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241103145153.105097-1-alexghiti@rivosinc.com>
References: <20241103145153.105097-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_065602_795704_3AEA30B2 
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

Add description for the Zabha ISA extension which was ratified in April
2024.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2cf2026cff57..db062107823b 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -178,6 +178,12 @@ properties:
             as ratified at commit 4a69197e5617 ("Update to ratified state") of
             riscv-svvptc.
 
+        - const: zabha
+          description: |
+            The Zabha extension for Byte and Halfword Atomic Memory Operations
+            as ratified at commit 49f49c842ff9 ("Update to Rafified state") of
+            riscv-zabha.
+
         - const: zacas
           description: |
             The Zacas extension for Atomic Compare-and-Swap (CAS) instructions
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
