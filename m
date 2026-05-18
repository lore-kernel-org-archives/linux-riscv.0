Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32134CD4F3C
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 08:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QpoqaMfb/jtN0ERXceFCuqBP5jLb+q/XkHFMFCf8oU4=; b=lC3IZeHRDZDJHb
	S1VtAjUPEAudsCGzPFJGv28j4lxt0Nn5KWjWqWtg6GGZknTm143AsIHEOfNfAouvW4f79gaNNiruz
	m6xcCrtImmi2gYR9W9gOJUsk1gCZkNUDTgIFZnw52uj13pAFtItIcAWqSzOU4RYNkrtHBYTdfFx6L
	ytqWFjm28gJVK7o4FJD01npEEIehc7VUSKZywCjs/TDiEh6crVE5D+kXaSlQAQERe9moEt/90+WrB
	6HxTjNooXKe/n4VJL3lz2M5qHmqNKKl6Jtrna62J0jHxsvaRcW26q9/2lVi9qKlwkOrAFu7EvksgD
	ZcwW5CbUOUCuOZhDPQ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOt0o-0000000EiDu-2BmE;
	Mon, 18 May 2026 08:07:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOt0O-0000000EiA8-3i1K
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 08:07:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB16943D9E;
	Mon, 18 May 2026 08:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25301C2BCB7;
	Mon, 18 May 2026 08:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779091635;
	bh=oBZLi+ChKV2BA9z1+gJz0dQZF0z5+WDX6/4ux+xL7Rk=;
	h=From:To:Cc:Subject:Date:From;
	b=bCjruGr0Hgw/E3lW0Bb1+ZUe+OJy9Td9/hzcANEiR+PDw/PuvM5Q4noE7JaQ1ClYb
	 l2/sLSw1UMnRJjtATHMT0nykMYTdnQeVZWIfDgTekRJG6sRdIQBGGvQO0F5aIg6GXB
	 ZCiFJRdcGO+ANAnqRS48eHCQon+FpTeqyRCT4DXJTOtiiYZ/gALZiC0UWpcTCXjjff
	 sJ8C3cCC9ypoYNjKH7saxrUYQXSD7kZUxt6Fwt6EfaJU8PQkUYOyJEc0ZMhhbP51y3
	 elRC782nxHAWXXOS/m5PEv8gomZ6DDQ8JGHXXK06QzW/XCDtUJBFwTJRA7gPmk/kB5
	 a566GAZ3/G8Gw==
From: Guo Ren <guoren@kernel.org>
To: guoren@kernel.org,
	gaohan@iscas.ac.cn,
	wangruikang@iscas.ac.cn
Cc: alex@ghiti.fr,
	alexghiti@rivosinc.com,
	bjorn@kernel.org,
	bjorn@rivosinc.com,
	cuiyunhui@bytedance.com,
	fangyu.yu@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH V3] riscv: mm: Fixup no5lvl failure when vaddr is invalid
Date: Mon, 18 May 2026 08:06:46 +0000
Message-ID: <20260518080646.1278708-1-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_010716_944724_AE494417 
X-CRM114-Status: GOOD (  11.51  )
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

