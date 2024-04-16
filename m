Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D14C04FF6
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 18:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hnhQYmCpW1hFiO8/R6tkQfwt8sTXbOAUpMVf76kwHkQ=; b=IJxGRHcvxDhiAd
	37m6YOcut38GxXg6+wLXTR2h/vcuviw+sW66QSfZDIK3W6yhoF2rIfqkrEftTmWcah7VwvCqrJbgW
	GZnUe3xiLoKjzxBgAegmQ68qokpczmwuugJmRUGA+7VRWojAQxjF07xM4nb5Jb+sml2HRxt7gt8Rs
	s0oAsJFifqIWvpEJrveLCzCPheBVqcL5Yh0LTIpIE/ikcBA/uVEBnTwaXMfLfwqTDHJDUJM+l9anv
	wImeeh7BejG9bvH2kSTOPa69PtKHpFSAGGDn3KyzpgTc2Qj9NrFi8MTyMGV4f8YD2cQd36pXL94e6
	SRp/B8XmvYUKn/2BRcaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnov-0000000DNOC-2Ppu;
	Tue, 16 Apr 2024 18:46:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnt-0000000DMYl-2VQJ
	for linux-riscv@bombadil.infradead.org;
	Tue, 16 Apr 2024 18:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vBWeKaYtpXhvKjSg+whNN/rWnhjngNSIx7A/W77I8WQ=; b=rO6cu0q2MSXmOy7u3M+LEA+d0x
	rjaWhBI16FQPOiGwiSz5VGIwcLuR7HEmx0XnhFMYw9MmsGJFjPhkAQ30mmxcPQd6IqfWDhxLKlOLI
	KnXN6kZoenJecL/2zVwgDt4M/XF8nqVTnZy3Rm7xdKGe4E6XVh4Vm3Rn1JXEgOQ5DvfPvn7jtEeXi
	Yp8xI7ji/4+tRU6qTkbtoewK2SarvQLSpte2z6FliuZ35DXTb+Tl8DLP9SuQw11YNZzkJqru5Kjx8
	FYinf+4LijayeoWtmKCFJ4/gTNV8d4yIm1bI82HXpUPHkJmP3jHik0e06USzv0RSGpD7XaJo9yuKo
	vtzeukbw==;
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnp-0000000BCLN-0bXR
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 18:45:11 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5c66b093b86so47215a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 11:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713293107; x=1713897907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBWeKaYtpXhvKjSg+whNN/rWnhjngNSIx7A/W77I8WQ=;
        b=qHh9+O1SiCy/i/leGcPuZpM3VDmmMNf0sX5plsSutJcjrxEC5jukqfQ8vnoHbvC71i
         WcW9rj8odl07+hysgGmdL6uNl10Hu3z/5yMEMQ1UcDJSavHordXtjYaBrIEnVgkCZCtA
         C1cRXH1bcqkI/zw8M2vAMc9g/15zvRV01VVthu33uC2chPcjUu/oTbaX68qNj+vfIiJG
         aAPfh99p5NeT1/HvBj1RlHmsIIUS+ABALU8kLe+TbCNm8U8McxajbJaiObtsDXSDWgzB
         AbmdD9mNfAOdn2WsiNrp3VkDThgP+1FXW7RfayLC7n403W4El6dHVZydfm5RN/LZZcPo
         J0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713293107; x=1713897907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBWeKaYtpXhvKjSg+whNN/rWnhjngNSIx7A/W77I8WQ=;
        b=mN7/G08N485eMJTHd+d5lNFIB7MYjSpLPnWSYToayql/ePX/PU9CHzvx8fp9xLYEXy
         AzAWuPHIQD/HDz3lNkuL+X8zFr2FbAQ4iIjw4Oi9WqNrlhZfx/IdGOYNd1Jy/ivHGA/x
         tNicMJebXPSilEiRuk7Wp33J81vDQz8PQHMNbKzlVz8CY4DSGTfSVe5qi9iEZqzw5uUd
         TMBbzG2eKDhrmp4hY7QzDRybFaXdUHy3GcqBiHZC1e0O5pQsEa8KJWIn2PE8YUNBgvR0
         UHm+rGd2x7hi3uVz/Kiae6/c17ujir/BAF9dsH3XWEUOgAnDfMEByx+yS0YgyBQF/a0+
         wC7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhdbOy0HnKi2LlZYLS7khu0VM4+TzS6GhCE7mGPwYDK/bOAPJy/kUcPrhThcM+bgFbA+Eyqyfm9zuX62kEWXDlGurjktdiSgBo+XSNfZPN
