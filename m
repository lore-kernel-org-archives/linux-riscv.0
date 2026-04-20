Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA13EF36C21
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 06:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2YVk/2khtIhBogLoarIzUywaSFkdx7JJLU9lPxgWGsU=; b=nlWRNdZcm/8szH
	JBewIH8FqmcbXJj02ul87Jzr87EfU73KNZsgtQuXAkKC0E80f4zq/LfGq44E5rLWjH7E86l66f07b
	n7WC4CI2qgIt8+NB2GPJXWp+g+cMvVBWQ+NbdLaMy6usHOZVpvPVWpvUb2nMxUfqgGR4N5ec38hRH
	ua3BAMrRIMOX0TgpWgt+hWj/HvbdeJl05FCC9UIRtjcsoPzoNb+d2IGigWwIzAC8klYPh3rz5olxQ
	LiBI7DqdIKO3ucd3MpAsM8dJgwWFPIzIEQmKla0cgD+AB1wR1jKU7tSavP/239AobYD0lrsCze7HQ
	Kk3L4Mdh/Sq3pd8VwqDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEhyi-00000006Trn-0vkd;
	Mon, 20 Apr 2026 06:19:28 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEhya-00000006ToY-2Pwj
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 06:19:22 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-12c45281a06so3302232c88.1
        for <linux-riscv@lists.infradead.org>; Sun, 19 Apr 2026 23:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1776665959; x=1777270759; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=diJI/psFLqVLbcfwBRYzBEf9frlX+rsEVwW6L4ZaGBo=;
        b=SZd4pR/z5vbzyP/oYyui1bJ3sFS8RA0eB6vmzZKjK73eBFJ4AZWWXumBkKr6heaNxx
         2euqOnQSBActVX79/T8NgvUckOxGOZxiKCU/TpF5GC6j9NGVtL/O5b0zrClTv0zQtDSd
         B9YGQ+uKxoUg/oE8+1K37PmwPxT+BrtroveMkcYILNnCQvQKc9UYejXgLzgHpiAcXFEm
         k6WCClEXrFXW9toe1VR2tmUQIDCwJ/FJXeKUKPpEyC1d+44PyqG1E/SozrxPGa654J7L
         4Yh1I7F65QI2+qYUrQgSJX/gMsG/5JN8Sn0DA3iU778AdbXkSGt+8LQtKA92yj1ModN8
         Y8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776665959; x=1777270759;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diJI/psFLqVLbcfwBRYzBEf9frlX+rsEVwW6L4ZaGBo=;
        b=VuH8qjUd9mxahcXVTdFCTeQZpja7qF1D8Dz3ICAKGzM/7451AXfH+og2PteE0EGjK3
         fOrmXWGDtvjDNhKJMhP7kOx20uN2CjrqqHdvHchktoZvB+RrrvrBicKEHqyOA/fxGKQu
         SAKHi+t4exehSdehJyqIKGBNjpJIZHPb6Mq1UTlvn1T1nnyFVY24XI32Bpi+5mjnSLk+
         WDMdLxLVvwowGSeS5oCIjw+tV6wY+2q7JIa5VsXqaCqDT+RBgGPcnuCymSIE66FsLvrs
         02VJAKSZompQF7+Cc0JT2t8aPIgdRx/62aoKuBjaUmq1ozx3+dJLxsz9pnv2xpjngIW9
         hSTg==
X-Forwarded-Encrypted: i=1; AFNElJ8UhD9Z6234pgBfAWYDV/dSxogL6V09sw43VQqj9JWay7+6diOro6wa3FqE/FhtI77uDZhzflQhAiSxdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyU/5Kzujwtpks9xEBw3kGupXco2d8yw2yc4puJcr9ZMdjJFqfo
	EEX0vwtX26KS18U5ZkautB5SfVAN1J2y6Y8Mj4Fy/KFTqwWRjfd8gciDL23/TRM7BSM=
X-Gm-Gg: AeBDievc94V3KEpGOa7LlSlzHOc/RQicIw+j6aG7V6kBOkmNCBpG0/LjKePH2GpEZE9
	QQS910MLpJZQZGblQdO4n8AnXtGLOFPbG1w6MdWz/0p6HYX9fzJPwEVV44qMHC2Wb5XisAe5Kr3
	N4I0m/e9O/7XgXgK1NIdgfTcmMARHJi4hIJ9PeuLJkgnJEzfsh8z+6X125uQEZFpculYPgcYoLb
	VXKtJQzLACQj+km5+DNesvffE5dr6or0qPIj/TkENgEk6LxENTc+JBCAMhYbncw3iGIP3EPDTwK
	ZiITmfBfdlzIQqxMpmo4/TGv3KMHIl1352IuTKOG4YPM5p9G/qiGsp8cw/3keAFGOh9qT1J6XEy
	8ZFSsXgVBSbTLNbUGH9phEijXIu7Pel8QVFvAZPtFPld8B+KUsvfRpMJtllfsJ51i/2saOPqQYR
	CzZne/B6jqEzRjArKeUJhZhdbuO1XnPB28x4v+1+0U/v1I4Q==
X-Received: by 2002:a05:7022:628c:b0:12a:8ea4:252 with SMTP id a92af1059eb24-12c73f6d5ffmr6084142c88.4.1776665959137;
        Sun, 19 Apr 2026 23:19:19 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm19541880c88.10.2026.04.19.23.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:19:18 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Sun, 19 Apr 2026 23:18:55 -0700
Subject: [PATCH] dt-bindings: timer: Remove sifive,fine-ctr-bits property
MIME-Version: 1.0
Message-Id: <20260419-clintv2-remove-fine-ctr-v1-1-7527f4d45850@sifive.com>
X-B4-Tracking: v=1; b=H4sIAE7F5WkC/x3MQQqDMBBG4avIrDsQo7Xaq4iLkPzagTbKRIIg3
 t3Q5bd476QEFSR6VycpsiRZY0H9qMh/XFzAEorJGtuZ1gzsvxL3bFnxWzN4lgj2u3J4eofg7Kv
 vGir1ppjl+J/H6bpu8Eli1mkAAAA=
X-Change-ID: 20260409-clintv2-remove-fine-ctr-d5caeda27863
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_231920_663108_CDDE7BAC 
X-CRM114-Status: UNSURE (   6.78  )
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

The counter width can be inferred from the compatible string, making the
explicit "sifive,fine-ctr-bits" property redundant. Remove the property
to simplify the bindings.

Fixes: 0f920690a82c ("dt-bindings: timer: Add SiFive CLINT2")
Suggested-by: Conor Dooley <conor+dt@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20260330-relative-hardened-5ce35fe1ef57@spud/
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 .../devicetree/bindings/timer/sifive,clint.yaml          | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3c16b260db04..051edb1da0d7 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -72,22 +72,6 @@ properties:
     minItems: 1
     maxItems: 4095
 
-  sifive,fine-ctr-bits:
-    maximum: 15
-    description: The width in bits of the fine counter.
-
-if:
-  properties:
-    compatible:
-      contains:
-        const: sifive,clint2
-then:
-  required:
-    - sifive,fine-ctr-bits
-else:
-  properties:
-    sifive,fine-ctr-bits: false
-
 additionalProperties: false
 
 required:

---
base-commit: c1f49dea2b8f335813d3b348fd39117fb8efb428
change-id: 20260409-clintv2-remove-fine-ctr-d5caeda27863

Best regards,
-- 
Nick Hu <nick.hu@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
