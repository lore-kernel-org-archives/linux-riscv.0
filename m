Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0A7C54798
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 11:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4uP0MLVpvN7/pKYZsJYEPlngY0yfD2uuCHBT3ca1yQ0=; b=1fGkm0JBcarmmp
	VRVJykAm/F1Agw1AqS6C3ILtBW7PG2B4qr9p32WZQ+zE3BeAsc0NBG0RtviGPfGmOmSS2dCGKQDAB
	dqdbXB/fMo/o0xlK7YZHKejVtR969GdW0ZBC4yMQMm3TANLMo3B/xQqxbQnkzJEp6Vpnx/HU1/0dE
	p0LI12EcaCdm2CLeJi8L3iYv7C6EzH6aPlS4TCVVDFT6SAuquw1cTTrXPod23AKqvOV+qbLKmQ0YL
	2uKUvQfKk69KhkL2QAt9O2WFRgYSqTXxh1+lxkYMhIUMHwqZgEL2FffiLj/EntkTWRMuyHRRX+E0e
	Ffw0cxfF1GEnoZFKxBKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdTt6-000000099v4-1283;
	Fri, 23 Feb 2024 11:38:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdTsu-000000099q7-1E9J
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 11:38:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D5A2F63468
	for <linux-riscv@lists.infradead.org>; Fri, 23 Feb 2024 11:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E808C43394
	for <linux-riscv@lists.infradead.org>; Fri, 23 Feb 2024 11:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708688310;
	bh=116xpys7yjCSkyBR2OGGkCMcaaI2l9iVnyOx1rjebAg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pms79pBChz0nkRQsFvR2ahjDe/LVhojAT4rJoZnRJXjsFLG+uNhTp9Fo//V184IEj
	 FiwGpnNSfIoO2aCHf92DnJ8yO3zjbaCOBSjQx2GK3gdGCK0IsxqTwJRw93KGsclxBh
	 DbAD4/B73HaydAvWv/xI3bHnPRee1Sg0Ia7Zp/DHL7+rXJoNWxo1kc1O6J3AnyY3h7
	 9xOsWjO+zXokSe4ZprkE/JshbV+fnzcDZbcM2AGa+0f3f8txL7VQUabUhe23GX3JlR
	 53OA5T/yEBg0uBY6ZkshZKyDhfc8DS6D6vkDONmC1N8CdKQyhxMAJmbVM4w7rBBcDI
	 DOv8+oS0Qla5g==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a3e7f7b3d95so83661666b.3
        for <linux-riscv@lists.infradead.org>; Fri, 23 Feb 2024 03:38:30 -0800 (PST)
X-Gm-Message-State: AOJu0YxTxgPWNU9kl+F11ouwVRyCid7pYeexDZPP4NwPYdQ+Qi/0TNQj
	9ZsPi+D6EyW6W6FuMxXCPQvZHkUzpA7zAGRnjyUWn+DCXdOpR1AodOe6jPg57SKCWDb2uKGZJKg
	f95gq2L2vMSRMT5NlcFeZOcAJXFg=
X-Google-Smtp-Source: AGHT+IFxp2op2E69+zKx217J1AB635H6FnBGhyGsE94AZgqR846Zkn1i5J47V+fFwlgSfAwmJYQhCFXRBaPay4AnZRI=
X-Received: by 2002:a17:906:1710:b0:a3e:f4c9:b90c with SMTP id
 c16-20020a170906171000b00a3ef4c9b90cmr1236149eje.64.1708688308949; Fri, 23
 Feb 2024 03:38:28 -0800 (PST)
MIME-Version: 1.0
References: <20240223-tidings-shabby-607f086cb4d7@spud>
In-Reply-To: <20240223-tidings-shabby-607f086cb4d7@spud>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 23 Feb 2024 19:38:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRs-vycC1yTWiKrpy6kUw5uyjFFngESWe9EFdX-UZA+8w@mail.gmail.com>
Message-ID: <CAJF2gTRs-vycC1yTWiKrpy6kUw5uyjFFngESWe9EFdX-UZA+8w@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: Ignore V from the riscv,isa DT property on
 older T-Head CPUs
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, charlie@rivosinc.com, palmer@dabbelt.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_033833_126476_8402241A 
X-CRM114-Status: GOOD (  29.63  )
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

