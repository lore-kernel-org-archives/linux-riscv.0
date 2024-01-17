Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C186C47422
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 06:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3DPMPbD1UQq7SK94ssm3ANdHCzW+3RDK6bFn0GcgoA=; b=cBAgGc4jwmnpoh
	tlPGr7SEI0XQARb3rxt5+SFzq6CIHUtnoNcGwkcvKWZr0Pt8Dkqcp0aTmTYGHNRoS07Q5msVqFyMs
	/3k2wm5FfGWWYWIp4410ongOziTi1vI7lCsRUNdOHwd/dNBrpX2ewFyXy34JYjFw5C1ybXkUqajeV
	CHwG1DG2UjwhdAdu/cuyD9Q9r225yx1LgIc6iJ6gieYLHAc65oQyyrOsCx2cFo84EP7Ul3GH+R0zC
	Vx7ySWoSwWwS5uz2HnnqRsxg9zKVF15V09FQfRxW0HkFhxm0w59A2CC/YuyZnO/41MXXD68XZOPDA
	JQoAGl98ompLPs9Q6oBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPzXt-00EbHh-1f;
	Wed, 17 Jan 2024 06:37:05 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPzXq-00EbFN-2P
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 06:37:04 +0000
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-7cdb67ec4caso3159292241.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jan 2024 22:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705473414; x=1706078214; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CV6mXNKzQvp6KjBTCvDtZ8RlBQrfQ5aBoSo9iDcIFbE=;
        b=bBxpzAc2lZbMBKRhZ1krCfMNiz/Q/muxHAaRbdflwFZ2vBReCk81WqQIfUbSZo31Qu
         Mz8IHLrePfyt2ItcYswGHk/yS3ddWNbzVS0UjJXeeY9jtDWCA3sMTC3zHLY4pLvUuafu
         e1gOpEH7+kX1/HQVmUzUUAMnoyqk5D5lrC4fn6qzVPy0dB2LqVA0TZaOQTjVqOW/fnyo
         Si2YIFGuHwWXIUOmQ4LmsRwK9/R4JTCCtZ1XchAfnJ576Z0sfc+5zx49bQUcKHJP8D6s
         v7tLOMx3wPKiVA2nlPLC9nGDU6vTKQh59tmDJ12RLG1wNUGLilPZ0YzyyihTOeTqaep4
         pnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705473414; x=1706078214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CV6mXNKzQvp6KjBTCvDtZ8RlBQrfQ5aBoSo9iDcIFbE=;
        b=nbhBVJ7oaMSKeUlCxgZG5b8rq79Qi0TC0t8nnWo6Z0wa3VI9sxWwatBB08kblPav0B
         8T59IX5brWW3+Dk4i/BJTDLwnXLHhmI4kBS23f2LK7wxz9hEYz7d+Ooy3zDLuPFa0Rvk
         yIGbJYc6oKZ9nwJE1KBYO+S5DypEdNLbc1d4QGsNoHN1Y7lOE7+ZHJmcvuKCd0iA0A/H
         YlNKthlu7o7mfASUP6Iu2MyRecZo2tZ08im/jX2hV7sCyJivWReFUvS5GHxcSP8lSIYK
         9xIN045a+vCDcTIcdGD6vfKPHUS8W37OnpzRsXbVIryOU23pAvW5zIeUeOQNxjaoFB+0
         +lLA==
X-Gm-Message-State: AOJu0YxmU9qBEZsztDxp9DJkf9fX0rC7NDkbD3B4f72y4QVe/KBvh9bp
	ri/ldbETv0hvu3eggO/dpGGyfSWb+jXJy/Adbz6ibQYoQRW0dtRjw1qnLFiD8Bc=
