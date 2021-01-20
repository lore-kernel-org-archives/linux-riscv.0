Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C4FC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 09:32:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 957A423158
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 09:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 957A423158
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iAhibmUClSc8EOdN+I+wixhrizDDKHaI1eiICULgGDU=; b=qX0T6UPS7DzQetrAmMIACUio6
	PAWk5yMvH5zdQUlfTgiHxMHDKKWKQQJnRoB0pWiga7xPucqI4Lm031nMJknYhaBj6wgU6iUe8sDld
	+a0FDR2MKh+seYAK/tXtzGLLeyL+kCl10XSRq1FPUyH+I9jlAkf7BhHY9YqIXUbR3ZKhqpj3hvapt
	zKZ4+zPGT/FHy6Rs0+X++6uqt1/0fcOguwYxSAVeUscS0WfbD/w4kwREPjLisj881PALUw6PyOSNF
	E7wa8MuGJu7ZZR/RrAABs5KVjHhu41FbpX4Kg0GsxVtZ6CHCXZOhPmKAi702HinJrUzuwf3AP3MWv
	2fgZiqXmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l29qO-0001Lr-Hv; Wed, 20 Jan 2021 09:32:04 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l29pE-0000vw-CZ
 for linux-riscv@lists.infradead.org; Wed, 20 Jan 2021 09:30:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id m2so2198221wmm.1
 for <linux-riscv@lists.infradead.org>; Wed, 20 Jan 2021 01:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bl3ZcRKmZS4HxdqARjxCZVUBXdgf/EJ6RpkdvaEOCdc=;
 b=pY0GsnMn4gmD2ge9U3lJIxZsM+l6cJl1kCMqXpiHVrfP0HvMIX9M+/aq8DbwtDyJqy
 YcPJQ54ZlWCgYjaygeNanshMMlXgi3Hp4BCeGHn/59fmidFS7v9OHnDti0955IHSSU7r
 WvaXVSR7+dLzNdHFU5cXx2sL/jtxQBFzomb8PUvAq0CBBfOW2wquWBbjAep23otLx68t
 0+bI26L+HLuGPNuOAxoEOjS67pBwXaOQzISkOeRky+a41Ofz+WdLeTb9QX6L14xMXbQX
 RAaARl19H3isMUfwCvUdQpCli4C0SzLZPO22XNw850O32LTmNp4Jfry7rqjS2gElXg7e
 Uhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bl3ZcRKmZS4HxdqARjxCZVUBXdgf/EJ6RpkdvaEOCdc=;
 b=D224oTYmD6QAZHf4i5/GzLTK6VNRloHIyF1+BP8Ph8/ZfFoydGqRnYoym/CA9egumJ
 Pf0hSkgSa33yDExMIDSGtTA4zvRgEa+8qLSESYSeDFq1QEQ/0XygKmjcLtg4Px+vHjj8
 nykFAE2mcuKYDEohGCsxuUWYY3S9IPH8svTLNHBMDI0sxOOyNfSrn5MSgoPfXssuwWWx
 rjC6m0WFGBz79GoYfIq7xwJvcqYlFyQvAXzL2X5YOjI3wWUR2BX15GTEGo+wjDCxQp1A
 ewykXWKu4MXDISd3oCvMz1IvJZCKnghHZbryvO0HguMdYr5WqcHVvQ+zCG3G1Q/cg2br
 9aAA==
X-Gm-Message-State: AOAM532PLttxEr+/QTFhXFjo5+m+lX9ikVunT9Uf+Xk5i9RNEPG5QLNj
 HCkawo1D4rbbU0hRcx8Gh07vUw==
X-Google-Smtp-Source: ABdhPJzAKQ58Tef4aS2NktoFCutcy4kxigfx/GU4jNbB0hg2UUSg9n4CG2bkXxQuuR8Ms4acU4KrgA==
X-Received: by 2002:a1c:98c6:: with SMTP id a189mr3388765wme.88.1611135051160; 
 Wed, 20 Jan 2021 01:30:51 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id z130sm2889201wmb.33.2021.01.20.01.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 01:30:50 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 06/20] clk: sifive: fu540-prci: Declare static const variable
 'prci_clk_fu540' where it's used
