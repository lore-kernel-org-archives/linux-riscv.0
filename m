Return-Path: <SRS0=HMje=M7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C761ECDE43
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Oct 2018 22:06:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43B0521470
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Oct 2018 22:06:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LgSKFv3o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="kmI1fLP8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43B0521470
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WUrZfKfBYE/sGSBh8xTm+603HUehAwbnnlEtPN55srw=; b=LgSKFv3oIKdiZdYB1QKw6OFnl
	HUJB4cw2jrgK2+gOSi6Vtu608FOTU4FsLC2KreWrzr4XdbRfOoBmDud2xFAxIJjo/c315Vo4AWf+j
	XasePBBrykeKQTrNOU61EvFQ+Dy4xg2sWpz0i6W3u/93prf7NSJZZfjTRDLmNDNGSqtepXY4bsPj8
	Cy/Q6W2Run9EAPpL21x6G6BsPdUID8ukLV1/+mtpPs/HwyW+Vkf/bBnBBW39AxhE1SxZV4S9galTP
	3gBYV8UlCyY5dix0KpGdEqrvOx3EpRIP453YmTpjT0KedjMZCzYirYN6eKVlVgYUq244KFFdavQaz
	10uxXYKJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gDcuS-000603-K6; Fri, 19 Oct 2018 22:06:20 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDcuP-0005xl-OO
 for linux-riscv@lists.infradead.org; Fri, 19 Oct 2018 22:06:19 +0000
Received: by mail-pg1-x542.google.com with SMTP id 23-v6so16313135pgc.8
 for <linux-riscv@lists.infradead.org>; Fri, 19 Oct 2018 15:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ELIUPqDxF5m+HeMdeUJd/lmuPOV0caa6vT+E7+g/w10=;
 b=kmI1fLP83l/BejTMnVmaW3I0cFRZeoncjpxCDKudJBHq64a2EuiQuyZ5lltA0aJMMz
 7a80Zc7v1LPFlxzzbitlMJf9hZ8XGUdjakhKY8yB7OtN7YqEAbYi6hLrtmJAhVyVs0bn
 +jAWkCn2SceiHONygywKZV6secVE1o/r8VuOxNQKT/7Y20NEJzC+1WUs+DTdetBdoZ6/
 +8WQK9+7+9lAmeEKk7vOB5yy30tP5DwrWbwMfn+zV+rTtvH9QfMUD/lDaH9tf85QBQHF
 ulxlwVaKU4rf8WXkPeb5OjlWVFbSghK7HAVhbI/I7m47mj82zsQ2lpKugivNvBCne/Jv
 BEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ELIUPqDxF5m+HeMdeUJd/lmuPOV0caa6vT+E7+g/w10=;
 b=oJSuox3CIXauPqlayKsp+op3hFCyFN4kCGj/FjNhgjFhxM86xyrX34RDvFytLYeMSr
 hGRoV/krEgov/oO6I6z+yfEhL+86OEO2h00cmWYoUeGQlkrEMUaL1tW4iS5TJ9asDIXA
 ukDmQGAte5LWTy7SS/Wq56HykKdPyxyfTlKcWX+RRG/XHkB8LWN1qKaOKzUhAS3dwU0z
 M/ikmFnBNieJDEYC1J13xzgyjvNehWdf6ROB/+0TpEj/e24Xxe8ZlPmF1Ot9rLT73dCH
 UL+nLAlYrFc8FNnTUHaATcNCd5dceh4hUdXvqHp+95OycZtaf6thTgf9HQKagutWJg38
 Tn0g==
X-Gm-Message-State: ABuFfoiNYhCwIYlQFH8bNH+OCpzfehq7OHI+B1BD+Z3QwP49Q+C+lM3L
 uFE/DvcEolc1fPS+wHHWHBkGYA==
X-Google-Smtp-Source: ACcGV6142jmGT3mgmJqV5OGyiDAFE4LFuV0FvNkWABWoVmVHgGOu4KaNYCZhjes2nWM1SLS/AewgZQ==
X-Received: by 2002:a63:c112:: with SMTP id
 w18-v6mr34632882pgf.429.1539986764501; 
 Fri, 19 Oct 2018 15:06:04 -0700 (PDT)
Received: from [172.19.248.111] ([104.153.224.167])
 by smtp.gmail.com with ESMTPSA id y8-v6sm41227977pfd.168.2018.10.19.15.05.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Oct 2018 15:06:03 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: serial: add documentation for the
 SiFive UART driver
