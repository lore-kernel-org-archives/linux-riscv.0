Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B5CD10C11
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 13:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qfEJ7JDwfQK1/lHfzMoHJ8zFcZLqL2EoE2iNCOkrnUg=; b=x9gC/sEFbRj089
	0rYQ/moLS5kqQQhp26BwRj2h3EsbuXonaYyzWJU16FSGpYvqEhJag8ZjDqWoECDoAY4Js2iU2fTOP
	0RhzJA/m9ky2+6IHrYB1wQR9xiDDd5FW4NGcc+/8PLtvKfs0t9HSa+bn/9CIo8umdOZ+Ue9RokUJ5
	zqaGIqEpLMEQ6c2TPtIY/02GhO4jnwvfRn+m3zqiJG7p1TXupX1PR+SZzb3IcYLaVcchxgLr4DIal
	YtFGsgLqom3AvOgdE0/by8o0linngu5MpgHXEFQr/sqabQEznP9bPAn1kzPG6l+0y+1GjHPR0dMyl
	c7QVvShlFLOemJ8rSx3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5PwA-0000000AxEn-3m7B;
	Mon, 28 Oct 2024 13:37:38 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Pw7-0000000AxCe-2BNm
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 13:37:37 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a99eb8b607aso547021266b.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730122653; x=1730727453; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKnGNMIDsuMU9Ms+olL4fIosxiXCEslH59WZ857jYhs=;
        b=VzRCcToID7J6ITMyZ8kA3U+Fswi+QLGLcvbNNV95h+LQjLyMka6xFoM6NATZZ1XHVC
         tp6n7r+wpI5ZLleZpLKkgoVVDt68SSiBLEmDc/81hk41Ncar2e3yA77FTMxUCiU2/JQi
         L2f5ny+sDRJAlyDfW9qsCxGkn+DgWRbgDag0qPp0m/IPQZt6bVWDYs5ZZJp7R6BN6HCE
         rVYC/zBfmNbHvxt49aPriMLi5tNBAkKFPDMsPWy+Avl5ZPh5GLlGAKfvDKBo2mX1do7M
         VSZVAlBkJVzU/yOQbr3GL1SpEKnWSl7H4BOsbGvk1tZQ8R41JaSzj6ZS0MzK7ZYSCwng
         M9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730122653; x=1730727453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKnGNMIDsuMU9Ms+olL4fIosxiXCEslH59WZ857jYhs=;
        b=DUkqQsxeveGeLoBiL/xdrkhoAjD63taIX89VIDYUCOe+hTjtUYECtp0qYg6yXkf2D/
         ARcV3Ol68GDWYt4K9vzGkyBDG9HJhRHTVmcZ1/a6g+7EvfCR6aYlDk/C0cTR8KkgR7nf
         QNI/84rIUMKn52LVd0t4GF104HkgasNe8yfMWaljE62xdV5hWouof7USRpkeYnePBqkP
         JBkYzfF15oEQrj3DiYGinxUGLKACKr5Q4G/I3ia3O81+R94i2DgclUw7P+TE3XD6Tvke
         dTaq9fZcLddzaU6EjodpaAughOPjaj6K8bMSJXvjXZVs4TulQ3RpXKYv2crgPWjY+P4k
         g90Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHcf2wewu72yAlCh7TkiOycYqrLv9AEhuW6CPUQXfXJAd/XczFewVCciJO5/uiMY2aFxQomr/UhqKehA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiGeVxvwwTUd/evG6qXEAvbkKrh91PEUBaAd2Y1TosdbH7lNpt
	PPaeMamXmokBZL5tPb8UzucO6Ivxfgi6RaP40an21atN+KB6YxI+PiozFumZ2RPuwSUhEqx+TSc
	tdr50zktVx9rwjBVDM3U8HbxrOxU4DdfkAR33Gg==
X-Google-Smtp-Source: AGHT+IHhEyOkOcA9tpqWTp6QFCG6rAyKXtMOIkse/RvH7hBaOyRskSxnafS6xuPyA1ddYLA/p40Sx9Z0PiDa68pUkcI=
X-Received: by 2002:a17:907:8688:b0:a9a:3013:2ea1 with SMTP id
 a640c23a62f3a-a9de5d6fa2amr800203066b.1.1730122652741; Mon, 28 Oct 2024
 06:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20241014094705.71775-1-cuiyunhui@bytedance.com>
 <d39e4832-50f3-4fc8-ba95-a2d6eefa5abe@ghiti.fr> <CAEEQ3wk6K52RdCat+L91KvfNVkxbj1-3zxjubkn9xy89wK_-bA@mail.gmail.com>
 <c05e09d0-d996-4712-a6e5-ef77f1f2ff0a@ghiti.fr> <CAEEQ3wmw8B_cOs54H4Z8e2QTGyeE2cAYQwDRyk7KgUUKTFhZ-g@mail.gmail.com>
