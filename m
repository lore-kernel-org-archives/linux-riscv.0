Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F95C25B76
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 11:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NY9OLW9RU3R/3BpZW1xCMP2e2/X4AFIO2BLnNtIUdWg=; b=tykNK/w29Rpw7A
	DVh2TcqyE2js+u3RAu3WJLLpS+90VMefzVmns7GeXDg8xWt/qtpKiuEBWHmTTQ2K3HmO6QbVibD7m
	dyPgetF1YqTK4jBw6cEpVgsRmdcCVTa0RPpJXvvlc6+pSvc+sZG7NlWNdTaOzjj9AmLNY8EKvnnRd
	kiEhPGizajJ8ieVwOpOwpbjbpzLwdd+G9doYvvLHsol8U9DBzIcz1+4w4Qo7feujXCp4jHTLKWnkI
	WxMBtY6nPH5Alda9goUApCC8btzfYY61kVBDK863UG3c+rYh4fnDqzAto4FDfiOsxTucExMckX2sP
	3QKZ2B5xvHciwH/vZaYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEp1O-00000005jx0-1uxv;
	Wed, 05 Jun 2024 11:41:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEp1L-00000005jv4-0Dau
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 11:41:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A27B61828;
	Wed,  5 Jun 2024 11:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53260C32781;
	Wed,  5 Jun 2024 11:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717587693;
	bh=MENbBPiOyzG6FBgO0rCD/3ta5d0qLTF/n4fv5DxVET4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p39Mrvw8AJVDKum0Jwg2kb6k87OxJJJ6NrzWSjUUAw1HBTx0uMsmH4QIVLXMIQSjh
	 gGHpGG50o4vxjchkAer0QNCnDkBV9o8kftuixBD9zQDfl1A74EwF3vGFGAOgdDUt3J
	 jhltzpH8+ixqmF4cy66BaweUitmK0U5TaHrrG7i0qbCCCYYDxf1H7GcZfuSiv3PEH5
	 ODfv8fk9v6erj4Ljcbke3zr58EffgPQNPBd1xbKrR/e1Bfw5dXLk5FkLcBVflIxCHI
	 Bc0UHKuPkQS00F3mFuO5iPHr7YzBmcdN+Gt/nFL77/pTRGZDMKBxiaC+EFfD06kZCo
	 9XJgH9lq5cqLw==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v4 04/11] riscv: mm: Refactor create_linear_mapping_range() for memory hot add
Date: Wed,  5 Jun 2024 13:40:47 +0200
Message-ID: <20240605114100.315918-5-bjorn@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605114100.315918-1-bjorn@kernel.org>
References: <20240605114100.315918-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_044135_266355_7CB940AF 
X-CRM114-Status: UNSURE (   8.87  )
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
cmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKaW5kZXggMGRkMDRjZWRjMGQy
Li4xZjdlN2MyMjNiZWMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCisrKyBiL2Fy
Y2gvcmlzY3YvbW0vaW5pdC5jCkBAIC0xMjMyLDcgKzEyMzIsNyBAQCBhc21saW5rYWdlIHZvaWQg
X19pbml0IHNldHVwX3ZtKHVpbnRwdHJfdCBkdGJfcGEpCiB9CiAKIHN0YXRpYyB2b2lkIF9fbWVt
aW5pdCBjcmVhdGVfbGluZWFyX21hcHBpbmdfcmFuZ2UocGh5c19hZGRyX3Qgc3RhcnQsIHBoeXNf
YWRkcl90IGVuZCwKLQkJCQkJCSAgdWludHB0cl90IGZpeGVkX21hcF9zaXplKQorCQkJCQkJICB1
aW50cHRyX3QgZml4ZWRfbWFwX3NpemUsIGNvbnN0IHBncHJvdF90ICpwZ3Byb3QpCiB7CiAJcGh5
c19hZGRyX3QgcGE7CiAJdWludHB0cl90IHZhLCBtYXBfc2l6ZTsKQEAgLTEyNDMsNyArMTI0Myw3
IEBAIHN0YXRpYyB2b2lkIF9fbWVtaW5pdCBjcmVhdGVfbGluZWFyX21hcHBpbmdfcmFuZ2UocGh5
c19hZGRyX3Qgc3RhcnQsIHBoeXNfYWRkcl90CiAJCQkJCSAgICBiZXN0X21hcF9zaXplKHBhLCB2
YSwgZW5kIC0gcGEpOwogCiAJCWNyZWF0ZV9wZ2RfbWFwcGluZyhzd2FwcGVyX3BnX2RpciwgdmEs
IHBhLCBtYXBfc2l6ZSwKLQkJCQkgICBwZ3Byb3RfZnJvbV92YSh2YSkpOworCQkJCSAgIHBncHJv
dCA/ICpwZ3Byb3QgOiBwZ3Byb3RfZnJvbV92YSh2YSkpOwogCX0KIH0KIApAQCAtMTI4NywyMiAr
MTI4NywxOSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgY3JlYXRlX2xpbmVhcl9tYXBwaW5nX3BhZ2Vf
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
Ci0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
