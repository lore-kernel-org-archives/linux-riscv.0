Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFFDC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 09:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RoxRlUG5gfsPKvzjBDpSXb2ZfxGX7dqAZLbdppU6aSA=; b=h0XF6Igz+GUDZU
	D8ObFCe9TA5fyDXh8s9hpe67aqWPNH1cNapsvqfDDMO0dWihArTJU2oupEYNvNK5YORPmnFgoP7VD
	4yVvFlLmN0tiZ5uiDMB18FdKADnsmnN/HoLltDDhZDEREFyKaMM9qz9ep6pJfK32Pe5HZ/mszviGB
	K09jLNyIupnzrMxPVkHDqu9UVrGCN0z7WbJeFUrPOyIblVRVT/8z5V1VJLtFUQZn85vmLCxmNi9Zj
	xjvQ6/t9NhEYFws5XFT2Yuw01iAIRCYsaIh2lgDMKeoUbs7/LvWgkvndMz7ZguQyGSzv12il80KLW
	QzumOB7ZigX2Jrh6PYVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werY8-00000001EGF-3BxQ;
	Wed, 01 Jul 2026 09:48:08 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werY6-00000001EDH-1TTI
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 09:48:07 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-37ffdc718f8so255481a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 02:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782899285; x=1783504085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yrr5FtvU4l5TINA7e2cy7RSaKqJTIqgiZF3cWni4toU=;
        b=DXGHU593ElB87Mvsph6QW9xs8Y4dSw//nEPJZHi7BzXi9LC3Fvha8RUApI3kFTXHqy
         qI8dDvpPFAKYhBOwgqQX3QU8OLCX7t/nCzBoFdGslondPSWetVrhfgpX4ZoGpHjPK5es
         3Ppyy0TKtD0NTcXwtEAFlIBrODXhwKKk2TNxPBEq8TX44hfzGwRKMWtvOqKs/d7lkhks
         Wzr8rVFU7xXImDTv/XHZ2Z3Bg6mNj0lxg4anDYspILv9Nxd5eCkYGiZDHIn39pz2pbyA
         tqh8R48yuhFRfZ50dh4lQ97FDCIpJQzm9EOMIPWLoIrXE95W4RXwaDEoImPjJN5KWl6u
         fknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782899285; x=1783504085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yrr5FtvU4l5TINA7e2cy7RSaKqJTIqgiZF3cWni4toU=;
        b=AM6CAAQuFK17THhlYBkRIGCbDS8kZtoghCXy1LLEtaqb570UM6ojvm9Sf+cv3o7gcC
         V2k1j7xs7zaKC56ItMUhcEG1TTrSxSeIjHMOuu+yws/KnU/LLJUtepQ8c4dp31bA8HXl
         ShTpQ3ziIaEFbDC6kD7r/VfxBlB10Wy+y1dIpcOFfJzlFk3X6m2uBtTJsly8cbN0JbwN
         sfdwGG/bxy32bxkk9X4zVlG86z22ZdhzmX8JhjRva+JWkSJhF8TIh0DsvhV7O2zxn2Z8
         6Co8wKORrOyv3j0yXCFZy3TGFaUYtWgpE1dW5A31rpcVqetSS1fVlQecjo/+FcJCUFrx
         P4cg==
X-Forwarded-Encrypted: i=1; AHgh+RrH27fCTyBGrkENqdCA3pExUbCUgA8IEOBS858v0B4qc7hvOsRgNrzRQyaAqKp+0v1OlcQ4XxAmKWZFvA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1DDoh5zJ1lSvzO/945PhJiTNHJvcltXO/AAF9vP6AtQfok8nF
	Cc/6fVtKfOillAgdFc6lMEvSLtZWk2/W3yHEEdLKIXc3f9k8R299ooCD
X-Gm-Gg: AfdE7cl9tTgDTt/6b8viHuep4Mmq7AQW05g0RdXYIy7kcR2UbB5jhgaC+NjIudJCj7f
	xm//JX48aYVXCvI37hg2PqH/Yg49tqPXP+WycOpj+Y5MEwK2ShpAGyvUCn5/t/dGXtOcONnHdll
	mMrHCllEN7X5eVzhnpltqtIWm0ky9P/D1O1phCJSiB+++2pWqwVG+imlITpPZD5yjDKUYdyvHzm
	oUQbXG7nAha05oxbULq4aXeOg4QLTTCk7l2AOQxSkaFrmp0GehKMGQmZF/5SNONsXytAIcj30y/
	WlU4DQYLsoMYsVfe1Z6tUSwhPtnJsC0xoyccxeNUecy+zmyPCp05Ty7DA9SXvVWjtXyd+XA0HGE
	CZjYp+9AsxwOwHPtrcaaY6qO4mZwqrnIQUdbggP6x0UuHL+gK4aQwjRC/+PGQm10jfgnNL+zbAu
	nVViiS2crjT0o=
X-Received: by 2002:a17:90b:3b4f:b0:37f:9ce1:736a with SMTP id 98e67ed59e1d1-380aa21ecd0mr967241a91.32.1782899285410;
        Wed, 01 Jul 2026 02:48:05 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095ea9ef3sm1590317a91.17.2026.07.01.02.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 02:48:05 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/3] RISC-V: KVM: Add SBI FWFT validation support
Date: Wed,  1 Jul 2026 17:47:29 +0800
Message-ID: <20260701094731.1022163-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701094731.1022163-1-inochiama@gmail.com>
References: <20260701094731.1022163-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_024806_540276_57BB1151 
X-CRM114-Status: GOOD (  12.03  )
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

Since the KVM SBI has extension parameters validation support,
implement it for the SBI FWFT support.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index bc514ae6521d..74eab72b2dd9 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -604,6 +604,30 @@ static void kvm_sbi_ext_fwft_reset(struct kvm_vcpu *vcpu)
 	}
 }
 
+static void kvm_sbi_ext_fwft_validate(struct kvm_vcpu *vcpu)
+{
+	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
+	const struct kvm_sbi_fwft_feature *feature;
+	struct kvm_sbi_fwft_config *conf;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(features); i++) {
+		feature = &features[i];
+		conf = &fwft->configs[i];
+		if (!conf->supported)
+			continue;
+
+		if (feature->supported(vcpu))
+			continue;
+
+		conf->enabled = false;
+		conf->flags = 0;
+
+		if (feature->reset)
+			feature->reset(vcpu);
+	}
+}
+
 static unsigned long kvm_sbi_ext_fwft_get_reg_count(struct kvm_vcpu *vcpu)
 {
 	unsigned long max_reg_count = sizeof(struct kvm_riscv_sbi_fwft) / sizeof(unsigned long);
@@ -756,6 +780,7 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft = {
 	.init = kvm_sbi_ext_fwft_init,
 	.deinit = kvm_sbi_ext_fwft_deinit,
 	.reset = kvm_sbi_ext_fwft_reset,
+	.validate = kvm_sbi_ext_fwft_validate,
 	.state_reg_subtype = KVM_REG_RISCV_SBI_FWFT,
 	.get_state_reg_count = kvm_sbi_ext_fwft_get_reg_count,
 	.get_state_reg_id = kvm_sbi_ext_fwft_get_reg_id,
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
