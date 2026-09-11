Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474A4C88E59
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 18:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1dP01iI83aJJdfQwBPDq6bdAaNKKaeGBPYxxS3uBuI=; b=pwUgAas0/aVzP3
	NT3EhrtePGkWkPtgyCMVUAuR+AnnqPbm2F3hZDm5Uwb2Sj3vFUbCbvbyb98foAcQNU0hBL4DNi5Xf
	/JRXD94sT7q68pqdTo5BNjOKOkcnYjM2JDqQnH4lx2TZwRQ3LQkcOMFrBctBoIBaWFGBFUsVygzLe
	sXELEnKrxNxpVil4ZJ2ftua+Kw3ZA5pY7dPygLv7B8MJO5WtiXq+pXHS4u2BF7XkI/bzEGKzAxiTh
	H23g3GzmZu0iqF119xcn1XwmuU7X2mDsLSZ2z6Q2gdCnipIDG16avl/azAEaBVCQkZIHEl39GtyXS
	Ku7IiBsUSzfe2rSDpTFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55v2-0000000HQrc-0QH2;
	Fri, 11 Sep 2026 18:24:12 +0000
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55uy-0000000HQq9-3ucM
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 18:24:10 +0000
Received: by mail-yx2-x11.google.com with SMTP id 956f58d0204a3-66e4ab201ecso63389d50.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 11:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789151048; x=1789755848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNAZ6Z0dPerMj5++O2o7jbs6PZlZefWFkIS6t8ySLOU=;
        b=XBOp0007r37rd01n8a3wOpM5oyMPa4fLyOr8bT6QGQ9X1G84rrmk6fWtjSxbRsAlcn
         Hs8S9QdxncULc/nw65HK6eEBizrQ9BKH1yYWXHMbW5KrIEsX4vhdRnp6rXEvyhvt/T6V
         TIAKmmiF1mG3NGA5IdcbRA6Yj8DW6PUCBDFSyHUnY+dW5wK/JJEd9XhI2Xz7ycIYXjab
         A7qBlLlgw+1+JceJcZvX55BICKoAy1ZiuTYvnsKtwcEiJ1fmsPYLCVcvvvWuDA28y54B
         sV7Q99kWj0AGKfPV18RY5qfVWuPgncvbzeKlGumqSoz/KNdKruhU/bKmwDH+7TVm8OFk
         gqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789151048; x=1789755848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aNAZ6Z0dPerMj5++O2o7jbs6PZlZefWFkIS6t8ySLOU=;
        b=lfvqXHDG+JndSNtYDYiLOFtXeAtzA3kQCNRCCBBm4E6a4PxnCY8ppeM88Czn1J4p0N
         hNKP9eu5m2jf7DvM606mD3WRZMK6GEtwjt7ec5iqHeIaafqBmFIlqwaQ9oHVsXGwibnI
         E3UDyIQl+IxyuHU/0F2m0s23JHPwYFXwt1yRGVHNfrJGo6SKz4jKCBUirIb2RQn7EceW
         T3P/vhKCeJt8epTBuiZamzWBNLh7IdJjieTPuOVQJsTqfuZCPD4urJ6K3srrZ9Sp7oqw
         Udc3+gnqmgEyerBzHvR8w475LjjiX2Y/MZK9bXTC7f0BGpq+duqsl6ImPo8+VSLTH/1m
         eXdg==
X-Forwarded-Encrypted: i=1; AKwUvBw/nHPl2ksyFn0pmyZbzziFDiL9eV0dDwezu0ign33NWFJoH8X0wzPIXYUN5Fd9sbOICpSPeWkBVj5+kA==@lists.infradead.org
X-Gm-Message-State: AFuF++kEHaY2coR6P2MSFl2Oh/QzBN26c20tYs4VGPl3kieHHSm4Q2PJ
	4QgOjA0ktaMBHzpLK9BzXeL6zW3/r6Z8MrzqmiWqHN52XjL1+A40mT7wFprQczHAbfA=