RnJvbTogIkd1byBSZW4gKEFsaWJhYmEgREFNTyBBY2FkZW15KSIgPGd1b3JlbkBrZXJuZWwub3Jn
PgoKVW5saWtlIG5vNGx2bCwgbm81bHZsIHN0aWxsIGNvbnRpbnVlcyBkZXRlY3Qgc2F0cCwgd2hp
Y2gKcmVxdWlyZXMgdmE9cGEgbWFwcGluZy4gV2hlbiBwYT0weDgwMDAwMDAwMDAwMCwgbm81bHZs
CndvdWxkIGZhaWwgaW4gU3Y0OCBtb2RlIGR1ZSB0byBhbiBpbGxlZ2FsIFZBIHZhbHVlIG9mCjB4
ODAwMDAwMDAwMDAwLgoKU28sIHByZXZlbnQgZGV0ZWN0aW5nIHRoZSBzYXRwIGZsb3cgZm9yIG5v
NWx2bCwgd2hlbgp2YWRkciBpcyBpbnZhbGlkLiBBZGQgdGhlIGlzX3ZhZGRyX3ZhbGlkKCkgZnVu
Y3Rpb24gZm9yCmNoZWNraW5nLgoKRml4ZXM6IDI2ZTdhYWNiODNkZiAoInJpc2N2OiBBbGxvdyB0
byBkb3duZ3JhZGUgcGFnaW5nIG1vZGUgZnJvbSB0aGUgY29tbWFuZCBsaW5lIikKQ2M6IEFsZXhh
bmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KQ2M6IEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQHJpdm9zaW5jLmNvbT4KVGVzdGVkLWJ5OiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51eC5h
bGliYWJhLmNvbT4KVGVzdGVkLWJ5OiBDaGVuIFBlaSA8Y3AwNjEzQGxpbnV4LmFsaWJhYmEuY29t
PgpTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIChBbGliYWJhIERBTU8gQWNhZGVteSkgPGd1b3JlbkBr
ZXJuZWwub3JnPgotLS0KQ2hhbmdlbG9nOgp2MzoKIC0gQWRkIHR3byBUZXN0ZWQtYnkgdGFncy4K
IC0gUmViYXNlIG9uIExpbnV4IDcuMS1yYzEuCgp2MjoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtcmlzY3YvMjAyNjAxMjUwNTUyMTIuNDMzMTYzLTEtZ3VvcmVuQGtlcm5lbC5vcmcvCiAt
IFVzZSBpc192YWRkcl92YWxpZCgpIGluc3RlYWQgb2Ygc2ltcGxlIHJldHVybi4KIC0gRG9uJ3Qg
Y2hhbmdlIHRoZSBvcmlnaW5hbCBubzVsdmwgY29kZSBsb2dpYy4KCnYxOgpodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI2MDExODE0NTQ0MS4yOTEzMDItMS1ndW9yZW5Aa2Vy
bmVsLm9yZy8KLS0tCiBhcmNoL3Jpc2N2L21tL2luaXQuYyB8IDI1ICsrKysrKysrKysrKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwppbmRleCBkZWNkN2Rm
NDBmYTQuLmZhOGQyZjZmNTU0YiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9tbS9pbml0LmMKKysr
IGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKQEAgLTc5Miw2ICs3OTIsMjcgQEAgc3RhdGljIHZvaWQg
X19pbml0IHNldF9tbWFwX3JuZF9iaXRzX21heCh2b2lkKQogCW1tYXBfcm5kX2JpdHNfbWF4ID0g
TU1BUF9WQV9CSVRTIC0gUEFHRV9TSElGVCAtIDM7CiB9CiAKK3N0YXRpYyBib29sIF9faW5pdCBp
c192YWRkcl92YWxpZCh1bnNpZ25lZCBsb25nIHZhKQoreworCXVuc2lnbmVkIGxvbmcgdXAgPSAw
OworCisJc3dpdGNoIChzYXRwX21vZGUpIHsKKwljYXNlIFNBVFBfTU9ERV8zOToKKwkJdXAgPSAx
VUwgPDwgMzg7CisJCWJyZWFrOworCWNhc2UgU0FUUF9NT0RFXzQ4OgorCQl1cCA9IDFVTCA8PCA0
NzsKKwkJYnJlYWs7CisJY2FzZSBTQVRQX01PREVfNTc6CisJCXVwID0gMVVMIDw8IDU2OworCQli
cmVhazsKKwlkZWZhdWx0OgorCQlyZXR1cm4gZmFsc2U7CisJfQorCisJcmV0dXJuICh2YSA8IHVw
KSB8fCAodmEgPj0gKFVMT05HX01BWCAtIHVwICsgMSkpOworfQorCiAvKgogICogVGhlcmUgaXMg
YSBzaW1wbGUgd2F5IHRvIGRldGVybWluZSBpZiA0LWxldmVsIGlzIHN1cHBvcnRlZCBieSB0aGUK
ICAqIHVuZGVybHlpbmcgaGFyZHdhcmU6IGVzdGFibGlzaCAxOjEgbWFwcGluZyBpbiA0LWxldmVs
IHBhZ2UgdGFibGUgbW9kZQpAQCAtODMzLDYgKzg1NCw5IEBAIHN0YXRpYyBfX2luaXQgdm9pZCBz
ZXRfc2F0cF9tb2RlKHVpbnRwdHJfdCBkdGJfcGEpCiAJCQkgICBzZXRfc2F0cF9tb2RlX3BtZCAr
IFBNRF9TSVpFLAogCQkJICAgUE1EX1NJWkUsIFBBR0VfS0VSTkVMX0VYRUMpOwogcmV0cnk6CisJ
aWYgKCFpc192YWRkcl92YWxpZChzZXRfc2F0cF9tb2RlX3BtZCkpCisJCWdvdG8gb3V0OworCiAJ
Y3JlYXRlX3BnZF9tYXBwaW5nKGVhcmx5X3BnX2RpciwKIAkJCSAgIHNldF9zYXRwX21vZGVfcG1k
LAogCQkJICAgcGd0YWJsZV9sNV9lbmFibGVkID8KQEAgLTg1NSw2ICs4NzksNyBAQCBzdGF0aWMg
X19pbml0IHZvaWQgc2V0X3NhdHBfbW9kZSh1aW50cHRyX3QgZHRiX3BhKQogCQlkaXNhYmxlX3Bn
dGFibGVfbDQoKTsKIAl9CiAKK291dDoKIAltZW1zZXQoZWFybHlfcGdfZGlyLCAwLCBQQUdFX1NJ
WkUpOwogCW1lbXNldChlYXJseV9wNGQsIDAsIFBBR0VfU0laRSk7CiAJbWVtc2V0KGVhcmx5X3B1
ZCwgMCwgUEFHRV9TSVpFKTsKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
