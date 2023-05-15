Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DED4C77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 04:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mw+sVQ342gBWsWqF6+kIfFQrCwsHrqs8VWlBco4lcCI=; b=H2wN8tloPOYJ9D
	HA8hFfQvZEmB6sootVa1VJCe4to63JI7mrIboECpB8eoTjFSK0MDnUuTfLXiMMaw7Vt9Kdz6M9biu
	EC83QTABz27POI7ctmfYvDWOutD4HW1EqgnkO3q+7dC4XmP/SUlKVxmkCl6UbQYFb54kYiGiaRGnG
	yW3bfEgKJE+8R1IVkuxwYd/5di5nQ14hQ3YeDeA8ZgWtw+MB9Wmk3YX+OuprmV1oVofrsVb9TdrUh
	j+gLHiCs6gIerfuAl96yaW9h8scDL1hTuPUYX7G0+ppKKacE8tR3LlqeuolzRmewO2IDwAXksv2tA
	2HVUeyC3YQK58m/g9ozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyPz2-000qlj-02;
	Mon, 15 May 2023 04:38:52 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyPyz-000qkc-0u
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 04:38:50 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6434e263962so8993860b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 21:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684125525; x=1686717525;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3aTpP/j5XmZsI2M1PtQbEVHdnmyw0F8FitgytTs/n3k=;
        b=I+VtzDQRP5VX1htzV9toXnehk6nZVWL75nnhS3zUH/YQ8tmq6o2+eviYtIyirHm6OL
         p2ED2EylpVRC1Z+XlaFd52RhruwrgrTQRh6EftAh3SsJb7sQlhVkHd0oqZh1w+heMLnz
         MSLfUcmVGCIYYxOSFavyEOqP8TJKfv6eb4cN8450qtAZrpsLxdHHuAmLasFpQo3Woe3H
         K7xAcuv1dasODpATlBrf61tdvs2UsaoQmBoyOPNCSeHKTeNt6Rp3igQ38if7OoBSp0Wk
         6yYmd0ccqotu6xnTwda0yO7CVP2rxJV0SiYWjvgCzAIDYid8ema2ak30GgkN4Gx7G4KG
         vRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684125525; x=1686717525;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3aTpP/j5XmZsI2M1PtQbEVHdnmyw0F8FitgytTs/n3k=;
        b=VUP6HsxvRDIhuW6WCpLqqy+zqhfrJo2lRn05ZZVIZEly7M9rn7joGIp2sDEM9i89wT
         1wJvLX6/TdPt/SHWP6C7NAa9VRIULEdkmTof9rAgFhPMSmb68bSp+cuXOzSj/dYsKTxC
         YwF+nCUDN4/urfjVGnaub6KHbx6vSiyIQFnEmSEcTqQFOYQEJ//w/V4LVyTqpRnFnFK8
         FanC5lOgWQJevQgkxaRTPU21Z0hqEkJqzELcB/lzuHFGVF2FJ/a0kCGTKG51fi3dRkd3
         nERlE20j5XFoDuKl/Vm93UFFQ/x7njtzFQx6KYiRtZt9O0phQsAAbZWRwrhhIqdLKaZt
         qM9Q==
X-Gm-Message-State: AC+VfDyxPBMmG4eReshwD+aO5kPhf1957zxgCvIaJR4ke4dFJzUhOAmR
	6Gsj/yr6ir48iN4gdZozZKsY9A==
X-Google-Smtp-Source: ACHHUZ4GLzEA2JfT+FyfAdyb9sKhKFz1qwPptmFPwInp7Q/6hgJmlWWdC5yWKSb77JXs13LuyQUmyw==
X-Received: by 2002:a05:6a00:b49:b0:648:b185:efd9 with SMTP id p9-20020a056a000b4900b00648b185efd9mr24148052pfo.11.1684125524830;
        Sun, 14 May 2023 21:38:44 -0700 (PDT)
