Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3406CCAC5A7
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 12:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+OjvkZV+7/s6eZxt8ddjp2X8NefwXACQ3sKtHIC7uBQ=; b=3sEdA2uVPq/Xl6
	4PbqGTllOd7TxN7aC76vE8+Hn2rGBIKUyXqOyqkZBHmn9YbakUSjGnj04GrsGIr/U4Xx+ZMH6vjtL
	eR2nHWNV/KTXdf8oqy+gwQ1Ws1DfG7II2RO6p6kUFuOLke95ph8cH2LuhVHvrsolEuZSc6wfT1uDv
	gBjZ0UWAcweIEZNDGhAezIjZpM2nllRE6FaFcz50QiKgrAuljxpZfRpbKUyasDSrU75EVM+K9zx9b
	gePoMqOGroG6cY7XH6ZioRZ4o3mAmmaI+kxC+Y+ao/BdWmbGLcpETi4JZWleWPnFKfyIeq1IMpArN
	SShiJB7xW0uSZ8Xl3YHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0fxg-0000000AMCG-2VBO;
	Mon, 22 Sep 2025 12:48:08 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0fxL-0000000AM7i-1sh9
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 12:48:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758545252; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FLON75iNI9JeHakiKtstQpQY0Ir6xijkmvDbc+pQKZMfTyA9jb5ryUx4wbF9gOxkhEW4ik81Bda4wp+jNwFQ+NhuomroOGnvfuadLWJDjLYIViTCw4MJaqO6+1PvNEsIiH4eXFcbGgLl+mMCnJ3qkCLxdBlRa6JxckaldS4HPL4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758545252; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QQHfWPLq9h9/26EFDezuhABuHqn17sUNy+23WQyGpPU=; 
	b=H+RUeXyAvuzi51F/NpdpfmgLuct9VvfsjU8iwVR5n9dfR/yQJ3onNE3GNyI3+qV+8Qoxhe1mwGmUxwBrqlQnUcIOTDR2L5hdYn1cBe8w3xhPED4ogT4lPtdkulbQd49LQj2peIalt4yLo8KbHmOCDws7Ui9r5nsi+YWGXBr6QaY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758545252;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=QQHfWPLq9h9/26EFDezuhABuHqn17sUNy+23WQyGpPU=;
	b=bxLN3kHHHM0PpnR/N/YnowWACvzX+3ZFxQwHdkbgTlvSh/D5DLMcGjmh/gA59zib
	xF0PLnUAW7kzpyZf+Du4z1D/VuuI/X6OETsEeQSU7xvi4TD3XG0ZSfSdFLb/yjKIPbf
	3KmDtov5L9MENQ3v6HXWcX2T7WStGiHvj7v5nz84=
Received: by mx.zohomail.com with SMTPS id 1758545250603407.16427504257217;
	Mon, 22 Sep 2025 05:47:30 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v2 00/11] riscv: Add initial support for Anlogic DR1V90
Date: Mon, 22 Sep 2025 20:46:30 +0800
Message-Id: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACZF0WgC/2WNQQrCMBBFr1Jm7UgSG2JceQ/pIk3HdkDbkoSgl
 NzdWNy5fA/++xtECkwRLs0GgTJHXuYK6tCAn9w8EvJQGZRQWhgpcAgyW4G9i+xxSHjSiqwj7Xx
 /hrpaA935tRdvXeWJY1rCez/I8mt/LSX/WlmiQG1a4bW01rfmuvL4XIJ7HBP5CbpSygdnsNQ6s
 gAAAA==
X-Change-ID: 20250710-dr1v90-basic-dt-352e9ae5acb8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758545232; l=3345;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=ajgpqeWH1J9OjvBk976S+Q5QHwI27D09dVg+WbxvooQ=;
 b=BM1IXkvoJJUJQu9/EIL9IfPkPgdDl/LrRNrn7XaLuR4FQWU3nNPC6jFTkXc8wd1csYCvwteOC
 WQ7F3pEnccFDX2VF6rfBWZeZtllg70wToOUT18ZIDm6M/IcCmRpR03z
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_054747_863642_16B2FDC7 
X-CRM114-Status: GOOD (  12.72  )
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

VGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBpbml0aWFsIHN1cHBvcnQgZm9yIHRoZSBBbmxv
Z2ljIERSMVY5MCBTb0MKWzFdIGFuZCB0aGUgTWlsaWFua2UgTUxLUEFJLUZTMDEgWzJdIGJvYXJk
LgoKVGhlIERSMVY5MCBpcyBhIFJJU0MtViBiYXNlZCBGUFNvQyBmcm9tIEFubG9naWMsIGZlYXR1
cmluZyBhIE51Y2xlaQpVWDkwMCBbM10gY29yZSBhcyBpdHMgcHJvY2Vzc2luZyBzeXN0ZW0gKFBT
KSBhbmQgOTQsNDY0IExVVHMgaW4gdGhlCnByb2dyYW1tYWJsZSBsb2dpYyAoUEwpIHBhcnQuIFRo
ZSBNaWxpYW5rZSBNTEtQQUktRlMwMSBib2FyZCBpcyBvbmUgb2YKdGhlIGZpcnN0IHBsYXRmb3Jt
cyBiYXNlZCBvbiB0aGlzIFNvQywgd2l0aCBVQVJUMSByb3V0ZWQgdG8gYSBUeXBlLUMKaW50ZXJm
YWNlIGZvciBjb25zb2xlIGFjY2Vzcy4KClRlc3RlZCBvbiB0aGUgTWlsaWFua2UgTUxLUEFJLUZT
MDEgYm9hcmQgd2l0aCBib3RoIHRoZSB2ZW5kb3IncyBPcGVuU0JJCmFuZCB0aGUgbm90LXlldC11
cHN0cmVhbWVkIG1haW5saW5lIE9wZW5TQkkgWzRdLCBhcyB3ZWxsIGFzIHRoZSB2ZW5kb3LigJlz
ClUtQm9vdC4gQmVjYXVzZSB0aGUgdmVuZG9y4oCZcyBPcGVuU0JJIGlzIGxvYWRlZCBhdCAweDFm
MzAwMDAwLCB3ZSBoYXZlCnRvIGFkZGl0aW9uYWxseSByZXNlcnZlIHRoZSBEUkFNIHJlZ2lvbiAw
eDFmZTAwMDAw4oCTMHgxZmZmZmZmZiB0byBwcmV2ZW50Cm92ZXJsYXAgaWYgdXNpbmcgdmVuZG9y
J3MgT3BlblNCSS4KCk5vdGljZTogQSAibm80bHZsIiBib290YXJnIG9yIGRlcGVuZGVuY3kgcGF0
Y2ggWzVdIGlzIGN1cnJlbnRseSByZXF1aXJlZApmb3Igc3VjY2Vzc2Z1bCBib290IG9uIHRoZSBE
UjFWOTAgcGxhdGZvcm0sIHNpbmNlIHRoZSBTb0MgaGFuZ3MgaWYgdGhlCmtlcm5lbCBhdHRlbXB0
cyB0byB1c2UgdW5zdXBwb3J0ZWQgNC1sZXZlbCBvciA1LWxldmVsIHBhZ2luZyBtb2Rlcy4KCkxp
bms6IGh0dHBzOi8vd3d3LmFubG9naWMuY29tL3Byb2R1Y3QvZnBnYS9zYWxkcmFnb24vZHIxIFsx
XQpMaW5rOiBodHRwczovL3d3dy5taWxpYW5rZS5jb20vcHJvZHVjdC1pdGVtLTEwNC5odG1sIFsy
XQpMaW5rOiBodHRwczovL251Y2xlaXN5cy5jb20vcHJvZHVjdC85MDAucGhwIFszXQpMaW5rOiBo
dHRwczovL2dpdGh1Yi5jb20vcGlnbW9yYWwvb3BlbnNiaS90cmVlL2RyMXY5MCBbNF0KTGluazog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNTA3MjItc2F0cC1mcm9tLWZk
dC12MS0wLTViYTIyMjE4ZmE1ZkBwaWdtb3JhbC50ZWNoIFs1XQotLS0KQ2hhbmdlcyBpbiB2MjoK
LSBBZGQgTUFJTlRBSU5FUlMgZW50cnkgZm9yIHRoZSBEUjFWOTAgcGxhdGZvcm0KLSBSZW1vdmUg
dGhlIHJpc2N2LGlzYSBwcm9wZXJ0eSBvZiBjcHUgYW5kIHJlb3JkZXIgcHJvcGVydHlpZXMKLSBG
aXggY2xpbnQgYmFzZSBhZGRyZXNzIGluIHRoZSBkdHNpCi0gQ2hhbmdlIHRoZSBtZW1vcnkgbm9k
ZSB0byBjb3ZlciB0aGUgZnVsbCA1MTJNQiBSQU0gaW4gYm9hcmQgZHRzCi0gTGluayB0byB2MTog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDcyMS1kcjF2OTAtYmFzaWMtZHQtdjEtMC01
NzQwYzUxOTljNDdAcGlnbW9yYWwudGVjaAoKLS0tCkp1bmh1aSBMaXUgKDExKToKICAgICAgZHQt
YmluZGluZ3M6IHZlbmRvci1wcmVmaXhlczogQWRkIEFubG9naWMsIE1pbGlhbmtlIGFuZCBOdWNs
ZWkKICAgICAgZHQtYmluZGluZ3M6IHJpc2N2OiBBZGQgTnVjbGVpIFVYOTAwIGNvbXBhdGlibGVz
CiAgICAgIGR0LWJpbmRpbmdzOiByaXNjdjogQWRkIEFubG9naWMgRFIxVjkwCiAgICAgIGR0LWJp
bmRpbmdzOiB0aW1lcjogQWRkIEFubG9naWMgRFIxVjkwIENMSU5UCiAgICAgIGR0LWJpbmRpbmdz
OiBpbnRlcnJ1cHQtY29udHJvbGxlcjogQWRkIEFubG9naWMgRFIxVjkwIFBMSUMKICAgICAgZHQt
YmluZGluZ3M6IHNlcmlhbDogc25wcy1kdy1hcGItdWFydDogQWRkIEFubG9naWMgRFIxVjkwIHVh
cnQKICAgICAgcmlzY3Y6IEFkZCBBbmxvZ2ljIFNvQyBmYW1seSBLY29uZmlnIHN1cHBvcnQKICAg
ICAgcmlzY3Y6IGR0czogQWRkIGluaXRpYWwgQW5sb2dpYyBEUjFWOTAgU29DIGRldmljZSB0cmVl
CiAgICAgIHJpc2N2OiBkdHM6IGFubG9naWM6IEFkZCBNaWxpYW5rZSBNTEtQQUkgRlMwMSBib2Fy
ZAogICAgICByaXNjdjogZGVmY29uZmlnOiBFbmFibGUgQW5sb2dpYyBTb0MKICAgICAgTUFJTlRB
SU5FUlM6IFNldHVwIHN1cHBvcnQgZm9yIEFubG9naWMgRFIxVjkwIFNvQyB0cmVlCgogLi4uL2lu
dGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwgICAgfCAgMSArCiAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9hbmxvZ2ljLnlhbWwgICAgICAgICB8IDI3ICsrKysr
KysKIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwgIHwg
IDEgKwogLi4uL2JpbmRpbmdzL3NlcmlhbC9zbnBzLWR3LWFwYi11YXJ0LnlhbWwgICAgICAgICAg
fCAgMSArCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFtbCAg
ICB8ICAxICsKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sICAg
ICAgIHwgIDYgKysKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDkgKysrCiBhcmNoL3Jpc2N2L0tjb25maWcuc29jcyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA1ICsrCiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL01ha2VmaWxlICAgICAgICAg
ICAgICAgICAgICAgICB8ICAxICsKIGFyY2gvcmlzY3YvYm9vdC9kdHMvYW5sb2dpYy9NYWtlZmls
ZSAgICAgICAgICAgICAgIHwgIDIgKwogYXJjaC9yaXNjdi9ib290L2R0cy9hbmxvZ2ljL2RyMXY5
MC1tbGtwYWktZnMwMS5kdHMgfCAyOCArKysrKysrCiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FubG9n
aWMvZHIxdjkwLmR0c2kgICAgICAgICAgICB8IDg1ICsrKysrKysrKysrKysrKysrKysrKysKIGFy
Y2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwog
MTMgZmlsZXMgY2hhbmdlZCwgMTY4IGluc2VydGlvbnMoKykKLS0tCmJhc2UtY29tbWl0OiAwN2Uy
N2FkMTYzOTlhZmNkNjkzYmUyMDIxMWIwZGZhZTYzZTA2MTVmCmNoYW5nZS1pZDogMjAyNTA3MTAt
ZHIxdjkwLWJhc2ljLWR0LTM1MmU5YWU1YWNiOAoKQmVzdCByZWdhcmRzLAotLSAKSnVuaHVpIExp
dSA8anVuaHVpLmxpdUBwaWdtb3JhbC50ZWNoPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
