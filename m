Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28149C0218D
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 20:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tlRkH+uG7oQpAWxdBUUsJxlwgIn6dLF90KXT2TnM5lk=; b=UQ+MZJrKn1ATZa
	QkEYh4cUu/XU1cDBpoc51glscfLKU5SFQn2BlTGpEufRw8/YWCOv9qdp1ZdIAcYBFyhk9j3cM9e6J
	vPLUStHkoESb0okJlXSqQcgC5rDWiNmmVBQF63oF4OqfApw94R+vtV2yj8ctWkU5J3w+vy8AW7YxT
	o/H4XWfWQM/cBimB874lznN0zpJ4PoWzED18BjL6Lml3GjQI71T5Krbk6MdALkdFB3KeCYSjafxMc
	E/6/dayvPmlOBn0c0HvSpTxIOOW2sfarpKVXhUN5uA4uWtEm+Ry5mlm2Zv3VqKfBrFXXdNw3yci05
	eFlNEwCtglE3838hEseQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdEqR-00000007lef-0lbS;
	Wed, 29 Jan 2025 20:39:31 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdEqN-00000007leJ-3GTx
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 20:39:29 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ee51f8c47dso43550a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jan 2025 12:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738183166; x=1738787966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S9xPFsm0CiACHEgTpvga5kyDZr2nERop/dzgTmhGmOM=;
        b=T/L76O5IlXLE2wAkaepXGYOS1xm2VRGpbrNV8ibXKJL75dCIAEmIwsoVFfY49Mz1I4
         4U0Dl5nNchqIKi9loK2nHR8PY3g957e1P/w2RDcjrf2b301oyB+gTxgrIkyaX+/A9Y9u
         JDmsDzcVTnJ4QKNMTOoI6f7ryZYTcouePxIj/+8+yZvXPznH4za+h7oyv7ENZL8k8yqp
         0w/FMT0wAP6WxmscIYBSg1zRbi0hPNgIfwYkdQCui9s3QmPLxmsPi04rBYoybVkvE82j
         yY3HHj2NLHAsCW+TOXP4OizP/w0sHBYX7KQEaQlbqUITSVH0ixSAmrgnk4sMiOoGTti3
         /kcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738183166; x=1738787966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9xPFsm0CiACHEgTpvga5kyDZr2nERop/dzgTmhGmOM=;
        b=vq2Px6g3wxB4GUm9FGY52JC5QH56cDXG3IiJvBEkSvLtVZGzT/017VTriFJ/C6t3+e
         A5Ooyy7i3Ux8IglUdiuPfhLlU3ogZxg4LR3pETRCqnTPxUEjyHipZNxUPHLVI0jxLoIl
         cbrKEJ2uHMJbYFbkYelb7Yb/EHQ2KlXDkuT5RZt6tMft3LCwMEu+6qEZcSIKlG6ZCbbU
         6uplbsyr+0ak1/Xyf66oCyXacB/99A0IR8AIDFiIIMAN+K3HOtMUt81LY+tpb7LEiB8e
         ynoeNOD5u+1BK0vcembDod8r8fW0tRsOKact9opB7OoP1vtxh48jymhnLmqjtsgChkuu
         UrxA==
X-Forwarded-Encrypted: i=1; AJvYcCW1JmY6osADEPyTf+DTZUqnGHON/GAWeMS/AIa+GqvB5H8mJ/KdaGTOJlOj4g6+7smPdSLI3wyS0gecDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyG83b5dvN5ogQR/1Fr2G15fcAVlw7qlXu13YggXfYlhkf6aEa0
	4OomeIpJ8yUn4VhC1PoS4Jkp3mSumcuVRZQyhsqGS9CVE6aE/HUc
X-Gm-Gg: ASbGncuFC/f9L1/ELKDt57uLpoHC1Q9StdwGTx8k9/P4XzwfD7ecQFYVdExPGV2vUbj
	XeDDKOcMGVKip+QqjoFYHigxDAxEMrJ3YnwMX0ac1zGYlIKnwwgkPEeTBePHyUEZJX6bp+FxBG1
	4TRCdipaobzN9N2YqCGTvAKrcl74cVJTSYhaNnWCjOppAE+vA3K6BXXjUu//0sh+DSjh/gjnZvJ
	lGmMGv+Dk5AhHY+E2rF/wMe297qWMu5P5jpIPlsMwWweb2B/9DRGnRk2SwCakOv0ZRwcXZ0Yu1d
	l5m2jBeVZYP1/e6Fbg0gf4umEMx5D9i+m93IYw==
X-Google-Smtp-Source: AGHT+IH/P2WEy3n6NCJq5a9VrQTr/6ukzXoqXEvnPXyP5dqSLuvd5EP8ueh6qCxGdt4GzAViGJMuNQ==
X-Received: by 2002:a17:90a:e7c6:b0:2ef:19d0:2261 with SMTP id 98e67ed59e1d1-2f83abff386mr7141423a91.16.1738183166470;
        Wed, 29 Jan 2025 12:39:26 -0800 (PST)
Received: from newslab242.. (pc51.csie.ntu.edu.tw. [140.112.31.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bf9498asm2252519a91.32.2025.01.29.12.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 12:39:26 -0800 (PST)
From: Chin Yik Ming <yikming2222@gmail.com>
To: conor@kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	ajones@ventanamicro.com,
	samuel.holland@sifive.com,
	cleger@rivosinc.com,
	andybnac@gmail.com,
	alexghiti@rivosinc.com,
	peterlin@andestech.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	yikming2222@gmail.com
Subject: [PATCH] riscv: Simplify base extension checks and direct boolean return
Date: Thu, 30 Jan 2025 04:38:43 +0800
Message-Id: <20250129203843.1136838-1-yikming2222@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_123927_819311_9F0A5A3D 
X-CRM114-Status: UNSURE (   9.77  )
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

Reduce three lines checking to single line using a ternary conditional
expression for getting the base extension word. In addition, the
test_bit macro function already return a boolean which matches the
return type of the caller, so directly return the result of the test_bit
macro function.

Signed-off-by: Chin Yik Ming <yikming2222@gmail.com>
---
 arch/riscv/kernel/cpufeature.c        | 6 ++----
 arch/riscv/kernel/vendor_extensions.c | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c0916ed318c2..32525b69ab99 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -49,9 +49,7 @@ struct riscv_isainfo hart_isa[NR_CPUS];
  */
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap)
 {
-	if (!isa_bitmap)
-		return riscv_isa[0];
-	return isa_bitmap[0];
+	return !isa_bitmap ? riscv_isa[0] : isa_bitmap[0];
 }
 EXPORT_SYMBOL_GPL(riscv_isa_extension_base);
 
@@ -72,7 +70,7 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned i
 	if (bit >= RISCV_ISA_EXT_MAX)
 		return false;
 
-	return test_bit(bit, bmap) ? true : false;
+	return test_bit(bit, bmap);
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 
diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
index a8126d118341..62f55bc779e9 100644
--- a/arch/riscv/kernel/vendor_extensions.c
+++ b/arch/riscv/kernel/vendor_extensions.c
@@ -51,6 +51,6 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
 	if (bit >= RISCV_ISA_VENDOR_EXT_MAX)
 		return false;
 
-	return test_bit(bit, bmap->isa) ? true : false;
+	return test_bit(bit, bmap->isa);
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_vendor_extension_available);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
