Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF414C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 15:54:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25B4A611BF
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 15:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25B4A611BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Un5V2QvS/g5704TcZnI/WZ7xqLiKocmWvStcRfomm1Q=; b=ShAZp2eiJOj/qShn0ebloffR3
	81IET7pxIpiqPmOxLjgScM02sFwrWDkoEgnw0s1zDfKNnKJw8nmftxCU+EGOA7s9LW6EbglAq9Qbb
	gwPNmzkjCPVnxUWXcUDmaabaF+VniFzCa4ikPnndGDsSrEhmy7erCTzmV03ZXHfoQzYbUX2BhNkIz
	ZcXdkIsNP/r6xZZFH46MfehSNBJO5qRQXX30K3oysJ0TUY3eNMm+3tGaD+rIisgiZy2whjkxXDQ33
	jRfW2h4biC7Kt5ABjhTz32lNKCTKrGiOJbkqEcjjSDIBJUsDDKTgPeO15SWVXJcrWilAK+lGjDVAh
	S6j2OMsQA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljOWA-004Rlm-Hd; Wed, 19 May 2021 15:53:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljOW8-004RlN-7C
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 15:53:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=+h7qBn31/XdOKJhJupPMTX05eKZyP5qewLWYYYVaOa4=; b=QkSH9OjeKcpWy3jJ8RL07nYDUW
 HVDpw0YyaoWfvhdI5Vw0BxXv2X/V+tA3BTGVabLCnzEl4g8ZVKN88RtquL2xgPtSdjuofc7blxZef
 NGOg0kZAwkZ0sWZbx8xfEIucLgblqubUeQz59DVBtlN/77HLsLhpubWY3o2YSsz2vieZpMxxBZK5E
 +lJvmIfj7Ncn83Q/isF3e4e1BYBwDVFfRvGvjCvmLmuYhF+vj+jUc6mvVWiUBssaLu0aLbj+DHrYY
 EIVTYXYli4L3l7iiDIZg4QugqrtkwkXnaDD+i+2vijDLrb5cCvIviL3ykz+/HHbpzk90FFQ+lYjl+
 ITr7dh6w==;
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljOW5-00FbYp-Ab
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 15:53:50 +0000
Received: by mail-lj1-x232.google.com with SMTP id w7so2844507lji.6
 for <linux-riscv@lists.infradead.org>; Wed, 19 May 2021 08:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+h7qBn31/XdOKJhJupPMTX05eKZyP5qewLWYYYVaOa4=;
 b=gKAxLopmId1irlMMaOBYM3XHjyy4rHKldUhIsjxpaOh9yF9PBe6/8DOnOcJXOhSxtL
 PRmQH/6/tIZrJJS3wFonduNEGuEv9Ii602QKjuPmttmSXX5fDNq9ra4edMdO5My3eJSw
 JD1SwaSsm+0yuudPCgmJRpSORU8xHb0guqz0Dh5HjW4D8axJBJYR+O5siDmC8qR3n/vG
 dyC0ksMpziDxYgH2Hc1z6f/xmCKdEbGCW0K6EryBUD5+oQ9ZVG8CNFF5MGLzQXIkuuni
 1xKxAFQPNxtkYAvbkMLcV9DtXl2z4wGunp+DxMHQQO7rc0OVmymqJhzuy27+e+A1jzwz
 2Itg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+h7qBn31/XdOKJhJupPMTX05eKZyP5qewLWYYYVaOa4=;
 b=jkI+5fU7ONNP0nOa7EPsUD1gs9+vCMFYqMLUxmd9iiv5A5rmGYrG78scfzq90H/xQY
 OEg/MlSZknczdh1ccVWKpeW+nFaCtTcPbYYPUzMlTd4wGOtbqC1+vRtiaAExOSAem2TZ
 jIo6v2iu2wveyqIYp93ehpNOAIFYZE7MTrdI20Awy3vCFxI/FnNQmbiHG1elzyEJ6Aye
 CXKHS3JsBwZAilXdy5ETyEgDq3Clz1+QW6l3BaxFBvP1Rabh7WtQGjTy+hsaLmwV2Ajh
 wEqsE/v9ohOOeS5YMs4MkXhl8Fz9XyoiXTSgC2z5Cx+9HLfYfPH2+tOsOb3hB6DJH5iF
 yUWA==
