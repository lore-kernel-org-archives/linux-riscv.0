Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD3DC25B75
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 12:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HQLA6+FnVwgRg9y4WFcVM22krxkQV36drRBx/OdYSRY=; b=4uUOMpVgnXLgO7
	8pxQhfp1KKHwaw4HzdNpW3l2qPfsAnys1i4kKBQ4gqdqvuFXfQlxQya/xo28LfNP8wGuY38WpHykW
	tdGk4V+RDdT2rBUYEmhqq4//82hzil4SxoRNsaCqVdeCCVYbvq3D9ccoilv0oUkOyO+6mVoBTQgCc
	g16FjIcD7oUZp2gVH9bIJ6smoJWyVapdEDZsoAerTK2amTR7+QBlqsb+TODV12vdKnA/bdUfbEyyz
	XutvYVdhbLYw9ouIDmTNAkSWvvYWEHrBBJ3wg28PGIM/QpVxEfK4xzcD3bA4qQdT8pPk8AdKdprwi
	0uJYgsPC3Fs8/iJwYDsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4K1X-0000000Awme-1TtI;
	Tue, 07 May 2024 12:34:23 +0000
Received: from mail.avm.de ([2001:bf0:244:244::94])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4K1S-0000000Awjr-1Cg6
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 12:34:21 +0000
Received: from mail-auth.avm.de (unknown [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue,  7 May 2024 14:34:10 +0200 (CEST)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 019A880666;
	Tue,  7 May 2024 14:34:10 +0200 (CEST)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id E2121181132; Tue,  7 May 2024 14:34:09 +0200 (CEST)
Date: Tue, 7 May 2024 14:34:09 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH v2 1/2] riscv: make image compression configurable
Message-ID: <ZjofwZDHYg8yYKeK@buildd.core.avm.de>
References: <20240504193446.196886-1-emil.renner.berthing@canonical.com>
 <20240504193446.196886-2-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240504193446.196886-2-emil.renner.berthing@canonical.com>
X-purgate-ID: 149429::1715085250-25CCED52-3CFB73E6/0/0
X-purgate-type: clean
X-purgate-size: 897
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_053418_506345_1B5E7D22 
X-CRM114-Status: GOOD (  10.42  )
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

T24gU2F0LCBNYXkgMDQsIDIwMjQgYXQgMDk6MzQ6MzhQTSArMDIwMCwgRW1pbCBSZW5uZXIgQmVy
dGhpbmcgd3JvdGU6Cj4gUHJldmlvdXNseSB0aGUgYnVpbGQgcHJvY2VzcyB3b3VsZCBhbHdheXMg
c2V0IEtCVUlMRF9JTUFHRSB0byB0aGUKPiB1bmNvbXByZXNzZWQgSW1hZ2UgZmlsZSAodW5sZXNz
IFhJUF9LRVJORUwgb3IgRUZJX1pCT09UIHdhcyBlbmFibGVkKSBhbmQKPiB1bmNvbmRpdGlvbmFs
bHkgY29tcHJlc3MgaXQgaW50byBJbWFnZS5nei4gSG93ZXZlciB0aGVyZSBhcmUgYWxyZWFkeQo+
IGJ1aWxkIHRhcmdldHMgZm9yIEltYWdlLmJ6MiwgSW1hZ2UubHo0LCBJbWFnZS5sem1hLCBJbWFn
ZS5sem8gYW5kCj4gSW1hZ2UuenN0ZCwgc28gbGV0J3MgbWFrZSB1c2Ugb2YgdGhvc2UsIG1ha2Ug
dGhlIGNvbXByZXNzaW9uIG1ldGhvZAo+IGNvbmZpZ3VyYWJsZSBhbmQgc2V0IEtCVUlMRF9JTUFH
RSBhY2NvcmRpbmdseSBzbyB0aGF0IHRhcmdldHMgbGlrZQo+ICdtYWtlIGluc3RhbGwnIGFuZCAn
bWFrZSBiaW5kZWItcGtnJyB3aWxsIHVzZSB0aGUgY2hvc2VuIGltYWdlLgo+IAo+IFRlc3RlZC1i
eTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEVt
aWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPgo+
IC0tLQo+IENoYW5nZXMgaW4gdjI6Cj4gLSBSZWJhc2Ugb24gcmlzY3YvZm9yLW5leHQKPiAtIFVz
ZSBib290LWltYWdlLSQoQ09ORklHXy4uKSA6PSBhc3NpZ25tZW50cyByYXRoZXIgdGhhbiBpZmVx
IHRyYWluCj4gLS0tCgpMb29rcyBnb29kIHRvIG1lLgoKUmV2aWV3ZWQtYnk6IE5pY29sYXMgU2No
aWVyIDxuLnNjaGllckBhdm0uZGU+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
