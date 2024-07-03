Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CA7C2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 13:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HInNNCf/sv3ERDKl8NWlK1FkSTyhsU8KnCgc0q7zVE8=; b=A0mdGJtQm4I1pi
	v3AelnjivGeI9bqdsv+PhGTaGqSPZ52eyyNukSSdAFEWPXOccT4PIKoAcS939guqvOGQN5v+9hAI3
	JGoZdHle9cge7WZ1LOF+QyNrYXHWsGJXfmBCuTj+cCFNGtTmnQMMo0t2uLfeX4eU/OlHILMNQn5QW
	zI4OIzycYz6k6I35Gw644EiIorHpafytGGu+LnjdpN2u9iVUzH2mi3aa8sb9KMUDgTOSe27xyeHZh
	r495/kSd+FLYkNZ5Tsp/tSyDYylHl/pX2Nl1ppj/vn5Y6nasnC5h0nm4RgejAwN398qTCN4Imx9YG
	GSAR8JI2YDV7gRaGC3uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP0Is-0000000AL9C-2SLn;
	Wed, 03 Jul 2024 13:45:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOzJC-0000000ABzY-2Irw
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Jul 2024 12:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+Sieh1o5MyoBrHnm558BmfMmJRpQbNvLcV12+eOLjiA=; b=V9QRCqDqChH0+lvvGWI1ue7ACW
	Y2UyEBD4JHwCkJM2G9Cit+c6S8murkUTnRbBwlEnf+zJeFQp4sYjxj4rNmhOWaHQIlfJ+LvFVNcnm
	FQ8aqhuO4mtieIMp+X8m1S5vwlgFpi5AsEnEVcVIoVzDX9SAts4nEVlXoWKfw98E5LnGIdBfZYhHf
	KIBvaoct0ZzV2dR68Xa61O+FGO7Ne6kcH4HXxDlAAerOrRZ79h6lvNQmgoUD1bJDWzCMiUUYp2UgF
	SVcbLbzin+Luus8tvd2uE2g4o5nMCQnINtFlKYvHMlEsAq395GQ0k8lHnaX/nMYQWygQkD7d1CpuE
	Y9VpRkeQ==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOzJ8-00000009yTF-2syD
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 12:42:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B0579CE29A9;
	Wed,  3 Jul 2024 12:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB41C2BD10;
	Wed,  3 Jul 2024 12:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720010513;
	bh=+Sieh1o5MyoBrHnm558BmfMmJRpQbNvLcV12+eOLjiA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Fnnlw0i6W/oooJnn0ktH8v09JmdXZPM1figcF+bGCs7fmPcP2pD7UYGnM7hv8R+Hi
	 gMnkuqYu/QUdE/Trj3sF7Guajilklm6J3b0gMIX8eHr7tlhwiNprflDKB+yWDBzEvY
	 uTP6ILn03iFgKC/HyqQAAJ5RcOZm1Tvg6gIIp3770iQWKfDtdKmm68udKNblWurg8G
	 YfYL352qnKD5fL46SPwvy8vLkVkGgVs6hzNXm2QVZPKMePtNtWiZFbsLexK9EITk65
	 //AouMXK7YUr1JUsOpP8ggGHQS60CgWDQeafjJ8t6Ah8b5rrDEX0oES8rWYZFNVt8z
	 vkNePbucnQoiQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Vladimir Isaev
 <vladimir.isaev@syntacore.com>, Roman Artemev
 <roman.artemev@syntacore.com>, Guo Ren <guoren@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH] riscv: Check that vdso does not contain any dynamic
 relocations
In-Reply-To: <20240326113831.283025-1-alexghiti@rivosinc.com>
References: <20240326113831.283025-1-alexghiti@rivosinc.com>
Date: Wed, 03 Jul 2024 14:41:49 +0200
Message-ID: <8734oqzlyq.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_134159_433690_B850CBF0 
X-CRM114-Status: UNSURE (   3.77  )
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

SGV5IEFsZXgsCgpBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyaXRl
czoKCj4gTGlrZSBvdGhlciBhcmNoaXRlY3R1cmVzLCB1c2UgdGhlIGNvbW1vbiBjbWRfdmRzb19j
aGVjayB0byBtYWtlIHN1cmUgb2YKPiB0aGF0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJl
IEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKTG9va2luZyBpbiBQVywgdGhpcyBmYWls
cyBvbiBydjMyPyBJcyB0aGF0IGEgZmFsc2UgbmVnYXRpdmU/CgpPdGhlciB0aGFuIHRoYXQsClJl
dmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