In-Reply-To: <CAEEQ3wmw8B_cOs54H4Z8e2QTGyeE2cAYQwDRyk7KgUUKTFhZ-g@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 28 Oct 2024 14:37:21 +0100
Message-ID: <CAHVXubjDhM6NEF6uf981Y2fNA1Dw=Bu_SNtpso6P1=3Np6BUDw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: ACPI: fix early_ioremap to early_memremap
To: yunhui cui <cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_063735_794673_CF73FBE2 
X-CRM114-Status: GOOD (  35.20  )
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
Cc: aou@eecs.berkeley.edu, haibo1.xu@intel.com, Alexandre Ghiti <alex@ghiti.fr>, jeeheng.sia@starfivetech.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, punit.agrawal@bytedance.com, linux-riscv@lists.infradead.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgWXVuaHVpLAoKU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LCBJIHdhcyBvbiB2YWNhdGlvbiBs
YXN0IHdlZWsuCgpPbiBNb24sIE9jdCAyMSwgMjAyNCBhdCA4OjQ14oCvQU0geXVuaHVpIGN1aSA8
Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gSGkgQWxleCwKPgo+IE9uIE1vbiwg
T2N0IDE0LCAyMDI0IGF0IDk6MDHigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+
IHdyb3RlOgo+ID4KPiA+IE9uIDE0LzEwLzIwMjQgMTQ6MzAsIHl1bmh1aSBjdWkgd3JvdGU6Cj4g
PiA+IEhpIEFsZXgsCj4gPiA+Cj4gPiA+IE9uIE1vbiwgT2N0IDE0LCAyMDI0IGF0IDg6MTLigK9Q
TSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+ID4gPj4gSGkgWXVuaHVp
LAo+ID4gPj4KPiA+ID4+IE9uIDE0LzEwLzIwMjQgMTE6NDcsIFl1bmh1aSBDdWkgd3JvdGU6Cj4g
PiA+Pj4gV2hlbiBTVlBCTVQgaXMgZW5hYmxlZCwgX19hY3BpX21hcF90YWJsZSgpIHdpbGwgZGly
ZWN0bHkgYWNjZXNzIHRoZQo+ID4gPj4+IGRhdGEgaW4gRERSIHRocm91Z2ggdGhlIElPIGF0dHJp
YnV0ZSwgcmF0aGVyIHRoYW4gdGhyb3VnaCBoYXJkd2FyZQo+ID4gPj4+IGNhY2hlIGNvbnNpc3Rl
bmN5LCByZXN1bHRpbmcgaW4gaW5jb3JyZWN0IGRhdGEgaW4gdGhlIG9idGFpbmVkIEFDUEkKPiA+
ID4+PiB0YWJsZS4KPiA+ID4+Pgo+ID4gPj4+IFRoZSBsb2c6IEFDUEk6IFtBQ1BJOjB4MThdIElu
dmFsaWQgemVybyBsZW5ndGguCj4gPiA+Pj4KPiA+ID4+PiBXZSBkbyBub3QgYXNzdW1lIHdoZXRo
ZXIgdGhlIGJvb3Rsb2FkZXIgZmx1c2hlcyBvciBub3QuIFdlIHNob3VsZAo+ID4gPj4+IGFjY2Vz
cyBpbiBhIGNhY2hlYWJsZSB3YXkgaW5zdGVhZCBvZiBtYWludGFpbmluZyBjYWNoZSBjb25zaXN0
ZW5jeQo+ID4gPj4+IGJ5IHNvZnR3YXJlLgo+ID4gPj4+Cj4gPiA+Pj4gU2lnbmVkLW9mZi1ieTog
WXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gPiA+Pj4gLS0tCj4gPiA+Pj4g
ICAgYXJjaC9yaXNjdi9rZXJuZWwvYWNwaS5jIHwgMiArLQo+ID4gPj4+ICAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPj4+Cj4gPiA+Pj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2FjcGkuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2FjcGku
Ywo+ID4gPj4+IGluZGV4IDZlMGQzMzNmNTdlNS4uMzE3N2M5YWY4NzY0IDEwMDY0NAo+ID4gPj4+
IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2FjcGkuYwo+ID4gPj4+ICsrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL2FjcGkuYwo+ID4gPj4+IEBAIC0yMTAsNyArMjEwLDcgQEAgdm9pZCBfX2luaXQgX19p
b21lbSAqX19hY3BpX21hcF90YWJsZSh1bnNpZ25lZCBsb25nIHBoeXMsIHVuc2lnbmVkIGxvbmcg
c2l6ZSkKPiA+ID4+PiAgICAgICAgaWYgKCFzaXplKQo+ID4gPj4+ICAgICAgICAgICAgICAgIHJl
dHVybiBOVUxMOwo+ID4gPj4+Cj4gPiA+Pj4gLSAgICAgcmV0dXJuIGVhcmx5X2lvcmVtYXAocGh5
cywgc2l6ZSk7Cj4gPiA+Pj4gKyAgICAgcmV0dXJuIGVhcmx5X21lbXJlbWFwKHBoeXMsIHNpemUp
Owo+ID4gPj4+ICAgIH0KPiA+ID4+Pgo+ID4gPj4+ICAgIHZvaWQgX19pbml0IF9fYWNwaV91bm1h
cF90YWJsZSh2b2lkIF9faW9tZW0gKm1hcCwgdW5zaWduZWQgbG9uZyBzaXplKQo+ID4gPj4KPiA+
ID4+IEl0IG1ha2VzIHNlbnNlIHRvIG1lIHNpbmNlIHdpdGggdGhpcywgd2UgZG9uJ3QgaGF2ZSB0
byBjYXJlIGFib3V0IGhvdwo+ID4gPj4gdGhlIGZpcm13YXJlIG1hcHBlZCB0aGUgdGFibGUuIEFu
ZCBpdCBtaW1pY3MgYWxsIG90aGVyIGFyY2hpdGVjdHVyZXMKPiA+ID4+IChhcm02NCwgbG9vbmdh
cmNoIGFuZCB4ODYpLgo+ID4gPj4KPiA+ID4+IEhlcmUgaXMgdGhlIGNvcnJlc3BvbmRpbmcgZml4
ZXMgdGFnOgo+ID4gPj4KPiA+ID4+IEZpeGVzOiAzYjQyNmQ0YjViMTQgKCJSSVNDLVY6IEFDUEkg
OiBGaXggZm9yIHVzYWdlIG9mIHBvaW50ZXJzIGluCj4gPiA+PiBkaWZmZXJlbnQgYWRkcmVzcyBz
cGFjZSIpCj4gPiA+Pgo+ID4gPj4gV2l0aCB0aGUgY29ycmVzcG9uZGluZyBmaXggaW4gX19hY3Bp
X3VubWFwX3RhYmxlKCkgYXMgcG9pbnRlZCBieSBTdW5pbCwKPiA+ID4+IHlvdSBjYW4gYWRkOgo+
ID4gPj4KPiA+ID4+IFJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZv
c2luYy5jb20+Cj4gPiA+Pgo+ID4gPj4gQW5kIHJlZ2FyZGluZyB0aGUgc3BhcnNlIGVycm9yLCBJ
IGRvbid0IHNlZSBhbnkgb3RoZXIgYXJjaGl0ZWN0dXJlCj4gPiA+PiBjYXN0aW5nIHRvIF9faW9t
ZW0sIHNvIG1heWJlIHRoYXQncyBub3QgbmVjZXNzYXJ5IGFueW1vcmU/Cj4gPiA+IE9LLiBJIHdp
bGwgbWFrZSB0aGUgY2hhbmdlcyBpbiB2Mi4gUmVnYXJkaW5nIHRoZSBzcGFyc2UgZXJyb3IsIEkg
d2lsbAo+ID4gPiB1c2UgYW5vdGhlciBwYXRjaCBzcGVjaWZpY2FsbHkgdG8gc29sdmUgaXQuIElz
IHRoYXQgb2theT8KPiA+Cj4gPgo+ID4gSWYgdGhlIHNlY29uZCBwYXRjaCBvbmx5IGNvbnNpc3Rz
IGluIGNhc3RpbmcsIEkgd291bGQgbm90IHVzZSBhbm90aGVyCj4gPiBwYXRjaCBzaW5jZSB0aGUg
cGF0Y2ggMiB3b3VsZCBmaXggc29tZXRoaW5nIGludHJvZHVjZWQgaW4gcGF0Y2ggMS4KPiA+Cj4g
PiBCdXQgaWYgcGF0Y2ggMiBpcyBtb3JlIGNvbXBsaWNhdGVkLCAgaXQgbWF5IG1ha2Ugc2Vuc2Ug
dG8gZG8gYXMgeW91Cj4gPiBzdWdnZXN0LCB0aGUgZ29hbCBpcyB0byBtZXJnZSBwYXRjaCAxIGFz
YXAuCj4KPiBSZWdhcmRpbmcgcGF0Y2ggMiwgSSBleGVjdXRlZCAibWFrZSAmIG1ha2UgaW5zdGFs
bCIgZm9yIHNwYXJzZSBvZiB0aGUKPiByaXNjdiBhcmNoLiBJICJnaXQgY2xvbmVkIiBmcm9tCj4g
aHR0cHM6Ly9naXRodWIuY29tL0NvbmNodU9EL3NwYXJzZS5naXQuCj4gVGhlbiB3aGVuIGNvbXBp
bGluZyB0aGUga2VybmVsLCB0aGUgZm9sbG93aW5nIGVycm9yIHdhcyByZXBvcnRlZDoKPgo+IGNk
IC9kYXRhMDAvY3loL2xpbnV4LW5leHQvCj4gbWFrZSBkZWZjb25maWcKPiBjcCAuY29uZmlnIGJ1
aWxkLXJpc2N2NjQvCj4KPiBtYWtlIE89YnVpbGQtcmlzY3Y2NC8gQz0xIFc9MSBhcmNoL3Jpc2N2
L2tlcm5lbC8gZHJpdmVycy9hY3BpLwo+IGRyaXZlcnMvbWFpbGJveC8gLWoKPiBtYWtlWzFdOiBF
bnRlcmluZyBkaXJlY3RvcnkgJy9kYXRhMDAvY3loL2xpbnV4LW5leHQvYnVpbGQtcmlzY3Y2NCcK
PiAgIEdFTiAgICAgTWFrZWZpbGUKPiAgIENDICAgICAgc2NyaXB0cy9tb2QvZW1wdHkubwo+ICAg
Q0MgICAgICBzY3JpcHRzL21vZC9kZXZpY2V0YWJsZS1vZmZzZXRzLnMKPiAgIENIRUNLICAgLi4v
c2NyaXB0cy9tb2QvZW1wdHkuYwo+IGludmFsaWQgYXJndW1lbnQgdG8gJy1tYXJjaCc6ICdfemlj
c3JfemlmZW5jZWknCj4KPiBtYWtlWzNdOiAqKiogWy4uL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6
MjI5OiBzY3JpcHRzL21vZC9lbXB0eS5vXSBFcnJvciAxCj4gbWFrZVszXTogKioqIERlbGV0aW5n
IGZpbGUgJ3NjcmlwdHMvbW9kL2VtcHR5Lm8nCj4gbWFrZVszXTogKioqIFdhaXRpbmcgZm9yIHVu
ZmluaXNoZWQgam9icy4uLi4KPiBtYWtlWzJdOiAqKiogWy9kYXRhMDAvY3loL2xpbnV4LW5leHQv
TWFrZWZpbGU6MTIxNTogcHJlcGFyZTBdIEVycm9yIDIKPiBtYWtlWzFdOiAqKiogWy9kYXRhMDAv
Y3loL2xpbnV4LW5leHQvTWFrZWZpbGU6MjI0OiBfX3N1Yi1tYWtlXSBFcnJvciAyCj4KPiBEbyB5
b3Uga25vdyB0aGUgc29sdXRpb24/CgpJbiBjYXNlIHlvdSBkaWQgbm90IGZpbmQgdGhlIHNvbHV0
aW9uIHlldCwgSSB3b3VsZCBzYXkgdGhhdCB5b3VyCnRvb2xjaGFpbiBpcyB0b28gb2xkLgoKTGV0
IG1lIGtub3cgaWYgSSBjYW4gaGVscCwKClRoYW5rcywKCkFsZXgKCj4KPiA+Cj4gPiBUaGFua3Mh
Cj4gPgo+ID4gQWxleAo+ID4KPiA+Cj4gPiA+Cj4gPiA+PiBUaGFua3MsCj4gPiA+Pgo+ID4gPj4g
QWxleAo+ID4gPj4KPiA+ID4+Cj4gPiA+IFRoYW5rcywKPiA+ID4gWXVuaHVpCj4KPiBUaGFua3Ms
Cj4gWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
