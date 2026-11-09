Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C88606A31C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 11:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u8ZVqywV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=FsI+0jWU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VVtBZ+V6r6Ow4BXYRPemQq3Vzod6AlR2GtwY73vppOw=; b=u8ZVqywVXwzQ5jp5lebXq13StU
	Czm7UAYlP5p5XIl/mKpc8PWg0mk7RfKSONh394imCKYXPno+K0fscfJk6RfXtdXnXXpwGtaXHkQ9B
	amz17UGvVvYjdO9Muwi2SBkNwQ5lPN+vFHbH5l+l4bTXN/JKQEG6laJ3jCKQEAkqd9L6t2hZkjfXN
	Effz4r7PZpvyRX8GsufFTZxkfgz5ykvsB4zP0XEKi/qI4s1FsWg5axowt+WFo/TBQHH2D9yVzb+Cn
	p8CfnTMrvvZX1shXrdSIEQwbe54kB8zdAv/6UyY3/oCFDbBltPFnQyrKDkfe+Tn9bcAwGwO2axjmq
	b82MX00Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQN8D-00000000TmS-35le;
	Mon, 09 Nov 2026 11:01:45 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQN8A-00000000Tl4-0Zux
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 11:01:44 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id D6A0B20DDBC5;
	Mon,  9 Nov 2026 12:01:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id B8A5820DDAE3;
	Mon,  9 Nov 2026 12:01:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr B8A5820DDAE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794222095;
	bh=S1FGdhZllrMjEm+POPzDgDYLMUR3eBpyJGxotFxGSLQ=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=FsI+0jWUv/4iqCVTv5yZiD8sKZSgm4Th3SmP+5UAUFz/vsUot3xkKqxr/Fdoxw4UF
	 f5fuXlDHmzcgOk2056X11ZynLgICdRTX1KgpAsoLYCdLpEjtu9SQz8bkU67dYVOUCk
	 IB6mH5XXdBC8y+4pZhnES8Wb60DdLKZ9eHifl0s1HkI99DYGzhGSCXQtDvtJYz80ZP
	 DyybB57KeR7uLBzZzizx46gP0xxkhL0ovoKQToIAYD8HS/we9xm1UxAn1P/dS+xjWt
	 gEu6GDFKLDonucVkbkoTSQQEk+OP+VSqiN74wZQCklnd7AC6HksZ40zZAIqpwnKTX3
	 cswpiuzkq5Fbg==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id HLlD2-6wYjs1; Mon,  9 Nov 2026 12:01:35 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 00C9D20DDBC5;
	Mon,  9 Nov 2026 12:01:34 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH v5] riscv: disable local interrupts and stop other CPUs before reboot/shutdown
Date: Mon,  9 Nov 2026 12:00:43 +0100
Message-ID: <20261109110104.293157-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104-v7-0-rc1-rv-dis-int-before-restart-v5-1-956ec09c900d@linux.dev>
References: <20261104-v7-0-rc1-rv-dis-int-before-restart-v5-1-956ec09c900d@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_030142_648964_486B41E2 
X-CRM114-Status: UNSURE (   8.86  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Jisheng Zhang <jszhang@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMDQsIDIwMjYgYXQgMDc6MDU6NDBBTSArMDAwMCwgVHJveSBNaXRjaGVsbCB3
cm90ZToKPiBTcGVjaWZpY2FsbHksIHVuZGVyIENPTkZJR19QUkVFTVBUX1JDVSwgcmN1X3JlYWRf
bG9jaygpIGRvZXMgbm90IGluY3JlbWVudAo+IHRoZSBwcmVlbXB0X2NvdW50LiBJZiBsb2NhbCBp
bnRlcnJ1cHRzIHJlbWFpbiBlbmFibGVkLCB0aGUgZW52aXJvbm1lbnQKPiBpcyBub3QgZ3VhcmFu
dGVlZCB0byBiZSBhdG9taWMuIFRoaXMgY2FuIGxlYWQgdG8gYSBjb250ZXh0IG1pc2lkZW50aWZp
Y2F0aW9uCj4gd2l0aGluIGdlbmVyaWMga2VybmVsIHRlYXJkb3duIGNvZGUsIGNhdXNpbmcgaXQg
dG8gaW5jb3JyZWN0bHkgZW50ZXIKPiBub24tYXRvbWljIHBhdGhzIChzdWNoIGFzIGF0dGVtcHRp
bmcgdG8gYWNxdWlyZSBzbGVlcGluZyBsb2NrcyksIHdoaWNoCj4gcmVzdWx0cyBpbiBmYXRhbCAi
c2NoZWR1bGluZyB3aGlsZSBhdG9taWMiIHNwbGF0cyBvciBzeXN0ZW0gaGFuZ3MuCgpPbiBCYW5h
bmEgUGkgQlBJLUYzIChTcGFjZW1pVCBLMSksIHY3LjQtcmMxIGRlZmNvbmZpZywgZXZlcnkgcmVi
b290IHdhcm5zOgoKICBXQVJOSU5HOiBrZXJuZWwvcmN1L3RyZWVfcGx1Z2luLmg6MzMwIGF0IHJj
dV9ub3RlX2NvbnRleHRfc3dpdGNoKzB4NDZhLzB4NDhhCiAgLi4uCiAgc3BhY2VtaXRfaTJjX3hm
ZXJfY29tbW9uKzB4MzQyLzB4NWY2CiAgLi4uCiAgc3BhY2VtaXRfcDFfcmVzdGFydF9oYW5kbGVy
KzB4MjQvMHg1YQogIGRvX2tlcm5lbF9yZXN0YXJ0KzB4MWUvMHgyNgoKV2l0aCB0aGlzIHBhdGNo
IHRoZSB3YXJuaW5nIGlzIGdvbmUgKDIvMiBjbGVhbiByZWJvb3RzLCAyLzIgd2FybmluZ3MKd2l0
aG91dCBpdCkuIFRlc3RpbmcgZG9uZSB3aXRoIHRoZSBoZWxwIG9mIENsYXVkZSAoQUkgYXNzaXN0
YW50KS4KClRlc3RlZC1ieTogRnLDqWTDqXJpYyBNYWjDqSA8ZnJlZGVyaWMubWFoZUBjaXJhZC5m
cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
