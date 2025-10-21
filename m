Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386FECCD1A5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 09:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BpDl7IAyE+OWCZrSdgHxaDIegCMGiPKis45EesuBvak=; b=oeev2386gejr3X
	CVJIsCWczoliqttJNOnMHki5xlDsZ83n/ec53YsXH935j03UQVAomXStEIqApjgQ8pGeEae7ksU2x
	i9x6ffg0aUAzDIKiE/98fNXXcIFy73vOsBt/FEAy5yihG/N8JsGNmP4a+kMG90g+vXcLdvaVX3J5/
	wYJDVbgKKaRvepQsDGuV7PDbwa7punkbR809pLqM4LSoi9zkI4yCClY9dEG3dDP0TBKm+soqwJTVH
	/RJjZjjVoqUgAnslzpmqJYmZSoBGEkgQ6CuL/r4RHM4cmz0OH0s+rKWyolXqrLAEG1TYTaUurewSC
	L72SWExc097Teu1p4YKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8vA-0000000GV1V-395F;
	Tue, 21 Oct 2025 09:44:48 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8v6-0000000GUy6-2zUf
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 09:44:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761039860; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NnzBGQLYNBCXKQJzYf3bBsAtiXzhu7UoLkvTu7ddrt1jrxpTt6/OsT3D14KW/4tJ/XRT4f4baqOBwAAFs++G+GcA+5udPQ/iX/e6ON4S98gCWOmJQviL8oWpKMcfsAAWGQLoXDpEc6YtVFKqNZaLEAMM8gB9j+i/AaaEzMtdU2o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761039860; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=15xJqilDviN6GeZoWciapgWlMTam4VZt04d8Xq7VHbc=; 
	b=aXQDbhjFWPFyzf3KCq+Hss3ySTNm91V1m1Y9jn/MCd/93MgC1cXuoSc4VrWvndnzXu8wWJnTZbGaEAQH94zJIR8I3DJBEfjf/2jwvL7oKOIfTbkOftNbvlYhorzFfayLWeUH9YHSxkz6S+6roGe5wbWVpQkeWm/cAnaJtK0c348=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761039860;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=15xJqilDviN6GeZoWciapgWlMTam4VZt04d8Xq7VHbc=;
	b=HEh5qm4oRyBn8D/ZMACqQ41On4stzIqQj1U1jyEP97OK7NvxnC+YF4+1m6ExNibN
	exImK/5tuEaPxu6z8Nejg61U+IUK6bL1OsdsRaJ4nh4SCWBBWvkB8ta7Z+xRsSkK4hQ
	o7Clah0iQ+MD4QHeKKVxe3WWCpzxVk9BI2YfVxuc=
Received: by mx.zohomail.com with SMTPS id 1761039855417529.1083617434861;
	Tue, 21 Oct 2025 02:44:15 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v3 00/13] riscv: Add initial support for Anlogic DR1V90
Date: Tue, 21 Oct 2025 17:41:35 +0800
Message-Id: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAE9V92gC/2XNQQ6CMBCF4auQrq2ZDlSoK+9hXJR2hElUSEsaD
 eHuFmLiguX/kvlmFpECUxTnYhaBEkceXjnKQyFcb18dSfa5BQJqqBVIH1QyIFsb2Uk/yVIjGUv
 aurYR+WoMdOf3Jl5vuXuO0xA+24Ok1vVnodpZSUmQuq7AaWWMq+rLyN1zCPZxnMj1YvUS/g2Du
 DcwG6fKY6MBXFvujGVZvhaM0Iz2AAAA
X-Change-ID: 20250710-dr1v90-basic-dt-352e9ae5acb8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Junhui Liu <junhui.liu@pigmoral.tech>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Inochi Amaoto <inochiama@outlook.com>, 
 sophgo@lists.linux.dev, linux-serial@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761039846; l=3529;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=HhYm2wgmjnUxkDSARQK8RR3OyXC2WBjXA6RAFCc0u4E=;
 b=WuAubXbtDtHedNzHkVtHXi+tn5DscdWLgHql03MT3do1bmP0JG6WX8sNrVZLsfnLXG8bWZH/8
 YrmOvuywyfvDiHNYy9JWYrrJUA9KBEwp9gQi6atXP2kPggDv3joqGOY
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_024445_021872_F50CA54E 
X-CRM114-Status: GOOD (  13.17  )
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

