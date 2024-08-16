Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01656C531DC
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 07:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s+5JJlIti0F4lCcU4CNdSHjcN3ngjqP+lmrBZJZYPMs=; b=bKmgt6pmYhYXbM
	eHlfFq29iSjFRBR1zNUOkkBXSBaGxtAFIQ91SyOogdnE6AMPinMDdGZdj81KTz9LMrlV+Kr0MiZ1X
	6V8/hUJ4ZNZPxuUe77N561AixaQjbWCZZ/nKenV3RdbzOoF9V0f7bkHEDpb6SxRtK1txsNX50IzYY
	q9dBkNxpljaAVS++KrwWfCcYK3aWvIbJuC/01b3/f5CUqW7FnKYtllpvuOI71xE2+MtOGu0nwxi2w
	y6oqBZmCebRSt/T4a8x174PuQvq4tzllMpCnYybYf3fxsaQmyY8Z3HVqchWDI2WDsV3Du3fOPnjPR
	xkM1Cf/WHi2IZw8PndaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ser5I-0000000C2OQ-0Jos;
	Fri, 16 Aug 2024 07:09:16 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ser4m-0000000C2DD-2oCv
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 07:08:50 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7a1be7b5d70so1081970a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2024 00:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723792123; x=1724396923; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Vqa4H3pvrihbzfusj/3lrV2Ez3LbOAxuSneAwjr3tQ=;
        b=a21w9c3cGmJ4hS6bdx2fQVTlO1Y2884/BmxZVmCHcnVhmUgrzwTV2oaNQX3tK/EQD8
         Pc96uuUKyRRANT23ikDd50kqBixdQAPx74jI11lx9WjJJzhc5mY7BDktSpZ+k9YSRqmH
         BeMy6o52NfmEAbwY4oz+AqKfgPVxyMlLkN2X6m1li+0dha1yr6X4YsEPcHgYmOZLfnzF
         YWfqfoEg/zmWOIbctuIMv6KX8na1wUhk1VrkY7aLXq3vw/lwigYdg9BPu4Ihuyr7E8F8
         VNRo6oECN9sqJxaw+dzdpvIpX4cdxcnxNM+/cYhLY8k+46nyd5e0nMIQrJdR6sp7KJ0N
         yUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723792123; x=1724396923;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Vqa4H3pvrihbzfusj/3lrV2Ez3LbOAxuSneAwjr3tQ=;
        b=VjqM8298YlonEodLek7q9KDwzZGkFgBGzxz9PxKd2Py+5xZxbPsK98VO+hGVva6RM8
         LOv+8W+y6gREV/+ARG7ZlTT4JNPYyycRMHu9I8cwLRwoFv86Xc9NJyikGgChhIWjUSwj
         6+cEb8VDC426pi3EXndaciujWxdEvrna3OlqooV91/0Bt7KdX7aB/+yrQiHbb6uM49yv
         ew1k3GNJK0twTqubdJ023ywJOayfKxVOte+ygauknVerNM9TIFQFBeJ3I1RRTgG61LJ4
         vxBs3TsGpGp4rpSwvjFNTFDdkpKi3QS0QYpgnvGMiDkRj5y9Djna46659cKoxvPHfUxd
         ElWA==
X-Forwarded-Encrypted: i=1; AJvYcCU808KEkdGT/vvxvc5O5ORoeissuWQJCoO4VeLGdvaA9kd9EVVwKVAUl3nIf/+Oueo69ryobQAfs4oNe7tXwJPAfpFEyAQa5mpb3V7w8Vzr
X-Gm-Message-State: AOJu0YyjEu9oM+DJ5mgtia0RWenCHCdVeeOyeWTG0x/vFHozeW6tWK3v
	3Cla2qk/nfoeTQt+Opw1aLMRRgdDHvdXlOjO4tCmtY0ekyETNale+l1mGE+Q2GM=
X-Google-Smtp-Source: AGHT+IHuF3rytZSdgjc6a/3GK/MB0ehKK5Zvbzf8Akserc/e1RWHlzoIrY6wFrSMS6kbKYCi1UimYg==
X-Received: by 2002:a05:6a21:9996:b0:1c6:b0cc:c44b with SMTP id adf61e73a8af0-1c8f86dff79mr7925906637.19.1723792122792;
        Fri, 16 Aug 2024 00:08:42 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b636bcabsm2293792a12.90.2024.08.16.00.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:08:42 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH 0/2] Fixes for KVM PMU trap/emulation
Date: Fri, 16 Aug 2024 00:08:07 -0700
Message-Id: <20240816-kvm_pmu_fixes-v1-0-cdfce386dd93@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANf6vmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcyNL3eyy3PiC3NL4tMyK1GJdIzNzU5MUo0QDc/MUJaCegqJUsARQS3R
 sbS0A5sIugl8AAAA=
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_000844_817370_5EC32973 
X-CRM114-Status: UNSURE (   6.04  )
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

This series contains two small fixes to improve the KVM PMU trap/emulation
code. The issue can be observed if SBI PMU is disabled or forced the kvm
to use hpmcounter31.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Atish Patra (2):
      RISC-V: KVM: Allow legacy PMU access from guest
      RISC-V: KVM: Fix to allow hpmcounter31 from the guest

 arch/riscv/include/asm/kvm_vcpu_pmu.h | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)
---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240729-kvm_pmu_fixes-26754d2a077d
--
Regards,
Atish patra


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
