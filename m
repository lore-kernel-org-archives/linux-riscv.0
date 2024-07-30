Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97500C3DA61
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 07:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JqgJbqOYR1XQXk8LWOLPOkTdzEGNXuTLICXGq7wxhmM=; b=RIMXaWIFICo29W
	yW6cPYca0NR42qDsrRzRxTnZfFCWLTifp4Vy7INdX4xwdR0lqw3L89AT6Z6IaXdw46lKk00QOdbum
	g7nKpv0O/+NcxdGFLL8FAX2GFjlhdZYkzAmHIYSKbHuocrWv1Gb3UOcE0UKpBb5X6WuB86URHQ/d2
	l5d1t6ZaSAbSMW7Ca1FQYi1ObZ/X8mMtIsz9Y9IW+I3YRJkzZ2UatB/ffaFHrfU9tVHvJVFnoAUfS
	JvOqR2U32+PUjkuOf+fgCRHwlq8Lrkhg4ccUI0f/JEIVfMRdAtXhXW8auCSTOpraOGiC2c7rBXfmi
	9vPTtXfC/ba+kvUJ+O+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhRw-0000000E3gE-3trQ;
	Tue, 30 Jul 2024 07:39:12 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhRu-0000000E3f9-1KHp
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 07:39:11 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-70eb73a9f14so3137007b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jul 2024 00:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1722325148; x=1722929948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QP1XN4iprj3icwbvU4/FH41Zbmx8QK5aEtDHq89vJ9w=;
        b=BPbketEEEJ7s9WzaB3IEfJJVWf4BphrpJWJYab5lUB8Y/dhp2DV7C8pSy4360UVqdI
         ANr+1jPJoe5BHx2opSvL8Oee3ZfvZgaon00+oyvFE2ZX0YINBbBgH14X06g9R9PTuvbK
         mpM2OJwBxz1UVMmoNhNpbzEf0BSFWEJStirFlR0oWNL1hxVi/jzAhqPTI2buRy6slg9k
         IKQ/Pp2+03mBldhENdIMQn/Ej4HUw3Q+jAjMUvU6785wX1ypX/Ouw0Q0wko5sQbsbYNW
         S8f13hFNPvF7qaIw8bh4aOTNUgX/2OiXH/zB5g3vHHV33ovK7h2+hqWqlAsy+VfJ5IAt
         dZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722325148; x=1722929948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QP1XN4iprj3icwbvU4/FH41Zbmx8QK5aEtDHq89vJ9w=;
        b=Bl/Ee3j2RY2lnvdv/5kUpQEAHYSzdvcTJ9ChBEAb+mZ6ZILlsEEx0AVxzOGLJOOQHl
         cY9UrUymnFvmWGkUN6XT6BWQ24ERWAnUjKFhxy+Hya6xpAJ6eIqjDoUxm+jWJYHxb4HS
         TlMLXkkoRB5K0EshHbYMHX8O8+LopoRlKg47QcZUFK3wKin4KIi0AdKhcocwedyYn6rV
         1dzo/4YiXpxu7vd+p7Lusf+7RjhNCQwV7Zbl/vyX0zuAzrzgAK757c3yawuh4Oa2HW/o
         QZDx/3tOPpq6cWJcXYYuyt43Du9QxvJZKyWj9T7gUkXhgToByXj/WAAVhYqwjZmBlzTY
         QENg==
X-Gm-Message-State: AOJu0YxPFihKIpYR3p5an60ghgimjSpjSpvrkrMcQ28SKcyBVvMH7xT1
	ptH5JJoNjoSUXd+q6NHjfbiMxe6xW9D/gFO2n8S8SonLj/fApmdJMZouVDuxg4juDOQ67xf2pQa
	N08fjzIZqo0WVwlo5b3MwBG7SCwk95K46jw6g2nBSHpW8r+2qXCxVYfyoq5rc/mPivaVMUP1tqG
	w5Ii3dEmY86CtuBZnWcBiw5eXJ0Zjau5rjdBoiTCx9Q07L7/WUJg==
X-Google-Smtp-Source: AGHT+IHLJQwHRtqwR9dMufgaXdf38e3JYPtBd+dt8PnTiT8EnmdQbXMHl4rD0jHLfEFmzIkijxurEw==
X-Received: by 2002:a05:6a21:398b:b0:1c4:a531:bafd with SMTP id adf61e73a8af0-1c4a531bbb1mr13694841637.18.1722325148297;
        Tue, 30 Jul 2024 00:39:08 -0700 (PDT)
Received: from archlinux.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f884cfd0sm8449548a12.56.2024.07.30.00.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 00:39:07 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	debug@rivosinc.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH] riscv: fix isa validation for virtual [ms]envcfg extension
Date: Tue, 30 Jul 2024 15:38:45 +0800
Message-ID: <20240730073847.1999420-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_003910_400536_C518B785 
X-CRM114-Status: GOOD (  13.95  )
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

The exntension RISCV_ISA_EXT_XLINUXENVCFG was accidentally turned off
after introducing ISA validation. The reason is that this extension is
not in the riscv_isa_ext[] list, causing riscv_get_isa_ext_data() fail
to find a corresponding riscv_isa_ext_data pointer. As a result, the
kernel skipped setting resolved_isa bitmask. To fix this, we proceed
with the bit information obtained from source_isa bitmask. This means
that the bit in resolved_isa is set unconditionally, regardless of
whether we find an entry from riscv_isa_ext[] list. This should be safe
as the kernel already parse isa string before writing into source_isa.

Fixes: 625034abd52a ("riscv: add ISA extensions validation callback")
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/kernel/cpufeature.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 8f20607adb40..3f91a1f39a50 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -432,10 +432,7 @@ static void __init riscv_resolve_isa(unsigned long *source_isa,
 		bitmap_copy(prev_resolved_isa, resolved_isa, RISCV_ISA_EXT_MAX);
 		for_each_set_bit(bit, source_isa, RISCV_ISA_EXT_MAX) {
 			ext = riscv_get_isa_ext_data(bit);
-			if (!ext)
-				continue;
-
-			if (ext->validate) {
+			if (ext && ext->validate) {
 				ret = ext->validate(ext, resolved_isa);
 				if (ret == -EPROBE_DEFER) {
 					loop = true;
@@ -447,13 +444,13 @@ static void __init riscv_resolve_isa(unsigned long *source_isa,
 				}
 			}
 
-			set_bit(ext->id, resolved_isa);
+			set_bit(bit, resolved_isa);
 			/* No need to keep it in source isa now that it is enabled */
-			clear_bit(ext->id, source_isa);
+			clear_bit(bit, source_isa);
 
 			/* Single letter extensions get set in hwcap */
-			if (ext->id < RISCV_ISA_EXT_BASE)
-				*this_hwcap |= isa2hwcap[ext->id];
+			if (bit < RISCV_ISA_EXT_BASE)
+				*this_hwcap |= isa2hwcap[bit];
 		}
 	} while (loop && memcmp(prev_resolved_isa, resolved_isa, sizeof(prev_resolved_isa)));
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