X-Gm-Gg: AYBFou30JTCR2o5Tls2yW4HDEzwR3OjWiJKU0PH1PAvbLj9TaDkoZjkWsUBZ1nXZANp
	yD5QHZd4Zadj4nNPohK7kQRLm7TMjhT4NGs4Z6MzCJ5x/kKN+ZBJBSKb6FV8MDv2kR4pGdxCn4p
	an/i2r/hG7CKlLeU9DlFuizV1OJVkuOKnqefH3LeOxrbNJsv2xzwDyWmzaYH1xANTKwKkGF+fWz
	pAPADeMtOXDol6LLls+Ce/KV/uW0APVvGyulJ1yq4hKA541Baf4uJNv3PyjXU1eQvo96nWD9Dl2
	3paDNM8y+SWdDJDZ/97p2tkl9iEX/oPdsdKTcB5zamN9Pcg/5pEFU6EPdMvW7NnCRavh755unEc
	w22gyAjMw9Qr3jFPHLmR2qkXxsnJXtyuRChLTgoR5DST1gVlZTwPTOgjvnrVaTO2Y9ONyxoU+M6
	q+0qpt7AV5jJWZPdp3L6VWu9Nerngig4/TletzTQnT3CtIYt8duovgq6Yn3fbxsH3UbHXamJ5OT
	rkCY61gVbHpqS7pyg+h1YfjbRpSdqJU+L/HwW1stuEWf8z4sl00Q2TuvQLtxMIXtvaz7aZIcOJz
	jIooDT13iejvsVLf1Q==
X-Received: by 2002:a05:690e:1186:b0:671:194c:fdb0 with SMTP id 956f58d0204a3-671248f418bmr1890478d50.45.1789151047735;
        Fri, 11 Sep 2026 11:24:07 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-671259a30b1sm1385517d50.0.2026.09.11.11.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 11:24:07 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com
Subject: [PATCH v1 1/2] riscv: introduce assembly version of jump table
Date: Fri, 11 Sep 2026 13:23:59 -0500
Message-ID: <20260911182402.1434257-2-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911182402.1434257-1-tchiu@tenstorrent.com>
References: <20260911182402.1434257-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_112409_598640_2DA62E30 
X-CRM114-Status: UNSURE (   9.25  )
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

This is the introductary patch for us to call the user copy that
supports fast unaligned access after the runtime detection.

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
 arch/riscv/include/asm/jump_label.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
index 3ab5f2e3212b..d75961ed3324 100644
--- a/arch/riscv/include/asm/jump_label.h
+++ b/arch/riscv/include/asm/jump_label.h
@@ -65,6 +65,32 @@ static __always_inline bool arch_static_branch_jump(struct static_key * const ke
 label:
 	return true;
 }
+#else
+#include <asm/asm.h>
+
+#define JUMP_TABLE_ENTRY(key, label)			\
+	.pushsection	__jump_table, "aw";		\
+	.align		RISCV_LGPTR;			\
+	.long		1b - ., label - .;		\
+	RISCV_PTR	key - .;			\
+	.popsection
+
+#define ARCH_STATIC_BRANCH_ASM(key, label)		\
+	.align		2;				\
+	.option push;					\
+	.option norelax;				\
+	.option norvc;					\
+1:	nop;						\
+	.option pop;					\
+	JUMP_TABLE_ENTRY(key, label)
 
+#define ARCH_STATIC_BRANCH_JUMP_ASM(key, label)		\
+	.align		2;				\
+	.option push;					\
+	.option norelax;				\
+	.option norvc;					\
+1:	j		label;				\
+	.option pop;					\
+	JUMP_TABLE_ENTRY(key, label)
 #endif  /* __ASSEMBLER__ */
 #endif	/* __ASM_JUMP_LABEL_H */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
