Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F3BC47422
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 09:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QmqiWWAh36VhzDLVxYYUQKwqgY4VAdeaXu7QfG8KDzc=; b=VVC55WVkch+l62
	LkULEKMD/MGGtt35/68v91elRruouIbNZM3UyuDsRVI7r0cBh5W7J2rWj5+yAg58cMKroG8EkrF/R
	nM3EqEBrycc4dv0q0qnnsRxZEIWz662gWUNi+J5l1WdCjtGXD3hY4d6siCMi6C7QBjHeh34WnOZUr
	CZxoa1M7E+EOvzPAMaNFJfouO6gNe8pmYPsRmrnEsrHl1ff1tYT6ooW4JRnshJBwnRjT0p24GUtDO
	2DxDXV6dNqAIwJ2E1BdHf9BRETIiCyVrUBrMEliGrLwq5B9j4J6cNb68gRIFY8VlH56eLutPA2D8N
	6/Z3tbKzhgX2trJKulvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ2L4-00F78M-2X;
	Wed, 17 Jan 2024 09:36:02 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ2L0-00F75N-3C
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 09:36:01 +0000
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3bd72353d9fso2929244b6e.3
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jan 2024 01:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705484094; x=1706088894; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaqWkweUBCMsM9np/mXYoztcvXQRXft4e1IEJ/ozrjU=;
        b=Ydb74a0CNr3RI5vDSNv7hwUqooZg33lgySi60A1lLjGRf+nXDZI2+CKzhGSUJqSs5+
         Kc5rXh76Dj2sM9asYz2qz5Jg9o9i323R9r4c6FhFcVae1RSc4n69MMdZJ7kSjHN7Nxm3
         Oqiq0AeVUr+Cq/sZBicF30/HlG+IsjAP1p1pAWJXZy2w9BZ7EO6axsJRf4vHC/o5iP7H
         smljwrOTRA6Fx9mvycEL3oGrxO0FkvomRTonktMm4q24PpYjo69r71fAgNLu/qhG3GW7
         z+zmT5GR02Bt2+uzfmWMjmRboHAnZgQ/43t2pkxILXg39+eo4QJtsk2F6eNuhlVwcnQi
         ZVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705484094; x=1706088894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaqWkweUBCMsM9np/mXYoztcvXQRXft4e1IEJ/ozrjU=;
        b=gFQVVnl4VOO53yUOeKObXEvhFE8zhMt74yPrMwVfh+UK0K5czkT2Ba2ufjvYQUfKsS
         I/uFUsG6ErDnSlTGsQF/YuEU8lNaDkbOvWOm92BrbHmIPkIg4oyPDMbaN/Wgr3wIzI6E
         ht5/IjefC+dNpOClAL9W/F1DEKmalujf5IPbyyfUUf26DihtAaepPW8Vi7stH5SubVdf
         xrWhL2So5D0ezqxO1yMd7UwnBc3LHoSrNIOCANQfSCcvuvdNjGqedEo++92vJabS/iZD
         MHGZXV5AWw57BMD7Cg/vJ0SSRiVAXIBFTAgOeGcGhjTEfnkasNwOUEfY80t8yuAU/6cc
         En0A==
X-Gm-Message-State: AOJu0YxtXtjD4Q4T3+la9BGGMXsKAB+3J2X7ewVzPUxUKPxbNKYmTvWx
	9rIjxCg4SYpd3X65TUGCRwdr8EVwnL0Enf2PUEJQKu5JxzfpVQ==
X-Google-Smtp-Source: AGHT+IGm/Gep62eql5SAVLRRUU3yliphqjo5z9Qaiuxv+5wKqX7+/u8z+fEIs7Mgr/WikI4re0xS1rdrLaLknoVLY5o=
X-Received: by 2002:a05:6870:148a:b0:206:9e36:cfed with SMTP id
 k10-20020a056870148a00b002069e36cfedmr12283657oab.62.1705484094068; Wed, 17
 Jan 2024 01:34:54 -0800 (PST)
