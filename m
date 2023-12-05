Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF85C10DCE
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 09:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3sCCSF0IrcNmuFQM0+yBn7UHSdrxw5CgljLnCWjbVIc=; b=eVOnDKSM3FArRw
	uoe/z5IrJm7zzZK8z4vjSr5TznMqD7sZIWAU++b/L0Co6Q6K80vZ7xt8Uc+bm8LIfhNRoklrv3c5F
	6GJn+1NBEHCCInlGZnqdaC1be4TAH7qWKHrTddyvA0QfEA9Q1ojBqf/LqEzxb55AkIz8xI8WExG3l
	qC4nceOtCgSThq4OwLGBygTmRDzjvxj53G132/cKTS+/dYQfBVBT8BIoJFegdg/YvQM86Nb7uYcSV
	suIyBGcXECAcY9Sxa+eRc4Gw/jqgRgWeekf5sxggBxfacjWTdtjkslLhq2/rnC0B2nVj7PlKkmB6/
	jXabL2W2AE1/uPvRw6LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rARj0-006nZz-2y;
	Tue, 05 Dec 2023 09:28:18 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rARiy-006nYY-0Z
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 09:28:17 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5c659db0ce2so2449645a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 01:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701768495; x=1702373295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+Duv2eL4Rh6BmoQvomNjrPNP7WadF4MX+fx63CbvwQ=;
        b=RdtWWbQ8N8f0ODm1DoOZVmS1pLt2v03TwkhANi29LJvCtFbGRApOcwSCqhQuN2PT1Z
         0KVDYHeG+7JUtcgLCHO3mcRRn3tpnDfzDFR53NZR1FwW3TNVMH8KM4GprJMKQ+CZH/Af
         x1+INTzWPJMBhfiTMpsqRzV69cPw6a4AP1u2mhjeNXGZqxnCYIUxEX/RGEvQnhp7YXpr
         l7GldRqN1owwwCiJVOSXob4+5KY/nFLcb/OkqqyyRl+06S070gxwqP0BKXvBgxCYqWyQ
         /2pzRvOFgL9vCYg1GrqM4GcCwlupm1Juvb7/DHoaAMQ0AZ3TigsiFWfFUxhPYY0tcqxI
         zXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701768495; x=1702373295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+Duv2eL4Rh6BmoQvomNjrPNP7WadF4MX+fx63CbvwQ=;
        b=Met+x6EYN3i2HiRhRCQ+HqkcQnmyjeaCQdYriEBiao+hHQGi51Tuv/JxMjdUCLcgOe
         BxhUcNKzCcVe50HckUcCVRGuJ5m37nFAeeoc/JjUp6Hky4yl0xR+GRBZBG9qGeFQl+mY
         YJyJnnhO1cGAtx4KqK9CA3ICN/hWuPC2NHe3IgM3ysuy4jF7FcseDKslOfhe0Onag9l+
         bc+r1C0gQ36R8S1Bm65m4uh2dhjE4pdAtAeMNuygpG7Iw56PZ150JslnMTllqokPFUWH
         49hFf4ZGEht3X3IJ8ZX4bQz6TkyiMJls2jbUhV0wb2fdmqtYZVNDqelsfYtdshnOG7Nn
         kidA==
X-Gm-Message-State: AOJu0Yyj8qClvrl83zKjndCCBwva1la+uETwnkOJwEjOmN/3wyfGmedc
	1HgqEpio/qFO/aKn2CfJniCBLA==
X-Google-Smtp-Source: AGHT+IHo8qyIK+a7xAlqBDFbhHitNbdyhcjGou5e7sEK1zHUFcXdJWS5bgBXVVX5Sw11ZixDo6r/6Q==
X-Received: by 2002:a05:6a20:160a:b0:18f:97c:9778 with SMTP id l10-20020a056a20160a00b0018f097c9778mr7394313pzj.96.1701768494761;
        Tue, 05 Dec 2023 01:28:14 -0800 (PST)
Received: from localhost.localdomain ([101.10.93.135])
        by smtp.gmail.com with ESMTPSA id l6-20020a056a00140600b006cdd723bb6fsm8858788pfu.115.2023.12.05.01.28.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Dec 2023 01:28:14 -0800 (PST)
From: Jerry Shih <jerry.shih@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	conor.dooley@microchip.com,
	ebiggers@kernel.org,
	ardb@kernel.org,
	conor@kernel.org
Cc: heiko@sntech.de,
	phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: [PATCH v3 01/12] RISC-V: add helper function to read the vector VLEN
Date: Tue,  5 Dec 2023 17:27:50 +0800
Message-Id: <20231205092801.1335-2-jerry.shih@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20231205092801.1335-1-jerry.shih@sifive.com>
References: <20231205092801.1335-1-jerry.shih@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_012816_214392_725FC099 
X-CRM114-Status: GOOD (  11.36  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

VLEN describes the length of each vector register and some instructions
need specific minimal VLENs to work correctly.

The vector code already includes a variable riscv_v_vsize that contains
the value of "32 vector registers with vlenb length" that gets filled
during boot. vlenb is the value contained in the CSR_VLENB register and
the value represents "VLEN / 8".

So add riscv_vector_vlen() to return the actual VLEN value for in-kernel
users when they need to check the available VLEN.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Reviewed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Jerry Shih <jerry.shih@sifive.com>
---
 arch/riscv/include/asm/vector.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 9fb2dea66abd..1fd3e5510b64 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -244,4 +244,15 @@ void kernel_vector_allow_preemption(void);
 #define kernel_vector_allow_preemption()	do {} while (0)
 #endif
 
+/*
+ * Return the implementation's vlen value.
+ *
+ * riscv_v_vsize contains the value of "32 vector registers with vlenb length"
+ * so rebuild the vlen value in bits from it.
+ */
+static inline int riscv_vector_vlen(void)
+{
+	return riscv_v_vsize / 32 * 8;
+}
+
 #endif /* ! __ASM_RISCV_VECTOR_H */
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
