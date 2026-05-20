Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FFBCD4F5E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 05:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AUBX6WeiMdVh8E7mOvWUHbe6jsNPgZ9YWJLda+447lA=; b=MhiCL3xsFyStct
	T9MJlVX+HONJsfeQHXe3t0WE+jE3Ov/VEC95Rl2BUphwCOZGgNR8gM3Vl+qX/al70XhBgc1d71Xy4
	gqhdXx0iawpFm5RfpZWbnMm249YfhU7IwUCGfL2N+svC5gq5M/DnZAsXgvfx4Ea6FrSiCdYTU25hE
	cdF3HaFiO5WG8RB/MuRZwGNR/5BLPQS0t5L8NbaZj0+s9/ZHEHNFRWcdd2BK7Bp5Me5ZqSGNyGR4c
	yFsXapbdayKdlefFqxiJDBsZY8qGOJq50W75A5w/p76pn/HHp5cdNXG1Fbx454vj5fRLvjrg0x/WJ
	cJUdgI3fQIJocbH3aKZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZfS-00000003a8n-1FTo;
	Wed, 20 May 2026 05:40:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZfP-00000003a8M-3luC
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 05:40:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 28410434F9;
	Wed, 20 May 2026 05:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AAF61F000E9;
	Wed, 20 May 2026 05:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779255627;
	bh=VXWU7r0c9VKxC/LLgGie8gWxBd1YPuZj7z3fEqvPJz0=;
	h=From:Subject:Date:To:Cc;
	b=HRJfWQkTrCwoF4h2BMFlzFSpVisS7rn8JLtYksB2VEf767X7mxqjrGaixOxJJDDP1
	 xgJ+9RX+r6lcl88FCfn2pGpJlckWLfgkosAGqZXJCGpGWSDzydkUhiuJ/FuFTfBAgH
	 C55OGfY0vemUoM4tUmUd4OeWCoC6WgSUpFGTRj1AYQ5WXGmGG3LwfEwbkH0ytXx4AS
	 xwWFsRYM4vJC2s8PC79OSKDeHMjPEsYaxaJvm1oxNUsfbr1vFpzrgBGXRyNQqjVwR8
	 7Q46oxyFdQx01te4la0DxnVlDnKqUDuYuPxNfhx5Jay9EGfnc7YXFrfkdbxQO89Ef4
	 xuVeTABcFfNbw==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/2] spacemit: k3: Add support for CoM260-IFX board
Date: Wed, 20 May 2026 05:40:08 +0000
Message-Id: <20260520-02-k3-com260-ifx-v1-0-3e17055dd488@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADhJDWoC/yXMTQ5AMBBA4avIrE0yKghXEYuqwRA/aRGJuLti+
 S3eu8CxFXZQBBdYPsTJMntEYQCm13PHKI03KFIpJVGOpHCM0SyTN0p7otaxojonTpMMfLZabuX
 8lmX12+31wGZ7P3DfDxH5wdl0AAAA
X-Change-ID: 20260519-02-k3-com260-ifx-aa320b90e657
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=dlan@kernel.org;
 h=from:subject:message-id; bh=Y8PjvZ7mPoBrPXkY4y6yoQNzP77kDpkGlwcWTLE9+kM=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqDUk9077NYFsddRGvdQNDUmaSQ0iEVX36QrNeQ
 w1J1a08DxiJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCag1JPRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3vWxAAjCKUOgm90oQlWZGUQxI/ihraT8IRK1N0SXpUK1u3JbIXywZWswUEn
 k9pTcqiIceiG2wXlQL1klO32Oa5wfa8QnppBrMmiLBmxtrJ0fVIncVH2411s4yakpkC2VaTuOi1
 WFFoSKiakNHB3NrVVSNqPy+KhW3GWzxmqZYIAGmv00qUOr7hUzUAoGqfkPZg7sLPbVZm758GUrk
 N/uuXBrA0XcZFFRjUjSDnDbI3bncdyqiz6XTU7FnBT1Mfo+6CiuSkogRmXH/DdNQxd8BDLy+h9+
 u0sPxkEqyFJNxR8ViGOhDNoO8coYKEeue6l+KpOcvUhrWYxw21lQpS7RhqTfxf//69Qrg9BCiLj
 jQ9Ur85Rd8aOQ7FwM+OUO4QipLn1/d0GFxpIaY0+higZ34qQMHpmW21LffuEoHsYcoMOHW1xOn7
 P+wDVFvsfUampNAl+bwqLQ7CHQihxrNvydHP3FI9r0S9nx27AKKr5nRr0AZtoIyAIz8rH3t+3B7
 gn2OJFxYXM42eKZdsJ6YLK5KZqzXtxDPO1pE6yzjl2cd/wi1C0nBAPH4sf/50bLqiLMxbewCsWe
 G+RJW8SJKNk6ULlC2ajH+KkUgAHeKSyPJB2OYv5s+JXDT8yxv3/fjrUdRgww/icTHMmFK32rXOn
 h8hD7m7a9XJM7MdqgIovp2Rj2O3lQM=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_224027_982841_1D13487A 
