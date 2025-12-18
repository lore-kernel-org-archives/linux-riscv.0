Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DF1D6ACF5
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 13:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=j4Mx/vq6ffo1Rqfhk+lDexKnqnMQdSG+dPh+1z4FGpQ=; b=NvkR3YLKH0J1vIAiGNeUU7l7ms
	Nog3s4MRZO2wM1ftgTWwp0ZCp9efuzT1oMbVE48W8x0+vM7EESsUzuaaiNjX9pbMX/0q/L+hI3/ME
	sOqYLvCqGS3U88aB7mYhXyMcw0uhw46YPOFvGRL3VVS0THvkDm0NB7/fzncfLEAZJn6wcOc1kAuN1
	hIeM04D4gvteBE91HZ/EWeGptAxIeKNMNqmcPCesT79YeWu07nu1useW1fXo+qYZvE2gPB5iISFy4
	i4CHrn81gecsg97wpn3aAElYuH2087g/jGK8yKtF/SCWfr5xVl0JiMwIRQUfR/JVebe9V1pB9Gkze
	AwkP2JBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE31-00000008X9i-2in9;
	Thu, 18 Dec 2025 13:28:03 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE2s-00000008X38-46CZ
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 13:28:01 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-64981ed54feso649599a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 05:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766064472; x=1766669272; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uPptdLMQzSRoeYj6Hrjl7dIAj/bZbKtg9ZgsU3qRcP4=;
        b=ZyfNNxDZFXVtWZjqf4yAXMMFYNber++SENJITCB2icI/7QaHUeHaJqo0T3hpJ/h9lr
         Bs2H5KMdEWzmu4Bl8LcZnMvfsedyghxhc9hfr+W1mGZw7Xlq3NJsXxQqoet8w6Pw9Hdc
         21LEZ+zUp7H53kzfxdpSsFW6ElMXQWKnVXWEdadqQ5JFHjHuuL8S+IxrWUJhpHYoxCAH
         Wk7BB1KfTGNB95btcU5OCEPBGhwba+3Uru95BOGGyDt2SUV6WCrQVu5pcGNsXfe/Tr6e
         WbfLLlHDzZLD1lUr9KqAzYBqBmtTLFznz/dJ0kV5yvtSKMYPcYJlgF1qEBFbbA3a38GS
         2Bpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766064472; x=1766669272;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uPptdLMQzSRoeYj6Hrjl7dIAj/bZbKtg9ZgsU3qRcP4=;
        b=wClm7PI3qKrHss1+UB5ZyhNdCIIptm7xv6drJYsUqf8Kl2exKOZT+4Xoc7cA2YPiB1
         0/jo7sAG0dUanc1h5RIFk3bL6/41fWe4OU8VFCPTdAJAZngV6WbQd42ZJYbN74gSmUTX
         moMEE/VaUTq9H7kPHJ643tgqRWNVH+zJKmFiPoBlSTXf/wuwVY6xbLoclF2ids9a4ihQ
         qvM2razxGt+7jYkz7vH8Xfntb79TtXI5o4MM/L9q7FOJTKz4fruzbMpcOUO0kGF8aVWs
         XRWef9uUMeVYlDpoYvNOBNfp/rkhwo+OtxvGP8VKmhmI17KOb7vduo8HuLSbfpt/XzGE
         wg9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxYsI94LaiN9wZqlUIKOI9L5VFlno3M6CuNasb+vbsH7gJGjDJ4Cd8DNtF9dmYj1rM+ArV/I9sM3XibA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzzCXGslpjMRXYLpAE4gN23si+bbhWTXmWnHCvwzzU+97TnO+s
	G1ZyJhxK20EF+qAPOQIm/4kt2RX8Riczd96sTWkkYrdJ3pJTEi4ZScX5D5n4P+qLmMliHGxUeQo
	FeTSKjlqQSPNt1rQ3Vg==
