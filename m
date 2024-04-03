Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5C0CD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 08:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/6kcOGhQC8OEgf93/u5AXhghbPIAArA4ygly40MBYk=; b=Nfv/7Rq3IPWozd
	bYnIs2Zn3/jbFezhxr6XoQ1eOtfEXD5vpvO7UusXlH1Oqsm7tEpQ1UbDUCReOcccIPV2WM7V1ahkE
	mfYUTJD5wJIrdDRuXE2GgQpM3ZtbWeJdQXJZj++MH7fvKEqAoAp/B/9ZbU2RmDxFvNJZReoOGSPMJ
	8R8Miu74bAQ29qHosDoupW+EB1Ps6kIa6uAqHi05iWSCE8SWrwVAsCH1ObvB5ao7PHLDljLDqISVY
	lpAwokDIRryJUgfAzq6G5jrOBXb72L7/yPY8MDr+QcB/WZkRawlJ08qsFGeVdHEBTodTZij4ZevEh
	KjlEWYo7hUwBcD5DXqyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvdg-0000000EjZN-0rTB;
	Wed, 03 Apr 2024 08:06:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvdD-0000000Ej5e-20bE
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Apr 2024 08:06:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xZMdAGbGUb3Pn/mM6S9aCTNbs+MKWuMa25SVPrHMqxo=; b=dKDmxsMmPMZlS33TB0h0ea2HqN
	YKRqAJzkhoTEADadz6VquwKAWo+8sDaA9VsYc86klG5JTqq2J6gJr1T0qG/ex2RWqXr6BO2jJ9yqC
	6sIRLlkny8SNbBnA5jC4DahYFCQc9wUg1TREvCkvReqG9A6vsC0KOlyRUSCMBc5rF9M+0yaznyy0g
	XE9Nyq8QajY4rs8KsZpsrXa9nVISkb/FPTyy8rVYKTQQfZfAW1wsH1mMBs+gp69Ca5FD2q+lfZ157
	CLRU0uvHMhnBSly2vjua/3UcgunBlWatmDvo8egNZuipvTR0eoFMBztN4gAIdWs2wlra+MBijJxis
	rH/CBl/w==;
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvd3-000000044rj-0By5
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 08:05:59 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5dbf7b74402so3367182a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 01:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712131551; x=1712736351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZMdAGbGUb3Pn/mM6S9aCTNbs+MKWuMa25SVPrHMqxo=;
        b=kkcwaxHnOpogsiW2YpMqXrxdCI6CTZ2jLCorhmaUK+qUK0KCvMZw20OSHttaiBj3z+
         WiUItEv78gq/VP1ZrfjeiWlKWsulS0tyoJVpY333/uQzv3MIuQLf6YUu7FZ6VDbcdECD
         GSfeL0jAunLxAkxHRWrYlm7YaO+J40uK7cavtEcrW4kOK8cWOMb0VsV+iadz9e+ClOHL
         mly+lsKItut8+OHBZ/uGWF7VSZeqmKznZiDrU8G8Ur7fYMxkrr0yvuKDCU3RE87x4Clo
         P/eIu0u2o8xO/UlOKfmhbMaFHwjBMFK0zoZG/nhSaPlb8jfxPZ+F6G+cDeEuanHXf4BR
         Ovew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712131551; x=1712736351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZMdAGbGUb3Pn/mM6S9aCTNbs+MKWuMa25SVPrHMqxo=;
        b=nn2SP84Hl1fuR5SyIrawTGsiQPG0PZ9R/O3YrnNn0BdjpG9xawd10Ocsf4zndHGu5J
         h99+AdjhgQHg+/Q6asHpQzAsGKJ3uW8CvQ5K0qJ1BwDz+zLfbCL+b+tuADIaTIgTX+ig
         x7vLYr+GELFsjAakKeKMhLISh+aaRuNv58jtOX331jTK4m0oV0MxxlCxZ+yXym297tqC
         q5BRguZV4ElsrN7BzOBPO3tkAO/oHxxCIh6CXW34TXn06MQR+RHRQrsFLt7BrLqAMRd1
         B7pZ9eTNJTpmjO+FG62A/IbBriuOiuNkcaYWP4yBKiBr3Q37hpIt/WimasN3G7SUabkv
         deKg==
X-Forwarded-Encrypted: i=1; AJvYcCWt+MBUpi7LboSBpSAEwDf8DV73xQizgrlIZ5bRFqitjEPHt4ifUNTTZ+kfRgk7CEiE0EkUkXkJthp8H/L/0mILKZZ9xgdAYK1QId+aaq3L
X-Gm-Message-State: AOJu0YxC5S0DXI1RZk57l0NSNgeQBI89GP9+ZCTrgUVifi0cBEuKUngs
	GjRHejgSQmI1UN14TdmSNrAYNjW5w+2tIC7rIP/BRYfa1Wtu3VqbtTQ3vJMyKS8=
X-Google-Smtp-Source: AGHT+IFHku/sICvAenYJFC+cS7PaObyEd64lSbck4sFkQiPnTcMjwhsfqy4pdW/5l9uIy4qG4AZ0Fg==
X-Received: by 2002:a05:6a20:94cf:b0:1a7:377:b867 with SMTP id ht15-20020a056a2094cf00b001a70377b867mr11062652pzb.57.1712131551038;
        Wed, 03 Apr 2024 01:05:51 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902d48c00b001e0b5d49fc7sm12557229plg.161.2024.04.03.01.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 01:05:49 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <akaher@vmware.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v5 18/22] KVM: riscv: selftests: Add Sscofpmf to get-reg-list test
Date: Wed,  3 Apr 2024 01:04:47 -0700
Message-Id: <20240403080452.1007601-19-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403080452.1007601-1-atishp@rivosinc.com>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_090553_748043_BF037D9C 
X-CRM114-Status: UNSURE (   9.05  )
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

The KVM RISC-V allows Sscofpmf extension for Guest/VM so let us
add this extension to get-reg-list test.

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index b882b7b9b785..222198dd6d04 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -43,6 +43,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_V:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SMSTATEEN:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSAIA:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSCOFPMF:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
@@ -408,6 +409,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(V),
 		KVM_ISA_EXT_ARR(SMSTATEEN),
 		KVM_ISA_EXT_ARR(SSAIA),
+		KVM_ISA_EXT_ARR(SSCOFPMF),
 		KVM_ISA_EXT_ARR(SSTC),
 		KVM_ISA_EXT_ARR(SVINVAL),
 		KVM_ISA_EXT_ARR(SVNAPOT),
@@ -931,6 +933,7 @@ KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, FP_F);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_d, FP_D);
 KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
 KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
+KVM_ISA_EXT_SIMPLE_CONFIG(sscofpmf, SSCOFPMF);
 KVM_ISA_EXT_SIMPLE_CONFIG(sstc, SSTC);
 KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
 KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
@@ -986,6 +989,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_fp_d,
 	&config_h,
 	&config_smstateen,
+	&config_sscofpmf,
 	&config_sstc,
 	&config_svinval,
 	&config_svnapot,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
