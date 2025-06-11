Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6779C71135
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aW+rn96JWmNL7oemWHbqcxvacFuxRi7ahBJ0MtHCxvM=; b=pda15x4O8PRND/
	M/W/cGu3tH5p3kKJlzNovOq1jCsF42N+2NfXUKBWNvPVcbPIo21oB2XUM1xUNikRYZ61KYqnMPA2k
	VTY5ckXHYdJ3e0P/HWRvW/7/K49pto6L+vRCjBqgt5oGK4/dNMHZxohqKuJDQ4Ka3xzMQRvFkEV2E
	MIxxSFeMBQIIGCJMIlwNA6Ro7QLVLGUaztAoAgH6LWFIfxXQ4UMYzeSUIk6MUrbDnMfpxYkiI8P3X
	jvrygDkMlKI8h2Dv/qZNval2sNhNKw6jaHJfm0+5Nh8YUQmm1LZtFL7MOCp6xiSf08zCkdIXIlXXj
	LWKFyDQb6+0rzbAzvPjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGQD-00000009Bkr-0Bob;
	Wed, 11 Jun 2025 08:02:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2t-000000097sz-42pq
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 07:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ASaFKtTomPi+O0p6+4d6hkjh0TrYrUSZldDYJPbgnvI=; b=cY58X7IrAYeKyC8IRI9sQZcjY8
	39BcIbrSKIYCo118a3v13ZRGQE+2eNfQ9QvLpimK3+HvPBCk7aalMHVHxESYUIov4Ei5KOHURQFh7
	FvBUiIuFkPT19Bh6NVzuoS0dWc1AZq+prAJWFi+XBgbif4rWPuBZWjef6ecUxXsQS1xJMoFSbRf5/
	2APgUlwmon14Hr5oB0kZSoUd0mgxfLM6RJb7qylDTiA5dOVklc9bTLya/DvDNSD9kV6xyxJKn91oo
	OGiqRDRBhrPbKd1YdPfDiC2EtszlVGLy32u2TSjrg/tBsvYbWetDEnUWZwzs5vXt/mAxiJEysWl3V
	XIJQhp2g==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2r-00000002ACA-2kGM
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 07:38:51 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749627515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ASaFKtTomPi+O0p6+4d6hkjh0TrYrUSZldDYJPbgnvI=;
	b=zzlZDAndtBm8zhTNt7cGQbdwfhW2KoUwXGuCO25lMgB7zxRoPlqMT3C58WvTfEfHi3XUbS
	NU8I44a7cs7ct83ZIFE7zhJktuDhOYINj8ov5WSstoE5U5GGFMfece2QpMclyrNiP3L199
	IHMNMlhHgsM2CLVM0VxEhNpv77cEjdSD02v9maMhoz+bdlI/nBI6Fe9HRbW/UpKOi2uYol
	kJRAagAGZ5Tt6HS/t79ozirsRUavM36M41gInToTvMn6ihHdlelnI7Roiv+lo3AeJrxuC9
	ymdaKxzbHcbBGFgY/X0WZZXNAbaKLWLLYSbF8l8+gLjPnVHeyOfpQBUIMN0iog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749627515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ASaFKtTomPi+O0p6+4d6hkjh0TrYrUSZldDYJPbgnvI=;
	b=6LiWGfLR9zUtuqZZovALvZ0fcMP/X0JLFGGbVyv3HogGVzipEIDnXMws5pw8BBpDzWZSXs
	MDzbTF4lNHPTaxDg==
Date: Wed, 11 Jun 2025 09:38:15 +0200
Subject: [PATCH v3 09/16] kunit: tool: Don't overwrite test status based on
 subtest counts
MIME-Version: 1.0
Message-Id: <20250611-kunit-kselftests-v3-9-55e3d148cbc6@linutronix.de>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
In-Reply-To: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nicolas Schier <nicolas.schier@linux.dev>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 workflows@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749627510; l=2733;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=FZfj35XystYEPz6f/lxQAJk1DAHaROG5oImBgsaZQ2g=;
 b=rbSRPrWrHfCqEogOmtiX3FUvOIW2ud6MKv1OAWG0SHmG4ZYHwNjEZpRqQ1xF+wwZ8wCGy8L14
 pq+FrfzahUXAvlcC1y0/RcdSnpkkxKb23cZS8Ody+e6CmwWvGO+K4ld
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_083849_863715_091C8EAD 
X-CRM114-Status: GOOD (  10.89  )
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