X-Google-Smtp-Source: AGHT+IHajm/4tjLIoZWOSTwbinxRBMn84ItTEKzyOEGSHntMQ8Lxz+5adlkbkqRWkHfg/RXVRrTgtSy9ON5ydIMncZc=
X-Received: by 2002:a05:6122:2806:b0:4b6:be99:4acb with SMTP id
 en6-20020a056122280600b004b6be994acbmr4497764vkb.16.1705473414259; Tue, 16
 Jan 2024 22:36:54 -0800 (PST)
MIME-Version: 1.0
References: <20231220024343.1547648-1-vincent.chen@sifive.com> <08dbe459-5174-44bc-b61d-a8acef96c763@ghiti.fr>
In-Reply-To: <08dbe459-5174-44bc-b61d-a8acef96c763@ghiti.fr>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Wed, 17 Jan 2024 14:36:43 +0800
Message-ID: <CABvJ_xif_tN9_b97GprrVO9P2uHzJ+O9wjVBDbbtwkWN-CUaMQ@mail.gmail.com>
Subject: Re: [PATCH v5] riscv: mm: execute local TLB flush after populating vmemmap
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, ajones@ventanamicro.com, 
	alexghiti@rivosinc.com, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_223702_826250_FA40AFAD 
X-CRM114-Status: GOOD (  25.15  )
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

