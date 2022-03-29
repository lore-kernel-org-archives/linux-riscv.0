Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F84BC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Mar 2022 07:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EWoZi1A7JYosLE8koSygQQhe0Qp8NmZ3rF7jsejVv1c=; b=BHXDMX/zIZjHOW
	sgIrMBtzSUJTKAg+We/oSZ04Cb31hgX3ZnRjYVhKhkBU6XpeU64QSU0p/11EsKjeIt2aa5yA3Ug5C
	7lRpRhbNwMSnihlFbfJcG+HebD9cUF0feEOjzz7LK3VRCcAWJlPOEKxp31D3z0PburvTY83Q6exWe
	BJ3sy/Gjh8ic8RCrr7bd6MMjH55p83hkuPJgMiVyy7YQGgaRnPToXBuhGmhwv3vz/FmsCI00mmoi/
	RA6rAnPHGWG+OYge1iGBZ64bhxstXt+Obkvtv8tqq7/0cHo+b/3r7Q7EPWTQxHDvHixjTx26lnekj
	Fq4CbGyedmDj70jVkq+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ6IQ-00BKDR-Ar; Tue, 29 Mar 2022 07:29:42 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ6IM-00BK8o-Ga
 for linux-riscv@lists.infradead.org; Tue, 29 Mar 2022 07:29:39 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 g9-20020a17090ace8900b001c7cce3c0aeso1343412pju.2
 for <linux-riscv@lists.infradead.org>; Tue, 29 Mar 2022 00:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0HpwULoTFveWXl4V/JL0uWMQpAlO9P0Ps2jhRe3PZdI=;
 b=kF8viRN8VFCL1uNo9D6ZUyCgw9eFpyecK3uRGR8wpUQFmHxTfHZFyptqrp5t0lZu06
 JFlvhmxASkTOycvxyaHDul06KAd/YihiOZC8edSC3ff6j/40/8pp6+YK383GA9SvQ0U1
 td+9tyfhMqXLjIQ7gkcPM+R4LC+xWeOD4B+AJshFKXebhMR+zOOUivCtkd6oH6k3LJU8
 YyK1oOWO/cu04eR6ymTj0ZJ41ojlIeG0wP+GOzrN20Na3uEDphlN56znbvx8I2SGzc3g
 cOfTHjGK3GYZDNodXAjBwVvrSVBr4tqTndpghoEp7OdOnqAy0rZ3ns689yM76MRYlLfR
 80mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0HpwULoTFveWXl4V/JL0uWMQpAlO9P0Ps2jhRe3PZdI=;
 b=HkqAA9n7bVsWmLVjZu2EC7Ztg5i+peKiKyLiloYrj+sKwU+AQVkwG5sXQ7xxNf3oNP
 SODVIMdRJsKqoZaIhdD8HW21fDc5prqdMsFZC5VcIQ/+SaGp/MEAZrapQ2CoyPaIB3Do
 0n8ZtDb+BOmvIPfCznCQK2ZGtEy6ChQy/4BF5kd9bHW2KxGYJ4RBJPVaLcdjomRtSz/m
 PStXmTYE5myI+Zh16KnvkIlHoj3RmfxlT2sS7ImwHWrav7U1lqJIpacBPiQT5lfpivGa
 QrOKqsH520R9FIr0j0pbH2FAVabfza0/1bIB+dvkMbMlVtMSwJDBnY+XWIMm+e9DLLan
 p4Mw==
X-Gm-Message-State: AOAM531Qz5ZFd8qSIkyIcwGDv/wn16j16woChRv/FPsPD1D6vyV5eFfq
 DDu/P8yeK7vmIuh9OI2jtf3CeA==
X-Google-Smtp-Source: ABdhPJwv9HEf1+Tg5g89cxyYW4osYZtB2rzBNpuRrv2oD5B9ruSdYimiL5jrIew81samurr7NTJlFQ==
X-Received: by 2002:a17:902:e545:b0:154:4d5b:2006 with SMTP id
 n5-20020a170902e54500b001544d5b2006mr29028859plf.94.1648538977366; 
 Tue, 29 Mar 2022 00:29:37 -0700 (PDT)
Received: from localhost.localdomain ([122.171.166.231])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a056a00240600b004e17ab23340sm19440564pfh.177.2022.03.29.00.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 00:29:36 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/3] KVM: selftests: riscv: Fix alignment of the guest_hang()
 function
Date: Tue, 29 Mar 2022 12:59:10 +0530
Message-Id: <20220329072911.1692766-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220329072911.1692766-1-apatel@ventanamicro.com>
References: <20220329072911.1692766-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_002938_595213_CBE7E383 
X-CRM114-Status: GOOD (  12.15  )
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

The guest_hang() function is used as the default exception handler
for various KVM selftests applications by setting it's address in
the vstvec CSR. The vstvec CSR requires exception handler base address
to be at least 4-byte aligned so this patch fixes alignment of the
guest_hang() function.

Fixes: 3e06cdf10520 ("KVM: selftests: Add initial support for RISC-V
64-bit")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 tools/testing/selftests/kvm/lib/riscv/processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index d377f2603d98..3961487a4870 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -268,7 +268,7 @@ void vcpu_dump(FILE *stream, struct kvm_vm *vm, uint32_t vcpuid, uint8_t indent)
 		core.regs.t3, core.regs.t4, core.regs.t5, core.regs.t6);
 }
 
-static void guest_hang(void)
+static void __aligned(16) guest_hang(void)
 {
 	while (1)
 		;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
