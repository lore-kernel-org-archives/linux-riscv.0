Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD7FCC433E5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 12:16:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A89E321702
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 12:16:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oMeqzv4g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Aasa/CzH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A89E321702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i2J1u/aXCoSH4pb5tDSWAEh02Hwb0SEZhPVnHsrVNu0=; b=oMeqzv4gFhRxUN83S311Iv+CO
	/pi0NxeqvkplsC/uA5jF8zDWbup0xsEl3ddo6Wrwn5c2JziHD6ZJDp2ckzeJa4PjpmZHl6/QS5eMo
	skPIU7i3/Fn2s9rBBYP+fezvchfuHK0Kgm9BICz7iqbgGO4bNbXdkQ096/ZG3zg26YgCPi5mSbPSw
	wSC9uZ22toesTNSOMVo5ecQGmYVFngREboshCqDH1L8mVDV4wvUQTC7q43XM+law0P7CTU3XtxVoL
	XNpewawCn+XPAxlH/vRjhBf1QypymEFJDN9upSqYs5Qm/BfsuNXuw4eHxNVZabJTqQ0712yjD7eUi
	Jqf66P9tw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxrBi-0001xP-HR; Tue, 21 Jul 2020 12:16:02 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxrBf-0001wd-8o
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 12:16:00 +0000
Received: by mail-wr1-x441.google.com with SMTP id a14so6125899wra.5
 for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2020 05:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UaIMmvkFPThAFCANB9tizwAb469qBmnRcxN8sd+XOMM=;
 b=Aasa/CzHTalCki8u/adk85kJFo3xim1tyv35dMUU0oq2MiirYVeJmH/6Y44iJUwswD
 3oltoMZSSlneuTEKdufd/cFf2vEQ/jOM7J/ib10LlGBfa3OAaV1qgzr1OhrCV7/RZ22r
 j4ISx/JB4yhAXQ8C2k4cHBPxGWd4vp413VZkW+zALMRp9QJZHLvqF1as42wESRpG+hpy
 UfVu9+cI3kn835q2hrhz+upTkn7sJAaPgE2xqHlIZt+xKvcsadCDtLOPrqtp+ls4ZSZJ
 VugQXNGOboiNvFqJz3knrbvNLNiOPSKSk6/j38DqvBw3wfoEyh97IGcVz7d0nyIyimj0
 ZZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UaIMmvkFPThAFCANB9tizwAb469qBmnRcxN8sd+XOMM=;
 b=oj8GwBmScJ72Dk92jAG2+QlGEGZI+3ivU56Yj2mxEy6HMKmc0WKrmwhSxKPtD7nh0w
 rJF2DAH5A6E54V/hO5af6x2zaiNY5YmnGQC+NmPp0S+brSeRVFmZwtzUvohcwWrSC/7a
 IP2RkY0EwODAZEeyuw/0+eb6qRSedOhe5rx0KRbFoXUajZBZLbv8Ct2o6HhaJjNpjmPy
 OLiHeHHUGeFoaQXiH+Mw0ny8+CJmsOZ4M6iC/wt9oJYofL8S5z1WRW3Zq3TqDpEyaZp9
 SGbZND59RhZgEbvjWB7dM1ASLtYp/wG5CqD5JhTzCe5X67LYpXWMHO8iqoVm1NAK8qHz
 2I1A==
X-Gm-Message-State: AOAM531mudYC5edTEkZD6NrvKav++0pHp51wDVxj8DiJgAUVt4MUCiP1
 OgxvBY3M3GHVNxXrBcYM86MGpg==
X-Google-Smtp-Source: ABdhPJyhysNqfGgE9bSFwrQlNMQuwVOM9eQNPZY+iYSNYEnQokAHmy83ZbiEshAnmadHgHg9whUrLA==
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr6371761wrq.407.1595333758078; 
 Tue, 21 Jul 2020 05:15:58 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:c144:5385:c824:85ce?
 ([2a01:e34:ed2f:f020:c144:5385:c824:85ce])
 by smtp.googlemail.com with ESMTPSA id p8sm25497574wrq.9.2020.07.21.05.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 05:15:57 -0700 (PDT)
