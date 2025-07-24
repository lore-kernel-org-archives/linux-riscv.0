Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338BDC87FCF
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 17:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q29nQqvnDFv9QgDDTGhSuMAW25HPb+B3BC4OK5bGdUA=; b=LWhLLxUrHzCwmQ
	oCH5gUcYQMtmslqqJpnOhqDHi8KMmMfdkr4HV4673EO3BB8eQL493PVwi3D2vzvc2irPkXF9ohdsV
	d2lu7JHwUjQHDU1AGR/KIwN10W0BDHnm+3csOJtVGqZcHpnFiX69vy1OvWTqof3ZpS/6HwOBY2LEf
	jpkZT+qBm6509A3Zlrq6rVuVYSH1sKfJCqqDYV+nWQVggvvJgFgWnJ42FL6cKP+sK+j2x4Qw+3luy
	RIWXYQK0uoHS19UibXrNxWBBLgUO3Tc/h6WeZpY8Zvk9dKxGnHProVWrzr0qpgbOgsCdSO51Fu6yx
	VCzIkvfA8QsQtX5mUyaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezVX-000000086C1-0lyO;
	Thu, 24 Jul 2025 17:13:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexnD-00000007pqO-3bNp
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 15:23:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F0995C677B;
	Thu, 24 Jul 2025 15:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EB48C4CEF9;
	Thu, 24 Jul 2025 15:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753370614;
	bh=lAX1g5gop0MIerHUXBGrgL0yJFgFvnxoPSCMB7zGP24=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZePNR7yK580sLeSuLGIkVx1swhrbANednGD3UdzZCfEqeXsQwclGioY4JIwuJJaoq
	 xxIAwYBF177nmMyYT5gMZv0Mha9qXzFX/32ji/uevoCRNb4Cc0Ki8uzRzPFwexR+On
	 oNzU/0XZhCcc5TzRMKkB7aHQLpry4ufP50qx3Jncbd3L63x/6jfnQn4Og4P4eqmU82
	 95eGlu0qpIBJp7ArXR1YofYLCF0NTlICMZrbTlH1hU1WH2oryLup1+GGrWlVuSq1P1
	 NkAPLKhDAwweYZsKygl0HdBxeSGgnVbZjELOD39mz7bt4QGyCUb5NV2lm87yEwxlLs
	 DZCy5UwLWE1Ug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544C5C83F26;
	Thu, 24 Jul 2025 15:23:34 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Thu, 24 Jul 2025 17:23:27 +0200
