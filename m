Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CC2CA0EFF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 02:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhTF39Vdf4jHbRxxz/qFLV7tUh1i01lgRNVoh1oiBWk=; b=UVz82TUo2KJsqb
	wUg1sdMNhCBEZ7Jb/Z72nL9F46DwfpH5/bmIWsxCcW+O210es1w3WOwahtP++ZAhIPEN/1JtFB5vB
	6IBr/q3WCVpqVXt/ui1WbzIOo81Sp6Pduw8WAfmIMFpYa7Q/07wOYk+zvYSoPECOUqZje2sh58WJm
	ccFTgDJtACPQgPvYlbhAm5IdQ7OFTf/ZFNa3bMjFAfmciJwFbIcIOcCRjgHr6n3f5gYi6jkUhhNAq
	Il7nVHX7P9LgZYmpsThx2g+Y1vXLMvp9rtTQMSTXwobubENVUOCHbsP8D/H+9eJTWZtluhIAeLGm9
	QV3SssKQJRWDV5fAgInw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSX8-000000002DF-0mSY;
	Thu, 28 Aug 2025 02:38:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQ5l-0000000HIA6-3qoL
	for linux-riscv@bombadil.infradead.org;
	Thu, 28 Aug 2025 00:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vhbQgqknyAyVeKaXs8kP6grJ1hrwQUkSmJiE25IRpuQ=; b=YAYeHJjpTpJx4o2oNVJUFimcMT
	XImbhVc0OPITvksqrBi7x8LRzPIc62xOq4YMnT+ZEwIK9OCa1tF1T3+0GhKK5Kuvp6utFJDUahgiF
	Ixx6cvhP3Us4EOm8VQEY/q7fRbJEvwW5pwA+EwnRIkp2gziP8MCsW7V5yoFLhlOja9Z/aedcS+1Z7
	WEuRhdFs8wRv1JpV1XaRqE/B1KbExqF72GiOIG/uDNmkSe93iOgs9sIjSl0WCinroShmbnG7aVERg
	uvV+UHlGDX0DAsswxV6tHswNXiHhTZ1uDROyxHUWWz+S/2v5RyDy3t+A3yX0/WeeKIyCw/nTfqQVc
	wVdi38PA==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQ5h-00000002YE2-1cKk
	for linux-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 00:02:11 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-771e1451631so757003b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Aug 2025 17:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756339327; x=1756944127; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=vhbQgqknyAyVeKaXs8kP6grJ1hrwQUkSmJiE25IRpuQ=;
        b=aLQsNc5VcQyFphTAsJy6ijoKrLolbsComEwb/wy+j+TUUH2UCLbtxQvVHijA+X9Xp+
         PVVKwxorK4sjsqC5dwPx9EH/L6b686s67yzk9H/CRmjJ4sqDWIIEGquWxO+16UKD4EEo
         TKU9sD54SAAn6Zw+dggPgGD5l/zEzZmljzpkTytFYsitAG4NzKtJgzv5zsmV8rlew97t
         eSvqhJsxhBQAOQqWrivKQryeIIiyyZl1Neo8eRPSuG2M5XFvmoBMc/2wku287FbHfx6V
         IMpASm5fUWgpDUDRtngZkcKQErVDjKov2LbHrMBXV7lbjUT0h5H4tgNGusTW9M4XSbYm
         pFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756339327; x=1756944127;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhbQgqknyAyVeKaXs8kP6grJ1hrwQUkSmJiE25IRpuQ=;
        b=gqeFQ9hAc6E82gUIlsnzyP5CSQps7qKYZEJVUp0kE1OebEyxsdrHvRXicoiQMQASJa
         j6cV9YBtftJ0Q8vPxhx5Gq0GtVuc03d8XZ/pNzTNGV8TlpqvemnPrjqV2D4FHtHcDAh6
         I3dR48lPGkp3Nhl4ZRgHIFAmKNcYIMsNeV+V4pyqMpZGa6dzQo4ZP23/4PC8oayM0ZCP
         fuDhv59WwXewzTxdxH4ZchF+QH3FqqsxYpSxgxebfPGEpKknarVooz0IF9AJ/meuB+cH
         B6oXQFWjVdq2TRki1AhCJotpF23ZTC2nnjs8doZxjAoaGUyJVilB+PwGstyuV8bCL0sr
         q+5g==
