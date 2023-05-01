Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1760DC77B7C
	for <linux-riscv@archiver.kernel.org>; Mon,  1 May 2023 20:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWUOUr0S2VstFw5Mw23iP8ik20mvjPGbeIAshzxMT08=; b=verI+cp4s4mfc4
	FqkqNNgewiJt2ndX/QOeWMPdxFghjIPgtGajSJdHEeKBaPNabQvMTwYFzI5ZxgYVyvIJeOPkpax6l
	r23kv/Eaf339SsZNCTTPrYnGCGpTVcvW/J0jan38I8GEJy0N4oo/qOUgBQmmeTl+ZEysEXuyXS2K3
	lKkRokHKzlLo8knmJDRWrUK14OQMxt9XgRQziAA2jza9MydTa8bC3/0v4OQ+sP9U/Z4Ca8p5ZIKzs
	OtXxkSZmpHebwF2ibvQG8/q0A9WpouTJvZ7LbY1sWaPOSWzHuoFCJXFTv+Dhq0Lg1cyHZfN+HmMhn
	sycdy4GakRoV3AagCHbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptZpa-00GqzR-2U;
	Mon, 01 May 2023 20:09:06 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptZpT-00Gqxn-12
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 20:09:05 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f199696149so16891855e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 13:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1682971730; x=1685563730;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNEnyZjeMgXIjOySMzC1Nr3EEs2BX/oIpvOTrJwSTWA=;
        b=NU/XgCJwVgtNGw/y4aUZ4yUwZD0YoY7sBruWi76FiK2ktpoUCs5qTXiINRBKOnwSDg
         r2pbXdqhIiE3OrmHSpSiBozKFp4XDo9gtX2VoMa3jYnWeUGRneBn/T6D9H6OMZDa8WXw
         3QDnD9Oc5htL3mM0KhfH0xcQ8RUBq+HtWrIHEt1mMuNzxBELZsWk1L5sWib/6RbPSj2Z
         hG7RJS7ssg3OLRyDnOJNadaSBxBWIASSVW4YVVjH89nyKaINJHcb7MY0c69qrqgvg937
         HT7fnk+nJrcVqqg/HeA702lyOfG8x16JNnh6mRkNIwWgR+K3h90m22tP781w0O80astL
         nGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682971730; x=1685563730;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNEnyZjeMgXIjOySMzC1Nr3EEs2BX/oIpvOTrJwSTWA=;
        b=a900Lje449w3wCr5fJc6U8TXSyYEVYv32AbTqODQP8tPfL621R0NPh9iMDjHmvuzqF
         Dol13IWUfdzkNeyf+V29471SCPtCSUi3NnT8xsaq9dzd9SUuGFD8Z7/A4Zt/AridLngV
         22+rjMQHgmX15vNsX5u1x9DqCAX+7jPj5w4yI78DX9MOfTgxMneMkYD6+KUvjaEJvBxu
         42zYSIDOUDYzEBqeosb+Ha8DHmKbQSqQWDCYPjE2t5bB863wNO/TIfC/5/8P2uFfYeR0
         S0SjiG9tzPTEXXW7LZds5wbNLMk5ZwZgX6uUZAY+QUuF506JI6m0DVfx7SDM53ekOWiw
         IPeg==
X-Gm-Message-State: AC+VfDwJ8EsdWujtwhygr9Fu6fGdcBQcODgNF+EqQx9sKVdgx7e1psXP
	Za/2zvhhCsd1lPYTqBzkvFBh9A==
X-Google-Smtp-Source: ACHHUZ6Hfmr3l/cAhhs3vBCFmGlsXjd7ooDbYqDSdAUhXWW3tajdyie0cH6nmfHmMO2cWAU7Mtu1bQ==
X-Received: by 2002:a7b:c408:0:b0:3eb:42fc:fb30 with SMTP id k8-20020a7bc408000000b003eb42fcfb30mr10291092wmi.32.1682971730542;
        Mon, 01 May 2023 13:08:50 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id 14-20020a05600c028e00b003f18b942338sm33058328wmk.3.2023.05.01.13.08.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 May 2023 13:08:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 0/4] Expose the isa-string via the AT_BASE_PLATFORM aux
 vector
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <87ednz7roh.fsf@all.your.base.are.belong.to.us>
Date: Mon, 1 May 2023 21:08:48 +0100
Cc: Heiko Stuebner <heiko@sntech.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 matthias.bgg@gmail.com,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 nick.knight@sifive.com,
 christoph.muellner@vrull.eu,
 philipp.tomsich@vrull.eu,
 richard.henderson@linaro.org,
 arnd@arndb.de,
 linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@vrull.eu>
