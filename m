Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EB5606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 17:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c9+I+qiJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=V24TKzqm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zHb6QylyErcsROKe9HnmAZP9EEg4RjLbdErZWNeqwuI=; b=c9+I+qiJmjKTiS1AUzzpqg+Zm+
	uF5Ea6/97Y+LyI2cV8XJcYO9w+wluKmovXdl8PLkhaiwvSE0vfjCrf+DhtD8Ri3VTu7ZSq6qbsszM
	6XAY0+kAieVWOTmaILNnDREb/bLnizLf90QZTNfLsk212YoFjlVTvA4ai4amKpxLejZpSQrvzm12a
	NtVmegWmHy8bKdvXUA4BX1LzlGokq1yCqUJIviFlcXsTlQtC32BeGyCFFszYdkGtcyivMUMfd7DZa
	ISURa9fqpr6cQ+nY4HtSajFc0/puesYrkakpsIZoEJDP8kz/JsSKqAkvlTAFW0+bvPoN9wBnGIL+W
	o/EBW79A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcqs-0000000E0Ea-2Zf5;
	Thu, 26 Nov 2026 17:01:42 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcqq-0000000E0A6-1SFK
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 17:01:41 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 97C8B210CB3E;
	Thu, 26 Nov 2026 18:01:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 6D3D820DC677;
	Thu, 26 Nov 2026 18:01:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 6D3D820DC677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1795712498;
	bh=WJTpt+X9RF5ov4+gkKKicVGwQVPCzHMz365+2em8uJI=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=V24TKzqm6S5AO/9g3OMqRN4hLIB/rPeMeao0L2Z9/UsK/sdGBdwHBf+NEO39BH3Os
	 jb2gK6vTXGeKTCP+6Hs6EfGdpcGlMkAgJOMApZv5IZv/lX43K7V9GgTSh36ezB/MjB
	 lt3qc97uZaF5iOv6gMbkU6YJXdYTYFlXIrBD4BFgle8Ldm/+2Sw9ci3qkfXheNGsjj
	 QGWTMFQN08S7+HprJcNybEhKbE9ewkn1pDdkDIE8Cs7au6IoJeFJHN/891aJ7jP80W
	 D9cncgvx0SI3iqxmX+a2qxOf7Lrx3R69SCQ043n5GiEmMd5G9rwl2xYAPv9p6CJP2n
	 TQ6bSoUIKYXuQ==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id cJicDJtaFHn5; Thu, 26 Nov 2026 18:01:38 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 6B332210CB3E;
	Thu, 26 Nov 2026 18:01:37 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Yixun Lan <dlan@kernel.org>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: Re: [PATCH v5 0/2] PM: spacemit: Add power domain support
Date: Thu, 26 Nov 2026 18:01:12 +0100
Message-ID: <20261126170113.905375-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118-04-k3-pm-support-v5-0-42394acdf3e3@kernel.org>
References: <20261118-04-k3-pm-support-v5-0-42394acdf3e3@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_090140_588903_1A07E71C 
X-CRM114-Status: UNSURE (   5.70  )
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

SGkgWWl4dW4sCgpUZXN0ZWQgdjUgb24gYSBCYW5hbmEgUGkgQlBJLUYzICh2Ny40LXJjNCBwbHVz
IHlvdXIgdHdvIENDVSBwbS1hdXgKcGF0Y2hlcyk6IHRoZSBzZXZlbiBLMSBkb21haW5zIHJlZ2lz
dGVyIGFuZCB1bnVzZWQgb25lcyBhcmUgdHVybmVkIG9mZgphdCBib290LiBXaXRoIElrZXIncyBQ
b3dlclZSIEdQVSBub2RlICh2MiksIHRoZSBncHUgZG9tYWluIHR1cm5zIG9uIHdoZW4KdGhlIGRy
aXZlciBiaW5kcyBhbmQgdGhlIGZpcm13YXJlIGxvYWRzLiBObyBuZXcgd2FybmluZ3M7IFc9MSBi
dWlsZCBpcwpjbGVhbi4gUmVib290IGZyb20gdGhpcyBrZXJuZWwgaXMgY2xlYW4uClRlc3Rpbmcg
ZG9uZSB3aXRoIHRoZSBoZWxwIG9mIENsYXVkZSAoQUkgYXNzaXN0YW50KS4KClRlc3RlZC1ieTog
RnLDqWTDqXJpYyBNYWjDqSA8ZnJlZGVyaWMubWFoZUBjaXJhZC5mcj4gIyBCUEktRjMKCkZyw6lk
w6lyaWMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