X-CRM114-Status: UNSURE (   8.38  )
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

VGhpcyBwYXRjaCBzZXJpZXMgdHJ5IHRvIGFkZCBpbml0aWFsIHN1cHBvcnQgZm9yIFNwYWNlbWlU
IEszIENvTTI2MC1JRlgKYm9hcmQgd2hpY2ggY29tYmluZXMgYSA2OS42IMOXIDQ1IG1tIGNvbXB1
dGUgbW9kdWxlIHdpdGggYSByZWZlcmVuY2UgY2Fycmllcgpib2FyZC4KClRoZSBmaXJzdCBwYXRj
aCBpbnRyb2R1Y2UgbmV3IGR0IGJpbmRpbmdzIGZvciB0aGUgbW9kdWxlIGFuZCBib2FyZCwgdGhl
CnNlY29uZCBwYXRjaCBlbmFibGUgc3VwcG9ydCBmb3Igc2VyaWFsIGNvbnNvbGUgYW5kIGV0aGVy
bmV0LgoKTGluazogaHR0cHM6Ly9zcGFjZW1pdC5jb20vY29tbXVuaXR5L2RvY3VtZW50L2luZm8/
bGFuZz16aCZub2RlcGF0aD1oYXJkd2FyZS9lY28vazNfY29tMjYwL3Jvb3Rfb3ZlcnZpZXcubWQK
U2lnbmVkLW9mZi1ieTogWWl4dW4gTGFuIDxkbGFuQGtlcm5lbC5vcmc+Ci0tLQpZaXh1biBMYW4g
KDIpOgogICAgICBkdC1iaW5kaW5nczogcmlzY3Y6IHNwYWNlbWl0OiBBZGQgSzMgQ29NMjYwLUlG
WCBib2FyZAogICAgICByaXNjdjogZHRzOiBzcGFjZW1pdDogazM6IEluaXRpYWwgc3VwcG9ydCBm
b3IgQ29NMjYwLUlGWCBib2FyZAoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3NwYWNl
bWl0LnlhbWwgICAgICAgIHwgICA1ICsKIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvTWFr
ZWZpbGUgICAgICAgICAgICAgIHwgICAxICsKIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQv
azMtY29tMjYwLWlmeC5kdHMgICAgIHwgIDIxICsrKwogYXJjaC9yaXNjdi9ib290L2R0cy9zcGFj
ZW1pdC9rMy1jb20yNjAuZHRzaSAgICAgICAgfCAxOTAgKysrKysrKysrKysrKysrKysrKysrCiBh
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLXBpbmN0cmwuZHRzaSAgICAgICB8ICAzMyAr
KysrCiA1IGZpbGVzIGNoYW5nZWQsIDI1MCBpbnNlcnRpb25zKCspCi0tLQpiYXNlLWNvbW1pdDog
ZTI1MThlOGNiMWRkZTY0YWYyZDFiYjI0NjYzOWJiN2VmNzUyM2Y3YQpjaGFuZ2UtaWQ6IDIwMjYw
NTE5LTAyLWszLWNvbTI2MC1pZngtYWEzMjBiOTBlNjU3CgpCZXN0IHJlZ2FyZHMsCi0tICAKWWl4
dW4gTGFuIDxkbGFuQGtlcm5lbC5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
