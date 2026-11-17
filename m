Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127EB606A880
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 08:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BxkJA6e3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=lX5Joh4/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6yKACFFtJR+ZJYHswKrmTsTeoObHXlyw/bV+YCDn8Kg=; b=BxkJA6e3z7B2hSE4aaQsGvGZKJ
	4C+15UjfINWKAUJdcM8hY5OujDL2diB3iLGyI/MB3i3ADva7Tf+u2F4AMEG41WlQhEfgg7Q6NF9Om
	3G3NmshtF9Z3Iho2SmHp0K6RsE2N4dYVno7+qsDsnFQvM66pYsHdAMk/Ly4qNJ1CKCjCuYStshTQO
	uAs4xR7mvxeCzhJv8xU5rnYb3X213ys4pOnVq5lNFUor0Jv2sSdlAU2KNYDsmFL2b/MtoM9+zfrqg
	NyqqosB3i886S8PBdNCy2M44h0blWQd5JuJqHhGA7x9PZD/v/gnyLytsAyLQ2ASgsi7MBoaRsPq6+
	1Du40/lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEtR-00000004xWu-1B8B;
	Tue, 17 Nov 2026 08:50:21 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEtN-00000004xUg-40rz
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 08:50:19 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 7193C20DC645;
	Tue, 17 Nov 2026 09:50:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 4866720D7CCE;
	Tue, 17 Nov 2026 09:50:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 4866720D7CCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794905411;
	bh=cFk1IC1N2ZxUgPOBN14J0ec3RFhEdGYuQcICO+AAQGg=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=lX5Joh4/2q/HFpT9S7gUsWxhLdRTkgkbSKIDtJM4vHUc6hC8xnM3LcmqYItxlmY42
	 Bt4pkPYgO6DenbyTxcWgAc8VKn6BDyjxF0OziEuWSY/hBx3y1vldJ3X4fIIki6Edof
	 LnMTAg46hFwU/jq7ptIj82f8Cc+L5O0Efi7urudl+VQVbsGfHZelKqrKXPLb03qINa
	 13fwAZW5aDrGrjPB4jLzJE6jdXhUFNjhIV3dkgSolKLQSxnXWy/wEw/S4ibuGfXCp/
	 pZAI6z4LZlwxEBlpQSfc9TbZEl5zfhjJRzLWubVCwKDA0UV2kFB9R0KBLh/MzfEvEa
	 kaJtkayVMZmUQ==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id 1n70Yc3tCfZi; Tue, 17 Nov 2026 09:50:11 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 35E1E20DC645;
	Tue, 17 Nov 2026 09:50:10 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Vlad Banea <montrealtango@gmail.com>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Yixun Lan <dlan@kernel.org>,
	troy.mitchell@linux.spacemit.com,
	wangruikang@iscas.ac.cn,
	guodong.xu@oss.qualcomm.com,
	jyc0019@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: spacemit: k1: give each PCIe port its own DMA window
Date: Tue, 17 Nov 2026 09:49:36 +0100
Message-ID: <20261117084938.82968-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113023158.2872492-1-montrealtango@gmail.com>
References: <20261113023158.2872492-1-montrealtango@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_005018_453069_C233676F 
X-CRM114-Status: UNSURE (   6.41  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBOb3YgMTIsIDIwMjYgYXQgMDk6MzE6NThQTSAtMDUwMCwgVmxhZCBCYW5lYSB3cm90
ZToKPiBUaGUgc2hhcmVkIHBjaWUtYnVzIHNraXBzIGFsbCB0aHJlZSB3aW5kb3dzLCBidXMgMHg4
MDAwXzAwMDAtMHhiN2ZmX2ZmZmYsCj4gd2hpY2ggbGVhdmVzIENQVSBhZGRyZXNzZXMgMHgxXzAw
MDBfMDAwMC0weDFfMzdmZl9mZmZmIHVucmVhY2hhYmxlIGZyb20KPiBldmVyeSBwb3J0LiBHaXZl
IGVhY2ggcG9ydCBpdHMgb3duIGJ1cyB0aGF0IHNraXBzIG9ubHkgaXRzIG93biB3aW5kb3cuCgpU
ZXN0ZWQgb24gYSBCYW5hbmEgUGkgQlBJLUYzICgxNiBHQikgd2l0aCBhbiBOVk1lIFNTRCBvbiBw
Y2llMSwgb24KdjcuNC1yYzEgcGx1cyAiUENJOiBzcGFjZW1pdDogSWdub3JlIFBFUlNUIyBpbnB1
dCBpbiBSQyBtb2RlIG9uIEsxIi4KCkZvciBwYWdlcyBhdCBrbm93biBwaHlzaWNhbCBhZGRyZXNz
ZXMgKGZyb20gL3Byb2Mvc2VsZi9wYWdlbWFwKSwgSSBkaWQKb25lIDQgS2lCIE9fRElSRUNUIHdy
aXRlIGFuZCByZWFkIHBlciBwYWdlIGFuZCBjb3VudGVkIHN3aW90bGJfYm91bmNlZApldmVudHM6
CgogIENQVSByYW5nZSAgICAgICAgICAgICAgICAgICAgd2l0aG91dCAgICAgICAgd2l0aCB0aGlz
IHBhdGNoCiAgMHgxXzAwMDBfMDAwMC0weDFfMGZmZl9mZmZmICAxNDM5LzE0MzkgYm91bmNlZCAg
MC84NjQgYm91bmNlZAogIDB4MV8xMDAwXzAwMDAtMHgxXzFmZmZfZmZmZiAgYWxsIGJvdW5jZWQg
ICAgICAgIGFsbCBib3VuY2VkIChwY2llMSdzIG93biB3aW5kb3cpCgpFdmVyeSBwYWdlIHJlYWQg
YmFjayBjb3JyZWN0bHkgaW4gYm90aCBjYXNlcywgc28gRE1BIHRocm91Z2ggYnVzCjB4ODAwMF8w
MDAwIHdvcmtzLiBmaW8gd2l0aCBjcmMzMmMgdmVyaWZ5ICgxNiBHaUIgZGlyZWN0LCA4IEdpQgpi
dWZmZXJlZCkgYWxzbyBwYXNzZWQgd2l0aCBib3RoIERUcy4KClRlc3RlZC1ieTogRnLDqWTDqXJp
YyBNYWjDqSA8ZnJlZGVyaWMubWFoZUBjaXJhZC5mcj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
