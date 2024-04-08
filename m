Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547D8CD128A
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Apr 2024 06:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ulKUMpNgnjr81AWAa1G8OdVi3iwEykIpPBNF5/IMzU8=; b=JSH1defPnGlkPz
	CZ6+H3BBstHtI6YxlR5tnHzLMq5JTL/9Xphq9V1zZ9kquvBugLv36nZ8zGHG1dtH/VF1Y2tNME2y4
	AbfTd/+OBE5C4xmDQhNhFsUjLzhhSkJMTHg+dZ8sM4zin5Z3auD7QNEG9p6PnMrC1XTHcp9ZNobbI
	/kHeBp2OREtX6YJpM1FDTyXXAzRHQo2XE11LedmOwkmJh1PUh1i1cS3Vwfu5XP80WDMdenPkXdezw
	cgVacAsau4I9pLdfkE3/ZBN9xrsMm7dEl7o5ahw1a+Kpjoppe93WEECufwtYD4JQGnz7P41DLndDv
	6NIME4Whj04EbUBGLKww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rti3Q-0000000ESHn-2zo8;
	Mon, 08 Apr 2024 06:00:28 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rti3N-0000000ESG7-44h1
	for linux-riscv@lists.infradead.org;
	Mon, 08 Apr 2024 06:00:27 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-29f69710cbbso2749083a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 07 Apr 2024 23:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1712556024; x=1713160824; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDgfpTq5s9r9RpWn74/DEZBPgxC4XB+NI8yofmrMjU0=;
        b=k9sOu6mkH9kHgZH6IWPq9RRV9n3osSFIEkdjtAuMbytTMzwqtKFl55JkWLzXs3tYFt
         8uHfdM1Djo1nkLEIYZGvAfYdE02Sc7PjAE0dj+Of+cENBcg0wFbejOj5tHwJkO2KETvQ
         GeM1VBnkaFr62g/3+8I6Hzk6aNopA8feBLMs47oV3qdXJFKeF5iwwRNq4abfHKbleNnV
         poQUDgG3EQ86baiDr26IRjHJtpWHKLxWcuyCEa15Mc8hNqb7Ge5TpsJxDAsCf4spIGPF
         Ws61Hgmt6SWYwG5L4CiqQPN3e14zcxhNisR4n3auAFEWeTpPTs+SLSAlnOc0yZweBO9z
         h9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712556024; x=1713160824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDgfpTq5s9r9RpWn74/DEZBPgxC4XB+NI8yofmrMjU0=;
        b=tGm9AYqqXA36Mgp77+4jwopAB66H2SKQ09lNuvXCy1pRAWmq5rdBwAj7nq91p1s/n9
         QzdD/KLhLbXZFQsgipZkFH2O8Rfy8DajkCFVcGTf/bh8iR6ocetKMk2h+egC1lbXbono
         NUg5S3cN27V/y37EGjiZuhrGB9cdRNuXCyrXOh4nJk4ESh3Ek86dKsf3LHvTWP22wQzk
         LyeapLpA/sTdPVsTrZVMfX7XexEhJc9UZiis77WI+i+lw/jYFN2Qg8FhFsbGDGjC8FrR
         SkKwe3Grzq/jFX1Tj7YdzbR0b0yjJgG1sYIKJnvI1fDJVzccEzORJUf5zKKkPys15p+e
         F0hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP5SB+jeeVgmbGpVf4cUx4VfLeO6lzhOSCA+xvqlIiP+cfZobA/YCp+mHpmpAvZDpg0OqQ3/QPzDDt0DtmjygOaU0V/J8p7jivNcXzArft
X-Gm-Message-State: AOJu0YzFMY/8cSXvjl7D3hHP/Q8Brvvo7PoPf4GeKssy3J+RyjvqpuLz
	Wtr6nYDj7Bdj0mIonKcYQCjy0QIiABsnwcU3ps80t/r4xlsi83cEzZ5eXWgVJE9U17BwpYnuck0
	V01IoPU2u7Tm8Dph5OCclXnT+hztPUQYykSU8sA==
X-Google-Smtp-Source: AGHT+IHE9wZLzBEa3V0DyC4Aa6bZVPs3tj6YPvkoeL6bgvpCgMykM2NVNxVSXPCQ5kmB+MqIqYs5893dhAgN9VZpO2o=
X-Received: by 2002:a17:90a:3906:b0:2a0:7895:f356 with SMTP id
 y6-20020a17090a390600b002a07895f356mr11906656pjb.12.1712556023817; Sun, 07
 Apr 2024 23:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240407213236.2121592-3-christoph.muellner@vrull.eu> <tencent_CF232CDF85208DF6BFA3076E73CC4E087306@qq.com>
