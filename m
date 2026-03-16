Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27612F53D65
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 15:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RaklXsrBdyRFQToPPDTqcOVpW+b+NbBzhI6vJP2lRJU=; b=Z3WZkyXddO+a16
	LUPnXOxvaQSoZvikmL4hDDYFYmhxYVoGdMWhPF//jCjJni9JhjsIgYFyMPbXm+jxgjR2SYd5BrC7H
	EE1i4B/hQOil6U+5MpkenEt+HWB+5zsKvUDWrSqKfZUPV096fp7IbcmDG0NKJs45D/oj0tFNlZjez
	omCJLThc+83GS2hew/EM1CGshBpY6YQyDm214oGHkMdmc2U3pH5umkgvpjLdeTqPXH6F9S72L33QG
	P3x8ISsWaSlNzlGCGn7bw0kQgLc46GGaeOUd++L+n9G1K7futTlIJkm9vJ6Hxbm15uyHls1vdhp51
	sMT0BrmMJ+TilldFX12g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29g9-00000004J7a-3ZXh;
	Mon, 16 Mar 2026 15:16:25 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29g4-00000004J4f-2tzu
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 15:16:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48532925a4bso24417645e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 08:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773674178; x=1774278978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IGf7yZtpUu5J1lX6HR+56oGmyUxqirhDSxD8uYe+Tfg=;
        b=Ts3vV1V3PMqXhHHo/A7SP4+zXJMG5lKmK5iqntAj8a2qXkDTSloqpRgbTv4hnowsTP
         gA4ytRe7dNncd2bO5BBvTgIQEuFhpms4tdatUsSwU+tQ63anIFzki6RugSll4vAYDBAf
         GbHaGcKU3VMY6RU+HO7NXglUb+OoOVnvAwMc2neogUX/Y9VUbiG/TS8PBodWA6MQeBnZ
         9WO0t2eNnGIY/YZ8dpeV1msws5Ktv/fvltmrMZrU1rZaloTjaeVmMgPGnZEozX/0ibXt
         7/FsXKiMYpF3xL2CHe8HLKRRFzlZcyO/34EfAfhdcOggkVUl7P2ambFbiwSL7yDuzzh1
         qXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674178; x=1774278978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGf7yZtpUu5J1lX6HR+56oGmyUxqirhDSxD8uYe+Tfg=;
        b=km4CWYvQXubvxLE1SpMQa0seLBNRMDbYuVuC92Gi7QS3tiqHA6mE37gYvt7c/nfP2x
         4Dqwiu7qs9V0xF7+pQz1pxhiWs4+wzWDXnUjp8VduxtkoPydlO/x3o+b79RyslA/N11m
         mzagRfE5sCuDl5VVpOuUtOvPfXU2RWDGGkrhep9EknVlm9fWdMmoeeingJjvCkq+FuIi
         MAPcnOU0/FopW/t3CzoRYhwQ6b/Sj1GIMY3nmQpqQWn7jAa2ZxplOYdIFEhiwSZBjDNJ
         0fFkgI93RLYzmN1cQ0UMW0VVQapjXQZstKGVNFVOxCXqCt7ny9/OK2UzP5R7/KY26jyM
         12Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXGyBdDKhHFpRzOd+0NDURp1Cx7tYMuWg3tzmS1O77GxhAkyRmqodon7MJl1GEeT6x4RWTTzv/PStD9xw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu8RGAiExl5yEwokDcPuLET5jzoeXxf6CRw1kU5IHGqIYdSbdI
	7/YXl7vCChlhz5SAMxoSJMF7JuZbVe9K3xd1wxNo5ZlniqoGrJ3lRvHe
X-Gm-Gg: ATEYQzzL9VvdMSnkxgfZ5koPiflTsIZf26l9Du51ByhNkZTUE9kwIRHVKiME6/a0sGp
	gnTWhR709vGx7cLnBuv1+PAa6VSCW2klgzrauSJAlCUA/Fla/MFdfls2pkHMvTFwt8/Pb/a4oI8
	hOPEGDZqTpdsg84zL28TpOgBbMFm/Qq+WK3BtTUKRlA2I81fABzGpgTNKiyh27Q+YJZE17fqi5R
	uwi557ELAQrT4FA4OFQgMbTVjgKKJLhZkMMYeL71yj+ySDKzqBIuvSEyviYoDFaUWjSbGWP58QO
	cpIpfjsY4yEUbwxChVMSqmIQEVJmalkfzoodKiv7vZbvLEYKAeIqiGtbFk0KZcwinXKu/x7a1Uk
	Fm9rlOJfE119H3ZkAL0/pqcolns/AgBsFp2pg1b8HxI01ZA2YxIrVk8Dth3RbiW2xzLL6HD3Pav
	MiHvlLGomprbSxaINi2lXWoARnts7D0XS7Gn086iUVqtv9VoAnBPteuCycMw==
X-Received: by 2002:a05:600c:c162:b0:485:35ee:f836 with SMTP id 5b1f17b1804b1-485566c94a6mr221915275e9.2.1773674178274;
        Mon, 16 Mar 2026 08:16:18 -0700 (PDT)
Received: from osama.. ([102.46.166.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48556422338sm99206145e9.7.2026.03.16.08.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:16:17 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andybnac@gmail.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] riscv: kvm: fix vector context allocation leak
Date: Mon, 16 Mar 2026 16:16:11 +0100
Message-ID: <20260316151612.13305-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_081620_743296_5C44D997 
X-CRM114-Status: GOOD (  10.37  )
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

When the second kzalloc (host_context.vector.datap) fails in
kvm_riscv_vcpu_alloc_vector_context, the first allocation
(guest_context.vector.datap) is leaked. Free it before returning.

Fixes: 0f4b82579716 ("riscv: KVM: Add vector lazy save/restore support")
Cc: stable@vger.kernel.org
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
v2:
- Add Fixes: tag
- Add Cc: stable@vger.kernel.org
---
 arch/riscv/kvm/vcpu_vector.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 05f3cc2d8e31..5b6ad82d47be 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -80,8 +80,11 @@ int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu)
 		return -ENOMEM;
 
 	vcpu->arch.host_context.vector.datap = kzalloc(riscv_v_vsize, GFP_KERNEL);
-	if (!vcpu->arch.host_context.vector.datap)
+	if (!vcpu->arch.host_context.vector.datap) {
+		kfree(vcpu->arch.guest_context.vector.datap);
+		vcpu->arch.guest_context.vector.datap = NULL;
 		return -ENOMEM;
+	}
 
 	return 0;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
