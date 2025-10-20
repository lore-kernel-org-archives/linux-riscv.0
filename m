Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FAFCCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 04:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x7P5+ZjyB3bpCz8TAuELRZtEbegA3dXwX9qFB6R6aI8=; b=LE3JamfywWy0ZJ
	vkDYdu0GIwrSQfDNDH2p3Rbo7BnhoKbzOwYKjEwQvxAqcmc465Ax0UVHdHsoopK1nUU5pvZEmMMSg
	zfrDM+zsW8wuqgYDyYc9om5V+7wT317Wto0QD5NVa9AFHRr8kPihF+Ci4m8hAGArKTtPSSbnlhONj
	4715vZuMbAffLhepXMdAdG7SDwF+qcQdUNyj8tBWZw9RuOJwOSxbvRGpPCqas+D6JtmfLtoVHutS8
	lOyxpRYwiEJHvbGNXoq50B3oDCrGJmpEngUX3I9V/nWGgdP5yxyVA0hb/jMv0OEcQbd257ylutG40
	2YqsxeeJb0SS7uUSupjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhWM-0000000BrUP-2f4T;
	Mon, 20 Oct 2025 04:29:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhWL-0000000BrTY-32Dq
	for linux-riscv@bombadil.infradead.org;
	Mon, 20 Oct 2025 04:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=K/wZtJxRjsPgsFT1TZQP06vJqUDEl57iCFv88CuZkP4=; b=VbceOQxb/JafRgGEVO1guBCMOG
	afKtJ+u7sf0FStK7qxsGjXhKcknx/eKfTR4LypzyTRYz/yKf8GaK9G7Op/KMyQ9is90PRZoZaH31j
	FIUcagv22M+ERCHh6heK7kxsQC/FLdAh22NG4XuUxnw9yzzlYn4JjC6DCFGEwJey0bM5Qj0861nlG
	BIfXf3YEM25L60ctl1tWU2FumLOyleeMMDwZAdKcV9+U6AQ82fyEkuU03nvI+C1605QuZ3gTnP4ir
	U+KIfoTp0uyYAJoBZE/JltQ0BD1luA8uEKtTefh5DqWKIEkniNvA2mKdWWJMf/VljSjjjtBkXJRfb
	47mQASYw==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhWI-00000009VR3-36cl
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 04:29:20 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b679450ecb6so2883089a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 19 Oct 2025 21:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934557; x=1761539357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K/wZtJxRjsPgsFT1TZQP06vJqUDEl57iCFv88CuZkP4=;
        b=jg6W5qEqtOdlvN/gpLi39gyCPrjTl5KiS+40Zr6cGdT5Gm3gspQBHSKc9V6y3o+ad4
         YgpR0/9GWOY5hPtT5qenll539l0ugIwi1c+z9rnkyVoihe37vj5eDGKCnPa9CB55k/Uv
         uFPZtXcDx5asHpIFQPHlrjgzGr1HAals10hokA6YeHLlYmKROAewGS7rI28W/1/ZP4PK
         zNfq3RNiifBE2DTqqr5wK/wdGIAdeqaKFs7QZM29RbUUg+ZcYOQop35mmYTvYax2SwHY
         ZHe3Q+Jc2gQAIhy/puk+mZWszI73JUhV76CUB4b0viUoYMXF3am8ElNRkbm7vw4lwxiK
         IZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934557; x=1761539357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/wZtJxRjsPgsFT1TZQP06vJqUDEl57iCFv88CuZkP4=;
        b=WZ2KFm+Y+WzRC86JEQ1Lx/8N9s0h8tIy9oV8UBPw5bb8Z7t+usoH3KkaYRiiw/iOIh
         U8eIEySEUOcl1WfszTWm47Ef3VxYmeFa/Xun2M8i4FiYP6GkOQsYKUNpR3LosSTiucbb
         r4StZd9dxBIo3OwL8dZpYyR3OS/iVyzzXujmiU0ZONNNS6JT2wozB52TyadERzPRYSk+
         nTl4qw+ar6OLZgfze+vCIUZ3FG7U3BGfcPA/0U/ipder76OuErIyRefHYpsG373k52HE
         tWqtgHeEz2FLsANbH/SIU/ICZEUjqEb6ChwQwtS7mf8ai7ebSLulfI112/TRC12itI7B
         NjUA==
