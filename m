Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC0BC25B7E
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 11:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZa4HdgpGDoYiDE0lEFIt+Bn+kkz8ns8VvLpIPIvHoI=; b=Yk8OwCMpG+VzuC
	px5UGcU/t1ttIzzh5WD422mGrWwBFquWkvNvRSmSTiBoRDLIrCp2+p4XWaApjYBkz4yuHJaPSVVEy
	hMqgC0z0yMeoqge1RHFNbD5ckbijngcAJ8IRluuKMQQ9W7U0aBRgbaRBNPu3hsGoKK1Aft9nOx15u
	tYToEbPsFRD/3IngG4xzm5b/uewOM13ieDwCf6m80P0PLnEO6EZ8rRs79/mAMzGvBLNyLhiLpWeF5
	CEZ95aex8/5l9XG+ZD0scWSBjmauqQdmR+bjt4GlS3Ddxm/igVsBkpiiu1z0Ho1mWowAAjFdubO8E
	brbbniDpv0Ix7z+LMXKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9NzP-0000000HKgK-2UPj;
	Tue, 21 May 2024 11:49:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9NzL-0000000HKd9-473d
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 11:49:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 71891621B6;
	Tue, 21 May 2024 11:49:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A029C2BD11;
	Tue, 21 May 2024 11:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716292143;
	bh=OVWdCLBgos2+PxBgxUayZBCsMHg1Thrc2DYHTXT9Xk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JuFto51YhlnEYtIE5p7m81bgvn/FesIVCWWQrgta9FQ3B2VFM/MCwDRyv7PAP2PlM
	 OcGLM/qjlm9yHvJ42jxE/UVj9EaiKy4E4zOVTD7Aea+fGMPCYzFxrVrBmSXy/h4HDF
	 t926Rbef+QZc/5v6EBJZ92qopYPJAzrENcM/2kOdAKCneRJkyCJGk4uZ6XvWBnWTNY
	 UE0khZMgvG8QpNoNPeaJxOTsVFSCWY8XS77MDoU002hcPtheNG1MeEYymcH5WPgVDs
	 MmithN7NtP4w31zwP1/4w2/Ea+uNEwNZpSwC/G3ClsBE05NPIEj8Isbdxl0d8R08Xw
	 kjhfVQUKhzJew==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v3 4/9] riscv: mm: Refactor create_linear_mapping_range() for memory hot add
