Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93154C61CE8
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zr+Tjica9qbQS2+WYe8ui6oF+u6vsGRhef49g8/zvXg=; b=3kUqPLQfQFrfnJ
	BX/DPR1HS5w+BILQo8WOTGl2uCwyOfIxWEgWCXoz8trCz30RdqugSwI9rArTfNRTF/LiQkDodGt+K
	2tWSoLZFeIKwqFjkBivVSQYKaDir5F99JS6U/SfNBEPOqgMKKYkxRm9bUJUfiMFSJ/+xoBHQyeIV3
	oZrrsXfiuk0u/7jAQq1mABCkUHhlhoeoB4gcxP0yhZnG2r4cXRXIOxmztUX/nDLzTJxhALANEc/vJ
	PpdNJxzC8eCAWzB5GSZRxP1w66zWcMb2/qWHLz/wpdJzBXu/VXmM6MA+MSc9wumAFeuHL508KBlxN
	A92cs2Gk6EpLPNyK1X+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq6x-0000000EjB5-1ddJ;
	Thu, 12 Jun 2025 22:09:27 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjd7-0000000DkMH-1eHi
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 15:14:14 +0000
Date: Thu, 12 Jun 2025 17:14:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749741250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uOZoXB1I46+nODXC8g7QxkLdyXfc3FWgBVKFHXkZNOA=;
	b=vYl1SOK6JnmyoVMdVWBSgD6A7hfZm6BvWuoqH4PEepcb0z7Tv+Aa9l4t/ua3kdIDQI9qpd
	PT82MZ7qkEe2DOPP7uG7knP0q9kbreaeFUpQuPhkjifv2pmcMt3uZYaNCUqIb9LisT/xkF
	OkWJ5TiUyXD8Y22PJ7MLXWR/qI9NkjPm3x1h1Yg8sLkzC/0yniDpMJT53Mg8R1bFUZiGZW
	o7UVabQQytpxP78wZ1uitwsPwDtt34VhyKV6ee9MAyuK8zlCgWnpjQN8SN7+XLaxfnVbM8
	qCyG3ciY/hrcVHDqmnfZpTbbrwk9gMFQfCTDnU8/BKqW4nlt7t6v2dua4U3tlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749741250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uOZoXB1I46+nODXC8g7QxkLdyXfc3FWgBVKFHXkZNOA=;
	b=REdK3K7ncGsHybRmLY5g0/tQS5r+Zop89uDb19CEpmyqCXXTIX4sTiKiix8vvCKi827g9n
	qjJzOacT8iGG56DA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 1/2] RISC-V: sbi: turn sbi_ecall into variadic macro
Message-ID: <20250612170632-59116c0a-6b38-4cd9-8df1-b193251d598c@linutronix.de>
References: <20250612145754.2126147-2-rkrcmar@ventanamicro.com>
 <20250612145754.2126147-3-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250612145754.2126147-3-rkrcmar@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_081413_575926_39BA06B5 
X-CRM114-Status: GOOD (  21.32  )
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