Date: Wed, 20 Jan 2021 09:30:26 +0000
Message-Id: <20210120093040.1719407-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120093040.1719407-1-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_043052_501864_764DEFF5 
X-CRM114-Status: GOOD (  13.39  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, Pragnesh Patel <Pragnesh.patel@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9jbGsvc2lmaXZlL2Z1NTQwLXByY2kuaDoxNjozNTogd2FybmluZzog4oCYcHJjaV9jbGtfZnU1
NDDigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KIGRy
aXZlcnMvY2xrL3NpZml2ZS9mdTU0MC1wcmNpLmg6MTY6MzU6IHdhcm5pbmc6IOKAmHByY2lfY2xr
X2Z1NTQw4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1d
CgpDYzogTWljaGFlbCBUdXJxdWV0dGUgPG10dXJxdWV0dGVAYmF5bGlicmUuY29tPgpDYzogU3Rl
cGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPgpDYzogUGF1bCBXYWxtc2xleSA8cGF1bC53YWxt
c2xleUBzaWZpdmUuY29tPgpDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4K
Q2M6IFByYWduZXNoIFBhdGVsIDxQcmFnbmVzaC5wYXRlbEBzaWZpdmUuY29tPgpDYzogWm9uZyBM
aSA8em9uZy5saUBzaWZpdmUuY29tPgpDYzogbGludXgtY2xrQHZnZXIua2VybmVsLm9yZwpDYzog
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvY2xrL3NpZml2ZS9mdTU0MC1wcmNp
LmggIHwgNSAtLS0tLQogZHJpdmVycy9jbGsvc2lmaXZlL3NpZml2ZS1wcmNpLmMgfCA1ICsrKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2Nsay9zaWZpdmUvZnU1NDAtcHJjaS5oIGIvZHJpdmVycy9jbGsvc2lm
aXZlL2Z1NTQwLXByY2kuaAppbmRleCBjODI3MWVmYTdiZGM3Li5jMjIwNjc3ZGMwMTA4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2Nsay9zaWZpdmUvZnU1NDAtcHJjaS5oCisrKyBiL2RyaXZlcnMvY2xr
L3NpZml2ZS9mdTU0MC1wcmNpLmgKQEAgLTEzLDkgKzEzLDQgQEAKIAogZXh0ZXJuIHN0cnVjdCBf
X3ByY2lfY2xvY2sgX19wcmNpX2luaXRfY2xvY2tzX2Z1NTQwW05VTV9DTE9DS19GVTU0MF07CiAK
LXN0YXRpYyBjb25zdCBzdHJ1Y3QgcHJjaV9jbGtfZGVzYyBwcmNpX2Nsa19mdTU0MCA9IHsKLQku
Y2xrcyA9IF9fcHJjaV9pbml0X2Nsb2Nrc19mdTU0MCwKLQkubnVtX2Nsa3MgPSBBUlJBWV9TSVpF
KF9fcHJjaV9pbml0X2Nsb2Nrc19mdTU0MCksCi19OwotCiAjZW5kaWYgLyogX19TSUZJVkVfQ0xL
X0ZVNTQwX1BSQ0lfSCAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvc2lmaXZlL3NpZml2ZS1w
cmNpLmMgYi9kcml2ZXJzL2Nsay9zaWZpdmUvc2lmaXZlLXByY2kuYwppbmRleCBjNzhiMDQyNzUw
ZTIxLi4xNDkwYjAxY2U2MjkwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9zaWZpdmUvc2lmaXZl
LXByY2kuYworKysgYi9kcml2ZXJzL2Nsay9zaWZpdmUvc2lmaXZlLXByY2kuYwpAQCAtMTIsNiAr
MTIsMTEgQEAKICNpbmNsdWRlICJmdTU0MC1wcmNpLmgiCiAjaW5jbHVkZSAiZnU3NDAtcHJjaS5o
IgogCitzdGF0aWMgY29uc3Qgc3RydWN0IHByY2lfY2xrX2Rlc2MgcHJjaV9jbGtfZnU1NDAgPSB7
CisJLmNsa3MgPSBfX3ByY2lfaW5pdF9jbG9ja3NfZnU1NDAsCisJLm51bV9jbGtzID0gQVJSQVlf
U0laRShfX3ByY2lfaW5pdF9jbG9ja3NfZnU1NDApLAorfTsKKwogLyoKICAqIFByaXZhdGUgZnVu
Y3Rpb25zCiAgKi8KLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
