Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AE660A3809
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 17:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Td7hnC0J;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FyiaQi6Y;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=P556lgPy;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FyiaQi6Y;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=P556lgPy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GOgfFx603LTzbxYdp9428SRjaVCrBLaqCA9YL4PbQwQ=; b=Td7hnC0JzJ42pBP1LauttwQyCG
	v5dd2R9uvCU5B4L7WvcLZxln2h4C25MkQljtdpHkCvJBtno2kIVNmkKbPSzShbMY9+XtjUdtBZSGj
	aMnkEavvablj/N7ZWu9XsWAGKOde1Gu2FaJpxOIGmKWHCxNWE3t/hae/L5hNpG1RsPIrRfHxm63U+
	VUIUIeNZrVPg16HjkHCcRn2dvy7Q32Iut8u4CfW0piYyy+QhcbyrdKg4WKMFZO81yihNxeuUGomRQ
	ic4D3VSH4yUjEH9JOfGdwX7CnyUAleIhd9wv/w4KKzqs8cb/Ky/HiHJ7XZ6P/+i9d6MJJoUnH0sh/
	3ZAq9zLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0q2-00000009jS9-1tT6;
	Thu, 05 Nov 2026 17:01:22 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0pf-00000009jIy-0sVa
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 17:01:09 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A1D701FE8F;
	Thu,  5 Nov 2026 17:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793898057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JKTmXrXjtWa/G4eyzga8yYon7SkQ1CbbiYS7NLaZQSE=;
	b=FyiaQi6Y22rH29a1RDsHKP1SPcP1S1oFAeAS3xeGQfgeA9N//7ADuXokQdk4OFMCztHkgr
	ODWk2HqyRQocNMJK2K29NCzbfvzJH+R4brhwlcgKg2GP7+R0dcOWewn/PWpaDL3l95hIFQ
	iIB3sgwsZluA/aODCeXlO3pk8d3z+8g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793898057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JKTmXrXjtWa/G4eyzga8yYon7SkQ1CbbiYS7NLaZQSE=;
	b=P556lgPyQn3q30w9Fgf4cK2jzW9bYpuofte4VAKU44wYJhKO96WGioywB7j7jlZ23FQG8X
	hiQJvKfqZkM6zBBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793898057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JKTmXrXjtWa/G4eyzga8yYon7SkQ1CbbiYS7NLaZQSE=;
	b=FyiaQi6Y22rH29a1RDsHKP1SPcP1S1oFAeAS3xeGQfgeA9N//7ADuXokQdk4OFMCztHkgr
	ODWk2HqyRQocNMJK2K29NCzbfvzJH+R4brhwlcgKg2GP7+R0dcOWewn/PWpaDL3l95hIFQ
	iIB3sgwsZluA/aODCeXlO3pk8d3z+8g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793898057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JKTmXrXjtWa/G4eyzga8yYon7SkQ1CbbiYS7NLaZQSE=;
	b=P556lgPyQn3q30w9Fgf4cK2jzW9bYpuofte4VAKU44wYJhKO96WGioywB7j7jlZ23FQG8X
	hiQJvKfqZkM6zBBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A681133F6;
	Thu,  5 Nov 2026 17:00:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HMEkC0K27GqWRwAAD6G6ig:T5
	(envelope-from <clopez@suse.de>); Thu, 05 Nov 2026 17:00:56 +0000
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
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>
Subject: [PATCH v2 4/9] mm/mprotect: add MM_CP_PERM_UPGRADE
Date: Thu,  5 Nov 2026 17:50:01 +0100
Message-ID: <20261105165004.2663799-8-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261105165004.2663799-4-clopez@suse.de>
References: <20261105165004.2663799-4-clopez@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_090102_092282_586ADDD4 
X-CRM114-Status: GOOD (  12.63  )
X-Spam-Score: -2.1 (--)
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

