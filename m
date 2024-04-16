Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477F7C04FF6
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 19:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ez7ZsXCF9Jy3BLG7l0IBs+C7+ZGaSp6GyRn17aWB2cs=; b=4D36G9rqs2yoeu
	Q8TkLAfdEHW5cYVdZtc27rAUSxcQVbC0yeu1ouz1VsE9aTpz/yAeFztqOm6Q4GXj9huDMgI015jhJ
	jHn8BVF4pkMOwxsQ7EAUHyhZwmBBnraaxR3ki05fLDtKMrMklOOHqBvd2I/yAsHPobDCGltgCT0D4
	h5bOG3oytH1SzaAqOTqKsAXhsKRRwFllNaADJ3eS7RoGM04apHtM1jH/bs/BY3g/LOs541ESkzkGu
	k0GDubUGUicGpvVfOIDz0K7NJJ87iIh9qQqCR81E2c2Bkx+B+7rufJDaeM3srcnNhDackluJCMDl1
	k2tI2AQi3Kyq+B42fnJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwokl-0000000Daji-2IBc;
	Tue, 16 Apr 2024 19:46:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnm-0000000DMSM-2Kic
	for linux-riscv@bombadil.infradead.org;
	Tue, 16 Apr 2024 18:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=N3Hu7DESDZEmcgrq2jc0sr2sorL47aa7h3H8SzaxXXM=; b=dDc2SCi5NPpjr2QfpQY/qN/PgO
	Rsm11zhxGO0b/ow0W/Nyu/7WbbVWlHfOyb3K40+LTMK7m+wm3/iWJRRimpyCFHzpVS6Zq1SgQg7JH
	MSgrf5lnc/dSe8F6p+7DFXVdKuPkp91GE6PW81QLRTYJfIb+k3mQqEa2oLuXRtjszNFTOPD9PVzeg
	JvTyoFRlV8e748fOm9LmGy0zA/QdbDR8bx3ck2h+nbJBxlSRT5xiwZC2wlO+H8Q5Kx9Zlhj2EQifs
	mU729q48iAkZ6Tm0+FLNATmoVrwUoMNHEISDq2MVdL8SCWe5ZOF7PPZHC6KgKi5535WrjAyVDFwde
	Gi1dswRg==;
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnj-00000001ABB-271P
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 18:45:05 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5d42e7ab8a9so2477697a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 11:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713293095; x=1713897895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3Hu7DESDZEmcgrq2jc0sr2sorL47aa7h3H8SzaxXXM=;
        b=DkfAIYRRrV6aicq5JvksZJqvcI47+dqRFExYgzKFbPloYpSqtatkugVIHn6Bne8yqR
         4XW/BFiXqKNQITb2oXkT80Z8ZlicAKr7KDfQqm2kztDxGL0Ow1GG/SHRHhT+tZHc4nyx
         KCThFlXrI94mzkL4xgoL108ULUtq8dWmZpW3/0CP3ouA418i/VArKHnMJlAyGYtqkRxs
         c0Ohae8A8ecAuC999MG8X3WZLILy+1E2VvD1MRuskUoiq3XYV+kvBpXqYPhizqu/0Jb1
         mmw+jjM9yoc6lk8zn/AioAMgd4gd2rt5vIvBxOwWV7aejzW/q/4m0IFmj6COM1HRkwGx
         rAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713293095; x=1713897895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3Hu7DESDZEmcgrq2jc0sr2sorL47aa7h3H8SzaxXXM=;
        b=vfiga3a2IYzKHvYSkTEsd6hhqLjQKuA87jSiowiZXwGuU7eJE+oarOaQc8fO16oXQ7
         4TsNfpnag+scUiUovMk7GmfzEAA9udqNu94Kt2E3qVmEk3qbXWmaB9Zmg990ke50VEdf
         lc7vuN6NAXCHfEnmaMkx17PsubOqir2pngatfEqle52iGltfb52rJx9wRIG8+i/w1kOc
         TWO7g2kPT48zdWfq+puBlMemwnMZKP9PhYP2bCBsgBuuR6Z12b6Dv/3TeCEbpZQ+tGLu
         cC2sAJUUhLd60jnfw8Ho7OGQ5ABjohX0Tty6jUNOyxEX3bwHSk4Qyeyt94DTjoJkv1F7
         u+EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpTIChJTpK6mn71vpZQgaIEf3zPmD+xtu+kwHE8ZHyn+YgwvAFQzD4o5jDTB3fxfhLpTS5JRIMbNpDFCcYXoCpDHS4KMBVDjjiVFIPIovH
X-Gm-Message-State: AOJu0Yx3M3NhHCh4Famye5h/M8wLn3/rGrNVrs5DXAMmi33x619A+awv
	xdqIp8MWpZuPWk20K/cg//9KlIgct9FevqTlOAkxteoYOdfzg6LY54dZQ790PE4=
X-Google-Smtp-Source: AGHT+IHMrJmnJNbaJLJrDUHsyvS17+PaYjcpk56OE5mezOqfopuoWKSQzyxBPEpMmbqXUeSJxlz5IA==
X-Received: by 2002:a17:90a:d511:b0:2a4:8706:ed44 with SMTP id t17-20020a17090ad51100b002a48706ed44mr10231042pju.19.1713293095691;
        Tue, 16 Apr 2024 11:44:55 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090aac1300b002a269828bb8sm8883645pjq.40.2024.04.16.11.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 11:44:55 -0700 (PDT)
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
Subject: [PATCH v7 10/24] RISC-V: KVM: Fix the initial sample period value
Date: Tue, 16 Apr 2024 11:44:07 -0700
Message-Id: <20240416184421.3693802-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416184421.3693802-1-atishp@rivosinc.com>
References: <20240416184421.3693802-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_194503_567107_44462F06 
X-CRM114-Status: GOOD (  10.66  )
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

The initial sample period value when counter value is not assigned
should be set to maximum value supported by the counter width.
Otherwise, it may result in spurious interrupts.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 86391a5061dd..cee1b9ca4ec4 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -39,7 +39,7 @@ static u64 kvm_pmu_get_sample_period(struct kvm_pmc *pmc)
 	u64 sample_period;
 
 	if (!pmc->counter_val)
-		sample_period = counter_val_mask + 1;
+		sample_period = counter_val_mask;
 	else
 		sample_period = (-pmc->counter_val) & counter_val_mask;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
