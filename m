Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BBF606F897
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 14:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rng3bewy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pp7wnl8xoCi7+kw+yg1wL6C0VtARu5by2P1sdz1rJjM=; b=Rng3bewygX6IiHP17UEHp5IuCl
	I9zguIoWWLdtHMjSKv1j4XAc6jQ6Rg5W/PEtY5z4XuCrAnRptsN0cC9fquXZWgyrsiwNWxpiUr98C
	MSswqo0rnEEIroAjgUyD8VoCblfTQZXunIsL8pbkSfLIe8+Ijo7JqwjATjqZEzOF3rsHE6CT8AHkg
	XUxZM0y125ERImNpLW5cStg91RMJ3T4sMfZECo2SWojuGbbjQ0N39lyRviIXbc4oWFmZ4ZbvkmMGO
	AlwT/Fl5NRwEtx7Jbe8gHE6NzurZ6rRtWYlRR/Wue+htvyDyETbFwm1F9zC/KVm7S7N+8kM2DQ6+G
	BHRj1fWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVkC-0000000AF88-21ib;
	Thu, 12 Nov 2026 14:25:40 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVkA-0000000AF5z-0qUn
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 14:25:39 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9A05621E41;
	Thu, 12 Nov 2026 14:25:36 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1BC3113432;
	Thu, 12 Nov 2026 14:25:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id w9GzDFnM9WoAPwAAD6G6ig:T5
	(envelope-from <clopez@suse.de>); Thu, 12 Nov 2026 14:25:35 +0000
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>
To: kvm@vger.kernel.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	seanjc@google.com,
	pbonzini@redhat.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	peterx@redhat.com,
	ljs@kernel.org,
	imbrenda@linux.ibm.com,
	borntraeger@linux.ibm.com,
	frankja@linux.ibm.com,
	=?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kiryl Shutsemau <kas@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>
