Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AB6C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EoZ1GrQE8ZF3suamUi1xGfKndqmigxneJjC/UUjj9Ng=; b=UNMvkBlWA/3WvwgoU9R71gJerX
	SOeHTr/bIMy/I0cCb5tbfrskr2XaFfSGnPmmcQU+k5OGmvMi7+nLT3DWGFCVW5ievhhuoW9JspCbC
	6BbA5pH5tgaF63y178JYTz1nAxEAe5jRonXGwk4jpsJrOc/n7d/CkAicPPZJSdbjZwLa1BMWWbruC
	VTdAbYRNAaa6zwwfNI9AWqr8bZgkLujINUNCekQW6M2tuaXuBRqcbJuXr84/G8hkmjaVZ0aHq2vrW
	ee3tTGCilN6oQF6sKcBbk0U3uNSQi5ddxFkJEre/cZynpcqc+QPa8I/Ppcy1p6mNo2HBuktFDRnoC
	V0cB0/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aO7-00000001VXm-3mRa;
	Wed, 22 May 2024 01:03:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMe-00000001UY5-1TNu
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 May 2024 01:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=KXwO0L9UP+8QZMVBOIJm+VyqQgH3dRfMq6r9an6EFTA=; b=puZR2USD6H4ZAh6ZO39zHQU2dS
	YXHXeBi5DMPT8hy978xC1V9O4VSuMufuRgOz3AFfowQNoNR5RTyv+ZquRue2/4J1VPreRdW/9xojR
	NPDFjko+pJ7x4BrD2V6nWAkXBAbxNMUr4piumZIlV+wXM/KTkMiPH4qEsfYt/Ssi/0kTLEs7O/jio
	QAUfmzoIaJV6mTDOv8fHqoej01UFC0/VlXVgXSbtxSLDeTneAAtv0mcBBLi81ekLpzUNaTUtluKXQ
	rgLu3L77LrLe/YQPjvpwN+MN0muWFw+OtgPS3o6S2N3LCyV4mq4uGZnjp8VHLY+5SYAwRM3dh7+WO
	T1VPbQlA==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMX-00000000B06-3D0m
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:01:54 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-df4e54990fbso57381276.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339645; x=1716944445; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXwO0L9UP+8QZMVBOIJm+VyqQgH3dRfMq6r9an6EFTA=;
        b=XY1EQ46ktm2uW6Yw07XBvmo9ylYpmx1Gtcm0LNl7Hv8yuTkUDcBsx0WkKKxbzox3o4
         jtVMmb+pGIx//9IRbIuXIABZ4SRJTjDiWspOJ/eH9ReOSO0X5HWozPMLskiDNPFGrNAg
         0WoRqnTQ550F4p+bKQoC3d0hqgUyiJuX8HwWPi7iZlnEgX+cDvpC1lbyckg0lRHMPvcv
         TU4CMXTeucMSn568i4nUa3BAz4jGgbyHSdUTzQh8twwNX89BdHMhIRBQkJS4XDOPh8Ps
         1xZRDxFW6btOigkPwcodfsppnqozirYtE2KEu5yFZ35sl+iOtEdqRhpKeRkNTHz7y6An
         Cv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339645; x=1716944445;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KXwO0L9UP+8QZMVBOIJm+VyqQgH3dRfMq6r9an6EFTA=;
        b=v7NLkdOmBnn3AN2Yllzi1+VYmU0RFXPyNlrKlzMvjEkXmlaOCCLERHeFpheQkMbLnJ
         9mr2DKfgI7gI2zFsI49NnPvCqOwGCryCTqt5rprsj/3NevBVMr3f1AzjaR+Ulrc12prJ
         /sWvGrRdxAVGCD96eiT28Jy+EZVJZMdssXDy4s4qP3oRZOwN0u+hBeyN3TQfgYscoXOQ
         WDtmrZWbbUNeLukfghIS7oMJlzGQTOfAcCMI9LtfVKU2VH0quXQwrhjBOClDvBE71nH7
         kKumS7zRejO0jnLd+S6q59vuB6Q2TpYbnruR/AkDRKy4IIrBI8nAl7Rzj9Fbh+OcOUpY
         PzYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyswz+2dsnS0Sbe/tc61DrLc0P+qniyljvnLOt4UK1mLoNvC+5bFzU//jD1SrWDjyLvuKn/s9hsBv6yLFHXeMiTLGZLE1J4A9L46mWq2L0
X-Gm-Message-State: AOJu0YwkVkFDFetQQCt8n1WfUTPVwSw1O9W6HdeoKxbO1w7812pdqHGQ
	pl1gsjGAuEEqrIKoI0SzKQm5JnQMiKDqOjabBnt7THdQ5m79wgZMdmu05zbdx+th9Trg2wdvkFl
	B9A==
X-Google-Smtp-Source: AGHT+IGq5EkCYZMZ8kSZUDy4QXD5Fy/Txkil5cxAziOoCq+wpprVpOx9voNzKq36ByPvzM1vyjQE12KOztw=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:1143:b0:dc6:e5d3:5f03 with SMTP id
 3f1490d57ef6-df4e0ab187fmr228918276.4.1716339645152; Tue, 21 May 2024
 18:00:45 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:13 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-28-edliaw@google.com>
