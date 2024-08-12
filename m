Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DBFC52D7F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 02:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=su8lmhaJR7UOWWoVNAMSA5Ij1L6oDwjlZDA+iuKQLFY=; b=cgL3YmWCprs/iZ
	DSa4XqY2+dKxwTMV+r2VqviwdnrwZGkEgbsPIDtfiJTaB0mUQOakWD9yOYsxzsckBnSSpAn6txBKg
	QnvuAia8LpCtA9L+gZHyiY7MlBMQyXyQ1gBqTiaVm5Gq63npiFSTAvLx6FwNdQ7nsyxoi2paHmodl
	sEppgDbFXRzHcD1nn2bb+x9SJzWO2Z94FMqMhw/pS2NSrdIowBLbVb/DHNBUQTTqLibk/J1x//72/
	VoJgnOitIUA95dAqnFkgGM+csUyEWsUldYabo6lOmrJMzNdtgVpZKBW3CNw7sKn729bbEM+Rl4/Lu
	9Gja1wNdeAmRB9/18Wdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdKaf-0000000GgGv-1ivx;
	Mon, 12 Aug 2024 02:15:21 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJQf-0000000GaIc-34WN
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 01:00:59 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3db16129143so2266150b6e.0
        for <linux-riscv@lists.infradead.org>; Sun, 11 Aug 2024 18:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723424457; x=1724029257; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMNBqe/9cTzO1EXtoBS3N5wT2H0f1rIMH9omusI+3YU=;
        b=F8Lw9wGCxSlzgo+IprRmdoBia7grXFCPFL98IQGgKoDHx9XH08LfqWVz0M7+lKikt6
         OWGV/5eoD4ymmkSInxiStk3HCIWWZyKMG3i5acHiGa8KhiVrTwUhhsyxKpapN87g5EMH
         cMTCGmOcILNaX22q1a6ueea+Ia//7zrjHI2pUiRB8iZPZFP13/ID0T1Z9BgzpNYe3lIU
         vUJ8xhRa2hzttFh5VjSwzEYvhXRpXEM0nb8B6reVR8DhnEYczJDDzGqQJaL61YHEArTV
         q21xI6Ild2w/LEfKZAE1HjfUrhniiIWGv9AlCZ0L4Bm0kBg1P3z8WcImlGAFvip5An5x
         KdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723424457; x=1724029257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMNBqe/9cTzO1EXtoBS3N5wT2H0f1rIMH9omusI+3YU=;
        b=QcRFLhcbuV4BcfNLx7+82g+qVhyakVdS3ea5AbQcVVCh0qnFaW+/+YwITdiCdEgEYO
         onodw5oLd3/ZFOfVIx2YtnA6aBk2JW/ZFTiLwBmeMPLu0HlRex0kLqQonVcdN2u2dBr4
         7lHGQdOVIEUY5M0KJQ8ciBzws8hlu2Y2Tc/ybqoC+Xh8cvTHTmYXfsxN+4hzw5vP7pC4
         209v5hYyjvembWZ16hcExYqnYH3ZTwAt2ga7qW8PV7GHnEHoH5b4Kwxpc06DJ+Yz+Tk+
         +29AICMAqFvePWEDuC6GH6QWeOrXr3jntLL1T4667lMasf+wx+wJeC3mnZ4EKLrTAw6B
         zbyg==
X-Forwarded-Encrypted: i=1; AJvYcCUiStl17tQpwbNW3LzIwk6CzWIXCIdP+mRRrOklhuZUOQrqojeNAxIp7cqHV4grHbgu8vf+Q4zoAKdjFhSPMa5Lnm1zHyOYdEABFcTz/snH
X-Gm-Message-State: AOJu0YyF7xnS/cdM0o8xtnKQlY8ftX1zwKxTDMTciXnKl2yEzO51q6Bz
	ETDSNJiQuvD6XNPvryV+D3Aa5bVuu48UzxljCV28GVo+3LdCN/THsosQNINczC4=
