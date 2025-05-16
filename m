Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86699C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 03:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eW49hKHvItFMuNvdqy3cGQM1zfiugNu5cyVeHguXAyI=; b=y0k9wjf7mqV0ot
	cgtr+a/rlj4gcnz3GFYv/BHN+v43Hr0zgv20Aw9Dl/WqZJ+2hj6fDYG3LzGTrYC9LInA9r2VICL0i
	TtE81wDwm57fzVgN5dwy/wHOZlCLB/+Fw1cXGQrkfN5Tmmq8xfabkZotmqKj8/rOBwW/TG2UPcjPf
	QdB4dobgC9pP6CcGmcsfKdaiEqwk2vtM89Y3hyO+UQir1eqUteqbmbmjvzov8AoLpN+Mfs7Ivp+lv
	pmOfYprqgE8Iwv/Vw5F/MempMPsMu5XhxNpnZFp8LGLPvJgt5ToOyQ3HRW+oyZswq5D478vycwfqi
	xChSpMHRLZsz/Q6d6j/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOV-00000002K0Z-0nnY;
	Fri, 16 May 2025 03:05:55 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOS-00000002JzO-1lOy
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 03:05:53 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22e6a088e16so12864515ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 20:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364751; x=1747969551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7pOHXSYxsUxaKbFAq5uwqDuSfbReGsHyjruZTLt0/4=;
        b=F6Jcn9Tc1rnkSENisn4gIoeqYbGkwHdyWJkF+1RSpgwv+d4HaD2Zik+dZXFX56s62W
         y9gw7tvSWXFKl7WC4EHpmIS2WB5xeLbFctTQmTIsyqb93eUoTZpbSJC4H04oB1Xa57MK
         GaR8k/865G32UVeodTxBeMLHSwvxuNNgYu0EmPjiNpUJs5Ue48+yujgbToZdhxlJi1Lu
         SX825BGZTjT9XVMAJH+CG45chCG4RAdbVxtXwPfWG/aw0yb8Zvhim+rZkaZxzm93ZpMI
         EEImFbxI0GOB2NCE/sLZDxSgVrI7bW1Xc/OBB8kgrZhfdJP94BJ49oQglPjvOEMou0h7
         /23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364751; x=1747969551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z7pOHXSYxsUxaKbFAq5uwqDuSfbReGsHyjruZTLt0/4=;
        b=TzzsKZo8eC3U1b/BAVOUPnelD+nJ0ukgx9uovqS3p+FiwGUrtdlhdC5EFveguUq3e7
         0KzOgrY4mDukWLxNT5l4om/B8XZaD2cd3AVlBPwq/gPS7+32hc11OZT298/Ihcrdy8N/
         m4a5Tb62DEeOm6q+tZiAG5vi5anGrhxFH0sk8V6ccaWfT18Ic5WQ+cOJe4X4WBfe14lg
         gLjIyKOKOKvyUx7cV8cRHmyPwYLjdX2ULdsbpag3M8JvBBZeAUbfEcyXuKrikXZbrE52
         qXbTdpXBTQmC8X2SKJsqviT/ruQIGLpsqQPluOK3PoQcFHVFrdZRC3zG9+N+wBezI904
         Vf5g==
X-Forwarded-Encrypted: i=1; AJvYcCW8YZT6L5scsTHX7CuqjDJs6M4CwFAtsxTeIMJIdWSpwqpMrymOQhfbUxI9/BgqtzIHKD8lgxZgNj6HBg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp5UFCfGUBfHMS8d+XZ9q8oahG9WWBeBNMTu9gxxgoS0yagSEg
	o2Z9gcDT0j/oZdlhZwscVHmsnnmUop2h5xHvPKBSza1A1NtqzdyEDNe49MWw9JTwg6M=
X-Gm-Gg: ASbGncvE7n2xnNyDbAQWkbzCPgIVa+LzNFaxqabw59gduYDqYAtspB/E38wtGrEfoES
	rrQV6hd2MP09b58rfuL46g9NJ83IRaJcS+yoGo7Vbbfq/5BKl3nNs9mx1pjuAHOOjcbtj8nR69u
	McpH8TQFKeOfQWOB1BWEhMCx4IajbmfF+/c4fzd1RSPP63IYt5oqj0UwN32B2Ow/7QIrpRwChEu
	e3Pr+lcFC+XNCbBuYQ+b/1c3u7Imt16m8DkCGzmLDdxAg9STFOq0yKGrY9S0pU2m5dAeCumpBHA
	VhOrzZQQzt0KqQp7SDcDuvXIAOyWGySDHYc+12WQHmHv7L87c6wzkDRWMoCZkPnVAY2c6ZkO94m
	G2bF8DlTfjpE=
X-Google-Smtp-Source: AGHT+IGSGQ1o4EfU6jvKJyK0KdV9naUkb1bONkc5+6ZtJl7+1gHYypaxCkXBkgWg6FreBtNlhcplKg==
X-Received: by 2002:a17:902:ccca:b0:221:751f:cfbe with SMTP id d9443c01a7336-231d4e64450mr21068285ad.19.1747364751569;
        Thu, 15 May 2025 20:05:51 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.05.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:05:50 -0700 (PDT)
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
Subject: [PATCH v2 05/12] dt-bindings: riscv: Add xsfvfnrclipxfqf ISA extension description
Date: Fri, 16 May 2025 11:03:03 +0800
Message-Id: <20250516030310.16950-6-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_200552_460300_2C1886FF 
X-CRM114-Status: UNSURE (   6.75  )
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

Add "xsfvfnrclipxfqf" ISA extension which is provided by SiFive for
FP32-to-int8 ranged clip instructions support.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index d36e7c68d69a..be203df29eb8 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -675,6 +675,12 @@ properties:
             See more details in
             https://www.sifive.com/document-file/sifive-int8-matrix-multiplication-extensions-specification
 
+        - const: xsfvfnrclipxfqf
+          description:
+            SiFive FP32-to-int8 Ranged Clip Instructions Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/fp32-to-int8-ranged-clip-instructions
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
