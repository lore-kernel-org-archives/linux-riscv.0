Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33673D6ACFB
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 13:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=z2qTSY8XunJGMWWnS+HJq0B7Xfaonvc4zfdnaq1EPXw=; b=HUWt671snxIxexg+yJh2OjtpD/
	jYFDHXo0LxPgqm9Q2CIFh77dZzZEWzo+a6XN0Kokfh359bZFdPr9yyWkcucZahWwsrwUI2jNiNbUJ
	E66OpMVN5FBcnkrN2AnFvRUOGkYJWHAMDD0Kvv1j+Y87CB69lR8SmCvvQLEz4e7UBJi1nPw8KWtQp
	V57HwIxIGVqbmSWHE8p1tv+1+KwL62MPvsnY761U0MDHX8EAV+oQvN+S4DqxcQ1I+2jxTFPvDZHuF
	0RXM6L45mB6VwBgVH99FRYEAU0EjHajD9zf5srISprRE44X/68XhVrtDK3Ntii73atDYAWSg6LfC7
	wMZ483/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE30-00000008X8k-0uhs;
	Thu, 18 Dec 2025 13:28:02 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE2r-00000008X29-090t
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 13:28:00 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-477b8a667bcso8434225e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 05:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766064470; x=1766669270; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jK28JFeXstDuyy0FEYnFWM4ECthU7/SRvZ+Uc2K8TMM=;
        b=vILVNNw7ygo4TkM5dXaGgNzbR4vhhsm4d8prvB8VeZRIvcnEdMuAbWfPhu8gZj+Ykl
         JXqnJef8hIH9W4YSAs9fqg20tCHsKxnFYrOqsCmcQnZ/kxTyr9JlI7ClI+OpVyrDlEbY
         NWG9DhLLYx/Wyy1UQnSLZA/CECFzYE7Ej7c/A1M8/gAf3EqbkxT43Puz8tGS5eWH0ISp
         HGjD+gqEb+plx7N+IV7+l4ZtKb5J29QyHQP/qtRl7ly86dj7Sjb8fJ10QqnoTghwWeci
         sD1hU2j4LkM0fl4BNrOHTi1YCP8vRn1tlWODwJh+JAPiAH1J2fwrvlxrPpYk3Oszymz4
         7HCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766064470; x=1766669270;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jK28JFeXstDuyy0FEYnFWM4ECthU7/SRvZ+Uc2K8TMM=;
        b=qFyoQMzYZIZEx+eHY0NeMdD+PTmtUFdrzD1Fk++01LsU66mB5IgfxX6+GcVIJTvi8X
         868DksSR0imDHprk6Nkvl1HURaxgjaRryEkqbDSrsF9NjEw/bqoZ2HLas67upAlCYdPy
         0dT4LLGFw9Pz8UN40PzETJz1QV2wyKXzsYx/lX9kkqEUXPMlOIPXRGso24875UDRO/Wd
         u0wvDEAqMAP5q+XSMOcvXQ4qP70E1KezFkStxUZfSjIX2zVJ8e6BzTOh9A7jATw3nTBf
         9GoQCnZGEvUnDiYWeDA615PSmxJptKONFsTZN6OUFbYzGLYzk5GpO1GQWGLWZVZ7esQH
         eSdA==
X-Forwarded-Encrypted: i=1; AJvYcCWV+ldsi7Ys3N3d4IGQ6yAbuksfshmOjTeduT5rIGDDtqCy5aur/GbiH47CQgdtLFoQ15urf0gPyk9jeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGtysbKPdXxY9xQpA7ZAzVdIboZt5PpImetDkBiTDrIbAv48Q5
	f/yia3XhFF6rXGX9hDsYkQ9iD1VuLZ8VlVwL3rl1Qr13NuRbTtqFhsNZ4mGX9czOAzcIyfAhEev
	vOegYNONKhwaGJugcEQ==
