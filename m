Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC28C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 19:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jiVBhwEGBdgDnZyT5xoGcbi7gCcwyPZ+F3Y1fDmLo5Y=; b=B8Xl9TGSO+2PBW
	97yW79izVylgfqaLoltSAo3z4LRB/y43vuWaG/zzVZFVCuY7s/71RFRtWEqYZj9557HxKxF+oAj5y
	wJuxowt+2W1BSNeU7NfLwh8RYPa7aJSEjk/WAyKHPMzQP1iaGfBUNH37hQ9mmIz0rir/VvALnFPEl
	M+b2GyaNZGFOWJx/S3NQxWvubKiodyxeKooA9bsmw3yj/4lVthhywTbsaIy08b5iZD3X0lp2ofXT7
	PjAWu/1pDUIYqAYFLbc6YjwjSLRTrllhAigTTI1gxM/m0Q4dO7s+hBRnc3kcQQ1MoLuYmcvzPjS3/
	RWyIVOL4ZkiD+8XsFMbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u82cY-0000000FFGo-12lu;
	Thu, 24 Apr 2025 19:52:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80Ty-0000000EvBW-0j3X
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 17:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RIWI5J13lSlmUc75M0Yyv1OmkFoJoZE6o7hXZ4HO9lg=; b=mOcyE6LD9I6eXigmkewrlEEkh0
	bBvfx9pUuZHXl6094yF/DBanJsDa7LMZqcQhw4VuVFgkJvM7f/XqOndnNY+pwRZa/5D7lPM8rahOX
	sl4HEaddLwz6Qczq60xK4md8yJFITn33ta2JaTIfEadVxOWgLnxC0DNNtTYcnkZPjJAhJsmB2ExwB
	mkUYZCyPbQWD1F4LlS5aA/TqpjwQlkSSNQ6v4yutJZoJ/cCCaibhTFXqB8thToCa7tI+sxJAYiXhl
	Vp55+wq57HfY6gjqMHxnLDzt4oLc2lbYsVkvgxWiYfdRhWeyDE0JxC3hCMsq1z1Vd5iEIzyqhJSjk
	zJxfaOsw==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u80Tu-0000000BsP5-3bmc
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 17:35:28 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2295d78b433so15970595ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 10:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516124; x=1746120924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIWI5J13lSlmUc75M0Yyv1OmkFoJoZE6o7hXZ4HO9lg=;
        b=y0m3yUihP8kl8NzqWQL3EedseCxiCNPNY38PCM+XPfe1po2nG9yHKg9OJQOdB2Mpwn
         UMnD11RALBI5VLXLF6HxKEUkgE/P/UGDY0hGLcquGRZYLDm4t0ZMpupSPTY3aTIZvDa6
         cvfri/isgbC80ZJzl2Qkula5Cctz2SEU4tgFqqrgJAgE1td+wdTaKQFDcZkuNXOpAUwN
         R0QDIM0i89qUYPPzuRN3phwoIjhzwQBXgH7Yx4UjCOxjNSi3BEBxGD46G+jDQTuaHowW
         IwRmxW/YKsIDc5MkpTvEKYebM3XuvCdNzZg3nGIs4AvlqWUNvxRkfLGbVaXolWBR3ChV
         guFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516124; x=1746120924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIWI5J13lSlmUc75M0Yyv1OmkFoJoZE6o7hXZ4HO9lg=;
        b=P6tiqx+n/6KhusO5VEVUb+rM1ljib5KOydVqNdfy3tg5jyqYw4U5Vywe/qICCw9Zdh
         /6YZ2chMXdnW/BE7lvwgqvDejgflxUmVLb+XKBWwXqwyHQ0zOu0CzzZ7vXatY8iqJQKP
         nLtTWevVaORgfQevCQweDtw/2jL6DLF0c8X/2MBti7L268XKxq6cwZR3355cHsxftXqK
         b4BhMxhG2SKFBYCrFxp4PhfXHJl70Qa7O77fyXUtGRs2+QevgrS3wyc+VJZ47X0wn8KM
         RG+56bkCAv0Tjt5ScwMxxPXNzpbE6pRk978m33DZepfSP1VZzVTNZDb0czCwmwnY74OJ
         dM0w==
X-Forwarded-Encrypted: i=1; AJvYcCUz8Uo93RQ3GEingXQb1Ly2VgpUeU+bextLXtTazEHz3fMJZ67Y8oi/ha4OcB5Koioo22dh9dq+G2lqBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAy2gHCn/pj8Rcxve6B5kfHgV/MSUz3cCdbjoGrV7+xVoxGiVJ
	FgKRjQRXFCf0NP/VMTdlY/VfEVYODr4lVbNsPAXYrOmxPAFVSvpuueZ585P5ii8=
