Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF189CD3432
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 03:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PGz4L3HMwjRHKJoPDZLRoYv6ny5MayC8vyu0XPxUPGg=; b=0FCPfz3mdISzWe
	opeUc4zmcCvEtt9FCdn7W8org2yrJWs5mMvomEE8r9HtJ5JgcqRxWMi3AuqzteubsoZaaHkCWSWL8
	9B0lYlYMrC2gMyeOedbtWAXOXkG/V2h8HjQw0+msBMMeajJH9UemajNaEkFeMsiBniUKWu+sARNoo
	phEsAh1/pFfVr8Px9JNWEUT1T3RsCpK5C0ndZ3FBgAx5z0Al0Ul3DOmPpfUDJz1D+NgrlXeRn9/Km
	0CHH2kNLyem9FMnzeZL6UT8p2ZAVT1mwMIHRyVT3GwvoFb1GO7E9SDPznbh3DFjr4/oIbwCAB6rDt
	X8EvIxv0JOuSfe0vDa9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRoI-00Gqd6-1F;
	Tue, 19 Sep 2023 03:54:02 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRoE-00GqbN-2K
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 03:54:00 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3adc9770737so1691489b6e.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 20:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695095635; x=1695700435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rvg3SR+EIFOsYy/qoodlQ+dG3JVvlqb84MODfhL50Kc=;
        b=ChIqUj8ShHkIARvbnazVJe3s3jiyYYOy2q/7GZt7AY3DampjugJzROrV8jP0TSuz4q
         tISNTCtrFZ7qG0sp+NbrD5L+cpMaDzt+IP7BycEDOfGcVlNMK8S/2R6R0WAJSReVPDrI
         jIM+WXfeF5gl78bPMwZpkj0sBD1uFT1TcDAbN1ZenJuwTY6Ic5RtfzFgRpk2fTy8EKwJ
         T+QiVYA9lez6THVznWq5xqnUfggnRM7tLzYRF/n8kB0tK/u1Kaia8BcwoZsGny/M7P2U
         Oktj7+BTiAfvhHHY7I6O/p7VDvJ33Q4XkDvZjldp8d/y0z0Qt5ESh9kPnAuCr7oK0l51
         6J/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695095635; x=1695700435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rvg3SR+EIFOsYy/qoodlQ+dG3JVvlqb84MODfhL50Kc=;
        b=EM9fIFa7SHU39yu8LATghAA7iIb/ZDc6fQRT98aWngYubWb99ufBZ4V2J4dfOl5kvN
         b4vXhSioF4vXvXsjrsc4UhxEnTCs//+e+PXAe2Hlf6JnTrc3kgUumg0GG5Mpf0e0exrT
         UWZxoCgClo5FsWLubn9nLucw/xD9JV8rkTmW2sqiywKYGVWhCT3KNerPZ0PFQsEFzk14
         0ZuH8yo/ZwsucIiy65cKwU2SypeUe58z6eBBlTWPB1KBKBtNm9rovQsXup+M3oHV4+MN
         +xkJLbK5pvL9kXcukVWyNL5Wi45JX7Fk/tr324McsOJWB472fJcjlqjCAl7cdGhCmDR+
         UQyQ==
X-Gm-Message-State: AOJu0YxBwR9RV5/nzBkDsNxrM2oatT8gOOoxODJ3MLRxiIF8GGwyLt+h
	OCD5zrgyGM/ocvD1IdPJ+Ty0dA==
X-Google-Smtp-Source: AGHT+IHSFRjaMNl5z6gZsQCX5N7BoHMId7wpAKCC/vOe9wh+dDpFGMxbeXkA8oaPp9V2562aa7na1w==
X-Received: by 2002:a05:6808:b0c:b0:3a9:c25d:176a with SMTP id s12-20020a0568080b0c00b003a9c25d176amr12387561oij.36.1695095635453;
        Mon, 18 Sep 2023 20:53:55 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a034300b00273fc850342sm4000802pjf.20.2023.09.18.20.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 20:53:54 -0700 (PDT)
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
Subject: [PATCH 0/7] KVM RISC-V Conditional Operations
Date: Tue, 19 Sep 2023 09:23:36 +0530
Message-Id: <20230919035343.1399389-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_205358_756587_6443ABD0 
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

This series extends KVM RISC-V to allow Guest/VM discover and use
conditional operations related ISA extensions (namely XVentanaCondOps
and Zicond).

To try these patches, use KVMTOOL from riscv_zbx_zicntr_smstateen_condops_v1
branch at: https://github.com/avpatel/kvmtool.git

These patches are based upon the latest riscv_kvm_queue and can also be
found in the riscv_kvm_condops_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (7):
  RISC-V: Detect XVentanaCondOps from ISA string
  RISC-V: Detect Zicond from ISA string
  RISC-V: KVM: Allow XVentanaCondOps extension for Guest/VM
  RISC-V: KVM: Allow Zicond extension for Guest/VM
  KVM: riscv: selftests: Add senvcfg register to get-reg-list test
  KVM: riscv: selftests: Add smstateen registers to get-reg-list test
  KVM: riscv: selftests: Add condops extensions to get-reg-list test

 .../devicetree/bindings/riscv/extensions.yaml | 13 ++++++
 arch/riscv/include/asm/hwcap.h                |  2 +
 arch/riscv/include/uapi/asm/kvm.h             |  2 +
 arch/riscv/kernel/cpufeature.c                |  2 +
 arch/riscv/kvm/vcpu_onereg.c                  |  4 ++
 .../selftests/kvm/riscv/get-reg-list.c        | 41 +++++++++++++++++++
 6 files changed, 64 insertions(+)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
