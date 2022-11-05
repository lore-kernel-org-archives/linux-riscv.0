Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6671DC433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Nov 2022 22:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZnn9PFFxKg4H9DnhY1bjKoOFc1BtzO4AomMRCE/U50=; b=UZOeMSbUcrQIO3
	Gmkj+lLNoypGnjbya/ByFh33mjU8azR6oA81GiSCG+qGyvX+ghs1LtQJCDgr+DlUt025elRm9iB+S
	gsKMlfGbrNYwTrtRSSiAtW1A6j0nc+wvS39gAJ6SjWPcboMlO+zWOfMoLd1r+ktehUB2sDoJW8edA
	YqwOaMS3ITCe0z4ONlOyelpOTkP44SFCBg6vOwtd8J9rxd/jMqZsaTtCjsqYe73VTIXK3z8wgCoTf
	v6d8b+3saX5qcAcNueiYbn091PKnpEzM4KXLgJ82lSd5kRgxYXUnd8k3TERn8gIFi37kvoFBZRTIB
	bJNpK4RjDR4XE73Kv6NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orRrQ-007Kud-OV; Sat, 05 Nov 2022 22:41:56 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orRrO-007KuJ-Ox
	for linux-riscv@lists.infradead.org; Sat, 05 Nov 2022 22:41:56 +0000
Received: by mail-ej1-x629.google.com with SMTP id k2so21627651ejr.2
        for <linux-riscv@lists.infradead.org>; Sat, 05 Nov 2022 15:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfmEXeFgbdMj3gsUyt6lpX1UpHQKV916HoEE3gJfFeo=;
        b=XtkTbzPVNhvRHYgo7BUGgi5bqlcB8MqYHlLlnB8FnhvCMS094yVunIvf/jdsuZDOOs
         tfY3Y9DNzzJ2Wesj0mIts1AHC8PWGmw98CEf4wnCCakpgtIlessS/13oUGakS1bvQZCu
         uSxcYs62ym12RYwgIt+etHbyr2hnCSXtSFporz9RAp0K1tWu3EdtlaHnVPTXCJPRf6z7
         I3ifM7mCMmlGF42+/cWEhObapyCR1WlDL41vpiZzoM0TP3/kooW8cD/ixd2lrTlar4nr
         OJ3qC5Qo/Pc/h8XCxi4nlRvgdrLslg09LbMbkcviQMsRBFY3nEL8HLrGo+/TYuTdrQ2X
         nSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfmEXeFgbdMj3gsUyt6lpX1UpHQKV916HoEE3gJfFeo=;
        b=eWiSLdn1JDa4Rq/wnNrR+v8XA9XArW8EgDfFss4j0G5x2z86kWHuofAmuxyzOlvlKZ
         m0uz3/Ae8muvDmfr1lanpJWHXCrIZy8koUv4+OBfZvLfl8RNzWQSbg8noGRUEsRFT5sc
         GQm/zxVgHarKyjkof7kmWxt3WG8vLZw72/C4aDSWbbS/GOnGl1WdZXyMZWm9KimHnRA9
         3MpTRTPlI6BGNhxY3WzChYIQrfakIa6MIsognYYQMIXY/818RZp3QUjrHrOhtg5Te3Wk
         9GOCrOwtyvv8BQ89AeIU/Aa9GF3MrZsgIDZbyYGw20PsWk9ff69WdfmbedjDDTc1MQhD
         iScQ==
X-Gm-Message-State: ACrzQf0Plz0jwKzw1OaTSFYfOmNmSy0+ujeUN8uJffAFjNuW/2ag2jqN
	t55ImCgNt2r+VTaSrnHvZpA6iwT0nVmnehuMMrk=
