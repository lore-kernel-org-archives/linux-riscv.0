Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71578C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 16:11:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 439956058D
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 16:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 439956058D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80KGFsgh0s8j2Pm9mYh2qpxVtotPS0wQCqmpMwWVXo8=; b=QEYczE9Yb1ryoj
	v0Cpn4RcbKKsvyUqvMcay9YzG85rYf/PYquP5X0vDgdeIpZPLgyQUMcqvIYWr0irK0SyzM8a+CHWr
	LRmKpSCV661qs3vYILifRPn5Gel/Z84ipwusPkZsmDYCXusXpkyVeCm28WLjH8JUueOWwtwAm/YHd
	P5U0VryvgMlLOppnOyHNtJ9uSGHegT3J1zHLHkhjY4wYXSMhYOBMDQ13Yg1h+Zq0w0ZhSvnQRa3kK
	3u3WtyDlP7mcR38OJyNEUAU2skrGEvwNNkP7/rNW2mG1ItLYWkcIgaF1FGOvTB8YdbqW6NIFWjCkO
	nbL6Vl8F56//bL+vFjpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg7zl-008WoX-6t; Thu, 28 Oct 2021 16:11:13 +0000
Received: from mail-lf1-f53.google.com ([209.85.167.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg7zh-008Wl1-5v
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 16:11:10 +0000
Received: by mail-lf1-f53.google.com with SMTP id bq11so14652099lfb.10
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 09:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FpcAIXzIJRZanZR1xOZ449nR9Z4CpuYm3hzQzUAM83c=;
 b=S3SXrDPTA8H2PqqdsFjTNcFU9aKExZyRuTuEK8qVlZatE8EeImBxYCf5YnA22XVl+r
 CYH/7tcO5NMXwrAYk+tJ2Q5kQ9QS++mB0G+6XMT7uW22YPsUHgg0BiLGMQEu0eZUGrPm
 ErPTzg0gptKZnGpBJB6y0TEa4FjjDkuVZNYNFsl5GIT+T4y3s4peTeWL0F0eIe+MRJDh
 zv4rFH9wTQhbu+TWUYB3ZactzLI9XlmEKy4kfFPWPpi8mbkQU7LQp0fzLANJiJj6ycC8
 EjMuxjcr5HFCrPrwNQ0HqnoSnM4Z9xRXtryG/hAsUYrO57g5MmMuK95re+qjmL443Ifu
 AG+g==
X-Gm-Message-State: AOAM531aa2AdY7ek7zNdHH1qApFYcciG6GfJ/AsVmNewtQEggSQxxJ+l
 Is7+u3SPuDhKP6bQgP9Lrwg=
X-Google-Smtp-Source: ABdhPJwdMZ48TKOvgfFiB9guDpW7x1LA1tIS0H2a86m9DxEaEZrPkOpQmOD9kozfq69jLR8FA3Mi2w==
X-Received: by 2002:a05:6512:3a89:: with SMTP id
 q9mr5114900lfu.172.1635437467541; 
 Thu, 28 Oct 2021 09:11:07 -0700 (PDT)
Received: from kladdkakan.. ([193.138.218.162])
 by smtp.gmail.com with ESMTPSA id o17sm49680lfo.176.2021.10.28.09.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 09:11:06 -0700 (PDT)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 bpf@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 luke.r.nels@gmail.com, xi.wang@gmail.com, linux-riscv@lists.infradead.org
Subject: [PATCH bpf-next v2 2/4] tools build: Add RISC-V to HOSTARCH parsing
Date: Thu, 28 Oct 2021 18:10:55 +0200
Message-Id: <20211028161057.520552-3-bjorn@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211028161057.520552-1-bjorn@kernel.org>
References: <20211028161057.520552-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_091109_236318_1BF90247 
X-CRM114-Status: UNSURE (   8.67  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QWRkIFJJU0MtViB0byB0aGUgSE9TVEFSQ0ggcGFyc2luZywgc28gdGhhdCBBUkNIIGlzICJyaXNj
diIsIGFuZCBub3QKInJpc2N2MzIiIG9yICJyaXNjdjY0Ii4KClRoaXMgYWZmZWN0cyB0aGUgcGVy
ZiBhbmQgbGliYnBmIGJ1aWxkcywgc28gdGhhdCBhcmNoIHNwZWNpZmljCmluY2x1ZGVzIGFyZSBj
b3JyZWN0bHkgcGlja2VkIHVwIGZvciBSSVNDLVYuCgpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2
cGVsIDxiam9ybkBrZXJuZWwub3JnPgotLS0KIHRvb2xzL3NjcmlwdHMvTWFrZWZpbGUuYXJjaCB8
IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvdG9vbHMvc2NyaXB0cy9NYWtlZmlsZS5hcmNoIGIvdG9vbHMvc2NyaXB0cy9N
YWtlZmlsZS5hcmNoCmluZGV4IGIxMGI3YTI3YzMzZi4uMGM2YzdmNDU2ODg3IDEwMDY0NAotLS0g
YS90b29scy9zY3JpcHRzL01ha2VmaWxlLmFyY2gKKysrIGIvdG9vbHMvc2NyaXB0cy9NYWtlZmls
ZS5hcmNoCkBAIC00LDcgKzQsOCBAQCBIT1NUQVJDSCA6PSAkKHNoZWxsIHVuYW1lIC1tIHwgc2Vk
IC1lIHMvaS44Ni94ODYvIC1lIHMveDg2XzY0L3g4Ni8gXAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC1lIC9hcm02NC8hcy9hcm0uKi9hcm0vIC1lIHMvc2ExMTAvYXJtLyBcCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLWUgcy9zMzkweC9zMzkwLyAtZSBzL3Bh
cmlzYzY0L3BhcmlzYy8gXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC1lIHMv
cHBjLiovcG93ZXJwYy8gLWUgcy9taXBzLiovbWlwcy8gXAotICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC1lIHMvc2hbMjM0XS4qL3NoLyAtZSBzL2FhcmNoNjQuKi9hcm02NC8gKQor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC1lIHMvc2hbMjM0XS4qL3NoLyAtZSBz
L2FhcmNoNjQuKi9hcm02NC8gXAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC1l
IHMvcmlzY3YuKi9yaXNjdi8pCiAKIGlmbmRlZiBBUkNICiBBUkNIIDo9ICQoSE9TVEFSQ0gpCi0t
IAoyLjMyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
