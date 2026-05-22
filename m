Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21530CD5BB3
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 15:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yCDCMuDnrp9DhaDyElVVTBbtpCcgD1vK0ha/F6Zr/6A=; b=WTJr+MXZBfI55J
	eqjCL/UJMjbdjO3LtE6ImoWxvseCOBeSXO6IKYjSXQZoBbEv1RWZWe9VflJ32FU1JYkpbfOvKGhDx
	2pyAfLLqN3Z09ZHCYUK4tJUDEMFg9hR4dfPFirHXdXN1TjnG35fVLp97D60TuaSTcmW0czoT9FPYW
	5XVzPOI3ikMsWsQkBewWsTQtiKPggiqvDirDP9e3yAqWBLgP9zcmvUFpNGBBa9YlF7jFxA1sjSKed
	NVN5VhzS9t8UOdhgKCydrnH9M3Y1JRg8uT1q3ZKXrff337a02+cvFDLUhWiS9JMTiTFGoc9pYc8zL
	ZJdfG2sOZKMis2Xo/DaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRLw-0000000BBuV-1iGA;
	Fri, 22 May 2026 14:59:56 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRLt-0000000BBtk-1YqE
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 14:59:55 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49041e84237so8474145e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 07:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779461991; x=1780066791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DLi6X6odP8H/h8Y8Pr/vuDUyKcCjgbdHGCb8Tzve4fY=;
        b=Hw6VMO+x/RxMXhuOtS58RPMdymUGd41fx/wxfODQDnuQIo9n0UsYurwDEXKXEOtD/T
         YnSJwhUndrtT5mxhl7ggOC6QbOCRY7dh3A1GG6XVfCT+VhER5C3+iXt+JR55m+sMIVyT
         xl2skLlwcD3KDZH6ZyGkUh5fNtV9gVukw02MkBG7JqC1GNC+RyWIlZh4Jcf3eLmogz+O
         pm1DSKR8qCDCmOMMmt6Jv/I4T7GS8SO9CrLfLWeCe9nPbeMq/yqF8055PC0va3D52goU
         LrUq5uJYOunbw1wf9Z78eA7xmvNTrCqaeoZSG3F3Ldx2PZJKJIKmJTCofat3BEoJdPCs
         gaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779461991; x=1780066791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLi6X6odP8H/h8Y8Pr/vuDUyKcCjgbdHGCb8Tzve4fY=;
        b=MdtHDprUn3VZABoAUW+/TJc5QMdOZqEyfpxspwmdRS5scf0e68vkodl/2Fbzcs4T4S
         zd4JTSncn1zJPat4MXxM1ScM5D0cYlkFBcjvsHZ87XnZDvLMjBYNSoxrwNMoQvHP0s6w
         S2I/q1al4+Kp4OQyRHDk4i6jVbBhENvGYUFapcOlvmvN4dFDPO3XFAQFUt/zUgoRw4g2
         c4htbukpw8mggPKPy1xEQxhZ0PKcJGHR4l58uQ3HfKuG1UPsWA4GgeJ9Hnq7v7Z5gcTx
         ZAJtPgMvsUT8pOprzCXm9GAtP6539q39aE4OAI2VI7lKRC8lmwkAbpYX4e73YkbvCWCo
         VSww==
X-Forwarded-Encrypted: i=1; AFNElJ97VByQLM5KHjBxZ8Tj0zHvIQDq7i0H8OuuSDHwpfizjaUAn57E+lWv5+tPp3OWCUhhPARID7JhC3TLcw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yytzn53gg83gTxhTySl2icWD5hiOSi5JEhVVtbVNu97cyaUMLg8
	EcVvxWNWPHCyVqn3eizqsjDIjnQjpfuFOeZGXpJDkNEdaWd6zpc8MHPgngXcJx9VPiA=
