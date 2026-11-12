Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBB460703AA
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 14:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y033ovgW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SS6UfG9C9YGvwwaNR8pJ8loOwaKQNaQKrQkc01Qg5Ng=; b=Y033ovgWUYK2y21d311K1wQu9r
	hFpOv2Lb3nVGK2TBiKNV9hxsWwckTucoweACVUS1aBQR4SKQ3F5/iWofBBKkEMX239F2Lo6hVyRbW
	ut56Z0gGY/pjZObCx9e4lOC72rDgXJj6FvnmQA8FWmFy3HLvqWYw06v2xu+vIigyyWUHzYU0jDs4U
	zgkQjaefGNeFJxgi1CKmDh4zxb7JaEwbYGtLEYXDungO+fnBCGgpCYWype6X3iGsLOk+ZGCIB1g9d
	hGjOCa9rBkNmYN7JlAX2hHC2b5x9/2x9yreog2wftWE+y+kE9WvT+ywrbHup6B18/V+tmKoqsWljM
	hXbI0CKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVkN-0000000AFIK-0LUX;
	Thu, 12 Nov 2026 14:25:51 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVkH-0000000AFBO-1GG7
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 14:25:46 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AB13C1F7B9;
	Thu, 12 Nov 2026 14:25:43 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5FDE913432;
	Thu, 12 Nov 2026 14:25:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id w9GzDFnM9WoAPwAAD6G6ig:T10
	(envelope-from <clopez@suse.de>); Thu, 12 Nov 2026 14:25:42 +0000
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
	Steffen Eiden <seiden@linux.ibm.com>,
	Andreas Grapentin <gra@linux.ibm.com>,
	Marc Zyngier <maz@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>
Subject: [PATCH v3 9/9] KVM: s390: don't unmap the gmap on permission upgrade
Date: Thu, 12 Nov 2026 15:20:38 +0100
Message-ID: <20261112142039.907090-11-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261112142039.907090-2-clopez@suse.de>
References: <20261112142039.907090-2-clopez@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: AB13C1F7B9
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_062545_604062_6CF9769D 
X-CRM114-Status: GOOD (  10.07  )
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

