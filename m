Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D99C27C53
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 11:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6MGAB6b7eXQqj7cFWAoYPUxi5S0SCHBdLZQpC6+pQ0=; b=FlR4Q26b05oJCQ
	tTpfbOa/B5kEJFi5kLT4nPvKZqNPdyt2JScFoCPxSHdOsHLPtZ7KAAd+zzIfBC9t+W+rZKcKACUE9
	l3rubBxKX+r4gIoh9ctUtbpnfLbMEJ8oeOzKVC3pZ0aaGhmt91i7qjWn2RE5Myi84R042B2MYS2j8
	DjFS/t5fSpEQejrMd+dhEZpAt7shAFzZ+ylY2UArTv+KFircWEo5NOevkeDFcqiw0dXZXWP++0P75
	xCOWLvwszV4jgSUswmnxAumKcjAiJwEDgax7MrTtVXMTzzlzbB9sH2cP0bzEmsdnpySIgRye6NsCM
	hZhUu614eC1h00HhwjRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEp1A-00000005jpS-0won;
	Wed, 05 Jun 2024 11:41:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEp17-00000005joE-0Fet
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 11:41:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A405E617FE;
	Wed,  5 Jun 2024 11:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3803C32781;
	Wed,  5 Jun 2024 11:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717587679;
	bh=DeWhhyy/Pd+ZMACSRHJGzJta3bvo66kmrO80PItBsh0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U1Ioy0maA5AwRckov58PI1dPUHyyGGgTWfzppxKvOJ5vKG4OYfFjGk9LswC/lA67g
	 AiIlfX+S+u9KX+idcOdeOFgkILKcjRmMy3P2mRnigjBzo6o8YhsVcdGLtPS1U5tG25
	 tAl6eEfOl+uJ0lnDHnB9krao18oZMsRfj3bVMcQ8Hhec/AU5okt/9ANWoqlsbg/v9B
	 6XAEJYTzUpZ4AMmjN82aSGoJ09nWwo5+Iq8Uc98aESGuk1kqIDdE25dT0Ew5lBYyMI
	 tbHq6/DNAi6bsnOYdF3D68Me1apb1caKmDIAUghJSJNQu3/1DH/vbtfVidTyA9KTpx
	 4/ZFTWv4bC1MQ==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v4 01/11] riscv: mm: Properly forward vmemmap_populate() altmap parameter
Date: Wed,  5 Jun 2024 13:40:44 +0200
Message-ID: <20240605114100.315918-2-bjorn@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605114100.315918-1-bjorn@kernel.org>
References: <20240605114100.315918-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_044121_186494_6EF1C930 
X-CRM114-Status: UNSURE (   9.58  )
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKTWFrZSBzdXJlIHRoYXQg
dGhlIGFsdG1hcCBwYXJhbWV0ZXIgaXMgcHJvcGVybHkgcGFzc2VkIG9uIHRvCnZtZW1tYXBfcG9w
dWxhdGVfaHVnZXBhZ2VzKCkuCgpSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZv
c2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9tbS9pbml0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCmluZGV4IGUzNDA1ZTRiOTlhZi4uZmU1
MDcyZjY2YzhjIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYworKysgYi9hcmNoL3Jp
c2N2L21tL2luaXQuYwpAQCAtMTQzOSw3ICsxNDM5LDcgQEAgaW50IF9fbWVtaW5pdCB2bWVtbWFw
X3BvcHVsYXRlKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLCBpbnQgbm9k
ZSwKIAkgKiBtZW1vcnkgaG90cGx1Zywgd2UgYXJlIG5vdCBhYmxlIHRvIHVwZGF0ZSBhbGwgdGhl
IHBhZ2UgdGFibGVzIHdpdGgKIAkgKiB0aGUgbmV3IFBNRHMuCiAJICovCi0JcmV0dXJuIHZtZW1t
YXBfcG9wdWxhdGVfaHVnZXBhZ2VzKHN0YXJ0LCBlbmQsIG5vZGUsIE5VTEwpOworCXJldHVybiB2
bWVtbWFwX3BvcHVsYXRlX2h1Z2VwYWdlcyhzdGFydCwgZW5kLCBub2RlLCBhbHRtYXApOwogfQog
I2VuZGlmCiAKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
