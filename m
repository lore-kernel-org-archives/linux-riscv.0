Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EAEC7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 21:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K0zrQFMGVjGceGae+UNWaCZF7l++yokGUTHzaT2lCJM=; b=SdtlQOtlg1yp7F
	2rw1UglVdSvYH047bzcyZfkUuAFmd0AZetCIuy8qWOuAYzQ1US4khJQxS9U4SkGcQBBEOLyHLsmW4
	yrzfJaGZQEPzXQffE+D0LZVrOA2zYoniYuUXlPBB06ucoPHkBdGtVTHhRhkhgOLrDBc/wGsj+afG/
	RbgI4dZNdGA6DjdzhBiKOAU6M7d5vyGPZpGOZDwJxOYhnBE1w2kP9n7Z9hWI9kgtSHWDeBzJCVbQU
	5SKIqk5BooOu5w58iPos2l1VHBo4O5+dAksdaVJQGNU06HrG0Jm4HV13zUzgJIiAXUg1gaIyyjJVd
	6gcBT5qxH+lm1cf8q8kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q07yQ-00HJtW-0L;
	Fri, 19 May 2023 21:49:18 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q07yL-00HJsT-2J
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 21:49:15 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4QNL8F1tK7z1sG8n;
	Fri, 19 May 2023 23:49:01 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4QNL8D5nw0z1qqlY;
	Fri, 19 May 2023 23:49:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id XyLPMARxDKv3; Fri, 19 May 2023 23:48:59 +0200 (CEST)
X-Auth-Info: UdoOlGJyC/tj1C8t/F+qwKRDlPRVzwm7sF3nVhFHfZv+Z8M1psgK2wdJJpzQJ6gi
Received: from igel.home (aftr-62-216-205-130.dynamic.mnet-online.de [62.216.205.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 19 May 2023 23:48:59 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 79E822C1CCF; Fri, 19 May 2023 23:48:59 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,  Michael Ellerman
 <mpe@ellerman.id.au>,  Nicholas Piggin <npiggin@gmail.com>,  Christophe
 Leroy <christophe.leroy@csgroup.eu>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  linuxppc-dev@lists.ozlabs.org,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
In-Reply-To: <6fc7f0e1-0dde-9b41-0d60-6b0bd65bb630@ghiti.fr> (Alexandre
	Ghiti's message of "Fri, 19 May 2023 13:08:12 +0200")
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
	<20230215143626.453491-2-alexghiti@rivosinc.com>
	<87wn1h5nne.fsf@igel.home>
	<4adb27d2-325d-3ce0-23b1-ec69a973b4bf@ghiti.fr>
	<87ttwi91g0.fsf@igel.home>
	<6fc7f0e1-0dde-9b41-0d60-6b0bd65bb630@ghiti.fr>
X-Yow: YOW!!  Up ahead!  It's a DONUT HUT!!
Date: Fri, 19 May 2023 23:48:59 +0200
Message-ID: <87sfbsvvp0.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_144913_917089_DA0AED99 
X-CRM114-Status: GOOD (  12.52  )
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

T24gTWFpIDE5IDIwMjMsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKCj4gSSBoYXZlIHRlc3RlZCB0
aGUgZm9sbG93aW5nIHBhdGNoIHN1Y2Nlc3NmdWxseSwgY2FuIHlvdSBnaXZlIGl0IGEgdHJ5Cj4g
d2hpbGUgSSBtYWtlIHN1cmUgdGhpcyBpcyB0aGUgb25seSBwbGFjZSBJIGZvcmdvdCB0byBhZGQg
dGhlIC1mbm8tcGllCj4gZmxhZz8KPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9N
YWtlZmlsZSBiL2FyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlCj4gaW5kZXggZmJkY2NjMjE0MThh
Li4xNTM4NjRlNGYzOTkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUK
PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZQo+IEBAIC0yMyw2ICsyMywxMCBAQCBp
ZmRlZiBDT05GSUdfRlRSQUNFCj4gwqBDRkxBR1NfUkVNT1ZFX2FsdGVybmF0aXZlLm8gPSAkKEND
X0ZMQUdTX0ZUUkFDRSkKPiDCoENGTEFHU19SRU1PVkVfY3B1ZmVhdHVyZS5vID0gJChDQ19GTEFH
U19GVFJBQ0UpCj4gwqBlbmRpZgo+ICtpZmRlZiBDT05GSUdfUkVMT0NBVEFCTEUKPiArQ0ZMQUdT
X2FsdGVybmF0aXZlLm8gKz0gLWZuby1waWUKPiArQ0ZMQUdTX2NwdWZlYXR1cmUubyArPSAtZm5v
LXBpZQo+ICtlbmRpZgo+IMKgaWZkZWYgQ09ORklHX0tBU0FOCj4gwqBLQVNBTl9TQU5JVElaRV9h
bHRlcm5hdGl2ZS5vIDo9IG4KPiDCoEtBU0FOX1NBTklUSVpFX2NwdWZlYXR1cmUubyA6PSBuCgpJ
IGNhbiBjb25maXJtIHRoYXQgdGhpcyBmaXhlcyB0aGUgY3Jhc2guCgotLSAKQW5kcmVhcyBTY2h3
YWIsIHNjaHdhYkBsaW51eC1tNjhrLm9yZwpHUEcgS2V5IGZpbmdlcnByaW50ID0gNzU3OCBFQjQ3
IEQ0RTUgNEQ2OSAyNTEwICAyNTUyIERGNzMgRTc4MCBBOURBIEFFQzEKIkFuZCBub3cgZm9yIHNv
bWV0aGluZyBjb21wbGV0ZWx5IGRpZmZlcmVudC4iCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
