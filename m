Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6463C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 07:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YWgGWE/mdvxpgjPEx0VfvrMQc9QpT6mNU7WT9tXWuWM=; b=OiGAsKXW2cwEaU
	XsXU3vYOihVuQPaqWn+jum0LS+n3Lhi9CQG3cX8HTvraf0kJPn7BGYQ78sk4JW8mn4ST1fvd4Wzoy
	Fx/f6heEs68GK/akR6aW+1sRjhdOJsygjLU36Or5F2iM36JtiYUoT3VXdhv96p1/IXDel27/AKJi2
	/QQ63q4foRuCEMxz2IlsDmc1zQ645kQ63jlshxDeCc6GpSeDPJ5g7WY7+vxDyYkYOB2fsyMtNQpvq
	a4WhSOrZmIaeCV4sJlu7nG2N7VT+KNq008fTUTe7zwpyvBjBAptj3UL1/YSvPbHo6D2nbF3HBEUf1
	ODIy3X3bkFlfio5pZXeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3kx-000000007t6-0N6A;
	Wed, 31 Jul 2024 07:28:19 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3kt-000000007q2-3R0F
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 07:28:17 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-530ad969360so1330502e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 00:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722410893; x=1723015693; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttjywx6Mo1/3X2D9jge6HvTlgUDsJ3yzsugn6JInGgA=;
        b=MI7+URP4Mm46KBbDdyazDorMMY3XLKQ3jeQHYorJApwDfcRUcygY5q6UiCevpPNtiS
         DQmFb0CcFMJl6ZcYbabbpcWI+462heWUeybxLMKeWrNft4aYnCUalNXCSZYKtXuxQqFq
         xt1Ep/Z0EwEg0qTHkzZxloDbEjy7gadAjB7Ty+KFxAj+Xyh90f2eHzQuCuqufN/eeuB+
         qV0JvsQ35j/mZne23XDfoBi0s/n9auTwIk6ypThmMA4tcdahVOhXgq9InYCPXDfOlF67
         OoFg+WGkEG2IBcBQQYABBtXh3GciQ/bQMO0M3PdM2rFcQNjO91h8js6yMdYziCH4AiUT
         iVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722410893; x=1723015693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ttjywx6Mo1/3X2D9jge6HvTlgUDsJ3yzsugn6JInGgA=;
        b=atDXQKQyNjvAkNFwR/tANqk3E8Lw5gW47S5fQfYjM/8J9qtRF6xnSFECa6m5ZtxLAO
         tnEAbME8PhzKuAGh3raNQwTvz5nltifDbxbq2ORKBthDLzwHSqM6Pm5Iml8uwI4PegYa
         OYlYayO3KfXolJXrPBb3jGqxkB9gwpjYIlpKMErhUUn+rOXD7fDzM5W6f73V/Q060Bu1
         VoNzKVZ4Jza6Xpne+0hToVOckNY82tD7G8ntCLbTNFNLAWEKwt3aLbNSaKksoWX794vF
         RiVILvJmg4YR/J4RtmNklFKA30kjZgAXMf6SWGFILLXQW33OtUHYnLjIvAEe4M4LCASu
         ueiA==
X-Forwarded-Encrypted: i=1; AJvYcCXTEt2kd1Bg+vvOUawQ7UViYiZi4BXh9RsgrnsxKL9qLUjb2Bp0G2S9+d9qNSUPWkWRKr6vgmRIbacNoP5VRYyYSMOyMpi1xaZSbiPxYSx3
X-Gm-Message-State: AOJu0YyFa1IQQ3OGZ5RTygyWb+w4rGQog0d1ZEVjkDjZ72zQZhU07IxV
	leRJOOrwLT7WNpCSt8Qv6t2we7ZJGS5yMRQyVyqlat/hwUMbIoJg750rsm2+DghYGGdQ/qTzGfc
	y
X-Google-Smtp-Source: AGHT+IGwuD5WOsjtT2bfQ2zXne4CrgHWP6AcnVi1hE62VKVHJr7T6wk/7agmQ1tHhyxNcI20/8ivqg==
X-Received: by 2002:ac2:5690:0:b0:52c:ebd0:609 with SMTP id 2adb3069b0e04-5309b259bb9mr12112105e87.7.1722410892990;
        Wed, 31 Jul 2024 00:28:12 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282babaab3sm10562035e9.28.2024.07.31.00.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:28:12 -0700 (PDT)
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 04/13] dt-bindings: riscv: Add Zabha ISA extension description
Date: Wed, 31 Jul 2024 09:23:56 +0200
Message-Id: <20240731072405.197046-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731072405.197046-1-alexghiti@rivosinc.com>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_002815_869271_8AE27ADB 
X-CRM114-Status: UNSURE (   9.56  )
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
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a06dbc6b4928..a63578b95c4a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -171,6 +171,12 @@ properties:
             memory types as ratified in the 20191213 version of the privileged
             ISA specification.
 
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
