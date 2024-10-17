Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718B1D2F7FC
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 07:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RCAU40J11GD8t7ADd9Y3abyKmPN92fZynVWwVyjqZWg=; b=Aa2VLpN1l/ksDw
	/8wWzV5a+nmgHBPONC6blS/SYGL0Zyrsy62A3LkN6ERqikEUIPkKh0YG0G5bN6IgvRbXinGu2G9GG
	EnnbuUzYUqczioB9cw7ef0lv5DNouTN/EyHY2gK0J6nUwWP7ZBgIRNye4x0j/oHi4zU/RsWGKTa53
	k3wQqly6urgdneyNgGhqlQZ2w6G3xBy5HMY/kRiKqY6+ve32q1H635FnKBYeVcRsWAKQIQO7KTvyb
	ly+K+NOE6lgrMaB44hFqXSOm0SpOl8mt9XmsVGuZw0uGQw89bSl9HaZZnfonYS1GK2JSyaB2+04Mh
	5JZ5t/qNxa9AjyUcMhdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1LCo-0000000E1ar-2sUz;
	Thu, 17 Oct 2024 07:45:58 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1LCZ-0000000E1X3-0jj2
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 07:45:49 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-431286f50e1so9108285e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 00:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1729151140; x=1729755940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QnNqilJoD/E6XdDy/QOtp2E6wGYgJITTGhd82yqjJKw=;
        b=ggYDVbahr0/s/rM/CjBLdf29jjQEZoyJmDvMyX+gJbVlttxHhdmod9RWNm3kdmjNb9
         o7iDC6Tn93kmimPyqEqmAoy2aMRhhvUidxeA60veVKhjBjeCHHwpaMQI31lPZPmG0IvA
         2kFBwY2u0waDd/bHxyflCxMAliQBiG6NGJAQgrbmWKlQ+C9HQaIPPiOAtJkNr1weafnD
         kYFoQReJaq7hvq9exHhKzbut8lT6iFtxGZYQQ/lUZWdmP01ESS/V9KiLkLL5GhWv4zaI
         gP6jhEi5QrdtQwlR/Oh+dn31RVboT35TN3qeVzbYqj7bwotSnOgyH/s4RvfuTHlwzPU1
         cYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729151140; x=1729755940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QnNqilJoD/E6XdDy/QOtp2E6wGYgJITTGhd82yqjJKw=;
        b=K19uqvlCSCmVH7s7E6pr9cw1HDheG6HnAlGB0EMxfRLtpVdjRGxcu4wADSUy/PIpxf
         Qke0lg/USCgsuRDClKjqqEXmMSPHydzTtyrM9bEJQJ5bOCdWeK3pFCYLdovSI2ERhkFz
         IYhMpCqIYmP3zmHW30yLTZ3HjN4mGf9UfrWo5OlAhncm6SoKUvtsAo8i9yKLlUc23WXs
         ttHdzlm5Oma6epb9BUE5/eQkWPUyMNd5r/yzGCPcLPO7pCCGJiz8z5mM471bi/zIGMLF
         Sn8BHrewy6mtI+vbUpEFWo5M8F6bTo9vSAjxsh/n//qsnzqBoyumUH6e7ooUhUP/6usM
         BNCg==
X-Forwarded-Encrypted: i=1; AJvYcCWgtIEVp6IsH91cscMCIwkmi7r2msdbAHbexwo7Iiv3mv+NvIO9Y/0IzSMHB3lGqY9PGJBfrE4eKU8Q4w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0O+fqxnOf6TWd6B0Gdc5KCYS5GQR1a9tddcMpjs/Z3Q/NEN1Q
	nkdofFHty24EuGqNxgaZ/Lt2Yi1Ne3LCTn3m5es4hWT2JlSoTAxDJ1hkNMv8ppjHUSR815lHpYi
	b
X-Google-Smtp-Source: AGHT+IGHuU+j/D5Lt1wHDzHTexN8NI9bwGmoJ0Bbm4fY1yEX7V4GppW53QTQioIb0o7fWl+5wYLI9Q==
X-Received: by 2002:a05:600c:5251:b0:42a:a6b8:f09f with SMTP id 5b1f17b1804b1-43125607846mr190261515e9.23.1729151140129;
        Thu, 17 Oct 2024 00:45:40 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c61b20sm17121545e9.42.2024.10.17.00.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 00:45:39 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [PATCH 0/2] RISC-V: KVM: SBI system suspend support
Date: Thu, 17 Oct 2024 09:45:39 +0200
Message-ID: <20241017074538.18867-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_004543_246063_6379E348 
X-CRM114-Status: UNSURE (   9.26  )
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

The SBI spec provides a specification for system suspend to RAM and Linux
already supports invoking the SBI call for suspend to RAM when
CONFIG_SUSPEND is selected. Implement support for the SBI call in KVM
so guests may initiate a system suspend. However, since what a "system
suspend" means for a VM may differ between VM providers, leave it up
to the VMM to decide what to do. KVM only needs to ensure the entry
criteria for system suspend (per the spec) is met and prepare things for
the resume for when the VMM triggers it.

Tested with this kvmtool branch [1]

[1] https://github.com/jones-drew/kvmtool/commits/riscv/sbi-sys-susp/


Andrew Jones (2):
  RISC-V: KVM: Add SBI system suspend support
  KVM: riscv: selftests: Add SBI SUSP to get-reg-list test

 arch/riscv/include/asm/kvm_vcpu_sbi.h         |  1 +
 arch/riscv/include/uapi/asm/kvm.h             |  1 +
 arch/riscv/kvm/Makefile                       |  1 +
 arch/riscv/kvm/vcpu_sbi.c                     |  4 +
 arch/riscv/kvm/vcpu_sbi_system.c              | 73 +++++++++++++++++++
 .../selftests/kvm/riscv/get-reg-list.c        |  6 +-
 6 files changed, 85 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_system.c

-- 
2.46.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