MIME-Version: 1.0
References: <20240117082514.42967-1-cuiyunhui@bytedance.com> <20240117-274e425c51d0deaeca80857d@orel>
In-Reply-To: <20240117-274e425c51d0deaeca80857d@orel>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 17 Jan 2024 17:34:43 +0800
Message-ID: <CAEEQ3wmDyj9S6412b3FCVF6Wu+TRRZco11X5mdEiQ5E2s54sHQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: selftests: fix cbo.c compilation error
To: Andrew Jones <ajones@ventanamicro.com>
Cc: shuah@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, xiao.w.wang@intel.com, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	xuzhipeng.1973@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_013559_060422_28628B7D 
X-CRM114-Status: GOOD (  21.13  )
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

SGkgZHJld++8jAoKT24gV2VkLCBKYW4gMTcsIDIwMjQgYXQgNToxNuKAr1BNIEFuZHJldyBKb25l
cyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKYW4gMTcsIDIw
MjQgYXQgMDQ6MjU6MTRQTSArMDgwMCwgWXVuaHVpIEN1aSB3cm90ZToKPiA+IFdoZW4gY29tcGls
aW5nIHdpdGggLU8wLCB0aGUgZm9sbG93aW5nIGVycm9yIHdpbGwgb2NjdXI6Cj4gPiBjYm8uYzog
SW4gZnVuY3Rpb24gJ2Nib19pbnNuJzoKPiA+IGNiby5jOjQzOjk6IHdhcm5pbmc6ICdhc20nIG9w
ZXJhbmQgMSBwcm9iYWJseSBkb2VzIG5vdCBtYXRjaCBjb25zdHJhaW50cwo+ID4gICAgNDMgfCAg
ICAgICAgIGFzbSB2b2xhdGlsZSgKPiA+ICAgICAgIHwgICAgICAgICBefn4KPiA+IGNiby5jOjQz
Ojk6IHdhcm5pbmc6ICdhc20nIG9wZXJhbmQgMiBwcm9iYWJseSBkb2VzIG5vdCBtYXRjaCBjb25z
dHJhaW50cwo+ID4gY2JvLmM6NDM6OTogZXJyb3I6IGltcG9zc2libGUgY29uc3RyYWludCBpbiAn
YXNtJwo+ID4KPiA+IEFkZCBfX2F0dHJpYnV0ZV9fKChvcHRpbWl6ZSgiTyIpKSkgdG8gZml4Lgo+
ID4KPiA+IEZpeGVzOiBhMjllMmE0OGFmZTMgKCJSSVNDLVY6IHNlbGZ0ZXN0czogQWRkIENCTyB0
ZXN0cyIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNl
LmNvbT4KPiA+IFN1Z2dlc3RlZC1ieTogWmhpcGVuZyBYdSA8eHV6aGlwZW5nLjE5NzNAYnl0ZWRh
bmNlLmNvbT4KPiA+IC0tLQo+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2h3cHJv
YmUvY2JvLmMgfCAxMSArKysrKystLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL3Jpc2N2L2h3cHJvYmUvY2JvLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9y
aXNjdi9od3Byb2JlL2Niby5jCj4gPiBpbmRleCA1MGEyY2M4YWVmMzguLmZmMWQ4ZTg0M2Q3MCAx
MDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2h3cHJvYmUvY2Jv
LmMKPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2h3cHJvYmUvY2JvLmMK
PiA+IEBAIC0zNiw3ICszNiw3IEBAIHN0YXRpYyB2b2lkIHNpZ2lsbF9oYW5kbGVyKGludCBzaWcs
IHNpZ2luZm9fdCAqaW5mbywgdm9pZCAqY29udGV4dCkKPiA+ICAgICAgIHJlZ3NbMF0gKz0gNDsK
PiA+ICB9Cj4gPgo+ID4gLXN0YXRpYyB2b2lkIGNib19pbnNuKGNoYXIgKmJhc2UsIGludCBmbikK
PiA+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgY2JvX2luc24oY2hhciAqYmFzZSwgaW50
IGZuKQo+ID4gIHsKPiA+ICAgICAgIHVpbnQzMl90IGluc24gPSBNS19DQk8oZm4pOwo+ID4KPiA+
IEBAIC00NywxMCArNDcsMTEgQEAgc3RhdGljIHZvaWQgY2JvX2luc24oY2hhciAqYmFzZSwgaW50
IGZuKQo+ID4gICAgICAgOiA6ICJyIiAoYmFzZSksICJpIiAoZm4pLCAiaSIgKGluc24pIDogImEw
IiwgImExIiwgIm1lbW9yeSIpOwo+ID4gIH0KPiA+Cj4gPiAtc3RhdGljIHZvaWQgY2JvX2ludmFs
KGNoYXIgKmJhc2UpIHsgY2JvX2luc24oYmFzZSwgMCk7IH0KPiA+IC1zdGF0aWMgdm9pZCBjYm9f
Y2xlYW4oY2hhciAqYmFzZSkgeyBjYm9faW5zbihiYXNlLCAxKTsgfQo+ID4gLXN0YXRpYyB2b2lk
IGNib19mbHVzaChjaGFyICpiYXNlKSB7IGNib19pbnNuKGJhc2UsIDIpOyB9Cj4gPiAtc3RhdGlj
IHZvaWQgY2JvX3plcm8oY2hhciAqYmFzZSkgIHsgY2JvX2luc24oYmFzZSwgNCk7IH0KPiA+ICsj
ZGVmaW5lIE9QVElNSVpFIF9fYXR0cmlidXRlX18oKG9wdGltaXplKCJPIikpKQo+ID4gK09QVElN
SVpFIHN0YXRpYyB2b2lkIGNib19pbnZhbChjaGFyICpiYXNlKSB7IGNib19pbnNuKGJhc2UsIDAp
OyB9Cj4gPiArT1BUSU1JWkUgc3RhdGljIHZvaWQgY2JvX2NsZWFuKGNoYXIgKmJhc2UpIHsgY2Jv
X2luc24oYmFzZSwgMSk7IH0KPiA+ICtPUFRJTUlaRSBzdGF0aWMgdm9pZCBjYm9fZmx1c2goY2hh
ciAqYmFzZSkgeyBjYm9faW5zbihiYXNlLCAyKTsgfQo+ID4gK09QVElNSVpFIHN0YXRpYyB2b2lk
IGNib196ZXJvKGNoYXIgKmJhc2UpICB7IGNib19pbnNuKGJhc2UsIDQpOyB9Cj4gPgo+ID4gIHN0
YXRpYyB2b2lkIHRlc3Rfbm9femljYm9tKHZvaWQgKmFyZykKPiA+ICB7Cj4gPiAtLQo+ID4gMi4y
MC4xCj4gPgo+Cj4gSGkgWXVuaHVpLAo+Cj4gVGhhbmtzIGZvciB0aGUgYnVnIHJlcG9ydCwgYnV0
IHRoaXMgaXNuJ3QgdGhlIHJpZ2h0IGZpeC4gVGhlIHJlYWwgcHJvYmxlbQo+IGlzIHRoYXQgSSBk
aWRuJ3QgZW5zdXJlIG9wZXJhbmRzIDEgYW5kIDIgbWF0Y2ggdGhlaXIgY29uc3RyYWludHMsIGp1
c3QgYXMKPiB0aGUgd2FybmluZyB5b3UgZGlzY292ZXJlZCBzYXlzLiBUbyBkbyB0aGF0LCBJIHNo
b3VsZCBoYXZlIG1hZGUgY2JvX2luc24oKQo+IGEgbWFjcm8gYW5kIG5vdCB1c2VkIHRoZSBsb2Nh
bCB2YXJpYWJsZSwgaS5lLiBlbnN1cmUgJ2ZuJyBhbmQgJ2luc24nIGFyZQo+IGluZGVlZCBjb25z
dGFudHMgZGVyaXZlZCBmcm9tIHRoZSAwLDEsMiw0IGNvbnN0YW50cy4KPgo+IEknbGwgc2VuZCBh
IHBhdGNoIHdpdGggeW91ciByZXBvcnRlZC1ieS4KT2theSwgaWYgeW91IHdhbnQgdG8gdXNlIG1h
Y3JvcyB0byBmaXggaXQsIHlvdSBjYW4uIHRoYW5rc++8gQoKVGhhbmtz77yMCll1bmh1aQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