X-Google-Smtp-Source: AGHT+IHH0tD3H2b4nYjMLU3yefWBfcIBabXBtrcMk+XbHZMJ1kwyx0P2UJ9m1CeDn96dZhdAvQwZUw==
X-Received: by 2002:a05:6870:d8cc:b0:258:5143:a21a with SMTP id 586e51a60fabf-26c62c69d1cmr9739322fac.13.1723424456739;
        Sun, 11 Aug 2024 18:00:56 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c3dbe8cbdcsm3074062a12.61.2024.08.11.18.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 18:00:56 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v8 12/17] ACPI: RISC-V: Implement function to add implicit dependencies
Date: Mon, 12 Aug 2024 06:29:24 +0530
Message-ID: <20240812005929.113499-13-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812005929.113499-1-sunilvl@ventanamicro.com>
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_180057_799712_76D70395 
X-CRM114-Status: GOOD (  19.91  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Drew Fustini <dfustini@tenstorrent.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="cp1252"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

UklTQy1WIGludGVycnVwdCBjb250cm9sbGVycyBmb3Igd2lyZWQgaW50ZXJydXB0cyBhcmUgcGxh
dGZvcm0gZGV2aWNlcwphbmQgaGVuY2UgdGhlaXIgZHJpdmVyIHdpbGwgYmUgcHJvYmVkIGxhdGUu
IEFsc28sIEFQTElDIHdoaWNoIGlzIG9uZQpzdWNoIGludGVycnVwdCBjb250cm9sbGVyIGNhbiBu
b3QgYmUgcHJvYmVkIGVhcmx5IHNpbmNlIGl0IG5lZWRzIE1TSQpzZXJ2aWNlcy4gVGhpcyBuZWVk
cyBhIHByb2Jpbmcgb3JkZXIgYmV0d2VlbiB0aGUgaW50ZXJydXB0IGNvbnRyb2xsZXIKZHJpdmVy
IGFuZCB0aGUgZGV2aWNlIGRyaXZlcnMuCgpfREVQIGlzIHR5cGljYWxseSB1c2VkIHRvIGluZGlj
YXRlIHN1Y2ggZGVwZW5kZW5jaWVzLiBIb3dldmVyLCB0aGUKZGVwZW5kZW5jeSBtYXkgYmUgYWxy
ZWFkeSBhdmFpbGFibGUgbGlrZSBHU0kgbWFwcGluZy4gSGVuY2UsIGluc3RlYWQgb2YKYW4gZXhw
bGljaXQgX0RFUCwgYXJjaGl0ZWN0dXJlIGNhbiBmaW5kIHRoZSBpbXBsaWNpdCBkZXBlbmRlbmNp
ZXMgYW5kCmFkZCB0byB0aGUgZGVwZW5kZW5jeSBsaXN0LgoKRm9yIFJJU0MtViwgYWRkIHRoZSBk
ZXBlbmRlbmNpZXMgZm9yIGJlbG93IHVzZSBjYXNlcy4KCjEpIEZvciBkZXZpY2VzIHdoaWNoIGhh
cyBJUlEgcmVzb3VyY2UsIGZpbmQgb3V0IHRoZSBpbnRlcnJ1cHQgY29udHJvbGxlcgp1c2luZyBH
U0kgbnVtYmVyIG1hcCBhbmQgYWRkIHRoZSBkZXBlbmRlbmN5LgoKMikgRm9yIFBDSSBob3N0IGJy
aWRnZXM6CiAgICAgICAgYSkgSWYgX1BSVCBpbmRpY2F0ZSBQQ0kgbGluayBkZXZpY2VzLCBhZGQg
ZGVwZW5kZW5jeSBvbiB0aGUgbGluawogICAgICAgICAgIGRldmljZS4KICAgICAgICBiKSBJZiBf
UFJUIGluZGljYXRlcyBHU0ksIGZpbmQgb3V0IHRoZSBpbnRlcnJ1cHQgY29udHJvbGxlcgogICAg
ICAgICAgIHVzaW5nIEdTSSBudW1iZXIgbWFwIGFuZCBhZGQgdGhlIGRlcGVuZGVuY3kuCgpTaWdu
ZWQtb2ZmLWJ5OiBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4KVGVzdGVkLWJ5
OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Ci0tLQogZHJpdmVycy9hY3BpL3Jp
c2N2L2lycS5jIHwgMTU1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDE1NSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9h
Y3BpL3Jpc2N2L2lycS5jIGIvZHJpdmVycy9hY3BpL3Jpc2N2L2lycS5jCmluZGV4IDkwMjg3ODdj
NzNhNy4uY2NlZDk2MGMyYWVmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2FjcGkvcmlzY3YvaXJxLmMK
KysrIGIvZHJpdmVycy9hY3BpL3Jpc2N2L2lycS5jCkBAIC0yMCw2ICsyMCwxMiBAQCBzdHJ1Y3Qg
cmlzY3ZfZXh0X2ludGNfbGlzdCB7CiAJc3RydWN0IGxpc3RfaGVhZAlsaXN0OwogfTsKIAorc3Ry
dWN0IGFjcGlfaXJxX2RlcF9jdHggeworCWludAkJcmM7CisJdW5zaWduZWQgaW50CWluZGV4Owor
CWFjcGlfaGFuZGxlCWhhbmRsZTsKK307CisKIExJU1RfSEVBRChleHRfaW50Y19saXN0KTsKIAog
c3RhdGljIGludCBpcnFjaGlwX2NtcF9mdW5jKGNvbnN0IHZvaWQgKmluMCwgY29uc3Qgdm9pZCAq
aW4xKQpAQCAtMTc4LDMgKzE4NCwxNTIgQEAgdm9pZCBfX2luaXQgcmlzY3ZfYWNwaV9pbml0X2dz
aV9tYXBwaW5nKHZvaWQpCiAJaWYgKGFjcGlfdGFibGVfcGFyc2VfbWFkdChBQ1BJX01BRFRfVFlQ
RV9BUExJQywgcmlzY3ZfYWNwaV9hcGxpY19wYXJzZV9tYWR0LCAwKSA+IDApCiAJCWFjcGlfZ2V0
X2RldmljZXMoIlJTQ1YwMDAyIiwgcmlzY3ZfYWNwaV9jcmVhdGVfZ3NpX21hcCwgTlVMTCwgTlVM
TCk7CiB9CisKK3N0YXRpYyBhY3BpX2hhbmRsZSByaXNjdl9hY3BpX2dldF9nc2lfaGFuZGxlKHUz
MiBnc2kpCit7CisJc3RydWN0IHJpc2N2X2V4dF9pbnRjX2xpc3QgKmV4dF9pbnRjX2VsZW1lbnQ7
CisJc3RydWN0IGxpc3RfaGVhZCAqaTsKKworCWxpc3RfZm9yX2VhY2goaSwgJmV4dF9pbnRjX2xp
c3QpIHsKKwkJZXh0X2ludGNfZWxlbWVudCA9IGxpc3RfZW50cnkoaSwgc3RydWN0IHJpc2N2X2V4
dF9pbnRjX2xpc3QsIGxpc3QpOworCQlpZiAoZ3NpID49IGV4dF9pbnRjX2VsZW1lbnQtPmdzaV9i
YXNlICYmCisJCSAgICBnc2kgPCAoZXh0X2ludGNfZWxlbWVudC0+Z3NpX2Jhc2UgKyBleHRfaW50
Y19lbGVtZW50LT5ucl9pcnFzKSkKKwkJCXJldHVybiBleHRfaW50Y19lbGVtZW50LT5oYW5kbGU7
CisJfQorCisJcmV0dXJuIE5VTEw7Cit9CisKK3N0YXRpYyBhY3BpX3N0YXR1cyByaXNjdl9hY3Bp
X2lycV9nZXRfcGFyZW50KHN0cnVjdCBhY3BpX3Jlc291cmNlICphcmVzLCB2b2lkICpjb250ZXh0
KQoreworCXN0cnVjdCBhY3BpX2lycV9kZXBfY3R4ICpjdHggPSBjb250ZXh0OworCXN0cnVjdCBh
Y3BpX3Jlc291cmNlX2lycSAqaXJxOworCXN0cnVjdCBhY3BpX3Jlc291cmNlX2V4dGVuZGVkX2ly
cSAqZWlycTsKKworCXN3aXRjaCAoYXJlcy0+dHlwZSkgeworCWNhc2UgQUNQSV9SRVNPVVJDRV9U
WVBFX0lSUToKKwkJaXJxID0gJmFyZXMtPmRhdGEuaXJxOworCQlpZiAoY3R4LT5pbmRleCA+PSBp
cnEtPmludGVycnVwdF9jb3VudCkgeworCQkJY3R4LT5pbmRleCAtPSBpcnEtPmludGVycnVwdF9j
b3VudDsKKwkJCXJldHVybiBBRV9PSzsKKwkJfQorCQljdHgtPmhhbmRsZSA9IHJpc2N2X2FjcGlf
Z2V0X2dzaV9oYW5kbGUoaXJxLT5pbnRlcnJ1cHRzW2N0eC0+aW5kZXhdKTsKKwkJcmV0dXJuIEFF
X0NUUkxfVEVSTUlOQVRFOworCWNhc2UgQUNQSV9SRVNPVVJDRV9UWVBFX0VYVEVOREVEX0lSUToK
KwkJZWlycSA9ICZhcmVzLT5kYXRhLmV4dGVuZGVkX2lycTsKKwkJaWYgKGVpcnEtPnByb2R1Y2Vy
X2NvbnN1bWVyID09IEFDUElfUFJPRFVDRVIpCisJCQlyZXR1cm4gQUVfT0s7CisKKwkJaWYgKGN0
eC0+aW5kZXggPj0gZWlycS0+aW50ZXJydXB0X2NvdW50KSB7CisJCQljdHgtPmluZGV4IC09IGVp
cnEtPmludGVycnVwdF9jb3VudDsKKwkJCXJldHVybiBBRV9PSzsKKwkJfQorCisJCS8qIFN1cHBv
cnQgR1NJcyBvbmx5ICovCisJCWlmIChlaXJxLT5yZXNvdXJjZV9zb3VyY2Uuc3RyaW5nX2xlbmd0
aCkKKwkJCXJldHVybiBBRV9PSzsKKworCQljdHgtPmhhbmRsZSA9IHJpc2N2X2FjcGlfZ2V0X2dz
aV9oYW5kbGUoZWlycS0+aW50ZXJydXB0c1tjdHgtPmluZGV4XSk7CisJCXJldHVybiBBRV9DVFJM
X1RFUk1JTkFURTsKKwl9CisKKwlyZXR1cm4gQUVfT0s7Cit9CisKK3N0YXRpYyBpbnQgcmlzY3Zf
YWNwaV9pcnFfZ2V0X2RlcChhY3BpX2hhbmRsZSBoYW5kbGUsIHVuc2lnbmVkIGludCBpbmRleCwg
YWNwaV9oYW5kbGUgKmdzaV9oYW5kbGUpCit7CisJc3RydWN0IGFjcGlfaXJxX2RlcF9jdHggY3R4
ID0gey1FSU5WQUwsIGluZGV4LCBOVUxMfTsKKworCWlmICghZ3NpX2hhbmRsZSkKKwkJcmV0dXJu
IDA7CisKKwlhY3BpX3dhbGtfcmVzb3VyY2VzKGhhbmRsZSwgTUVUSE9EX05BTUVfX0NSUywgcmlz
Y3ZfYWNwaV9pcnFfZ2V0X3BhcmVudCwgJmN0eCk7CisJKmdzaV9oYW5kbGUgPSBjdHguaGFuZGxl
OworCWlmICgqZ3NpX2hhbmRsZSkKKwkJcmV0dXJuIDE7CisKKwlyZXR1cm4gMDsKK30KKworc3Rh
dGljIHUzMiByaXNjdl9hY3BpX2FkZF9wcnRfZGVwKGFjcGlfaGFuZGxlIGhhbmRsZSkKK3sKKwlz
dHJ1Y3QgYWNwaV9idWZmZXIgYnVmZmVyID0geyBBQ1BJX0FMTE9DQVRFX0JVRkZFUiwgTlVMTCB9
OworCXN0cnVjdCBhY3BpX3BjaV9yb3V0aW5nX3RhYmxlICplbnRyeTsKKwlzdHJ1Y3QgYWNwaV9o
YW5kbGVfbGlzdCBkZXBfZGV2aWNlczsKKwlhY3BpX2hhbmRsZSBnc2lfaGFuZGxlOworCWFjcGlf
aGFuZGxlIGxpbmtfaGFuZGxlOworCWFjcGlfc3RhdHVzIHN0YXR1czsKKwl1MzIgY291bnQgPSAw
OworCisJc3RhdHVzID0gYWNwaV9nZXRfaXJxX3JvdXRpbmdfdGFibGUoaGFuZGxlLCAmYnVmZmVy
KTsKKwlpZiAoQUNQSV9GQUlMVVJFKHN0YXR1cykpIHsKKwkJYWNwaV9oYW5kbGVfZXJyKGhhbmRs
ZSwgImZhaWxlZCB0byBnZXQgSVJRIHJvdXRpbmcgdGFibGVcbiIpOworCQlrZnJlZShidWZmZXIu
cG9pbnRlcik7CisJCXJldHVybiAwOworCX0KKworCWVudHJ5ID0gYnVmZmVyLnBvaW50ZXI7CisJ
d2hpbGUgKGVudHJ5ICYmIChlbnRyeS0+bGVuZ3RoID4gMCkpIHsKKwkJaWYgKGVudHJ5LT5zb3Vy
Y2VbMF0pIHsKKwkJCWFjcGlfZ2V0X2hhbmRsZShoYW5kbGUsIGVudHJ5LT5zb3VyY2UsICZsaW5r
X2hhbmRsZSk7CisJCQlkZXBfZGV2aWNlcy5jb3VudCA9IDE7CisJCQlkZXBfZGV2aWNlcy5oYW5k
bGVzID0ga2NhbGxvYygxLCBzaXplb2YoKmRlcF9kZXZpY2VzLmhhbmRsZXMpLCBHRlBfS0VSTkVM
KTsKKwkJCWlmICghZGVwX2RldmljZXMuaGFuZGxlcykgeworCQkJCWFjcGlfaGFuZGxlX2Vyciho
YW5kbGUsICJmYWlsZWQgdG8gYWxsb2NhdGUgbWVtb3J5XG4iKTsKKwkJCQljb250aW51ZTsKKwkJ
CX0KKworCQkJZGVwX2RldmljZXMuaGFuZGxlc1swXSA9IGxpbmtfaGFuZGxlOworCQkJY291bnQg
Kz0gYWNwaV9zY2FuX2FkZF9kZXAoaGFuZGxlLCAmZGVwX2RldmljZXMpOworCQl9IGVsc2Ugewor
CQkJZ3NpX2hhbmRsZSA9IHJpc2N2X2FjcGlfZ2V0X2dzaV9oYW5kbGUoZW50cnktPnNvdXJjZV9p
bmRleCk7CisJCQlkZXBfZGV2aWNlcy5jb3VudCA9IDE7CisJCQlkZXBfZGV2aWNlcy5oYW5kbGVz
ID0ga2NhbGxvYygxLCBzaXplb2YoKmRlcF9kZXZpY2VzLmhhbmRsZXMpLCBHRlBfS0VSTkVMKTsK
KwkJCWlmICghZGVwX2RldmljZXMuaGFuZGxlcykgeworCQkJCWFjcGlfaGFuZGxlX2VycihoYW5k
bGUsICJmYWlsZWQgdG8gYWxsb2NhdGUgbWVtb3J5XG4iKTsKKwkJCQljb250aW51ZTsKKwkJCX0K
KworCQkJZGVwX2RldmljZXMuaGFuZGxlc1swXSA9IGdzaV9oYW5kbGU7CisJCQljb3VudCArPSBh
Y3BpX3NjYW5fYWRkX2RlcChoYW5kbGUsICZkZXBfZGV2aWNlcyk7CisJCX0KKworCQllbnRyeSA9
IChzdHJ1Y3QgYWNwaV9wY2lfcm91dGluZ190YWJsZSAqKQorCQkJKCh1bnNpZ25lZCBsb25nKWVu
dHJ5ICsgZW50cnktPmxlbmd0aCk7CisJfQorCisJa2ZyZWUoYnVmZmVyLnBvaW50ZXIpOworCXJl
dHVybiBjb3VudDsKK30KKworc3RhdGljIHUzMiByaXNjdl9hY3BpX2FkZF9pcnFfZGVwKGFjcGlf
aGFuZGxlIGhhbmRsZSkKK3sKKwlzdHJ1Y3QgYWNwaV9oYW5kbGVfbGlzdCBkZXBfZGV2aWNlczsK
KwlhY3BpX2hhbmRsZSBnc2lfaGFuZGxlOworCXUzMiBjb3VudCA9IDA7CisJaW50IGk7CisKKwlm
b3IgKGkgPSAwOworCSAgICAgcmlzY3ZfYWNwaV9pcnFfZ2V0X2RlcChoYW5kbGUsIGksICZnc2lf
aGFuZGxlKTsKKwkgICAgIGkrKykgeworCQlkZXBfZGV2aWNlcy5jb3VudCA9IDE7CisJCWRlcF9k
ZXZpY2VzLmhhbmRsZXMgPSBrY2FsbG9jKDEsIHNpemVvZigqZGVwX2RldmljZXMuaGFuZGxlcyks
IEdGUF9LRVJORUwpOworCQlpZiAoIWRlcF9kZXZpY2VzLmhhbmRsZXMpIHsKKwkJCWFjcGlfaGFu
ZGxlX2VycihoYW5kbGUsICJmYWlsZWQgdG8gYWxsb2NhdGUgbWVtb3J5XG4iKTsKKwkJCWNvbnRp
bnVlOworCQl9CisKKwkJZGVwX2RldmljZXMuaGFuZGxlc1swXSA9IGdzaV9oYW5kbGU7CisJCWNv
dW50ICs9IGFjcGlfc2Nhbl9hZGRfZGVwKGhhbmRsZSwgJmRlcF9kZXZpY2VzKTsKKwl9CisKKwly
ZXR1cm4gY291bnQ7Cit9CisKK3UzMiBhcmNoX2FjcGlfYWRkX2F1dG9fZGVwKGFjcGlfaGFuZGxl
IGhhbmRsZSkKK3sKKwlpZiAoYWNwaV9oYXNfbWV0aG9kKGhhbmRsZSwgIl9QUlQiKSkKKwkJcmV0
dXJuIHJpc2N2X2FjcGlfYWRkX3BydF9kZXAoaGFuZGxlKTsKKworCXJldHVybiByaXNjdl9hY3Bp
X2FkZF9pcnFfZGVwKGhhbmRsZSk7Cit9Ci0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
