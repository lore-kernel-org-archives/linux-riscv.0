Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC38C04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 14:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8FNUzUR6fjJoa0HnP9EGPmNxGUZhqP31Jb3mvmm1vg=; b=pTQqdAlZlc7+/l
	8bATa0uZB1UlIm8ljqpQJnh+qhkqp7Abvk42aAQJBWwa5QbQ2aVgIbrKqoodsUsoALM6su4LHmhr1
	xcdEL3aFTb69SKiBqNdvAl34OLJ+ksNXpG+bgkaSzJq/PXd1GzuOETk+he+lKodJ2Boy4flOd00MM
	0FKGPE68UwVYcDalEgQvtJ7EEmPZdFTkc+O29EMXWCyh8ai449lC75W0KVzZE2ehAwmybynTueqlp
	jA6kZMPdZ4q8hlCXms91Wck4+yQAVaGEKQjlvrcK9olvwZQA4quEv4IxFGlLsmC9v1pRwbuOWnA2A
	IfY1AnRTzJ7QR3CdZYlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yyW-0000000892n-1U9O;
	Fri, 17 May 2024 14:54:24 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxk-000000088AT-0q43
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 14:53:42 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2e20088184cso3324221fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 07:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957607; x=1716562407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZcvU9Yv1rOWLKDlgsJRQ29S24RYbUTnQ4T9H9DZeCs=;
        b=FX+vnTYnH0CGjETc/DD0BPETHQruIwmxOpnML6gUof5UwjsOYr7tX9TTZ3brc6rUAb
         V05goPZLJ8kMOrgrZnVPiEOxb2SbCCEaS+/02bM4tpmxdaUg2kVAIlYInCpHDhLtEp0P
         eaWroGDqfqnZ7nXZmrYGarHl0aBJsP7PmyAOhhSqteS/NhJ0hnvuRk4j7xNXy1cMuge3
         ous1u/RlOx0utPN6bG9eZrfQOFIQVyqbto4Dze2eAzEbaL9mnjS6Lvtbdu0mH0iy2oi+
         iuG5jrNEMpPPU2VCGUZSMoqVF3TBSZpA0jfpUbyM9CLOzXbDKKu8IWv9iLf2qNFWwl/O
         W6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957607; x=1716562407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZcvU9Yv1rOWLKDlgsJRQ29S24RYbUTnQ4T9H9DZeCs=;
        b=pNFc981irz7znNTfLBrwdXONwR7TApFalC2ciTLppu/NI5tN99oFsADy83KYTNgYX0
         Pc5ne6bVbBNIcqjELhaNtP6ql+1R24fKo47mrIa91ZtFWj7PVNEw4L54Tnd2PG6+o4K8
         ITH9wo0tNk9Vvqr6ZbmEkvWaZHMv/v4M4Kr1fRZmu/stWZDI/4XxjmBC6NJ5aiRK+Gpz
         ZnfGVKNgH5bwCqdOeZ652aP/2KGEgoUx+ShfGPq92TiwoPOJPIajJIWtEbthHzGQtM+P
         8w0Ty2uuw44IFUEQGHUdWyrKEEK4PeOeH4wMXs2VjPm3N7F2E4hCb3+XkBfFuBnsPMM1
         8L6w==
X-Forwarded-Encrypted: i=1; AJvYcCVZ+ns4qEMDoIZJqf9AoZPow8WQ4gNccUP0RWSXEOQKAhR+cFWqtGtlstmsCZfkBPbmp5tSzTMibEboxHCbVxokfINIKkgUMCbS1HEYuhYn
X-Gm-Message-State: AOJu0YyjhNfdyhz9OH0UqbH0spAUFzJXBahuUPgsVFgifqyYN3pAMRsz
	1RkfOfsE/xathN2BD+a6HovWnmCj1VpuWMS6m7uz1KzmUn4+oXVZG7eUWGTeumM=
