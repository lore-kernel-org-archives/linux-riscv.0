Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885006083601
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 17:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PfpwGkPY;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AtWih/Q5;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/1ksPkT9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AtWih/Q5;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/1ksPkT9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kdPcQCAnki2Mqqa+9JFZBGSslVyTYXyzshsaCKcAtww=; b=PfpwGkPYUdzyecti7zsEbvuoar
	W/jk1FoaYP6MQaeoOiLf2lDZAVGMY5fKKj930sDsw8fGWpAY8iw8pamsklLjy7whcxpQkPD43rr9z
	pFrnVCtjgrttDA+dSr4T+RV5OaMvfNPa4xDJ76MDEAKt8IDYmuVYtGEcjiBRyFyeHFqAvfElogxLn
	44YHvSZAZ7jg2FkUO1wIftu6Gn+9fAwR0rjLWqIAHvZ/d8SoCliW6+BKLc4W+mhl1Lck+POBDfkV1
	TR7eJIXsIUYAg+yU4kxV5do17OXOB/GQrEOv0Aa9hlxOMeEv2aa0ARX37hSh9FpK1yjpN5BmB4Ait
	7tAaClRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0pf-00000009jJW-2VbK;
	Thu, 05 Nov 2026 17:01:02 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0pc-00000009jHq-3bAn
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 17:00:58 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 32F211FB3F;
	Thu,  5 Nov 2026 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793898053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wLnVsJjCToHG/C28VTmqNBcIFpk1g6vauHuX2+bvyeo=;
	b=AtWih/Q5UNeIcyR295m20gTBxLNQQlEW/6jV44r/WyqnpGBlFrxfzrmeI4eK5R/FG9mP8B
	5UwO65a5cCQ1VzYek0nbWAcmTzFXkXz50rqaQTjIh5y0Ds3XEVC9sq3K8x0IZsLdslgQ+1
	YvtRNvhR6Xxc9QjvOip6VNdLyvZvEFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793898053;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wLnVsJjCToHG/C28VTmqNBcIFpk1g6vauHuX2+bvyeo=;
	b=/1ksPkT9jyto6rEIVfPDgN8Dim3k3Ljbfr+TqqyZUZIMXx716QVdLySR0RyEa8lGTYD3/4
	QsAvYC5IPlJGx8Aw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="AtWih/Q5";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/1ksPkT9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793898053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wLnVsJjCToHG/C28VTmqNBcIFpk1g6vauHuX2+bvyeo=;
	b=AtWih/Q5UNeIcyR295m20gTBxLNQQlEW/6jV44r/WyqnpGBlFrxfzrmeI4eK5R/FG9mP8B
	5UwO65a5cCQ1VzYek0nbWAcmTzFXkXz50rqaQTjIh5y0Ds3XEVC9sq3K8x0IZsLdslgQ+1
	YvtRNvhR6Xxc9QjvOip6VNdLyvZvEFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793898053;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wLnVsJjCToHG/C28VTmqNBcIFpk1g6vauHuX2+bvyeo=;
	b=/1ksPkT9jyto6rEIVfPDgN8Dim3k3Ljbfr+TqqyZUZIMXx716QVdLySR0RyEa8lGTYD3/4
	QsAvYC5IPlJGx8Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C24CE134F6;
	Thu,  5 Nov 2026 17:00:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HMEkC0K27GqWRwAAD6G6ig:T2
	(envelope-from <clopez@suse.de>); Thu, 05 Nov 2026 17:00:51 +0000
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
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Peter Feiner <pfeiner@google.com>
Subject: [PATCH v2 1/9] mm: fix eager write-bit restore for write-notified shared mappings
Date: Thu,  5 Nov 2026 17:49:58 +0100
Message-ID: <20261105165004.2663799-5-clopez@suse.de>
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
	RCPT_COUNT_TWELVE(0.00)[20];
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
X-Rspamd-Queue-Id: 32F211FB3F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_090057_050688_33F1BE96 
X-CRM114-Status: GOOD (  13.45  )
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
cwp0aGUgd3JpdGUgYml0IGZvciBDb1cgYW5kIHdyaXRlLW5vdGlmaWVkIG1hcHBpbmdzLiBUbyBh
dm9pZApuZWVkbGVzcyB3cml0ZSBmYXVsdHMsIGNhbGxlcnMgc2V0IE1NX0NQX1RSWV9DSEFOR0Vf
V1JJVEFCTEUgd2hlbgp2bWFfd2FudHNfbWFudWFsX3B0ZV93cml0ZV91cGdyYWRlKCkgcmV0dXJu
cyB0cnVlLCBzbyB0aGF0IGVudHJpZXMgdGhhdApjYW4gYmUgd3JpdHRlbiB3aXRob3V0IGEgZmF1
bHQsIHN1Y2ggYXMgZGlydHkgUFRFcyBpbiBhIHNoYXJlZCBtYXBwaW5nLAphcmUgbWFkZSB3cml0
YWJsZSByaWdodCBhd2F5LgoKRm9yIHNoYXJlZCBtYXBwaW5ncywgdGhhdCBmdW5jdGlvbiBwYXNz
ZXMgdm1hLT52bV9wYWdlX3Byb3QgdG8Kdm1hX3dhbnRzX3dyaXRlbm90aWZ5KCkuIE9uY2Ugd3Jp
dGVub3RpZnkgaXMgZW5hYmxlZCwgdGhpcyBwcm90ZWN0aW9uCmxhY2tzIHRoZSB3cml0ZSBiaXQs
IHdoaWxlIHRoZSB2bWFfcGdwcm90X21vZGlmeSgpIHJlc3VsdCBpdCBpcyBjb21wYXJlZAphZ2Fp
bnN0IGFkZHMgaXQgYmFjay4gVGhlIHR3byBuZXZlciBtYXRjaCwgc28gdm1hX3dhbnRzX3dyaXRl
bm90aWZ5KCkKcmV0dXJucyBmYWxzZSBiZWZvcmUgY2hlY2tpbmcgZm9yIHNvZnQtZGlydHksIHVm
ZmQtd3AgYW5kIHdyaXRlYmFjay4KCkFzIGEgcmVzdWx0LCB3cml0ZS1ub3RpZmllZCBzaG1lbSBt
YXBwaW5ncyBuZXZlciBnZXQKTU1fQ1BfVFJZX0NIQU5HRV9XUklUQUJMRSwgYW5kIHRoZWlyIGRp
cnR5IFBURXMgc3RheSByZWFkLW9ubHkgYWZ0ZXIgYQpwcm90ZWN0aW9uIGNoYW5nZS4gRm9yIGV4
YW1wbGUsIGNvbW1pdCA5MzEyOThlMTAzYzIgKCJtbS91c2VyZmF1bHRmZDoKcmVseSBvbiB2bWEt
PnZtX3BhZ2VfcHJvdCBpbiB1ZmZkX3dwX3JhbmdlKCkiKSBtYWRlIHVmZmQtd3AgdW5wcm90ZWN0
CnNldCBNTV9DUF9UUllfQ0hBTkdFX1dSSVRBQkxFIHNvIHRoYXQgZGlydHkgc2htZW0gUFRFcyBi
ZWNvbWUgd3JpdGFibGUKYWdhaW4sIGJ1dCB0aGlzIG5ldmVyIHRha2VzIGVmZmVjdC4gVW5wcm90
ZWN0aW5nIE4gZGlydHkgc2htZW0gcGFnZXMKc3RpbGwgbGVhZHMgdG8gTiBmYXVsdHMgdGhhdCBv
bmx5IHNldCB0aGUgd3JpdGUgYml0LgoKVGhpcyBkYXRlcyBiYWNrIHRvIHRoZSBjb21taXQgaW4g
dGhlIEZpeGVzIHRhZywgd2hpY2ggbW92ZWQgdGhlCmVxdWl2YWxlbnQgY2hlY2sgaW4gbXByb3Rl
Y3RfZml4dXAoKSBiZWZvcmUgdm1hX3NldF9wYWdlX3Byb3QoKS4KCkZpeCB0aGlzIGJ5IHBhc3Np
bmcgdGhlIHByb3RlY3Rpb24gcmVjb21wdXRlZCBmcm9tIHRoZSBWTUEgZmxhZ3MsIGFzCnZtYV9z
ZXRfcGFnZV9wcm90KCkgZG9lcy4gTm90ZSB0aGF0IHRoaXMgaXMgYSBwZXJmb3JtYW5jZS1vbmx5
IGZpeCwgYXMKdGhlIHdyaXRlIGJpdCBpcyByZXN0b3JlZCBvbiB0aGUgbmV4dCBwYWdlIGZhdWx0
IGFueXdheS4KCkZpeGVzOiA2NGU0NTUwNzllMWIgKCJtbTogc29mdGRpcnR5OiBlbmFibGUgd3Jp
dGUgbm90aWZpY2F0aW9ucyBvbiBWTUFzIGFmdGVyIFZNX1NPRlRESVJUWSBjbGVhcmVkIikKU2ln
bmVkLW9mZi1ieTogQ2FybG9zIEzDs3BleiA8Y2xvcGV6QHN1c2UuZGU+Ci0tLQogbW0vdm1hLmgg
fCAyMyArKysrKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlv
bnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbW0vdm1hLmggYi9tbS92bWEuaApp
bmRleCAzZmMzYjQ3YTk1NGIuLmU4MzcwMGUyNDhlNCAxMDA2NDQKLS0tIGEvbW0vdm1hLmgKKysr
IGIvbW0vdm1hLmgKQEAgLTU4OSw2ICs1ODksMTQgQEAgaW50IHNwbGl0X3ZtYShzdHJ1Y3Qgdm1h
X2l0ZXJhdG9yICp2bWksIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAogCSAgICAgIHVuc2ln
bmVkIGxvbmcgYWRkciwgaW50IG5ld19iZWxvdyk7CiAjZW5kaWYKIAorI2lmZGVmIENPTkZJR19N
TVUKK3N0YXRpYyBpbmxpbmUgcGdwcm90X3Qgdm1hX3BncHJvdF9tb2RpZnkocGdwcm90X3Qgb2xk
cHJvdCwgdm1hX2ZsYWdzX3Qgdm1hX2ZsYWdzKQoreworCWNvbnN0IHBncHJvdF90IHByb3QgPSB2
bWFfZmxhZ3NfdG9fcGFnZV9wcm90KHZtYV9mbGFncyk7CisKKwlyZXR1cm4gcGdwcm90X21vZGlm
eShvbGRwcm90LCBwcm90KTsKK30KKwogc3RhdGljIGlubGluZSBib29sIHZtYV93YW50c19tYW51
YWxfcHRlX3dyaXRlX3VwZ3JhZGUoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiB7CiAJLyoK
QEAgLTU5NiwxOSArNjA0LDE2IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCB2bWFfd2FudHNfbWFudWFs
X3B0ZV93cml0ZV91cGdyYWRlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hCiAJICogaWYgd2Ug
Y2FuJ3QgZG8gdGhhdCBhdXRvbWF0aWNhbGx5IGZvciBhbGwgUFRFcyBpbiBhIG1hcHBpbmcuIEZv
cgogCSAqIHByaXZhdGUgbWFwcGluZ3MsIHRoYXQncyBhbHdheXMgdGhlIGNhc2Ugd2hlbiB3ZSBo
YXZlIHdyaXRlCiAJICogcGVybWlzc2lvbnMgYXMgd2UgcHJvcGVybHkgaGF2ZSB0byBoYW5kbGUg
Q09XLgorCSAqCisJICogdm1hLT52bV9wYWdlX3Byb3QgbGFja3MgdGhlIHdyaXRlIGJpdCBpZiB3
cml0ZW5vdGlmeSBpcyBhbHJlYWR5CisJICogZW5hYmxlZCwgc28gcGFzcyBpdCB3aXRoIHRoZSBi
aXRzIHJlc3RvcmVkLCBhcyB2bWFfc2V0X3BhZ2VfcHJvdCgpCisJICogZG9lcy4KIAkgKi8KIAlp
ZiAodm1hLT52bV9mbGFncyAmIFZNX1NIQVJFRCkKLQkJcmV0dXJuIHZtYV93YW50c193cml0ZW5v
dGlmeSh2bWEsIHZtYS0+dm1fcGFnZV9wcm90KTsKKwkJcmV0dXJuIHZtYV93YW50c193cml0ZW5v
dGlmeSh2bWEsCisJCSAgICAgICB2bWFfcGdwcm90X21vZGlmeSh2bWEtPnZtX3BhZ2VfcHJvdCwg
dm1hLT5mbGFncykpOwogCXJldHVybiAhISh2bWEtPnZtX2ZsYWdzICYgVk1fV1JJVEUpOwogfQot
Ci0jaWZkZWYgQ09ORklHX01NVQotc3RhdGljIGlubGluZSBwZ3Byb3RfdCB2bWFfcGdwcm90X21v
ZGlmeShwZ3Byb3RfdCBvbGRwcm90LCB2bWFfZmxhZ3NfdCB2bWFfZmxhZ3MpCi17Ci0JY29uc3Qg
cGdwcm90X3QgcHJvdCA9IHZtYV9mbGFnc190b19wYWdlX3Byb3Qodm1hX2ZsYWdzKTsKLQotCXJl
dHVybiBwZ3Byb3RfbW9kaWZ5KG9sZHByb3QsIHByb3QpOwotfQogI2VuZGlmCiAKIHN0YXRpYyBp
bmxpbmUgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWFfcHJldl9saW1pdChzdHJ1Y3Qgdm1hX2l0
ZXJhdG9yICp2bWksCi0tIAoyLjUxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
