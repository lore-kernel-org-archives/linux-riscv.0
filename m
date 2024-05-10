Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C46C25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PdRi8phUnQbulHpcfM6emZX8tsqWynMGG5r8zym0Y/E=; b=J0NjrCN4sv+ETUzkRcDTcexGFj
	o969vo1LAuBkNoKO6wnF3bbZk5g6FdqMcgZvKff0zbfUMN9BvYx7nz0noEb/sYvZ/AZA04iWcIi95
	QZGmDguI+75WwJtN3c29F86ATT66eZTMOn0+4kmJy12qjWc6u8WH5IqkH1VX/1G7PZaZm2oshzRWr
	Tg6ivG0Y8vQHwFw+itPciDBLzMKQrLoETMf43+ygysarxcH/bpt1+zbCAkPq9DG+cel5ZQaptYcM3
	+9J+AiZlPPyRYIjtRCistZxBIYF9nMhO57GwNa4N4AfyQBiD1036YeNBM5H0hNv9d6LNQhP2bZihw
	KhPyV5Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Esr-00000003amM-1mkA;
	Fri, 10 May 2024 01:17:13 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dq4-00000003N9Y-418P
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:10:27 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-61c9675ae5aso23913287b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299813; x=1715904613; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tmh402qCNlwXH2YaTj4ydVf0xBV6O03FHXYL91hE1gk=;
        b=qLhzn+lOO5k566qlP89wJP+4WBgrf4P2OPa+fDyh84O4qye9VD4VIgstaaaG6kPZof
         7izief/T9kF3UH3RUdBisBsJbpc7yVih6zJ0DCGm3X2ySfO2tO0RAhYl05bW9FNGaMdZ
         BZI3WMTdMSRHgjYPNuxK6f2UTNaHw5H4QLHWOx4QlRnJMeIHOoZy4fF+n/HBZHMo75oA
         0OUwWl+kyIDZLReHLSyC0pCAcoH115ZkMY+Pqf6U4scdnhhILcQ/LNhECKQeYKTDhJQE
         I4Z54FLxPrP597yIPoFQ3JGF6Mse4EA16HsUJUAvmUcfCGWbeoq+4H9T9CZiPv5m7sEa
         z3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299813; x=1715904613;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tmh402qCNlwXH2YaTj4ydVf0xBV6O03FHXYL91hE1gk=;
        b=dvGvg9noxfO/2aEFUaaBj6feU6VT4dpXOqnjntUDIUNjNDzB7VfCkVDfoaJ88w5nUe
         enJVjD1DGbiyLWLSDsU3x2vouFFYs/pKL8YufIZopw3VShKzuw2D7JCHuY4+5q834W05
         luyV3/gjn+vDyL239J9eOiQhwa6T2O4YTMqtEVTfiamwB058JIr2Q+NMBOrUpppohs/z
         eCr9YfuhjIbCkUumbasni1/xbOfhRjZQoFWE7iOvcAx1+xBU8Gm9WEIwNzmUAUGNWemb
         0AxJILOznfH33OslZU4EX3pCjxmtIBcfP02e9/CjT0LJBDOWAgJk1kZSGl486nE7yd9c
         iGLw==
X-Forwarded-Encrypted: i=1; AJvYcCUBU1DpCaAVidsRAGngPgCse8NDpXshwFAg+F2uqF4rMIyRvBaGtmW9YPptqYtiYJ+anaWMBelmggMYVYwMPEfN1N2J83t4vkpwIFSt/8WJ
X-Gm-Message-State: AOJu0Yz5Rfwr5KAzcafCYYP9sGumWRF7+7zPgbYpgTvq0g1ekMmePYDO
	Ksc5YQ+lx3Z4+95SAB10QbwmhRzMNiB0Qbq1y/sDHpwoNQ8FEK4ToacoocWdIVXnXnps0vaK+lh
	xxw==
X-Google-Smtp-Source: AGHT+IG3cHhi3l/PsMh03xlUUaL0xaqZZdF1Mw4jw0r1lBZXsRFFIr6qUwnHrRToq2hjUiJ8fGM23U+/biY=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:690c:6211:b0:618:8bdf:9d56 with SMTP id
 00721157ae682-622afffb2b1mr2643407b3.7.1715299813350; Thu, 09 May 2024
 17:10:13 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:42 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-26-edliaw@google.com>
Subject: [PATCH v4 25/66] selftests/landlock: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240509_171017_311380_C5ACB051 
X-CRM114-Status: UNSURE (   7.86  )
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
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9sYW5kbG9jay9mc190ZXN0LmMKaW5kZXggNmI1YTlmZjg4YzNk
Li5lZWMwZDlhNDRkNTAgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xhbmRs
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
IDxsaW51eC9sYW5kbG9jay5oPgotLSAKMi40NS4wLjExOC5nN2ZlMjljOThkNy1nb29nCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
