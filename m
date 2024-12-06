Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96EDE7717B
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 16:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yiFRZbflJj0XZmXfjcIJun8MjXLkg5YixIgyljY5CkY=; b=mk9BviV6UKirBV
	UmjB3MXpO1xIdar3AzALhcH3kMXsjJtBieTAeKEgdcKjdPtyZVYg0BbOk/oxmG9VrRlNNJjk+tByc
	MEx0It6+zfGTmpenTTWp6eVwMdEo7Ckqjw+V5V8+g1+AhomcDRI2ECJWKo/I1KPe5e0287323bDgl
	X2SYL/aq6r3fXraHmkWcHPdpdZVzyDHGdylYF+cbwwGa78BWplZVXgw7Lh4J3QXe898ch6+APLNAT
	Rrxj/n1uGX0IlK+D8nQgsn3ElWDmGjNQkqMyuxDLt+SCBxyZ4mMUMiHwkPuIxk64UmINWDDQHSN+x
	ZO0md8f0fV/lUzjoLniA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbQT-00000002DOF-2I8u;
	Fri, 06 Dec 2024 16:43:33 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbEY-00000002AM7-3xIF
	for linux-riscv@lists.infradead.org;
	Fri, 06 Dec 2024 16:31:16 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-385e35912f1so1689979f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Dec 2024 08:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733502673; x=1734107473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pTgQSov7vYTWNucdQE0t9hyfOwyYPp0snQQ1hygLdA=;
        b=vPs+nmqP5EhBxPfOxdtt4W6CeUWNr/LKELP4Am8MDe1EAi4E08bI/6o+8M5F0JgK8g
         XTrJDVbuX++23Q3C2H66slqDF+wiEzaQlRjKXwchCGimsxE63uoErpB1/rcWps2Sx+Nk
         86mYPc1StFzIaKSRA4mBo7idztungb9FPn/96NpmqaouxEuecTImSev8/zQy/egz5YOj
         D+J2z8M1CyNqSyNLFXrYoBIsbaJLcRr3xaDz5G1YUGFZ6X1+8OBZVKt/zw2HcR6KiH5D
         nb+zwWrxxtBxYu0TjBFO4NrJux14hdZiAFDaIROgq6Ht0MFIUO1pX6JIxdoJlOD30B+3
         PK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733502673; x=1734107473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pTgQSov7vYTWNucdQE0t9hyfOwyYPp0snQQ1hygLdA=;
        b=gK49KBpOVRxMcmLqplzWH8DKsKyNkye7L4tSIyGmFXvtzIp2gesMjAdyu2wgHdbPhX
         Azl3E/pgoLoAIcAYyQ5xrOxZI/5KCA52GR8rcFgV16lZ/25crhAk8QDIQBoN7+3mzVEH
         GvEr0BUGDBfOnJnG46MlReECeLLCw4PRd+EFWzUIeMJIIrATCu5PtgP4vR9DLjpMt0bx
         wleAeenRfLyK8OiRDLK9wYu1IiScuoaZvJ9rOoEEjL9uizszLc+lYbsI6wDkJEhOMi+i
         N/2BEkV6ZxwkXICRybygdGlxt5O4POiAegwob03EAm3A61W3+4iZV2OhsV218ZjLZYZT
         mh9A==
X-Forwarded-Encrypted: i=1; AJvYcCUG+pAPHHwI/fE6HwELdRrNYR6DFAlTO/hvF9X+gzVl2VthHp/xxczT4NHNunx++bWXsUkp08t3Qj1Vew==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdzI+WLQXW+w3z5ewDrGqIgsLNnnwqxL5he2tcOjEaf+Jn3LYt
	1gCLOdKNAtCiBPpACsHuZzDalVs/Hkt5i+ojpJk4ss1lr8DhC2NA6WFmYTnM0BM=
X-Gm-Gg: ASbGncvscd/tVdfI+yDL/zZvB8bYeJmbpvGUtYCBwQav+VMmaeZuT/EGHXNnS4S3cDb
	7Ho5stP3NPTA0MxPE5EH+/0sPgwl/+pyfk/D+AAIkUtGvHwEjBfVuU7+XnWc3ugcxdO4w3DvhDd
	gqjowoBNIfLgYt93lVGzIUIoMT4A6mmNtleq2+7FlAzFW5UhDeU+CVntfn4MZZlQ9SdWEMLRW11
	9JChy8LHtD6Qfp/fQukUfUTGenSY8uKcNm24BaYLN4m0fAVGXU=
