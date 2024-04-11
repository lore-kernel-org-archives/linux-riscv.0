Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05601CD11C2
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 00:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qeIh27JZGNzAEdL49duZ0LdbHS+Th+7LVg+92kk1D84=; b=U6/Bas+Ya+l7Uu
	LhGcguU28nXc/WgwzMqZNsT8qoWm2dzIJ8CKA0FWK38GD3pnOOqi5SbFOUhngbSWQx7Fk2k/XAC0w
	tn9wZIuwOShjAU5RGTaGRPl5KhHmnwEhDFkYtb6KW7SFprcGufyhJ5Zgl+lFkSKN/Ikm9/Tvrq1Ew
	U6OEBUYkbwqIRsuNG6pFrllUChuIvwgU92Slx+L0neczTIEZSv38yz7wKr0mQ00QkrKLoW1phvv9g
	oHZFovDyqptw1ZdcWTTu9n8qnRa/IttHgk3vf4HJIKzeuWJKyYgbvpZqBvEw9bxUqbyl6gvlE91CE
	xbQJkt9TtXuYSIeZiBRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhzy-00000009aBP-2nPE;
	Thu, 11 Apr 2024 00:09:02 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhzd-00000009ZpB-1Srm
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 00:08:44 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6e46dcd8feaso3758152b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 17:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712794120; x=1713398920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIyaUvQe1Xat3Gv2wtXts1DoFv5C5UbopqhCGzslRuw=;
        b=ZZpAusduHk2qeSToxwmCfBDgwQIwcTpnPI8u6L9dBhOUDONMVbmPzOKddtJfNOExMk
         95xEQq4ctjAyvvL3z63Csb9OsgiH3nsqLuNSmzRc8mSIqx56pb0q1GOGapxnkVwJyPtW
         JvQgYIlta6oDgBHwjv1fjyxI2ga05eQROQ/gB/zSt2Sr5YyNJcmOPhLr3fCloDmlnnon
         aejDlcmnPHCsPQO5OrKXURifwSndWnms40ccAdDKRfRdNQlgxHryu8hNJwXEcqrouOUL
         n+V40C4cmGHtEt74c7FsHitb4OHh6aOBSaNigPuSqpIAWDFEsNntls4Xgr+AxzzHKVvJ
         TJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712794120; x=1713398920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIyaUvQe1Xat3Gv2wtXts1DoFv5C5UbopqhCGzslRuw=;
        b=cofqZBw/MaHIFuefoKaKNCSP59uOmAVy2NSXiqa+xEFIX/HiDTe41axglOPAS+yg8/
         3qjzso4hE18WDVL2Jyjv7efYw9aCq3Ohv00vKtyEdmx17N9MStw+MJEumaaK+2Q+ex1a
         AxCYLS5JqYFbTTev3WyxP59m+cjHOc71zVzpfCx6vbSEYzNzUtdEkOEEQzzUYZkZ+jRo
         zJiIL3ed3BhS7SAayo6V542HAarEINZAXrtLXuMDQ80Isd3OcWz6p0DtkczdbGzJWByv
         z/tMni8YbcQqhUvMYQf16Kobhd9KANDC6KtAf1CGF6Cp9epRCdwyo26zYPozHspW9v3E
         SPdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW75u1AOAWGC9nZfLQWcjc5p7FvVBdljJ2WN2vgKhxfNkmZDKpZ/YPcPnIqYHfmKB/7Gjbt4D8F0IWQ577WenJkwMJ7gUk9A60baCOvV8OG
X-Gm-Message-State: AOJu0YxfvC2+ZWM6edZ3u/ICfHAPMbLglbNjVQeBdqyLebakAJMdHxlx
	SHvfHzzdXdXGR9/wYDNXPBJS2dLauroviZqruENMqtptihUf+3sTlpmUkLNDnX8=
X-Google-Smtp-Source: AGHT+IF/iUH6j4wqYw+9KON4EcdThSC+Ra1ZyGUZbtrB63cmqdWgioWmkvLwZPQEH37uBSDgq6VsEQ==
X-Received: by 2002:a05:6a20:96cc:b0:1a9:8152:511c with SMTP id hq12-20020a056a2096cc00b001a98152511cmr231480pzc.62.1712794119434;
        Wed, 10 Apr 2024 17:08:39 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001e3d8a70780sm130351pln.171.2024.04.10.17.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 17:08:37 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
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
Subject: [PATCH v6 12/24] RISC-V: KVM: No need to exit to the user space if perf event failed
Date: Wed, 10 Apr 2024 17:07:40 -0700
Message-Id: <20240411000752.955910-13-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411000752.955910-1-atishp@rivosinc.com>
References: <20240411000752.955910-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_170841_632697_A0651170 
X-CRM114-Status: GOOD (  17.10  )
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

Currently, we return a linux error code if creating a perf event failed
in kvm. That shouldn't be necessary as guest can continue to operate
without perf profiling or profiling with firmware counters.

Return appropriate SBI error code to indicate that PMU configuration
failed. An error message in kvm already describes the reason for failure.

Fixes: 0cb74b65d2e5 ("RISC-V: KVM: Implement perf support without sampling")
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c     | 14 +++++++++-----
 arch/riscv/kvm/vcpu_sbi_pmu.c |  6 +++---
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index b5159ce4592d..2d9929bbc2c8 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -229,8 +229,9 @@ static int kvm_pmu_validate_counter_mask(struct kvm_pmu *kvpmu, unsigned long ct
 	return 0;
 }
 
-static int kvm_pmu_create_perf_event(struct kvm_pmc *pmc, struct perf_event_attr *attr,
-				     unsigned long flags, unsigned long eidx, unsigned long evtdata)
+static long kvm_pmu_create_perf_event(struct kvm_pmc *pmc, struct perf_event_attr *attr,
+				      unsigned long flags, unsigned long eidx,
+				      unsigned long evtdata)
 {
 	struct perf_event *event;
 
@@ -454,7 +455,8 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 				     unsigned long eidx, u64 evtdata,
 				     struct kvm_vcpu_sbi_return *retdata)
 {
-	int ctr_idx, ret, sbiret = 0;
+	int ctr_idx, sbiret = 0;
+	long ret;
 	bool is_fevent;
 	unsigned long event_code;
 	u32 etype = kvm_pmu_get_perf_event_type(eidx);
@@ -513,8 +515,10 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 			kvpmu->fw_event[event_code].started = true;
 	} else {
 		ret = kvm_pmu_create_perf_event(pmc, &attr, flags, eidx, evtdata);
-		if (ret)
-			return ret;
+		if (ret) {
+			sbiret = SBI_ERR_NOT_SUPPORTED;
+			goto out;
+		}
 	}
 
 	set_bit(ctr_idx, kvpmu->pmc_in_use);
diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
index 7eca72df2cbd..e1633606c98b 100644
--- a/arch/riscv/kvm/vcpu_sbi_pmu.c
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -42,9 +42,9 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 #endif
 		/*
 		 * This can fail if perf core framework fails to create an event.
-		 * Forward the error to userspace because it's an error which
-		 * happened within the host kernel. The other option would be
-		 * to convert to an SBI error and forward to the guest.
+		 * No need to forward the error to userspace and exit the guest.
+		 * The operation can continue without profiling. Forward the
+		 * appropriate SBI error to the guest.
 		 */
 		ret = kvm_riscv_vcpu_pmu_ctr_cfg_match(vcpu, cp->a0, cp->a1,
 						       cp->a2, cp->a3, temp, retdata);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
