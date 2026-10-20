Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC23A60A2617
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 18:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4O1nPp0G;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WK+whklS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pEiuufZlPuug479Hcd57woRFC3GZlWGuPueVLc0kKro=; b=4O1nPp0GsRY+n7
	tF6JxB/mcdjox+uCex35o4oDqA5Q/dYecvI5/75mputx4z7NYp470nETc7xOrsKZKmx+OxhALjHTc
	e6nd15DlJ6/cEIfMxflB2fYxfuDo/Rpbt4IPJe5dKFtbI2uTM2Cz3cHeUyAJe1g0eKdj5+/7YSIhx
	MLlya5gaNXjkcRGuReaQdtBYv3Ukaedy9QijNSWTdf7gPv9hCYmiVoejdCI4PTOtMhU8UGcC/dVvA
	qWNDAp6PbR+zUGN6Gwtkw6LhmONT04NuRubdV32o5IVvnLXi907MHJyHJ+EvUTmTsZG8o26Hv4Qnb
	eKf6mS9iS1Dq5L3ZQHmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJERD-0000000AQKC-3aEP;
	Tue, 20 Oct 2026 18:19:51 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJER8-0000000AQHc-3YWq
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 18:19:47 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-353804b591eso6666791eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Oct 2026 11:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792520386; x=1793125186; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xOHuMA/WM9xuTdSj+ZDzOAw3l3xrB59FAR7IgfJil6U=;
        b=WK+whklS36hfBjKi6x9yGjAS6Or1Ch/aqZUSoS35VZWd3wsXcrTnZCEN0pplPy9X32
         Miab/69Z+DFnf+7p+wZPt4D5U/xWY5mJv7m+26TXqQHpB093d1ukZtjh9Kx/zp2mrr62
         HFl6HutvJmcqdqLxgGZg3b2fu3UHVN348LtRoKYtpNFj/JtDKdq6oQVWIwwY+TKRnbG2
         JLyNkAetncpUvZEfi5oaiH5DfBPPVK6MXqBwbM3+U/8G8sesp8s6Mywz7yRzs7Ez+8Um
         mvhVba8FVeHcz1NrqdzoddJU5IPgsT6JEnDpS2mv6ljpNI6g1eZen8pHuZuFkD+BJDRX
         B4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520386; x=1793125186;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOHuMA/WM9xuTdSj+ZDzOAw3l3xrB59FAR7IgfJil6U=;
        b=Y3+Y6PQZvFh5S915C7BDYpSSALJySvOFQ8c5oZyHOVLCnlOX8l0b7R+hM9LaBLXmtc
         iao6qXWECAEznClqtznNj4AmnpDoUfeF7ErCqsFBLi6aNOSV3jK8IkgSXEnJ7OJ2e+AL
         /AuD7sFcM09vtLDOHuo3/e9OtnQjLPtpuBEceCIwKvOJZ0FXAbOffWezv1NQACsXOtOi
         cvnYC7U8VIK8auiHGGXZIzQiOXL8aEHp2AptEM5n6FZJw97PjFCC7z72stXUTWDTlTlD
         69hdXh/jOxOQhlMIjvCD5PkHWTHaYrrZlX9Q5lQ2AGQZf/V29F5Y47/I9H+rvotGhwFa
         5Lbw==
X-Forwarded-Encrypted: i=1; AKwUvBzGgfBmwpWVrtz7UyrnWNzUySGUX1R2YNU9YLNyj5qI56Gs8rn2xICi6ax5yqu+xKOd814SF11bEccM+Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYJL3PTnlC/CmhkG7feA9lOuGOvaCcNFMnzIC+qv/wR6xG4Sp7ih
	BNd4wqO7ptjOC2PwE3F5cmuAVj+MdjbH/c9MX7Qe4bP131bddYg5bta+
