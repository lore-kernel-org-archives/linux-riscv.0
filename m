Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CCDC3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 01:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmFG4LUdOHf9DCfdzVSYHE4BxP87sJrzivo/LqomXQ0=; b=3maBDJbmcqChJq
	1K5q4BBoTeV7nmUFVsiJE+/MRxnorkBewHzpViW/oj4aIph7hjpsPf66d5j4yfu74qWb1GbudDkbe
	RCDNzWn85s3dhKTaRwZSOrQDX7yC+zsg3dunO42uO6BxDTEWCFM792Ehm+OYQcsFDasCPP0fkA9gd
	6406a1J4nKhKA0xcGWlNKbzKy+szk/inDF5/fNFMPi9iNfaphdkVYaIlGBhSwZx+q/Mar5T/tyoi2
	fBnZdZlkSRGUhvqp/bUuhsTD6oqDVAcc+nunRCvbI70pNE2vquQkWbBdeDv8YTQTnIx42pqgv496m
	7dGv+2X1HaZJ1/lQpIjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJSc-0000000Gb9M-2LKH;
	Mon, 12 Aug 2024 01:02:58 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJPr-0000000GZxH-29wo
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 01:00:09 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3db1d4dab7fso2461736b6e.1
        for <linux-riscv@lists.infradead.org>; Sun, 11 Aug 2024 18:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723424406; x=1724029206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fg7MKJMwlR+eRmszvFqgWwl0l7xFjetJlLXQ4McHDXI=;
        b=Saw2lwIvxBK1sAVIlQbVyl582VclKulhoVwXOc0HwmMLsK9fG2JI0p14BHDbptvJPm
         /9nQIAyY3hThYsNS2NTlnGEopwgfl8AXz36u4Ixe473ltCBBtKGaWIzYCn7pusAiRqw/
         Jg0QE78rlEcDidjk6kg6foaPmv8oLV1vWPFzJucywrTnzG6w670O377d/nWoVrZxdKJV
         bV5doTIuoOP0+SJp4TpPOPMpVKuWKdxCRVnVWt8rZWbyrTW5ZY8yOlO5Nw+hYKVwuP2q
         0JsrW1FOJJySc8rZc8Mq1ULEaf+JV58aCNh3Oev9ECTeM5IzUqdNwDHVMDLoR8m3PTAj
         32dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723424406; x=1724029206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fg7MKJMwlR+eRmszvFqgWwl0l7xFjetJlLXQ4McHDXI=;
        b=AEy6WkAZAfmPDGoxptGLeHbt+Pyxg69E0L2QfaycHC/AfUtSIHixYKDw+qwLT/mehA
         u+eJrC5IAkk7UbCvyDZCD3Wge483wkVJ0722l5DzXbZ5VEoY3CWkZIua2hvokmxvz/Mr
         ZaXZphV3hfLyFQI1wMq4NteyqsN75PK6BdEKS6ggLCg5dnsRQG1ef4uaYcrH/jjPzQLA
         WA4QFYaSGpJcSMGdmTHYF4J+jH2hfJvRy+7plZWg4fIm0sJblX+9DApv/SEG4yZhlA02
         pkroH/Q3GFvfDwgBtpK8MQKmuy14Vc/I0AxzJOQ71KizZZHP4KtpVreaGkJuMeulB+fj
         AB9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJteovD4/ibKbYi59uhbFzpsHEL6YM+VQdfwQRO94o7RMdUBtNI8IAo7b0TIDK0J2z8f+xAII7iVnBavLq0sz8K3ID0hAl8SMaRtBdXRmt
X-Gm-Message-State: AOJu0YzWKS1WZGamoMzGmS+HuVZ9xPFFm6jFNCXuioMEpndCAFJY5fNH
	e/M3iCgTflpHvMcxEYc4LiBLXVnfVzIYFjkMe0gZuRnDtEI6+tGlrWX4MH30jY4=
X-Google-Smtp-Source: AGHT+IFq/2aqIFIbaZVtORXZ4ma22Wclt9l+I9epH3oTGlfkp+sVOBf6L7LmmBy3q6/DeC+M+tbDQQ==
X-Received: by 2002:a05:6808:3a07:b0:3da:a16e:1764 with SMTP id 5614622812f47-3dc41667c8fmr8781731b6e.4.1723424406285;
        Sun, 11 Aug 2024 18:00:06 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c3dbe8cbdcsm3074062a12.61.2024.08.11.18.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 18:00:05 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v8 04/17] ACPI: scan: Refactor dependency creation
