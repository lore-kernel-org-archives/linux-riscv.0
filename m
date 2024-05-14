Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFDCC04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 14:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yyX+NXf4EY2FRwhmDCkO4auRCh7eBKW9qOjsR2WCNpY=; b=SQGdRB7eEPMKzB
	uh70RNRG/C6WSuKfi6X3ePz0uYocqREGBnEj/G9nk7I6zTtAxoTqpWLk/wZF+8s9XiK31wT9lTmkE
	/avA3RTY6VqY3sK8X366Q9gcdnZcpntevv9bdKxxbZZrpt+1Cm3WTLmO1u+7r8JV5nHvLxlk4qcp5
	RSZacPhTCaxFBw/gOutu8VRsc48GITRNqa/gwy/F2JwxUpH/ZhfyYQuil/khpeXRLYDSpNfw2C9gI
	3dCtFhirGcVXZjSskQgxtzLhFy+/Kma+PQ9aA+v0lnxT/AdjDPEEnJSs4ErE5iy7oSF98QFRxgmuP
	PHEULwD5x/uuXfYWonsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6smb-0000000G7ds-0LM2;
	Tue, 14 May 2024 14:05:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6smV-0000000G7aN-1idt
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 14:05:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC7816126C;
	Tue, 14 May 2024 14:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3894C32781;
	Tue, 14 May 2024 14:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715695526;
	bh=KbKqzNvXWA/Za9nd3AYnat1xf+LOO0b3PgRZV0HvyKk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AnRBLrwiGydV55YKVxP1C2hTU/+iQo4dd8w0faa4jtVHR4jHZ5anUbKb5yZ5ye3XS
	 ys1kla9pYrDzdZbLunoTrtdPNqqAUbKtu1CJ//68MFbQyh5y7aZhC46YK55JtaUZA5
	 ra5G2sERmBqf/UFx2SPaMVXfoiGS2kPxfZFkZNOUlVD19QOqS/SUV5MZU/mFGOVgDv
	 IXn6OG9dtirrJO/Dh3vnNlqnjzdI4qDmljqWq0kBU+c0CiDbOdoWE/pFltLXqLokVT
	 r19LtiBw6rEEkbg+nNadg08rNjWgfdZZVOpJ69iuykQqloruiT2sEewRtB7kCuWmPz
	 qDl5PWv830HDA==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 5/8] riscv: mm: Take memory hotplug read-lock during kernel page table dump
Date: Tue, 14 May 2024 16:04:43 +0200
Message-Id: <20240514140446.538622-6-bjorn@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240514140446.538622-1-bjorn@kernel.org>
References: <20240514140446.538622-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_070527_531861_9479805A 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, virtualization@lists.linux-foundation.org, Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKRHVyaW5nIG1lbW9yeSBo
b3QgcmVtb3ZlLCB0aGUgcHRkdW1wIGZ1bmN0aW9uYWxpdHkgY2FuIGVuZCB1cCB0b3VjaGluZwpz
dGFsZSBkYXRhLiBBdm9pZCBhbnkgcG90ZW50aWFsIGNyYXNoZXMgKG9yIHdvcnNlKSwgYnkgaG9s
ZGluZyB0aGUKbWVtb3J5IGhvdHBsdWcgcmVhZC1sb2NrIHdoaWxlIHRyYXZlcnNpbmcgdGhlIHBh
Z2UgdGFibGUuCgpUaGlzIGNoYW5nZSBpcyBhbmFsb2dvdXMgdG8gYXJtNjQncyBjb21taXQgYmYy
YjU5ZjYwZWUxICgiYXJtNjQvbW06CkhvbGQgbWVtb3J5IGhvdHBsdWcgbG9jayB3aGlsZSB3YWxr
aW5nIGZvciBrZXJuZWwgcGFnZSB0YWJsZSBkdW1wIikuCgpTaWduZWQtb2ZmLWJ5OiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9tbS9wdGR1bXAuYyB8
IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9tbS9wdGR1bXAuYyBiL2FyY2gvcmlzY3YvbW0vcHRkdW1wLmMKaW5kZXggMTI4OWNj
NmQzNzAwLi45ZDVmNjU3YTI1MWIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbW0vcHRkdW1wLmMK
KysrIGIvYXJjaC9yaXNjdi9tbS9wdGR1bXAuYwpAQCAtNiw2ICs2LDcgQEAKICNpbmNsdWRlIDxs
aW51eC9lZmkuaD4KICNpbmNsdWRlIDxsaW51eC9pbml0Lmg+CiAjaW5jbHVkZSA8bGludXgvZGVi
dWdmcy5oPgorI2luY2x1ZGUgPGxpbnV4L21lbW9yeV9ob3RwbHVnLmg+CiAjaW5jbHVkZSA8bGlu
dXgvc2VxX2ZpbGUuaD4KICNpbmNsdWRlIDxsaW51eC9wdGR1bXAuaD4KIApAQCAtMzcwLDcgKzM3
MSw5IEBAIGJvb2wgcHRkdW1wX2NoZWNrX3d4KHZvaWQpCiAKIHN0YXRpYyBpbnQgcHRkdW1wX3No
b3coc3RydWN0IHNlcV9maWxlICptLCB2b2lkICp2KQogeworCWdldF9vbmxpbmVfbWVtcygpOwog
CXB0ZHVtcF93YWxrKG0sIG0tPnByaXZhdGUpOworCXB1dF9vbmxpbmVfbWVtcygpOwogCiAJcmV0
dXJuIDA7CiB9Ci0tIAoyLjQwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