X-Gm-Message-State: AOAM530DW8DqPGJ/WwxDZOngMLWoDcm6bL5ijEQwnvrl/VR75zsvfxos
 jKtCquw9lWiNR3yGHxJnHLuklVGXnwG2+3R1XEufaw==
X-Google-Smtp-Source: ABdhPJzstoito5f6ig1I5Nm25wwkcDeVPsvWfkNlrovbdfFlE/8m1RtVJDkkMeKMpjcycWYhfwUlgpNCBUxdQbnJWaE=
X-Received: by 2002:a2e:82c5:: with SMTP id n5mr9289881ljh.191.1621439626369; 
 Wed, 19 May 2021 08:53:46 -0700 (PDT)
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
In-Reply-To: <CALecT5jQ7_-d7j+MXrG++Bnr_wYmbWgCK20Ju5Pgjbu9xmwQBA@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 19 May 2021 23:53:33 +0800
Message-ID: <CANXhq0q-ou6h_Qxjtq52RQ_V2ERu8JLNa7Vq77Rpv_+SFX4LNA@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] clk: add driver for the SiFive FU740
To: Yixun Lan <yixun.lan@gmail.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Stephen Boyd <sboyd@kernel.org>, 
 Pragnesh Patel <pragnesh.patel@openfive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Michael Turquette <mturquette@baylibre.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_085349_423082_3CC95DEA 
X-CRM114-Status: GOOD (  24.34  )
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

