Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D471EC5475B
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 01:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5KpEnUe6aeTxCP68zvbUfqU0U+UvwUC+Zk4jhDMPQc8=; b=miJAEBlaHD9lsF
	1vsukIlpJlcr22oXcj0OJSOcEvQxLfZ8CddyJuekuorI1rs8oAKXFiO5DtjqzZsNKv4Mdh8JeaHiL
	IpLinnClhWgG2Il9Ndztm/spVeThZYQQbvAbzSzP1xNjyD6IlfGDYyhxHAdFtR3Qg+GpJfwL6wnuO
	hDravGXkSFR6d9xcR14bHcaK7J8Pnm/ABeg9IreyGAbdF9KSAc3qhdjjgNAXpvT+0CIV8ms71PdN+
	4/BP/LarELapyIS9zLdC70eqL46MdJQSOfzEqwksegTLcIxMd6X8bnPF653N8WN+jQQmzhNDbovAT
	hcWNS0p25UaT6XqMd+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUoc-0000000BWWr-3CZn;
	Thu, 29 Feb 2024 01:02:26 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUo6-0000000BW7d-2bSg
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 01:01:58 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1dc3b4b9b62so3231155ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 17:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709168514; x=1709773314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8UQElc6A/TnygdjzPZGFQnFIW5Dl3R45uxNNmzEmHk=;
        b=KIwG6M/TOUJBkEJCOaUFr9FWHYXVv/gvJEw6NSwvcwxuUD0/Fx4OMr8HhArJ4apM9s
         yZpaK6fcSuLS1ULorCMoKrgIAVsxRqI08jXVDY7w8fvPrdX1bB/6k628JUNW2vP93xiG
         fkVELqqTnC+zdi4L/G3CpYThFW5T17//EXidj2wZrhp4oTD7vZFl5QWUZEswGubRI2Ua
         qldmC8JG7duZ1ypuujbl+D7QvtC1Y4Cn24VzCiKaHnV/wqu8sV1Q+yF2QN+6VKky40Fe
         HNIJDl3dtTevz66dsC3Y6jjAuq85VYLHj4E69jNEIQg/+tEi1T08g5k4WzDQH3S8rBFp
         42zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709168514; x=1709773314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8UQElc6A/TnygdjzPZGFQnFIW5Dl3R45uxNNmzEmHk=;
        b=f9xEBgW/zM88ak9OTE6IAIT0qSd5WtHo6A5lahRKeBzKbH4Jyk3g4noNy3Mi1i0Nta
         /l3im489WCMlEp8biCm/NyyTDGaZcFWwUs9aBTi58ZSOx1W09OTyV2SYjxnzgfVx7Qtt
         QiRoWxdLJyY8wntaqZaIHBd++Cxjf+Mco894HY39z3cDbLl1qz2/Y9ZjCVgOxoRT4NYZ
         1OmF6D/DCnbrEyEAFXioC9ePjAvKVCPY1BSIu+dtXYy8QZrj7snJNQlSn0cOaLJidVbY
         SrjHo/832NZ56XZxaSHFVGj/IMCSsD0J/0hCoZISHSHhg8j6/4nGuqNjVb9qtlzLcvU2
         31zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoeWiSgvA5tQcIvSNbOl8AxZxM7gWAzcmyPBLZcK6vcE60G+pAWGdCV9IUkicqYR4TZsXMthdTNQnjG/AJr0CEbI1dCormqjlA7e4oeRu8
X-Gm-Message-State: AOJu0YyU4ErlNmz1jqa1YWTzCOldv20qJS2tbqUXjVJkk5jDeiQHwdpi
	BwEgOX/pz6Nd6NJCkfE1GQdyutLzOXz7a/ubyqJFO19TaR3cFmK3VI0hw0mzsOg=
X-Google-Smtp-Source: AGHT+IHDNjWn5dZ/wuSSoiVWheF3o9JRVG+GhFK7oDtYZumCcoNTXkWvgig/10iUgNoPi/vwvXOq9g==
X-Received: by 2002:a17:903:32cd:b0:1db:edb8:35f6 with SMTP id i13-20020a17090332cd00b001dbedb835f6mr622961plr.5.1709168513907;
        Wed, 28 Feb 2024 17:01:53 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id j14-20020a170902da8e00b001dc8d6a9d40sm78043plx.144.2024.02.28.17.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 17:01:53 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 07/15] RISC-V: KVM: No need to exit to the user space if perf event failed
Date: Wed, 28 Feb 2024 17:01:22 -0800
Message-Id: <20240229010130.1380926-8-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229010130.1380926-1-atishp@rivosinc.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_170154_805755_68966F67 
X-CRM114-Status: GOOD (  16.69  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Will Deacon <will@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
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
index b1574c043f77..29bf4ca798cb 100644
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
index 7eca72df2cbd..b70179e9e875 100644
--- a/arch/riscv/kvm/vcpu_sbi_pmu.c
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -42,9 +42,9 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 #endif
 		/*
 		 * This can fail if perf core framework fails to create an event.
-		 * Forward the error to userspace because it's an error which
-		 * happened within the host kernel. The other option would be
-		 * to convert to an SBI error and forward to the guest.
+		 * No need to forward the error to userspace and exit the guest
+		 * operation can continue without profiling. Forward the
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
