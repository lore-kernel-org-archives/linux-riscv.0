Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C09C83F2F
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 17:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yUJEa1JPfVQAB7Dw9/7co+hJsCU4KlneH/CLkMdgDJY=; b=A+uh8VWmWy+PV5
	lTHhE95n3OCfqSdndLzUlcyRs/FyYgFjOyhfGK3rzpDrlOjVIlqzfXqHrxU5oqUYP9fuktv9/M8hO
	ZC+UherblH6DsUwm5ESBBYEx1psHqZZFB7KX5kpAri0UsO1gicmY75DGDy9Yesj03/oR2et+Obosi
	loGpuPnYzF1Fwqo9AAXUjP13P1wCDPCj6+p5ej2v8syW2KSbxo6A7TvIiCUo3TIRawPK1SxFgpyZg
	WwlbUeKouZWDxUgKjgrsulXdh1MH4EC2uBlniO/7ByJv04Iq2mCTtF6NDKi5VMLvBG6Mi7XEmBU/m
	xGxqjurbCxWLZF0GXw4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbl1j-00FbeU-2W;
	Thu, 31 Aug 2023 17:00:15 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbl1g-00Fbdw-2y
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 17:00:14 +0000
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-9a5e1812378so123612866b.2
        for <linux-riscv@lists.infradead.org>; Thu, 31 Aug 2023 10:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693501209; x=1694106009; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sR+D5V6w6Qq1SltI9MYKs11ulmOe+c77VyqwFo26gw4=;
        b=bJVgkbkV7kKXY782UqcvM1ZBXCy6DCMueNsx7dw1GsWhDB8Ly3F9Gpxc32paRsJ7ke
         +A9l+7o1QMDySoi9aOiVV+uZUI9LCq5TQO66NWv99ZvxUtGpC0f4WDdP7jYgg7zOnvTw
         BoQlvgqdjYjzWsmN3BzPMOfLQx5HBPTETo9isq2ykq8J8GZop4VQkUthrgb6eYUP7UeA
         kOpPvk0ZeEoGYClK8w7tOLOc+i4ZZdCkbFTBMevI9ea3tcNBMVdLoT1Yaz1npHnTL/U+
         AJ6FvWh/tT+sSi2ocqsqm3mNUQQH4EWsfyDtAX01MiKc55qv/+EOBDfKPYXhmNdBhTyA
         xHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693501209; x=1694106009;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sR+D5V6w6Qq1SltI9MYKs11ulmOe+c77VyqwFo26gw4=;
        b=bgbKyNFkpWDL7sAkN7MgsRDB+X9eMPgE6r65Xg+sEIpur6wih1Czstq1aS/DVhy2SZ
         PjbVvVSUvBr3Mw9DSu1QAyAO6JBoDNkW1Fhg/PsUFSw5b895RENu75iUdp7Kg0Uh0I+F
         sxj36bvxYfzg98XpOz+i3QFFNyw3m5I4tMhSbg5AQTCxO+MzZ/2oMCW+hr7eKj2fAlL7
         Q8KbxVT8K8lj6N1vKRbHPIwgaq9h7sA/F9dZc8n+x8h6WZzZ7wTwOLNLh6UF78ZxtpC1
         wKrPuc/QvVpOH6gsLFW6RpTgMExXItSfo9NFXr37cH9n7AgwRjC2fUormQf+uw401jqn
         pykA==
X-Gm-Message-State: AOJu0Yzo1GZ2vvgOEU+jmWPZt94IXJnYn4uk28D8RXGeuCDukKfKxIcb
	XnUZbDbEbPt1RUaDt2o+PF0wsg==
X-Google-Smtp-Source: AGHT+IEvKIttARFVP4pBsvUJoQGBw1JJfcNIAwQYPGUxYEUx7aTWFgQgAQR/XqHVNGZ42CgljaLRiA==
X-Received: by 2002:a17:906:530c:b0:9a2:16e2:35c with SMTP id h12-20020a170906530c00b009a216e2035cmr4168284ejo.31.1693501209084;
        Thu, 31 Aug 2023 10:00:09 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id e19-20020a1709067e1300b009a198078c53sm934928ejr.214.2023.08.31.10.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 10:00:08 -0700 (PDT)
