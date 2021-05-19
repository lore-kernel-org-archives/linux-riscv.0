Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67775C43460
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 18:17:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D9F760FF1
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 18:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D9F760FF1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VW/m/KAov2Hz0054Nyijoq/TP6j3k6/HIJup1Df2v4I=; b=MKFkUyhxChH+vtWoIYiVoNmqz
	vzHtRPSHTu1vNou//9GW3N/spC083QVlyM1Jj5TdhVwUHKn+pkRXoUeqPtD3o3mxdgeWzNHlbA17t
	wCV66/H7+xNFqcmhPxiGWVoMw6JjshFFLbXFgJ3QwIIzzBMKd8sOFkfo37xrF4DFVldUMUm8Fb6Jw
	hZIL0+7FlgH4M77DnlgEdhu16e5F0Tej7c6NAgILr0z+/MbeLp13HqDi6wW8QQ+nm3CuJxrgZFwgk
	+ALcJP7Vne4c2iKe6ugyfhD7L1ZxuKFNVhjQWmj5VdITYVISu2GIndFhdmmwZu/zY8yp40wDoRhfn
	+Yspbx3dw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljQlH-004kbj-Vl; Wed, 19 May 2021 18:17:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQlG-004kbU-Nz
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 18:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=2rY1yW/YsvOZYFTiuIc2+ehXyRnGQoCM7oBhn+XshDI=; b=iU5mdRSPAl4WO9KKn4wgYsaYGd
 9ny3qHQuO73FeRsc2zEK9sBLKp45JOBzlho7T2WjQ2LkRlOR9wE5PmKBVHF3IXF7OQzJ02e0NHNvF
 Cz+CkP2c7/NlvDD0gA/IbnaNvSjuzVg2fU6/pWTsmKLeW1jNOMi6KEkWUajpGJFxef/zFTHhT+IFK
 jeZFptEzLGtsi8vTj692XFarzCBrKeU00i7ReHfBZt48hZyxCl7ygBvMspii9c0Ey91XoYw5BCkY+
 EOmEHH+OdH3xmYG7oXTqWnE+5c4EsbIgFXGVZQzxAUWApjCUQtpcICNthsWwTPkxaGd1RD9V1u13m
 qb6+DRGg==;
Received: from mail-ua1-f50.google.com ([209.85.222.50])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQlD-00FgnB-GY
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 18:17:37 +0000
Received: by mail-ua1-f50.google.com with SMTP id q8so255536uap.5
 for <linux-riscv@lists.infradead.org>; Wed, 19 May 2021 11:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2rY1yW/YsvOZYFTiuIc2+ehXyRnGQoCM7oBhn+XshDI=;
 b=WRVCO2+8I4HerW+/tQit/IOXxy6NvawsB5QH7f0A50luBtWDEL+OJiICUoNpLBJysc
 vXwBrjKUjl4D5jWifmKBISQedg3wpIsbrZXKx6F1Jg6IjWsGZWRCL5maMkP4wREKvRrh
 seCef8ALDvUHNfQR9ChOenxDOWlJGbHiqOXMgR94hfTcGxPlnX24WgQwNIDmoA44tI59
 WVlJzgO95rQHZ3gJRIXqFq2ciklTEB3D20K5fzsSl+lvFKVqDbzdNj+McXOkBf58Mv6D
 qcDeeQs8AkxGapzqrnkSR+FUBPs8KqyVMg9Zx7Pnii5lbFhGUHN1VZUAwJ51CDWukKNs
 tk2w==
X-Gm-Message-State: AOAM530JtAQb/ic0ovW6NFzFTKcNP/UiYfskLuFQcEFJwzcaevC/dyM4
 /Ap40BzlYogKxNOQozwbPBOwpm/H7tvNtkLS0FU=
X-Google-Smtp-Source: ABdhPJwW7PwgWmazkSCrWv4XAkCvSaYsIKLalnqHAOYA26PIBau9vsCcc8rqJcC2rad2wL1KTwP6PI8LTRXqT3PWq4A=
X-Received: by 2002:ab0:7705:: with SMTP id z5mr1011167uaq.2.1621448248375;
 Wed, 19 May 2021 11:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201209094916.17383-1-zong.li@sifive.com>
 <87v99qyjaz.fsf@igel.home>
 <CANXhq0oLxFK1431WmTj5HRO5k_omYkQZCBTG+HORTk9=W_XyNg@mail.gmail.com>
 <CANXhq0p90Cgha_zLzxamK9mxmVPn3effh_cZq_CTLrcAkKZg2Q@mail.gmail.com>
 <87lfaj7cki.fsf@igel.home> <871rc4on36.fsf@igel.home>
 <CANXhq0pDge0BPgAjoLrX7Y2qtofb3dhV1_CPHBaCg0o4cEMrbQ@mail.gmail.com>
 <87a6qrk2pw.fsf@igel.home>
 <CANXhq0rOeAWnRYHAYKJfDeY4kYz6+5mU_dJSqU67+2p9u0STHQ@mail.gmail.com>
 <874kgyfetu.fsf@igel.home>
 <CANXhq0rE-ZcPBp02Pvozpk_s-j6NhxHUmso75uz6ji9bejO8gA@mail.gmail.com>
 <87h7kukzy4.fsf@igel.home>
 <CANXhq0r5_xhFu3W9mUFkp_7BYUVBzvHZE1A6jpBDcL_KwTc1cA@mail.gmail.com>
 <87tuob7n8g.fsf@igel.home>
 <CANXhq0rTC8grpRe_Q0vG6_52b-41OuN4vHum8RvouMbE6xiXpQ@mail.gmail.com>
 <CALecT5jQ7_-d7j+MXrG++Bnr_wYmbWgCK20Ju5Pgjbu9xmwQBA@mail.gmail.com>
 <CANXhq0q-ou6h_Qxjtq52RQ_V2ERu8JLNa7Vq77Rpv_+SFX4LNA@mail.gmail.com>
