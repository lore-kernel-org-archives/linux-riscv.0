Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089E5C25B67
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 14:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQPbp+LbC9C1gzSyvmOm1XtsYxIW+4dEyV5cIutUhrs=; b=018llPMz4M1ScD
	PnxjNYMIgAaDGriLvcPcu+5/oz6A8e8Rzzh9bHFlKbK+Zq3yYoxCo/K4Ds/2Uy1rPS6H0mU9XYq3+
	YNnEXIVg0rVQ4N0SJoEFBT6EqWrjuUL3NHY9t8j+DPvkl+zKEH/DacVyF39aJCJYZJAZi/k7KYsxE
	T5Bbk1jvevuQNHMON0D6wQo8E51pN6jFHgT0FlHkUxUraX4wz/vUh+2YMpMq3yyg8PePYaYj/3HZx
	yuVjeZgELNHGwsUZRgv3o4hSKXN3z+vjEYSPcIGVpxjDlKh2E7zU2nolP93jQa+9BD6INj82u0pIo
	DxDRWjNTK8rkD7goBKgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1Oj-00EgbQ-2j;
	Thu, 26 Oct 2023 14:31:45 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1OX-00EgSr-25
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 14:31:36 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50799fe3422so247527e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Oct 2023 07:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698330689; x=1698935489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjJNbk+YzeocIZaMbaGiDwKsD4n3sxNNihAmQTPUtd4=;
        b=kHW7xlmvLbqZMYdAa1XDobXlTHYPyn99SVK1KGgMrqmnl3Jd02BM8u2rQUbe/+dOT3
         Sv+YWgJ/eBkNTGSxjx4It4qT6g2hwEFMxrjaCWRua5Y6Ns6IBXKqWeKTQnu7j4kTQXQf
         PQxFCNlzGKzHNlsuEIdwep5W4IbMA0MMsN0XEPtZ5PcYJ0GRVRy/hYn2qY0tMbEGYLyU
         Ge0Y0EZZczKT9guUODY6HWkc/VWFg6LSMhT4rJbTVEJy+mL55NIGMqnlDhPCVLO1IKuI
         r2d4g598CnwxjyUhc95QC9IkSEieRGYtvuyNlb3Jx6mGoq1HKytv6KC19WhUHm04oUmP
         yE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698330689; x=1698935489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjJNbk+YzeocIZaMbaGiDwKsD4n3sxNNihAmQTPUtd4=;
        b=lYgzyM/50R300Ijo5VwdiHQyNg0WYNac1iL1LEJ3oCV7oUV2gtsUBBZtkijuclqhDY
         fyPTjW95sD3B5L3EwDenk7KlwGtkwrc13lDQjTDkg4w5wotrf84rYyIOaXghfu9HXK5C
         D837lYC1R/u/xwBE1rryZZFr1XejYtxtMxhfvW5kEL+sxrn2/0ZQ4ZQfRfJ3Q5M7GrAZ
         /bvUqk3GSk05PLDOnr2OZKQ5pMCUyVzfDgIDGrsngCrf4FrGsaX9Jvt2MEfC1/PB2Pi3
         PlGeuEI/2ZLOhrG06JPbA6zPkL101dSKsU9n55TDZ0bvHx/k3/t/R1cXIpxnVnEvQcDt
         8q0A==
X-Gm-Message-State: AOJu0YxJJDh846rKUe9IBUM3fiMFxcq94ccckFAOEUwF1iYx5PA0EHk5
	HM0Z+3DWb0b7e3U9BaFQTFKDPg==
X-Google-Smtp-Source: AGHT+IFLytGw/7jgeGoJfJWsBD048sUEsQCNLXq5OinxBlnRc9jpp7CR1gsux8sfYWyRCNcKwi3XKw==
X-Received: by 2002:a05:6512:2821:b0:505:7144:7c37 with SMTP id cf33-20020a056512282100b0050571447c37mr13666108lfb.6.1698330689555;
        Thu, 26 Oct 2023 07:31:29 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:b380:32be:257:5381])
        by smtp.gmail.com with ESMTPSA id r9-20020a056000014900b003232f167df5sm14316589wrx.108.2023.10.26.07.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 07:31:29 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <apatel@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH 3/3] perf: RISC-V: add support for SSE event
