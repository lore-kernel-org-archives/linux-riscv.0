Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37488C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 14:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uBXP1y2JutHJjGtP833rqsvUeDZAF+8SLiXfBqoNCcQ=; b=LzD7BQ9bn8w/Pd
	kUZUKevOo4uOJFi3cvS7R2kXSt8mWTpjr/JZn98Sh1TeCXq+0QUzHP/dC5cQe8xqaWvqhkI1lcyTu
	x3HuOcJc21TrYGU5AgPNDw8bRH8Hr8oGsOxbHK62XYa6Q+xeFbL2ozQN32md7QmFUW754H3G+mWut
	7tPQ7J9ppdYHIULtgGcKfO0L3HQkpWAskYZ7yUWHHEhM5MzV1PyT0Kr7JZNwHkYwnVEq73RXf9TtO
	BP9jyTTDETtn78/lMVU0me90Pj9S/PTDR28NePGvw1nhoH7Y43QCiYTWZj0xvs3JkQ78lC4ov/PaV
	wkFkUts1B+OeXQEFWx/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6smP-0000000G7WO-0dN8;
	Tue, 14 May 2024 14:05:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6smM-0000000G7Uq-34WV
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 14:05:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3183261276;
	Tue, 14 May 2024 14:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B219C32781;
	Tue, 14 May 2024 14:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715695518;
	bh=pGRP84KXNHRvDwj4d3tBEvZ5yXWiOvKEJ5ie6tEwIpw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tutFg42F+WZxo8OqjmYracQbf76JUHyChIpewLcaBxxXzAHL9f9NzUzxKpCwPQPMp
	 JAOf7a5DMjRYICN6Zd3nayVU2QucQqYBCAI8sN3NmvDZjznrg3QP+0FsKPkhBf5X1d
	 DjQUz7i2J5ltDjh2koA8AsRmQ0kDN4rVWu0JQFdPf4Vmy6PaVJo12jabRGD99LsIn6
	 QsnhffWfY2J+BIqE97O1tmA6XlKvqzaJOazwfm63YK7bQUZNkTJ0dnTNMdXBkL3W1n
	 IXNollIatVKhq1PFO/MKuIo9s9ffetE+5TaxWGUT6CgxwvGg7EYhSFKTurXIn/mT0T
	 2VnjGlsE++ceA==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/8] riscv: mm: Refactor create_linear_mapping_range() for memory hot add
