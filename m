Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF133F433CD
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 22:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+bAfWu9MshKJKJs+9Uf/2Bzw5EvliZ19tL7XW5NDfrQ=; b=ls4dW4XQWObn4A
	EirSjV5DtWaW3rAdy7Nv9yYnKnzJUBVs3UOUTl/lG4wkQ2g6ODNj7toehks+S2HOb4pMP2YbcCBX/
	8VvNDwlelcRXAbp7aUql+sLintUFIaY9ge3Y01cOp98zHq96MOs8lGZ0OMpqXa9Fs4YUEKVhf4m7P
	5FzxmUgcZSqEBrbfpXL81oEQxNKG3iOlHKGY2fjpkcY+5NUKJ8EsRqLy9eqlkfycYoyyx8YliAmZb
	3DF9iXbwnFAsdtuyTNWo0gGeQYWEV7ulGBvcFyXlKyc5Z/8AzVKAN0kf6T0DmDJDFx1lD63TKiEka
	kusUP79djaYFB1wHFbpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD8RN-00000001fIy-3p4X;
	Wed, 15 Apr 2026 22:10:33 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD8RH-00000001fIE-1D9R
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 22:10:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488c21c636dso44651575e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Apr 2026 15:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776291025; x=1776895825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gu9AQw7MI1mCAjsGD/n0+Be2DCItWXbhRChOUsm24MI=;
        b=F/NzA5xM3sfj/palAWln3SSJeciKURawdAKImfmJGAMRFxvJWJqV4cGkyR649ddcL5
         btlL1mw42alVRGxgtISZix36BiBraiZ/qzO8c9glyxH7hn9Tvj6EdXGW3ugWvaMqYIpP
         F61hi1pJrUvrFNkg63LUjByJG8Yht/0JdGQOea551vO1cMiXr8c6ioL73Ck4R2M2TdaD
         8sZIcY6Paz1Ta6aHQ0DSdBVU5lAoRtpLIC8+wna+3Bs95O3EK8AC791zbnnzTclp/yk/
         WLVBEmb2ymH7BrpsdqXOAKLuvlqPicTfL9FOcWHgN3S3B6uEk0YIFPT9FgioPpiQvboF
         BqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776291025; x=1776895825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gu9AQw7MI1mCAjsGD/n0+Be2DCItWXbhRChOUsm24MI=;
        b=EnEjFoQHgFC+YQsGlYCKsZ0XTw5kFPKV9GkKsPdk5UoG54EcEpK6oOaLDDGW7WBn31
         7SY5rNJlLMcdZS06UOlk2oiPMdg67Hzt/ByFZPB5nqUj12nTTFCbIRRTgdbCAVZMiQ9Z
         vcsK7oVciibubIhCsbzJjXuIIJVTc6ayyHaT9W7tPKq8f2JPu16ntAjjePqsPoyi5CPf
         OJ+QA0v+UGst3y7WstUuK7Kuk+ETWLV4HognrWk3dPocDqtYXJVYzHfxItu6Z33W5LVe
         8w/jaTBHa4FmqAKH9gPvVHbIdVNEYo0zFaXAZJbWeFTM/bUhRPigk+32KHASZurn3aHF
         BcVA==
X-Forwarded-Encrypted: i=1; AFNElJ/KC4i9bauUj/JFfK8flzlY7PwpWu1sx0Vbg9p0CTYCTgwDRQWn3zeKjKMNMjuCnv4Vd+1bQzSt4UyyqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxD6IxxN9Pxj0hSeSqt2wrONVpp53Qr4HadKl/lyizu07d+pv3R
	VHCe8q4ol19yjDL3WlfpdwsNuycMD4SMWsPHFYf6xpmR+obtNEL39n2j
X-Gm-Gg: AeBDieuncCNmkXCFCe0RzP6xWezqWDCXkG/U9/m19W4KrdxTho43wC4thkxuDPAo7w4
	+QIuj+BKf0vCyIfXtyGyjvLPFCpAud3TGCf/rxO4oDszAzZHyYYPPB23e2efZrv/hxxWF+Jbldc
	FU6R2+aTNHwgNQDczuIKf8SpPOdLrthFA6qKI6MRxLUMQhMibDYgnkVR3d7uERI83PopzixWR/i
	GK9zvt6q2mQEnZOVSux8vZ7qBbbmmQU4unaeVXqFVxx10/v5mfdcwnqq0kN+4LjfEG93UcL8Yeh
	Bpw5M8GF46C7K10Lu2Vv9MgyA7hum8kU1mEWhn80a0zrL79PbfFClfhuKfl5yq1+W3uFr+Yo8x9
	oGFTiH30Kh7Ff8cDOWD4PuRjekYEVQJV2WIpNJV61w/oSw3wfK4oZ4PolAK1Y70T7ICqce3P+td
	YEA9yz3qKNAkIep4/gHVah9BvXJN07yu/uAVfMGElX4psOby5lR7uVBQC7V64=
X-Received: by 2002:a05:600c:474c:b0:485:35d3:ce59 with SMTP id 5b1f17b1804b1-488d68101edmr302262415e9.10.1776291024748;
        Wed, 15 Apr 2026 15:10:24 -0700 (PDT)
Received: from osama.. ([2a02:908:1b6:8980:d20f:daca:461:1a54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f5818e51sm2095695e9.5.2026.04.15.15.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 15:10:24 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [RFC PATCH] riscv: kvm: return SBI_ERR_FAILURE for PMU shmem OOM
Date: Thu, 16 Apr 2026 00:09:30 +0200
Message-ID: <20260415220930.287592-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_151027_974522_6CB18195 
X-CRM114-Status: GOOD (  10.00  )
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

kvm_riscv_vcpu_pmu_snapshot_set_shmem() and kvm_riscv_vcpu_pmu_event_info()
returned -ENOMEM from the SBI extension handler, which caused 
kvm_riscv_vcpu_sbi_ecall() to abort KVM_RUN and surface the error to 
userspace instead of completing the ECALL with a negative SBI error in a0.
Use SBI_ERR_FAILURE and the normal retdata path, matching other PMU
handlers and kvm_sbi_ext_pmu_handler comment.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index e873430e596b..f36b099f447c 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -435,8 +435,10 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 	}
 
 	kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC);
-	if (!kvpmu->sdata)
-		return -ENOMEM;
+	if (!kvpmu->sdata) {
+		sbiret = SBI_ERR_FAILURE;
+		goto out;
+	}
 
 	/* No need to check writable slot explicitly as kvm_vcpu_write_guest does it internally */
 	if (kvm_vcpu_write_guest(vcpu, saddr, kvpmu->sdata, snapshot_area_size)) {
@@ -480,8 +482,10 @@ int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low
 	}
 
 	einfo = kzalloc(shmem_size, GFP_KERNEL);
-	if (!einfo)
-		return -ENOMEM;
+	if (!einfo) {
+		ret = SBI_ERR_FAILURE;
+		goto out;
+	}
 
 	ret = kvm_vcpu_read_guest(vcpu, shmem, einfo, shmem_size);
 	if (ret) {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
