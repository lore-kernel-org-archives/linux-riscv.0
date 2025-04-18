Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEEDC369CA
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 05:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2mVsCRX/49Na3LfLc4+tmMyxWWVbqXVhXCoTQ5KeU4=; b=025dO0eG+rg8jm
	yQDZdX3Yv8GdAfdjveMOjgHvm8/GwcdXiTGzWWkYUrhIgx3PEAXzE1cJ0mHYX+KwcCe0WJ8Wl8f/H
	4xkEkY6h7HEmTbjlg/vqsdHTDV5IZEBXTWCnK0y8U/qXJ2oc+vFB0ObpKSxHVdOsz59wZC4PE2rQG
	JJgDQxIhYn2pHXSUMgahjMubcs7IDKNNFLHsOJVFrks2DAfnEJHMn5azMmsrhoxcKmr+0mhf5FMYY
	R8ZzO0ICa6UsFe16AC+j8nuHmEc+vu88tval5BqNbfzutR/CFz0xLELTQYSqEvM9kHh5gCvcyOB9q
	/hJlYgh2CQSiwBokH3/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eNE-0000000F9mz-0JAc;
	Fri, 18 Apr 2025 05:34:48 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eN9-0000000F9ic-2CYt
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 05:34:46 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7398d65476eso1311790b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 22:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954483; x=1745559283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAvviClstwfzUPfEFvJI1cAxXcDrrh9fZc4W+cMV6/0=;
        b=TGumaCCZlKOvlGiArtMuxdHkZiIfYtXgk2TaDAKKE3xsvOkzo87xeEVGD2K/cE8vCE
         VkH9tpj5fD+VoxP6bfbiJSKXzd0CzR4LCT9+K0bXPwEiHx0SzFYgMHaGqGZpE/A8407r
         ZxTW5JdZ1Kv8HBdo6KBhJfDnYvJzgquhVfMc/q/BvKeYDV4tD3+tAgG5nA2w14fQarF9
         yZDwPiNUr1kAoJLJzDJyPyH8cIEo16SzIXFYUqBUqrMpft1takI9MLOwlNw7E9Jodod0
         ZvsAcpoNgEEpP5AC1MMTY+Jmi4w3JOdlY57dMYJXwVIWt6vRWIqkcqfUeSCtNPAJOkGv
         wMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954483; x=1745559283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAvviClstwfzUPfEFvJI1cAxXcDrrh9fZc4W+cMV6/0=;
        b=CN2qYZQPf0CHTc6j31GVufTS0HFsa2lugtFnb+GWelMxkdeS0U/KFJHODN9WWTmMXe
         wyQSiWwqJJDz8Pgl79n8dpWlxluIa+8vGsecTIRVv4S+6Jorryc/a53JbyQlYxAxeTsE
         VM6GRHhWhGPL1mAjUqVHBxldOEAi7NGb7tXMLq5LwweFAQZhBFF7vKEfoAZz8vqMLHeN
         T9bOd7cedoDfqKYqdEJoXLH+DgZNoavKrCPpoQMYjRh7tSjmRnZFx1apDWhm0F6bNciL
         Dqju4/lYk3aXRl0rtyTngI3Hvf6cXEku3hlYXTlQNeqYoTDdgYJOzxO/6Nzwg/NE5XVY
         VWNg==
X-Forwarded-Encrypted: i=1; AJvYcCUhhexhElq1AGLLaB/cSpuOLJReUpPecot+fJVi7Ae0xV2hQs2nYrbdBWCeaLCc87kwLyOSwWGuDMd0jA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm2eYoNhOAk64L9Xo7RDiFh1UX5e7SXEdtJ8X7OjiiARXntR19
	p11PY9zOEB4/dtogW69cBFzKeN2gHvtPUv6Agvdlcb/hsFHMWuOCzXFouJlIsnQ=
X-Gm-Gg: ASbGncvrnCKdgJpf/JHxWA461Dr5zGRbx5gktJExXshFIWR7KG52YQbTO9214Vh+lyU
	BOEoPiZaZg87A1Ai9XDigcDkXDgQVarU9jvrcE2g2eU+PgssGZcBroPNup0To3svuDUk031KYPN
	tFJ1UkWE1xXBZnnXL9PnIvrCrqkJ1kFghVVZUoSEIZoBzgPIoZA4sYAYatuV6Y270lp8e9gEtWH
	uhq3+LiSw0FQthrDkEuLpuxEyRNoHscK9GnZaIEG7R3C1CHiw6mki0kLk78Hao6SfLWwd2tk1A6
	j4cr6YUzZ4BVE8RXko7pTAdQsbiSHK2GvxeKIfXZ/ezUSfvhxQ7BZYrNvyDZEHF4LXezOTuOMuI
	P
X-Google-Smtp-Source: AGHT+IHQM1ft6hjpNMobm2/YoeNnotmxkTudlzgz2ZgJSZr49UA1a3+mNT2Kn2UrRzZ6aASVjmqjaA==
X-Received: by 2002:a05:6a00:1788:b0:736:3ea8:4813 with SMTP id d2e1a72fcca58-73dc17f7db4mr2280418b3a.2.1744954482861;
        Thu, 17 Apr 2025 22:34:42 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:42 -0700 (PDT)
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
Subject: [PATCH 11/12] riscv: hwprobe: Document SiFive xsfvfwmaccqqq vendor extension
Date: Fri, 18 Apr 2025 13:32:38 +0800
Message-Id: <20250418053239.4351-12-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_223443_589620_B930A0C3 
X-CRM114-Status: UNSURE (   6.70  )
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
