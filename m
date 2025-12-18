Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CB2D6ACFE
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 13:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dwth9kK2XusIw2n21s/iu6HRzCbUUbDXg/Ds0Mx+POM=; b=lvUJ0xCdoUj/oUFhz9VD+wHrMh
	EPsdkYKACo4i8Wk8hbvQVDNHaQPLWTKEtMKtNB1FbJDwUJ5qNbSkjrQiHf5xysm0cHdkyHLLFlHnu
	4MGdD7X2TIAnYSHxN0Ue2sH1+0SN1KovskOtGdvncij4h8p1Gs86sE4uQyVSClGi7ugxTHfyRfNfw
	RW1CNUQpvc/yfBaTTCAAsbcZC/S8Vmu4yz2dgF1hPVsfVxu95Q8wQBfJXr3+br8bHhaFBiFiudvS+
	YEhneqBe7JRap872reEl3q7mrtGB6TRZRNoaIAtr3wZjL/sR4rltLTx7O9RJd+KCQ1/ArUO84Prrs
	eQkbmqQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE34-00000008XB3-06LO;
	Thu, 18 Dec 2025 13:28:06 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE2t-00000008X3E-3h7m
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 13:28:05 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47904cdb9bbso14593575e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 05:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766064474; x=1766669274; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qz+Ave0Rr+pYsqesYd5D1VozD7cgPG0dKKZRCf4yYNk=;
        b=heEsx0vMbaQ+2eB/FMIFq9yG80Y161Xp8btROiz8TsVM1X6BwPy0QDJmuMWobw5Gbg
         wU7IOemfeDB4hssqQcQoaFBTriJYpOV6nwy1rodZ+7k/aGqeFuy59g9n9CmeE+Z4K6td
         FzeX4NtBhdbdVKO3EiXXsHfdGhyeS5Ckx7U9W605+e9ECwbptpZi54PHnEQj7MR0R2AT
         fE/UWjvY0W8sY89J1ggK55HDGK123l6RswfdD2Z9xjzDxQwWcFtAdS9KaI479k5Hupr0
         SoAfo4tg5XUDtTuw9cGxVA6i7Zj8R/NepECIs/7PKB3ZsQCDsITSy8dYe6IVHyzJdCjA
         LE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766064474; x=1766669274;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qz+Ave0Rr+pYsqesYd5D1VozD7cgPG0dKKZRCf4yYNk=;
        b=CCrKDNq5OsLFqyPCk/CyWtj+W6wPHcmK6+0mY5B4g+pAK6WDjIOBUIJHXIQH1vSrxT
         jBH9JiQdhBYfMcPDde9OJiqWmxihEvZeyyabxoMkWmCsWxUm5dIgBHskj8Se5mHsM+fS
         ai0ePLn5ud5k4hHsoXFnn6FomPaNyhCX3j6Ex5P79NZ1/sFFuAlOuP0I4WPI0DytrNhd
         KzDgCobUHF2qCuHTvH0cZ8Tq/HNNa8SBBHUX17vzBQ7NLCn9jciEArcgdLz5cMwP0c9W
         YWIIg6igls6CxxNkwp8YE4YXlTiuxtdY5n4UovR3SK9h2zH3zbU7PMzXYhP0u29OceRD
         O8Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWEmVNdOmpY3Is2ioLJwxCqFHt1gq0SwC/jrqJueYf9sNpfIltwBMWLgxb0WBd0StNYqsmrAicFbhhbsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMNYpNyZ64nCFzYPkMITWbN2LBUkXmghjiYrzdPMKMAWvqM4ai
	zhiqgwZguFpexxb1qFy4XtmZwdd6AsJhSCeiil5lDSZ2BkJK1fnl2xxRb01UJdhM9aE5jECty57
	9rneteTkR6xsaiociIA==
X-Google-Smtp-Source: AGHT+IGlOhSMahMSUEguAwn167F6Fbjkcu8ZrI+51vEqMqCJE+3S5hQDbdF4w5Iw7QzwlTk2wDuRew3DnOxTRuQ=
X-Received: from wmpc42.prod.google.com ([2002:a05:600c:4a2a:b0:477:40c1:3e61])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:45cd:b0:46e:2815:8568 with SMTP id 5b1f17b1804b1-47be29c60fdmr30005265e9.10.1766064473619;
 Thu, 18 Dec 2025 05:27:53 -0800 (PST)
