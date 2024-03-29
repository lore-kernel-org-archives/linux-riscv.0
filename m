Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98287C6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 10:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Tb6rXEjLJfRkjEQznDTniVyxZxgsiuk00LNt7dn+QRA=; b=d4R18bN2F8R2rM
	kgkK72TsPWiQeRxIDTS+kZPOjYVguyAG0DSt7oya9tXyZCfsRQG3RkHtw+/Yb1W0Zq4eEa2nXHTJY
	Ov51aC2hInUndmdiJVaD1IkOJQp2B2VqtOJaFFROKh+Q9E6VM0JdS9FVi5G/AoK9+ux8+LsKdDjsj
	ab9xd8z+MwDSE/e5OSj7DFmEHm1HeCD3L+lFJIV+Tcgtoeo5rRTgtJJUA8J7BQJ2xCk4pRPPYXF34
	BMHMKycJY1yag1mr2sgpn/gfu4KVnH5DqTu5mzMtQIBl+tgwqc37oUtqMWoBkWL0xMSfaMqBcX6fM
	8Rl0HQVkk73WBbAwRyUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq9Yj-000000003XQ-32aG;
	Fri, 29 Mar 2024 10:34:06 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8WV-0000000HUI0-3FSo
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 09:27:46 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-29f749b6667so1316239a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 02:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711704461; x=1712309261; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wphdEuVRZdcfvU1uZa0UrVCyguVuaKQ82sqpzgvdX+0=;
        b=DlLLeXEdsk8laIGfMhWVEa+wxeM+Yvh9BupfnRbtgiRM4SvDrUMACLUOWBMmcqzWle
         hnJNZCglIAFWkV70L1M+9MbA86sTSHE2c4Z1sw/bhaXYKAUWbhct/T7qca3U8UrJbLEx
         cNWDRV+ML5wTqrnMXL5JBABVJLsLLLigCmswr0WauwSiyz8DYthmxKhSOECty9D0ojLj
         Z++zLYLknWMiiI6uPBAYA6QeHqLGioiEIXXKXyWJaN0O3Fvat6q7dlfBb+mdhc5gOSQz
         TkUmu9FDF+AvGObzFYKWHs1lTU59TxOxxXs27ookHehEMGe4qwxeUrwySIbz1t2LtPY4
         zDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711704461; x=1712309261;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wphdEuVRZdcfvU1uZa0UrVCyguVuaKQ82sqpzgvdX+0=;
        b=N73pWOfrZLEqk8qmVk8xLxIPsAxU7vMsZYrgjHdgdAuRdDa7yrxPXALrNG/7smj7+s
         vc/VTJ/c2AZxjid/nsygrVi1kCUbbOpgtOwoTXB2mmGtcSCSWjRnKSIktlGg+jQFoZJS
         PZn3nXPqiONq7n24tIwX2RJcr2yZHcU3SNwa2Q3H5umUY9+w+pzK5xC6XPjpg1ymkgi8
         ZT46SYv5EJLaoyjEkAPXVF4mtXmZVXk1xZ8A6341bqQYokPArDHw8IesYNuGLcfIjDVi
         szPnfW9tVoeHQKAs/Vt+8R5rzrS0XxwTI3M5T8q/KfF3Y9XMs07UWkDGSbmumygV/stP
         vUMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgHQHmf/W/SXdnfcWOPPHrfEBwSY7u48nG7Wsg0JFGmj2ZBl/sA7sVRdIVuUr/mxRSLGDevcWJpIldHnMn9Ss3MBUJqnJfLpdPaD05q4ME
X-Gm-Message-State: AOJu0YyOHaeim5zvKI18IRM1uh45X4nZHv0lJz2GjrdH0WesSrS9MnqR
	RWcbKK5iODGlruLiNIX0zEaGcBEw7aqS99UYkbtPcbhRDOVLY2KwYuPFoKDt5Pag7ThkWCpuwND
	Kuqgka8kQVpF2f+s+lxJgbxDhjlFUQepDaP++YBQb9DIvjDWqi3bGFPpKAeQNccx/Jr00pUCsz6
	alyoTpBp54kN1XhECypB6JE6Mmsq/dRvbfj4PoCxKgjO6TiMJIvw==
X-Google-Smtp-Source: AGHT+IFf4f0IS4Sv1ofKMaYbSZwd8YlGOT1AaVNln1woRpkOY9F+Jd0NVeHAdCb352GScKE4g4Gsmw==
X-Received: by 2002:a17:90a:4216:b0:2a0:33c2:997e with SMTP id o22-20020a17090a421600b002a033c2997emr1713230pjg.41.1711704460537;
        Fri, 29 Mar 2024 02:27:40 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id cv17-20020a17090afd1100b002a02f8d350fsm2628830pjb.53.2024.03.29.02.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 02:27:40 -0700 (PDT)