Received: from sunil-laptop ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id b19-20020aa78713000000b00643355ff6a6sm11157378pfo.99.2023.05.14.21.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 21:38:44 -0700 (PDT)
Date: Mon, 15 May 2023 10:08:35 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	atishp@atishpatra.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	cyy@cyyself.name, Conor Dooley <conor.dooley@microchip.com>,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	Paul Walmsley <paul.walmsley@sifive.com>, ajones@ventanamicro.com,
	Krste Asanovic <krste@sifive.com>,
	Andrew Waterman <andrew@sifive.com>,
	Greg Favor <gfavor@ventanamicro.com>,
	Mark Himelstein <markhimelstein@riscv.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: Re: [RFC 0/6] Deprecate riscv,isa DT property?
Message-ID: <ZGG3S3FgmHy/XGBx@sunil-laptop>
References: <20230511-occupancy-cleat-06e532e3ea11@spud>
 <mhng-495c690b-454c-408f-a4f2-287d7ce8a9ea@palmer-ri-x1c9a>
 <20230512-streak-camper-08a68afb5897@spud>
 <20230512-exhume-unfold-f104dd4c4cbf@spud>
 <CAK9=C2XJDDYKN_HO8Q2OShQs=crQUhx4aUi5Xx4=YiAA9OYSqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2XJDDYKN_HO8Q2OShQs=crQUhx4aUi5Xx4=YiAA9OYSqQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_213849_322845_55D8715C 
X-CRM114-Status: GOOD (  30.30  )
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

