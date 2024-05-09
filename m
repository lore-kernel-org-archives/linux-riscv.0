Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD6DC25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0fHbCiFAeX9wg6b5pXtyPc1yuJ/9S4WQjeR1wZYbZfQ=; b=gqRcLEI2TDKnPmpq0uQF6k61vT
	OaGf7FwTeYgcFV2Kyzf2eL2hIgBkHMBZsDNJLrNdztk7BmCS6+7uCR9H9ks6ZsZTDhBOZaepZvnTd
	jtrEgQJ1nlXqz0AsBRhlZ0lO+vlL335GqBm7aDe18P31QUIXGe955Q1jwweeCIdF9CUygdKwSrqST
	qPOqpFmO1xKsiD+i9jz2RDKLf9ueLOmvtr6trZD9qjtxFeyB9quJe8+/MFVAQVMDWQJ5VDlag9Wwh
	nY9SF3N4p1mTU4wbY5fsVzNFQjf83JqLQGZRp6+INDYbVl0q1CEJKiJobWwaqCkhGZtFJ1zI6oQdd
	9VFRkNtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5A0z-00000002drX-0y3A;
	Thu, 09 May 2024 20:05:17 +0000
Received: from mail-pf1-f201.google.com ([209.85.210.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59y1-00000002baZ-1qNy
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:02:24 +0000
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-6ee128aa957so1306105b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284923; x=1715889723; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F47u4j3b3GFOE9nBbPizFblW4KN5wlKfs78lSrCeF6g=;
        b=qbon8rt4a/sXp3m3QEEU33hTDcMHa6tUexSo5DTLpNSJKNO6ySADQAUf3JTuYTaqKr
         uHFul8DWNWpGKslhyRyPl90udyhpEaGaDT0tL/NV09rf/mPDkF0wu9jbtG/EgutfsTC8
         wmKfTQ4l0lqs/k3qQznKRS1ueDdbIo6uPTlBY7JKEXQrUB94UMcGiepWkY0Tm7kK1vyq
         57hHDdKTOJDDw0aNzhP+EhSBNTM4AkDoiZ8NmWlMt+fApGREqut3k8sv9d/1mRF3hnMT
         7AwTDmds1DGRNzcpTEltePpFHXF2tyuOs82bqOsMaMogx5IeVReG6kBJDdJ5vYRKlh8d
         Mbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284923; x=1715889723;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F47u4j3b3GFOE9nBbPizFblW4KN5wlKfs78lSrCeF6g=;
        b=jzP3sTsbaevzHDfKlOIVdYxMvMDZaO61diQb/cLp2Ka6HlfOHiH20yyfVHw9xWpkhE
         ln5gUgtE1rmcOgM03Eu/qLOPJqleas1QBJ+ciwyHBd+7thoFDPuux83wUenRmuAJYiwA
         er9PPvjwtW4EhdMx7kKQLmS2gmapjVnsjhu4hKYga5/NmJyZSs+er5wQ2X9xaqa0ZHTP
         wyQPRlBAa+I/NxVc4Ml9maSYpUg7WqEi5qKh/Uz3VXI8D41OPGj3Yl5dkdswJ77aFkTY
         G8OVTG4CyONGm/5UV7x/qJgviDk6zUa85I3cggWbRXPDydHGPAXYOFzmgEIrs9Ze5FZQ
         y/Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVEcKbo2T9zVwD9GYoBSEQAxApJkED7LS3DHEsfoaPqwcZm6eUb4wu6MrKabkdWhtftp6UYFYD6b+tzibZctj4NgBID6rVQ1rPw92SwZMUV
X-Gm-Message-State: AOJu0YxpbDX9aoBQs2bBIV3ildGyZ2R+iIhvj+k0zqWbJP7uxrpU0efQ
	Sh7hORMxXdHxxiZ9V5KuXb81IcV2ybmrbJsPVmGns5kE5XWfTyrwy7LiPx8HkEUGsXxvXwObAEu
	3Iw==
X-Google-Smtp-Source: AGHT+IEwxeU3tl/HtqsMnTJkYdZr1n57m7vtfQ4Aif9keJqoN/Cra4P1os0zNIz+mmvEABVwiFWGOQCjS4g=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:4b03:b0:6f3:84f4:78e4 with SMTP id
 d2e1a72fcca58-6f4e03a9522mr1248b3a.4.1715284922572; Thu, 09 May 2024 13:02:02
 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:19 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-28-edliaw@google.com>
Subject: [PATCH v3 27/68] selftests/landlock: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Edward Liaw <edliaw@google.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130214_011202_29DD3878 
X-CRM114-Status: UNSURE (   8.87  )
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
c3RzL2xhbmRsb2NrL2Jhc2VfdGVzdC5jICAgfCAyIC0tCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9sYW5kbG9jay9mc190ZXN0LmMgICAgIHwgMiAtLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
bGFuZGxvY2svbmV0X3Rlc3QuYyAgICB8IDIgLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xh
bmRsb2NrL3B0cmFjZV90ZXN0LmMgfCAyIC0tCiA0IGZpbGVzIGNoYW5nZWQsIDggZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbGFuZGxvY2svYmFzZV90
ZXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sYW5kbG9jay9iYXNlX3Rlc3QuYwppbmRl
eCAzYzFlOWYzNWI1MzEuLmM4NmU2Zjg3YjM5OCAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvbGFuZGxvY2svYmFzZV90ZXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvbGFuZGxvY2svYmFzZV90ZXN0LmMKQEAgLTUsOCArNSw2IEBACiAgKiBDb3B5cmlnaHQgwqkg
MjAxNy0yMDIwIE1pY2thw6tsIFNhbGHDvG4gPG1pY0BkaWdpa29kLm5ldD4KICAqIENvcHlyaWdo
dCDCqSAyMDE5LTIwMjAgQU5TU0kKICAqLwotCi0jZGVmaW5lIF9HTlVfU09VUkNFCiAjaW5jbHVk
ZSA8ZXJybm8uaD4KICNpbmNsdWRlIDxmY250bC5oPgogI2luY2x1ZGUgPGxpbnV4L2xhbmRsb2Nr
Lmg+CmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sYW5kbG9jay9mc190ZXN0
LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sYW5kbG9jay9mc190ZXN0LmMKaW5kZXggNmI1
YTlmZjg4YzNkLi5lZWMwZDlhNDRkNTAgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2xhbmRsb2NrL2ZzX3Rlc3QuYworKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sYW5k
bG9jay9mc190ZXN0LmMKQEAgLTYsOCArNiw2IEBACiAgKiBDb3B5cmlnaHQgwqkgMjAyMCBBTlNT
SQogICogQ29weXJpZ2h0IMKpIDIwMjAtMjAyMiBNaWNyb3NvZnQgQ29ycG9yYXRpb24KICAqLwot
Ci0jZGVmaW5lIF9HTlVfU09VUkNFCiAjaW5jbHVkZSA8YXNtL3Rlcm1iaXRzLmg+CiAjaW5jbHVk
ZSA8ZmNudGwuaD4KICNpbmNsdWRlIDxsaWJnZW4uaD4KZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2xhbmRsb2NrL25ldF90ZXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9sYW5kbG9jay9uZXRfdGVzdC5jCmluZGV4IGYyMWNmYmJjMzYzOC4uZWVkMDQwYWRjYmFjIDEw
MDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sYW5kbG9jay9uZXRfdGVzdC5jCisr
KyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xhbmRsb2NrL25ldF90ZXN0LmMKQEAgLTUsOCAr
NSw2IEBACiAgKiBDb3B5cmlnaHQgwqkgMjAyMi0yMDIzIEh1YXdlaSBUZWNoLiBDby4sIEx0ZC4K
ICAqIENvcHlyaWdodCDCqSAyMDIzIE1pY3Jvc29mdCBDb3Jwb3JhdGlvbgogICovCi0KLSNkZWZp
bmUgX0dOVV9TT1VSQ0UKICNpbmNsdWRlIDxhcnBhL2luZXQuaD4KICNpbmNsdWRlIDxlcnJuby5o
PgogI2luY2x1ZGUgPGZjbnRsLmg+CmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9sYW5kbG9jay9wdHJhY2VfdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbGFuZGxv
Y2svcHRyYWNlX3Rlc3QuYwppbmRleCBhMTlkYjRkMGIzYmQuLmM4MzFlNmQwM2IwMiAxMDA2NDQK
LS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbGFuZGxvY2svcHRyYWNlX3Rlc3QuYworKysg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sYW5kbG9jay9wdHJhY2VfdGVzdC5jCkBAIC01LDgg
KzUsNiBAQAogICogQ29weXJpZ2h0IMKpIDIwMTctMjAyMCBNaWNrYcOrbCBTYWxhw7xuIDxtaWNA
ZGlnaWtvZC5uZXQ+CiAgKiBDb3B5cmlnaHQgwqkgMjAxOS0yMDIwIEFOU1NJCiAgKi8KLQotI2Rl
ZmluZSBfR05VX1NPVVJDRQogI2luY2x1ZGUgPGVycm5vLmg+CiAjaW5jbHVkZSA8ZmNudGwuaD4K
ICNpbmNsdWRlIDxsaW51eC9sYW5kbG9jay5oPgotLSAKMi40NS4wLjExOC5nN2ZlMjljOThkNy1n
b29nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
