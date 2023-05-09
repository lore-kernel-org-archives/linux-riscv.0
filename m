Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10609C7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 10:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kqY9nfYBi5XI436Q90tOsRgodoA2r8B6wUFVOWMM+as=; b=BSXJZx9L/+nxEI
	uspK0SzFMXoqjH8Ljxb95ejL5Oo49AbzsDdZzVMGfAqtPnbqcnhxh0yfmylBOdR1iuHMtQq3JbT++
	4+WdpbVgFR0v/W50F3Cil9lnmjo7phl8XfR6ZdDQ8BA+INjS9tRkVHwaDAJ1J6QtfARW/dGnnex+s
	+owMrctZcBFnaBkLzQXuOXmuG8mkKCGb297ke8zUfgSSng+lm8KvGvIi0TnkaLIYr25Yos2iig1rg
	Mfp3s9RTt/jZ0n0DTV+O2rqgwOwFqje0VoMbDsOGjgPfnzExRyZy12it1G9BLxrxNgJkcCDORrctu
	leXQg472L0/d9FVI6xqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKeP-002u5u-2E;
	Tue, 09 May 2023 10:32:57 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKeL-002tz2-19
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 10:32:55 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-64384274895so4024823b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 03:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683628370; x=1686220370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKBdM10p42yS0Ug5E/KUJYm6/Rr1D5Li03q285TdFAw=;
        b=U9mKzV9TYD6a92nx2P+DpxRK+boTSXwr/0MaET345DZzdQxZN62yb7AwLXQ6zfCgg8
         WilRuwECpUCthI6jZoS8Y4KZfdW19bq1RuN3nSyIdzkdaQmr3xAWOLLaEhB6Z7VBAdth
         HtYqIKngbY0Y9m4yrbvYHKuZRg5iB1YGjQM+8qisWg6u/3JWn2IpFcLCoFabDy2es8cZ
         lN5RYf/AWJMEwArnmpVfOErcTOBxf+pcMdrgPvl+So1BXViBVy0r8hVR4iQbs9GltGml
         q4Q2s92ELeJsC2AIPP8m9o5kGXaK8zPC/mzUr40mQgvk3AQf0q24DBfqgtJHqYRRf1DL
         DGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628370; x=1686220370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aKBdM10p42yS0Ug5E/KUJYm6/Rr1D5Li03q285TdFAw=;
        b=R+x+11WEf8CCdkGVY2RYo+nfk+xOKd9svnhq16YgTJDVhHkDlcrJ54Jc4nRjkGxBjI
         gOwl3miXSbDZKMAP5L5oHS/rs1pWoEKV2kGtT7UVOUbfagieuL4p2+XuzxTfPutVDE1j
         Z4x5Jq2vmYOxGVOF4seD3Uqv/aUHNoPoEEZU7CjFxkMkkc8zSw1on3sbrDrobNoopYbh
         l6Ot4GM3FsiWcw1Pf/US0PPSrDtRMysdIgXI1GTEto456XYahn1gQfxb9E9NWEHMp9Iw
         Ou7thI/1FC6LJ7+0fOdggA2m7MCRW9e3PMMUfRyhHCs7/CHYIwmZ1qQakwqLffuO5CWf
         Pg8A==
X-Gm-Message-State: AC+VfDxewWuEdkEb+mWxI6eJg9oHChj3UZr5Eex+TD4+9of0b9ecK1hh
	D1/O6e3dv9ZTNs5lJ9WW3tcoKgZszYLylAGqO33nF8V9jni+WAx8hnKrieDrJWKQuIU05Xh7web
	MMlu4dxoOIzgdzRjTbrGt6Jl8ciEF1+4TnRLn5tiBeraRVBPuGe2j9ZudJXWdWZ/xpUQa0nFP2G
	WQNAzkNmoOcyme
X-Google-Smtp-Source: ACHHUZ7ZTQOGT9/asxwGfiP68CsmX5wXxCNr+2oTYdT3b2w+YUC8AcbwGiz87KUJEvICWJWz2Gp4GA==
X-Received: by 2002:a17:903:2292:b0:1a6:ebc1:c54c with SMTP id b18-20020a170903229200b001a6ebc1c54cmr17085754plh.1.1683628369884;
        Tue, 09 May 2023 03:32:49 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902d4cb00b001a076025715sm1195191plg.117.2023.05.09.03.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:32:49 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [PATCH -next v19 15/24] riscv: signal: Report signal frame size to userspace via auxv
