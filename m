Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE2BD41C39
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 11:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7jb5o3fzzCv7ZUmOO0dW8cJMxPcYdYcbZ/Y10serq8M=; b=P8fkZB8uUbnP1P
	30i2H3ORJPWwu9uPRIyvXQgdWYNTFvaFbwSM6wTyJaqLl4Pgihw1ZGtY/3k239Vn+PU4yRibPyL+Y
	yk5N9f4tYnT9tQY4vD5khzGrYnyy95xU/dbwpU/3+KWGz5SD5gWcBbcC+QKJRQviDSFbsD9GMfBea
	KdGWQwqDACQHGUitQIghSK9xiuscrcocaNKLDtNfJSKW7V9HLxkd3eeIy5Qs5QEZ9SHWBUz7R7ua0
	e9ECQQdGcSrNab+SDUZi+1IpH7FdUaZgbcDq9Q0ZvEOyh8O4LSYv24o5skOea04hdo7U4FrhKtb1e
	fHUQXFOwbM7XosTC/Vbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBpI-00000006dEW-2t6E;
	Wed, 13 Nov 2024 11:46:24 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBApu-00000006U47-3SG2
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 10:43:00 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7240fa50694so5286256b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 02:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731494577; x=1732099377; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2LtsH8ouhCA6XRx1lBCvdM4CP4gAZ0q9wxfJhxDlXCk=;
        b=Tvj1QfLvc9KqZxJpNENXPBF7YfHgH61s8QRkFAt/V7TY00Ck7RQd6TZq9Vv7rM/5cN
         0xg0JlHUNWR+Yk+aHsf0y9xHgf3mGiTOGGwtPVd3+/VWsAvKIB4BX7uX1UL21vz/qSuT
         IVkuNYh1PM82CRdhXHbei1MNx9cReRAbbt/QDi05YC6TT7ekU4dyUEMCbRznHt0bN99G
         HSx2gIvGUiABDdProRIurNy8+7JEmoptrOuk9lQHTbVQ2xOgqGEZc5FDBgGMHrEECD7o
         YrTvUNYp26sNUiGpfrpCvyfEh4Ne9iRyW2cLg+2c4YnySwy8NCrTV7gsuSPLz8XSzp/4
         sqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731494577; x=1732099377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LtsH8ouhCA6XRx1lBCvdM4CP4gAZ0q9wxfJhxDlXCk=;
        b=PLjX4w0z2KjV6NGZRe9wBp6oukRFPf9A8stkCDSkFhEYSQ+EGGPrUap6lTvqJdlbMd
         UUU8irgIomtiLgJzDsxYNEWlSf4W25qBA+L5PBr7eghlNxba7jMAJyyWPFTVrEg/QWd5
         GitTerSRA6/GUR8vgPYUI8XGvTNI5M29nGBpCS58WrJKkR1J3oYjVzG+xKYFH/P1gp5y
         lFjuSKNxkKN7C+Y1acCHl0M5GIdu+2Btb1QM1/a3PADHP4nNHXzafE98djgM5Ix9JDXr
         78oMbhg/fY9O+XCCsfNEtLSmboP46JCTYznwM4jKAKaPXRtpQk5CtpfctqhBQCGqi+/D
         aGGA==
X-Forwarded-Encrypted: i=1; AJvYcCUpfKegBtn004tt8R3sShr2ODD45tdC8byHsY8zPvf5jwAOwXVuz3Li3f+GCAJSrYnpFsyQVlUmitmMLA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9xNrUokPiXL07/OZSCVNsli50AARhBXuwizeB+EzE93YGNw3+
	nTFkpL8zHNsbX+w4Nk4keX4UMU64XGEZ0w5PqIpYqOWwPhEKLfCM
X-Google-Smtp-Source: AGHT+IGAXS5Vws6orJFEKQt0sk5vBw4N/CstBrYPj0GsMSlJ6rVTcsR2601FcrF86bchDcrOPpb7+A==
X-Received: by 2002:a05:6a20:7f8e:b0:1db:d84f:c7d8 with SMTP id adf61e73a8af0-1dc70338e7dmr3155559637.2.1731494576954;
        Wed, 13 Nov 2024 02:42:56 -0800 (PST)
Received: from localhost.localdomain ([45.137.180.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e5a9ebsm108031105ad.198.2024.11.13.02.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 02:42:56 -0800 (PST)
From: Zhihang Shao <zhihang.shao.iscas@gmail.com>
To: herbert@gondor.apana.org.au
Cc: davem@davemloft.net,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	akpm@linux-foundation.org,
	linux-crypto@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] RISC-V CRC-T10DIF optimization with zbc extension and CRC-T10DIF selftest
Date: Wed, 13 Nov 2024 10:40:34 +0000
Message-Id: <20241113104036.254491-1-zhihang.shao.iscas@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_024258_883434_E01BB64D 
X-CRM114-Status: UNSURE (   7.26  )
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

Compared to other architectures, RISC-V still lacks accerlerated implementations 
for some encryption and checksum algorithms. 
This patchset aims to add optimization for crc-t10dif algorithm with zbc extension.
To verify the correctness and measure performance of the optimization, 
the selftest is also included as part of patchset.

Zhihang Shao (2):
  lib/crct10diftest.c add selftests for crct10dif
  riscv: Optimize crct10dif with zbc extension

 arch/riscv/crypto/Kconfig               |  14 +
 arch/riscv/crypto/Makefile              |   4 +
 arch/riscv/crypto/crct10dif-riscv-zbc.c | 182 +++++++
 lib/Kconfig                             |   9 +
 lib/Makefile                            |   1 +
 lib/crct10diftest.c                     | 687 ++++++++++++++++++++++++
 6 files changed, 897 insertions(+)
 create mode 100644 arch/riscv/crypto/crct10dif-riscv-zbc.c
 create mode 100644 lib/crct10diftest.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
