Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF99AC5AE59
	for <linux-riscv@archiver.kernel.org>; Sat, 31 May 2025 18:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ob/IZWOA7covGpQU0STVbBSH5jEZ66KAxYn7ox3FQNQ=; b=EQgcpViuYgR9l2
	WzcQXjZihAc3IgWRJswEBWqJR9Jga4mVnpdxm4MBGNIL6l1JUVcW5WNt4O2GMxU82/l10AKRjF0Jl
	WoCB0hpfRZwDpjyPaZ7qI/hpAdigPti6tTV/QyD8g/FoORTAdGXdd05TS1TBD/w09+vSLJkIrJt7p
	r2zigt+7Q+4teeLp30wIpFL3evQR5vvX6hzXzSlf8zHby/i/EAzqy/PuFGUY3ZXiG1NHevXr+qJz9
	boKYlHFFa/gxVfSngAt/aKv8SVNoBSAgtPt3DI42uwgcg7DJG/wg2VjBrnFL4zCdb6zpMlC/vR2+C
	QfLyJc3CjBseQ8D/1aCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLQwG-000000048Zo-1pvH;
	Sat, 31 May 2025 18:28:12 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLQw8-000000048Z2-3TIG
	for linux-riscv@lists.infradead.org;
	Sat, 31 May 2025 18:28:10 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a3771c0f8cso1899000f8f.3
        for <linux-riscv@lists.infradead.org>; Sat, 31 May 2025 11:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748716083; x=1749320883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YdbwTnzAydK1ENdR81ZzCGwAItUOCi2suDZhdSPMmY=;
        b=k8m7smZHA2qWdsaK3Pyes/LP6ZQzHKWMAM3SkNm7WzVUqkJsaixeGRNs1CPMJuBxtd
         6npN50hg2t3Oz1bLlIfVbHEJpV1xQCT/gsuixsS4j5LsQpDBz2rxKfoAOeQXnOMotp8/
         2NGdlQPZw0K3CMNVY9wK+2kHeYEXk2RSwa9DzufnGLRbV51oV7QDhhjVo59neiGMvSMJ
         2iJgpQinlgCDYGOd46js/ucYVT13Bs3l3Kct6NEaIrW4f6YsF4PbdRQ4gQqwc2MZi2ZT
         kPEk4EA64iNQw0h+40OxFO1Npx2I+Fp7cuhZKCeVKlF2qIUX2hJd6Z54UJBFUpgfY/DP
         V6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748716083; x=1749320883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YdbwTnzAydK1ENdR81ZzCGwAItUOCi2suDZhdSPMmY=;
        b=j5i2k7GyaUAQW+oBqKdJ2OQbAgyIbIAriQq/CbbSDy4/nDSfNqNz58wWOS9mNbKYok
         NijMoK5DPZQowRaMZ06ookHkSbRCCBpe1c8cmygxWGxpwBBaSsBQp+a7TpzrPIwrA8Ps
         NJfCE1MvlinROev0ECTpPTHEz80M6gSQT+RxNU8FLQ9QS4S79h3G+5QTF1oHrwQvvdRW
         pxcpKp0AD/a4gbQR35Z8wagsAHOfrr456w71gyg7ZDpPLoeWLwxZLKZm0kruePKdgFnC
         xX0qucHMDShglsrHDJmyd99A64odFNZmL10l2kn3kkfJMal7f0Y5JGlV/7EgwH7I3PZG
         0TgQ==
X-Gm-Message-State: AOJu0YxyxKSZDyle3IIfXP27lIJRyLKKJsYlE+2CmMnqDlzgPZ9c6pX6
	VIk0C2OHIagpKT+GA4H+HPaX/vgpeIvQSUaV3kirCZ5aiIUS7qRcMZoE
X-Gm-Gg: ASbGnct1XqWAoBIo41Mdq81rzacWb0FnzR7x8qX5o62gjNgSa+DWm8lzGsx0CQlyqIp
	JXNx8hpzDt3UuHIspP4kRUCIuYMw6LF/JpdsbBANseTOH/zyoP+VJQeYW24VeOQ0ed7bFDWY1pb
	Zhy+Yl+ROvpjULYcsUs6iWX1p0nHN5Ju5sm6OoF8pjOl13a0atTK0enWhhqZWM0u+/sjM7VurPN
	Ec2Q19Bu3sDRDzuojQHp88tt9dLH+BqJObDdJxPGQmDFsefRyzObFKRab6ApqXo3pjtXn1F1yEp
	kpd94fleZOVEdLTYl7/CGJLEIf2jIGV5nyTh/2d/plzdT7bC0KM2fC59g8X3/hdROmPzeKG455d
	vusrT44l7c2nObA==
X-Google-Smtp-Source: AGHT+IHWo5ANP+dqauzoVoWuJ4LwCO1gMzfyDDlO2VCYKfnBp1d20CxKeSOkRv6fVimOUljOEpnsvw==
X-Received: by 2002:adf:a111:0:b0:3a4:f2aa:2e32 with SMTP id ffacd0b85a97d-3a4f89dcc2fmr4588914f8f.44.1748716082823;
        Sat, 31 May 2025 11:28:02 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe2b35dsm8766372f8f.0.2025.05.31.11.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 11:28:02 -0700 (PDT)
