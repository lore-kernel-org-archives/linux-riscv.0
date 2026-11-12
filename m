Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5860460703A6
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 14:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rmUcCtNS;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IJ1JzRmh;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pcu88trj;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IJ1JzRmh;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pcu88trj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BdTVm8VLy2dffpC1sVYC7reiYHpxBd109QbQykvf4wM=; b=rmUcCtNSjaXpDbiVWOBaeD+Y9B
	tqBl2Xaxet+aAPOFTa+pv5WRYt4cCqiELMatjiYD+CKX+RsLiumivh8KvVzgwX2Ch0wbHdOwyfsLY
	NVozCOWNbmWa7b4fP+Ehc2B11JBRorrbGdeYOq/0qcqqnwfQfvr83X97yqBueoUSVs8CgkZn/en7g
	XSgn95Lj/mXVf+x15Zdix3QEDTHOPmzlQ92VbN85uIiPjAgRoNUYxH4/Im5NzUJnbfsOxz/eV07tq
	XOWyfo/NzD67Y4dzJoJVDkriv36FsAGmdXREudsv6548aQ0Vf5uA1/8OjNv8J27g+M3yIpwPvzWy0
	8LeuYhzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVkC-0000000AF7f-0Omn;
	Thu, 12 Nov 2026 14:25:40 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVk8-0000000AF4r-19QY
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 14:25:37 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2297F1F8B4;
	Thu, 12 Nov 2026 14:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794493533; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fSNuCMsN1VNgtr3D4qnj+zDeO7DxOLUKfJqgOoVCVPU=;
	b=IJ1JzRmhJB+1jyg5pCgn5nlsjCZQQcblG2IgVIsUEyxmDSn8wbK/iDhbqzwvP4PQj8JFF2
	XkLhsnaARIvc9iasv/O8vDYAqgAizdDeAMQSBG83PnKfbHi86DLayceFpiiniA8zZr0JQZ
	kZ7WA1Mfh5AGJUs8JY7Xr7QmGVd4nfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794493533;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fSNuCMsN1VNgtr3D4qnj+zDeO7DxOLUKfJqgOoVCVPU=;
	b=pcu88trjNhOJVGCafuuVQ5n9cn/S2UvWpMZdS+iHleTTMFEQhC7gpSLC/y+B8VP/75G/t6
	BfmLZW/EyrOPx5Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794493533; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fSNuCMsN1VNgtr3D4qnj+zDeO7DxOLUKfJqgOoVCVPU=;
	b=IJ1JzRmhJB+1jyg5pCgn5nlsjCZQQcblG2IgVIsUEyxmDSn8wbK/iDhbqzwvP4PQj8JFF2
	XkLhsnaARIvc9iasv/O8vDYAqgAizdDeAMQSBG83PnKfbHi86DLayceFpiiniA8zZr0JQZ
	kZ7WA1Mfh5AGJUs8JY7Xr7QmGVd4nfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794493533;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fSNuCMsN1VNgtr3D4qnj+zDeO7DxOLUKfJqgOoVCVPU=;
	b=pcu88trjNhOJVGCafuuVQ5n9cn/S2UvWpMZdS+iHleTTMFEQhC7gpSLC/y+B8VP/75G/t6
	BfmLZW/EyrOPx5Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F14A0134F4;
	Thu, 12 Nov 2026 14:25:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id w9GzDFnM9WoAPwAAD6G6ig:T3
	(envelope-from <clopez@suse.de>); Thu, 12 Nov 2026 14:25:31 +0000
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
Subject: [PATCH v3 2/9] riscv: mm: add pud_soft_dirty()
Date: Thu, 12 Nov 2026 15:20:31 +0100
Message-ID: <20261112142039.907090-4-clopez@suse.de>
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
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLpaod1bh3ffbsf8emkm3npqp6)];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -16.30
X-Spam-Level: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_062536_466854_1646E63B 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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

cmlzY3Ygc3VwcG9ydHMgc29mdC1kaXJ0eSBhbmQgUFVELXNpemVkIHRyYW5zcGFyZW50IGh1Z2Ug
cGFnZXMsIGJ1dCBvbmx5CnByb3ZpZGVzIHBtZF9zb2Z0X2RpcnR5KCkgYW5kIG5vdCBwdWRfc29m
dF9kaXJ0eSgpLiBBZGQgaXQsIHNvIGdlbmVyaWMKY29kZSBjYW4gY2hlY2sgdGhlIHNvZnQtZGly
dHkgYml0IG9mIGEgaHVnZSBQVUQuCgpTaWduZWQtb2ZmLWJ5OiBDYXJsb3MgTMOzcGV6IDxjbG9w
ZXpAc3VzZS5kZT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCB8IDUgKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJs
ZS5oCmluZGV4IDJlYmQ1ZmE1YWRjNS4uNDA4OTBmNTFkZWM2IDEwMDY0NAotLS0gYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Bn
dGFibGUuaApAQCAtOTQ5LDYgKzk0OSwxMSBAQCBzdGF0aWMgaW5saW5lIHBtZF90IHBtZF9jbGVh
cl9zb2Z0X2RpcnR5KHBtZF90IHBtZCkKIAlyZXR1cm4gcHRlX3BtZChwdGVfY2xlYXJfc29mdF9k
aXJ0eShwbWRfcHRlKHBtZCkpKTsKIH0KIAorc3RhdGljIGlubGluZSBib29sIHB1ZF9zb2Z0X2Rp
cnR5KHB1ZF90IHB1ZCkKK3sKKwlyZXR1cm4gcHRlX3NvZnRfZGlydHkocHVkX3B0ZShwdWQpKTsK
K30KKwogI2lmZGVmIENPTkZJR19BUkNIX0hBU19QTURfU09GVExFQVZFUwogc3RhdGljIGlubGlu
ZSBib29sIHBtZF9zd3Bfc29mdF9kaXJ0eShwbWRfdCBwbWQpCiB7Ci0tIAoyLjUxLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
