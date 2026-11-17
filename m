Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC58606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 13:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cLud6ehO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gb7PcsfV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6Qvc1Yul2lUuh75G1kLqRtWZf4qBCg+Gt8+bjfgv2HQ=; b=cLud6ehO8C+blsgAm2d0EwNQyB
	UDz0rKb9qdFBag3PmxBPaGRso+Cny3rRaqCpqT8HmcUWfTv4YfNyFnxlkoJHAmHIZghuWR6ykeuEH
	DWJQpIqyqhphBViH0zzRJNsmqONfEqtT8xRGEV3uKPZPr5zG6J8Bz4S4tjl8Q8GOtV7sp0cMsTbs5
	gM0irSQP5Zl8V4NaMwcI05nrq2qmWWwhZY+VlhHHRDsFgx8bbsKnI2zGyE1djaNEbVlZzttoAXtRj
	rWqmriDH16cVjrkPK+0JnvDIEsPXPR+/R7mC+H7rwqPw+rHRDbrq2L3YFtx7AwaWxZOzA8nyTDzXE
	YNQ27DCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJIv-00000005xCL-2p8n;
	Tue, 17 Nov 2026 13:32:57 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJIr-00000005x9f-2LPL
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 13:32:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 18A4FC79A97;
	Tue, 17 Nov 2026 13:32:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A98DD5FC81;
	Tue, 17 Nov 2026 13:32:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59F7211BC0024;
	Tue, 17 Nov 2026 14:32:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922364; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tiAy5PQmLZ5hEMe6QeP0gUFXTZHoS740/eNTgW6sRH8=;
	b=gb7PcsfVBsbwlRm0khs9/jf2fe/f9ewHuUPO2aFrqIUZmXRjU0W86K651Oeo2/jfkgs7ua
	ya1ms7sNUnc+lmdn3ziMHBAG9XuFuGatmtQzgvXtCT/TthMUW780a7tNvABZGYws3GZrM1
	KQrGOV8pIC6dTnY6ihRIxN/3soH0PEcZK7ClMdEM8fP+tUnMN6vDVcjWIQLIvQzU1q+nAF
	753uplltgp2ia/m6hs+oU9FzjvAxJhk7bl5e0mI3rOSj2NUVqOmutAJ/GRozkYEjVcB5e8
	9zGDqafEiCbeWlAVIvr90prelyF1jLsMAZx9Zb0Leh5sVbWjYjEQBCRjFgejjA==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Tue, 17 Nov 2026 14:32:38 +0100
Message-Id: <DMXIVFWKAM8A.29COLJ2EC6MUM@bootlin.com>
Subject: Re: [PATCH net] net: macb: limit jumbo frames to the RX buffer size
Cc: <linux-riscv@lists.infradead.org>, "Han Gao" <rabenda.cn@gmail.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Jingkun Zheng"
 <zhengjingkun@iscas.ac.cn>
To: <gaohan@iscas.ac.cn>, "Conor Dooley" <conor.dooley@microchip.com>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Punnaiah
 Choudary Kalluri" <punnaia@xilinx.com>, "Harini Katakam"
 <harini.katakam@xilinx.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261114-macb-jumbo-jml-v1-1-f501395eaf9e@iscas.ac.cn>
