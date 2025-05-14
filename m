Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B83FC3ABCB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 06:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QLvA8PzEUNEBWNXBJjvsvjhYWa6oinn8h96R3zKx9N8=; b=zeu4KQWVijK9ey
	QEH2ialpg97yQf8wm8mA9gLJymzH9sIwH0A2CBBUs8lm4RU23vNznU2eVaF5EEXiaLOm69yazp09w
	apJHDaj//Cq3tTDxem5ZEhDWYNhDBJBAfys5+B20MTnd89ZJXSFpzU4mUu6weWvBtLU/LtO/OM10f
	QisgUZABqWyva62xUo5TuCMCqoHmuy2lmF4GTSkzMlRSwntWhAuHjMGH9JnF6Hw7txO94+SDdXZsY
	JkcLp2Xjpj6wNLSzwIAHyAkp+kS/FA7rImPw3OK/2EQjaX5aWeVkIXvdVBjKkYhlUEPBRcfpl4xem
	0Prf9MWia90O7d8qFjkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF5qA-0000000ECox-0piG;
	Wed, 14 May 2025 06:43:42 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF5q7-0000000ECni-0nHD
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 06:43:41 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22e7e5bce38so68967755ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 May 2025 23:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747205018; x=1747809818; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yONrDaNM2oGU1RPbJmb0bt05qkmK93VY4fZWYkh3HDI=;
        b=uBaTnvF8pMstesS2VewF3Qdj2IwM7EEKSjJ15I4whRVauzNAO8VWY7bEGlHE9D/MyK
         dFuQ8yY5xWlxI5Wa6ub5LGlmoym0JO3DJ5+Rt6Kqm1fTGLdTsW/FxMUCjzlGsQwnzFun
         Gld1ti2i7A0Yi++9SgAKo63Rkabe8QZdPnMiqR91zAxTYgBOYc0MmM22cAou0Cueu5qT
         JKZKLnDa9B6qBK4QANeQuN09FuL0Jdse5fHJ3AYuqbyLYN/kTZVDSkhFl08KTwy0fSMK
         f1fvp4PQkEnALNVJxUwcx6GFeTJJp4M3mH6sIwTz08a3tcfMbpv3QEj6qVlIK5hBi4ee
         CGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747205018; x=1747809818;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yONrDaNM2oGU1RPbJmb0bt05qkmK93VY4fZWYkh3HDI=;
        b=Sv4BNV7R/Pjg2GOFZG5LVfbe/Soe5ko2+lKgKRz/dTag4PHZQWekSNCS4zxL7ao/qj
         zqUupo14G02XDwHfJB3nIZRxwK9WdeUfYRIgSyuOgJBu2Gtu7+cnUOSnKLgvHbC9Fqy1
         ++X6BDrzVg79ic+sVsphdO0ClDrhQYXZPzQijOkCxBzymXf3/xxuG92LphzlLPKZKz9e
         LiJ29iqiordi5Jy+ptRgmjWC+ifUASLIwX2YSoS4KHwaMBiuAT0+GPHlF6QXC3nJMqpe
         g8npD9gvSKOGB/XVXHpqbwMbw5sUTpKUlQqEkmRkW7qytIC5m8u3sZeFM9bYuf1xUPzP
         b7qw==
X-Forwarded-Encrypted: i=1; AJvYcCUwZeXl2P4e42nxj0TaA5UJutNHIm8EkbLMuqT2wk6AjhZ5bsTP3hbfk1wx5oYtUvlmWKvhBlu/CA/nBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YywOpPUtnUfvCIIsobpVpGurA1P0o9W4+jmesQ3UgRE9Mh0ZRrl
	Nl56H4H7OaM8CX9MaNcz7q6RSlzlH5kCFADJcZi8weTb6HJWVY6/P/FwtRgWuNw=
X-Gm-Gg: ASbGncuPkcfRR0ArQHYcyo8Kx1PODkMRZDvQIj9MdDJGY6InrtKmqczP3LsnCfNi8Qh
	koL05zVqGZOdbToSFWQvwAHzimoxhQN11difgqBlxVn7n0u+ONqdEvRLMHEiCpLFUfy+WJZ9dkT
	nwZTW55CKp8jN5DhUuHaKCzxp0OwFT7JNuqTaL4DnhC87eey4W2dBubV0INjoV6RAGZy9Bs7+t6
	MyHvxVwJRcXuwYM3UO3ZVfUCq+ywRlLHb0xBF9MobI/8z6TLu/yNS1vcE08h8ImZE2swW7oSLFy
	zDO9oHnUFuW2KXiXTWhlNewMgkjRY596Jqy9LP3Ji1rrFxZPLN3FgR8bcqT/SQfs
X-Google-Smtp-Source: AGHT+IEoClrF6lVQwqc84P3HpmaPMlZK//yuTk+XbXPKwiAjohsYztxOGGMEpufYrZ8rdGMMsjvwEA==
X-Received: by 2002:a17:903:2f85:b0:223:5ca8:5ecb with SMTP id d9443c01a7336-23198143b9bmr30190855ad.42.1747205018359;
        Tue, 13 May 2025 23:43:38 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7544e49sm91978485ad.51.2025.05.13.23.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 23:43:37 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 13 May 2025 23:43:30 -0700
Subject: [PATCH] RISC-V: KVM: Disable instret/cycle for VU mode by default
MIME-Version: 1.0
Message-Id: <20250513-fix_scounteren_vs-v1-1-c1f52af93c79@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAJE7JGgC/x2MQQqAIBAAvxJ7TijDjL4SIaVr7cXCLQmkvycdB
 2YmA2MkZBirDBETMR2hQFtXYPclbCjIFQbZSNWothOeHsP2uMOFEYNJLLxzQy+VsnrVULozYpH
 +5zS/7wdhSXygYwAAAA==
X-Change-ID: 20250513-fix_scounteren_vs-fdd86255c7b7
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_234339_496191_98332565 
X-CRM114-Status: GOOD (  10.48  )
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

The KVM virtualizes PMU in RISC-V and disables all counter access except
TM bit by default vi hstateen CSR. There is no benefit in enabling CY/TM
bits in scounteren for the guest user space as it can't be run without
hcounteren anyways.

Allow only TM bit which matches the hcounteren default setting.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 60d684c76c58..873593bfe610 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -146,8 +146,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	if (kvm_riscv_vcpu_alloc_vector_context(vcpu, cntx))
 		return -ENOMEM;
 
-	/* By default, make CY, TM, and IR counters accessible in VU mode */
-	reset_csr->scounteren = 0x7;
+	/* By default, only TM should be accessible in VU mode */
+	reset_csr->scounteren = 0x2;
 
 	/* Setup VCPU timer */
 	kvm_riscv_vcpu_timer_init(vcpu);

---
base-commit: 01f95500a162fca88cefab9ed64ceded5afabc12
change-id: 20250513-fix_scounteren_vs-fdd86255c7b7
--
Regards,
Atish patra


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
