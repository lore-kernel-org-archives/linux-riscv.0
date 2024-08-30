Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94380CA0EDB
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 04:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1JGTs5xDkoWIl2eRG739wnQEsuzMsXVzLJ3VqI9Ks0=; b=QjSUPnumvFSAyb
	NPPe/rMyaWVHGey8hNe5N6rDImjtSilAbkpIbjpDe3/PMPtrZ1U1yBavT75I/O+Igx8gNNaIvFqhi
	hoG0Vkqq1UAilGxA+rizUzuhLzX6fFKZl3E53/BIhK1MvYlpsV11xMeZVm2940mx89HZs8oDaqHO3
	iE9Je01wor9ZRrU697jW2c5KVQnKGfFvYD6757kTGn0o0p3IQIwHw7c4iFuOPPLJl5WseQYR7ENm8
	0Gf05JEigSheU5L0Z7WjOPSftIzJsKdEUjOaptTsTmo6tz2WemccrO0AH4pHUliUJANozomrUK7Tz
	6huI2ruM6tKoKfXhXwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjtT4-00000004hXS-2OqR;
	Fri, 30 Aug 2024 04:42:38 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjtN2-00000004ftB-0mJQ
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 04:36:25 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-69a0536b23aso27200707b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 Aug 2024 21:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724992583; x=1725597383; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=TE+5gi+Y5s2UjnUAG5iU9KHZtarmS/zpW8eo5VQ9zdI=;
        b=TuaQvboQpK36go7K4FEJOD9+MOF2Motaof0a68Ww25QJq9IWGIcUhz19TwPfemqMNp
         2sjzNIKaVf3QB7VOFG5+obRL5/lru8P4XBk/qjt4z40Pmf7GZmZIQ37fxosujwFeeCVY
         7KnUBo9VVLTbXOuIqEJVU/T8ylMOC48jfP+ZUGVJaDqnxEP03yPcQKcVXFYVhw2waDPz
         PLIoBxK7hGPHmn4aOqfu9Su5M8FGnFFt5k2ZayTpUbDyGUzJUbNhOCK9OGv9JG0EGNZg
         WdAHsEBm6LWH7g6bVH49Y5tKThSOkh3WNiJpLUuwgCmsepK2Py0G6LlCGHGqj/Chu7ZI
         Xz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724992583; x=1725597383;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TE+5gi+Y5s2UjnUAG5iU9KHZtarmS/zpW8eo5VQ9zdI=;
        b=GYjqnqGTtuPqnyFRnkkJZVucPEDVPQc1DVo2HCmpHUAprRxUiUaNo6LRlDNelgE2XN
         EFtV5WwOqgswHN0TmpwQZVgeDp0sUa+EiCqYvXjlyLy0vChTaug30bFh+0Prj/mobpt5
         7u20q3r2G86Ryw1CtkpKF86vDe6AoBS4SiBZ/1yZDNuxiC5a5SkbrnhW5IpNFMuCOHzD
         FR1lT461FbJ7hUDM1+m9Pz1czvYe38OApsl4o+vKEpZuJbkcHn88MsurZRUAoLn1auWb
         1Xvd/LmUlECHwzEO4KKqdovXJwF+rCh/jp/g9W7bxjclmRXccFliptrb/x9PZ04QL55o
         tvSw==
X-Forwarded-Encrypted: i=1; AJvYcCX3V2vc9R7B27ctmEp/RE2W4stDmbtdqbiT77GMc98MMHBadEz4Xp0xKnKz4g1qXWGjZnbAulYad2M8PQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgSyTnexXCbuFeBLuVMrBMCj6wNv0cCkf/Ad3X5vYZ7jNzG0BS
	sYYpfuMa3lUhlc8vfZPmeuPwqebHHSZJtLcL2of2ANTt7NGBuzTLBuJA15BIYhHdg8nsCCxvLX/
	NPg==
X-Google-Smtp-Source: AGHT+IEXYjrPpdSD9GCwnZ0KjOxH9R7+gkyemXpF0saWXSC27VIOQKo5mk3or2G4Gxywo/W1sZdwv4+QKmY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:dce:b0:6d4:30f0:3a74 with SMTP id
 00721157ae682-6d430f03e05mr846777b3.6.1724992582796; Thu, 29 Aug 2024
 21:36:22 -0700 (PDT)
Date: Thu, 29 Aug 2024 21:35:59 -0700
In-Reply-To: <20240830043600.127750-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240830043600.127750-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240830043600.127750-10-seanjc@google.com>
Subject: [PATCH v4 09/10] x86/reboot: Unconditionally define
 cpu_emergency_virt_cb typedef
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Chao Gao <chao.gao@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Farrah Chen <farrah.chen@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_213624_235221_F0FC7029 
X-CRM114-Status: UNSURE (   9.44  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Define cpu_emergency_virt_cb even if the kernel is being built without KVM
support so that KVM can reference the typedef in asm/kvm_host.h without
needing yet more #ifdefs.

No functional change intended.

Acked-by: Kai Huang <kai.huang@intel.com>
Reviewed-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/reboot.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/reboot.h b/arch/x86/include/asm/reboot.h
index 6536873f8fc0..d0ef2a678d66 100644
--- a/arch/x86/include/asm/reboot.h
+++ b/arch/x86/include/asm/reboot.h
@@ -25,8 +25,8 @@ void __noreturn machine_real_restart(unsigned int type);
 #define MRR_BIOS	0
 #define MRR_APM		1
 
-#if IS_ENABLED(CONFIG_KVM_INTEL) || IS_ENABLED(CONFIG_KVM_AMD)
 typedef void (cpu_emergency_virt_cb)(void);
+#if IS_ENABLED(CONFIG_KVM_INTEL) || IS_ENABLED(CONFIG_KVM_AMD)
 void cpu_emergency_register_virt_callback(cpu_emergency_virt_cb *callback);
 void cpu_emergency_unregister_virt_callback(cpu_emergency_virt_cb *callback);
 void cpu_emergency_disable_virtualization(void);
-- 
2.46.0.469.g59c65b2a67-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
