Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7E5606A327
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 08:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Uigbxh7g;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=LLlSGT8v;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=VqupciBa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZvTopiyUaWnenUV2zEAYV28SCws0LvgxYfy6n40myrQ=; b=Uigbxh7g4VuZ8BIzOX2qNxn8MI
	OAQ+9ipARLtIrkSDpuFbRC63UyxZ5CRNv6+QQTw8WJUxZioon9VoqwvcvsHEQkNPabZF/OzstUaLO
	Ba1D8mZypciegHhq/kMnlRnAwyLfA4iig1jP9enKn4ihDhhG0ymv19s3TFp2J46y7oxjmXrcLMR1B
	bI9UTaqyDMo+wxMoAYgFDXV1eYizov+2yJgEO6py4r85t5Iiw4UF+DU5lloymB4Te5Y3fSXXW9/9f
	0atheSxW+kspYMcwI18vKzcZE0x9N0VQNh9r8WhVxdST48pZjUevj3BR60dAIFwz20CsPw3DB2euX
	PImxYhcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQcx-00000009Gba-0SYO;
	Thu, 12 Nov 2026 08:57:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQcI-00000009GTW-0ujT
	for linux-riscv@bombadil.infradead.org;
	Thu, 12 Nov 2026 08:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bLsxGg+UbntTm846AKMWGYVEPT6bUdBmF4X/znMO0vM=; b=LLlSGT8vabqi42PLmJz+2QUulC
	Sv1TUMLYYdyRUJjINkTP/nY+BgSgpAKG89WRdrmzpZdMRVcwEa7YunIm54AfyUdW5jzUnJuKqIUbE
	obmwqfijDjNXvgm9Trj0gLSdsgeImrtHd3fW+aME/uHpNAfLXsPVeYAaojJ2VcWiGb6e6ZPwZZn3e
	WpS3tvUcmkXCp/2saKBnFxDHUzOe5ICDNhcIBVsWpMDHfPz3DYQeV6nDpXP3q+AxFD8zy8i+oP3wr
	sJssNqj/aWwzJXLeHgX7K1AtVmM/J9ZYo/mbOCFSJrlVmb3ZHpnYOYkMvCKAoCwE8NkYpNQcvBxK0
	sq6nn05g==;
Received: from retz.cirad.fr ([194.199.235.221])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQcF-0000000A5tt-1IWz
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 08:57:08 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 4555620D4DD5;
	Thu, 12 Nov 2026 09:57:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 1A9E320D4C14;
	Thu, 12 Nov 2026 09:57:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 1A9E320D4C14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794473823;
	bh=bLsxGg+UbntTm846AKMWGYVEPT6bUdBmF4X/znMO0vM=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=VqupciBabbvQh99o8OZqmQSPXRix8ZKYFXfNMY0VarwGMbfP2D/ZWloFmC6E3rKkV
	 lknk3uOyr+ausKBTikuzhXfo51yCLtRpXeEs+etL3HeSrA5WcD+qmP5x+uvBmTEuAY
	 nJiVfSeGcCDRPsN+QQkDdSmpNe1S0ZdKkOaBEn/WB4o0qSRQHZTYMN2N2ZD0ZKbe1/
	 wDfeUlHFwKRwzPxqTlWHHJxkqOiibunX5MPBqKLXdswzKQRblES5yQm/Jj0qyH+x47
	 r1oNlfEhTo09KekvYeJI4hBQJQ4HNEEDw6Bi6G61gTHSqU5rfTRd14GNWwQdUCBsto
	 6Ts21iaM1hfjw==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id oDmgEuZsXvji; Thu, 12 Nov 2026 09:57:03 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id E74D620D4DD5;
	Thu, 12 Nov 2026 09:57:01 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Yixun Lan <dlan@kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	anarsoul@gmail.com,
	alistair@alistair23.me,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-bluetooth@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Bluetooth for the RTL8852BS on BPI-F3
Date: Thu, 12 Nov 2026 09:56:17 +0100
Message-ID: <20261112085617.516945-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112061951-GKA62271@kernel.org>
References: <20261111094557.443481-1-frederic.mahe@cirad.fr> <179442601916.1604530.1705197925952408060.git-patchwork-notify@kernel.org> <DMSUPKS0VL8N.1RUUESQVU8FMF@linux.spacemit.com> <20261112061951-GKA62271@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_085707_258962_B1758095 
X-CRM114-Status: UNSURE (   6.12  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTHVpeiwgWWl4dW4sCgpTb3JyeSwgSSBzaG91bGQgaGF2ZSBzYWlkIGluIHRoZSBjb3ZlciBs
ZXR0ZXIgd2hpY2ggdHJlZSBlYWNoIHBhdGNoCndhcyBtZWFudCBmb3IuCgpUaGUgc3BsaXQgaXMg
ZmluZSB3aXRoIG1lOiBiaW5kaW5nIGluIGJsdWV0b290aC1uZXh0LCBEVFMgdGhyb3VnaApZaXh1
bidzIHRyZWUuIEkgY2FuIHJlc2VuZCBwYXRjaCAyLzIgb24gaXRzIG93biwgcmViYXNlZCBvbiB0
aGUKU3BhY2VtaVQgdHJlZSwgaWYgdGhhdCBoZWxwcy4KClRoYW5rcywKRnLDqWTDqXJpYwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
