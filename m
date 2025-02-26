Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F97C19F32
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 20:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v9QBUBMfQsTUHYxPCBA/5Kok9fcALdbqSQvajoF/n9U=; b=FE3EBJGqxcz8tm
	Zg017I/5i1q19b4fy7k1mkDQSdkrprsBgzYYQlx98Q0CvTAYewKh4YTjTgtIwxmvPIMsRhnu+6bPa
	j+ovhTh9yWbrD9gKPmEIDv15vi1dfgnrrDMKZeeNniugceSXxxbPzj0HFfhx5TJUW5w9x/bEj9UCS
	0SfvDFjfLpioE641UP2/rDC4JYmuu/sp3FRa9gouRg6haczz9ZAUkH/T7i0OIGxNy3rHQw7eYs5bV
	Xm3LQ4wXDJipOYuKt1Nqa0/NXcrx4uHgKL3XVvERCmPA0IEFJqM/sdrNHiGXmdWtGduQ7my3vsv0P
	BEPHwdrCVBVn9XKSUhbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnO1A-00000005LCP-0lGh;
	Wed, 26 Feb 2025 20:28:32 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNxv-00000005KPy-2YCo
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 20:25:13 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2234bec7192so4123915ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Feb 2025 12:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740601510; x=1741206310; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vJfRhZEo2RIsfouA3ZbiUgm3ilY6Xa6tZ9F+JSMVv7o=;
        b=X985XFKS44DqwCP6Dnwo2WEBCMPSKyTQI9Lpy/brUF7+jvCHcljP1LhFypjZ1XCYhn
         KYF0Re9LcSE23qvF8vY9MAxNC0fnMjlGPJ65uJONSzuOsnXCCKdiZ4oSrJWrFmQm5WC5
         VSSXqKNM01crl6DGhd+Kzb+ZLu2bs0tx/9jtRjny+oKbmj52/ldQCQVJzfxeG3m68yib
         i7uBhEVPXqf4fUZ7fT0MJswi4ZqN9fiOKhI9Y4HhdYZD0BsEeCOzH9UKEes8bBVLg4FU
         BfQ6vS9D0UPISjtMd79AgPQbrKccvUPUWIzu2k/3nm8MwmDDcz1sgOMPxqNj6eh550t7
         fSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740601510; x=1741206310;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJfRhZEo2RIsfouA3ZbiUgm3ilY6Xa6tZ9F+JSMVv7o=;
        b=ginUDEITj95lRpC4Lm94WjlgGJ+/C6+nHf9NfgB+1t0wMUteENojmJ5WxBHSkvLlVU
         blF2XB04yvNmUPbv7d5ZbeM6uTSdNONc90+nXimur+8aI+0ahf6S1w44KiljoMIfMVnB
         LON/xN/CWPP+psZ40mt0gSK4lxkk2ws9DJDPLzi3ValswGViuhYIxQbVm9aYJ7V6cMIT
         yuIOj6jg82DV8vgeAQ9NeRWeCv7Fvf81bHBMvxJJ4CwkR8nXtCISro+1PpjYg7Gi4+QG
         pWxPFNC5ay+vT84L1h+Yj0bakF5G5daUL9JIw44Dr/qJN4BgA8+qLAoXoQBvd7FwKsRM
         vcRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYzcGQN+C5oqrdcypCv27POcVkz7a1YpL+6Hl7qc5SAhLdH6r+7jaLhJJjEZTHRnoIRCLmdG1XTEQm9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWIVbDrKFI4RCtruNdo+nmKQp6wPPQiLcQe3QbGHNely63ZykI
	CadfUB49rdDVPjzSZ1ao52N+WSc9V2gEaBJrVfAh/npROLKnMoVylq9L1xteBxo=
X-Gm-Gg: ASbGncug/vaYdNn8au11jatplMEPojSe6cctUcQMyR6l+6bUi0yaZcleO0/ivb30he/
	3aD8hZPE6L0LAkMU/AwLiglcQO7CUo9si65CuWZzqVZZzGnPxqevrJ7VTjWsFIw61Ns72F9FOZx
	SzxcENMI9azeg/2Cy6Qeod/03MkKPKcwure6X0oI0ifsnZsUBNdJVCNjv5A/tRN5+Ei2v2j7Kz8
	GNbvzPy+Aw8ZiARlq+OoZpksL2nDQy7+Qk5QwKHYwyM/1GeLRNcF35M7qmBxDuyL7ldefxRfE12
	pH7gUFqAquJvMTJ3N1zGmqQYMh3gqVqR2IJ9aAM=
X-Google-Smtp-Source: AGHT+IGBMBO+u+81QuNJ5bB+1erdTCTpC0irRH+rlBfJ+nJ9B7BPIr1HT+61UNH4TSBhiFyqAE9NUw==
X-Received: by 2002:a17:902:ccc1:b0:223:2aab:4626 with SMTP id d9443c01a7336-2232aab496bmr63446705ad.11.1740601510471;
        Wed, 26 Feb 2025 12:25:10 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f7de2sm4100963b3a.106.2025.02.26.12.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 12:25:10 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH 0/4] RISC-V KVM PMU fix and selftest improvement
Date: Wed, 26 Feb 2025 12:25:02 -0800
Message-Id: <20250226-kvm_pmu_improve-v1-0-74c058c2bf6d@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ54v2cC/x3MQQqAIBBA0avErBNsSoiuEhGVYw2hiZIE4d2Tl
 m/x/wuRAlOEoXohUOLIlyto6gq2Y3E7CdbFgBKVRFTiTHb29p7Z+nAlEsYYLdt+xU52UCofyPD
 zH8cp5w8fth87YQAAAA==
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_122511_915172_23891ED7 
X-CRM114-Status: UNSURE (   8.41  )
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