T24gVGh1LCBKdW4gMTIsIDIwMjUgYXQgMDQ6NTc6NTRQTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+IENvdW50aW5nIHRoZSBhcmd1bWVudHMgdG8gc2JpX2VjYWxsKCkgYW5kIHBhZGRp
bmcgd2l0aCB6ZXJvcyBnZXRzIG9sZAo+IHByZXR0eSBxdWljay4gIEl0J3MgYWxzbyBoYXJkZXIg
dG8gZGlzdGluZ3Vpc2ggYSB0YWlsaW5nIDAgYXJndW1lbnQgYW5kCj4gdGhlIHBhZGRpbmcuICBU
aGUgcGF0Y2ggY2hhbmdlcyBzYmlfZWNhbGwoKSB0byBhY2NlcHQgYW55dGhpbmcgYmV0d2VlbiAx
Cj4gYW5kIDggaW50ZWdlciBhcmd1bWVudHMuCj4gCj4gVGhvc2Ugd2hvIGNhbiBjb3VudCBhcmUg
YWxzbyBnaXZlbiBzYmlfZWNhbGwxKCkgdG8gc2JpX2VjYWxsOCgpLCB3aGljaAo+IHRoZSB2YXJp
YWRpYyBtYWdpYyB1c2VzIHVuZGVyIHRoZSBob29kLiAgVGhlIGVycm9yIG1lc3NhZ2VzIHVwb24g
YQo+IHByb2dyYW1tZXIgZXJyb3IgYXJlIGEgYml0IGhhaXJ5LCBhcyBleHBlY3RlZCBvZiBtYWNy
b3MsIGFuZCB0aGUKPiBzdGF0aWNfYXNzZXJ0IGlzIHRoZXJlIHRvIGltcHJvdmUgdGhlbSBhIGJp
dC4KPiAKPiBUaGUgZmluYWwgZ29hbCB3b3VsZCBiZSBhdm9pZCBjbG9iYmVyaW5nIHJlZ2lzdGVy
cyB0aGF0IGFyZSBub3QgdXNlZCBpbgo+IHRoZSBlY2FsbCwgYnV0IHdlIGZpcnN0IGhhdmUgdG8g
Zml4IHRoZSBjb2RlIGdlbmVyYXRpb24gYXJvdW5kCj4gdHJhY2Vwb2ludHMgaWYgc2JpX2VjYWxs
IGlzIGV4cGVjdGVkIHRvIGJlIHVzZWQgaW4gcGF0aHMgd2hlcmUKPiBwZXJmb3JtYW5jZSBpcyBj
cml0aWNhbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVu
dGFuYW1pY3JvLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCB8IDM0
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPiBpbmRl
eCAzNDFlNzQyMzhhYTAuLmM2MmRiNjFiZDAxOCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3NiaS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+IEBA
IC0xMCw2ICsxMCw3IEBACj4gICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+ICAjaW5jbHVkZSA8
bGludXgvY3B1bWFzay5oPgo+ICAjaW5jbHVkZSA8bGludXgvanVtcF9sYWJlbC5oPgo+ICsjaW5j
bHVkZSA8bGludXgvYnVpbGRfYnVnLmg+Cj4gIAo+ICAjaWZkZWYgQ09ORklHX1JJU0NWX1NCSQo+
ICBlbnVtIHNiaV9leHRfaWQgewo+IEBAIC00NjUsOSArNDY2LDQwIEBAIHN0cnVjdCBzYmlyZXQg
X19zYmlfZWNhbGwodW5zaWduZWQgbG9uZyBhcmcwLCB1bnNpZ25lZCBsb25nIGFyZzEsCj4gIAkJ
CSAgdW5zaWduZWQgbG9uZyBhcmcyLCB1bnNpZ25lZCBsb25nIGFyZzMsCj4gIAkJCSAgdW5zaWdu
ZWQgbG9uZyBhcmc0LCB1bnNpZ25lZCBsb25nIGFyZzUsCj4gIAkJCSAgaW50IGZpZCwgaW50IGV4
dCk7Cj4gLSNkZWZpbmUgc2JpX2VjYWxsKGUsIGYsIGEwLCBhMSwgYTIsIGEzLCBhNCwgYTUpCVwK
PiArCj4gKyNkZWZpbmUgc2JpX2VjYWxsMShlKSBcCj4gKwkJX19zYmlfZWNhbGwoMCwgMCwgMCwg
MCwgMCwgMCwgMCwgZSkKPiArI2RlZmluZSBzYmlfZWNhbGwyKGUsIGYpIFwKPiArCQlfX3NiaV9l
Y2FsbCgwLCAwLCAwLCAwLCAwLCAwLCBmLCBlKQo+ICsjZGVmaW5lIHNiaV9lY2FsbDMoZSwgZiwg
YTApIFwKPiArCQlfX3NiaV9lY2FsbChhMCwgMCwgMCwgMCwgMCwgMCwgZiwgZSkKPiArI2RlZmlu
ZSBzYmlfZWNhbGw0KGUsIGYsIGEwLCBhMSkgXAo+ICsJCV9fc2JpX2VjYWxsKGEwLCBhMSwgMCwg
MCwgMCwgMCwgZiwgZSkKPiArI2RlZmluZSBzYmlfZWNhbGw1KGUsIGYsIGEwLCBhMSwgYTIpIFwK
PiArCQlfX3NiaV9lY2FsbChhMCwgYTEsIGEyLCAwLCAwLCAwLCBmLCBlKQo+ICsjZGVmaW5lIHNi
aV9lY2FsbDYoZSwgZiwgYTAsIGExLCBhMiwgYTMpIFwKPiArCQlfX3NiaV9lY2FsbChhMCwgYTEs
IGEyLCBhMywgMCwgMCwgZiwgZSkKPiArI2RlZmluZSBzYmlfZWNhbGw3KGUsIGYsIGEwLCBhMSwg
YTIsIGEzLCBhNCkgXAo+ICsJCV9fc2JpX2VjYWxsKGEwLCBhMSwgYTIsIGEzLCBhNCwgMCwgZiwg
ZSkKPiArI2RlZmluZSBzYmlfZWNhbGw4KGUsIGYsIGEwLCBhMSwgYTIsIGEzLCBhNCwgYTUpIFwK
PiAgCQlfX3NiaV9lY2FsbChhMCwgYTEsIGEyLCBhMywgYTQsIGE1LCBmLCBlKQo+ICAKPiArI2Rl
ZmluZSBfX3NiaV9jb3VudF9hcmdzX21hZ2ljKF8sIGEsIGIsIGMsIGQsIGUsIGYsIGcsIGgsIE4s
IC4uLikgTgo+ICsjZGVmaW5lIF9fc2JpX2NvdW50X2FyZ3MoLi4uKSBcCj4gKwlfX3NiaV9jb3Vu
dF9hcmdzX21hZ2ljKF8sICMjIF9fVkFfQVJHU19fLCA4LCA3LCA2LCA1LCA0LCAzLCAyLCAxLCAw
KQoKVGhpcyBsb29rcyBhIGxvdCBsaWtlIENPVU5UX0FSR1MoKSBmcm9tIGluY2x1ZGUvbGludXgv
YXJncy5oLgoKPiArI2RlZmluZSBfX3NiaV9jb3VudF9hcmdzMiguLi4pIFwKPiArCShzaXplb2Yo
KHVuc2lnbmVkIGxvbmdbXSl7MCwgIyMgX19WQV9BUkdTX199KSAvIHNpemVvZih1bnNpZ25lZCBs
b25nKSAtIDEpCj4gKyNkZWZpbmUgX19zYmlfY29uY2F0X2V4cGFuZGVkKGEsIGIpIGEgIyMgYgoK
Li4uIGFuZCBDT05DQVRFTkFURSgpCgo+ICsjZGVmaW5lIF9fc2JpX2NvbmNhdChuKSBfX3NiaV9j
b25jYXRfZXhwYW5kZWQoc2JpX2VjYWxsLCBuKQo+ICsKPiArLyogc2JpX2VjYWxsIHNlbGVjdHMg
dGhlIGFwcHJvcHJpYXRlIHNiaV9lY2FsbDEgdG8gc2JpX2VjYWxsOCAqLwo+ICsjZGVmaW5lIHNi
aV9lY2FsbCguLi4pICBcCj4gKwkoeyBcCj4gKwkJc3RhdGljX2Fzc2VydChfX3NiaV9jb3VudF9h
cmdzMihfX1ZBX0FSR1NfXykgPD0gOCk7IFwKCldoeSBkb2VzIHRoaXMgbmVlZCB0byB1c2UgX19z
YmlfY291bnRfYXJnczIoKSA/Cgo+ICsJCV9fc2JpX2NvbmNhdChfX3NiaV9jb3VudF9hcmdzKF9f
VkFfQVJHU19fKSkgXAo+ICsJCQkJKF9fVkFfQVJHU19fKTsgXAo+ICsJfSkKPiArCj4gICNpZmRl
ZiBDT05GSUdfUklTQ1ZfU0JJX1YwMQo+ICB2b2lkIHNiaV9jb25zb2xlX3B1dGNoYXIoaW50IGNo
KTsKPiAgaW50IHNiaV9jb25zb2xlX2dldGNoYXIodm9pZCk7Cj4gLS0gCj4gMi40OS4wCj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
