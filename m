Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0F2FEE4EF
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Feb 2026 15:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/aNdgBXRvuZ8zH7a4v2BAtRTT+xDOgkxXbxnKjN2jcQ=; b=jmfc/QLpP0yk+B
	TsqGSB28e+YIKubug1OhoDRoAI/Sbq7qh+8B6qkzA+zSZ1PHddzHVWn/Kn0tr4KWrr9S8s1YJOkoD
	3xsw4Ld/LBCD00eyPgFnF5Ogfocpo0fl2y7GFnUnRk2tOTcpXcIme07hgO1X3jtnNc2SRhNf+xC7y
	iJ0+1ZoD5Z4uerJ3ZZ2EMxsaOZ1UR+6JjuRksxE1zigMcNB+rNGfuPQueb2whdEEN81K7ACfnk97C
	2PPu7Vlly+eKbNWeHXMBD1k8LsZx+Dx7n9zMqyWtAtUZKnWxabRmpp97PNBc/OVqz1o9k+neUFR0N
	rIcwEtHoDdv7Ea4uXCLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwM9c-00000009zQt-30fY;
	Sat, 28 Feb 2026 15:22:52 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwM9Y-00000009zQ3-2tx2
	for linux-riscv@lists.infradead.org;
	Sat, 28 Feb 2026 15:22:50 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-7982c3b7da9so30984067b3.1
        for <linux-riscv@lists.infradead.org>; Sat, 28 Feb 2026 07:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772292167; x=1772896967; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8gJIyL9AfQkuFfPNEXdWTtLgAIKWa7r6TpMrqBv02Ok=;
        b=C58YAE1H6NmEI1FPm4RsVpuwfvyfLSutC3CIB1Hs5AO9BR61TqPN8jcZTTRqXzp8Yy
         sLcuoySJMvNAwXbLQ/vClA8dLX0rkndhu+K0n/AZBAVc1wCkP7ZRc97iygGPBafqhbe5
         4f/6ATO2dS4ksDlopVSBISkTB5uTLBPLFxVu9lSycb4dlrlmzn6Q9TtWjmPw4BVan3+y
         p7fSuAbBvKVg77Ut4wN38wFUsrT5Zri7LXXb0XDuzx1PUEwzeT04f918NxbWDfPkLage
         b9j7QHyjZ9+Ce+wwt83PpLiLTUL82OBTt4EuD8K4XT/3gW715xymUJjh/V0/F+q8zzJh
         qaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772292167; x=1772896967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gJIyL9AfQkuFfPNEXdWTtLgAIKWa7r6TpMrqBv02Ok=;
        b=Eu0AzEI34ufJL4HXrBP3T83l9YmZJtgObg4nDTczBq247MaU/0kN2dKlCRDYF/ZtD9
         RwC1WL+q4sPoWvSCfzA53U0yKT86G5WDn8QxO3cFUk26sEsAz1dbWWXRrzQf5DU1qH2J
         D2fK0yQi7InubCLjEg45OZL3tCD/IiPYHIr2STATHqtnxqJnDACKhs7a7lIGBEMWSsMM
         lqh/Fl1FX23K8DoqCsGoEOdlYkDsdsGZrJchShhzv1k6NuzUJjmBp6pkI2UAMNoBGJH+
         P9mbWHsEegAqlctSXjCI7gzIKMN82rFUeyFJIjbCMw3+n/fVnpFdd5449ALvV9Nd5A2O
         DSLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUavP/B2Ao7xW0X1iORRl0qmPbUk+vERwL9wu6Nfw/OjbDGbuKNQv/9Y4acWWIJliyCyWN9yQwxQifkUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6MZYqgM/O1GnRLW7HqoCMZibPw4IMQsowY7MS1qB3pw0y21vV
	6D5e4AlzS9D6yQkAJVI5dywggAPBATHkt4LrnjGVxpWRp7jFGtiJKqABlcFaSQJNX0I=
X-Gm-Gg: ATEYQzxc5vRnt98dSOUjDjBygKI86fEYS98K+OeJEi1d6YyqT/v6Wn+MdHcId2J/1r3
	Mrt+JcfEz9irB/VQhMxTqNs0PbicYfhQx/m72FjNDlUMOAD3lIIOsM39FNlyg8PEbWdKcy8xZfr
	fePQfQOw3bivSo7XM7bYVlavcEifGoW3UB57XpTZe6v86BT1JXWqUPyi1pD4sdWcRHAXBncAQw5
	BeXOKbz1MCTq6DiKVzox23C4FPeCpAmJMv0K2Q0MhHklNFgAp05zOtPGISVxogYQ2Q9chHHiORn
	4YGP/4TX0IfYdm29WSWwf8p1PnxzeP/cMwWjXmKzmMS9TK3tzJRlFlY9LfKq+KONBcZ86KoHq2W
	M1d9pZ73gzDL5RBfPc3bJ5j3YFxFlWgB4+JkXO5+PiJHL0Or0c24LOM1oCKh3LGdbAb+fuYPXex
	dBeusL0mztEDafn2jbgOJJ1iMrOdQeUIsmZmpMGDtvxhLZsZzl0BGW/0RxU/8cBBRH+z67Y4W3I
	hOn3M3j+kGZgQAQoYILgR8J
X-Received: by 2002:a05:690c:1b:b0:796:74cf:df0c with SMTP id 00721157ae682-798855082c6mr61686407b3.24.1772292167012;
        Sat, 28 Feb 2026 07:22:47 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876a92039sm32861897b3.8.2026.02.28.07.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 07:22:46 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ajones@ventanamicro.com,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] RISC-V: KVM: Fix out-of-bounds by 1
Date: Sat, 28 Feb 2026 09:22:26 -0600
Message-ID: <20260228152226.2116895-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_072248_725195_F4BBF076 
X-CRM114-Status: GOOD (  10.72  )
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

The array kvpmu->pmc is defined as:

struct kvm_pmc pmc[RISCV_KVM_MAX_COUNTERS];

So, accessing it with index RISCV_KVM_MAX_COUNTERS would be
out-of-bounds by 1.

Change index check from > to >=.

Detected by Smatch:
arch/riscv/kvm/vcpu_pmu.c:528 kvm_riscv_vcpu_pmu_ctr_info() error:
buffer overflow 'kvpmu->pmc' 64 <= 64

Fixes: 8f0153ecd3bf1 ("RISC-V: KVM: Add skeleton support for perf")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 3a4d54aa96d8..51a12f90fb30 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -520,7 +520,7 @@ int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
 {
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
 
-	if (cidx > RISCV_KVM_MAX_COUNTERS || cidx == 1) {
+	if (cidx >= RISCV_KVM_MAX_COUNTERS || cidx == 1) {
 		retdata->err_val = SBI_ERR_INVALID_PARAM;
 		return 0;
 	}
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
