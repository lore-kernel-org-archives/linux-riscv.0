Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA80FC001B5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 17:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Ww+cSg5LrX9Sz61veBdt+YaQXvE4XWV44hu35l4VpE=; b=bJkzUKasvTM249
	Zf7k3Cj0zZwR7eyI+DafLJqQ3VVgQzYufHmv63zpb2kbJPqE7Xsac8C5EEv+gECZVJrvwfzG+e4t0
	Gwu2KlooP8+a5l9p3Y8Nd8OIZrdw5dfSP45BdP452c/3MYCqEK3ixT3D+OpJr3d1udJjYMIllmG+I
	AZOcsdeFxGTCepPgP7P9TJlL3Qz4icvq8cjkSWo835PMUfAYu0fKJOptX+B8l2iHeR7jIoROOyWsd
	3WKkl70xfmZRvw8OfnRCMm/hbrz0D3PbBXHRcPVpetMbRKn7mX2+YAgqULak0NgnjH0UE6RP8rPjg
	xL4iKVTkcLmda9ynB3QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUA3W-007bc4-CA; Fri, 02 Sep 2022 17:02:10 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUA3U-007bRs-5B
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 17:02:09 +0000
Received: by mail-pg1-x52b.google.com with SMTP id r69so2471436pgr.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Sep 2022 10:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=IdtU6srtyQUAra4AuQSnCBSrs6xPYmqcvUoxT84dqvs=;
        b=h6X6Jml+DFCgSlcblU7ih6G2hbgk9gPVz4m8qUHc5LeRkRfdc+Q90oEQPsOKEjx4mX
         75o8Q8QOeg/L1reH9+QfSoZQQPeeX7bKiQSpwwL2uNar65Sv7Os6bFo5qDFeKG7deg3X
         WyPv5UB0Ex2xD6K1KBZn7ViHcxlgBE4QdTV7GmDGFSyqOhh9RCLpk2lEaVYw7KAUUgQn
         tYHdVrGbqDc5AQJXZ4EOPCSu2NmWdpOHAOEWgfdiZN+9IJH8ekLSrHfAbMNLCsd05fJQ
         jAau0uoMXjVcdGhajRk9xw6tR9UdZ4n++pL8mQJH+NPbKOcdq1xDwN11izhb+qDSGh1J
         XPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=IdtU6srtyQUAra4AuQSnCBSrs6xPYmqcvUoxT84dqvs=;
        b=BmklUqdno3jtAzt8DQWPxAWvqpkSRjonbrbuWs6ERvMT6evZgfCyw/wVhbc6iFGfce
         E+IkG4GZnuUBdmYP0gO5dEB/WqGgrwZQJEd71+6OQBMhUE0+jo3TCnlgV8hSkanzlMYa
         kANQrzszqy4maHKvBJUd5megEU/IUjlYYShmSqla8/uJmkopyxBeN3eUxy3ELjguy4Ji
         kojvGBb+Pit36HhSloJ2jEiYH/sqNib5uD/4ih0g2jWBZjUDRCaJULgB2uLFijlnuE7t
         C5WL+TXgpvEfvpWwB+7dLwEm794eXjbh9KmMqsfL41eAzOtdS+WNoPv/IMvb1lcrkieB
         zDxg==
X-Gm-Message-State: ACgBeo0sf68K2QpyR2Wnmao8DPEzk0/G1kjlrWkAmFIM+Rfqhhy6xyCK
	1BzkFYup4d89oG47X56AQMXxqw==
X-Google-Smtp-Source: AA6agR6s8PyY3S+hAOSutXy8mJL01o/t3sjUFMZZYl79YgZSuqG1Ot/bMxugG/CWnUDsB4CVdyQgLA==
X-Received: by 2002:a05:6a00:8d0:b0:53b:2cbd:fab6 with SMTP id s16-20020a056a0008d000b0053b2cbdfab6mr6003300pfu.3.1662138115408;
        Fri, 02 Sep 2022 10:01:55 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.83.155])
        by smtp.gmail.com with ESMTPSA id w10-20020a65534a000000b0043014f9a4c9sm1638800pgr.93.2022.09.02.10.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 10:01:54 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 3/3] RISC-V: KVM: Allow Guest use Svinval extension
Date: Fri,  2 Sep 2022 22:31:31 +0530
Message-Id: <20220902170131.32334-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902170131.32334-1-apatel@ventanamicro.com>
References: <20220902170131.32334-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_100208_223886_826BE8BC 
X-CRM114-Status: UNSURE (   8.38  )
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

We should advertise Svinval ISA extension to KVM user-space whenever
host supports it. This will allow KVM user-space (i.e. QEMU or KVMTOOL)
to pass on this information to Guest via ISA string.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 7351417afd62..b6770ee08872 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -98,6 +98,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_M,
 	KVM_RISCV_ISA_EXT_SVPBMT,
 	KVM_RISCV_ISA_EXT_SSTC,
+	KVM_RISCV_ISA_EXT_SVINVAL,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index d0f08d5b4282..901bb5c0cb50 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -53,6 +53,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	RISCV_ISA_EXT_m,
 	RISCV_ISA_EXT_SVPBMT,
 	RISCV_ISA_EXT_SSTC,
+	RISCV_ISA_EXT_SVINVAL,
 };
 
 static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
@@ -87,6 +88,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_I:
 	case KVM_RISCV_ISA_EXT_M:
 	case KVM_RISCV_ISA_EXT_SSTC:
+	case KVM_RISCV_ISA_EXT_SVINVAL:
 		return false;
 	default:
 		break;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