X-Forwarded-Encrypted: i=1; AJvYcCU9dYiCdy+FwtSVKPimPtEfdBcSTY14wUz2LTJnOYQ+mGOKrsc6Xm9jtTMHT/JBAYvao9Mi5GioKg3nmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLasKuU34wpWadulekHZMb5GwFrxfJWvoFmOAYxs/ZFT7Us4YB
	rBoeGYucNtCSIju8082OePTRZov3Kr7s6tf5bmuD3YJwWrNaZ1ZlCdzMe5kyM47VREA=
X-Gm-Gg: ASbGncvC3EFHXP0NQiUHummPT6kHQOBlKUZXxqmBvLRA0wqrG5dtwGLbjDyJT0sKb2c
	QDRskTx6ruZXHdbSfJVrEW+sX6GcMOEnlnmUY8VFtjJ+Q7bWZwfTrQVAwmp6U4nfvBANKsBMHGW
	13yKP49MeZ0GI+6aXcBZUxO5KDUQXqKLTbGdHLBz3/zNiBUXY0irUWBpey5EKkZEAPmw12oUthN
	ZDZxGj2ykmZPsM07WzJ2EX3Q8mYnrMBuh9lLDCKyWM+ijnx8RusOdrv+qOt/+1w/QPh838QBrOY
	Y9amSkNv6yERdCbxIfIEpYH6olaP8/I7R+MuggDCw54GL+etmR5XSRxeh0TwYBwk2T045jEXdYR
	TKGLutDmVFTkjZRdu0iP7rLfZdLM6sSGTYK3hGb6XJE7f0vJWaOiPzWUrnqhoezfRwMDutZrsEu
	aomCZjZl/Wk6egtxcuxu6UoPyJGiASfVjKk2+RAHS8hdAYM0er7F6cnyUo7wsTYBg=
X-Google-Smtp-Source: AGHT+IFpyzb2lc+FEvYmYTlRzjGRaKAbU2/1KopbwUla+EaFbZIWmZ4VSEnrtlloLabkn4dzpBObsg==
X-Received: by 2002:a17:902:e5cf:b0:290:9576:d6ef with SMTP id d9443c01a7336-290cba423b1mr160239305ad.54.1760934556712;
        Sun, 19 Oct 2025 21:29:16 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b35dadsm6932872a12.26.2025.10.19.21.29.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 21:29:16 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	guoren@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	lukas.bulwahn@gmail.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v4 10/10] RISC-V: KVM: selftests: Add Zalasr extensions to get-reg-list test
Date: Mon, 20 Oct 2025 12:29:04 +0800
Message-ID: <20251020042904.32096-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_052918_982841_4D9F99A1 
X-CRM114-Status: UNSURE (   7.47  )
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

The KVM RISC-V allows Zalasr extensions for Guest/VM so add these
extensions to get-reg-list test.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index a0b7dabb50406..3020e37f621ba 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -65,6 +65,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZAAMO:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZABHA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZACAS:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZALASR:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZALRSC:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZAWRS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBA:
@@ -517,6 +518,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(ZAAMO),
 		KVM_ISA_EXT_ARR(ZABHA),
 		KVM_ISA_EXT_ARR(ZACAS),
+		KVM_ISA_EXT_ARR(ZALASR),
 		KVM_ISA_EXT_ARR(ZALRSC),
 		KVM_ISA_EXT_ARR(ZAWRS),
 		KVM_ISA_EXT_ARR(ZBA),
@@ -1112,6 +1114,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(svvptc, SVVPTC);
 KVM_ISA_EXT_SIMPLE_CONFIG(zaamo, ZAAMO);
 KVM_ISA_EXT_SIMPLE_CONFIG(zabha, ZABHA);
 KVM_ISA_EXT_SIMPLE_CONFIG(zacas, ZACAS);
+KVM_ISA_EXT_SIMPLE_CONFIG(zalasr, ZALASR);
 KVM_ISA_EXT_SIMPLE_CONFIG(zalrsc, ZALRSC);
 KVM_ISA_EXT_SIMPLE_CONFIG(zawrs, ZAWRS);
 KVM_ISA_EXT_SIMPLE_CONFIG(zba, ZBA);
@@ -1187,6 +1190,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zabha,
 	&config_zacas,
 	&config_zalrsc,
+	&config_zalasr,
 	&config_zawrs,
 	&config_zba,
 	&config_zbb,
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