X-Google-Smtp-Source: AGHT+IE3mV0hHlOMpYVWIjAwdmvo5jE0L9sBOpWL6XsbMzQezjxagjqpMFllYAiylsVjD8lLgu0n6vRFRAWYICM=
X-Received: from wmgp21.prod.google.com ([2002:a05:600c:2055:b0:477:afa:d217])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3104:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-47a8f906dd3mr228600355e9.17.1766064470141;
 Thu, 18 Dec 2025 05:27:50 -0800 (PST)
Date: Thu, 18 Dec 2025 13:27:40 +0000
In-Reply-To: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
Mime-Version: 1.0
References: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1327; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=GfyAuLsrs0QXvlLECZS+Ag8ZW62Fz2Y2rspmoop5J3s=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpRAFSGE9hInQJ93qtSDZ6USDztanUVRXYt7zuZ
 u/M3OKN66SJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaUQBUgAKCRAEWL7uWMY5
 RpjnEACSGceY2rPEdAJ9IM0nAQ/WAryJFpSfxt+WLrj3iN4p5BmgrDdLtUBRaFYTYqcli8hAS05
 YJwMVlfRAd6iFo4DaO3eqnrvZQRPSaBmxegr8FhHpfv8XSaez94scQlMk6FrcSlvrA6Ee4Gtlwp
 l+ilXpbYOyAubw6GpjlWswSHxKOg0QwnWCzW2KwjpbXJnfLQ5fH4lcncuzMfaAkPvCFV4t1y2KV
 kaWXQIWrkEvVGzZJssbmxCb1PvSE6oyjcy3TzBBSM/E1t9jJSdXBS+NfHM5gMDUErPaSO224COW
 ei9hJ+Rb2IfKuZtQ9gud09brWgGvjaOVaiC9LM5c3bNNygut/rL2sqBDf0eUnTjZZ4hl4T7zj9w
 q/VO+QeTNdEDV8AfXeYCZs11q9X+mpJK3MYCF7ZLQsBZFOiaSgTwrF5Q7PSXXxL860gZaGED9so
 hqtSPCzOrli9/mHqIoHfLoSPuUaf2bxTBaNboLD+d8kdD2+h9FLLvMhgGVhXYhEUmOsBKZC9MlN
 DwpN5R2dUuDE7iXXAi9r6a3YRd7J5IHGfhXALODtLYLu7bdkcna8Ggb35wgjrid9IfeQf9eEdVQ
 9zkYMJevx5Tf5DKTw7VxZGkTJHxKfsL+G8+CcVjptxDvHWl4UkCa+/HLohudluaxij+Yf/xnesA vfDaSFT0gn04/pQ==
X-Mailer: b4 0.14.2
Message-ID: <20251218-clk-send-sync-v3-1-e48b2e2f1eac@google.com>
Subject: [PATCH v3 1/3] rust: clk: implement Send and Sync
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
X-CRM114-CacheID: sfid-20251218_052754_500440_E6CC20B1 
X-CRM114-Status: UNSURE (   8.53  )
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

These traits are required for drivers to embed the Clk type in their own
data structures because driver data structures are usually required to
be Send. Since the Clk type is thread-safe, implement the relevant
traits.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/clk.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index c1cfaeaa36a22be2e3180b1e9142bb608ab276ea..d192fbd97861212d738d24510eebcd99c9177f2c 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -129,6 +129,13 @@ mod common_clk {
     #[repr(transparent)]
     pub struct Clk(*mut bindings::clk);
 
+    // SAFETY: It is safe to call `clk_put` on another thread than where `clk_get` was called.
+    unsafe impl Send for Clk {}
+
+    // SAFETY: It is safe to call any combination of the `&self` methods in parallel, as the
+    // methods are synchronized internally.
+    unsafe impl Sync for Clk {}
+
     impl Clk {
         /// Gets [`Clk`] corresponding to a [`Device`] and a connection id.
         ///

-- 
2.52.0.351.gbe84eed79e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
