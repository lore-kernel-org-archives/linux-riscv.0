Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106B6C25B04
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 19:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3t4fm4LYTQSusPc7XtHUiYMBA23lznOJWpJCLeoKf6k=; b=WY0F4773g4HPbT
	uqt/j9T9hm8DGW1ElnzcQtAoLq1J85Q+sGCiE9JDF0tQXuRWaTNl9UHIuk2UY2n6GCBh5/Q3AVm6J
	tCNymth5uwPpk3C8hTXXTGSvy6A6U/jEbgXARfu0vACXbeTUJ43lGi7jojbieHyhMFsXMSNxw7HTK
	IOo4DbscVNsjF3OLnfDzEFyPS1C9WdbuUxcM73ebWoElZS9VRC4z033M2wiN0aAlHIYIS5pJCWCqO
	wXLpoLhBqNwT3aXSZ+vPxspY3Ki8iWzAFGmQBtzj0M7Xw0Y+u4Zm2ikWC5w1A3Fb0gP7Uxu9CB/e7
	Tu2kQUDomee/oDWwrCpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5tTr-00AwwJ-Np; Thu, 15 Dec 2022 19:01:19 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5tTo-00AwvK-OF
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 19:01:18 +0000
Received: by mail-pj1-x102d.google.com with SMTP id z8-20020a17090abd8800b00219ed30ce47so3669097pjr.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 11:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuChFR2oQEj+k5SBziL84rBEkRXF5P0h5Y1/WRLhyyY=;
        b=ZvKUZ+wIj8TxVtXe1RmNvLjYq85nqQBKWR2J/sMYL0yqrTyu+UIEtCMu6SMMiGuHdi
         NtF5eIEeBIIREjqALMs36a6cxpwOE4tLu1bZjVyfDBuVgxoncSgLgs+dbDTJpun20SSu
         Xt1Trrb36KkWuLHzxWxObFiky759qYX98nuqcexdTjQxbupuQ2oCvBmSq7jSZTMG794X
         d7O6OCqAMsUR3gtxmWGHRxJDe14XXy67HAKuF2xxfYIMr775J6cmYQk9q8BKZCM1XjUg
         eil5hXNgvld6EEtMwkPM7GV2sU/JeaNw/bUeaKkf6n9V3eF0WRY53FeeBV57gTVjLpd+
         vsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuChFR2oQEj+k5SBziL84rBEkRXF5P0h5Y1/WRLhyyY=;
        b=s/Ofh9GMma1xBmsSVmDHADuCLowb6eMb5o+1zLHKR/YjyAt8O+MD4l2jDIPJBZZPu8
         JdX8Q7+sOS56aYOuFHbPiufBXF5KPkiV6Gu2cSvW9ykNUnqtcInfZY9CX4H/vKTHY7jb
         Tl/LVLr6uqsfb9MnnEIC6Crjnw3Y7HSR5LIQJJcY8wj8qyPhSLyZu2HpnfnKMBtYY9YW
         j4Q30PAnDG9+Wt9ElZ8a4myfOIT0GidaDl6o8zQ/l94q1hv1XcmJCUSA8+t09zn0/UES
         XaDDO9oLr1PzAXTvES2lu+TXgebfGZyWslCn7Pk0Uu57yeQVT9xnulwB6np4qkTW8fA2
         HCgw==
X-Gm-Message-State: AFqh2kp0pOwAER0n+1aCyufUKabVjKDwMSJ4lF7inN0M7QFDDUYoJbS6
	53ZsYCiwVihvSm8xA5raBDVqI66TcSgYmiICtHY=
X-Google-Smtp-Source: AMrXdXtdRsOyrnYoJR2RVGd9eyrfrVTfZ1DFEMT0t/oIZUy03YLBzDZV9lr94IVNdHNbNiPMf0tQtHMH/Wi08Fn/tKY=
X-Received: by 2002:a17:90b:2415:b0:223:4d09:2523 with SMTP id
 nr21-20020a17090b241500b002234d092523mr368734pjb.161.1671130875248; Thu, 15
 Dec 2022 11:01:15 -0800 (PST)
MIME-Version: 1.0
References: <mhng-975b1d7b-7b3f-4e88-804c-8b22787f9588@palmer-ri-x1c9>
 <e9cf13a9-561a-3438-00f0-41fe2631888d@rivosinc.com> <Y5irn63DQkwumfvW@bruce.bluespec.com>
 <8fe9cfaf-2cbc-8de6-3928-067de9113bfc@rivosinc.com> <Y5qByfCtpV0uNID3@bruce.bluespec.com>
 <877cysx4yf.fsf@all.your.base.are.belong.to.us> <87h6xwdf5g.fsf@oldenburg.str.redhat.com>
 <24a1a812-95a9-ed97-abd1-c0ff259726d2@linaro.org> <15d902d0-4492-f828-7147-164319d741f9@rivosinc.com>
 <CA+=Sn1nH-b8OigfFBNKT_ECr5DL-jJ5XU+H9pA9g5gF=8YQNMQ@mail.gmail.com>
