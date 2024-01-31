Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD04C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 12:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5YOB8jtcNEBHOYxydrBKiX3F5xq0LqGK+EI3/d8inXM=; b=WA+J2YaCJLxUoh
	+KuZ0i1Ft1yxKrSJXBiRKZnzNbaFbZLFCSu33Eco+q1iYFTrM50H++IHucl6yhXxv6mpPR8gVhCb9
	/W2vpvWaYTX+riaPksVL1SB8SAMOkz+bvLaU09QgKIusOIsxf/EwfrdBta0+6rHcIXHX8TiAgg5Rp
	1VXU9h5XjzuZjWPnBIDTL8fYkRrrvPRrR4os5u4R0sfxFTYnJofUVB5ohHfR6Z7jqvJe5gFY10xIr
	EsqK+L/i3eWUk6LdFZqyChMjauWxPVvWciWxx1Yq8ywjDb5Hhit59x4AsbhBEWXnYr17wgDMZ7tIK
	CMUSs0LTZ3yy8pDUIbCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV9LJ-00000003GYa-44uz;
	Wed, 31 Jan 2024 12:05:25 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV9LB-00000003GSc-2wJH
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 12:05:19 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-55f0367b15fso4113069a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 04:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706702716; x=1707307516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/0LGl9WG/KzeVYElHwd84K3m9f0ISp27bonGhBK6lw=;
        b=ZX4J071Nhv4cEc2CAGbbtO4hWCiEBoYE1Irh1jtoUpaPNptxb6uO8g51TsuzHqFLKf
         UR6IQTAvX/bbLfjBchAZAU0Mcpk8W4s1a+/LFmdQvnmfUNT7DTu+XHXSLHCsLItf01qD
         35iEAq892ZUMuUWUZXtqXIELU7CGZc35A/jhkhvAl0wZ3V6FZFv9hWSfJFc7mUoAHJZj
         eybx0YM7LvhanYC+eeFU3GNgyfeLxt9SwTDjWIEcDuhMKpcHBDGauhfHSHhD6jh74q28
         N42TA+K2ZUTkLL9OVgcahwFbeR8LqrPMC6NG7P71B6t5q4FYQ1N/65/loL+5GCpi6Akr
         UQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706702716; x=1707307516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/0LGl9WG/KzeVYElHwd84K3m9f0ISp27bonGhBK6lw=;
        b=DDHzzibOyVofhVL6ybBg87UlU+PhlYBJVJQ18Oqvku1miNH6ItvAe6H5ZjOGc1RfbM
         LMEm5yt3WVE2uuSfeZGzyp9OPY/8ndV2b0HyRiFNrMxxOqTd0BMc0P7KtvY8J67jNwU8
         /1DzJTakeQryI9vhWdEB4IxBFKDvwgI56wJUx1Htcr9LAJXmm5XdFKGg3DlUirEPS1Aa
         VtYieglaNRdzMAkaPM/DTW5nmAGmuZPhvdFl3eXXBBlPiI/eGCuvgVilpHaTIl5KUCC4
         rcMJ/+uN/mo22gsnoTLy3GGvCm75abIuRsly1cIifHzGbWvbANASRrYWNXFz3qMN+iLs
         i+FQ==
X-Gm-Message-State: AOJu0YxHuzNk0FBOSmhY1NAetHyxoZIrT1bxj+/bxUqkb8viiYgLu4O6
	i5+8dNJ+1GAa69ZuecdS4emaHg8lAbO+hwHgkrfZ8pFfyQfd11j4szjKiel+F4E=
X-Google-Smtp-Source: AGHT+IHdrBPtdLFcPhY83T9ZrVV+224JS7L5qhGRWIZB1FspaedfeW/G5skcnPUTAAQ3DZcsALwwBQ==
X-Received: by 2002:a05:6402:1604:b0:55f:8bdd:f990 with SMTP id f4-20020a056402160400b0055f8bddf990mr805709edv.23.1706702716470;
        Wed, 31 Jan 2024 04:05:16 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXzUo5QQJQ/giwvtOTKFzukoHcjeMWPWj6EAzWV3mc2FRczUxTRCUcQZe4LbyyVoL2fAME5nJ8+M6rc8lr9//rfRPMpwZ/ETllBzx4BF9fc2NKnU1z3NsIBn4994VI59rp5ecHE86d3abS9T3HiCo7x4v+hx53k1wsZlh3y1rbn1fT4HRBsmLsRa7sEmY5PUHhJou+c/TrU8HjTf+zQZl/YRKzVkSqB3H5iWspUTtRfIMgbQA+caLdZ5BEKzYkQh9h7Co42baYR8tjKsBs8omrEsDFY
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id d15-20020a056402000f00b0055f1af929c2sm2408250edu.28.2024.01.31.04.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 04:05:16 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 3/3] RISC-V: KVM: Use correct restricted types
Date: Wed, 31 Jan 2024 13:05:15 +0100
Message-ID: <20240131120511.200338-8-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240131120511.200338-5-ajones@ventanamicro.com>
References: <20240131120511.200338-5-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_040517_798584_17AB76ED 
X-CRM114-Status: UNSURE (   9.19  )
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

__le32 and __le64 types should be used with le32_to_cpu() and
le64_to_cpu() and __user is needed for pointers referencing
guest memory, as sparse helpfully points out.

Fixes: e9f12b5fff8a ("RISC-V: KVM: Implement SBI STA extension")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202401020142.lwFEDK5v-lkp@intel.com/
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi_sta.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index 01f09fe8c3b0..d8cf9ca28c61 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -26,8 +26,12 @@ void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
 {
 	gpa_t shmem = vcpu->arch.sta.shmem;
 	u64 last_steal = vcpu->arch.sta.last_steal;
-	u32 *sequence_ptr, sequence;
-	u64 *steal_ptr, steal;
+	__le32 __user *sequence_ptr;
+	__le64 __user *steal_ptr;
+	__le32 sequence_le;
+	__le64 steal_le;
+	u32 sequence;
+	u64 steal;
 	unsigned long hva;
 	gfn_t gfn;
 
@@ -47,22 +51,22 @@ void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
 		return;
 	}
 
-	sequence_ptr = (u32 *)(hva + offset_in_page(shmem) +
+	sequence_ptr = (__le32 __user *)(hva + offset_in_page(shmem) +
 			       offsetof(struct sbi_sta_struct, sequence));
-	steal_ptr = (u64 *)(hva + offset_in_page(shmem) +
+	steal_ptr = (__le64 __user *)(hva + offset_in_page(shmem) +
 			    offsetof(struct sbi_sta_struct, steal));
 
-	if (WARN_ON(get_user(sequence, sequence_ptr)))
+	if (WARN_ON(get_user(sequence_le, sequence_ptr)))
 		return;
 
-	sequence = le32_to_cpu(sequence);
+	sequence = le32_to_cpu(sequence_le);
 	sequence += 1;
 
 	if (WARN_ON(put_user(cpu_to_le32(sequence), sequence_ptr)))
 		return;
 
-	if (!WARN_ON(get_user(steal, steal_ptr))) {
-		steal = le64_to_cpu(steal);
+	if (!WARN_ON(get_user(steal_le, steal_ptr))) {
+		steal = le64_to_cpu(steal_le);
 		vcpu->arch.sta.last_steal = READ_ONCE(current->sched_info.run_delay);
 		steal += vcpu->arch.sta.last_steal - last_steal;
 		WARN_ON(put_user(cpu_to_le64(steal), steal_ptr));
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
