Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E0BC433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 20:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YuHjY00jIK+4JeVNl7KTJJn5umMqUaJ6EcUws19rtf0=; b=BWGuPKAt5Kex7C
	5ero+GhUarrLacCgLYAkXHDq2mcu9H4WYCWYnlnVpwMg8hydFbglDkZruj5X8OD2Yz6nwq9TTPqHF
	zbju3AmwiyMhj8/Z+uMZ++i4ExJ4dOOAh2fM78VFDzWHLZhXn9Cidif8DCMSWj6iKg0dGnNly7q+V
	sf5Uu26Pg9qET1c8QODhySPBDAPdF3LjstXvjgwBrju9JUQ9oWbmrD57YzniBhe7VqkVW2y/cjE/S
	A84YG/b1No1difOC4aFygMVQFZS48v8JYsdCX8h7FT9RXjGICd7nQAs23V/mmBkUPlBQqV3a6fUwA
	zO5jSvFkQ/u879Jj4KWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQEGP-00BtIv-4x; Fri, 04 Mar 2022 20:10:57 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQEGE-00BtAl-Tc
 for linux-riscv@lists.infradead.org; Fri, 04 Mar 2022 20:10:48 +0000
Received: by mail-qt1-x82c.google.com with SMTP id v3so8332182qta.11
 for <linux-riscv@lists.infradead.org>; Fri, 04 Mar 2022 12:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qsIO2ya+cektsJMcKlRJepNqbeDF38Da8NmtSJ8s3gU=;
 b=N8FaQlw5OIEM3nPnrnG5ZP2TJJy/b2ccHKMgsAFTjSQD2qsuFgofIv2+b3o9BK1ZpN
 //j8EXvZd85ZIPGjHfXBgbqKRWSWnxfdpuL+fQK0aZMczrozI6OmH95uiuITNr3tToBt
 yo+IBGiuJ9MYEMUby4Y+iz940dgwRcjRcLlEM7LTUPJ0t2jcHcO6JqIo+/zKqJ0GRl60
 kROrc93K3cYxxoudnV2HZfdlRMDAkvxBsaT0Z5V1O3vN9b05UwxF9kyv7DdQRgFoCRC6
 YDEKxgc2mwGeYdA9wU3GErE1QEoOLqHp0DXpEukTcS8Ks0s/Bm36xscy4D8XcNBCJLSL
 7Lpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qsIO2ya+cektsJMcKlRJepNqbeDF38Da8NmtSJ8s3gU=;
 b=Veco32pEI3XQGT6EB8GF1XOtl+JHi94AldJVplfDcKub8sN4W4JUe9Uecu/pjVnuIp
 HWd9ox+RmbfLxc03UUKsohRVGWUsStukIe19neQz4v4hykskGLICtHXIaTh5vCUmvt8c
 At6HkUbAiPKGn0o/WdvaDaksKMvLveKFD3Zzt0X0QVmlyjniB7fHJ7nwwYqZDeuD2a/9
 XbbbA8OVakLCwVnhIQecp+4Txph+uyTWdqGS9ceCzULWxz36hcNskYLrfkZqwIdwXtBr
 Q6GTa97qPQ2F+JAd6MfOfYtKavFkPHyFlCrMkejOI4nHhFIbGOENcP9Wyqa5O6mTjxNo
 nICg==
X-Gm-Message-State: AOAM531PClhSe5nCHCZRMk1ey5qx7kksIabodCAN2eKrXg1fn9hUZX39
 V3JbSW0B2AYwJ5tukz1FcMBqsQ==
X-Google-Smtp-Source: ABdhPJyBu28CBsOFIzyM9DOgbXjnNnxtobqGHxzYB0P4cAzhg/+V3vQ13sjTBnimNgfPW2IUppEExQ==
X-Received: by 2002:a05:622a:1b8d:b0:2d1:38ca:6b1 with SMTP id
 bp13-20020a05622a1b8d00b002d138ca06b1mr396609qtb.688.1646424645574; 
 Fri, 04 Mar 2022 12:10:45 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 20-20020ac84e94000000b002de8f564305sm4605481qtp.1.2022.03.04.12.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 12:10:45 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH v2 4/7] RISC-V: KVM: Remove 's' & 'u' as valid ISA
 extension
Date: Fri,  4 Mar 2022 12:10:17 -0800
Message-Id: <20220304201020.810380-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304201020.810380-1-atishp@rivosinc.com>
References: <20220304201020.810380-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_121046_983486_AEC73D3F 
X-CRM114-Status: GOOD (  10.96  )
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

There are no ISA extension defined as 's' & 'u' in RISC-V specifications.
The misa register defines 's' & 'u' bit as Supervisor/User privilege mode
enabled. But it should not appear in the ISA extension in the device tree.

Remove those from the allowed ISA extension for kvm.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 624166004e36..3ae545e7b398 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -43,9 +43,7 @@ const struct kvm_stats_header kvm_vcpu_stats_header = {
 				 riscv_isa_extension_mask(d) | \
 				 riscv_isa_extension_mask(f) | \
 				 riscv_isa_extension_mask(i) | \
-				 riscv_isa_extension_mask(m) | \
-				 riscv_isa_extension_mask(s) | \
-				 riscv_isa_extension_mask(u))
+				 riscv_isa_extension_mask(m))
 
 static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 {
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
