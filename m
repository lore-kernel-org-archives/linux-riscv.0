Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FE4D2F325
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 15:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=QmETZS6dYAjRXgK82LBRYAfScdAjLUkQz5XuWqtW2uo=; b=DzT
	hqPWQ13oQyqIPgNS6gMmhDHL6LKCnYF5ktm4wNiGxW2m/81Ez9Qib9IevWsBOE6TCW5x2/fMSwYX8
	yGO/it5+OhtJgjapS+X3j2TLelPZFQRMwah3+0AFG4N3UHCkF0gouKNy2Od33514aSZea40ZGqCOL
	5qMM4+4BmnUWHC+YV1jy5LbjnA3pKCpXtwQchEvkMcdAmBr4KpsPENjaZgBHYdslKykaD/c+/huu/
	rtqVXBHs2i2bQBf3pfdfslHzFYAMQETzLCAIDI3+G146UgwGUTPKHGLPjGXD+Tz3RxDJ3zb8VEbJP
	/dDGVP8vhCDqBl6tEUwK+Y4iMjJOOAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfg5J-00000007LEM-1OzM;
	Tue, 13 Jan 2026 15:13:29 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfg5G-00000007LDp-3T27
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 15:13:28 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4775d8428e8so62462125e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jan 2026 07:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768317204; x=1768922004; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6N1TEsiPesyo6Bt0PZvnhVY3O3p5gV/3E/K/p2dHoxc=;
        b=fjBaIGA+xvzgeTsV74f7EUdxbu708Gdq70p14k9YLTdOrCkzGEetNYyEx5XnFFqPMj
         7AyI1k1FcPVO3XljdFFacvGAXUbUWNMiTJlC2AGKNzTRIX437gQ1lcqHO2IREP2F4Ucl
         6hRTPqDvfb5MHsiGa04e5BQhgUeX9Fxgrhadx3eNxvizJMgakQ+051THAhYIaWxiVZqL
         O0sRu6QwQ7K0S602MQOS7Bsta9NtimNMHI+frfQcV98bAleaXnVR56JuCvOKG8nENdv0
         Sb31lnnqpKoTYL3Hy6qkm7pPStNw2TSYHoUxxvg5X4icTxK4OZk+OMCybdrPbpTqe47+
         CIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768317204; x=1768922004;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6N1TEsiPesyo6Bt0PZvnhVY3O3p5gV/3E/K/p2dHoxc=;
        b=YyIgZ1R+haZJvpnzFekJo7dt3FLN5M2ifNQdeXAsW2rHeQSEmBjgpFi3KKQtd8W8Hd
         LeG4433qaAaEsSZdM+4+ek/ckkINFPoLKssUX55o7OpzExBBsPSEZBHNTpMwJ4X4jOdS
         PwZaIIf4SvjzE4JnmCsPMU347XB6klQ7WqyhPa36Py4lsYHITvgtCcVcdzg6YadJrcZW
         ibgOmVCm4aYaqAVj3gED1RrBpOT3hqSbnPx86qQ5ETFAT0PSix3qzIkWJchALiEhSQmA
         ksYSZnqb9iinZNRDc2q7hKMPWvtrLS7SFiM//aGChLdIlt/OgrOe7SwUxOGJDKGVaxOV
         JTAw==
X-Forwarded-Encrypted: i=1; AJvYcCVaAlAiyu7hb1IgUjiIgrPdkA3u1dTbjQ556E/vR/TEJ/Fd+XPSlx8cIdidQs5BY/zvqczMnyrsVWvxHw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/YolUAS8y48pwDHjLAog5jGFw1i7yVKIglRU3Aa7NRnhrhoyz
	0G/KBl54FFFahuUr5zWFddCl1cHbR+ekP73m4p2RSookL5P3356C+xkrP0UU8lIt6UbWqP4OyJj
	MK9/kspqRIwihde2dcQ==
X-Google-Smtp-Source: AGHT+IHoXaO70n2FJmZP8Rd2OF/hvQHQN06mNSOik2NmPij5NQxkTvgCkvgal1N4XDc5+fSDkHKcsHUBNt57n8A=
X-Received: from wmim12.prod.google.com ([2002:a7b:cb8c:0:b0:47a:9f70:c329])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8119:b0:477:b0b9:3129 with SMTP id 5b1f17b1804b1-47d84b0a8dfmr237085685e9.3.1768317204383;
 Tue, 13 Jan 2026 07:13:24 -0800 (PST)
