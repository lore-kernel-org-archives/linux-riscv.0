Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3CFC27C40
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 13:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C6D0jb3nOBr0URqx+rj1tGEJ485/Q0JOluUnhyKZwlM=; b=HOd3V9+AKufDUF
	ZHwm/sbZg+Ld8O2QhWEfVao5KbITIM0PKxvU2ithdj8bQeYoXaVEHGwOm1BnpMDLxSl5oPey2yZmh
	mFE5yCLQKcTQk8LtRqpfUaZo9BuMDDA+pww9kdQXTTd/QivB90zFFnIG7fLxNAnFeHSjR0Z72lJDN
	CD8l8eyD3J1Aftv0Sz7NrNbSDJZ2BrSn1h42BUn/E152Gwduq1PenjEaIxT8y0L8iJ5KdUkR5PbkX
	4bmHiuuD5KMbMdWIDQzytwjUMFkVBrDQ7mCpZb4H8zqNhpxmk/3Oe4qy1rMs/eLeAHwun1sTOY3Po
	5AphWTA4XpfrYGyUuNlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZAR6-00392V-2L;
	Thu, 24 Aug 2023 13:31:44 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZAR3-00390p-2A
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 13:31:43 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-307d20548adso5568749f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 06:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692883898; x=1693488698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOjnMoCdk8ero0eIWnTRV8IDjWokCkOdT233dw8f8cM=;
        b=iMnUSfI2+Q9SIs1K6hZhMo+Arr01ZqvJxwD3uxjGKTxs2C3mOEX8zTkSa/iw1/ea+A
         1obGFCB1YEh4uU1B9tgX84lYcb0Efl5eHke1ZttpwSWnkzqrkRoI8QXmaqnlazK0TD5+
         9tsnxUjQJNkcnAO60l48rHELcsLqQKRjrtwVMkLHZFhD3Fsa/mrCPT4+o+K9IrXPhiaG
         sYLcigRuUCUk0huxgn6LcK5vsuf1FNxZqb/70GapWKjid2DGaXJagHrHYax7v/q3dpy1
         5uX+gS81yYp8mQKkfYi+eMqRjrxMSLuHa0Vdk/52tySindL0WVTzzrxO7oz8N0y0DGq0
         OKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692883898; x=1693488698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOjnMoCdk8ero0eIWnTRV8IDjWokCkOdT233dw8f8cM=;
        b=b0wvE98VYKvLjTVDR1jqegHPP9XvIZaOWj6UfPAtLJMcM+PCPiUoZgdsrZv7WVICPt
         x9cVlEfkzAkKUt+9EJ8RKPDNYDPHy/QLiZmACa+Q+WFdVjZ/k5LP8mqG1VoNWfK1TRAj
         EmozmtQmKT/TsKiziYbpgtuRBLwt9FToosHtYedpJL3UaJjcThedc9DL+S/BdV5EdGTe
         flH1wapfdXr3JJ8CqRxmd4t6KM5Vh6Tza/RSUtfIWCmRmhkDC1V92iwAcEDzUYiCfF2p
         spqB23d14EWBonbrb0PNvlEhliFhBhuny9zoFh075QMjECjQ1ji1THpl3/FQI/+yJgCq
         YSvw==
X-Gm-Message-State: AOJu0YxWjzeY5WdLDaog/XDbR7O64H00N35f8Pt9lI3fMvHGh3sfCr4a
	SD3zlzQHxzkRn/evZWsE8BM=
X-Google-Smtp-Source: AGHT+IGYrNSHQo0VfFl5CRfj3Gtb5eiirSq1QGjvtMJU8Gr4wK3Ak9RlHQPqQpRwwQlFkga9ww4Lcg==
X-Received: by 2002:a5d:62cf:0:b0:319:79a9:4d9e with SMTP id o15-20020a5d62cf000000b0031979a94d9emr11901798wrv.44.1692883898481;
        Thu, 24 Aug 2023 06:31:38 -0700 (PDT)
Received: from ip-172-31-30-46.eu-west-1.compute.internal (ec2-54-170-241-106.eu-west-1.compute.amazonaws.com. [54.170.241.106])
        by smtp.gmail.com with ESMTPSA id h11-20020a5d548b000000b00317e77106dbsm22396112wrv.48.2023.08.24.06.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 06:31:38 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	pulehui@huawei.com,
	conor.dooley@microchip.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	song@kernel.org,
	yhs@fb.com,
	kpsingh@kernel.org,
	bjorn@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: puranjay12@gmail.com
