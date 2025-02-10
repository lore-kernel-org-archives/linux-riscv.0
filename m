Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237B5C021A7
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 21:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gmkJ5GpvyWo9mxQ4qKoT8qTqn+0hS/nRVUzkASnjbdk=; b=JwUGjCfI8cTDml
	aCAj2ViKpp6qegRV/fD1I2slFWvslLW5FUkikEZS0ne47KnR0PoNmlqtxHTss5w0KplZxj/+O/LzS
	WmYDIQ0YyJFv24bTSCryeMwcBpD/Wms+SsaFg6wL9wnpCPbERIMCBqTpE1428gljCYBXXkjSBF+bR
	jW5C/Jtn677LehLefZxag/++3qPkuXmD0s7ORzJW0RQ2bT8rPEOtl7MpI+X/bE5YLBV6tTcbQDyJe
	folyMNkx7emG+hXpX+XPqytZYYeoaqyAL4bQG6IIdML4m8UUEK/mP6Ju4+pAE8zT1B5tBpQCj7bB6
	IAg91EwHikoXmH9jAsMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbax-00000001YK9-482U;
	Mon, 10 Feb 2025 21:45:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbRo-00000001VLr-3OLb
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 21:36:09 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43934d41730so22279725e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 13:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223367; x=1739828167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqCqeIVEP5nChfGSMKDAeePbRakW6SMa+hWr1pO6tWY=;
        b=qIntPqeeTlJ6DLE4g+NX9vkey2hlNUavTfecCCPDnBCqtYmtcx1sPgYFckMlZu8y+n
         7ZXzIqh0UFRlDSFzSkqICewa6TmY/psTkjHhtkZw3mbxrgjFNLhuxxBZ3zd01BMcFMW5
         eT0zPpvL3BPy1UudYBNMBWlL5g7/4O8satZBAnYhvx75oz0Ybx1tVSZdD/YwIFkIwcco
         2nvDHQdbI+Q/HLb7zQT0WdXPhn+rLgseK3+FPWdhV5TEa/FRl7qjqqWu+qpBDQAfkOCE
         NFZqDcMpwvBX/HP2JsdCBF4BvpAHTjrOdV6tkaWA8rO53dtaeVl83ej0ucaHank8rMSg
         v1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223367; x=1739828167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CqCqeIVEP5nChfGSMKDAeePbRakW6SMa+hWr1pO6tWY=;
        b=bEdWXXwYE+pPZi/BODefqFFbaUO2+orEkr52e4AGujqPkBI3lD/MMq58NeIBShOupy
         Top2iqBG66/6fKQpy4Gssz5cYCR3Wj7mawyJGSYyJRC7tYlvvBPeQEHFuKsXeQ3ZwSW1
         wBA7gIuZJ1/UYufK2HDt9dMneuPpFdnR3r2W8dk6LHIdWRE4RTP0eSS4Ik6QqB0Ueqba
         rlmdbX2dQ7pwbSwPo+Ji0jFIQl8r4OAPLw7ClyDGAUC3SIf8uojT+LoqBiS8tNcGUdj1
         lN2WJrXldWegP/O5kD9+JxvhXErCLMkOvKxEUeSZPVHj0843IGs698LFyUriwlque/wH
         N5Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWBiB0I3Qe3f07RYyWq+HdqK9xgw2m/LHILIveEwg8N3PCyq3gWdBQM0h+wGYmOxzhskA4pdOb5o0BWhg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhXFsqZbJVbDK/ASdT1SABUtOrzBj+rPjiIArgHWdMBRhYx3vA
	2+6Pv8mh6jkqDwy2VymyVQr3BMizT0YSI5BHMwOR/r1Rq/zrAWChAexVPKjUew0=
X-Gm-Gg: ASbGnct8Ormxup3mfXoPSUTkIWnRcgxIkbu9yVp3BBN7yCATzJXj1bQaPDLb+P4l5+b
	WQRM0KZJI5NvHn6cMerSZO+JnwDe+ajeywDv//fsDJmVe+L9nNCux4WWt5LrP0OQGPnNdnIpNIq
	HlU1uM0ahFWpO2xkZ4c0iKtYLx1e5a2e2DE8HPHlwiVpwnQKRA0HeS0zcayLOWgFFY79RC3e5Oz
	KMbjLdRYiKxIf9n2BQxyJxMf7gnN1YFugL2/f9copVVBIik8t8LTQfl0H4QoNBBbwVwtchcjF1e
	vOobh39TwEGsNBFg
X-Google-Smtp-Source: AGHT+IEkB0P3P4E3SAwU66eF3MpeeDcKXRF+Ogw0CMtI0RkNe8VhwZ7hlSjtF2j0kGvBWRjmPkWfgw==
X-Received: by 2002:a05:600c:4f05:b0:434:f297:8e78 with SMTP id 5b1f17b1804b1-4392498b6c2mr130517545e9.7.1739223367421;
        Mon, 10 Feb 2025 13:36:07 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:06 -0800 (PST)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 03/15] riscv: misaligned: use on_each_cpu() for scalar misaligned access probing
