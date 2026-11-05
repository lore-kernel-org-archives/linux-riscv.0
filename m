Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B76A606D80B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 17:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xJD5Dlbk;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bwfKcNNH;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oMZXE9vq;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bwfKcNNH;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oMZXE9vq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Xdfvd611q39LWbb92t2XtXJdvcI76R7xsGJZKDIsXaY=; b=xJD5Dlbk2GPj//5xexnBx3e/NO
	6MrWZ65BqWyf9C9ZsnjFcTZKIU5tlsKqrc0Ca7UGwrh8V/CUSzTyvqJKfJp/R35RiQ9x+phdRNPzA
	I8psbhKza9NokKX37K4VPF6/TqMqoMZMNVkA7nc47IatKg4r9XCBEIt+48ynyq7LL3fpXa/3eokcg
	iPii3Q2nub8fFw5kPNXb1m3rIE4W9kkX84BJx5Brx+yB25++4Bh/xbIBG+kCgmdxat/+iwJKrwow8
	ValZ4OMi/hYvecf9sBkmWanHM2HpQ0V8PQNPfnRnIuHzvI97V9BFYBEHOCiErHgoYdCsw5A4la0v+
	vTqcfNdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0q3-00000009jTS-2SAi;
	Thu, 05 Nov 2026 17:01:24 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0ph-00000009jJY-2Aci
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 17:01:11 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A519322969;
	Thu,  5 Nov 2026 17:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793898059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XrOlVJc59oYib62BfT/3ENAYDoWhZ0QgBTfWP6Dr3iE=;
	b=bwfKcNNHotvZiPIGKoYNHRVjzFCLekuO/biuK0+R+N+v7R6/3iDScSBzvXibnkScKr7HPW
	p7TKbxrVczEqGFHY7vl7yTBH41pYxALVihvTZ66tK+K52QJRjiPIFLxLuYUVcg+aX9jwdN
	F+59SFQc+NVuOP9tXnEajUkBtdwGsp4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793898059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XrOlVJc59oYib62BfT/3ENAYDoWhZ0QgBTfWP6Dr3iE=;
	b=oMZXE9vqv/q9klCqGpvzovKwu+02C8g691XsaiMX52BN3O/iSypUm5MDyh5oxy++gkk9Xo
	nB8GkVyOX4c5wmCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bwfKcNNH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oMZXE9vq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793898059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XrOlVJc59oYib62BfT/3ENAYDoWhZ0QgBTfWP6Dr3iE=;
	b=bwfKcNNHotvZiPIGKoYNHRVjzFCLekuO/biuK0+R+N+v7R6/3iDScSBzvXibnkScKr7HPW
	p7TKbxrVczEqGFHY7vl7yTBH41pYxALVihvTZ66tK+K52QJRjiPIFLxLuYUVcg+aX9jwdN
	F+59SFQc+NVuOP9tXnEajUkBtdwGsp4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793898059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XrOlVJc59oYib62BfT/3ENAYDoWhZ0QgBTfWP6Dr3iE=;
	b=oMZXE9vqv/q9klCqGpvzovKwu+02C8g691XsaiMX52BN3O/iSypUm5MDyh5oxy++gkk9Xo
	nB8GkVyOX4c5wmCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E1386133F6;
	Thu,  5 Nov 2026 17:00:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HMEkC0K27GqWRwAAD6G6ig:T6
	(envelope-from <clopez@suse.de>); Thu, 05 Nov 2026 17:00:57 +0000
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
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>
Subject: [PATCH v2 5/9] mm/mprotect: keep writable entries writable on permission upgrades
Date: Thu,  5 Nov 2026 17:50:02 +0100
Message-ID: <20261105165004.2663799-9-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261105165004.2663799-4-clopez@suse.de>
References: <20261105165004.2663799-4-clopez@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: A519322969
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL3zg8z7sygsujbub1yh4z3pr1)];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_090102_092279_0B437D18 
X-CRM114-Status: GOOD (  12.75  )
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