T24gU2F0LCBNYXkgMTMsIDIwMjMgYXQgMDE6MTc6MDNQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBTYXQsIE1heSAxMywgMjAyMyBhdCAzOjM14oCvQU0gQ29ub3IgRG9vbGV5IDxjb25v
ckBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiArQ0MgR3JlZywgTWFyaywgS3JzdGUsIFBoaWxp
cHAsIEFuZHJldywKPiA+Cj4gPiAodGhpcyBpcyBMS01MIG5vdywgbm8gdG9wIHBvc3Rpbmcgb3Ig
aHRtbCByZXBsaWVzKQo+ID4KPiA+IE9uIEZyaSwgTWF5IDEyLCAyMDIzIGF0IDA4OjQwOjEwUE0g
KzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+ID4gT24gRnJpLCBNYXkgMTIsIDIwMjMgYXQg
MTE6MDE6MDlBTSAtMDcwMCwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gPiA+ID4gT24gVGh1LCAx
MSBNYXkgMjAyMyAxNTozODoxMCBQRFQgKC0wNzAwKSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4g
PiA+ID4gT24gVGh1LCBNYXkgMTEsIDIwMjMgYXQgMDM6MzQ6MjRQTSAtMDcwMCwgQXRpc2ggUGF0
cmEgd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFRodSwgTWF5IDExLCAyMDIzIGF0IDI6NDfigK9QTSBD
b25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4gPiA+IE9uIFRo
dSwgTWF5IDExLCAyMDIzIGF0IDAyOjI3OjQ0UE0gLTA3MDAsIEF0aXNoIFBhdHJhIHdyb3RlOgo+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBUaGF0J3MgbW9yZSB0aGFuIGxhc3QgeWVhciBhdCB0aGlz
IHBvaW50LCBhbmQgbm90aGluZyBoYXMgY2hhbmdlZCBpbiB0aGUKPiA+ID4gPiA+ID4gPiBkb2N1
bWVudGF0aW9uISBUYWxrJ3MgY2hlYXAsIGVoaD8KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiBZdXAuIEkgd2lsbCBwb2tlIFJWSSBmb2xrcyB0byBjaGVjayBpZiBpdCBzdGls
bCBpcyB0aGUgcGxhbiBvciBjaGFuZ2VkICEhCj4gPiA+ID4gPgo+ID4gPiA+ID4gU291bmRzIGdv
b2QsIHRoYW5rcyEKPiA+ID4KPiA+ID4gVGhlcmUgaGFzIGJlZW4gc29tZSBtb3ZlbWVudCBvbiB0
aGF0IGZyb250LCBzaGFsbCBzZWUgd2hlcmUgaXQgZ29lcwo+ID4gPiA6dXBzaWRlZG93bl9zbWls
ZToKPiA+Cj4gPiBUaGVyZSdzIGJlZW4gc29tZSBvZmYtbGlzdCBkaXNjdXNzaW9uIHByb21wdGVk
IGJ5IEF0aXNoIHdpdGggc29tZSBvZiB0aGUKPiA+IFJWSSBzcGVjIGZvbGssIGZyb20gd2hpY2gg
dGhlIHVwc2hvdCBfX2FwcGVhcnNfXyB0byBiZSBhbiB1bmRlcnN0YW5kaW5nCj4gPiB0aGF0IHVz
aW5nIHZlcnNpb24gbnVtYmVyaW5nIHRvIGluZGljYXRlIHJlbW92YWwgb2YgSVNBIGZlYXR1cmVz
IGlzIGEgYmFkCj4gPiBpZGVhLgo+ID4gSSdtIGhvcGluZyB0aGF0IHRoaXMgcmVzdWx0cyBpbiB0
aGUgZW5zaHJpbmVtZW50IG9mIHRoaXMgaW4gdGhlIElTQQo+ID4gc3BlY3MsIHNvIHRoYXQgd2Ug
aGF2ZSBzb21ldGhpbmcgY29uY3JldGUgdG8gcG9pbnQgdG8gYXMgdGhlIGJhc2lzIGZvcgo+ID4g
bm90IG5lZWRpbmcgdG8gaGFuZGxlIHZlcnNpb24gbnVtYmVyaW5nLgo+ID4gQ2VydGFpbmx5IHRo
YXQnZCBiZSBncmVhdCBmb3IgQUNQSSBhbmQgcmVtb3ZlIGNvbmNlcm5zIHRoZXJlLgo+ID4KPiA+
ID4gPiA+ID4gV2Ugd2lsbCBsaWtlbHkgaGF2ZSBhIHZlbmRvciBzcGVjaWZpYyBzdHJpbmcgcGFy
c2luZyBsb2dpYy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBDb21wbGljYXRpbmcgdGhlIHBhcnNpbmcg
bG9naWMgaXMgdGhlIGV4YWN0IHNvcnQgb2YgY3JhcCB0aGF0IEkgd2FudAo+ID4gPiA+ID4gdG8g
YXZvaWQuCj4gPiA+ID4KPiA+ID4gPiBZYSwgSSB0aGluayB3ZSdyZSByZWFsbGx5IG92ZXJjb21w
bGljYXRpbmcgdGhpbmdzIHdpdGggdGhlIElTQSBzdHJpbmdzLgo+ID4gPiA+IExldCdzIGp1c3Qg
ZGVwcmVjYXRlIHRoZW0gYW5kIG1vdmUgdG8gc29tZXRoaW5nIHRoYXQgZG9lc24ndCBuZWVkIGFs
bCB0aGUKPiA+ID4gPiBiZXNwb2tlIHN0cmluZyBwYXJzaW5nLgo+ID4gPgo+ID4gPiBWZXJzaW9u
aW5nIGFzaWRlLCBhbHRob3VnaCB0aGF0IHJlbW92ZXMgYSBsYXJnZSBwYXJ0IG9mIHRoZSBtb3Rp
dmF0aW9uLAo+ID4gPiB0aGUgaW50ZXJmYWNlIGJlY29tZXMgcXVpdGUgbmljZToKPiA+ID4gb2Zf
cHJvcGVydHlfcHJlc2VudChub2RlLCAicmlzY3YsaXNhLWV4dGVuc2lvbi16aWNib20iKQo+ID4K
PiA+IE15IGN1cnJlbnQgZmVlbGluZyBpcyB0aGF0LCByYXRoZXIgdGhhbiBpbnRyb2R1Y2luZyBh
IGtleS12YWx1ZSB0eXBlIG9mCj4gPiBwcm9wZXJ0eSwgYWRkaW5nIGJvb2xlYW4gcHJvcGVydGll
cyBmb3IgZXh0ZW5zaW9ucyBpcyB0aGUgd2F5IHRvIGdvCj4gPiBoZXJlLiBUaGUgInJpc2N2LGlz
YSIgcGFydCBvZiB0aGUgRFQgQUJJIHByZS1kYXRlcyBldmVuIHRoZSByYXRpZmljYXRpb24KPiA+
IG9mIHRoZSBiYXNlIGV4dGVuc2lvbnMgKGFuZCB0aHVzIHRoZSByZW1vdmFsIG9mIHNvbWUgZmVh
dHVyZXMuLi4pLgo+ID4gU3RhcnRpbmcgYWdhaW4gd2l0aCBhIG5ldyBwcm9wZXJ0eSB3b3VsZCBh
bGxvdyB1cyB0byBkZWZpbmUgZXh0ZW5zaW9ucwo+ID4gYXMgcGVyIHRoZWlyIHJhdGlmaWVkIHN0
YXRlLCByYXRoZXIgdGhhbiB0aGUgaW50ZXJtZWRpYXRlICYgaW5jb21wYXRpYmxlCj4gPiBzdGF0
ZXMgdGhhdCB3ZSBoYXZlIGN1cnJlbnRseSBnb3Qgd2l0aCAicmlzY3YsaXNhIi4KPiA+IFN1Y2gg
YSBtb2RlbCBkb2VzIHJlbHkgb24gdGhlIHN0cmVuZ3RoZW5pbmcgb2YgdGhlIHdvcmRpbmcgaW4g
dGhlCj4gPiBzcGVjaWZpY2F0aW9uLgo+IAo+IElTQSBzdHJpbmcgcGFyc2VkIGZvciBib3RoIERU
IGFuZCBBQ1BJLgo+IAo+IEZvciBBQ1BJLCBtb3ZpbmcgdG8gYSBwZXItZXh0ZW5zaW9uIGJpdCBp
biBhIGJpdG1hcCBhbmQgZGVmaW5pbmcKPiBhIG5ldyBiaXQgd2l0aCBldmVyeSBJU0EgZXh0ZW5z
aW9uIHdpbGwgYmUgdmVyeSB2ZXJ5IGluY29udmVuaWVudAo+IGZvciB1cGRhdGluZyB0aGUgQUNQ
SSBzcGVjcy4gV2Ugc2hvdWxkIGNvbnRpbnVlIHRoZSBJU0Egc3RyaW5nCj4gcGFyc2luZyBhdCBs
ZWFzdCBmb3IgQUNQSS4KPiAKPiBGb3IgRFQsIHVzZXJzIGNhbiBlaXRoZXIgdXNlICJyaXNjdixp
c2EiIERUIHByb3BlcnR5IG9yIHVzZSBib29sZWFuCj4gRFQgcHJvcGVydGllcy4KPiAKRnJvbSBB
Q1BJIHBlcnNwZWN0aXZlLCB0aGUgZm9ybWF0IGJldHRlciBiZSBiYWNrZWQgYnkgdW5wcml2IChv
ciBhbnkKb3RoZXIpIHNwZWMgZnJvbSBSVkkgY29uc2lkZXJpbmcgaXQgaXMgYSBzdGFuZGFyZCBh
Y3Jvc3MgT1NzIGFuZCB0bwphdm9pZCBhbnkgbWFpbnRlbmFuY2UgaXNzdWVzLgoKVGhhbmtzLApT
dW5pbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