In-Reply-To: <CA+=Sn1nH-b8OigfFBNKT_ECr5DL-jJ5XU+H9pA9g5gF=8YQNMQ@mail.gmail.com>
From: Andrew Pinski <pinskia@gmail.com>
Date: Thu, 15 Dec 2022 11:01:02 -0800
Message-ID: <CA+=Sn1k=VoG1p9ZA0n5KYRg8yPbSkyxzd8piqDcTsTepqJQFyw@mail.gmail.com>
Subject: Re: RISCV Vector unit disabled by default for new task (was Re:
 [PATCH v12 17/17] riscv: prctl to enable vector commands)
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Florian Weimer <fweimer@redhat.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Darius Rad <darius@bluespec.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Waterman <andrew@sifive.com>, stillson@rivosinc.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, anup@brainfault.org, atishp@atishpatra.org, 
	guoren@kernel.org, Conor Dooley <conor.dooley@microchip.com>, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, andy.chiu@sifive.com, arnd@kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	libc-alpha@sourceware.org, christoph.muellner@vrull.eu, 
	Aaron Durbin <adurbin@rivosinc.com>, linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_110116_809894_B29A8AD7 
X-CRM114-Status: GOOD (  30.10  )
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

T24gVGh1LCBEZWMgMTUsIDIwMjIgYXQgMTA6NTkgQU0gQW5kcmV3IFBpbnNraSA8cGluc2tpYUBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBEZWMgMTUsIDIwMjIgYXQgMTA6NTcgQU0gVmlu
ZWV0IEd1cHRhIDx2aW5lZXRnQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4KPiA+Cj4gPiBP
biAxMi8xNS8yMiAwNzozMywgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6Cj4gPiA+IE9uIDEyLzE1
LzIyIDA0OjI4LCBGbG9yaWFuIFdlaW1lciB2aWEgTGliYy1hbHBoYSB3cm90ZToKPiA+ID4+ICog
QmrDtnJuIFTDtnBlbDoKPiA+ID4+Cj4gPiA+Pj4+IEZvciBTVkUsIGl0IGlzIGluIGZhY3QgZGlz
YWJsZWQgYnkgZGVmYXVsdCBpbiB0aGUga2VybmVsLiAgV2hlbiBhCj4gPiA+Pj4+IHRocmVhZAo+
ID4gPj4+PiBleGVjdXRlcyB0aGUgZmlyc3QgU1ZFIGluc3RydWN0aW9uLCBpdCB3aWxsIGNhdXNl
IGFuIGV4Y2VwdGlvbiwgdGhlCj4gPiA+Pj4+IGtlcm5lbAo+ID4gPj4+PiB3aWxsIGFsbG9jYXRl
IG1lbW9yeSBmb3IgU1ZFIHN0YXRlIGFuZCBlbmFibGUgVElGX1NWRS4gRnVydGhlciB1c2UKPiA+
ID4+Pj4gb2YgU1ZFCj4gPiA+Pj4+IGluc3RydWN0aW9ucyB3aWxsIHByb2NlZWQgd2l0aG91dCBl
eGNlcHRpb25zLiAgQWx0aG91Z2ggU1ZFIGlzCj4gPiA+Pj4+IGRpc2FibGVkIGJ5Cj4gPiA+Pj4+
IGRlZmF1bHQsIGl0IGlzIGVuYWJsZWQgYXV0b21hdGljYWxseS4gIFNpbmNlIHRoaXMgaXMgZG9u
ZQo+ID4gPj4+PiBhdXRvbWF0aWNhbGx5Cj4gPiA+Pj4+IGR1cmluZyBhbiBleGNlcHRpb24gaGFu
ZGxlciwgdGhlcmUgaXMgbm8gb3Bwb3J0dW5pdHkgZm9yIG1lbW9yeQo+ID4gPj4+PiBhbGxvY2F0
aW9uCj4gPiA+Pj4+IGVycm9ycyB0byBiZSByZXBvcnRlZCwgYXMgdGhlcmUgYXJlIGluIHRoZSBB
TVggY2FzZS4KPiA+ID4+Pgo+ID4gPj4+IEdsaWJjIGhhcyBhbiBTVkUgb3B0aW1pemVkIG1lbWNw
eSwgcmlnaHQ/IERvZXNuJ3QgdGhhdCBtZWFuIHRoYXQgcHJldHR5Cj4gPiA+Pj4gbXVjaCBhbGwg
cHJvY2Vzc2VzIG9uIGFuIFNWRSBjYXBhYmxlIHN5c3RlbSB3aWxsIGVuYWJsZSBTVkUKPiA+ID4+
PiAobGF6aWx5KT8gSWYKPiA+ID4+PiBzbywgdGhhdCdzIGNsb3NlIHRvICJlbmFibGVkIGJ5IGRl
ZmF1bHQiICh1bmxlc3MgU1ZFIGlzIGRpc2FibGVkIHN5c3RlbQo+ID4gPj4+IHdpZGUpLgo+ID4g
Pj4KPiA+ID4+IFllcywgc2VlIHN5c2RlcHMvYWFyY2g2NC9tdWx0aWFyY2gvbWVtY3B5LmM6Cj4g
PiA+Pgo+ID4gPj4gICAgc3RhdGljIGlubGluZSBfX3R5cGVvZiAoX19yZWRpcmVjdF9tZW1jcHkp
ICoKPiA+ID4+ICAgIHNlbGVjdF9tZW1jcHlfaWZ1bmMgKHZvaWQpCj4gPiA+PiAgICB7Cj4gPiA+
PiAgICAgIElOSVRfQVJDSCAoKTsKPiA+ID4+ICAgICAgICAgaWYgKHN2ZSAmJiBIQVZFX0FBUkNI
NjRfU1ZFX0FTTSkKPiA+ID4+ICAgICAgICB7Cj4gPiA+PiAgICAgICAgICBpZiAoSVNfQTY0Rlgg
KG1pZHIpKQo+ID4gPj4gICAgICAgICAgICByZXR1cm4gX19tZW1jcHlfYTY0Zng7Cj4gPiA+PiAg
ICAgICAgICByZXR1cm4gX19tZW1jcHlfc3ZlOwo+ID4gPj4gICAgICAgIH0KPiA+ID4+ICAgICAg
ICAgaWYgKElTX1RIVU5ERVJYIChtaWRyKSkKPiA+ID4+ICAgICAgICByZXR1cm4gX19tZW1jcHlf
dGh1bmRlcng7Cj4gPiA+PiAgICAgICAgIGlmIChJU19USFVOREVSWDIgKG1pZHIpIHx8IElTX1RI
VU5ERVJYMlBBIChtaWRyKSkKPiA+ID4+ICAgICAgICByZXR1cm4gX19tZW1jcHlfdGh1bmRlcngy
Owo+ID4gPj4gICAgICAgICBpZiAoSVNfRkFMS09SIChtaWRyKSB8fCBJU19QSEVDREEgKG1pZHIp
KQo+ID4gPj4gICAgICAgIHJldHVybiBfX21lbWNweV9mYWxrb3I7Cj4gPiA+PiAgICAgICAgIHJl
dHVybiBfX21lbWNweV9nZW5lcmljOwo+ID4gPj4gICAgfQo+ID4gPj4gICAgQW5kIHRoZSBfX21l
bWNweV9zdmUgaW1wbGVtZW50YXRpb24gYWN0dWFsbHkgdXNlcyBTVkUuCj4gPiA+Pgo+ID4gPj4g
SWYgdGhlcmUgd2VyZSBhIHByY3RsIHRvIHNlbGVjdCB0aGUgdmVjdG9yIHdpZHRoIGFuZCBlbmFi
bGUgdGhlIHZlY3Rvcgo+ID4gPj4gZXh0ZW5zaW9uLCB3ZSdkIGhhdmUgdG8gcGljayBhIHdpZHRo
IGluIGdsaWJjIGFueXdheS4KPiA+ID4KPiA+ID4gVGhlcmUgKmlzKiBhIHByY3RsIHRvIGFkanVz
dCB0aGUgU1ZFIHZlY3RvciB3aWR0aCwgYnV0IGdsaWJjIGRvZXMgbm90Cj4gPiA+IG5lZWQgdG8g
c2VsZWN0IGJlY2F1c2UgU1ZFIGR5bmFtaWNhbGx5IGFkanVzdHMgdG8gdGhlIGN1cnJlbnRseQo+
ID4gPiBlbmFibGVkIHdpZHRoLiAgVGhlIGtlcm5lbCBzZWxlY3RzIGEgZGVmYXVsdCB3aWR0aCB0
aGF0IGZpdHMgd2l0aGluCj4gPiA+IHRoZSBkZWZhdWx0IHNpZ25hbCBmcmFtZSBzaXplLgo+ID4g
Pgo+ID4gPiBUaGUgb3RoZXIgdGhpbmcgb2Ygbm90ZSBmb3IgU1ZFIGlzIHRoYXQsIHdpdGggdGhl
IGRlZmF1bHQgZnVuY3Rpb24gQUJJCj4gPiA+IGFsbCBvZiB0aGUgU1ZFIHN0YXRlIGlzIGNhbGwt
Y2xvYmJlcmVkLCB3aGljaCBhbGxvd3MgdGhlIGtlcm5lbCB0bwo+ID4gPiBkcm9wIGluc3RlYWQg
b2Ygc2F2ZSBzdGF0ZSBhY3Jvc3Mgc3lzdGVtIGNhbGxzLiAgKFRoZXJlIGlzIGEgc2VwYXJhdGUK
PiA+ID4gdmVjdG9yIGZ1bmN0aW9uIGNhbGwgQUJJIHdoZW4gU1ZFIHR5cGVzIGFyZSB1c2VkLikK
PiA+Cj4gPiBGb3IgdGhlIFJWIHBzQUJJLCBpdCBpcyBzaW1pbGFyIC0gYWxsIFYgcmVncyBhcmUK
PiA+IGNhbGxlci1zYXZlZC9jYWxsLWNsb2JiZXJlZCBbMV0gYW5kIHN5c2NhbGxzIGFyZSBub3Qg
cmVxdWlyZWQgdG8KPiA+IHByZXNlcnZlIFYgcmVncyBbMl0KPiA+IEhvd2V2ZXIgbGFzdCBJIGNo
ZWNrZWQgQVJNIGRvY3VtZW50YXRpb24gdGhlIEFCSSBkb2Mgc2VlbWVkIHRvIHN1Z2dlc3QKPiA+
IHRoYXQgc29tZSAocGFydHMpIG9mIHRoZSBTVkUgcmVncyBhcmUgY2FsbGVlLXNhdmVkIFszXQo+
Cj4gWWVzIHRoZSBsb3dlciA2NCBiaXRzIHdoaWNoIG92ZXJsYXAgd2l0aCB0aGUgZmxvYXRpbmcg
cG9pbnQgcmVnaXN0ZXJzLgoKSSBzaG91bGQgZXhwYW5kIG9uIHRoYXQsIG9ubHkgdGhlIHNwZWNp
ZmljIGNhbGxlZSByZWdpc3RlcnMgaGF2ZSB0bwpzYXZlIHRoZSBsb3dlciA2NGJpdHMgYmVjYXVz
ZSB0aGV5IG92ZXJsYXAgd2l0aCB0aGUgZmxvYXRpbmcgcG9pbnQKcmVnaXN0ZXJzLgoKVGhhbmtz
LApBbmRyZXcKCj4KPiBUaGFua3MsCj4gQW5kcmV3IFBpbnNraQo+Cj4KPiA+Cj4gPiA+Cj4gPiA+
IFNvIHdoaWxlIHN0cmNweSBtYXkgZW5hYmxlIFNWRSBmb3IgdGhlIHRocmVhZCwgdGhlIG5leHQg
c3lzY2FsbCBtYXkKPiA+ID4gZGlzYWJsZSBpdCBhZ2Fpbi4KPiA+Cj4gPiBOZXh0IHN5c2NhbGwg
Y291bGQgdHJhc2ggdGhlbSwgYnV0IHdpbGwgaXQgZGlzYWJsZSBTVkUgPyBEZXNwaXRlCj4gPiBz
eXNjYWxsL2Z1bmN0aW9uLWNhbGwgY2xvYmJlcnMsIHVzaW5nIFYgaW4gdGlnaHQgbG9vcHMgc3Vj
aCBhcyBtZW0qL3N0cioKPiA+IHN0aWxsIGlzIGEgd2luLgo+ID4KPiA+Cj4gPiBbMV0KPiA+IGh0
dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LWVsZi1wc2FiaS1kb2MvYmxvYi9t
YXN0ZXIvcmlzY3YtY2MuYWRvYwo+ID4gWzJdCj4gPiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Yv
cmlzY3Ytdi1zcGVjL2Jsb2IvbWFzdGVyL2NhbGxpbmctY29udmVudGlvbi5hZG9jCj4gPiBbM10K
PiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9BUk0tc29mdHdhcmUvYWJpLWFhL2Jsb2IvMjk4MmE5ZjNi
NTEyYTViZmRjOWUzZmVhNWQzYjI5OGY5MTY1YzM2Yi9hYXBjczY0L2FhcGNzNjQucnN0I3RoZS1i
YXNlLXByb2NlZHVyZS1jYWxsLXN0YW5kYXJkCj4gPiBTZWMgNi4xLjMgIi4uLi4gSW4gb3RoZXIg
Y2FzZXMgaXQgbmVlZCBvbmx5IHByZXNlcnZlIHRoZSBsb3cgNjQgYml0cyBvZgo+ID4gejgtejE1
Igo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