Date: Mon, 10 Feb 2025 22:35:36 +0100
Message-ID: <20250210213549.1867704-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_133608_851310_54EC0D68 
X-CRM114-Status: GOOD (  12.26  )
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

c2NoZWR1bGVfb25fZWFjaF9jcHUoKSB3YXMgdXNlZCB3aXRob3V0IGFueSBnb29kIHJlYXNvbiB3
aGlsZSBkb2N1bWVudGVkCmFzIHZlcnkgc2xvdy4gVGhpcyBjYWxsIHdhcyBpbiB0aGUgYm9vdCBw
YXRoLCBzbyBiZXR0ZXIgdXNlCm9uX2VhY2hfY3B1KCkgZm9yIHNjYWxhciBtaXNhbGlnbmVkIGNo
ZWNraW5nLiBWZWN0b3IgbWlzYWxpZ25lZCBjaGVjawpzdGlsbCBuZWVkcyB0byB1c2Ugc2NoZWR1
bGVfb25fZWFjaF9jcHUoKSBzaW5jZSBpdCByZXF1aXJlcyBpcnFzIHRvIGJlCmVuYWJsZWQgYnV0
IHRoYXQncyBsZXNzIG9mIGEgcHJvYmxlbSBzaW5jZSB0aGlzIGNvZGUgaXMgcmFuIGluIGEga3Ro
cmVhZC4KQWRkIGEgY29tbWVudCB0byBleHBsaWNpdCB0aGF0LgoKU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3Yva2VybmVs
L3RyYXBzX21pc2FsaWduZWQuYyB8IDkgKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L3RyYXBzX21pc2FsaWduZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQu
YwppbmRleCA2NmVlZjM5OGJhZDQuLmViOTE1N2UzYWY3MyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
X21pc2FsaWduZWQuYwpAQCAtNjE2LDYgKzYxNiwxMSBAQCBib29sIGNoZWNrX3ZlY3Rvcl91bmFs
aWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCiAJCXJldHVybiBmYWxzZTsKIAl9
CiAKKwkvKgorCSAqIFdoaWxlIGJlaW5nIGRvY3VtZW50ZWQgYXMgdmVyeSBzbG93LCBzY2hlZHVs
ZV9vbl9lYWNoX2NwdSgpIGlzIHVzZWQKKwkgKiBzaW5jZSBrZXJuZWxfdmVjdG9yX2JlZ2luKCkg
dGhhdCBpcyBjYWxsZWQgaW5zaWRlIHRoZSB2ZWN0b3IgY29kZQorCSAqIGV4cGVjdHMgaXJxcyB0
byBiZSBlbmFibGVkIG9yIGl0IHdpbGwgcGFuaWMoKS4KKwkgKi8KIAlzY2hlZHVsZV9vbl9lYWNo
X2NwdShjaGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCk7CiAKIAlmb3JfZWFj
aF9vbmxpbmVfY3B1KGNwdSkKQEAgLTYzNiw3ICs2NDEsNyBAQCBib29sIGNoZWNrX3ZlY3Rvcl91
bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCiAKIHN0YXRpYyBib29sIHVu
YWxpZ25lZF9jdGwgX19yZWFkX21vc3RseTsKIAotc3RhdGljIHZvaWQgY2hlY2tfdW5hbGlnbmVk
X2FjY2Vzc19lbXVsYXRlZChzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmsgX19hbHdheXNfdW51c2Vk
KQorc3RhdGljIHZvaWQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCh2b2lkICphcmcg
X19hbHdheXNfdW51c2VkKQogewogCWludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7CiAJbG9u
ZyAqbWFzX3B0ciA9IHBlcl9jcHVfcHRyKCZtaXNhbGlnbmVkX2FjY2Vzc19zcGVlZCwgY3B1KTsK
QEAgLTY3Nyw3ICs2ODIsNyBAQCBib29sIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRf
YWxsX2NwdXModm9pZCkKIAkgKiBhY2Nlc3NlcyBlbXVsYXRlZCBzaW5jZSB0YXNrcyByZXF1ZXN0
aW5nIHN1Y2ggY29udHJvbCBjYW4gcnVuIG9uIGFueQogCSAqIENQVS4KIAkgKi8KLQlzY2hlZHVs
ZV9vbl9lYWNoX2NwdShjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKTsKKwlvbl9lYWNo
X2NwdShjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkLCBOVUxMLCAxKTsKIAogCWZvcl9l
YWNoX29ubGluZV9jcHUoY3B1KQogCQlpZiAocGVyX2NwdShtaXNhbGlnbmVkX2FjY2Vzc19zcGVl
ZCwgY3B1KQotLSAKMi40Ny4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