X-Gm-Gg: ASbGncv5PyLiwzfIqfThgGdWxJsNJVWF1re1NTOZ20YIw/CYq01194BGNXBaFrJYOB0
	wvvLhVg7uxAheUKww43pxdszTO4OJmJS7SZpqGbTmfh6A6O1y4QVMkFrE/+O8AZUIGF/6Pya4QO
	JdAv4Tjrjav0vQqLWGEeLM9fSS3TQ9PduEIcf2+ZnGuOIeFz5IqVXtO2syYGbD5QcZTEYaJd0FK
	IWxtCwuS1xJj+AYoc+zWrcmaA3oWFAh3kVYLNr1tUpoB2MRnymj9k2Dw9eDB9fb64CIYnKvz/NW
	9Ia3mb3zpPqEU84lsuTwgNHpXgtyqa742cpJJtY9NQ==
X-Google-Smtp-Source: AGHT+IEMgeNDdBBhoNSxcm3znhBhdeT3XXPb2Z1/mSRltyTQzf0eyhuWj16KlTi3Qs15Rz0vFa6sUg==
X-Received: by 2002:a17:903:3203:b0:216:794f:6d7d with SMTP id d9443c01a7336-22dbd46f99fmr4326145ad.48.1745516124524;
        Thu, 24 Apr 2025 10:35:24 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:35:23 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v6 12/14] RISC-V: KVM: add SBI extension reset callback
Date: Thu, 24 Apr 2025 19:31:59 +0200
Message-ID: <20250424173204.1948385-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_183526_942673_48E6FE09 
X-CRM114-Status: GOOD (  17.19  )
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

