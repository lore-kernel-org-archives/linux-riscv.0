Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A05E82CAA
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 03:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GE9l/up+C8b9znUZHJWXDG5+ozOiTdaxxrud5bwscEc=; b=k/Z/KhAM0wmmoA
	WAQRfq035+NwQqurPb/pArmUjhsaWUyOCgOaIFst3U3LnZH/GF5T3BUXgJz/KOZnzAdhXMZApo0kn
	fG3HZdT1LkPGVbOkIHvrnRXbQbbzvIZtvO1Lzv0/ufbbc0MDZaHPTDokWZARdPE9S43ZMylJpjPhZ
	QMQLOUyi+3efz9AdT5KJCfmkjRQC/42H10jKuiTBivWAp8TtYznDoOdIqYA6VYSBmi+ebL0E/Qczd
	eFLT/ZZPeU0s0P332Pcc3b11MH9OH1g18JrvDYuchxzNutxO4OqTplE9ogITi/N8KzqeTZfNd6nFg
	osdnV7En9xnbjbloLhEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnWSn-00Djzx-25;
	Tue, 03 Oct 2023 03:52:49 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnWSk-00DjxI-0S
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 03:52:47 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1c5db4925f9so3182065ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 20:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696305160; x=1696909960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=epBeEg3WHOewkDN8nsgY1zC5qxutdS0j0M6jR1cFpqU=;
        b=KdH1LwCR3ctZsTn7FFWbsXVsgdpvZLae3sa1ozpyOTp1sit4JQTHyS+YF+okTmZ3tL
         WRUxyJrgX8Zig4Woe/R/Nw2Zz4DJFqXNscKaPD03sCOenBYpdXssdEGgtgi+RGjVNRfe
         pbV5t7Hko12P4iUBtrp7UAJ9wbktqthBXP90WcT8ZVDCgoNYAsMUeEJuki136MJj5f7K
         4QLMP6JvmBtDP8+NbK7WPNVfop7k774XWl/mJK/yPAcBbMPE5eW1YvhyvljwTCUyP+hm
         2KGp8p/6SRPol1VkRionSd05ES1rk44tj21wKqQq6i7SvVvidLa8Wx/N2ELN4N/Z+stx
         BuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696305160; x=1696909960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epBeEg3WHOewkDN8nsgY1zC5qxutdS0j0M6jR1cFpqU=;
        b=NNmzb1P67zNA9zvcIb/r28fghDmENvjzSao5ceHfRxV1pnzvhewbP2alOe/4DezR2b
         NnSDVmHkjqBLUU2gI9pWNJ4R0isXLIo/sCzPYp/SkQX1pjOYk5z+XozeDO4n4e/p3pSO
         V6Mf4ANIZgf1dOZpTGNwmSespFhlMHwIoVDF/d7BdXhpAROF6dRSALESujH2wLuel+SE
         NMZGwIZgdU8zKjA/KUDY/JX0y+oEhb/emxfW99Olz0jCSyQwrTmCzIcI8CSgLpxOd2O0
         9wviq39DspWH0/eYSqICGUnEc+/9gmc5cXGiuzHaVfO5EtTrzpL5nGVjnxx4Rh7iJt6Q
         Prlw==
X-Gm-Message-State: AOJu0YzfdnwWkn0Eqm+CZHxTdj5BIGyRtojjwzvMkSfwDPctgQp3VO8l
	yRlvdsDwPXi/EU+As6QgyTKwLg==
X-Google-Smtp-Source: AGHT+IFtHb+0ETHelhV6xmk1EC8fik9/FCmsu2/7CTguN41JmL5+gZAs2r18pIEdY+h0A7UNl7J3PA==
X-Received: by 2002:a17:903:1c7:b0:1c0:afda:7707 with SMTP id e7-20020a17090301c700b001c0afda7707mr2146645plh.34.1696305160116;
        Mon, 02 Oct 2023 20:52:40 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.132])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001bf846dd2d0sm277381plb.13.2023.10.02.20.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 20:52:39 -0700 (PDT)
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
Subject: [PATCH v3 0/6] KVM RISC-V Conditional Operations
Date: Tue,  3 Oct 2023 09:22:20 +0530
Message-Id: <20231003035226.1945725-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_205246_179771_6D00B834 
X-CRM114-Status: UNSURE (   9.07  )
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
found in the riscv_kvm_condops_v3 branch at:
https://github.com/avpatel/linux.git

Changes since v2:
 - Dropped patch1, patch2, and patch5 since these patches don't meet
   the requirements of patch acceptance policy.

Changes since v1:
 - Rebased the series on riscv_kvm_queue
 - Split PATCH1 and PATCH2 of v1 series into two patches
 - Added separate test configs for XVentanaCondOps and Zicond in PATCH7
   of v1 series.

Anup Patel (6):
  dt-bindings: riscv: Add Zicond extension entry
  RISC-V: Detect Zicond from ISA string
  RISC-V: KVM: Allow Zicond extension for Guest/VM
  KVM: riscv: selftests: Add senvcfg register to get-reg-list test
  KVM: riscv: selftests: Add smstateen registers to get-reg-list test
  KVM: riscv: selftests: Add condops extensions to get-reg-list test

 .../devicetree/bindings/riscv/extensions.yaml |  6 +++
 arch/riscv/include/asm/hwcap.h                |  1 +
 arch/riscv/include/uapi/asm/kvm.h             |  1 +
 arch/riscv/kernel/cpufeature.c                |  1 +
 arch/riscv/kvm/vcpu_onereg.c                  |  2 +
 .../selftests/kvm/riscv/get-reg-list.c        | 54 +++++++++++++++++++
 6 files changed, 65 insertions(+)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
