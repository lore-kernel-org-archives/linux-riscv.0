Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6527AC2D0CD
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 03:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IFgIOjaywQBHNmY4idxL9VijRxbV7JSCba4SmmDaqRs=; b=jnmWr0xvEwubkg
	2oT0jBGcf3KtBC8PD/g60FX8nqz2nTwHepWT5zzqu/Cxz9g9pDnXfgzxwFbByyKHehv1C8wbQlES/
	OnYrQKOcs4E4pXeTm3yWnEV168E+ofol8PW74BJ+inEu4q6cR719C7LwztPAlzDXh72qNAp5hvHvE
	9bMXt8kYCF1+gzW4McuAFSZy5G5p+wb3AIRXzrC1T1uMDAVutthKi+wR3W9qHPIHtQ5dG3t50GE49
	W65ez5hoWoSpwu/MjTTev7d+5xxUwsOMiUWmB/x/Kt6EOiIPxytwp6XzlyDTJ+BAzjCZKYKjKXKa1
	Gi00FhhtVbAGsxU60xwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOh-00000002KBM-1KdJ;
	Fri, 16 May 2025 03:06:09 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOe-00000002K87-1qNp
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 03:06:05 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b2093aef78dso1671243a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 20:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364763; x=1747969563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weomedr6rI+xMErQTjwbgFjghxDoWxu8k2ihmuNB5oM=;
        b=eeqrfk/4bFw9J9YQN+ryovbkAqELwAR3hGgDMGgCCfU+3EVQBMk5KYjIAbO+4bUDQq
         Oo7krVwpsDV/wdOrxUOadOfinOepOeRFuhRQ5FFmr4UKIAaDkLohG+QwZJDVqrqchjko
         qG3F1ZE5HJhiifHutOd+NMMTYKbsLk2dyD4RjdGnkvRF7YRkHW56besRY0eO9HEFcDZU
         1X2W/55X+k1zexSmovild7RBmvWDGaW7DUw58Cr2jV3Hsw7ibSimTT8Q+JzCYQ5H8A2f
         KmnLwmv9dt8BgW+NuRo4xjF/btQw24+BX/julxAaVVzzOkp2ldu6SjWAq8eJH7EQhl8C
         136Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364763; x=1747969563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weomedr6rI+xMErQTjwbgFjghxDoWxu8k2ihmuNB5oM=;
        b=ZbecD34XKQI0IbBSJGsuFjeaMf3zH9DaIOwmaqK2XX6hLZBxj+XYsPhJcF7xdFPajM
         d+mKoMGmcB1SSueZ6tceXCvP89qZ0LQp+QFLmV3ZcGH6HmnDTWjm3rFLQBAKngOd9Wt5
         Ztw9GZ354pU9NcLU/trd/DxmFUO1mgSeBzO84UUlBLMeIPdPGHwQhuF1Bs/HY40fl4oZ
         pCTCGGVPZe8xu6cFUmrUe0SLczpIGtWtbA+tXJkLOEuBxhkRAU1ofmFKG5S/hn1MHmjN
         EUaZV0sA6jP14bX2HGYIwO1C3uhfWDrRoxMu4Iyd47e6dWDX6HyhubNeRga4Oxj23y4A
         tMvw==
X-Forwarded-Encrypted: i=1; AJvYcCW9pXJqYsGwgDddWy6vnmbSKJpkw5HGCXvd5n0kHvP1840vNyzgS8BHqg4A+5X/07Qo++se0gJnWkmTHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDD01GoatkdQasxDZ/BBpaINc9xRg6WQwjwnN8psBiGo7mgMd2
	xLyRzYqVTfRva8AxjarsvdgZTGLtlLskX8+99NRjowNg7bWOXR5HxCM6Mjv3L0JuJZQ=
X-Gm-Gg: ASbGncvjMKIdrzoGAnID2jhhSg6DvphKyDoP/2sVYoHx5j3ttOdeIHTa3LobMxfEhSk
	GfDIAJPO+vjuParvOYqj8UKVRBB/goGfoaQOEH5frFUhjc/AsQySFO6HRdZY2nXtFbenLkba6Dv
	Edppl3gBtC+BtrAFb4nRBWno37YLUp1CejaRrp281PNZK7bF9YSrPlsAJIy8eXe4Sprv0vk7e/X
	JQqaD/i5Kmn5wRwz3DmI4C9xH+LDxeFJDu6TX5obynZgG58dQ78QzE81tSnvi9XxKCi5aH317BT
	O9+MO+gi92op/KRQf0RH/J6BEomVgYBrKBmYVBbXRhmyiZA7tiFKnfkwWDUWwRfaePdXkzZ8brC
	R7Cqu3ZLGIG8=
X-Google-Smtp-Source: AGHT+IFhBAB1eXwbz44Tr8KVKAa/EYR58v7s/kJ7HdKTeaGSBrcNqWOoBWoIKH0YeOJevu/4lqzf3A==
X-Received: by 2002:a17:903:46d0:b0:21f:f3d:d533 with SMTP id d9443c01a7336-231de351537mr10196975ad.2.1747364763529;
        Thu, 15 May 2025 20:06:03 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.06.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:06:03 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 09/12] dt-bindings: riscv: Add xsfvfwmaccqqq ISA extension description
Date: Fri, 16 May 2025 11:03:07 +0800
Message-Id: <20250516030310.16950-10-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_200604_486461_6AB61DD6 
X-CRM114-Status: UNSURE (   6.65  )
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

Add "xsfvfwmaccqqq" ISA extension which is provided by SiFive for
matrix multiply accumulate instructions support.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index be203df29eb8..ede6a58ccf53 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -681,6 +681,12 @@ properties:
             See more details in
             https://www.sifive.com/document-file/fp32-to-int8-ranged-clip-instructions
 
+        - const: xsfvfwmaccqqq
+          description:
+            SiFive Matrix Multiply Accumulate Instruction Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/matrix-multiply-accumulate-instruction
+
         # T-HEAD
         - const: xtheadvector
           description:
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