X-Gm-Message-State: AOJu0Ywvj2Sbnk3UKgH5qv56vC4OL9krzD01Hwv9f374Eiq2+fGHJpzj
	Hd54ojxB6xxrOCONVzdvezxPPwRzdmWfK3rJVOxzYdF6+3Da2HQNe/il0AjgqgM=
X-Google-Smtp-Source: AGHT+IEmOJnsCqKgMiSjK9JvIG/qr/zmtZv2INOC30OQkmamLtid+925iE6tPmkwso7m5t8fIgxSaw==
X-Received: by 2002:a17:90a:bc1:b0:2a1:64a:bb63 with SMTP id x1-20020a17090a0bc100b002a1064abb63mr4135416pjd.2.1713293106909;
        Tue, 16 Apr 2024 11:45:06 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090aac1300b002a269828bb8sm8883645pjq.40.2024.04.16.11.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 11:45:06 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
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
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v7 18/24] KVM: riscv: selftests: Add helper functions for extension checks
Date: Tue, 16 Apr 2024 11:44:15 -0700
Message-Id: <20240416184421.3693802-19-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416184421.3693802-1-atishp@rivosinc.com>
References: <20240416184421.3693802-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_194509_429830_22562579 
X-CRM114-Status: GOOD (  12.57  )
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

__vcpu_has_ext can check both SBI and ISA extensions when the first
argument is properly converted to SBI/ISA extension IDs. Introduce
two helper functions to make life easier for developers so they
don't have to worry about the conversions.

Replace the current usages as well with new helpers.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/testing/selftests/kvm/include/riscv/processor.h | 10 ++++++++++
 tools/testing/selftests/kvm/riscv/arch_timer.c        |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index 3b9cb39327ff..5f389166338c 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -50,6 +50,16 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t subtype,
 
 bool __vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext);
 
+static inline bool __vcpu_has_isa_ext(struct kvm_vcpu *vcpu, uint64_t isa_ext)
+{
+	return __vcpu_has_ext(vcpu, RISCV_ISA_EXT_REG(isa_ext));
+}
+
+static inline bool __vcpu_has_sbi_ext(struct kvm_vcpu *vcpu, uint64_t sbi_ext)
+{
+	return __vcpu_has_ext(vcpu, RISCV_SBI_EXT_REG(sbi_ext));
+}
+
 struct ex_regs {
 	unsigned long ra;
 	unsigned long sp;
diff --git a/tools/testing/selftests/kvm/riscv/arch_timer.c b/tools/testing/selftests/kvm/riscv/arch_timer.c
index 0f9cabd99fd4..735b78569021 100644
--- a/tools/testing/selftests/kvm/riscv/arch_timer.c
+++ b/tools/testing/selftests/kvm/riscv/arch_timer.c
@@ -85,7 +85,7 @@ struct kvm_vm *test_vm_create(void)
 	int nr_vcpus = test_args.nr_vcpus;
 
 	vm = vm_create_with_vcpus(nr_vcpus, guest_code, vcpus);
-	__TEST_REQUIRE(__vcpu_has_ext(vcpus[0], RISCV_ISA_EXT_REG(KVM_RISCV_ISA_EXT_SSTC)),
+	__TEST_REQUIRE(__vcpu_has_isa_ext(vcpus[0], KVM_RISCV_ISA_EXT_SSTC),
 				   "SSTC not available, skipping test\n");
 
 	vm_init_vector_tables(vm);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
