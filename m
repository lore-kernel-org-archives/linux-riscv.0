Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98DBCD1280
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 16:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CspQzca/+MaEIWC7SwJ1tCunEK7+fDNqICimS/xzRsI=; b=Hp4VsTAbLEksYK
	l9vtA3g8JvlzVWgU0/8t6c/9kHZZf2K1KUVpHPY2rL3lClmzCer/N1b7YcTonMikXwMrzU47lGWZR
	9TiSGaj2Hw3PdoabaTpEc3/4Aw8zW0Yqh5WC4/yUHfewwNlgg0CPLK61K5tCH1wevWPYD8fURzlkQ
	lM8vAaNUHpLc06I2PRnSeXH5e+/7jsgPdZn0BUyQTFTsaBz4BGDJ+3Idw/HXQKPMbdYKykfVyWdMY
	UVD6903Rp6/ux4vTYEYSdyxj5K2COdcJf/fj2jlWThorZKhqJdahbYLxuQ/J/hvb8ZcCC0Jc0ADih
	KzvsAq1xpQKC5DcLH5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVnF-00000009zbX-2isy;
	Wed, 27 Mar 2024 16:06:25 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVmQ-00000009zA4-2XbB
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 16:05:45 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1e0d6356ce9so25928805ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 09:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711555529; x=1712160329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSdeTCpLrbMRKKMvHtorfIir+maEw9krU8ML3vSQsXQ=;
        b=KEyMtn/uDLo+QcauVV8z6qAeFbkXF4mtS2LzxSw92wX2R9Ti9pjudywYapefaxTFhq
         pOsnz7QsGVAm92/pzwf/I3LwxsCSS/k5fcrlvhD8h3wTJBM3ht3FyYYm6uJGXMWX1LA9
         gdE91JEZYo9pqpSWMNnxfqdsaevf2kAs6D2yxxCo1kUwGvHG6eT1LLd44ma2vmBrctry
         KMHvWCIqhyGrMTDDD6IXNxSIdQ3607lh1aFUSavIoWVqLwmu0gieZIg+LE/Fv3v+9CwY
         F4rVaKsCZGM4TDwvdRTFfYpiotZ4/1jeoqQwODc63VL9J8vtj9razKR35pxePQoj5kat
         OhWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711555529; x=1712160329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSdeTCpLrbMRKKMvHtorfIir+maEw9krU8ML3vSQsXQ=;
        b=V5pEY31SPdrg8HQn6mNFcowP3C+jSRxF9X2bi98N36INRnnfdBgZlLO+8XD0jFoXpO
         JV92PkJgc4liYynvEtU8pDoaT8dxOW4/zNFxW61sR0nDxpTd3cQ4YNzLJHloZjBJNXA9
         L1M/QV6pMQwfV+fpW5m21UTPL4P+1ATC/27Y0W0TjK3odiJEsH7QAiknmK2M2kkyRhvy
         rTsoGXYf0Zn4G1ZTQI9Ha1kPNw5aMzjzDkp3+LdQG+F1aRvzmP0uHSaOTAwk/XqoxQBt
         GJn3RiRldYh0YwXb2/dhLnzX9T45n2wHWxRT2jf/UHRUiu6UqwC2oddQTqkS1t6YEHmu
         0vVg==
X-Forwarded-Encrypted: i=1; AJvYcCUWk/X1ZuiDT6fZnGfDypazgaZ6QZ2tl5KVh1y2Maz6FtSeSsa/Sa4N5Al5elqWslYMGk3RSNcyabiOoGzrPt573G1rqzM8h7FT3dRqaFum
X-Gm-Message-State: AOJu0Yw8N4sjZ6qy9zj67M+eV1bJ1NPCUjI7LHNn/kanuUWmIUv+FlGd
	GmMDGQYIQM8ewtqnGbRPfqhLaWdCDh/3UTAnFue75rSA8J5PsK+ccGjkPgP7K50=
X-Google-Smtp-Source: AGHT+IEqRVMXpfbvhLVGnT+rNK/EL/AmWPjQNfVTk43pBb2QF8NUiJFixCdoiQv5OswSn3xtBhEfyw==
X-Received: by 2002:a17:903:8cd:b0:1df:fa1a:529f with SMTP id lk13-20020a17090308cd00b001dffa1a529fmr148822plb.24.1711555529446;
        Wed, 27 Mar 2024 09:05:29 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id bf4-20020a170902b90400b001e14807f9cesm1718226plb.125.2024.03.27.09.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 09:05:28 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	bpf@vger.kernel.org