Message-Id: <7DD2C38C-CBB3-41EE-A195-50E4C2451B7E@jrtc27.com>
References: <20230424194911.264850-1-heiko.stuebner@vrull.eu>
 <87ednz7roh.fsf@all.your.base.are.belong.to.us>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_130859_373694_061A091A 
X-CRM114-Status: GOOD (  37.97  )
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

T24gMSBNYXkgMjAyMywgYXQgMjA6NTUsIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+
IHdyb3RlOgo+IAo+IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyaXRlczoKPiAK
Pj4gRnJvbTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHZydWxsLmV1Pgo+PiAKPj4g
VGhlIGh3cHJvYmluZyBpbmZyYXN0cnVjdHVyZSB3YXMgbWVyZ2VkIHJlY2VudGx5IFswXSBhbmQg
Y29udGFpbnMgYQo+PiBtZWNoYW5pc20gdG8gcHJvYmUgYm90aCBleHRlbnNpb25zIGJ1dCBhbHNv
IG1pY3JvYXJjaGl0ZWN1cmFsIGZlYXR1cmVzCj4+IG9uIGEgcGVyLWNvcmUgbGV2ZWwgb2YgZGV0
YWlsLgo+PiAKPj4gV2hpbGUgZGlzY3Vzc2luZyB0aGUgc29sdXRpb24gaW50ZXJuYWxseSB3ZSBp
ZGVudGlmaWVkIHNvbWUgcG9zc2libGUgaXNzdWVzLAo+PiB0cmllZCB0byB1bmRlcnN0YW5kIHRo
ZSB1bmRlcmx5aW5nIGlzc3VlIGFuZCBjb21lIHVwIHdpdGggYSBzb2x1dGlvbiBmb3IgaXQuCj4+
IEFsbCB0aGVzZSBkZWxpYmVyYXRpb25zIG92ZXJsYXBwZWQgd2l0aCBod3Byb2JpbmcgYmVpbmcg
bWVyZ2VkLCBidXQgdGhhdAo+PiBzaG91bGRuJ3QgcmVhbGx5IGJlIGFuIGlzc3VlLCBhcyBib3Ro
IGhhdmUgdGhlaXIgdXNhYmlsaXR5IC0gc2VlIGJlbG93Lgo+PiBBbHNvIHBsZWFzZSBzZWUgdGhl
ICJUaGluZ3MgdG8gY29uc2lkZXIiIGF0IHRoZSBib3R0b20hCj4+IAo+PiAKPj4gUG9zc2libGUg
aXNzdWVzOgo+PiAtIHZlcnkgbXVjaCBsaW1pdGVkIHRvIExpbnV4Cj4+IC0gc2NoZWR1bGVycyBy
dW4gcHJvY2Vzc2VzIG9uIGFsbCBjb3JlcyBieSBkZWZhdWx0LCBzbyB3aWxsIG5lZWQKPj4gIHRo
ZSBjb21tb24gc2V0IG9mIGV4dGVuc2lvbnMgaW4gbW9zdCBjYXNlcwo+IAo+IC4uLndoaWNoIGh3
cHJvYmUgaGFzIHN1cHBvcnQgZm9yIHZpYSB0aGUgQ1BVIG1hc2suIG5vPwo+IAo+PiAtIGVhY2gg
bmV3IGV4dGVuc2lvbnMgcmVxdWlyZXMgYW4gdWFwaSBjaGFuZ2UsIHJlcXVpcmluZyBhdCBsZWFz
dAo+PiAgdHdvIHBpZWNlcyBvZiBzb2Z0d2FyZSB0byBiZSBjaGFuZ2VkCj4+IC0gYWRkaW5nIGFu
b3RoZXIgZXh0ZW5zaW9uIHJlcXVpcmVzIGEgcmV2aWV3IHByb2Nlc3MgKG9ubHkga25vd24KPj4g
IGV4dGVuc2lvbnMgY2FuIGJlIGV4cG9zZWQgdG8gdXNlci1zcGFjZSkKPj4gLSB2ZW5kb3IgZXh0
ZW5zaW9ucyBoYXZlIHNwZWNpYWwgbmVlZHMgYW5kIHRoZXJlZm9yZSBwb3NzaWJseQo+PiAgZG9u
4oCZdCBmaXQgd2VsbAo+PiAKPj4gCj4+IExpbWl0ZWQgdG8gTGludXg6Cj4+IC0tLS0tLS0tLS0t
LS0tLS0tCj4+IAo+PiBUaGUgc3lzY2FsbCBhbmQgaXRzIHVhcGkgaXMgTGludXgtc3BlY2lmaWMg
YW5kIG90aGVyIE9TZXMgcHJvYmFibHkKPj4gd2lsbCBub3QgZGVmZXIgdG8gb3VyIHJldmlldyBw
cm9jZXNzIGFuZCByZXF1aXJlbWVudHMganVzdCB0byBnZXQKPj4gbmV3IGJpdHMgaW4uIEluc3Rl
YWQgbW9zdCBsaWtlbHkgdGhleSdsbCBidWlsZCB0aGVpciBvd24gc3lzdGVtcywKPj4gbGVhZGlu
ZyB0byBmcmFnbWVudGF0aW9uLgo+IAo+IFRoZXJlIGFyZSBhIG51bWJlciBvZiBleGFtcGxlcyB3
aGVyZSBtdWx0aXBsZSBPU3MgaGF2ZSBmb2xsb3dlZCB3aGF0Cj4gTGludXggZG9lcywgYW5kIHZp
Y2UgdmVyc2EuIEknZCBzYXkgdGhlIG9wcG9zaXRlIC0tIHRvZGF5IHN5c3RlbQo+IGJ1aWxkZXJz
IGRvIG5vdCBkbyB0aGVpciBvd24gc29sdXRpb24sIGJ1dCByZXZpZXcgd2hhdCdzIG91dCB0aGVy
ZSBhbmQKPiBtaW1pY3MgZXhpc3Rpbmcgb25lcy4KCldoZXJlIHRoZXkgY2FuLiBCdXQgaWYgdGhl
IGludGVyZmFjZSBpcyDigJxtYWtlIGFyY2hpdGVjdHVyZS1kZXBlbmRlbnQKc3lzY2FsbCBY4oCd
IHRoYXTigJlzIG5vdCBnb2luZyB0byBmbHkgb24gb3RoZXIgT1NlcyB3aGVyZSBzeXNjYWxscyBh
cmUgbm90CmFyY2hpdGVjdHVyZS1kZXBlbmRlbnQuIFNpbWlsYXJseSBpZiBpdOKAmXMg4oCcZ28g
cmVhZCBhdXhhcmcgWeKAnSB3aGVyZSBZIGlzCmFyY2hpdGVjdHVyZS1kZXBlbmRlbnQgYW5kIHRo
ZSBPUyBpbiBxdWVzdGlvbiBoYXMKYXJjaGl0ZWN0dXJlLWluZGVwZW5kZW50IGF1eGFyZ3MuIE9y
IHRoZSBzeXN0ZW0gZG9lc27igJl0IGV2ZW4gaGF2ZQphdXhhcmdzLiBOb3csIGF0IHRoZSBlbmQg
b2YgdGhlIGRheSwgSSBjb3VsZG7igJl0IGNhcmUgbGVzcyB3aGF0IExpbnV4CmRvZXMgdG8gY29t
bXVuaWNhdGUgdGhlIGluZm9ybWF0aW9uIHRvIHVzZXJzcGFjZSwgd2hhdCBtYXR0ZXJzIGlzIHdo
YXQKdGhlIHVzZXJzcGFjZSBpbnRlcmZhY2UgaXMgdGhhdCByYW5kb20gSUZVTkNzIGFyZSBnb2lu
ZyB0byBtYWtlIHVzZSBvZi4KU29tZXRoaW5nIHdoaWNoIHNlZW1zIHRvIGJlIHdvZWZ1bGx5IGxh
Y2tpbmcgZnJvbSB0aGlzIGRpc2N1c3Npb24uIElzCnRoZSBpbnRlcmZhY2UgZ29pbmcgdG8ganVz
dCBiZSBzeXNjYWxsKDIpPyBPciBpcyB0aGVyZSBnb2luZyB0byBiZSBzb21lCmhpZ2hlci1sZXZl
bCBpbnRlcmZhY2UgdGhhdCBvdGhlciBPU2VzICpkbyogaGF2ZSBhIGhvcGUgb2YgYmVpbmcgYWJs
ZQp0byBpbXBsZW1lbnQ/Cgo+IFBlcnNvbmFsbHkgSSB0aGluayB0aGlzIGFyZ3VtZW50IGlzIG1v
b3QsIGFuZCB3aWxsIG5vdCBtYXR0ZXIgbXVjaCBmb3IKPiBmcmFnbWVudGF0aW9uLgo+IAo+PiBG
ZWF0dXJlIG9uIGFsbCBjb3JlczoKPj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IAo+PiBBcm5k
IHByZXZpb3VzbHkgKFsxXSkgY29tbWVudGVkIGluIHRoZSBkaXNjdXNzaW9uLCB0aGF0IHRoZXJl
Cj4+IHNob3VsZCBub3QgYmUgYSBuZWVkIGZvciBvcHRpbWl6YXRpb24gdG93YXJkcyBoYXJkd2Fy
ZSB3aXRoIGFuCj4+IGFzeW1tZXRyaWMgc2V0IG9mIGZlYXR1cmVzLiBXZSBiZWxpZXZlIHNvIGFz
IHdlbGwsIGVzcGVjaWFsbHkKPj4gd2hlbiB0YWxraW5nIGFib3V0IGFuIGludGVyZmFjZSB0aGF0
IGhlbHBzIHByb2Nlc3NlcyB0byBpZGVudGlmeQo+PiB0aGUgb3B0aW1pemVkIHJvdXRpbmVzIHRo
ZXkgY2FuIGV4ZWN1dGUuCj4+IAo+PiBPZiBjb3Vyc2Ugc2VlaW5nIGl0IHdpdGggdGhpcyBmaW5h
bGl0eSBtaWdodCBub3QgdGFrZSBpbnRvIGFjY291bnQKPj4gdGhlIHNvbWV3aGF0IHNwZWNpYWwg
bmF0dXJlIG9mIFJJU0MtViwgYnV0IG5ldmVydGhlbGVzcyBpdCBkZXNjcmliZXMKPj4gdGhlIGNv
bW1vbiBjYXNlIGZvciBwcm9ncmFtcyB2ZXJ5IHdlbGwuCj4+IAo+PiBGb3Igc3RhcnRlcnMgdGhl
IHNjaGVkdWxlciBpbiBpdHMgZGVmYXVsdCBiZWhhdmlvdXIsIHdpbGwgdHJ5IHRvIHVzZSBhbnkK
Pj4gYXZhaWxhYmxlIGNvcmUsIHNvIHRoZSBzdGFuZGFyZCBwcm9ncmFtIGJlaGF2aW91ciB3aWxs
IGFsd2F5cyBuZWVkIHRoZQo+PiBpbnRlcnNlY3Rpb24gb2YgYXZhaWxhYmxlIGV4dGVuc2lvbnMg
b3ZlciBhbGwgY29yZXMuCj4+IAo+PiAKPj4gTGltaXRpbmcgcHJvZ3JhbSBleGVjdXRpb24gdG8g
c3BlY2lmaWMgY29yZXMgd2lsbCBsaWtlbHkgYWx3YXlzIGJlIGEKPj4gc3BlY2lhbCB1c2UgY2Fz
ZSBhbmQgYWxyZWFkeSByZXF1aXJlcyBMaW51eC1zcGVjaWZpYyBzeXNjYWxscyB0bwo+PiBzZWxl
Y3QgdGhlIHNldCBvZiBjb3Jlcy4KPj4gCj4+IFNvIHdoaWxlIGl0IGNhbiBjb21lIGluIGhhbmR5
IHRvIGdldCBwZXItY29yZSBpbmZvcm1hdGlvbiBkb3duIHRoZSByb2FkCj4+IHZpYSB0aGUgaHdw
cm9iaW5nIGludGVyZmFjZSwgbW9zdCBwcm9ncmFtcyB3aWxsIGp1c3Qgd2FudCB0byBrbm93IGlm
Cj4+IHRoZXkgY2FuIHVzZSBhIGV4dGVuc2lvbiBvbiBqdXN0IGFueSBjb3JlLgo+PiAKPj4gCj4+
IFJldmlldyBwcm9jZXNzOgo+PiAtLS0tLS0tLS0tLS0tLS0KPj4gCj4+IFRoZXJlIGFyZSBzbyBt
YW55IChtdWx0aS1sZXR0ZXItKWV4dGVuc2lvbnMgYWxyZWFkeSB3aXRoIGV2ZW4gbW9yZSBpbgo+
PiB0aGUgcGlwZWxpbmUuIFRvIGV4cG9zZSBhbGwgb2YgdGhlbSwgZWFjaCB3aWxsIHJlcXVpcmUg
YSByZXZpZXcgcHJvY2Vzcwo+PiBhbmQgdWFwaSBjaGFuZ2UgdGhhdCB3aWxsIG1ha2UgZGVmaW5p
bmcgYWxsIG9mIHRoZW0gc2xvdyBhcyB0aGUKPj4ga2VybmVsIG5lZWRzIHBhdGNoaW5nIGFmdGVy
IHdoaWNoIHVzZXJzcGFjZSBuZWVkcyB0byBzeW5jIGluIHRoZSBuZXcKPj4gYXBpIGhlYWRlci4K
Pj4gCj4+IAo+PiBWZW5kb3ItZXh0ZW5zaW9uczoKPj4gLS0tLS0tLS0tLS0tLS0tLS0tCj4+IAo+
PiBWZW5kb3IgZXh0ZW5zaW9ucyBhcmUgc3BlY2lhbCBpbiB0aGVpciBvd24gcmlnaHQuCj4+IFVz
ZXJzcGFjZSBwcm9iYWJseSB3aWxsIHdhbnQgdG8ga25vdyBhYm91dCB0aGVtLCBidXQgd2UgYXMg
dGhlIGtlcm5lbAo+PiBkb24ndCB3YW50IHRvIGNhcmUgYWJvdXQgdGhlbSB0b28gbXVjaCAoZXhj
ZXB0IGFzIGVycmF0YSksIGFzIHRoZXkncmUKPj4gbm90IHBhcnQgb2YgdGhlIG9mZmljaWFsIFJJ
U0MtViBJU0Egc3BlYy4KPj4gCj4+IEdldHRpbmcgdmVuZG9yIGV4dGVuc2lvbnMgZnJvbSB0aGUg
ZHQgdG8gdXNlcnNwYWNlIHZpYSBod3Byb2JlIHdvdWxkCj4+IHJlcXVpcmUgY29vcmRpbmF0aW9u
IGVmZm9ydHMgYW5kIGFzIHZlbmRvcnMgaGF2ZSB0aGUgdGVuZGVuY3kgdG8gaW52ZW50Cj4+IHRo
aW5ncyBkdXJpbmcgdGhlaXIgZGV2ZWxvcG1lbnQgcHJvY2VzcyBiZWZvcmUgdHJ5aW5nIHRvIHN1
Ym1pdCBjaGFuZ2VzCj4+IHVwc3RyZWFtIHRoaXMgbGlrZWx5IHdvdWxkIHJlc3VsdCBpbiBjb25m
bGljdHMgd2l0aCBhc3NpZ25lZCBpZHMgZG93bgo+PiB0aGUgcm9hZC4gV2hpY2ggaW4gdHVybiB0
aGVuIG1heSBjcmVhdGUgY29tcGF0aWJpbGl0eS1pc3N1ZXMgd2l0aAo+PiB1c2Vyc3BhY2UgYnVp
bGRzIGJ1aWx0IG9uIHRvcCBvZiB0aGUgbWFpbmxpbmUga2VybmVsIG9yIGEgcHJlLQo+PiBleGlz
dGluZyB2ZW5kb3Iga2VybmVsLgo+PiAKPj4gVGhlIHNwZWNpYWwgY2FzZSBhbHNvIGlzIHRoYXQg
dmVuZG9yIEEgY291bGQgaW4gdGhlb3J5IGltcGxlbWVudCBhbgo+PiBleHRlbnNpb24gZnJvbSB2
ZW5kb3IgQi4gU28gdGhpcyB3b3VsZCByZXF1aXJlIHRvIGFjdHVhbGx5IGFzc2lnbgo+PiBzZXBh
cmF0ZSBod3Byb2JlIGtleXMgdG8gdmVuZG9ycyAoa2V5IGZvciB4dGhlYWQgZXh0ZW5zaW9ucywg
a2V5IGZvcgo+PiB4dmVudGFuYSBleHRlbnNpb25zLCBldGMpLiBUaGlzIGluIHR1cm4gd291bGQg
cmVxdWlyZSB2ZW5kb3JzIHRvCj4+IGNvbWUgdG8gdGhlIG1haW5saW5lIGtlcm5lbCB0byBnZXQg
YXNzaWduZWQgYSBrZXkgKHdoaWNoIGluIHJlYWxpdHkKPj4gcHJvYmFibHkgd29uJ3QgaGFwcGVu
KSwgd2hpY2ggd291bGQgdGhlbiBtYWtlIHRoZSBrZXJuZWwgY29tbXVuaXR5Cj4+IHNvcnQgb2Yg
YW4gaWQgYXV0aG9yaXR5Lgo+PiAKPj4gCj4+IAo+PiAKPj4gVG8gYWRkcmVzcyB0aGVzZSwgdGhl
IGF0dGFjaGVkIHBhdGNoIHNlcmllcyBhZGRzIGEgc2Vjb25kIGludGVyZmFjZQo+PiBmb3IgdGhl
IGNvbW1vbiBjYXNlIGFuZCAianVzdCIgZXhwb3NlcyB0aGUgaXNhLXN0cmluZyB2aWEgdGhlCj4+
IEFUX0JBU0VfUExBVEZPUk0gYXV4IHZlY3Rvci4KPiAKPiAqQSBzZWNvbmQgaW50ZXJmYWNlKiBp
bnRyb2R1Y2VkIHRoZSBzZWNvbmQgaHdwcm9iZSBsYW5kZWQuIFJlYWxseT8KPiBTdGFydCBhIGRp
c2N1c3Npb24gb24gaG93IHRvIGV4dGVuZCBod3Byb2JlIGluc3RlYWQuCgpJ4oCZdmUgYmVlbiB0
cnlpbmcgdG8gcHVzaCBmb3Igc29tZXRoaW5nIG90aGVyIHRoYW4gdGhpcyBmb3IgbW9udGhzLCBi
dXQKUlZJIHRvb2sgbm8gaW50ZXJlc3QgaW4gZGVhbGluZyB3aXRoIGl0IHVudGlsIGl0IGdvdCBj
bG9zZXIgdG8gdGhlc2UKbGFuZGluZywgYXQgd2hpY2ggcG9pbnQgZmluYWxseSBzb21lIGFjdGlv
biB3YXMgdGFrZW4uIEJ1dCBldmVuIHRoZW4sCmhlZWxzIHdlcmUgZHJhZ2dlZCwgYW5kIGl0IHRv
b2sgaHdwcm9iZSBiZWluZyBsYW5kZWQgdG8gZm9yY2UgdGhlbSB0bwpmaW5hbGx5IHB1Ymxpc2gg
dGhpbmdzLiBCdXQgb2YgY291cnNlIHRvbyBsYXRlLCBzbyBub3cgdGhlIGVjb3N5c3RlbSBpcwpm
b3JldmVyIHNjcmV3ZWQgdGhhbmtzIHRvIHRoZWlyIGluYWN0aW9uLgoKQWxsIEkgd2FudGVkIHdh
cyBzb21lIHNpbXBsZSBleHRlbnNpb24gc3RyaW5nIC0+IHZlcnNpb24gbnVtYmVyIGZ1bmN0aW9u
CmFzIGEgc3RhbmRhcmRpc2VkIHVzZXJzcGFjZSBpbnRlcmZhY2UuLi4gYmVjYXVzZSBhdCB0aGUg
ZW5kIG9mIHRoZSBkYXkKcGVvcGxlIGp1c3Qgd2FudCB0byBrbm93IOKAnGNhbiBJIHVzZSBleHRl
bnNpb24gWT/igJ0sIHBvc3NpYmx5IHdpdGggYQptaW5pbXVtIHZlcnNpb24uIEJ1dCBtYXliZSB0
aGVyZeKAmXMgc29tZSBob3BlIHRoYXQgTGludXggbGliY3Mgd2lsbAp0cmFuc2xhdGUgc3VjaCBx
dWVyaWVzIGludG8gcG9raW5nIGF0IHRoaXMgaHdwcm9iZSB0aGluZy4gVGhvdWdoIGdvZAprbm93
cyB3aGF0IHRoZXnigJlyZSBnb2luZyB0byBkbyBhYm91dCB2ZW5kb3IgZXh0ZW5zaW9ucywgZXNw
ZWNpYWxseSBpZgp0aG9zZSB2ZW5kb3IgZXh0ZW5zaW9ucyBvbmx5IGdldCBzdXBwb3J0ZWQgaW4g
dmVuZG9yIGZvcmtzIG9mIHRoZQprZXJuZWwgKHdob+KAmXMgYWxsb2NhdGluZyB0aGVpciBlbmNv
ZGluZ3M/IFh2ZW5kb3Jmb28gZXhpc3RzIHRvCm5hbWVzcGFjZSB0aGVtIGFuZCBnaXZlIHZlbmRv
cnMgY29udHJvbC4uLikuCgpKZXNzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
