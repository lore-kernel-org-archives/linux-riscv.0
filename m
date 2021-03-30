Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6325C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 04:17:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D7E261928
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 04:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D7E261928
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=QTpPlPBpXaV9E4tyc49S+ivRe1D0YkCtXDvfBvWRqNE=; b=UsXObW7zOB92EVmSn8igLzD41
	sB8ap0Q28ZEUwTyKIPs8rjYu5gAIETM3YHVT2MTGYJCuxr0FnkTc/hOoblqKDOaUpIzcxFIGiHaxm
	hkJzRIk0PLOerlHEY3ZmaFI/bWtPpH3n5TL5D7GF1EWSMClOnRwzmLxmuc6Yeb1EY8DKVHi68Tck4
	FplKTsuqDXZc4gWCCbF7AJzc5iZnZFZbfehZZaYa775bX27E8LKrLnALyJyZsLzC600OM39xhEm4n
	AY4bR/1oVW0tHF+qmXMhyZq9PALEFbhA/GStCbcFTRyZa3mhNkDE9B2YM0zO9ZHonwYl3hYQXQuSS
	bEYJ86+eg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR5oa-002fHm-77; Tue, 30 Mar 2021 04:17:16 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR5oV-002fGq-3d
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 04:17:14 +0000
Received: by mail-pl1-x629.google.com with SMTP id t20so5473473plr.13
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 21:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Xzt2D7D/8qz9mqZc73J/MiaNdoFuDDHzLfWD7WrwK28=;
 b=Zh7TWBOdRmF/EDwfsamsz513qbOcE5p9e88aXakOnV4FGH5MrWa+RvNe5O7aXrr++8
 QjNv0CQyjr0DlyPFwE8mcWLuFQtR0C5dIhw8Kve1PTgWWteh35odSG83C2/qwNUsmlZD
 jGuDT6Pv2FvR7P2tCUc+u1cy2+nJ6nMMdWajSu16UtVF7puSH9SXhCYuqCSJQ8bsL6F6
 vvV+u0gg+YmI5yplq9xKSQu9RxjeDGEhlgy9sQDIQ4N9SM/HZjniztNQ3SJKheMF4EyU
 uvD3axZ7V8E9Yy9wJHbJqv3d+yo6fQSd1gcJkM373xhG0kmVZFm5TVcewSVe/auSMbDZ
 h7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Xzt2D7D/8qz9mqZc73J/MiaNdoFuDDHzLfWD7WrwK28=;
 b=DysIrCMax4EMYr7LTZa3a2qBhQWeJQKIIdHhqikWMUrbMpIYCvKcBd52f7litOGZzR
 vBNJ4tThXGj2W+NpIVvVkJqxd+j+yN8IzUvihZ0QRJzPJB04MGYNgclMzZXFA7M9ETHz
 INNPMdkmxYqGahKy26tKMRBdEYs9Aw9uKmw4vDUB596x6pETwN3vls4T/SXyhrcXzTaK
 7Lo94QHy98DEYDaaPVQTwwrH99YE/rXdH0PdJ8l1wpbnh4PAdxfmrIFheA+n/OHOSsk2
 NRXcOFOXom3q0BnwB2Gi+4K5X+OkVwqM7FTsLWnRt7cb3brW7UXm+Z4A1hlW2oscq7tE
 osMw==
X-Gm-Message-State: AOAM532fK1lreJrw5+79vyzCkLhGRzmLtPZ/UL8z/+5qT3t1Dx9dx2AU
 0QMrv4NIBYgj9ZTaIqGD9zf0Mg==
X-Google-Smtp-Source: ABdhPJypvRQPu93Uxmqk90Jsqq7AsyUo3Ja6eWm7OV8vxclphJJc65shzNBXomosibxYw+Mv3AOweQ==
X-Received: by 2002:a17:90b:3d1:: with SMTP id
 go17mr2410818pjb.70.1617077829569; 
 Mon, 29 Mar 2021 21:17:09 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 11sm19252590pfn.146.2021.03.29.21.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 21:17:09 -0700 (PDT)
