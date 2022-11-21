Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05CCC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 00:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ReVf6ek1UTDAeVxF3qLB3YpYgIuiNCGa/ueqW914ufE=; b=aoIOAsphf1YSFW
	HXXQWwiLnwNtJqv8MDs/UjlhFDghxVGPiRKklC+K1jMY65gmT8gI0Y4I0ZWRUo/NBDnAzlG1wnvrv
	BGigcaTRSn5Yi2TZuX+mf6a+oZmqlM6QzyVZ3Gmmp/9Q+PNNBvqei0T9LJMJrjUJkTV+GYFzU7GdU
	RFUyTf1k/M/N0z8AjCNJGOyuMPIk102wBYVMYrZL9daHY/cejYJSYLvbXGRSu1zg9p7iAWcD6x2CI
	EbNwIn1uYr/H/0iqcje79xp/kXhqGKnHKTYNxGznYE56A+biFAp0nkxFfQYr7vkPW5rk/pRKynM0a
	lVjtGTkC2N/QNrd0QeGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxGi0-001Sxc-9M; Tue, 22 Nov 2022 00:00:16 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxGhw-001SxH-Up
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 00:00:14 +0000
Received: by mail-ej1-x636.google.com with SMTP id f27so32200626eje.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 16:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDao0LAfm434A/ExSO5wjCivz8a5JjQXxBlQrokb6kc=;
        b=BvmnoiVL/h6tWsjPo0Aeq5Q6cccWN4F5urXLhgO0z4WBigedoRyeQdFpafRKgsAtcn
         73wdA8JtiNHbEgi/O8B/BJA80ST+4lDy9f2EAm32YYWh+aXGh/2KFGcEEDGJlD5rlCLz
         NBGu4UwUKW87TEmFQeWPh/4o4KbNbZhsHgbrcPwNE31yXlwbi3qrchCQ5g3P8DN+ZLnt
         bGuq1j2eZ97M6AmHQPW+2bB5h35md4Z98ToBuySGvhKsfKo3ajCuhq/wE2ZwZTgX8CEl
         Ww6fc79vl+qqZTutHb++Qs12E5633QiTgALWojAgOorjcincy8aM0mp7NslBzh+WN5LO
         sBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDao0LAfm434A/ExSO5wjCivz8a5JjQXxBlQrokb6kc=;
        b=rNfIvD97T87f2/bjuCcTd6eSZxBcfDTZwdOJNEOJXTFYWK3hZX7N71+JnhMM+oktqv
         c4lz4GeTK7yFInxxBfeUlOuglGT48i3aUDL+Hn4fdxia24wfhcl1iCdqtoeyxF9mI4Vz
         xQktU5Qi8/UoH6GWNw0rF9nop2GwY16BSaJhFpqthIhrAAzBMXaLQtPXBWYuOT5hZAkg
         ovfjxS40qopkypGLkU25+0kAfi9X8VfXpZzbQgYyfvfWMNy8dp2/xHxdnVMso3b+oBdH
         OZz3HP774dzu5UsUdGh1hmSvG/eODCH4TL1jpCyCQdhWx++kUbJp17DD42Bu1+HTx21p
         vcKA==
X-Gm-Message-State: ANoB5pnnMw6ombdK/uZ6o3dQd2ZdECw8R78xsccYu7v6B/u2206Is94p
	CUDOdTuqHs7oSAfiPMBN8o1E9vw/Fg32aWxr2mU=
X-Google-Smtp-Source: AA0mqf7wirXB9UcHj6bBpQrNPdemVwDrSaetF1MqXaP4SBD99f+fgWONo6kDIZi+Va+xTy91kr2tenOEPO+UiZSIetk=
X-Received: by 2002:a17:906:79c4:b0:778:e3e2:8311 with SMTP id
 m4-20020a17090679c400b00778e3e28311mr2574608ejo.342.1669075210604; Mon, 21
 Nov 2022 16:00:10 -0800 (PST)
MIME-Version: 1.0
References: <20221110164924.529386-1-heiko@sntech.de> <CA+V-a8vSVY590SUkg81cC8Kq7FjzxdcJ5m2VG=94m0ntis7+8w@mail.gmail.com>
 <CA+V-a8sqEjLKdGm67Sm5YbYUVRuntAM0Wqw_Gk+V6i9x+b1Exg@mail.gmail.com> <14108757.uLZWGnKmhe@diego>
