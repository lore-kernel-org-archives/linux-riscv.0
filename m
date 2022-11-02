Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34528C43219
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 23:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k9zo+LoWNpRrGFge8g87uIKqnfQQJQcUd6lfox0dFpw=; b=TPwQ2VbyZxYu2M
	7Eo2+hbm80Br9XoJKvSPRO/NmsA93LNw6LAdNiA0wl1RLfE1v3+hsU3m2P9vabjbYqVLvfloXkcDb
	Oj3lGlTggIjlRmRx4DJDBVLKEiMFz2kKsBcm4p55PqDZKX5KIjVidJw7q/5rrA+I6+LBEUKMDyMQr
	STIwizBoZk1qX4XmD3yKxnpQW5Rbj0JMBCzE59l4x4NwJ4YeEhc3dSM2zjMNA/l6xlpXOVyKrmzbG
	ukhSDSh/OLOyH9wYBUS30h/5bXqBnKBToAg2RvLe25XsEg1MyATyI+Bo3cSB0DPcBoOiXirxvD9ZY
	1O/oHWiuh2e7SYYSLSQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqNLx-00F4vu-AC; Wed, 02 Nov 2022 23:41:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqNGT-00F1m3-7e
	for linux-riscv@bombadil.infradead.org; Wed, 02 Nov 2022 23:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hGyIy/c9x7gid81AWLPwZ0ljJlv+xEg20udWYHo0hbA=; b=sBVXXxALa4Q7Ybd2rk3H+Cq9hQ
	c2YIzM0Ppm4VSOLJnvIWrhV1SY7etef4KYYyEIQZynbNh5j6y2K7AADP8HO07SN8JWAfIcyHdTN2m
	d8dNel8rVQCINwU3Q7/ghSrptBTOyZ1K/iw3bKXjYYDyik1vbldQeHnjEQ2Eb8IWBtpCVw0dSj1gx
	zrelbom+Sck6q9+IB9IM2G96789/xkRhhMVBDmK1Kp40LubbHBq+NkAtikRQpy+U37TwJ4KJOff8u
	sAhBzhdjS/aPIvyRi917jjKDOblqOIi4JPjMkHTO607i2+w05zMr9+TCEH8jj6IQXFgowsT9VBUEO
	Bbw00yAw==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN22-005vwj-PV
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:20:29 +0000
Received: by mail-pl1-x649.google.com with SMTP id o7-20020a170902d4c700b001868cdac9adso221230plg.13
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hGyIy/c9x7gid81AWLPwZ0ljJlv+xEg20udWYHo0hbA=;
        b=QqNc2gbel1jInPNqFUgamY9IlriDQkvmhLgs/+APWLQZ26DgF8ww5iLxK5OkUpbYy3
         HBY25YJUg8bQglW+8pK0XdmoWu5kp0V1X30MP4hvDgUq/lXrr/IjN5eYBpw2Cpmbjanr
         TqynEnzd9faNEz99LeseMmE1IXDN+BI4xwg7V9Sy2Mz5r4CleSP/B+U7AVSrFavYJ1Fj
         pLJTmPuFLhW67P7oNt/wLRQeJzFX3YhDs7A5R02nLIxeyDaFpeIL7acpvdeYKRt0I/5K
         OaH2yRJI3oUK/4Z+nQ16STa2tY+sAGIiXMgaJn/xhTNa56oRdIbBfXfqmK+HDZY/Eb8W
         RwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGyIy/c9x7gid81AWLPwZ0ljJlv+xEg20udWYHo0hbA=;
        b=ENvrZyw+mOYBLeNbqoqGEpJfs8lR7WH4MiN4nBuR6FImDuXH6CN5ypMPknWE3lleCC
         YqzwWli21XAJzdiRpvp8TKn5HTNo0UVcZIufAWgf/ud0rfro5Ssek/bJ2470V3smz1ZG
         CoDOQajvk7kiGkQWEv/CTQCez40SgzX+qAPU0GXrzunqW/Wk2n11vXvD5pr3NV3Bu1Pu
         YKHmiOh87j7A0W16uy8diDsVZH8zUdh1HQNnsXwr82AvwbhjZ8YYLt5k6yKcDeTmm6ul
         6Qm+32pYURsybwpgeIl+S62y3hW3hhdFG88wjCs43GIDArD30uP8cde2i9RqjuyGxgYy
         9DnA==