Subject: [PATCH v3 4/9] mm: keep writable entries writable on protection changes
Date: Thu, 12 Nov 2026 15:20:33 +0100
Message-ID: <20261112142039.907090-6-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261112142039.907090-2-clopez@suse.de>
References: <20261112142039.907090-2-clopez@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Queue-Id: 9A05621E41
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_062538_558916_FF628D2C 
X-CRM114-Status: GOOD (  16.55  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Y2hhbmdlX3Byb3RlY3Rpb24oKSBhcHBsaWVzIHZtYS0+dm1fcGFnZV9wcm90LCB3aGljaCBsYWNr
cyB0aGUgd3JpdGUgYml0CmZvciBDb1cgYW5kIHdyaXRlLW5vdGlmaWVkIG1hcHBpbmdzLiBNTV9D
UF9UUllfQ0hBTkdFX1dSSVRBQkxFIG1ha2VzCmVudHJpZXMgd3JpdGFibGUgYWdhaW4gaWYgYSB3
cml0ZSBmYXVsdCB3b3VsZCBvbmx5IHNldCB0aGUgd3JpdGUgYml0LgpJbiBzaGFyZWQgbWFwcGlu
Z3MsIGl0IHJlbGllcyBvbiB0aGUgZGlydHkgYml0IGZvciB0aGlzLCBhcyBhIGNsZWFuCmVudHJ5
IG1pZ2h0IHN0aWxsIG5lZWQgYSB3cml0ZSBmYXVsdCB0byBub3RpZnkgdGhlIEZTLgoKSG93ZXZl
ciwgdGhpcyBtaXNzZXMgY2xlYW4gZW50cmllcyB0aGF0IHdlcmUgYWxyZWFkeSB3cml0YWJsZS4g
Rm9yCmV4YW1wbGUsIGEgdWZmZC13cCB1bnByb3RlY3QgbWFrZXMgc2htZW0gUFRFcyByZWFkLW9u
bHkgaWYgdGhleSB3ZXJlCm1hcHBlZCBieSBhIHJlYWQgZmF1bHQgYmVmb3JlIHVmZmQtd3Agd2Fz
IHJlZ2lzdGVyZWQsIHNvIHRoZSBuZXh0IHdyaXRlCnRvIGVhY2ggb2YgdGhlbSBmYXVsdHMuCgpF
bnRyaWVzIHRoYXQgd2VyZSB3cml0YWJsZSBiZWZvcmUgdGhlIGNoYW5nZSBjYW4gc3RheSB3cml0
YWJsZSwgYXMKYW55dGhpbmcgdGhhdCByZWxpZXMgb24gd3JpdGUgZmF1bHRzIHdyaXRlLXByb3Rl
Y3RzIHRoZSBlbnRyeSBmaXJzdCwgYW5kCk1NX0NQX1RSWV9DSEFOR0VfV1JJVEFCTEUgaXMgb25s
eSBzZXQgaWYgdGhlIFZNQSBzdGF5cyB3cml0YWJsZS4gU28KY2hlY2sgdGhlIG9sZCBlbnRyeSBi
ZWZvcmUgdGhlIHNoYXJlZCBhbmQgcHJpdmF0ZSBydWxlcy4KCk5vdGU6IHdyaXRhYmxlIGFub255
bW91cyBlbnRyaWVzIGFyZSBhbHdheXMgZXhjbHVzaXZlIGFuZCB0aHVzIGFscmVhZHkKa2VwdCB3
cml0YWJsZSwgc28gaW4gcHJpdmF0ZSBtYXBwaW5ncyB0aGlzIG9ubHkgYWZmZWN0cyBQRk5zIHRo
YXQKZHJpdmVycyBtYXAgd3JpdGFibGUgaW50byB0aGVtLgoKU2lnbmVkLW9mZi1ieTogQ2FybG9z
IEzDs3BleiA8Y2xvcGV6QHN1c2UuZGU+Ci0tLQogbW0vaHVnZV9tZW1vcnkuYyB8IDIyICsrKysr
KysrKysrKysrKystLS0tLS0KIG1tL21wcm90ZWN0LmMgICAgfCAxMSArKysrKysrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL21tL2h1Z2VfbWVtb3J5LmMgYi9tbS9odWdlX21lbW9yeS5jCmluZGV4IDA4MGI3MThlYjdk
ZS4uNjlmNDQ4NWMyNzdlIDEwMDY0NAotLS0gYS9tbS9odWdlX21lbW9yeS5jCisrKyBiL21tL2h1
Z2VfbWVtb3J5LmMKQEAgLTIyNjksNyArMjI2OSw4IEBAIHZtX2ZhdWx0X3QgZG9faHVnZV9wbWRf
d3BfcGFnZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKIH0KIAogc3RhdGljIGlubGluZSBib29sIGNh
bl9jaGFuZ2VfcG1kX3dyaXRhYmxlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAotCQkJCQkg
ICB1bnNpZ25lZCBsb25nIGFkZHIsIHBtZF90IHBtZCkKKwkJCQkJICAgdW5zaWduZWQgbG9uZyBh
ZGRyLCBwbWRfdCBvbGRwbWQsCisJCQkJCSAgIHBtZF90IHBtZCkKIHsKIAlzdHJ1Y3QgcGFnZSAq
cGFnZTsKIApAQCAtMjI4OCw2ICsyMjg5LDEwIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBjYW5fY2hh
bmdlX3BtZF93cml0YWJsZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAlpZiAodXNlcmZh
dWx0ZmRfaHVnZV9wbWRfd3Aodm1hLCBwbWQpKQogCQlyZXR1cm4gZmFsc2U7CiAKKwkvKiBXcml0
ZXMgZGlkIG5vdCBuZWVkIGEgZmF1bHQgYmVmb3JlIHRoZSBjaGFuZ2UgZWl0aGVyLiAqLworCWlm
IChwbWRfd3JpdGUob2xkcG1kKSkKKwkJcmV0dXJuIHRydWU7CisKIAlpZiAoISh2bWEtPnZtX2Zs
YWdzICYgVk1fU0hBUkVEKSkgewogCQkvKiBTZWUgY2FuX2NoYW5nZV9wdGVfd3JpdGFibGUoKS4g
Ki8KIAkJcGFnZSA9IHZtX25vcm1hbF9wYWdlX3BtZCh2bWEsIGFkZHIsIHBtZCk7CkBAIC0yMzE3
LDcgKzIzMjIsNyBAQCB2bV9mYXVsdF90IGRvX2h1Z2VfcG1kX3VmZmRfcndwKHN0cnVjdCB2bV9m
YXVsdCAqdm1mKQogCXBtZCA9IHBtZF9ta3lvdW5nKHBtZCk7CiAJaWYgKCFwbWRfd3JpdGUocG1k
KSAmJgogCSAgICB2bWFfd2FudHNfbWFudWFsX3B0ZV93cml0ZV91cGdyYWRlKHZtYSkgJiYKLQkg
ICAgY2FuX2NoYW5nZV9wbWRfd3JpdGFibGUodm1hLCB2bWYtPmFkZHJlc3MsIHBtZCkpCisJICAg
IGNhbl9jaGFuZ2VfcG1kX3dyaXRhYmxlKHZtYSwgdm1mLT5hZGRyZXNzLCB2bWYtPm9yaWdfcG1k
LCBwbWQpKQogCQlwbWQgPSBwbWRfbWt3cml0ZShwbWQsIHZtYSk7CiAJc2V0X3BtZF9hdCh2bWEt
PnZtX21tLCB2bWYtPmFkZHJlc3MgJiBIUEFHRV9QTURfTUFTSywKIAkJICAgdm1mLT5wbWQsIHBt
ZCk7CkBAIC0yMzU0LDcgKzIzNTksNyBAQCB2bV9mYXVsdF90IGRvX2h1Z2VfcG1kX251bWFfcGFn
ZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKIAkgKi8KIAl3cml0YWJsZSA9IHBtZF93cml0ZShwbWQp
OwogCWlmICghd3JpdGFibGUgJiYgdm1hX3dhbnRzX21hbnVhbF9wdGVfd3JpdGVfdXBncmFkZSh2
bWEpICYmCi0JICAgIGNhbl9jaGFuZ2VfcG1kX3dyaXRhYmxlKHZtYSwgdm1mLT5hZGRyZXNzLCBw
bWQpKQorCSAgICBjYW5fY2hhbmdlX3BtZF93cml0YWJsZSh2bWEsIHZtZi0+YWRkcmVzcywgb2xk
X3BtZCwgcG1kKSkKIAkJd3JpdGFibGUgPSB0cnVlOwogCiAJZm9saW8gPSB2bV9ub3JtYWxfZm9s
aW9fcG1kKHZtYSwgaGFkZHIsIHBtZCk7CkBAIC0yODIwLDcgKzI4MjUsNyBAQCBpbnQgY2hhbmdl
X2h1Z2VfcG1kKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hLAogCiAJLyogU2VlIGNoYW5nZV9wdGVfcmFuZ2UoKS4gKi8KIAlpZiAoKGNwX2ZsYWdzICYg
TU1fQ1BfVFJZX0NIQU5HRV9XUklUQUJMRSkgJiYgIXBtZF93cml0ZShlbnRyeSkgJiYKLQkgICAg
Y2FuX2NoYW5nZV9wbWRfd3JpdGFibGUodm1hLCBhZGRyLCBlbnRyeSkpCisJICAgIGNhbl9jaGFu
Z2VfcG1kX3dyaXRhYmxlKHZtYSwgYWRkciwgb2xkcG1kLCBlbnRyeSkpCiAJCWVudHJ5ID0gcG1k
X21rd3JpdGUoZW50cnksIHZtYSk7CiAKIAlyZXQgPSBIUEFHRV9QTURfTlI7CkBAIC0yODM1LDcg
KzI4NDAsOCBAQCBpbnQgY2hhbmdlX2h1Z2VfcG1kKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIsIHN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAogCiAjaWZkZWYgQ09ORklHX0hBVkVfQVJDSF9UUkFO
U1BBUkVOVF9IVUdFUEFHRV9QVUQKIHN0YXRpYyBpbmxpbmUgYm9vbCBjYW5fY2hhbmdlX3B1ZF93
cml0YWJsZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKLQkJCQkJICAgdW5zaWduZWQgbG9u
ZyBhZGRyLCBwdWRfdCBwdWQpCisJCQkJCSAgIHVuc2lnbmVkIGxvbmcgYWRkciwgcHVkX3Qgb2xk
cHVkLAorCQkJCQkgICBwdWRfdCBwdWQpCiB7CiAJc3RydWN0IHBhZ2UgKnBhZ2U7CiAKQEAgLTI4
NDYsNiArMjg1MiwxMCBAQCBzdGF0aWMgaW5saW5lIGJvb2wgY2FuX2NoYW5nZV9wdWRfd3JpdGFi
bGUoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJaWYgKHZtYV9zb2Z0X2RpcnR5X2VuYWJs
ZWQodm1hKSAmJiAhcHVkX3NvZnRfZGlydHkocHVkKSkKIAkJcmV0dXJuIGZhbHNlOwogCisJLyog
V3JpdGVzIGRpZCBub3QgbmVlZCBhIGZhdWx0IGJlZm9yZSB0aGUgY2hhbmdlIGVpdGhlci4gKi8K
KwlpZiAocHVkX3dyaXRlKG9sZHB1ZCkpCisJCXJldHVybiB0cnVlOworCiAJaWYgKCEodm1hLT52
bV9mbGFncyAmIFZNX1NIQVJFRCkpIHsKIAkJLyogU2VlIGNhbl9jaGFuZ2VfcHRlX3dyaXRhYmxl
KCkuICovCiAJCXBhZ2UgPSB2bV9ub3JtYWxfcGFnZV9wdWQodm1hLCBhZGRyLCBwdWQpOwpAQCAt
Mjg5Niw3ICsyOTA2LDcgQEAgaW50IGNoYW5nZV9odWdlX3B1ZChzdHJ1Y3QgbW11X2dhdGhlciAq
dGxiLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAllbnRyeSA9IHB1ZF9tb2RpZnkob2xk
cHVkLCBuZXdwcm90KTsKIAkvKiBTZWUgY2hhbmdlX3B0ZV9yYW5nZSgpLiAqLwogCWlmICgoY3Bf
ZmxhZ3MgJiBNTV9DUF9UUllfQ0hBTkdFX1dSSVRBQkxFKSAmJiAhcHVkX3dyaXRlKGVudHJ5KSAm
JgotCSAgICBjYW5fY2hhbmdlX3B1ZF93cml0YWJsZSh2bWEsIGFkZHIsIGVudHJ5KSkKKwkgICAg
Y2FuX2NoYW5nZV9wdWRfd3JpdGFibGUodm1hLCBhZGRyLCBvbGRwdWQsIGVudHJ5KSkKIAkJZW50
cnkgPSBwdWRfbWt3cml0ZShlbnRyeSk7CiAJc2V0X3B1ZF9hdChtbSwgYWRkciwgcHVkcCwgZW50
cnkpOwogCXRsYl9mbHVzaF9wdWRfcmFuZ2UodGxiLCBhZGRyLCBIUEFHRV9QVURfU0laRSk7CmRp
ZmYgLS1naXQgYS9tbS9tcHJvdGVjdC5jIGIvbW0vbXByb3RlY3QuYwppbmRleCBlMThkNGUxMmZj
MzQuLjg0YmNmZTAyODFkMyAxMDA2NDQKLS0tIGEvbW0vbXByb3RlY3QuYworKysgYi9tbS9tcHJv
dGVjdC5jCkBAIC0xOTQsNiArMTk0LDE3IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBz
ZXRfd3JpdGVfcHJvdF9jb21taXRfZmx1c2hfcHRlcyhzdHJ1Y3Qgdm1fYXJlYV9zdHJ1CiB7CiAJ
Ym9vbCBzZXRfd3JpdGU7CiAKKwkvKgorCSAqIFdyaXRlcyBkaWQgbm90IG5lZWQgYSBmYXVsdCBi
ZWZvcmUgdGhlIGNoYW5nZSBlaXRoZXIuIEFsbCBQVEVzIGluCisJICogdGhlIGJhdGNoIHNoYXJl
IHRoZSB3cml0ZSBiaXQuCisJICovCisJaWYgKHB0ZV93cml0ZShvbGRwdGUpKSB7CisJCXNldF93
cml0ZSA9IG1heWJlX2NoYW5nZV9wdGVfd3JpdGFibGUodm1hLCBwdGVudCk7CisJCXByb3RfY29t
bWl0X2ZsdXNoX3B0ZXModm1hLCBhZGRyLCBwdGVwLCBvbGRwdGUsIHB0ZW50LCBucl9wdGVzLAor
CQkJCSAgICAgICAvKiBpZHggPSAqLyAwLCBzZXRfd3JpdGUsIHRsYik7CisJCXJldHVybjsKKwl9
CisKIAlpZiAodm1hX3Rlc3Qodm1hLCBWTUFfU0hBUkVEX0JJVCkpIHsKIAkJc2V0X3dyaXRlID0g
Y2FuX2NoYW5nZV9zaGFyZWRfcHRlX3dyaXRhYmxlKHZtYSwgcHRlbnQpOwogCQlwcm90X2NvbW1p
dF9mbHVzaF9wdGVzKHZtYSwgYWRkciwgcHRlcCwgb2xkcHRlLCBwdGVudCwgbnJfcHRlcywKLS0g
CjIuNTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
