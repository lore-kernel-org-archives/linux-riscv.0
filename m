Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8C4CD4F5E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 05:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C0GgdjzsFo+ejyg1VS1tsmruPNQgwY7SDOqpUm2n6gg=; b=qlIpAc1vDdbAxe
	dMiRgoKHeUCwWxNaEC155r2LnLETV2LK3TOf+APFDt+7sO1TWvMw5XqAn96pqgXR03sck05k6MGVG
	YR9Jp54i/BFR/RnO60FTii3senY4zwMDrVuWiHSHIDWtLXkEjUY49lqxteNYqqVM6/Xoqa8/ZRLOg
	dgGPIjZdxLlYTOzWcj2QhwDC3eOAe3WcxfEkJsNQ2OBLaPnxXe8PW4/xKKrpO8Qp7OgHSAVUtT9kI
	MiONrefwihiPc6k4DZTFagnoMz1N1Tae8t77EAWaZeJDFE4mmNb7MbQXO76XCz1UiyD2OarINRRo9
	TmkJnmK9OoH6nL7n1rQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZfV-00000003a9a-1aeL;
	Wed, 20 May 2026 05:40:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZfT-00000003a8s-2u6J
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 05:40:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C94B434F9;
	Wed, 20 May 2026 05:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6EC81F00893;
	Wed, 20 May 2026 05:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779255631;
	bh=hskoKxPxA+rLIeZyASuc/YUUv6op0WDEVVkfPNeqohk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Dq83AZeRXJ4IcFOF7fZsAQD7mVhlOaxAPawFCNxJbqpm+AnIjPLgfVf8iVdNeSgul
	 oRfW6PzvSmuXDzSB76Qqke2C9V+pUxsm8JmrlbgaNk6XjFvcL7x2rJOzugHyUVIhhq
	 w9pXEOorlb3tcdkWitRjdnd3l0XYSJcnecVp2mRfQDqD858X7M4vQOIz/LaugYV+cO
	 DNa+4D6IgBA5EBA7NTd8M9+ORGzLgi+qk6Eb1pYo6KGIO+VWqQB0tznS4AZicZ8sVR
	 0ip0AO76j8KY4LaGn4xHKkNmZhSXFdvQAH/QzvQre7vAT7qs55lFZZ8z0wD3YhwcDt
	 ND93SkUt7t0lA==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 20 May 2026 05:40:09 +0000
Subject: [PATCH 1/2] dt-bindings: riscv: spacemit: Add K3 CoM260-IFX board
MIME-Version: 1.0
Message-Id: <20260520-02-k3-com260-ifx-v1-1-3e17055dd488@kernel.org>
References: <20260520-02-k3-com260-ifx-v1-0-3e17055dd488@kernel.org>
In-Reply-To: <20260520-02-k3-com260-ifx-v1-0-3e17055dd488@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309; i=dlan@kernel.org;
 h=from:subject:message-id; bh=PTWNrj2EOir8tvFCl0D2bADOwX8TZBknr7SRkq5Rz3I=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqDUlA0mQ0YFFU03ko5IeGqfkGdKZyHj2e4tjj7
 5JjycfJ5oiJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCag1JQBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1BYQ/9GHycg3ko7+ZDaIVjMyv3apvYP0IW0d6fArF0XVSEQJHyozmu1qQs/
 5//wzFpfks0mG1n7e+/bimxn0XWleI2w6hIH7jY4/ReD11ZbxLVKq8zs1WadMwXvWRMMPoK9ig1
 6ipSTUdSb4rbsgLJD/F3R7S7bElVbWUcgSIIUntU2SxIKCG0vz1iYQabFHwwq5LAysGAMTIIC62
 QUyxudWWO8S2WiSPPwh0lCDQOVEdJ1PeImqcEC1Pqv3cKuWwDezUFZONEQRZU+xYPC4pmN6tpzH
 L1+Wy1wTcM/nxwUg+5ZyRLt7gN2nwCzfjFx4xovfYw6CSyKwDOyB3mnHaWsifCea+EJYcBM54nR
 rSSFCNPWz8u+SRPa8rFI6SYEBmrfsqbAeZmC9NcPBkNRksimT83YbFZkAmx4f3jrocy002RAq/P
 fyNQuV6DRru7qsv8HuP3jVJj4O136OzHX83R2FYpIIy6C6QJDBbf3ABNzVJBdOKMvMV4asTIgTE
 LcGpsMjV6V8fLitWfFzAX8hqfVgx/LDSTGfdA+prHX6FZf8hB9lMx0OnvBETXo0pS+Q4YJcjMrw
 QKiWzVKQ/44u+T+wiHhkw3DzoY7FPT/8CQ+MbIfdafSuSGyzLI6YUgG2t507aAufyCBgdLTVhiY
 UadylKV5i7/xELaNsHrB0n5xnjdfpM=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_224031_772746_64FD1643 