Subject: Re: [PATCH v4 2/4] clocksource/drivers: Add CLINT timer driver
To: Anup Patel <anup@brainfault.org>
References: <20200717075101.263332-1-anup.patel@wdc.com>
 <20200717075101.263332-3-anup.patel@wdc.com>
 <63f65ddd-b7c4-b8fd-151c-a77e8c87efed@linaro.org>
 <CAAhSdy2oGAk6A6=SwgCgZ+trmzCMRPOCiB6ibDTL2A_1sUu1og@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <107e3ef3-9f61-05d1-7a91-95d0dc7ea7b8@linaro.org>
Date: Tue, 21 Jul 2020 14:15:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy2oGAk6A6=SwgCgZ+trmzCMRPOCiB6ibDTL2A_1sUu1og@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_081559_339718_C6C88D65 
X-CRM114-Status: GOOD (  24.84  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berhing <kernel@esmil.dk>,
 Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjEvMDcvMjAyMCAxMzo0OSwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBUdWUsIEp1bCAyMSwg
MjAyMCBhdCA0OjMyIFBNIERhbmllbCBMZXpjYW5vCj4gPGRhbmllbC5sZXpjYW5vQGxpbmFyby5v
cmc+IHdyb3RlOgo+Pgo+PiBPbiAxNy8wNy8yMDIwIDA5OjUwLCBBbnVwIFBhdGVsIHdyb3RlOgo+
Pj4gV2UgYWRkIGEgc2VwYXJhdGUgQ0xJTlQgdGltZXIgZHJpdmVyIGZvciBMaW51eCBSSVNDLVYg
TS1tb2RlIChpLmUuCj4+PiBSSVNDLVYgTm9NTVUga2VybmVsKS4KPj4+Cj4+PiBUaGUgQ0xJTlQg
TU1JTyBkZXZpY2UgcHJvdmlkZXMgdGhyZWUgdGhpbmdzOgo+Pj4gMS4gNjRiaXQgZnJlZSBydW5u
aW5nIGNvdW50ZXIgcmVnaXN0ZXIKPj4+IDIuIDY0Yml0IHBlci1DUFUgdGltZSBjb21wYXJlIHJl
Z2lzdGVycwo+Pj4gMy4gMzJiaXQgcGVyLUNQVSBpbnRlci1wcm9jZXNzb3IgaW50ZXJydXB0IHJl
Z2lzdGVycwo+Pj4KPj4+IFVubGlrZSBvdGhlciB0aW1lciBkZXZpY2VzLCBDTElOVCBwcm92aWRl
cyBJUEkgcmVnaXN0ZXJzIGFsb25nIHdpdGgKPj4+IHRpbWVyIHJlZ2lzdGVycy4gVG8gdXNlIENM
SU5UIElQSSByZWdpc3RlcnMsIHRoZSBDTElOVCB0aW1lciBkcml2ZXIKPj4+IHByb3ZpZGVzIElQ
SSByZWxhdGVkIGNhbGxiYWNrcyB0byBhcmNoL3Jpc2N2Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6
IEFudXAgUGF0ZWwgPGFudXAucGF0ZWxAd2RjLmNvbT4KPj4+IFRlc3RlZC1ieTogRW1pbCBSZW5u
ZXIgQmVyaGluZyA8a2VybmVsQGVzbWlsLmRrPgo+Pj4gLS0tCj4+PiAgZHJpdmVycy9jbG9ja3Nv
dXJjZS9LY29uZmlnICAgICAgIHwgICA5ICsrCj4+PiAgZHJpdmVycy9jbG9ja3NvdXJjZS9NYWtl
ZmlsZSAgICAgIHwgICAxICsKPj4+ICBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLWNsaW50LmMg
fCAyMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+PiAgaW5jbHVkZS9saW51eC9j
cHVob3RwbHVnLmggICAgICAgIHwgICAxICsKPj4+ICA0IGZpbGVzIGNoYW5nZWQsIDI0MiBpbnNl
cnRpb25zKCspCj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xvY2tzb3VyY2UvdGlt
ZXItY2xpbnQuYwo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsb2Nrc291cmNlL0tjb25m
aWcgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL0tjb25maWcKPj4+IGluZGV4IDkxNDE4MzgxZmNkNC4u
ZTFjZTBkNTEwYTAzIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS9LY29uZmln
Cj4+PiArKysgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL0tjb25maWcKPj4+IEBAIC02NTgsNiArNjU4
LDE1IEBAIGNvbmZpZyBSSVNDVl9USU1FUgo+Pj4gICAgICAgICBpcyBhY2Nlc3NlZCB2aWEgYm90
aCB0aGUgU0JJIGFuZCB0aGUgcmRjeWNsZSBpbnN0cnVjdGlvbi4gIFRoaXMgaXMKPj4+ICAgICAg
ICAgcmVxdWlyZWQgZm9yIGFsbCBSSVNDLVYgc3lzdGVtcy4KPj4+Cj4+PiArY29uZmlnIENMSU5U
X1RJTUVSCj4+PiArICAgICBib29sICJUaW1lciBmb3IgdGhlIFJJU0MtViBwbGF0Zm9ybSIKPj4+
ICsgICAgIGRlcGVuZHMgb24gR0VORVJJQ19TQ0hFRF9DTE9DSyAmJiBSSVNDVl9NX01PREUKPj4+
ICsgICAgIHNlbGVjdCBUSU1FUl9QUk9CRQo+Pj4gKyAgICAgc2VsZWN0IFRJTUVSX09GCj4+PiAr
ICAgICBoZWxwCj4+PiArICAgICAgIFRoaXMgb3B0aW9uIGVuYWJsZXMgdGhlIENMSU5UIHRpbWVy
IGZvciBSSVNDLVYgc3lzdGVtcy4gVGhlIENMSU5UCj4+PiArICAgICAgIGRyaXZlciBpcyB1c3Vh
bGx5IHVzZWQgZm9yIE5vTU1VIFJJU0MtViBzeXN0ZW1zLgo+Pgo+PiBWMyBoYXMgYSBjb21tZW50
IGFib3V0IGZpeGluZyB0aGUgS2NvbmZpZyBvcHRpb24uCj4gCj4gSSBoYXZlIHJlbW92ZWQgImRl
ZmF1bHQgeSIgZnJvbSB0aGUgS2NvbmZpZyBvcHRpb24gYXMtcGVyIHlvdXIgc3VnZ2VzdGlvbnMu
Cj4gCj4gSSBsb29rZWQgYXQgb3RoZXIgVGltZXIgS2NvbmZpZyBvcHRpb25zLiBNb3N0IG9mIHRo
ZW0gaGF2ZSBtZW51Y29uZmlnIG5hbWUuCj4gQWxzbywgd2UgY2FuIGNlcnRhaW5seSBoYXZlIGRp
ZmZlcmVudCB0aW1lciBNTUlPIHRpbWVyIGRyaXZlcnMgaW4gZnV0dXJlLiBEbwo+IHlvdSBzdGls
bCBpbnNpc3Qgb24gbWFraW5nIHRoaXMga2NvbmZpZyBvcHRpb24gdG90YWxseSBzaWxlbnQgPz8K
ClllcywgYW5kIHRoZXJlIGlzIGFuIGVmZm9ydCB0byBjaGFuZ2UgdGhlIGVudHJpZXMgdG8gYmUg
c2lsZW50IGFzIG11Y2gKYXMgcG9zc2libGUuCgpKdXN0IGFkZDoKCglib29sICJUaW1lciBmb3Ig
dGhlIFJJU0MtViBwbGF0Zm9ybSIgaWYgQ09NUElMRV9URVNUCgphbmQgcmVtb3ZlIHRoZSBSSVND
Vl9NX01PREUgZGVwZW5kZW5jeS4KCk9yIGFsdGVybmF0aXZlbHk6CgpyZXBsYWNlIHRoZSBSSVND
Vl9NX01PREUgZGVwZW5kZW5jeSB3aXRoIENPTVBJTEVfVEVTVAoKVGhlIGdvYWwgaXMgdG8gYmUg
YWJsZSB0byBjb21waWxlIHRoZSBkcml2ZXIgb24gZGlmZmVyZW50IHBsYXRmb3JtcyBmb3IKY29t
cGlsYXRpb24gdGVzdCBjb3ZlcmluZy4KClRoZW4gd2hlbiBtb3JlIG1taW8gZHJpdmVycyB3aWxs
IGFkZGVkIHdlIHdpbGwgZmlndXJlIG91dC4KCj4+IFsgLi4uIF0KPj4KPj4+ICt7Cj4+PiArICAg
ICBib29sICpyZWdpc3RlcmVkID0gcGVyX2NwdV9wdHIoJmNsaW50X2Nsb2NrX2V2ZW50X3JlZ2lz
dGVyZWQsIGNwdSk7Cj4+PiArICAgICBzdHJ1Y3QgY2xvY2tfZXZlbnRfZGV2aWNlICpjZSA9IHBl
cl9jcHVfcHRyKCZjbGludF9jbG9ja19ldmVudCwgY3B1KTsKPj4+ICsKPj4+ICsgICAgIGlmICgh
KCpyZWdpc3RlcmVkKSkgewo+Pj4gKyAgICAgICAgICAgICBjZS0+Y3B1bWFzayA9IGNwdW1hc2tf
b2YoY3B1KTsKPj4+ICsgICAgICAgICAgICAgY2xvY2tldmVudHNfY29uZmlnX2FuZF9yZWdpc3Rl
cihjZSwgY2xpbnRfdGltZXJfZnJlcSwgMjAwLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBVTE9OR19NQVgpOwo+Pj4gKyAgICAgICAgICAgICAqcmVn
aXN0ZXJlZCA9IHRydWU7Cj4+PiArICAgICB9Cj4+Cj4+Cj4+IEkgd2FzIHVuc3VyZSBhYm91dCB0
aGUgY2xvY2tldmVudHNfY29uZmlnX2FuZF9yZWdpc3RlcigpIG11bHRpcGxlIGNhbGxzCj4+IHdo
ZW4gZG9pbmcgdGhlIGNvbW1lbnQuIEl0IHNlZW1zIGxpa2UgaXQgaXMgZmluZSB0byBjYWxsIGl0
IHNldmVyYWwKPj4gdGltZXMgYW5kIHRoYXQgaXMgZG9uZSBpbiBzZXZlcmFsIHBsYWNlcyBsaWtl
IHJpc2N2IG9yIGFyY2hfYXJtX3RpbWVyLgo+Pgo+PiBJdCBpcyBwcm9iYWJseSBzYWZlIHRvIGRy
b3AgdGhlICdyZWdpc3RlcmVkJyBjb2RlIGhlcmUsIHNvcnJ5IGZvciB0aGUKPj4gY29uZnVzaW9u
Lgo+IAo+IE9rYXksIHdpbGwgcmV2ZXJ0IHRoZXNlIGNoYW5nZXMuCj4gCj4+Cj4+PiArICAgICBl
bmFibGVfcGVyY3B1X2lycShjbGludF90aW1lcl9pcnEsCj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICBpcnFfZ2V0X3RyaWdnZXJfdHlwZShjbGludF90aW1lcl9pcnEpKTsKPj4+ICsgICAgIHJl
dHVybiAwOwo+Pj4gK30KPj4+ICsKPj4KPj4gWyAuLi4gXQo+Pgo+Pgo+PiAtLQo+PiA8aHR0cDov
L3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9y
IEFSTSBTb0NzCj4+Cj4+IEZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20v
cGFnZXMvTGluYXJvPiBGYWNlYm9vayB8Cj4+IDxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJv
b3JnPiBUd2l0dGVyIHwKPj4gPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJs
b2cKPiAKPiBSZWdhcmRzLAo+IEFudXAKPiAKCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+
IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93
IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29r
IHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3
dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
