Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED165D2F325
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 15:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HAbpEUFh2CS64+/47ZqFGFLTLABuycqSiHHHBmWgR4c=; b=HmGXvHiGATWalVLRAGDnIEsG73
	0hCOw9SDvNMnHPf21GSrLlPgrMfsFBLlLJpZt5lLG9FJ9tbGw/dFQPYeLWvxQtSwgQFW5PXsUegoa
	D7eDpYHk17HjmnkQJSGOivT0xnSyI/rpVpAlkLBQsEXU+jXJhPAB5i8iPcdoTzF2K2IOFk6RGqjwY
	JyNDUxyZv/EVEcJi/LWF+MCjgqWO7OC+AiFgp0ITkIHC4NJjWQ7NH58YQwuvhLFvBqwg+O6Tl/Bvs
	sjoaQzyFTPXm7KjQ4NoEZZfTWZpptBnhvmilijfOBVRfmzJO/M7zi3hG9/hnhEtIrStd2fV4PnxPs
	MhlW6QRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfg5P-00000007LFo-2lJK;
	Tue, 13 Jan 2026 15:13:35 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfg5M-00000007LEn-385n
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 15:13:34 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47edc79ff28so4787535e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jan 2026 07:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768317210; x=1768922010; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+gU9SYYpNNrQwCuq4FN+wHCGTlifJ/wCG0O0IkTkZkI=;
        b=U33EFfH7y0fBTJElAo5DcPvujprKL2CJQTmyhQOCoOoarimVxnURPiR7orAyUTWC9D
         BY/ZT/x0U1KNfRGzdpOrt54ESo/F4cm3xHUXr3gvF6TKKeE9dpsrZcFmt1g+dgYGlSRI
         +s9zYOXz4p6v30Xg0gfBHMEiGVRjlFGgYgd8N8uSfYChglIqT4hxSYT9Ori6ulFbdxsx
         5Ddpn5CPXw4PcPRYIQlaTXzPrgVuRbAM02TiLxiIpLKYYyMnNvxa79KuHGzxguSc++3c
         8GX97fM3zUfIZjKhzke/1xGtmngBJM/YbmUF6tasPpZvXgm3rwbC5vi0XLaJbhf+IiY4
         apvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768317210; x=1768922010;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+gU9SYYpNNrQwCuq4FN+wHCGTlifJ/wCG0O0IkTkZkI=;
        b=u9QLOvvU/ZeijhVTeBKnSP/3ukzcVqj3TGbAx6vD0Id/kPaMVwej6BNbkn9Vj4wM27
         aGIFM1p2zFLqbz35EJWBZMPn+WlG4nnJgbsGmZ+N9zlKNlcEefNPCgkgWokN473F72rs
         tSyG+i/0cDwI6gQ37SI8usGHMXeZBmhbkJhJZEfkYethAxtJeomCVyOakg7G9YM//Xyd
         jfh5zwTHiAvRaXTxfdzTcWvMWvxbaS93FU4dFFbUQimn8dgI9phmc5FrHzIFRaRbyy91
         yWHIisQzlQJ7oC0qNLgZHOKgeGZ80Gh+MtrM9VTw8k+K63q7DUAsHgNaHBBfMeTeXPls
         IQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCX61qfO5YYMmpR9S30ml5ePMZ3hfQ3KwSqhgpaEP8MyndfkcqK/EkVkwWC6qYzhTdn4VmwR6982BtUuGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YycVqCY2MB7sUTjr6cAMMp262TiPGff2guF0UnrewRZmuAswKH8
	4YZSktArUvmmFCF9tcBCU5vca23cCkx/uSsUFfhaA9YrNOm6hhuISyy07z7UNn2XVsQ0FxTiF2S
	oMxRmDLXlduTYpt208Q==
X-Google-Smtp-Source: AGHT+IHnuUTaCAWBbZD9W2h/OSSmDtQjxvZdpq6nNLyiRYLG1dj5BdsEl+mKz8Ozip0V1tf1O9hZfCnqvscWuD4=
X-Received: from wma11.prod.google.com ([2002:a05:600c:890b:b0:477:a4d4:607a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46cb:b0:47a:810f:1d06 with SMTP id 5b1f17b1804b1-47d84b26da4mr243374615e9.4.1768317210336;
 Tue, 13 Jan 2026 07:13:30 -0800 (PST)
Date: Tue, 13 Jan 2026 15:12:38 +0000
In-Reply-To: <20260113-clk-send-sync-v4-0-712bc7d94a79@google.com>
Mime-Version: 1.0
References: <20260113-clk-send-sync-v4-0-712bc7d94a79@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=vFWramkwrqwtJwgC1sH4LSgngbV/etS8iNI590sqCqw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpZmEQEuN4uaDvBaM5TmqN9WnhJMSuME0tcTbvE
 YTkLG+hAaWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaWZhEAAKCRAEWL7uWMY5
 Rl6hD/0auoTL/sGpImpn7/kPf/KAL2X3YoNiKIZzHThKN8uT1uxeAYone+3mo8qyaTcM9DDITr6
 5cq6SQN1VE2Upbba2oSwzLdXTkToZdNh+mu4Eq7ky7DhHdURd5KFsAFZz5bKVWAmFMxPGbXUWic
 zpbpxMTJ6QUnuHOIvfuu39nblQdZZj/6inRVCAcTQSmG5vF+0/DftaL6fp7SaUGj5FCNfgFRCmL
 YfTJ/wKsnbTffuMy8sp7BuWtqb4OBFXJPp5j+I8cTSmiyuKCVi2p3nkwxAr08fVpyFR5Jd0y50w
 otlpyfnNzzPJXkKkBzupe6ry4LS/qg/2JcnC5qdPiY6x05rKLHCxRz3ClDVzNNLp4vntSxuZQ7w
 9aVP+poXva8l8+v6nfWgIO8ciKcZUO1IAaVilhy0TPvkVEvV0b33l0ek0qo35T+BaWJ++Y+42sY
 fBHOMq5NlR5BNtcXrC6GJUruPQL6goEC6xqO8yv++luTB8ag+k81xfDQtXot3b+YVi7M5xPzdwd
 JuhPfPLk0Cs4EE/1l2ROvSfM+IWqM1pzSJLQxHJTr18UvcST4VAvFFyF8C7FGjeAdCeRgpm4/T6
 FzJIbAfWa+VuJMMWr7B1nkYoHdHqGCIR4tLS5Meh4HkFP2AGWG+8teZRq3kTzVMedKRt86fLJ5+ 5OXudD+J6HDSHOw==
X-Mailer: b4 0.14.2
Message-ID: <20260113-clk-send-sync-v4-3-712bc7d94a79@google.com>
Subject: [PATCH v4 3/3] pwm: th1520: remove impl Send/Sync for Th1520PwmDriverData
From: Alice Ryhl <aliceryhl@google.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	"=?utf-8?q?Uwe_Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_071332_808666_8A887376 
X-CRM114-Status: GOOD (  10.33  )
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

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: linux-riscv@lists.infradead.org
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
2.52.0.457.g6b5491de43-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