X-Gm-Gg: AYBFou0pv8/oJzk5axNCCMG/CUe8slCsuD+7T+sl3bH5cUI7EwqyhQBKelvCNrPKOuP
	Jqs9jQIcqCFXyNnU9wLwUfk8Cj90r3hj6jCNnFceCfs5kYYm4ZaGz2Jr9f7I/AWIYFrmYcTROGy
	UozX9j2TtgxocLJmo939CqEQW9V/d2UOu++yykIRxS9/ZNf0Pv71XeQz3kdkBEwIICW7cFt1hsI
	wA8EQvKA+RZkfGlWrU0OYF4jWPYfD+DWFrWALA3EsyXFR7ypPlRAiJs+rCToDhCXdce7OyJtIQV
	nG1qlKKqCUiQDyIn8TWTd3doG+reEXIJKlZtOiCvNeR2bxGd7Zetsyzn++AhAsquid0feiFjzK0
	oJ/zaHcGTBkAGNa35jtwGmESUexm5+oUOCfK8tK8QLWKJzB6tQjxvZCAWCDbF6iGQ7SdESIXF+v
	UmHZw3bKkwpDDuwADJi4RAHXGsqLe7mt3N6Eynws4XjAqqWccbHaHJkbSTOYTaSxUd
X-Received: by 2002:a05:693c:65cc:b0:35c:99e1:c755 with SMTP id 5a478bee46e88-3674e355183mr55514eec.38.1792520385832;
        Tue, 20 Oct 2026 11:19:45 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm523728eec.2.2026.10.20.11.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:19:45 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] arm64/gcs: release GCS on failed fork
