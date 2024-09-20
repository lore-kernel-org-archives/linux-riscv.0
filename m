Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB56CCF58E4
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Sep 2024 07:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fFr1CsBmHiJTdao6JcL1dH7xcBIzIY/tJuLmV7GFYJI=; b=J2jmKMwFOSiTkg
	RQ9cGRwOdvCUobuapyb/T+e4tY/Xyhf+bPR15DAveGD2PZ5IH0XFAYwWAAjMeRMd4iBKwQrxX+s2Q
	X5IBF3Xx9BewmS+45AbJ0Ku8nczB1gfF6JiD8rBKNILct25ABCQHVf3e1NKKAS5KK0ri3+26+1NuO
	ePCgXH3V28Di28jR01sY7c2DhYp16Ru7MIy+5PG4cdV+qn5aZJWGXGrbM3T0xHRAVfitMAzMbfQU8
	2BC9gPsl4g+6uwODdB+z33Vbx3xWlQCYEfl6dq55XE5IgTHg6dgRW8GyT5z1zIN/nn3B62xk0/lWT
	4l7aM1ZwcdE/XbAaojAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srYEf-0000000BdZQ-1U0x;
	Fri, 20 Sep 2024 07:39:25 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srYEc-0000000BdYL-2Up3
	for linux-riscv@lists.infradead.org;
	Fri, 20 Sep 2024 07:39:24 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-206aee40676so16078165ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Sep 2024 00:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1726817961; x=1727422761; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nf3ped5+15OxXfhvvUNIJcQRjiOx4BGk5AuoceNg+i4=;
        b=N7Lf+oxg7+GTvrE83rD6b2WqTJXnjK2vFKgo5w5eiLuQwFRI/ampWCMXrA2ABggv+c
         64G1UFzB49R3cgRA2oLxEE0wYH5O603dH3Yk3SVZBVZ1PXXgGD913A+UHkmY16JzMaaH
         DQXVNPw+fV04LXVuqIQ4urvnn2tZPYjmJn1aVN79h/OeP9nRxZl6CeRylyXdf7jLN7Bz
         byOKG0oEh6zs4hmeR3z9ASLTWzxvxErIW5rVxe/+G5HjD/wb5uRvSmyd2YBZRPCpj5Pu
         n8SbaAi+80XGCN27JBt6jUlQ5HfSE7ClkEs/1BGGwr2B1mciKl5zilw9U2KWBNdiFYGV
         k9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726817961; x=1727422761;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nf3ped5+15OxXfhvvUNIJcQRjiOx4BGk5AuoceNg+i4=;
        b=OyJXkpHES3ISuROIdLTKGKLW/NWAEIbx8op0mFTuISlfGHpdyypUtZ/rAxyvyYB9uh
         Cb/uZSwF1gU++dIyWcr1yhNtQI/1zUoFB/dy2v1Bh9fGwthy9jrDvCtZGSSUItU7t063
         XgoYjbZIeGtmYTmPuKpBIv7X4Ue9+xGNBG+PPmrLl3j21b/xB40J+pE4Es3itz37lvhb
         2kl0nXfr9Z6yPyBx9GNLCTaoCQ2UT+c7eBd9P8Sw7wwyLulQAAzup4nZJ8Cdn+Uw0EP4
         4806AXCX4YlqfUHPBZa3sgCz/FxVdeL+3s1rzZaEkg4XDGpk1XmxIyU26ygu0lp0HMcw
         Uavw==
X-Forwarded-Encrypted: i=1; AJvYcCVkSpSRpffdrZcj0DTy7CMU3s6gROwy6jGqK4BzlCngi7kN5zkIzQdmXlLlwkqh2Shpb625iq2B4X2DzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxwyojy8Whks6OfDK8j+J9F0757VU4cN4JXdSGPmIee00nh9U8
	Y6pb5SKmZ7xc6a0GY1yKC31ChOgMkswXgi5lqpAV1oz6hdXpr5DM71bYo59htHo=
