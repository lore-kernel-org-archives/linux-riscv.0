Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BD3CD1297
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 09:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mpp8vDXHvWCNWcnO8chuwNr0iqFKl6zBeS5SpExdTM4=; b=KOZgpYxZVluLUr
	KJ9qc5y7e0hxCfLrahXNJnIhpf90eW8uxo4oRst8PvwzYG/7FQuHajaLlutiDe40c9bNwawaZAef4
	58JqqTCt0Ci18XLRKY/qklK8R5fnHRzH/y7Ll3s8Lak+abNENd636TuQnR8LwG/ITOufqYgipgaIG
	IT9V7p6p8U2+cKOnDA1bcopDe+OgNK2VeHgc69icHl0fAfVCdZK73xC6+H7CzwpvY5+abBevgPWjE
	B7h4LVBZw2RLFNTqy90HfuphRWXGAyI6Xe4GPBg04IU3ldzXejaPsl0QIdkRjwK7RnsdovE5/UPSb
	hW6unoO+S1FHOepgQJNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTzS-000000063Ir-03Bp;
	Wed, 10 Apr 2024 09:11:34 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTzA-0000000633u-2y4h
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 09:11:18 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-34666e92263so151045f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 02:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712740274; x=1713345074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t82SHWSKnQwBrCB557sYOimgSCzDvuCob+i4t0Pqx/Q=;
        b=13epmN8nW8U9M7DDnPXDsxUsCxqppCdlihr1bLjo1QyLagCSuc05XHdhiq0j/FVZQV
         oKz8EYz+WEf2yr7a8MrVj12rMQmjMQPDKK/R+xOkEm/Mcg83vAQJDCPjWdn8tn06N8u9
         lslqbzXSz89gQEuZVMajb5nNt7HAAg4nP5TxyQY3q5G4/DViiNx2QdbQU3HdE5uogJtw
         9/GlJLKfC532Ovuw9v4F5QtLaNT/qJMk1qa3O9T+mCfLd4M0V9tbISmxsM6bDs1JAg6a
         Bryq7eizkEEWAAVFeUAZI4Ia93DmxLgSgtJh2chAWns6gRczy39rxmBW3M95fr9CDqCl
         XCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712740274; x=1713345074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t82SHWSKnQwBrCB557sYOimgSCzDvuCob+i4t0Pqx/Q=;
        b=XKi+t0qgPCgKTkuAi2Q1HUDp6Nk3ExLTDaE4PVrXguWmQJu4iCsGFYRCkmp8X8ktVF
         p+HjGtuW8w7BwdnujZMFOoeuVhqURu0L3/T9Ca1Kg+6LnrxEIyvreLXoSPw5OQ/oG3Ev
         NsCHDTjuFKmXTqSgZSsJ8wUj69FetloyUKaMp586ousK98w89PIzbKeBd6kga11eyZLq
         oCMv1jk3Rp4mcLlaFXMSQWnEnxHHNLe0I0lPgN9jKuqQ0RxxOT2KOq5WsanysoI326sa
         7hry1HZcavUeYF6G9OJfKUmuCKZNFCRuJj4B0dwnRkGAwWZJ5ya88WOH1wrYa4sVhPvM
         Vk6w==
X-Forwarded-Encrypted: i=1; AJvYcCXKhDbdjLnkRMfp8etCFKZ672sm5N3TaBc788kF4dJOiJu7Q6aMbGUgvaude76WYugY9RK9djDGyy+8LDMH2NhLEk98fOpjMitQb6c8T1Hv
X-Gm-Message-State: AOJu0YxhbtkYAjfuAZjGRL25DHMcfRWaiYlTKyhxn7Mkd4xnYxeMxBL+
	tYO/9B0e6iFuiVeO4tOxBjUpbCGKeejZessYn4Y2+P1olL55p+H90Vc4Ty9MVlg=
X-Google-Smtp-Source: AGHT+IFuCtcCydDrKWfn3jYR1RbT1CZEg8ojMks9EcbPdwaTPvasgPI0ZN7jPxJ/lA0ljO5M7tLzaA==
X-Received: by 2002:a05:6000:1a50:b0:343:d35c:d12c with SMTP id t16-20020a0560001a5000b00343d35cd12cmr1424773wry.3.1712740273999;
        Wed, 10 Apr 2024 02:11:13 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:d4a6:5856:3e6c:3dff])
        by smtp.gmail.com with ESMTPSA id d6-20020a056000114600b003456c693fa4sm9079086wrx.93.2024.04.10.02.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 02:11:13 -0700 (PDT)
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
Subject: [PATCH 03/10] riscv: hwprobe: export Zca, Zcf, Zcd and Zcb ISA extensions
Date: Wed, 10 Apr 2024 11:10:56 +0200
Message-ID: <20240410091106.749233-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410091106.749233-1-cleger@rivosinc.com>
References: <20240410091106.749233-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_021116_929586_6A25AF06 
X-CRM114-Status: GOOD (  10.48  )
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
YmUucnN0CmluZGV4IDljYTViMDkzYjZkNS4uYmY5NmI0ZThiYTNiIDEwMDY0NAotLS0gYS9Eb2N1
bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9hcmNo
L3Jpc2N2L2h3cHJvYmUucnN0CkBAIC0xOTIsNiArMTkyLDI2IEBAIFRoZSBmb2xsb3dpbmcga2V5
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
bmRleCBhYzY4NzRhYjc0M2EuLmRkNGFkNzdmYWY0OSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20vaHdwcm9iZS5oCkBAIC02MCw2ICs2MCwxMCBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAj
ZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQUNBUwkJKDFVTEwgPDwgMzQpCiAjZGVmaW5lCQlS
SVNDVl9IV1BST0JFX0VYVF9aSUNPTkQJKDFVTEwgPDwgMzUpCiAjZGVmaW5lCQlSSVNDVl9IV1BS
T0JFX0VYVF9aSU1PUAkJKDFVTEwgPDwgMzYpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9a
Q0EJCSgxVUxMIDw8IDM3KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkNCCQkoMVVMTCA8
PCAzOCkKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pDRAkJKDFVTEwgPDwgMzkpCisjZGVm
aW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQ0YJCSgxVUxMIDw8IDQwKQogI2RlZmluZSBSSVNDVl9I
V1BST0JFX0tFWV9DUFVQRVJGXzAJNQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVE
X1VOS05PV04JKDAgPDwgMCkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9FTVVM
QVRFRAkoMSA8PCAwKQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUu
YyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKaW5kZXggYzk5YTRjZjIzMWM1Li4y
ZmZhMGZlNTEwMWUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMK
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwpAQCAtMTEyLDYgKzExMiw4IEBA
IHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIs
CiAJCUVYVF9LRVkoWkFDQVMpOwogCQlFWFRfS0VZKFpJQ09ORCk7CiAJCUVYVF9LRVkoWklNT1Ap
OworCQlFWFRfS0VZKFpDQSk7CisJCUVYVF9LRVkoWkNCKTsKIAogCQlpZiAoaGFzX3ZlY3Rvcigp
KSB7CiAJCQlFWFRfS0VZKFpWQkIpOwpAQCAtMTMyLDYgKzEzNCw4IEBAIHN0YXRpYyB2b2lkIGh3
cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCQlFWFRfS0VZKFpG
SCk7CiAJCQlFWFRfS0VZKFpGSE1JTik7CiAJCQlFWFRfS0VZKFpGQSk7CisJCQlFWFRfS0VZKFpD
RCk7CisJCQlFWFRfS0VZKFpDRik7CiAJCX0KICN1bmRlZiBFWFRfS0VZCiAJfQotLSAKMi40My4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
