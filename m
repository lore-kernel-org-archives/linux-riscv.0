Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5979C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 02:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WTgZ2YPGDl22m2AhyM/bn36lzYbRTf8vF2GtBvYOW2M=; b=fbd2avq8YvIYDg2OufFzJQDASu
	2AzucfF+fTSqHxkorF9lFlazHZoFIzX9souVSHUeoBUgFAloHPRQT1LFKh9zwuNMKsl/NvOc9jraQ
	FEvnFf/KXhqZ3lmhFlPwDFkF3Uc4PLNJta0zv6ZqGHK3yzBImWBewO1SF8Qyo+sJYAiPp7EagyF1X
	jKPM89zYdV0pKnFkDls9gP52RBlZKSLIlUPr2L/M8qiGk686pr2zSsMBEa6iqrqMWSLe9Ke20csUz
	4WJHAXl2lp/xVnkCEeLYSxN6wR5NNvKPWux+9RmqigIjCjNoCLqzP1t8bZB8WmLB512Re7hDgwu5n
	Fc6v/G/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9bWe-00000001jTU-0ylz;
	Wed, 22 May 2024 02:16:20 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLT-00000001TgL-2xIE
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:00:57 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-de61a10141fso19387914276.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339642; x=1716944442; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/APWv0oI9augsnZmJefO/JsxQIQ0ybcPp2DpgllRB2k=;
        b=RxNGS4iqdwYTaVq1xKgP4gXL36A+Xwd+YRlsj0q9G8u2r6nBwbaiIvrGDTZIHdCfzi
         iGhrnckLILTZ1fDo8poEYA6el8gH4A4kmqxC+UH9YrbcsOr7MKzVdKb2FGw+oew4RdYK
         pZfIcwB2eWpWBlJgI6MsrD/4AJE0KAgZeAPeWBgu9zmXd/BcygeP7vqpKhQ9I/Cq3rIA
         4s1coMQj33lEIx5KI+pPwdpbfmZLjIs5vOImsrjZVRwBjc5fbNMa/3BKuULnDgs+UZ4b
         ydgt+NIqwjBK9M3pq/Tf6nvQOsH8//jWugzhbTRu885/GuCqBjvUqBQEL0A3PO6JhmsP
         UxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339642; x=1716944442;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/APWv0oI9augsnZmJefO/JsxQIQ0ybcPp2DpgllRB2k=;
        b=uep5fbRdQ9XZFZDndtu8LGsRkMKVatAIoRRi8tztIxtOI4+etOKlMWVb61YR0mJ5IG
         z93h7H0894ct2TfIv9VhxUEhsRLubAhB995OfxNBIgJpBZIxpsy1KnEhu682iUWQDsgs
         o/HZ7+K3WLVQ2h/L8Mf3EoenP0xpOSplzlmru+FGIqiOfLyYzd8Nor+4pmjMvNLAaSww
         97Wja+PZDR9tF3M5Ah2kOae+fas/SOVzmjj2OPogCMskTiCXY4rBuveMIS2bWu/zVXnf
         ZdMAi1PB7dbb7Vugpk0Xz3eRqcnRdLu48ySUii2DNNhLSMmidNp471JtBwiQOy8SkGqZ
         LtDw==
X-Forwarded-Encrypted: i=1; AJvYcCUs//KbBUhQ6OPPbH7aWlg2dtzvcSs12sqomh49kcqIOhx6zNnN9zWa+9q62VecK/wea9fe/oA7ITQcEaIMjqW3p2Xyc8JkCv7XBWa/fsNi
X-Gm-Message-State: AOJu0Yzqpey2Nuii9tTvFKTaVtSdV4yBWZIiNfs1jJMwJY0ebZ4MFsWr
	feBYj+6VuTzBO6KyBLV3qbVBOkPcI3gySr+2bstaZT6rdJXEuNfEuVREiBbA5rJraWXSVcrYYiZ
	PfA==
X-Google-Smtp-Source: AGHT+IGAclX451NumcxAy9NMEz+qq9f2aWZhVVXFDpvWXMuYKe4iFyqjOFjW34/TGUUo4ozk/aBl3VFiCKo=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:1205:b0:dee:6f9d:b753 with SMTP id
 3f1490d57ef6-df4e0ac5d4fmr74410276.6.1716339642289; Tue, 21 May 2024 18:00:42
 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:12 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-27-edliaw@google.com>
Subject: [PATCH v5 26/68] selftests/landlock: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_180044_103994_AE516059 
X-CRM114-Status: UNSURE (   7.76  )
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

