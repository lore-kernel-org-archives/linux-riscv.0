Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02239606A31A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 22:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gY44yTo8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=VdjNFaG3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4MosFTJiTA1tOYOvopIB7dsvWy3oSmE/zAaHlvqqw9c=; b=gY44yTo8sVUHH9Sj8KB58MKPOx
	PaeFDTHbWJ5VUl7K585Ael5M0yz4TSms/fw0ebr3KchjOSfHHa+ooEb0MrZVbMcQvRHCBKBFrBXnk
	mJ7BbvMrrTsFyM5YxgLtZDajZCTIHBEvi7LW5VjVTtK+7satei5ZNVL2160VyIaXre3j1U2NpyLI0
	T1xQDuBF6lTv510EAeKTaWbiqAGPwaGpxQEwSnkH73D+gDjCHmWPWlumkYf1t+qf2NxySA+16qEQ0
	WkdJ1d0NJUivT54c4fUaEqrdsrpi8BvXyA6c+hs/ynKp8/he9O/tSjc8KjyVUpH6vB/C3dP6yQMp+
	boQ99eFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMC8Y-000000081Mm-2uLM;
	Wed, 28 Oct 2026 22:28:50 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMC8V-000000081MJ-033u
	for linux-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 22:28:48 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-353804b591eso2396795eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 15:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1793226526; x=1793831326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YEhgac1kjYxn03aKruXlSpkZnrbKOWoEKZtLlFnXf7Q=;
        b=VdjNFaG3RdX4bAbU1+ydaSAqysoEyEYgu8N5pblI9dmMI0Ce8LKuC8ZhK2ZfD/ItOd
         hqlMfzZPoDDPJ7cFx3fhHUn+ACPJnFrUos1DjbGSMxg5bd0z1j0sKalMBxNXxQTeQf3u
         XQJVQaSrDY2ky265Lc+djw0DANUTaD0iEumBOXLBDZMtl33VEntGZYFTZ+0wMK9NrmCU
         TYJnGWUfCyH+KI0Yq1UuGQ7v/R4cA7eKMIouEmZtC/dKSjMCu+fO2j/o1xKe7sP6VWKV
         tuCAdqKlb99Ov6jV6CMBIviYIvffc8ZNY3Fzoz+VTmn6XMlj2E1WZJwwUhIyVo7cycIX
         1zRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793226526; x=1793831326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YEhgac1kjYxn03aKruXlSpkZnrbKOWoEKZtLlFnXf7Q=;
        b=Zz0+B+Gh3COXWZUUyNspCj71M8Wl+QxW6hsghiI0s3acteoLzP9Z8eiwwwQBAuIWUd
         T90XOOqHuWPJPkDEQvrAfeQQQgLMO2QxRsE6ECP78rswhu6GUisPtcMRFseI0v3OL22+
         62aCbkZ8WiqkUhcS0EnBvygxGpGdtdmAWSfsIkf3AhzP2UWZqLqsIo73yrAdHC1jaGz9
         mgLCISTDU5NSuWv9J5I1+d46IGKiVzNNPNH9k0vVQxFRAuRh1dgdko1JFp7Pkm6baHxD
         BXVCYyKbKBA8hwm+oHx2JYoxJdYOXklUpRQ7FeGrCqJ2+FFKWkXLG5bAGPRoDUILzEYc
         FAAg==
X-Forwarded-Encrypted: i=1; AKwUvBxHF3JNazHx5sEYkJdfxTmsDmqF2uUJ1wlK0qoATl4z0YitzHY2m4/KTH24XzKZ5TGXRgaIiuuhtIP12g==@lists.infradead.org
X-Gm-Message-State: AFq9FYL6JfaI1f0040ohXOz2Te7tbQazLvQeAHv98tCypNpueNHfuEIO
	5bOkVQ8fZotuREfMjErU+hBtwdce/FYMNhYYRK4Yfu/KajE8lKc4r4iBqA+hyqR/n6Q=
X-Gm-Gg: AYBFou04WfEAOpbfcnjJN5/sdqOA9HLIfAT6O8jM3fMRPzL5dPhDwByaeR94qmMRa4f
	thjL/1YXdz9yU1vMW9BlqiJFrE4KA+C1ZF+smYfMv9DsN6PvHCPFeRR7+QjL5BdhR39FjSb9+7f
	tSdSdN8PG++PnfMTWYQS+jhjFe15w+/LnOPOk7vnZ+qVMBx5Uy8n+wjoOd4n5cGIUbQbKJPomTN
	PTTxTLE8TGyCyrT1VJu+YC4aGTuloDK/v6Y5cFLQseHbWxa6qqrGl4TK9yTe+tQsCOhlbxhgXzR
	HurR4uVpyqicUhR1o01yeihC/mcexyatnFUOnSrI4QklcMdh4aPTTsaqXyrGr4M7Z4xnqhz+3Xy
	GDpBVSJcnvT3cxkz89rbVkARu0GnMp92OBRpVaM6bOVLl+GABjQtB2mE1CN67LyLYOD254qc1DX
	7/wqHqa4JDa6+2f+A97SuQPehul+TEEwggMsPBTMOGxtMLgT1yPF1QlzKrIVm7WI2rkqg0NSzPV
	O/e/3bpBqXlckr8HZ6+NovEdyjYzP5hlmmw6CinX1BAdsLVp6e0dM8A4fgBTnP8Pe6ETqrv+zO5
	mEreN63hDYYwpDTnb5USebdd0bH8qy+K20zNY5hMgkxfV8ILorayVOODnFSVWt8dGw==