Subject: [PATCH v2 5/7] riscv: Pass patch_text() the length in bytes
Date: Wed, 27 Mar 2024 09:04:44 -0700
Message-ID: <20240327160520.791322-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327160520.791322-1-samuel.holland@sifive.com>
References: <20240327160520.791322-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_090539_176514_71327441 
X-CRM114-Status: GOOD (  16.05  )
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

cGF0Y2hfdGV4dF9ub3N5bmMoKSBhbHJlYWR5IGhhbmRsZXMgYW4gYXJiaXRyYXJ5IGxlbmd0aCBv
ZiBjb2RlLCBzbyB0aGlzCnJlbW92ZXMgYSBzdXBlcmZsdW91cyBsb29wIGFuZCByZWR1Y2VzIHRo
ZSBudW1iZXIgb2YgaWNhY2hlIGZsdXNoZXMuCgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8
Ympvcm5Acml2b3NpbmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVs
LmhvbGxhbmRAc2lmaXZlLmNvbT4KLS0tCgpDaGFuZ2VzIGluIHYyOgogLSBSZW1vdmUgdW5uZWNl
c3NhcnkgbGluZSB3cmFwcGluZwoKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGF0Y2guaCAgICAg
fCAgMiArLQogYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYyAgICAgICAgICB8IDE0ICsrKysrLS0t
LS0tLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jIHwgMTggKysrKysrKysr
Ky0tLS0tLS0tCiBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jICAgIHwgIDcgKysrKy0t
LQogNCBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhdGNoLmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BhdGNoLmgKaW5kZXggOWY1ZDZlMTRjNDA1Li43MjI4ZTI2NmI5YTEgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGF0Y2guaAorKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BhdGNoLmgKQEAgLTksNyArOSw3IEBACiBpbnQgcGF0Y2hfaW5zbl93cml0ZSh2
b2lkICphZGRyLCBjb25zdCB2b2lkICppbnNuLCBzaXplX3QgbGVuKTsKIGludCBwYXRjaF90ZXh0
X25vc3luYyh2b2lkICphZGRyLCBjb25zdCB2b2lkICppbnNucywgc2l6ZV90IGxlbik7CiBpbnQg
cGF0Y2hfdGV4dF9zZXRfbm9zeW5jKHZvaWQgKmFkZHIsIHU4IGMsIHNpemVfdCBsZW4pOwotaW50
IHBhdGNoX3RleHQodm9pZCAqYWRkciwgdTMyICppbnNucywgaW50IG5pbnNucyk7CitpbnQgcGF0
Y2hfdGV4dCh2b2lkICphZGRyLCB1MzIgKmluc25zLCBzaXplX3QgbGVuKTsKIAogZXh0ZXJuIGlu
dCByaXNjdl9wYXRjaF9pbl9zdG9wX21hY2hpbmU7CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL3BhdGNoLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jCmluZGV4IDBkMTcwMGQx
OTM0Yy4uMjQzZTE1NzM0MTBiIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5j
CisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMKQEAgLTE5LDcgKzE5LDcgQEAKIHN0cnVj
dCBwYXRjaF9pbnNuIHsKIAl2b2lkICphZGRyOwogCXUzMiAqaW5zbnM7Ci0JaW50IG5pbnNuczsK
KwlzaXplX3QgbGVuOwogCWF0b21pY190IGNwdV9jb3VudDsKIH07CiAKQEAgLTIzMSwxNCArMjMx
LDEwIEBAIE5PS1BST0JFX1NZTUJPTChwYXRjaF90ZXh0X25vc3luYyk7CiBzdGF0aWMgaW50IHBh
dGNoX3RleHRfY2Iodm9pZCAqZGF0YSkKIHsKIAlzdHJ1Y3QgcGF0Y2hfaW5zbiAqcGF0Y2ggPSBk
YXRhOwotCXVuc2lnbmVkIGxvbmcgbGVuOwotCWludCBpLCByZXQgPSAwOworCWludCByZXQgPSAw
OwogCiAJaWYgKGF0b21pY19pbmNfcmV0dXJuKCZwYXRjaC0+Y3B1X2NvdW50KSA9PSBudW1fb25s
aW5lX2NwdXMoKSkgewotCQlmb3IgKGkgPSAwOyByZXQgPT0gMCAmJiBpIDwgcGF0Y2gtPm5pbnNu
czsgaSsrKSB7Ci0JCQlsZW4gPSBHRVRfSU5TTl9MRU5HVEgocGF0Y2gtPmluc25zW2ldKTsKLQkJ
CXJldCA9IHBhdGNoX2luc25fd3JpdGUocGF0Y2gtPmFkZHIgKyBpICogbGVuLCAmcGF0Y2gtPmlu
c25zW2ldLCBsZW4pOwotCQl9CisJCXJldCA9IHBhdGNoX2luc25fd3JpdGUocGF0Y2gtPmFkZHIs
IHBhdGNoLT5pbnNucywgcGF0Y2gtPmxlbik7CiAJCS8qCiAJCSAqIE1ha2Ugc3VyZSB0aGUgcGF0
Y2hpbmcgc3RvcmUgaXMgZWZmZWN0aXZlICpiZWZvcmUqIHdlCiAJCSAqIGluY3JlbWVudCB0aGUg
Y291bnRlciB3aGljaCByZWxlYXNlcyBhbGwgd2FpdGluZyBDUFVzCkBAIC0yNTgsMTMgKzI1NCwx
MyBAQCBzdGF0aWMgaW50IHBhdGNoX3RleHRfY2Iodm9pZCAqZGF0YSkKIH0KIE5PS1BST0JFX1NZ
TUJPTChwYXRjaF90ZXh0X2NiKTsKIAotaW50IHBhdGNoX3RleHQodm9pZCAqYWRkciwgdTMyICpp
bnNucywgaW50IG5pbnNucykKK2ludCBwYXRjaF90ZXh0KHZvaWQgKmFkZHIsIHUzMiAqaW5zbnMs
IHNpemVfdCBsZW4pCiB7CiAJaW50IHJldDsKIAlzdHJ1Y3QgcGF0Y2hfaW5zbiBwYXRjaCA9IHsK
IAkJLmFkZHIgPSBhZGRyLAogCQkuaW5zbnMgPSBpbnNucywKLQkJLm5pbnNucyA9IG5pbnNucywK
KwkJLmxlbiA9IGxlbiwKIAkJLmNwdV9jb3VudCA9IEFUT01JQ19JTklUKDApLAogCX07CiAKZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCmluZGV4IGZlY2JiY2Y0MGFjMy4uZjNjYmMzZWM5ZTZh
IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCisrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMKQEAgLTIzLDEzICsyMywxMyBAQCBwb3N0
X2twcm9iZV9oYW5kbGVyKHN0cnVjdCBrcHJvYmUgKiwgc3RydWN0IGtwcm9iZV9jdGxibGsgKiwg
c3RydWN0IHB0X3JlZ3MgKik7CiAKIHN0YXRpYyB2b2lkIF9fa3Byb2JlcyBhcmNoX3ByZXBhcmVf
c3Nfc2xvdChzdHJ1Y3Qga3Byb2JlICpwKQogeworCXNpemVfdCBsZW4gPSBHRVRfSU5TTl9MRU5H
VEgocC0+b3Bjb2RlKTsKIAl1MzIgaW5zbiA9IF9fQlVHX0lOU05fMzI7Ci0JdW5zaWduZWQgbG9u
ZyBvZmZzZXQgPSBHRVRfSU5TTl9MRU5HVEgocC0+b3Bjb2RlKTsKIAotCXAtPmFpbnNuLmFwaS5y
ZXN0b3JlID0gKHVuc2lnbmVkIGxvbmcpcC0+YWRkciArIG9mZnNldDsKKwlwLT5haW5zbi5hcGku
cmVzdG9yZSA9ICh1bnNpZ25lZCBsb25nKXAtPmFkZHIgKyBsZW47CiAKLQlwYXRjaF90ZXh0X25v
c3luYyhwLT5haW5zbi5hcGkuaW5zbiwgJnAtPm9wY29kZSwgMSk7Ci0JcGF0Y2hfdGV4dF9ub3N5
bmMocC0+YWluc24uYXBpLmluc24gKyBvZmZzZXQsICZpbnNuLCAxKTsKKwlwYXRjaF90ZXh0X25v
c3luYyhwLT5haW5zbi5hcGkuaW5zbiwgJnAtPm9wY29kZSwgbGVuKTsKKwlwYXRjaF90ZXh0X25v
c3luYyhwLT5haW5zbi5hcGkuaW5zbiArIGxlbiwgJmluc24sIEdFVF9JTlNOX0xFTkdUSChpbnNu
KSk7CiB9CiAKIHN0YXRpYyB2b2lkIF9fa3Byb2JlcyBhcmNoX3ByZXBhcmVfc2ltdWxhdGUoc3Ry
dWN0IGtwcm9iZSAqcCkKQEAgLTExNiwxNiArMTE2LDE4IEBAIHZvaWQgKmFsbG9jX2luc25fcGFn
ZSh2b2lkKQogLyogaW5zdGFsbCBicmVha3BvaW50IGluIHRleHQgKi8KIHZvaWQgX19rcHJvYmVz
IGFyY2hfYXJtX2twcm9iZShzdHJ1Y3Qga3Byb2JlICpwKQogewotCXUzMiBpbnNuID0gKHAtPm9w
Y29kZSAmIF9fSU5TTl9MRU5HVEhfTUFTSykgPT0gX19JTlNOX0xFTkdUSF8zMiA/Ci0JCSAgIF9f
QlVHX0lOU05fMzIgOiBfX0JVR19JTlNOXzE2OworCXNpemVfdCBsZW4gPSBHRVRfSU5TTl9MRU5H
VEgocC0+b3Bjb2RlKTsKKwl1MzIgaW5zbiA9IGxlbiA9PSA0ID8gX19CVUdfSU5TTl8zMiA6IF9f
QlVHX0lOU05fMTY7CiAKLQlwYXRjaF90ZXh0KHAtPmFkZHIsICZpbnNuLCAxKTsKKwlwYXRjaF90
ZXh0KHAtPmFkZHIsICZpbnNuLCBsZW4pOwogfQogCiAvKiByZW1vdmUgYnJlYWtwb2ludCBmcm9t
IHRleHQgKi8KIHZvaWQgX19rcHJvYmVzIGFyY2hfZGlzYXJtX2twcm9iZShzdHJ1Y3Qga3Byb2Jl
ICpwKQogewotCXBhdGNoX3RleHQocC0+YWRkciwgJnAtPm9wY29kZSwgMSk7CisJc2l6ZV90IGxl
biA9IEdFVF9JTlNOX0xFTkdUSChwLT5vcGNvZGUpOworCisJcGF0Y2hfdGV4dChwLT5hZGRyLCAm
cC0+b3Bjb2RlLCBsZW4pOwogfQogCiB2b2lkIF9fa3Byb2JlcyBhcmNoX3JlbW92ZV9rcHJvYmUo
c3RydWN0IGtwcm9iZSAqcCkKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29t
cDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCmluZGV4IGFhYzE5MDA4NTQ3
Mi4uNmVkNDAzNWE4MTM2IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2
NC5jCisrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKQEAgLTE1LDYgKzE1LDcg
QEAKICNpbmNsdWRlICJicGZfaml0LmgiCiAKICNkZWZpbmUgUlZfRkVOVFJZX05JTlNOUyAyCisj
ZGVmaW5lIFJWX0ZFTlRSWV9OQllURVMgKFJWX0ZFTlRSWV9OSU5TTlMgKiA0KQogCiAjZGVmaW5l
IFJWX1JFR19UQ0MgUlZfUkVHX0E2CiAjZGVmaW5lIFJWX1JFR19UQ0NfU0FWRUQgUlZfUkVHX1M2
IC8qIFN0b3JlIEE2IGluIFM2IGlmIHByb2dyYW0gZG8gY2FsbHMgKi8KQEAgLTY2Myw3ICs2NjQs
NyBAQCBpbnQgYnBmX2FyY2hfdGV4dF9wb2tlKHZvaWQgKmlwLCBlbnVtIGJwZl90ZXh0X3Bva2Vf
dHlwZSBwb2tlX3R5cGUsCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCWlmIChtZW1jbXAo
aXAsIG9sZF9pbnNucywgUlZfRkVOVFJZX05JTlNOUyAqIDQpKQorCWlmIChtZW1jbXAoaXAsIG9s
ZF9pbnNucywgUlZfRkVOVFJZX05CWVRFUykpCiAJCXJldHVybiAtRUZBVUxUOwogCiAJcmV0ID0g
Z2VuX2p1bXBfb3Jfbm9wcyhuZXdfYWRkciwgaXAsIG5ld19pbnNucywgaXNfY2FsbCk7CkBAIC02
NzIsOCArNjczLDggQEAgaW50IGJwZl9hcmNoX3RleHRfcG9rZSh2b2lkICppcCwgZW51bSBicGZf
dGV4dF9wb2tlX3R5cGUgcG9rZV90eXBlLAogCiAJY3B1c19yZWFkX2xvY2soKTsKIAltdXRleF9s
b2NrKCZ0ZXh0X211dGV4KTsKLQlpZiAobWVtY21wKGlwLCBuZXdfaW5zbnMsIFJWX0ZFTlRSWV9O
SU5TTlMgKiA0KSkKLQkJcmV0ID0gcGF0Y2hfdGV4dChpcCwgbmV3X2luc25zLCBSVl9GRU5UUllf
TklOU05TKTsKKwlpZiAobWVtY21wKGlwLCBuZXdfaW5zbnMsIFJWX0ZFTlRSWV9OQllURVMpKQor
CQlyZXQgPSBwYXRjaF90ZXh0KGlwLCBuZXdfaW5zbnMsIFJWX0ZFTlRSWV9OQllURVMpOwogCW11
dGV4X3VubG9jaygmdGV4dF9tdXRleCk7CiAJY3B1c19yZWFkX3VubG9jaygpOwogCi0tIAoyLjQz
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
