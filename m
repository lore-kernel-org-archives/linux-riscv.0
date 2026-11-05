Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE7F606D83C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 17:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AaRdJpFZ;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=o2rewCfA;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gNOFwnmK;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=o2rewCfA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gNOFwnmK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PU7hJO2mbjNYOh2lNwlzZoMpSe7Bp7/VFPQFLoMiztw=; b=AaRdJpFZh2Q03ZKDDymmF80MrP
	dHU56uEGLSD3Mv2axkmoO37ohE3cFdv7opZB8h8xTYgYleIwxY/FDUlyigcAAtM2oFyghWmFK8X4j
	5CwFPuUUkT2BPDoX+9ICFNQeAblX2Yc7o33sQf6O87i+JwtbhqQh8IF1JgOsszqJjhYuhQd1YWJic
	iE3rGThDKfp3ZGyQhKJp4IoJkJZoTaKa4lowVIsJPHj77+zZTghcj53S7QvVl/ldH79fGbq7aRmGx
	Vce2kYR4fJJXHDdWb1g0hZsPLZigydobyaDfm8MfLE5A0YcIf3KWtqQGxo9UsNnnltp94uZpL+2cP
	PUspWZDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0q9-00000009jX2-2M3h;
	Thu, 05 Nov 2026 17:01:29 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0pm-00000009jLT-3mnT
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 17:01:17 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5FE6D22937;
	Thu,  5 Nov 2026 17:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793898065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJ4YMgar/+f3xch1CQmR84D/AWFtiNZ8AwAhZEnWX4g=;
	b=o2rewCfAnbi1hi0MofFMdb9Ixx8NBxq97b3E5eyBcNFiBDcnEHA/FcNJrljUp4KAPbfEuN
	MO7dqjK5dOd0b+XN3ue2BGEy1uOew2ZFUM7ucie5f0BEUHakLT+5Oxhlpe9roQPHm+E6Nc
	QXqStp0DXuqg2djuEq5GdV7OvbrQtyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793898065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJ4YMgar/+f3xch1CQmR84D/AWFtiNZ8AwAhZEnWX4g=;
	b=gNOFwnmKOfXqFUyiXGIpJJR+IwTNMewBrh/2d7AdIwYvDM6h85yo91Qf+wKyAI2vats1dw
	WdwdsPOSHQyQngBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793898065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJ4YMgar/+f3xch1CQmR84D/AWFtiNZ8AwAhZEnWX4g=;
	b=o2rewCfAnbi1hi0MofFMdb9Ixx8NBxq97b3E5eyBcNFiBDcnEHA/FcNJrljUp4KAPbfEuN
	MO7dqjK5dOd0b+XN3ue2BGEy1uOew2ZFUM7ucie5f0BEUHakLT+5Oxhlpe9roQPHm+E6Nc
	QXqStp0DXuqg2djuEq5GdV7OvbrQtyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793898065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJ4YMgar/+f3xch1CQmR84D/AWFtiNZ8AwAhZEnWX4g=;
	b=gNOFwnmKOfXqFUyiXGIpJJR+IwTNMewBrh/2d7AdIwYvDM6h85yo91Qf+wKyAI2vats1dw
	WdwdsPOSHQyQngBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 16CD5134F6;
	Thu,  5 Nov 2026 17:01:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HMEkC0K27GqWRwAAD6G6ig:T10
	(envelope-from <clopez@suse.de>); Thu, 05 Nov 2026 17:01:04 +0000
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
Subject: [PATCH v2 9/9] KVM: s390: don't unmap the gmap on permission upgrade
Date: Thu,  5 Nov 2026 17:50:06 +0100
Message-ID: <20261105165004.2663799-13-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261105165004.2663799-4-clopez@suse.de>
References: <20261105165004.2663799-4-clopez@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLmtzipbxtgehzutu1qae44kxg)];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -12.30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_090108_175419_92EDD8B5 
X-CRM114-Status: GOOD (  10.72  )
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