X-Gm-Message-State: ACrzQf19UpY9fK416G0DQYzqQbr3nfTDotMCEfsGaxGVsPDnttB614pS
	WelHXTinNrDi1XzqJuswsUN+wtKpSuk=
X-Google-Smtp-Source: AMsMyM4ko2OsoLvqzFyYKz9/I+3Jr5HBRqjQ9HRHF35ITIEOD8mTj17ITtdRiAaAjWe/b+jAZlUVnVQHbNk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:9308:b0:182:b2ba:755 with SMTP id
 bc8-20020a170902930800b00182b2ba0755mr27515720plb.107.1667431219005; Wed, 02
 Nov 2022 16:20:19 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:19:05 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-39-seanjc@google.com>
Subject: [PATCH 38/44] KVM: Disable CPU hotplug during hardware enabling
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Fabiano Rosas <farosas@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_232026_874307_67B562ED 
X-CRM114-Status: GOOD (  10.53  )
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

From: Chao Gao <chao.gao@intel.com>

Disable CPU hotplug during hardware_enable_all() to prevent the corner
case where if the following sequence occurs:

  1. A hotplugged CPU marks itself online in cpu_online_mask
  2. The hotplugged CPU enables interrupt before invoking KVM's ONLINE
     callback
  3  hardware_enable_all() is invoked on another CPU right

the hotplugged CPU will be included in on_each_cpu() and thus get sent
through hardware_enable_nolock() before kvm_online_cpu() is called.

        start_secondary { ...
                set_cpu_online(smp_processor_id(), true); <- 1
                ...
                local_irq_enable();  <- 2
                ...
                cpu_startup_entry(CPUHP_AP_ONLINE_IDLE); <- 3
        }

KVM currently fudges around this race by keeping track of which CPUs have
done hardware enabling (see commit 1b6c016818a5 "KVM: Keep track of which
cpus have virtualization enabled"), but that's an inefficient, convoluted,
and hacky solution.

Signed-off-by: Chao Gao <chao.gao@intel.com>
[sean: split to separate patch, write changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c  |  8 +++++++-
 virt/kvm/kvm_main.c | 10 ++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a7b1d916ecb2..a15e54ba0471 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9283,7 +9283,13 @@ static int kvm_x86_check_processor_compatibility(struct kvm_x86_init_ops *ops)
 	int cpu = smp_processor_id();
 	struct cpuinfo_x86 *c = &cpu_data(cpu);
 
-	WARN_ON(!irqs_disabled());
+	/*
+	 * Compatibility checks are done when loading KVM and when enabling
+	 * hardware, e.g. during CPU hotplug, to ensure all online CPUs are
+	 * compatible, i.e. KVM should never perform a compatibility check on
+	 * an offline CPU.
+	 */
+	WARN_ON(!irqs_disabled() && cpu_active(cpu));
 
 	if (__cr4_reserved_bits(cpu_has, c) !=
 	    __cr4_reserved_bits(cpu_has, &boot_cpu_data))
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index fd9e39c85549..4e765ef9f4bd 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5088,6 +5088,15 @@ static int hardware_enable_all(void)
 {
 	int r = 0;
 
+	/*
+	 * When onlining a CPU, cpu_online_mask is set before kvm_online_cpu()
+	 * is called, and so on_each_cpu() between them includes the CPU that
+	 * is being onlined.  As a result, hardware_enable_nolock() may get
+	 * invoked before kvm_online_cpu().
+	 *
+	 * Disable CPU hotplug to prevent scenarios where KVM sees
+	 */
+	cpus_read_lock();
 	raw_spin_lock(&kvm_count_lock);
 
 	kvm_usage_count++;
@@ -5102,6 +5111,7 @@ static int hardware_enable_all(void)
 	}
 
 	raw_spin_unlock(&kvm_count_lock);
+	cpus_read_unlock();
 
 	return r;
 }
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
