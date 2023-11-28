Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE917C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 14:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8J2sl7v8xwLQztAeWHjT+G87lDQNX+1PaBDzIWKL+Sg=; b=PIDCZOeIXidI7H
	pPhg6SPm9oyphPp4IZHsqkyrKnLf8F8AxDXchYqIVGCWMnmnj2Z4kD0TP6Y9oTrc1gyAW/FcN/c+4
	Ngh6niyfqoARDfU+3Dc8xlE2jIP/SQcRXdlXx2lZt+kWViNctiQ/MFJMdbK27nMpnSHj0s+2OYjKe
	73mMExlR5yUNnZp+amxWT8/Tyd+61sblHpd+3hANiM5vipHVuQfS9SBQ6W8dlG7lhmMjlNOUyluCh
	GazYo1ne42m0gySaeso0p76Zhz/nLhkJi8Bs6LiJ/XMWN1H+VKwwQ4IhSl5pcNcx32NrESmD+09z4
	JU5tyTefdWh5mgvWeyeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zUe-005aAR-26;
	Tue, 28 Nov 2023 14:55:20 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zUb-005a6X-2u
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 14:55:19 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1cfae5ca719so29335195ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 06:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701183316; x=1701788116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkGfNv4MRWM+/ohqvIrTgVS2Seh7FR6OjZNHRMq6/PQ=;
        b=hXQlTxZXs3ms1fxnwU4j/wlYCiOtdYrEUzQ6GZ3mEB4zpP9NHLMeN9WYEfK3TGpS/9
         la9MqioOWiKSgFNW9lKyPw1MBTGpgQAtbXzIIG5TBQ+u28YpWcL8xADkjZGH4ZXLg2AP
         rwqV97Xwqot3uiKQxvKyJAMylwrT+PPf6viyRzB3ajUU55x0DE4INBF/SNHzYvkXAX3x
         cmZhVyWp4R42+mDH4gmxi/kLBsoMwqNi96NczR9JRmCaKcFio5eJIkJMmXviAq5EUkym
         yW/pTrNskE5RU+4QouZli9nuIT/VFnZBPoCz/2S2v4SzeDAk619NGVqC2dpEkQrfK6CF
         sNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183316; x=1701788116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkGfNv4MRWM+/ohqvIrTgVS2Seh7FR6OjZNHRMq6/PQ=;
        b=aqyVrFITX5m7u1huxQA0nLozs1mLzR3PsOCpF6wBmbRxsr2rA5epXJ457EnOirHqbL
         uiFmAfh4VDKWohexKFdUBK125g+kxIL+fM14+vhmEB3LqAtymo6FCsmbt+kSGnrTyVd+
         TD0dzuHg/FBtfpMtpx+gQnHjxJyCE44CLBiyGSc5H/L5D5WJl/HjrU1g3nqMs2oyvl/x
         1QlHv9TOOv1iiFGD4ibY2GtT/DxPDPp7Wtrk6qAmDVbfa0IjAbfMY42FKuC27MUe5KXz
         9hH2xKoQweF1+J7jh1ZlE7rQx9luxdorGA7xFFE1cA9d0AWgmdI74+AQdn8tB0bHb0Rc
         aLyg==
X-Gm-Message-State: AOJu0Yy+SY4oliWVsKjOc4eoo9HMzMNv+1q8APt3Y3aAu9P9Q8HvUDHi
	XAssDjUeIBKDQNTaLDVesUtHqg==
X-Google-Smtp-Source: AGHT+IHha1V/+lGe74ulF5vndgORIT1jhXH9iyKmg5JY+8yLgvt+PCD6lksk87FC5mErYuRTqwnFCg==
X-Received: by 2002:a17:902:da84:b0:1cf:ea64:f501 with SMTP id j4-20020a170902da8400b001cfea64f501mr4453347plx.9.1701183316449;
        Tue, 28 Nov 2023 06:55:16 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e80b00b001bf11cf2e21sm10281552plg.210.2023.11.28.06.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:55:16 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 13/15] KVM: riscv: selftests: Add Zvfh[min] extensions to get-reg-list test
Date: Tue, 28 Nov 2023 20:23:55 +0530
Message-Id: <20231128145357.413321-14-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231128145357.413321-1-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_065517_948129_2A002C44 
X-CRM114-Status: UNSURE (   8.10  )
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

The KVM RISC-V allows Zvfh[min] extensions for Guest/VM so let us
add these extensions to get-reg-list test.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index e1d43cc9da16..df03bc511fbf 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -69,6 +69,8 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVBB:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVBC:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVFH:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVFHMIN:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKB:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKG:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKNED:
@@ -410,6 +412,8 @@ static const char *isa_ext_id_to_str(const char *prefix, __u64 id)
 		KVM_ISA_EXT_ARR(ZKT),
 		KVM_ISA_EXT_ARR(ZVBB),
 		KVM_ISA_EXT_ARR(ZVBC),
+		KVM_ISA_EXT_ARR(ZVFH),
+		KVM_ISA_EXT_ARR(ZVFHMIN),
 		KVM_ISA_EXT_ARR(ZVKB),
 		KVM_ISA_EXT_ARR(ZVKG),
 		KVM_ISA_EXT_ARR(ZVKNED),
@@ -812,6 +816,8 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zksh, ZKSH);
 KVM_ISA_EXT_SIMPLE_CONFIG(zkt, ZKT);
 KVM_ISA_EXT_SIMPLE_CONFIG(zvbb, ZVBB);
 KVM_ISA_EXT_SIMPLE_CONFIG(zvbc, ZVBC);
+KVM_ISA_EXT_SIMPLE_CONFIG(zvfh, ZVFH);
+KVM_ISA_EXT_SIMPLE_CONFIG(zvfhmin, ZVFHMIN);
 KVM_ISA_EXT_SIMPLE_CONFIG(zvkb, ZVKB);
 KVM_ISA_EXT_SIMPLE_CONFIG(zvkg, ZVKG);
 KVM_ISA_EXT_SIMPLE_CONFIG(zvkned, ZVKNED);
@@ -858,6 +864,8 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zkt,
 	&config_zvbb,
 	&config_zvbc,
+	&config_zvfh,
+	&config_zvfhmin,
 	&config_zvkb,
 	&config_zvkg,
 	&config_zvkned,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
