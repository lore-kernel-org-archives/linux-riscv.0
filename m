Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B12CA0EDC
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Aug 2025 03:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pCdyg4HIoE8uoYxyWA1xHjrRILgS51aZuIS2Wm1qpy8=; b=XzNP/IB9hUDgT9
	jSZJ7cOufbIWme8tFFJ1Mw/eva2Cs8Ht2fUiM3/hQLdSFmZSNZKCy+7oX3RcUyYtjZ0t9+zq8qv+w
	ckVTDYN/gWijSiT5x3RyvaecMkoj9EUeZU2VcdN5+gcVoCENlc9J7a0ciDkHPUqGq7XxrRyy9FX1S
	os5O3snZ5UY7zqvRSs102KngxHXTeRyzkupRKNxks8lpHeEvGaLPlDEP9WRlZad4eFI9MT86XmhaU
	vx75Urk2phL2TnS10PBze34ehJ+0nKaNFYU7/O+E2HM0xyvADQ2+S1eo+kjrNMw8eXtEa5L756mU1
	nTS8NFWYCoYqwEOqvp/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unUHl-00000005JpK-2mny;
	Sun, 17 Aug 2025 03:42:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unUHj-00000005Jox-1dH9
	for linux-riscv@lists.infradead.org;
	Sun, 17 Aug 2025 03:42:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D0EB845C53
	for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 03:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1798C19421
	for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 03:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755402137;
	bh=0RK7oybG39j/BzocNbqy4mpNmNZxOo5/Ezo2Vuk9LOA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qtj5huLrqLq9PZqGS9NV2KRNcai63H0aKe1uFpxPvxIiwsZDfQwywOEFdWiRSBxX7
	 spirLkb1pPoCL/R4QVFEQF9IMzc3DJWmqJjoA8gVIReY8K/GpYM9ymiDzSAncztT0Q
	 1w7olO5rLg9O9t44FHWE8cN7MjSgbhipZG0nPKbF4vqf+Yw70dg76ErTeJAuOqvyjB
	 LoZuo1ZcyEmK+qTe9+kZPo0wthgq/DJ8H92d8i1CPOA2041H1J5jPUnqcRsRrOHipl
	 PIppqwPDX2AJcVYHECkrkV8d7Z5mHaUtPBpBfvVtZM/DdBQObdb5cEbtwbUQPf9Kb4
	 K0PETbf902eWA==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61a1663be10so1218752a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 16 Aug 2025 20:42:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU71WeWoB2B2l23Jg6Ek2f+ZKlNbZI/80f7Aw0WhTanB8AwxCo7NpOT7ONJU7gePCPiV9KYu6B4yuYObA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDSECrCmnoOgRlDxJWswtNJKluxBVVc8vbE0uBA/FzhRQ93fG6
	dwDLJ1PtQOziJIYV4mRk6001m7x44fHsGFpqrzELwEfjDf52j+/8gnEN1qK1q8Oc/Xi+rHhoO8o
	Zm5q+29+EPx+GfZaZdpgYnjP2X0WS0GA=
X-Google-Smtp-Source: AGHT+IFBem0X5N5rrHNPoyjgpsHEbfGMj4eZD3b4gWF1FzyT3xN0jpZbWjI+FJ9IbxNO86/8kD6wXwUzeSs7qHNdcog=
X-Received: by 2002:a05:6402:234b:b0:617:fe86:6bff with SMTP id
 4fb4d7f45d1cf-618b0513fe6mr6495112a12.8.1755402136197; Sat, 16 Aug 2025
 20:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250812122043.2462836-1-wangming01@loongson.cn>
In-Reply-To: <20250812122043.2462836-1-wangming01@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 17 Aug 2025 11:42:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6MunQ7NBcH2gUytoFyQTk8NpaZ9ZoWUyfQrSPmvubBNw@mail.gmail.com>
X-Gm-Features: Ac12FXxjtlZJIyQy_PnuNPhA3GQUv3sGESkFCR9A2gdlrilDcc-u2Q07VvWbo2w
Message-ID: <CAAhV-H6MunQ7NBcH2gUytoFyQTk8NpaZ9ZoWUyfQrSPmvubBNw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Increase COMMAND_LINE_SIZE to 4096
To: Ming Wang <wangming01@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	lixuefeng@loongson.cn, chenhuacai@loongson.cn, 
	Huang Cun <cunhuang@tencent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_204219_467899_61C6309F 
X-CRM114-Status: GOOD (  18.79  )
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