Date: Tue, 13 Jan 2026 15:12:35 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAORgZmkC/3XMQQ6CMBCF4auYrh0znZZYXXkP46KUARqRGmqIh
 HB3CwuNGJfvJd8/isid5yiOm1F03PvoQ5uG3m6Eq21bMfgibUFIGR5Qg2uuELktIA6tA+VKuy8
 1S8ckkrl3XPrn0jtf0q59fIRuWPK9nN9/pV6CBG0KJKUIOTenKoSq4Z0LNzGnenpziYRrToCgt c0zpSyj0T9cfThJs+YqcdYmJ6ZSsnVffJqmF9R+xfwpAQAA
X-Change-Id: 20250904-clk-send-sync-3cfa7f4e1ce2
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=uKkVhBaphq3Yv4o1VV/s1jKOfUDc6KdF7Ew3LDTjeJI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpZmELFbghZxWZ7vaaZvAKoZIouMjeMx/D5VtYF
 y/dj/EnouKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaWZhCwAKCRAEWL7uWMY5
 RkUiD/9LHMHZPK8MfjH8P7x1+RzDmIXcOknAAS7n4m+VzrOjWzYSNqifU29O+VSt/W2ByxeTzYT
 aS1g2+Knt0WvtdmrmjV9Oi8vVsvlvJBWxBDtYFz8JW0c1m9w9+PUR2prE63e9bhpaF9ZK4jtN9F
 LMiiOZoqtCep7C+0aLHtunxvrUdJg39W8HXc0/RMJXv0iv9KImXAeuk0Gk/WV9npuZxU1AWMVV8
 W2zKm7ZD2cAB8V5JVSrh0LHN8lpMGSWU38mzd4N/0c662gulPBXsY47rbyj+ieUCU1e7Xb4rq5B
 XIC8Mu1AgLO0cM5Yr6G1Z1v09A1OECpW2F76vg16IFCNsCP5LNcYx2QE9SJh/dszq6riDB7N58q
 tZkOXDELeZ4++DyyRgnTGh+f07jh89dg9v77g/B+USWQm/jZ9P1VRFHJfhkdjjKmSCZuidXUx0U
 aHVaDuZcRBdGpZz0lGsO6868mSmdNYqR+PMcjDTiFqa2n2HRQCvdJybEcQoQGCmTgkxNLaicwR+
 0UDy8ZXpzI/D8WLlV/EyKHrvutrSXsAv1f3SEOvqzrq8WgsKNhrKiH+GHnyuGjAnCz1JmMumvTf
 0KM745KlQEWD2wlcWYm6yXD7EPEXhU+/gLRvZKu7c5b9rnjPGb90UJbYFFOb2UmYeVz9Imn43fN yqmFT6fOTRmLMfg==
X-Mailer: b4 0.14.2
Message-ID: <20260113-clk-send-sync-v4-0-712bc7d94a79@google.com>
Subject: [PATCH v4 0/3] Implement Send and Sync for clk
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
X-CRM114-CacheID: sfid-20260113_071326_914972_D026599C 
X-CRM114-Status: UNSURE (   8.75  )
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

The Clk type is thread-safe, so let's mark it as thread-safe in the type
system. This lets us get rid of hacks in drivers.

For Stephen's clk tree.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v4:
- Pick up Reviewed-by tags.
- Link to v3: https://lore.kernel.org/r/20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com

Changes in v3:
- Rebase on v6.19-rc1.
- Pick up tags.
- Add fix for pwm driver as well.
- Link to v2: https://lore.kernel.org/r/20251020-clk-send-sync-v2-0-44ab533ae084@google.com

Changes in v2:
- Rebase on v6.18-rc1.
- Add patch to tyr driver.
- Link to v1: https://lore.kernel.org/r/20250904-clk-send-sync-v1-1-48d023320eb8@google.com

---
Alice Ryhl (3):
      rust: clk: implement Send and Sync
      tyr: remove impl Send/Sync for TyrData
      pwm: th1520: remove impl Send/Sync for Th1520PwmDriverData

 drivers/gpu/drm/tyr/driver.rs | 12 ------------
 drivers/pwm/pwm_th1520.rs     | 15 ---------------
 rust/kernel/clk.rs            |  7 +++++++
 3 files changed, 7 insertions(+), 27 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20250904-clk-send-sync-3cfa7f4e1ce2

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
