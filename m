Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4FD606A328
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 06:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eNuqqeei;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HNUlO67k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=o+blAvQWYqIGfs+Ha39DKqlKgXRcscY1MxaGVN/ICHY=; b=eNuqqeeiJ7wIyXLHZuIc4nmSpH
	+oY/PJ2E2A8r1fLu0bHSzXFJ4uZQS3L6aH5ZmxVH/Ssg9KJZTgEq+9HzKOlNQWHlWRuSmii7yX50O
	Dps7H+OkoEFERjdURE1DI9vtQD1gyYDxeLRsVU5jleHGeoN17C3ZhUbnV1wiyKk6iD5VMmoG7S5t/
	J29culIeZrTt/cLpzlOKVIBOdp2KlDnonoFKzWaeqkPaVyAFHHLP8o5BBR9yGKPU2FBW4XZ4+GKQD
	dXvGTrIuuf3tFk8Z8u9wVO6m9iVjU3YmNoRcZsFFmMQd6sGZUipI4gChLQQJtTA25DmzBSVvfjSEN
	EWwMwUGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLadT-00000003pnG-45yP;
	Tue, 27 Oct 2026 06:26:15 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLadS-00000003pmW-1f3n
	for linux-riscv@lists.infradead.org;
	Tue, 27 Oct 2026 06:26:15 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2e940d5d2beso14386225ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Oct 2026 23:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793082370; x=1793687170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FNh04yRIP0CE19slce4i4RIxfhIIH5488gtyMIknFlY=;
        b=HNUlO67kPti+bhF14Py0kau/++fRMLy/rh4u1wNeOWkZHUE3eRO6gMk8tR5Su9B3tW
         tSeDFUqtgHG+S45HH5Ss70ONXgkNqExh3T/fSYuxqSjzZeG1ucyaaT7id0jZ8Nh0kH56
         kWxnlJZwferQb9cyCcGqQrYzu8UKISUHocicvUQzmv3iTtV76jcVy49w5h+m58UUtkQT
         RqjXqKjqnCNk3hgZq5AFbV4J7DFkrvCnsrjFOAbe/jUAC538E3WviEV7PuapInoMyXYL
         FjxG1AdViB1/NFkbXkKttNORTWNvm4aTwpQpl847eEpRWXVWcs7YNQzX+aqESAaZhhkW
         4g4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082370; x=1793687170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNh04yRIP0CE19slce4i4RIxfhIIH5488gtyMIknFlY=;
        b=wI5py9j2cLWC8c1qmKWpYqh5gwPZK6tS7KVc0pE9Qk/Alb3jxwuGgiwn1F6pf4xREL
         wysxlVyI1vPXdy4phORYj6ObSvL+GGDB2J1NOSrJzHMRj2Y1fmWqZvtOvTLVg+FuaiUM
         GTe8MyqlK7fdcLyyzKkDL9omEa8xdpHMCLE5HP/OswHl4pNjxmoxTVqc0/L2ldVoDJrZ
         J5grlp/4MEQ7jeGrd0r81XUbFKLv8t2IJQBpZjJX/G9qZrISndA4eCFPLcJ4/lffI5DJ
         xTYIkczKxSYz/tcrpm6CcU+yFKLD1WFH3QD100EV0sdiZCvD8OkNighsAogIB3Q1AWUg
         6L9A==
X-Forwarded-Encrypted: i=1; AKwUvBySTFKLiIEIhrr9ire8Tjn6XU6Lc/GcB7zWlEIsUH+eYtGHG7qP60XLnztoToJEbRxAd8O3NRAA/T8frQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKacOP5HJkzbwcgkieicazpSE7MWb3esKnem/yMHlUfm594HFhS
	e2e/CPdPt2hIwnMLO1fRMVuXWQub04/VqBtM1PzIuEmHN2QaO54S99cRboah+Nfv98A=
X-Gm-Gg: AYBFou2YfS8ud3IQ/XyQTKM7RUnWtnGA34sZDs3/2I1tAJ1mIkpNbfAdwGSeXKGM3Rh
	zidNo1wJn5ERK7GFm3+ddcBMsiXJlNLe6nNf5bXcT7RY3nPTJdCjL1DswBifi91z+ctvUqIRYtP
	6ZH1zbSNegGTei7RXHTtVNMHAnC05DxjTQOU5VgJriVCzOrYwW2y26CBWInt7aygTFQdoqBLtxG
	Nw/H7QH8LjxlWQhDaVTa6SMkBKB6r3ztVsEUO6M2Sd9Vpsw8Nf7AwhqmMrYz+DV2Mp2tDT/Syri
	QbzweZdykDUlLv6dsAB6s06oze0HRDHfEldT7GWfjRbQ460XjV3KVob9u2ujgKarV0v/WWxGWD9
	HVweJG2tONnBAV+9Sgm5r6Df7way7Au7ZA3kEvGsE39IcNoKg1PnaN/haoRXQ+5pVq4VpYCW79i
	kNvr/UJ3byauubuK4dBJ5PtV4Hb+MAXBwhFicx8CC2SYxYHjV8HuyPDxVMlSNsHrVos8dIOIj8d
	pJA5FYfnLc6docSKQzoiyfPYR372RVA9Xyhm9CiTFefnEaWA9putxzx0IHoOG9Uc1RarTu+LqdG
	YTPwFfrB8Wfkol1paH7plpHYUrfZ+dCnZ6d7+I/Y5cuyicUYTg==
X-Received: by 2002:a17:903:26cc:b0:2dd:c0ff:e727 with SMTP id d9443c01a7336-2ea9c913694mr67964825ad.57.1793082370138;
        Mon, 26 Oct 2026 23:26:10 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b79ce2sm4079055ad.21.2026.10.26.23.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:26:09 -0700 (PDT)
From: Qingwei Hu <qingwei.hu@bytedance.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Qingwei Hu <qingwei.hu@bytedance.com>
Subject: [PATCH] RISC-V: KVM: Validate PMU counter info using available counters
Date: Tue, 27 Oct 2026 14:26:02 +0800
Message-Id: <20261027062602.323691-1-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_232614_467621_D3B9EFCF 
X-CRM114-Status: GOOD (  10.53  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

COUNTER_GET_INFO validates the counter index using the pmc[] storage
capacity rather than the number of counters advertised by NUM_COUNTERS.
When fewer counters are available, a guest can query an index outside
the advertised range and receive success.

Validate the index using kvm_pmu_num_counters(), matching the counter
initialization and read paths.

Fixes: 8f0153ecd3bf ("RISC-V: KVM: Add skeleton support for perf")
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index e095d1ff439f..ea788619091a 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -560,7 +560,7 @@ int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
 {
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
 
-	if (cidx >= RISCV_KVM_MAX_COUNTERS || cidx == 1) {
+	if (cidx >= kvm_pmu_num_counters(kvpmu) || cidx == 1) {
 		retdata->err_val = SBI_ERR_INVALID_PARAM;
 		return 0;
 	}
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