Date: Mon, 12 Aug 2024 06:29:16 +0530
Message-ID: <20240812005929.113499-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812005929.113499-1-sunilvl@ventanamicro.com>
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_180007_566240_C48B1E3A 
X-CRM114-Status: GOOD (  15.61  )
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

U29tZSBhcmNoaXRlY3R1cmVzIGxpa2UgUklTQy1WIHdpbGwgdXNlIGltcGxpY2l0IGRlcGVuZGVu
Y2llcyBsaWtlIEdTSQptYXAgdG8gY3JlYXRlIGRlcGVuZGVuY2llcyBiZXR3ZWVuIGludGVycnVw
dCBjb250cm9sbGVyIGFuZCBkZXZpY2VzLiBUbwpzdXBwb3J0IGRvaW5nIHRoYXQsIHRoZSBmdW5j
dGlvbiB3aGljaCBjcmVhdGVzIHRoZSBkZXBlbmRlbmN5LCBpcwpyZWZhY3RvcmVkIGJpdCBhbmQg
bWFkZSBwdWJsaWMgc28gdGhhdCBkZXBlbmRlbmN5IGNhbiBiZSBhZGRlZCBmcm9tCm91dHNpZGUg
b2Ygc2Nhbi5jIGFzIHdlbGwuCgpTaWduZWQtb2ZmLWJ5OiBTdW5pbCBWIEwgPHN1bmlsdmxAdmVu
dGFuYW1pY3JvLmNvbT4KVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5j
b20+Ci0tLQogZHJpdmVycy9hY3BpL3NjYW4uYyAgICAgfCA4NiArKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLQogaW5jbHVkZS9hY3BpL2FjcGlfYnVzLmggfCAgMSArCiAy
IGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDM5IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvYWNwaS9zY2FuLmMgYi9kcml2ZXJzL2FjcGkvc2Nhbi5jCmluZGV4IDUy
YTlkZmM4ZTE4Yy4uMzc0Y2FlNGFlZjc4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2FjcGkvc2Nhbi5j
CisrKyBiL2RyaXZlcnMvYWNwaS9zY2FuLmMKQEAgLTIwMTMsNiArMjAxMyw0OSBAQCB2b2lkIGFj
cGlfc2Nhbl9ob3RwbHVnX2VuYWJsZWQoc3RydWN0IGFjcGlfaG90cGx1Z19wcm9maWxlICpob3Rw
bHVnLCBib29sIHZhbCkKIAltdXRleF91bmxvY2soJmFjcGlfc2Nhbl9sb2NrKTsKIH0KIAoraW50
IGFjcGlfc2Nhbl9hZGRfZGVwKGFjcGlfaGFuZGxlIGhhbmRsZSwgc3RydWN0IGFjcGlfaGFuZGxl
X2xpc3QgKmRlcF9kZXZpY2VzKQoreworCXUzMiBjb3VudDsKKwlpbnQgaTsKKworCWZvciAoY291
bnQgPSAwLCBpID0gMDsgaSA8IGRlcF9kZXZpY2VzLT5jb3VudDsgaSsrKSB7CisJCXN0cnVjdCBh
Y3BpX2RldmljZV9pbmZvICppbmZvOworCQlzdHJ1Y3QgYWNwaV9kZXBfZGF0YSAqZGVwOworCQli
b29sIHNraXAsIGhvbm9yX2RlcDsKKwkJYWNwaV9zdGF0dXMgc3RhdHVzOworCisJCXN0YXR1cyA9
IGFjcGlfZ2V0X29iamVjdF9pbmZvKGRlcF9kZXZpY2VzLT5oYW5kbGVzW2ldLCAmaW5mbyk7CisJ
CWlmIChBQ1BJX0ZBSUxVUkUoc3RhdHVzKSkgeworCQkJYWNwaV9oYW5kbGVfZGVidWcoaGFuZGxl
LCAiRXJyb3IgcmVhZGluZyBfREVQIGRldmljZSBpbmZvXG4iKTsKKwkJCWNvbnRpbnVlOworCQl9
CisKKwkJc2tpcCA9IGFjcGlfaW5mb19tYXRjaGVzX2lkcyhpbmZvLCBhY3BpX2lnbm9yZV9kZXBf
aWRzKTsKKwkJaG9ub3JfZGVwID0gYWNwaV9pbmZvX21hdGNoZXNfaWRzKGluZm8sIGFjcGlfaG9u
b3JfZGVwX2lkcyk7CisJCWtmcmVlKGluZm8pOworCisJCWlmIChza2lwKQorCQkJY29udGludWU7
CisKKwkJZGVwID0ga3phbGxvYyhzaXplb2YoKmRlcCksIEdGUF9LRVJORUwpOworCQlpZiAoIWRl
cCkKKwkJCWNvbnRpbnVlOworCisJCWNvdW50Kys7CisKKwkJZGVwLT5zdXBwbGllciA9IGRlcF9k
ZXZpY2VzLT5oYW5kbGVzW2ldOworCQlkZXAtPmNvbnN1bWVyID0gaGFuZGxlOworCQlkZXAtPmhv
bm9yX2RlcCA9IGhvbm9yX2RlcDsKKworCQltdXRleF9sb2NrKCZhY3BpX2RlcF9saXN0X2xvY2sp
OworCQlsaXN0X2FkZF90YWlsKCZkZXAtPm5vZGUsICZhY3BpX2RlcF9saXN0KTsKKwkJbXV0ZXhf
dW5sb2NrKCZhY3BpX2RlcF9saXN0X2xvY2spOworCX0KKworCWFjcGlfaGFuZGxlX2xpc3RfZnJl
ZShkZXBfZGV2aWNlcyk7CisJcmV0dXJuIGNvdW50OworfQorCiBzdGF0aWMgdm9pZCBhY3BpX3Nj
YW5faW5pdF9ob3RwbHVnKHN0cnVjdCBhY3BpX2RldmljZSAqYWRldikKIHsKIAlzdHJ1Y3QgYWNw
aV9oYXJkd2FyZV9pZCAqaHdpZDsKQEAgLTIwMzUsOCArMjA3OCw3IEBAIHN0YXRpYyB2b2lkIGFj
cGlfc2Nhbl9pbml0X2hvdHBsdWcoc3RydWN0IGFjcGlfZGV2aWNlICphZGV2KQogc3RhdGljIHUz
MiBhY3BpX3NjYW5fY2hlY2tfZGVwKGFjcGlfaGFuZGxlIGhhbmRsZSkKIHsKIAlzdHJ1Y3QgYWNw
aV9oYW5kbGVfbGlzdCBkZXBfZGV2aWNlczsKLQl1MzIgY291bnQ7Ci0JaW50IGk7CisJdTMyIGNv
dW50ID0gMDsKIAogCS8qCiAJICogQ2hlY2sgZm9yIF9ISUQgaGVyZSB0byBhdm9pZCBkZWZlcnJp
bmcgdGhlIGVudW1lcmF0aW9uIG9mOgpAQCAtMjA0NSw0OCArMjA4NywxNCBAQCBzdGF0aWMgdTMy
IGFjcGlfc2Nhbl9jaGVja19kZXAoYWNwaV9oYW5kbGUgaGFuZGxlKQogCSAqIFN0aWxsLCBjaGVj
a2luZyBmb3IgX0hJRCBjYXRjaGVzIG1vcmUgdGhlbiBqdXN0IHRoZXNlIGNhc2VzIC4uLgogCSAq
LwogCWlmICghYWNwaV9oYXNfbWV0aG9kKGhhbmRsZSwgIl9ERVAiKSB8fCAhYWNwaV9oYXNfbWV0
aG9kKGhhbmRsZSwgIl9ISUQiKSkKLQkJcmV0dXJuIDA7CisJCXJldHVybiBjb3VudDsKIAogCWlm
ICghYWNwaV9ldmFsdWF0ZV9yZWZlcmVuY2UoaGFuZGxlLCAiX0RFUCIsIE5VTEwsICZkZXBfZGV2
aWNlcykpIHsKIAkJYWNwaV9oYW5kbGVfZGVidWcoaGFuZGxlLCAiRmFpbGVkIHRvIGV2YWx1YXRl
IF9ERVAuXG4iKTsKLQkJcmV0dXJuIDA7CisJCXJldHVybiBjb3VudDsKIAl9CiAKLQlmb3IgKGNv
dW50ID0gMCwgaSA9IDA7IGkgPCBkZXBfZGV2aWNlcy5jb3VudDsgaSsrKSB7Ci0JCXN0cnVjdCBh
Y3BpX2RldmljZV9pbmZvICppbmZvOwotCQlzdHJ1Y3QgYWNwaV9kZXBfZGF0YSAqZGVwOwotCQli
b29sIHNraXAsIGhvbm9yX2RlcDsKLQkJYWNwaV9zdGF0dXMgc3RhdHVzOwotCi0JCXN0YXR1cyA9
IGFjcGlfZ2V0X29iamVjdF9pbmZvKGRlcF9kZXZpY2VzLmhhbmRsZXNbaV0sICZpbmZvKTsKLQkJ
aWYgKEFDUElfRkFJTFVSRShzdGF0dXMpKSB7Ci0JCQlhY3BpX2hhbmRsZV9kZWJ1ZyhoYW5kbGUs
ICJFcnJvciByZWFkaW5nIF9ERVAgZGV2aWNlIGluZm9cbiIpOwotCQkJY29udGludWU7Ci0JCX0K
LQotCQlza2lwID0gYWNwaV9pbmZvX21hdGNoZXNfaWRzKGluZm8sIGFjcGlfaWdub3JlX2RlcF9p
ZHMpOwotCQlob25vcl9kZXAgPSBhY3BpX2luZm9fbWF0Y2hlc19pZHMoaW5mbywgYWNwaV9ob25v
cl9kZXBfaWRzKTsKLQkJa2ZyZWUoaW5mbyk7Ci0KLQkJaWYgKHNraXApCi0JCQljb250aW51ZTsK
LQotCQlkZXAgPSBremFsbG9jKHNpemVvZigqZGVwKSwgR0ZQX0tFUk5FTCk7Ci0JCWlmICghZGVw
KQotCQkJY29udGludWU7Ci0KLQkJY291bnQrKzsKLQotCQlkZXAtPnN1cHBsaWVyID0gZGVwX2Rl
dmljZXMuaGFuZGxlc1tpXTsKLQkJZGVwLT5jb25zdW1lciA9IGhhbmRsZTsKLQkJZGVwLT5ob25v
cl9kZXAgPSBob25vcl9kZXA7Ci0KLQkJbXV0ZXhfbG9jaygmYWNwaV9kZXBfbGlzdF9sb2NrKTsK
LQkJbGlzdF9hZGRfdGFpbCgmZGVwLT5ub2RlICwgJmFjcGlfZGVwX2xpc3QpOwotCQltdXRleF91
bmxvY2soJmFjcGlfZGVwX2xpc3RfbG9jayk7Ci0JfQotCi0JYWNwaV9oYW5kbGVfbGlzdF9mcmVl
KCZkZXBfZGV2aWNlcyk7CisJY291bnQgKz0gYWNwaV9zY2FuX2FkZF9kZXAoaGFuZGxlLCAmZGVw
X2RldmljZXMpOwogCXJldHVybiBjb3VudDsKIH0KIApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9hY3Bp
L2FjcGlfYnVzLmggYi9pbmNsdWRlL2FjcGkvYWNwaV9idXMuaAppbmRleCA4ZGI1YmQzODI5MTUu
LmQ2YTRkZDU4ZTM2ZiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9hY3BpL2FjcGlfYnVzLmgKKysrIGIv
aW5jbHVkZS9hY3BpL2FjcGlfYnVzLmgKQEAgLTk5Myw2ICs5OTMsNyBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgYWNwaV9wdXRfYWNwaV9kZXYoc3RydWN0IGFjcGlfZGV2aWNlICphZGV2KQogCiBpbnQg
YWNwaV93YWl0X2Zvcl9hY3BpX2lwbWkodm9pZCk7CiAKK2ludCBhY3BpX3NjYW5fYWRkX2RlcChh
Y3BpX2hhbmRsZSBoYW5kbGUsIHN0cnVjdCBhY3BpX2hhbmRsZV9saXN0ICpkZXBfZGV2aWNlcyk7
CiAjZWxzZQkvKiBDT05GSUdfQUNQSSAqLwogCiBzdGF0aWMgaW5saW5lIGludCByZWdpc3Rlcl9h
Y3BpX2J1c190eXBlKHZvaWQgKmJ1cykgeyByZXR1cm4gMDsgfQotLSAKMi40My4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