X-Forwarded-Encrypted: i=1; AJvYcCXTjmAH3oTzyQj1T2oWwRuI15A2viqlJwAxZGzjZtGwGIg//wwbEeOxnyfR0xteoeE1Dz0J24V0kM/PUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAZMuyhw3GIx8Vxg0CU+aQIrGIpMWfwwyamTadgApk4lBz4OrU
	6W+t5JVZYYbDSI2Hyzqzt0mHhnlQ7bgeFYnHdXCtVJbb9Vg0vF38M7tzzbOqX5P1gXFz1SWvV1a
	Lzl0R1Q==
X-Google-Smtp-Source: AGHT+IFSTSPK462uYm9CJ0EAHOKjQ8TiWstiYBGpgePwdPA6VvAffLDDZpu/ZHt6d1MsFofssMNf6pVc4TI=
X-Received: from pfbdr10.prod.google.com ([2002:a05:6a00:4a8a:b0:772:a5a:298b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4b46:b0:76e:885a:c1c9
 with SMTP id d2e1a72fcca58-7702fc24f39mr26347774b3a.27.1756339327187; Wed, 27
 Aug 2025 17:02:07 -0700 (PDT)
Date: Wed, 27 Aug 2025 17:01:52 -0700
In-Reply-To: <20250828000156.23389-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250828000156.23389-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.268.g9569e192d0-goog
Message-ID: <20250828000156.23389-4-seanjc@google.com>
Subject: [PATCH v2 3/7] Drivers: hv: Disable IRQs only after handling pending
 work before VTL return
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Peter Zijlstra <peterz@infradead.org>, 
	Andy Lutomirski <luto@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, rcu@vger.kernel.org, 
	Nuno Das Neves <nunodasneves@linux.microsoft.com>, Mukesh R <mrathor@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_010209_607788_B941C7AC 
X-CRM114-Status: GOOD (  11.53  )
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

Swap the order of checking for TIF-based work and cancellation, and disable
IRQs only after checking and processing TIF-based work; checking TIF with
IRQs enabled is a-ok, e.g. IRQs and preemption _must_ be enabled before
handling the pending work.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/hv/mshv_vtl_main.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/hv/mshv_vtl_main.c b/drivers/hv/mshv_vtl_main.c
index aa09a76f0eff..4ca13c54c0a0 100644
--- a/drivers/hv/mshv_vtl_main.c
+++ b/drivers/hv/mshv_vtl_main.c
@@ -735,16 +735,8 @@ static int mshv_vtl_ioctl_return_to_lower_vtl(void)
 		struct hv_vp_assist_page *hvp;
 		int ret;
 
-		local_irq_save(irq_flags);
-		if (READ_ONCE(mshv_vtl_this_run()->cancel)) {
-			local_irq_restore(irq_flags);
-			preempt_enable();
-			return -EINTR;
-		}
-
 		ti_work = READ_ONCE(current_thread_info()->flags);
 		if (unlikely(ti_work & VTL0_WORK)) {
-			local_irq_restore(irq_flags);
 			preempt_enable();
 			ret = mshv_do_pre_guest_mode_work(ti_work);
 			if (ret)
@@ -753,6 +745,13 @@ static int mshv_vtl_ioctl_return_to_lower_vtl(void)
 			continue;
 		}
 
+		local_irq_save(irq_flags);
+		if (READ_ONCE(mshv_vtl_this_run()->cancel)) {
+			local_irq_restore(irq_flags);
+			preempt_enable();
+			return -EINTR;
+		}
+
 		mshv_vtl_return(&mshv_vtl_this_run()->cpu_context);
 		local_irq_restore(irq_flags);
 
-- 
2.51.0.268.g9569e192d0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