X-Google-Smtp-Source: AGHT+IEXqcNtnOQtrn9HCLkcY6FnKIIl9CkgV9xxYEovPWiiPgpTNBlpOFS9Y9bIrLbUO0lLfarFWQ==
X-Received: by 2002:a05:6000:1846:b0:385:fb2c:6034 with SMTP id ffacd0b85a97d-3862b3e6fddmr2723661f8f.47.1733502673558;
        Fri, 06 Dec 2024 08:31:13 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862f02f5c3sm1151942f8f.65.2024.12.06.08.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:31:12 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Atish Patra <atishp@atishpatra.org>
Subject: [PATCH v3 4/4] perf: RISC-V: add support for SSE event
Date: Fri,  6 Dec 2024 17:31:00 +0100
Message-ID: <20241206163102.843505-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241206163102.843505-1-cleger@rivosinc.com>
References: <20241206163102.843505-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_083115_001379_E6F73F63 
X-CRM114-Status: GOOD (  16.53  )
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

SW4gb3JkZXIgdG8gdXNlIFNTRSB3aXRoaW4gUE1VIGRyaXZlcnMsIHJlZ2lzdGVyIGEgU1NFIGhh
bmRsZXIgZm9yIHRoZQpsb2NhbCBQTVUgZXZlbnQuIFJldXNlIHRoZSBleGlzdGluZyBvdmVyZmxv
dyBJUlEgaGFuZGxlciBhbmQgcGFzcwphcHByb3ByaWF0ZSBwdF9yZWdzLgoKU2lnbmVkLW9mZi1i
eTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIGRyaXZlcnMvcGVy
Zi9yaXNjdl9wbXVfc2JpLmMgfCA1MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIGIvZHJpdmVycy9wZXJmL3Jp
c2N2X3BtdV9zYmkuYwppbmRleCAxYWEzMDNmNzZjYzcuLmJkN2FiMTU0ODNkYiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYworKysgYi9kcml2ZXJzL3BlcmYvcmlzY3Zf
cG11X3NiaS5jCkBAIC0xNyw2ICsxNyw3IEBACiAjaW5jbHVkZSA8bGludXgvaXJxZG9tYWluLmg+
CiAjaW5jbHVkZSA8bGludXgvb2ZfaXJxLmg+CiAjaW5jbHVkZSA8bGludXgvb2YuaD4KKyNpbmNs
dWRlIDxsaW51eC9yaXNjdl9zc2UuaD4KICNpbmNsdWRlIDxsaW51eC9jcHVfcG0uaD4KICNpbmNs
dWRlIDxsaW51eC9zY2hlZC9jbG9jay5oPgogI2luY2x1ZGUgPGxpbnV4L3NvYy9hbmRlcy9pcnEu
aD4KQEAgLTk0NiwxMCArOTQ3LDEwIEBAIHN0YXRpYyB2b2lkIHBtdV9zYmlfc3RhcnRfb3ZlcmZs
b3dfbWFzayhzdHJ1Y3QgcmlzY3ZfcG11ICpwbXUsCiAJCXBtdV9zYmlfc3RhcnRfb3ZmX2N0cnNf
c2JpKGNwdV9od19ldnQsIGN0cl9vdmZfbWFzayk7CiB9CiAKLXN0YXRpYyBpcnFyZXR1cm5fdCBw
bXVfc2JpX292Zl9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRldikKK3N0YXRpYyBpcnFyZXR1cm5f
dCBwbXVfc2JpX292Zl9oYW5kbGVyKHN0cnVjdCBjcHVfaHdfZXZlbnRzICpjcHVfaHdfZXZ0LAor
CQkJCSAgICAgICBzdHJ1Y3QgcHRfcmVncyAqcmVncywgYm9vbCBmcm9tX3NzZSkKIHsKIAlzdHJ1
Y3QgcGVyZl9zYW1wbGVfZGF0YSBkYXRhOwotCXN0cnVjdCBwdF9yZWdzICpyZWdzOwogCXN0cnVj
dCBod19wZXJmX2V2ZW50ICpod19ldnQ7CiAJdW5pb24gc2JpX3BtdV9jdHJfaW5mbyAqaW5mbzsK
IAlpbnQgbGlkeCwgaGlkeCwgZmlkeDsKQEAgLTk1Nyw3ICs5NTgsNiBAQCBzdGF0aWMgaXJxcmV0
dXJuX3QgcG11X3NiaV9vdmZfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXYpCiAJc3RydWN0IHBl
cmZfZXZlbnQgKmV2ZW50OwogCXU2NCBvdmVyZmxvdzsKIAl1NjQgb3ZlcmZsb3dlZF9jdHJzID0g
MDsKLQlzdHJ1Y3QgY3B1X2h3X2V2ZW50cyAqY3B1X2h3X2V2dCA9IGRldjsKIAl1NjQgc3RhcnRf
Y2xvY2sgPSBzY2hlZF9jbG9jaygpOwogCXN0cnVjdCByaXNjdl9wbXVfc25hcHNob3RfZGF0YSAq
c2RhdGEgPSBjcHVfaHdfZXZ0LT5zbmFwc2hvdF9hZGRyOwogCkBAIC05NjcsMTMgKzk2NywxNSBA
QCBzdGF0aWMgaXJxcmV0dXJuX3QgcG11X3NiaV9vdmZfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpk
ZXYpCiAJLyogRmlybXdhcmUgY291bnRlciBkb24ndCBzdXBwb3J0IG92ZXJmbG93IHlldCAqLwog
CWZpZHggPSBmaW5kX2ZpcnN0X2JpdChjcHVfaHdfZXZ0LT51c2VkX2h3X2N0cnMsIFJJU0NWX01B
WF9DT1VOVEVSUyk7CiAJaWYgKGZpZHggPT0gUklTQ1ZfTUFYX0NPVU5URVJTKSB7Ci0JCWNzcl9j
bGVhcihDU1JfU0lQLCBCSVQocmlzY3ZfcG11X2lycV9udW0pKTsKKwkJaWYgKCFmcm9tX3NzZSkK
KwkJCWNzcl9jbGVhcihDU1JfU0lQLCBCSVQocmlzY3ZfcG11X2lycV9udW0pKTsKIAkJcmV0dXJu
IElSUV9OT05FOwogCX0KIAogCWV2ZW50ID0gY3B1X2h3X2V2dC0+ZXZlbnRzW2ZpZHhdOwogCWlm
ICghZXZlbnQpIHsKLQkJQUxUX1NCSV9QTVVfT1ZGX0NMRUFSX1BFTkRJTkcocmlzY3ZfcG11X2ly
cV9tYXNrKTsKKwkJaWYgKCFmcm9tX3NzZSkKKwkJCUFMVF9TQklfUE1VX09WRl9DTEVBUl9QRU5E
SU5HKHJpc2N2X3BtdV9pcnFfbWFzayk7CiAJCXJldHVybiBJUlFfTk9ORTsKIAl9CiAKQEAgLTk4
OCwxNiArOTkwLDE2IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBwbXVfc2JpX292Zl9oYW5kbGVyKGlu
dCBpcnEsIHZvaWQgKmRldikKIAogCS8qCiAJICogT3ZlcmZsb3cgaW50ZXJydXB0IHBlbmRpbmcg
Yml0IHNob3VsZCBvbmx5IGJlIGNsZWFyZWQgYWZ0ZXIgc3RvcHBpbmcKLQkgKiBhbGwgdGhlIGNv
dW50ZXJzIHRvIGF2b2lkIGFueSByYWNlIGNvbmRpdGlvbi4KKwkgKiBhbGwgdGhlIGNvdW50ZXJz
IHRvIGF2b2lkIGFueSByYWNlIGNvbmRpdGlvbi4gV2hlbiB1c2luZyBTU0UsCisJICogaW50ZXJy
dXB0IGlzIGNsZWFyZWQgd2hlbiBzdG9wcGluZyBjb3VudGVycy4KIAkgKi8KLQlBTFRfU0JJX1BN
VV9PVkZfQ0xFQVJfUEVORElORyhyaXNjdl9wbXVfaXJxX21hc2spOworCWlmICghZnJvbV9zc2Up
CisJCUFMVF9TQklfUE1VX09WRl9DTEVBUl9QRU5ESU5HKHJpc2N2X3BtdV9pcnFfbWFzayk7CiAK
IAkvKiBObyBvdmVyZmxvdyBiaXQgaXMgc2V0ICovCiAJaWYgKCFvdmVyZmxvdykKIAkJcmV0dXJu
IElSUV9OT05FOwogCi0JcmVncyA9IGdldF9pcnFfcmVncygpOwotCiAJZm9yX2VhY2hfc2V0X2Jp
dChsaWR4LCBjcHVfaHdfZXZ0LT51c2VkX2h3X2N0cnMsIFJJU0NWX01BWF9DT1VOVEVSUykgewog
CQlzdHJ1Y3QgcGVyZl9ldmVudCAqZXZlbnQgPSBjcHVfaHdfZXZ0LT5ldmVudHNbbGlkeF07CiAK
QEAgLTEwNTMsNiArMTA1NSwyMiBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgcG11X3NiaV9vdmZfaGFu
ZGxlcihpbnQgaXJxLCB2b2lkICpkZXYpCiAJcmV0dXJuIElSUV9IQU5ETEVEOwogfQogCitzdGF0
aWMgaXJxcmV0dXJuX3QgcG11X3NiaV9vdmZfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGV2
KQoreworCXJldHVybiBwbXVfc2JpX292Zl9oYW5kbGVyKGRldiwgZ2V0X2lycV9yZWdzKCksIGZh
bHNlKTsKK30KKworc3RhdGljIGludCBwbXVfc2JpX292Zl9zc2VfaGFuZGxlcih1aW50MzJfdCBl
dnQsIHZvaWQgKmFyZywKKwkJCQkgICBzdHJ1Y3QgcHRfcmVncyAqcmVncykKK3sKKwlzdHJ1Y3Qg
Y3B1X2h3X2V2ZW50cyBfX3BlcmNwdSAqaHdfZXZlbnRzID0gYXJnOworCXN0cnVjdCBjcHVfaHdf
ZXZlbnRzICpod19ldmVudCA9IHJhd19jcHVfcHRyKGh3X2V2ZW50cyk7CisKKwlwbXVfc2JpX292
Zl9oYW5kbGVyKGh3X2V2ZW50LCByZWdzLCB0cnVlKTsKKworCXJldHVybiAwOworfQorCiBzdGF0
aWMgaW50IHBtdV9zYmlfc3RhcnRpbmdfY3B1KHVuc2lnbmVkIGludCBjcHUsIHN0cnVjdCBobGlz
dF9ub2RlICpub2RlKQogewogCXN0cnVjdCByaXNjdl9wbXUgKnBtdSA9IGhsaXN0X2VudHJ5X3Nh
ZmUobm9kZSwgc3RydWN0IHJpc2N2X3BtdSwgbm9kZSk7CkBAIC0xMTAwLDkgKzExMTgsMjIgQEAg
c3RhdGljIGludCBwbXVfc2JpX2R5aW5nX2NwdSh1bnNpZ25lZCBpbnQgY3B1LCBzdHJ1Y3QgaGxp
c3Rfbm9kZSAqbm9kZSkKIHN0YXRpYyBpbnQgcG11X3NiaV9zZXR1cF9pcnFzKHN0cnVjdCByaXNj
dl9wbXUgKnBtdSwgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlpbnQgcmV0Owor
CXN0cnVjdCBzc2VfZXZlbnQgKmV2dDsKIAlzdHJ1Y3QgY3B1X2h3X2V2ZW50cyBfX3BlcmNwdSAq
aHdfZXZlbnRzID0gcG11LT5od19ldmVudHM7CiAJc3RydWN0IGlycV9kb21haW4gKmRvbWFpbiA9
IE5VTEw7CiAKKwlldnQgPSBzc2VfZXZlbnRfcmVnaXN0ZXIoU0JJX1NTRV9FVkVOVF9MT0NBTF9Q
TVUsIDAsCisJCQkJIHBtdV9zYmlfb3ZmX3NzZV9oYW5kbGVyLCBod19ldmVudHMpOworCWlmICgh
SVNfRVJSKGV2dCkpIHsKKwkJcmV0ID0gc3NlX2V2ZW50X2VuYWJsZShldnQpOworCQlpZiAoIXJl
dCkgeworCQkJcHJfaW5mbygidXNpbmcgU1NFIGZvciBQTVUgZXZlbnQgZGVsaXZlcnlcbiIpOwor
CQkJcmV0dXJuIDA7CisJCX0KKworCQlzc2VfZXZlbnRfdW5yZWdpc3RlcihldnQpOworCX0KKwog
CWlmIChyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShOVUxMLCBTU0NPRlBNRikpIHsKIAkJ
cmlzY3ZfcG11X2lycV9udW0gPSBSVl9JUlFfUE1VOwogCQlyaXNjdl9wbXVfdXNlX2lycSA9IHRy
dWU7CkBAIC0xMTM3LDcgKzExNjgsNyBAQCBzdGF0aWMgaW50IHBtdV9zYmlfc2V0dXBfaXJxcyhz
dHJ1Y3QgcmlzY3ZfcG11ICpwbXUsIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZQogCQlyZXR1
cm4gLUVOT0RFVjsKIAl9CiAKLQlyZXQgPSByZXF1ZXN0X3BlcmNwdV9pcnEocmlzY3ZfcG11X2ly
cSwgcG11X3NiaV9vdmZfaGFuZGxlciwgInJpc2N2LXBtdSIsIGh3X2V2ZW50cyk7CisJcmV0ID0g
cmVxdWVzdF9wZXJjcHVfaXJxKHJpc2N2X3BtdV9pcnEsIHBtdV9zYmlfb3ZmX2lycV9oYW5kbGVy
LCAicmlzY3YtcG11IiwgaHdfZXZlbnRzKTsKIAlpZiAocmV0KSB7CiAJCXByX2VycigicmVnaXN0
ZXJpbmcgcGVyY3B1IGlycSBmYWlsZWQgWyVkXVxuIiwgcmV0KTsKIAkJcmV0dXJuIHJldDsKLS0g
CjIuNDUuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