Q3VycmVudGx5LCBvbmx5IHRoZSBTVEEgZXh0ZW5zaW9uIG5lZWRlZCBhIHJlc2V0IGZ1bmN0aW9u
IGJ1dCB0aGF0J3MKZ29pbmcgdG8gYmUgdGhlIGNhc2UgZm9yIEZXRlQgYXMgd2VsbC4gQWRkIGEg
cmVzZXQgY2FsbGJhY2sgdGhhdCBjYW4gYmUKaW1wbGVtZW50ZWQgYnkgU0JJIGV4dGVuc2lvbnMu
CgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+ClJl
dmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgotLS0KIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCAgICAgfCAgMSAtCiBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIHwgIDIgKysKIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAg
ICAgICAgICAgICAgICAgfCAgMiArLQogYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAgICAg
ICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9rdm0vdmNwdV9z
Ymlfc3RhLmMgICAgICAgICB8ICAzICsrLQogNSBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
a3ZtX2hvc3QuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAppbmRleCAwZTlj
MmZhYjYzNzguLjRmYTAyZTA4MjE0MiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9rdm1faG9zdC5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaApAQCAt
NDA3LDcgKzQwNyw2IEBAIHZvaWQgX19rdm1fcmlzY3ZfdmNwdV9wb3dlcl9vbihzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpOwogdm9pZCBrdm1fcmlzY3ZfdmNwdV9wb3dlcl9vbihzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUpOwogYm9vbCBrdm1fcmlzY3ZfdmNwdV9zdG9wcGVkKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSk7CiAKLXZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3N0YV9yZXNldChzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUpOwogdm9pZCBrdm1fcmlzY3ZfdmNwdV9yZWNvcmRfc3RlYWxfdGltZShzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpOwogCiAjZW5kaWYgLyogX19SSVNDVl9LVk1fSE9TVF9IX18gKi8KZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCmluZGV4IGJjYjkwNzU3YjE0OS4uY2I2OGIz
YTU3YzhmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5o
CisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKQEAgLTU3LDYgKzU3
LDcgQEAgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gewogCSAqLwogCWludCAoKmluaXQp
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiAJdm9pZCAoKmRlaW5pdCkoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KTsKKwl2b2lkICgqcmVzZXQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiB9OwogCiB2
b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9mb3J3YXJkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3Ry
dWN0IGt2bV9ydW4gKnJ1bik7CkBAIC03OCw2ICs3OSw3IEBAIGJvb2wgcmlzY3ZfdmNwdV9zdXBw
b3J0c19zYmlfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGlkeCk7CiBpbnQga3ZtX3Jp
c2N2X3ZjcHVfc2JpX2VjYWxsKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4g
KnJ1bik7CiB2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9pbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSk7CiB2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9kZWluaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KTsKK3ZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7
CiAKIGludCBrdm1fcmlzY3ZfdmNwdV9nZXRfcmVnX3NiaV9zdGEoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LCB1bnNpZ25lZCBsb25nIHJlZ19udW0sCiAJCQkJICAgdW5zaWduZWQgbG9uZyAqcmVnX3Zh
bCk7CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMgYi9hcmNoL3Jpc2N2L2t2bS92
Y3B1LmMKaW5kZXggODc3YmNjODVjMDY3Li41NDI3NDdlMmM3ZjUgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHUuYworKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKQEAgLTk0LDcgKzk0
LDcgQEAgc3RhdGljIHZvaWQga3ZtX3Jpc2N2X3Jlc2V0X3ZjcHUoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1KQogCXZjcHUtPmFyY2guaGZlbmNlX3RhaWwgPSAwOwogCW1lbXNldCh2Y3B1LT5hcmNoLmhm
ZW5jZV9xdWV1ZSwgMCwgc2l6ZW9mKHZjcHUtPmFyY2guaGZlbmNlX3F1ZXVlKSk7CiAKLQlrdm1f
cmlzY3ZfdmNwdV9zYmlfc3RhX3Jlc2V0KHZjcHUpOworCWt2bV9yaXNjdl92Y3B1X3NiaV9yZXNl
dCh2Y3B1KTsKIAogCS8qIFJlc2V0IHRoZSBndWVzdCBDU1JzIGZvciBob3RwbHVnIHVzZWNhc2Ug
Ki8KIAlpZiAobG9hZGVkKQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyBi
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKaW5kZXggMzEzOWYxNzFjMjBmLi41MGJlMDc5YjU1
MjggMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKKysrIGIvYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmkuYwpAQCAtNTM2LDMgKzUzNiwyNyBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1
X3NiaV9kZWluaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCQlleHQtPmRlaW5pdCh2Y3B1KTsK
IAl9CiB9CisKK3ZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSkKK3sKKwlzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2NvbnRleHQgKnNjb250ZXh0ID0gJnZjcHUt
PmFyY2guc2JpX2NvbnRleHQ7CisJY29uc3Qgc3RydWN0IGt2bV9yaXNjdl9zYmlfZXh0ZW5zaW9u
X2VudHJ5ICplbnRyeTsKKwljb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAqZXh0
OworCWludCBpZHgsIGk7CisKKwlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShzYmlfZXh0KTsg
aSsrKSB7CisJCWVudHJ5ID0gJnNiaV9leHRbaV07CisJCWV4dCA9IGVudHJ5LT5leHRfcHRyOwor
CQlpZHggPSBlbnRyeS0+ZXh0X2lkeDsKKworCQlpZiAoaWR4IDwgMCB8fCBpZHggPj0gQVJSQVlf
U0laRShzY29udGV4dC0+ZXh0X3N0YXR1cykpCisJCQljb250aW51ZTsKKworCQlpZiAoc2NvbnRl
eHQtPmV4dF9zdGF0dXNbaWR4XSAhPSBLVk1fUklTQ1ZfU0JJX0VYVF9TVEFUVVNfRU5BQkxFRCB8
fAorCQkgICAgIWV4dC0+cmVzZXQpCisJCQljb250aW51ZTsKKworCQlleHQtPnJlc2V0KHZjcHUp
OworCX0KK30KKwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMgYi9h
cmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYwppbmRleCA1ZjM1NDI3MTE0YzEuLmNjNmNiN2M4
ZjBlNCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMKKysrIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMKQEAgLTE2LDcgKzE2LDcgQEAKICNpbmNsdWRlIDxh
c20vc2JpLmg+CiAjaW5jbHVkZSA8YXNtL3VhY2Nlc3MuaD4KIAotdm9pZCBrdm1fcmlzY3ZfdmNw
dV9zYmlfc3RhX3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3N0YXRpYyB2b2lkIGt2bV9y
aXNjdl92Y3B1X3NiaV9zdGFfcmVzZXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogewogCXZjcHUt
PmFyY2guc3RhLnNobWVtID0gSU5WQUxJRF9HUEE7CiAJdmNwdS0+YXJjaC5zdGEubGFzdF9zdGVh
bCA9IDA7CkBAIC0xNTYsNiArMTU2LDcgQEAgY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRl
bnNpb24gdmNwdV9zYmlfZXh0X3N0YSA9IHsKIAkuZXh0aWRfZW5kID0gU0JJX0VYVF9TVEEsCiAJ
LmhhbmRsZXIgPSBrdm1fc2JpX2V4dF9zdGFfaGFuZGxlciwKIAkucHJvYmUgPSBrdm1fc2JpX2V4
dF9zdGFfcHJvYmUsCisJLnJlc2V0ID0ga3ZtX3Jpc2N2X3ZjcHVfc2JpX3N0YV9yZXNldCwKIH07
CiAKIGludCBrdm1fcmlzY3ZfdmNwdV9nZXRfcmVnX3NiaV9zdGEoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LAotLSAKMi40OS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