To: Rob Herring <robh+dt@kernel.org>
References: <20181019184827.12351-1-paul.walmsley@sifive.com>
 <20181019184827.12351-2-paul.walmsley@sifive.com>
 <CAL_JsqJBSqaxnETdJg1Mdp+H2ay+WKT0JaxLe6D4Fwo_99qUkw@mail.gmail.com>
From: Paul Walmsley <paul.walmsley@sifive.com>
Message-ID: <4317548d-f831-29ba-3be9-35f080587db9@sifive.com>
Date: Fri, 19 Oct 2018 15:05:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJBSqaxnETdJg1Mdp+H2ay+WKT0JaxLe6D4Fwo_99qUkw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181019_150617_795736_064811E0 
X-CRM114-Status: GOOD (  27.82  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181019220511.qM6cgr3ODfZvU3nRSsfPUZg4IV1FWyhF3nq8oxCdTCQ@z>

Ck9uIDEwLzE5LzE4IDE6NDUgUE0sIFJvYiBIZXJyaW5nIHdyb3RlOgo+IE9uIEZyaSwgT2N0IDE5
LCAyMDE4IGF0IDE6NDggUE0gUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29t
PiB3cm90ZToKPj4gQWRkIERUIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIExpbnV4IGRy
aXZlciBmb3IgdGhlIFNpRml2ZQo+PiBhc3luY2hyb25vdXMgc2VyaWFsIElQIGJsb2NrLiAgTm90
aGluZyB0b28gZXhvdGljLgo+Pgo+PiBDYzogbGludXgtc2VyaWFsQHZnZXIua2VybmVsLm9yZwo+
PiBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKPj4gQ2M6IGxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKPj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPj4gQ2M6
IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4+IENjOiBS
b2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPgo+PiBDYzogTWFyayBSdXRsYW5kIDxtYXJr
LnJ1dGxhbmRAYXJtLmNvbT4KPj4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAc2lmaXZlLmNv
bT4KPj4gUmV2aWV3ZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAc2lmaXZlLmNvbT4KPj4g
U2lnbmVkLW9mZi1ieTogUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPgo+
PiBTaWduZWQtb2ZmLWJ5OiBQYXVsIFdhbG1zbGV5IDxwYXVsQHB3c2FuLmNvbT4KPj4gLS0tCj4+
ICAgLi4uL2JpbmRpbmdzL3NlcmlhbC9zaWZpdmUtc2VyaWFsLnR4dCAgICAgICAgIHwgMjEgKysr
KysrKysrKysrKysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspCj4+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
ZXJpYWwvc2lmaXZlLXNlcmlhbC50eHQKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvc2lmaXZlLXNlcmlhbC50eHQgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL3NpZml2ZS1zZXJpYWwudHh0Cj4+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uODk4MjMzODUxMmY1Cj4+IC0t
LSAvZGV2L251bGwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nl
cmlhbC9zaWZpdmUtc2VyaWFsLnR4dAo+PiBAQCAtMCwwICsxLDIxIEBACj4+ICtTaUZpdmUgYXN5
bmNocm9ub3VzIHNlcmlhbCBpbnRlcmZhY2UgKFVBUlQpCj4+ICsKPj4gK1JlcXVpcmVkIHByb3Bl
cnRpZXM6Cj4+ICsKPj4gKy0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJzaWZpdmUsZnU1NDAtYzAw
MC11YXJ0MCIgb3IgInNpZml2ZSx1YXJ0MCIKPiBJIGFzc3VtZSBvbmNlIGFnYWluLCB0aGUgbGFz
dCAnMCcgaXMgYSB2ZXJzaW9uPwoKClllcy4KCgo+IFBhbG1lciBtZW50aW9uZWQgdGhlCj4gY29t
cGF0aWJsZSBzdHJpbmcgaXMgcGFydCBvZiB0aGUgSVAgYmxvY2sgcmVwb3NpdG9yeT8KCgpJdCBp
cywgYnV0IHRoZXJlJ3Mgbm8gZ3VhcmFudGVlIHRoYXQgdGhlIGNvbXBhdGlibGUgc3RyaW5nIGZy
b20gdGhlIFJUTCAKd2lsbCBtYWtlIGl0IGludG8gYSBST00gZm9yIGFueSBnaXZlbiBjaGlwLsKg
IEZvciBleGFtcGxlLCBhIGN1c3RvbWVyIG1heSAKd2FudCB0aGUgVUFSVCwgYnV0IG5vdCB3YW50
IHRvIHRha2UgdGhlIERUIFJPTSB0byBrZWVwIGFyZWEgZG93bi4KCgpUaGlzIGlzIG9uZSBvZiB0
aGUgcmVhc29ucyB3aHkgd2UnbGwgbGlrZWx5IHN3aXRjaCB0byB0aGUgdXN1YWwgCnNvZnR3YXJl
LW1haW50YWluZWQgRFRTIGZpbGVzIGZvciBMaW51eCwganVzdCBsaWtlIHRoZSByZXN0IG9mIGFy
Y2gvYXJtLCAKYXJjaC9wb3dlcnBjLCBldGMuCgoKPiBBcyBJIG1lbnRpb25lZCBmb3IgdGhlCj4g
aW50YyBhbmQgbm93IHRoZSBwd20gYmxvY2sgYmluZGluZ3MsIGlmIHlvdSBhcmUgZ29pbmcgdG8g
ZG8gdmVyc2lvbgo+IG51bWJlcnMgcGxlYXNlIGRvY3VtZW50IHRoZSB2ZXJzaW9uaW5nIHNjaGVt
ZS4KCgpXaWxsIGFkZCB0aGF0IHRvIHRoZSBiaW5kaW5nIGRvY3VtZW50LgoKCj4gICBXaGVyZSBk
b2VzIHRoZQo+IG51bWJlciBjb21lIGZyb20/CgoKSXQgY29tZXMgZnJvbSB0aGUgUlRMLCB3aGlj
aCBpcyBwdWJsaWM6CgpodHRwczovL2dpdGh1Yi5jb20vc2lmaXZlL3NpZml2ZS1ibG9ja3MvYmxv
Yi9tYXN0ZXIvc3JjL21haW4vc2NhbGEvZGV2aWNlcy91YXJ0L1VBUlQuc2NhbGEjTDQzCgoKCj4g
V2hhdCdzIHRoZSBuZXh0IHZlcnNpb24/CgoKMSAob3Igc29tZXRoaW5nIGxhcmdlcikKCgo+IE1h
am9yIHZzLiBtaW5vciB2ZXJzaW9ucz8KCgpOb3QgY3VycmVudGx5IGZvciB0aGlzIElQIGJsb2Nr
LgoKCj4gRUNPIGZpeGVzPwoKCkVDT3MgZm9yIGEgc3BlY2lmaWMgY2hpcD/CoCBJZiBzbywgd2hl
dGhlciBhbiBpbnRlZ3JhdG9yIGNoYW5nZXMgdGhlIAp2ZXJzaW9uIG51bWJlciBpbiBhIFJPTSAo
aWYgcHJlc2VudCkgaXMgdXAgdG8gd2hvbWV2ZXIgZG9lcyB0aGUgRUNPLsKgIApUaGF0IG1heSBu
b3QgYmUgU2lGaXZlLgoKClN1cHBvc2UgdGhhdCBzb21lb25lIEVDT3MgYSBTaUZpdmUgVUFSVCBp
biBhIHdheSB0aGF0IGluY29tcGF0aWJseSAKY2hhbmdlcyB0aGUgcHJvZ3JhbW1pbmcgbW9kZWwu
wqAgVGhleSBjYW4gY2hvb3NlIHRvIHN1Ym1pdCBjb3JyZXNwb25kaW5nIApSVEwgY2hhbmdlcyBi
YWNrIHVwc3RyZWFtIHRvIHRoZSBzaWZpdmUtYmxvY2tzIHJlcG9zaXRvcnksIG9yIG5vdC4KCgpJ
ZiB0aGV5IGRvbid0LCBhbmQgdGhleSB3YW50IHVwc3RyZWFtIExpbnV4IHN1cHBvcnQsIGl0J3Mg
dXAgdG8gdGhlIAppbnRlZ3JhdG9yIHRvIGRlZmluZSBhICJmb29iYXIsZm9vY2hpcC11YXJ0IiBp
biB0aGVpciBjaGlwIERUIGZpbGUsIGFuZCAKcG9zdCBpdCB1cHN0cmVhbSB0byB0aGUga2VybmVs
IGxpc3RzLCBhbG9uZyB3aXRoIHRoZSBjb3JyZXNwb25kaW5nIApkcml2ZXIgcGF0Y2hlcy4KCgpJ
ZiBob3dldmVyLCB0aGV5IGRvIGdldCB0aGVpciBjaGFuZ2VzIGFjY2VwdGVkIGludG8gdGhlIHNp
Zml2ZS1ibG9ja3MgCnB1YmxpYyBSVEwgcmVwb3NpdG9yeSwgdGhlbiB0aGUgbWFpbnRhaW5lciBv
ZiBzaWZpdmUtYmxvY2tzIGlzIApyZXNwb25zaWJsZSBmb3IgZW5zdXJpbmcgdGhhdCB0aGUgY29t
cGF0aWJsZSBzdHJpbmcgaW4gdGhlIFJUTCBpcyAKY2hhbmdlZCBpbiBhbiBhcHByb3ByaWF0ZSB3
YXkuCgoKPiAgIElzIHRoZSB2ZXJzaW9uIHMvdyByZWFkYWJsZT8KCgpOb3QgaW4gdGhlIFVBUlQg
SVAgYmxvY2sgaXRzZWxmLsKgwqAgSW4gdGhlIHNwZWNpZmljIGNhc2Ugb2YgdGhlIEZVNTQwIApj
aGlwLCB0aGVyZSdzIGEgc3RyaW5nIGluIGEgUk9NLgoKCj4gSG93IGRvIHlvdSBlbnN1cmUgaXQg
Z2V0cwo+IHVwZGF0ZWQ/CgoKVGhlIHN0cmluZyBpbiB0aGUgUk9NP8KgIEZvciBhbiBJUCBibG9j
ayBsaWtlIHRoZSBVQVJULCBpdCdzIHVwIHRvIHRoZSAKZW5naW5lZXIgcGF0Y2hpbmcgdGhlIFVB
UlQgUlRMIHRvIHVwZGF0ZSB0aGUgY29tcGF0aWJsZSBzdHJpbmcgd2hlbiB0aGUgCnByb2dyYW1t
aW5nIG1vZGVsIGNoYW5nZXMsIGFuZCB0aGUgc2lmaXZlLWJsb2NrcyBtYWludGFpbmVyIHRvIGVu
Zm9yY2UgaXQuCgpGb3IgYSBnaXZlbiBjaGlwLCBpdCdzIHVwIHRvIHRoZSBpbnRlZ3JhdG9yL2Vu
ZCB1c2VyIHdoZXRoZXIgdGhleSB3YW50IAp0byBpbmNsdWRlIHRoZSBEVCBST00gb3Igbm90LCBh
bmQgaWYgaXQncyBwcmVzZW50LCBpdCdzIHVwIHRvIHRoZW0gd2hhdCAKaXQgY29udGFpbnMuCgoK
PiBBbGwgdGhhdCBzaG91bGQgYmUgYWRkcmVzc2VkLgo+Cj4gT3RoZXJ3aXNlLCBkb24ndCBkbyB2
ZXJzaW9uIG51bWJlcnMgYmVjYXVzZSB3ZSBoYXZlIG5vIHZpc2liaWxpdHkgdG8KPiB3aGF0IHRo
ZXkgbWVhbi4KCgpJdCdzIGFsbCBpbiB0aGUgcHVibGljIFJUTDoKCmh0dHBzOi8vZ2l0aHViLmNv
bS9zaWZpdmUvc2lmaXZlLWJsb2Nrcy9ibG9iL21hc3Rlci9zcmMvbWFpbi9zY2FsYS9kZXZpY2Vz
L3VhcnQvVUFSVC5zY2FsYSNMNDMKCgo+PiArLSByZWc6IGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0
aGUgcmVnaXN0ZXIgc3BhY2UKPj4gKy0gaW50ZXJydXB0LXBhcmVudDogc2hvdWxkIGNvbnRhaW4g
YSBwaGFuZGxlIHBvaW50aW5nIHRvIHRoZSBTb0MgaW50ZXJydXB0Cj4+ICsgICAgY29udHJvbGxl
ciBkZXZpY2Ugbm9kZSB0aGF0IHRoZSBVQVJUIGludGVycnVwdHMgYXJlIGNvbm5lY3RlZCB0bwo+
IERvbid0IG5lZWQgdG8gZG9jdW1lbnQgaW50ZXJydXB0LXBhcmVudCBoZXJlLgoKCk9LLCB3aWxs
IGRyb3AgaXQuCgoKLSBQYXVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