V2hlbiBhbiBtbXVfbm90aWZpZXIgaW52YWxpZGF0aW9uIG9ubHkgdXBncmFkZXMgcGVybWlzc2lv
bnMKKE1NVV9OT1RJRklFUl9SQU5HRV9QRVJNX1VQR1JBREUpLCBrZWVwIHRoZSBleGlzdGluZyBn
bWFwIGVudHJpZXMKaW5zdGVhZCBvZiB1bm1hcHBpbmcgdGhlbS4gVGhlIFBGTiBpcyB1bmNoYW5n
ZWQgYW5kIG5vIGFjY2VzcyBpcwpyZXZva2VkLCBzbyBhbiBleGlzdGluZyBlbnRyeSBpcyBubyBt
b3JlIHBlcm1pc3NpdmUgdGhhbiB0aGUgbmV3IGhvc3QKUFRFLgoKQSB3cml0ZSB0byBhbiBlbnRy
eSB0aGF0IGlzIHN0aWxsIHJlYWQtb25seSBjYXVzZXMgYSBwcm90ZWN0aW9uCmV4Y2VwdGlvbiwg
d2hpY2gga3ZtX3MzOTBfZmF1bHRpbl9nZm4oKSBoYW5kbGVzIGFzIGEgd3JpdGUgZmF1bHQsCnBp
Y2tpbmcgdXAgdGhlIG5ldyBwZXJtaXNzaW9ucy4gVGhpcyBhcHBsaWVzIHRvIGJvdGggczM5MCBh
bmQgYXJtNjQKZ3Vlc3RzLgoKU2lnbmVkLW9mZi1ieTogQ2FybG9zIEzDs3BleiA8Y2xvcGV6QHN1
c2UuZGU+Ci0tLQogYXJjaC9zMzkwL2t2bS9hcm02NC9hcm0uYyB8IDcgKysrKysrKwogYXJjaC9z
MzkwL2t2bS9zMzkwL3MzOTAuYyB8IDcgKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9zMzkwL2t2bS9hcm02NC9hcm0uYyBiL2FyY2gv
czM5MC9rdm0vYXJtNjQvYXJtLmMKaW5kZXggYmQ5ZDg1MjM1ZjQzLi41YWVlMTgxN2FhZDggMTAw
NjQ0Ci0tLSBhL2FyY2gvczM5MC9rdm0vYXJtNjQvYXJtLmMKKysrIGIvYXJjaC9zMzkwL2t2bS9h
cm02NC9hcm0uYwpAQCAtNjc4LDYgKzY3OCwxMyBAQCB2b2lkIGt2bV9hcmNoX2NvbW1pdF9tZW1v
cnlfcmVnaW9uKHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqb2xkLAog
CiBib29sIGt2bV91bm1hcF9nZm5fcmFuZ2Uoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX2dm
bl9yYW5nZSAqcmFuZ2UpCiB7CisJLyoKKwkgKiBEbyBub3QgYm90aGVyIHVubWFwcGluZyBpZiB0
aGlzIGlzIG9ubHkgYSBwcm90ZWN0aW9uIHVwZ3JhZGUuCisJICogUGVybWlzc2lvbnMgd2lsbCBi
ZSBmYXVsdGVkLWluIG9uIGRlbWFuZC4KKwkgKi8KKwlpZiAocmFuZ2UtPmZsYWdzICYgTU1VX05P
VElGSUVSX1JBTkdFX1BFUk1fVVBHUkFERSkKKwkJcmV0dXJuIGZhbHNlOworCiAJcmV0dXJuIGdt
YXBfdW5tYXBfZ2ZuX3JhbmdlKGt2bS0+YXJjaC5nbWFwLCByYW5nZS0+c2xvdCwgcmFuZ2UtPnN0
YXJ0LCByYW5nZS0+ZW5kKTsKIH0KIApkaWZmIC0tZ2l0IGEvYXJjaC9zMzkwL2t2bS9zMzkwL3Mz
OTAuYyBiL2FyY2gvczM5MC9rdm0vczM5MC9zMzkwLmMKaW5kZXggMThmYjIwMGY4NTRhLi45NTRi
ZjZiNjQ2ODMgMTAwNjQ0Ci0tLSBhL2FyY2gvczM5MC9rdm0vczM5MC9zMzkwLmMKKysrIGIvYXJj
aC9zMzkwL2t2bS9zMzkwL3MzOTAuYwpAQCAtNTg3MSw2ICs1ODcxLDEzIEBAIGJvb2wga3ZtX2Fn
ZV9nZm4oc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX2dmbl9yYW5nZSAqcmFuZ2UpCiAgKi8K
IGJvb2wga3ZtX3VubWFwX2dmbl9yYW5nZShzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBrdm1fZ2Zu
X3JhbmdlICpyYW5nZSkKIHsKKwkvKgorCSAqIERvIG5vdCBib3RoZXIgdW5tYXBwaW5nIGlmIHRo
aXMgaXMgb25seSBhIHByb3RlY3Rpb24gdXBncmFkZS4KKwkgKiBQZXJtaXNzaW9ucyB3aWxsIGJl
IGZhdWx0ZWQtaW4gb24gZGVtYW5kLgorCSAqLworCWlmIChyYW5nZS0+ZmxhZ3MgJiBNTVVfTk9U
SUZJRVJfUkFOR0VfUEVSTV9VUEdSQURFKQorCQlyZXR1cm4gZmFsc2U7CisKIAlyZXR1cm4gZ21h
cF91bm1hcF9nZm5fcmFuZ2Uoa3ZtLT5hcmNoLmdtYXAsIHJhbmdlLT5zbG90LCByYW5nZS0+c3Rh
cnQsIHJhbmdlLT5lbmQpOwogfQogCi0tIAoyLjUxLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