Date: Thu, 31 Aug 2023 19:00:07 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: "Wang, Xiao W" <xiao.w.wang@intel.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "ardb@kernel.org" <ardb@kernel.org>, 
	"Li, Haicheng" <haicheng.li@intel.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] RISC-V: Optimize bitops with Zbb extension
Message-ID: <20230831-f0f847c5703875f1e67635c1@orel>
References: <20230806024715.3061589-1-xiao.w.wang@intel.com>
 <CAAhSdy2_djw2JX+8tmF2V190+x9KLvt7u8rCX-TaGCKQrUVOYQ@mail.gmail.com>
 <DM8PR11MB57512001CAFA07EC58203A7BB8E6A@DM8PR11MB5751.namprd11.prod.outlook.com>
 <20230830-breeze-washboard-ef496d5c9d5a@wendy>
 <DM8PR11MB575116E5EE183D7D41361B74B8E5A@DM8PR11MB5751.namprd11.prod.outlook.com>
 <CAK9=C2XTS539ew_rty6_MOwyZkdBBbGBCzxp33u1UpMP5STAqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2XTS539ew_rty6_MOwyZkdBBbGBCzxp33u1UpMP5STAqQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_100012_966894_1F8DDA52 
X-CRM114-Status: GOOD (  40.34  )
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

