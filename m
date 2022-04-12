Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B27EC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 10:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/X3f+IMuS+g3zcQgFl46sg8zUrTS87TZgdbjz6kpYmo=; b=cuWrZvsnEeBnG3
	zx+qAO0H2az9yHUtViqIAq7TLbKo9tVSf/v6OE0kokquE/dC5oirHTjT32IIM9BwvMakhN4u+WNKV
	OS32yp07XJoGeyN8znE2ph8aqHMxqNMXu+Nj9N5WioI56LWOD+oAfSrVRFKNMvlRjOXHMp24Y3NJW
	nmEklmRFsypR+ovq7HEP+c4xeoJu1ep9qokGEbsz/STLcmj1mtRFQHobrbofot3MI0cUUjm/2wxrA
	TwKsBrYQF5D/vn3h+RAkPrrGX9nEnEF7UX1vMXU/Zh5h8/fl5in+w9S3Rm5P4PJiK5DYSJNZeFBUj
	hf+6JX4KFBI3/7XLN8eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neDSM-00DAqC-75; Tue, 12 Apr 2022 10:09:06 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neDRy-00DAbM-Hd
 for linux-riscv@lists.infradead.org; Tue, 12 Apr 2022 10:08:46 +0000
Received: by mail-pf1-x431.google.com with SMTP id a21so2135878pfv.10
 for <linux-riscv@lists.infradead.org>; Tue, 12 Apr 2022 03:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5aKqoFa3PS3ofFsonmsRpILD1LHcN5f7ZDBzSGfsEbM=;
 b=ipNGq4iM0/5nlKBcJA0RfUYvp9Rr6U2GBDVhfGzDbwMM7QRqxO3tkO71gzVyoaVmyw
 pxYq72frVesdN580nWmwdlgZjtdbjkHgDPRknZvPvC77QqSIPucZ3kzcs1iduI71F9VD
 CJuegbEDoSDKgK4VR/rjXyqXmEcsk2DgX+ILLvm86Q0Bh1BaVgux/GspmTOI+cb5pEjI
 pxDAf5zVkqsYVX2BwgHBGLurHEQXOUE2Thu28cfE0yA5NfkFaKHm2Tj7ynpHHaMVos5Q
 eeaNbwd5u3GbYkrSh8PslJkhe7B1bvA14msLKO6BZE18MLW3Iuwk3h3bp1834tybWMuk
 CGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5aKqoFa3PS3ofFsonmsRpILD1LHcN5f7ZDBzSGfsEbM=;
 b=ZAVhmut9Nu5eiXPhEQfFln1wMgEw4cuzAGMA6H2ap+wBC2qixNyQsVndWXNG7AkKpJ
 7GypusIuT1jwMBdCCqkM7BLxWTZycNW60oPn1pjrxCO/LUrHLrYRcGn7RsO0AvsCHQ12
 a8JvCShL2xY+UDP70g0fPo3ayziszC1Xu10JL5WBXkpjzJqA5Kw1iT1fcQm49rLoKbIq
 iuDyCbdhXRXxMt+Q3sdC3gG1kkFc+WKtNEVcc0Mey9/IjnyxY+jfj5eZ4w7sizVlLCBR
 DRaSkfvJK7QDK9mbSB1YVDR96k8k9fOdJo/0M9Tkp6XS9oXm+723DVDyPWHmbTQAyc6A
 y79Q==
X-Gm-Message-State: AOAM5314pF2R+mBC1Fpbs0mtvxuyzfyuvhXbbPJKwXKtqCSnjTsDgz/A
 0Q4ybhtLAvUa0cRYG3bLR1YDjw==
X-Google-Smtp-Source: ABdhPJwMUMajCWSxEXnVkYfknKU+dGYsenmvrM0qkhhwA3pG3r6bUDiyxS+dtaTDRrgSBmM0/+q7sg==
X-Received: by 2002:aa7:88ca:0:b0:505:d092:16c8 with SMTP id
 k10-20020aa788ca000000b00505d09216c8mr6642112pff.22.1649758119472; 
 Tue, 12 Apr 2022 03:08:39 -0700 (PDT)
Received: from localhost.localdomain ([122.182.197.47])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a056a00130900b004f73df40914sm37515088pfu.82.2022.04.12.03.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 03:08:38 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 3/6] RISC-V: KVM: Treat SBI HFENCE calls as NOPs
Date: Tue, 12 Apr 2022 15:37:10 +0530
Message-Id: <20220412100713.1415094-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412100713.1415094-1-apatel@ventanamicro.com>
References: <20220412100713.1415094-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_030842_665735_8BAD9638 
X-CRM114-Status: GOOD (  10.11  )
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

We should treat SBI HFENCE calls as NOPs until nested virtualization
is supported by KVM RISC-V. This will help us test booting a hypervisor
under KVM RISC-V.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi_replace.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index 0f217365c287..3c1dcd38358e 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -117,7 +117,11 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID:
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA:
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID:
-	/* TODO: implement for nested hypervisor case */
+		/*
+		 * Until nested virtualization is implemented, the
+		 * SBI HFENCE calls should be treated as NOPs
+		 */
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 	}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