In-Reply-To: <tencent_CF232CDF85208DF6BFA3076E73CC4E087306@qq.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Mon, 8 Apr 2024 08:00:12 +0200
Message-ID: <CAEg0e7h0F_LaeMoS6Co1UjgLM6ML8SXtTfHW5+OQS6yedjdZPQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] riscv: T-Head: Test availability bit before
 enabling MAE errata
To: Yangyu Chen <cyy@cyyself.name>
Cc: ajones@ventanamicro.com, alex@ghiti.fr, alistair.francis@wdc.com, 
	aou@eecs.berkeley.edu, bjorn@kernel.org, conor.dooley@microchip.com, 
	conor@kernel.org, cooper.qu@linux.alibaba.com, dbarboza@ventanamicro.com, 
	dqfext@gmail.com, eric.huang@linux.alibaba.com, heiko@sntech.de, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, philipp.tomsich@vrull.eu, 
	samuel.holland@sifive.com, zhiwei_liu@linux.alibaba.com, guoren@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_230026_076174_94DD9CC8 
X-CRM114-Status: GOOD (  36.81  )
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

T24gTW9uLCBBcHIgOCwgMjAyNCBhdCAzOjU44oCvQU0gWWFuZ3l1IENoZW4gPGN5eUBjeXlzZWxm
Lm5hbWU+IHdyb3RlOgo+Cj4gT24gMjAyNC80LzggMDU6MzIsIENocmlzdG9waCBNw7xsbG5lciB3
cm90ZToKPiA+IFQtSGVhZCdzIG1lbW9yeSBhdHRyaWJ1dGUgZXh0ZW5zaW9uIChYVGhlYWRNYWUp
IChub24tY29tcGF0aWJsZQo+ID4gZXF1aXZhbGVudCBvZiBSVkkncyBTdnBibXQpIGlzIGN1cnJl
bnRseSBhc3N1bWVkIGZvciBhbGwgVC1IZWFkIGhhcnRzLgo+ID4gSG93ZXZlciwgUUVNVSByZWNl
bnRseSBkZWNpZGVkIHRvIGRyb3AgYWNjZXB0YW5jZSBvZiBndWVzdHMgdGhhdCB3cml0ZQo+ID4g
cmVzZXJ2ZWQgYml0cyBpbiBQVEVzLgo+ID4gQXMgWFRoZWFkTWFlIHVzZXMgcmVzZXJ2ZWQgYml0
cyBpbiBQVEVzIGFuZCBMaW51eCBhcHBsaWVzIHRoZSBNQUUgZXJyYXRhCj4gPiBmb3IgYWxsIFQt
SGVhZCBoYXJ0cywgdGhpcyBicm9rZSB0aGUgTGludXggc3RhcnR1cCBvbiBRRU1VIGVtdWxhdGlv
bnMKPiA+IG9mIHRoZSBDOTA2IGVtdWxhdGlvbi4KPiA+Cj4gPiBUaGlzIHBhdGNoIGF0dGVtcHRz
IHRvIGFkZHJlc3MgdGhpcyBpc3N1ZSBieSB0ZXN0aW5nIHRoZSBNQUUtZW5hYmxlIGJpdAo+ID4g
aW4gdGhlIHRoLnN4c3RhdHVzIENTUi4gVGhpcyBDU1IgaXMgYXZhaWxhYmxlIGluIEhXIGFuZCBj
YW4gYmUKPiA+IGVtdWxhdGVkIGluIFFFTVUuCj4gPgo+ID4gVGhpcyBwYXRjaCBhbHNvIG1ha2Vz
IHRoZSBYVGhlYWRNYWUgcHJvYmluZyBtZWNoYW5pc20gcmVsaWFibGUsIGJlY2F1c2UKPiA+IGEg
dGVzdCBmb3IgdGhlIHJpZ2h0IGNvbWJpbmF0aW9uIG9mIG12ZW5kb3JpZCwgbWFyY2hpZCwgYW5k
IG1pbXBpZAo+ID4gaXMgbm90IHN1ZmZpY2llbnQgdG8gZW5hYmxlIE1BRS4KPiA+Cj4gPiBSZXZp
ZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiA+IFNp
Z25lZC1vZmYtYnk6IENocmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11ZWxsbmVyQHZydWxs
LmV1Pgo+ID4gLS0tCj4gPiAgIGFyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jIHwgMTQg
KysrKysrKysrKy0tLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvZXJyYXRhL3RoZWFk
L2VycmF0YS5jIGIvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMKPiA+IGluZGV4IDZl
N2VlMWYxNmJlZS4uYmY2YTBhNjMxOGVlIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9lcnJh
dGEvdGhlYWQvZXJyYXRhLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0
YS5jCj4gPiBAQCAtMTksNiArMTksOSBAQAo+ID4gICAjaW5jbHVkZSA8YXNtL3BhdGNoLmg+Zgo+
ID4gICAjaW5jbHVkZSA8YXNtL3ZlbmRvcmlkX2xpc3QuaD4KPiA+Cj4gPiArI2RlZmluZSBDU1Jf
VEhfU1hTVEFUVVMgICAgICAgICAgICAgIDB4NWMwCj4gPiArI2RlZmluZSBTWFNUQVRVU19NQUVF
ICAgICAgICAgICAgICAgIF9BQygweDIwMDAwMCwgVUwpCj4gPiArCj4gPiAgIHN0YXRpYyBib29s
IGVycmF0YV9wcm9iZV9tYWUodW5zaWduZWQgaW50IHN0YWdlLAo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhcmNoX2lkLCB1bnNpZ25lZCBsb25nIGltcGlkKQo+
ID4gICB7Cj4gPiBAQCAtMjgsMTEgKzMxLDE0IEBAIHN0YXRpYyBib29sIGVycmF0YV9wcm9iZV9t
YWUodW5zaWduZWQgaW50IHN0YWdlLAo+ID4gICAgICAgaWYgKGFyY2hfaWQgIT0gMCB8fCBpbXBp
ZCAhPSAwKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPgo+Cj4gSSB3b3VsZCBy
YWlzZSBhIGxpdHRsZSBjb25jZXJuIGFib3V0IGtlZXBpbmcgdGhpcyAiaWYiIHN0YXRlbWVudCBm
b3IKPiBhcmNoX2lkIGFuZCBpbXBfaWQgYWZ0ZXIgd2UgaGF2ZSBwcm9iZWQgaXQgaW4gdGhpcyBD
U1Igd2F5LiBJIHdvdWxkIGxpa2UgdG8KPiByZW1vdmUgaXQgYW5kIG1vdmUgdGhlIENTUiBwcm9i
ZSBlYXJsaWVyIHRoYW4gUklTQ1ZfQUxURVJOQVRJVkVTLgo+Cj4gSSBhZGRlZCBDQyB0byBndW9y
ZW4gZm9yIG1vcmUgb3BpbmlvbnMuCj4KPiBFdmVuIFQtSGVhZCBDOTA4IGNvbWVzIGluIDIwMjMs
IHdoaWNoIHN1cHBvcnRzIFJWViAxLjAgYW5kIGFsc28ga2VlcHMgTUFFRS4KPiBCdXQgaXQgYWxz
byBzdXBwb3J0cyBTdnBibXQsIGFuZCB3ZSBjYW4gcGVyZm9ybSB0aGUgc3dpdGNoIGJ5IGNsZWFy
aW5nIHRoZQo+IE1BRUUgYml0IGluIENTUl9USF9NWFNUQVRVUyBpbiBNLU1vZGUgU29mdHdhcmUu
Cj4KPiBNb3Jlb3ZlciwgVC1IZWFkIE1BRUUgbWF5IG5vdCBiZSByZW1vdmVkIGluIHRoZSBmdXR1
cmUgb2YgVC1IZWFkIENQVXMuIFdlCj4gY2FuIHNlZSBzb21ldGhpbmcgZnJvbSB0aGUgVC1IZWFk
IEM5MDggVXNlciBNYW51YWwgdGhhdCBhZGRzIGEgU2VjdXJpdHkgYml0Cj4gdG8gTUFFRS4gU28s
IGl0IG1pZ2h0IHVzZWQgaW4gdGhlaXIgb3duIFRFRSBpbXBsZW1lbnRhdGlvbiBhbmQgd2lsbCBu
b3QgYmUKPiByZW1vdmVkLgo+Cj4gSG93ZXZlciwgQzkwOCBoYXMgYXJjaF9pZCBhbmQgaW1waWQs
IHdoaWNoIGFyZSBub3QgZXF1YWwgdG8gemVyby4gWW91IGNhbgo+IHNlZSBpdCBmcm9tIHRoZSBD
OTA4IGJvb3QgbG9nIFsyXSBmcm9tIG15IHBhdGNoIHRvIHN1cHBvcnQgSzIzMCBbM10uIFNvLCBp
Zgo+IHdlIGhhdmUgcHJvYmVkIE1BRUUgdXNpbmcgQ1NSLCB5b3UgY29uZmlybWVkIHRoYXQgdGhp
cyBiaXQgd2lsbCBhbHNvIGJlIHNldAo+IGluIHRoZSBDOTA2IGNvcmUuIFdlIGNhbiBvbmx5IHBy
b2JlIGl0IHRoaXMgd2F5IGFuZCBubyBsb25nZXIgdXNlIGFyY2hfaWQKPiBhbmQgaW1wX2lkLiBB
bmQgaWYgdGhlIGFyY2hfaWQgYW5kIGltcF9pZCBwcm9iZXMgZ2V0IHJlbW92ZWQsIHdlIHNob3Vs
ZAo+IGFsc28gbW92ZSB0aGUgY3NyIHByb2JlIGVhcmxpZXIgdGhhbiByaXNjdiBhbHRlcm5hdGl2
ZXMuCgpXZSBrZWVwIHRoZSBwcm9iaW5nIHZpYSBhcmNoX2lkPT0wJiZpbXBpZD09MCBiZWNhdXNl
IHdlIGhhZCB0aGF0CmFscmVhZHkgaW4gdGhlIGtlcm5lbCBhbmQgZG9uJ3Qgd2FudCB0byBicmVh
ayBleGlzdGluZyBmdW5jdGlvbmFsaXR5LgoKRnJvbSB0aGUgZGlzY3Vzc2lvbnMgdGhhdCB3ZSBo
YWQgYWJvdXQgdGhlIHYxIGFuZCB2MiBvZiB0aGlzIHNlcmllcywKbXkgaW1wcmVzc2lvbiBpcyB0
aGF0IHdlIHNob3VsZCB1c2UgRFQgcHJvcGVydGllcyBpbnN0ZWFkIG9mIHByb2JpbmcKYXJjaF9p
ZCBhbmQgaW1waWQuIFNvLCBpZiBDOTA4IHN1cHBvcnQgaXMgbmVlZGVkLCB0aGlzIHNob3VsZCBw
cm9iYWJseQpiZSBpbnRyb2R1Y2VkIHVzaW5nIERUIHByb3BlcnRpZXMuIFRoZSBsb2dpYyB3b3Vs
ZCB0aGVuIGJlOgoqIGlmIGFyY2hfaWQgPT0gMCBhbmQgaW1waWQgPT0gMCB0aGVuIGRlY2lkZSBi
YXNlZCBvbiB0aC5zeHN0YXR1cy5NQUVFCiogZWxzZSB0ZXN0IGlmICJ4dGhlYWRtYWUiIGlzIGlu
IHRoZSBEVAoKCgoKPgo+IFsxXSBodHRwczovL29jYy1pbnRsLXByb2Qub3NzLWFwLXNvdXRoZWFz
dC0xLmFsaXl1bmNzLmNvbS9yZXNvdXJjZS8vMTY5OTI2ODM2OTM0Ny9YdWFuVGllLUM5MDgtVXNl
ck1hbnVhbC5wZGYKPiBbMl0gaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vY3l5c2VsZi9iOTQ0NWYz
OGNjM2JhMTA5NDkyNGJkNDFjOTA4NjE3Ngo+IFszXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1yaXNjdi90ZW5jZW50X0QxMTgwNTQxQjRCMzFDMDM3MURCNjM0QTQyNjgxQTVCRjgwOUBx
cS5jb20vCj4KPiBUaGFua3MsCj4gWWFuZ3l1IENoZW4KPgo+ID4gLSAgICAgaWYgKHN0YWdlID09
IFJJU0NWX0FMVEVSTkFUSVZFU19FQVJMWV9CT09UIHx8Cj4gPiAtICAgICAgICAgc3RhZ2UgPT0g
UklTQ1ZfQUxURVJOQVRJVkVTX01PRFVMRSkKPiA+IC0gICAgICAgICAgICAgcmV0dXJuIHRydWU7
Cj4gPiArICAgICBpZiAoc3RhZ2UgIT0gUklTQ1ZfQUxURVJOQVRJVkVTX0VBUkxZX0JPT1QgJiYK
PiA+ICsgICAgICAgICBzdGFnZSAhPSBSSVNDVl9BTFRFUk5BVElWRVNfTU9EVUxFKQo+ID4gKyAg
ICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPgo+ID4gLSAgICAgcmV0dXJuIGZhbHNlOwo+ID4g
KyAgICAgaWYgKCEoY3NyX3JlYWQoQ1NSX1RIX1NYU1RBVFVTKSAmIFNYU1RBVFVTX01BRUUpKQo+
ID4gKyAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiArCj4gPiArICAgICByZXR1cm4gdHJ1
ZTsKPiA+ICAgfQo+ID4KPiA+ICAgLyoKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
