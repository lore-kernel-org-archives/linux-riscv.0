Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767FFC61DA7
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 08:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y5KM/3+CGJRZvK6veP3uta0e4vCxUCN2ID6leeCDVaY=; b=1fXNOeNh7WQawv
	Dg2FVQL8DukTp05JpYuiy00tF4GSX5olLZrBlq8mDU94tMT5YB3RrlHHb5LSeGYoalKHqgz2CU2Aq
	bp2VHwgoMkScUO2q+w+H+iLI51EESZdXVgs0iWex00hMUKk0Qv9Z7KE0OaVF29lf2OJcIM9mJY/bW
	NltG8dDfxa0gaxxkBKW3187ZqZERwtG+sBtucGCzJjVQbYVsctL1UjEmKWGFGUTLjLIILQZKfJGA6
	Flkuvpq1xxxt5ShOTILF2YShacPyUKml5mQNsziAMi4zo7UblO7qH49h4szdEgH3g7VlOMntNmp7L
	ynprzZsxJRKAEMhc+75w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLga7-00HTJW-IY; Sat, 28 Jan 2023 08:29:03 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLga4-00HTIP-6K
	for linux-riscv@lists.infradead.org; Sat, 28 Jan 2023 08:29:01 +0000
Received: by mail-pj1-x102b.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso10844643pjj.1
        for <linux-riscv@lists.infradead.org>; Sat, 28 Jan 2023 00:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vEMGTnRapKJbFGDqzXqULLCIpjEAFBsGqGounWes3mM=;
        b=CiUkIqEVNKU4zMoYEnIth2esN6DjwehosPZnvfdBNZaBVx+QIsqSnb3XvpVSzMgsdA
         7c72VuAIcEoOuRPCWuZ8j7yx+vYMh7cSh5FrQ2AbmPttlPlVBV2vedTUlTvi0RkA9j7Q
         046kTqEXm82CcyvN6KGlyjfQ7uWP8JzCIk57lJnYQ0Ac3BwUxo2xChEt9biru1mBy+Wx
         R4Otzlvp3tFec2XLKM6Rt2JfqIgBcBjKwAltFg60PoB2xeKyGxn5dvZFu79dcIlz68lR
         mufhx/r1w29hnGKk0bzPQn02jwh3RO794lXFoSOU8IkkOLHqexgFW8bn4TrYlykkmfII
         KvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEMGTnRapKJbFGDqzXqULLCIpjEAFBsGqGounWes3mM=;
        b=WqQz4d7ZPm1FfBidz0o24tPk4mSfUxTf/a1+mZT1Mf4Ps8pWPpiMNCbvNobSvSwC0W
         pjzridxTJFZvicV8q3H2ulqYEH83yvZ9JRW3IcwXa9he339DMxmuRhbQtEwwz3njGmuC
         rkNEC1ARbpZCXlBmSmwL1f2sA62QpeVUfQC7E/y1JUYmsC+Zg0SdlapbG/NrEOHN0xjP
         P58Q8gbhO7QgjWNCfqIt/nInOs88+o2VVaZSmgi4C8BXpzgaPcvzDTIc3oBSzW0ZFIZr
         +w1i1YZ5dSVL9tJk9/GMSRJsiRJJgl11eJcOKuRtBT0jTTmUuf79Atf1GS5PeK0Z0FEw
         uJXA==
X-Gm-Message-State: AFqh2kq+dlbns3hR7JVqrehqMulEupUvtiaCaopKpMO132PRMIZdb2l9
	xcIStGpDSXvgi9tIIvGGExqQiw==
X-Google-Smtp-Source: AMrXdXufuuGP073H4Ffvdyu2Q6+4TGFlFg7nACE5QW5Se0OmVk2fD/f44o6Ry2CP/Ca95S5QsoROhA==
X-Received: by 2002:a05:6a21:339a:b0:b6:4270:6dfc with SMTP id yy26-20020a056a21339a00b000b642706dfcmr56156319pzb.6.1674894537513;
        Sat, 28 Jan 2023 00:28:57 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id i67-20020a639d46000000b004cc95c9bd97sm3477807pgd.35.2023.01.28.00.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 00:28:57 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 1/2] RISC-V: KVM: Fix privilege mode setting in kvm_riscv_vcpu_trap_redirect()
Date: Sat, 28 Jan 2023 13:58:46 +0530
Message-Id: <20230128082847.3055316-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_002900_252624_AE97A7B8 
X-CRM114-Status: UNSURE (   7.65  )
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

The kvm_riscv_vcpu_trap_redirect() should set guest privilege mode
to supervisor mode because guest traps/interrupts are always handled
in virtual supervisor mode.

Fixes: 9f7013265112 ("RISC-V: KVM: Handle MMIO exits for VCPU")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_exit.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index c9f741ab26f5..af7c4bc07929 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -160,6 +160,9 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 
 	/* Set Guest PC to Guest exception vector */
 	vcpu->arch.guest_context.sepc = csr_read(CSR_VSTVEC);
+
+	/* Set Guest privilege mode to supervisor */
+	vcpu->arch.guest_context.sstatus |= SR_SPP;
 }
 
 /*
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
