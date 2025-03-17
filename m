Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82125C35FF8
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7eD3lbw9ZM+Bz8CoArWyyJdElkxrca2fvJ0LM9Xc8sQ=; b=Xcv3fewfjcH0g0
	SRAi7LymASqhJOHxk5umj9hQcQXAyMY083RYaIiTmwNmr7SMoRMqgoRvQMwthQ3SKEKPALShjrT2n
	3TddnQ0BzV8e/RPKO3ZY51EF4T3OvAlT+Pqos5cFJWfM33yMppSY45bxc1dcero3ELYjeX1eRzIrx
	j9UUhGHelnllDYz56MJ9rRDpyR/jMfp415TFHXCFFYhyqF5AkgGJQig7dvO98CTOqVRMMBx/vxg1j
	IUx8fbUh5fdra5QXi0JamhC02NS6EwUDdYPpNPdeQiafJLgpaPvR5CHHjuUAJ4o4VCm8monEcEo9U
	n8mqa5ojBvOEUx8MbX+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1Q-00000003Uxl-3QBJ;
	Mon, 17 Mar 2025 17:13:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDwl-00000003TQv-1Vr3
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 17:08:16 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso23756835e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 10:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231294; x=1742836094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjeBRUPbBkNgIlDeDsLglyk/HEJX/vNaDwxAgvCJumI=;
        b=UCBN4ijVb2YMDeDFFa6h6niW30L0B4VYe6ysEmVufPrCWrRBuxj2UYPXj8uInoS3kT
         Oa8stRnBb1y6KRrn4VewMEbSBSr8pe+2VwO00dkDZJOOwrnhk3XGv46d1TBvQUGY/g0A
         LYJ3yPh3m7noCjadcnepQ2dVih0JA3Km85/3H7gYiSKdbMwVsbjvoY8ms/6BSNvlE1kN
         /rTCXG3dZueknyAKmVvbaSJ7LtoieKn/bJfa3tzyVlBc1dl5PLXf+KgCBXEIPYxwvZAF
         G2MFBHNCUxFXYDaCd/3ibQNPCmDUSzePxhwxTt5FImbXKZOGhHTXCOPzSdQ+VMtr7e1o
         b2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231294; x=1742836094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rjeBRUPbBkNgIlDeDsLglyk/HEJX/vNaDwxAgvCJumI=;
        b=OUV8yfG8lOnPZiKh010Vd2Ed8yVOVWv11n+gUJMkN5iZRmzs+suMY0Tu14yPT9597y
         aShDNBrbM2kln1WhWsD7MzthP1VXfSqclHvL3I07yIHrGf9U35pgS7h3jpBoZcMQ7sUp
         Co2vusIk8Md4NlqbFNSVVa/BsI3SbaLmDDyqUXEBI8vPG9xj0JcgjiTj1iZP6tjQw6Uf
         p7Fl0DdzDjoBDC+2NXQ3MVb/mFkZnoZz6mmUzJwl/WJUnLNOTx3RR3eiIVegR+NasCoc
         ECue5mwRQrd2jexPARyRhP1u4D27+9vXDF6/o388yIWqE9xmfdLYATc/71ltS0xSbrlj
         0nZw==
X-Forwarded-Encrypted: i=1; AJvYcCVVn7rEDhR1hyY6LhWTZFl37TWBU3JXnl55y0FvImPigyWxqnOuIPCuJCCe2Ghil0iOAElywkOt2U6CyA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5MdXDavHIlwWcnJbsDLv1oWc/HsDjBS6MZJeTgT+j/03mAAZo
	lkoYoB0ZC9bZ+ShvFUyZSex/hWNDQ4Nec4+RYKMPdxcQhXPAsfteZ1dV+rkLkWo=
