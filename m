Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB99C3ABCB
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 12:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QMZEOOTWBB0N3x2a91IeZVFPCk81cyidDVbihw+bRHY=; b=Y4si1YcK+sfczB
	1nn+yPEwUi6Lq3lUjtInfZKyJZOot0j5ExgcbhoCSstYPKuVsEcb5d4oNoqFPIZghna4xo+OgH1UC
	Nd1lfUHPnNhc9QHRvoDzOsfbYrm9wwXXzwvKpq5YsGXNIFQJbNLHQFh7YwcWxmUQ5PH9o6sU2AQda
	uXwN8G7ohPe98daBCdEGLVZ4M0+oCwcUkB4ScGDOD1iACn74tZ4fxTjRCptC8L07codvp5vbbZIYh
	1727Ea93mIYcfWmVFvB2fUQa+idrRQrqaPwZbKlYF58w1HEvMr+6xpaud2pXAY0QmoFaqxGic4gYP
	Qu7Bda7IWTUaEkKLvb/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0lY-00000000gHi-0gqT;
	Thu, 08 May 2025 12:54:20 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0jN-00000000foU-39y5
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 12:52:07 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a1d8c0966fso78459f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 05:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746708724; x=1747313524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KdVvIx+2NUw1S7/yaZTlAzKdxyvipEaCZdSyfI4dcfc=;
        b=QMmFlNNWcQrMRnk96P38mRBKeqA67/GLciAgX1Onp7H6YZ8WWbX2uYpiIzNXNCoWiY
         cVZkv4otquRe9/ar1mERoVX4xoBGT29SO4iLw4ahQhp0dVIJwD0SxK/7oKQpXHEWeykE
         NlAomGWYMljQkpPt2dxSOBwwN5Y4QtFM0oknFjKY+PDtGQ5qyoFppKuUpFBJp+CzCUbo
         eZJgRmwgp4hQtSxHHqAAvF+J8+i4ENdvxrVYO3Fhdj+GNtyr5aqTDlRKK6nmZuPde00T
         vP/VGtlnsYiiyXbou9Zz7iR0VRsy7zBTN1P6cDrx1xJn3MxF3LZ+/BwX45oriTiJSTIk
         IxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746708724; x=1747313524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdVvIx+2NUw1S7/yaZTlAzKdxyvipEaCZdSyfI4dcfc=;
        b=FW/6tkk9jhLLwaw6S8GRPsw0rUgLGdSIe5jmwbyWxQ7wXEhvT2pMcFs8sRGYsU2g9a
         vWed7IaOKIHGrgQz85tzvlneEruJS5kJEKEoELi+U/2VnUTKwaiC5ysW3cxL/WtG4yBK
         d+plJJqYF3/U+3HJ3L+LvJMYAa1eU+1yK8yYW+sECL6YB7Hq/zdfhuIvX3JOA8pdKsCN
         fPO8VLxkb/oHwnrLYO2fN3wvmhrFOFL8C6rK9WTT1cBeQGRyPuh7A05eZru5gsKTlfrQ
         zd56vIlutGvPq/IQPrGQMVVhyOOuGyr6VEPny7zmounRWB5/i717Pb8BSoRHUl7kxF9m
         wTOw==
X-Forwarded-Encrypted: i=1; AJvYcCUkU945vwmXc09BY2QB3f7Bm53CYtVQdApDlFbnYEhL6izLaLPUQIXDPJsqmxMMjt7/MkcK6TSGtacAkg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yypl4iDwH46jaeTvYvyF2f+cBdCXnDwHcjXW7aqZ5Cl2XvN1udl
	J3LhX2D+2p8fZTitTfD8gPw9FfpkGJIwH0y8HnZ2m1hUX7cmTl4GZSAW8BMrspw=
X-Gm-Gg: ASbGncvMOu+PF3c9foaEhlWSpLYUNVq5fHKPLZkVDNcbHCsS5sWur9l7Yqu/wEJfMrY
	vDyzyC+WVWlQ9dfKgl7OhIOB4A1AT9nZmZ+a6CtTwbI+tIepwqZ7o6hh3dYZFXfQr2gUi+RSW3b
	UR+aufMfhbIXNks+EmQLWL76SwD9KkITOs0eUnpxz093U0JdhKHrlW5ELGhzNY/pZgkipzmVg3Q
	k5QObd6zbTeEnhI2+A6va2RNqQIHTaUqtWWkW2oERzazVYIavAjtStUi+CdvzzhS1Jwt0xRa42R
	pBbr1fDXI0Bi8KYmsGPSsZmrfzRiNY8mkPv8/dAKprcSNXAFn6Y=
