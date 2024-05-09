Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB15C25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0USudy4BC/rKzzDKVqpYz4und4MJJ7iDOAgS+D5CXk4=; b=lNo13ExEK7RXr8uXLE/fnjYNpQ
	406969/4WBXkee5ypKaC3e29Rf1TB2GYjVDzOCSpECboxxLEbd31HaoJypXayFDDT5oMwF8cLTT2R
	zYzyfU65takER3XwuaEGxwAWkACGjFp4a9e/tE+Wlv2aIZI7Bkfc46uI4WrJorwrj2YGCUlwCLERB
	ATlMd393nLn4YPPnN6XnNU9eMt215+fucSc/BqqBYqyu5y4EslZmktLY6ECydNa8CDjQxlum1qtga
	RmOKExYIpjy9YMkQc8HKmL0kx+LmT+HxZdUj/Fv+XTMb+urIXiP0Ud+5PSIsNYu+zDB+8HafcAlBP
	OQNfn/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zP-00000002cmg-1r6m;
	Thu, 09 May 2024 20:03:39 +0000
Received: from mail-yb1-f201.google.com ([209.85.219.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59y2-00000002bco-1O9d
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:02:30 +0000
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-de60321ce6cso2246436276.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284925; x=1715889725; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/29eLalWXltsNx6hndyMfgq88NOnPPHN/xxraS+3xSI=;
        b=vnuaKgqREDCekW5tNGbjq3p6gdSRGNUfnAYuAAGbIrckhLOBWDhFbk3HR0baXx4Xcx
         603+w7i8OJzAFaIodFUBVqr8RR3vuLrJFcyqHOwOvbU11OgyJ6Hx67/ptNpfes6DqPVr
         yYgbWlkEMxw57zKCFVFvYOuOe4dC9Sb+rq67eu27Tj8M6FzzWkDoNlLIf9Qcv3Idn254
         FeClDRr9stuEL6vk1GAc8Fcf4s4Po55uAmrOCoQHemqaewMTVLcTueq7f8ciebl6m28I
         8blw69ujgtJTel3O3yj+yB5iRIptvxaUN2Aw0ILWlEDD6Z/HObLi59KAXnMkHlfBISMX
         7grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284925; x=1715889725;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/29eLalWXltsNx6hndyMfgq88NOnPPHN/xxraS+3xSI=;
        b=EI+vlz7f//tkw1g4VK9oL/7wQEX9A5zzhODnVHttYON88bncj0LtVdGUTCvNugGlsP
         SscMQ605yKmeS68uuLAb3iAf0UTrcKqYUvVF0Ij/9E3Wi5TqyNepKLWRqdhb6TmcIH+Y
         DI9JjVYFhXsH36p+Zyj3sN7H2hHQLDWyCjdtNd3I+3/j0FSQdZAQnCtevHxrNxMUZbz8
         x2poopqI33zJu9KAi73wpvkiIh44mdX4S4rSXyRS1W4mlTwfZ7B3JhhntYkNX5hTMFwM
         IU9yqoD2IgM68e9Y2KTb0VhkFEZ9JxqqIrhbGotjimzbAwSrEgb4GS5UmJMdY77/MgTt
         P+pw==
X-Forwarded-Encrypted: i=1; AJvYcCVftNRcE5dSEZHGLwqfQKr0UvMWps+XRUbZOzpAdTlGJoUPnttQI8UlunVJCQhMvNWEgrmIKnR0DXGhczj9cFDqewhdTijX1ODkBBFpXlZi
X-Gm-Message-State: AOJu0YyS5smcBmRIyuBew8W9kW4Wcxt5E5QgbFnL0RA/36zr/5CoPYZT
	I1uhcCa3hfNmu+R05DrJciyegGz2edNAdQXIGdF5QezkJsWfw9/L+efFTRpxYMT7A++4/6AYAQu
	b3g==
X-Google-Smtp-Source: AGHT+IHvqhsF1a5vqVTCdhk4BVGmr9KgJSWsLeuEaufB/KOZhiCXbICCSASR6EHuCwVmjU5b5BugSo/1wyE=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:1027:b0:dcc:c57c:8873 with SMTP id
 3f1490d57ef6-dee4f3659c5mr141916276.9.1715284925582; Thu, 09 May 2024
 13:02:05 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:20 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-29-edliaw@google.com>
Subject: [PATCH v3 28/68] selftests/lsm: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Edward Liaw <edliaw@google.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130215_293620_3FB73675 
X-CRM114-Status: UNSURE (   8.97  )
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
ZCB0byBwcmV2ZW50CnJlZGVmaW5pdGlvbiB3YXJuaW5ncy4KCkZpeGVzOiA4MDkyMTYyMzM1NTUg
KCJzZWxmdGVzdHMvaGFybmVzczogcmVtb3ZlIHVzZSBvZiBMSU5FX01BWCIpClJldmlld2VkLWJ5
OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+ClJldmlld2VkLWJ5OiBNdWhhbW1h
ZCBVc2FtYSBBbmp1bSA8dXNhbWEuYW5qdW1AY29sbGFib3JhLmNvbT4KU2lnbmVkLW9mZi1ieTog
RWR3YXJkIExpYXcgPGVkbGlhd0Bnb29nbGUuY29tPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2xzbS9jb21tb24uYyAgICAgICAgICAgICAgICAgfCAyIC0tCiB0b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9sc20vbHNtX2dldF9zZWxmX2F0dHJfdGVzdC5jIHwgMiAtLQogdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvbHNtL2xzbV9saXN0X21vZHVsZXNfdGVzdC5jICB8IDIgLS0KIHRvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2xzbS9sc21fc2V0X3NlbGZfYXR0cl90ZXN0LmMgfCAyIC0tCiA0IGZp
bGVzIGNoYW5nZWQsIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvbHNtL2NvbW1vbi5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbHNtL2NvbW1v
bi5jCmluZGV4IDlhZDI1ODkxMjY0Ni4uMWIxOGFhYzU3MGYxIDEwMDY0NAotLS0gYS90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9sc20vY29tbW9uLmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvbHNtL2NvbW1vbi5jCkBAIC00LDggKzQsNiBAQAogICoKICAqIENvcHlyaWdodCDCqSAyMDIz
IENhc2V5IFNjaGF1ZmxlciA8Y2FzZXlAc2NoYXVmbGVyLWNhLmNvbT4KICAqLwotCi0jZGVmaW5l
IF9HTlVfU09VUkNFCiAjaW5jbHVkZSA8bGludXgvbHNtLmg+CiAjaW5jbHVkZSA8ZmNudGwuaD4K
ICNpbmNsdWRlIDxzdHJpbmcuaD4KZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2xzbS9sc21fZ2V0X3NlbGZfYXR0cl90ZXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9s
c20vbHNtX2dldF9zZWxmX2F0dHJfdGVzdC5jCmluZGV4IGRmMjE1ZTRhYTYzZi4uNzQ2NWJkZTNm
OTIyIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sc20vbHNtX2dldF9zZWxm
X2F0dHJfdGVzdC5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xzbS9sc21fZ2V0X3Nl
bGZfYXR0cl90ZXN0LmMKQEAgLTUsOCArNSw2IEBACiAgKgogICogQ29weXJpZ2h0IMKpIDIwMjIg
Q2FzZXkgU2NoYXVmbGVyIDxjYXNleUBzY2hhdWZsZXItY2EuY29tPgogICovCi0KLSNkZWZpbmUg
X0dOVV9TT1VSQ0UKICNpbmNsdWRlIDxsaW51eC9sc20uaD4KICNpbmNsdWRlIDxmY250bC5oPgog
I2luY2x1ZGUgPHN0cmluZy5oPgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
bHNtL2xzbV9saXN0X21vZHVsZXNfdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbHNt
L2xzbV9saXN0X21vZHVsZXNfdGVzdC5jCmluZGV4IDA2ZDI0ZDQ2NzlhNi4uYTZiNDRlMjVjMjFm
IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sc20vbHNtX2xpc3RfbW9kdWxl
c190ZXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbHNtL2xzbV9saXN0X21vZHVs
ZXNfdGVzdC5jCkBAIC01LDggKzUsNiBAQAogICoKICAqIENvcHlyaWdodCDCqSAyMDIyIENhc2V5
IFNjaGF1ZmxlciA8Y2FzZXlAc2NoYXVmbGVyLWNhLmNvbT4KICAqLwotCi0jZGVmaW5lIF9HTlVf
U09VUkNFCiAjaW5jbHVkZSA8bGludXgvbHNtLmg+CiAjaW5jbHVkZSA8c3RyaW5nLmg+CiAjaW5j
bHVkZSA8c3RkaW8uaD4KZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xzbS9s
c21fc2V0X3NlbGZfYXR0cl90ZXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sc20vbHNt
X3NldF9zZWxmX2F0dHJfdGVzdC5jCmluZGV4IDY2ZGVjNDdlM2NhMy4uMTEwYzZhMDdlNzRjIDEw
MDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sc20vbHNtX3NldF9zZWxmX2F0dHJf
dGVzdC5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xzbS9sc21fc2V0X3NlbGZfYXR0
cl90ZXN0LmMKQEAgLTUsOCArNSw2IEBACiAgKgogICogQ29weXJpZ2h0IMKpIDIwMjIgQ2FzZXkg
U2NoYXVmbGVyIDxjYXNleUBzY2hhdWZsZXItY2EuY29tPgogICovCi0KLSNkZWZpbmUgX0dOVV9T
T1VSQ0UKICNpbmNsdWRlIDxsaW51eC9sc20uaD4KICNpbmNsdWRlIDxzdHJpbmcuaD4KICNpbmNs
dWRlIDxzdGRpby5oPgotLSAKMi40NS4wLjExOC5nN2ZlMjljOThkNy1nb29nCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