In-Reply-To: <20261114-macb-jumbo-jml-v1-1-f501395eaf9e@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_053253_764929_7053042A 
X-CRM114-Status: GOOD (  14.21  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGVsbG8gSGFuLAoKT24gU2F0IE5vdiAxNCwgMjAyNiBhdCAxMDo1MSBBTSBDRVQsIEhhbiBHYW8g
d3JvdGU6Cj4gKy8qIExvbmdlc3QgZnJhbWUgdGhhdCBmaXRzIGluIGEgc2luZ2xlIFJYIGJ1ZmZl
ciAqLwo+ICtzdGF0aWMgdTMyIGdlbV9qdW1ib19tYXhfbGVuKHN0cnVjdCBtYWNiICpicCkKPiAr
ewo+ICsJdTMyIGxlbiA9IGJwLT5jdHgtPnJ4X2J1ZmZlcl9zaXplOwo+ICsKPiArCS8qIEZyYW1l
IGRhdGEgc3RhcnRzIE5FVF9JUF9BTElHTiBieXRlcyBpbnRvIHRoZSBidWZmZXIgd2l0aG91dCBS
U0MgKi8KPiArCWlmICghKGJwLT5jYXBzICYgTUFDQl9DQVBTX1JTQykpCj4gKwkJbGVuIC09IE5F
VF9JUF9BTElHTjsKPiArCj4gKwlyZXR1cm4gbWluKGxlbiwgYnAtPmp1bWJvX21heF9sZW4pOwo+
ICt9CgpXaHkgZG8KCiAgIGdlbV93cml0ZWwoYnAsIEpNTCwgbWluKGJwLT5jdHgtPnJ4X2J1ZmZl
cl9zaXplLCBicC0+anVtYm9fbWF4X2xlbikpOwogICAvLyBvcgogICBnZW1fd3JpdGVsKGJwLCBK
TUwsIG1pbihicC0+Y3R4LT5yeF9idWZmZXJfc2l6ZSAtIE5FVF9JUF9BTElHTiwgYnAtPmp1bWJv
X21heF9sZW4pKTsKCkFuZCBub3QganVzdAoKICAgZ2VtX3dyaXRlbChicCwgSk1MLCBicC0+Y3R4
LT5yeF9idWZmZXJfc2l6ZSk7CiAgIC8vIG9yCiAgIGdlbV93cml0ZWwoYnAsIEpNTCwgYnAtPmN0
eC0+cnhfYnVmZmVyX3NpemUgLSBORVRfSVBfQUxJR04pOwoKQXNrZWQgYW5vdGhlciB3YXk6IGlu
IHdoYXQgY2FzZSBjYW4gcnhfYnVmZmVyX3NpemUgPiBqdW1ib19tYXhfbGVuPyBJdAp0aGlzIGNh
biBldmVyIG9jY3VyLCBpdCBzb3VuZHMgbGlrZSBhIGJ1Zy4gSXQgbWFrZXMgbm8gc2Vuc2UgdG8g
aGF2ZQpidWZmZXJzIGxhcmdlciB0aGFuIHRoZSBtYXgganVtYm8gbGVuZ3RoLiBJZiB3ZSBmaXgg
aXQsIHRoZW4gd2UgY2FuIHVzZQp0aGUgc2ltcGxlciBmb3JtLgoKKFRoaXMgaXMgdGhlIHNhbWUg
cmVwb3J0IGFzIFNhc2hpa286IHlvdXIgbWluKCkgcGlja3MganVtYm9fbWF4X2xlbiBvbmx5CmZv
ciBzb21lIHJlYWxseSBzcGVjaWZpYyB2YWx1ZXMgb2YgTVRVLikKCj4gIC8qIENvbmZpZ3VyZSB0
aGUgcmVjZWl2ZSBETUEgZW5naW5lCj4gICAqIC0gdXNlIHRoZSBjb3JyZWN0IHJlY2VpdmUgYnVm
ZmVyIHNpemUKPiAgICogLSBzZXQgYmVzdCBidXJzdCBsZW5ndGggZm9yIERNQSBvcGVyYXRpb25z
Cj4gQEAgLTMyODYsNiArMzI5OCwxMyBAQCBzdGF0aWMgdm9pZCBtYWNiX2NvbmZpZ3VyZV9kbWEo
c3RydWN0IG1hY2IgKmJwKQo+ICAJCW5ldGRldl9kYmcoYnAtPm5ldGRldiwgIkNhZGVuY2UgY29u
ZmlndXJlIERNQSB3aXRoIDB4JTA4eFxuIiwKPiAgCQkJICAgZG1hY2ZnKTsKPiAgCQlnZW1fd3Jp
dGVsKGJwLCBETUFDRkcsIGRtYWNmZyk7Cj4gKwo+ICsJCS8qIEp1bWJvIGZyYW1lcyBhcmUgYWx3
YXlzIGVuYWJsZWQsIHNvIGxpbWl0IHRoZWlyIGxlbmd0aCB0bwo+ICsJCSAqIHdoYXQgZml0cyBp
biBvbmUgUlggYnVmZmVyLiBMb25nZXIgZnJhbWVzIHdvdWxkIG90aGVyd2lzZSBiZQo+ICsJCSAq
IHNwbGl0IGFjcm9zcyBzZXZlcmFsIGRlc2NyaXB0b3JzIGFuZCBkcm9wcGVkIGJ5IGdlbV9yeCgp
Lgo+ICsJCSAqLwo+ICsJCWlmICgoYnAtPmNhcHMgJiBNQUNCX0NBUFNfSlVNQk8pICYmIGJwLT5q
dW1ib19tYXhfbGVuKQo+ICsJCQlnZW1fd3JpdGVsKGJwLCBKTUwsIGdlbV9qdW1ib19tYXhfbGVu
KGJwKSk7Cj4gIAl9Cj4gIH0KPiAgCj4gQEAgLTM0MjIsOCArMzQ0MSw2IEBAIHN0YXRpYyB2b2lk
IG1hY2JfaW5pdF9odyhzdHJ1Y3QgbWFjYiAqYnApCj4gIAkJY29uZmlnIHw9IE1BQ0JfQklUKE5C
Qyk7CS8qIE5vIEJyb2FkQ2FzdCAqLwo+ICAJY29uZmlnIHw9IG1hY2JfZGJ3KGJwKTsKPiAgCW1h
Y2Jfd3JpdGVsKGJwLCBOQ0ZHUiwgY29uZmlnKTsKPiAtCWlmICgoYnAtPmNhcHMgJiBNQUNCX0NB
UFNfSlVNQk8pICYmIGJwLT5qdW1ib19tYXhfbGVuKQo+IC0JCWdlbV93cml0ZWwoYnAsIEpNTCwg
YnAtPmp1bWJvX21heF9sZW4pOwo+ICAJYnAtPnJ4X2ZybV9sZW5fbWFzayA9IE1BQ0JfUlhfRlJN
TEVOX01BU0s7Cj4gIAlpZiAoYnAtPmNhcHMgJiBNQUNCX0NBUFNfSlVNQk8pCj4gIAkJYnAtPnJ4
X2ZybV9sZW5fbWFzayA9IE1BQ0JfUlhfSkZSTUxFTl9NQVNLOwoKVGhhbmtzLAoKLS0KVGjDqW8g
TGVicnVuLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0
cHM6Ly9ib290bGluLmNvbQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
