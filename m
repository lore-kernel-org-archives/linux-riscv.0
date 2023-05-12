Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75443C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 14:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=waFDC0FctqamwwemQfiHMj4mwT4LRaQl2De1HM7vwfI=; b=AjwCPNxa6W6j2t
	uc1A1G5Q1WXfGbgBIWJX2DZZXoKqoIWzKbI2/44QHfe6LW6jvqUvrk7fwjonxP3qJ67q18nPt4fR8
	x6MvRKCwBQXlyeJYLyvmGj2HFLTgk7icUTGzKW/YPANbl99/2JPY90KiZhhJUaxcCVe5PPoxi+lLW
	CSv/WHQmZfO3br9WBwUKpml0+X+9cvSNQ6vV6yAQSsQBXqGa3jlNbeMjqEIdv/c418LmMBZQKjiWn
	nFD37rHBZBIdz4eudeO7eFSAaH1dfET8CAFvPzuRVYIy/6N0ngH/sq56C4RbqgnfZx+cUKSyBy1mf
	HsqsbUSKXBaL2Ez07Iig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxUDu-00CG6R-0c;
	Fri, 12 May 2023 14:58:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxUDr-00CG4R-2O
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 14:58:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4735E655F5;
	Fri, 12 May 2023 14:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9BF1C4339C;
	Fri, 12 May 2023 14:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683903498;
	bh=lRwO3YfIMF9fmZSTE+/WO7BqWpiO2x+8QNF4La5hiEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lFJE9ofAvx/W7GMthxymGs+b9O5oFO1BwdKIGcHaAN62YeWePDQ0N/sK71knTdSoF
	 FVBIIqU4AmmF6IG79I2XtGg0JavzeJwFrHvwtyzSV76oVsE2HRceOMMnAX1c65IAP/
	 wzRAeUAfR4ibQ4s6pSnjOcUPEJrI0Uwkbd762zC/EYqhScoqAKaEuy84NEiMva3S8O
	 cUjmxdLyvrJYLCFOB3H2n8gsVJcGT3aBKjaVsXZO/B0iymi2R+/sIoE+4yZ4U/slfd
	 k0/FpzS+nNiLNCLb4BGq3Qd2jSem/r0rZlEnE2QEYIKn4OVGCS3P4sJXIb6FK2umT0
	 TTdE0MNOfw90w==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	virtualization@lists.linux-foundation.org,
	linux@rivosinc.com,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 7/7] riscv: mm: Pre-allocate vmalloc PGD leaves
Date: Fri, 12 May 2023 16:57:37 +0200
Message-Id: <20230512145737.985671-8-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512145737.985671-1-bjorn@kernel.org>
References: <20230512145737.985671-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_075819_825597_8784DD5B 
X-CRM114-Status: GOOD (  14.09  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKSW5zdGVhZCBvZiByZWx5
aW5nIG9uIHZtYWxsb2NfZmF1bHQoKSB0byBzeW5jaHJvbml6ZSB0aGUgcGFnZS10YWJsZXMsCnBy
ZS1hbGxvY2F0ZSB0aGUgUEdEIGxlYXZlcyBvZiB0aGUgdm1hbGxvYyBhcmVhLiBUaGlzIGlzIG9u
bHkgZW5hYmxlZAppZiBtZW1vcnkgaG90L2FkZCBpcyBlbmFibGVkIGJ5IHRoZSBidWlsZC4KClNp
Z25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNo
L3Jpc2N2L21tL2ZhdWx0LmMgfCA3ICsrKysrKy0KIGFyY2gvcmlzY3YvbW0vaW5pdC5jICB8IDEg
KwogMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMgYi9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKaW5k
ZXggODY4NWY4NWE3NDc0Li5iNjFlMjc5YWNkNTAgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbW0v
ZmF1bHQuYworKysgYi9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKQEAgLTIzMywxMiArMjMzLDE3IEBA
IHZvaWQgaGFuZGxlX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAJICogRmF1bHQt
aW4ga2VybmVsLXNwYWNlIHZpcnR1YWwgbWVtb3J5IG9uLWRlbWFuZC4KIAkgKiBUaGUgJ3JlZmVy
ZW5jZScgcGFnZSB0YWJsZSBpcyBpbml0X21tLnBnZC4KIAkgKgorCSAqIEZvciBtZW1vcnkgaG90
cGx1ZyBlbmFibGVkIHN5c3RlbXMsIHRoZSBQR0QgZW50cmllcyBhcmUKKwkgKiBwcmUtYWxsb2Nh
dGVkLCB3aGljaCBhdm9pZHMgdGhlIG5lZWQgdG8gc3luY2hyb25pemUKKwkgKiBwZ2QvZmF1bHQt
aW4uCisJICoKIAkgKiBOT1RFISBXZSBNVVNUIE5PVCB0YWtlIGFueSBsb2NrcyBmb3IgdGhpcyBj
YXNlLiBXZSBtYXkKIAkgKiBiZSBpbiBhbiBpbnRlcnJ1cHQgb3IgYSBjcml0aWNhbCByZWdpb24s
IGFuZCBzaG91bGQKIAkgKiBvbmx5IGNvcHkgdGhlIGluZm9ybWF0aW9uIGZyb20gdGhlIG1hc3Rl
ciBwYWdlIHRhYmxlLAogCSAqIG5vdGhpbmcgbW9yZS4KIAkgKi8KLQlpZiAodW5saWtlbHkoKGFk
ZHIgPj0gVk1BTExPQ19TVEFSVCkgJiYgKGFkZHIgPCBWTUFMTE9DX0VORCkpKSB7CisJaWYgKHVu
bGlrZWx5KCFJU19FTkFCTEVEKENPTkZJR19NRU1PUllfSE9UUExVRykgJiYKKwkJICAgICAoYWRk
ciA+PSBWTUFMTE9DX1NUQVJUKSAmJiAoYWRkciA8IFZNQUxMT0NfRU5EKSkpIHsKIAkJdm1hbGxv
Y19mYXVsdChyZWdzLCBjb2RlLCBhZGRyKTsKIAkJcmV0dXJuOwogCX0KZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKaW5kZXggYTQ2ODcwOGQx
ZTFjLi5mZDVhNmQzZmUxODIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCisrKyBi
L2FyY2gvcmlzY3YvbW0vaW5pdC5jCkBAIC0yMzYsNiArMjM2LDcgQEAgc3RhdGljIHZvaWQgX19p
bml0IHByZWFsbG9jYXRlX3BnZF9wYWdlc19yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNp
Z25lZCBsb24KIHN0YXRpYyB2b2lkIF9faW5pdCBwcmVwYXJlX21lbW9yeV9ob3RwbHVnKHZvaWQp
CiB7CiAjaWZkZWYgQ09ORklHX01FTU9SWV9IT1RQTFVHCisJcHJlYWxsb2NhdGVfcGdkX3BhZ2Vz
X3JhbmdlKFZNQUxMT0NfU1RBUlQsIFZNQUxMT0NfRU5ELCAidm1hbGxvYyIpOwogCXByZWFsbG9j
YXRlX3BnZF9wYWdlc19yYW5nZShWTUVNTUFQX1NUQVJULCBWTUVNTUFQX0VORCwgInZtZW1tYXAi
KTsKIAlwcmVhbGxvY2F0ZV9wZ2RfcGFnZXNfcmFuZ2UoUEFHRV9PRkZTRVQsIFBBR0VfRU5ELCAi
ZGlyZWN0IG1hcCIpOwogI2VuZGlmCi0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
