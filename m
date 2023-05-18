Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAEEC7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 14:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vcdatzmmXkP1sVRiW9qPcFtfiYsQHitl+aJ3F55JMEg=; b=Avz0mTp/UFzjV6pLNmp+6nnf0E
	zGHQJiMsMeD8osF/5AbjAK83jjX26UrmATVft8O6P0TOTVfQhRIN+4h5hCQbf0CSJHMs6+xHpv8Pv
	Q0m5l6/ZIAShBmKkaLohAn6LQm1RfZZhcFDErmYx9/opDafbtItZtfDvWsZPZSJZWhjoBe1bFoaym
	CJqO7ovkiUThrxk5vi4455yrzTd0v4D2WmO6qSPLoWfIQf+iSBgz4z+ZcRR9oR0rs5BmrdyCQgWnt
	F4/xGKGcsgImc62Zo6aDVmp1koIu3wWJUUVSo0qlKXm2jbiZPr79EppvswpG/ux3MERG3+S8ILsU3
	dX9Wje9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzeom-00DDQy-1W;
	Thu, 18 May 2023 14:41:24 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzeoi-00DDPW-35
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 14:41:23 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-534696e4e0aso677054a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 07:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1684420878; x=1687012878;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NW9LLhYTca2cJhIK8XTt/Nh6/suVOD01pOd44VESQ5c=;
        b=GdQCfpRE0SGkqI8Vw1uWDvMc/zSC6F72zrNhKYOwqVqPZV/RZMos7OTMzDYss7hYL8
         PfK5imLMaQkbv4WlOsl8BqmcScUPe2jfxZoms54uoW5xrOsXUPyG/zQbU/P90MQMaZOi
         rGlatnT1iW1m5JZ6/Vfrho2i2n91eRAqkhgCQ/Uonr6wYA8mYiKOhfS4Y1O/2kr/mKto
         YC+5Qz9hI+y9ZnYoo6/zqZPwqUEO9QYJcK+eBaXMb8ofHT4em+rF3f2SH0ARTkzeZ5B3
         vIRIqX2OlKm/djkHqAGmllJmSLXy59VJokCfXyOdTOf4epv65yuSWuXHxmf4p4lzsAEl
         P2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684420878; x=1687012878;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NW9LLhYTca2cJhIK8XTt/Nh6/suVOD01pOd44VESQ5c=;
        b=DSFPwjJoozC8wP64UoBFceZu5WU9rlFmQ2Bg6urnKesTJu6EaSSC8Y+/CVJ6FO0Vfo
         Okizz5BuFW8tTj7iGTisKGWDsSYbKTaDqBfyQYcOrccwfmpjGxQuuKeDZQ6opmaH5VKQ
         3r//lfkAKqzsOBZRHzZW2Tb2Qv6uR5h9NKb7B9r49t2ty83pKXD9O0/4+DU/XK7P8p6q
         fmkhnCQ8gb8HphRjOkVmF/bGJxmfdKqgrmJCDvz0hKGT462Fb6eVyb1qteg3DZC2rVe7
         IZVx3JxR/2hN7GxjvDyF1MuStMXvxULJhp5Fnre/DfdyJaoWy9O/9fUXN2Jdxyw2SRI/
         RE8g==
X-Gm-Message-State: AC+VfDzR7oyVSK4asAOlJbZvvhbKgk57Es/5zJZ1g0Ql+Cb2W4M6iJSm
	FtnjMkRyG4KEUDEjB3/LGUktaw==
X-Google-Smtp-Source: ACHHUZ6JxPhsiDataOovPdM7nE2IyeWvbCpA+HWBCPdSdabHeOsCxcgZRnCilCby2R6wCo4Qatxqpg==
X-Received: by 2002:a17:903:41c6:b0:1ac:482e:ed4d with SMTP id u6-20020a17090341c600b001ac482eed4dmr3743263ple.18.1684420877838;
        Thu, 18 May 2023 07:41:17 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id h5-20020a170902680500b001a245b49731sm1534690plk.128.2023.05.18.07.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 07:41:17 -0700 (PDT)