T24gRnJpLCBGZWIgMjMsIDIwMjQgYXQgNzozMeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5j
LmNvbT4KPgo+IEJlZm9yZSBhdHRlbXB0aW5nIHRvIHN1cHBvcnQgdGhlIHByZS1yYXRpZmljYXRp
b24gdmVyc2lvbiBvZiB2ZWN0b3IKPiBmb3VuZCBvbiBvbGRlciBULUhlYWQgQ1BVcywgZGlzYWxs
b3cgInYiIGluIHJpc2N2LGlzYSBvbiB0aGVzZQo+IHBsYXRmb3Jtcy4gVGhlIGRlcHJlY2F0ZWQg
cHJvcGVydHkgaGFzIG5vIGNsZWFyIHdheSB0byBjb21tdW5pY2F0ZQo+IHRoZSBzcGVjaWZpYyB2
ZXJzaW9uIG9mIHZlY3RvciB0aGF0IGlzIHN1cHBvcnRlZCBhbmQgbXVjaCBvZiB0aGUgdmVuZG9y
Cj4gcHJvdmlkZWQgc29mdHdhcmUgcHV0cyAidiIgaW4gdGhlIGlzYSBzdHJpbmcuIHJpc2N2LGlz
YS1leHRlbnNpb25zCj4gc2hvdWxkIGJlIHVzZWQgaW5zdGVhZC4gVGhpcyBzaG91bGQgbm90IGJl
IHRvbyBtdWNoIG9mIGEgYnVyZGVuIGZvcgo+IHRoZXNlIHN5c3RlbXMsIGFzIHRoZSB2ZW5kb3Ig
c2hpcHBlZCBkZXZpY2V0cmVlcyBhbmQgZmlybXdhcmUgZG8gbm90Cj4gd29yayB3aXRoIGEgbWFp
bmxpbmUga2VybmVsIGFuZCB3aWxsIHJlcXVpcmUgdXBkYXRpbmcuCj4KPiBXZSBjYW4gbGltaXQg
dGhpcyByZXN0cmljdGlvbiB0byBvbmx5IGlnbm9yZSB2IGluIHJpc2N2LGlzYSBvbiBDUFVzCj4g
dGhhdCByZXBvcnQgVC1IZWFkJ3MgdmVuZG9yIElEIGFuZCBhIHplcm8gbWFyY2hpZC4gTmV3ZXIg
VC1IZWFkIENQVXMKPiB0aGF0IHN1cHBvcnQgdGhlIHJhdGlmaWVkIHZlcnNpb24gb2YgdmVjdG9y
IHNob3VsZCByZXBvcnQgbm9uLXplcm8KPiBtYXJjaGlkLCBhY2NvcmRpbmcgdG8gR3VvIFJlbiBb
MV0uCkFja2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KClRoeCwgdGhpcyBoZWxw
cyB0aGUgbmV3ZXN0IGFwcGxpY2F0aW9uIGRpc2FibGUgdmVjdG9yXzEwIHdoZW4gb24gdGhlCm9s
ZCBYdWFuVGllIHByb2Nlc3Nvci4KCj4KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1yaXNjdi9DQUpGMmdUUnk1ZUs3Mz1kNnM3Q1Z5OW05cEI4cDRyQW9NSE0zY1pGd3pnPUF1
RjdUREFAbWFpbC5nbWFpbC5jb20vIFsxXQo+IEZpeGVzOiBkYzY2NjdhNGU3ZTMgKCJyaXNjdjog
RXh0ZW5kaW5nIGNwdWZlYXR1cmUuYyB0byBkZXRlY3QgVi1leHRlbnNpb24iKQo+IFNpZ25lZC1v
ZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IENvLWRldmVsb3Bl
ZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IC0tLQo+
IEknZCBmb3Jnb3R0ZW4gYWJvdXQgdGhpcyBwYXRjaCwgdGhlIHBsYW4gaGFkIGJlZW4gdG8gc2l0
IG9uIGl0IHVudGlsCj4gc29tZW9uZSBhY3R1YWxseSByZXBvcnRlZCBlbmNvdW50ZXJpbmcgdGhp
cywgYnV0IFBhbG1lciBhc2tlZCBtZSB0bwo+IHJlc2VuZCB0aGlzIGFzIHBhcnQgb2YgcmV2aXZp
bmcgdGhlIGF0dGVtcHQgdG8gbWFpbmxpbmUgdGhlIGJhc2ljCj4gc3VwcG9ydCBmb3IgdmVjdG9y
IG9uIHRoZXNlIGRldmljZXMuCj4KPiBJIGd1ZXNzIHRoZSByaXNjdixpc2EtZXh0ZW5zaW9ucyBz
dXBwb3J0IGFjdHVhbGx5IGxhbmRlZCBhZnRlciB0aGUgdjIKPiB3YXMgd3JpdHRlbiwgc28gdjMg
aXMgbGVzcyBjb21wbGljYXRlZCBzaW5jZSB0aGVyZSdzIGZ1bGwgc3VwcG9ydCBmb3IKPiBwYXJz
aW5nIHRoZSBuZXcgcHJvcGVydHkgYW5kIGFsbCB3ZSBoYXZlIHRvIGRvIGlzIGJsb2NrIFYgaW4g
dGhlICFhY3BpCj4gY2FzZSB3aGVuIHBhcnNpbmcgcmlzY3YsaXNhIG5vdy4gQXMgR3VvIFJlbiBz
dWdnZXN0ZWQsIEkgZGVjcmVhc2VkIHRoZQo+IHNpemUgb2YgdGhlIGhhbW1lciBmdXJ0aGVyLCBz
byB0aGF0IHRoZSBjOTA4LCB0aGF0IGRvZXMgaW1wbG1lbnQgdGhlCj4gcmF0aWZpZWQgViBleHRl
bnNpb24sIGNhbiBzZXQgInYiIGluIHJpc2N2LGlzYS4gT3RoZXIgdGhhbiB0aGF0LCB3aGF0Cj4g
Y2hhbmdlZCBpcyBqdXN0IGEgcmViYXNlIG9uIHRvcCBvZiB0aGUgY2hhbmdlcyBzaW5jZSBKdWx5
LiB2MiBpcyBpbiB0aGUKPiBMaW5rOiB0YWcgYWJvdmUuCj4KPiBjYzogY2hhcmxpZUByaXZvc2lu
Yy5jb20KPiBjYzogY29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20KPiBjYzogbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+IGNjOiBwYWxtZXJAZGFiYmVsdC5jb20KPiBjYzogZ3VvcmVu
QGtlcm5lbC5vcmcKPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMTUg
KysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvY3B1ZmVhdHVyZS5jCj4gaW5kZXggODk5MjBmODRkMGEzLi4zYTA1YWY3YmU1MTAgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gQEAgLTI0LDYgKzI0LDcgQEAKPiAgI2luY2x1ZGUg
PGFzbS9od3Byb2JlLmg+Cj4gICNpbmNsdWRlIDxhc20vcGF0Y2guaD4KPiAgI2luY2x1ZGUgPGFz
bS9wcm9jZXNzb3IuaD4KPiArI2luY2x1ZGUgPGFzbS9zYmkuaD4KPiAgI2luY2x1ZGUgPGFzbS92
ZWN0b3IuaD4KPgo+ICAjaW5jbHVkZSAiY29weS11bmFsaWduZWQuaCIKPiBAQCAtNTM4LDYgKzUz
OSwyMCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcmlzY3ZfZmlsbF9od2NhcF9mcm9tX2lzYV9zdHJp
bmcodW5zaWduZWQgbG9uZyAqaXNhMmh3Y2FwKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHNl
dF9iaXQoUklTQ1ZfSVNBX0VYVF9aSUhQTSwgaXNhaW5mby0+aXNhKTsKPiAgICAgICAgICAgICAg
ICAgfQo+Cj4gKyAgICAgICAgICAgICAgIC8qCj4gKyAgICAgICAgICAgICAgICAqICJWIiBpbiBJ
U0Egc3RyaW5ncyBpcyBhbWJpZ3VvdXMgaW4gcHJhY3RpY2U6IGl0IHNob3VsZCBtZWFuCj4gKyAg
ICAgICAgICAgICAgICAqIGp1c3QgdGhlIHN0YW5kYXJkIFYtMS4wIGJ1dCB2ZW5kb3JzIGFyZW4n
dCB3ZWxsIGJlaGF2ZWQuCj4gKyAgICAgICAgICAgICAgICAqIE1hbnkgdmVuZG9ycyB3aXRoIFQt
SGVhZCBDUFUgY29yZXMgd2hpY2ggaW1wbGVtZW50IHRoZSAwLjcuMQo+ICsgICAgICAgICAgICAg
ICAgKiB2ZXJzaW9uIG9mIHRoZSB2ZWN0b3Igc3BlY2lmaWNhdGlvbiBwdXQgInYiIGludG8gdGhl
aXIgRFRzLgo+ICsgICAgICAgICAgICAgICAgKiBDUFUgY29yZXMgd2l0aCB0aGUgcmF0aWZpZWQg
c3BlYyB3aWxsIGNvbnRhaW4gbm9uLXplcm8KPiArICAgICAgICAgICAgICAgICogbWFyY2hpZC4K
PiArICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgIGlmIChhY3BpX2Rpc2FibGVk
ICYmIHJpc2N2X2NhY2hlZF9tdmVuZG9yaWQoY3B1KSA9PSBUSEVBRF9WRU5ET1JfSUQgJiYKPiAr
ICAgICAgICAgICAgICAgICAgIHJpc2N2X2NhY2hlZF9tYXJjaGlkKGNwdSkgPT0gMHgwKSB7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgdGhpc19od2NhcCAmPSB+aXNhMmh3Y2FwW1JJU0NWX0lT
QV9FWFRfdl07Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xlYXJfYml0KFJJU0NWX0lTQV9F
WFRfdiwgaXNhaW5mby0+aXNhKTsKPiArICAgICAgICAgICAgICAgfQo+ICsKPiAgICAgICAgICAg
ICAgICAgLyoKPiAgICAgICAgICAgICAgICAgICogQWxsICJva2F5IiBoYXJ0IHNob3VsZCBoYXZl
IHNhbWUgaXNhLiBTZXQgSFdDQVAgYmFzZWQgb24KPiAgICAgICAgICAgICAgICAgICogY29tbW9u
IGNhcGFiaWxpdGllcyBvZiBldmVyeSAib2theSIgaGFydCwgaW4gY2FzZSB0aGV5IGRvbid0Cj4g
LS0KPiAyLjQzLjAKPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
