Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2F4606A326
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 09:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z9YoiFRZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=Z+lDbcjR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=851do28Bcc7lNj/ikpn9WEbsThJbWsbx8SnJDlkECz8=; b=z9YoiFRZS+HI4AbqYzhE+p4KX1
	ZI6Y/2atHtOJSWjGHyusZPBU3h2VgRoPZWlZcYh6yJw1M2Sxsi4PhwLdhsV12EjwSp7b2/4adLLgT
	LPMqdHSLHQqfh63tCQLvdbNL3rQNHaGCGYKGpsrmO/h4bKkCRqNBh3AHjjdZYYDy8czi9mTbOANPv
	AjT3Ka3mVfBt0aw8dqVYV3/p4Dnu224JZ/BwptD/cBZBWx+HbCshbaEkZKVq4Zm45GUiheZ3S/xe5
	JV8wORDGJJXrzbw0VIvTNBiEKGIDyKFGAwonSymLef2r0nZxsr7DrCaMuRe5GSFRIMA0qEsQ0gILP
	F8KUZ6PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4ul-00000006Ejg-0S80;
	Wed, 11 Nov 2026 09:46:47 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4uf-00000006Ei3-3c1R
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 09:46:44 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 721C620D7CF3;
	Wed, 11 Nov 2026 10:46:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 50F8F20D7CF6;
	Wed, 11 Nov 2026 10:46:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 50F8F20D7CF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794390398;
	bh=xWAz9s1Zm6tCb+0l11xtLj2KpMSfrXcF+F2246xyAys=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=Z+lDbcjRD69GiySc9U/dW+NBvMPgz2aCkliPgzrg9mwYu5Rael+voMxXNr1G8MbTa
	 D+yi5dSbdWVpwc0uyetpsor8C9qvTHG/v/f3ycFRMp1frKSPlbDF3H7t3zYTflSH/y
	 5Wr4OzOQlXwnFyDgOcUw2YUDnTDDYHMsPjezMX6Qb0IgiHmefYpnLf0fZk8U7+T5B4
	 gSJwJfeTcBA+th32HWaC2WaQdpjtkPMAf+364nbWjITMEjsWTCU8rPhefqjEFuZHul
	 aRTv+UEl4YbocCbNc33SSn7QAEa9TcNQ9GM7q6h4ELerbPK2tkJXaHOAPonI0OVHdX
	 6W1Jw40c7Lv3w==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id 9-U8xQJ7NFFF; Wed, 11 Nov 2026 10:46:38 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 5D2F220D7CF3;
	Wed, 11 Nov 2026 10:46:37 +0100 (CET)
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
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: net: bluetooth: realtek: Add RTL8852BS
Date: Wed, 11 Nov 2026 10:45:56 +0100
Message-ID: <20261111094557.443481-2-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111094557.443481-1-frederic.mahe@cirad.fr>
References: <20261111094557.443481-1-frederic.mahe@cirad.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_014642_053458_307EA00D 
X-CRM114-Status: UNSURE (   8.67  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIFJUTDg4NTJCUyBpcyBhIFdpLUZpIDYgKyBCbHVldG9vdGggNS4yIGNoaXAgd2l0aCBXaS1G
aSBvbiBTRElPCmFuZCBCbHVldG9vdGggb24gVUFSVCAoSDUpLiBJdHMgQmx1ZXRvb3RoIHBhcnQg
d29ya3Mgd2l0aCB0aGUKUlRMODgyMkNTIGRyaXZlciBkYXRhLCBzbyB1c2UgcmVhbHRlayxydGw4
ODIyY3MtYnQgYXMgZmFsbGJhY2suCgpUaGlzIHBhdGNoIHdhcyBwcmVwYXJlZCB3aXRoIHRoZSBo
ZWxwIG9mIGFuIEFJIGFzc2lzdGFudCAoQ2xhdWRlKSwKd2hpY2ggYWxzbyByYW4gdGhlIHRlc3Rz
LgoKU2lnbmVkLW9mZi1ieTogRnLDqWTDqXJpYyBNYWjDqSA8ZnJlZGVyaWMubWFoZUBjaXJhZC5m
cj4KQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+ClJl
dmlld2VkLWJ5OiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpckBhbGlzdGFpcjIzLm1lPgotLS0K
IC4uLi9iaW5kaW5ncy9uZXQvYmx1ZXRvb3RoL3JlYWx0ZWssYmx1ZXRvb3RoLnlhbWwgICAgIHwg
MTEgKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25l
dC9ibHVldG9vdGgvcmVhbHRlayxibHVldG9vdGgueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9uZXQvYmx1ZXRvb3RoL3JlYWx0ZWssYmx1ZXRvb3RoLnlhbWwKaW5kZXgg
N2Q1NjcxMjJiLi5mZmRmMTNiMDUgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9uZXQvYmx1ZXRvb3RoL3JlYWx0ZWssYmx1ZXRvb3RoLnlhbWwKKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9ibHVldG9vdGgvcmVhbHRlayxibHVl
dG9vdGgueWFtbApAQCAtNCwxNiArNCwxNiBAQAogJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
c2NoZW1hcy9uZXQvYmx1ZXRvb3RoL3JlYWx0ZWssYmx1ZXRvb3RoLnlhbWwjCiAkc2NoZW1hOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKIAotdGl0bGU6IFJU
TDg3MjNCUy9SVEw4NzIzQ1MvUlRMODgyMUNTL1JUTDg4MjJDUyBCbHVldG9vdGgKK3RpdGxlOiBS
VEw4NzIzQlMvUlRMODcyM0NTL1JUTDg4MjFDUy9SVEw4ODIyQ1MvUlRMODg1MkJTIEJsdWV0b290
aAogCiBtYWludGFpbmVyczoKICAgLSBWYXNpbHkgS2hvcnV6aGljayA8YW5hcnNvdWxAZ21haWwu
Y29tPgogICAtIEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyQGFsaXN0YWlyMjMubWU+CiAKIGRl
c2NyaXB0aW9uOgotICBSVEw4NzIzQlMvUlRMODcyM0NTL1JUTDg4MjFDUy9SVEw4ODIyQ1MgaXMg
YSBXaUZpICsgQlQgY2hpcC4gV2lGaSBwYXJ0Ci0gIGlzIGNvbm5lY3RlZCBvdmVyIFNESU8sIHdo
aWxlIEJUIGlzIGNvbm5lY3RlZCBvdmVyIHNlcmlhbC4gSXQgc3BlYWtzCi0gIEg1IHByb3RvY29s
IHdpdGggZmV3IGV4dHJhIGNvbW1hbmRzIHRvIHVwbG9hZCBmaXJtd2FyZSBhbmQgY2hhbmdlCisg
IFJUTDg3MjNCUy9SVEw4NzIzQ1MvUlRMODgyMUNTL1JUTDg4MjJDUy9SVEw4ODUyQlMgaXMgYSBX
aUZpICsgQlQgY2hpcC4KKyAgV2lGaSBwYXJ0IGlzIGNvbm5lY3RlZCBvdmVyIFNESU8sIHdoaWxl
IEJUIGlzIGNvbm5lY3RlZCBvdmVyIHNlcmlhbC4gSXQKKyAgc3BlYWtzIEg1IHByb3RvY29sIHdp
dGggZmV3IGV4dHJhIGNvbW1hbmRzIHRvIHVwbG9hZCBmaXJtd2FyZSBhbmQgY2hhbmdlCiAgIG1v
ZHVsZSBzcGVlZC4KIAogcHJvcGVydGllczoKQEAgLTI4LDYgKzI4LDkgQEAgcHJvcGVydGllczoK
ICAgICAgICAgICAtIGVudW06CiAgICAgICAgICAgICAgIC0gcmVhbHRlayxydGw4ODIxY3MtYnQK
ICAgICAgICAgICAtIGNvbnN0OiByZWFsdGVrLHJ0bDg3MjNicy1idAorICAgICAgLSBpdGVtczoK
KyAgICAgICAgICAtIGNvbnN0OiByZWFsdGVrLHJ0bDg4NTJicy1idAorICAgICAgICAgIC0gY29u
c3Q6IHJlYWx0ZWsscnRsODgyMmNzLWJ0CiAKICAgZGV2aWNlLXdha2UtZ3Bpb3M6CiAgICAgbWF4
SXRlbXM6IDEKLS0gCjIuNDcuMwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
