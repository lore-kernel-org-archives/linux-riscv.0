Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47765C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 15:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tx/8lnt9t/rMLVspknLD3NwxhKfkjlzOORZxl9++VVY=; b=JznMOXxPGx1blu
	8DHXpEvvvB58MtljYbA91Ab2aYVdEijN3tw+UDqlgPnRm2Qq19EJiBexyEpbYZRS6zEePOzL02zR2
	em8M5sJ9o20r+/tsEg4hxvfP/9BENY0Ym4IeNctnT/cYhj/3TinSqQLSKQMWYwmASh96LARUdNcLu
	MHtzV8CsP+mbUDkNaaQMlqYZjuRWvwXBnIHoyMB3joJvREXIHArHQ6ezoH/qoWdcNuYvdGyrol9aC
	KifItsN7imvXbKw/F5PvaRy8UEZElkmTf1GSK1PxZwUbIbFeb+E1HvQWOjfuKIjEexOOJxTngsCK8
	FffbkXAMef5u9SZxxcGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CKi-00FzYU-0N;
	Mon, 05 Jun 2023 15:41:24 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CKe-00FzWK-0n
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 15:41:21 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b04706c85fso46179435ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 08:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685979679; x=1688571679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpPHieyVlo9+c3IVReFx0FCE99hnAu9eLlwHEwust2g=;
        b=ASbUni3uP4QBlGKnA1jDgKxw1LgqQLuh8uABwBOBgPAxn74EU+91YKZFGhbM0N1K7H
         zSLUEfV+4MQ+PO4AX0M32yA7pU4veQReW+1M91ci/MFm7EmuNw1gAtvQ7oSEMvw/2EbR
         0WW/9sav1Dtt+zH615PqAFfB6jyT8ViqkmiEBnlUUU34V7tqQiyPSDUoQeCX7iy1dXdf
         +uLr/e1KUAx0KHhkc1LXCcI8+YQQ50HO+tnPYSNa/9cy4dOvJ+QEp3U+SwaJROZ+e6ZL
         PblvsYeRYuhE7w2zg8uKQEgGyr6NnWGdKjnQ2VXxi0RwtMlkWMekOOZaPNvugof8aBc6
         K2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979679; x=1688571679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MpPHieyVlo9+c3IVReFx0FCE99hnAu9eLlwHEwust2g=;
        b=Rd7aDty3LGp6eKPfr36BaLDCiUZZ7/S1WVf/y21b3m732ojMVTaRyqrRYwFQge/ZOT
         yPJZKSPgloTIbAhi9A3JBrclB+hsLky55d8BmqwONLKFpSPqEHKLqCx6z8aPgPfcmwgy
         05EhXUIRc6UmxHcm9lBY4U1U3T9pQIVAYqof0GI10aRyJ6MQyNNdBXFtUlw82bIvAwNx
         Q3CvL5nxD2WAQWBSfNk1ETiTJULolW3xs4IR0QskVMOIgaULIL91bH8fWRTrt/LzVQba
         /hQEqxyK2WcAv2Cu13u/JX5a5h0LuMfReK1Y4duAJmKLkde/g3vgUNriFScFmOlhepJ6
         XKLg==
X-Gm-Message-State: AC+VfDz21VUSik2KLgdfLpmtXJq97XPg/EMsFS5ocZtRtayksXbbfBt8
	KdUwHaepw6qtgIfMIyjej6Fqw0rcrUmF+3pG4c8T3nJbUGMnVMmhqTSEymNnxlXpZLMkhXWEHoi
	eyCPme7o8C+i+73W0W6yA5ZmlMjTOfIE8gzfLJrxUSjCt4+Ya9SPgi4OxEoaPllZwmOQ1t5hUEg
	AockiI0lWLn3PFlY0=
X-Google-Smtp-Source: ACHHUZ5i3fvT6T1qemxpcIaS16TmjcZrIINJwytHecFRYPQau81EV/BhCKqVg+3ZMNtrc9oH82kduA==
X-Received: by 2002:a17:902:d712:b0:1af:d724:63ed with SMTP id w18-20020a170902d71200b001afd72463edmr7074424ply.42.1685979679176;
        Mon, 05 Jun 2023 08:41:19 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b001b0aec3ed59sm6725962plb.256.2023.06.05.08.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:41:18 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [PATCH -next v21 15/27] riscv: signal: Report signal frame size to userspace via auxv
