Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631E3606A32C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 17:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xz6zWMQC;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Pei1+gTR;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VbIGDJjm;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=eGgBk4uw;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lv4BOyjX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EHa5Nzd6oeovj+aQrJTC31+cNS1dV6Sc7P22q3+tKng=; b=Xz6zWMQCI16EiPkFiYUPpTmiLo
	qPL1ktRH/4f8XH4VK3oIuy+2JyrdDcB/2HMLzagunR5wblq0oDMYKcmmgTde7N9oxD3AfTHGnQNdI
	lykpF9zdnL1pMAznfi0T4EeUi1Hw+f3l6j2lRX9ZhidNMBKbZjOIg6SHic400TYbc8o0l96Zvi09b
	0tAMuipeRqNAf653h2X1PLTomw9H8WllrOUAAomXezBGkhkUe46I1yJbQgDRfGN3EEfLnbzqS8xy7
	BjHSRu7Gsbg/JQFFN2FFCdeX8zBHBywOSbEKpyrBIZSs1CnFvWQTRl4xtndN2HkKTXM7E1kivmPRK
	m6lPaxdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0qA-00000009jXd-00lg;
	Thu, 05 Nov 2026 17:01:30 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0pq-00000009jMm-1EMJ
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 17:01:18 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E2B3E1FCFB;
	Thu,  5 Nov 2026 17:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793898065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0sIowcuQ5IyfilZxYg4IseA453ZPtAePPTKkUBTmPjo=;
	b=Pei1+gTR/J1zBT1gB2ZeIJQxUCowvgas0b47E0oxSiRyXbqfWcWT9CdLgVofqWdP18Qg1v
	Ma8pSr6pCXEUEOa0V2V7ffs5/4vXBJVhoGTnqrnRVNYJiIbjX4ekZxUb3RcUoicU6NFpCa
	9Dzmz5lgpmD102+OnFKvh/48r+57WtM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793898065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0sIowcuQ5IyfilZxYg4IseA453ZPtAePPTKkUBTmPjo=;
	b=VbIGDJjmTZVhO0JTDSy7XYPe54eMhLayiPZvsUM2mYuCPJZ4FLgK5H77l+InWBrOhXV5GV
	hIZsQZNN4vhg0qBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eGgBk4uw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lv4BOyjX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793898063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0sIowcuQ5IyfilZxYg4IseA453ZPtAePPTKkUBTmPjo=;
	b=eGgBk4uwtc8odIcPkfJnvOhwvShX1Dzp80/Y9+pOvhwx2yg6xph2VIq2YxIEJqjm3b0zp+
	2ES30McqhT6ATAMyAkgShopGIv8d34lgBrlGUnLFvO0HDMHEpHDwCbbcwu22ILKAE+UIC9
	RBUzcteQ4gT3NeSyIoKLjzjert/tTQU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793898063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0sIowcuQ5IyfilZxYg4IseA453ZPtAePPTKkUBTmPjo=;
	b=lv4BOyjX8HinF0YoiV2Xm9Cn46XE9J0/uhYRUvlZz2sLnoHhypKXYcPDivccnQoxvlqcHG
	XlE+f2wiywA7r9AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C9B8133F6;
	Thu,  5 Nov 2026 17:01:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HMEkC0K27GqWRwAAD6G6ig:T9
	(envelope-from <clopez@suse.de>); Thu, 05 Nov 2026 17:01:02 +0000
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
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 8/9] KVM: x86/mmu: don't zap secondary MMU on permission upgrade
Date: Thu,  5 Nov 2026 17:50:05 +0100
Message-ID: <20261105165004.2663799-12-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261105165004.2663799-4-clopez@suse.de>
References: <20261105165004.2663799-4-clopez@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: E2B3E1FCFB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_090110_951915_6E23CBC9 
X-CRM114-Status: GOOD (  12.75  )
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

