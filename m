Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40815C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 13:21:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EC2360F92
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 13:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0EC2360F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80KGFsgh0s8j2Pm9mYh2qpxVtotPS0wQCqmpMwWVXo8=; b=b27zFxhttUcx/L
	PwqlOyVGP7nHjYpN9Pkez2bmdXcgBoWHxcR2cujsKA9RQWYQKwHCGZzYOHK7s8/n8MsFG12Ouhtuf
	rvXYZJ1DYmHY2tWAjWYIYqC/Ni+8aU5Qtrl5XannHkKDlZjS/d0xQI0nhWKPX+4psUFONg0Cz6tP0
	d+NC++PjFkci7zKUeCBpVskKvsHd+swTR3NlfdSdI80Ql8+R+PiyBSzI5eVhPp+Tezh5Ma7JF3kAT
	SSzDRx41GM6Ybbevm+VSdz3vApWG5o3U1KjBiWH51kyBuznZOnEMIuIIqBgzhvh4iNmWab7W+vlKY
	YiL04rNROtFKroxQxxfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg5Kw-007uXw-1K; Thu, 28 Oct 2021 13:20:54 +0000
Received: from mail-lf1-f54.google.com ([209.85.167.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg5Kr-007uVe-Ki
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 13:20:50 +0000
Received: by mail-lf1-f54.google.com with SMTP id bq11so13512791lfb.10
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 06:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FpcAIXzIJRZanZR1xOZ449nR9Z4CpuYm3hzQzUAM83c=;
 b=rN1mU9b04kHL1q0rR9BDVgndzvOvFwGcdNI3xXJUjRlHOXy8UUAseYWd8+NrDWuKry
 PWIUUEDMxT42BX2HwPeLgi8Yba0VD45HHMHaWN1Qu8afrNR24muR2qdPWtseAFYwjAAo
 nIHnfjcTauDjyR0pr5cPb+l1sL280Xpy/H52/v3CmcNCYQX4XdbQEhYnn2Me0MprdIp6
 U45jyfEEt4VaJRZYDTU+0/PzwIiT9eXwEhzs+fLQ0mVNoOHCW/aTJoyBYbwfACImPpVn
 iwfFOfW6EMKPJpe61UU8UQCD1CPKdmneLoQZnPP1oBalUuE/xbWEf5YAhBIjYLHNUMSE
 8ErQ==
X-Gm-Message-State: AOAM532guWazu53HN/iXrHBGg3Vt5jd2xgcHx4cD2Ocr02chjlZdl7pd
 0EHoz7+nSOq4hHOt5sFeU/0=
X-Google-Smtp-Source: ABdhPJzpoIYhfju6k4/Qfnivw7wHlSlK52r59+vqI6IlaJ3X5/OYjMzzZhfjKSvZC4Rv3XnX0kOmUQ==
X-Received: by 2002:a05:6512:3b20:: with SMTP id
 f32mr4083761lfv.423.1635427248082; 
 Thu, 28 Oct 2021 06:20:48 -0700 (PDT)
Received: from kladdkakan.. ([185.213.154.234])
 by smtp.gmail.com with ESMTPSA id o9sm309616lfk.292.2021.10.28.06.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 06:20:47 -0700 (PDT)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 bpf@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 linux-riscv@lists.infradead.org
Subject: [PATCH bpf-next 2/4] tools build: Add RISC-V to HOSTARCH parsing
Date: Thu, 28 Oct 2021 15:20:39 +0200
Message-Id: <20211028132041.516820-3-bjorn@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211028132041.516820-1-bjorn@kernel.org>
References: <20211028132041.516820-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_062049_702521_6DDB3866 
X-CRM114-Status: UNSURE (   8.62  )
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
