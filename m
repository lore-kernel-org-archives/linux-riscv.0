Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA75C369CF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 05:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YKYm89F7myxTpYI5AICsX5pCWwvvVF+zeuY1tL+JDUw=; b=O2IhZpWiLx89n7
	6ZpZfxA4YWmmWYD5lG6dcKQHn93mXLD7b1+8igaN4mxacS6ta+Q7k/baAUlG0JJJcmbpgAVdKzWNc
	eS4+gR6/PFy38s9sq+EIl62fla0AEfuLKoaU7C5pfPI5WDaNTReXFtYTll4r2BDlNn40QxvWP2Gl3
	HJPwa0wdpG+6JqiYcsqyXkPpm72OCSolkUBqO+Ppa8Dw8xe+n93hSUiMRGlMOOQgyydO2RJwENWcf
	7RBdYdO0rKubqjK8UCVKJRdcJcqTyVsCkKynm67xbVHt0Ceg5F8jSNPA7iDxIMuRJoJAEx/o3c8bU
	XmmNpbyhk0H1qqzXN7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eMw-0000000F9Um-3jPM;
	Fri, 18 Apr 2025 05:34:30 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eMu-0000000F9Rq-31YW
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 05:34:29 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-224100e9a5cso19328245ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 22:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954468; x=1745559268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TI4WLg30HJ0iF2ftd55+vT1VVRqGXHVwe/n9GHUog94=;
        b=jmYImGGkc7KUx2dJJTRJWJ7a3QiBNnnntfZABCoTSd1I7PvhQkkJJHsnDL+nCtaMM0
         IrysDWYRE0e+if4b608nXKOjwKoJjr7q1+sR7e6ImnC6qEvdGKz8jsRzkf5s2L33qEfR
         B9tLicfu+heVskXUdjoRRrtaNX/UFUM0JQaJXI5YKkUvdaz7a91lnQjrpgbJlVkrJmWS
         QtiXLJuoQ2VZi6Azohxyk32GzdYII5AKgsrrlHHuocYoKQNWfJxJ3yH1ngzg60quMQEl
         v5fW2D4L7jXLHy8JNjuz3iqceNCIZG+oPvjB/ODPlSbqWCu8m1ig5IYoEa1bz1ubsRHm
         JDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954468; x=1745559268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TI4WLg30HJ0iF2ftd55+vT1VVRqGXHVwe/n9GHUog94=;
        b=T9Uo7snuInStK/3/sB8NQfB0Gq7orO13HYBE5TdQJAgneFDkIELxXhZv1Z1nJZ0r/V
         bsGNCH3YJS+TgbCGb6aD9aaNOV9o7rSBtOoyYUh5igWPAls7ek0jGLgf6gd+5NGYg3LB
         nklqSjlIRbaE3UFIUiHR/q/wpTUe7o8xCjhBT1qHzLPuj1bQ/dzcrTkA371L0xG3zNg0
         P+ihT9BQuPsuGeU9MHAU8iVpBmtwLRbipS056Eaxpo8LGu+wQ0AYl2JhcVTcEFjflFWS
         0PAii7riCqM3Q4AHHUjO5w3JPJh/bmp4/ROoUfibftstfACyMwhjfwf3ZY38FEBcF2vv
         EVIg==
X-Forwarded-Encrypted: i=1; AJvYcCWSMm7+WfBjmyhV1fwGXbLaZDEwCdsUp1xRjcocwAtfMSg6/punI60BkzmF/pkoAbSbKke9auCTGMGJng==@lists.infradead.org
X-Gm-Message-State: AOJu0YyyaGsn5gQBUvlnrehcoHe/Hdr36R2wcj+Ln6odxVGK2MnKzNNu
	mPf0p9BOei8TFtrpWSHWhNH2mPA9yrU/t6yvCj/OdCg+SHfsLqjrsNDjU8eoyAI=
X-Gm-Gg: ASbGnctP9G6seZf7mjJ3EB9fcC77VC9jfGybOvDybcj/mqU4vc0pWegm47kyVyDgAPg
	YaIMl76+Nc+VftWb2rg+Owqun3bpEjGiKn/Hv44jQvvxYw+daol8V4gWmFVQ46V0SOT329+ZNMl
	wY8IfK8cPXC5M5fP89wCEYNqFYRbgfIQ7jcWOUh9rjk2q+5hejKVXW8Q/EnqT1Qx2wb5kinI8S8
	3KpoDijh/Z66qp8zY4QB68/BWoRXVLBH578xaZA9TrS3dhFYJWxDbLzgAQujw3UuUWl+AX9ggAT
	kLPWFHYfezUUx2TR/8Zm01hPui6NTQyaSda4zjAIzL/ALg29M0IRUPIAmZ75oSQDypeUOK+U2SE
	N
X-Google-Smtp-Source: AGHT+IFv1lehPDXJIUVh6U71O3mQnTUUjpaJLVnE2K+fIDs2kQFHDaeWEg6RoPOaNtbqAjKHqbHtow==
X-Received: by 2002:a17:902:ecd1:b0:226:5dbf:373f with SMTP id d9443c01a7336-22c53379f8amr24165215ad.10.1744954467906;
        Thu, 17 Apr 2025 22:34:27 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:27 -0700 (PDT)
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
Subject: [PATCH 06/12] riscv: Add SiFive xsfvfnrclipxfqf vendor extension
Date: Fri, 18 Apr 2025 13:32:33 +0800
Message-Id: <20250418053239.4351-7-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_223428_774860_92614ECD 
X-CRM114-Status: UNSURE (   8.20  )
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

Add SiFive vendor extension "xsfvfnrclipxfqf" support to the kernel.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/include/asm/vendor_extensions/sifive.h | 1 +
 arch/riscv/kernel/vendor_extensions/sifive.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/sifive.h b/arch/riscv/include/asm/vendor_extensions/sifive.h
index 608004250e2e..2d05e3e73170 100644
--- a/arch/riscv/include/asm/vendor_extensions/sifive.h
+++ b/arch/riscv/include/asm/vendor_extensions/sifive.h
@@ -8,6 +8,7 @@
 
 #define RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD		0
 #define RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ		1
+#define RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF		2
 
 extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_sifive;
 
diff --git a/arch/riscv/kernel/vendor_extensions/sifive.c b/arch/riscv/kernel/vendor_extensions/sifive.c
index 990ac83b1f81..077315e5b2d7 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive.c
@@ -9,6 +9,7 @@
 
 /* All SiFive vendor extensions supported in Linux */
 const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
+	__RISCV_ISA_EXT_DATA(xsfvfnrclipxfqf, RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF),
 	__RISCV_ISA_EXT_DATA(xsfvqmaccdod, RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD),
 	__RISCV_ISA_EXT_DATA(xsfvqmaccqoq, RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ),
 };
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
