Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A9BCE7A81
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 13:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3a2blPzerASLa3269jbsfv4nbuqGYWG3DwQzROaCpN0=; b=YxiW7bZbEC3cbp
	gqFFP/InKX0PUNLENutOnA0lA5Hw2B2PWZUXaJm3IU8zbLG8xgsDdsuAo+7HcN/Zm+2zlJXhwLtKY
	ZlNl2Sztzwy+hpm8pUr3JFbcw5sQYjyy2u04GGjOwOHmfhRlHqehv+U0KC2sUkLOrs30cYSuHLsGQ
	UmdaGsyw6c7xP3DvHjzMQQsIXFOhyQZvqrbCF5kaFHlLKOOqYdtPl3f4N+IG1g5KOXgx3MkvfF07r
	/sDZztkxTKHlQJEZqTDSa5FrLuCxYJYVZMo5XbWWgAirzDSlDxiZGfeV0I78uPvARfBkQibMygenY
	lrcrX9TDwMVOO61jzyVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qklo0-00EM6F-28;
	Mon, 25 Sep 2023 13:39:20 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qklnw-00EM51-1k
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 13:39:18 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c5bbb205e3so58370645ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 06:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695649155; x=1696253955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eKlzTcjLE8dmyYbSp67mSfFAcCqOvfM8wch2jpInsyI=;
        b=PjPk3Y0/7zkbzfD7gp9CvM2EWl0lVxAO52C29QdP2sgNj4lVi/1yNMhrsxgkoC4N8e
         ZPRvZWicQjv3Pu4hvKnUzC62+EKNZzVSOj3e6DINeGfSFVMH1BAK5UQqfLndKXE4xRlP
         J8ryS61rn7KddTjrLYD3jN7Td5ygPNRFhazVGuk8kO7WMR5lOBNvmsuROVbH7K2MCt8x
         iYHPeB+hX2fo/Y9cq14cJyiZgKgMdhsg9gl5YqXHnFviUmx1ITB4EvTh/sJCNlMYYNJb
         iCsGVMn9lgwZv2JnGlkMzk4IRJdYWkMEInTdIoojiv7vp/67Jt+WY0LucSbk1bFHGp0X
         EyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695649155; x=1696253955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKlzTcjLE8dmyYbSp67mSfFAcCqOvfM8wch2jpInsyI=;
        b=ootRco2NQLZ4KW7xPe+StygP3nA0BniF+qdHpXh0Z42NA1oCArVWsVZ1dnZhiKOxzE
         DWTr9h7X1So1uxLqIIw0Z6YOmKCkyvJjks3616gjzIXt0m8zom4wUBq1cCPprUEQmmmU
         tNLRLnIneYJGIzUmVoWXlR4Paz00Ca5A0ZdtbgwkTcHEJ0h+H/8stVVnD2ERYMAXmRWY
         jWL8Xm6enJ37NB+VA/0wOm4/xcHVVpNK7XjFBE35gaMkRZQPuCEgDAL7nDGSlyth6jr6
         TUujQbaddIemRM1QqZCtjwxq9nDfKSCutDW+5Mjp/k6VQjDjr30ly0KPOSKpvuryS/XS
         Dvuw==
X-Gm-Message-State: AOJu0YwIux5HHlRdTds6GmpjLu3MTHdh6Ez7UA5qZckocVGFOGWssQdI
	UnywNyF/d9X/WuNGczkfkclpmw==
X-Google-Smtp-Source: AGHT+IHS8Wv/g/qamJVplasJy8yBOlFgPURiUvskvgySyTGlNOySwwqAtel1reKcngtN7Jgwh6mD8A==
X-Received: by 2002:a17:902:c950:b0:1c5:db4e:bb2c with SMTP id i16-20020a170902c95000b001c5db4ebb2cmr9270815pla.64.1695649154596;
        Mon, 25 Sep 2023 06:39:14 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id p11-20020a170902eacb00b001c625d6ffccsm969433pld.129.2023.09.25.06.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 06:39:14 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 0/9] KVM RISC-V Conditional Operations
Date: Mon, 25 Sep 2023 19:08:50 +0530
Message-Id: <20230925133859.1735879-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_063917_220586_B76CDF72 
X-CRM114-Status: UNSURE (   8.66  )
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

This series extends KVM RISC-V to allow Guest/VM discover and use
conditional operations related ISA extensions (namely XVentanaCondOps
and Zicond).

To try these patches, use KVMTOOL from riscv_zbx_zicntr_smstateen_condops_v1
branch at: https://github.com/avpatel/kvmtool.git

These patches are based upon the latest riscv_kvm_queue and can also be
found in the riscv_kvm_condops_v2 branch at:
https://github.com/avpatel/linux.git

Changes since v1:
 - Rebased the series on riscv_kvm_queue
 - Split PATCH1 and PATCH2 of v1 series into two patches
 - Added separate test configs for XVentanaCondOps and Zicond in PATCH7
   of v1 series.

Anup Patel (9):
  dt-bindings: riscv: Add XVentanaCondOps extension entry
  RISC-V: Detect XVentanaCondOps from ISA string
  dt-bindings: riscv: Add Zicond extension entry
  RISC-V: Detect Zicond from ISA string
  RISC-V: KVM: Allow XVentanaCondOps extension for Guest/VM
  RISC-V: KVM: Allow Zicond extension for Guest/VM
  KVM: riscv: selftests: Add senvcfg register to get-reg-list test
  KVM: riscv: selftests: Add smstateen registers to get-reg-list test
  KVM: riscv: selftests: Add condops extensions to get-reg-list test

 .../devicetree/bindings/riscv/extensions.yaml | 13 ++++
 arch/riscv/include/asm/hwcap.h                |  2 +
 arch/riscv/include/uapi/asm/kvm.h             |  2 +
 arch/riscv/kernel/cpufeature.c                |  2 +
 arch/riscv/kvm/vcpu_onereg.c                  |  4 ++
 .../selftests/kvm/riscv/get-reg-list.c        | 71 +++++++++++++++++++
 6 files changed, 94 insertions(+)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
