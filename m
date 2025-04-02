Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E585EC28B20
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Apr 2025 12:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3+gyxI6TMWzIuUOas0y/zWH5yHdlcB+IVXRGYDdXavc=; b=vp2VeIfAPA68Rd
	fFDRXmad/RxznF2f+o2jo27e3AYcOpblA103Dx6URn3ZK5sw07YPPKvutNeh8G8kPeMqBaMDaVFvU
	VcuZil19WwgvifI68eRnIyynKAMXJSzK+0xkpWAfrZDZOx+KfOV61VBSO8TOnye1AYcLEX4ysG7MC
	Rt/JBlgcMKTk+nOjNLL9bmZAzRgN85B80qrWauXTqIYYIiZpRFvheFC3mUvx/uFcnG3XccOF3YrF8
	Snr8xusJgi0lusApE5BKmbn7e0AUVdzA5uuX+5DWWaHF7eWTOyLcJueAXarsHxRexZMRaD0xThyKZ
	iFIL072vDXfn14+SBeNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwmJ-000000060QU-2pjG;
	Wed, 02 Apr 2025 12:01:07 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwk9-00000005zmH-3Ltq
	for linux-riscv@lists.infradead.org;
	Wed, 02 Apr 2025 11:58:54 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-303a66af07eso9034515a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Apr 2025 04:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1743595130; x=1744199930; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpOpISsK92nzP8u+mrCrBVvlHehBgWb2S+ejZtPgHRk=;
        b=bWv2alJ9i/Ua81HZ9WkT/3NvJKnBWxIilBY8FTVZoT4Dpai8zk9q62V3lm59mf9M3H
         78DjmkV/IzIZNM0zIsPFgZkAnee4DdW5Xs8dtoOH6ZtVpL91xD9NgaZYfCUz92Hkpg7D
         QvZJ1jEXlOgrIezFovAPk9GltYmPojRuU8zOgMT1pPKiAXi1wE1aK2WC2oD5LASKFILh
         gw+59B063FWGbGwNmjwFDDLw/CR8vYH6Fw+vdbG6mHSJBiwwTYBwLtSkcvziwDkEba0x
         29EEwO/TDnWqX6qW4AywZWfgKEDgQHeJuJHCVQeEIaN8w/otFQ67DkAJyYEasGGfuZmV
         /vyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743595130; x=1744199930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpOpISsK92nzP8u+mrCrBVvlHehBgWb2S+ejZtPgHRk=;
        b=NkgGU51d+L35LtTvOObpQ3o4Fvj52p/auGd3KN+ZNqCUji0afsACxPpqeCFHzHkfjp
         KirKkrS7UwrlGhWNKvYh1pkvDjrZbFQ7TVgIinQkUoLIOvL9mU+P2nNH4G9i0fGEvrRs
         zsCwFi5LxrIE4XIwqpr8cyTtTdY94co2kLSBPqscvrNicImLCBulx8ipchgxOktEJsHU
         DLSaPQejN5IRtaI1yssFmuA/759vuHhNqjO2cvDi+BJJdY4QHLs4p80Juoi/KEDoTEuy
         Ijh8GpwUXIoTA3PZRsDaW2PzE5J3PPFwanH78TjYqwY0sWVM1iGtY6soFQCy0qrBuo/4
         zVvg==
X-Forwarded-Encrypted: i=1; AJvYcCXKsG5HYHoBFSohW/IbiDS3i4fCV2BA25MdZ0v3qshlsPpQaopewRuxs9piUtBHun5NS7J5Abk/FcWPAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbaXd+w34DM+dqvJwBiqkc9aZQxWDRpHewLXX2DW5Nz25UkrHu
	83t936mcB2rUJm+Ik3tBgKa1/gpt9TTXJecoP2PafQMt6qiY1CNJZgHLNqjMpXmBGWLxSWNifRQ
	rg4X3XFHemq8ETHwHokQTZpC4P/8Hz9V3g/Q2R5eI7MUpyvxww6ca5w==
X-Gm-Gg: ASbGncuds6L6YJbr3eMLI3KCXFU7tnXoS3CD7sqXDtR7VQiiry+u/focCnQ64rP6TWl
	lSMmRBrKftfcuBQfQ1ccDwEglHMdcvrTtosCTjvYGnXtCOmI9jVze3jEhyUSRkfRrXrnbeJDQIu
	56J8RXDGYX9oVdaR9JVzvRNs1ozxZ6Pi/+dMXxcMc=