X-Google-Smtp-Source: AGHT+IGVKMnGQaI/zbUmSTKxGatnQCUnEpGyEkFy3V8+2H2zyIaYBb7YrCU27l4UnVxFxrTx/IplyA==
X-Received: by 2002:adf:f18f:0:b0:3a0:aeba:47d8 with SMTP id ffacd0b85a97d-3a0b994eb78mr2407869f8f.29.1746708724035;
        Thu, 08 May 2025 05:52:04 -0700 (PDT)
Received: from alex-rivos.lan ([2001:861:3382:ef90:e3eb:2939:f761:f7f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b6c9915csm4486425f8f.29.2025.05.08.05.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 05:52:03 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 0/3] Move duplicated instructions macros into asm/insn.h
Date: Thu,  8 May 2025 14:51:59 +0200
Message-Id: <20250508125202.108613-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_055205_994182_A4919F98 
X-CRM114-Status: UNSURE (   7.16  )
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

VGhlIGluc3RydWN0aW9ucyBwYXJzaW5nIG1hY3JvcyB3ZXJlIGR1cGxpY2F0ZWQgYW5kIG9uZSBv
ZiB0aGVtIGhhZCBkaWZmZXJlbnQKaW1wbGVtZW50YXRpb25zLCB3aGljaCBpcyBlcnJvciBwcm9u
ZS4KClNvIGxldCdzIGNvbnNvbGlkYXRlIHRob3NlIG1hY3JvcyBpbiBhc20vaW5zbi5oLgoKdjE6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUwNDIyMDgyNTQ1LjQ1MDQ1
My0xLWFsZXhnaGl0aUByaXZvc2luYy5jb20vCnYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1yaXNjdi8yMDI1MDUwODA4MjIxNS44ODY1OC0xLWFsZXhnaGl0aUByaXZvc2luYy5jb20v
CgpDaGFuZ2VzIGluIHYzOgotIEZpeCBwYXRjaCAyIHdoaWNoIGNhdXNlZCBidWlsZCBmYWlsdXJl
cyAobGludXggcmlzY3YgYm90KSwgYnV0IHRoZQogIHBhdGNoc2V0IGlzIGV4YWN0bHkgdGhlIHNh
bWUgYXMgdjIKCkNoYW5nZXMgaW4gdjI6Ci0gUmViYXNlIG9uIHRvcCBvZiA2LjE1LXJjNQotIEFk
ZCBSQiB0YWdzCi0gRGVmaW5lIFJWX1goKSB1c2luZyBSVl9YX21hc2soKSAoQ2zDqW1lbnQpCi0g
UmVtb3ZlIHVudXNlZCBkZWZpbmVzIChDbMOpbWVudCkKLSBGaXggdGFidWxhdGlvbnMgKERyZXcp
CgpBbGV4YW5kcmUgR2hpdGkgKDMpOgogIHJpc2N2OiBGaXggdHlwbyBFWFJBQ1QgLT4gRVhUUkFD
VAogIHJpc2N2OiBTdHJlbmd0aGVuIGR1cGxpY2F0ZSBhbmQgaW5jb25zaXN0ZW50IGRlZmluaXRp
b24gb2YgUlZfWCgpCiAgcmlzY3Y6IE1vdmUgYWxsIGR1cGxpY2F0ZSBpbnNuIHBhcnNpbmcgbWFj
cm9zIGludG8gYXNtL2luc24uaAoKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi5oICAgICAg
ICB8IDE5OSArKysrKysrKysrKysrKysrKysrKysrKystLS0KIGFyY2gvcmlzY3Yva2VybmVsL2Vs
Zl9rZXhlYy5jICAgICAgICB8ICAgMiArLQogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxp
Z25lZC5jIHwgMTM3ICstLS0tLS0tLS0tLS0tLS0tLQogYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9y
LmMgICAgICAgICAgIHwgICAyICstCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X2luc24uYyAgICAgICAg
ICAgfCAxMjggKy0tLS0tLS0tLS0tLS0tLS0KIDUgZmlsZXMgY2hhbmdlZCwgMTgxIGluc2VydGlv
bnMoKyksIDI4NyBkZWxldGlvbnMoLSkKCi0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
