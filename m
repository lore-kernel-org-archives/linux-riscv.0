Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260D8C77B73
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 17:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4DYU5nOPEDuvRJZVc6iRoG2e3q0i6oH0/g7DVqkOBnU=; b=Y+5x8dvpBAQFhY
	OShC9QKnwkwrnTXAiWgdUqOr9PNBzaYA6W2xqgeIzt3euhgkopNH/Bx5Y5HaX4P99XKJ6VJkWJEtw
	kYYEapwKvN+NcXsq6TqNfRd+0278FZGnnLxK6IIy5c6aWyb/j0Ryx4zz33BaBVI7DreXv5Dd2WIHt
	0lc53/qTiqrmG2K+scbzwmFu7cs4eia4zFA/8TVzLN1PII3dRN3S8mNk9Rxy7bpQ7F3FN5SuRs8QQ
	NjsCtASJIXz+aOCY6rX4w7e64SM+h9CLHG/JFKyvTxk2G7dIs4iY6Vwo+Kppj+uzpI5bX2F0AkvJN
	KbGfzOS/lx/DiD37tA8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnMnR-00ABM6-20;
	Fri, 14 Apr 2023 17:01:13 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLqe-00A25m-05
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 16:00:29 +0000
Received: by mail-pl1-x632.google.com with SMTP id lh8so5741914plb.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Apr 2023 09:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681488024; x=1684080024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhArLtXmRDwT+xcM9/tIlz+8j5s5RHf4cEPqi0dLUqk=;
        b=L2OKir3MBV5zkjlZ+m6wtL48Eht6E7K7eezwnTTuw/Lf1+ogugEBXFYd4rSXylnUMB
         xrxixD2s96bwBPeSkxlJ4VdG8yP4flDIrw7ZQwAwIq1CtqNxJZQCBhJJucGTSo6I9FLm
         7mwcdLS2CLx37BTlLaPFYBlHHmgttE+XeBdTSNv3UUoc+bWZ9MMIy7ZYOyvWcA+K2kQb
         TF3TqH85KUCfnfs5xlRdl1Sjnk1bapBZGFExVr8Gn8kdROxiGQ6nIQ2QUYMbAHrq+ejn
         kxN5iYJJgnhRfIdjvGUodjpbwdIwnq/XRLxk3vNt91FwKiRJZNtT+6/xjBjWhEnfzGzj
         CbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681488024; x=1684080024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AhArLtXmRDwT+xcM9/tIlz+8j5s5RHf4cEPqi0dLUqk=;
        b=TF4/jOubj2kUGhgZ6d9MKGiVWyHhFR+8diaI0jEJlyEBXyX2554t1ETOUDEE5X+Qe9
         VCFfN9Iznq2eo25kkYeg0XhzTVe8BCBniRWWMMWx+kXyow64k5O1QPB2kDuJSjJUeNiA
         TCCBtUzZ4XeZnc2RW8Tz51LR3C66XoN/JFc/udG77dDmUyWCpMX6vi7amLWrWkhf0Krg
         97lGAlnIrhk6wFPjs0JykpO/ykaACTRRNOus65A43DOmEaUghQHjvmOlNj6zcsJpJXb2
         73fMffFm/F4qGiCUi8vrU5fBAtp4tUG5DCp3EN6FD0CUfXvaIEs0NoyeMEae2/zBv+m9
         9jEg==
X-Gm-Message-State: AAQBX9cZKoqFCp+x007fOzmXWCr+94I6784wlOb/+Ud2Um3TnzuoTlrU
	FljHsXFyBdIfcibj1Tepl724MztIl3yTJNUex4zFLkUixwXOL33kbYEskdK0mFSSmQ+/VlogwDL
	NCOZqMt0p9uN0mAA6Zgv7Z1y/N+94iaYW9pWXOP/ZJmf3MhJc6PvrAZWQNTbHLb0RURF4fQGkwK
	cM81dbC43hTH3B