X-Google-Smtp-Source: AMsMyM6ns4MEPdLaoD8n40DozQzUic8AQ7fU/pxX6sGEs2hcnnNui7DIE5vrzrSchKxyfsCAlQCAoqMogao9R5KGUJk=
X-Received: by 2002:a17:906:371a:b0:7ad:c01c:6fa0 with SMTP id
 d26-20020a170906371a00b007adc01c6fa0mr36486106ejc.267.1667688110637; Sat, 05
 Nov 2022 15:41:50 -0700 (PDT)
MIME-Version: 1.0
References: <CA+V-a8u_u9Q6Hb8kOZVKFjGyPsc2HQt88c4y2Nh8dzx0XSebeA@mail.gmail.com>
 <13365637.uLZWGnKmhe@diego>
In-Reply-To: <13365637.uLZWGnKmhe@diego>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 5 Nov 2022 22:41:24 +0000
Message-ID: <CA+V-a8v=ki9MJ-rUfuGaEYznaFM61w=G4F8Opce4VM95P_DNsg@mail.gmail.com>
Subject: Re: [QUERY]: RZ/Five (AX45MP) non-coherent DMA
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <Conor.Dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221105_154154_871612_B4AE1FAD 
X-CRM114-Status: GOOD (  27.48  )
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

SGkgSGVpa28sCgpPbiBGcmksIE5vdiA0LCAyMDIyIGF0IDExOjA3IFBNIEhlaWtvIFN0w7xibmVy
IDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+Cj4gSGkgUHJhYmhha2FyLAo+Cj4gQW0gRnJlaXRh
ZywgNC4gTm92ZW1iZXIgMjAyMiwgMjM6MDk6MTUgQ0VUIHNjaHJpZWIgTGFkLCBQcmFiaGFrYXI6
Cj4gPiBXaGVuIHRyeWluZyB0byBhZGQgbm9uIGNvaGVyZW50IERNQSBzdXBwb3J0IGZvciB0aGUg
UlovRml2ZSBTb0MsIEkgd2FzCj4gPiBzdWdnZXN0ZWQgdG8gdXNlIHRoZSBBTFRFUk5BVElWRSgp
IG1hY3JvIFswXS4KPiA+Cj4gPiBNeSBpbml0aWFsIGludGVudGlvbiB3YXMgdG8gaW1wbGVtZW50
IHRoZSBhbHRlcm5hdGl2ZV9jYWxsX3goKQo+ID4gc29tZXRoaW5nIGxpa2Ugd2hhdCB4ODYgaGFz
IGFuZCBmcm9tIHRoZXJlIGNhbGwgdGhlIEMgZnVuY3Rpb24sIFNvCj4gPiB3aGlsZSBkb2luZyBz
b21lIGV4cGVyaW1lbnRzIEkgcmVhbGl6ZWQgdGhhdCB1c2luZyB0aGUgYXNtICJjYWxsCj4gPiA8
ZnVuYz4iIHdvdWxkIGNhdXNlIGFkZGluZyB0aGUgd2hvbGUgbG90IG9mIHJlZ2lzdGVycyBpbiB0
aGUgY2xvYmJlcnMKPiA+IGxpc3QuCj4gPgo+ID4gQXMgcGVyIG15IHVuZGVyc3RhbmRpbmcgdGhl
IG9ubHkgY29ycmVjdCBhcHByb2FjaCB0bwo+ID4gYWx0ZXJuYXRpdmVfY2FsbF94KCkgaXMgaWYg
dGhlIGZ1bmN0aW9uIGl0c2VsZiBpcyBpbmxpbmUgYXNzZW1ibHkgdGhlbgo+ID4gd2Uga25vdyB0
aGUgZXhhY3QgcmVnaXN0ZXJzIGJlaW5nIHVzZWQgYW5kIHRoZW4gd2UgY291bGQgYWRkIHRoZW0K
PiA+IGFwcHJvcHJpYXRlbHkgaW4gdGhlIGNsb2JiZXJzIGxpc3QuCj4KPiBJJ20gd29ya2luZyBp
biBhIHF1aXRlIHNpbWlsYXIgYXJlYSByaWdodCBub3cgYW5kIEkndmUgQ2MnZWQgeW91IG9uIGEK
PiBSRkMgc2VyaWVzIHdoZW4gSSdtIGFsc28gd29ya2VkIG9uIG1ha2VpbmcgY2FsbCB3b3JrIGlu
IGFsdGVybmF0aXZlcy4KPgpHcmVhdCEuIEknbGwgZ28gdGhyb3VnaCB0aGUgc2VyaWVzIGFuZCB0
YWtlIHNvbWUgaW5zcGlyYXRpb24gZnJvbSBpdC4KCj4gQXMgeW91IG5vdGVkLCB1c2luZyBhc3Nl
bWJsZXIgZm9yIHRoZSBjYWxsJ2VkIGZ1bmN0aW9uIG1ha2VzIHRoaW5ncwo+IHdheSBlYXNpZXIg
dG8gaGFuZGxlLgo+CjotKQoKPiA+IFRoZSBwcm9ibGVtIHdpdGggdGhlIGFib3ZlIGFwcHJvYWNo
IGJlaW5nIHdlIGhhdmUgcXVpdGUgYSBsb3Qgb2YgQwo+ID4gY29kZSBbMV0gZm9yIHRoZSBDTU8g
YW5kIGl0IGFsc28gcmVxdWlyZXMgc29tZSByZWdpc3RlciB3cml0ZXMgb2YgdGhlCj4gPiBsMiBj
YWNoZSBjb250cm9sbGVyLCBjb252ZXJ0aW5nIHRoaXMgdG8gYXNzZW1ibHkgd291bGQgYmUgYSBw
YWluLgo+ID4KPiA+ICogSXMgbXkgdW5kZXJzdGFuZGluZyBjb3JyZWN0Pwo+ID4gKiBJcyB0aGVy
ZSBhbnkgb3RoZXIgYXBwcm9hY2ggSSBhbSBtaXNzaW5nPwo+ID4gKiBJcyB0aGVyZSBubyB3YXkg
b3V0IGFwYXJ0IGZyb20gaW1wbGVtZW50aW5nIGlubGluZSBhc20/Cj4KPiBJbiB0aGUgaW5saW5l
LWFzbSBwYXJ0IHRoYXQgd2lsbCBmb3JtIHRoZSBhbHRlcm5hdGl2ZSwgY2FuIHlvdQo+IG5vdCBq
dXN0IHNhdmUgYW5kIHJlc3RvcmUgdGhlIHJlZ2lzdGVycyBtYW51YWxseSBhcm91bmQgdGhlCj4g
YWN0dWFsIGNhbGw/Cj4KPiBBTFRFUk5BVElWRSgKPiBbMV0gLi4uIG5vcHMgLi4uLAo+IFsyXSAu
Li4gQ01PIC4uLiwKPiBbM10gLi4uIFRIRUFEIC4uLiwKPiBbNF0gc2F2ZSByZWdpc3RlcnMgdG8g
c3RhY2sKPiAgICAgY2FsbCBheDQ1bXAgZG1hLWZ1bmMKPiAgICAgcmVzdG9yZSByZWdpc3RlcnMg
ZnJvbSBzdGFjawo+Cj4gVGhhdCB3YXkgeW91IHdvdWxkIG5vIGluY3VyIG1hbnkgcGVuYWx0aWVz
IHRvIHRoZSBvdGhlciBhbHRlcm5hdGl2ZXMKPiBJIHRoaW5rLgo+CkFncmVlZCwgdGhhbmtzIGZv
ciB0aGUgc3VnZ2VzdGlvbi4gSSdsbCBjb250aW51ZSBteSBpbnZlc3RpZ2F0aW9uIGluCnRoaXMg
ZGlyZWN0aW9uLgoKQ2hlZXJzLApQcmFiaGFrYXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