QWRkIGEgY2hhbmdlX3Byb3RlY3Rpb24oKSBmbGFnIGZvciBjaGFuZ2VzIHRoYXQgb25seSBhZGQg
cGVybWlzc2lvbnMsCmtlZXBpbmcgdGhlIFBGTiBhbmQgcmV2b2tpbmcgbm8gYWNjZXNzLiBtcHJv
dGVjdCgpIHNldHMgaXQgd2hlbiB0aGUgbmV3ClZNQSBmbGFncyBvbmx5IGFkZCByZWFkLCB3cml0
ZSBvciBleGVjdXRlIHBlcm1pc3Npb25zLiBWTV9BQ0NPVU5UIG1heSBiZQphZGRlZCBhcyB3ZWxs
LCBhcyBpdCBkb2VzIG5vdCBhZmZlY3QgdGhlIHBhZ2UgdGFibGVzLiBBbnkgb3RoZXIgY2hhbmdl
LApzdWNoIGFzIGEgZGlmZmVyZW50IHByb3RlY3Rpb24ga2V5LCBpcyBub3QgY29uc2lkZXJlZCBh
biB1cGdyYWRlLgoKVGhpcyB3aWxsIGFsbG93IE1NVSBub3RpZmllciB1c2VycyB0byBwZXJmb3Jt
IG9wdGltaXphdGlvbnMsIGFzIHRoZXkKY2FuIGF2b2lkIGludmFsaWRhdGluZyBQVEVzIHdob3Nl
IHBlcm1pc3Npb25zIGNhbiBiZSBmYXVsdGVkIGluLgoKU2lnbmVkLW9mZi1ieTogQ2FybG9zIEzD
s3BleiA8Y2xvcGV6QHN1c2UuZGU+Ci0tLQogaW5jbHVkZS9saW51eC9tbS5oIHwgIDIgKysKIG1t
L21wcm90ZWN0LmMgICAgICB8IDEzICsrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUv
bGludXgvbW0uaAppbmRleCA5ZjE2Nzk1MDkyNmEuLmRkZGJkNzZhMjc2MCAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9saW51eC9tbS5oCisrKyBiL2luY2x1ZGUvbGludXgvbW0uaApAQCAtMzU4MSw2ICsz
NTgxLDggQEAgaW50IGdldF9jbWRsaW5lKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywgY2hhciAq
YnVmZmVyLCBpbnQgYnVmbGVuKTsKICNkZWZpbmUgIE1NX0NQX1VGRkRfUldQX1JFU09MVkUgICAg
ICAgICAgICAoMVVMIDw8IDUpIC8qIHJlc29sdmUgcndwICovCiAjZGVmaW5lICBNTV9DUF9VRkZE
X1JXUF9BTEwgICAgICAgICAgICAgICAgKE1NX0NQX1VGRkRfUldQIHwgXAogCQkJCQkgICAgTU1f
Q1BfVUZGRF9SV1BfUkVTT0xWRSkKKy8qIFdoZXRoZXIgdGhpcyBjaGFuZ2Ugb25seSB1cGdyYWRl
cy9hZGRzIHBlcm1pc3Npb25zICovCisjZGVmaW5lICBNTV9DUF9QRVJNX1VQR1JBREUgICAgICAg
ICAgICAgICAgKDFVTCA8PCA2KQogCiBib29sIGNhbl9jaGFuZ2VfcHRlX3dyaXRhYmxlKHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJCQkgICAgIHB0ZV90
IHB0ZSk7CmRpZmYgLS1naXQgYS9tbS9tcHJvdGVjdC5jIGIvbW0vbXByb3RlY3QuYwppbmRleCA3
NTQzMzM2OThjMWUuLjY4MzEzMWM5YzRhMCAxMDA2NDQKLS0tIGEvbW0vbXByb3RlY3QuYworKysg
Yi9tbS9tcHJvdGVjdC5jCkBAIC03NTYsNiArNzU2LDE3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
bW1fd2Fsa19vcHMgcHJvdF9ub25lX3dhbGtfb3BzID0gewogCS53YWxrX2xvY2sJCT0gUEdXQUxL
X1dSTE9DSywKIH07CiAKK3N0YXRpYyBib29sIHZtYV9mbGFnc19pc19wZXJtX3VwZ3JhZGUodm1h
X2ZsYWdzX3Qgb2xkX3ZtYV9mbGFncywKKwkJCQkgICAgICB2bWFfZmxhZ3NfdCBuZXdfdm1hX2Zs
YWdzKQoreworCXZtX2ZsYWdzX3Qgb2xkID0gdm1hX2ZsYWdzX3RvX2xlZ2FjeShvbGRfdm1hX2Zs
YWdzKTsKKwl2bV9mbGFnc190IG5ldyA9IHZtYV9mbGFnc190b19sZWdhY3kobmV3X3ZtYV9mbGFn
cyk7CisJLyogVk1fQUNDT1VOVCBkb2VzIG5vdCBhZmZlY3QgcGFnZSB0YWJsZXMgKi8KKwl2bV9m
bGFnc190IG1hc2sgPSBWTV9SRUFEIHwgVk1fV1JJVEUgfCBWTV9FWEVDIHwgVk1fQUNDT1VOVDsK
KworCXJldHVybiBuZXcgPT0gKG9sZCB8IChuZXcgJiBtYXNrKSk7Cit9CisKIGludAogbXByb3Rl
Y3RfZml4dXAoc3RydWN0IHZtYV9pdGVyYXRvciAqdm1pLCBzdHJ1Y3QgbW11X2dhdGhlciAqdGxi
LAogCSAgICAgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICoqcHByZXYsCkBAIC04MzYsNiArODQ3LDggQEAgbXByb3RlY3RfZml4dXAoc3RydWN0IHZt
YV9pdGVyYXRvciAqdm1pLCBzdHJ1Y3QgbW11X2dhdGhlciAqdGxiLAogCXZtYV9mbGFnc19yZXNl
dF9vbmNlKHZtYSwgJm5ld192bWFfZmxhZ3MpOwogCWlmICh2bWFfd2FudHNfbWFudWFsX3B0ZV93
cml0ZV91cGdyYWRlKHZtYSkpCiAJCW1tX2NwX2ZsYWdzIHw9IE1NX0NQX1RSWV9DSEFOR0VfV1JJ
VEFCTEU7CisJaWYgKHZtYV9mbGFnc19pc19wZXJtX3VwZ3JhZGUob2xkX3ZtYV9mbGFncywgbmV3
X3ZtYV9mbGFncykpCisJCW1tX2NwX2ZsYWdzIHw9IE1NX0NQX1BFUk1fVVBHUkFERTsKIAl2bWFf
c2V0X3BhZ2VfcHJvdCh2bWEpOwogCiAJY2hhbmdlX3Byb3RlY3Rpb24odGxiLCB2bWEsIHN0YXJ0
LCBlbmQsIG1tX2NwX2ZsYWdzKTsKLS0gCjIuNTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