SWYgYSBzdWJ0ZXN0IGl0c2VsZiByZXBvcnRzIHN1Y2Nlc3MsIGJ1dCB0aGUgb3V0ZXIgdGVzdGNh
c2UgZmFpbHMsCnRoZSB3aG9sZSB0ZXN0Y2FzZSBzaG91bGQgYmUgcmVwb3J0ZWQgYXMgYSBmYWls
dXJlLgpIb3dldmVyIHRoZSBzdGF0dXMgaXMgcmVjYWxjdWxhdGVkIGJhc2VkIG9uIHRoZSB0ZXN0
IGNvdW50cywKb3ZlcndyaXRpbmcgdGhlIG91dGVyIHRlc3QgcmVzdWx0LgpTeW50aGVzaXplIGEg
ZmFpbGVkIHRlc3QgaW4gdGhpcyBjYXNlIHRvIG1ha2Ugc3VyZSB0aGUgZmFpbHVyZSBpcyBub3QK
c3dhbGxvd2VkLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlz
c3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogdG9vbHMvdGVzdGluZy9rdW5pdC9rdW5pdF9wYXJz
ZXIucHkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA1ICsrKysrCiB0b29scy90
ZXN0aW5nL2t1bml0L2t1bml0X3Rvb2xfdGVzdC5weSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDIgKy0KIHRvb2xzL3Rlc3Rpbmcva3VuaXQvdGVzdF9kYXRhL3Rlc3RfaXNfdGVzdF9w
YXNzZWQtZmFpbHVyZS1uZXN0ZWQubG9nIHwgMyArKysKIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9rdW5p
dC9rdW5pdF9wYXJzZXIucHkgYi90b29scy90ZXN0aW5nL2t1bml0L2t1bml0X3BhcnNlci5weQpp
bmRleCBjMTc2NDg3MzU2ZTZjOTQ4ODIwNDZiMTllYTY5NmQ3NTA5MDViOGQ1Li4yNDc4YmViMjhm
YzNkYjgyNTg1NWFkNDYyMDAzNDBlODg0ZGE3ZGYxIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5n
L2t1bml0L2t1bml0X3BhcnNlci5weQorKysgYi90b29scy90ZXN0aW5nL2t1bml0L2t1bml0X3Bh
cnNlci5weQpAQCAtNjg2LDYgKzY4NiwxMSBAQCBkZWYgYnViYmxlX3VwX3Rlc3RfcmVzdWx0cyh0
ZXN0OiBUZXN0KSAtPiBOb25lOgogCQljb3VudHMuYWRkX3N0YXR1cyhzdGF0dXMpCiAJZWxpZiB0
ZXN0LmNvdW50cy5nZXRfc3RhdHVzKCkgPT0gVGVzdFN0YXR1cy5URVNUX0NSQVNIRUQ6CiAJCXRl
c3Quc3RhdHVzID0gVGVzdFN0YXR1cy5URVNUX0NSQVNIRUQKKwlpZiBub3QgdGVzdC5va19zdGF0
dXMoKToKKwkJZm9yIHQgaW4gc3VidGVzdHM6CisJCQlpZiBub3QgdC5va19zdGF0dXMoKToKKwkJ
CQljb3VudHMuYWRkX3N0YXR1cyh0LnN0YXR1cykKKwkJCQlicmVhawogCiBkZWYgcGFyc2VfdGVz
dChsaW5lczogTGluZVN0cmVhbSwgZXhwZWN0ZWRfbnVtOiBpbnQsIGxvZzogTGlzdFtzdHJdLCBp
c19zdWJ0ZXN0OiBib29sLCBwcmludGVyOiBQcmludGVyKSAtPiBUZXN0OgogCSIiIgpkaWZmIC0t
Z2l0IGEvdG9vbHMvdGVzdGluZy9rdW5pdC9rdW5pdF90b29sX3Rlc3QucHkgYi90b29scy90ZXN0
aW5nL2t1bml0L2t1bml0X3Rvb2xfdGVzdC5weQppbmRleCA2OTFjZGU5YjAzMGY3NzI5MTI4NDkw
YzFiZGI0MmNjZWUxOTY3YWQ2Li5jMjVmNTI2NTA4MzdlODMzMjViMDZiZGRkMmFhNjY1ZmQyOWY5
MWQ5IDEwMDc1NQotLS0gYS90b29scy90ZXN0aW5nL2t1bml0L2t1bml0X3Rvb2xfdGVzdC5weQor
KysgYi90b29scy90ZXN0aW5nL2t1bml0L2t1bml0X3Rvb2xfdGVzdC5weQpAQCAtMTcwLDcgKzE3
MCw3IEBAIGNsYXNzIEtVbml0UGFyc2VyVGVzdCh1bml0dGVzdC5UZXN0Q2FzZSk6CiAJCXdpdGgg
b3BlbihuZXN0ZWRfbG9nKSBhcyBmaWxlOgogCQkJcmVzdWx0ID0ga3VuaXRfcGFyc2VyLnBhcnNl
X3J1bl90ZXN0cyhmaWxlLnJlYWRsaW5lcygpLCBzdGRvdXQpCiAJCXNlbGYuYXNzZXJ0RXF1YWwo
a3VuaXRfcGFyc2VyLlRlc3RTdGF0dXMuRkFJTFVSRSwgcmVzdWx0LnN0YXR1cykKLQkJc2VsZi5h
c3NlcnRFcXVhbChyZXN1bHQuY291bnRzLmZhaWxlZCwgMikKKwkJc2VsZi5hc3NlcnRFcXVhbChy
ZXN1bHQuY291bnRzLmZhaWxlZCwgMykKIAkJc2VsZi5hc3NlcnRFcXVhbChrdW5pdF9wYXJzZXIu
VGVzdFN0YXR1cy5GQUlMVVJFLCByZXN1bHQuc3VidGVzdHNbMF0uc3RhdHVzKQogCQlzZWxmLmFz
c2VydEVxdWFsKGt1bml0X3BhcnNlci5UZXN0U3RhdHVzLkZBSUxVUkUsIHJlc3VsdC5zdWJ0ZXN0
c1sxXS5zdGF0dXMpCiAKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcva3VuaXQvdGVzdF9kYXRh
L3Rlc3RfaXNfdGVzdF9wYXNzZWQtZmFpbHVyZS1uZXN0ZWQubG9nIGIvdG9vbHMvdGVzdGluZy9r
dW5pdC90ZXN0X2RhdGEvdGVzdF9pc190ZXN0X3Bhc3NlZC1mYWlsdXJlLW5lc3RlZC5sb2cKaW5k
ZXggODM1ODE2ZTBhMDc3MTVhNTE0ZjVmNWFmYWIxYjYyNTAwMzdmZWFmNC4uY2Q5MDMzYzQ2NDc5
MmU2Mjk0OTA1YTU2NzYzNDY2ODQxODI4NzRhZCAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9r
dW5pdC90ZXN0X2RhdGEvdGVzdF9pc190ZXN0X3Bhc3NlZC1mYWlsdXJlLW5lc3RlZC5sb2cKKysr
IGIvdG9vbHMvdGVzdGluZy9rdW5pdC90ZXN0X2RhdGEvdGVzdF9pc190ZXN0X3Bhc3NlZC1mYWls
dXJlLW5lc3RlZC5sb2cKQEAgLTEsNSArMSw4IEBACiBLVEFQIHZlcnNpb24gMQogMS4uMgorICAg
IEtUQVAgdmVyc2lvbiAxCisgICAgMS4uMQorICAgICAgICBvayAxIHRlc3QgMQogbm90IG9rIDEg
c3VidGVzdCAxCiAgICAgS1RBUCB2ZXJzaW9uIDEKICAgICAxLi4xCgotLSAKMi40OS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