Subject: [PATCH bpf-next v2 1/3] riscv: extend patch_text_nosync() for multiple pages
Date: Thu, 24 Aug 2023 13:31:33 +0000
Message-Id: <20230824133135.1176709-2-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230824133135.1176709-1-puranjay12@gmail.com>
References: <20230824133135.1176709-1-puranjay12@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_063141_711539_D926DB77 
X-CRM114-Status: GOOD (  15.45  )
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

VGhlIHBhdGNoX2luc25fd3JpdGUoKSBmdW5jdGlvbiBjdXJyZW50bHkgZG9lc24ndCB3b3JrIGZv
ciBtdWx0aXBsZQpwYWdlcyBvZiBpbnN0cnVjdGlvbnMsIHRoZXJlZm9yZSBwYXRjaF90ZXh0X25v
c3luYygpIHdpbGwgZmFpbCB3aXRoIGEKcGFnZSBmYXVsdCBpZiBjYWxsZWQgd2l0aCBsZW5ndGhz
IHNwYW5uaW5nIG11bHRpcGxlIHBhZ2VzLgoKVGhpcyBjb21taXQgZXh0ZW5kcyB0aGUgcGF0Y2hf
aW5zbl93cml0ZSgpIGZ1bmN0aW9uIHRvIHN1cHBvcnQgbXVsdGlwbGUKcGFnZXMgYnkgY29weWlu
ZyBhdCBtYXggMiBwYWdlcyBhdCBhIHRpbWUgaW4gYSBsb29wLiBUaGlzIGltcGxlbWVudGF0aW9u
CmlzIHNpbWlsYXIgdG8gdGV4dF9wb2tlX2NvcHkoKSBmdW5jdGlvbiBvZiB4ODYuCgpTaWduZWQt
b2ZmLWJ5OiBQdXJhbmpheSBNb2hhbiA8cHVyYW5qYXkxMkBnbWFpbC5jb20+ClJldmlld2VkLWJ5
OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9rZXJu
ZWwvcGF0Y2guYyB8IDM5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYyBiL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNo
LmMKaW5kZXggNTc1ZTcxZDZjOGFlLi40NjViMmVlYmJjMzcgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL3BhdGNoLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwpAQCAtNTMs
MTIgKzUzLDE4IEBAIHN0YXRpYyB2b2lkIHBhdGNoX3VubWFwKGludCBmaXhtYXApCiB9CiBOT0tQ
Uk9CRV9TWU1CT0wocGF0Y2hfdW5tYXApOwogCi1zdGF0aWMgaW50IHBhdGNoX2luc25fd3JpdGUo
dm9pZCAqYWRkciwgY29uc3Qgdm9pZCAqaW5zbiwgc2l6ZV90IGxlbikKK3N0YXRpYyBpbnQgX19w
YXRjaF9pbnNuX3dyaXRlKHZvaWQgKmFkZHIsIGNvbnN0IHZvaWQgKmluc24sIHNpemVfdCBsZW4p
CiB7CiAJdm9pZCAqd2FkZHIgPSBhZGRyOwogCWJvb2wgYWNyb3NzX3BhZ2VzID0gKCgodWludHB0
cl90KSBhZGRyICYgflBBR0VfTUFTSykgKyBsZW4pID4gUEFHRV9TSVpFOwogCWludCByZXQ7CiAK
KwkvKgorCSAqIE9ubHkgdHdvIHBhZ2VzIGNhbiBiZSBtYXBwZWQgYXQgYSB0aW1lIGZvciB3cml0
aW5nLgorCSAqLworCWlmIChsZW4gPiAyICogUEFHRV9TSVpFKQorCQlyZXR1cm4gLUVJTlZBTDsK
KwogCS8qCiAJICogQmVmb3JlIHJlYWNoaW5nIGhlcmUsIGl0IHdhcyBleHBlY3RlZCB0byBsb2Nr
IHRoZSB0ZXh0X211dGV4CiAJICogYWxyZWFkeSwgc28gd2UgZG9uJ3QgbmVlZCB0byBnaXZlIGFu
b3RoZXIgbG9jayBoZXJlIGFuZCBjb3VsZApAQCAtNzQsNyArODAsNyBAQCBzdGF0aWMgaW50IHBh
dGNoX2luc25fd3JpdGUodm9pZCAqYWRkciwgY29uc3Qgdm9pZCAqaW5zbiwgc2l6ZV90IGxlbikK
IAkJbG9ja2RlcF9hc3NlcnRfaGVsZCgmdGV4dF9tdXRleCk7CiAKIAlpZiAoYWNyb3NzX3BhZ2Vz
KQotCQlwYXRjaF9tYXAoYWRkciArIGxlbiwgRklYX1RFWFRfUE9LRTEpOworCQlwYXRjaF9tYXAo
YWRkciArIFBBR0VfU0laRSwgRklYX1RFWFRfUE9LRTEpOwogCiAJd2FkZHIgPSBwYXRjaF9tYXAo
YWRkciwgRklYX1RFWFRfUE9LRTApOwogCkBAIC04NywxNSArOTMsMzggQEAgc3RhdGljIGludCBw
YXRjaF9pbnNuX3dyaXRlKHZvaWQgKmFkZHIsIGNvbnN0IHZvaWQgKmluc24sIHNpemVfdCBsZW4p
CiAKIAlyZXR1cm4gcmV0OwogfQotTk9LUFJPQkVfU1lNQk9MKHBhdGNoX2luc25fd3JpdGUpOwor
Tk9LUFJPQkVfU1lNQk9MKF9fcGF0Y2hfaW5zbl93cml0ZSk7CiAjZWxzZQotc3RhdGljIGludCBw
YXRjaF9pbnNuX3dyaXRlKHZvaWQgKmFkZHIsIGNvbnN0IHZvaWQgKmluc24sIHNpemVfdCBsZW4p
CitzdGF0aWMgaW50IF9fcGF0Y2hfaW5zbl93cml0ZSh2b2lkICphZGRyLCBjb25zdCB2b2lkICpp
bnNuLCBzaXplX3QgbGVuKQogewogCXJldHVybiBjb3B5X3RvX2tlcm5lbF9ub2ZhdWx0KGFkZHIs
IGluc24sIGxlbik7CiB9Ci1OT0tQUk9CRV9TWU1CT0wocGF0Y2hfaW5zbl93cml0ZSk7CitOT0tQ
Uk9CRV9TWU1CT0woX19wYXRjaF9pbnNuX3dyaXRlKTsKICNlbmRpZiAvKiBDT05GSUdfTU1VICov
CiAKK3N0YXRpYyBpbnQgcGF0Y2hfaW5zbl93cml0ZSh2b2lkICphZGRyLCBjb25zdCB2b2lkICpp
bnNuLCBzaXplX3QgbGVuKQoreworCXNpemVfdCBwYXRjaGVkID0gMDsKKwlzaXplX3Qgc2l6ZTsK
KwlpbnQgcmV0ID0gMDsKKworCS8qCisJICogQ29weSB0aGUgaW5zdHJ1Y3Rpb25zIHRvIHRoZSBk
ZXN0aW5hdGlvbiBhZGRyZXNzLCB0d28gcGFnZXMgYXQgYSB0aW1lCisJICogYmVjYXVzZSBfX3Bh
dGNoX2luc25fd3JpdGUoKSBjYW4gb25seSBoYW5kbGUgbGVuIDw9IDIgKiBQQUdFX1NJWkUuCisJ
ICovCisJd2hpbGUgKHBhdGNoZWQgPCBsZW4gJiYgIXJldCkgeworCQlzaXplID0gbWluX3Qoc2l6
ZV90LAorCQkJICAgICBQQUdFX1NJWkUgKiAyIC0gb2Zmc2V0X2luX3BhZ2UoYWRkciArIHBhdGNo
ZWQpLAorCQkJICAgICBsZW4gLSBwYXRjaGVkKTsKKwkJcmV0ID0gX19wYXRjaF9pbnNuX3dyaXRl
KGFkZHIgKyBwYXRjaGVkLCBpbnNuICsgcGF0Y2hlZCwgc2l6ZSk7CisKKwkJcGF0Y2hlZCArPSBz
aXplOworCX0KKworCXJldHVybiByZXQ7Cit9CitOT0tQUk9CRV9TWU1CT0wocGF0Y2hfaW5zbl93
cml0ZSk7CisKIGludCBwYXRjaF90ZXh0X25vc3luYyh2b2lkICphZGRyLCBjb25zdCB2b2lkICpp
bnNucywgc2l6ZV90IGxlbikKIHsKIAl1MzIgKnRwID0gYWRkcjsKLS0gCjIuMzkuMgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
