Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6690C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 12:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DkvSWyUgzAfaVMO08fOm/yoDSw9VdRXwSR6+1nKy2hY=; b=Gmopc3SY0JUWFh
	6WXQYXe5BHA+cC18mhrLvQIGiuAepvjyjTiobjiPPcYASLvwLCkyCBrNfoG2LhkNP/HkxjFlnDPna
	BiL+WCagiPddvAdpvY0RbLSPcHPIjos/kEtGAuyIO2Nv3Yr58SOsaMh/XyZy+9ZGbJ+ZGSlB3SyiA
	uYCM9/cP5iBYpbIdREYUHhzAbba2KZfL8j5MJQWiWjhvhSQLcIKU5bSwYpljFqhZ3OhyBgcVXk6wx
	D2w6TgzinIyF0LHq37GJ8+PvE3r5CPTBb2mxI2wfXY+VoQoGegb0iY9xCV4PnHpn3fOGCqAiMajWx
	Kln7sqaR07BPSH9IWO7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxSOO-00969Q-G2; Tue, 22 Nov 2022 12:28:48 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxSOL-00963O-Lk
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 12:28:47 +0000
Received: by mail-ej1-x635.google.com with SMTP id f18so35461631ejz.5
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 04:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L975NwTENz94DYsDiind0pEErYSO4j1ZP3Fn2iqgKAY=;
        b=PN+XGM/ZKmtv5sV2DwVCaDLesyiz75FtuuZGEZqISB4WuLWA2tMkv2On/WSj3tRTeQ
         bQWah2+NDJc7+bapT7B8Gm+X1ZAZXgfcsyLKxrCKKmPRRPzmmQ5DK8rANL43q3w5GaoU
         n+iYKRuTaF8QujCSu7NZeD66nqodzRHiV2vTkFh6rlJeKbcGLMCVSnPAmpihgCkx6Oj/
         TdVyGnbg9TPx09PBGM81qYH8o6Cbbjhr3BsfL31rn0tNHb/29588Iytu/JX745aJwJo1
         ilyr/ILOoN3ENWqgLFHElcmy+bt1eyp8Xfc1vqAK3Srp6hHeJAZqFvblBk3KiRTNl9OU
         B4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L975NwTENz94DYsDiind0pEErYSO4j1ZP3Fn2iqgKAY=;
        b=EbpvhRfOCaYyIovq0zO+OhRzHc/sWRGn6MN8S9oQWwUbkpm3iufpmIfGoRoTrYOBu+
         EvFfo7XafmiV+ursN/e6Ntwcw4PXa6mchlKT8yShRmzLK9pBX8dRXdRjoHkGaiz7o5NF
         4yNSnPDa5BzKwVXq9JEc6zURnBt/EPTnTCMNqDbPPprOGfetTfVhQkdN48fx6DDJhLpm
         bqgLIFfoC5V712UFYxuXcMGCl5FYHZ2kfhXoSor4MyRJ8Ev1vWbl/LeUP/9ztLPoBQxw
         m/Im+f25sbcUSq5uFlYGzYiCu5vli0KrGoYpIDD3UQAjya/+r0ZrEtKkc5boe9WMzyoV
         PXJQ==
X-Gm-Message-State: ANoB5pk2d82i3/TnO8miiH/jZHLok5kjc2o3fiRfDFI/84obhgVPrlRe
	85PejB+DYUrclYN4yHPZrK2jMShOinwOl3kqGPg=
X-Google-Smtp-Source: AA0mqf4bpR4tF24cpWm1TVxqbPeofdI9blAKkR2GjtEe6elRk2Lc1mDwlDcDgZpQuC1YoyeZFXfdG5etcYzFc/Euybo=
X-Received: by 2002:a17:906:ccd0:b0:7ad:db82:d073 with SMTP id
 ot16-20020a170906ccd000b007addb82d073mr7999379ejb.480.1669120121841; Tue, 22
 Nov 2022 04:28:41 -0800 (PST)
MIME-Version: 1.0
References: <20221110164924.529386-1-heiko@sntech.de> <CA+V-a8u=vrrvhWCo+W28kbogMYHULuO3B6qcDeAEPEgzp+sVWg@mail.gmail.com>
 <11144018.nUPlyArG6x@diego> <4429380.iIbC2pHGDl@diego>
