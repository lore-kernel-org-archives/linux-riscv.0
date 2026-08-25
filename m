Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4275C61DB6
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 08:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zIihNGfc7UxXnrwgcGsJw3i8va4InmhsAQT+Vq0unzw=; b=qNr8K7jgisejwT
	Y39IRhKZZctC9U46aGsL84jnFY5VMzzPPOmSDRsPa15WJ/Pd9MhucNO3LPVH6JC/t84WGn6FAk8CY
	Ss5ptEyW8YeH1PvMBfi9bQat0xnWq5aWYvx0LEjMGYzM9nZwzSeVvU/KnJfOmjvFB/ptugIUKiF2f
	GSI51S67ZMMUf526YRKEgPw8N6sdw5I1kkESuUT/j2ryXCktnA0BRZEd4U4giQM8IofxapM+nBwOb
	e4KtjXXvzkyw+ZB6QweFTlHCYIfvQmUNUyJkiDTPprlK6cJr08ILc8UqCMVZYT6wYXF4wgJTJ0GAI
	6ZYJAKvuvD0XGuAS/R3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymfD-00000000OqX-2SOZ;
	Tue, 25 Aug 2026 08:37:47 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymfB-00000000OpE-2FBq
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 08:37:46 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso3717753a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2026 01:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787647065; x=1788251865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EKUnc+hCH/m96lQyJ3IHIfrh5f9TDgQ6D60NAJmR+nI=;
        b=B5IWOJp4Pe0JNFAJMiTgCXoVhZEjzTRJbff4dvRp7YaNhmfOMbb3aUV6rZrq4Oi5/c
         2ioe5hiHzIbWRXSl41xinBLRXdWtrioD1ALJjTEfvv37cxq0GwEf5PGJiqWeTaFtOFL0
         4Op/Z5aCMPHvS6aM1SOKywW9mcX3iPun3RTMDwYtUUInjligz9H6OhCWR5hXNse4MqqV
         1wYcwAvHiE9RQxD8I5xLiU3AIp2wXIk9+IgXmxGPYAW1GPifhDf+4tw4u8SsPzcefLy5
         ydgMHrMCMX6omuqoKQ7o01NNHlN0NktceM1RsPHzxmSNKJQo7iTHGqjoIHoxNP6dJDFi
         4qhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647065; x=1788251865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EKUnc+hCH/m96lQyJ3IHIfrh5f9TDgQ6D60NAJmR+nI=;
        b=dkQdFWUNuzH4p4uoRcLjokGPkxF6ySw1/loaRalZPYYPIu2Q1nWtUSITStLeaStcS+
         3EUJEM6LDA/zk4xCWT/7WFv8uc49oB2djBOgB9IzTsSq9lqdxKG/X2/IazNK+H6/28uv
         7rkMb2gojNLPCdX/9rgues6OcuFy8dE3Srvsyqk9LSDIXH+SPlTIzdd3zhFQ5H4M80pe
         MXLU3fVXfjxcwnbGrufluzk864jPCB5ewV3SRmuHx+D9X+3Brd0YW1G54jorzoaAPPOZ
         ocyZUl5nDaIhGlbEND8SdtWc44eAJMOFx7/VOeZnCordDhIyY91FcI5g1TAXCUSRFKnj
         enow==
X-Forwarded-Encrypted: i=1; AHgh+RqsoQ8tl0s8riClfi9Z0e8fnODNOIjnM+2+GYWuPW4YCtAxynA2ZqfXrP3GQ6N5W/qBx53+OB/4q+Zz8Q==@lists.infradead.org
X-Gm-Message-State: AFuF++k/pbW9EF1n2yl2gyRzc/oM8xFscUvhi3AYP2ng1WoSxBTAzFwY
	GJq7SxRtOmfUgyQdxoj0RLZZt73EeoeZ3seW3mj47FwOSNYHZsrhbBhF
X-Gm-Gg: AR+sD10E0LnliZOnL9YpXpzH6sbDyRnpjxqZA1v6Pok9AGBNtalJYGFXdSAEK7wUuQp
	wfOJFXih5oHacfwm/16CQML09bEcxVBKrV3ZYgjC1iWToEvUq9ZqiMKfo87QJCuJDOoiJ/RqHMy
	fAqre5o5d3wo4bm9B4rt2+CdXgmUIBL0n50SuXUsgoAWzg19NpVONQbMtiRtGACf01UvLGsgb+t
	cJfNQydSWGtYuAbiEVT9B8539ACud+6Wf1YXbSkVkEQLSfuL6n254SH2grqr29yIyAtzQVm5lff
	V2I7WM0x9hR6Jp3bvHHpPg3HOTZA2jFAwKKaZbh+MX/f8emb9j7hqY3RU0Y51wgXqaMLqZsNy+z
	l0z61I+tRhi1VZqwWDnrFrVyW8zPofUxHyeVRFrtaNwv9jLP5RpxVZupIZf88SIuheRuQz0rLFO
	OyjEF67TD/R/QsP/qF1lpdRb8st6N0OSeq09hHOV8wFHPIndqS1PPe4Kp4lAXz7rWkrFelTFPK+
	MZlm1v7cqW+
X-Received: by 2002:a05:6a20:6f04:b0:3c4:1916:9d3c with SMTP id adf61e73a8af0-3cd301428ecmr16874917637.15.1787647064570;
        Tue, 25 Aug 2026 01:37:44 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e60abbsm1835887a12.23.2026.08.25.01.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:37:44 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linux.dev,
	me@brighamcampbell.com,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 1/3] RISC-V: KVM: Preserve firmware counter value across stop/start
Date: Tue, 25 Aug 2026 17:37:17 +0900
Message-ID: <20260825083719.643970-2-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260825083719.643970-1-suunj1331@gmail.com>
References: <20260825083719.643970-1-suunj1331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_013745_567499_37A58716 
X-CRM114-Status: GOOD (  12.45  )
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

Firmware events accumulate in kvpmu->fw_event[].value while running,
but counter stop only clears fw_event[].started without saving the
value back to pmc->counter_val. A subsequent counter start without
SBI_PMU_START_FLAG_SET_INIT_VALUE reloads the stale counter_val into
fw_event[].value, losing all events counted so far.

Save fw_event[].value into counter_val when actually stopping a
running counter, and remove the now redundant synchronization from
the snapshot path.

Fixes: badc386869e2c ("RISC-V: KVM: Support firmware events")
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 2025b664961c..56dd5b1b2846 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -671,10 +671,12 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 				goto out;
 			}
 
-			if (!kvpmu->fw_event[fevent_code].started)
+			if (!kvpmu->fw_event[fevent_code].started) {
 				sbiret = SBI_ERR_ALREADY_STOPPED;
-
-			kvpmu->fw_event[fevent_code].started = false;
+			} else {
+				kvpmu->fw_event[fevent_code].started = false;
+				pmc->counter_val = kvpmu->fw_event[fevent_code].value;
+			}
 		} else if (pmc->perf_event) {
 			if (pmc->started) {
 				/* Stop counting the counter */
@@ -692,9 +694,7 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 		}
 
 		if (snap_flag_set && !sbiret) {
-			if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW)
-				pmc->counter_val = kvpmu->fw_event[fevent_code].value;
-			else if (pmc->perf_event)
+			if (pmc->perf_event)
 				pmc->counter_val += perf_event_read_value(pmc->perf_event,
 									  &enabled, &running);
 			/*
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