V2hlbiBhbiBtbXVfbm90aWZpZXIgaW52YWxpZGF0aW9uIG9ubHkgdXBncmFkZXMgcGVybWlzc2lv
bnMKKE1NVV9OT1RJRklFUl9SQU5HRV9QRVJNX1VQR1JBREUpLCBrZWVwIHRoZSBleGlzdGluZyBT
UFRFcyBpbnN0ZWFkIG9mCnphcHBpbmcgdGhlbS4gVGhlIFBGTiBpcyB1bmNoYW5nZWQgYW5kIG5v
IGFjY2VzcyBpcyByZXZva2VkLCBzbyBhbgpleGlzdGluZyBTUFRFIGlzIG5vIG1vcmUgcGVybWlz
c2l2ZSB0aGFuIHRoZSBuZXcgaG9zdCBQVEUuIFBlcm1pc3Npb25zCmZvciB0aGUgU1BURSBhcmUg
dXBkYXRlZCBvbiB0aGUgbmV4dCBmYXVsdCwgc28gZHJvcHBpbmcgdGhlbSBlYXJseQpnYWlucyBu
b3RoaW5nLgoKVGhlIG1vdGl2YXRpbmcgY2FzZSBpcyBhIHVzZXJmYXVsdGZkLXdwIGRpcnR5IHRy
YWNrZXIgc3VjaCBhcyBRRU1VJ3MKYmFja2dyb3VuZCBzbmFwc2hvdCwgd2hpY2ggdW5wcm90ZWN0
cyBldmVyeSBndWVzdCBwYWdlIGFzIGl0IHNhdmVzIGl0LgpaYXBwaW5nIG9uIGVhY2ggdW5wcm90
ZWN0IG1ha2VzIHRoZSBndWVzdCByZWZhdWx0IGl0cyB3aG9sZSB3b3JraW5nCnNldC4gT24gYSA2
NEdCIGd1ZXN0IHVuZGVyIGEgYmFja2dyb3VuZCBzbmFwc2hvdCwgYSByZWFkLW1vc3RseSB3b3Jr
bG9hZApkcm9wcyBzZWNvbmRhcnktTU1VIHJlZmF1bHRzIGZyb20gfjFNL3MgdG8gfjIuNUsvcyBh
bmQgY3Jvc3MtdkNQVSBUTEIKc2hvb3Rkb3ducyBmcm9tIH4xNDAwL3MgdG8gbmVhciB6ZXJvLiBV
c2VzIG9mIG1wcm90ZWN0KCkgdGhhdCBvbmx5IGFkZAphY2Nlc3MgYmVuZWZpdCBsaWtld2lzZS4K
Ck5vdGUgdGhhdCB0aGlzIGFsc28gc2tpcHMgdGhlIEFQSUMtYWNjZXNzIHBhZ2UgcmVsb2FkLCB3
aGljaCBpcyBub3QKbmVlZGVkIGFzIHRoZSBwYWdlJ3MgUEZOIGlzIHVuY2hhbmdlZC4gS1ZNIGRv
ZXMgbm90IHJldHJ5IGEgZmFpbGVkCnJlbG9hZCwgYnV0IHRoYXQgaXNzdWUgaXMgcHJlLWV4aXN0
aW5nIGFuZCB1bnJlbGF0ZWQgdG8gdGhpcyBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBDYXJsb3Mg
TMOzcGV6IDxjbG9wZXpAc3VzZS5kZT4KLS0tCiBhcmNoL3g4Ni9rdm0vbW11L21tdS5jIHwgNyAr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYva3ZtL21tdS9tbXUuYyBiL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKaW5kZXggZjg5ZTlm
OGE2Y2MyLi4zYzkyMzc5YmRiZTAgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9tbXUvbW11LmMK
KysrIGIvYXJjaC94ODYva3ZtL21tdS9tbXUuYwpAQCAtMTcxOSw2ICsxNzE5LDEzIEBAIGJvb2wg
a3ZtX3VubWFwX2dmbl9yYW5nZShzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBrdm1fZ2ZuX3Jhbmdl
ICpyYW5nZSkKIAlsb2NrZGVwX2Fzc2VydF9vbmNlKGt2bS0+bW11X2ludmFsaWRhdGVfaW5fcHJv
Z3Jlc3MgfHwKIAkJCSAgICBsb2NrZGVwX2lzX2hlbGQoJmt2bS0+c2xvdHNfbG9jaykpOwogCisJ
LyoKKwkgKiBEbyBub3QgYm90aGVyIHphcHBpbmcgU1BURXMgaWYgdGhpcyBpcyBvbmx5IGEgcHJv
dGVjdGlvbiB1cGdyYWRlLgorCSAqIFBlcm1pc3Npb25zIHdpbGwgYmUgZmF1bHRlZC1pbiBvbiBk
ZW1hbmQuCisJICovCisJaWYgKHJhbmdlLT5mbGFncyAmIE1NVV9OT1RJRklFUl9SQU5HRV9QRVJN
X1VQR1JBREUpCisJCXJldHVybiBmYWxzZTsKKwogCWlmIChrdm1fbWVtc2xvdHNfaGF2ZV9ybWFw
cyhrdm0pKQogCQlmbHVzaCA9IF9fa3ZtX3JtYXBfemFwX2dmbl9yYW5nZShrdm0sIHJhbmdlLT5z
bG90LAogCQkJCQkJIHJhbmdlLT5zdGFydCwgcmFuZ2UtPmVuZCwKLS0gCjIuNTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