X-Gm-Gg: Acq92OFTsuu29HYynNXVm8J8lVIVN4b31lXKaDN4YiCTEoJQmroTWs2JKDVxDHtrxMO
	dZh/1U6NZ8nMQVLRySNgdEmoRV1/8fRjBxpvXR5P60eiH5CxTdKTTOPiMCLfeh2UPVlt5EK/3Vo
	mpfwsv6kMejbCPPxEYQNFZYZiP7JtgHaSddDUEyCZVMBwUY/b+pxuwAi5sfeVUccYTd0zO6pVpG
	opWh3Bx6Z5l3QeJAus4LziO33GIBykAWW30oPc1Ty6KqPDDvwb0nwCqXb1koB8oFdiau8xa5B2a
	aC4yhL6tptQ/dGEJsY4jZ2/JAYYuwNRKKUULI5exCAzI8k+Ae5TuuGtN3YgAMHy9TKv9fPOtvhF
	vcEqtsG7HduXpJPzkOeXSkK7cNjag6r8PN0L3S0y8Oi6tB4WG2KiADo5Xw2fCjZwIpLnwIxBpX7
	veyAB4O+zoW72coGuFrSt5Md2FfU4XDwGehIw2xDvHTAwolACA0twNKxkZQZYUUJrV399tpdu79
	tUcDNqz+g+liSE=
X-Received: by 2002:a7b:c053:0:b0:488:7d01:f67b with SMTP id 5b1f17b1804b1-49035f2e1a1mr79160285e9.6.1779461990892;
        Fri, 22 May 2026 07:59:50 -0700 (PDT)
Received: from localhost (p200300f65f47db04fdedbb26b9ad100d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:fded:bb26:b9ad:100d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45eb6d5cb9asm5241495f8f.27.2026.05.22.07.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 07:59:50 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] iommu/riscv: Drop superflous zeros in pci_device_id array
Date: Fri, 22 May 2026 16:59:43 +0200
Message-ID: <20260522145943.774344-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3462; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=9zUTOYb+g+3EZt7oIye6rhzKcFrhONL8UItJ3EnXyfg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqEG9f52lyWQQzuWjlCjyQbzzJzLwj5lurSUYrB 8lZOKPaAFKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahBvXwAKCRCPgPtYfRL+ TvWLB/9ik2N5fGT6RT2UEJFI4kuhLU1DsBWTnMQHyJtT6Dy/pmmAAC6CIojtti5tyTJO8ywoAVD YZ+CAUqwr8oLBppm7sXXNBgKOLDVIbJna98X9bmu7Xy/WuADWjhn8gXdGne+9KHA4rPK2EJm/YX JYmLeOMqyfLToW1LO4V1j1D8HkzhX0+36IEMU93LlqSjjvw3JFv08Uvuco7ySvFEirKujasQrbt D7iLYpurq7JBh53BCeTqSDbhrL5jk4Voax26uGO7Hb2nHnspZRQYQhQL8n/OWarN+Tri8hNhiWC yb1vF1KMsKnCWpem7hQ81E38SGitkv6JLnfYQsvbkrHFDe56
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_075953_435660_36542930 
X-CRM114-Status: GOOD (  19.29  )
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

