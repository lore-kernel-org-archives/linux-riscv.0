Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2846A606D83B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 17:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YtUi6KZ+;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=hLxlU5Cc;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8n6XwFS4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lnYTHl2E;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=KR8JqhS8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CL9KHrvgC8oPOl5iUejfR7e5MZYMv3XjmqFnAnZmlDg=; b=YtUi6KZ+3cg3+QPb0DiR8P9Jpp
	oi5ugFTc2Racnd7zw9UC835xTVxVSfzB2N4Zpd1SjkZe099nB9iDSbUPzok+a/pRRqtw30F37NmXN
	g/fvta63jpKW2le+CnJlIyCn3zR6ahP4ytZ4e2sf6+sMbhaaYcb5KZ6HQN44iVwjU8Cgm9Tq1Sv2B
	O0tnErhpY6T8dl58oAXf1z0LJLIgUqpMq850MtBauodyAABWSqAVUHaC0CpxeYBivOHnhi14Dj5Ug
	rsVUYRgqGpB7w1GqULrRk+D2d8TVRJ5pehoODZFneeQllkesDy4X0KU1yqN3AZG6JjK7FrM/kibcA
	xVZHT+kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0pp-00000009jNM-3WTq;
	Thu, 05 Nov 2026 17:01:09 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0pd-00000009jHs-18hL
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 17:01:08 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BEED81FB4B;
	Thu,  5 Nov 2026 17:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793898053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kR3hA/qC7N/4wdgBMp2prE725QVAL7ltGxoTH+1x9yI=;
	b=hLxlU5CcmAtXUBoy8jPKfwAtjRHvR8jGUwmIC8ygTkSOj1nbmSscFvdK3BKF3MyXjJkIAH
	rWF2nfacG3p+6ixd993VTuXeiwzHl8HmgN4FJH1WYAnGKJ/oY+RQ5PjN+Q8yLB+yl5LuCw
	fFw/r8s7tKtee5ZSSlN5LiacdT4+UUI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793898053;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kR3hA/qC7N/4wdgBMp2prE725QVAL7ltGxoTH+1x9yI=;
	b=8n6XwFS4EbwHx9p4FlhtsSje2lzwd1vGEjjtZ2wYf7214kwe/43O/yCmfHjjSElxO2uwlk
	y+r6PnOI9gWExqAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lnYTHl2E;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KR8JqhS8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793898051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kR3hA/qC7N/4wdgBMp2prE725QVAL7ltGxoTH+1x9yI=;
	b=lnYTHl2EqOTto4qZ1S50GiKjWi34+6LyphlZwyEsNpclHCwO8+HsrMA0mYguWw48Fpj/2u
	RRO7UDhpULb2AQsLT+nz1mKQahxa/ZtaJkDqhUH82kfB38VRt6yqq+RZ2NwnxlmHhg7ETp
	9rCX2n0PxD1kiyOEJLWhNIiAtnsNw7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793898051;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kR3hA/qC7N/4wdgBMp2prE725QVAL7ltGxoTH+1x9yI=;
	b=KR8JqhS83a5KFZtq6k09ZkUBNok/kKwUV/UeNPr6uKVmUFEPmly6ft0Lr2HnKlrtKXmdrt
	zeG0FiYs8yZYCSBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E64A133F6;
	Thu,  5 Nov 2026 17:00:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HMEkC0K27GqWRwAAD6G6ig
	(envelope-from <clopez@suse.de>); Thu, 05 Nov 2026 17:00:50 +0000
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
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH v2 0/9] KVM: don't zap secondary MMU on permission upgrade
Date: Thu,  5 Nov 2026 17:49:57 +0100
Message-ID: <20261105165004.2663799-4-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lpc.events:url,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: BEED81FB4B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_090057_567288_95E4A492 
X-CRM114-Status: GOOD (  22.76  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

U3RvcCBLVk0gZnJvbSB6YXBwaW5nIGl0cyBtYXBwaW5ncyBvbiBwZXJtaXNzaW9uIHVwZ3JhZGVz
IG9uIHg4NiBhbmQKczM5MCwgYXMgdGhlc2Uga2VlcCB0aGUgUEZOcyB1bmNoYW5nZWQgYW5kIHJl
dm9rZSBubyBhY2Nlc3MuIEtWTSBmYXVsdHMKaW4gdGhlIG5ldyBwZXJtaXNzaW9ucyBvbiBkZW1h
bmQsIHNvIGRyb3BwaW5nIG1hcHBpbmdzIGVhcmx5IGdhaW5zCm5vdGhpbmcuCgpUbyBkbyBzbywg
YWRkIGFuIE1NVSBub3RpZmllciBmbGFnIHRoYXQgbWFya3MgYW4KTU1VX05PVElGWV9QUk9URUNU
SU9OX1ZNQSBpbnZhbGlkYXRpb24gYXMgYSBzdHJpY3QgcGVybWlzc2lvbiB1cGdyYWRlLgpGb3Ig
dGhlIGZsYWcgdG8gYmUgYWNjdXJhdGUsIGNoYW5nZV9wcm90ZWN0aW9uKCkga2VlcHMgd3JpdGFi
bGUgZW50cmllcwp3cml0YWJsZSBvbiBzdWNoIGNoYW5nZXMuIEEgZmV3IGNhc2VzIHdoZXJlIGl0
IG5lZWRsZXNzbHkgbGVhdmVzIGVudHJpZXMKcmVhZC1vbmx5IGFyZSBmaXhlZCBhbG9uZyB0aGUg
d2F5LgoKQmFja2dyb3VuZAo9PT09PT09PT09CgpjaGFuZ2VfcHJvdGVjdGlvbigpIHBhaXJzIGV2
ZXJ5IHByb3RlY3Rpb24gY2hhbmdlIHdpdGggYW4KTU1VX05PVElGWV9QUk9URUNUSU9OX1ZNQSBp
bnZhbGlkYXRpb24sIGFuZCBLVk0gemFwcyBpdHMgU1BURXMgaW4KcmVzcG9uc2UsIGFzIGl0IGNh
bm5vdCB0ZWxsIHdoZXRoZXIgcGVybWlzc2lvbnMgd2lkZW5lZCBvciBuYXJyb3dlZC4KVGhpcyBp
cyBjb3N0bHksIGUuZy4gZHVyaW5nIGEgUUVNVSBiYWNrZ3JvdW5kIHNuYXBzaG90LCB3aGljaCB1
c2VzCnVmZmQtd3AgdG8gd3JpdGUtcHJvdGVjdCBndWVzdCBSQU0gYW5kIHVucHJvdGVjdHMgZWFj
aCBwYWdlIG9uY2UgaXQgaXMKc2F2ZWQuIEV2ZXJ5IHVucHJvdGVjdCB0aGVuIG1ha2VzIHRoZSBn
dWVzdCByZWZhdWx0IG1lbW9yeSBpdCBjb3VsZAphbHJlYWR5IGFjY2Vzcy4KClNlY29uZGFyeSBN
TVVzIHRoYXQgc2hhcmUgdGhlIENQVSBwYWdlIHRhYmxlcyAoZS5nLiBBUk0gU01NVSwKSU9NTVUv
QVRTKSBjYW4ga2VlcCByZWFkLW9ubHkgZW50cmllcyBpbiB0aGVpciBUTEJzIHRoYXQgYSBmYXVs
dCBkb2VzCm5vdCBmbHVzaCwgc28gdGhleSBhcmUgYWxyZWFkeSBub3RpZmllZCBvZiBwZXJtaXNz
aW9uIHVwZ3JhZGVzIG9uIHRoZQpDUFUgVExCIGZsdXNoIHBhdGggWzFdLiBLVk0ga2VlcHMgaXRz
IG93biBwYWdlIHRhYmxlcyBhbmQgZmF1bHRzIGluCnBlcm1pc3Npb25zIG9uIGRlbWFuZCwgc28g
aXQgbmVlZHMgbm8gbm90aWZpY2F0aW9uLCBhcyBTZWFuIG5vdGVkIHdoZW4KdGhhdCBzaWduYWxs
aW5nIHdhcyBmaXJzdCBwcm9wb3NlZCBbMl0uCgpOb3RlOiB0aGUgbm90aWZpY2F0aW9uIGNhbm5v
dCBzaW1wbHkgYmUgc2tpcHBlZCBpbiBNTSBjb2RlIChzZWUgWzNdKS4KU2Vjb25kYXJ5IE1NVXMg
dGhhdCBrZWVwIHRoZWlyIG93biBwYWdlIHRhYmxlcyBidXQgY2Fubm90IGZhdWx0IHJlbHkgb24K
aXQgdG8gcGljayB1cCB0aGUgbmV3IHBlcm1pc3Npb25zLiBBIGZsYWcgbGV0cyBlYWNoIHVzZXIg
b3B0IGluIGluc3RlYWQuCgpTZXJpZXMgb3ZlcnZpZXcKPT09PT09PT09PT09PT09CgpQYXRjaGVz
IDEtMyBmaXggY2FzZXMgd2hlcmUgY2hhbmdlX3Byb3RlY3Rpb24oKSBsZWF2ZXMgZW50cmllcwpy
ZWFkLW9ubHkgZXZlbiB0aG91Z2ggdGhlIHdyaXRlIGZhdWx0IGhhbmRsZXIgd291bGQgbWFrZSB0
aGVtIHdyaXRhYmxlCndpdGhvdXQgZnVydGhlciBjaGVja3MuIFRoZXkgYXJlIHBlcmZvcm1hbmNl
IGZpeGVzIG9uIHRoZWlyIG93biBhbmQKY2FuIGJlIHBpY2tlZCB1cCBpbmRlcGVuZGVudGx5LgoK
UGF0Y2hlcyA0LTYgYWRkIE1NX0NQX1BFUk1fVVBHUkFERSBmb3IgbXByb3RlY3QoKSBjYWxscyB0
aGF0IG9ubHkgYWRkCnBlcm1pc3Npb25zLCBrZWVwIHdyaXRhYmxlIGVudHJpZXMgd3JpdGFibGUg
b24gdGhlc2UgYW5kIG9uIHVzZXJmYXVsdGZkCnVucHJvdGVjdHMsIGFuZCBhZGQgTU1VX05PVElG
SUVSX1JBTkdFX1BFUk1fVVBHUkFERS4KClBhdGNoZXMgNy05IHBhc3MgdGhlIE1NVSBub3RpZmll
ciBldmVudCBhbmQgZmxhZ3MgdG8gS1ZNIGFuZCBza2lwIHRoZQp6YXAgb24geDg2IGFuZCBzMzkw
LgoKQ29uc2lkZXJhdGlvbnMKPT09PT09PT09PT09PT0KCjEuIFRoaXMgc2VyaWVzIGNvdmVycyBv
bmx5IHg4NiBhbmQgczM5MC4gQ2xhdWRpbyBjb25maXJtZWQgdGhhdAogICBza2lwcGluZyB0aGUg
emFwIHNob3VsZCBiZSBzYWZlIG9uIHMzOTAgYW5kIG9mZmVyZWQgdG8gdGVzdCBpdCBbNF0sCiAg
IHNvIHBhdGNoIDkgaXMgb25seSBjb21waWxlLXRlc3RlZC4gT3RoZXIgYXJjaGl0ZWN0dXJlcyBz
aG91bGQgYmUKICAgYWJsZSB0byBza2lwIGl0IGFzIHdlbGwsIGJ1dCBJIGhhdmUgbm90IHRlc3Rl
ZCBvciBiZW5jaG1hcmtlZAogICB0aGVtLiBNb3ZpbmcgdGhlIGNvZGUgdG8gYXJjaC1pbmRlcGVu
ZGVudCBLVk0gd291bGQgYWxzbyBhdm9pZCB0aGUKICAgU0VWIGNhY2hlIGZsdXNoIGluIGt2bV9h
cmNoX2d1ZXN0X21lbW9yeV9yZWNsYWltZWQoKS4KCjIuIHN0cnVjdCBrdm1fZ2ZuX3JhbmdlIGNh
cnJpZXMgdGhlIE1NVSBub3RpZmllciBldmVudCBhbmQgZmxhZ3MsIGFzCiAgIGFncmVlZCBhdCBM
UEMgWzVdIGFuZCBwcm9wb3NlZCBpbiB0aGUgcGFzdCBmb3Igb3RoZXIgcHVycG9zZXMKICAgWzZd
IFs3XS4gVGhlIGZpZWxkcyBhcmUgb25seSBzZXQgZm9yIE1NVSBub3RpZmllciBpbnZhbGlkYXRp
b25zLgoKMy4gV3JpdGFibGUgbWlncmF0aW9uIGFuZCBkZXZpY2UtcHJpdmF0ZSBlbnRyaWVzIGFy
ZSBzdGlsbCBtYWRlCiAgIHJlYWQtb25seSBvbiBhIHBlcm1pc3Npb24gdXBncmFkZS4gVGhpcyBk
b2VzIG5vdCBhZmZlY3Qgc2Vjb25kYXJ5CiAgIE1NVXMgKHNlZSBwYXRjaCA2KSwgYnV0IHRoZSBk
b3duZ3JhZGUgY291bGQgYmUgc2tpcHBlZCBhcyB3ZWxsIGlmCiAgIHByZWZlcnJlZC4KCjQuIGh1
Z2V0bGIgZG9lcyBub3QgYmVuZWZpdCwgYXMgaHVnZXRsYl9jaGFuZ2VfcHJvdGVjdGlvbigpIGRv
ZXMKICAgbm90IHJlc3RvcmUgdGhlIHdyaXRlIGJpdCBhbmQgbWF5IHVuc2hhcmUgcGFnZSB0YWJs
ZXMgKHNlZSBwYXRjaCA2KS4KCjUuIFRoZSBub3RpZmljYXRpb24gY2Fubm90IHNpbXBseSBiZSBz
a2lwcGVkIGluIE1NIGNvZGUgKHNlZSBbM10pLgogICBTZWNvbmRhcnkgTU1VcyB0aGF0IGtlZXAg
dGhlaXIgb3duIHBhZ2UgdGFibGVzIGJ1dCBjYW5ub3QgZmF1bHQKICAgcmVseSBvbiBpdCB0byBw
aWNrIHVwIG5ldyBwZXJtaXNzaW9ucy4gQSBmbGFnIGxldHMgZWFjaCB1c2VyIG9wdAogICBpbiBp
bnN0ZWFkLgoKQmVuY2htYXJrcwo9PT09PT09PT09CgpUaGVzZSB3ZXJlIG1lYXN1cmVkIG9uIHYx
LgoKQU1EIEVQWUMgOTY1NCA5Ni1Db3JlIFByb2Nlc3NvciBob3N0IHJ1bm5pbmcgYSByZWNlbnQg
TGludXgga2VybmVsCig2YjRiNTQzZmExODcpLCB3aXRoIGEgNjRHQiwgNjQtdkNQVSBndWVzdCBy
dW5uaW5nIHN0cmVzcy1uZyAtLXZtIHdoaWxlCnRoZSBob3N0IHRha2VzIGEgUUVNVSBiYWNrZ3Jv
dW5kIHNuYXBzaG90LiBSZXN1bHRzIGFyZSBhZ2dyZWdhdGVkIG92ZXIKNSBydW5zIG9uIGEgc3Rv
Y2sga2VybmVsIGFuZCBvbiBvbmUgd2l0aCB0aGlzIHNlcmllcywgcmVib290aW5nIHRoZQpndWVz
dCBiZXR3ZWVuIHJ1bnMsIHdpdGggTlVNQSBiYWxhbmNpbmcgZGlzYWJsZWQuCgpwZi9zIGFuZCB0
bGIvcyAocGVyLXNlY29uZCBkZWx0YXMgb2YgS1ZNJ3MgcGZfdGFrZW4gYW5kIHJlbW90ZV90bGJf
Zmx1c2gKZGVidWdmcyBzdGF0cyk6CgogIGd1ZXN0IHBhdHRlcm4gICAgICAgICAgYmFzZWxpbmUg
ICAgICAgICAgICAgICAgICAgIHBhdGNoZWQKICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogIHJlYWQ2NCAgIChy
ZWFkKSAgICAgICAgcGYvcz05NTAsMDE1ICAgdGxiL3M9MSw0NDAgIHBmL3M9Miw1MDMgdGxiL3M9
MC4xCiAgcmFuZC1zZXQgKHJlYWQrd3JpdGUpICBwZi9zPTEsMDA0LDM1MyB0bGIvcz04NjIgICAg
cGYvcz00LDA3MyB0bGIvcz0wLjMKICB3cml0ZTY0ICAod3JpdGUpICAgICAgIHBmL3M9OTY4LDAx
OCAgIHRsYi9zPTk0ICAgICBwZi9zPTIsMjkyIHRsYi9zPTAuMwoKR3Vlc3QgcmVhZCBsYXRlbmN5
IHdhcyBzYW1wbGVkIHdpdGggYSBwYWNlZCBwcm9iZSB0aHJlYWQgaW4gdGhlIGd1ZXN0LApyZWFk
aW5nIG9uZSBieXRlIHBlciBwYWdlIHdpdGggYW4gaWRsZSBnYXAgYmV0d2VlbiByZWFkcywgd2hp
bGUKc3RyZXNzLW5nIHJhbiB3aXRoIHJlYWQ2NC4gRWFjaCBmaWd1cmUgaXMgdGhlIG1lZGlhbiBh
Y3Jvc3MgNSBydW5zLCB3aXRoCnRoZSBydW4tdG8tcnVuIG1pbiBhbmQgbWF4LCBpbiBuczoKCiAg
bWV0cmljICAgICAgICAgICBiYXNlbGluZSAgICAgICAgICAgICBwYXRjaGVkCiAgLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAgcDUwIChtaW4g
bWF4KSAgICAgIDM0MCAgICAgKDI3MCAzODApICAgMjYwICAgKDI1MCAyNjApCiAgcDk5IChtaW4g
bWF4KSAgICAxOTc4OSAoMTY4ODUgMjAyMDApICA1MjA3ICg0MDc2IDU2MzgpCiAgcDk5LjkgKG1p
biBtYXgpICAyMzQ0NSAoMjI4NDUgMjQwMzYpICA2ODUwICg2MjU5IDcxMTApCgpUaGUgbWVkaWFu
IGltcHJvdmVzIG1vZGVzdGx5LCB3aGlsZSBwOTkgZHJvcHMgfjMuOHguCgpBIHNlcGFyYXRlIHN0
cmVzcy1uZyBydW4gd2l0aCB3cml0ZTY0IGFuZCAtLXZlcmlmeSBzaG93ZWQgbm8gZGF0YQpjb3Jy
dXB0aW9uIGFuZCBubyBsaXZlbG9ja3MuCgpDaGFuZ2VzIGluIHYyCj09PT09PT09PT09PT0KCi0g
TmV3IHBhdGNoIDE6IGZpeCBzZXR0aW5nIE1NX0NQX1RSWV9DSEFOR0VfV1JJVEFCTEUgZm9yIHNo
bWVtIHdpdGgKICB1ZmZkLXdwIG9yIHNvZnQtZGlydHkgKFNhc2hpa28pLgotIE5ldyBwYXRjaGVz
IDItMzogaG9ub3IgTU1fQ1BfVFJZX0NIQU5HRV9XUklUQUJMRSBpbiBjaGFuZ2VfaHVnZV9wdWQo
KSwKICBhZGRpbmcgcHVkX3NvZnRfZGlydHkoKSBvbiByaXNjdiAoU2FzaGlrbykuCi0gUGF0Y2gg
NCAod2FzIDEpOiBvbmx5IHRyZWF0IGNoYW5nZXMgdG8gdGhlIHJlYWQsIHdyaXRlIGFuZCBleGVj
dXRlCiAgZmxhZ3MgYXMgYW4gdXBncmFkZSwgcGx1cyBWTV9BQ0NPVU5UIChTYXNoaWtvKS4KLSBO
ZXcgcGF0Y2ggNToga2VlcCB3cml0YWJsZSBlbnRyaWVzIHdyaXRhYmxlIG9uIHBlcm1pc3Npb24g
dXBncmFkZXMKICAoU2FzaGlrbykuCi0gUGF0Y2ggNiAod2FzIDIpOiBkb24ndCBzZXQgdGhlIGZs
YWcgZm9yIGh1Z2V0bGIgKFNhc2hpa28pLgotIFBhdGNoIDcgKHdhcyAzKTogcGFzcyB0aGUgTU1V
IG5vdGlmaWVyIGV2ZW50IGFuZCBmbGFncyBpbnN0ZWFkIG9mIGEKICBib29sIChDbGF1ZGlvKS4K
LSBQYXRjaCA4ICh3YXMgNCk6IGNoZWNrIHRoZSBmbGFnIGluIHJhbmdlLT5mbGFncy4gVGhlIEFQ
SUMtYWNjZXNzIHBhZ2UKICByZWxvYWQgaXNzdWUgdGhhdCBTYXNoaWtvIHBvaW50ZWQgb3V0IGlz
IHByZS1leGlzdGluZy4KLSBOZXcgcGF0Y2ggOTogc2tpcCB0aGUgdW5tYXAgb24gczM5MCBhcyB3
ZWxsIChDbGF1ZGlvKS4KCnYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjEwMjkx
NDMzMzYuMzkwMjMxLTMtY2xvcGV6QHN1c2UuZGUvCgpSZWZlcmVuY2VzCj09PT09PT09PT0KClsx
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbS9jb3Zlci4xZWNhMDI5Yjg2MDNlZjRl
ZWJlNWI0MWVhZTUxZmFjZmM1OTIwYzQxLjE2OTAyOTI0NDAuZ2l0LXNlcmllcy5hcG9wcGxlQG52
aWRpYS5jb20vClsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbS9aR3UxdnNic2Nk
TzQ4VjZoQGdvb2dsZS5jb20vClszXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvN2JhMmNh
NjUtMWVhYi00MGZkLWFlNGMtZjdjZDllMTU2ZDhjQHN1c2UuZGUvCls0XSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyNjEwMzAxMzM5MzkuNjMwZTI5YWZAcC1pbWJyZW5kYS8KWzVdIGh0
dHBzOi8vbHBjLmV2ZW50cy9ldmVudC8yMC9jb250cmlidXRpb25zLzI1NTIvCls2XSBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA4MDExODM0NTMuNTcxOTktMS1zZWFuamNAZ29vZ2xl
LmNvbQpbN10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMxMTEwMDAzNzM0LjEwMTQw
ODQtMS1qYWNreWxpQGdvb2dsZS5jb20KCkNhcmxvcyBMw7NwZXogKDkpOgogIG1tOiBmaXggZWFn
ZXIgd3JpdGUtYml0IHJlc3RvcmUgZm9yIHdyaXRlLW5vdGlmaWVkIHNoYXJlZCBtYXBwaW5ncwog
IHJpc2N2OiBtbTogYWRkIHB1ZF9zb2Z0X2RpcnR5KCkKICBtbS9odWdlX21lbW9yeTogaG9ub3Ig
TU1fQ1BfVFJZX0NIQU5HRV9XUklUQUJMRSBpbiBjaGFuZ2VfaHVnZV9wdWQoKQogIG1tL21wcm90
ZWN0OiBhZGQgTU1fQ1BfUEVSTV9VUEdSQURFCiAgbW0vbXByb3RlY3Q6IGtlZXAgd3JpdGFibGUg
ZW50cmllcyB3cml0YWJsZSBvbiBwZXJtaXNzaW9uIHVwZ3JhZGVzCiAgbW0vbW11X25vdGlmaWVy
OiBhZGQgTU1VX05PVElGSUVSX1JBTkdFX1BFUk1fVVBHUkFERQogIEtWTTogcGFzcyB0aGUgbW11
X25vdGlmaWVyIGV2ZW50IGFuZCBmbGFncyB0byBrdm1fZ2ZuX3JhbmdlCiAgS1ZNOiB4ODYvbW11
OiBkb24ndCB6YXAgc2Vjb25kYXJ5IE1NVSBvbiBwZXJtaXNzaW9uIHVwZ3JhZGUKICBLVk06IHMz
OTA6IGRvbid0IHVubWFwIHRoZSBnbWFwIG9uIHBlcm1pc3Npb24gdXBncmFkZQoKIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgIDUgKysrKysKIGFyY2gvczM5MC9rdm0vYXJtNjQv
YXJtLmMgICAgICAgIHwgIDcgKysrKysrKwogYXJjaC9zMzkwL2t2bS9zMzkwL3MzOTAuYyAgICAg
ICAgfCAgNyArKysrKysrCiBhcmNoL3g4Ni9rdm0vbW11L21tdS5jICAgICAgICAgICB8ICA3ICsr
KysrKysKIGluY2x1ZGUvbGludXgva3ZtX2hvc3QuaCAgICAgICAgIHwgIDMgKysrCiBpbmNsdWRl
L2xpbnV4L21tLmggICAgICAgICAgICAgICB8ICAyICsrCiBpbmNsdWRlL2xpbnV4L21tdV9ub3Rp
Zmllci5oICAgICB8ICA1ICsrKysrCiBpbmNsdWRlL2xpbnV4L3BndGFibGUuaCAgICAgICAgICB8
ICA1ICsrKysrCiBtbS9odWdlX21lbW9yeS5jICAgICAgICAgICAgICAgICB8IDM1ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystCiBtbS9odWdldGxiLmMgICAgICAgICAgICAgICAgICAg
ICB8ICA0ICsrKysKIG1tL2ludGVybmFsLmggICAgICAgICAgICAgICAgICAgIHwgIDcgKysrKysr
KwogbW0vbXByb3RlY3QuYyAgICAgICAgICAgICAgICAgICAgfCAyMiArKysrKysrKysrKysrKysr
KystLQogbW0vdm1hLmggICAgICAgICAgICAgICAgICAgICAgICAgfCAyMyArKysrKysrKysrKysr
LS0tLS0tLS0KIHZpcnQva3ZtL2t2bV9tYWluLmMgICAgICAgICAgICAgIHwgIDggKysrKysrKysK
IDE0IGZpbGVzIGNoYW5nZWQsIDEyOCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCi0t
IAoyLjUxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
