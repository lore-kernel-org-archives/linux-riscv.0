Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0A1C369CA
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 05:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rDjML+fityR1y/WLmvb4+cj+2KDGnNh3B35cbsprDMw=; b=fUacv8BuU8GEWa
	YQmTduY1aSC2wDXt8dn5S5tnK9+MIYK/Yc/J25wFoVhGe/B7XxXmIRJHaL7CfIvFvoVjh1cxxn4jT
	srEOBd2W+GoEDLT1+Lt3SFzdL4enAWzY2uV88jmhuTZqWJT5EFVNfB/CZD89fd4NMUAVgLSmo8eoH
	FGVw22fcS/H5EQPwGJ6Fk7CHsdOrQPx8niGpFEOfLlRHlgW0UuxiEBu58OFBT4Wj+O41nzg5VBNPm
	NB/uLagkHADqCYUbCx82vGaCa80B5yrY/VGgU+6qXnxL/srilDnZc9yssfYgNTuRjSJl9zEEOTf/8
	zeuIlBcUo1M7KkBgChNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eN9-0000000F9iA-06Ji;
	Fri, 18 Apr 2025 05:34:43 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eN6-0000000F9eh-22XC
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 05:34:41 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-736a7e126c7so1381544b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 22:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954480; x=1745559280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3B9Pw4FCv6SInWNpKovsdWyAhm6Z0HhbS+dPaBZ5QxM=;
        b=NWixX8CcAXJSnqVZGCTQqJ8/Wr7rF7zbmmD3+5QC36KnmlIw7FEaINnUd4hlhRKV3L
         c/uy69uV/Xm4/+kZfbhtfAc5WUzMV1/mZBa+igsniL/hcl5Ub0619S8saJhF+/g9xZpc
         yXdGTKL0wpTCHEv9XjM/GU2x3YOndpF99AfE4V7OXr/691Ibx8o+U4TqgZlAZdev66ff
         8D7xo6sfbhPZ6JP74/AW8Gb1VEaVCQI83Jl/okqcNlHSB8Wyp0GlpdxZTT5yZgClTIHI
         WI1sEizKOfsCeLLt2EIIw4HQ0T1oS1b44fw9p+dwixHYtNbzzGno26x8vOeSP38/xmhY
         +5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954480; x=1745559280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3B9Pw4FCv6SInWNpKovsdWyAhm6Z0HhbS+dPaBZ5QxM=;
        b=dhwBDYX8xZGHYJvDmSgD9nIN2OjVPG85IN3iiBixPNwhN94ZYjXC3P5y55jR4zj8Pc
         fUYIQqsbw4aB01BuvY+0BBpT9EDTdgv7Vv75LpL36CsOIgmk4JpvnZzlbExf2Zk3+31G
         327I6PTJ2nEphSBC+G6XJijL9y4B0kjWMgtx28sSpW343z/6gpZ/2FN2bZ1WWTBV/jLc
         XYOP/5EYZ2Dv04g5NUzye70wIOkelBYJGazvqlJt4iWonov7ORgM22Y/Y999koPtGF+W
         yjKUbAPEgUoHyBZX1/CqtV14rxZcWutI16Hw6VQ4pGAPa+b7OjZfQAeODWG+abTnnOAD
         JRAw==
X-Forwarded-Encrypted: i=1; AJvYcCVsEdG9V651H08CHnbvMg4vG2miJDJwr7PPaS7LFx1lykT2zPYxIT12ifsbXBMKZzSYx89oLKe3DRNKOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgf4K0xZ/c8glayaRIslStagorc21pPTWpqGy6SnAR+FwDvvev
	LOfiuO3KxHah9/IqppBY2mI4nEuQehvQh/vPb3SxQuwCKjcOQnXzmTM7R22HxPQ=
X-Gm-Gg: ASbGncuTpk7i0mrhjTk3qYqgMwTYvwNdZMybJaUDE3WiMthVymi81cubeqVy5jZg37e
	pSl9Yrj/JoYDScjKCgVElXW9TKk3b2g4L/pUMR+KD5a2nsExuBh5uAgXoKaejlFHrerkx87+Ecw
	WObv3utSxfdfcCFyXK5oWK/FHnjBHq4XUQgPRnlFPW/4zhjNmir1nqSH1da9YG963AfR7T57VK2
	xwuZl3avkb+/qGSwIVDJwtM02/qHBstqD9IVDaxShDeYGoHa2c17r0kHZQjYt1bmDH8+MvRWlGn
	FYE4IPW9OG7YNQAFevhV9U+kbu4cCXgIorYhH7FJ2tiGHr2GSs90gNzU/y+aaFWcI21BVqsCmkh
	j
X-Google-Smtp-Source: AGHT+IEuEbIHe/qe/mKunQ55/N9j2n9eXoEPrfFel1LpRV6cO2jrZzwdtlvPw0EFjDejmF7X3JD9pQ==
X-Received: by 2002:a05:6a00:114d:b0:736:3c2f:acdd with SMTP id d2e1a72fcca58-73dc14c80b5mr1878741b3a.14.1744954479883;
        Thu, 17 Apr 2025 22:34:39 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:39 -0700 (PDT)
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
Subject: [PATCH 10/12] riscv: Add SiFive xsfvfwmaccqqq vendor extension
Date: Fri, 18 Apr 2025 13:32:37 +0800
Message-Id: <20250418053239.4351-11-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_223440_531871_3BA72F9C 
X-CRM114-Status: UNSURE (   8.23  )
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

Add SiFive vendor extension "xsfvfwmaccqqq" support to the kernel.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/include/asm/vendor_extensions/sifive.h | 1 +
 arch/riscv/kernel/vendor_extensions/sifive.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/sifive.h b/arch/riscv/include/asm/vendor_extensions/sifive.h
index 2d05e3e73170..ac00e500361c 100644
--- a/arch/riscv/include/asm/vendor_extensions/sifive.h
+++ b/arch/riscv/include/asm/vendor_extensions/sifive.h
@@ -9,6 +9,7 @@
 #define RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD		0
 #define RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ		1
 #define RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF		2
+#define RISCV_ISA_VENDOR_EXT_XSFVFWMACCQQQ		3
 
 extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_sifive;
 
diff --git a/arch/riscv/kernel/vendor_extensions/sifive.c b/arch/riscv/kernel/vendor_extensions/sifive.c
index 077315e5b2d7..1411337dc1e6 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive.c
@@ -10,6 +10,7 @@
 /* All SiFive vendor extensions supported in Linux */
 const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
 	__RISCV_ISA_EXT_DATA(xsfvfnrclipxfqf, RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF),
+	__RISCV_ISA_EXT_DATA(xsfvfwmaccqqq, RISCV_ISA_VENDOR_EXT_XSFVFWMACCQQQ),
 	__RISCV_ISA_EXT_DATA(xsfvqmaccdod, RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD),
 	__RISCV_ISA_EXT_DATA(xsfvqmaccqoq, RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ),
 };
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