Date: Tue,  9 May 2023 10:30:24 +0000
Message-Id: <20230509103033.11285-16-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230509103033.11285-1-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_033253_406016_56AEA9F8 
X-CRM114-Status: GOOD (  23.59  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, Mathis Salmen <mathis.salmen@matsal.de>, Kees Cook <keescook@chromium.org>, Andrew Bresticker <abrestic@rivosinc.com>, vineetg@rivosinc.com, Vincent Chen <vincent.chen@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Eric Biederman <ebiederm@xmission.com>, Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Zong Li <zong.li@sifive.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogVmluY2VudCBDaGVuIDx2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbT4KClRoZSB2ZWN0b3Ig
cmVnaXN0ZXIgYmVsb25ncyB0byB0aGUgc2lnbmFsIGNvbnRleHQuIFRoZXkgbmVlZCB0byBiZSBz
dG9yZWQKYW5kIHJlc3RvcmVkIGFzIGVudGVyaW5nIGFuZCBsZWF2aW5nIHRoZSBzaWduYWwgaGFu
ZGxlci4gQWNjb3JkaW5nIHRvIHRoZQpWLWV4dGVuc2lvbiBzcGVjaWZpY2F0aW9uLCB0aGUgbWF4
aW11bSBsZW5ndGggb2YgdGhlIHZlY3RvciByZWdpc3RlcnMgY2FuCmJlIDJeMTYuIEhlbmNlLCBp
ZiB1c2Vyc3BhY2UgcmVmZXJzIHRvIHRoZSBNSU5TSUdTVEtTWiB0byBjcmVhdGUgYQpzaWdmcmFt
ZSwgaXQgbWF5IG5vdCBiZSBlbm91Z2guIFRvIHJlc29sdmUgdGhpcyBwcm9ibGVtLCB0aGlzIHBh
dGNoIHJlZmVycwp0byB0aGUgY29tbWl0IDk0YjA3YzFmOGMzOWMKKCJhcm02NDogc2lnbmFsOiBS
ZXBvcnQgc2lnbmFsIGZyYW1lIHNpemUgdG8gdXNlcnNwYWNlIHZpYSBhdXh2IikgdG8gZW5hYmxl
CnVzZXJzcGFjZSB0byBrbm93IHRoZSBtaW5pbXVtIHJlcXVpcmVkIHNpZ2ZyYW1lIHNpemUgdGhy
b3VnaCB0aGUgYXV4aWxpYXJ5CnZlY3RvciBhbmQgdXNlIGl0IHRvIGFsbG9jYXRlIGVub3VnaCBt
ZW1vcnkgZm9yIHNpZ25hbCBjb250ZXh0LgoKTm90ZSB0aGF0IGF1eHYgYWx3YXlzIHJlcG9ydHMg
c2l6ZSBvZiB0aGUgc2lnZnJhbWUgYXMgaWYgViBleGlzdHMgZm9yCmFsbCBzdGFydGluZyBwcm9j
ZXNzZXMsIHdoZW5ldmVyIHRoZSBrZXJuZWwgaGFzIENPTkZJR19SSVNDVl9JU0FfVi4gVGhlCnJl
YXNvbiBpcyB0aGF0IHVzZXJzIHVzdWFsbHkgcmVmZXJlbmNlIHRoaXMgdmFsdWUgdG8gYWxsb2Nh
dGUgYW4KYWx0ZXJuYXRpdmUgc2lnbmFsIHN0YWNrLCBhbmQgdGhlIHVzZXIgbWF5IHVzZSBWIGFu
eXRpbWUuIFNvIHRoZSB1c2VyCm11c3QgcmVzZXJ2ZSBhIHNwYWNlIGZvciBWLWNvbnRleHQgaW4g
c2lnZnJhbWUgaW4gY2FzZSB0aGF0IHRoZSBzaWduYWwKaGFuZGxlciBpbnZva2VzIGFmdGVyIHRo
ZSBrZXJuZWwgYWxsb2NhdGluZyBWLgoKU2lnbmVkLW9mZi1ieTogR3JlZW50aW1lIEh1IDxncmVl
bnRpbWUuaHVAc2lmaXZlLmNvbT4KU2lnbmVkLW9mZi1ieTogVmluY2VudCBDaGVuIDx2aW5jZW50
LmNoZW5Ac2lmaXZlLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lm
aXZlLmNvbT4KQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5j
b20+ClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+ClJldmll
d2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KUmV2aWV3ZWQtYnk6IEhlaWtvIFN0
dWVibmVyIDxoZWlrby5zdHVlYm5lckB2cnVsbC5ldT4KVGVzdGVkLWJ5OiBIZWlrbyBTdHVlYm5l
ciA8aGVpa28uc3R1ZWJuZXJAdnJ1bGwuZXU+Ci0tLQpDaGFuZ2Vsb2cgVjE5OgogLSBGaXggYSBj
b25mbGljdCBpbiBzaWduYWwuYyBkdWUgdG8gY29tbWl0IDhkNzM2NDgyNzQ5ZgogICAoInJpc2N2
OiBhZGQgaWNhY2hlIGZsdXNoIGZvciBub21tdSBzaWdyZXR1cm4gdHJhbXBvbGluZSIpCgogYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9lbGYuaCAgICAgICAgIHwgIDkgKysrKysrKysrCiBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oICAgfCAgMiArKwogYXJjaC9yaXNjdi9pbmNsdWRl
L3VhcGkvYXNtL2F1eHZlYy5oIHwgIDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvc2lnbmFsLmMgICAg
ICAgICAgIHwgMjAgKysrKysrKysrKysrKysrLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgMjcgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2VsZi5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lbGYuaAppbmRleCAzMGU3ZDI0
NTU5NjAuLmNhMjNjNGY2YzQ0MCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9l
bGYuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VsZi5oCkBAIC0xMDUsNiArMTA1LDE1
IEBAIGRvIHsJCQkJCQkJCVwKIAkJZ2V0X2NhY2hlX3NpemUoMywgQ0FDSEVfVFlQRV9VTklGSUVE
KSk7CQlcCiAJTkVXX0FVWF9FTlQoQVRfTDNfQ0FDSEVHRU9NRVRSWSwJCQlcCiAJCWdldF9jYWNo
ZV9nZW9tZXRyeSgzLCBDQUNIRV9UWVBFX1VOSUZJRUQpKTsJXAorCS8qCQkJCQkJCSBcCisJICog
U2hvdWxkIGFsd2F5cyBiZSBub256ZXJvIHVubGVzcyB0aGVyZSdzIGEga2VybmVsIGJ1Zy4gXAor
CSAqIElmIHdlIGhhdmVuJ3QgZGV0ZXJtaW5lZCBhIHNlbnNpYmxlIHZhbHVlIHRvIGdpdmUgdG8J
IFwKKwkgKiB1c2Vyc3BhY2UsIG9taXQgdGhlIGVudHJ5OgkJCQkgXAorCSAqLwkJCQkJCQkgXAor
CWlmIChsaWtlbHkoc2lnbmFsX21pbnNpZ3N0a3N6KSkJCQkJIFwKKwkJTkVXX0FVWF9FTlQoQVRf
TUlOU0lHU1RLU1osIHNpZ25hbF9taW5zaWdzdGtzeik7IFwKKwllbHNlCQkJCQkJCSBcCisJCU5F
V19BVVhfRU5UKEFUX0lHTk9SRSwgMCk7CQkJIFwKIH0gd2hpbGUgKDApCiAjZGVmaW5lIEFSQ0hf
SEFTX1NFVFVQX0FERElUSU9OQUxfUEFHRVMKIHN0cnVjdCBsaW51eF9iaW5wcm07CmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9wcm9jZXNzb3IuaAppbmRleCBmMGRkZjY5MWFjNWUuLjM4ZGVkOGM1ZjIwNyAxMDA2
NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAorKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCkBAIC03LDYgKzcsNyBAQAogI2RlZmluZSBfQVNN
X1JJU0NWX1BST0NFU1NPUl9ICiAKICNpbmNsdWRlIDxsaW51eC9jb25zdC5oPgorI2luY2x1ZGUg
PGxpbnV4L2NhY2hlLmg+CiAKICNpbmNsdWRlIDx2ZHNvL3Byb2Nlc3Nvci5oPgogCkBAIC04MSw2
ICs4Miw3IEBAIGludCByaXNjdl9vZl9wYXJlbnRfaGFydGlkKHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bm9kZSwgdW5zaWduZWQgbG9uZyAqaGFydGlkKTsKIGV4dGVybiB2b2lkIHJpc2N2X2ZpbGxfaHdj
YXAodm9pZCk7CiBleHRlcm4gaW50IGFyY2hfZHVwX3Rhc2tfc3RydWN0KHN0cnVjdCB0YXNrX3N0
cnVjdCAqZHN0LCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnNyYyk7CiAKK2V4dGVybiB1bnNpZ25lZCBs
b25nIHNpZ25hbF9taW5zaWdzdGtzeiBfX3JvX2FmdGVyX2luaXQ7CiAjZW5kaWYgLyogX19BU1NF
TUJMWV9fICovCiAKICNlbmRpZiAvKiBfQVNNX1JJU0NWX1BST0NFU1NPUl9IICovCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKaW5kZXggZmIxODdhMzNjZTU4Li4xMGFhYTgzZGI4OWUg
MTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaAorKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKQEAgLTM1LDUgKzM1LDYgQEAKIAog
LyogZW50cmllcyBpbiBBUkNIX0RMSU5GTyAqLwogI2RlZmluZSBBVF9WRUNUT1JfU0laRV9BUkNI
CTkKKyNkZWZpbmUgQVRfTUlOU0lHU1RLU1oJCTUxCiAKICNlbmRpZiAvKiBfVUFQSV9BU01fUklT
Q1ZfQVVYVkVDX0ggKi8KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NpZ25hbC5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvc2lnbmFsLmMKaW5kZXggYzQ2ZjNkYzAzOWJiLi5mMTE3NjQxYzFj
NDkgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NpZ25hbC5jCisrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3NpZ25hbC5jCkBAIC0yMyw2ICsyMyw4IEBACiAjaW5jbHVkZSA8YXNtL2Nzci5o
PgogI2luY2x1ZGUgPGFzbS9jYWNoZWZsdXNoLmg+CiAKK3Vuc2lnbmVkIGxvbmcgc2lnbmFsX21p
bnNpZ3N0a3N6IF9fcm9fYWZ0ZXJfaW5pdDsKKwogZXh0ZXJuIHUzMiBfX3VzZXJfcnRfc2lncmV0
dXJuWzJdOwogc3RhdGljIHNpemVfdCByaXNjdl92X3NjX3NpemUgX19yb19hZnRlcl9pbml0Owog
CkBAIC0xOTcsNyArMTk5LDcgQEAgc3RhdGljIGxvbmcgcmVzdG9yZV9zaWdjb250ZXh0KHN0cnVj
dCBwdF9yZWdzICpyZWdzLAogCXJldHVybiBlcnI7CiB9CiAKLXN0YXRpYyBzaXplX3QgZ2V0X3J0
X2ZyYW1lX3NpemUodm9pZCkKK3N0YXRpYyBzaXplX3QgZ2V0X3J0X2ZyYW1lX3NpemUoYm9vbCBj
YWxfYWxsKQogewogCXN0cnVjdCBydF9zaWdmcmFtZSBfX3VzZXIgKmZyYW1lOwogCXNpemVfdCBm
cmFtZV9zaXplOwpAQCAtMjA1LDggKzIwNywxMCBAQCBzdGF0aWMgc2l6ZV90IGdldF9ydF9mcmFt
ZV9zaXplKHZvaWQpCiAKIAlmcmFtZV9zaXplID0gc2l6ZW9mKCpmcmFtZSk7CiAKLQlpZiAoaGFz
X3ZlY3RvcigpICYmIHJpc2N2X3ZfdnN0YXRlX3F1ZXJ5KHRhc2tfcHRfcmVncyhjdXJyZW50KSkp
Ci0JCXRvdGFsX2NvbnRleHRfc2l6ZSArPSByaXNjdl92X3NjX3NpemU7CisJaWYgKGhhc192ZWN0
b3IoKSkgeworCQlpZiAoY2FsX2FsbCB8fCByaXNjdl92X3ZzdGF0ZV9xdWVyeSh0YXNrX3B0X3Jl
Z3MoY3VycmVudCkpKQorCQkJdG90YWxfY29udGV4dF9zaXplICs9IHJpc2N2X3Zfc2Nfc2l6ZTsK
Kwl9CiAJLyoKIAkgKiBQcmVzZXJ2ZWQgYSBfX3Jpc2N2X2N0eF9oZHIgZm9yIEVORCBzaWduYWwg
Y29udGV4dCBoZWFkZXIgaWYgYW4KIAkgKiBleHRlbnNpb24gdXNlcyBfX3Jpc2N2X2V4dHJhX2V4
dF9oZWFkZXIKQEAgLTIyNiw3ICsyMzAsNyBAQCBTWVNDQUxMX0RFRklORTAocnRfc2lncmV0dXJu
KQogCXN0cnVjdCBydF9zaWdmcmFtZSBfX3VzZXIgKmZyYW1lOwogCXN0cnVjdCB0YXNrX3N0cnVj
dCAqdGFzazsKIAlzaWdzZXRfdCBzZXQ7Ci0Jc2l6ZV90IGZyYW1lX3NpemUgPSBnZXRfcnRfZnJh
bWVfc2l6ZSgpOworCXNpemVfdCBmcmFtZV9zaXplID0gZ2V0X3J0X2ZyYW1lX3NpemUoZmFsc2Up
OwogCiAJLyogQWx3YXlzIG1ha2UgYW55IHBlbmRpbmcgcmVzdGFydGVkIHN5c3RlbSBjYWxscyBy
ZXR1cm4gLUVJTlRSICovCiAJY3VycmVudC0+cmVzdGFydF9ibG9jay5mbiA9IGRvX25vX3Jlc3Rh
cnRfc3lzY2FsbDsKQEAgLTMyMyw3ICszMjcsNyBAQCBzdGF0aWMgaW50IHNldHVwX3J0X2ZyYW1l
KHN0cnVjdCBrc2lnbmFsICprc2lnLCBzaWdzZXRfdCAqc2V0LAogCXN0cnVjdCBydF9zaWdmcmFt
ZSBfX3VzZXIgKmZyYW1lOwogCWxvbmcgZXJyID0gMDsKIAl1bnNpZ25lZCBsb25nIF9fbWF5YmVf
dW51c2VkIGFkZHI7Ci0Jc2l6ZV90IGZyYW1lX3NpemUgPSBnZXRfcnRfZnJhbWVfc2l6ZSgpOwor
CXNpemVfdCBmcmFtZV9zaXplID0gZ2V0X3J0X2ZyYW1lX3NpemUoZmFsc2UpOwogCiAJZnJhbWUg
PSBnZXRfc2lnZnJhbWUoa3NpZywgcmVncywgZnJhbWVfc2l6ZSk7CiAJaWYgKCFhY2Nlc3Nfb2so
ZnJhbWUsIGZyYW1lX3NpemUpKQpAQCAtNDY1LDQgKzQ2OSwxMCBAQCB2b2lkIF9faW5pdCBpbml0
X3J0X3NpZ25hbF9lbnYodm9pZCkKIHsKIAlyaXNjdl92X3NjX3NpemUgPSBzaXplb2Yoc3RydWN0
IF9fcmlzY3ZfY3R4X2hkcikgKwogCQkJICBzaXplb2Yoc3RydWN0IF9fc2NfcmlzY3Zfdl9zdGF0
ZSkgKyByaXNjdl92X3ZzaXplOworCS8qCisJICogRGV0ZXJtaW5lIHRoZSBzdGFjayBzcGFjZSBy
ZXF1aXJlZCBmb3IgZ3VhcmFudGVlZCBzaWduYWwgZGVsaXZlcnkuCisJICogVGhlIHNpZ25hbF9t
aW5zaWdzdGtzeiB3aWxsIGJlIHBvcHVsYXRlZCBpbnRvIHRoZSBBVF9NSU5TSUdTVEtTWiBlbnRy
eQorCSAqIGluIHRoZSBhdXhpbGlhcnkgYXJyYXkgYXQgcHJvY2VzcyBzdGFydHVwLgorCSAqLwor
CXNpZ25hbF9taW5zaWdzdGtzeiA9IGdldF9ydF9mcmFtZV9zaXplKHRydWUpOwogfQotLSAKMi4x
Ny4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
