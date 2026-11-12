Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569C6606F895
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 14:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xp+Lni7R;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=RadUXxFz;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IZqtonmx;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=RadUXxFz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IZqtonmx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AJPRkZM0hEppUKK/zimTYG621VuDsRiefSPRJ8cOpZ4=; b=xp+Lni7R5/LmLnIT9x7ecOr1nF
	xNGfCmDWng3IAGThz+A9n+FjYxeICU0S+vcP7m5p2PgzK5PzhAgHU9PQfpahs1Xg5v7xLI5myTz5n
	q/iAHe6O4mwY4SltW9m5p0Kk5ABPzGR8lwt6lM5NtRKGSZJSDYglp/1MK7Y2wCvSSVpJ8h1afRfcs
	nx6cUN17ifuphUICyQbsGa5IMxmWaNcDl2FG1fDShZsllrpMWGtQiTh/6kC9xw+FR7C6oCP7RIVrU
	auSktFmmVyN/Y07cqQHX4G5tmhA2gIsolord+2bxKzGcpRSwDk9xP+ZP5tUhhbias4fQPDdIKQhTG
	y4MnaMdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVkC-0000000AF7o-0zvv;
	Thu, 12 Nov 2026 14:25:40 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVk8-0000000AF54-2rB3
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 14:25:38 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DE15D21DEF;
	Thu, 12 Nov 2026 14:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794493534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6YWUCSXWqyL1xWG0ifotpOzssQneDskvG8p1+21PIR4=;
	b=RadUXxFzw0HyqoD8lqQh5wbYPJz0ASHGDzXSkyZjXl/V+5m7xPx/svoXkDxCJvmpgcwy6R
	gI+U7ML0T4axp66JIE6EPZvAsEW4OzonyXlgJn1F1X0YiVzkUBo84xFjNM/d7Kjwzt6Xwz
	WX2ZFxX5ly2jUooq9uoQ8aPZVPyk32g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794493534;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6YWUCSXWqyL1xWG0ifotpOzssQneDskvG8p1+21PIR4=;
	b=IZqtonmxFwZVkMHUyVhmFt3xNKcjxQ46cGK7RNQYrb12IKUPSvBmH5ZgzZzE9SJQtdvKLL
	+FjBiBzVnR3Sc4AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794493534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6YWUCSXWqyL1xWG0ifotpOzssQneDskvG8p1+21PIR4=;
	b=RadUXxFzw0HyqoD8lqQh5wbYPJz0ASHGDzXSkyZjXl/V+5m7xPx/svoXkDxCJvmpgcwy6R
	gI+U7ML0T4axp66JIE6EPZvAsEW4OzonyXlgJn1F1X0YiVzkUBo84xFjNM/d7Kjwzt6Xwz
	WX2ZFxX5ly2jUooq9uoQ8aPZVPyk32g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794493534;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6YWUCSXWqyL1xWG0ifotpOzssQneDskvG8p1+21PIR4=;
	b=IZqtonmxFwZVkMHUyVhmFt3xNKcjxQ46cGK7RNQYrb12IKUPSvBmH5ZgzZzE9SJQtdvKLL
	+FjBiBzVnR3Sc4AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D6DA13432;
	Thu, 12 Nov 2026 14:25:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id w9GzDFnM9WoAPwAAD6G6ig:T4
	(envelope-from <clopez@suse.de>); Thu, 12 Nov 2026 14:25:33 +0000
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
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCH v3 3/9] mm/huge_memory: honor MM_CP_TRY_CHANGE_WRITABLE in change_huge_pud()
Date: Thu, 12 Nov 2026 15:20:32 +0100
Message-ID: <20261112142039.907090-5-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261112142039.907090-2-clopez@suse.de>
References: <20261112142039.907090-2-clopez@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-16.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL8fugicft4tip39ru97wanzoz)];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -16.30
X-Spam-Level: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_062537_023669_342A7AE4 
X-CRM114-Status: GOOD (  15.37  )
X-Spam-Score: -4.4 (----)
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
cml0ZSBmYXVsdCB3b3VsZCBvbmx5IHNldCB0aGUgd3JpdGUgYml0LgoKSG93ZXZlciwgY2hhbmdl
X2h1Z2VfcHVkKCkgaWdub3JlcyB0aGUgZmxhZy4gRm9yIGV4YW1wbGUsIGRldmljZSBEQVgKbWFw
cGluZ3MgYXJlIHdyaXRlLW5vdGlmaWVkIG9uY2Ugc29mdC1kaXJ0eSB0cmFja2luZyBpcyBhcm1l
ZCB0aHJvdWdoCi9wcm9jL3BpZC9jbGVhcl9yZWZzLCBhbmQgYSBwcm90ZWN0aW9uIGNoYW5nZSB0
aGVuIGxlYXZlcyBkaXJ0eSBQVURzCnJlYWQtb25seSwgc28gdGhlIG5leHQgd3JpdGUgdG8gZWFj
aCBvZiB0aGVtIGZhdWx0cy4KCkZpeCB0aGlzIGJ5IGFkZGluZyBjYW5fY2hhbmdlX3B1ZF93cml0
YWJsZSgpLCBiYXNlZCBvbgpjYW5fY2hhbmdlX3BtZF93cml0YWJsZSgpLiBJdCBvbWl0cyB0aGUg
TlVNQSBhbmQgdWZmZC13cCBjaGVja3MsIGFzCmNoYW5nZV9odWdlX3B1ZCgpIGJhaWxzIG91dCBv
biB0aG9zZSBjaGFuZ2VzLgoKU2lnbmVkLW9mZi1ieTogQ2FybG9zIEzDs3BleiA8Y2xvcGV6QHN1
c2UuZGU+Ci0tLQogaW5jbHVkZS9saW51eC9wZ3RhYmxlLmggfCAgNSArKysrKwogbW0vaHVnZV9t
ZW1vcnkuYyAgICAgICAgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysrKystCiAyIGZpbGVz
IGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L3BndGFibGUuaCBiL2luY2x1ZGUvbGludXgvcGd0YWJsZS5oCmluZGV4IDc4
MGZlODQ5ZmY4Yi4uOTQzZDdlOTVmNDI2IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L3BndGFi
bGUuaAorKysgYi9pbmNsdWRlL2xpbnV4L3BndGFibGUuaApAQCAtMTg2Niw2ICsxODY2LDExIEBA
IHN0YXRpYyBpbmxpbmUgaW50IHBtZF9zb2Z0X2RpcnR5KHBtZF90IHBtZCkKIAlyZXR1cm4gMDsK
IH0KIAorc3RhdGljIGlubGluZSBpbnQgcHVkX3NvZnRfZGlydHkocHVkX3QgcHVkKQoreworCXJl
dHVybiAwOworfQorCiBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV9ta3NvZnRfZGlydHkocHRlX3Qg
cHRlKQogewogCXJldHVybiBwdGU7CmRpZmYgLS1naXQgYS9tbS9odWdlX21lbW9yeS5jIGIvbW0v
aHVnZV9tZW1vcnkuYwppbmRleCBlYjkxM2FjYjAzYjcuLjA4MGI3MThlYjdkZSAxMDA2NDQKLS0t
IGEvbW0vaHVnZV9tZW1vcnkuYworKysgYi9tbS9odWdlX21lbW9yeS5jCkBAIC0yODMzLDYgKzI4
MzMsMjkgQEAgaW50IGNoYW5nZV9odWdlX3BtZChzdHJ1Y3QgbW11X2dhdGhlciAqdGxiLCBzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAlyZXR1cm4gcmV0OwogfQogCisjaWZkZWYgQ09ORklH
X0hBVkVfQVJDSF9UUkFOU1BBUkVOVF9IVUdFUEFHRV9QVUQKK3N0YXRpYyBpbmxpbmUgYm9vbCBj
YW5fY2hhbmdlX3B1ZF93cml0YWJsZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKKwkJCQkJ
ICAgdW5zaWduZWQgbG9uZyBhZGRyLCBwdWRfdCBwdWQpCit7CisJc3RydWN0IHBhZ2UgKnBhZ2U7
CisKKwlpZiAoV0FSTl9PTl9PTkNFKCEodm1hLT52bV9mbGFncyAmIFZNX1dSSVRFKSkpCisJCXJl
dHVybiBmYWxzZTsKKworCS8qIERvIHdlIG5lZWQgd3JpdGUgZmF1bHRzIGZvciBzb2Z0ZGlydHkg
dHJhY2tpbmc/ICovCisJaWYgKHZtYV9zb2Z0X2RpcnR5X2VuYWJsZWQodm1hKSAmJiAhcHVkX3Nv
ZnRfZGlydHkocHVkKSkKKwkJcmV0dXJuIGZhbHNlOworCisJaWYgKCEodm1hLT52bV9mbGFncyAm
IFZNX1NIQVJFRCkpIHsKKwkJLyogU2VlIGNhbl9jaGFuZ2VfcHRlX3dyaXRhYmxlKCkuICovCisJ
CXBhZ2UgPSB2bV9ub3JtYWxfcGFnZV9wdWQodm1hLCBhZGRyLCBwdWQpOworCQlyZXR1cm4gcGFn
ZSAmJiBQYWdlQW5vbihwYWdlKSAmJiBQYWdlQW5vbkV4Y2x1c2l2ZShwYWdlKTsKKwl9CisKKwkv
KiBTZWUgY2FuX2NoYW5nZV9wdGVfd3JpdGFibGUoKS4gKi8KKwlyZXR1cm4gcHVkX2RpcnR5KHB1
ZCk7Cit9CisKIC8qCiAgKiBSZXR1cm5zOgogICoKQEAgLTI4NDAsNyArMjg2Myw2IEBAIGludCBj
aGFuZ2VfaHVnZV9wbWQoc3RydWN0IG1tdV9nYXRoZXIgKnRsYiwgc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEsCiAgKiAtIDE6IGlmIHB1ZCBjYW4gYmUgc2tpcHBlZAogICogLSBIUEFHRV9QVURf
TlI6IGlmIHB1ZCB3YXMgc3VjY2Vzc2Z1bGx5IHByb2Nlc3NlZAogICovCi0jaWZkZWYgQ09ORklH
X0hBVkVfQVJDSF9UUkFOU1BBUkVOVF9IVUdFUEFHRV9QVUQKIGludCBjaGFuZ2VfaHVnZV9wdWQo
c3RydWN0IG1tdV9nYXRoZXIgKnRsYiwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJCSAg
ICBwdWRfdCAqcHVkcCwgdW5zaWduZWQgbG9uZyBhZGRyLCBwZ3Byb3RfdCBuZXdwcm90LAogCQkg
ICAgdW5zaWduZWQgbG9uZyBjcF9mbGFncykKQEAgLTI4NzIsNiArMjg5NCwxMCBAQCBpbnQgY2hh
bmdlX2h1Z2VfcHVkKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIsIHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hLAogCSAqLwogCW9sZHB1ZCA9IHB1ZHBfaW52YWxpZGF0ZSh2bWEsIGFkZHIsIHB1ZHAp
OwogCWVudHJ5ID0gcHVkX21vZGlmeShvbGRwdWQsIG5ld3Byb3QpOworCS8qIFNlZSBjaGFuZ2Vf
cHRlX3JhbmdlKCkuICovCisJaWYgKChjcF9mbGFncyAmIE1NX0NQX1RSWV9DSEFOR0VfV1JJVEFC
TEUpICYmICFwdWRfd3JpdGUoZW50cnkpICYmCisJICAgIGNhbl9jaGFuZ2VfcHVkX3dyaXRhYmxl
KHZtYSwgYWRkciwgZW50cnkpKQorCQllbnRyeSA9IHB1ZF9ta3dyaXRlKGVudHJ5KTsKIAlzZXRf
cHVkX2F0KG1tLCBhZGRyLCBwdWRwLCBlbnRyeSk7CiAJdGxiX2ZsdXNoX3B1ZF9yYW5nZSh0bGIs
IGFkZHIsIEhQQUdFX1BVRF9TSVpFKTsKIAotLSAKMi41MS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