VGhpcyBpbnRyb2R1Y2VzIGluaXRpYWwgc3VwcG9ydCBmb3IgdGhlIEFubG9naWMgRFIxVjkwIFNv
QyBbMV0gYW5kIHRoZQpNaWxpYW5rZSBNTEtQQUktRlMwMSBbMl0gYm9hcmQuCgpUaGUgRFIxVjkw
IGlzIGEgUklTQy1WIGJhc2VkIEZQU29DIGZyb20gQW5sb2dpYywgZmVhdHVyaW5nIGEgTnVjbGVp
ClVYOTAwIFszXSBjb3JlIGFzIGl0cyBwcm9jZXNzaW5nIHN5c3RlbSAoUFMpIGFuZCA5NCw0NjQg
TFVUcyBpbiB0aGUKcHJvZ3JhbW1hYmxlIGxvZ2ljIChQTCkgcGFydC4gVGhlIE1pbGlhbmtlIE1M
S1BBSS1GUzAxIGJvYXJkIGlzIG9uZSBvZgp0aGUgZmlyc3QgcGxhdGZvcm1zIGJhc2VkIG9uIHRo
aXMgU29DLCB3aXRoIFVBUlQxIHJvdXRlZCB0byBhIFR5cGUtQwppbnRlcmZhY2UgZm9yIGNvbnNv
bGUgYWNjZXNzLgoKVGVzdGVkIG9uIHRoZSBNaWxpYW5rZSBNTEtQQUktRlMwMSBib2FyZCB3aXRo
IGJvdGggdGhlIHZlbmRvcidzIE9wZW5TQkkKYW5kIHRoZSBub3QteWV0LXVwc3RyZWFtZWQgbWFp
bmxpbmUgT3BlblNCSSBbNF0sIGFzIHdlbGwgYXMgdGhlIHZlbmRvcuKAmXMKVS1Cb290LiBCZWNh
dXNlIHRoZSB2ZW5kb3LigJlzIE9wZW5TQkkgaXMgbG9hZGVkIGF0IDB4MWYzMDAwMDAsIHdlIGhh
dmUKdG8gYWRkaXRpb25hbGx5IHJlc2VydmUgdGhlIERSQU0gcmVnaW9uIDB4MWZlMDAwMDDigJMw
eDFmZmZmZmZmIHRvIHByZXZlbnQKb3ZlcmxhcCBpZiB1c2luZyB2ZW5kb3IncyBPcGVuU0JJLgoK
TGluazogaHR0cHM6Ly93d3cuYW5sb2dpYy5jb20vcHJvZHVjdC9mcGdhL3NhbGRyYWdvbi9kcjEg
WzFdCkxpbms6IGh0dHBzOi8vd3d3Lm1pbGlhbmtlLmNvbS9wcm9kdWN0LWl0ZW0tMTA0Lmh0bWwg
WzJdCkxpbms6IGh0dHBzOi8vbnVjbGVpc3lzLmNvbS9wcm9kdWN0LzkwMC5waHAgWzNdCkxpbms6
IGh0dHBzOi8vZ2l0aHViLmNvbS9waWdtb3JhbC9vcGVuc2JpL3RyZWUvZHIxdjkwIFs0XQotLS0K
Q2hhbmdlcyBpbiB2MzoKLSBVcGRhdGUgRFQgYmluZGluZyB0byB1c2UgQUNMSU5UIGluc3RlYWQg
b2YgQ0xJTlQKLSBEcm9wIE1BSU5UQUlORVJTIHBhdGNoCi0gUmViYXNlIG9uIHY2LjE4LXJjMQot
IExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA5MjItZHIxdjkwLWJh
c2ljLWR0LXYyLTAtNjRkMjg1MDBjYjM3QHBpZ21vcmFsLnRlY2gKCkNoYW5nZXMgaW4gdjI6Ci0g
QWRkIE1BSU5UQUlORVJTIGVudHJ5IGZvciB0aGUgRFIxVjkwIHBsYXRmb3JtCi0gUmVtb3ZlIHRo
ZSByaXNjdixpc2EgcHJvcGVydHkgb2YgY3B1IGFuZCByZW9yZGVyIHByb3BlcnR5aWVzCi0gRml4
IGNsaW50IGJhc2UgYWRkcmVzcyBpbiB0aGUgZHRzaQotIENoYW5nZSB0aGUgbWVtb3J5IG5vZGUg
dG8gY292ZXIgdGhlIGZ1bGwgNTEyTUIgUkFNIGluIGJvYXJkIGR0cwotIExpbmsgdG8gdjE6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA3MjEtZHIxdjkwLWJhc2ljLWR0LXYxLTAtNTc0
MGM1MTk5YzQ3QHBpZ21vcmFsLnRlY2gKCi0tLQpKdW5odWkgTGl1ICgxMyk6CiAgICAgIGR0LWJp
bmRpbmdzOiB2ZW5kb3ItcHJlZml4ZXM6IEFkZCBBbmxvZ2ljLCBNaWxpYW5rZSBhbmQgTnVjbGVp
CiAgICAgIGR0LWJpbmRpbmdzOiByaXNjdjogQWRkIE51Y2xlaSBVWDkwMCBjb21wYXRpYmxlcwog
ICAgICBkdC1iaW5kaW5nczogcmlzY3Y6IEFkZCBBbmxvZ2ljIERSMVY5MAogICAgICBkdC1iaW5k
aW5nczogaW50ZXJydXB0LWNvbnRyb2xsZXI6IEFkZCBBbmxvZ2ljIERSMVY5MCBQTElDCiAgICAg
IGR0LWJpbmRpbmdzOiBpbnRlcnJ1cHQtY29udHJvbGxlcjogQWRkIEFubG9naWMgRFIxVjkwIEFD
TElOVCBNU1dJCiAgICAgIGR0LWJpbmRpbmdzOiBpbnRlcnJ1cHQtY29udHJvbGxlcjogQWRkIEFu
bG9naWMgRFIxVjkwIEFDTElOVCBTU1dJCiAgICAgIGR0LWJpbmRpbmdzOiB0aW1lcjogQWRkIEFu
bG9naWMgRFIxVjkwIEFDTElOVCBNVElNRVIKICAgICAgZHQtYmluZGluZ3M6IHNlcmlhbDogc25w
cy1kdy1hcGItdWFydDogQWRkIEFubG9naWMgRFIxVjkwIHVhcnQKICAgICAgaXJxY2hpcC9hY2xp
bnQtc3N3aTogQWRkIE51Y2xlaSBVWDkwMCBzdXBwb3J0CiAgICAgIHJpc2N2OiBBZGQgQW5sb2dp
YyBTb0MgZmFtbHkgS2NvbmZpZyBzdXBwb3J0CiAgICAgIHJpc2N2OiBkdHM6IEFkZCBpbml0aWFs
IEFubG9naWMgRFIxVjkwIFNvQyBkZXZpY2UgdHJlZQogICAgICByaXNjdjogZHRzOiBhbmxvZ2lj
OiBBZGQgTWlsaWFua2UgTUxLUEFJIEZTMDEgYm9hcmQKICAgICAgcmlzY3Y6IGRlZmNvbmZpZzog
RW5hYmxlIEFubG9naWMgU29DCgogLi4uL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGlj
LTEuMC4wLnlhbWwgICAgfCAgIDEgKwogLi4uL3RoZWFkLGM5MDAtYWNsaW50LW1zd2kueWFtbCAg
ICAgICAgICAgICAgICAgICAgfCAgMTcgKystLQogLi4uL3RoZWFkLGM5MDAtYWNsaW50LXNzd2ku
eWFtbCAgICAgICAgICAgICAgICAgICAgfCAgIDQgKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3YvYW5sb2dpYy55YW1sICAgICAgICAgfCAgMjcgKysrKysrCiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sICB8ICAgMSArCiAuLi4vYmluZGluZ3Mv
c2VyaWFsL3NucHMtZHctYXBiLXVhcnQueWFtbCAgICAgICAgICB8ICAgMSArCiAuLi4vYmluZGlu
Z3MvdGltZXIvdGhlYWQsYzkwMC1hY2xpbnQtbXRpbWVyLnlhbWwgICB8ICAxNyArKy0tCiAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCAgICAgICB8ICAgNiArKwog
YXJjaC9yaXNjdi9LY29uZmlnLnNvY3MgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDUg
KysKIGFyY2gvcmlzY3YvYm9vdC9kdHMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAxICsKIGFyY2gvcmlzY3YvYm9vdC9kdHMvYW5sb2dpYy9NYWtlZmlsZSAgICAgICAgICAgICAg
IHwgICAyICsKIGFyY2gvcmlzY3YvYm9vdC9kdHMvYW5sb2dpYy9kcjF2OTAtbWxrcGFpLWZzMDEu
ZHRzIHwgIDI4ICsrKysrKwogYXJjaC9yaXNjdi9ib290L2R0cy9hbmxvZ2ljL2RyMXY5MC5kdHNp
ICAgICAgICAgICAgfCAxMDAgKysrKysrKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2NvbmZp
Z3MvZGVmY29uZmlnICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2lycWNo
aXAvaXJxLWFjbGludC1zc3dpLmMgICAgICAgICAgICAgICAgICB8ICAgMyArLQogMTUgZmlsZXMg
Y2hhbmdlZCwgMjAxIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21t
aXQ6IDNhODY2MDg3ODgzOWZhYWRiNGYxYTZkZDcyYzMxNzljMWRmNTY3ODcKY2hhbmdlLWlkOiAy
MDI1MDcxMC1kcjF2OTAtYmFzaWMtZHQtMzUyZTlhZTVhY2I4CgpCZXN0IHJlZ2FyZHMsCi0tIApK
dW5odWkgTGl1IDxqdW5odWkubGl1QHBpZ21vcmFsLnRlY2g+CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
