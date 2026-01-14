Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EC2D37E3F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 15:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CAV/UVEsrnSuK/PwFPC1H+CANDeopg4rZ0Z9iytbw80=; b=gZ3MRhWqVE+y2G
	UpxSWOS/8zmbl7YfIe53Nvr5qh/uNKX0NwCgWtCIgvubungydMyvVS42JzuHb/Bovr7G0+BOzUEUR
	GsBoeAgoEuTaeF1MEgQVlPG0hzWXI1Jb9TilC/N5oVRVOGEx71lD2MGGCm1IcC+Ai7yijPDiZKU+s
	MrIwOCbatDHTfaiFrDsWyMMFoaKQ+CyGnkypsH/WZ0uTeh6pbBQnznuqzCjOdwGV2KF7OOT+xIzqF
	cSdq+2kEni7WEU8131LnJpBbN+1Eo9ECNxtRXG2+I5o+yM6R9fqBO7GIRawkEm2zVNhx+7tRvEh6l
	iHpVdDYUE5JOxVl5VPmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2fg-00000009evH-0B0J;
	Wed, 14 Jan 2026 15:20:32 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2fc-00000009etY-2jIl
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 15:20:31 +0000
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail-out.m-online.net (Postfix) with ESMTP id 4drqYd0Smxz1sG85;
	Wed, 14 Jan 2026 16:20:21 +0100 (CET)
DKIM-Signature: a=rsa-sha256; bh=mHZZ0KURIYjXNQW21LQQdYVVTlRyrVa90ReXGzgftjQ=;
        c=relaxed/relaxed; d=muenchen-mail.de;
        h=Message-ID:Date:To:From:Subject;
        s=r1; t=1768404021; v=1;
        b=Do4XY6p7/ewR4EOYaaVHMIo2AWIJWLtS8VmVSa9tXGn8GrhO/3V95ex+YaO1ATF5
         g18rvG9DrN82LXoyozD3V/P4zIaGuDBzUGNdSJlx2i0rc8In91rAtEYFjcpifRd8
         xIZs+9jvPQxs78l1i1sOAVcLrSsJQrhzRcsCtGdmU6DC6NYbn01qMyxmqzLf8Xjl
         wcjl//XFR7+NmrtixLFjs61GWgujjOgN4EsZc0IzUlvhZyWVcIOm1tBtPevxwj/6
         k7Ah4xzE/0dC0WAOSmdlVlDXn8/Vh3aO/131VMdz+1HAYT/8j3iMaJxmubgD1KY3
         LdF8QwoP+cQw/V8tIuTmcw==
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4drqYb0BTxz1sG7h;
	Wed, 14 Jan 2026 16:20:18 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4drqYZ6NTHz1qqlS;
	Wed, 14 Jan 2026 16:20:18 +0100 (CET)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id HBeVECIhIt79; Wed, 14 Jan 2026 16:20:18 +0100 (CET)