Date: Mon, 29 Mar 2021 21:17:09 -0700 (PDT)
X-Google-Original-Date: Mon, 29 Mar 2021 21:16:33 PDT (-0700)
Subject: Re: [PATCH v4 0/5] Add support for the PolarFire SoC system controller
In-Reply-To: <20210311113431.15378-1-conor.dooley@microchip.com>
CC: robh+dt@kernel.org, Damien Le Moal <Damien.LeMoal@wdc.com>,
 jassisinghbrar@gmail.com, aou@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 j.neuschaefer@gmx.net, 
 lewis.hanly@microchip.com, cyril.jean@microchip.com,
 daire.mcnamara@microchip.com, 
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 david.abdurachmanov@gmail.com, conor.dooley@microchip.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: conor.dooley@microchip.com
Message-ID: <mhng-1b7b4cb7-2f9a-4bdb-b00c-14ec1d7008b0@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_051712_448343_97770907 
X-CRM114-Status: GOOD (  28.43  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAxMSBNYXIgMjAyMSAwMzozNDozMSBQU1QgKC0wODAwKSwgY29ub3IuZG9vbGV5QG1p
Y3JvY2hpcC5jb20gd3JvdGU6Cj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbT4KPgo+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIHN5
c3RlbSBjb250cm9sbGVyIG9uCj4gdGhlIFBvbGFyRmlyZSBTb0MsIHVzaW5nIHRoZSBtYWlsYm94
IGZyYW1ld29yay4gQSBNaWNyb2NoaXAgZGlyZWN0b3J5Cj4gaW4gdGhlIFNvQyBzdWJzeXN0ZW0g
aGFzIGJlZW4gY3JlYXRlZCB0byBob2xkIHRoZSBtYWlsYm94IGNsaWVudAo+IGRyaXZlciBhbmQg
d2lsbCBiZSB1c2VkIGZvciBmdXR1cmUgc2VydmljZSBkcml2ZXJzLgo+Cj4gVGhlc2UgZHJpdmVy
cyBhcmUgZ2F0ZWQgYnkgdGhlIGtjb25maWcgb3B0aW9uOgo+IENPTkZJR19TT0NfTUlDUk9DSElQ
X1BPTEFSRklSRSwgc28gdGhpcyBwYXRjaCBzZXJpZXMgZGVwZW5kcyBvbiBBdGlzaAo+IFBhdHJh
J3MgUG9sYXJGaXJlIFNvQyBzdXBwb3J0IHBhdGNoZXMgd2hpY2ggaW50cm9kdWNlIGl0Lgo+Cj4g
SXQgZnVydGhlciBkZXBlbmRzIG9uIHRoZSBNQUlOVEFJTkVSUyBlbnRyeSBjcmVhdGVkIGluIHRo
ZSBzYW1lIHNlcmllcy4KPgo+IENoYW5nZXMgZnJvbSB2MzoKPiAqIEZpeGVkIG1ib3hlcyByZWZl
cmVuY2UgaW4gZHQgYmluZGluZyBmb3IgbWFpbGJveCBjbGllbnQKPiAqIEJ1ZyBmaXhlcyBhbmQg
Y2xlYW51cCBmcm9tIEpvbmF0aGFuIE5ldXNjaMOkZmVyJ3MgZmVlZGJhY2sgb24KPiAgIG1haWxi
b3gtbXBmcy5jICYgbXBmcy1zeXMtY29udHJvbGxlci5jCj4gKiBSZW5hbWVkIGR0IGJpbmRpbmcg
ZmlsZXMgdG8gbWF0Y2ggY29tcGF0aWJsZSBzdHJpbmdzCj4gKiBSZW1vdmVkIFBGU29DIGdhdGlu
ZyBjb25kaXRpb24gb24gZHJpdmVycy9zb2MvbWljcm9jaGlwIHN1YmRpcmVjdG9yeQo+ICogQ29u
dmVydGVkIGFsbCBzaXplIGJhc2VkIG9wZXJhdGlvbnMgdG8gYnl0ZXMgZm9yIGNvbnNpc3RlbmN5
Cj4gKiBDb252ZXJ0ZWQgcmVzcG9uc2UgYXJyYXkgdG8gYSBzdHJ1Y3R1cmUsIGVuYWJsaW5nIHN1
cHBvcnQgZm9yIG1vcmUKPiAgIGNvbXBsZXggc2VydmljZXMgdGhhdCByZXR1cm4gYSBzdGF0dXMg
aW5zdGVhZCBvZi9hbG9uZ3NpZGUgYSBwYXlsb2FkLgo+Cj4gQ2hhbmdlcyBmcm9tIHYyOgo+ICog
RnVydGhlciByZXdvcmtlZCBkdCBiaW5kaW5ncyB0byBzYXRpc2Z5IGVycm9ycyBhbmQgZmVlZGJh
Y2sKPiAgIChob3BlZnVsbHkgcGhhbmRsZSBhcnJheSBpcyB0aGUgY29ycmVjdCB0eXBlIGZvciB0
aGUgbWJveGVzKQo+ICogRnVsbCBtYWludGFpbmVycyBlbnRyeSBtb3ZlZCB0byBBdGlzaCdzIFBG
U29DIHN1cHBvcnQgc2VyaWVzLCB0aGlzIHNlcmllcyBub3cgb25seSBhZGRzIG1haWxib3ggZHJp
dmVyCj4gKiBDb252ZXJ0ZWQgY29uZmlnIG9wdGlvbnMgZnJvbSBNUEZTIHRvIFBPTEFSRklSRV9T
T0Mgc28gdGhleSBhcmUgbW9yZSByZWNvZ25pc2FibGUKPiAqIEZ1cnRoZXIgc2ltcGxpZmllZCBk
cml2ZXIgY29kZSBmcm9tIGZlZWRiYWNrCj4KPiBDaGFuZ2VzIGZyb20gdjE6Cj4gKiBTcXVhc2hl
ZCBoZWFkZXIgaW50byBmaXJzdCBwYXRjaAo+ICogRml4ZWQgRFQgYmluZGluZyB3YXJuaW5ncyAm
IHNtYWxsIGZpeGVzCj4gKiBDbGVhbmVkIHVwIGRyaXZlcnMgZnJvbSBmZWVkYmFjawo+Cj4gQ29u
b3IgRG9vbGV5ICg1KToKPiAgIG1ib3g6IGFkZCBwb2xhcmZpcmUgc29jIHN5c3RlbSBjb250cm9s
bGVyIG1haWxib3gKPiAgIGR0LWJpbmRpbmdzOiBhZGQgYmluZGluZ3MgZm9yIHBvbGFyZmlyZSBz
b2MgbWFpbGJveAo+ICAgc29jOiBhZGQgcG9sYXJmaXJlIHNvYyBzeXN0ZW0gY29udHJvbGxlcgo+
ICAgZHQtYmluZGluZ3M6IGFkZCBiaW5kaW5ncyBmb3IgcG9sYXJmaXJlIHNvYyBzeXN0ZW0gY29u
dHJvbGxlcgo+ICAgTUFJTlRBSU5FUlM6IGFkZCBlbnRyeSBmb3IgcG9sYXJmaXJlIHNvYyBtYWls
Ym94IGRyaXZlcgo+Cj4gIC4uLi9taWNyb2NoaXAscG9sYXJmaXJlLXNvYy1tYWlsYm94LnlhbWwg
ICAgICB8ICA0NyArKysKPiAgLi4uaWNyb2NoaXAscG9sYXJmaXJlLXNvYy1zeXMtY29udHJvbGxl
ci55YW1sIHwgIDM2ICsrKwo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDEgKwo+ICBkcml2ZXJzL21haWxib3gvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMTIgKwo+ICBkcml2ZXJzL21haWxib3gvTWFrZWZpbGUgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDIgKwo+ICBkcml2ZXJzL21haWxib3gvbWFpbGJveC1tcGZzLmMgICAgICAg
ICAgICAgICAgfCAyNzcgKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvc29jL0tjb25maWcg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvc29jL01ha2VmaWxl
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvc29jL21pY3JvY2hp
cC9LY29uZmlnICAgICAgICAgICAgICAgICB8ICAxMCArCj4gIGRyaXZlcnMvc29jL21pY3JvY2hp
cC9NYWtlZmlsZSAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvc29jL21pY3JvY2hp
cC9tcGZzLXN5cy1jb250cm9sbGVyLmMgICB8IDEyNyArKysrKysrKwo+ICBpbmNsdWRlL3NvYy9t
aWNyb2NoaXAvbXBmcy5oICAgICAgICAgICAgICAgICAgfCAgNTcgKysrKwo+ICAxMiBmaWxlcyBj
aGFuZ2VkLCA1NzIgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gvbWljcm9jaGlwLHBvbGFyZmlyZS1zb2Mt
bWFpbGJveC55YW1sCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc29jL21pY3JvY2hpcC9taWNyb2NoaXAscG9sYXJmaXJlLXNvYy1zeXMtY29u
dHJvbGxlci55YW1sCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21haWxib3gvbWFpbGJv
eC1tcGZzLmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc29jL21pY3JvY2hpcC9LY29u
ZmlnCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NvYy9taWNyb2NoaXAvTWFrZWZpbGUK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc29jL21pY3JvY2hpcC9tcGZzLXN5cy1jb250
cm9sbGVyLmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvc29jL21pY3JvY2hpcC9tcGZz
LmgKClRoZSBvbmx5IHByb2JsZW0gSSBzZWUgaGVyZSBpcyB0aGF0IHBhdGNoICMzICh0aGUgZHJp
dmVyIGZvciB0aGUgc3lzdGVtCmNvbnRyb2xsZXIpIGNvbWVzIGJlZm9yZSBwYXRjaCAjNCAodGhl
IERUIGJpbmRpbmdzIGZvciB0aGF0IGRyaXZlcikuICBUaGF0CnRyaWdnZXJzIGEgY2hlY2twYXRj
aCB3YXJuaW5nLiAgSSBjYW4ganVzdCByZW9yZGVyIGl0LCBidXQgaXQgd291bGQgYmUgZ3JlYXQg
dG8KaGF2ZSBzb21lIHJldmlld3MgZnJvbSB0aGUgRFQgYW5kIG1haWxib3ggcGVvcGxlLiAgSWYg
bm90IEknbGwgdHJ5IGFuZCBmaW5kCnNvbWUgdGltZSB0byB0YWtlIGEgY2xvc2VyIGxvb2suCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
