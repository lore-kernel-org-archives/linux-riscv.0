Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F54E606A32D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 09:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4nV5nzrW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=UhMUXiiS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dOjOvZjIIwujrbgO08uYg8heeIcbe0B/+pZik2wAY+I=; b=4nV5nzrWnuyX1uha0ijMDrZz1j
	HHHL6K5qcod6/gYP2H180imwIFNi4E8CNs4SsfoytrlBwTbwL/nlHe7N9rtz/Bwi32CcWVCKbAYIJ
	TcOgRzQ/4R3dZLLimQI28jFSUg1ZjO3o4quHiuB+iftnrAPjd0VwmXDOQT9pKYtSWsXlCth1e2vny
	6+yCwhc+2PHDnAp0WZriKyv27ZRjG4+Qsdn/K+gkJKwHYMnOX6G7Bwebe20qNaD7KXlxTwti3iqom
	Atj1ADDD5iDnHLiLwp35EhkCYHA8wi4i3TyUNkCh7mSmF2eaWx7CvU+AyoRtQCFdtzI65FRiMNNPb
	tq6OtscA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4uj-00000006EjC-04oN;
	Wed, 11 Nov 2026 09:46:45 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4uf-00000006Ei0-1r4l
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 09:46:43 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 5AE5A20DD1E9;
	Wed, 11 Nov 2026 10:46:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 3177920D7CF3;
	Wed, 11 Nov 2026 10:46:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 3177920D7CF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794390395;
	bh=cSfKq6TaMYfXhvJwtGxYyQkyoPg2VJBA/tCs61AB3jM=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=UhMUXiiSz+gMpFWPXbet/zD2CYIaqCGw+zxZ8+Ap6dH5zT3KGRN1vcbYPKiu+EIZf
	 UeemDeg3xLmuW0mFweA4eKVYxQMPm5O+ZMbO89md+C3tHKawBwl0G/ouDMj6tGWnkM
	 8u4WikCHB8aIUal5JR5yCY+IyzdNW0h496BLiFqbTZJ7mB8rnmgMYIX9F6qzPmNeHV
	 zxYIvyerGXBSApjvS3KPrP9GTud9cMn/oOhOhLZnzfkfvVP4LS9dovQZeG5PYZle/o
	 iFN4mVTRQAGBO4KUP0sQTpKRIwE4ihzj5Q+xHvXB908O2gQQIcYtnk+bCUel0z4VSR
	 xnaZLbQ8iQIDA==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id S_CcOLjJBBvj; Wed, 11 Nov 2026 10:46:35 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 14DC420DD1E9;
	Wed, 11 Nov 2026 10:46:34 +0100 (CET)
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
Subject: [PATCH v2 0/2] Bluetooth for the RTL8852BS on BPI-F3
Date: Wed, 11 Nov 2026 10:45:55 +0100
Message-ID: <20261111094557.443481-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_014641_939102_67C5C5CF 
X-CRM114-Status: UNSURE (   7.16  )
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
IGxvdyksIHNvIHRoZXkgYXJlIGxlZnQgb3V0LgoKQ2hhbmdlcyBpbiB2MjoKLSBQYXRjaCAyOiBz
ZXQgc2xvd191YXJ0MiB0byA0OCBNSHogd2l0aCBhc3NpZ25lZC1jbG9jay1yYXRlcyBpbnN0ZWFk
CiAgb2YgcmVseWluZyBvbiB0aGUgYm9vdGxvYWRlciAoVHJveSkuIENoZWNrZWQgdGhhdCBhIDI0
IE1IeiBzZXR0aW5nCiAgaXMgYXBwbGllZCwgdGhlbiA0OCBNSHouCi0gUGF0Y2ggMTogYWRkIENv
bm9yJ3MgQWNrZWQtYnkgYW5kIEFsaXN0YWlyJ3MgUmV2aWV3ZWQtYnkuCgpMaW5rIHRvIHYxOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYxMTEwMDc0NjA3LjM2MzkxOC0xLWZyZWRlcmlj
Lm1haGVAY2lyYWQuZnIKCkZyw6lkw6lyaWMgTWFow6kgKDIpOgogIGR0LWJpbmRpbmdzOiBuZXQ6
IGJsdWV0b290aDogcmVhbHRlazogQWRkIFJUTDg4NTJCUwogIHJpc2N2OiBkdHM6IHNwYWNlbWl0
OiBlbmFibGUgQmx1ZXRvb3RoIG9uIEJQSS1GMwoKIC4uLi9uZXQvYmx1ZXRvb3RoL3JlYWx0ZWss
Ymx1ZXRvb3RoLnlhbWwgICAgICAgIHwgMTEgKysrKysrKy0tLS0KIGFyY2gvcmlzY3YvYm9vdC9k
dHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzIHwgMTcgKysrKysrKysrKysrKysrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCgpiYXNlLWNv
bW1pdDogNjYyOGU3ZDRjNmIyNWM4ZDE4ZjEzNDVlM2EyMGQyMTgyOWFhZTdlNAotLSAKMi40Ny4z
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
