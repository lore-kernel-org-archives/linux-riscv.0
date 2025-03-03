Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D24CC282C6
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 22:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OTCX8IO9rpmeLGM/1ObdvcOesNPg7zI8/EWKDx+e+y4=; b=LMZ52iaoV2B8Bv
	1x7hnqtXNLTGigUcqva7WpSQEsnz86F+/njB8X+jVkQ2rCbzV8oGTVTQHjrzVuQovoaTAEmCbzC8k
	l7WgtyjJHhsGeQPV/YcXfoF/vuNTQM+yCcmbJp5EMHeJGBdaspr1agRC0LJ8ehSjU5c+C/RJf3Y3e
	7UGzD9aLSFSnG8Dz8tNcamEfXj9VEyTL5D1Mj96h9HcA1f09i0bn7ud4YAzzTgx8eiiVj79xQzrVg
	weSW6PhlXafWqcsWGPoN1wjVWRpPN3hQpXPrgH7eWJCv1XSQgL/yXDvnbcol5AWhERIxoL85miL+M
	737SdBJRtWveAmqdesbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEex-00000002Vxo-40Vb;
	Mon, 03 Mar 2025 22:53:15 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEeu-00000002Vve-3rSC
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 22:53:14 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-223480ea43aso123998985ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Mar 2025 14:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741042392; x=1741647192; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rHRREGcSp2krqTtJr5eO01PBlpy/oFOdFDc6Qvhwm80=;
        b=QHAtYYEOhLs1F4RBuz6r2gFQkm+jg61vJj20OT0ga8tirYhbSqG2IzqrLSBPWyDpLL
         9feZI+SrhMOlG5Nd/bCdZWpt5MH3MZAa+M50lFi7y9Ny0AiCloUb5nkCqDi3wED14rqs
         rEYJAfhrFDMhSudRo8flxItBSTB6gZ11nViNCcCRiNIFrQ+y/nD6D+hEOxUlNUflOY0h
         +VXU3FUvkqQVOLwuMgR1B1L74ldTFtGAZ0lAQLM+2PBwFIKphRI2TqkZKbrE8x5Uted+
         7pksdV9h3bTPuiaF03w4wQ5Z2aStPlPg1pTCEKOBufviPiAk5ZnA9ZOGOFI21cGeYM7i
         uCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741042392; x=1741647192;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHRREGcSp2krqTtJr5eO01PBlpy/oFOdFDc6Qvhwm80=;
        b=wk09CmKfOp0zD2DU+gVjJHCpSTjztMyUkKoX3qQFLRvJfATAjRl8OwRaJXxWVSSF4g
         WYJqIyLf8hA1v07w0XT+lItn7H1brx8/PRUwiNhqJW8SDKyUtCMyGps4bIIXfzJU3nZH
         iV+Y3T2Hy2t/4ZtclnkxV1yIOpUP0HznB83tDl8BJoyynw5B7hhW6myfNc4maNO3hFq6
         ThPBbz5vzRuind1zxKr737iuzOAefQsh2xc76JihB32e6qwOVXDqWdDEaEJTaXwL/DVY
         /mFlL44oYsjXydFOHUn10IJstapYFr0RGH2irvUueYeYD8niskbzBCS6NTnjbXnpzKac
         RdQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXubKDw/nFJD8sHV4G98SWLFIEAqKlCLHhlbX+sDmkG6/vr5Q+Qc0fYotYWBzYbjBmXMRyMKua+OqHTKA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7XJMqRHh3tIn6Ue8Sx4BEcM81pT4wPp+CAPrNr37Jx1zrNnju
	UOmk/QZFzg1LKwg/JgLMQrGZsBhYnyvXh3h0XqqPqDF8GCqDlqohy49MEneolgRCxuyLGEKC6Mf
	V
X-Gm-Gg: ASbGnctdnuuJGm+jLHjZY2LvQHwgifAGsDijCu8t7JQHRJ8xwucXqpnS9wGSrF1SLGw
	A3LR2OXTUc+ONC5Xj3k8JnUnzjh69aHWwBI+lylCcgTnudY88ZZBxkTY4KGTNRFlERPr5Qfk/wp
	qq6W1jQE/HYlvss/xViXAQMTZ6GoDld/x3wFgcG6Bv5ao/zQWlPtYmsgsEkEvLvwqjR1Ub93J/d
	tD3q09KryCfA36XZzA0GH4BkABuB1lbY/bxLl6+GSBL074/h998T6b8sQm4sHXqx6tkwdt369ci
	IpCFI+iboUioMeYe1PoHOpbn3f2XPf0pOJmF2C28jazJCAwVW2SCpMFaJg==
X-Google-Smtp-Source: AGHT+IFTnPiC8gGn23TPq+Loy5LwqUVXrpZ/genl7BFYk1BAOqQRQeXw3l+mF/ky73QXi/CT689qMQ==
X-Received: by 2002:a05:6a00:a91:b0:731:e974:f9c2 with SMTP id d2e1a72fcca58-734abed5bbfmr23190306b3a.0.1741042391979;
        Mon, 03 Mar 2025 14:53:11 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003eb4fsm9440601b3a.129.2025.03.03.14.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:53:11 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 0/4] RISC-V KVM PMU fix and selftest improvement
Date: Mon, 03 Mar 2025 14:53:05 -0800
Message-Id: <20250303-kvm_pmu_improve-v2-0-41d177e45929@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANEyxmcC/2WNywrCMBBFf6XM2kg6JrW48j+kFJuHHSRNSDQoJ
 f9uLLhyeQ7cc1dIJpJJcGpWiCZTIr9UwF0Dar4uN8NIVwbkKDmiZPfsxuCeI7kQfTbMWqv5oZ9
 QcAF1FaKx9NqKl6HyTOnh43s7yO3X/lrdXyu3jLOjUFz2Cifb6XOk7BMtaq+8g6GU8gGwP2/cs
 QAAAA==
X-Change-ID: 20250225-kvm_pmu_improve-fffd038b2404
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_145312_962262_25DD4326 
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

This series adds a fix for KVM PMU code and improves the pmu selftest
by allowing generating precise number of interrupts. It also provided
another additional option to the overflow test that allows user to
generate custom number of LCOFI interrupts.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes in v2:
- Initialized the local overflow irq variable to 0 indicate that it's not a
  allowed value. 
- Moved the introduction of argument option `n` to the last patch. 
- Link to v1: https://lore.kernel.org/r/20250226-kvm_pmu_improve-v1-0-74c058c2bf6d@rivosinc.com

---
Atish Patra (4):
      RISC-V: KVM: Disable the kernel perf counter during configure
      KVM: riscv: selftests: Do not start the counter in the overflow handler
      KVM: riscv: selftests: Change command line option
      KVM: riscv: selftests: Allow number of interrupts to be configurable

 arch/riscv/kvm/vcpu_pmu.c                        |  1 +
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 81 ++++++++++++++++--------
 2 files changed, 57 insertions(+), 25 deletions(-)
---
base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
change-id: 20250225-kvm_pmu_improve-fffd038b2404
--
Regards,
Atish patra


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