X-Google-Smtp-Source: AGHT+IGji56j1DV/J1I9lAcA6e9jkM58L8PolAkDBK4wsHtukfvFBHCha1GFixMZFOiVijx3Nngwww==
X-Received: by 2002:a17:903:11c4:b0:206:c5ec:1444 with SMTP id d9443c01a7336-208d837462fmr36316815ad.16.1726817960890;
        Fri, 20 Sep 2024 00:39:20 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946fcaa4sm89645805ad.212.2024.09.20.00.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 00:39:20 -0700 (PDT)
From: Max Hsu <max.hsu@sifive.com>
Subject: [PATCH RFC 0/3] riscv: add Svukte extension
Date: Fri, 20 Sep 2024 15:39:02 +0800
Message-Id: <20240920-dev-maxh-svukte-rebase-v1-0-7864a88a62bd@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJYm7WYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSyMD3ZTUMt3cxIoM3eKy0uySVN2i1KTE4lTd5FRLs5SkREtjYwtDJaD
 mgqLUtMwKsMHRSkFuzkqxtbUARSxKLG0AAAA=
X-Change-ID: 20240920-dev-maxh-svukte-rebase-ce96dba93381
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Max Hsu <max.hsu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1407; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=wS0y3XnmRUgkhuicGsT5+NS3O6xPNm1UKgT3dPtkY3g=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBm7SalrbPVcOyg6Y+vrkFjoAudGNjFqNsRSXPO+
 jnEQWPDgFOJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCZu0mpQAKCRDSA/2dB3lA
 vbSwDACoWoQWKUmsoCUtXySuCDJr4EmIadcA2PF5Gfb05zGyIyYvaamuPRF78Hs9yg5wxMS28pH
 uUGXmVHrnBkbdfS7Tv98hZ5z2M3oliNBA7U2ftPWttl3RadTUTx/6FepAh/ORpls2BawbfFgFS9
 Rr9hm99cmywhbgpZUyAz5qKeY3eH92XFaVQk2WxaNypAQemjT5sgLm5h6rgNzHI8K92oDp449h2
 v+4/xTDrtGTL9LCyVcAJBRnq9AiRzFW1V7f9dbUZpwEpNX4UMTKZY/N/EwgCYoPUAN98B/LYS5F
 ClA0u20GecZsZbsRHVI9lyKjnC5R7Ge20io4EzxXCYit3twSQ7h2msP4EXBYqL9K84xQv/OZb9C
 2S3dkyfhhnJdkOFPgmDEwTZKHlwPe7cTp5l09WIokK8TwOHP64CwubKuo4z5049KMYYXpn0IVn2
 B70xbla3aEDyFfRLMHtJHZ8GgS144ICtRNsLs62i5Pw6kZQahjfIwbYJFhU9bzS/LcYKA=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_003922_692303_C6E3683D 
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

RISC-V privileged spec will be added with Svukte extension [1]

Svukte introduce senvcfg.UKTE and hstatus.HUKTE bitfield.
which makes user-mode access to supervisor memory raise page faults
in constant time, mitigating attacks that attempt to discover the
supervisor software's address-space layout.

The following patches add
- dt-binding of Svukte ISA string
- CSR bit definition, ISA detection, senvcfg.UKTE enablement in kernel
- KVM ONE_REG support for Svukte extension

This patch series is based on v6.11

Link: https://github.com/riscv/riscv-isa-manual/pull/1564 [1]

Signed-off-by: Max Hsu <max.hsu@sifive.com>

---
Max Hsu (3):
      dt-bindings: riscv: Add Svukte entry
      riscv: Add Svukte extension support
      riscv: KVM: Add Svukte extension support for Guest/VM

 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 arch/riscv/include/asm/csr.h                            | 2 ++
 arch/riscv/include/asm/hwcap.h                          | 1 +
 arch/riscv/include/uapi/asm/kvm.h                       | 1 +
 arch/riscv/kernel/cpufeature.c                          | 4 ++++
 arch/riscv/kvm/vcpu_onereg.c                            | 1 +
 6 files changed, 16 insertions(+)
---
base-commit: 186617d883560848f801732bfecefa0c2f702a0f
change-id: 20240920-dev-maxh-svukte-rebase-ce96dba93381

Best regards,
-- 
Max Hsu <max.hsu@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
