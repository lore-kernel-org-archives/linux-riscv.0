Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D66C021A0
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 08:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wD1NudOYemotJ+OI6FOep+qGDBrSH38+MMXjHLmLa1s=; b=BtbRAhFyx5kEbl
	dUTnxCRs/he09muroSniO8PhIyGrSzVyABpJ+UkS/b8R+FdAehTIHgHZbeR1qRD6XCe1MumUKXqO8
	yJo/Zs1lYPxvSJxNvE4E1T44IXZ2PJH+SekqiCZRWlq+kFjiNA5zrC7IEUke9aPi3+0lqymzC5xLe
	Kmhkuc6sd+pMVbKXPXvzgPKvvQVN4O07EZTX3Fqjop1pbcUsoplFveNd6+lK6o9FW18V6oFnMjgtX
	MF5IzYq7KG3rd10jRVQ1NkKcjhAYjTMqrfycwExElfmNQRcn2Btl+dXqImLbF6dbZ0s3cjxeJuPLu
	H7oyT0pAuKLYIPtcbhTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwkb-00000003nNM-14KE;
	Mon, 17 Feb 2025 08:45:13 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwkY-00000003nL9-0oxu
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 08:45:11 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43967004304so17725955e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Feb 2025 00:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739781908; x=1740386708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+GPsKALm7Yq13goem1fMBJYo69c+TVWg7YcZfawoJnY=;
        b=VxNRQfshyvf2wXPRJRxcQpHAObAci1U9WiG/Pfx6DvkgSjbl6qPAeBQyOrvka0O7vz
         C/d8slZ6i2BsVVkUqjDgczQ40Dp//kuBc+bx7XxLSrXwJzlUEzHv57yGQrJlo0LLwgEV
         pQWX8GmavRCvT5O7M4lnVGWDgWFIU3TXbRj/K2tuvkQZZZ4X0zdt/24T0gW4fy7/Tyuc
         QH6U45CoEkCRt182k2LZ/42nhf31nTPi0tSyi8p5rQHp3UjwVi9/BzULB4+H9j8cxpof
         0mJXBn1CgDloIFCUDj9VEwTPQ4U+yO7Ec9vedpWotI32q2C6cYd2WTO0G9tJVq89zlbi
         b5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739781908; x=1740386708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+GPsKALm7Yq13goem1fMBJYo69c+TVWg7YcZfawoJnY=;
        b=QL6HnM06uqJMctJmq7GWDnYEFG4kTX8FNz8CCtPz0rN8aoL69bTf7EviPPGv6Q68T/
         sHPw1U3MJc3H0BXqkx8OwBsbWRikvBjpdfmbZAQ7+iC3TEJlEhLS7Itq3B89WuJS4Yfz
         u4YSLs3wrKVfsHzjbQlKnogLixfNSVnuWdtGFxuOWDLdtbIvuHk6hHrl4bfOl2gRnRkG
         El01HY3hMVyQF7MPYX1u+KwBitDLGozpgUJhBmR85YP70qna5O8mw++KKWRcdKi6020e
         tYFi7MPFI2/mVSvThGaLfkcJegnyS0h8SJ0OiqNSWzYf24Jz1Op/DQ7/KArjUIbA8DW7
         mOyw==
X-Forwarded-Encrypted: i=1; AJvYcCVcK4j5jspYRTLEiKsQDEwB+TM3hSbfi5t9ew9LwyCGQ0MapGL9LFa53oggT1UEiil1DB4PSOcsqrCcfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YysgcMQ5qT2cA8XmnMcAQBv+kYsxO0mK6e0NxogiHGKnd639ORU
	SfjAPvqjgoz5S4JwZQ5pOGQn9KLiTEt6sVKqsyBpkVEJnTuURckN0J/Je76X3ExqLTgqyknHRRs
	i
X-Gm-Gg: ASbGncsJazt+eShaXf/iZTf9arEz1z6yXmKmcliM22lPsJOU780pZfoNHQtvwNTplyu
	q1k/botnxsMQNapXL9RsF6TRoxCgV9yBWOGc4egqBdNdIBPMzI9/JbRVU7yH1sw9lrEnJiAlVqC
	N0hSbVVbCaNj1Sf6T8MTHZjRl9KmgCg2A3IlfGq+EjNjxRcMSKkmsGqQm86XPn07yx2c8qoK8rg
	DJTujvllySBQPwnl4l5PIO6w1nI8bmvBG+GRIpXZfx5FX7e5Nm5ly+oa4XaDQ8mPxnpFIPTYf+g
	CRE=
X-Google-Smtp-Source: AGHT+IHp9BY0m/Q6kFaedN0UGWMC/ZwJ9KU/eUOLSaZCeTXH+n6PgSUFQ/UOHrMVcwrNPsAg/8wITQ==
X-Received: by 2002:a5d:47cf:0:b0:38f:38eb:fcff with SMTP id ffacd0b85a97d-38f38ebfe58mr5923816f8f.29.1739781908113;
        Mon, 17 Feb 2025 00:45:08 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f771dsm11482660f8f.81.2025.02.17.00.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:45:07 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cleger@rivosinc.com
Subject: [PATCH 0/5] riscv: KVM: Fix a few SBI issues
Date: Mon, 17 Feb 2025 09:45:07 +0100
Message-ID: <20250217084506.18763-7-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_004510_238118_FB1BC616 
X-CRM114-Status: UNSURE (   5.50  )
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

Fix issues found with kvm-unit-tests[1], which is currently focused
on SBI.

[1] https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv/sbi

Andrew Jones (5):
  riscv: KVM: Fix hart suspend status check
  riscv: KVM: Fix hart suspend_type use
  riscv: KVM: Fix SBI IPI error generation
  riscv: KVM: Fix SBI TIME error generation
  riscv: KVM: Fix SBI sleep_type use

 arch/riscv/kvm/vcpu_sbi_hsm.c     | 11 ++++++-----
 arch/riscv/kvm/vcpu_sbi_replace.c | 15 ++++++++++++---
 arch/riscv/kvm/vcpu_sbi_system.c  |  3 ++-
 3 files changed, 20 insertions(+), 9 deletions(-)

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
