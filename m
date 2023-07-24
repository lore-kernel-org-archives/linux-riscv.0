Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76338C001DF
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 14:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EeiCbP7yvK3t4JvC+UzCDZI0LBN1rJIFjtWVlpfbntE=; b=Y/2JJRdR2ntySH
	mO3tOxDwMkWIkQJByJ12+fSLDtWxrQ67Xt0yBa+EKx1mC+HnvBf/oIqJY2QF6qbXc3nQUqhgWc6ii
	jynLZs73bww2ZZd3Z7YlNe15yvGsNGti9xiMmD3ATKFX8ZiVgKdSFXiyNhz4pOSNISk4YcwwkyXyS
	4W/a9EdlyrfPsedMZlSrlVQb2/DrIe21Jq+5dCZVRVHKfHqh6kvUkUs1hfg9pHVc89FMJDNNpCbcv
	cT80QGncpv5Ng49dLI644WiqbzRzFQyaID2rEgKUozEzFzcToJtbTQpIAc1T9pdjEOeAmOSk1/3Se
	b4oQR53ZaTNSLeugadcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNwQa-004aWK-2x;
	Mon, 24 Jul 2023 14:20:48 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNwQY-004aVH-0v
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 14:20:47 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b9c5e07c1bso33743495ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 07:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690208444; x=1690813244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r/NAzuvfxiEpEq6CMn2lCFVPQSrZGs+fqFSkZbzWeu4=;
        b=l8MB2fLS10a4c8McBUbUrPLQj68WxDBmBHucCsLXqt18rJ//cfoPF273c6bif4bQJo
         FjRt8iQ3f+GyHYdevb0xrgra3HKOo08fhfFhpudghR2jIb5S8Kt0wdQperaiJYwNbA79
         hc2dFq1kHwUTurcukxTFIMgQ3pItNei2F0tZX8k/cfdZl5hEBF+nxLTBjBq4FCDb40vT
         e0pdMqf1JaA36B1pupctPiO9Z4fo+fi7BCJ1vd8te1BqMO59KTKrtKDOMEIXhtdXsCqO
         0983HV3peltiC2P70OSxoENfdYPwk3IkXnUu2l0A/y8j4dayrLu2wt6ku07uTPQf3Ah1
         ZocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690208444; x=1690813244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/NAzuvfxiEpEq6CMn2lCFVPQSrZGs+fqFSkZbzWeu4=;
        b=H+K4g3uJkOXuGw80wlHSXxmezY21YPAa7hcZ+/tIMhUk8sBYrWsoF0XpHwof5HBxVN
         vxI1vi0ZfrOHJPnudgxTnXJdXnOyzNEhUCZlgv2xU+Zs+0J1+dV4kwnmCWAEd44qBlsT
         GHY6pPy0BoQTq7fAm0JREGZ7Us0UJY7Dmt43aDz3NNDUIWKIaLPvQuBrhISyItMkJnsb
         5wr0aG3Hxalpc/7XgQjWe/3mhjgrZw4mV183Csa1cKSnPghokZrKO8rqw362/MSqZ5p+
         Jkx/4mIBytwdw1AmAZZR4mmAm2pw+psU+CVgp61DGMwSIkUEBtX35oYd7xR4cBxcX7z9
         M/yg==
X-Gm-Message-State: ABy/qLbe7Y8fXSk0dcD0C0CbWmYjNhLb7xXwV9nHAX0oEOEmrgPMiE+p
	hw+DnPmW1LJwZUJK71f6kphSKA==
X-Google-Smtp-Source: APBJJlFqcRGV6PhYOQp/isaMOZE86UMn6cXlnsirdZYD5qcMh6jBsq/3Ca0basWId+/dR/h1hNihvg==
X-Received: by 2002:a17:902:b18d:b0:1b8:b285:ec96 with SMTP id s13-20020a170902b18d00b001b8b285ec96mr11214680plr.23.1690208444428;
        Mon, 24 Jul 2023 07:20:44 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id s10-20020a170902a50a00b001b8307c81c8sm9009821plq.121.2023.07.24.07.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 07:20:43 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/7] Risc-V Kvm Smstateen
Date: Mon, 24 Jul 2023 19:50:26 +0530
Message-Id: <20230724142033.306538-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_072046_325722_AF8947C6 
X-CRM114-Status: UNSURE (   8.90  )
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

This series adds support to detect the Smstateen extension for both, the
host and the guest vcpu. It also adds senvcfg and sstateen0 to the ONE_REG
interface and the vcpu context save/restore.

Changes in v3:
- Move DT bindings change to a separate patch

Changes in v2:
- Add smstaeen description in riscv/extensions.yaml
- Avoid line wrap at 80 chars

Mayuresh Chitale (7):
  RISC-V: Detect Smstateen extension
  dt-bindings: riscv: Add smstateen entry
  RISC-V: KVM: Add kvm_vcpu_config
  RISC-V: KVM: Enable Smstateen accesses
  RISCV: KVM: Add senvcfg context save/restore
  RISCV: KVM: Add sstateen0 context save/restore
  RISCV: KVM: Add sstateen0 to ONE_REG

 .../devicetree/bindings/riscv/extensions.yaml |   6 +
 arch/riscv/include/asm/csr.h                  |  18 +++
 arch/riscv/include/asm/hwcap.h                |   1 +
 arch/riscv/include/asm/kvm_host.h             |  18 +++
 arch/riscv/include/uapi/asm/kvm.h             |  11 ++
 arch/riscv/kernel/cpu.c                       |   1 +
 arch/riscv/kernel/cpufeature.c                |   1 +
 arch/riscv/kvm/vcpu.c                         | 111 ++++++++++++++++--
 8 files changed, 154 insertions(+), 13 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