X-Google-Smtp-Source: AGHT+IF3cEFgXzdw0KASyYJbIgo8CjfwnxgRulQ8O3ZcGZVY1greNWnfIf6SArRocnrBaky8kBjQ3GFF0cDB7r4EhsM=
X-Received: by 2002:a17:90b:2711:b0:2ee:aed2:c15c with SMTP id
 98e67ed59e1d1-3056ef08027mr3048369a91.28.1743595129770; Wed, 02 Apr 2025
 04:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250325144252.27403-1-luxu.kernel@bytedance.com> <8cfe938f-5eff-483e-95a1-c4029993e287@arm.com>
In-Reply-To: <8cfe938f-5eff-483e-95a1-c4029993e287@arm.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Wed, 2 Apr 2025 19:58:38 +0800
X-Gm-Features: AQ5f1JrCmdbPvgxjXXBONrqT24lyujGReyf184CCKAQbeGFTcfNc41gd0CSYnb8
Message-ID: <CAPYmKFv_qRmsR+4s3evxCJjzVavtNb6UFRX6+JmepUW23X=ZLg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] iommu: riscv: Split 8-byte accesses on 32
 bit I/O bus platform
To: Robin Murphy <robin.murphy@arm.com>
Cc: tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org, alex@ghiti.fr, 
	lihangjing@bytedance.com, xieyongji@bytedance.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_045853_872488_2279E107 
X-CRM114-Status: GOOD (  27.89  )
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

