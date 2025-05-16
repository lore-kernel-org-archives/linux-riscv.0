Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B858AC3DA6D
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 03:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2mVsCRX/49Na3LfLc4+tmMyxWWVbqXVhXCoTQ5KeU4=; b=i5ddACh3uLkct/
	7cS+5Qak2SwbsnICHzvEEbNWmFB8otAYeGhDbvvoZpw6ql6Vjuu4XkQmX+lWa6JReq/PLybQLes0E
	WH1G2ksy6m/HFkUGo0zfZnVzmnVBZaBDwdabUVCy8X5LUloZbDvyw5Iyj95ctkGE8FWE1nuGvoQUD
	8A3+UfN+PwrIlry3tkypB4CCYX3a77h0KBn1wplB3pWWt2oQDTsWE5rtErCfuClQ4CSOFMZsCp0jo
	2XQAJiAyhgvHlfA7mWoFDKO3uQxIE4EEgED/XQpto1g3c73sF4BP4wkDzK2Bh9sL6Fe3509rGC9Oy
	NqfuLgMbEPSOZTh2pKsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOp-00000002KHu-1Epw;
	Fri, 16 May 2025 03:06:15 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOk-00000002KCX-263a
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 03:06:13 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b1ff9b276c2so985634a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 20:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364769; x=1747969569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAvviClstwfzUPfEFvJI1cAxXcDrrh9fZc4W+cMV6/0=;
        b=UnVEIDlcailf/s3QozlDnHsbIUj64krAu9SgsmQWu2BzMEEzwlRtVdJaVLiAOTLJw1
         4tM+OB9ROY9t0sfixjHMPQs7ZKHoCEpur01LTDrUESrlV1qdTWGZ/MlndMvAO0zKDhc9
         nw5p+hEgIkTLEAjrKxq3N68Rg7LTOSU6S22CmXb5qgOnnc0UgCUYIMaIISF5GG3Uz3ue
         SNFd2EpCWpxmUC01q9V5O+VvqruR/Gh0zllUbRZxTPxYR2E8bW25ijuQXg0sBLeIFVXD
         Ksd8pk3mRLKDN5m7m34wlsWeYn9ivyrxlEztQFGxhN5oF2KV52aX3cL+ulnQDsTWbj+K
         zcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364769; x=1747969569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAvviClstwfzUPfEFvJI1cAxXcDrrh9fZc4W+cMV6/0=;
        b=jSFe1AyOLeqfywCjAWXq5chDX3ytNusx0oEMUJJXN4LE/XzJPQyIASQcoPXj/dT4mP
         QYSDuMukXRDLDzvaX4d7lwHgfABrGiqBxQN6M+206MhMuEsbJgAPIrAyC/4MRhoKVBlU
         286ndrOSyCNLOWrXY1+ylkdHeC4/t7CQdwnatDMafsXlKr2f9DJE0or9yuTe6PNqh3uq
         gdY4VmYOfcwy3S/MRC87u0+zIpXcMgIw6vgNLa8j3oF4CF2lyZGfpfOUoIHGcRBxlKxL
         namBG7olv6lkVEsN0YUa1e+Hk1eHRa2sQqzSOQGQChWPXu8hUV6uXRYPiSuCwGvgTHMd
         WMwA==
X-Forwarded-Encrypted: i=1; AJvYcCUTutd338qKQL4GUF828BaAINBBu2KQT3hbr029Ed1iTQadWYfQOj5BQJR0v96X4A4N168nxu3rs2cW2g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0MVdbWXpfOdIwkMyAIy1xwIcURzbpOBFqYjBa1kro6AlGRbD9
	p7FHvmSQYUMjNc+wV2dbG+X/sEebW//KpWP17A+uq1JH8WpS3kdLZuezs6fMH++99PQ=
X-Gm-Gg: ASbGncsQUeRODKr+aLx839s4vRm/CxNM9mg7hu0ET3UJbS5NI29qtWFxSrIW9HBm2am
	3hwGdPCqBXwKtRXo4ZoyQh17Ob+bXs7CYn6qq3/ToRY6045B1TivO0bwGgW+3eEWCB+jpS4VGHt
	/UYYW+allvFH5NSSCySNruBmZfE0D/9qnY+v0y+sRj+gF/Nfi7VT8zNd0NUzTbYMuqSwpQApo5g
	y26ARTF/23DhpfETaRTYn1HPew+SGgqf4RgJB0ltt1MYElDPQDpZCnGHOEPqTqBRM8hwbo5LpBU
	FEJEmqcof8GE15hjVZn2no326+7uTXIWSABfR6VKJfGNeb9nMzVW8Xm2wUArVpkS9SHqqGt87AY
	syA/nBNWCltM=
X-Google-Smtp-Source: AGHT+IHVpCZywGkosLX5RQG0/6A89Lg45RQ0IyzHm6KOJO4LmSTZatNjMavA6pelGe0MU+ect8RLXQ==
X-Received: by 2002:a17:902:c951:b0:211:e812:3948 with SMTP id d9443c01a7336-231d334d209mr22719205ad.0.1747364769522;
        Thu, 15 May 2025 20:06:09 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.06.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:06:08 -0700 (PDT)
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
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH v2 11/12] riscv: hwprobe: Document SiFive xsfvfwmaccqqq vendor extension
Date: Fri, 16 May 2025 11:03:09 +0800
Message-Id: <20250516030310.16950-12-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_200610_543692_AC916215 
X-CRM114-Status: UNSURE (   7.14  )
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

Document the support for matrix multiply accumulate instruction
from SiFive using RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 Documentation/arch/riscv/hwprobe.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index e15405e12239..7c11351b1383 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -353,3 +353,7 @@ The following keys are defined:
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF`: The Xsfvfnrclipxfqf
         vendor extension is supported in version 1.0 of SiFive FP32-to-int8 Ranged
 	Clip Instructions Extensions Specification.
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
+        vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
+	Instruction Extensions Specification.
\ No newline at end of file
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