Date: Sat, 31 May 2025 19:28:01 +0100
From: David Laight <david.laight.linux@gmail.com>
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH 2/2] riscv: uaccess: do not do misaligned accesses in
 get/put_user()
Message-ID: <20250531192801.5d6329c3@pumpkin>
In-Reply-To: <20250530205658.624195-3-cleger@rivosinc.com>
References: <20250530205658.624195-1-cleger@rivosinc.com>
	<20250530205658.624195-3-cleger@rivosinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_112804_865891_56AB653C 
X-CRM114-Status: GOOD (  24.20  )
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

T24gRnJpLCAzMCBNYXkgMjAyNSAyMjo1Njo1OCArMDIwMApDbMOpbWVudCBMw6lnZXIgPGNsZWdl
ckByaXZvc2luYy5jb20+IHdyb3RlOgoKPiBEb2luZyBtaXNhbGlnbmVkIGFjY2VzcyB0byB1c2Vy
c3BhY2UgbWVtb3J5IHdvdWxkIG1ha2UgYSB0cmFwIG9uCj4gcGxhdGZvcm0gd2hlcmUgaXQgaXMg
ZW11bGF0ZWQuIExhdGVzdCBmaXhlcyByZW1vdmVkIHRoZSBrZXJuZWwKPiBjYXBhYmlsaXR5IHRv
IGRvIHVuYWxpZ25lZCBhY2Nlc3NlcyB0byB1c2Vyc3BhY2UgbWVtb3J5IHNhZmVseSBzaW5jZQo+
IGludGVycnVwdHMgYXJlIGtlcHQgZGlzYWJsZWQgYXQgYWxsIHRpbWUgZHVyaW5nIHRoYXQuIFRo
dXMgZG9pbmcgc28KPiB3b3VsZCBjcmFzaCB0aGUga2VybmVsLgo+IAo+IFN1Y2ggYmVoYXZpb3Ig
d2FzIGRldGVjdGVkIHdpdGggR0VUX1VOQUxJR05fQ1RMKCkgdGhhdCB3YXMgZG9pbmcKPiBhIHB1
dF91c2VyKCkgd2l0aCBhbiB1bnNpZ25lZCBsb25nKiBhZGRyZXNzIHRoYXQgc2hvdWxkIGhhdmUg
YmVlbiBhbgo+IHVuc2lnbmVkIGludCouIFJlZW5hYmxpbmcga2VybmVsIG1pc2FsaWduZWQgYWNj
ZXNzIGVtdWxhdGlvbiBpcyBhIGJpdAo+IHJpc2t5IGFuZCBpdCB3b3VsZCBhbHNvIGRlZ3JhZGUg
cGVyZm9ybWFuY2VzLiBSYXRoZXIgdGhhbiBkb2luZyB0aGF0LAo+IHdlIHdpbGwgdHJ5IHRvIGF2
b2lkIGFueSBtaXNhbGlnbmVkIGFjY2Vzc2VkIGJ5IHVzaW5nIGNvcHlfZnJvbS90b191c2VyKCkK
PiB3aGljaCBkb2VzIG5vdCBkbyBhbnkgbWlzYWxpZ25lZCBhY2Nlc3Nlcy4gVGhpcyBjYW4gYmUg
ZG9uZSBvbmx5IGZvcgo+ICFDT05GSUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUyBh
bmQgdGh1cyBhbGxvd3MgdG8gb25seSBnZW5lcmF0ZQo+IGEgYml0IG1vcmUgY29kZSBmb3IgdGhp
cyBjb25maWcuCgpGb3IgZ2V0X3VzZXIoKSB5b3UgYXJlIG11Y2ggYmV0dGVyIG9mZiByZWFkaW5n
IHRoZSB0d28gd29yZHMgdGhhdCBjb250YWluCnRoZSB2YWx1ZSBhbmQgdGhlbiBkb2luZyAnc2hp
ZnQnIGFuZCAnb3InIHRvIGdldCB0aGUgY29ycmVjdCB2YWx1ZS4KCkV2ZW4gZm9yIHB1dF91c2Vy
KCkgZG9pbmcgdGhlIGV4cGxpY2l0IGJ5dGUgYWNjZXNzZXMgd2lsbCBiZSBmYXN0ZXIgdGhhbgpn
b2luZyB0aG91Z2ggdGhlIGdlbmVyaWMgY29weV90by9mcm9tX3VzZXIoKSBmdW5jdGlvbi4KCglE
YXZpZAoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2lu
Yy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIHwgMjggKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS91YWNjZXNzLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+IGluZGV4
IDA0NmRlN2NlZDA5Yy4uYjU0MmMwNWYzOTRmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdWFjY2Vzcy5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91YWNjZXNz
LmgKPiBAQCAtMTY5LDggKzE2OSwyMSBAQCBkbyB7CQkJCQkJCQlcCj4gIAo+ICAjZW5kaWYgLyog
Q09ORklHXzY0QklUICovCj4gIAo+ICt1bnNpZ25lZCBsb25nIF9fbXVzdF9jaGVjayBfX2FzbV9j
b3B5X3RvX3VzZXIodm9pZCBfX3VzZXIgKnRvLAo+ICsJY29uc3Qgdm9pZCAqZnJvbSwgdW5zaWdu
ZWQgbG9uZyBuKTsKPiArdW5zaWduZWQgbG9uZyBfX211c3RfY2hlY2sgX19hc21fY29weV9mcm9t
X3VzZXIodm9pZCAqdG8sCj4gKwljb25zdCB2b2lkIF9fdXNlciAqZnJvbSwgdW5zaWduZWQgbG9u
ZyBuKTsKPiArCj4gICNkZWZpbmUgX19nZXRfdXNlcl9ub2NoZWNrKHgsIF9fZ3VfcHRyLCBsYWJl
bCkJCQlcCj4gIGRvIHsJCQkJCQkJCVwKPiArCWlmICghSVNfRU5BQkxFRChDT05GSUdfSEFWRV9F
RkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUykpIHsJCQlcCj4gKwkJaWYgKCFJU19BTElHTkVEKCh1
aW50cHRyX3QpX19ndV9wdHIsIHNpemVvZigqX19ndV9wdHIpKSkgewkJXAo+ICsJCQlpZiAoX19h
c21fY29weV9mcm9tX3VzZXIoJih4KSwgX19ndV9wdHIsIHNpemVvZigqX19ndV9wdHIpKSkJXAo+
ICsJCQkJZ290byBsYWJlbDsJCQlcCj4gKwkJCWVsc2UJCQkJCVwKPiArCQkJCWJyZWFrOwkJCQlc
Cj4gKwkJfQkJCQkJCVwKPiArCX0JCQkJCQkJXAo+ICAJc3dpdGNoIChzaXplb2YoKl9fZ3VfcHRy
KSkgewkJCQlcCj4gIAljYXNlIDE6CQkJCQkJCVwKPiAgCQlfX2dldF91c2VyX2FzbSgibGIiLCAo
eCksIF9fZ3VfcHRyLCBsYWJlbCk7CVwKPiBAQCAtMjk3LDYgKzMxMCwxNSBAQCBkbyB7CQkJCQkJ
CQlcCj4gIAo+ICAjZGVmaW5lIF9fcHV0X3VzZXJfbm9jaGVjayh4LCBfX2d1X3B0ciwgbGFiZWwp
CQkJXAo+ICBkbyB7CQkJCQkJCQlcCj4gKwlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0hBVkVfRUZG
SUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MpKSB7CQkJXAo+ICsJCWlmICghSVNfQUxJR05FRCgodWlu
dHB0cl90KV9fZ3VfcHRyLCBzaXplb2YoKl9fZ3VfcHRyKSkpIHsJCVwKPiArCQkJdW5zaWduZWQg
bG9uZyB2YWwgPSAodW5zaWduZWQgbG9uZykoeCk7CQkJCVwKPiArCQkJaWYgKF9fYXNtX2NvcHlf
dG9fdXNlcihfX2d1X3B0ciwgJih2YWwpLCBzaXplb2YoKl9fZ3VfcHRyKSkpCVwKPiArCQkJCWdv
dG8gbGFiZWw7CQkJXAo+ICsJCQllbHNlCQkJCQlcCj4gKwkJCQlicmVhazsJCQkJXAo+ICsJCX0J
CQkJCQlcCj4gKwl9CQkJCQkJCVwKPiAgCXN3aXRjaCAoc2l6ZW9mKCpfX2d1X3B0cikpIHsJCQkJ
XAo+ICAJY2FzZSAxOgkJCQkJCQlcCj4gIAkJX19wdXRfdXNlcl9hc20oInNiIiwgKHgpLCBfX2d1
X3B0ciwgbGFiZWwpOwlcCj4gQEAgLTM4NSwxMiArNDA3LDYgQEAgZXJyX2xhYmVsOgkJCQkJCQlc
Cj4gIAkJLUVGQVVMVDsJCQkJCVwKPiAgfSkKPiAgCj4gLQo+IC11bnNpZ25lZCBsb25nIF9fbXVz
dF9jaGVjayBfX2FzbV9jb3B5X3RvX3VzZXIodm9pZCBfX3VzZXIgKnRvLAo+IC0JY29uc3Qgdm9p
ZCAqZnJvbSwgdW5zaWduZWQgbG9uZyBuKTsKPiAtdW5zaWduZWQgbG9uZyBfX211c3RfY2hlY2sg
X19hc21fY29weV9mcm9tX3VzZXIodm9pZCAqdG8sCj4gLQljb25zdCB2b2lkIF9fdXNlciAqZnJv
bSwgdW5zaWduZWQgbG9uZyBuKTsKPiAtCj4gIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZwo+
ICByYXdfY29weV9mcm9tX3VzZXIodm9pZCAqdG8sIGNvbnN0IHZvaWQgX191c2VyICpmcm9tLCB1
bnNpZ25lZCBsb25nIG4pCj4gIHsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