X-Google-Smtp-Source: AGHT+IEqPOft361pJTlpzbo4r1Az15cTuwMQEfh5KrGil6c5DKT9dTPisXdo2WdHWgmo3QB8gCSt51uaXvkVnKs=
X-Received: from edtb2.prod.google.com ([2002:aa7:c902:0:b0:64b:3f32:3786])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:510c:b0:649:aa2b:d34e with SMTP id 4fb4d7f45d1cf-649aa2bd4d5mr19796028a12.34.1766064472249;
 Thu, 18 Dec 2025 05:27:52 -0800 (PST)
Date: Thu, 18 Dec 2025 13:27:41 +0000
In-Reply-To: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
Mime-Version: 1.0
References: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1600; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=F1lcAFNww32YALWPOxbeZmA3ejiotHsR5mfwB5toNyY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpRAFSWSny77iwIsGzKsSzrxHbWYGRidi4wKUj+
 ky0LI75Ss2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaUQBUgAKCRAEWL7uWMY5
 RvgbD/0e4oYtNdP81rAHg3z94FA3jXour1f/plwNgEk/ZamK57EcpX33mAyVLYHcizYsBAXobj8
 am8MyWvLYn6vpr7tx2LS7NZKRpaDdKtU8hLtv4kiTrUqlXTHc2gdDX+4bUPvbHaucO/SaM0cwhH
 YmdiCosFbFZKnHVwGbfbiOK0e/NfqRfDUckj/cxh4YB5cCtDV8FFyJ3kkDdAxM0dGs4OLipgI4h
 i5CMx4B1rrv2P9G/QlL/fSDjJ43XH4475E9YOsLEvPEhAYlLIYUzo/rE/Kaeu6PICY8hh1yy6Fv
 STETnhmW/mMc1h/YSnBddXnFklCoCMHGWZzwUNVhbINFR9wXTZ9dORQQEC/kQKrz3HB9mCUHavC
 AKTMK8M518WNFW/KmcpCQuCUV/QMzh53S1dqxnOGrFXOkyTT1J8DV7ILO1B1djcUFyYWghNR8Ip
 ghgLFaoKreKay09TC/pz6aQe6oegcfGdVHZeCwrF783LbaefHkCwnQxgq93CoWD4SaDxVdptyiU
 c3VFdxgQUkPGbHHH9zk5ct26cnzGalmVDInhx915An/XkyBHna1HZl1I7dkY5je4cJxn8iXJi9n
 ezwBfnj1zNVzI053FQL7sgbp13dOehoXQV30MffCZQ21N9huXxaq2USl3CSpqC1SP89Y7AVazfB RhbcohkXt0oVDGw==
X-Mailer: b4 0.14.2
Message-ID: <20251218-clk-send-sync-v3-2-e48b2e2f1eac@google.com>
Subject: [PATCH v3 2/3] tyr: remove impl Send/Sync for TyrData
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
X-CRM114-CacheID: sfid-20251218_052755_032006_CF0AF88C 
X-CRM114-Status: UNSURE (   9.43  )
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
implement these traits for TyrData. Thus remove the implementations.

The comment also mentions the regulator. However, the regulator had the
traits added in commit 9a200cbdb543 ("rust: regulator: implement Send
and Sync for Regulator<T>"), which is already in mainline.

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/tyr/driver.rs | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 0389c558c0367522471ea78fcf72a6b58c4a3650..09711fb7fe0b1c83b72bffba06f5a76c53244f4d 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -53,18 +53,6 @@ pub(crate) struct TyrData {
     pub(crate) gpu_info: GpuInfo,
 }
 
-// Both `Clk` and `Regulator` do not implement `Send` or `Sync`, but they
-// should. There are patches on the mailing list to address this, but they have
-// not landed yet.
-//
-// For now, add this workaround so that this patch compiles with the promise
-// that it will be removed in a future patch.
-//
-// SAFETY: This will be removed in a future patch.
-unsafe impl Send for TyrData {}
-// SAFETY: This will be removed in a future patch.
-unsafe impl Sync for TyrData {}
-
 fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
     regs::GPU_CMD.write(dev, iomem, regs::GPU_CMD_SOFT_RESET)?;
 

-- 
2.52.0.351.gbe84eed79e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