Date: Tue, 21 May 2024 13:48:25 +0200
Message-Id: <20240521114830.841660-5-bjorn@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240521114830.841660-1-bjorn@kernel.org>
References: <20240521114830.841660-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_044904_166857_12E26162 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKQWRkIGEgcGFyYW1ldGVy
IHRvIHRoZSBkaXJlY3QgbWFwIHNldHVwIGZ1bmN0aW9uLCBzbyBpdCBjYW4gYmUgdXNlZCBpbgph
cmNoX2FkZF9tZW1vcnkoKSBsYXRlci4KClJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFs
ZXhnaGl0aUByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2
aWRAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IE9zY2FyIFNhbHZhZG9yIDxvc2FsdmFkb3JAc3Vz
ZS5kZT4KU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgot
LS0KIGFyY2gvcmlzY3YvbW0vaW5pdC5jIHwgMTUgKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKaW5kZXggYzk2OTQyN2VhYjg4
Li42ZjcyYjBiMmI4NTQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCisrKyBiL2Fy
Y2gvcmlzY3YvbW0vaW5pdC5jCkBAIC0xMjI3LDcgKzEyMjcsNyBAQCBhc21saW5rYWdlIHZvaWQg
X19pbml0IHNldHVwX3ZtKHVpbnRwdHJfdCBkdGJfcGEpCiB9CiAKIHN0YXRpYyB2b2lkIF9fbWVt
aW5pdCBjcmVhdGVfbGluZWFyX21hcHBpbmdfcmFuZ2UocGh5c19hZGRyX3Qgc3RhcnQsIHBoeXNf
YWRkcl90IGVuZCwKLQkJCQkJCSAgdWludHB0cl90IGZpeGVkX21hcF9zaXplKQorCQkJCQkJICB1
aW50cHRyX3QgZml4ZWRfbWFwX3NpemUsIGNvbnN0IHBncHJvdF90ICpwZ3Byb3QpCiB7CiAJcGh5
c19hZGRyX3QgcGE7CiAJdWludHB0cl90IHZhLCBtYXBfc2l6ZTsKQEAgLTEyMzgsNyArMTIzOCw3
IEBAIHN0YXRpYyB2b2lkIF9fbWVtaW5pdCBjcmVhdGVfbGluZWFyX21hcHBpbmdfcmFuZ2UocGh5
c19hZGRyX3Qgc3RhcnQsIHBoeXNfYWRkcl90CiAJCQkJCSAgICBiZXN0X21hcF9zaXplKHBhLCB2
YSwgZW5kIC0gcGEpOwogCiAJCWNyZWF0ZV9wZ2RfbWFwcGluZyhzd2FwcGVyX3BnX2RpciwgdmEs
IHBhLCBtYXBfc2l6ZSwKLQkJCQkgICBwZ3Byb3RfZnJvbV92YSh2YSkpOworCQkJCSAgIHBncHJv
dCA/ICpwZ3Byb3QgOiBwZ3Byb3RfZnJvbV92YSh2YSkpOwogCX0KIH0KIApAQCAtMTI4MiwyMiAr
MTI4MiwxOSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgY3JlYXRlX2xpbmVhcl9tYXBwaW5nX3BhZ2Vf
dGFibGUodm9pZCkKIAkJaWYgKGVuZCA+PSBfX3BhKFBBR0VfT0ZGU0VUKSArIG1lbW9yeV9saW1p
dCkKIAkJCWVuZCA9IF9fcGEoUEFHRV9PRkZTRVQpICsgbWVtb3J5X2xpbWl0OwogCi0JCWNyZWF0
ZV9saW5lYXJfbWFwcGluZ19yYW5nZShzdGFydCwgZW5kLCAwKTsKKwkJY3JlYXRlX2xpbmVhcl9t
YXBwaW5nX3JhbmdlKHN0YXJ0LCBlbmQsIDAsIE5VTEwpOwogCX0KIAogI2lmZGVmIENPTkZJR19T
VFJJQ1RfS0VSTkVMX1JXWAotCWNyZWF0ZV9saW5lYXJfbWFwcGluZ19yYW5nZShrdGV4dF9zdGFy
dCwga3RleHRfc3RhcnQgKyBrdGV4dF9zaXplLCAwKTsKLQljcmVhdGVfbGluZWFyX21hcHBpbmdf
cmFuZ2Uoa3JvZGF0YV9zdGFydCwKLQkJCQkgICAga3JvZGF0YV9zdGFydCArIGtyb2RhdGFfc2l6
ZSwgMCk7CisJY3JlYXRlX2xpbmVhcl9tYXBwaW5nX3JhbmdlKGt0ZXh0X3N0YXJ0LCBrdGV4dF9z
dGFydCArIGt0ZXh0X3NpemUsIDAsIE5VTEwpOworCWNyZWF0ZV9saW5lYXJfbWFwcGluZ19yYW5n
ZShrcm9kYXRhX3N0YXJ0LCBrcm9kYXRhX3N0YXJ0ICsga3JvZGF0YV9zaXplLCAwLCBOVUxMKTsK
IAogCW1lbWJsb2NrX2NsZWFyX25vbWFwKGt0ZXh0X3N0YXJ0LCAga3RleHRfc2l6ZSk7CiAJbWVt
YmxvY2tfY2xlYXJfbm9tYXAoa3JvZGF0YV9zdGFydCwga3JvZGF0YV9zaXplKTsKICNlbmRpZgog
CiAjaWZkZWYgQ09ORklHX0tGRU5DRQotCWNyZWF0ZV9saW5lYXJfbWFwcGluZ19yYW5nZShrZmVu
Y2VfcG9vbCwKLQkJCQkgICAga2ZlbmNlX3Bvb2wgKyBLRkVOQ0VfUE9PTF9TSVpFLAotCQkJCSAg
ICBQQUdFX1NJWkUpOworCWNyZWF0ZV9saW5lYXJfbWFwcGluZ19yYW5nZShrZmVuY2VfcG9vbCwg
a2ZlbmNlX3Bvb2wgKyBLRkVOQ0VfUE9PTF9TSVpFLCBQQUdFX1NJWkUsIE5VTEwpOwogCiAJbWVt
YmxvY2tfY2xlYXJfbm9tYXAoa2ZlbmNlX3Bvb2wsIEtGRU5DRV9QT09MX1NJWkUpOwogI2VuZGlm
Ci0tIAoyLjQwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
