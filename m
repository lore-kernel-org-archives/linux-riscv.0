Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0F2C001DC
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 19:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iJVehEz+T+Ht8ketTAGnFKtwA5FHwpL7ZoERfFwlbXQ=; b=X5Ad8lEOZWx2us
	+aukUIcNGUhCyorlOjYMKE0qiB50ijydXi3c6aiebtgNVdWtwSqzGLEtJC8h4CTY9S1Oku4SXXSFp
	GJXNdg6HadxSMzbTp7kiq0/qcQ013MGWJY4xbuwmppPHaAKCAp+iMRhvOn4spkEGtFnaXI4APd+3z
	6g6zt0InNsc4wHRBL56SpJqEMCK6CDJWdwvoW5kyDFDMbaQvI8uklwT4zzKfIcN/9ydxB2cf2dJA8
	3+gs6+lEtWQnEO9YfBLUKAI0hERi9KKXtPMYxdG5NTK7cQE5T6f5UPdGycMyWEQVKCYQn8e2y7gNK
	fFeGBISKMXmAhWei64Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNHqG-00H95U-37;
	Sat, 22 Jul 2023 19:00:36 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNHqC-00H93q-2y
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 19:00:35 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E01232AE;
	Sat, 22 Jul 2023 19:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E01232AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1690052429; bh=Ly/oUr3B7aUKm5QXEvEFBPrkFUbj60dJNU9A8yXKcpc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cpttkpvFAP1LI1OarUiqvJn7vUHGV5XjO+C5tEarMf0/gzt8fPdaX1MeoXQEMhHbn
	 OsuqdGvRI2mmcpreD6I5ZzfBjUORdgugvRPmcdHv8QTehKOVoQcDQlP+LXA2N4MJoL
	 Ni3N3991n6QmWvAvX8W2V9eOErYd/rqfe1ZirtaNxaqQrrHaRk/30AJlbVe0aQJ/Zb
	 fr45+960c8/ffTPOIrkQyBsn2AK2JhAwsowHNQtkpjGcnR0Sp6dMvrTRyXoJEpRzyp
	 kkbdCVYz+0rsr4eUx0eYhU6gLLqrHPkmxzqTInEV/imR23iqHdLPABdccVx2z58SP3
	 N7HPUxXpoFqkQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Alexandre Ghiti <alex@ghiti.fr>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Andrew Jones
 <ajones@ventanamicro.com>, Conor
 Dooley <conor.dooley@microchip.com>, Sunil V L <sunilvl@ventanamicro.com>,
 Song Shuai <songshuaishuai@tinylab.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 1/3] Documentation: arm: Add bootargs to the table of
 added DT parameters
In-Reply-To: <d8db4fc3-12b4-43f1-ea94-5dc53ce2d55f@ghiti.fr>
References: <20230626143626.106584-1-alexghiti@rivosinc.com>
 <87v8edas8d.fsf@meer.lwn.net>
 <d8db4fc3-12b4-43f1-ea94-5dc53ce2d55f@ghiti.fr>
Date: Sat, 22 Jul 2023 13:00:28 -0600
Message-ID: <871qgzbwkz.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_120032_976100_49963B3A 
X-CRM114-Status: UNSURE (   8.37  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cml0ZXM6Cgo+PiBJbiB0aGUgZm9ybWVy
IGNhc2UsIHRoZXkgZG9uJ3QgYXBwbHkgdG8gZG9jcy1uZXh0LCBzbyBjb3VsZCBJIGdldCBhCj4+
IHJlc3BpbiBwbGVhc2U/Cj4KPiBZZXMgc3VyZSwgSSdsbCBkbyB0aGF0IG5vdy4gQlRXwqAgYWxs
IHRoZSBhcmNoIGRvY3VtZW50YXRpb24gd2FzIG1vdmVkIGluIAo+IERvY3VtZW50YXRpb24vYXJj
aC8sIGJ1dCBub3QgdGhlIHJpc2N2LCBhcmUgeW91IHdvcmtpbmcgb24gdGhpcyBvciAKPiBzaG91
bGQgd2U/CgpJJ2xsIGdldCB0aGVyZSAtIHVubGVzcyBzb21lYm9keSBiZWF0cyBtZSB0byBpdCA6
KQoKVGhhbmtzLAoKam9uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