Date: Mon,  5 Jun 2023 11:07:12 +0000
Message-Id: <20230605110724.21391-16-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230605110724.21391-1-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_084120_286904_310CED4E 
X-CRM114-Status: GOOD (  23.10  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, Kees Cook <keescook@chromium.org>, Andrew Bresticker <abrestic@rivosinc.com>, vineetg@rivosinc.com, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Vincent Chen <vincent.chen@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Eric Biederman <ebiederm@xmission.com>, Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Zong Li <zong.li@sifive.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, Al Viro <viro@zeniv.linux.org.uk>
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
OiBhZGQgaWNhY2hlIGZsdXNoIGZvciBub21tdSBzaWdyZXR1cm4gdHJhbXBvbGluZSIpCi0tLQog
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lbGYuaCAgICAgICAgIHwgIDkgKysrKysrKysrCiBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oICAgfCAgMiArKwogYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2F1eHZlYy5oIHwgIDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvc2lnbmFsLmMg
ICAgICAgICAgIHwgMjAgKysrKysrKysrKysrKysrLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgMjcg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2VsZi5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lbGYuaAppbmRleCAzMGU3
ZDI0NTU5NjAuLmNhMjNjNGY2YzQ0MCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9lbGYuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VsZi5oCkBAIC0xMDUsNiArMTA1
LDE1IEBAIGRvIHsJCQkJCQkJCVwKIAkJZ2V0X2NhY2hlX3NpemUoMywgQ0FDSEVfVFlQRV9VTklG
SUVEKSk7CQlcCiAJTkVXX0FVWF9FTlQoQVRfTDNfQ0FDSEVHRU9NRVRSWSwJCQlcCiAJCWdldF9j
YWNoZV9nZW9tZXRyeSgzLCBDQUNIRV9UWVBFX1VOSUZJRUQpKTsJXAorCS8qCQkJCQkJCSBcCisJ
ICogU2hvdWxkIGFsd2F5cyBiZSBub256ZXJvIHVubGVzcyB0aGVyZSdzIGEga2VybmVsIGJ1Zy4g
XAorCSAqIElmIHdlIGhhdmVuJ3QgZGV0ZXJtaW5lZCBhIHNlbnNpYmxlIHZhbHVlIHRvIGdpdmUg
dG8JIFwKKwkgKiB1c2Vyc3BhY2UsIG9taXQgdGhlIGVudHJ5OgkJCQkgXAorCSAqLwkJCQkJCQkg
XAorCWlmIChsaWtlbHkoc2lnbmFsX21pbnNpZ3N0a3N6KSkJCQkJIFwKKwkJTkVXX0FVWF9FTlQo
QVRfTUlOU0lHU1RLU1osIHNpZ25hbF9taW5zaWdzdGtzeik7IFwKKwllbHNlCQkJCQkJCSBcCisJ
CU5FV19BVVhfRU5UKEFUX0lHTk9SRSwgMCk7CQkJIFwKIH0gd2hpbGUgKDApCiAjZGVmaW5lIEFS
Q0hfSEFTX1NFVFVQX0FERElUSU9OQUxfUEFHRVMKIHN0cnVjdCBsaW51eF9iaW5wcm07CmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wcm9jZXNzb3IuaAppbmRleCBmMGRkZjY5MWFjNWUuLjM4ZGVkOGM1ZjIwNyAx
MDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAorKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCkBAIC03LDYgKzcsNyBAQAogI2RlZmluZSBf
QVNNX1JJU0NWX1BST0NFU1NPUl9ICiAKICNpbmNsdWRlIDxsaW51eC9jb25zdC5oPgorI2luY2x1
ZGUgPGxpbnV4L2NhY2hlLmg+CiAKICNpbmNsdWRlIDx2ZHNvL3Byb2Nlc3Nvci5oPgogCkBAIC04
MSw2ICs4Miw3IEBAIGludCByaXNjdl9vZl9wYXJlbnRfaGFydGlkKHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqbm9kZSwgdW5zaWduZWQgbG9uZyAqaGFydGlkKTsKIGV4dGVybiB2b2lkIHJpc2N2X2ZpbGxf
aHdjYXAodm9pZCk7CiBleHRlcm4gaW50IGFyY2hfZHVwX3Rhc2tfc3RydWN0KHN0cnVjdCB0YXNr
X3N0cnVjdCAqZHN0LCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnNyYyk7CiAKK2V4dGVybiB1bnNpZ25l
ZCBsb25nIHNpZ25hbF9taW5zaWdzdGtzeiBfX3JvX2FmdGVyX2luaXQ7CiAjZW5kaWYgLyogX19B
U1NFTUJMWV9fICovCiAKICNlbmRpZiAvKiBfQVNNX1JJU0NWX1BST0NFU1NPUl9IICovCmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKaW5kZXggZmIxODdhMzNjZTU4Li4xMGFhYTgzZGI4
OWUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaAorKysg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKQEAgLTM1LDUgKzM1LDYgQEAK
IAogLyogZW50cmllcyBpbiBBUkNIX0RMSU5GTyAqLwogI2RlZmluZSBBVF9WRUNUT1JfU0laRV9B
UkNICTkKKyNkZWZpbmUgQVRfTUlOU0lHU1RLU1oJCTUxCiAKICNlbmRpZiAvKiBfVUFQSV9BU01f
UklTQ1ZfQVVYVkVDX0ggKi8KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NpZ25hbC5j
IGIvYXJjaC9yaXNjdi9rZXJuZWwvc2lnbmFsLmMKaW5kZXggYzQ2ZjNkYzAzOWJiLi5mMTE3NjQx
YzFjNDkgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NpZ25hbC5jCisrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL3NpZ25hbC5jCkBAIC0yMyw2ICsyMyw4IEBACiAjaW5jbHVkZSA8YXNtL2Nz
ci5oPgogI2luY2x1ZGUgPGFzbS9jYWNoZWZsdXNoLmg+CiAKK3Vuc2lnbmVkIGxvbmcgc2lnbmFs
X21pbnNpZ3N0a3N6IF9fcm9fYWZ0ZXJfaW5pdDsKKwogZXh0ZXJuIHUzMiBfX3VzZXJfcnRfc2ln
cmV0dXJuWzJdOwogc3RhdGljIHNpemVfdCByaXNjdl92X3NjX3NpemUgX19yb19hZnRlcl9pbml0
OwogCkBAIC0xOTcsNyArMTk5LDcgQEAgc3RhdGljIGxvbmcgcmVzdG9yZV9zaWdjb250ZXh0KHN0
cnVjdCBwdF9yZWdzICpyZWdzLAogCXJldHVybiBlcnI7CiB9CiAKLXN0YXRpYyBzaXplX3QgZ2V0
X3J0X2ZyYW1lX3NpemUodm9pZCkKK3N0YXRpYyBzaXplX3QgZ2V0X3J0X2ZyYW1lX3NpemUoYm9v
bCBjYWxfYWxsKQogewogCXN0cnVjdCBydF9zaWdmcmFtZSBfX3VzZXIgKmZyYW1lOwogCXNpemVf
dCBmcmFtZV9zaXplOwpAQCAtMjA1LDggKzIwNywxMCBAQCBzdGF0aWMgc2l6ZV90IGdldF9ydF9m
cmFtZV9zaXplKHZvaWQpCiAKIAlmcmFtZV9zaXplID0gc2l6ZW9mKCpmcmFtZSk7CiAKLQlpZiAo
aGFzX3ZlY3RvcigpICYmIHJpc2N2X3ZfdnN0YXRlX3F1ZXJ5KHRhc2tfcHRfcmVncyhjdXJyZW50
KSkpCi0JCXRvdGFsX2NvbnRleHRfc2l6ZSArPSByaXNjdl92X3NjX3NpemU7CisJaWYgKGhhc192
ZWN0b3IoKSkgeworCQlpZiAoY2FsX2FsbCB8fCByaXNjdl92X3ZzdGF0ZV9xdWVyeSh0YXNrX3B0
X3JlZ3MoY3VycmVudCkpKQorCQkJdG90YWxfY29udGV4dF9zaXplICs9IHJpc2N2X3Zfc2Nfc2l6
ZTsKKwl9CiAJLyoKIAkgKiBQcmVzZXJ2ZWQgYSBfX3Jpc2N2X2N0eF9oZHIgZm9yIEVORCBzaWdu
YWwgY29udGV4dCBoZWFkZXIgaWYgYW4KIAkgKiBleHRlbnNpb24gdXNlcyBfX3Jpc2N2X2V4dHJh
X2V4dF9oZWFkZXIKQEAgLTIyNiw3ICsyMzAsNyBAQCBTWVNDQUxMX0RFRklORTAocnRfc2lncmV0
dXJuKQogCXN0cnVjdCBydF9zaWdmcmFtZSBfX3VzZXIgKmZyYW1lOwogCXN0cnVjdCB0YXNrX3N0
cnVjdCAqdGFzazsKIAlzaWdzZXRfdCBzZXQ7Ci0Jc2l6ZV90IGZyYW1lX3NpemUgPSBnZXRfcnRf
ZnJhbWVfc2l6ZSgpOworCXNpemVfdCBmcmFtZV9zaXplID0gZ2V0X3J0X2ZyYW1lX3NpemUoZmFs
c2UpOwogCiAJLyogQWx3YXlzIG1ha2UgYW55IHBlbmRpbmcgcmVzdGFydGVkIHN5c3RlbSBjYWxs
cyByZXR1cm4gLUVJTlRSICovCiAJY3VycmVudC0+cmVzdGFydF9ibG9jay5mbiA9IGRvX25vX3Jl
c3RhcnRfc3lzY2FsbDsKQEAgLTMyMyw3ICszMjcsNyBAQCBzdGF0aWMgaW50IHNldHVwX3J0X2Zy
YW1lKHN0cnVjdCBrc2lnbmFsICprc2lnLCBzaWdzZXRfdCAqc2V0LAogCXN0cnVjdCBydF9zaWdm
cmFtZSBfX3VzZXIgKmZyYW1lOwogCWxvbmcgZXJyID0gMDsKIAl1bnNpZ25lZCBsb25nIF9fbWF5
YmVfdW51c2VkIGFkZHI7Ci0Jc2l6ZV90IGZyYW1lX3NpemUgPSBnZXRfcnRfZnJhbWVfc2l6ZSgp
OworCXNpemVfdCBmcmFtZV9zaXplID0gZ2V0X3J0X2ZyYW1lX3NpemUoZmFsc2UpOwogCiAJZnJh
bWUgPSBnZXRfc2lnZnJhbWUoa3NpZywgcmVncywgZnJhbWVfc2l6ZSk7CiAJaWYgKCFhY2Nlc3Nf
b2soZnJhbWUsIGZyYW1lX3NpemUpKQpAQCAtNDY1LDQgKzQ2OSwxMCBAQCB2b2lkIF9faW5pdCBp
bml0X3J0X3NpZ25hbF9lbnYodm9pZCkKIHsKIAlyaXNjdl92X3NjX3NpemUgPSBzaXplb2Yoc3Ry
dWN0IF9fcmlzY3ZfY3R4X2hkcikgKwogCQkJICBzaXplb2Yoc3RydWN0IF9fc2NfcmlzY3Zfdl9z
dGF0ZSkgKyByaXNjdl92X3ZzaXplOworCS8qCisJICogRGV0ZXJtaW5lIHRoZSBzdGFjayBzcGFj
ZSByZXF1aXJlZCBmb3IgZ3VhcmFudGVlZCBzaWduYWwgZGVsaXZlcnkuCisJICogVGhlIHNpZ25h
bF9taW5zaWdzdGtzeiB3aWxsIGJlIHBvcHVsYXRlZCBpbnRvIHRoZSBBVF9NSU5TSUdTVEtTWiBl
bnRyeQorCSAqIGluIHRoZSBhdXhpbGlhcnkgYXJyYXkgYXQgcHJvY2VzcyBzdGFydHVwLgorCSAq
LworCXNpZ25hbF9taW5zaWdzdGtzeiA9IGdldF9ydF9mcmFtZV9zaXplKHRydWUpOwogfQotLSAK
Mi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
