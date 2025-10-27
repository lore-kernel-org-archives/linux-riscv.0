Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61891CCF9EA
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 13:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AJQu2Cl8C+AOL/yl0q1eQjAqZbEEy59DkPTXGMVVtkg=; b=Rw/yP3PfR54hSL
	i2Q8Pcvzg7RTO75n0laWFINxPdCMq5X0XiVMEtCUgzWIqDY+g83naYLLmF+CQVqqp0YNFxP9p9D76
	SZCwSBkppEc3qz6Oqr4+n5KjxNlVAD+czm2BayrGl9QP5d9e0u+BZCgt5X34xGwIG3tQDCmFz+558
	ov1LIiu46R+XhVYzfZqQ2u319huDnhRXaN+gEsXHa9BviU8146wMa2eEspQKlSowKSj+SeAy0Wdnw
	u2wH1qH7X05AJLyyAFKXR0JXIohbHdT9U84kQMnow2DB0eCN424upBMjCppjMDvZtvbZTTrpH7yjG
	N9Yxge48JXj/N5v+VXzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNN3-0000000E3iN-2ekQ;
	Mon, 27 Oct 2025 13:34:49 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNN0-0000000E3hL-1HUK
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 13:34:48 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b556284db11so3905549a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 06:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1761572085; x=1762176885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ftlerGiLvsqHMKW12Y2m8WjwJauqRh5+By8P2iMxPlE=;
        b=cEc0k+Kl2wB11eqgo+yFgHSq7GEg2bAlVgbAApV9JnNZa2g4cP1OX1TZZRXTmvJxHj
         Ats1GtNua6DRbYeBoyOXDxO9caJ58CkE6XBFnjKJvvxOgTPi63lVMoF0k1xtPG+ImajG
         Ynvguzhq4o1P5DkIOKJFPow2zm5setgF8uaGVdqSXLp8PClB4ginWKf/DzpwtTv0VXZT
         2JiAtq7e+yjK3UdDLYjzJ9ac5pJutzfQFM2J5nZpfXU3xxguZqFH8vkwp01YCkhSE/+L
         K5yAote37tG/gI1M0uUaEgM4PWVOVYYKuLUIrPWwy+TLOp1FfnF39DNCC5OJkB31CPjI
         +pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761572085; x=1762176885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ftlerGiLvsqHMKW12Y2m8WjwJauqRh5+By8P2iMxPlE=;
        b=B4T0sD5my7tUdo6dAPItKy684rDKwr+7fOHxAh0dDVWUUYA8qUgSSg9YI1zwTC+qn0
         ZyHCooXHcKaCYV2BZnfpwF0wpYXmpNavwdUi8XhN5cEeMpIV0tqyiQQFaaoLZ4D5Udcx
         i1Hban+SihPjszVOqzYHUOLVjv4Nrbrcc+zFyPMTAj4OgqYEmmFwPtLVAkRfWMfm4Ixb
         n+BvLZJY6WCgS0nzu3Awsck/4/qbm5M4VGkuYLoRn5p1Nq+WZKxpOxhozb1B0x6QFoso
         nGOmXn/AmT/Hr5NZXzVzta3JT7EHXJ2NTearvuBSCnIRUpr4dsMHp2SZ8EB/JoeUOl/z
         hwpg==
X-Forwarded-Encrypted: i=1; AJvYcCXvEXu96D2Uf2eya+XkCZ7ku8M21Rfk2KF+JXkTIqQPCPG5YBVLjncVKx13rhHXlO2RZUroS1VnPxoUGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxF+SjgBL/bpa/EO7OZFh8PuH6M7MQPL1mtb1eJPSt2v8bd8xIK
	f9cfYzcemNJHFkmiYRbxX029ryiSv36fR1MlxrBIJvnN+ZzmFa21BsCmUi2CfiX0b/4=
X-Gm-Gg: ASbGncvp4PHVax05nYk1weYoh2mraEdK1VpKWCsY7Pk9WJI5oX+ZMUUk52UZI6pU6hy
	Tn4Bl1vQbJAGGmHYK3pirEZeShkKoRP7FTf6KhPXOOKalodWEGh0qG37caPs7O0Kq4ayrGh9OuL
	GYWNpRUdzNyVmbnn8oe5OBrxzhxMfLruHfZDFHh0yfV/CQF3kZvmKb3pGXor/7pg7epXS6BX6es
	+Ct6CfSEglS+EI6vPVWQlay0TTBYtVWGokl5g6yKu5H7W5NQMFJCFq+CzRNqemWXaAVoXQ2kdtk
	gRJdqoYVXkzMWLfcE+faPE1OtvAmmGkwCudPvFbjLJ8Pztcr0fpGqD93aPNgZRKAyGRS5gSEHDj
	7ZINyJ8I15lB+VYchiB646+SlF9Cr6rIj2BGz7A3rmLehWg/g8Aqzzvbb8bgLPH4E8MVHyuQGDu
	VKT4GLDHsNvQ67Z77m8ys1FMe7SrnQSKLDijhXOzyanfJU
