Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F451C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Dec 2023 15:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2rcxuDh7BuPkmoBaZQSvPL8jQsF6RXuEb0SOKOrvPQM=; b=UV4JPyW/CExG9/
	bBzcBUg57/wl/2ygn2ZojsF+WgnNMx+z54TxL8sVqrVOTqOd4PQRLcGK0MOF/pCWZDf0VI8mPqTXz
	uNI2iRBz/WBcpAAWafYd//dy95GmN8QH+VIbDWve8wx/PuQUrkYKk0BjeS96WZZVOQALNL8xIgyEy
	CdP1sB/JaOLJ0VmG1kOQ7MEdGdLZpSMxVEvODnfYHdgrO38LH+Qq2lqXqM0j/GqrGknHEQJqgztid
	CXtz+8COfDEV5oax2r0Q7sxa7B8g4wSycy8jg2y1y2rtaAb1voXFTJGb4eLlY4qpfcIoat42wzZJT
	/l8jyD3SIke3ryI+zCsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJxjP-004mPv-23;
	Sun, 31 Dec 2023 15:28:03 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJxjJ-004mOg-32
	for linux-riscv@lists.infradead.org;
	Sun, 31 Dec 2023 15:27:59 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-28bcc273833so6780814a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 31 Dec 2023 07:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704036477; x=1704641277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iifngznp+ertIjgLYKgYyodchJA69bCk2AsJZ4z1PYM=;
        b=kJt5t4G79X7IfrKLY0kCrHvGghTFiiPcGdnXutzwhSqTylo9rjYWouFumvLiNhIh49
         22HAjenpLAeyozn9PN84ppAn2JqQmb+rpMgyx7IA+nnRJGnvqnmfRoi2Kk1bBxQL8SZX
         nUUpB+AdjjTEezRB0uEv8CG7mm0h1qCZsIxowY+fJCzjgFBJNEqOgDCAVXjC3+TCpLWL
         jGAtuantTpDnXTd+Dty32w/SL7A8c0fnQxmsjFuhx3A7Ys0BUIs6jb+MK9y1bLApLg7E
         rQ7hasr535xhh9IS1AwV7kbcfRzofscjvnYRbDXwcUBvlGbH3JFn/+HULNZdlQcYEtSu
         xoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704036477; x=1704641277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iifngznp+ertIjgLYKgYyodchJA69bCk2AsJZ4z1PYM=;
        b=iRXA/fxT6lo/Cw5WTKvkZvDUHiOuEUd480vfvxT5kehzSe/HpPY+fwLOgEj3H7GLL7
         3CD+o4iFYrbWedVDlD3o7C/PChB3H3RWhDcYjiO71ZuhA40SshMJwAOZjmbSFGs61c06
         lkn5LRMo6FkpRSKvEwgp3+x8OAUbqN81cdb1GwW+O8NgbZOODf/z7cvmbq8iFsvWfh14
         U820Ulczeh1KFZXP6yIJZmBQ5JX8xgSZaCI6IWPQUe560agxNunGsDhMSwBoVkTEHAbf
         bRWY/RxNDFx1+er+F0Fi5pLpVwrScY/RKx9bnaO6qewCErOYXcnndtj2siXms8OItS7s
         sM4g==
X-Gm-Message-State: AOJu0YzjD6v1YV835s/sxJjl+KK0QPDm/y5Yh1h9H1g6wymkeHLX3eve
	P9jVPYbarjhHDeCkDfhiP0cLtWqugd55yw==
X-Google-Smtp-Source: AGHT+IG2X++FLxOhI7SgAVayiogOLWmlW/65gGZuJtaqh9iKO1jYHAKqb8XHTGyS7hCPlNtJAE2iRw==
X-Received: by 2002:a17:902:684f:b0:1d0:6ffe:9f5 with SMTP id f15-20020a170902684f00b001d06ffe09f5mr5478381pln.83.1704036476827;
        Sun, 31 Dec 2023 07:27:56 -0800 (PST)
Received: from localhost.localdomain ([49.216.222.63])
        by smtp.gmail.com with ESMTPSA id n4-20020a170902e54400b001cc3c521affsm18624430plf.300.2023.12.31.07.27.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 Dec 2023 07:27:56 -0800 (PST)
From: Jerry Shih <jerry.shih@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	conor.dooley@microchip.com,
	ebiggers@kernel.org,
	ardb@kernel.org
Cc: heiko@sntech.de,
	phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: [PATCH v4 01/11] RISC-V: add helper function to read the vector VLEN
Date: Sun, 31 Dec 2023 23:27:33 +0800
Message-Id: <20231231152743.6304-2-jerry.shih@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20231231152743.6304-1-jerry.shih@sifive.com>
References: <20231231152743.6304-1-jerry.shih@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231231_072757_977611_B4B9997E 
X-CRM114-Status: GOOD (  10.67  )
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
index d69844906d51..b04ee0a50315 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -294,4 +294,15 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 
 #endif /* CONFIG_RISCV_ISA_V */
 
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