Subject: [PATCH v5 3/7] riscv: Add xmipsexectl instructions
MIME-Version: 1.0
Message-Id: <20250724-p8700-pause-v5-3-a6cbbe1c3412@htecgroup.com>
References: <20250724-p8700-pause-v5-0-a6cbbe1c3412@htecgroup.com>
In-Reply-To: <20250724-p8700-pause-v5-0-a6cbbe1c3412@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753370612; l=1601;
 i=aleksa.paunovic@htecgroup.com; s=20250514; h=from:subject:message-id;
 bh=UiyuNpcwz9mf/w7Z4EE+JWW7TpbY11AARRS/HoJAhyY=;
 b=kXnwDRLnXwjTZ4lr4Rsy/L+SAr13tjMAbNWyOnuvvm6e4zSvz3YLRNrh0IR7dMh+8xMX09US2
 Wwjwe0PaWVDBXThnyVKeFAMlGqY3bEoiyc6llpvBoqixkCM53+F0yMu
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=gFVSVYLKAgJiS5qCnDyUMGOFuczv8C6o0UmRs+fgisA=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250514
 with auth_id=403
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_082336_018974_799A99BD 
X-CRM114-Status: UNSURE (   8.22  )
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
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQWxla3NhIFBhdW5vdmljIDxhbGVrc2EucGF1bm92aWNAaHRlY2dyb3VwLmNvbT4KCkFk
ZCB4bWlwc2V4ZWN0bCBpbnN0cnVjdGlvbiBvcGNvZGVzLiBUaGlzIGluY2x1ZGVzIHRoZSBNSVBT
LlBBVVNFLApNSVBTLkVIQiwgYW5kIE1JUFMuSUhCIGluc3RydWN0aW9ucy4KClNpZ25lZC1vZmYt
Ynk6IEFsZWtzYSBQYXVub3ZpYyA8YWxla3NhLnBhdW5vdmljQGh0ZWNncm91cC5jb20+ClJldmll
d2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Ci0tLQogYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS92ZW5kb3JfZXh0ZW5zaW9ucy9taXBzLmggfCAxOSArKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVuZG9yX2V4dGVuc2lvbnMvbWlwcy5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS92ZW5kb3JfZXh0ZW5zaW9ucy9taXBzLmgKaW5kZXggMTMzZTU1
OTg1ZDgyN2NlN2Q2MDU3MDA0YjU5MGJkY2JiZGIxZWM4Yy4uZWE4Y2E3NDdkNjkxZGYyZTllZTdl
NTM2MGY4MDBmYmRjY2ZlMzk0NSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92
ZW5kb3JfZXh0ZW5zaW9ucy9taXBzLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZW5k
b3JfZXh0ZW5zaW9ucy9taXBzLmgKQEAgLTE1LDQgKzE1LDIzIEBAIHN0cnVjdCByaXNjdl9pc2Ff
dmVuZG9yX2V4dF9kYXRhX2xpc3Q7CiBleHRlcm4gc3RydWN0IHJpc2N2X2lzYV92ZW5kb3JfZXh0
X2RhdGFfbGlzdCByaXNjdl9pc2FfdmVuZG9yX2V4dF9saXN0X21pcHM7CiAjZW5kaWYKIAorLyog
RXh0ZW5zaW9uIHNwZWNpZmljIGluc3RydWN0aW9ucyAqLworCisvKgorICogQWxsIG9mIHRoZSB4
bWlwc2V4ZWN0bCBleHRlbnNpb24gaW5zdHJ1Y3Rpb25zIGFyZQorICog4oCYaGludOKAmSBlbmNv
ZGluZ3Mgb2YgdGhlIFNMTEkgaW5zdHJ1Y3Rpb24sCisgKiB3aXRoIHJkID0gMCwgcnMxID0gMCBh
bmQgaW1tID0gMSBmb3IgSUhCLCBpbW0gPSAzIGZvciBFSEIsCisgKiBhbmQgaW1tID0gNSBmb3Ig
UEFVU0UuCisgKiBNSVBTLlBBVVNFIGlzIGFuIGFsdGVybmF0aXZlIG9wY29kZSB3aGljaCBpcyBp
bXBsZW1lbnRlZCB0byBoYXZlIHRoZQorICogc2FtZSBiZWhhdmlvciBhcyBQQVVTRSBvbiBzb21l
IE1JUFMgUklTQ1YgY29yZXMuCisgKiBNSVBTLkVIQiBjbGVhcnMgYWxsIGV4ZWN1dGlvbiBoYXph
cmRzIGJlZm9yZSBhbGxvd2luZworICogYW55IHN1YnNlcXVlbnQgaW5zdHJ1Y3Rpb25zIHRvIGV4
ZWN1dGUuCisgKiBNSVBTLklIQiBjbGVhcnMgYWxsIGluc3RydWN0aW9uIGhhemFyZHMgYmVmb3Jl
CisgKiBhbGxvd2luZyBhbnkgc3Vic2VxdWVudCBpbnN0cnVjdGlvbnMgdG8gZmV0Y2guCisgKi8K
KworI2RlZmluZSBNSVBTX1BBVVNFCSIuNGJ5dGUgMHgwMDUwMTAxM1xuXHQiCisjZGVmaW5lIE1J
UFNfRUhCCSIuNGJ5dGUgMHgwMDMwMTAxM1xuXHQiCisjZGVmaW5lIE1JUFNfSUhCCSIuNGJ5dGUg
MHgwMDEwMTAxM1xuXHQiCisKICNlbmRpZiAvLyBfQVNNX1JJU0NWX1ZFTkRPUl9FWFRFTlNJT05T
X01JUFNfSAoKLS0gCjIuMzQuMQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