V2hlbiBhbiBtbXVfbm90aWZpZXIgaW52YWxpZGF0aW9uIG9ubHkgdXBncmFkZXMgcGVybWlzc2lv
bnMKKE1NVV9OT1RJRklFUl9SQU5HRV9QRVJNX1VQR1JBREUpLCBrZWVwIHRoZSBleGlzdGluZyBn
bWFwIGVudHJpZXMKaW5zdGVhZCBvZiB1bm1hcHBpbmcgdGhlbS4gVGhlIFBGTiBpcyB1bmNoYW5n
ZWQgYW5kIG5vIGFjY2VzcyBpcwpyZXZva2VkLCBzbyBhbiBleGlzdGluZyBlbnRyeSBpcyBubyBt
b3JlIHBlcm1pc3NpdmUgdGhhbiB0aGUgbmV3IGhvc3QKUFRFLgoKQSB3cml0ZSB0byBhbiBlbnRy
eSB0aGF0IGlzIHN0aWxsIHJlYWQtb25seSBjYXVzZXMgYSBwcm90ZWN0aW9uCmV4Y2VwdGlvbiwg
d2hpY2gga3ZtX3MzOTBfZmF1bHRpbl9nZm4oKSBoYW5kbGVzIGFzIGEgd3JpdGUgZmF1bHQuIFRo
aXMKYXBwbGllcyB0byBib3RoIHMzOTAgYW5kIGFybTY0IGd1ZXN0cy4KClNpZ25lZC1vZmYtYnk6
IENhcmxvcyBMw7NwZXogPGNsb3BlekBzdXNlLmRlPgotLS0KIGFyY2gvczM5MC9rdm0vYXJtNjQv
YXJtLmMgfCA3ICsrKysrKysKIGFyY2gvczM5MC9rdm0vczM5MC9zMzkwLmMgfCA3ICsrKysrKysK
IDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvczM5
MC9rdm0vYXJtNjQvYXJtLmMgYi9hcmNoL3MzOTAva3ZtL2FybTY0L2FybS5jCmluZGV4IGJkOWQ4
NTIzNWY0My4uNWFlZTE4MTdhYWQ4IDEwMDY0NAotLS0gYS9hcmNoL3MzOTAva3ZtL2FybTY0L2Fy
bS5jCisrKyBiL2FyY2gvczM5MC9rdm0vYXJtNjQvYXJtLmMKQEAgLTY3OCw2ICs2NzgsMTMgQEAg
dm9pZCBrdm1fYXJjaF9jb21taXRfbWVtb3J5X3JlZ2lvbihzdHJ1Y3Qga3ZtICprdm0sIHN0cnVj
dCBrdm1fbWVtb3J5X3Nsb3QgKm9sZCwKIAogYm9vbCBrdm1fdW5tYXBfZ2ZuX3JhbmdlKHN0cnVj
dCBrdm0gKmt2bSwgc3RydWN0IGt2bV9nZm5fcmFuZ2UgKnJhbmdlKQogeworCS8qCisJICogRG8g
bm90IGJvdGhlciB1bm1hcHBpbmcgaWYgdGhpcyBpcyBvbmx5IGEgcHJvdGVjdGlvbiB1cGdyYWRl
LgorCSAqIFBlcm1pc3Npb25zIHdpbGwgYmUgZmF1bHRlZC1pbiBvbiBkZW1hbmQuCisJICovCisJ
aWYgKHJhbmdlLT5mbGFncyAmIE1NVV9OT1RJRklFUl9SQU5HRV9QRVJNX1VQR1JBREUpCisJCXJl
dHVybiBmYWxzZTsKKwogCXJldHVybiBnbWFwX3VubWFwX2dmbl9yYW5nZShrdm0tPmFyY2guZ21h
cCwgcmFuZ2UtPnNsb3QsIHJhbmdlLT5zdGFydCwgcmFuZ2UtPmVuZCk7CiB9CiAKZGlmZiAtLWdp
dCBhL2FyY2gvczM5MC9rdm0vczM5MC9zMzkwLmMgYi9hcmNoL3MzOTAva3ZtL3MzOTAvczM5MC5j
CmluZGV4IDE4ZmIyMDBmODU0YS4uOTU0YmY2YjY0NjgzIDEwMDY0NAotLS0gYS9hcmNoL3MzOTAv
a3ZtL3MzOTAvczM5MC5jCisrKyBiL2FyY2gvczM5MC9rdm0vczM5MC9zMzkwLmMKQEAgLTU4NzEs
NiArNTg3MSwxMyBAQCBib29sIGt2bV9hZ2VfZ2ZuKHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2
bV9nZm5fcmFuZ2UgKnJhbmdlKQogICovCiBib29sIGt2bV91bm1hcF9nZm5fcmFuZ2Uoc3RydWN0
IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX2dmbl9yYW5nZSAqcmFuZ2UpCiB7CisJLyoKKwkgKiBEbyBu
b3QgYm90aGVyIHVubWFwcGluZyBpZiB0aGlzIGlzIG9ubHkgYSBwcm90ZWN0aW9uIHVwZ3JhZGUu
CisJICogUGVybWlzc2lvbnMgd2lsbCBiZSBmYXVsdGVkLWluIG9uIGRlbWFuZC4KKwkgKi8KKwlp
ZiAocmFuZ2UtPmZsYWdzICYgTU1VX05PVElGSUVSX1JBTkdFX1BFUk1fVVBHUkFERSkKKwkJcmV0
dXJuIGZhbHNlOworCiAJcmV0dXJuIGdtYXBfdW5tYXBfZ2ZuX3JhbmdlKGt2bS0+YXJjaC5nbWFw
LCByYW5nZS0+c2xvdCwgcmFuZ2UtPnN0YXJ0LCByYW5nZS0+ZW5kKTsKIH0KIAotLSAKMi41MS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