X-Google-Smtp-Source: AGHT+IG6w1KMqpMxHVYtcXLWfWv6qAK46PDDTGlJxfBJd5VbTvHc1tDB2FJNJAj6MmKM6UQUhJNb1w==
X-Received: by 2002:a17:903:19e5:b0:24e:593b:d107 with SMTP id d9443c01a7336-290caf85236mr459702545ad.32.1761572085156;
        Mon, 27 Oct 2025 06:34:45 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d42558sm82144935ad.69.2025.10.27.06.34.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Oct 2025 06:34:44 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	conor@kernel.org,
	cuiyunhui@bytedance.com,
	luxu.kernel@bytedance.com,
	atishp@rivosinc.com,
	cleger@rivosinc.com,
	ajones@ventanamicro.com,
	apatel@ventanamicro.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	songshuaishuai@tinylab.org,
	bjorn@rivosinc.com,
	charlie@rivosinc.com,
	masahiroy@kernel.org,
	valentina.fernandezalanis@microchip.com,
	jassisinghbrar@gmail.com,
	conor.dooley@microchip.com
Subject: [PATCH 0/3] Add NMI Support to RISC-V via SSE
Date: Mon, 27 Oct 2025 21:34:28 +0800
Message-Id: <20251027133431.15321-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_063446_349366_226B8A07 
X-CRM114-Status: UNSURE (   8.98  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

V2UgdGhhbmsgQ2zDqW1lbnQgTMOpZ2VyIChSaXZvcyBJbmMuKSBmb3IgaGlzIGZvdW5kYXRpb25h
bCBTU0UKd29yayAoWzFdKSwgdXBvbiB3aGljaCB0aGlzIHBhdGNoIHNlcmllcyBidWlsZHMuIFRo
aXMgc2VyaWVzIGFkZHMKTk1JIHN1cHBvcnQgdG8gUklTQy1WIHZpYSBTU0UsIHdpdGggdHdvIGtl
eSBmb2N1c2VzOgoxLiBBIFBSIHRvIHRoZSBSSVNDLVYgU0JJIHNwZWMgKFsyXSkgZm9yIHVua25v
d24gTk1JIGhhbmRsaW5nLCB3aXRoCm1hdGNoaW5nIExpbnV4IGtlcm5lbCBjaGFuZ2VzLgoyLiBF
eHRlbmRpbmcgTk1JIHVzYWdlIHRvIGFsbCBzeXN0ZW0gc2NlbmFyaW9zIHdoZXJlIGl0IGJvb3N0
cwpyb2J1c3RuZXNz4oCUZS5nLiwgc3RvcHBpbmcgQ1BVcyBkdXJpbmcgY3Jhc2hlcy4KClsxXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA5MDgxODE3MTcuMTk5NzQ2MS0xLWNsZWdl
ckByaXZvc2luYy5jb20vClsyXSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNj
di1zYmktZG9jL3B1bGwvMjIzCgpZdW5odWkgQ3VpICgzKToKICBkcml2ZXJzOiBmaXJtd2FyZTog
cmlzY3Y6IGFkZCBTU0UgTk1JIHN1cHBvcnQKICByaXNjdjogY3Jhc2g6IG1vdmUgSVBJIGNyYXNo
IGhhbmRsaW5nIGxvZ2ljIHRvIGNyYXNoLmMKICByaXNjdjogY3Jhc2g6IHVzZSBOTUkgdG8gc3Rv
cCB0aGUgQ1BVCgogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgfCAgIDcgKysKIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY3Jhc2guaCAgIHwgIDE3ICsrKysKIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vc2JpLmggICAgIHwgICAyICsKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc21wLmgg
ICAgIHwgIDE0ICsrKwogYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgICAgICAgfCAgIDIgKy0K
IGFyY2gvcmlzY3Yva2VybmVsL2NyYXNoLmMgICAgICAgIHwgMTExICsrKysrKysrKysrKysrKysr
KysrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9zbXAuYyAgICAgICAgICB8ICA5OSArLS0tLS0tLS0t
LS0tLS0tLS0tLQogZHJpdmVycy9maXJtd2FyZS9yaXNjdi9LY29uZmlnICAgfCAgMTAgKysrCiBk
cml2ZXJzL2Zpcm13YXJlL3Jpc2N2L01ha2VmaWxlICB8ICAgMSArCiBkcml2ZXJzL2Zpcm13YXJl
L3Jpc2N2L3NzZV9ubWkuYyB8IDE1MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBp
bmNsdWRlL2xpbnV4L3NzZV9ubWkuaCAgICAgICAgICB8ICAgOCArKwogMTEgZmlsZXMgY2hhbmdl
ZCwgMzIzIGluc2VydGlvbnMoKyksIDk4IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3Jhc2guaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gv
cmlzY3Yva2VybmVsL2NyYXNoLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Zpcm13YXJl
L3Jpc2N2L3NzZV9ubWkuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvc3NlX25t
aS5oCgotLSAKMi4zOS41CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
