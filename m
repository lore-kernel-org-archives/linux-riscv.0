Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7595C36005
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 00:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mQ9V6O7VBRLEXXkXhTOt+UP53A7W2trNiDDbX27TouM=; b=XDO6V50gbT2UNi
	9nfaI6uZaZRT6Ta3MnNtXuPwNQ2H69Ls/lgT7RN6pk6G6Xkg63HNxbzh0J1Scu13DEYE2xttkUO2X
	/gvG1aJyOXv2nqOdojVxuX68nl/iUFzQX9xA79vlE/jfv5NtdLARCFx20LX24NHvQKOubAnlw+gRW
	cyNxttQTwKPC9zRQv7AuPWBEbteFVJGmxVyGDiq0S6t2ZQwp0xKqZ5o52BTFktsUOQcEj0Mrd9DJL
	o3gwDACiVtgB6LScdUcsOFST57W7dbVsJNVc1vM1tMv1mlOg4LcJb1pXQjbnulcjOfa9mH6IA3NBC
	keLvLYxYqkhmlWzg2tsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twsLW-00000004Y54-2l1k;
	Tue, 25 Mar 2025 00:40:46 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twsLT-00000004Y3N-3oVZ
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 00:40:45 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-224171d6826so22924855ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Mar 2025 17:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742863243; x=1743468043; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aYO6bJ8zL5aeSIvQoR3y8gnTb2GfsftmkAHE8LswBPM=;
        b=2ZlJT1SaTWimvKKg0G3D5+IqLsxAKDJnqW2BJ3dao41wnGTgsLnA7vYC89ZEAnPl/l
         JHmDxVo+jHLzNR44BCRDMYzTUtBhYMQGeTAJNQeSrXhNhAQOUgrahlOEiJI8iMO6kbYp
         Q8Zqn7hxmGlwqm7nWNWiO64gdogIUbhNidgnXEAUgfb8/bQ+2MkMjeEGxmf5yJ+9wHm3
         TvTZ3ahxU3htfDxoerA1d/0lr3pvofzGpOeXJcaD/Tj5DkiJzwKOU7wTq4eCKCmRsRo7
         BJWgafotj9RRmejzQc1pdfHz+MXwVSrQ1cfzT9gVMS8VgPcDiq66RvIRHFKV7r5PYS8u
         DLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742863243; x=1743468043;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYO6bJ8zL5aeSIvQoR3y8gnTb2GfsftmkAHE8LswBPM=;
        b=XiY2P90qc84+kgoMUwWrYLBPLCd+B8Iv71xEXuI6vAcOWfevTYDtofQ77LFJmNh8h3
         SMj6QWXOZUGoCTQI+FDmyfhOuvptIIfuLTCEv/CPwX6IHWsMps4pdM1tF6F1sjprvutn
         9r4CYPF6kdVE1vBAYXWaZyx94HfFJESOByBCC/NeFh5yYh+cFf6mUtkP9jvOe7HFsA4Q
         r4hv5Y7rEJWodCcmDOyodB1cXhXStbyYjEReyEkqbVU8ekEnBiscqR4Y9ly7FWpgJmSd
         aYzTrTPn+8Nj33cBef8TN2XuSRjJAxKbd8f8IALwWChEXf9swjcs+dUzPOl4RrbauVZj
         LeOw==
X-Forwarded-Encrypted: i=1; AJvYcCXMsVmavTKG8dQduptAl0V9JCEBZk2awygOsx3k6pdf7HKzEiyHVEBQhn9nh1+KlCJeseHtBDrghHA5+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXMi3NvQrZZQfjaI+ml1Tz1PxZvsRmOrKcKb3XBWQl6x4yWsdS
	rzk41nkHyCbNMdASuXyAa83JRgCLl9w7boO3jJ6UEUL3RJFqnaoMlyb4aokpRJc=
X-Gm-Gg: ASbGncsVJdjeif/wpdMn64I9UId5CfnfWMR+QYsg1wctYZVdG7LcePNdGPRqHCxtZNq
	7ue4gL5CwMR6+StGl8FwGfcrXZnPquhCUkf9p6yCBoPVU96tNHZUNzF7/JvYo88sBBjqQhCtTVa
	vxhR/WWhv3v9N8Tmgg0nKDX6g0dNUZ34HCAGwcURFxPatY2DeQdqhrbtv7daC8n6PjESZkQeQQx
	tJVAym63b/KvVa3grK6dZsPMZyCW/fNikA/nqXc3H2OIgeqTpNgRpPtggv7vjdLlTC1d4eBY58s
	aImNm7UtfzLKz5T2LPJJbhPlvr6H210tp40iret4iXbDfQ7U5YvjONcwXA==
X-Google-Smtp-Source: AGHT+IGKaAQwHsi3qvX4TbcKN8G3Y8mGa16DOUEDVHL9bvh5YTIWSFdZiwuzP2GQ1p/HXxhaFtJWOA==
X-Received: by 2002:a05:6a00:8017:b0:736:4536:26cc with SMTP id d2e1a72fcca58-73905a2786bmr26107578b3a.23.1742863242520;
        Mon, 24 Mar 2025 17:40:42 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390600a501sm8705513b3a.79.2025.03.24.17.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 17:40:42 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH 0/3] RISC-V KVM selftests improvements
Date: Mon, 24 Mar 2025 17:40:28 -0700
Message-Id: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHz74WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyMT3eyy3Pji1Jy0ktTikvjM3IKi/LJUXcuk1JQkyzSDRLMUYyWg1oK
 i1LTMCrCx0bG1tQBKyBZkZgAAAA==
X-Change-ID: 20250324-kvm_selftest_improve-9bedb9f0a6d3
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_174044_148654_BD0C8756 
X-CRM114-Status: UNSURE (   6.80  )
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

This series improves the following tests.
1. Get-reg-list : Adds vector support
2. SBI PMU test : Distinguish between different types of illegal exception

The first patch is just helper patch that adds stval support during
exception handling.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Atish Patra (3):
      KVM: riscv: selftests: Add stval to exception handling
      KVM: riscv: selftests: Decode stval to identify exact exception type
      KVM: riscv: selftests: Add vector extension tests

 .../selftests/kvm/include/riscv/processor.h        |   1 +
 tools/testing/selftests/kvm/lib/riscv/handlers.S   |   2 +
 tools/testing/selftests/kvm/riscv/get-reg-list.c   | 111 ++++++++++++++++++++-
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c   |  32 ++++++
 4 files changed, 145 insertions(+), 1 deletion(-)
---
base-commit: b3f263a98d30fe2e33eefea297598c590ee3560e
change-id: 20250324-kvm_selftest_improve-9bedb9f0a6d3
--
Regards,
Atish patra


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