Y2hhbmdlX3Byb3RlY3Rpb24oKSBhcHBsaWVzIHZtYS0+dm1fcGFnZV9wcm90LCB3aGljaCBsYWNr
cyB0aGUgd3JpdGUgYml0CmZvciBDb1cgYW5kIHdyaXRlLW5vdGlmaWVkIG1hcHBpbmdzLCBzbyBp
dCB3cml0ZS1wcm90ZWN0cyBldmVyeSBlbnRyeQppbiB0aGVtLiBXaGVuIGFuIGVudHJ5IHdvdWxk
IHNpbXBseSBiZSBtYWRlIHdyaXRhYmxlIG9uIGZhdWx0IHdpdGhvdXQKZnVydGhlciBjaGVja3Mg
KGUuZy4gZGlydHkgUFRFcyBpbiBzaGFyZWQgbWFwcGluZ3MsIGV4Y2x1c2l2ZSBhbm9ueW1vdXMK
cGFnZXMpLCBNTV9DUF9UUllfQ0hBTkdFX1dSSVRBQkxFIG1ha2VzIHRoZSBlbnRyeSB3cml0YWJs
ZSBhZ2FpbiB0bwphdm9pZCB0aGUgZnV0dXJlIGZhdWx0LgoKSG93ZXZlciwgd3JpdGFibGUgZW50
cmllcyBpbiBzaGFyZWQgbWFwcGluZ3MgdGhhdCBhcmUgbm90IGRpcnR5IHN0aWxsCmJlY29tZSBy
ZWFkLW9ubHkuIEZvciBleGFtcGxlLCBhIHVmZmQtd3AgdW5wcm90ZWN0IG1ha2VzIGNsZWFuIHNo
bWVtClBURXMgcmVhZC1vbmx5IGV2ZW4gaWYgdGhleSB3ZXJlIG5ldmVyIHdyaXRlLXByb3RlY3Rl
ZCwgZS5nLiB3aGVuIHRoZXkKd2VyZSBtYXBwZWQgYnkgYSByZWFkIGZhdWx0IGJlZm9yZSB1ZmZk
LXdwIHdhcyByZWdpc3RlcmVkLiBUaGUgbmV4dAp3cml0ZSB0byBlYWNoIG9mIHRoZW0gY2F1c2Vz
IGEgZmF1bHQgdGhhdCBvbmx5IHJlc3RvcmVzIHRoZSB3cml0ZSBiaXQuCgpOb3cgdGhhdCBNTV9D
UF9QRVJNX1VQR1JBREUgaW5kaWNhdGVzIHdoZXRoZXIgbXByb3RlY3QoKSBvbmx5IGFkZHMKcGVy
bWlzc2lvbnMsIGNoYW5nZV9wcm90ZWN0aW9uKCkgY2FuIHRlbGwsIHRvZ2V0aGVyIHdpdGggdGhl
CnVzZXJmYXVsdGZkIHVucHJvdGVjdCBmbGFncywgd2hlbiBhIGNoYW5nZSByZXZva2VzIG5vIGFj
Y2Vzcy4gS2VlcAp3cml0YWJsZSBlbnRyaWVzIHdyaXRhYmxlIGluIHRoZXNlIGNhc2VzLCBhdCB0
aGUgUFRFLCBQTUQgYW5kIFBVRApsZXZlbHMuIFRoaXMgaXMgY29uc2lzdGVudCB3aXRoIHRoZSB3
cml0ZSBmYXVsdCBoYW5kbGVyLCBhcyBhbiBlbnRyeQp0aGF0IGlzIGFscmVhZHkgd3JpdGFibGUg
bmVlZHMgbm8gd3JpdGUgZmF1bHQuCgpTaWduZWQtb2ZmLWJ5OiBDYXJsb3MgTMOzcGV6IDxjbG9w
ZXpAc3VzZS5kZT4KLS0tCiBtbS9odWdlX21lbW9yeS5jIHwgNyArKysrKysrCiBtbS9pbnRlcm5h
bC5oICAgIHwgNyArKysrKysrCiBtbS9tcHJvdGVjdC5jICAgIHwgNCArKysrCiAzIGZpbGVzIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9tbS9odWdlX21lbW9yeS5jIGIv
bW0vaHVnZV9tZW1vcnkuYwppbmRleCA1MDZlMWU2MWMwZmQuLjZlMjNkMGU0YWU2NiAxMDA2NDQK
LS0tIGEvbW0vaHVnZV9tZW1vcnkuYworKysgYi9tbS9odWdlX21lbW9yeS5jCkBAIC0yODA5LDYg
KzI4MDksMTAgQEAgaW50IGNoYW5nZV9odWdlX3BtZChzdHJ1Y3QgbW11X2dhdGhlciAqdGxiLCBz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAlpZiAodXNlcmZhdWx0ZmRfcndwKHZtYSkgJiYg
cG1kX3VmZmQoZW50cnkpKQogCQllbnRyeSA9IHBtZF9tb2RpZnkoZW50cnksIFBBR0VfTk9ORSk7
CiAKKwkvKiBTZWUgY2hhbmdlX3ByZXNlbnRfcHRlcygpLiAqLworCWlmIChtbV9jcF9pc19wZXJt
X3VwZ3JhZGUoY3BfZmxhZ3MpICYmIHBtZF93cml0ZShvbGRwbWQpKQorCQllbnRyeSA9IHBtZF9t
a3dyaXRlKGVudHJ5LCB2bWEpOworCiAJLyogU2VlIGNoYW5nZV9wdGVfcmFuZ2UoKS4gKi8KIAlp
ZiAoKGNwX2ZsYWdzICYgTU1fQ1BfVFJZX0NIQU5HRV9XUklUQUJMRSkgJiYgIXBtZF93cml0ZShl
bnRyeSkgJiYKIAkgICAgY2FuX2NoYW5nZV9wbWRfd3JpdGFibGUodm1hLCBhZGRyLCBlbnRyeSkp
CkBAIC0yODg1LDYgKzI4ODksOSBAQCBpbnQgY2hhbmdlX2h1Z2VfcHVkKHN0cnVjdCBtbXVfZ2F0
aGVyICp0bGIsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAogCSAqLwogCW9sZHB1ZCA9IHB1
ZHBfaW52YWxpZGF0ZSh2bWEsIGFkZHIsIHB1ZHApOwogCWVudHJ5ID0gcHVkX21vZGlmeShvbGRw
dWQsIG5ld3Byb3QpOworCS8qIFNlZSBjaGFuZ2VfcHJlc2VudF9wdGVzKCkuICovCisJaWYgKG1t
X2NwX2lzX3Blcm1fdXBncmFkZShjcF9mbGFncykgJiYgcHVkX3dyaXRlKG9sZHB1ZCkpCisJCWVu
dHJ5ID0gcHVkX21rd3JpdGUoZW50cnkpOwogCS8qIFNlZSBjaGFuZ2VfcHRlX3JhbmdlKCkuICov
CiAJaWYgKChjcF9mbGFncyAmIE1NX0NQX1RSWV9DSEFOR0VfV1JJVEFCTEUpICYmICFwdWRfd3Jp
dGUoZW50cnkpICYmCiAJICAgIGNhbl9jaGFuZ2VfcHVkX3dyaXRhYmxlKHZtYSwgYWRkciwgZW50
cnkpKQpkaWZmIC0tZ2l0IGEvbW0vaW50ZXJuYWwuaCBiL21tL2ludGVybmFsLmgKaW5kZXggNTY2
Y2JkMmRjZTQ4Li5hMWE2NmYzYjRiOWMgMTAwNjQ0Ci0tLSBhL21tL2ludGVybmFsLmgKKysrIGIv
bW0vaW50ZXJuYWwuaApAQCAtMTQyMyw2ICsxNDIzLDEzIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBw
dGVfbmVlZHNfc29mdF9kaXJ0eV93cChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgcHRlX3Qg
cHRlCiAJcmV0dXJuIHZtYV9zb2Z0X2RpcnR5X2VuYWJsZWQodm1hKSAmJiAhcHRlX3NvZnRfZGly
dHkocHRlKTsKIH0KIAorLyogV2hldGhlciBhIGNoYW5nZV9wcm90ZWN0aW9uKCkgb25seSBhZGRz
IHBlcm1pc3Npb25zLiAqLworc3RhdGljIGlubGluZSBib29sIG1tX2NwX2lzX3Blcm1fdXBncmFk
ZSh1bnNpZ25lZCBsb25nIGNwX2ZsYWdzKQoreworCXJldHVybiBjcF9mbGFncyAmIChNTV9DUF9Q
RVJNX1VQR1JBREUgfCBNTV9DUF9VRkZEX1dQX1JFU09MVkUgfAorCQkJICAgTU1fQ1BfVUZGRF9S
V1BfUkVTT0xWRSk7Cit9CisKIC8qIHNocmlua2VyIHJlbGF0ZWQgZnVuY3Rpb25zICovCiB1bnNp
Z25lZCBsb25nIHNocmlua19zbGFiKGdmcF90IGdmcF9tYXNrLCBpbnQgbmlkLCBzdHJ1Y3QgbWVt
X2Nncm91cCAqbWVtY2csCiAJCQkgIGludCBwcmlvcml0eSk7CmRpZmYgLS1naXQgYS9tbS9tcHJv
dGVjdC5jIGIvbW0vbXByb3RlY3QuYwppbmRleCA2ODMxMzFjOWM0YTAuLjE2YjhhZWY3NTVhYiAx
MDA2NDQKLS0tIGEvbW0vbXByb3RlY3QuYworKysgYi9tbS9tcHJvdGVjdC5jCkBAIC0zMDYsNiAr
MzA2LDEwIEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBjaGFuZ2VfcHJlc2VudF9wdGVz
KHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIsCiAJaWYgKHVzZXJmYXVsdGZkX3J3cCh2bWEpICYmIHB0
ZV91ZmZkKHB0ZW50KSkKIAkJcHRlbnQgPSBwdGVfbW9kaWZ5KHB0ZW50LCBQQUdFX05PTkUpOwog
CisJLyogQSBwZXJtaXNzaW9uIHVwZ3JhZGUga2VlcHMgd3JpdGFibGUgZW50cmllcyB3cml0YWJs
ZS4gKi8KKwlpZiAobW1fY3BfaXNfcGVybV91cGdyYWRlKGNwX2ZsYWdzKSAmJiBwdGVfd3JpdGUo
b2xkcHRlKSkKKwkJcHRlbnQgPSBwdGVfbWt3cml0ZShwdGVudCwgdm1hKTsKKwogCS8qCiAJICog
SW4gc29tZSB3cml0YWJsZSwgc2hhcmVkIG1hcHBpbmdzLCB3ZSBtaWdodCB3YW50CiAJICogdG8g
Y2F0Y2ggYWN0dWFsIHdyaXRlIGFjY2VzcyAtLSBzZWUKLS0gCjIuNTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