Date: Thu, 18 May 2023 07:41:17 -0700 (PDT)
X-Google-Original-Date: Thu, 18 May 2023 07:41:15 PDT (-0700)
Subject: Re: [PATCH v1] dt-bindings: riscv: deprecate riscv,isa
In-Reply-To: <20230518-hammock-doornail-478e8ea8e6a7@wendy>
CC: anup@brainfault.org, ajones@ventanamicro.com, Conor Dooley <conor@kernel.org>,
  Paul Walmsley <paul.walmsley@sifive.com>, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  Alistair Francis <Alistair.Francis@wdc.com>, apatel@ventanamicro.com, atishp@atishpatra.org, jrtc27@jrtc27.com,
  rick@andestech.com, ycliang@andestech.com, linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org,
  u-boot@lists.denx.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor.dooley@microchip.com>
Message-ID: <mhng-95b99ff5-9024-4672-bb84-7599f7a05129@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_074121_212871_5F044E73 
X-CRM114-Status: GOOD (  42.73  )
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

T24gVGh1LCAxOCBNYXkgMjAyMyAwNzowNjoxNyBQRFQgKC0wNzAwKSwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIFRodSwgTWF5IDE4LCAyMDIzIGF0IDA3OjEzOjE1UE0gKzA1MzAsIEFudXAgUGF0
ZWwgd3JvdGU6Cj4+IE9uIFRodSwgTWF5IDE4LCAyMDIzIGF0IDQ6MDLigK9QTSBBbmRyZXcgSm9u
ZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPj4gPiBPbiBUaHUsIE1heSAxOCwg
MjAyMyBhdCAwOTo1ODozMEFNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4KPj4gPiA+IC0g
IHJpc2N2LGlzYToKPj4gPiA+IC0gICAgZGVzY3JpcHRpb246Cj4+ID4gPiAtICAgICAgSWRlbnRp
ZmllcyB0aGUgc3BlY2lmaWMgUklTQy1WIGluc3RydWN0aW9uIHNldCBhcmNoaXRlY3R1cmUKPj4g
PiA+IC0gICAgICBzdXBwb3J0ZWQgYnkgdGhlIGhhcnQuICBUaGVzZSBhcmUgZG9jdW1lbnRlZCBp
biB0aGUgUklTQy1WCj4+ID4gPiAtICAgICAgVXNlci1MZXZlbCBJU0EgZG9jdW1lbnQsIGF2YWls
YWJsZSBmcm9tCj4+ID4gPiAtICAgICAgaHR0cHM6Ly9yaXNjdi5vcmcvc3BlY2lmaWNhdGlvbnMv
Cj4+ID4gPiAtCj4+ID4gPiAtICAgICAgRHVlIHRvIHJldmlzaW9ucyBvZiB0aGUgSVNBIHNwZWNp
ZmljYXRpb24sIHNvbWUgZGV2aWF0aW9ucwo+PiA+ID4gLSAgICAgIGhhdmUgYXJpc2VuIG92ZXIg
dGltZS4KPj4gPiA+IC0gICAgICBOb3RhYmx5LCByaXNjdixpc2Egd2FzIGRlZmluZWQgcHJpb3Ig
dG8gdGhlIGNyZWF0aW9uIG9mIHRoZQo+PiA+ID4gLSAgICAgIFppY3NyIGFuZCBaaWZlbmNlaSBl
eHRlbnNpb25zIGFuZCB0aHVzICJpIiBpbXBsaWVzCj4+ID4gPiAtICAgICAgInppY3NyX3ppZmVu
Y2VpIi4KPj4gPiA+IC0KPj4gPiA+IC0gICAgICBXaGlsZSB0aGUgaXNhIHN0cmluZ3MgaW4gSVNB
IHNwZWNpZmljYXRpb24gYXJlIGNhc2UKPj4gPiA+IC0gICAgICBpbnNlbnNpdGl2ZSwgbGV0dGVy
cyBpbiB0aGUgcmlzY3YsaXNhIHN0cmluZyBtdXN0IGJlIGFsbAo+PiA+ID4gLSAgICAgIGxvd2Vy
Y2FzZSB0byBzaW1wbGlmeSBwYXJzaW5nLgo+PiA+ID4gLSAgICAkcmVmOiAiL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvc3RyaW5nIgo+PiA+ID4gLSAgICBwYXR0ZXJuOiBecnYoPzo2
NHwzMilpbWFmP2Q/cT9jP2I/az9qP3A/dj9oPyg/Oltoc3h6XSg/OlthLXpdKSspPyg/Ol9baHN4
el0oPzpbYS16XSkrKSokCj4+ID4gPiAtCj4+ID4gPiAgICAjIFJJU0MtViByZXF1aXJlcyAndGlt
ZWJhc2UtZnJlcXVlbmN5JyBpbiAvY3B1cywgc28gZGlzYWxsb3cgaXQgaGVyZQo+PiA+ID4gICAg
dGltZWJhc2UtZnJlcXVlbmN5OiBmYWxzZQo+PiA+ID4KPj4gPiA+IEBAIC0xMzMsOCArMTE3LDEz
IEBAIHByb3BlcnRpZXM6Cj4+ID4gPiAgICAgICAgRE1JUFMvTUh6LCByZWxhdGl2ZSB0byBoaWdo
ZXN0IGNhcGFjaXR5LWRtaXBzLW1oego+PiA+ID4gICAgICAgIGluIHRoZSBzeXN0ZW0uCj4+ID4g
Pgo+PiA+ID4gK29uZU9mOgo+PiA+ID4gKyAgLSByZXF1aXJlZDoKPj4gPiA+ICsgICAgICAtIHJp
c2N2LGlzYQo+PiA+Cj4+ID4gVGhpcyBpcyB0aGUgcGFydCBBbnVwIGtlZXBzIHJlbWluZGluZyBt
ZSBhYm91dC4gV2UgY2FuIGNyZWF0ZSBiZXR0ZXIgd2F5cwo+PiA+IHRvIGhhbmRsZSBleHRlbnNp
b25zIGluIERUIGFuZCBBQ1BJLCBidXQgd2UnbGwgc3RpbGwgbmVlZCB0byBwYXJzZSBJU0EKPj4g
PiBzdHJpbmdzIHRvIGhhbmRsZSBsZWdhY3kgRFRzIGFuZCBob2xkb3V0cyB0aGF0IGtlZXAgY3Jl
YXRpbmcgSVNBIHN0cmluZ3MsCj4+ID4gYXQgbGVhc3QgZHVyaW5nIHRoZSBkZXByZWNhdGlvbiBw
ZXJpb2QsIHNpbmNlIElTQSBzdHJpbmdzIGFyZSBzdGlsbCAidGhlCj4+ID4gd2F5IHRvIGRvIGl0
IiBhY2NvcmRpbmcgdG8gdGhlIHNwZWMuCj4+IAo+PiBDb21pbmcgdXAgd2l0aCBhbiBhbHRlcm5h
dGUgd2F5IGluIERUIGlzIGZpbmUgYnV0IHdlIGNhbid0IGRlcHJlY2F0ZQo+PiBJU0Egc3RyaW5n
cyBzaW5jZSBJU0Egc3RyaW5ncyBhcmUgd2lkZWx5IHVzZWQ6Cj4+IDEpIFZhcmlvdXMgYm9vdGxv
YWRlcnMKPgo+IEF5ZSwgZm9yIHRoZSByZWFzb24sIGFzIEkgbWVudGlvbmVkIGVhcmxpZXIgYW5k
IGluIHRoZSBSRkMgdGhyZWFkLAo+IHJlbW92aW5nIGV4aXN0aW5nIHBhcnNlcnMgaXNuJ3QgYSBn
b29kIGlkZWEuCgpSZW1vdmluZyBhbmQgZGVwcmVjYXRpbmcgYXJlIGRpZmZlcmVudC4gIFdlIGNh
biBkZXByZWNhdGUgc3R1ZmYuCgo+PiAyKSBJdCBpcyBwYXJ0IG9mIC9wcm9jL2NwdWluZm8KPgo+
IFRoYXQgaXMgaXJyZWxldmFudC4KPgo+PiAzKSBIeXBlcnZpc29ycyB1c2UgaXQgdG8gY29tbXVu
aWNhdGUgSFcgZmVhdHVyZXMgdG8gR3Vlc3QvVk0uCj4+IEh5cGVydmlzb3JzIGNhbid0IGdldCBh
d2F5IGZyb20gZ2VuZXJhdGluZyBJU0Egc3RyaW5ncyBiZWNhdXNlCj4+IEh5cGVydmlzb3JzIGRv
bid0IGtub3cgd2hhdCBpcyBydW5uaW5nIGluc2lkZSBHdWVzdC9WTS4KPgo+IEdlbmVyYXRlIGJv
dGggOikgQXMgdGhpbmdzIHN0YW5kLCB5b3VyIGd1ZXN0cyBjb3VsZCBpbnRlcnByZXQgd2hhdCB5
b3UKPiBjb21tdW5pY2F0ZSB0byB0aGVtIHZpYSByaXNjdixpc2EgZGlmZmVyZW50bHkhCj4KPj4g
SW4gdGhlIGNhc2Ugb2YgQUNQSSwgaXQgaXMgYSB2ZXJ5IGRpZmZlcmVudCBzaXR1YXRpb24uIExp
a2UgU3VuaWwgbWVudGlvbmVkLAo+PiBBQ1BJIHdpbGwgYWx3YXlzIGZvbGxvdyBtZWNoYW5pc21z
IGRlZmluZWQgYnkgUlZJIChzdWNoIGFzIElTQSBzdHJpbmcpLgo+PiBPdGhlciBBQ1BJIGFwcHJv
YWNoZXMgc3VjaCBhcyBHVUlEIGZvciBJU0EgZXh0ZW5zaW9uIGFyZSBzaW1wbHkgbm90Cj4+IHNj
YWxhYmxlIGFuZCB3aWxsIHRha2UgYSBsb3QgbW9yZSBtZW1vcnkgZm9yIEFDUEkgdGFibGVzIGNv
bXBhcmVkIHRvCj4+IElTQSBzdHJpbmdzLgo+Cj4gTXkgcHJvcG9zYWwgc2hvdWxkIGFjdHVhbGx5
IHN1aXQgQUNQSSwgYXQgbGVhc3QgZm9yIExpbnV4LCBhcyBpdCB3b3VsZAo+IGJlIGEgY2hhbmNl
IHRvIGFsaWduIGN1cnJlbnRseSBtaXNhbGlnbmVkIGRlZmluaXRpb25zLiBJIHdvbid0IHNwZWFr
IHRvCj4gR1VJRHMgb3Igd2hhdGV2ZXIgYXMgdGhhdCdzIHNvbWVvbmUgZWxzZSdzIHByb2JsZW0g
OikKCldlIHRhbGtlZCBhIGJpdCBpbiB0aGUgcGF0Y2h3b3JrIG1lZXRpbmcgd2l0aCBEcmV3IGFi
b3V0IEFDUEkuICBBbnkgCmFjdHVhbCBzcGVjL2VuY29kaW5nIHdvdWxkIG5lZWQgdG8gYmUgZGlm
ZmVyZW50LCBvZiBjb3Vyc2UsIGJ1dCAKY29uY2VwdHVhbGx5IGl0IHNlZW1zIHRvIGZpdCBmaW5l
LiAgSXQncyBhbHNvIGJyb2FkbHkgc2ltaWxhciB0byB3aGF0IAp3ZSd2ZSBkb25lIHdpdGggcmlz
Y3ZfaHdwcm9iZSgpIGZvciB1c2Vyc3BhY2UsIHdoaWNoIGlzIG5pY2UuCgo+PiA+IEFsc28sIGlm
IHdlIGFzc3VtZSB0aGUgd29yZGluZyBpbiB0aGUgc3BlYyBkb2VzIGdldCBzaG9yZWQgdXAsIHRo
ZW4sCj4+ID4gdW5sZXNzIEknbSBtaXNzaW5nIHNvbWV0aGluZywgdGhlIGxpc3Qgb2YgYWR2YW50
YWdlcyBmb3IgdGhpcyBib29sZWFuCj4+ID4gcHJvcG9zYWwgZnJvbSB5b3VyIGNvbW1pdCBtZXNz
YWdlIHdvdWxkIGJlCj4+IAo+PiBJTU8sIHdlIHNob3VsZCB0cnkgb3VyIGJlc3QgdG8gaGF2ZSB0
aGUgd29yZGluZ3MgY2hhbmdlZCBpbiBSVkkgc3BlYy4KPgo+IFllcywgZG9pbmcgc28gaXMgYmVu
ZWZpY2lhbCBmb3IgYWxsIG9mIHVzIHJlZ2FyZGxlc3Mgb2Ygd2hhdCBoYXBwZW5zCj4gaGVyZS4g
SSBkbyB0aGluayB0aGF0IGl0IGlzIHBhcnRpYWxseSBvcnRob2dvbmFsIC0gaXQgYWxsb3dzIHVz
IHRvIG5vdAo+IGRlc2lnbiBhbiBpbnRlcmZhY2UgdGhhdCBuZWVkcyB0byBiZSBjYXBhYmxlIG9m
IGNvbW11bmljYXRpbmcgYSB3aWRlCj4gdmFyaWV0eSBvZiB2ZXJzaW9ucywgYnV0IEkgZG9uJ3Qg
dGhpbmsgaXQgc29sdmVzIHNvbWUgb2YgdGhlIGlzc3Vlcwo+IHRoYXQgcmlzY3YsaXNhIGhhcy4g
SWYgSSB0aG91Z2h0IGl0IGRpZCwgSSB3b3VsZCBub3QgaGF2ZSBnb25lIHRvIHRoZQo+IHRyb3Vi
bGUgb2YgcmVzcGlubmluZyB0aGlzIHBhdGNoIG91dCBvZiB0aGUgb3RoZXIgYXBwcm9hY2guCj4K
Pj4gPiAqIE1vcmUgY2hhcmFjdGVyIGNob2ljZXMgZm9yIG5hbWUgLS0gcHJvYmFibHkgbm90IGEg
aHVnZSBnYWluIGZvciByYXRpZmllZAo+PiA+ICAgZXh0ZW5zaW9ucywgc2luY2UgdGhlIGJvb2xl
YW4gcHJvcGVydGllcyB3aWxsIGxpa2VseSBzdGlsbCB1c2UgdGhlIHNhbWUKPj4gPiAgIG5hbWUg
YXMgdGhlIElTQSBzdHJpbmcgKHJpc2N2LGlzYS1leHRlbnNpb24tPG5hbWU+KS4gQnV0LCBmb3Ig
dmVuZG9yCj4+ID4gICBleHRlbnNpb25zLCB0aGlzIGlzIGluZGVlZCBhIG1ham9yIGltcHJvdmVt
ZW50LCBzaW5jZSB2ZW5kb3IgZXh0ZW5zaW9uCj4+ID4gICBib29sZWFuIHByb3BlcnR5IG5hbWVz
IG1heSBuZWVkIHRvIGJlIGV4dGVuZGVkIGluIHVuYW1iaWd1b3VzIHdheXMgdG8KPj4gPiAgIGhh
bmRsZSBjaGFuZ2VzIGluIHRoZSBleHRlbnNpb24uCj4+ID4KPj4gPiAqIFNpbXBsZXIsIG1vcmUg
Y29tcGxldGUgRFQgdmFsaWRhdGlvbiAoYnV0IHdlIHN0aWxsIG5lZWQgYSBiZXN0IGVmZm9ydAo+
PiA+ICAgZm9yIGxlZ2FjeSBJU0Egc3RyaW5ncykKPj4gPgo+PiA+ICogU2ltcGxlciBEVCBwYXJz
aW5nIChidXQgd2Ugc3RpbGwgbmVlZCB0aGUgY3VycmVudCBwYXJzZXIgZm9yIGxlZ2FjeSBJU0EK
Pj4gPiAgIHN0cmluZ3MpCj4+ID4KPj4gPiA+ICsgIC0gcmVxdWlyZWQ6Cj4+ID4gPiArICAgICAg
LSByaXNjdixpc2EtYmFzZQo+PiA+ID4gKwo+PiA+ID4gIHJlcXVpcmVkOgo+PiA+ID4gLSAgLSBy
aXNjdixpc2EKPj4gPiA+ICAgIC0gaW50ZXJydXB0LWNvbnRyb2xsZXIKPj4gPiA+Cj4+ID4gPiAg
YWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUKPj4gPiA+IEBAIC0xNzcsNyArMTY2LDEzIEBAIGV4
YW1wbGVzOgo+PiA+ID4gICAgICAgICAgICAgICAgICBpLXRsYi1zaXplID0gPDMyPjsKPj4gPiA+
ICAgICAgICAgICAgICAgICAgbW11LXR5cGUgPSAicmlzY3Ysc3YzOSI7Cj4+ID4gPiAgICAgICAg
ICAgICAgICAgIHJlZyA9IDwxPjsKPj4gPiA+IC0gICAgICAgICAgICAgICAgcmlzY3YsaXNhID0g
InJ2NjRpbWFmZGMiOwo+PiA+ID4gKyAgICAgICAgICAgICAgICByaXNjdixpc2EtYmFzZSA9ICJy
djY0aSI7Cj4+ID4gPiArICAgICAgICAgICAgICAgIHJpc2N2LGlzYS1leHRlbnNpb24taTsKPj4g
PiA+ICsgICAgICAgICAgICAgICAgcmlzY3YsaXNhLWV4dGVuc2lvbi1tOwo+PiA+ID4gKyAgICAg
ICAgICAgICAgICByaXNjdixpc2EtZXh0ZW5zaW9uLWE7Cj4+ID4gPiArICAgICAgICAgICAgICAg
IHJpc2N2LGlzYS1leHRlbnNpb24tZjsKPj4gPiA+ICsgICAgICAgICAgICAgICAgcmlzY3YsaXNh
LWV4dGVuc2lvbi1kOwo+PiA+ID4gKyAgICAgICAgICAgICAgICByaXNjdixpc2EtZXh0ZW5zaW9u
LWM7Cj4+IAo+PiBPbmUgZG93bnNpZGUgb2YgdGhpcyBuZXcgYXBwcm9hY2ggaXMgaXQgd2lsbCBp
bmNyZWFzZSB0aGUgc2l6ZSBvZiBEVEIuCj4+IEltYWdpbmcgNTAgc3VjaCBEVCBwcm9wZXJ0aWVz
IGluIDQ2IENQVSBEVCBub2Rlcy4KPgo+IEkgc2hvdWxkIGRvIGEgY29tcGFyaXNvbiBiZXR3ZWVu
IDUwIGV4dGVuc2lvbnMgaW4gcmlzY3YsaXNhIGFuZCBkb2luZwo+IHRoaXMgNTAgdGltZXMgYW5k
IHNlZSB3aGF0IHRoZSBzaXplcyBhcmUuCgpJJ20gbm90IHN1cmUgaG93IHNlbnNpdGl2ZSBwZW9w
bGUgYXJlIHRvIERUIHNpemUgKHByZXN1bWFibHkgaXQnZCBiZSBEVEIgCnNpemUpPwoKSXQncyBh
bHNvIG5vdCBjbGVhciB3aGF0IHdlIGNhbiBkbyBhYm91dCBpdDogUklTQy1WIGhhcyBsb3RzIG9m
IApleHRlbnNpb25zLCB0aGF0J3MgZ29pbmcgdG8gdGFrZSBlbmNvZGluZyBzcGFjZS4gIFN0aWNr
aW5nIHdpdGggYW4gCmFtYmlndW91cyBlbmNvZGluZyBiZWNhdXNlIGl0J3Mgc21hbGxlciBzZWVt
cyBsaWtlIGEgd2F5IHRvIGdldCAKYnVybmVkIGluIHRoZSBsb25nIHJ1bi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
