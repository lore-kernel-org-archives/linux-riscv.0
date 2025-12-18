Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562B2D6ACFB
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 13:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=bWAhXdzEVdbeJOimO3ngXdBkgqaw1hWjh57zumjEmVM=; b=4BR
	nowB20114wgk6CSBXlG9S1W91tAp3NbTGn8/nuXd9dO/fAETjud7jvv58POqcQRY+vAGKt0v0ydkf
	4OcK5c/DgIkAannaLoE+zhpzyEHIR/OSacs6vaZswUh0pO839TwhoTutNxA8Ib/baTMuosSrCXxFz
	v3JbuL+5fea/RyHKgkF93Oh43B7Hc+9AK6KKp9/jbe40zvHmjpEdfT+gqgPBl4b+HAy4ivYJfoP3M
	jvBD838D7r4bR3LbhtoBAS76aJPLAYfCkGUgejRLDJewnM0wG8WqGY8n5E3JdMci+9aPjaYki5A/7
	IUbzQQQMs9Fzw+nJ16I01++6idcoZJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE2v-00000008X6C-3T6Q;
	Thu, 18 Dec 2025 13:27:57 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE2o-00000008Wzs-1U2E
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 13:27:57 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-6416581521eso701873a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 05:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766064468; x=1766669268; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qi+diNh9H3fqHmnH6Hx1SnRjbjw/DBqYuPovI/jASd0=;
        b=cs2QYPD78ZN5tNAIW1/LWIk9PUoTP2s8v6lbeXgWLNZtcOKV3HLpKumJyBcjaErvje
         guXa/W9ov61JBGUpuE/i/mYFF5jw4DIXjj1FTZWx3LU042N2i4m1ty282xqUXgkT2g2W
         861JUWUz5ig6z/P71wF7uvRfx9sy9qiZ3zt/lURvpwM2/rC6stTotGUqYpUv4rxekZoS
         fmdW2zqb5E6F8KYK2lW/1K8ig6oQGBZkvVwkZ5Vv9x+QXKq+UvVJzvPgBBPRuNjcg84j
         TV79rHn0HWrBgHxD7oX51j5HKaNZuP+R+3erL8SAphxUpYtaGbjWe1T1pjuarO9lwvUa
         aQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766064468; x=1766669268;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qi+diNh9H3fqHmnH6Hx1SnRjbjw/DBqYuPovI/jASd0=;
        b=qkJ91LA9xlFFNWVk9wEpKWzByxmzicImmoQPX8sB52kZ1oiwuhrlY3MKp52o71UCnF
         1WMDXjEr6l9vVh07N7DzTQrAVQ+YuGzM41Rj3MOrWx3Z1EV8jOjsaX0sHHe7FcnoaXNV
         j32nyIC40JjT3d0rrxiI7V9ea1I2PRmvUdv3GvD5MwBTTgFjdum1ipLaW/qVyeCFGgaE
         8EO00+3X+IDGCngQflZwIHwQ0xU1jTDlMav76kCJvPNebL+h/V8IFu9saRAtexPRSW8Q
         X4dqUVAZAutE5kmvfz3xQIMulqrHRU0QbHHfCfJaBN9OixIATgjpiepOOiWGkRp1+onI
         CMuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDdhS4HRWen26f09R6e7ZmtiHn4WHodkYgGstkrw/h5EphzSvh8ZrsA35vp1USpowM97ZB3wMzhaTcbg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+j7Sp0imz8QsXM43oH0Wzgde3M6RI1NKtKh5QoOWo1iuFKSiX
	C6rBEYlJhR8t44LrhgQGUrvXCHjUaZNYiyL1/yL1R9zzxTtgA4QhiIrEG3UFspeBBNE7s9+/Y28
	mzhK/zhhwjekdeChNkw==
X-Google-Smtp-Source: AGHT+IEJ9HLtb50XHuIEDIn2I5dEKRfpXNrH3igp0u5gga3J4+yG7DZI2Q0fi7gmDBfxIdYoUF2j/d9U4mcuUv4=
X-Received: from edbin13-n2.prod.google.com ([2002:a05:6402:208d:20b0:641:9bdd:d74f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:557:b0:649:ab53:f11c with SMTP id 4fb4d7f45d1cf-649ab53f181mr13887194a12.23.1766064467917;
 Thu, 18 Dec 2025 05:27:47 -0800 (PST)
Date: Thu, 18 Dec 2025 13:27:39 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEsBRGkC/3WMQQrCMBAAv1JydmWzSbF68h/iIU23bbA2kkiwl
 P7dtAdBweMMzMwicnAcxamYReDkovNjBrUrhO3N2DG4JrMgpBKPqMEON4g8NhCn0YKyrTm0mqV
 lErl5BG7da/tdrpl7F58+TNs+ydX+OyUJEnTVIClFyHV17rzvBt5bfxfrKtEnl0j4mxMgaG3qU inDWOmvfFmWN6cYRdHqAAAA
X-Change-Id: 20250904-clk-send-sync-3cfa7f4e1ce2
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=TNCoBCaC1De+GuiDPz38rW09O9saXkMK3Ckv9akyQNA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpRAFNFVzmcQ2qN1p0BMkwj9qfGdczHhAq4h4h8
 brc4EWRh+iJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaUQBTQAKCRAEWL7uWMY5
 RsZdD/9D8QHTjLTOthce0e12XPB+tRv7yTYfTigi7v76k7nrub0lKoKFh5YWCFnp/HL8DRywxKb
 oxs4TkZ46IOOOzwErax+03oga+ud4RA5ABn2ckO9+qT8fUPy3GhuUXscu70HfPiUymY65J5HtKS
 x1v/qKELfXqmLSu+t4/CfIGxtLVN6znV8WnqApVX89X3sYG8OJFT1Lrqv3H83yFlfcW/aaKlxe/
 UTOgL6htm/yH98HfawS0BAuPXG8f8J7T7geAiZ2LhiEJoivaWalj9qcuNxa05izSy+54u3NwoXQ
 /cCACpUNeOZnAGatJra0dJW4pPehjlM0X3TtI1bgq/Z6TL08AoZa7wmJaxv3kYvoACDSg6uQnoz
 0pzCePqB0kse0Fz5H8nxVc7Z0VWBAkc9Ij4s5Fh+S3l0CDIIxk/cr9PNYBUxtcF2Qqb75cMiueP
 mvNcZp5DsU99p93dsNst594/1XVkYTPcpurKSTtmOvxTImC2AL+0RCI+BY9CsuOpYiqnGVMTe7N
 mGTNbC5b8FDZe9TtKb2nhVBwrMt9OrVGLqj7gT2yMGUiKesa6kTrkd1YllkFpEDiLJJW6fUsWJQ
 zt1Psk8ettsFrj2CWt2WZdymF9Bz/KV8ycv/6A3TMtQuvymfQHZnQ83QUyLw3a/GekISTmoqW2B Nc412T9BlsDc0+A==
X-Mailer: b4 0.14.2
Message-ID: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
Subject: [PATCH v3 0/3] Implement Send and Sync for clk
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
X-CRM114-CacheID: sfid-20251218_052750_410241_4D9CE681 
X-CRM114-Status: UNSURE (   8.06  )
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