In-Reply-To: <CANXhq0q-ou6h_Qxjtq52RQ_V2ERu8JLNa7Vq77Rpv_+SFX4LNA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 May 2021 20:17:16 +0200
Message-ID: <CAMuHMdWGakAT1LKg_sje=ZYTbLX1_BjjOsqOYP9KrzhMmMi6Ag@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] clk: add driver for the SiFive FU740
To: Zong Li <zong.li@sifive.com>
Cc: Yixun Lan <yixun.lan@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Stephen Boyd <sboyd@kernel.org>, Pragnesh Patel <pragnesh.patel@openfive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_111735_583266_42EB5BDC 
X-CRM114-Status: GOOD (  36.04  )
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

SGkgWm9uZywKCk9uIFdlZCwgTWF5IDE5LCAyMDIxIGF0IDU6NTUgUE0gWm9uZyBMaSA8em9uZy5s
aUBzaWZpdmUuY29tPiB3cm90ZToKPiBPbiBUdWUsIE1heSAxMSwgMjAyMSBhdCA0OjU3IFBNIFlp
eHVuIExhbiA8eWl4dW4ubGFuQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBPbiBXZWQsIEFwciAxNCwg
MjAyMSBhdCAyOjI1IFBNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPiA+
IE9uIE1vbiwgQXByIDEyLCAyMDIxIGF0IDc6MzEgUE0gQW5kcmVhcyBTY2h3YWIgPHNjaHdhYkBs
aW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4gPiA+ID4gT24gTcOkciAzMSAyMDIxLCBab25nIExpIHdy
b3RlOgo+ID4gPiA+ID4gSSBmb3VuZCB0aGF0IHRoZSBnZW1neGxwbGwgd2FzIGRpc2FibGVkIGlt
bWVkaWF0ZWx5IGJ5IHBvd2VyCj4gPiA+ID4gPiBtYW5hZ2VtZW50IGFmdGVyIG1hY2IgZHJpdmVy
IGluc3RhbGwuIFRoZSBtYWlubGluZSdzIGRlZmNvbmZpZyBkb2Vzbid0Cj4gPiA+ID4gPiBlbmFi
bGUgQ09ORklHX1BNLCBzbyB0aGUgbmV0d29yayBpcyBmaW5lIG9uIGl0LiBUaGUgb3BlbnN1c2Ug
ZGVmY29uZmlnCj4gPiA+ID4gPiBlbmFibGVzIENPTkZJR19QTSwgYW5kIHRoZSBwYXRjaAo+ID4g
PiA+ID4gNzMyMzc0YTBiNDQwZDlhNzljODQxMmYzMThhMjVjZDM3YmE2ZjRlMiBhZGRlZCB0aGUg
ZW5hYmxlL2Rpc2FibGUKPiA+ID4gPiA+IGNhbGxiYWNrIGZ1bmN0aW9ucywgc28gdGhlIGdlbWd4
bHBsbCBQTEwsIEkgaGF2ZSBubyBpZGVhIHdoeSBwb3dlcgo+ID4gPiA+ID4gbWFuYWdlbWVudCBk
aXNhYmxlIGl0LCBJIHdvdWxkIGtlZXAgdHJhY2UgaXQuCj4gPiA+ID4KPiA+ID4gPiBEb2VzIHRo
YXQgbWVhbiB0aGF0IENPTkZJR19QTSBhbHNvIGFmZmVjdHMgdGhlIEZVNzQwPwo+ID4gPgo+ID4g
PiBZZXMsIHdlIGdvdCB0aGUgc2FtZSBwcm9ibGVtIG9uIHRoZSBGVTc0MC4gV2UgYXJlIGNoZWNr
aW5nIHRoZSBpc3N1ZS4KPiA+ID4KPiA+IEp1c3QgYSBtaWxkIHBpbmcsIGFueSBwcm9ncmVzcyBy
ZWdhcmRpbmcgdGhpcyBpc3N1ZT8KPgo+IEN1cnJlbnRseSwgaWYgcnVudGltZSBwb3dlciBtYW5h
Z2VtZW50IGlzIGVuYWJsZWQsIG1hY2IgZHJpdmVyIHdvdWxkCj4gZ28gdG8gc2xlZXAgYXQgdGhl
IGVuZCBvZiBtYWNiX3Byb2JlLCB0aGVuIHRoZSBnaWdhYml0IGV0aGVybmV0IFBMTAo+IHdvdWxk
IGJlIGRpc2FibGVkLiAgRHVyaW5nIHRoaXMgcGVyaW9kIG9mIHRpbWUsIHRoZSBzeXN0ZW0gd291
bGQgaGFuZwo+IHVwIGlmIHdlIHRyeSB0byBhY2Nlc3MgR0VNR1hMIGNvbnRyb2wgcmVnaXN0ZXJz
LCBpdCBtZWFucyB0aGF0IHdlCj4gY2FuJ3QgYWNjZXNzIEdFTUdYTCBjb250cm9sIHJlZ2lzdGVy
cyBiZWZvcmUgdGhlIGdpZ2FiaXQgZXRoZXJuZXQgUExMCj4gaXMgcmVzdW1lZCBhZ2Fpbi4gVGhl
cmUgYXJlIHNvbWUgY2FzZXMsIGZvciBleGFtcGxlLCBpZiB3ZSBleGVjdXRlIHRoZQoKU291bmRz
IGZhbWlsaWFyLgoKPiAnaWZjb25maWcnIGNvbW1hbmQsIGl0IHdvdWxkIGV2ZW50dWFsbHkgZ28g
dG8gdGhlIG1hY2JfZ2V0X3N0YXR1cyB0bwoKRG8geW91IG1lYW4gbWFjX2dldF9zdGF0cygpPyBt
YWNiX2dldF9zdGF0dXMoKSBkb2VzIG5vdCBleGlzdC4KCj4gYWNjZXNzIEdFTUdYTCBjb250cm9s
IHJlZ2lzdGVycyBhbmQgY2F1c2UgdGhlIHN5c3RlbSB0byBoYW5nIHVwLiBHaXZlCj4gbW9yZSBl
eGFtcGxlIGhlcmUsIGlmIHdlIGV4ZWN1dGUgJ2lwIGxpbmsgc2V0IGxvIHVwICYgaXAgYWRkciBh
ZGQKPiAxMjcuMC4wLjEvOCBkZXYgbG8nLCBpdCB3b3VsZCBjYXVzZSB0aGUgc3lzdGVtIHRvIGhh
bmcgdXAsIGJlY2F1c2UKPiB0aGVzZSBjb21tYW5kcyB3b3VsZCB0cnkgdG8gcXVlcnkgdGhlIGlu
dGVyZmFjZXMgYW5kIGV2ZW50dWFsbHkgZ28gdG8KPiBtYWNiX2dldF9zdGF0dXMgYXMgd2VsbC4g
SG93ZXZlciwgaWYgd2UgY2FuIHJlc3VtZSB0aGUgZ2lnYWJpdAo+IGV0aGVybmV0IFBMTCBmaXJz
dCwgc3VjaCBhcyAnaXAgbGluayBzZXQgZXRoMCB1cCcgb3IgJ3VkaGNwYycsIHRoZW4KPiBldmVy
eXRoaW5nIGdvZXMgd2VsbC4gSSdtIHRyeWluZyB0byBmaWd1cmUgb3V0IGlmIHRoZXJlIGFyZSBz
b21lIGhvb2tzCj4gdGhhdCB3ZSBjYW4gY2hlY2sgdGhlIFBMTCBzdGF0dXMgaW4gdGhlIG1hY2Ig
ZHJpdmVyIGJlZm9yZSBpdCBhY3R1YWxseQo+IHRvdWNoZXMgdGhlIGNvbnRyb2wgcmVnaXN0ZXJz
LiBJZiBhbnlvbmUgaGFzIGFuIGlkZWEgYWJvdXQgdGhhdCwKPiBwbGVhc2UgZmVlbCBmcmVlIHRv
IHBvaW50IGl0IG91dCB0byBtZSwgdGhhbmtzLgoKQW5kIHlvdSBjYW5ub3QgY2FsbCBwbV9ydW50
aW1lX2dldF9zeW5jKCksIGFzIHRoaXMgaXMgY2FsbGVkIGZyb20KYXRvbWljIGNvbnRlY3QuIE90
aGVyIGRyaXZlcnMgYXZvaWQgYWNjZXNzaW5nIHRoZSByZWdpc3RlcnMgd2hpbGUKdGhlIGRldmlj
ZSBpcyBub3QgdXAsIGNmci4gZS5nLiBjb21taXQgN2ZhMjk1NWZmNzBjZTQ1MyAoInNoX2V0aDoK
Rml4IHNsZWVwaW5nIGZ1bmN0aW9uIGNhbGxlZCBmcm9tIGludmFsaWQgY29udGV4dCIpLgoKR3J7
b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0
IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2Vl
cnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0
byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0
aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
