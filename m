Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D3DC7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 14:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/sF15N3dWe0a+xh7Td3fqd7VLDDVu4X9yqnLhoYSpo=; b=DyC1shvDtq/bsa
	gJfsefrzjvsUHKnjYrE9A+aKbW4rx+RSxa76WgMbL6wusXkXmv34i2kD8rF4hSgC/o5Mynsi3YWGA
	XRBIhXb22RCF0i4GzUJkcOYuhS37TZWKohTsZZvc0pc9DKkPBTeNN6ysKoRN4xJzN2TGeXBUmmC/V
	JBMKH30xPtSxI75WHk1QHNPuR9ux+cGtQaQbIV+YMiuaP/93ZUgDcw3vzLhyzoQggAKX+Ys+Gp2fz
	7LPCv8+mdlz4purJtf1vOMi/p7XAITOJeutav6i7BPMTTxhhf6qqH5KTMTGLPPvP1iIRQC0azrrKN
	HXBM1j8qJGoMMzV/xA8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxUDi-00CFyM-1q;
	Fri, 12 May 2023 14:58:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxUDe-00CFvm-2Z
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 14:58:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6610C654DC;
	Fri, 12 May 2023 14:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F83CC433D2;
	Fri, 12 May 2023 14:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683903485;
	bh=aaVyrjFt4Z24qTU7IkdzOXPq++vuBvyBWDRYOQbS9VA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YPQSWSrA4888qRlom2V9n0E4yFAcDlwO6kLEPA1Z3/jN+kNGhPXLeY8aFL0ESQTul
	 RMyaIs6qUO82q50vSJrCQWrwL5FL7Zd2It0w/k09t7jeuI9/8zofE8JzaXyKCEZlUs
	 6vZOfEid0lLW22Wa0vb8u5t7SQjIJphqI/J9HwOCpQIywm81oMLE6fnM89OUtnUkFn
	 j8XQGA0U7Xt+BTOHhoHC7wsFBB8N8mbrfH+4xlCjWl8xkta+DzSiBxsCwtLgzfktYM
	 MaJ2hhSLpdhYY4k+7RXHrTEDITwtEA6t4tJs5cfx65BsquOpd3IWQp5793KvR6uCq6
	 t5vc9nXQmqCFQ==
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
Subject: [PATCH 3/7] riscv: mm: Refactor create_linear_mapping_range() for hot add
Date: Fri, 12 May 2023 16:57:33 +0200
Message-Id: <20230512145737.985671-4-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512145737.985671-1-bjorn@kernel.org>
References: <20230512145737.985671-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_075806_869495_36B4F5BD 
X-CRM114-Status: GOOD (  11.05  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKQWRkIGEgcGFyYW1ldGVy
IHRvIHRoZSBkaXJlY3QgbWFwIHNldHVwIGZ1bmN0aW9uLCBzbyBpdCBjYW4gYmUgdXNlZCBpbgph
cmNoX2FkZF9tZW1vcnkoKSBsYXRlci4KClNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L21tL2luaXQuYyB8IDE4ICsrKysrKysr
Ky0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5p
dC5jCmluZGV4IGU5NzRmZjZlZjAzNi4uYWVhOGNjYjNmNGFlIDEwMDY0NAotLS0gYS9hcmNoL3Jp
c2N2L21tL2luaXQuYworKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwpAQCAtMTI0NywxOCArMTI0
NywxOSBAQCBhc21saW5rYWdlIHZvaWQgX19pbml0IHNldHVwX3ZtKHVpbnRwdHJfdCBkdGJfcGEp
CiAJcHRfb3BzX3NldF9maXhtYXAoKTsKIH0KIAotc3RhdGljIHZvaWQgX19pbml0IGNyZWF0ZV9s
aW5lYXJfbWFwcGluZ19yYW5nZShwaHlzX2FkZHJfdCBzdGFydCwKLQkJCQkJICAgICAgIHBoeXNf
YWRkcl90IGVuZCkKK3N0YXRpYyB2b2lkIF9fbWVtaW5pdCBjcmVhdGVfbGluZWFyX21hcHBpbmdf
cmFuZ2UocGh5c19hZGRyX3Qgc3RhcnQsIHBoeXNfYWRkcl90IGVuZCwKKwkJCQkJCSAgc3RydWN0
IG1ocF9wYXJhbXMgKnBhcmFtcykKIHsKIAlwaHlzX2FkZHJfdCBwYTsKIAl1aW50cHRyX3QgdmEs
IG1hcF9zaXplOwogCiAJZm9yIChwYSA9IHN0YXJ0OyBwYSA8IGVuZDsgcGEgKz0gbWFwX3NpemUp
IHsKKwkJcGdwcm90X3QgcGdwcm90OworCiAJCXZhID0gKHVpbnRwdHJfdClfX3ZhKHBhKTsKKwkJ
cGdwcm90ID0gIHBhcmFtcyA/IHBhcmFtcy0+cGdwcm90IDogcGdwcm90X2Zyb21fdmEodmEpOwog
CQltYXBfc2l6ZSA9IGJlc3RfbWFwX3NpemUocGEsIGVuZCAtIHBhKTsKLQotCQljcmVhdGVfcGdk
X21hcHBpbmcoc3dhcHBlcl9wZ19kaXIsIHZhLCBwYSwgbWFwX3NpemUsCi0JCQkJICAgcGdwcm90
X2Zyb21fdmEodmEpKTsKKwkJY3JlYXRlX3BnZF9tYXBwaW5nKHN3YXBwZXJfcGdfZGlyLCB2YSwg
cGEsIG1hcF9zaXplLCBwZ3Byb3QpOwogCX0KIH0KIApAQCAtMTI4OCwxMyArMTI4OSwxMiBAQCBz
dGF0aWMgdm9pZCBfX2luaXQgY3JlYXRlX2xpbmVhcl9tYXBwaW5nX3BhZ2VfdGFibGUodm9pZCkK
IAkJaWYgKGVuZCA+PSBfX3BhKFBBR0VfT0ZGU0VUKSArIG1lbW9yeV9saW1pdCkKIAkJCWVuZCA9
IF9fcGEoUEFHRV9PRkZTRVQpICsgbWVtb3J5X2xpbWl0OwogCi0JCWNyZWF0ZV9saW5lYXJfbWFw
cGluZ19yYW5nZShzdGFydCwgZW5kKTsKKwkJY3JlYXRlX2xpbmVhcl9tYXBwaW5nX3JhbmdlKHN0
YXJ0LCBlbmQsIE5VTEwpOwogCX0KIAogI2lmZGVmIENPTkZJR19TVFJJQ1RfS0VSTkVMX1JXWAot
CWNyZWF0ZV9saW5lYXJfbWFwcGluZ19yYW5nZShrdGV4dF9zdGFydCwga3RleHRfc3RhcnQgKyBr
dGV4dF9zaXplKTsKLQljcmVhdGVfbGluZWFyX21hcHBpbmdfcmFuZ2Uoa3JvZGF0YV9zdGFydCwK
LQkJCQkgICAga3JvZGF0YV9zdGFydCArIGtyb2RhdGFfc2l6ZSk7CisJY3JlYXRlX2xpbmVhcl9t
YXBwaW5nX3JhbmdlKGt0ZXh0X3N0YXJ0LCBrdGV4dF9zdGFydCArIGt0ZXh0X3NpemUsIE5VTEwp
OworCWNyZWF0ZV9saW5lYXJfbWFwcGluZ19yYW5nZShrcm9kYXRhX3N0YXJ0LCBrcm9kYXRhX3N0
YXJ0ICsga3JvZGF0YV9zaXplLCBOVUxMKTsKIAogCW1lbWJsb2NrX2NsZWFyX25vbWFwKGt0ZXh0
X3N0YXJ0LCAga3RleHRfc2l6ZSk7CiAJbWVtYmxvY2tfY2xlYXJfbm9tYXAoa3JvZGF0YV9zdGFy
dCwga3JvZGF0YV9zaXplKTsKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
