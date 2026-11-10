Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BED1606A339
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 07:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KaPfYXxt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=c3QPy4YH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5CH62Or309hfkH3Dhs/KrxEj2DmMU9FAjBnGXIEAv6E=; b=KaPfYXxtqD4QgUzQoSRZ2gd36z
	8OmDu15HcfypSWbFw/BPkVXqwYe4j4gxvkK0LqUVojcdyz6b67lke9uCEsvbKFU95KuPXANKsKlMR
	cfJ9Dja7MAwojLHa7IVRJGmtBxunN6/Ix/RIKYtYhz73MKX4ASCZrvCaKyc8DVcNbgeY981Qsi3T2
	2UJLnpAz3p7dVlgkttTPTY3lX/04Qi6mhOzBqASGyqc+nwdkyh7dMaIsHeyv/DScIlyv/nujFRNqV
	FqiHO4i73XJ+t+EXHcw+/IXVfbuz/VEJ7Wwrey1gZKxGMYQ3vByMmVJOSOawzX0IVBX8BYwjKayv4
	1CwZ3blA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgZa-000000030Ss-16R4;
	Tue, 10 Nov 2026 07:47:18 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgZU-000000030Ii-3hOo
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 07:47:17 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id E98E320D78F8;
	Tue, 10 Nov 2026 08:47:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id C9D7620D7CF7;
	Tue, 10 Nov 2026 08:47:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr C9D7620D7CF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794296829;
	bh=mfTY212zApa5ehOLo+920M5IDmH72kkgNtIxDrvSizo=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=c3QPy4YHf6uoEBpjCpO2aq4SeEQklbaMPaB1SxoJmL2pfYAxXnHOmBbM8Ce/6SjZe
	 KzQr3/RswObM+fKbEg9CRG3nMVtl0fCbdx8QkkbAxwUc/ZfK7TwVgb6tzDXr+PyTwq
	 h5uqtUMtjamdqozSHKzmxJRYVIp5e30Hievr6oF4i5fhN6YyEHhl2dPQ9fGuFtm8sg
	 VGEQKHGWArHOp6vUQTfeGshTf4A/puahEadfkW98UJT6W0tSFHLMnp5x8spZLQekWn
	 uWkI4lm4Lt+t5ILJZ1bSeClwARJOapjSZkEzWs61hSsb2Er55ggiaOJxd2EdEthyj0
	 mFFmgwD4T564g==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id QGSqc_bMMjO0; Tue, 10 Nov 2026 08:47:09 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id CF35F20D78F8;
	Tue, 10 Nov 2026 08:47:08 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-bluetooth@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
Subject: [PATCH 0/2] Bluetooth for the RTL8852BS on BPI-F3
Date: Tue, 10 Nov 2026 08:46:05 +0100
Message-ID: <20261110074607.363918-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234713_101933_EF4E4C93 
X-CRM114-Status: UNSURE (   6.73  )
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIEJQSS1GMyAoU3BhY2VtaVQgSzEpIGNhcnJpZXMgYW4gUlRMODg1MkJTIFdpLUZpICsgQmx1
ZXRvb3RoIG1vZHVsZS4KV2ktRmkgKFNESU8pIGhhcyBubyB1cHN0cmVhbSBkcml2ZXIsIGJ1dCBC
bHVldG9vdGggb24gVUFSVCB3b3JrcyB3aXRoCnRoZSBleGlzdGluZyBoY2lfaDUvYnRydGwgY29k
ZSBhbmQgbGludXgtZmlybXdhcmUncyBydGw4ODUyYnMgZmlsZXMuCgpQYXRjaCAxIGRvY3VtZW50
cyB0aGUgY29tcGF0aWJsZSwgd2l0aCBydGw4ODIyY3MtYnQgYXMgZmFsbGJhY2ssIHNvIG5vCmRy
aXZlciBjaGFuZ2UgaXMgbmVlZGVkLiBQYXRjaCAyIGVuYWJsZXMgaXQgb24gdGhlIEJQSS1GMy4K
CkdQSU8gdXNhZ2Ugd2FzIHRlc3RlZCBvbmUgbGluZSBhdCBhIHRpbWU6IEdQSU8gNjMgaXMgdGhl
IHBvd2VyL2VuYWJsZQpsaW5lIGFuZCBHUElPIDY0IHRoZSBkZXZpY2Ugd2FrZSBsaW5lLiBUaGUg
dmVuZG9yIERUIGFsc28gZHJpdmVzCkdQSU8gNjUgYW5kIEdQSU8gNjc7IEJsdWV0b290aCB3b3Jr
cyB3aXRob3V0IHRoZW0gKGFuZCBSU1NJIGlzIHRoZQpzYW1lIHdpdGggR1BJTyA2NyBoaWdoIG9y
IGxvdyksIHNvIHRoZXkgYXJlIGxlZnQgb3V0LgoKRnLDqWTDqXJpYyBNYWjDqSAoMik6CiAgZHQt
YmluZGluZ3M6IG5ldDogYmx1ZXRvb3RoOiByZWFsdGVrOiBBZGQgUlRMODg1MkJTCiAgcmlzY3Y6
IGR0czogc3BhY2VtaXQ6IGVuYWJsZSBCbHVldG9vdGggb24gQlBJLUYzCgogLi4uL2JpbmRpbmdz
L25ldC9ibHVldG9vdGgvcmVhbHRlayxibHVldG9vdGgueWFtbCB8IDExICsrKysrKystLS0tCiBh
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cyAgIHwgMTUgKysr
KysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgoKYmFzZS1jb21taXQ6IDY2MjhlN2Q0YzZiMjVjOGQxOGYxMzQ1ZTNhMjBkMjE4Mjlh
YWU3ZTQKLS0gCjIuNDcuMwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