X-Auth-Info: fIl9We/AYfMnzXUmWxQIzYFoB2RwnC3rHSpiYyd9AbcturscGXjw9vaBOEYoqyeJ
Received: from wiesel.intern (aftr-82-135-82-125.dynamic.mnet-online.de [82.135.82.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 14 Jan 2026 16:20:18 +0100 (CET)
Received: from [IPV6:fdea:9b79:8984:1:da92:e2a3:da12:183b] (unknown [IPv6:fdea:9b79:8984:1:da92:e2a3:da12:183b])
	by wiesel.intern (Postfix) with ESMTP id E029979A1164;
	Wed, 14 Jan 2026 16:20:17 +0100 (CET)
Message-ID: <029e5e79-ae9c-4d31-b75f-8f48f359d539@muenchen-mail.de>
Date: Wed, 14 Jan 2026 16:20:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Linus Walleij <linusw@kernel.org>,
 linux-riscv@lists.infradead.org
From: Thomas Gerner <thomas.gerner@muenchen-mail.de>
Subject: Typo in pinctrl-th1520.c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_072029_769093_3FE8C168 
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgppbiB0aGUgcGluY29udHJvbCBmaWxlIGZvciB0aGUgVEgxNTIwIFNPQyBhIHBhZCBp
cyBuYW1lZCB3cm9uZy4gCkFjY29yZGluZyB0byBUSDE1MjAgU3lzdGVtIFVzZXIgTWFudWFsLCBj
aGFwdGVyIDMuMi4xIChwYWdlIDM4KSBwYWQgOCBpbiAKcGFkIGdyb3VwIDMgaXMgbmFtZWQgUVNQ
STBfRDNfSE9MRC4gV2l0aCB0aGUgd3JvbmcgbmFtZSBRU1BJMV9EM19IT0xEIApvbmUgY2Fubm90
IHNlbGVjdCB0aGUgcmlnaHQgcGFkIGluIGEgZGV2aWNlIHRyZWUgYmVjYXVzZSB0aGUgbmFtZSBp
cyBub3QgCnVuaXF1ZS7CoFFTUEkxX0QzX0hPTEQgaXMgZGVmaW5lZCBpbiBwYWQgZ3JvdXAgMi4g
VGhpcyBwYXRjaCBmaXhlcyB0aGUgCnRoZSBwYWQgbmFtZS4KCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3BpbmN0cmwvcGluY3RybC10aDE1MjAuYyAKYi9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC10aDE1
MjAuYwppbmRleCBlNjQxYmFkNjcyOGMuLjgzZTljOWY3NzM3MCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9waW5jdHJsL3BpbmN0cmwtdGgxNTIwLmMKKysrIGIvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwt
dGgxNTIwLmMKQEAgLTI4Nyw3ICsyODcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBpbmN0cmxf
cGluX2Rlc2MgCnRoMTUyMF9ncm91cDNfcGluc1tdID0gewogwqAgwqAgwqAgwqAgVEgxNTIwX1BB
RCg1LMKgIFFTUEkwX0QwX01PU0ksIFFTUEksIFBXTSzCoCBJMlMswqAgR1BJTywgX19fXywgCl9f
X18sIDApLAogwqAgwqAgwqAgwqAgVEgxNTIwX1BBRCg2LMKgIFFTUEkwX0QxX01JU08sIFFTUEks
IFBXTSzCoCBJMlMswqAgR1BJTywgX19fXywgCl9fX18sIDApLAogwqAgwqAgwqAgwqAgVEgxNTIw
X1BBRCg3LMKgIFFTUEkwX0QyX1dQLMKgIMKgUVNQSSwgUFdNLMKgIEkyUyzCoCBHUElPLCBfX19f
LCAKX19fXywgMCksCi3CoCDCoCDCoCDCoFRIMTUyMF9QQUQoOCzCoCBRU1BJMV9EM19IT0xELCBR
U1BJLCBfX19fLCBJMlMswqAgR1BJTywgX19fXywgCl9fX18sIDApLAorwqAgwqAgwqAgwqBUSDE1
MjBfUEFEKDgswqAgUVNQSTBfRDNfSE9MRCwgUVNQSSwgX19fXywgSTJTLMKgIEdQSU8sIF9fX18s
IApfX19fLCAwKSwKIMKgIMKgIMKgIMKgIFRIMTUyMF9QQUQoOSzCoCBJMkMyX1NDTCzCoCDCoCDC
oCBJMkMswqAgVUFSVCwgX19fXywgR1BJTywgX19fXywgCl9fX18sIDApLAogwqAgwqAgwqAgwqAg
VEgxNTIwX1BBRCgxMCwgSTJDMl9TREEswqAgwqAgwqAgSTJDLMKgIFVBUlQsIF9fX18sIEdQSU8s
IF9fX18sIApfX19fLCAwKSwKIMKgIMKgIMKgIMKgIFRIMTUyMF9QQUQoMTEsIEkyQzNfU0NMLMKg
IMKgIMKgIEkyQyzCoCBfX19fLCBfX19fLCBHUElPLCBfX19fLCAKX19fXywgMCksCi0tLQoKQmVz
dCByZWdhcmRzClRob21hcwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