T24gVGh1LCBBdWcgMzEsIDIwMjMgYXQgMDk6Mzc6MzBQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiArQW5kcmV3Cj4gCj4gT24gVGh1LCBBdWcgMzEsIDIwMjMgYXQgOToyOeKAr1BNIFdhbmcs
IFhpYW8gVyA8eGlhby53LndhbmdAaW50ZWwuY29tPiB3cm90ZToKPiA+Cj4gPgo+ID4gPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPgo+ID4gPiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAzMCwgMjAy
MyAyOjU5IFBNCj4gPiA+IFRvOiBXYW5nLCBYaWFvIFcgPHhpYW8udy53YW5nQGludGVsLmNvbT4K
PiA+ID4gQ2M6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+OyBwYXVsLndhbG1zbGV5
QHNpZml2ZS5jb207Cj4gPiA+IHBhbG1lckBkYWJiZWx0LmNvbTsgYW91QGVlY3MuYmVya2VsZXku
ZWR1OyBhcmRiQGtlcm5lbC5vcmc7IExpLCBIYWljaGVuZwo+ID4gPiA8aGFpY2hlbmcubGlAaW50
ZWwuY29tPjsgbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtCj4gPiA+IGVm
aUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiA+ID4gU3Vi
amVjdDogUmU6IFtQQVRDSF0gUklTQy1WOiBPcHRpbWl6ZSBiaXRvcHMgd2l0aCBaYmIgZXh0ZW5z
aW9uCj4gPiA+Cj4gPiA+IE9uIFdlZCwgQXVnIDMwLCAyMDIzIGF0IDA2OjE0OjEyQU0gKzAwMDAs
IFdhbmcsIFhpYW8gVyB3cm90ZToKPiA+ID4gPiBIaSwKPiA+ID4gPgo+ID4gPiA+ID4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+ID4gPiA+IEZyb206IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+Cj4gPiA+ID4gPiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgMjksIDIwMjMgNzow
OCBQTQo+ID4gPiA+ID4gVG86IFdhbmcsIFhpYW8gVyA8eGlhby53LndhbmdAaW50ZWwuY29tPgo+
ID4gPiA+ID4gQ2M6IHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbTsgcGFsbWVyQGRhYmJlbHQuY29t
Owo+ID4gPiA+ID4gYW91QGVlY3MuYmVya2VsZXkuZWR1OyBhcmRiQGtlcm5lbC5vcmc7IExpLCBI
YWljaGVuZwo+ID4gPiA+ID4gPGhhaWNoZW5nLmxpQGludGVsLmNvbT47IGxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LQo+ID4gPiA+ID4gZWZpQHZnZXIua2VybmVsLm9yZzsg
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRD
SF0gUklTQy1WOiBPcHRpbWl6ZSBiaXRvcHMgd2l0aCBaYmIgZXh0ZW5zaW9uCj4gPiA+ID4gPgo+
ID4gPiA+ID4gT24gU3VuLCBBdWcgNiwgMjAyMyBhdCA4OjA54oCvQU0gWGlhbyBXYW5nIDx4aWFv
Lncud2FuZ0BpbnRlbC5jb20+Cj4gPiA+IHdyb3RlOgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBU
aGlzIHBhdGNoIGxldmVyYWdlcyB0aGUgYWx0ZXJuYXRpdmUgbWVjaGFuaXNtIHRvIGR5bmFtaWNh
bGx5IG9wdGltaXplCj4gPiA+ID4gPiA+IGJpdG9wcyAoaW5jbHVkaW5nIF9fZmZzLCBfX2Zscywg
ZmZzLCBmbHMpIHdpdGggWmJiIGluc3RydWN0aW9ucy4gV2hlbgo+ID4gPiA+ID4gPiBaYmIgZXh0
IGlzIG5vdCBzdXBwb3J0ZWQgYnkgdGhlIHJ1bnRpbWUgQ1BVLCBsZWdhY3kgaW1wbGVtZW50YXRp
b24gaXMKPiA+ID4gPiA+ID4gdXNlZC4gSWYgWmJiIGlzIHN1cHBvcnRlZCwgdGhlbiB0aGUgb3B0
aW1pemVkIHZhcmlhbnRzIHdpbGwgYmUgc2VsZWN0ZWQKPiA+ID4gPiA+ID4gdmlhIGFsdGVybmF0
aXZlIHBhdGNoaW5nLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUaGUgbGVnYWN5IGJpdG9wcyBz
dXBwb3J0IGlzIHRha2VuIGZyb20gdGhlIGdlbmVyaWMgQyBpbXBsZW1lbnRhdGlvbiBhcwo+ID4g
PiA+ID4gPiBmYWxsYmFjay4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSWYgdGhlIHBhcmFtZXRl
ciBpcyBhIGJ1aWxkLXRpbWUgY29uc3RhbnQsIHdlIGxldmVyYWdlIGNvbXBpbGVyIGJ1aWx0aW4g
dG8KPiA+ID4gPiA+ID4gY2FsY3VsYXRlIHRoZSByZXN1bHQgZGlyZWN0bHksIHRoaXMgYXBwcm9h
Y2ggaXMgaW5zcGlyZWQgYnkgeDg2IGJpdG9wcwo+ID4gPiA+ID4gPiBpbXBsZW1lbnRhdGlvbi4K
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gRUZJIHN0dWIgcnVucyBiZWZvcmUgdGhlIGtlcm5lbCwg
c28gYWx0ZXJuYXRpdmUgbWVjaGFuaXNtIHNob3VsZCBub3QgYmUKPiA+ID4gPiA+ID4gdXNlZCB0
aGVyZSwgdGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbWFjcm8gRUZJX05PX0FMVEVSTkFUSVZFIGZv
ciB0aGlzCj4gPiA+ID4gPiA+IHB1cnBvc2UuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSSBhbSBnZXR0
aW5nIHRoZSBmb2xsb3dpbmcgY29tcGlsZSBlcnJvciB3aXRoIHRoaXMgcGF0Y2g6Cj4gPiA+ID4g
Pgo+ID4gPiA+ID4gICBHRU4gICAgIE1ha2VmaWxlCj4gPiA+ID4gPiAgIFVQRCAgICAgaW5jbHVk
ZS9jb25maWcva2VybmVsLnJlbGVhc2UKPiA+ID4gPiA+ICAgVVBEICAgICBpbmNsdWRlL2dlbmVy
YXRlZC91dHNyZWxlYXNlLmgKPiA+ID4gPiA+ICAgQ0MgICAgICBrZXJuZWwvYm91bmRzLnMKPiA+
ID4gPiA+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAvaG9tZS9hbnVwL1dvcmsvcmlzY3YtCj4gPiA+
ID4gPiB0ZXN0L2xpbnV4L2luY2x1ZGUvbGludXgvYml0bWFwLmg6OSwKPiA+ID4gPiA+ICAgICAg
ICAgICAgICAgICAgZnJvbQo+ID4gPiA+ID4gL2hvbWUvYW51cC9Xb3JrL3Jpc2N2LQo+ID4gPiB0
ZXN0L2xpbnV4L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oOjksCj4gPiA+ID4g
PiAgICAgICAgICAgICAgICAgIGZyb20KPiA+ID4gPiA+IC9ob21lL2FudXAvV29yay9yaXNjdi10
ZXN0L2xpbnV4L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaDo5MCwKPiA+ID4gPgo+ID4g
PiA+Cj4gPiA+ID4gSXQgbG9va3MgdGhlcmUncyBhIGN5Y2xpYyBoZWFkZXIgaW5jbHVkaW5nLCB3
aGljaCBsZWFkcyB0byB0aGlzIGJ1aWxkIGVycm9yLgo+ID4gPiA+IEkgY2hlY2tlZCBodHRwczov
L2dpdGh1Yi5jb20va3ZtLXJpc2N2L2xpbnV4L3RyZWUvbWFzdGVyIGFuZAo+ID4gPiA+IGh0dHBz
Oi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC90cmVlL21hc3RlciwgYnV0IEkgZG9uJ3Qgc2Vl
Cj4gPiA+ID4gImFzbS9jcHVmZWF0dXJlLmgiIGlzIGluY2x1ZGVkIGluIGFzbS9od2NhcC5oOjkw
LCBtYXliZSBJIG1pc3MKPiA+ID4gc29tZXRoaW5nLAo+ID4gPiA+IGNvdWxkIHlvdSBoZWxwIHBv
aW50IG1lIHRvIHRoZSByZXBvL2JyYW5jaCBJIHNob3VsZCB3b3JrIG9uPwo+ID4gPgo+ID4gPiBG
cm9tIE1BSU5UQUlORVJTOgo+ID4gPiAgICAgICBSSVNDLVYgQVJDSElURUNUVVJFCj4gPiA+ICAg
ICAgIC4uLgo+ID4gPiAgICAgICBUOiAgICAgIGdpdCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0Cj4gPiA+Cj4gPiA+IFRoZSBmb3It
bmV4dCBicmFuY2ggdGhlcmUgaXMgd2hhdCB5b3Ugc2hvdWxkIGJlIGJhc2luZyB3b3JrIG9uIHRv
cCBvZi4KPiA+ID4gQUZBSUNULCB5b3UndmUgbWFkZSBiaXRvcHMuaCBpbmNsdWRlIGh3Y2FwLmgg
d2hpbGUgY3B1ZmVhdHVyZS5oIGluY2x1ZGVzCj4gPiA+IGJvdGggYml0b3BzLmggKGluZGlyZWN0
bHkpIGFuZCBod2NhcC5oLgo+ID4KPiA+IFRoYW5rcyBmb3IgdGhlIGluZm8sIGJ1dCBJIGNhbid0
IHJlcHJvZHVjZSBBbnVwJ3MgYnVpbGQgZXJyb3Igd2l0aCB0aGlzIGZvci1uZXh0IGJyYW5jaCwg
Y3B1ZmVhdHVyZS5oIGlzIG5vdCBpbmNsdWRlZCBieSBod2NhcC5oIHRoZXJlLgo+ID4gTWF5YmUg
QW51cCBjb3VsZCBoZWxwIGRvdWJsZSBjaGVjayB0aGUgdGVzdCBlbnZpcm9ubWVudD8KPiAKPiBJ
IGZpZ3VyZWQgdGhhdCBjcHVmZWF0dXJlLmggaW5jbHVkZWQgaW4gaHdjYXAuaCBpcyBhZGRlZCBi
eQo+IERyZXcncyBwYXRjaCAiUklTQy1WOiBFbmFibGUgY2JvLnplcm8gaW4gdXNlcm1vZGUiCgpJ
IHRoaW5rIHdlIHNob3VsZCBwcm9iYWJseSBzcGxpdCBod2NhcC5oIGludG8gdHdvIHBhcnRzLiBU
aGUgZGVmaW5lcyBzdGF5CmFuZCB0aGUgcmVzdCBjYW4gbW92ZSB0byBjcHVmZWF0dXJlLmgKClRo
YW5rcywKZHJldwoKPiAKPiBJIGhhZCB0cmllZCB0aGlzIHBhdGNoIG9uLXRvcC1vZiBkZXYtdXBz
dHJlYW0gYnJhbmNoIG9mCj4gaHR0cHM6Ly9naXRodWIuY29tL3ZlbnRhbmFtaWNyby9saW51eC5n
aXQKPiAKPiBSZWdhcmRzLAo+IEFudXAKPiAKPiA+Cj4gPiBCUnMsCj4gPiBYaWFvCj4gPgo+ID4K
PiA+ID4KPiA+ID4gSG9wZSB0aGF0IGhlbHBzLAo+ID4gPiBDb25vci4KPiA+ID4KPiA+ID4gPiA+
ICAgICAgICAgICAgICAgICAgZnJvbQo+ID4gPiA+ID4gL2hvbWUvYW51cC9Xb3JrL3Jpc2N2LXRl
c3QvbGludXgvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9iaXRvcHMuaDoyNiwKPiA+ID4gPiA+ICAg
ICAgICAgICAgICAgICAgZnJvbQo+ID4gPiA+ID4gL2hvbWUvYW51cC9Xb3JrL3Jpc2N2LXRlc3Qv
bGludXgvaW5jbHVkZS9saW51eC9iaXRvcHMuaDo2OCwKPiA+ID4gPiA+ICAgICAgICAgICAgICAg
ICAgZnJvbSAvaG9tZS9hbnVwL1dvcmsvcmlzY3YtdGVzdC9saW51eC9pbmNsdWRlL2xpbnV4L2xv
ZzIuaDoxMiwKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9hbnVwL1dvcmsv
cmlzY3YtdGVzdC9saW51eC9rZXJuZWwvYm91bmRzLmM6MTM6Cj4gPiA+ID4gPiAvaG9tZS9hbnVw
L1dvcmsvcmlzY3YtdGVzdC9saW51eC9pbmNsdWRlL2xpbnV4L2ZpbmQuaDogSW4gZnVuY3Rpb24K
PiA+ID4gPiA+ICdmaW5kX25leHRfYml0JzoKPiA+ID4gPiA+IC9ob21lL2FudXAvV29yay9yaXNj
di10ZXN0L2xpbnV4L2luY2x1ZGUvbGludXgvZmluZC5oOjY0OjMwOiBlcnJvcjoKPiA+ID4gPiA+
IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdfX2ZmcycKPiA+ID4gPiA+IFstV2Vy
cm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ID4gPiA+ID4gICAgNjQgfCAgICAg
ICAgICAgICAgICAgcmV0dXJuIHZhbCA/IF9fZmZzKHZhbCkgOiBzaXplOwo+ID4gPiA+ID4KPiA+
ID4gPiA+IFJlZ2FyZHMsCj4gPiA+ID4gPiBBbnVwCj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWGlhbyBXYW5nIDx4aWFvLncud2FuZ0Bp
bnRlbC5jb20+Cj4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9iaXRvcHMuaCAgICAgICB8IDI2Ngo+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysr
LQo+ID4gPiA+ID4gPiAgZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi9NYWtlZmlsZSB8ICAg
MiArLQo+ID4gPiA+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNjQgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vYml0b3BzLmgKPiA+ID4gPiA+IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9iaXRvcHMuaAo+ID4gPiA+ID4gPiBpbmRleCAzNTQwYjY5MDk0NGIuLmY3MjdmNjQ4OWNkNSAx
MDA2NDQKPiA+ID4gPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9iaXRvcHMuaAo+
ID4gPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2JpdG9wcy5oCj4gPiA+ID4g
PiA+IEBAIC0xNSwxMyArMTUsMjczIEBACj4gPiA+ID4gPiA+ICAjaW5jbHVkZSA8YXNtL2JhcnJp
ZXIuaD4KPiA+ID4gPiA+ID4gICNpbmNsdWRlIDxhc20vYml0c3BlcmxvbmcuaD4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