X-CRM114-Status: UNSURE (   7.45  )
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

VGhlIFNwYWNlbWlUIEszIENvTTI2MC1JRlggYm9hcmQgY29tYmluZXMgYSA2OS42IMOXIDQ1IG1t
IGNvbXB1dGUgbW9kdWxlCndpdGggYSByZWZlcmVuY2UgY2FycmllciBib2FyZC4KClRoZSBtb2R1
bGUgaW50ZWdyYXRlcyB1cCB0byAzMkdCIExQRERSNSBtZW1vcnksIFVGUyBzdG9yYWdlLCBNaWNy
byBTRApjYXJkIHNsb3QgYW5kIGluY2x1ZGVzIGludGVyZmFjZXMgc3VjaCBhcyBkdWFsIE1JUEkg
Q1NJLTIgY29ubmVjdG9ycywKTS4yIGV4cGFuc2lvbiwgVVNCIDMuMCwgR2lnYWJpdCBFdGhlcm5l
dCwgRGlzcGxheVBvcnQsIGFuZCBhIDQwLXBpbgpleHBhbnNpb24gaGVhZGVyLgoKVGhlIGNhcnJp
ZXIgYm9hcmQgaXMgaW50ZW5kZWQgYXMgYSBnZW5lcmFsLXB1cnBvc2UgZGV2ZWxvcG1lbnQgcGxh
dGZvcm0KZm9yIENvTTI2MCBtb2R1bGUgYW5kIGV4cG9zZXMgaW50ZXJmYWNlcyBmb3IgYWxsIG9m
IHN0b3JhZ2UsIGRpc3BsYXksCm5ldHdvcmtpbmcsIGFuZCBjYW1lcmEgY29ubmVjdGl2aXR5LgoK
U2lnbmVkLW9mZi1ieTogWWl4dW4gTGFuIDxkbGFuQGtlcm5lbC5vcmc+Ci0tLQogRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3NwYWNlbWl0LnlhbWwgfCA1ICsrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3NwYWNlbWl0LnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc3BhY2VtaXQueWFtbAppbmRleCBhZjgwMzAyNDJi
ZGMuLjMxMWJiY2NiYTBiYSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jpc2N2L3NwYWNlbWl0LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3Jpc2N2L3NwYWNlbWl0LnlhbWwKQEAgLTMyLDYgKzMyLDExIEBAIHByb3BlcnRp
ZXM6CiAgICAgICAgICAgICAgIC0gZGVlcGNvbXB1dGluZyxmbWwxM3YwNQogICAgICAgICAgICAg
ICAtIHNwYWNlbWl0LGszLXBpY28taXR4CiAgICAgICAgICAgLSBjb25zdDogc3BhY2VtaXQsazMK
KyAgICAgIC0gaXRlbXM6CisgICAgICAgICAgLSBlbnVtOgorICAgICAgICAgICAgICAtIHNwYWNl
bWl0LGszLWNvbTI2MC1pZngKKyAgICAgICAgICAtIGNvbnN0OiBzcGFjZW1pdCxrMy1jb20yNjAK
KyAgICAgICAgICAtIGNvbnN0OiBzcGFjZW1pdCxrMwogCiBhZGRpdGlvbmFsUHJvcGVydGllczog
dHJ1ZQogCgotLSAKMi41NC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
