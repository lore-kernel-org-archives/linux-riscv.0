Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3673EE14D8
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 13:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y69XOaRYm/YdMYjt4QrK/44cmKpSoa73rgaed0G0WcQ=; b=YgsCEFxOAntOtN
	ypqh6Eez3v0cByCRlhj+hXeeOZpH8PQPBWsS+WT/dPaejVzKyTQRwZ4uE/4v+AdNvb6Dscd/uz1wO
	c6e7q4AB4RkQsFWfUf1BGl5kzfTYI8hdMQ5cMJOm1nyyhQTMakdMdnnKEgvtdHDnGZnY/b4aoxeYW
	YjVgwScnXHcFOi7xS5g59UqHLhkds1/KXZAx/ar/AOyPRfivA4pibY95lzGoehvtnwoddtinNqQJV
	rt5n/bk6BZsOS4AIOMDkjOnm/uB3LA6kJx+K9xfL0ZE3v7vyNFtxiVwzTx7eaV38gnaETMg7xVtl6
	c20aDVYZSqkKEyzU9Pgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfKId-00Gd2C-0z;
	Sun, 10 Sep 2023 13:16:27 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfKIa-00Gd1q-0k
	for linux-riscv@lists.infradead.org;
	Sun, 10 Sep 2023 13:16:26 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-59b50b4556eso24969237b3.1
        for <linux-riscv@lists.infradead.org>; Sun, 10 Sep 2023 06:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1694351782; x=1694956582; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjN8Of+pjWX2CIVjsxXC9mGE1z6Iz0B/xqCqiSzzvAM=;
        b=Yguj1PVuzvjloKr9TUef/nFgMIpCnwz1zcfhJhrl9NJFtMv6C07UVDr6T286QHJrOl
         f6pzg63N274mjY76jG+0RscMS84kaJuZ4Ppg5Lx5t0wTEhkae0/5QrGcMkfAjqZ+ep2+
         Zd/3N2GdwFiZBGJW1h5D2pmnPdwCvfG1CZT76KZIyuqm224qe4PA44uABvFV/ZQFFPMo
         H9zO7u1iSihjGFSyufj3vVPJeaBkVqvVDxWonLjW21Oy/gNUGldlQVD+XxaFRJMC5jOh
         GBk8SgM1DocatjoOIMD6gy1G5sd+IIdsdg3qTIOpwk1qqgElrFV75Gba2iOPbjz96ERT
         cdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694351782; x=1694956582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjN8Of+pjWX2CIVjsxXC9mGE1z6Iz0B/xqCqiSzzvAM=;
        b=v51ytO2be4vR88BaA6LJ1xz1fcs0V/X2UG3d1SVQ/K394w+H39ibCNYN5zL+DabnNr
         1exp4BE5zjubZnvahm0enexGHbi5Nfk6slhcW9SHK20OM5erlzcSbmRr8LnI3m+YbJDf
         RNqucwVvLQKqMXP1l3SkSirJUt5GuLM3pgiEHMhjlw+9CPs7vLtteEBJ/DBoXpeyFwW6
         Q3c4/ccNtUSOs4UhljLS8QbCaxyDfN5qr7F4IgtSE2LjUT7cd8R1nyvZkSmt87WPqrQW
         RZ2MVjXLJb+m6+/3etqDDvn5Jf1jpM/7Tv1qKgCcEa0FFq4upd8hc67grnL4ZPn6NMc9
         MYBw==
X-Gm-Message-State: AOJu0YxGfnDn3cyXQOhG6XsoPv/uvgeEJzGTGbU74lqrxK3RoXZvsrTN
	TZmmePzTptH7P1WlBKQ5Eln/+ZXb9kMuaTDk5ekSKA==
X-Google-Smtp-Source: AGHT+IEdl77algUKJuww50Wn5JRJSRoXn8xdxcz8+JHG/Ps8qzQnbLkhisoVtUzAvd4QI8dp5BFqrRqOymoPVtvG7R4=
X-Received: by 2002:a0d:ddcf:0:b0:586:a684:e7b6 with SMTP id
 g198-20020a0dddcf000000b00586a684e7b6mr8360407ywe.9.1694351781945; Sun, 10
 Sep 2023 06:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230130093229.27489-1-nylon.chen@sifive.com> <20230130093229.27489-3-nylon.chen@sifive.com>
 <20230130101707.pdvabl3na2wpwxqu@pengutronix.de> <CAHh=Yk8R02NXK33aogQeJQB6x88B_gpbnjHj9wRrJEbDQf67Aw@mail.gmail.com>
 <20230908144942.d3feisuyctppfb3l@pengutronix.de>