Date: Thu, 26 Oct 2023 16:31:22 +0200
Message-ID: <20231026143122.279437-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231026143122.279437-1-cleger@rivosinc.com>
References: <20231026143122.279437-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_073133_700146_67C5E301 
X-CRM114-Status: GOOD (  22.04  )
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
bmRsZXIgZm9yIHRoZQpsb2NhbCBQTVUgZXZlbnQuIFRoZXJlIGlzIG5vdCBhIGxvdCBvZiBzcGVj
aWZpYyBjb2RlIG5lZWRlZCB0byBoYW5kbGUKdGhlIFNTRSBldmVudCwganVzdCByZXVzZSB0aGUg
ZXhpc3Rpbmcgb3ZlcmxmbG93IElSUSBoYW5kbGVyIGFuZCBwYXNzCmFwcHJvcHJpYXRlIHB0X3Jl
Z3MuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+
Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCB8ICAyICsrCiBkcml2ZXJzL3BlcmYv
cmlzY3ZfcG11X3NiaS5jIHwgNTEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
CiAyIGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vc2JpLmgKaW5kZXggMmU5OWNhZmU3ZmVkLi4xM2IwMWNkM2E4MTQgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9zYmkuaApAQCAtMTIxLDYgKzEyMSw4IEBAIGVudW0gc2JpX2V4dF9wbXVfZmlkIHsKIAlTQklf
RVhUX1BNVV9DT1VOVEVSX1NUQVJULAogCVNCSV9FWFRfUE1VX0NPVU5URVJfU1RPUCwKIAlTQklf
RVhUX1BNVV9DT1VOVEVSX0ZXX1JFQUQsCisJU0JJX0VYVF9QTVVfQ09VTlRFUl9GV19SRUFEX0hJ
LAorCVNCSV9FWFRfUE1VX0NPVU5URVJfSVJRX0NMRUFSLAogfTsKIAogdW5pb24gc2JpX3BtdV9j
dHJfaW5mbyB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIGIvZHJp
dmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwppbmRleCA5NmM3ZjY3MGM4ZjAuLjNmY2E3MGIxMzMw
NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYworKysgYi9kcml2ZXJz
L3BlcmYvcmlzY3ZfcG11X3NiaS5jCkBAIC0xNyw2ICsxNyw3IEBACiAjaW5jbHVkZSA8bGludXgv
aXJxZG9tYWluLmg+CiAjaW5jbHVkZSA8bGludXgvb2ZfaXJxLmg+CiAjaW5jbHVkZSA8bGludXgv
b2YuaD4KKyNpbmNsdWRlIDxsaW51eC9yaXNjdl9zc2UuaD4KICNpbmNsdWRlIDxsaW51eC9jcHVf
cG0uaD4KICNpbmNsdWRlIDxsaW51eC9zY2hlZC9jbG9jay5oPgogCkBAIC02MjUsNiArNjI2LDEy
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBwbXVfc2JpX3N0b3BfaHdfY3RycyhzdHJ1Y3QgcmlzY3Zf
cG11ICpwbXUpCiAJCSAgY3B1X2h3X2V2dC0+dXNlZF9od19jdHJzWzBdLCAwLCAwLCAwLCAwKTsK
IH0KIAorc3RhdGljIHZvaWQgcG11X3NiaV9pcnFfY2xlYXIodm9pZCkKK3sKKwkvKiBObyBuZWVk
IHRvIGNoZWNrIHRoZSBlcnJvciBoZXJlIGFzIHdlIGNhbid0IGRvIGFueXRoaW5nIGFib3V0IHRo
ZSBlcnJvciAqLworCXNiaV9lY2FsbChTQklfRVhUX1BNVSwgU0JJX0VYVF9QTVVfQ09VTlRFUl9J
UlFfQ0xFQVIsIDAsIDAsIDAsIDAsIDAsIDApOworfQorCiAvKgogICogVGhpcyBmdW5jdGlvbiBz
dGFydHMgYWxsIHRoZSB1c2VkIGNvdW50ZXJzIGluIHR3byBzdGVwIGFwcHJvYWNoLgogICogQW55
IGNvdW50ZXIgdGhhdCBkaWQgbm90IG92ZXJmbG93IGNhbiBiZSBzdGFydCBpbiBhIHNpbmdsZSBz
dGVwCkBAIC02NzAsMTAgKzY3NywxMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcG11X3NiaV9zdGFy
dF9vdmVyZmxvd19tYXNrKHN0cnVjdCByaXNjdl9wbXUgKnBtdSwKIAl9CiB9CiAKLXN0YXRpYyBp
cnFyZXR1cm5fdCBwbXVfc2JpX292Zl9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRldikKK3N0YXRp
YyBpcnFyZXR1cm5fdCBwbXVfc2JpX292Zl9oYW5kbGVyKHN0cnVjdCBjcHVfaHdfZXZlbnRzICpj
cHVfaHdfZXZ0LAorCQkJCSAgICAgICBzdHJ1Y3QgcHRfcmVncyAqcmVncywgYm9vbCBmcm9tX3Nz
ZSkKIHsKIAlzdHJ1Y3QgcGVyZl9zYW1wbGVfZGF0YSBkYXRhOwotCXN0cnVjdCBwdF9yZWdzICpy
ZWdzOwogCXN0cnVjdCBod19wZXJmX2V2ZW50ICpod19ldnQ7CiAJdW5pb24gc2JpX3BtdV9jdHJf
aW5mbyAqaW5mbzsKIAlpbnQgbGlkeCwgaGlkeCwgZmlkeDsKQEAgLTY4MSw3ICs2ODgsNiBAQCBz
dGF0aWMgaXJxcmV0dXJuX3QgcG11X3NiaV9vdmZfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXYp
CiAJc3RydWN0IHBlcmZfZXZlbnQgKmV2ZW50OwogCXVuc2lnbmVkIGxvbmcgb3ZlcmZsb3c7CiAJ
dW5zaWduZWQgbG9uZyBvdmVyZmxvd2VkX2N0cnMgPSAwOwotCXN0cnVjdCBjcHVfaHdfZXZlbnRz
ICpjcHVfaHdfZXZ0ID0gZGV2OwogCXU2NCBzdGFydF9jbG9jayA9IHNjaGVkX2Nsb2NrKCk7CiAK
IAlpZiAoV0FSTl9PTl9PTkNFKCFjcHVfaHdfZXZ0KSkKQEAgLTY5MSw3ICs2OTcsMTAgQEAgc3Rh
dGljIGlycXJldHVybl90IHBtdV9zYmlfb3ZmX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGV2KQog
CWZpZHggPSBmaW5kX2ZpcnN0X2JpdChjcHVfaHdfZXZ0LT51c2VkX2h3X2N0cnMsIFJJU0NWX01B
WF9DT1VOVEVSUyk7CiAJZXZlbnQgPSBjcHVfaHdfZXZ0LT5ldmVudHNbZmlkeF07CiAJaWYgKCFl
dmVudCkgewotCQljc3JfY2xlYXIoQ1NSX1NJUCwgQklUKHJpc2N2X3BtdV9pcnFfbnVtKSk7CisJ
CWlmIChmcm9tX3NzZSkKKwkJCXBtdV9zYmlfaXJxX2NsZWFyKCk7CisJCWVsc2UKKwkJCWNzcl9j
bGVhcihDU1JfU0lQLCBCSVQocmlzY3ZfcG11X2lycV9udW0pKTsKIAkJcmV0dXJuIElSUV9OT05F
OwogCX0KIApAQCAtNzAzLDE2ICs3MTIsMTYgQEAgc3RhdGljIGlycXJldHVybl90IHBtdV9zYmlf
b3ZmX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGV2KQogCiAJLyoKIAkgKiBPdmVyZmxvdyBpbnRl
cnJ1cHQgcGVuZGluZyBiaXQgc2hvdWxkIG9ubHkgYmUgY2xlYXJlZCBhZnRlciBzdG9wcGluZwot
CSAqIGFsbCB0aGUgY291bnRlcnMgdG8gYXZvaWQgYW55IHJhY2UgY29uZGl0aW9uLgorCSAqIGFs
bCB0aGUgY291bnRlcnMgdG8gYXZvaWQgYW55IHJhY2UgY29uZGl0aW9uLiBXaGVuIHVzaW5nIFNT
RSwKKwkgKiBpbnRlcnJ1cHQgaXMgY2xlYXJlZCB3aGVuIHN0b3BwaW5nIGNvdW50ZXJzLgogCSAq
LwotCWNzcl9jbGVhcihDU1JfU0lQLCBCSVQocmlzY3ZfcG11X2lycV9udW0pKTsKKwlpZiAoIWZy
b21fc3NlKQorCQljc3JfY2xlYXIoQ1NSX1NJUCwgQklUKHJpc2N2X3BtdV9pcnFfbnVtKSk7CiAK
IAkvKiBObyBvdmVyZmxvdyBiaXQgaXMgc2V0ICovCiAJaWYgKCFvdmVyZmxvdykKIAkJcmV0dXJu
IElSUV9OT05FOwogCi0JcmVncyA9IGdldF9pcnFfcmVncygpOwotCiAJZm9yX2VhY2hfc2V0X2Jp
dChsaWR4LCBjcHVfaHdfZXZ0LT51c2VkX2h3X2N0cnMsIFJJU0NWX01BWF9DT1VOVEVSUykgewog
CQlzdHJ1Y3QgcGVyZl9ldmVudCAqZXZlbnQgPSBjcHVfaHdfZXZ0LT5ldmVudHNbbGlkeF07CiAK
QEAgLTc1OCw2ICs3NjcsMjIgQEAgc3RhdGljIGlycXJldHVybl90IHBtdV9zYmlfb3ZmX2hhbmRs
ZXIoaW50IGlycSwgdm9pZCAqZGV2KQogCXJldHVybiBJUlFfSEFORExFRDsKIH0KIAorc3RhdGlj
IGlycXJldHVybl90IHBtdV9zYmlfb3ZmX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRldikK
K3sKKwlyZXR1cm4gcG11X3NiaV9vdmZfaGFuZGxlcihkZXYsIGdldF9pcnFfcmVncygpLCBmYWxz
ZSk7Cit9CisKK3N0YXRpYyBpbnQgcG11X3NiaV9vdmZfc3NlX2hhbmRsZXIodWludDMyX3QgZXZ0
LCB2b2lkICphcmcsCisJCQkJICAgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCit7CisJc3RydWN0IGNw
dV9od19ldmVudHMgX19wZXJjcHUgKmh3X2V2ZW50cyA9IGFyZzsKKwlzdHJ1Y3QgY3B1X2h3X2V2
ZW50cyAqaHdfZXZlbnQgPSByYXdfY3B1X3B0cihod19ldmVudHMpOworCisJcG11X3NiaV9vdmZf
aGFuZGxlcihod19ldmVudCwgcmVncywgdHJ1ZSk7CisKKwlyZXR1cm4gMDsKK30KKwogc3RhdGlj
IGludCBwbXVfc2JpX3N0YXJ0aW5nX2NwdSh1bnNpZ25lZCBpbnQgY3B1LCBzdHJ1Y3QgaGxpc3Rf
bm9kZSAqbm9kZSkKIHsKIAlzdHJ1Y3QgcmlzY3ZfcG11ICpwbXUgPSBobGlzdF9lbnRyeV9zYWZl
KG5vZGUsIHN0cnVjdCByaXNjdl9wbXUsIG5vZGUpOwpAQCAtODAxLDkgKzgyNiwxNyBAQCBzdGF0
aWMgaW50IHBtdV9zYmlfZHlpbmdfY3B1KHVuc2lnbmVkIGludCBjcHUsIHN0cnVjdCBobGlzdF9u
b2RlICpub2RlKQogc3RhdGljIGludCBwbXVfc2JpX3NldHVwX2lycXMoc3RydWN0IHJpc2N2X3Bt
dSAqcG11LCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCWludCByZXQ7CisJc3Ry
dWN0IHNzZV9ldmVudCAqZXZ0OwogCXN0cnVjdCBjcHVfaHdfZXZlbnRzIF9fcGVyY3B1ICpod19l
dmVudHMgPSBwbXUtPmh3X2V2ZW50czsKIAlzdHJ1Y3QgaXJxX2RvbWFpbiAqZG9tYWluID0gTlVM
TDsKIAorCWV2dCA9IHNzZV9ldmVudF9yZWdpc3RlcihTQklfU1NFX0VWRU5UX0xPQ0FMX1BNVSwg
MCwKKwkJCQkgcG11X3NiaV9vdmZfc3NlX2hhbmRsZXIsIGh3X2V2ZW50cyk7CisJaWYgKCFJU19F
UlIoZXZ0KSkgeworCQlzc2VfZXZlbnRfZW5hYmxlKGV2dCk7CisJCXJldHVybiAwOworCX0KKwog
CWlmIChyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShOVUxMLCBTU0NPRlBNRikpIHsKIAkJ
cmlzY3ZfcG11X2lycV9udW0gPSBSVl9JUlFfUE1VOwogCQlyaXNjdl9wbXVfdXNlX2lycSA9IHRy
dWU7CkBAIC04MzEsNyArODY0LDcgQEAgc3RhdGljIGludCBwbXVfc2JpX3NldHVwX2lycXMoc3Ry
dWN0IHJpc2N2X3BtdSAqcG11LCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGUKIAkJcmV0dXJu
IC1FTk9ERVY7CiAJfQogCi0JcmV0ID0gcmVxdWVzdF9wZXJjcHVfaXJxKHJpc2N2X3BtdV9pcnEs
IHBtdV9zYmlfb3ZmX2hhbmRsZXIsICJyaXNjdi1wbXUiLCBod19ldmVudHMpOworCXJldCA9IHJl
cXVlc3RfcGVyY3B1X2lycShyaXNjdl9wbXVfaXJxLCBwbXVfc2JpX292Zl9pcnFfaGFuZGxlciwg
InJpc2N2LXBtdSIsIGh3X2V2ZW50cyk7CiAJaWYgKHJldCkgewogCQlwcl9lcnIoInJlZ2lzdGVy
aW5nIHBlcmNwdSBpcnEgZmFpbGVkIFslZF1cbiIsIHJldCk7CiAJCXJldHVybiByZXQ7Ci0tIAoy
LjQyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