From: Max Hsu <max.hsu@sifive.com>
Subject: [PATCH RFC 00/11] riscv: support Sdtrig extension
 hcontext/scontext CSRs
Date: Fri, 29 Mar 2024 17:26:16 +0800
Message-Id: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADmJBmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDYyNL3ZTUMt3cxIoM3ZzMPF0TUyNdM11L3WQzIwPLVLOUJDPzNCWg1oK
 i1LTMCrCx0UpBbs5KsbW1ABEr0dRrAAAA
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 Max Hsu <max.hsu@sifive.com>, Nick Hu <nick.hu@sifive.com>, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_022743_933669_E5603877 
X-CRM114-Status: GOOD (  13.61  )
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

riscv-debug-spec [1] Chapter 5: Sdtrig extension introduces
trigger CSRs which can cause a breakpoint exception,
entry into Debug Mode, or a trace action without having to
execute a special instruction.

The focus in the following patches is on the two CSRs from
the Sdtrig extension: hcontext and scontext.

These two CSRs are optional according to the spec, apart from
the Smstateen extension [2], which has bit 57 to control the
accessbility of the hcontext/scontext CSRs.
We also introduce dt-binding in the CPU DTS for the existence of
the CSRs in situations where the Smstaten extension is not available.

The hcontext/scontext CSRs can help to raise triggers with the
textra32/textra64 CSRs set up correctly. (Chapter 5.7.17/ 5.7.18 [1])

Therefore, as part of Linux awareness debugging. 
We propose the scontext CSR be filled by the Linux PID,
And the hcontext CSR be filled with a self-maintained Guest OS ID.

The reason for using the self-maintained Guest OS ID instead of VMID is
that VMID might change over time, and the user setting up the trigger
might enter the previous value, invoking the wrong VM for debugging.

The tests have been done on QEMU with Sdtrig CSRs
(mcontext/hcontext/scontext implemented) [3] boot on virt machine
and also run the Guest OS as virt machine with KVM enabled,
the two hcontext/scontext CSRs can be written correctly.

This patch series is based on v6.9-rc1.

Link: https://github.com/riscv/riscv-debug-spec/releases/download/ar20231208/riscv-debug-stable.pdf [1]
Link: https://github.com/riscvarchive/riscv-state-enable/releases/download/v1.0.0/Smstateen.pdf [2]
Link: https://github.com/sifive/qemu/tree/dev/maxh/sdtrig_ISA [3]

Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
Max Hsu (7):
      dt-bindings: riscv: Add Sdtrig ISA extension
      dt-bindings: riscv: Add Sdtrig optional CSRs existence on DT
      riscv: Add ISA extension parsing for Sdtrig
      riscv: Add Sdtrig CSRs definition, Smstateen bit to access Sdtrig CSRs
      riscv: cpufeature: Add Sdtrig optional CSRs checks
      riscv: suspend: add Smstateen CSRs save/restore
      riscv: Add task switch support for scontext CSR

Yong-Xuan Wang (4):
      riscv: KVM: Add Sdtrig Extension Support for Guest/VM
      riscv: KVM: Add scontext to ONE_REG
      riscv: KVM: Add hcontext support
      KVM: riscv: selftests: Add Sdtrig Extension to get-reg-list test

 Documentation/devicetree/bindings/riscv/cpus.yaml  |  18 +++
 .../devicetree/bindings/riscv/extensions.yaml      |   7 +
 arch/riscv/include/asm/csr.h                       |   6 +
 arch/riscv/include/asm/hwcap.h                     |   1 +
 arch/riscv/include/asm/kvm_host.h                  |  14 ++
 arch/riscv/include/asm/kvm_vcpu_debug.h            |  24 +++
 arch/riscv/include/asm/suspend.h                   |   7 +
 arch/riscv/include/asm/switch_to.h                 |  15 ++
 arch/riscv/include/uapi/asm/kvm.h                  |   9 ++
 arch/riscv/kernel/cpufeature.c                     | 162 +++++++++++++++++++++
 arch/riscv/kernel/suspend.c                        |  25 ++++
 arch/riscv/kvm/Makefile                            |   1 +
 arch/riscv/kvm/main.c                              |   4 +
 arch/riscv/kvm/vcpu.c                              |   8 +
 arch/riscv/kvm/vcpu_debug.c                        | 107 ++++++++++++++
 arch/riscv/kvm/vcpu_onereg.c                       |  63 +++++++-
 arch/riscv/kvm/vm.c                                |   4 +
 tools/testing/selftests/kvm/riscv/get-reg-list.c   |  27 ++++
 18 files changed, 500 insertions(+), 2 deletions(-)
---
base-commit: 317c7bc0ef035d8ebfc3e55c5dde0566fd5fb171
change-id: 20240329-dev-maxh-lin-452-6-9-c6209e6db67f

Best regards,
-- 
Max Hsu <max.hsu@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