Date: Tue, 14 May 2024 16:04:41 +0200
Message-Id: <20240514140446.538622-4-bjorn@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240514140446.538622-1-bjorn@kernel.org>
References: <20240514140446.538622-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_070518_953315_D8298ECD 
X-CRM114-Status: UNSURE (   9.10  )
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, virtualization@lists.linux-foundation.org, Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKQWRkIGEgcGFyYW1ldGVy
IHRvIHRoZSBkaXJlY3QgbWFwIHNldHVwIGZ1bmN0aW9uLCBzbyBpdCBjYW4gYmUgdXNlZCBpbgph
cmNoX2FkZF9tZW1vcnkoKSBsYXRlci4KClNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L21tL2luaXQuYyB8IDE1ICsrKysrKy0t
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5j
CmluZGV4IGM5Njk0MjdlYWI4OC4uNmY3MmIwYjJiODU0IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L21tL2luaXQuYworKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwpAQCAtMTIyNyw3ICsxMjI3LDcg
QEAgYXNtbGlua2FnZSB2b2lkIF9faW5pdCBzZXR1cF92bSh1aW50cHRyX3QgZHRiX3BhKQogfQog
CiBzdGF0aWMgdm9pZCBfX21lbWluaXQgY3JlYXRlX2xpbmVhcl9tYXBwaW5nX3JhbmdlKHBoeXNf
YWRkcl90IHN0YXJ0LCBwaHlzX2FkZHJfdCBlbmQsCi0JCQkJCQkgIHVpbnRwdHJfdCBmaXhlZF9t
YXBfc2l6ZSkKKwkJCQkJCSAgdWludHB0cl90IGZpeGVkX21hcF9zaXplLCBjb25zdCBwZ3Byb3Rf
dCAqcGdwcm90KQogewogCXBoeXNfYWRkcl90IHBhOwogCXVpbnRwdHJfdCB2YSwgbWFwX3NpemU7
CkBAIC0xMjM4LDcgKzEyMzgsNyBAQCBzdGF0aWMgdm9pZCBfX21lbWluaXQgY3JlYXRlX2xpbmVh
cl9tYXBwaW5nX3JhbmdlKHBoeXNfYWRkcl90IHN0YXJ0LCBwaHlzX2FkZHJfdAogCQkJCQkgICAg
YmVzdF9tYXBfc2l6ZShwYSwgdmEsIGVuZCAtIHBhKTsKIAogCQljcmVhdGVfcGdkX21hcHBpbmco
c3dhcHBlcl9wZ19kaXIsIHZhLCBwYSwgbWFwX3NpemUsCi0JCQkJICAgcGdwcm90X2Zyb21fdmEo
dmEpKTsKKwkJCQkgICBwZ3Byb3QgPyAqcGdwcm90IDogcGdwcm90X2Zyb21fdmEodmEpKTsKIAl9
CiB9CiAKQEAgLTEyODIsMjIgKzEyODIsMTkgQEAgc3RhdGljIHZvaWQgX19pbml0IGNyZWF0ZV9s
aW5lYXJfbWFwcGluZ19wYWdlX3RhYmxlKHZvaWQpCiAJCWlmIChlbmQgPj0gX19wYShQQUdFX09G
RlNFVCkgKyBtZW1vcnlfbGltaXQpCiAJCQllbmQgPSBfX3BhKFBBR0VfT0ZGU0VUKSArIG1lbW9y
eV9saW1pdDsKIAotCQljcmVhdGVfbGluZWFyX21hcHBpbmdfcmFuZ2Uoc3RhcnQsIGVuZCwgMCk7
CisJCWNyZWF0ZV9saW5lYXJfbWFwcGluZ19yYW5nZShzdGFydCwgZW5kLCAwLCBOVUxMKTsKIAl9
CiAKICNpZmRlZiBDT05GSUdfU1RSSUNUX0tFUk5FTF9SV1gKLQljcmVhdGVfbGluZWFyX21hcHBp
bmdfcmFuZ2Uoa3RleHRfc3RhcnQsIGt0ZXh0X3N0YXJ0ICsga3RleHRfc2l6ZSwgMCk7Ci0JY3Jl
YXRlX2xpbmVhcl9tYXBwaW5nX3JhbmdlKGtyb2RhdGFfc3RhcnQsCi0JCQkJICAgIGtyb2RhdGFf
c3RhcnQgKyBrcm9kYXRhX3NpemUsIDApOworCWNyZWF0ZV9saW5lYXJfbWFwcGluZ19yYW5nZShr
dGV4dF9zdGFydCwga3RleHRfc3RhcnQgKyBrdGV4dF9zaXplLCAwLCBOVUxMKTsKKwljcmVhdGVf
bGluZWFyX21hcHBpbmdfcmFuZ2Uoa3JvZGF0YV9zdGFydCwga3JvZGF0YV9zdGFydCArIGtyb2Rh
dGFfc2l6ZSwgMCwgTlVMTCk7CiAKIAltZW1ibG9ja19jbGVhcl9ub21hcChrdGV4dF9zdGFydCwg
IGt0ZXh0X3NpemUpOwogCW1lbWJsb2NrX2NsZWFyX25vbWFwKGtyb2RhdGFfc3RhcnQsIGtyb2Rh
dGFfc2l6ZSk7CiAjZW5kaWYKIAogI2lmZGVmIENPTkZJR19LRkVOQ0UKLQljcmVhdGVfbGluZWFy
X21hcHBpbmdfcmFuZ2Uoa2ZlbmNlX3Bvb2wsCi0JCQkJICAgIGtmZW5jZV9wb29sICsgS0ZFTkNF
X1BPT0xfU0laRSwKLQkJCQkgICAgUEFHRV9TSVpFKTsKKwljcmVhdGVfbGluZWFyX21hcHBpbmdf
cmFuZ2Uoa2ZlbmNlX3Bvb2wsIGtmZW5jZV9wb29sICsgS0ZFTkNFX1BPT0xfU0laRSwgUEFHRV9T
SVpFLCBOVUxMKTsKIAogCW1lbWJsb2NrX2NsZWFyX25vbWFwKGtmZW5jZV9wb29sLCBLRkVOQ0Vf
UE9PTF9TSVpFKTsKICNlbmRpZgotLSAKMi40MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