QXBwbGllZCwgdGhhbmtzLgoKSHVhY2FpCgpPbiBUdWUsIEF1ZyAxMiwgMjAyNSBhdCA4OjIw4oCv
UE0gTWluZyBXYW5nIDx3YW5nbWluZzAxQGxvb25nc29uLmNuPiB3cm90ZToKPgo+IFRoZSBkZWZh
dWx0IENPTU1BTkRfTElORV9TSVpFIG9mIDUxMiwgaW5oZXJpdGVkIGZyb20gYXNtLWdlbmVyaWMs
IGlzCj4gdG9vIHNtYWxsIGZvciBtb2Rlcm4gdXNlIGNhc2VzLiBGb3IgZXhhbXBsZSwga2R1bXAg
Y29uZmlndXJhdGlvbnMgb3IKPiBleHRlbnNpdmUgZGVidWdnaW5nIHBhcmFtZXRlcnMgY2FuIGVh
c2lseSBleGNlZWQgdGhpcyBsaW1pdC4KPgo+IFRoZXJlZm9yZSwgaW5jcmVhc2UgdGhlIGNvbW1h
bmQgbGluZSBzaXplIHRvIDQwOTYgYnl0ZXMsIGFsaWduaW5nCj4gTG9vbmdBcmNoIHdpdGggdGhl
IE1JUFMgYXJjaGl0ZWN0dXJlLiBUaGlzIGNoYW5nZSBmb2xsb3dzIGEgYnJvYWRlcgo+IHRyZW5k
IGFtb25nIGFyY2hpdGVjdHVyZXMgdG8gcmFpc2UgdGhpcyBsaW1pdCB0byBzdXBwb3J0IG1vZGVy
biBuZWVkczsKPiBmb3IgaW5zdGFuY2UsIFBvd2VyUEMgaW5jcmVhc2VkIGl0cyB2YWx1ZSBmb3Ig
c2ltaWxhciByZWFzb25zIGluCj4gY29tbWl0IGE1OTgwZDA2NGZlMiAoInBvd2VycGM6IEJ1bXAg
Q09NTUFORF9MSU5FX1NJWkUgdG8gMjA0OCIpLgo+Cj4gU2ltaWxhciB0byB0aGUgY2hhbmdlIG1h
ZGUgZm9yIFJJU0MtViBpbiBjb21taXQgNjFmYzFlZThiZTI2Cj4gKCJyaXNjdjogQnVtcCBDT01N
QU5EX0xJTkVfU0laRSB2YWx1ZSB0byAxMDI0IiksIHRoaXMgaXMgY29uc2lkZXJlZAo+IGEgc2Fm
ZSBjaGFuZ2UuIFRoZSBicm9hZGVyIGtlcm5lbCBjb21tdW5pdHkgaGFzIHJlYWNoZWQgYSBjb25z
ZW5zdXMKPiB0aGF0IG1vZGlmeWluZyBDT01NQU5EX0xJTkVfU0laRSBmcm9tIFVBUEkgaGVhZGVy
cyBkb2VzIG5vdAo+IGNvbnN0aXR1dGUgYSB1QUJJIGJyZWFrYWdlLCBhcyB3ZWxsLWJlaGF2ZWQg
dXNlcnNwYWNlIGFwcGxpY2F0aW9ucwo+IHNob3VsZCBub3QgcmVseSBvbiB0aGlzIG1hY3JvLgo+
Cj4gU3VnZ2VzdGVkLWJ5OiBIdWFuZyBDdW4gPGN1bmh1YW5nQHRlbmNlbnQuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IE1pbmcgV2FuZyA8d2FuZ21pbmcwMUBsb29uZ3Nvbi5jbj4KPiAtLS0KPiAgYXJj
aC9sb29uZ2FyY2gvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oIHwgOCArKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2xv
b25nYXJjaC9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2xv
b25nYXJjaC9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmggYi9hcmNoL2xvb25nYXJjaC9pbmNsdWRl
L3VhcGkvYXNtL3NldHVwLmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
MDAwMC4uZDQ2MzYzY2UzZTAyCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2FyY2gvbG9vbmdhcmNo
L2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaAo+IEBAIC0wLDAgKzEsOCBAQAo+ICsvKiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCBXSVRIIExpbnV4LXN5c2NhbGwtbm90ZSAqLwo+ICsK
PiArI2lmbmRlZiBfVUFQSV9BU01fTE9PTkdBUkNIX1NFVFVQX0gKPiArI2RlZmluZSBfVUFQSV9B
U01fTE9PTkdBUkNIX1NFVFVQX0gKPiArCj4gKyNkZWZpbmUgQ09NTUFORF9MSU5FX1NJWkUgICAg
ICA0MDk2Cj4gKwo+ICsjZW5kaWYgLyogX1VBUElfQVNNX0xPT05HQVJDSF9TRVRVUF9IICovCj4g
LS0KPiAyLjQzLjAKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