In-Reply-To: <4429380.iIbC2pHGDl@diego>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 22 Nov 2022 12:28:14 +0000
Message-ID: <CA+V-a8szNSBhvtDsfwKrs4azEavBTG4bp_BmTt-TScf0wDLb4g@mail.gmail.com>
Subject: Re: [PATCH 5/7] RISC-V: fix auipc-jalr addresses in patched alternatives
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, 
	ajones@ventanamicro.com, emil.renner.berthing@canonical.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_042845_772505_4B476B83 
X-CRM114-Status: GOOD (  32.55  )
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

SGkgSGVpa28sCgpPbiBUdWUsIE5vdiAyMiwgMjAyMiBhdCAxMTozNyBBTSBIZWlrbyBTdMO8Ym5l
ciA8aGVpa29Ac250ZWNoLmRlPiB3cm90ZToKPgo+IEFtIERpZW5zdGFnLCAyMi4gTm92ZW1iZXIg
MjAyMiwgMTI6MTk6NDAgQ0VUIHNjaHJpZWIgSGVpa28gU3TDvGJuZXI6Cj4gPiBBbSBEaWVuc3Rh
ZywgMjIuIE5vdmVtYmVyIDIwMjIsIDExOjU5OjU3IENFVCBzY2hyaWViIExhZCwgUHJhYmhha2Fy
Ogo+ID4gPiBIaSBIZWlrbywKPiA+ID4KPiA+ID4gT24gTW9uLCBOb3YgMjEsIDIwMjIgYXQgMTA6
MTcgUE0gSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4gPiA+ID4KPiA+
ID4gPiBBbSBNb250YWcsIDIxLiBOb3ZlbWJlciAyMDIyLCAyMjozMTozNiBDRVQgc2NocmllYiBM
YWQsIFByYWJoYWthcjoKPiA+ID4gPiA+IEhpIEhlaWtvLAo+ID4gPiA+ID4KPiA+ID4gPHNuaXA+
Cj4gPiA+ID4gQXMgZWl0aGVyIG1hbnVhbGx5IG9yIHdpdGggYSBoZWxwZXIgbGlrZQo+ID4gPiA+
Cj4gPiA+ID4gICAgICAgICBodHRwczovL2x1cGxhYi5naXRsYWIuaW8vcnZjb2RlY2pzLyNxPTB4
ZjRjMDgwZTcKPiA+ID4gPgo+ID4gPiA+IHlvdSBjYW4gdGhlbiBkZWNvZGUgdGhlIGFjdHVhbCBp
bnN0cnVjdGlvbiBhbmQgY29tcGFyZS4KPiA+ID4gPgo+ID4gPiA+IEluIHlvdXIgbG9nIHRoZSB0
d28gamFsciBpbnN0cnVjdGlvbnMgZGVjb2RlIHRvIGRpZmZlcmVudCBvZmZzZXRzLAo+ID4gPiA+
ICAgICAgICAgamFsciB4MSwgeDEsIC0xODAKPiA+ID4gPiB2cwo+ID4gPiA+ICAgICAgICAgamFs
ciB4MSwgeDEsIC04MzQKPiA+ID4gPgo+ID4gPiA+IENhbiB5b3UgY2hlY2sgd2hhdCB0aGUgcGF0
Y2hfb2Zmc2V0IHZhbHVlIGlzIGluIHlvdXIgY2FzZT8KPiA+ID4gPgo+ID4gPiBwYXRjaF9vZmZz
ZXQgZm9yIHRoZSBhYm92ZSBjYXNlIGlzIC02NTQuCj4gPgo+ID4gd2hpY2ggaXMgYSBiaWcgaW5k
aWNhdG9yIHRoYXQgdGhlIGF1aXBjLWphbHItZml4dXAgZnVuY3Rpb24gaXMgbm90IGNhdGNoaW5n
Cj4gPiB0aGUgaW5zdHJ1Y3Rpb24gLi4uIGkuZS4gLTE4MCAtIDY1NCA9IC04MzQuCj4gPgo+ID4g
SSBtYW5hZ2VkIHRvIHJlcHJvZHVjZSB0aGF0IGlzc3VlIHdpdGggeW91ciBicmFuY2ggbm93Cj4g
PiAoYWZ0ZXIgaGFja2luZyB1cCBzdHVmZiBhIGJpdCB0byBydW4gaW4gcWVtdSA6LSkgKS4KPiA+
Cj4gPiBJJ2xsIHRyeSB0byBmaW5kIG91dCB3aGVyZSB0aGUgZml4dXAgZmFpbHMuCj4KPiBpbWFn
aW5lIG1lIHdpdGggYSBzbGlnaHRseSByZWQgaGVhZCBub3cgLi4uIGFzIHRoZXJlIGlzIGEgc2xp
Z2h0bHkKPiBlbWJhcnJhc3NpbmcgbWlzdGFrZSBpbiB0aGUgZml4dXAgZnVuY3Rpb24gOy0pIC4K
PgpDaGVlciB1cCBub3cgOi0pCgo+Cj4gV2hlbiBnb2luZyBmcm9tIHZvaWQqIHRvIHVuc2lnbmVk
IGludCogcG9pbnRlcnMgSSBoYXZlIG1pc3NlZAo+IGFkanVzdGluZyB0aGUgYWN0dWFsIHBhdGNo
LWxvY2F0aW9uLgo+Cj4gVGhlIGNhbGwgbmVlZHMgdG8gYmUKPiAgICAgICAgIHBhdGNoX3RleHRf
bm9zeW5jKGFsdF9wdHIgKyBpLCBjYWxsLCA4KTsKPgpUaGF0IGRpZCB0aGUgdHJpY2shIEkgaGF2
ZSBkb25lIHNvbWUgbGltaXRlZCB0ZXN0aW5nIG9uIHRoZSBib2FyZAooZXZlbiByZXBsYWNlZCBv
cmlnbmFsIGluc3RydWN0aW9ucyBiYWNrIHRvIG5vcCdzIGV2ZW4gd2l0aCBpdHMKd29ya2luZyB0
b28pLgoKPiBpbnN0ZWFkIG9mIHRoZSBjdXJyZW50Cj4gICAgICAgICBwYXRjaF90ZXh0X25vc3lu
YyhhbHRfcHRyICsgaSAqIHNpemVvZih1MzIpLCBjYWxsLCA4KTsKPgo+IEluIG15IHN0ciogY2Fz
ZXMgdGhpcyBkaWRuJ3QgbWF0dGVyIGJlY2F1c2UgImkiIHdhcyAwIHRoZXJlLCBidXQgaW4geW91
cgo+IGxvbmdlciBhc3NlbWJseSBpdCBhY3R1YWxseSBwYXRjaGVkIHRoZSB3cm9uZyBsb2NhdGlv
bi4KPgpBaGFhIHJpZ2h0IHRoZSBhbHQgbWFjcm8ganVzdCBoYWQgY2FsbHMuCgo+Cj4gSGVpa28K
Pgo+ID09PT09PT09PT09PQo+IEZvciByZWZlcmVuY2UsIG15IGRlYnVnIHByaW50cyB0byBmaW5k
IHdoZXJlIHRoZSBwYXRjaGluZyBmYWlscyB3YXM6Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9lcnJhdGEvcmVuZXNhcy9lcnJhdGEuYyBiL2FyY2gvcmlzY3YvZXJyYXRhL3JlbmVzYXMvZXJy
YXRhLmMKPiBpbmRleCA5ODZmMWM3NjJkNzIuLmE1YTQ3YzVlOWZmOCAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2VycmF0YS9yZW5lc2FzL2VycmF0YS5jCj4gKysrIGIvYXJjaC9yaXNjdi9lcnJh
dGEvcmVuZXNhcy9lcnJhdGEuYwo+IEBAIC03Miw2ICs3Miw3IEBAIHN0YXRpYyB2b2lkIHJpc2N2
X2FsdGVybmF0aXZlX2ZpeF9hdWlwY19qYWxyKHVuc2lnbmVkIGludCAqYWx0X3B0ciwKPiAgICAg
ICAgIHUzMiByZDE7Cj4KPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBudW1faW5zdHI7IGkrKykg
ewo+ICtwcmludGsoIiVzOiBsb29raW5nIGF0IGluc3QgMHgleFxuIiwgX19mdW5jX18sICooYWx0
X3B0ciArIGkpKTsKPiAgICAgICAgICAgICAgICAgLyogaXMgdGhlcmUgYSBmdXJ0aGVyIGluc3Ry
dWN0aW9uPyAqLwo+ICAgICAgICAgICAgICAgICBpZiAoaSArIDEgPj0gbnVtX2luc3RyKQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+IEBAIC04NCw2ICs4NSw3IEBAIHN0YXRp
YyB2b2lkIHJpc2N2X2FsdGVybmF0aXZlX2ZpeF9hdWlwY19qYWxyKHVuc2lnbmVkIGludCAqYWx0
X3B0ciwKPiAgICAgICAgICAgICAgICAgaWYgKHJkMSAhPSAxKQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnRpbnVlOwo+Cj4gK3ByaW50aygiJXM6IC0+IGZvdW5kIGEgYXVpcGMgKyBqYWxy
IHBhaXJcbiIsIF9fZnVuY19fKTsKPiAgICAgICAgICAgICAgICAgLyogZ2V0IGFuZCBhZGp1c3Qg
bmV3IHRhcmdldCBhZGRyZXNzICovCj4gICAgICAgICAgICAgICAgIGltbTEgPSBFWFRSQUNUX1VU
WVBFX0lNTSgqKGFsdF9wdHIgKyBpKSk7Cj4gICAgICAgICAgICAgICAgIGltbTEgKz0gRVhUUkFD
VF9JVFlQRV9JTU0oKihhbHRfcHRyICsgaSArIDEpKTsKPiBAQCAtMTAxLDggKzEwMywxMCBAQCBz
dGF0aWMgdm9pZCByaXNjdl9hbHRlcm5hdGl2ZV9maXhfYXVpcGNfamFscih1bnNpZ25lZCBpbnQg
KmFsdF9wdHIsCj4gICAgICAgICAgICAgICAgIGNhbGxbMF0gfD0gdG9fYXVpcGNfaW1tKGltbTEp
Owo+ICAgICAgICAgICAgICAgICBjYWxsWzFdIHw9IHRvX2phbHJfaW1tKGltbTEpOwo+Cj4gK3By
aW50aygiJXM6IHBhdGNoaW5nIHRvIDB4JXggYW5kIDB4JXhcbiIsIF9fZnVuY19fLCBjYWxsWzBd
LCBjYWxsWzFdKTsKPiAgICAgICAgICAgICAgICAgLyogcGF0Y2ggdGhlIGNhbGwgcGxhY2UgYWdh
aW4gKi8KPiAtICAgICAgICAgICAgICAgcGF0Y2hfdGV4dF9ub3N5bmMoYWx0X3B0ciArIGkgKiBz
aXplb2YodTMyKSwgY2FsbCwgOCk7Cj4gKyAgICAgICAgICAgICAgIHBhdGNoX3RleHRfbm9zeW5j
KGFsdF9wdHIgKyBpLCBjYWxsLCA4KTsKPiArcHJpbnRrKCIlczogcGF0Y2hlZCB0byAweCV4IGFu
ZCAweCV4XG4iLCBfX2Z1bmNfXywgKihhbHRfcHRyICsgaSksICooYWx0X3B0ciArIGkgKyAxKSk7
Cj4gICAgICAgICB9Cj4gIH0KPgo+IGFuZCB0aGVuIHJlYWxpemluZyB0aGF0IHRoZSAicGF0Y2hp
bmcgdG8iIGFuZCAicGF0Y2hlZCB0byIgd2hlcmUgZGlmZmVyZW50Lgo+ClRoYW5rcyBmb3IgdGhl
IGh1bmsuCj4KCk5vdyB3YWl0aW5nIGZvciB5b3VyIHYzLiBNZWFud2hpbGUsIEknbGwgbG9vayBp
bnRvIHRoZSBBTFQzKCkgbWFjcm8uCgpDaGVlcnMsClByYWJoYWthcgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