In-Reply-To: <20230908144942.d3feisuyctppfb3l@pengutronix.de>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Sun, 10 Sep 2023 21:16:10 +0800
Message-ID: <CAHh=Yk9EU74aeG2P1Sd0JG8hQdvkQpL3QE4VhZ9DmMN+JV2xHQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pwm: sifive: change the PWM controlled LED algorithm
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: aou@eecs.berkeley.edu, conor@kernel.org, 
	emil.renner.berthing@canonical.com, geert+renesas@glider.be, heiko@sntech.de, 
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh+dt@kernel.org, thierry.reding@gmail.com, 
	devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nylon7717@gmail.com, zong.li@sifive.com, greentime.hu@sifive.com, 
	vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_061624_285225_7B686163 
X-CRM114-Status: GOOD (  44.24  )
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

SGkgVXdlCgpJJ20gZ2xhZCB0aGUgZXhhbXBsZSB3YXMgaGVscGZ1bCB0byB5b3UuIEkgd2lsbCBk
b3VibGUtY2hlY2sgYW5kCnZlcmlmeSBteSBpbXBsZW1lbnRhdGlvbiBvbmNlIGFnYWluLgoKVGhh
bmsgeW91IGZvciB5b3VyIGFzc2lzdGFuY2UuCgpVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPiDmlrwgMjAyM+W5tDnmnIg45pelIOmAseS6lCDkuIvljYgx
MDo1MOWvq+mBk++8mgo+Cj4gSGVsbG8sCj4KPiBPbiBGcmksIFNlcCAwOCwgMjAyMyBhdCAwNjo0
MTowMFBNICswODAwLCBOeWxvbiBDaGVuIHdyb3RlOgo+ID4gU29ycnkgaXQncyBzbyBsb25nIGFn
by4KPiA+Cj4gPiBJIGhhdmUgY29tcGxldGVkIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgbmV3
IHZlcnNpb24sIGJ1dCB0aGVyZSBpcwo+ID4gb25lIHRoaW5nIGFib3V0IHRoaXMgbGV0dGVyIHRo
YXQgSSBzdGlsbCBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kLgo+ID4KPiA+IFV3ZSBLbGVpbmUtS8O2
bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IOaWvCAyMDIz5bm0MeaciDMw5pel
IOmAseS4gCDkuIvljYg2OjE35a+r6YGT77yaCj4gPiA+Cj4gPiA+IE9uIE1vbiwgSmFuIDMwLCAy
MDIzIGF0IDA1OjMyOjI5UE0gKzA4MDAsIE55bG9uIENoZW4gd3JvdGU6Cj4gPiA+ID4gVGhlIGBm
cmFjYCB2YXJpYWJsZSByZXByZXNlbnRzIHRoZSBwdWxzZSBpbmFjdGl2ZSB0aW1lLCBhbmQgdGhl
IHJlc3VsdCBvZgo+ID4gPiA+IHRoaXMgYWxnb3JpdGhtIGlzIHRoZSBwdWxzZSBhY3RpdmUgdGlt
ZS4gVGhlcmVmb3JlLCB3ZSBtdXN0IHJldmVyc2UgdGhlCj4gPiA+ID4gcmVzdWx0Lgo+ID4gPiA+
Cj4gPiA+ID4gVGhlIHJlZmVyZW5jZSBpcyBTaUZpdmUgRlU3NDAtQzAwMCBNYW51YWxbMF0uCj4g
PiA+ID4KPiA+ID4gPiBbMF06IGh0dHBzOi8vc2lmaXZlLmNkbi5wcmlzbWljLmlvL3NpZml2ZS8x
YTgyZTYwMC0xZjkzLTRmNDEtYjJkOC04NmVkOGIxNmFjYmFfZnU3NDAtYzAwMC1tYW51YWwtdjFw
Ni5wZGYKPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE55bG9uIENoZW4gPG55bG9uLmNo
ZW5Ac2lmaXZlLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy9wd20vcHdtLXNpZml2
ZS5jIHwgMSArCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4gPiA+
Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyBiL2RyaXZlcnMv
cHdtL3B3bS1zaWZpdmUuYwo+ID4gPiA+IGluZGV4IDYyYjZhY2M2MzczZC4uYTVlZGExNjVkMDcx
IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYwo+ID4gPiA+ICsr
KyBiL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYwo+ID4gPiA+IEBAIC0xNTgsNiArMTU4LDcgQEAg
c3RhdGljIGludCBwd21fc2lmaXZlX2FwcGx5KHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0
IHB3bV9kZXZpY2UgKnB3bSwKPiA+ID4gPiAgICAgICBmcmFjID0gRElWNjRfVTY0X1JPVU5EX0NM
T1NFU1QobnVtLCBzdGF0ZS0+cGVyaW9kKTsKPiA+ID4gPiAgICAgICAvKiBUaGUgaGFyZHdhcmUg
Y2Fubm90IGdlbmVyYXRlIGEgMTAwJSBkdXR5IGN5Y2xlICovCj4gPiA+ID4gICAgICAgZnJhYyA9
IG1pbihmcmFjLCAoMVUgPDwgUFdNX1NJRklWRV9DTVBXSURUSCkgLSAxKTsKPiA+ID4gPiArICAg
ICBmcmFjID0gKDFVIDw8IFBXTV9TSUZJVkVfQ01QV0lEVEgpIC0gMSAtIGZyYWM7Cj4gPiA+Cj4g
PiA+IFRoZSBzYW1lIHByb2JsZW0gZXhpc3RzIGluIHB3bV9zaWZpdmVfZ2V0X3N0YXRlKCksIGRv
ZXNuJ3QgaXQ/Cj4gPiA+Cj4gPiA+IEFzIGZpeGluZyB0aGlzIGlzIGFuIGludGVycnVwdGl2ZSBj
aGFuZ2UgYW55aG93LCB0aGlzIGlzIHRoZSBvcHBvcnR1bml0eQo+ID4gPiB0byBhbGlnbiB0aGUg
ZHJpdmVyIHRvIHRoZSBydWxlcyB0ZXN0ZWQgYnkgUFdNX0RFQlVHLgo+ID4gPgo+ID4gPiBUaGUg
cHJvYmxlbXMgSSBzZWUgaW4gdGhlIGRyaXZlciAob25seSBjaGVja2VkIHF1aWNrbHksIHNvIEkg
bWlnaHQgYmUKPiA+ID4gd3JvbmcpOgo+ID4gPgo+ID4gPiAgLSBzdGF0ZS0+cGVyaW9kICE9IGRk
YXRhLT5hcHByb3hfcGVyaW9kIGlzbid0IG5lY2Vzc2FyaWx5IGEgcHJvYmxlbS4gSWYKPiA+ID4g
ICAgc3RhdGUtPnBlcmlvZCA+IGRkYXRhLT5yZWFsX3BlcmlvZCB0aGF0J3MgZmluZSBhbmQgdGhl
IGRyaXZlciBzaG91bGQKPiA+ID4gICAgY29udGludWUKPiA+Cj4gPiBJIHN0aWxsIGRvbuKAmXQg
cXVpdGUgdW5kZXJzdGFuZCB0aGUgZGVzY3JpcHRpb24gb2YgdGhpcyBwYXJhZ3JhcGguCj4gPgo+
ID4gc3RhdGUtPnBlcmlvZCAhPSBkZGF0ZS0+YXBwcm94X3BlcmlvZCBzZWVtcyB0byBiZSB1c2Vk
IHRvIGNvbXBhcmUgdGhlCj4gPiByZXN1bHRzIG9mIHRoZSBwcmV2aW91cyBhbmQgbmV4dCB0d28g
dGltZXMuCj4KPiBUaGVyZSBhcmUgdHdvIHRoaW5ncyB0byBjb25zaWRlcjoKPgo+ICAtIHVzdWFs
bHkgdGhlIGhhcmR3YXJlIGRvZXNuJ3Qgc3VwcG9ydCBhbGwgcmVxdWVzdGFibGUgc3RhdGVzIGJl
Y2F1c2UKPiAgICB0aGUgaGFyZHdhcmUncyBxdWFudHVtIGlzID4gMSBucy4gVGhhdCBpcywgaXQg
bWlnaHQgZm9yIGV4YW1wbGUKPiAgICBzdXBwb3J0IHBlcmlvZHMgaW4gdGhlIGZvcm0gKDE2MCBu
cyAqIGkgLyAzKSBmb3IgaSBpbiAxIC4uIDEwMjMuCj4KPiAgICBJZiB0aGlzIGhhcmR3YXJlIHJ1
bnMgd2l0aCBpID0gNTAwICh0aGF0IGlzIHBlcmlvZCB+PSAyNjY2Ni42Ngo+ICAgIG5zKSBiZWNh
dXNlIHRoZSBmaXJzdCBjaGFubmVsIGlzIGNvbmZpZ3VyZWQgdG8gcnVuIHdpdGggcGVyaW9kID0K
PiAgICAyNjY2NywgYW5kIC5yZXF1ZXN0IGlzIGNhbGxlZCBmb3IgdGhlIDJuZCBjaGFubmVsIHdp
dGggLnBlcmlvZCA9Cj4gICAgMjY3MDAgbnMsIHRoZXJlIGlzIG5vIG5lZWQgdG8gcmVmdXNlIHRo
YXQsIGJlY2F1c2UgMjY2NjYuNjYgaXMgdGhlCj4gICAgYmVzdCBwb3NzaWJsZSBhcHByb3hpbWF0
aW9uIGZvciAyNjcwMCBucyBhbnlob3cuCj4KPiAgLSAuYXBwbHkgaXMgc3VwcG9zZWQgdG8gaW1w
bGVtZW50IHRoZSBoaWdoZXN0IHBvc3NpYmxlIHBlcmlvZCB0aGF0Cj4gICAgaXNuJ3QgYmlnZ2Vy
IHRoYW4gdGhlIHJlcXVlc3RlZCBwZXJpb2QuIFNvIGluIHRoZSBhYm92ZSBjYXNlIGV2ZW4gaWYK
PiAgICB0aGUgaGFyZHdhcmUgcnVucyBhdCAyNjY2Ni42NiBucyB3aXRob3V0IHRoZSBwb3NzaWJp
bGl0eSB0byBjaGFuZ2UKPiAgICB0aGF0LCBhIHJlcXVlc3QgdG8gY29uZmlndXJlIGZvciBwZXJp
b2QgPSAzMDAwMCBucyBjb3VsZCBzdWNjZWVkIChhbmQKPiAgICBrZWVwIDI2NjY2LjY2IG5zKS4K
Pgo+ID4gV291bGQgeW91IHN1Z2dlc3QgSSBzZW5kIHRoZSBuZXcgaW1wbGVtZW50YXRpb24gdmVy
c2lvbiBiZWZvcmUKPiA+IGNvbnRpbnVpbmcgdGhlIGRpc2N1c3Npb24/Cj4KPiBOb3RlIHRoYXQg
dGhlIGFib3ZlIGltcGxlbWVudHMgdGhlIG9wdGltYWwgYmVoYXZpb3VyIGZvciBhIGRyaXZlci4K
PiAoRm9yIHNvbWUgZGVmaW5pdGlvbiBvZiAib3B0aW1hbCIgdGhhdCBhZG1pdHRlZGx5IGFsc28g
eWllbGRzIHN0cmFuZ2UKPiBiZWhhdmlvdXIgYXQgdGltZXMuIFRoZSByZWFzb25pbmcgZm9yIHRo
aXMgdG8gdGhlIGJlIHRoaW5nIHRvIGltcGxlbWVudAo+IGlzLCB0aGF0J3MgdGhlIGNvcm5lciBj
YXNlcyBhcmUgZWFzaWVyIHRvIGltcGxlbWVudCwgaWRlbXBvdGVuY3kgaXMKPiBwb3NzaWJsZSBh
bmQgaXQncyBlYXNpZXIgdG8gd29yayB3aXRoIHRoYW4gcm91bmRpbmcgdG8gdGhlIG5lYXJlc3QK
PiBwb3NzaWJsZSB2YWx1ZS4pCj4KPiBXaGlsZSBJJ2QgbGlrZSB0byBzZWUgdGhlIHNpZml2ZSBk
cml2ZXIgdG8gaW1wbGVtZW50IHRoaXMgb3B0aW1hbAo+IGJlaGF2aW91ciwgaXQncyBub3QgbWFu
ZGF0b3J5IHRoYXQgeW91IGNvbnZlcnQgdGhlIGRyaXZlciB0byB0aGF0Cj4gYmVoYXZpb3VyLiBK
dXN0IG1ha2Ugc3VyZSB0byBub3QgbWFrZSBpdCB3b3JzZS4KPgo+IFNvIHRvIGFuc3dlciB5b3Vy
IHF1ZXN0aW9uOiBJZiB5b3UgdW5kZXJzdG9vZCB3aGF0IEkgd3JvdGUgYWJvdmUgYW5kIGFyZQo+
IG1vdGl2YXRlZCB0byBpbXByb3ZlIHRoZSBkcml2ZXIsIGl0IHdvdWxkIGJlIGdyZWF0IHRvIGRv
IHRoYXQgYmVmb3JlIHRoZQo+IG5leHQgcmV2aWV3IHJvdW5kLgo+Cj4gQmVzdCByZWdhcmRzCj4g
VXdlCj4KPiAtLQo+IFBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8
IFV3ZSBLbGVpbmUtS8O2bmlnICAgICAgICAgICAgfAo+IEluZHVzdHJpYWwgTGludXggU29sdXRp
b25zICAgICAgICAgICAgICAgICB8IGh0dHBzOi8vd3d3LnBlbmd1dHJvbml4LmRlLyB8CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