Subject: [PATCH v5 27/68] selftests/lsm: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_020150_072190_D0C2FEA9 
X-CRM114-Status: UNSURE (   6.79  )
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
YXcgPGVkbGlhd0Bnb29nbGUuY29tPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xzbS9j
b21tb24uYyAgICAgICAgICAgICAgICAgfCAyIC0tCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9s
c20vbHNtX2dldF9zZWxmX2F0dHJfdGVzdC5jIHwgMiAtLQogdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvbHNtL2xzbV9saXN0X21vZHVsZXNfdGVzdC5jICB8IDIgLS0KIHRvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2xzbS9sc21fc2V0X3NlbGZfYXR0cl90ZXN0LmMgfCAyIC0tCiA0IGZpbGVzIGNoYW5n
ZWQsIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
bHNtL2NvbW1vbi5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbHNtL2NvbW1vbi5jCmluZGV4
IDlhZDI1ODkxMjY0Ni4uMWIxOGFhYzU3MGYxIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9sc20vY29tbW9uLmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbHNtL2Nv
bW1vbi5jCkBAIC00LDggKzQsNiBAQAogICoKICAqIENvcHlyaWdodCDCqSAyMDIzIENhc2V5IFNj
aGF1ZmxlciA8Y2FzZXlAc2NoYXVmbGVyLWNhLmNvbT4KICAqLwotCi0jZGVmaW5lIF9HTlVfU09V
UkNFCiAjaW5jbHVkZSA8bGludXgvbHNtLmg+CiAjaW5jbHVkZSA8ZmNudGwuaD4KICNpbmNsdWRl
IDxzdHJpbmcuaD4KZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xzbS9sc21f
Z2V0X3NlbGZfYXR0cl90ZXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sc20vbHNtX2dl
dF9zZWxmX2F0dHJfdGVzdC5jCmluZGV4IGRmMjE1ZTRhYTYzZi4uNzQ2NWJkZTNmOTIyIDEwMDY0
NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sc20vbHNtX2dldF9zZWxmX2F0dHJfdGVz
dC5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xzbS9sc21fZ2V0X3NlbGZfYXR0cl90
ZXN0LmMKQEAgLTUsOCArNSw2IEBACiAgKgogICogQ29weXJpZ2h0IMKpIDIwMjIgQ2FzZXkgU2No
YXVmbGVyIDxjYXNleUBzY2hhdWZsZXItY2EuY29tPgogICovCi0KLSNkZWZpbmUgX0dOVV9TT1VS
Q0UKICNpbmNsdWRlIDxsaW51eC9sc20uaD4KICNpbmNsdWRlIDxmY250bC5oPgogI2luY2x1ZGUg
PHN0cmluZy5oPgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbHNtL2xzbV9s
aXN0X21vZHVsZXNfdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbHNtL2xzbV9saXN0
X21vZHVsZXNfdGVzdC5jCmluZGV4IDA2ZDI0ZDQ2NzlhNi4uYTZiNDRlMjVjMjFmIDEwMDY0NAot
LS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sc20vbHNtX2xpc3RfbW9kdWxlc190ZXN0LmMK
KysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbHNtL2xzbV9saXN0X21vZHVsZXNfdGVzdC5j
CkBAIC01LDggKzUsNiBAQAogICoKICAqIENvcHlyaWdodCDCqSAyMDIyIENhc2V5IFNjaGF1Zmxl
ciA8Y2FzZXlAc2NoYXVmbGVyLWNhLmNvbT4KICAqLwotCi0jZGVmaW5lIF9HTlVfU09VUkNFCiAj
aW5jbHVkZSA8bGludXgvbHNtLmg+CiAjaW5jbHVkZSA8c3RyaW5nLmg+CiAjaW5jbHVkZSA8c3Rk
aW8uaD4KZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xzbS9sc21fc2V0X3Nl
bGZfYXR0cl90ZXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sc20vbHNtX3NldF9zZWxm
X2F0dHJfdGVzdC5jCmluZGV4IDY2ZGVjNDdlM2NhMy4uMTEwYzZhMDdlNzRjIDEwMDY0NAotLS0g
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sc20vbHNtX3NldF9zZWxmX2F0dHJfdGVzdC5jCisr
KyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xzbS9sc21fc2V0X3NlbGZfYXR0cl90ZXN0LmMK
QEAgLTUsOCArNSw2IEBACiAgKgogICogQ29weXJpZ2h0IMKpIDIwMjIgQ2FzZXkgU2NoYXVmbGVy
IDxjYXNleUBzY2hhdWZsZXItY2EuY29tPgogICovCi0KLSNkZWZpbmUgX0dOVV9TT1VSQ0UKICNp
bmNsdWRlIDxsaW51eC9sc20uaD4KICNpbmNsdWRlIDxzdHJpbmcuaD4KICNpbmNsdWRlIDxzdGRp
by5oPgotLSAKMi40NS4xLjI4OC5nMGUwY2QyOTlmMS1nb29nCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