X-Google-Smtp-Source: AKy350aq13V1WMdOrFwInS9FRcRdyTazI0yTMF/74AshJFtvQPFRPWdwtLeeqvEK4q83qc0Ypr41Zg==
X-Received: by 2002:a17:90b:4b05:b0:23d:1f95:de1c with SMTP id lx5-20020a17090b4b0500b0023d1f95de1cmr6257199pjb.28.1681488024338;
        Fri, 14 Apr 2023 09:00:24 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id br8-20020a17090b0f0800b00240d4521958sm3083584pjb.18.2023.04.14.09.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 09:00:23 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [PATCH -next v18 14/20] riscv: signal: Report signal frame size to userspace via auxv
Date: Fri, 14 Apr 2023 15:58:37 +0000
Message-Id: <20230414155843.12963-15-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230414155843.12963-1-andy.chiu@sifive.com>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_090028_071869_1F7A49C0 
X-CRM114-Status: GOOD (  22.53  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, Kees Cook <keescook@chromium.org>, Andrew Bresticker <abrestic@rivosinc.com>, vineetg@rivosinc.com, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Vincent Chen <vincent.chen@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Eric Biederman <ebiederm@xmission.com>, Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Zong Li <zong.li@sifive.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>
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
ciA8aGVpa28uc3R1ZWJuZXJAdnJ1bGwuZXU+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9l
bGYuaCAgICAgICAgIHwgIDkgKysrKysrKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nl
c3Nvci5oICAgfCAgMiArKwogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oIHwg
IDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvc2lnbmFsLmMgICAgICAgICAgIHwgMjAgKysrKysrKysr
KysrKysrLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VsZi5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9lbGYuaAppbmRleCAzMGU3ZDI0NTU5NjAuLmNhMjNjNGY2YzQ0MCAx
MDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lbGYuaAorKysgYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2VsZi5oCkBAIC0xMDUsNiArMTA1LDE1IEBAIGRvIHsJCQkJCQkJCVwKIAkJ
Z2V0X2NhY2hlX3NpemUoMywgQ0FDSEVfVFlQRV9VTklGSUVEKSk7CQlcCiAJTkVXX0FVWF9FTlQo
QVRfTDNfQ0FDSEVHRU9NRVRSWSwJCQlcCiAJCWdldF9jYWNoZV9nZW9tZXRyeSgzLCBDQUNIRV9U
WVBFX1VOSUZJRUQpKTsJXAorCS8qCQkJCQkJCSBcCisJICogU2hvdWxkIGFsd2F5cyBiZSBub256
ZXJvIHVubGVzcyB0aGVyZSdzIGEga2VybmVsIGJ1Zy4gXAorCSAqIElmIHdlIGhhdmVuJ3QgZGV0
ZXJtaW5lZCBhIHNlbnNpYmxlIHZhbHVlIHRvIGdpdmUgdG8JIFwKKwkgKiB1c2Vyc3BhY2UsIG9t
aXQgdGhlIGVudHJ5OgkJCQkgXAorCSAqLwkJCQkJCQkgXAorCWlmIChsaWtlbHkoc2lnbmFsX21p
bnNpZ3N0a3N6KSkJCQkJIFwKKwkJTkVXX0FVWF9FTlQoQVRfTUlOU0lHU1RLU1osIHNpZ25hbF9t
aW5zaWdzdGtzeik7IFwKKwllbHNlCQkJCQkJCSBcCisJCU5FV19BVVhfRU5UKEFUX0lHTk9SRSwg
MCk7CQkJIFwKIH0gd2hpbGUgKDApCiAjZGVmaW5lIEFSQ0hfSEFTX1NFVFVQX0FERElUSU9OQUxf
UEFHRVMKIHN0cnVjdCBsaW51eF9iaW5wcm07CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3Byb2Nlc3Nvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaApp
bmRleCBmMGRkZjY5MWFjNWUuLjM4ZGVkOGM1ZjIwNyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wcm9jZXNzb3IuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nl
c3Nvci5oCkBAIC03LDYgKzcsNyBAQAogI2RlZmluZSBfQVNNX1JJU0NWX1BST0NFU1NPUl9ICiAK
ICNpbmNsdWRlIDxsaW51eC9jb25zdC5oPgorI2luY2x1ZGUgPGxpbnV4L2NhY2hlLmg+CiAKICNp
bmNsdWRlIDx2ZHNvL3Byb2Nlc3Nvci5oPgogCkBAIC04MSw2ICs4Miw3IEBAIGludCByaXNjdl9v
Zl9wYXJlbnRfaGFydGlkKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwgdW5zaWduZWQgbG9uZyAq
aGFydGlkKTsKIGV4dGVybiB2b2lkIHJpc2N2X2ZpbGxfaHdjYXAodm9pZCk7CiBleHRlcm4gaW50
IGFyY2hfZHVwX3Rhc2tfc3RydWN0KHN0cnVjdCB0YXNrX3N0cnVjdCAqZHN0LCBzdHJ1Y3QgdGFz
a19zdHJ1Y3QgKnNyYyk7CiAKK2V4dGVybiB1bnNpZ25lZCBsb25nIHNpZ25hbF9taW5zaWdzdGtz
eiBfX3JvX2FmdGVyX2luaXQ7CiAjZW5kaWYgLyogX19BU1NFTUJMWV9fICovCiAKICNlbmRpZiAv
KiBfQVNNX1JJU0NWX1BST0NFU1NPUl9IICovCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvdWFwaS9hc20vYXV4dmVjLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVj
LmgKaW5kZXggZmIxODdhMzNjZTU4Li4xMGFhYTgzZGI4OWUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20vYXV4dmVjLmgKQEAgLTM1LDUgKzM1LDYgQEAKIAogLyogZW50cmllcyBpbiBBUkNIX0RM
SU5GTyAqLwogI2RlZmluZSBBVF9WRUNUT1JfU0laRV9BUkNICTkKKyNkZWZpbmUgQVRfTUlOU0lH
U1RLU1oJCTUxCiAKICNlbmRpZiAvKiBfVUFQSV9BU01fUklTQ1ZfQVVYVkVDX0ggKi8KZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NpZ25hbC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2ln
bmFsLmMKaW5kZXggNTIyMmVkNGViNjc3Li40MGY3NDAxODM3NjggMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL3NpZ25hbC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NpZ25hbC5jCkBA
IC0yMiw2ICsyMiw4IEBACiAjaW5jbHVkZSA8YXNtL3ZlY3Rvci5oPgogI2luY2x1ZGUgPGFzbS9j
c3IuaD4KIAordW5zaWduZWQgbG9uZyBzaWduYWxfbWluc2lnc3Rrc3ogX19yb19hZnRlcl9pbml0
OworCiBleHRlcm4gdTMyIF9fdXNlcl9ydF9zaWdyZXR1cm5bMl07CiBzdGF0aWMgc2l6ZV90IHJp
c2N2X3Zfc2Nfc2l6ZSBfX3JvX2FmdGVyX2luaXQ7CiAKQEAgLTE5Niw3ICsxOTgsNyBAQCBzdGF0
aWMgbG9uZyByZXN0b3JlX3NpZ2NvbnRleHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsCiAJcmV0dXJu
IGVycjsKIH0KIAotc3RhdGljIHNpemVfdCBnZXRfcnRfZnJhbWVfc2l6ZSh2b2lkKQorc3RhdGlj
IHNpemVfdCBnZXRfcnRfZnJhbWVfc2l6ZShib29sIGNhbF9hbGwpCiB7CiAJc3RydWN0IHJ0X3Np
Z2ZyYW1lIF9fdXNlciAqZnJhbWU7CiAJc2l6ZV90IGZyYW1lX3NpemU7CkBAIC0yMDQsOCArMjA2
LDEwIEBAIHN0YXRpYyBzaXplX3QgZ2V0X3J0X2ZyYW1lX3NpemUodm9pZCkKIAogCWZyYW1lX3Np
emUgPSBzaXplb2YoKmZyYW1lKTsKIAotCWlmIChoYXNfdmVjdG9yKCkgJiYgcmlzY3Zfdl92c3Rh
dGVfcXVlcnkodGFza19wdF9yZWdzKGN1cnJlbnQpKSkKLQkJdG90YWxfY29udGV4dF9zaXplICs9
IHJpc2N2X3Zfc2Nfc2l6ZTsKKwlpZiAoaGFzX3ZlY3RvcigpKSB7CisJCWlmIChjYWxfYWxsIHx8
IHJpc2N2X3ZfdnN0YXRlX3F1ZXJ5KHRhc2tfcHRfcmVncyhjdXJyZW50KSkpCisJCQl0b3RhbF9j
b250ZXh0X3NpemUgKz0gcmlzY3Zfdl9zY19zaXplOworCX0KIAkvKgogCSAqIFByZXNlcnZlZCBh
IF9fcmlzY3ZfY3R4X2hkciBmb3IgRU5EIHNpZ25hbCBjb250ZXh0IGhlYWRlciBpZiBhbgogCSAq
IGV4dGVuc2lvbiB1c2VzIF9fcmlzY3ZfZXh0cmFfZXh0X2hlYWRlcgpAQCAtMjI1LDcgKzIyOSw3
IEBAIFNZU0NBTExfREVGSU5FMChydF9zaWdyZXR1cm4pCiAJc3RydWN0IHJ0X3NpZ2ZyYW1lIF9f
dXNlciAqZnJhbWU7CiAJc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrOwogCXNpZ3NldF90IHNldDsK
LQlzaXplX3QgZnJhbWVfc2l6ZSA9IGdldF9ydF9mcmFtZV9zaXplKCk7CisJc2l6ZV90IGZyYW1l
X3NpemUgPSBnZXRfcnRfZnJhbWVfc2l6ZShmYWxzZSk7CiAKIAkvKiBBbHdheXMgbWFrZSBhbnkg
cGVuZGluZyByZXN0YXJ0ZWQgc3lzdGVtIGNhbGxzIHJldHVybiAtRUlOVFIgKi8KIAljdXJyZW50
LT5yZXN0YXJ0X2Jsb2NrLmZuID0gZG9fbm9fcmVzdGFydF9zeXNjYWxsOwpAQCAtMzIxLDcgKzMy
NSw3IEBAIHN0YXRpYyBpbnQgc2V0dXBfcnRfZnJhbWUoc3RydWN0IGtzaWduYWwgKmtzaWcsIHNp
Z3NldF90ICpzZXQsCiB7CiAJc3RydWN0IHJ0X3NpZ2ZyYW1lIF9fdXNlciAqZnJhbWU7CiAJbG9u
ZyBlcnIgPSAwOwotCXNpemVfdCBmcmFtZV9zaXplID0gZ2V0X3J0X2ZyYW1lX3NpemUoKTsKKwlz
aXplX3QgZnJhbWVfc2l6ZSA9IGdldF9ydF9mcmFtZV9zaXplKGZhbHNlKTsKIAogCWZyYW1lID0g
Z2V0X3NpZ2ZyYW1lKGtzaWcsIHJlZ3MsIGZyYW1lX3NpemUpOwogCWlmICghYWNjZXNzX29rKGZy
YW1lLCBmcmFtZV9zaXplKSkKQEAgLTQ1OCw0ICs0NjIsMTAgQEAgdm9pZCBfX2luaXQgaW5pdF9y
dF9zaWduYWxfZW52KHZvaWQpCiB7CiAJcmlzY3Zfdl9zY19zaXplID0gc2l6ZW9mKHN0cnVjdCBf
X3Jpc2N2X2N0eF9oZHIpICsKIAkJCSAgc2l6ZW9mKHN0cnVjdCBfX3NjX3Jpc2N2X3Zfc3RhdGUp
ICsgcmlzY3Zfdl92c2l6ZTsKKwkvKgorCSAqIERldGVybWluZSB0aGUgc3RhY2sgc3BhY2UgcmVx
dWlyZWQgZm9yIGd1YXJhbnRlZWQgc2lnbmFsIGRlbGl2ZXJ5LgorCSAqIFRoZSBzaWduYWxfbWlu
c2lnc3Rrc3ogd2lsbCBiZSBwb3B1bGF0ZWQgaW50byB0aGUgQVRfTUlOU0lHU1RLU1ogZW50cnkK
KwkgKiBpbiB0aGUgYXV4aWxpYXJ5IGFycmF5IGF0IHByb2Nlc3Mgc3RhcnR1cC4KKwkgKi8KKwlz
aWduYWxfbWluc2lnc3Rrc3ogPSBnZXRfcnRfZnJhbWVfc2l6ZSh0cnVlKTsKIH0KLS0gCjIuMTcu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