VGhlIC5kcml2ZXJfZGF0YSBtZW1iZXIgb2YgdGhlIHN0cnVjdCBwY2lfZGV2aWNlX2lkIGFycmF5
IHdlcmUKaW5pdGlhbGl6ZWQgYnkgYSBsaXN0IGV4cHJlc3Npb25zIHRvIHplcm8gd2l0aG91dCBt
YWtpbmcgdXNlIG9mIHRoYXQKdmFsdWUuIEluIHRoaXMgY2FzZSBpdCdzIGJldHRlciB0byBub3Qg
c3BlY2lmeSBhIHZhbHVlIGF0IGFsbCBhbmQgbGV0CnRoZSBjb21waWxlciBmaWxsIGluIHRoZSB6
ZXJvcy4gU2FtZSBmb3IgdGhlIGxpc3QgdGVybWluYXRvciB0aGF0IGNhbgpiZXR0ZXIgYmUgY29t
cGxldGVseSBlbXB0eS4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIChUaGUgQ2Fw
YWJsZSBIdWIpIDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgotLS0KSGVsbG8sCgp3aGls
ZSBiZWluZyBhIGNsZWFudXAgdGhhdCBjYW4gc3RhbmQgb24gaXRzIG93biB0aGlzIGlzIGFsc28g
YQpwcmVwYXJhdGlvbiBmb3IgbWFraW5nIGRyaXZlcl9kYXRhIGFuIGFub255bW91cyB1bmlvbiB0
aGF0IHJlcXVpcmVzIHRoYXQKLmRyaXZlcl9kYXRhIGlzIGluaXRpYWxpemVkIGJ5IG5hbWUgYW5k
IG5vdCBieSBsaXN0IG9yZGVyLiBUaGUgdW5pb24KYWxsb3dzIHRvIG1ha2UgYmV0dGVyIHVzZSBv
ZiB0aGUgQyB0eXBlIHN5c3RlbSBhbmQgZHJvcHMgdGhlIG5lZWQgZm9yCmNhc3RpbmcuIFRoZSBj
aGFuZ2UgdG8gYSBkcml2ZXIgd2lsbCBsb29rIGFzIGZvbGxvd3M6CgoJZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L3BsYXRmb3JtL2ludGVsLW1pZC9wd3IuYyBiL2FyY2gveDg2L3BsYXRmb3JtL2ludGVs
LW1pZC9wd3IuYwoJaW5kZXggMTczOTk3MTQ3OGZmLi5jMGQ5ZGE4MWQ1MTIgMTAwNjQ0CgktLS0g
YS9hcmNoL3g4Ni9wbGF0Zm9ybS9pbnRlbC1taWQvcHdyLmMKCSsrKyBiL2FyY2gveDg2L3BsYXRm
b3JtL2ludGVsLW1pZC9wd3IuYwoJQEAgLTM0Nyw3ICszNDcsNyBAQCBzdHJ1Y3QgbWlkX3B3cl9k
ZXZpY2VfaW5mbyB7CgkgCgkgc3RhdGljIGludCBtaWRfcHdyX3Byb2JlKHN0cnVjdCBwY2lfZGV2
ICpwZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqaWQpCgkgewoJLQlzdHJ1Y3QgbWlk
X3B3cl9kZXZpY2VfaW5mbyAqaW5mbyA9ICh2b2lkICopaWQtPmRyaXZlcl9kYXRhOwoJKwlzdHJ1
Y3QgbWlkX3B3cl9kZXZpY2VfaW5mbyAqaW5mbyA9IGlkLT5kcml2ZXJfZGF0YV9wdHI7CgkJc3Ry
dWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKCQlzdHJ1Y3QgbWlkX3B3ciAqcHdyOwoJCWlu
dCByZXQ7CglAQCAtNDcxLDggKzQ3MSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWlkX3B3cl9k
ZXZpY2VfaW5mbyB0bmdfaW5mbyA9IHsKCSAKCSAvKiBUaGlzIHRhYmxlIHNob3VsZCBiZSBpbiBz
eW5jIHdpdGggdGhlIG9uZSBpbiBkcml2ZXJzL3BjaS9wY2ktbWlkLmMgKi8KCSBzdGF0aWMgY29u
c3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgbWlkX3B3cl9wY2lfaWRzW10gPSB7CgktCXsgUENJX1ZE
RVZJQ0UoSU5URUwsIFBDSV9ERVZJQ0VfSURfUEVOV0VMTCksIC5kcml2ZXJfZGF0YSA9IChrZXJu
ZWxfdWxvbmdfdCkmcG53X2luZm8gfSwKCS0JeyBQQ0lfVkRFVklDRShJTlRFTCwgUENJX0RFVklD
RV9JRF9UQU5HSUVSKSwgLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9uZ190KSZ0bmdfaW5mbyB9
LAoJKwl7IFBDSV9WREVWSUNFKElOVEVMLCBQQ0lfREVWSUNFX0lEX1BFTldFTEwpLCAuZHJpdmVy
X2RhdGFfcHRyID0gJnBud19pbmZvIH0sCgkrCXsgUENJX1ZERVZJQ0UoSU5URUwsIFBDSV9ERVZJ
Q0VfSURfVEFOR0lFUiksIC5kcml2ZXJfZGF0YV9wdHIgPSAmdG5nX2luZm8gfSwKCQl7fQoJIH07
CiAKd2hpY2ggaXMgYSBuaWNlIGltcHJvdmVtZW50IGRyb3BwaW5nIHRocmVlIGNhc3RzIGFuZCB0
aGF0IHdpbGwgbWFrZSB0aGUKY29tcGlsZXIgc2F5OgoKYXJjaC94ODYvcGxhdGZvcm0vaW50ZWwt
bWlkL3B3ci5jOiBJbiBmdW5jdGlvbiDigJhtaWRfcHdyX3Byb2Jl4oCZOgphcmNoL3g4Ni9wbGF0
Zm9ybS9pbnRlbC1taWQvcHdyLmM6MzUwOjQ0OiBlcnJvcjogaW5pdGlhbGl6YXRpb24gZGlzY2Fy
ZHMg4oCYY29uc3TigJkgcXVhbGlmaWVyIGZyb20gcG9pbnRlciB0YXJnZXQgdHlwZSBbLVdlcnJv
cj1kaXNjYXJkZWQtcXVhbGlmaWVyc10KICAzNTAgfCAgICAgICAgIHN0cnVjdCBtaWRfcHdyX2Rl
dmljZV9pbmZvICppbmZvID0gaWQtPmRyaXZlcl9kYXRhX3B0cjsKICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn4KCihzbyBpdCBwcm9tb3RlcyB0aGF0
IGRyaXZlciBkYXRhIGlzIHN1cHBvc2VkIHRvIGJlIGNvbnN0KS4KClRoZXJlIGlzIG5vIGlvbW11
IGRyaXZlciB1c2luZyBwb2ludGVycyBmb3IgZHJpdmVyIGRhdGEsIHNvIHRoZSBleGFtcGxlCmlz
IGZyb20gYSBkaWZmZXJlbnQgc3Vic3lzdGVtLiBBbHNvIHRoaXMgaXMgdGhlIG9ubHkgcGNpIGRy
aXZlciBpbgpkcml2ZXJzL2lvbW11LCBzbyBubyBmdXJ0aGVyIHBhdGNoZXMgZm9yIHRoaXMgcGFy
dCBvZiBteSBxdWVzdCB0byB0aGF0CnN1YnN5c3RlbS4KCkJlc3QgcmVnYXJkcwpVd2UKCiBkcml2
ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBjaS5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21t
dS9yaXNjdi9pb21tdS1wY2kuYyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtcGNpLmMKaW5k
ZXggZDgyZDJiMDA5MDRjLi44YWJmNTJkZmI0YzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW9tbXUv
cmlzY3YvaW9tbXUtcGNpLmMKKysrIGIvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1wY2kuYwpA
QCAtMTA5LDkgKzEwOSw5IEBAIHN0YXRpYyB2b2lkIHJpc2N2X2lvbW11X3BjaV9zaHV0ZG93bihz
dHJ1Y3QgcGNpX2RldiAqcGRldikKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNl
X2lkIHJpc2N2X2lvbW11X3BjaV90YmxbXSA9IHsKLQl7UENJX1ZERVZJQ0UoUkVESEFULCBQQ0lf
REVWSUNFX0lEX1JFREhBVF9SSVNDVl9JT01NVSksIDB9LAotCXtQQ0lfVkRFVklDRShSSVZPUywg
UENJX0RFVklDRV9JRF9SSVZPU19SSVNDVl9JT01NVV9HQSksIDB9LAotCXswLH0KKwl7IFBDSV9W
REVWSUNFKFJFREhBVCwgUENJX0RFVklDRV9JRF9SRURIQVRfUklTQ1ZfSU9NTVUpIH0sCisJeyBQ
Q0lfVkRFVklDRShSSVZPUywgUENJX0RFVklDRV9JRF9SSVZPU19SSVNDVl9JT01NVV9HQSkgfSwK
Kwl7IH0KIH07CiAKIHN0YXRpYyBzdHJ1Y3QgcGNpX2RyaXZlciByaXNjdl9pb21tdV9wY2lfZHJp
dmVyID0gewoKYmFzZS1jb21taXQ6IDI1NGY0OTYzNGVlMTZhNzMxMTc0ZDJhZTM0YmM1MGJkNWY0
NWU3MzEKLS0gCjIuNDcuMwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