X-Received: by 2002:a05:693c:83da:10b0:36a:1f:9b74 with SMTP id 5a478bee46e88-36a203bce76mr5398946eec.27.1793226525305;
        Wed, 28 Oct 2026 15:28:45 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-36a2390929asm12301773eec.12.2026.10.28.15.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:28:44 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: m.wilczynski@samsung.com,
	fustini@kernel.org,
	guoren@kernel.org,
	wefu@redhat.com,
	ukleinek@kernel.org
Cc: ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	elle@weathered-steel.dev,
	linux-riscv@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 1/1] rust: pwm: track the owner module when registering `Chip`
Date: Wed, 28 Oct 2026 22:28:40 +0000
Message-Id: <f9cf8f0d897f22888134b2b17f1b0f86bcda311a.1793150685.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793150685.git.pgovind2@uci.edu>
References: <cover.1793150685.git.pgovind2@uci.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_152847_051279_6C59B5DA 
X-CRM114-Status: GOOD (  13.93  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

`UnregisteredChip::register` calls the C function `__pwmchip_add`
to register a PWM chip with the PWM core.
`__pwmchip_add` documents that its `owner` argument is supposed to
be `THIS_MODULE`, but `UnregisteredChip::register` passes
`core::ptr::null_mut()`. This is acceptable for built-in drivers.

However, for loadable drivers, registering the chip with a null owner
prevents the PWM core from taking a reference to the owner module when
a PWM is requested or its character device is opened.
This means that the owner module can be unloaded while references to the
chip remain. This can lead to use-after-free and
kernel panic.

Fix this by marking PwmOps as a `#[vtable]` trait so each implementation
exposes its actual OwnerModule, then pass that to `__pwmchip_add()`.

Fixes: d8046cd50879 ("rust: pwm: Add complete abstraction layer")
Reported-by: Dylan Zueck <dzueck@uci.edu>
Assisted-by: LLM
Signed-off-by: Priya Bala Govindasamy <pgovind2@uci.edu>
---
 drivers/pwm/pwm_th1520.rs |  1 +
 rust/kernel/pwm.rs        | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index 728993998446..6a1f4219d6fa 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -94,6 +94,7 @@ struct Th1520PwmDriverData {
     clk: Clk,
 }
 
+#[vtable]
 impl pwm::PwmOps for Th1520PwmDriverData {
     type WfHw = Th1520WfHw;
 
diff --git a/rust/kernel/pwm.rs b/rust/kernel/pwm.rs
index 8aa47304bec3..ae7b449d67e4 100644
--- a/rust/kernel/pwm.rs
+++ b/rust/kernel/pwm.rs
@@ -12,6 +12,7 @@
     device::{self, Bound},
     devres,
     error::{self, to_result},
+    module::this_module,
     prelude::*,
     sync::aref::{ARef, AlwaysRefCounted},
     types::Opaque, //
@@ -175,6 +176,7 @@ pub struct RoundedWaveform<WfHw> {
 }
 
 /// Trait defining the operations for a PWM driver.
+#[vtable]
 pub trait PwmOps: 'static + Send + Sync + Sized {
     /// The driver-specific hardware representation of a waveform.
     ///
@@ -673,9 +675,14 @@ impl<T: PwmOps> UnregisteredChip<'_, T> {
     pub fn register(self) -> Result<ARef<Chip<T>>> {
         let c_chip_ptr = self.chip.as_raw();
 
-        // SAFETY: `c_chip_ptr` points to a valid chip with its ops initialized.
+        let owner = this_module::<T::OwnerModule>().as_ptr();
+
+        // SAFETY:
+        // - `c_chip_ptr` points to a valid chip with its ops initialized.
+        // - `owner` is the module implementing `PwmOps`. It is null for a built-in
+        //   implementation or a valid module pointer for a loadable implementation.
         // `__pwmchip_add` is the C function to register the chip with the PWM core.
-        to_result(unsafe { bindings::__pwmchip_add(c_chip_ptr, core::ptr::null_mut()) })?;
+        to_result(unsafe { bindings::__pwmchip_add(c_chip_ptr, owner) })?;
 
         let registration = Registration {
             chip: ARef::clone(&self.chip),
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
