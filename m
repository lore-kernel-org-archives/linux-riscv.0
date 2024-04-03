Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4A1CD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 09:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qeIh27JZGNzAEdL49duZ0LdbHS+Th+7LVg+92kk1D84=; b=NM6SDgCx86PWDZ
	1IXEWoSuYlPIEgyfAJnwELIhV7U17XcYM59Z4yB8r7nNXtGTnyW5WsI/3vd36uXnSlxG0SEuuUTE7
	fkhV+HtBcylSBvJGaqTTVhCisvhbKyGMVFlMPDdebtO9/xACAcJ2DEVdQj4H9xy8SzDP9Aur9Ek0L
	xqgipbn2VpDZT4fyFH0Z9FZ5wiqf7Gm7quvJf9MFPcf5hRm5JRcf0TzZolB2fkGDU7qP40aZXFyO0
	roGFTtsEpJxwK/mZNIwfEn9BDjE+i0/3qoj7hrCYDWL8nsgOijoouL7JcRdaosz0egtfWlHcX3KxM
	o9iBzw0yLVJvJwTX0EmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrwmB-0000000FAPE-1Hyh;
	Wed, 03 Apr 2024 09:19:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvcw-0000000Eipo-2cer
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Apr 2024 08:05:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QIyaUvQe1Xat3Gv2wtXts1DoFv5C5UbopqhCGzslRuw=; b=NuN5yo5BjpkkKH8gBlZNTZrq7Q
	YZplOstlNBlGGFFvpp/pkS/0MPcJTIWlXylEMAZieQzI/wtvNfzYetlY36ALDXiuqpsKVA3lhgpLU
	oh+67JE2zq0Ra9EOJ676dLsThUEtv7i13Rcq6n22XTWnYTzRQdLunGaSXg0sdzMJDY9umtyCN+u6i
	7lJCHpapnth2v8/rGGX6CyCd4/WWAQgwRznrDG6vPjorjwf8uHJuj5XMT8zaUrhFZnmXXeb25b/C4
	jJmYRy4/OHAzo912AOaU3pcxJaS5m/3iEtn+7P+PkeqIRMR3FBqkt/sw8Ys5wKPMpAIZu8ItXBeFV
	kSK+Nigw==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvco-000000055eg-0Dmb
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 08:05:45 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1e0d8403257so47314405ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 01:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712131535; x=1712736335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIyaUvQe1Xat3Gv2wtXts1DoFv5C5UbopqhCGzslRuw=;
        b=yxBnGYWwFLVcCGwsUOeYON77Yw8urPO0VbVfe41tILZQcfbPtXblogTOWK4CX4hmBR
         Z6e+mETvGcktfhpXvkd+2TGa2xCw3VcUq0e5ZgOwDfz6ip/07blnvVSa5RLMGL6IzJxC
         KTeuo8xEtlxjEzwDmNklAuJa4vyfbWZV7En+5ftbeUWOhjGm9hvxI1HvnGVBS8Se+y2S
         5gT2g3fjZSbHSvP7Qa8NtjMHjlNtaceZdTBR1GQOPTKVIxUV6Vpf493tjZj4F+w0pl3y
         QDpINhZklY5SczCLYmlpNt2cg2jzBqwIhj+fqTuQY+WeuhS4aa4LCe5KvHMVTPfl6PIM
         jhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712131535; x=1712736335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIyaUvQe1Xat3Gv2wtXts1DoFv5C5UbopqhCGzslRuw=;
        b=Q1ZET3qoIYw7fJllUH5iGebYS2f53XUsDQnbNLaWhmS6KydeWwAN2KNiXBgpZxY6G0
         61DSBUxnaEAwbEc+7bFP87A6jjTPkQdwqKIoOci3nMxpsxwEaqV+u2kOcM2VAaOPrtnW
         VbzQnbvBPo4TInueZ+tkiQP0cJ/33C51V+Tlet8yYAFYy1Bs5G25+XyeQCtI6gGAlpE0
         QsOxJ96FnZO4Eo7cZrGRdX77inoKl6qSR3YhTyLpkE9jWr8Pz/bs8HaCKPY5JU9rfa5X
         wL32h+SpzO1Q33rbM94DxxnyTnvKgjY0te3hT/cHN8Yt60fJ6WnqLmTpQl0OqSjjO++b
         ZuSA==
X-Forwarded-Encrypted: i=1; AJvYcCWbBpTbaq0R0C5Boh1aQoWvyZpWrL4HX+d5Ou3V2Sze9kt3iU+iLkcxn9uB206jn5p0YxrjIXj16xAZ/b0RgJwXNKKdKyFRHfbDmOVgtHLV
X-Gm-Message-State: AOJu0YyJZAaNX76HSbTd9POl1U97FzWdMZ1uBXsHA0fmw6ZLMSP0bCny
	tkw3mUk3u3QwWXwIi3TGWXeLcvW5Ai15b+zDHcIxBxA34/feitjk9l3MhSuClqI=
X-Google-Smtp-Source: AGHT+IEWaMwJlilOpjjtAd3ogSZtQYb7+W8r4UBVM9U3DF3iIMbLdC4POqTiOnAm6aIo/b0Y3UPrBw==
X-Received: by 2002:a17:902:7881:b0:1e0:cd01:9fd with SMTP id q1-20020a170902788100b001e0cd0109fdmr11915195pll.26.1712131535324;
        Wed, 03 Apr 2024 01:05:35 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902d48c00b001e0b5d49fc7sm12557229plg.161.2024.04.03.01.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 01:05:34 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Ajay Kaher <akaher@vmware.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
	Andrew Jones <ajones@ventanamicro.com>,
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
Subject: [PATCH v5 11/22] RISC-V: KVM: No need to exit to the user space if perf event failed
Date: Wed,  3 Apr 2024 01:04:40 -0700
Message-Id: <20240403080452.1007601-12-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403080452.1007601-1-atishp@rivosinc.com>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_090538_158902_1CC93439 
X-CRM114-Status: GOOD (  16.53  )
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