In-Reply-To: <14108757.uLZWGnKmhe@diego>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 21 Nov 2022 23:59:43 +0000
Message-ID: <CA+V-a8sq8=mG5VZ3QTRUT=cx-p4L+yNVTskeuNaRxhF-4NJx9A@mail.gmail.com>
Subject: Re: [PATCH 5/7] RISC-V: fix auipc-jalr addresses in patched alternatives
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, 
	ajones@ventanamicro.com, emil.renner.berthing@canonical.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_160013_033774_2C52AF1D 
X-CRM114-Status: GOOD (  27.05  )
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

SGkgSGVpa28sCgpPbiBNb24sIE5vdiAyMSwgMjAyMiBhdCAxMDoxNyBQTSBIZWlrbyBTdMO8Ym5l
ciA8aGVpa29Ac250ZWNoLmRlPiB3cm90ZToKPgo+IEFtIE1vbnRhZywgMjEuIE5vdmVtYmVyIDIw
MjIsIDIyOjMxOjM2IENFVCBzY2hyaWViIExhZCwgUHJhYmhha2FyOgo+ID4gSGkgSGVpa28sCj4g
Pgo+ID4gT24gTW9uLCBOb3YgMjEsIDIwMjIgYXQgMzowNiBQTSBMYWQsIFByYWJoYWthcgo+ID4g
PHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPHNuaXA+Cj4gPiBTb21l
IG1vcmUgaW5mb3JtYXRpb24sCj4gPgo+ID4gLSBJZiBJIGRyb3AgdGhlIHJpc2N2X2FsdGVybmF0
aXZlX2ZpeF9hdWlwY19qYWxyKCkgY2FsbCBhZnRlcgo+ID4gcGF0Y2hfdGV4dF9ub3N5bmMoKSBh
bmQgdGhlbiBwcmludCB0aGUgYWx0LT5vbGRfcHRyIGluc3RydWN0aW9ucwo+ID4gYmVmb3JlIHBh
dGNoaW5nIEkgY2FuIHNlZSB0aGUgaW5zdHJ1Y3Rpb25zIGFzIDB4MTMgKG5vcCkgd2hpY2ggaXMK
PiA+IGNvcnJlY3QuCj4gPgo+ID4gLSBpZiBJIGNhbGwgcmlzY3ZfYWx0ZXJuYXRpdmVfZml4X2F1
aXBjX2phbHIoKSBjYWxsIGFmdGVyCj4gPiBwYXRjaF90ZXh0X25vc3luYygpIGFuZCB0aGVuIHBy
aW50IHRoZSBhbHQtPm9sZF9wdHIgaW5zdHJ1Y3Rpb25zCj4gPiBiZWZvcmUgcGF0Y2hpbmcgSSBk
b250IHNlZSAweDEzIChub3ApIGNvbnNpc3RlbnRseSBmb3Igb2xkCj4gPiBpbnN0cnVjdGlvbnMu
Cj4KPiB3aGljaCBpcyB0byBiZSBleHBlY3RlZCBJIGd1ZXNzLgo+Cj4gYWx0LT5vbGRfcHRyIHBv
aW50cyB0byB0aGUgbWVtb3J5IGxvY2F0aW9uIHdoZXJlIHRoZSBsaXZlIGtlcm5lbCBjb2RlCj4g
bGl2ZXMuCj4KQWdyZWVkLgoKPiBJLmUuIHRoZSBjb2RlIGF0IHRoaXMgbG9jYXRpb24gaXMgdGhl
IHRoaW5nIHRoZSBrZXJuZWwgYWN0dWFsbHkgcnVucy4KPiBUaGUgY29kZSBhdCB0aGlzIGxvY2F0
aW9uIHRoZW4gZ2V0cyBvdmVyd3JpdHRlbiBieSB0aGUgYWx0ZXJuYXRpdmUKPiBhc3NlbWJseS4K
PgpCdXQgc2hvdWxkbid0IHRoZSBhY3R1YWwgY29kZSBiZSBub3BzIGJlZm9yZSBwYXRjaGluZz8K
Cj4KPiA+IC0gSWYgSSByZXBsYWNlIHRoZSBub3AncyBpbiB0aGUgb2xkIGluc3RydWN0aW9ucyB3
aXRoIG15IGFzc2VtYmx5IGNvZGUKPiA+IG9mIHJ6L2ZpdmUgY21vIGFuZCB0aGVuIGp1c3QgdXNl
IHBhdGNoX3RleHRfbm9zeW5jKCkgSSBjYW4gc2VlIHRoZQo+ID4gY29ycmVjdCBhY3R1YWwgaW5z
dHJ1Y3Rpb24gYmVpbmcgcHJpbnRlZCBhcGFydCBmcm9tIGphbHIgKGlzIHNvbWUgc29ydAo+ID4g
b2Ygb2Zmc2V0IGFkZGVkIHRvIGl0IGFzIEkgc2VlIGxhc3QgNCBiaXRzIG1hdGNoPykgYW5kIHRo
ZW4gaXMKPiA+IHJlcGxhY2VkIGNvcnJlY3RseSBieSB0aGUgc2FtZSBhbHQgaW5zdHJ1Y3Rpb25z
IGFwYXJ0IGZyb20gdGhlIGphbHIKPiA+IChsb2cgWzBdKS4KPiA+Cj4gPiAtIElmIEkgcmVwbGFj
ZSB0aGUgbm9wJ3MgaW4gdGhlIG9sZCBpbnN0cnVjdGlvbnMgd2l0aCBteSBhc3NlbWJseSBjb2Rl
Cj4gPiBvZiByei9maXZlIGNtbyBhbmQgdGhlbiB1c2UgcGF0Y2hfdGV4dF9ub3N5bmMoKSBhbmQK
PiA+IHJpc2N2X2FsdGVybmF0aXZlX2ZpeF9hdWlwY19qYWxyKCkgSSBjYW4gc2VlIHRoZSBhY3R1
YWwgb2xkCj4gPiBpbnN0cnVjdGlvbnMgZGlmZmVycyBhIGJpdCBhbmQgYWdhaW4gdGhlIGphbHIg
aW5zdHJ1Y3Rpb24gZGlmZmVycyB0b28KPiA+IGluIHRoZSBwYXRjaGVkIGNvZGUgKGxvZyBbMV0p
Lgo+ID4KPiA+IFswXSBodHRwczovL3Bhc3RlLmRlYmlhbi5uZXQvMTI2MTQxMi8KPiA+IFsxXSBo
dHRwczovL3Bhc3RlLmRlYmlhbi5uZXQvMTI2MTQxMy8KPiA+Cj4gPiBBdHRhY2hlZCBpcyB0aGUg
b2JqdW1wIG9mIGRtYS1ub25jb2hlcmVudC5vIGZvciByZWZlcmVuY2UuCj4KPiBJIGRpZCByZWFk
IHRoYXQgb2JqZHVtcHMgYXJlIG5vdCByZWFsbHkgY29uY2x1c2l2ZSB3aGVuIGxvb2tpbmcKPiBh
dCBhdWlwYyArIGphbHIgaW5zdHJ1Y3Rpb25zLCBoZW5jZSB0aGUgcHJpbnRpbmcgb2YgdGhlIGFj
dHVhbCBpbnN0cnVjdGlvbnMuCj4KPiBBcyBlaXRoZXIgbWFudWFsbHkgb3Igd2l0aCBhIGhlbHBl
ciBsaWtlCj4KPiAgICAgICAgIGh0dHBzOi8vbHVwbGFiLmdpdGxhYi5pby9ydmNvZGVjanMvI3E9
MHhmNGMwODBlNwo+Cj4geW91IGNhbiB0aGVuIGRlY29kZSB0aGUgYWN0dWFsIGluc3RydWN0aW9u
IGFuZCBjb21wYXJlLgo+Ck9LLCBJIHdpbGwgZ2l2ZSBpdCBhIHRyeS4KCgo+IEluIHlvdXIgbG9n
IHRoZSB0d28gamFsciBpbnN0cnVjdGlvbnMgZGVjb2RlIHRvIGRpZmZlcmVudCBvZmZzZXRzLAo+
ICAgICAgICAgamFsciB4MSwgeDEsIC0xODAKPiB2cwo+ICAgICAgICAgamFsciB4MSwgeDEsIC04
MzQKPgo+IENhbiB5b3UgY2hlY2sgd2hhdCB0aGUgcGF0Y2hfb2Zmc2V0IHZhbHVlIGlzIGluIHlv
dXIgY2FzZT8KPgpJJ2xsIGNoZWNrIHRoYXQgYW5kIGxldCB5b3Uga25vdy4KCj4gSW50ZXJlc3Rp
bmdseSB0aGUKPiAgICAgICAgIGF1aXBjIHgxLCAwCj4gaXMgMCBmb3IgYm90aCBjYXNlcy4KPgo+
IEknbGwgdHJ5IHRvIGJ1aWxkIGEgcmVhbCB0ZXN0LXNldHVwIG1pbWljaW5nIHdoYXQgeW91J3Jl
IGRvaW5nCj4gdG9tb3Jyb3cgKGV1cm9wZWFuIHRvbW9ycm93KS4KPgpUaGFuayB5b3UhCgpDaGVl
cnMsClByYWJoYWthcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