T24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgNToxOeKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBn
aGl0aS5mcj4gd3JvdGU6Cj4KPiBIaSBWaW5jZW50LAo+Cj4gT24gMjAvMTIvMjAyMyAwMzo0Mywg
VmluY2VudCBDaGVuIHdyb3RlOgo+ID4gVGhlIHNwYXJlX2luaXQoKSBjYWxscyBtZW1tYXBfcG9w
dWxhdGUoKSBtYW55IHRpbWVzIHRvIGNyZWF0ZSBWQSB0byBQQQo+ID4gbWFwcGluZyBmb3IgdGhl
IFZNRU1NQVAgYXJlYSwgd2hlcmUgYWxsICJzdHJ1Y3QgcGFnZSIgYXJlIGxvY2F0ZWQgb25jZQo+
ID4gQ09ORklHX1NQQVJTRU1FTV9WTUVNTUFQIGlzIGRlZmluZWQuIFRoZXNlICJzdHJ1Y3QgcGFn
ZSIgYXJlIGxhdGVyCj4gPiBpbml0aWFsaXplZCBpbiB0aGUgem9uZV9zaXplc19pbml0KCkgZnVu
Y3Rpb24uIEhvd2V2ZXIsIGR1cmluZyB0aGlzCj4gPiBwcm9jZXNzLCBubyBzZmVuY2Uudm1hIGlu
c3RydWN0aW9uIGlzIGV4ZWN1dGVkIGZvciB0aGlzIFZNRU1NQVAgYXJlYS4KPiA+IFRoaXMgb21p
c3Npb24gbWF5IGNhdXNlIHRoZSBoYXJ0IHRvIGZhaWwgdG8gcGVyZm9ybSBwYWdlIHRhYmxlIHdh
bGsKPiA+IGJlY2F1c2Ugc29tZSBkYXRhIHJlbGF0ZWQgdG8gdGhlIGFkZHJlc3MgdHJhbnNsYXRp
b24gaXMgaW52aXNpYmxlIHRvIHRoZQo+ID4gaGFydC4gVG8gc29sdmUgdGhpcyBpc3N1ZSwgdGhl
IGxvY2FsX2ZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UoKSBpcyBjYWxsZWQKPiA+IHJpZ2h0IGFmdGVy
IHRoZSBzcGFyZV9pbml0KCkgdG8gZXhlY3V0ZSBhIHNmZW5jZS52bWEgaW5zdHJ1Y3Rpb24gZm9y
IHRoaXMKPiA+IFZNRU1NQVAgYXJlYSwgZW5zdXJpbmcgdGhhdCBhbGwgZGF0YSByZWxhdGVkIHRv
IHRoZSBhZGRyZXNzIHRyYW5zbGF0aW9uCj4gPiBpcyB2aXNpYmxlIHRvIHRoZSBoYXJ0Lgo+Cj4K
PiBzL3NwYXJlX2luaXQvc3BhcnNlX2luaXQKPgo+Cj4gPgo+ID4gRml4ZXM6IGQ5NWYxYTU0MmMz
ZCAoIlJJU0MtVjogSW1wbGVtZW50IHNwYXJzZW1lbSIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBWaW5j
ZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+ID4gLS0tCj4gPiAgIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCB8IDIgKysKPiA+ICAgYXJjaC9yaXNjdi9tbS9pbml0
LmMgICAgICAgICAgICAgIHwgNSArKysrKwo+ID4gICBhcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMg
ICAgICAgICAgfCA2ICsrKysrKwo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMo
KykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gPiBpbmRleCA4ZjM0MThjNWYx
NzIuLjUyNTI2NzM3OWNjYiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
dGxiZmx1c2guaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4g
PiBAQCAtNDYsNiArNDYsNyBAQCB2b2lkIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5zaWduZWQg
bG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQpOwo+ID4gICB2b2lkIGZsdXNoX3BtZF90bGJf
cmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBlbmQpOwo+ID4gICAjZW5kaWYK
PiA+ICt2b2lkIGxvY2FsX2ZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFy
dCwgdW5zaWduZWQgbG9uZyBlbmQpOwo+ID4gICAjZWxzZSAvKiBDT05GSUdfU01QICYmIENPTkZJ
R19NTVUgKi8KPiA+Cj4gPiAgICNkZWZpbmUgZmx1c2hfdGxiX2FsbCgpIGxvY2FsX2ZsdXNoX3Rs
Yl9hbGwoKQo+ID4gQEAgLTY2LDYgKzY3LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGZsdXNoX3Rs
Yl9rZXJuZWxfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydCwKPiA+Cj4gPiAgICNkZWZpbmUgZmx1
c2hfdGxiX21tKG1tKSBmbHVzaF90bGJfYWxsKCkKPiA+ICAgI2RlZmluZSBmbHVzaF90bGJfbW1f
cmFuZ2UobW0sIHN0YXJ0LCBlbmQsIHBhZ2Vfc2l6ZSkgZmx1c2hfdGxiX2FsbCgpCj4gPiArI2Rl
ZmluZSBsb2NhbF9mbHVzaF90bGJfa2VybmVsX3JhbmdlKHN0YXJ0LCBlbmQpIGZsdXNoX3RsYl9h
bGwoKQo+ID4gICAjZW5kaWYgLyogIUNPTkZJR19TTVAgfHwgIUNPTkZJR19NTVUgKi8KPiA+Cj4g
PiAgICNlbmRpZiAvKiBfQVNNX1JJU0NWX1RMQkZMVVNIX0ggKi8KPiA+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPiBpbmRleCAyZTAx
MWNiZGRmM2EuLmNjNTZhMDk0NTEyMCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvbW0vaW5p
dC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ID4gQEAgLTEzNzcsNiArMTM3Nywx
MCBAQCB2b2lkIF9faW5pdCBtaXNjX21lbV9pbml0KHZvaWQpCj4gPiAgICAgICBlYXJseV9tZW10
ZXN0KG1pbl9sb3dfcGZuIDw8IFBBR0VfU0hJRlQsIG1heF9sb3dfcGZuIDw8IFBBR0VfU0hJRlQp
Owo+ID4gICAgICAgYXJjaF9udW1hX2luaXQoKTsKPiA+ICAgICAgIHNwYXJzZV9pbml0KCk7Cj4g
PiArI2lmZGVmIENPTkZJR19TUEFSU0VNRU1fVk1FTU1BUAo+ID4gKyAgICAgLyogVGhlIGVudGly
ZSBWTUVNTUFQIHJlZ2lvbiBoYXMgYmVlbiBwb3B1bGF0ZWQuIEZsdXNoIFRMQiBmb3IgdGhpcyBy
ZWdpb24gKi8KPiA+ICsgICAgIGxvY2FsX2ZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UoVk1FTU1BUF9T
VEFSVCwgVk1FTU1BUF9FTkQpOwo+ID4gKyNlbmRpZgo+ID4gICAgICAgem9uZV9zaXplc19pbml0
KCk7Cj4gPiAgICAgICBhcmNoX3Jlc2VydmVfY3Jhc2hrZXJuZWwoKTsKPiA+ICAgICAgIG1lbWJs
b2NrX2R1bXBfYWxsKCk7Cj4gPiBAQCAtMTM4Niw2ICsxMzkwLDcgQEAgdm9pZCBfX2luaXQgbWlz
Y19tZW1faW5pdCh2b2lkKQo+ID4gICBpbnQgX19tZW1pbml0IHZtZW1tYXBfcG9wdWxhdGUodW5z
aWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQsIGludCBub2RlLAo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdm1lbV9hbHRtYXAgKmFsdG1hcCkKPiA+ICAg
ewo+ID4gKyAgICAgLyogRGVmZXIgdGhlIHJlcXVpcmVkIFRMQiBmbHVzaCB1bnRpbCB0aGUgZW50
aXJlIFZNRU1NQVAgcmVnaW9uIGhhcyBiZWVuIHBvcHVsYXRlZCAqLwo+ID4gICAgICAgcmV0dXJu
IHZtZW1tYXBfcG9wdWxhdGVfYmFzZXBhZ2VzKHN0YXJ0LCBlbmQsIG5vZGUsIE5VTEwpOwo+ID4g
ICB9Cj4gPiAgICNlbmRpZgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2gu
YyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+ID4gaW5kZXggZTY2NTlkNzM2OGIzLi5kMTFh
NGFlODdlYzEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPiA+ICsr
KyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+ID4gQEAgLTE5Myw2ICsxOTMsMTIgQEAgdm9p
ZCBmbHVzaF90bGJfa2VybmVsX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxv
bmcgZW5kKQo+ID4gICAgICAgX19mbHVzaF90bGJfcmFuZ2UoTlVMTCwgc3RhcnQsIGVuZCAtIHN0
YXJ0LCBQQUdFX1NJWkUpOwo+ID4gICB9Cj4gPgo+ID4gKy8qIEZsdXNoIGEgcmFuZ2Ugb2Yga2Vy
bmVsIHBhZ2VzIHdpdGhvdXQgYnJvYWRjYXN0aW5nICovCj4gPiArdm9pZCBsb2NhbF9mbHVzaF90
bGJfa2VybmVsX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKQo+
ID4gK3sKPiA+ICsgICAgIGxvY2FsX2ZsdXNoX3RsYl9yYW5nZV9hc2lkKHN0YXJ0LCBlbmQgLSBz
dGFydCwgUEFHRV9TSVpFLCBGTFVTSF9UTEJfTk9fQVNJRCk7Cj4gPiArfQo+ID4gKwo+ID4gICAj
aWZkZWYgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFCj4gPiAgIHZvaWQgZmx1c2hfcG1kX3Rs
Yl9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBzdGFydCwK
PiA+ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGVuZCkKPgo+Cj4gT3RoZXJ3
aXNlLCB0aGlzIGxvb2tzIGdvb2QgdG8gbWUgYW5kIHNob3VsZCBnbyB0byAtZml4ZXMsIHlvdSBj
YW4gYWRkOgo+Cj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9z
aW5jLmNvbT4KPgo+IFRoYW5rcyEKCkFwb2xvZ2llcyBmb3IgdGhlIGRlbGF5ZWQgcmVzcG9uc2Us
IGFuZCB0aGFuayB5b3UgZm9yIHRoZSByZXZpZXcuIEkKd2lsbCBmaXggdGhlIHR5cG8gYW5kIGFk
ZCB5b3VyICdSZXZpZXdlZC1ieScgaW4gdGhlIHY2IHBhdGNoLgoKVmluY2VudAo+Cj4gQWxleAo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
