Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464E0CAC592
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 07:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x7P5+ZjyB3bpCz8TAuELRZtEbegA3dXwX9qFB6R6aI8=; b=ltXv4ws1qtEnos
	JDej7IYXDBW+QTkbylezvbk1MYSMmlQ9oweVheMhDuogS+wmlOk6rDewSoh3quhMmWbIDiBbvQPb4
	oSqGfd7pP46uSEhO+oZFDWucVYhAnhoGpFLA2YqwSTEkQwtB3aN5toRIrI0XtuAkkQWkUFmcSiWnI
	4R6Uo2SXznhMnY7w8pW/NoKYpN0RTDJYu4DaMrziiRy6awSAT6UlrmsDQAFaokcngKJVhTxoWhQIv
	fYFLdUZXtTy9R+PwZ1kSErkat8m6ZtDUj5vRuLsxGTlfAO8Z8LyBfl+BEpzUDw1HGPKx4ygmn4q+u
	zvBlF012IYWjLz2kh/Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVhn-0000000261E-0C3l;
	Fri, 19 Sep 2025 07:38:55 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVhl-000000025zz-01PY
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 07:38:54 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-77c1814ca1dso1398871b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 00:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758267532; x=1758872332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/wZtJxRjsPgsFT1TZQP06vJqUDEl57iCFv88CuZkP4=;
        b=inPxst5OjnMJGf8ZNdZJekXKje5NcrL+s4sbbcNDVmLIHbMIS/xt69qBTYase3XynM
         0LO1HAt9vxeKuLtVYONyn11j9yb8zAUR1V2XrxuCwP73P4rTPSpph01wNxqvNvUUN8Eb
         XL6tTtwLeoAt/mCpYM84nk7e7Gd+HAd8b6yyRbZ9iKzT4wH/GHX/qKBikIYZ39r4iTtl
         mKLXdFXMmIdi5vPNRadMFekFj/JdhCsT5aKMeAgr8g2FEE3CXEZRsMzh+Yb0lTw+pyrS
         9sw9zn+OG0dhssCvMrU8eTrT9hQ695HFA4d3QB546BMtayRQVZIHOj0hqwanaZbmdvDb
         wuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267532; x=1758872332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/wZtJxRjsPgsFT1TZQP06vJqUDEl57iCFv88CuZkP4=;
        b=a2lHXTL+Co/vWbPt/dZ4LjP5OO1fMam90nZGfDenn4PVyJlntTKtQCxE0yrzma0RZA
         j9rO11mv8fKqDoNELHXeKgAkerCfh7BiZWHVHE8TKp9vHc4apTcaqPUsY4ZiL0fLfZUp
         GwHTH8ie3M4V41xTCldnhGqkNEwlFEWVeTYty9y6Ar//5VvGxUf7cODgBh+H1FhAjr+4
         EDYziVlv8KJdmIR0OrELBeqdJGOIY48WYDmlovMB9vXuMQ51OssKE8qcHm3uRurE74+o
         9iLRtK1PE2/6ZELBEQ96ZM+N3fRVg77q8zq1tc1rgyCvRIXa9/BJ79ri3kcmwDYlF7zJ
         fO9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJHyY6SigkwfBRoiWzamOQXbRJ8aYuBwBcct2fGr8bBdpQePsvTg93hMqA0gGdKOucueSeAFTrEYXA0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJKZI5zqEASLOGmoS/L1i6wc101H6Ry00TeUY+J1LQ5yyyv1Kq
	QUkKIZrpismUAQRCsiQ4hbtxSrjloWcocRHxtUKn+C9z0O48EfaIlL+Nh//gdusjAUU=
X-Gm-Gg: ASbGnctLN0tO8VTOe8icTEQwUEw6TgYHXIZ+I+LP+jSfC/kBLUybmXXCmfDQwJxpUEU
	9S+I9rd+P4Aqd7+gCs2ySLPg4HVK62fXXhsft5xXz0w1Aa79JvVVgseoJ34DOPlVCYP4jzp0SJZ
	9+HrqMBDcikXoHjdHoWAl8WHjR7LKgA0CfyP6A1cTjbsafXh0+0D5CSRAxB9LdR63Qioc+xyY7O
	WCNjZOEff9Dim6iYDUI5LA7QmZSsNjf5d9s+oR+qtl1j3pbM2pzrQtpD1xhUcb8SciUq2fbRYSF
	bk5aaRY9zy2Gur8IMX2FJqjIco2kb5CijEHF/FMfpg6cj3HMpCCSm4/1OhSKzzWufYbrd2hAEib
	1u4niKMNmjlPDNlGASpPkaMtZcexRrM3fCZehOwIZ/OTZ2XbZRlMmAS1q9fFXBRZ7DXol4MCTwr
	9JQPr4uk7exVPKRXHfZ43pqKAjDpVUBBWEbknnN9NPEg==
X-Google-Smtp-Source: AGHT+IH+4QZdIMI6dt1vIbAhIv1otTpdn3Cuf58RfGKyqc29IOHSadIrxg84hnYxuSAKEAjnTACHLA==
X-Received: by 2002:a05:6a20:244e:b0:24d:d206:6992 with SMTP id adf61e73a8af0-29260d81077mr3369360637.22.1758267532201;
        Fri, 19 Sep 2025 00:38:52 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b550fd7ebc7sm2679096a12.19.2025.09.19.00.38.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 00:38:52 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3 8/8] KVM: riscv: selftests: Add Zalasr extensions to get-reg-list test
Date: Fri, 19 Sep 2025 15:37:14 +0800
Message-ID: <20250919073714.83063-9-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250919073714.83063-1-luxu.kernel@bytedance.com>
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_003853_039873_7597FCCD 
X-CRM114-Status: UNSURE (   8.86  )
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
