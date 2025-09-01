Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2D3CA1006
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 13:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ur32O8lVD5YFcZ1/ZMAkjAgpvCmhLBh2cL7fEZWy0Vg=; b=1dXRjUVTlNejkB
	9JBZHB/zk8qFKiQ9zM0mchyLdsyTQAlkJ00Js43rMy2m7k7LhrjtIbSSUSKkNvXnKRvT5TmzpzPdF
	diPFen4myNw/Ml2CKA/haqnc/rsQxGrRZ+5e3X35L3asw2AJBPS1eBwqmVXCmb7u4QPb8xKkwXi6c
	mw4RM1K008AMXiyO/kSZzC0IDmuJbWEEwQ1hxlILNh21F44fBeLETMMoxe8Je55W5FcPRdvKaa4+x
	DP6ybcuyHM5bCFLBsvdUGw04RJz3iTi3036LGsM2o86eslAQA6Wubr7ZpmyBzcCBD/Cv1V6OM/jER
	O1UF59+8u46o94UE07Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4uU-0000000CkBi-2JVi;
	Mon, 01 Sep 2025 13:49:26 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2kC-0000000C3rM-2Srw
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 11:30:41 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7720f23123dso3945712b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 Sep 2025 04:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756726240; x=1757331040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4l4TBk/LGXRpjovIOSrhrLfanQNTxjIirl6+Uo+sE8=;
        b=lAkOfi6dU4VsksfEACqy9o/QOHgM7wXJakJ7MLcubPCtVhd5z8r0x5YDBGrunWgArn
         k/4drHTj6sLDEC9Q/Hq8qBuT8VBaytILMwdfzwgowdK5sb80XdyZ2NERhjPQPY19KTbN
         fdl1sy8xXuZfmB/V/V+XEcvSJS5Fjcevgf8grkJ30i6TNUZvqML34yxFkC3rftuWBPnb
         +fMmapmk0gCB/8srmJm2SJsAJCHQyTihJJUSnexWm70UxzCV2BAAuBH0SExFjO+w/mPz
         QYrOkCz/M+nYHGUjeB+GXQvBLv60ElPv063kIUdnxEPWfr421paweO7JDnADqG/H28mY
         GCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756726240; x=1757331040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4l4TBk/LGXRpjovIOSrhrLfanQNTxjIirl6+Uo+sE8=;
        b=L5bBPhdHZifavT1goKyAwJyX/mCSidzO1KYyILLyqqMzjKNEbLxI08vt2JLgEX2nL4
         HCoPfmKLV8SBBKtK+8FijC5pqDRf9GrB+ePfkaob7H+yKQq5zE71Vejr3SjIi+2w8yHw
         dscmgazpr4XvmHbTdX425bgb1/e7tRw7D0oH7xDGUcnbmDyUhLFuiIGfRy2uKEFr9+vU
         3TcUGLpp2JEhL4k+opHsmi+0YaVJHp+8WGZgLGCkfLdOh8jx+YGZLB36w51LNaU6I2h+
         mgS4Cqds0fRuHPL8ukIboEIU3KHIDL/hwGejJN38hGbPwErgwhFhX0a7ytKt3xlt50/j
         pCxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR0X5hQ42mnrJORpXiT3PrgGRVd3A+3d+h0q9w6FmEYSgMNRzvF1DkXxL73ozl6+6+ajz17dRFTXpZyg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq47j1np5RbLOe4NNyRR7S+ccFx91KniT9giAJS3S1zGGd0KkG
	/D+MKSVwLuMHXKSFh3FXCmME4Tm0dC8+Ra7cbeAzA0zggs/GxFGvj9uImEk07kNp5+g=
X-Gm-Gg: ASbGncsChWaZJK8Ulk/XlFlBA4cACB26b4uJbHWVf9SwhWKH6nhpTjumT1HDiElpm36
	YIOqBOs2xmkZXVxraO7KAkAhIU8j0Zu7eEOGIj02IGRtVk4QfekShzhIWN2w/sbO2ap5B1tX/mv
	iHRFwMEj8e0qxF1cNO9FVLjPuezyBRh0q8pR0X7m9/vcId/ecRTRbCQku+FUeFQDOJNBiGmGxfS
	gtdC69BTxbu9Cc47NYlo+Jypji8Q+GvEeFvL/d4OOPeGAKEdbIO0uGijtxIQxZhY092VOwxKFIo
	yxLEJNtoRD/nZmIGc2GrM8/CIPOVxjruM6EdHGaZtdd3bLRw+OuYCw8j71YTnzbMexqzvDqfRLg
	UP9jaDXqQLpNf4wWU4AjqzcnSq853ANYuFfTUe5+hW2BKaZA39hhljDV8SQKESOati04Hecf77o
	i3b3Zg2El7nye/magK7EsnrHRXT55qvp9ShQcqHmqvbeoPhfnBD/mr+g==
X-Google-Smtp-Source: AGHT+IGxbGNHyf7cdKlPSirFuPWtekxBxUWcXRyssxTcMUJqB8qIwHPWBXuB4taHEDMzJ7h/+f/ZSA==
X-Received: by 2002:a05:6a20:9148:b0:243:a290:3293 with SMTP id adf61e73a8af0-243d6f37dabmr10788824637.42.1756726239715;
        Mon, 01 Sep 2025 04:30:39 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7725ad1e9afsm2911441b3a.11.2025.09.01.04.30.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Sep 2025 04:30:39 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ajones@ventanamicro.com,
	brs@rivosinc.com
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH 1/4] riscv: add ISA extension parsing for Zalasr
Date: Mon,  1 Sep 2025 19:30:19 +0800
Message-Id: <20250901113022.3812-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250901113022.3812-1-luxu.kernel@bytedance.com>
References: <20250901113022.3812-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_043040_624959_6D418929 
X-CRM114-Status: UNSURE (   8.76  )
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

Add parsing for Zalasr ISA extension.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index affd63e11b0a3..ae3852c4f2ca2 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -106,6 +106,7 @@
 #define RISCV_ISA_EXT_ZAAMO		97
 #define RISCV_ISA_EXT_ZALRSC		98
 #define RISCV_ISA_EXT_ZICBOP		99
+#define RISCV_ISA_EXT_ZALASR		100
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 743d53415572e..bf9d3d92bf372 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -472,6 +472,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zaamo, RISCV_ISA_EXT_ZAAMO),
 	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
+	__RISCV_ISA_EXT_DATA(zalasr, RISCV_ISA_EXT_ZALASR),
 	__RISCV_ISA_EXT_DATA(zalrsc, RISCV_ISA_EXT_ZALRSC),
 	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
 	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
