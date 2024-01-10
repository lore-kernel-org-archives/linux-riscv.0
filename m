Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1635EC47073
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 23:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5KpEnUe6aeTxCP68zvbUfqU0U+UvwUC+Zk4jhDMPQc8=; b=3HN3rewWMxrd58
	cupEhAxlME+Cgj8liJSu6JeBoYmVSn9OVjnaEpmNN5OpP3JoTNNAYBmNK2baNfqpPE520Vx1wEnia
	cNFDX+gJYBn29bot9IA80oEfjihshKDng97qVTsalwPU3QPG+S+Qfq1eWD5ctDUx1eiNJC93RQ4mg
	uWtvlNlsorp4wBTToYwCjP3g2zmhwYtu7qiQHV2MZRCLaThFMk0gOtmMMlIL02tgpTwtmYtxAlmq1
	y1DS/7Rfsqz6qKjU7pSJqoXIqC0Fi6g1co2RQpT7bzE83s4rULXTagx+JYkx1MimaC7vkXXPDQBY/
	V9sh+ncdY522JsT2pCmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNhmm-00EdgN-0e;
	Wed, 10 Jan 2024 23:15:00 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNhmb-00EdUl-1C
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 23:14:53 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7beda2e6794so83442739f.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 15:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704928489; x=1705533289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8UQElc6A/TnygdjzPZGFQnFIW5Dl3R45uxNNmzEmHk=;
        b=Au//SVzeYM7ErU4AAuJKl+oWQoQFldIAjkuhYmWnM9u3azGgCDkVRfNP1u+pfRe/kV
         ZmYhztEkliEdIWlRO8WogqtIrS7fQrJI0BoudQK8ZyaGAF2EGabFpD5/AsnTVr4hLSQS
         UjhoTkYyNPV4yRwjBySH2BoWDcXiwdPN7GNd0jVjUWpAbwGtGJtCc8AqZzpWnsuiU0XJ
         DkOROe86uHqA/xuDIBuJ3u7I3l2fVEu66JiTPv7UGVb8gwE3WxPb0gXyeLYHCmVrSxw6
         Zfpktx2t1Mc6maqTMUc45Li2SgLsh93ReDUqA2elTiGn3El5iOGaiklPQD18z1gdN4Bw
         JHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704928489; x=1705533289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8UQElc6A/TnygdjzPZGFQnFIW5Dl3R45uxNNmzEmHk=;
        b=Fet8aNWvL7HM3pyNdHSbys9jtKR1tFViPNIkApuceGnC1GhwCzGDN57lY+FxGHwTwa
         7weSHe2JK5XedFeGxBDTB9MjkT7dRVG5xSRI0Izx5TEM05I4bivosdvlqMU48oKx6paB
         I2uaK181Y712m5CCvY5byeWa5ygFNzHqjat/Guq9JXoUG/mG3EXsxtoah5lGYtCIXYPs
         A0zz8E+TjhbxG1zzjwCs242IpouDpYqwYrmUuEm4K8p+wjkCg0pwr2m+YDcQ8yyY+srq
         nwYY3sk/NVqxhuR3zS94tG1f4GHm1iOWTY1xNdBOLz8nEtFvqUZJD8/zH2izh5HF7T1B
         sUhA==
X-Gm-Message-State: AOJu0YzRTV59P5uY7+K5cfNL0yHQlNtikZAfYGTrtaMJglsLwT17AWmB
	WBGiLz+fFsYMlVHXlO0e1LUBetCsaR0vYw==
X-Google-Smtp-Source: AGHT+IF5V83U/JpKcG4G+2/kPT0mLzMy58MOJPAO3gRWS2gTlupn43hdpcod+XzgEM0PaED9NMpmPQ==
X-Received: by 2002:a5e:c748:0:b0:7be:c0d4:f567 with SMTP id g8-20020a5ec748000000b007bec0d4f567mr677989iop.4.1704928488783;
        Wed, 10 Jan 2024 15:14:48 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id co13-20020a0566383e0d00b0046e3b925818sm1185503jab.37.2024.01.10.15.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 15:14:48 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [v3 07/10] RISC-V: KVM: No need to exit to the user space if perf event failed
Date: Wed, 10 Jan 2024 15:13:56 -0800
Message-Id: <20240110231359.1239367-8-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110231359.1239367-1-atishp@rivosinc.com>
References: <20240110231359.1239367-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_151449_457699_427EF875 
X-CRM114-Status: GOOD (  16.96  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Vladimir Isaev <vladimir.isaev@syntacore.com>, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
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
