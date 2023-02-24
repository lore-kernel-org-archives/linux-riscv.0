Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080DCC7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xY8w+EYJH01g5XD7o+NAPhu9wU1Itp/8OyjE7sYKc0s=; b=TVnZbc9RvZCHKn
	bYrL5Uq7/+NPVjJdDsB+rMwViaC8xtgFEdfm1JTvo0kp+R+Z4dHaUppK2e7IsVbYkJDr93Vx+Whgq
	AGUJk2+TW0lT1UB7cYa6jhDuMDo6jlNZLFU7V+HutgUg3INTQkWadIqz/X1HkCumm7oCtcsJFbwLU
	p4DeUsqPzaoRvW/FWYon0FVeB9I0nFVse4PXpUqWjCQBW/LTDYD0Mjz4AEMkZ0YPBH0KmHGNnsOci
	jZC8FbrZslbdJqNVih04UJf5dA0pzGd0BT46idOZwmGZa/wKDsvJcPU2jpAyb/IrRwhYXltnzpDTd
	DTckpQDqdAu225xFym9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbTh-003EPl-O6; Fri, 24 Feb 2023 17:03:25 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbTe-003EM0-7b
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 17:03:23 +0000
Received: by mail-pl1-x62e.google.com with SMTP id e9so159498plh.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 09:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YhtBb89nOsK8vMV5FLn5GLV4Y9PvKk5nrBq2eua1ZQQ=;
        b=e9tp0eUH0VpJXlp6I8slYqRmoD66QhY2GidzFBryqo0fmqNGhXvEpg5Awm9vMT6aSM
         ETKYkFU9m+PE5kz5q0CxIjpWn2PkLTs0SOmQ1dLBupc/EUbPBf9SVbLq6yskE4AsDtop
         kWKs2jOmIy9RcWDxFqYaxAL/CpK+es7RihysURnKQK2wPhftkINFlC+SnbgeCrFYLGiN
         Sh3QsA5BotnYOpwWNPxZcm4duNYmxWx4pBbdqu8DRHdKCuLyhReKwm3HlKmhoAyOYjjP
         EsGwf56ARuyQuwkV6rzmiu4zaIs20bA79KvUls+bUHUy/JqJV5BqIKN+hsNvNu7g1nrn
         qxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YhtBb89nOsK8vMV5FLn5GLV4Y9PvKk5nrBq2eua1ZQQ=;
        b=4nMFKIKmJhjG0XF0MGFF/JjiwPbBHsS/v4eUWcWJkqER1XRud5IU/Lr8X91VIYsw7B
         mumHXgtPllRD1eVYHggASyUaHXmcfZMco+0bA8fIyWNnYfD9SxaQAsg5A31M0Dxz65o3
         Ayzwi7j6JWlyNM1Bsdkd7AFkuy/UhtUXI69cYnGgFLCgTDoQKK2LWOcJQpKvCkeuX0QQ
         Dva1ZhnxjKmlQWSnFxghrjBXJiG4E6XlwmYMmQvJxXYgTn0v+cBRmcy9ZI037K64sdDm
         rtuWCNVZKtF+laKYj+YAtKIgNGojISwmzS133V/Gl3+RiKbQKmq6huYS4FmWURBl8r4O
         5VpQ==
X-Gm-Message-State: AO0yUKXxNf5tuTlDJLELpvChCdhury/YTOXVQ6ZvF+kd2W83reuX4I5u
	sjDuu+Y9g1Il+NtNocZje7R5F4IjozbOAMIDPfMfvV7orLQCrBWX1M8GJAJsRRUOOOtpBEzeDjJ
	Nr8ua6sKGKKO9OM7LdVqh3eDbc7m74eje9vaMn6th0FM1q5kqnFu4uZmfSMzkDrWlYs7jVT8GIV
	ZvETJhsehTGw==
X-Google-Smtp-Source: AK7set8hYBn6Bl6fkiAJavukNy4SdPO2tgwvfzCYBpoAWBin6Lr2TtJ8a0nudLP6vMHi4qPMB1dBEg==
X-Received: by 2002:a17:903:32cf:b0:19a:b092:b31a with SMTP id i15-20020a17090332cf00b0019ab092b31amr17326037plr.8.1677258201509;
        Fri, 24 Feb 2023 09:03:21 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902b60c00b0019472226769sm9234731pls.251.2023.02.24.09.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:03:20 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH -next v14 17/19] riscv: kvm: Add V extension to KVM ISA
Date: Fri, 24 Feb 2023 17:01:16 +0000
Message-Id: <20230224170118.16766-18-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230224170118.16766-1-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_090322_283426_6F9133D4 
X-CRM114-Status: UNSURE (   8.65  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Vincent Chen <vincent.chen@sifive.com>

Add V extension to KVM isa extension list to enable supporting of V
extension on VCPUs.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 92af6f3f057c..3e3de7d486e1 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -105,6 +105,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_SVINVAL,
 	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
 	KVM_RISCV_ISA_EXT_ZICBOM,
+	KVM_RISCV_ISA_EXT_V,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 7c08567097f0..b060d26ab783 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -57,6 +57,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	[KVM_RISCV_ISA_EXT_H] = RISCV_ISA_EXT_h,
 	[KVM_RISCV_ISA_EXT_I] = RISCV_ISA_EXT_i,
 	[KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
+	[KVM_RISCV_ISA_EXT_V] = RISCV_ISA_EXT_v,
 
 	KVM_ISA_EXT_ARR(SSTC),
 	KVM_ISA_EXT_ARR(SVINVAL),
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