Date: Thu, 18 Dec 2025 13:27:42 +0000
In-Reply-To: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
Mime-Version: 1.0
References: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1620; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=hJ1r8AWFe6vjamRRbSdgVoDTTorMAE8/5j325qhqRPo=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpRAFSiykIxnKvVV7ampJwe+hiZPH4dlKVVfNC2
 bRMusCRGIiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaUQBUgAKCRAEWL7uWMY5
 Rs5ND/9lBcHvvP1F2jrlMF7zlcbzolVf/Ik/QcXkh9CEtamti0oWtsfXPKvcrmdowiTh3qqTeOG
 d1pcYkv8At0D62DBbQJID40ZEj2jC53yyQTl+JbIxQgkPKYKW/7tiZ/YZ5l4Be6z2ypAJGa6jlu
 7P+IO8CGeyODkeDgL0U2tMGXuoKl6vJ9s93DzDVlYt3L2Dx6cpR55jWVWkBfziIoGS9Eei+zk7Z
 4ylYtbeoBKVsKs4Ix3y89qYWygDe/wXz0aRIGoDHBiJpBl2ppjbCEhP0PWGQra7A3KUayfL2KYF
 zmZLGvVKljUBMKcuQTuQUJN31zFt6WU2+ASxRD7tU+8u2vwrGOoiHDCS5fwLhJ12/F3DBE2H4eL
 vVgQ+jd6O8L4xD7oC1Z77SciJgITmTJCFM/W1W4jBGkk9AFU6+XIyzMnWryfADATfwgdGytDQIu
 F8KCpPdYrWW3vo38v9f5rhole5bvAC9Eh3vo2PyGcGLpjIqimDbqTsLCSvJmm/yQa0TbMqIXp5a
 ya9OwwArkL66kUK/YcdhJDrrJZXsHnkTxjYNekN0UfUNnAkWUl7AO9hiAu/V0GLq7YAfVjeSoGl
 4Gq54cB6CKjvPxv7GEqVbzEqyOnzjEJ8wCcU96VlVrvDrX57llCh1ppRHSozowXpxgScpJ/166f Mej0UG+6YnuMTlQ==
X-Mailer: b4 0.14.2
Message-ID: <20251218-clk-send-sync-v3-3-e48b2e2f1eac@google.com>
Subject: [PATCH v3 3/3] pwm: th1520: remove impl Send/Sync for Th1520PwmDriverData
From: Alice Ryhl <aliceryhl@google.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	"=?utf-8?q?Uwe_Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_052755_953281_5FCC9EBB 
X-CRM114-Status: UNSURE (   9.46  )
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

Now that clk implements Send and Sync, we no longer need to manually
implement these traits for Th1520PwmDriverData. Thus remove the
implementations.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/pwm/pwm_th1520.rs | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index e3b7e77356fc2492077c519073e861beb3e44df9..043dc4dbc6232020195c7b73fad302bbb69652df 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -97,21 +97,6 @@ struct Th1520PwmDriverData {
     clk: Clk,
 }
 
-// This `unsafe` implementation is a temporary necessity because the underlying `kernel::clk::Clk`
-// type does not yet expose `Send` and `Sync` implementations. This block should be removed
-// as soon as the clock abstraction provides these guarantees directly.
-// TODO: Remove those unsafe impl's when Clk will support them itself.
-
-// SAFETY: The `devres` framework requires the driver's private data to be `Send` and `Sync`.
-// We can guarantee this because the PWM core synchronizes all callbacks, preventing concurrent
-// access to the contained `iomem` and `clk` resources.
-unsafe impl Send for Th1520PwmDriverData {}
-
-// SAFETY: The same reasoning applies as for `Send`. The PWM core's synchronization
-// guarantees that it is safe for multiple threads to have shared access (`&self`)
-// to the driver data during callbacks.
-unsafe impl Sync for Th1520PwmDriverData {}
-
 impl pwm::PwmOps for Th1520PwmDriverData {
     type WfHw = Th1520WfHw;
 

-- 
2.52.0.351.gbe84eed79e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
