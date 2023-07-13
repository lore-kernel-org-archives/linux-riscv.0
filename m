Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D41C0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 18:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ttrl7eVYMiNZ+I0KtHrTpqi5sHDcEaILAiWoAeGgxfo=; b=XFwGeCpGXF+CEr
	CnLrL6BN18lRgI9xd7DPOosEHewHv6Ke1FQfVffIlTRE46jsTl6RZvpRzY1YPV2rofGlJSR7bKGzH
	tjKQ8SLk7avx86xZzhV3fGAnZ9aOFr+P3wNrre+t/0Ahx7BgoLtKnWELgjprQpVDqQGyk2falT5MM
	wGiunT6gCq55eFZYRwTdfVxbc/HSNgdrsxRmmEExh3T9pD/2EvqHTFto+Af1yqjwjNi63DeVvU0Qf
	HkXim9TdjHrWjo66PC9NTOgFD0QrgMsQXeG58mTwQEVDpJung+WqaM6GgCOkgq6jg+lr3J8KhBdnp
	h6xpqFQcPv9FuOXZxZQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK1OS-004ABy-02;
	Thu, 13 Jul 2023 18:50:24 +0000
Received: from 10.mo584.mail-out.ovh.net ([188.165.33.109])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK1OL-004AAS-1L
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 18:50:23 +0000
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.16.251])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 25BCA28F93
	for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 18:50:11 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-kh84l (unknown [10.110.103.73])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A5C371FDFD;
	Thu, 13 Jul 2023 18:50:09 +0000 (UTC)
Received: from courmont.net ([37.59.142.101])
	by ghost-submission-6684bf9d7b-kh84l with ESMTPSA
	id VcWsI2FHsGT6MwAA2AIyLw
	(envelope-from <remi@remlab.net>); Thu, 13 Jul 2023 18:50:09 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-101G0043fe94ef8-c2b5-44e0-860a-5b095a139628,
                    E825627045B7043E7B61682BD01F96CE19757E2A) smtp.auth=postmaster@courmont.net
X-OVh-ClientIp: 87.92.194.88
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: Conor Dooley <conor@kernel.org>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com, heiko@sntech.de, charlie@rivosinc.com,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2] RISC-V: Don't trust V from the riscv,isa DT property on T-Head
 CPUs
Date: Thu, 13 Jul 2023 21:50:08 +0300
Message-ID: <13302652.uLZWGnKmhe@basile.remlab.net>
Organization: Remlab
In-Reply-To: <1855588.tdWV9SEqCh@basile.remlab.net>
References: <20230712-postal-affiliate-0d61a209897f@spud> <ZLAoIWX+qqWvucWz@xhacker>
 <1855588.tdWV9SEqCh@basile.remlab.net>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 5143955202504661281
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrfeeggdduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkohgjfhgggfgtsehtqhertddttdejnecuhfhrohhmpeftrohmihcuffgvnhhishdqvehouhhrmhhonhhtuceorhgvmhhisehrvghmlhgrsgdrnhgvtheqnecuggftrfgrthhtvghrnhepuefhgeeffedvfeeuteelfeffudeuvdejfeehudeukeeiledtteeuteeuuefgveffnecuffhomhgrihhnpehrvghmlhgrsgdrnhgvthenucfkphepuddvjedrtddrtddruddpkeejrdelvddrudelgedrkeekpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorhgvmhhisehrvghmlhgrsgdrnhgvtheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheekgedpmhhouggvpehsmhhtphhouhht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_115017_604437_31F9DA5B 
X-CRM114-Status: UNSURE (   2.65  )
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

TGUgdG9yc3RhaW5hIDEzLiBoZWluw6RrdXV0YSAyMDIzLCAyMS40Ny4yOSBFRVNUIFLDqW1pIERl
bmlzLUNvdXJtb250IGEgw6ljcml0IDoKPiAgICAgICAgIF9fYXNtX18gKAo+ICAgICAgICAgICAg
ICAgICAidnNldHZsaSB6ZXJvLCB6ZXJvLCBlOCwgbTEsIHRhLCBtYVxuIgo+ICAgICAgICAgICAg
ICAgICAiY3NyciAgICUxLCB2dHlwZVxuIiA6ICI9ciIgKHZ0eXBlKSA6ICJyIiAoMHhDMCkpOwoK
VGhlIGlucHV0IG9wZXJhbmQgaXMgb2J2aW91c2x5IGJvZ3VzIGxlZnQtb3Zlciwgc29ycnkuCgot
LSAKUsOpbWkgRGVuaXMtQ291cm1vbnQKaHR0cDovL3d3dy5yZW1sYWIubmV0LwoKCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
