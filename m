Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2CDC36002
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 00:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h49ibgjXv89Xo/LOxc9niMpDFPodnbdMiirjTO/4UAk=; b=Wa9cLPLD5do3Hu
	FoKjesCrLorCoim21a2AR8mSyTH1LBilvDtjOT51lMapR4wSmWzTK95Uc2BwrAFW8RIBHr1c+pJrl
	fp2LlCV9HET1gprbjkQj9lbfWixONpx+7HH7THnESY7xHnjl2tNv81zUwUaxYubyCfDVvjH/7TCdP
	BWOALxL9TIJER/Dk1kHwWQmAclRC0yYVYgGsEknoPCcdzKe4tS932hZubF7Kjz18pR5Wu/Hqjkxfi
	bOiF9lyz7+53c2r+eLYDEK+pfyutRwkqHP4eWrfK4LbqmW0wh4GBCOS3lYBBMyHwzgOaLxYy1DORN
	yoQJTj2HSR8SUPcIzdHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twsLY-00000004Y6g-3o7V;
	Tue, 25 Mar 2025 00:40:48 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twsLU-00000004Y3q-2FoB
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 00:40:46 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2264aefc45dso84379715ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Mar 2025 17:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742863244; x=1743468044; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkzfSG0KriYdqKt2ggB4CIBVtIx+E6Xmjf6eqJhLj/A=;
        b=cUxhN0Bi6MJRKTYKo2+NQnXxge+vWxY2zXcP5ZDzabDWIT/R+IrDoB+hQN3uQLASL2
         YMBAHuI+jaOrD8clkTEypzRNc13+cuqkV96ZXItghZzWTNCD4nnbP7GEjqStes5TCeJT
         eyDckuKQEMweQOZ8IzrM+xVCZEX2JVzbrQPcN3lo+60STnmYwp9XHxmSHD4atfb5afAJ
         HPNFkaVHJdcEx6QzhWp+Y6XjFxaRi38t0RaMpjp6US/e9U2Q9qb9oXR89GD95P3qDzxT
         X6L168VyPgbY9J7vAa62zZDFXaVrQUtJERy69X64vA6zSXx9Bepd1p3J+sRYyuKHr+il
         ha0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742863244; x=1743468044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkzfSG0KriYdqKt2ggB4CIBVtIx+E6Xmjf6eqJhLj/A=;
        b=n+dWbriF/rsO4X4jylwGwDNaOtul++cnROhKePyxTWCVt1hB5S0Pzyv2SnmFOgwGk5
         zKdm/lAwv5VMfqPeYVThb4Mihf/i2DwbKNJc3zPsjCRFQ2by97AVHrFdq5oUuyVIq6fU
         oQny/AGV26utD1MZwWJ9zOdz8MKlQOEsCv5/a8dN8prGRXDga4jKMdVxN+x3NXrObdoj
         yiwNQr+Mx29baudXxzdSguqEPB7S4RRX+WlL/ySCSZW6D8VTocbpsiZdeIcSyuPnOoWT
         BYz9dyBVLn6G2CbF4Fi5ZtKSr5rZIB+MoH3KUibxoB8Ylh1pgT96klYGw2q2gdYxdsyn
         JHQA==
X-Forwarded-Encrypted: i=1; AJvYcCXvZ64t1WYRWr2h/G5MYvpduS9NWiSxL4mTzHdsfFtZtyZnTDpdkAXi/QqRnGHNXULe0EKa2FqsY8kukg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ5Kb6SAue9gDTUifeJYCeSY9xZoj7fBKPCM7i6cPacEyv5SI2
	52tZEVantC/BSFUGHBUGaAsfASJb/bdAwhi0KAValOfgWK9rbIXyZKNGQXhd+CE=
X-Gm-Gg: ASbGncuv6MOWJYaLBxv5oTyGBXYC9XURQ6eLtZ1vSQPpPCvPvGeSsBgLeVKygjq2Hrm
	rsdZRdF+4AzGAeyCn/cnYfJe50Stuhv2NEr4tyXxNNHrg1lbSOXt9fa2viS1OBoZl3W7XInoApV
	mV1n0INbV1COGc7IZstP4VLzFT/zBzfrfpyNXyweHAoR9LeIFtX0U/W+fo9/1n5OJNrYOLNHQBL
	1SNkzBQtcw2KgCcnqiZFCDVYHTKAirBRcpsCd6kd9uzMzpAVF8sxB8s4sdyHkj9llan9+aR0Rm2
	N9el5GAQOWuz6cVN7j0Qi4PpRWNy6HkTlr2tr6B/lyHA1tz6fqUPYjSQ5A==
X-Google-Smtp-Source: AGHT+IHZo9yFD5wVvlHsZ2Ob2mdY/LteNi32aWoOs7e7aKFg5g40FhjpBRzw6PFwuzSYjgzfZKYYEw==
X-Received: by 2002:a05:6a00:180c:b0:736:5e6f:295b with SMTP id d2e1a72fcca58-739059b301fmr19822371b3a.12.1742863243652;
        Mon, 24 Mar 2025 17:40:43 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390600a501sm8705513b3a.79.2025.03.24.17.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 17:40:43 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 24 Mar 2025 17:40:29 -0700
Subject: [PATCH 1/3] KVM: riscv: selftests: Add stval to exception handling
MIME-Version: 1.0
Message-Id: <20250324-kvm_selftest_improve-v1-1-583620219d4f@rivosinc.com>
References: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com>
In-Reply-To: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_174044_577066_BBE5B608 
X-CRM114-Status: UNSURE (   7.88  )
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

Save stval during exception handling so that it can be decoded to
figure out the details of exception type.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/testing/selftests/kvm/include/riscv/processor.h | 1 +
 tools/testing/selftests/kvm/lib/riscv/handlers.S      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index 5f389166338c..f4a7d64fbe9a 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -95,6 +95,7 @@ struct ex_regs {
 	unsigned long epc;
 	unsigned long status;
 	unsigned long cause;
+	unsigned long stval;
 };
 
 #define NR_VECTORS  2
diff --git a/tools/testing/selftests/kvm/lib/riscv/handlers.S b/tools/testing/selftests/kvm/lib/riscv/handlers.S
index aa0abd3f35bb..2884c1e8939b 100644
--- a/tools/testing/selftests/kvm/lib/riscv/handlers.S
+++ b/tools/testing/selftests/kvm/lib/riscv/handlers.S
@@ -45,9 +45,11 @@
 	csrr  s0, CSR_SEPC
 	csrr  s1, CSR_SSTATUS
 	csrr  s2, CSR_SCAUSE
+	csrr  s3, CSR_STVAL
 	sd    s0, 248(sp)
 	sd    s1, 256(sp)
 	sd    s2, 264(sp)
+	sd    s3, 272(sp)
 .endm
 
 .macro restore_context

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