X0dOVV9TT1VSQ0UgaXMgcHJvdmlkZWQgYnkgbGliLm1rLCBzbyBpdCBzaG91bGQgYmUgZHJvcHBl
ZCB0byBwcmV2ZW50CnJlZGVmaW5pdGlvbiB3YXJuaW5ncy4KClJldmlld2VkLWJ5OiBKb2huIEh1
YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+ClJldmlld2VkLWJ5OiBNdWhhbW1hZCBVc2FtYSBB
bmp1bSA8dXNhbWEuYW5qdW1AY29sbGFib3JhLmNvbT4KU2lnbmVkLW9mZi1ieTogRWR3YXJkIExp
YXcgPGVkbGlhd0Bnb29nbGUuY29tPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xhbmRs
b2NrL2Jhc2VfdGVzdC5jICAgfCAyIC0tCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sYW5kbG9j
ay9mc190ZXN0LmMgICAgIHwgMiAtLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbGFuZGxvY2sv
bmV0X3Rlc3QuYyAgICB8IDIgLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xhbmRsb2NrL3B0
cmFjZV90ZXN0LmMgfCAyIC0tCiA0IGZpbGVzIGNoYW5nZWQsIDggZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbGFuZGxvY2svYmFzZV90ZXN0LmMgYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sYW5kbG9jay9iYXNlX3Rlc3QuYwppbmRleCAzYzFlOWYz
NWI1MzEuLmM4NmU2Zjg3YjM5OCAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
bGFuZGxvY2svYmFzZV90ZXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbGFuZGxv
Y2svYmFzZV90ZXN0LmMKQEAgLTUsOCArNSw2IEBACiAgKiBDb3B5cmlnaHQgwqkgMjAxNy0yMDIw
IE1pY2thw6tsIFNhbGHDvG4gPG1pY0BkaWdpa29kLm5ldD4KICAqIENvcHlyaWdodCDCqSAyMDE5
LTIwMjAgQU5TU0kKICAqLwotCi0jZGVmaW5lIF9HTlVfU09VUkNFCiAjaW5jbHVkZSA8ZXJybm8u
aD4KICNpbmNsdWRlIDxmY250bC5oPgogI2luY2x1ZGUgPGxpbnV4L2xhbmRsb2NrLmg+CmRpZmYg
LS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sYW5kbG9jay9mc190ZXN0LmMgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9sYW5kbG9jay9mc190ZXN0LmMKaW5kZXggN2QwNjNjNjUyYmUx
Li5hMzAxNzRlMmUwNTMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xhbmRs
b2NrL2ZzX3Rlc3QuYworKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sYW5kbG9jay9mc190
ZXN0LmMKQEAgLTYsOCArNiw2IEBACiAgKiBDb3B5cmlnaHQgwqkgMjAyMCBBTlNTSQogICogQ29w
eXJpZ2h0IMKpIDIwMjAtMjAyMiBNaWNyb3NvZnQgQ29ycG9yYXRpb24KICAqLwotCi0jZGVmaW5l
IF9HTlVfU09VUkNFCiAjaW5jbHVkZSA8YXNtL3Rlcm1iaXRzLmg+CiAjaW5jbHVkZSA8ZmNudGwu
aD4KICNpbmNsdWRlIDxsaWJnZW4uaD4KZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2xhbmRsb2NrL25ldF90ZXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sYW5kbG9j
ay9uZXRfdGVzdC5jCmluZGV4IGYyMWNmYmJjMzYzOC4uZWVkMDQwYWRjYmFjIDEwMDY0NAotLS0g
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sYW5kbG9jay9uZXRfdGVzdC5jCisrKyBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2xhbmRsb2NrL25ldF90ZXN0LmMKQEAgLTUsOCArNSw2IEBACiAg
KiBDb3B5cmlnaHQgwqkgMjAyMi0yMDIzIEh1YXdlaSBUZWNoLiBDby4sIEx0ZC4KICAqIENvcHly
aWdodCDCqSAyMDIzIE1pY3Jvc29mdCBDb3Jwb3JhdGlvbgogICovCi0KLSNkZWZpbmUgX0dOVV9T
T1VSQ0UKICNpbmNsdWRlIDxhcnBhL2luZXQuaD4KICNpbmNsdWRlIDxlcnJuby5oPgogI2luY2x1
ZGUgPGZjbnRsLmg+CmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sYW5kbG9j
ay9wdHJhY2VfdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbGFuZGxvY2svcHRyYWNl
X3Rlc3QuYwppbmRleCBhMTlkYjRkMGIzYmQuLmM4MzFlNmQwM2IwMiAxMDA2NDQKLS0tIGEvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvbGFuZGxvY2svcHRyYWNlX3Rlc3QuYworKysgYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9sYW5kbG9jay9wdHJhY2VfdGVzdC5jCkBAIC01LDggKzUsNiBAQAog
ICogQ29weXJpZ2h0IMKpIDIwMTctMjAyMCBNaWNrYcOrbCBTYWxhw7xuIDxtaWNAZGlnaWtvZC5u
ZXQ+CiAgKiBDb3B5cmlnaHQgwqkgMjAxOS0yMDIwIEFOU1NJCiAgKi8KLQotI2RlZmluZSBfR05V
X1NPVVJDRQogI2luY2x1ZGUgPGVycm5vLmg+CiAjaW5jbHVkZSA8ZmNudGwuaD4KICNpbmNsdWRl
IDxsaW51eC9sYW5kbG9jay5oPgotLSAKMi40NS4xLjI4OC5nMGUwY2QyOTlmMS1nb29nCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