Date: Tue, 20 Oct 2026 15:19:30 -0300
Message-ID: <8522b8d3d3ecda7474d0af8b8517c1f5d708ecc2.1792519121.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792519121.git.ivanrwcm25@gmail.com>
References: <cover.1792519121.git.ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_111946_888941_C708DA2C 
X-CRM114-Status: GOOD (  16.32  )
X-Spam-Score: -0.1 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HK_RANDOM_FROM,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Y29weV90aHJlYWQoKSBtYXBzIGEgR0NTIGZvciBhIENMT05FX1ZNIGNoaWxkIGFuZCBjYW4gc3Rp
bGwgcmV0dXJuCjAuIEEgbGF0ZXIgY29weV9wcm9jZXNzKCkgZmFpbHVyZSB0aGVuIGdvZXMgdGhy
b3VnaApiYWRfZm9ya19jbGVhbnVwX3RocmVhZCwgd2hpY2ggY2FsbHMgZXhpdF90aHJlYWQoKS4g
VGhlIGhvbGUgdGhpcwpzZXJpZXMgaGl0cyBpcyBjbG9uZTMoQ0xPTkVfVk18Q0xPTkVfUElERkQp
IHdoZW4gcHV0X3VzZXIoKSBvZiB0aGUKcGlkZmQgZmFpbHMgYWZ0ZXIgdGhhdCBtYXBwaW5nLiBh
cm02NCBkaWQgbm90IGltcGxlbWVudApleGl0X3RocmVhZCgpLiBkZWFjdGl2YXRlX21tKCkgaXMg
d2hhdCBub3JtYWxseSBjYWxscyBnY3NfZnJlZSgpLAphbmQgaXQgZG9lcyBub3QgcnVuIG9uIHRo
aXMgcGF0aC4gRWFjaCByZWplY3RlZCBjbG9uZSBsZWF2ZXMgb25lCkdDUyBWTUEgaW4gdGhlIHBh
cmVudCdzIG1tIHVudGlsIHRoZSBtbSBkaWVzLgoKU2VsZWN0IEhBVkVfRVhJVF9USFJFQUQgYW5k
IGZyZWUgdGhlIGNoaWxkJ3MgR0NTIGZyb20KZXhpdF90aHJlYWQoKS4gZ2NzX2ZyZWUoKSBhbHJl
YWR5IGlnbm9yZXMgYSBjbGVhcmVkIGJhc2UgYW5kIGEKZGlmZmVyZW50IG1tLCBzbyB0aGUgdXN1
YWwgZXhpdCBwYXRoIChkZWFjdGl2YXRlX21tKCkgdGhlbiB0aGlzKSBpcwphIG5vLW9wIHRoZSBz
ZWNvbmQgdGltZS4gY29weV90aHJlYWRfZ2NzKCkgemVyb3MgdGhlIGluaGVyaXRlZAp0cmFja2lu
ZyBiZWZvcmUgYSB1c2VyLXRocmVhZCBhbGxvY2F0aW9uLCBzbyBhbiBhbGxvY2F0aW9uIGVycm9y
CnN0aWxsIHNraXBzIGV4aXRfdGhyZWFkKCkgd2l0aCBub3RoaW5nIHRvIHVubWFwLgoKVGFza3Mg
Y3JlYXRlZCB0aHJvdWdoIHRoZSBhcmdzLT5mbiBwYXRoIChrZXJuZWxfdGhyZWFkKCksCmNyZWF0
ZV9pb190aHJlYWQoKSwgYW5kIHNpbWlsYXIpIGRvIG5vdCBhbGxvY2F0ZSBhIHVzZXIgR0NTIGlu
CmNvcHlfdGhyZWFkKCkuIFRoZXkgc3RpbGwgaW5oZXJpdCBHQ1MgdHJhY2tpbmcgdmlhCmFyY2hf
ZHVwX3Rhc2tfc3RydWN0KCksIGFuZCB3aXRoIENMT05FX1ZNIGEgbGF0ZXIgZmFpbGVkCmNvcHlf
cHJvY2VzcygpIHN0aWxsIHNoYXJlcyB0aGUgY2FsbGVyJ3MgbW0sIHNvIGdjc19mcmVlKCkncyBt
bQpjaGVjayBkb2VzIG5vdCBzYXZlIHVzLiBDbGVhciB0aGF0IHRyYWNraW5nIHdpdGgKZ2NzX3Jl
c2V0X3RocmVhZCgpLCBhbiBlbXB0eSBzdHViIHdoZW4gIUNPTkZJR19BUk02NF9HQ1MuCgp4ODYg
ZG9lcyBub3QgbmVlZCB0aGUgc2FtZSBhcmdzLT5mbiBjbGVhcjogY29weV90aHJlYWQoKSBydW5z
CnNoc3RrX2FsbG9jX3RocmVhZF9zdGFjaygpIGJlZm9yZSBib3RoIHRoZSBQRl9LVEhSRUFEIGFu
ZCBsYXRlcgphcmdzLT5mbiByZXR1cm4gcGF0aHMsIHNvIENMT05FX1ZNIHJlcGxhY2VzIHRoZSBp
bmhlcml0ZWQgdHJhY2tpbmcKZmlyc3QuCgpUZXN0ZWQgd2l0aCBDT05GSUdfQVJNNjRfR0NTIG9u
IFFFTVUgMTEuMS4yIC1tYWNoaW5lIHZpcnQgLWNwdSBtYXguClNpeHRlZW4gY2xvbmUzKCkgY2Fs
bHMgd2l0aCBDTE9ORV9WTXxDTE9ORV9QSURGRCBhbmQgYW4gdW53cml0YWJsZQpwaWRmZCBwb2lu
dGVyIGxlYWtlZCAxNiBHQ1MgVk1BcyB3aXRob3V0IHRoZSBmaXguIFdpdGggaXQsIHRoZSBWTUEK
Y291bnQgd2FzIHVuY2hhbmdlZC4KCkZpeGVzOiA1MDY0OTZiY2JiNDIgKCJhcm02NC9nY3M6IEVu
c3VyZSB0aGF0IG5ldyB0aHJlYWRzIGhhdmUgYSBHQ1MiKQpDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZwpDYzogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPgpBc3Npc3RlZC1ieTogTExN
ClNpZ25lZC1vZmYtYnk6IEl2w6FuIEV6ZXF1aWVsIFJvZHJpZ3VleiA8aXZhbnJ3Y20yNUBnbWFp
bC5jb20+Ci0tLQogYXJjaC9hcm02NC9LY29uZmlnICAgICAgICAgICB8ICAxICsKIGFyY2gvYXJt
NjQvaW5jbHVkZS9hc20vZ2NzLmggfCAgOCArKysrKysrKwogYXJjaC9hcm02NC9rZXJuZWwvcHJv
Y2Vzcy5jICB8IDE5ICsrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMjggaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvS2NvbmZpZyBiL2FyY2gvYXJtNjQv
S2NvbmZpZwppbmRleCBjYWI3NDFhNjk1ZjUuLmM3ZmM3OTQwOWY5OCAxMDA2NDQKLS0tIGEvYXJj
aC9hcm02NC9LY29uZmlnCisrKyBiL2FyY2gvYXJtNjQvS2NvbmZpZwpAQCAtMTc3LDYgKzE3Nyw3
IEBAIGNvbmZpZyBBUk02NAogCXNlbGVjdCBIQVZFX0FSTV9TTUNDQwogCXNlbGVjdCBIQVZFX0FT
TV9NT0RWRVJTSU9OUwogCXNlbGVjdCBIQVZFX0VCUEZfSklUCisJc2VsZWN0IEhBVkVfRVhJVF9U
SFJFQUQKIAlzZWxlY3QgSEFWRV9DX1JFQ09SRE1DT1VOVAogCXNlbGVjdCBIQVZFX0NNUFhDSEdf
RE9VQkxFCiAJc2VsZWN0IEhBVkVfQ01QWENIR19MT0NBTApkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9pbmNsdWRlL2FzbS9nY3MuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vZ2NzLmgKaW5kZXgg
OGZhMDcwNzA2OWU4Li5mNDdhYWFkMzBkN2QgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvaW5jbHVk
ZS9hc20vZ2NzLmgKKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9nY3MuaApAQCAtNjcsNiAr
NjcsMTMgQEAgdm9pZCBnY3NfcHJlc2VydmVfY3VycmVudF9zdGF0ZSh2b2lkKTsKIHVuc2lnbmVk
IGxvbmcgZ2NzX2FsbG9jX3RocmVhZF9zdGFjayhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaywKIAkJ
CQkgICAgIGNvbnN0IHN0cnVjdCBrZXJuZWxfY2xvbmVfYXJncyAqYXJncyk7CiAKK3N0YXRpYyBp
bmxpbmUgdm9pZCBnY3NfcmVzZXRfdGhyZWFkKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaykKK3sK
Kwl0YXNrLT50aHJlYWQuZ2NzX2Jhc2UgPSAwOworCXRhc2stPnRocmVhZC5nY3Nfc2l6ZSA9IDA7
CisJdGFzay0+dGhyZWFkLmdjc3ByX2VsMCA9IDA7Cit9CisKIHN0YXRpYyBpbmxpbmUgaW50IGdj
c19jaGVja19sb2NrZWQoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLAogCQkJCSAgIHVuc2lnbmVk
IGxvbmcgbmV3X3ZhbCkKIHsKQEAgLTE2Nyw2ICsxNzQsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wg
dGFza19nY3NfZWwwX2VuYWJsZWQoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKQogc3RhdGljIGlu
bGluZSB2b2lkIGdjc19zZXRfZWwwX21vZGUoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKSB7IH0K
IHN0YXRpYyBpbmxpbmUgdm9pZCBnY3NfZnJlZShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2spIHsg
fQogc3RhdGljIGlubGluZSB2b2lkIGdjc19wcmVzZXJ2ZV9jdXJyZW50X3N0YXRlKHZvaWQpIHsg
fQorc3RhdGljIGlubGluZSB2b2lkIGdjc19yZXNldF90aHJlYWQoc3RydWN0IHRhc2tfc3RydWN0
ICp0YXNrKSB7IH0KIHN0YXRpYyBpbmxpbmUgdm9pZCBwdXRfdXNlcl9nY3ModW5zaWduZWQgbG9u
ZyB2YWwsIHVuc2lnbmVkIGxvbmcgX191c2VyICphZGRyLAogCQkJCWludCAqZXJyKSB7IH0KIHN0
YXRpYyBpbmxpbmUgdm9pZCBwdXNoX3VzZXJfZ2NzKHVuc2lnbmVkIGxvbmcgdmFsLCBpbnQgKmVy
cikgeyB9CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL2Fy
bTY0L2tlcm5lbC9wcm9jZXNzLmMKaW5kZXggNTgxZjgwZTliOWI3Li44M2Q1YTA3YTIzOGYgMTAw
NjQ0Ci0tLSBhL2FyY2gvYXJtNjQva2VybmVsL3Byb2Nlc3MuYworKysgYi9hcmNoL2FybTY0L2tl
cm5lbC9wcm9jZXNzLmMKQEAgLTM0MSw2ICszNDEsMTYgQEAgdm9pZCBmbHVzaF90aHJlYWQodm9p
ZCkKIAlmbHVzaF9nY3MoKTsKIH0KIAordm9pZCBleGl0X3RocmVhZChzdHJ1Y3QgdGFza19zdHJ1
Y3QgKnRzaykKK3sKKwkvKgorCSAqIGNvcHlfcHJvY2VzcygpIGNhbGxzIHRoaXMgYWZ0ZXIgY29w
eV90aHJlYWQoKSByZXR1cm5zIDAuCisJICogZGVhY3RpdmF0ZV9tbSgpIGRvZXMgbm90IHJ1biBv
biB0aGF0IGZhaWx1cmUgcGF0aC4KKwkgKiBnY3NfZnJlZSgpIGlzIGEgbm8tb3Agb25jZSBnY3Nf
YmFzZSBpcyBjbGVhcmVkLgorCSAqLworCWdjc19mcmVlKHRzayk7Cit9CisKIHZvaWQgYXJjaF9y
ZWxlYXNlX3Rhc2tfc3RydWN0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrKQogewogCWZwc2ltZF9y
ZWxlYXNlX3Rhc2sodHNrKTsKQEAgLTUwMyw2ICs1MTMsMTUgQEAgaW50IGNvcHlfdGhyZWFkKHN0
cnVjdCB0YXNrX3N0cnVjdCAqcCwgY29uc3Qgc3RydWN0IGtlcm5lbF9jbG9uZV9hcmdzICphcmdz
KQogCiAJCXAtPnRocmVhZC5jcHVfY29udGV4dC54MTkgPSAodW5zaWduZWQgbG9uZylhcmdzLT5m
bjsKIAkJcC0+dGhyZWFkLmNwdV9jb250ZXh0LngyMCA9ICh1bnNpZ25lZCBsb25nKWFyZ3MtPmZu
X2FyZzsKKwkJLyoKKwkJICogVGFza3MgY3JlYXRlZCB0aHJvdWdoIHRoZSBhcmdzLT5mbiBwYXRo
IGRvIG5vdAorCQkgKiBhbGxvY2F0ZSBhIHVzZXIgR0NTIGhlcmUuIENsZWFyIGluaGVyaXRlZCBh
bGxvY2F0aW9uCisJCSAqIHRyYWNraW5nIHNvIGEgbGF0ZXIgZmFpbGVkIGNvcHlfcHJvY2Vzcygp
IGNhbm5vdAorCQkgKiByZWxlYXNlIHRoZSBjYWxsZXIncyBHQ1Mgd2hlbiB0aGUgbW0gaXMgc3Rp
bGwgc2hhcmVkCisJCSAqIChDTE9ORV9WTSksIGFzIHdpdGgga2VybmVsX3RocmVhZCgpIGFuZAor
CQkgKiBjcmVhdGVfaW9fdGhyZWFkKCkuCisJCSAqLworCQlnY3NfcmVzZXRfdGhyZWFkKHApOwog
CiAJCWlmIChzeXN0ZW1fc3VwcG9ydHNfcG9lKCkpCiAJCQlwLT50aHJlYWQucG9yX2VsMCA9IFBP
Ul9FTDBfSU5JVDsKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