T24gVHVlLCBNYXkgMTEsIDIwMjEgYXQgNDo1NyBQTSBZaXh1biBMYW4gPHlpeHVuLmxhbkBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBBcHIgMTQsIDIwMjEgYXQgMjoyNSBQTSBab25nIExp
IDx6b25nLmxpQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgQXByIDEyLCAyMDIx
IGF0IDc6MzEgUE0gQW5kcmVhcyBTY2h3YWIgPHNjaHdhYkBsaW51eC1tNjhrLm9yZz4gd3JvdGU6
Cj4gPiA+Cj4gPiA+IE9uIE3DpHIgMzEgMjAyMSwgWm9uZyBMaSB3cm90ZToKPiA+ID4KPiA+ID4g
PiBJIGZvdW5kIHRoYXQgdGhlIGdlbWd4bHBsbCB3YXMgZGlzYWJsZWQgaW1tZWRpYXRlbHkgYnkg
cG93ZXIKPiA+ID4gPiBtYW5hZ2VtZW50IGFmdGVyIG1hY2IgZHJpdmVyIGluc3RhbGwuIFRoZSBt
YWlubGluZSdzIGRlZmNvbmZpZyBkb2Vzbid0Cj4gPiA+ID4gZW5hYmxlIENPTkZJR19QTSwgc28g
dGhlIG5ldHdvcmsgaXMgZmluZSBvbiBpdC4gVGhlIG9wZW5zdXNlIGRlZmNvbmZpZwo+ID4gPiA+
IGVuYWJsZXMgQ09ORklHX1BNLCBhbmQgdGhlIHBhdGNoCj4gPiA+ID4gNzMyMzc0YTBiNDQwZDlh
NzljODQxMmYzMThhMjVjZDM3YmE2ZjRlMiBhZGRlZCB0aGUgZW5hYmxlL2Rpc2FibGUKPiA+ID4g
PiBjYWxsYmFjayBmdW5jdGlvbnMsIHNvIHRoZSBnZW1neGxwbGwgUExMLCBJIGhhdmUgbm8gaWRl
YSB3aHkgcG93ZXIKPiA+ID4gPiBtYW5hZ2VtZW50IGRpc2FibGUgaXQsIEkgd291bGQga2VlcCB0
cmFjZSBpdC4KPiA+ID4KPiA+ID4gRG9lcyB0aGF0IG1lYW4gdGhhdCBDT05GSUdfUE0gYWxzbyBh
ZmZlY3RzIHRoZSBGVTc0MD8KPiA+ID4KPiA+Cj4gPiBZZXMsIHdlIGdvdCB0aGUgc2FtZSBwcm9i
bGVtIG9uIHRoZSBGVTc0MC4gV2UgYXJlIGNoZWNraW5nIHRoZSBpc3N1ZS4KPiA+Cj4gSnVzdCBh
IG1pbGQgcGluZywgYW55IHByb2dyZXNzIHJlZ2FyZGluZyB0aGlzIGlzc3VlPwoKQ3VycmVudGx5
LCBpZiBydW50aW1lIHBvd2VyIG1hbmFnZW1lbnQgaXMgZW5hYmxlZCwgbWFjYiBkcml2ZXIgd291
bGQKZ28gdG8gc2xlZXAgYXQgdGhlIGVuZCBvZiBtYWNiX3Byb2JlLCB0aGVuIHRoZSBnaWdhYml0
IGV0aGVybmV0IFBMTAp3b3VsZCBiZSBkaXNhYmxlZC4gIER1cmluZyB0aGlzIHBlcmlvZCBvZiB0
aW1lLCB0aGUgc3lzdGVtIHdvdWxkIGhhbmcKdXAgaWYgd2UgdHJ5IHRvIGFjY2VzcyBHRU1HWEwg
Y29udHJvbCByZWdpc3RlcnMsIGl0IG1lYW5zIHRoYXQgd2UKY2FuJ3QgYWNjZXNzIEdFTUdYTCBj
b250cm9sIHJlZ2lzdGVycyBiZWZvcmUgdGhlIGdpZ2FiaXQgZXRoZXJuZXQgUExMCmlzIHJlc3Vt
ZWQgYWdhaW4uIFRoZXJlIGFyZSBzb21lIGNhc2VzLCBmb3IgZXhhbXBsZSwgaWYgd2UgZXhlY3V0
ZSB0aGUKJ2lmY29uZmlnJyBjb21tYW5kLCBpdCB3b3VsZCBldmVudHVhbGx5IGdvIHRvIHRoZSBt
YWNiX2dldF9zdGF0dXMgdG8KYWNjZXNzIEdFTUdYTCBjb250cm9sIHJlZ2lzdGVycyBhbmQgY2F1
c2UgdGhlIHN5c3RlbSB0byBoYW5nIHVwLiBHaXZlCm1vcmUgZXhhbXBsZSBoZXJlLCBpZiB3ZSBl
eGVjdXRlICdpcCBsaW5rIHNldCBsbyB1cCAmIGlwIGFkZHIgYWRkCjEyNy4wLjAuMS84IGRldiBs
bycsIGl0IHdvdWxkIGNhdXNlIHRoZSBzeXN0ZW0gdG8gaGFuZyB1cCwgYmVjYXVzZQp0aGVzZSBj
b21tYW5kcyB3b3VsZCB0cnkgdG8gcXVlcnkgdGhlIGludGVyZmFjZXMgYW5kIGV2ZW50dWFsbHkg
Z28gdG8KbWFjYl9nZXRfc3RhdHVzIGFzIHdlbGwuIEhvd2V2ZXIsIGlmIHdlIGNhbiByZXN1bWUg
dGhlIGdpZ2FiaXQKZXRoZXJuZXQgUExMIGZpcnN0LCBzdWNoIGFzICdpcCBsaW5rIHNldCBldGgw
IHVwJyBvciAndWRoY3BjJywgdGhlbgpldmVyeXRoaW5nIGdvZXMgd2VsbC4gSSdtIHRyeWluZyB0
byBmaWd1cmUgb3V0IGlmIHRoZXJlIGFyZSBzb21lIGhvb2tzCnRoYXQgd2UgY2FuIGNoZWNrIHRo
ZSBQTEwgc3RhdHVzIGluIHRoZSBtYWNiIGRyaXZlciBiZWZvcmUgaXQgYWN0dWFsbHkKdG91Y2hl
cyB0aGUgY29udHJvbCByZWdpc3RlcnMuIElmIGFueW9uZSBoYXMgYW4gaWRlYSBhYm91dCB0aGF0
LApwbGVhc2UgZmVlbCBmcmVlIHRvIHBvaW50IGl0IG91dCB0byBtZSwgdGhhbmtzLgoKCj4KPiBZ
eHVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