SGkgUm9iaW4gYW5kIEphc29uLAoKVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzIGFuZCBzb3JyeSBm
b3IgdGhlIGxhdGUgcmVwbHkuCgpUaGUgaW9ocG1jeWNsZXMgcmVnaXN0ZXIgaXMgaGFuZGxlZCBz
cGVjaWFsbHkgYmVjYXVzZSB1bmxpa2UgdGhlIG90aGVyCklPTU1VIHJlZ2lzdGVycywgaXRzIGVm
ZmVjdGl2ZSBiaXRzIGxpZXMgaW4gdGhlIHVwcGVyIGhhbGYuIEkgd2FudCB0bwplbnN1cmUgdGhh
dCBhbGwgZWZmZWN0aXZlIGJpdHMgYXJlIHRoZSBsYXN0IG9uZXMgdG8gdXBkYXRlLiBGb3IKZXhh
bXBsZSwgd2hlbiB1cGRhdGluZyBERFRQIHJlZ2lzdGVyLCB3ZSB1cGRhdGUgdGhlIHVwcGVyIGhh
bGYgZmlyc3QKd2hpY2ggb25seSBjb250YWlucyBpdHMgdGFibGUgUFBOLCBhbmQgdGhlbiB1cGRh
dGUgaXRzIGxvd2VyIGhhbGYKd2hpY2ggY29udGFpbnMgdGhlIE1PREUgYml0cyB3aGljaCByZWFs
bHkgZW5hYmxlIHRyYW5zbGF0aW9uLiBUaGUgbWFpbgpyZWFzb24gaXMgdGhhdCB3aGVuIHNvZnR3
YXJlIHNwbGl0cyBhbiA4LWJ5dGUgd3JpdGUgdG8gdHdvIDQtYnl0ZQp3cml0ZXMsIHRoZSBoYXJk
d2FyZSBpcyBub3QgYXdhcmUgd2hldGhlciBpdCBpcyBhbiA4LWJ5dGUgd3JpdGUgb3IgYQo0LWJ5
dGUgd3JpdGUgd2hlbiBpdCByZWNlaXZlcyB0aGUgZmlyc3Qgd3JpdGUuIFRodXMgaXQgd2lsbCBh
bHdheXMKbWFrZSB0aGUgdmFsdWUgZWZmZWN0aXZlIGV2ZXJ5IHRpbWUgaXQgcmVjZWl2ZXMgYSA0
LWJ5dGUgd3JpdGUuCgpPbiBXZWQsIEFwciAyLCAyMDI1IGF0IDc6MjnigK9QTSBSb2JpbiBNdXJw
aHkgPHJvYmluLm11cnBoeUBhcm0uY29tPiB3cm90ZToKPgo+IE9uIDIwMjUtMDMtMjUgMjo0MiBw
bSwgWHUgTHUgd3JvdGU6Cj4gPiBJbnRyb2R1Y2UgYSBuZXcgY29uZmlndXJhdGlvbiBDT05GSUdf
UklTQ1ZfSU9NTVVfMzJCSVQgdG8gZW5hYmxlCj4gPiBzcGxpdHRpbmcgOC1ieXRlIGFjY2VzcyBp
bnRvIDQtYnl0ZSB0cmFuc2FjdGlvbnMgZm9yIGhhcmR3YXJlIHBsYXRmb3JtCj4gPiB3aG9zZSBJ
L08gYnVzIGxpbWl0cyBhY2Nlc3MgdG8gNC1ieXRlIHRyYW5zZmVycy4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4KPiA+IC0tLQo+ID4gICBk
cml2ZXJzL2lvbW11L3Jpc2N2L0tjb25maWcgfCAgOSArKysrKysrKysKPiA+ICAgZHJpdmVycy9p
b21tdS9yaXNjdi9pb21tdS5oIHwgMjggKysrKysrKysrKysrKysrKysrKysrKystLS0tLQo+ID4g
ICAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvS2NvbmZpZyBiL2RyaXZlcnMvaW9t
bXUvcmlzY3YvS2NvbmZpZwo+ID4gaW5kZXggYzA3MTgxNmY1OWE2Li5iN2M5ZWEyMmQ5NjkgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2lvbW11L3Jpc2N2L0tjb25maWcKPiA+ICsrKyBiL2RyaXZl
cnMvaW9tbXUvcmlzY3YvS2NvbmZpZwo+ID4gQEAgLTE4LDMgKzE4LDEyIEBAIGNvbmZpZyBSSVND
Vl9JT01NVV9QQ0kKPiA+ICAgICAgIGRlZl9ib29sIHkgaWYgUklTQ1ZfSU9NTVUgJiYgUENJX01T
SQo+ID4gICAgICAgaGVscAo+ID4gICAgICAgICBTdXBwb3J0IGZvciB0aGUgUENJZSBpbXBsZW1l
bnRhdGlvbiBvZiBSSVNDLVYgSU9NTVUgYXJjaGl0ZWN0dXJlLgo+ID4gKwo+ID4gK2NvbmZpZyBS
SVNDVl9JT01NVV8zMkJJVAo+ID4gKyAgICAgYm9vbCAiU3VwcG9ydCA0LUJ5dGUgQWNjZXNzZXMg
b24gUklTQy1WIElPTU1VIFJlZ2lzdGVycyIKPiA+ICsgICAgIGRlcGVuZHMgb24gUklTQ1ZfSU9N
TVUKPiA+ICsgICAgIGRlZmF1bHQgbgo+ID4gKyAgICAgaGVscAo+ID4gKyAgICAgICBTdXBwb3J0
IGhhcmR3YXJlIHBsYXRmb3JtIHdob3NlIEkvTyBidXMgbGltaXRzIGFjY2VzcyB0byA0LWJ5dGUK
PiA+ICsgICAgICAgdHJhbnNmZXJzLiBXaGVuIGVuYWJsZWQsIGFsbCBhY2Nlc3NlcyB0byBJT01N
VSByZWdpc3RlcnMgd2lsbCBiZQo+ID4gKyAgICAgICBzcGxpdCBpbnRvIDQtYnl0ZSBhY2Nlc3Nl
cy4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmggYi9kcml2ZXJz
L2lvbW11L3Jpc2N2L2lvbW11LmgKPiA+IGluZGV4IDQ2ZGY3OWRkNTQ5NS4uMGUzNTUyYTgxNDJk
IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5oCj4gPiArKysgYi9k
cml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmgKPiA+IEBAIC0xNCw2ICsxNCwxMCBAQAo+ID4gICAj
aW5jbHVkZSA8bGludXgvaW9tbXUuaD4KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4g
PiAgICNpbmNsdWRlIDxsaW51eC9pb3BvbGwuaD4KPiA+ICsjaWZkZWYgQ09ORklHX1JJU0NWX0lP
TU1VXzMyQklUCj4gPiArI2luY2x1ZGUgPGxpbnV4L2lvLTY0LW5vbmF0b21pYy1oaS1sby5oPgo+
ID4gKyNpbmNsdWRlIDxsaW51eC9pby02NC1ub25hdG9taWMtbG8taGkuaD4KPiA+ICsjZW5kaWYK
PiA+Cj4gPiAgICNpbmNsdWRlICJpb21tdS1iaXRzLmgiCj4gPgo+ID4gQEAgLTY5LDIxICs3Mywz
NSBAQCB2b2lkIHJpc2N2X2lvbW11X2Rpc2FibGUoc3RydWN0IHJpc2N2X2lvbW11X2RldmljZSAq
aW9tbXUpOwo+ID4gICAjZGVmaW5lIHJpc2N2X2lvbW11X3JlYWRsKGlvbW11LCBhZGRyKSBcCj4g
PiAgICAgICByZWFkbF9yZWxheGVkKChpb21tdSktPnJlZyArIChhZGRyKSkKPiA+Cj4gPiAtI2Rl
ZmluZSByaXNjdl9pb21tdV9yZWFkcShpb21tdSwgYWRkcikgXAo+ID4gLSAgICAgcmVhZHFfcmVs
YXhlZCgoaW9tbXUpLT5yZWcgKyAoYWRkcikpCj4gPiAtCj4gPiAgICNkZWZpbmUgcmlzY3ZfaW9t
bXVfd3JpdGVsKGlvbW11LCBhZGRyLCB2YWwpIFwKPiA+ICAgICAgIHdyaXRlbF9yZWxheGVkKCh2
YWwpLCAoaW9tbXUpLT5yZWcgKyAoYWRkcikpCj4gPgo+ID4gKyNkZWZpbmUgcmlzY3ZfaW9tbXVf
cmVhZGxfdGltZW91dChpb21tdSwgYWRkciwgdmFsLCBjb25kLCBkZWxheV91cywgdGltZW91dF91
cykgXAo+ID4gKyAgICAgcmVhZHhfcG9sbF90aW1lb3V0KHJlYWRsX3JlbGF4ZWQsIChpb21tdSkt
PnJlZyArIChhZGRyKSwgdmFsLCBjb25kLCBcCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ZGVsYXlfdXMsIHRpbWVvdXRfdXMpCj4gPiArCj4gPiArI2lmbmRlZiBDT05GSUdfUklTQ1ZfSU9N
TVVfMzJCSVQKPiA+ICsjZGVmaW5lIHJpc2N2X2lvbW11X3JlYWRxKGlvbW11LCBhZGRyKSBcCj4g
PiArICAgICByZWFkcV9yZWxheGVkKChpb21tdSktPnJlZyArIChhZGRyKSkKPiA+ICsKPiA+ICAg
I2RlZmluZSByaXNjdl9pb21tdV93cml0ZXEoaW9tbXUsIGFkZHIsIHZhbCkgXAo+ID4gICAgICAg
d3JpdGVxX3JlbGF4ZWQoKHZhbCksIChpb21tdSktPnJlZyArIChhZGRyKSkKPiA+Cj4gPiAgICNk
ZWZpbmUgcmlzY3ZfaW9tbXVfcmVhZHFfdGltZW91dChpb21tdSwgYWRkciwgdmFsLCBjb25kLCBk
ZWxheV91cywgdGltZW91dF91cykgXAo+ID4gICAgICAgcmVhZHhfcG9sbF90aW1lb3V0KHJlYWRx
X3JlbGF4ZWQsIChpb21tdSktPnJlZyArIChhZGRyKSwgdmFsLCBjb25kLCBcCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgZGVsYXlfdXMsIHRpbWVvdXRfdXMpCj4gPiArI2Vsc2UgLyogQ09O
RklHX1JJU0NWX0lPTU1VXzMyQklUICovCj4gPiArI2RlZmluZSByaXNjdl9pb21tdV9yZWFkcShp
b21tdSwgYWRkcikgXAo+ID4gKyAgICAgaGlfbG9fcmVhZHFfcmVsYXhlZCgoaW9tbXUpLT5yZWcg
KyAoYWRkcikpCj4gPgo+ID4gLSNkZWZpbmUgcmlzY3ZfaW9tbXVfcmVhZGxfdGltZW91dChpb21t
dSwgYWRkciwgdmFsLCBjb25kLCBkZWxheV91cywgdGltZW91dF91cykgXAo+ID4gLSAgICAgcmVh
ZHhfcG9sbF90aW1lb3V0KHJlYWRsX3JlbGF4ZWQsIChpb21tdSktPnJlZyArIChhZGRyKSwgdmFs
LCBjb25kLCBcCj4gPiArI2RlZmluZSByaXNjdl9pb21tdV93cml0ZXEoaW9tbXUsIGFkZHIsIHZh
bCkgXAo+ID4gKyAgICAgKChhZGRyID09IFJJU0NWX0lPTU1VX1JFR19JT0hQTUNZQ0xFUykgPyBc
Cj4gPiArICAgICAgbG9faGlfd3JpdGVxX3JlbGF4ZWQoKHZhbCksIChpb21tdSktPnJlZyArIChh
ZGRyKSkgOiBcCj4gPiArICAgICAgaGlfbG9fd3JpdGVxX3JlbGF4ZWQoKHZhbCksIChpb21tdSkt
PnJlZyArIChhZGRyKSkpCj4KPiBFY2hvaW5nIEphc29uJ3MgY29tbWVudCwgd2hhdCBpcyB0aGlz
IGV2ZW4gdHJ5aW5nIHRvIGFjaGlldmU/IE5vdGhpbmcgaW4KPiB0aGUgc3BlYyBzdWdnZXN0cyB0
aGF0IHRoZSBjeWNsZSBjb3VudGVyIHJlZ2lzdGVyIGlzIGZ1bmN0aW9uYWxseQo+IGRpZmZlcmVu
dCBmcm9tIHRoZSBvdGhlciBQTVUgY291bnRlciByZWdpc3RlcnMgKG90aGVyIHRoYW4gaXRzCj4g
c2VsZi1jb250YWluZWQgb3ZlcmZsb3cgYml0KS4KPgo+IEl0IGlzIG5vdCwgaW4gZ2VuZXJhbCwg
c2FmZSB0byBkbyBhIHNwbGl0IHdyaXRlIHRvIGEgcnVubmluZyBjb3VudGVyCj4gZWl0aGVyIHdh
eSAtIGxvdy1oaWdoIHZzLiBoaWdoLWxvdyBqdXN0IG1vdmVzIHRoZSBwcm9ibGVtIGFyb3VuZCwK
PiBjaGFuZ2luZyAqd2hpY2gqIGNvbWJpbmF0aW9ucyBvZiB2YWx1ZXMgYXJlIHByb2JsZW1hdGlj
IGFuZCBjYXBhYmxlIG9mCj4gb3ZlcmZsb3dpbmcgaW50byBlYWNoIG90aGVyIGJldHdlZW4gdGhl
IHdyaXRlcy4gSWYgdGhlIFBNVSBkcml2ZXIgY2FuJ3QKPiB3cml0ZSBjb3VudGVycyBhdG9taWNh
bGx5LCBpdCB3aWxsIG5lZWQgdG8gZW5zdXJlIHRoYXQgaXQgb25seSBldmVyCj4gd3JpdGUgdGhl
bSB3aGlsZSBzdG9wcGVkIChhdCB3aGljaCBwb2ludCB0aGUgb3JkZXIgc3VyZWx5IHNob3VsZG4n
dAo+IG1hdHRlcikuIENvbnZlcnNlbHksIHRob3VnaCwgcmVhZGluZyBmcm9tIHJ1bm5pbmcgY291
bnRlcnMgaXMgYSBiaXQgbW9yZQo+IHJlYXNvbmFibGUsIGJ1dCBpdCBuZWVkcyBtb3JlIHRoYW4g
anVzdCBoaV9sb19yZWFkcSB0byBndWFyYW50ZWUgaXQncwo+IG5vdCBnb3QgYSB0b3JuIHJlc3Vs
dC4KCllvdSBhcmUgcmlnaHQuIEl0IGlzIG1vcmUgYXBwcm9wcmlhdGUgdG8gZW5zdXJlIHVwZGF0
ZSBpb2hwbWN5Y2xlcwp3aXRoIGN5Y2xlIGNvdW50aW5nIGRpc2FibGVkLiBJIHdpbGwgcmVtb3Zl
IHRoaXMgcmVkdW5kYW50IGJyYW5jaCBpbgp0aGUgbmV4dCB2ZXJzaW9uLgoKPgo+IFRoYW5rcywK
PiBSb2Jpbi4KPgo+ID4gKwo+ID4gKyNkZWZpbmUgcmlzY3ZfaW9tbXVfcmVhZHFfdGltZW91dChp
b21tdSwgYWRkciwgdmFsLCBjb25kLCBkZWxheV91cywgdGltZW91dF91cykgXAo+ID4gKyAgICAg
cmVhZHhfcG9sbF90aW1lb3V0KGhpX2xvX3JlYWRxX3JlbGF4ZWQsIChpb21tdSktPnJlZyArIChh
ZGRyKSwgdmFsLCBjb25kLCBcCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgZGVsYXlfdXMs
IHRpbWVvdXRfdXMpCj4gPiArI2VuZGlmIC8qIENPTkZJR19SSVNDVl9JT01NVV8zMkJJVCAqLwo+
ID4KPiA+ICAgI2VuZGlmCj4KCkJlc3QgcmVnYXJkcywKWHUgTHUKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