X-Google-Smtp-Source: AGHT+IG0JRKQ4JGhSQKFCaG8K/egrvdoE99BfZAMCAGRo6YHIr6ZDAXQWFJBuUmfJPoMXhQY3Pg2tg==
X-Received: by 2002:a2e:a211:0:b0:2e2:714c:23d2 with SMTP id 38308e7fff4ca-2e51fd3125dmr162327021fa.1.1715957607233;
        Fri, 17 May 2024 07:53:27 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:26 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v5 09/16] riscv: hwprobe: export Zca, Zcf, Zcd and Zcb ISA extensions
Date: Fri, 17 May 2024 16:52:49 +0200
Message-ID: <20240517145302.971019-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517145302.971019-1-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_075336_743889_A4E4CC09 
X-CRM114-Status: GOOD (  10.47  )
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

RXhwb3J0IFpjYSwgWmNmLCBaY2QgYW5kIFpjYiBJU0EgZXh0ZW5zaW9uIHRocm91Z2ggaHdwcm9i
ZS4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4K
LS0tCiBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgIHwgMjAgKysrKysrKysr
KysrKysrKysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggfCAgNCAr
KysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAgIHwgIDQgKysrKwogMyBm
aWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJv
YmUucnN0CmluZGV4IDQ4YmUzOGUwYjc4OC4uY2FkODRmNTE0MTJkIDEwMDY0NAotLS0gYS9Eb2N1
bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9hcmNo
L3Jpc2N2L2h3cHJvYmUucnN0CkBAIC0xOTYsNiArMTk2LDI2IEBAIFRoZSBmb2xsb3dpbmcga2V5
cyBhcmUgZGVmaW5lZDoKICAgICAgICBzdXBwb3J0ZWQgYXMgZGVmaW5lZCBpbiB0aGUgUklTQy1W
IElTQSBtYW51YWwgc3RhcnRpbmcgZnJvbSBjb21taXQKICAgICAgICA1ODIyMDYxNGE1ZiAoIlpp
bW9wIGlzIHJhdGlmaWVkLzEuMCIpLgogCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhU
X1pDQWA6IFRoZSBaY2EgZXh0ZW5zaW9uIHBhcnQgb2YgWmMqIHN0YW5kYXJkCisgICAgICAgZXh0
ZW5zaW9ucyBmb3IgY29kZSBzaXplIHJlZHVjdGlvbiwgYXMgcmF0aWZpZWQgaW4gY29tbWl0IDhi
ZTM0MTljMWMwCisgICAgICAgKCJaY2YgZG9lc24ndCBleGlzdCBvbiBSVjY0IGFzIGl0IGNvbnRh
aW5zIG5vIGluc3RydWN0aW9ucyIpIG9mCisgICAgICAgcmlzY3YtY29kZS1zaXplLXJlZHVjdGlv
bi4KKworICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aQ0JgOiBUaGUgWmNiIGV4dGVu
c2lvbiBwYXJ0IG9mIFpjKiBzdGFuZGFyZAorICAgICAgIGV4dGVuc2lvbnMgZm9yIGNvZGUgc2l6
ZSByZWR1Y3Rpb24sIGFzIHJhdGlmaWVkIGluIGNvbW1pdCA4YmUzNDE5YzFjMAorICAgICAgICgi
WmNmIGRvZXNuJ3QgZXhpc3Qgb24gUlY2NCBhcyBpdCBjb250YWlucyBubyBpbnN0cnVjdGlvbnMi
KSBvZgorICAgICAgIHJpc2N2LWNvZGUtc2l6ZS1yZWR1Y3Rpb24uCisKKyAgKiA6YzptYWNybzpg
UklTQ1ZfSFdQUk9CRV9FWFRfWkNEYDogVGhlIFpjZCBleHRlbnNpb24gcGFydCBvZiBaYyogc3Rh
bmRhcmQKKyAgICAgICBleHRlbnNpb25zIGZvciBjb2RlIHNpemUgcmVkdWN0aW9uLCBhcyByYXRp
ZmllZCBpbiBjb21taXQgOGJlMzQxOWMxYzAKKyAgICAgICAoIlpjZiBkb2Vzbid0IGV4aXN0IG9u
IFJWNjQgYXMgaXQgY29udGFpbnMgbm8gaW5zdHJ1Y3Rpb25zIikgb2YKKyAgICAgICByaXNjdi1j
b2RlLXNpemUtcmVkdWN0aW9uLgorCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pD
RmA6IFRoZSBaY2YgZXh0ZW5zaW9uIHBhcnQgb2YgWmMqIHN0YW5kYXJkCisgICAgICAgZXh0ZW5z
aW9ucyBmb3IgY29kZSBzaXplIHJlZHVjdGlvbiwgYXMgcmF0aWZpZWQgaW4gY29tbWl0IDhiZTM0
MTljMWMwCisgICAgICAgKCJaY2YgZG9lc24ndCBleGlzdCBvbiBSVjY0IGFzIGl0IGNvbnRhaW5z
IG5vIGluc3RydWN0aW9ucyIpIG9mCisgICAgICAgcmlzY3YtY29kZS1zaXplLXJlZHVjdGlvbi4K
KwogKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wYDogQSBiaXRtYXNrIHRo
YXQgY29udGFpbnMgcGVyZm9ybWFuY2UKICAgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHNlbGVjdGVk
IHNldCBvZiBwcm9jZXNzb3JzLgogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaApp
bmRleCAzYjE2YTEyMjA0YjEuLjY1MmIyMzczNzI5ZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20vaHdwcm9iZS5oCkBAIC02MSw2ICs2MSwxMCBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAj
ZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aSUNPTkQJKDFVTEwgPDwgMzUpCiAjZGVmaW5lCQlS
SVNDVl9IV1BST0JFX0VYVF9aSUhJTlRQQVVTRQkoMVVMTCA8PCAzNikKICNkZWZpbmUJCVJJU0NW
X0hXUFJPQkVfRVhUX1pJTU9QCQkoMVVMTCA8PCAzNykKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVf
RVhUX1pDQQkJKDFVTEwgPDwgMzgpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQ0IJCSgx
VUxMIDw8IDM5KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkNECQkoMVVMTCA8PCA0MCkK
KyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pDRgkJKDFVTEwgPDwgNDEpCiAjZGVmaW5lIFJJ
U0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMAk1CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FM
SUdORURfVU5LTk9XTgkoMCA8PCAwKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVE
X0VNVUxBVEVECSgxIDw8IDApCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdw
cm9iZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwppbmRleCBmYzZmNDIzOGYw
YjMuLjExZGVmMzQ1YTQyZCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJv
YmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCkBAIC0xMTMsNiArMTEz
LDggQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAq
cGFpciwKIAkJRVhUX0tFWShaSUNPTkQpOwogCQlFWFRfS0VZKFpJSElOVFBBVVNFKTsKIAkJRVhU
X0tFWShaSU1PUCk7CisJCUVYVF9LRVkoWkNBKTsKKwkJRVhUX0tFWShaQ0IpOwogCiAJCWlmICho
YXNfdmVjdG9yKCkpIHsKIAkJCUVYVF9LRVkoWlZCQik7CkBAIC0xMzMsNiArMTM1LDggQEAgc3Rh
dGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKIAkJ
CUVYVF9LRVkoWkZIKTsKIAkJCUVYVF9LRVkoWkZITUlOKTsKIAkJCUVYVF9LRVkoWkZBKTsKKwkJ
CUVYVF9LRVkoWkNEKTsKKwkJCUVYVF9LRVkoWkNGKTsKIAkJfQogI3VuZGVmIEVYVF9LRVkKIAl9
Ci0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