X-Gm-Gg: ASbGncstgdyBZWHxQJ4i5OLhJlIgs3Q0dTz74ryOQ6SS9WFzZFU+PyGWwr21UYFtxPJ
	u2ycA6oBDVnVCqeVGDMzUko+mv+ahjh//Es66YALRkf1CQ8ybSs/GHoQR4CLo9gRVSebE66GCUN
	sawIuFpPoxXGUG3QDbyv4qEEW2AUVCushvRlnaI3Wy185XoPADGGf03Ng6EMpo96Xo/hojSCLFj
	27P79Ps6/v6I7nwr258WvCQfokWv/sLmSKxPlp7XQItJcTGuEKOe8BR2CPzE2RnUx10xNBp+UEi
	JHKwTyZ9kcOdEOKoMFUXBqLyVqAKJ0jNEAaStC/aoaFOxH22e4Sbgq25
X-Google-Smtp-Source: AGHT+IEAV1SSYPsskoq8q0qrPU5Tio7ya8gNR4WNeMxWQDKOPXJ0cX+p31upeUPN82mA8abBVPNApw==
X-Received: by 2002:a05:600c:4ed3:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-43d1ec80917mr153430805e9.15.1742231293673;
        Mon, 17 Mar 2025 10:08:13 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:13 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 06/18] riscv: misaligned: use on_each_cpu() for scalar misaligned access probing
Date: Mon, 17 Mar 2025 18:06:12 +0100
Message-ID: <20250317170625.1142870-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100815_392947_B2162465 
X-CRM114-Status: GOOD (  11.22  )
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
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpv
bmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFw
c19taXNhbGlnbmVkLmMgfCA4ICsrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
X21pc2FsaWduZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwppbmRl
eCBmYTdmMTAwYjk1YmQuLjQ1ODRmMmUxZDM5ZCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvdHJhcHNfbWlzYWxpZ25lZC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2Fs
aWduZWQuYwpAQCAtNjE2LDYgKzYxNiwxMCBAQCBib29sIGNoZWNrX3ZlY3Rvcl91bmFsaWduZWRf
YWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCiAJCXJldHVybiBmYWxzZTsKIAl9CiAKKwkv
KgorCSAqIFdoaWxlIGJlaW5nIGRvY3VtZW50ZWQgYXMgdmVyeSBzbG93LCBzY2hlZHVsZV9vbl9l
YWNoX2NwdSgpIGlzIHVzZWQgc2luY2UKKwkgKiBrZXJuZWxfdmVjdG9yX2JlZ2luKCkgZXhwZWN0
cyBpcnFzIHRvIGJlIGVuYWJsZWQgb3IgaXQgd2lsbCBwYW5pYygpCisJICovCiAJc2NoZWR1bGVf
b25fZWFjaF9jcHUoY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQpOwogCiAJ
Zm9yX2VhY2hfb25saW5lX2NwdShjcHUpCkBAIC02MzYsNyArNjQwLDcgQEAgYm9vbCBjaGVja192
ZWN0b3JfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cyh2b2lkKQogCiBzdGF0aWMg
Ym9vbCB1bmFsaWduZWRfY3RsIF9fcmVhZF9tb3N0bHk7CiAKLXN0YXRpYyB2b2lkIGNoZWNrX3Vu
YWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrIF9fYWx3YXlz
X3VudXNlZCkKK3N0YXRpYyB2b2lkIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQodm9p
ZCAqYXJnIF9fYWx3YXlzX3VudXNlZCkKIHsKIAlpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgp
OwogCWxvbmcgKm1hc19wdHIgPSBwZXJfY3B1X3B0cigmbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQs
IGNwdSk7CkBAIC02NzcsNyArNjgxLDcgQEAgYm9vbCBjaGVja191bmFsaWduZWRfYWNjZXNzX2Vt
dWxhdGVkX2FsbF9jcHVzKHZvaWQpCiAJICogYWNjZXNzZXMgZW11bGF0ZWQgc2luY2UgdGFza3Mg
cmVxdWVzdGluZyBzdWNoIGNvbnRyb2wgY2FuIHJ1biBvbiBhbnkKIAkgKiBDUFUuCiAJICovCi0J
c2NoZWR1bGVfb25fZWFjaF9jcHUoY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCk7CisJ
b25fZWFjaF9jcHUoY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCwgTlVMTCwgMSk7CiAK
IAlmb3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkKIAkJaWYgKHBlcl9jcHUobWlzYWxpZ25lZF9hY2Nl
c3Nfc3BlZWQsIGNwdSkKLS0gCjIuNDcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
