Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41A8C3ABC3
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 03:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aqKErj/0RT0XCYmwLATJ2ApVI79hQo/o7ni/scPObuI=; b=hgL9vC8HlGcXMW
	Zq/cotIFERE1l8a2YnBnAeFAaLTbOzBNeSVEhfyiQuiZzpEBonAla6jcer7XDXmxQIszBpkrxGXiK
	VTEHDB7sdpiiMx8Ngx8Xy1TShZMmIq+9mArRHRaiJsWbktaXYtYXtZSOaLpENz+ITCIWLnbuk8+Jm
	mcCAoI1ixbYh18JnY4SrRzGhngpEfXqrqUqTQ6968qqx9bUErjyT07IONSgs0Tiw3L5lAdQ3YLo+1
	yWcrSqGvQuPI0fgvfCpK73W5i5pUa0GmxIEINp822QkM2qX/r/HJonvmvae4Fmhm6bbBZ0gUPbM4U
	Lnq+n6OvQKyTyil8nWgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEJif-00000008Gmw-0Jwn;
	Mon, 12 May 2025 03:20:45 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEJic-00000008GmU-2WD2
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 03:20:43 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e733a6ff491so3878179276.2
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 20:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747020041; x=1747624841; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxudKsz+3J/IdOT+mPaoe2sibZSJTjud5OBgAuDoCFw=;
        b=RAzgqhI1cXdi8MpcjzuQqOddje9fRn4eTfkjRv4PNMe/Do9Hbe0GUNHR8S+2VQF5mD
         xH61uE4riFCFHW7U7FJWkajcBguHhtZsMZt7qi2sN1TGz8ojAxrkFoIgR7D98PLL72Jq
         1JeWCQd9Y6kmFPNnrzlv9xQv4lY7MklD7j+AsaUymV8F5Xn6HBJOfeC1XncTp+v1NRva
         B03vMDFs+FR8nSEDPaNJz+de0nGp42vc7asOkddg21oeLDj7XMi1ySJXx91dFAfnYjCr
         AUyR61H/mj2j7l62oYUn6gMEcxKFGZVBee6ipxK+Gcjieic40RufYYNQhZwIllf/D/Ll
         Lj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747020041; x=1747624841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxudKsz+3J/IdOT+mPaoe2sibZSJTjud5OBgAuDoCFw=;
        b=SIgTUV1PPEefgQ71R5QRDHJYrGNvH59kI8nihBAV58NP2E4R+s5C/4s0jWelynxh48
         tphkbhMUBO48JyBMr5/WbYUoXQidMk+ZTyPygDUS212ZHTEejnxAL4VQLY/PPTbdtgNZ
         U3lv3HE6JlMoByQiQPmIe0AQ21HIqeUTMac/mZQoiKUXSMLstFm9ljSD3cIlbuCV2Fn4
         4Z8DIGHlpu2MF6bgSv7xGEUv17n1Y+pr1PViw5KAGRolSQSNoMxsOIuTZQGGES93Pf/M
         oJBswDj/OxoxfgFW0Eq2FbBOhR7+bMGLsyQcU5lDdAYXFwWAvlCKuQ7xUFIov72R2znW
         TE8A==
X-Forwarded-Encrypted: i=1; AJvYcCVBB1mv0lSlD9g5wcuHpn6cVNferD+4J8WSFpKwCdCr8oJMlqkZS6hTD5tOSzNXzJGCFi9+Qy0H5+rEbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3n+W5H/xg9xVKGUMOaCWF+Smtf2XJ2CmDRnAfUfiGIqgqJin2
	c28JmEExuPDOmKvTLliV8ANrFf6UVVDUFFLCz3BMxfazmQo2pb/Ex7Ccyss73N56le1+bh+bYgM
	0zjRbuElNxTigQ76ZQEOKftHSzYmLHsx9lSdNoQ==
X-Gm-Gg: ASbGnctIF4Q/gNZKEoQ44H9mEfEj9M6Pc3hUNm1v9MWFwK0ZrX7vPR1ZCG6xj5vrP79
	z0Fkm6fOKTLcuuZA8/A7sWk6pD6gF3n5ESScZAFuxVxpOxBiZuhjaGX4u6SLfUviIigBX6jXhjz
	pTphbpP6bgTkU2GOG7es/hFo8IbUwXR3bW67s=
X-Google-Smtp-Source: AGHT+IE0xIYfUGZo/YgGsrSlwxUw7mp79GUZ45r3jCggNaOdaPZ7cYhKUcVZkI4NriZh+pfJqDPPxMYLuK5RKH/XqQk=
X-Received: by 2002:a05:6902:220f:b0:e78:f9ba:c33b with SMTP id
 3f1490d57ef6-e78fdc4cfeemr15242192276.6.1747020040729; Sun, 11 May 2025
 20:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250509021605.26764-1-nick.hu@sifive.com> <20250509-small-graceful-limpet-d0ea41@kuoka>
In-Reply-To: <20250509-small-graceful-limpet-d0ea41@kuoka>
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 12 May 2025 11:20:28 +0800
X-Gm-Features: AX0GCFsS2gEyScQIGoz4ks6S0LXYdUW88ZbHxUZwrMH2V3H8XC4xlgJod-2gaA0
Message-ID: <CAKddAkAzDGL-7MbroRqQnZzPXOquUMKNuGGppqB-d_XZXbcvBA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: power: Add SiFive Domain Management controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Cyan Yang <cyan.yang@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_202042_647845_F638258F 
X-CRM114-Status: GOOD (  22.57  )
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

T24gRnJpLCBNYXkgOSwgMjAyNSBhdCAyOjQw4oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
a0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgTWF5IDA5LCAyMDI1IGF0IDEwOjE2OjA0
QU0gR01ULCBOaWNrIEh1IHdyb3RlOgo+ID4gU2lGaXZlIERvbWFpbiBNYW5hZ2VtZW50IGNvbnRy
b2xsZXIgaW5jbHVkZXMgdGhlIGZvbGxvd2luZyBjb21wb25lbnRzCj4gPiAtIFNpRml2ZSBUaWxl
IE1hbmFnZW1lbnQgQ29udHJvbGxlcgo+ID4gLSBTaUZpdmUgQ2x1c3RlciBNYW5hZ2VtZW50IENv
bnRyb2xsZXIKPiA+IC0gU2lGaXZlIENvcmUgQ29tcGxleCBNYW5hZ2VtZW50IENvbnRyb2xsZXIK
PiA+Cj4gPiBUaGVzZSBjb250cm9sbGVycyBjb250cm9sIHRoZSBjbG9jayBhbmQgcG93ZXIgZG9t
YWluIG9mIHRoZQo+ID4gY29ycmVzcG9uZGluZyBkb21haW4uCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogTmljayBIdSA8bmljay5odUBzaWZpdmUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IFNhbXVlbCBI
b2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcG93ZXIvc2lmaXZlLHRtYy55YW1sIHwgODkgKysrKysrKysrKysrKysr
KysrKwo+Cj4gV2hlcmUgaXMgYSBwYXRjaCB3aXRoIHRoZSBkcml2ZXIgKHVzZXIgb2YgdGhlIGJp
bmRpbmcpPwo+CldlIGFyZSBob3BpbmcgdGhlIGRyaXZlciBjYW4gYmUgc3VibWl0dGVkIGF0IGEg
bGF0ZXIgc3RhZ2UuClRoZSBkcml2ZXIgdGhhdCBoYW5kbGVzIHRoZSBNTUlPIGlzIGltcGxlbWVu
dGVkIGluIE9wZW5TQkkgYW5kIGRlcGVuZHMKb24gc29tZSBwcmVyZXF1aXNpdGUgcGF0Y2hlcyBb
MV0sIHNvIGl0IHdpbGwgZm9sbG93IGFmdGVyd2FyZC4KCkxpbmtzOgotIFsxXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9vcGVuc2JpL0NBS2RkQWtEMDBnTGdwek9DWFk5bVhhZWJyMnFaY1U5bWtV
R09aNDI3OHcwYm1pTHVCUUBtYWlsLmdtYWlsLmNvbS9ULyN0Cgo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCA4OSBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9zaWZpdmUsdG1jLnlhbWwKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3NpZml2ZSx0bWMu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9zaWZpdmUsdG1j
LnlhbWwKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjdl
ZDRmMjkwYjk0Ygo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3NpZml2ZSx0bWMueWFtbAo+ID4gQEAgLTAsMCArMSw4OSBA
QAo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTIt
Q2xhdXNlKQo+ID4gKyVZQU1MIDEuMgo+ID4gKy0tLQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvcG93ZXIvc2lmaXZlLHRtYy55YW1sIwo+ID4gKyRzY2hlbWE6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gKwo+ID4gK3RpdGxl
OiBTaUZpdmUgRG9tYWluIE1hbmFnZW1lbnQgQ29udHJvbGxlcgo+ID4gKwo+ID4gK21haW50YWlu
ZXJzOgo+ID4gKyAgLSBDeWFuIFlhbmcgPGN5YW4ueWFuZ0BzaWZpdmUuY29tPgo+ID4gKyAgLSBO
aWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+Cj4gPiArICAtIFNhbXVlbCBIb2xsYW5kIDxzYW11
ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgo+ID4gKwo+ID4gK2Rlc2NyaXB0aW9uOiB8Cj4gPiArICBU
aGlzIGlzIHRoZSBkZXZpY2UgdHJlZSBiaW5kaW5nIGZvciB0aGUgZm9sbG93aW5nIFNpRml2ZSBE
b21haW4gTWFuYWdlbWVudCBDb250cm9sbGVycy4KPgo+IEV4cGxhaW4gdGhlIGhhcmR3YXJlLCBu
b3QgdGhhdCAiYmluZGluZyBpcyBhIGJpbmRpbmcgZm9yIC4uLiIuCj4KPiBBbHNvLCB3cmFwIGFj
Y29yZGluZyB0byBMaW51eCBjb2Rpbmcgc3R5bGUuCj4KVGhhbmtzIGZvciB0aGUgYWR2aWNlLiBJ
J2xsIGFkZHJlc3MgaXQgaW4gdGhlIG5leHQgdmVyc2lvbiA9KQoKPiA+ICsKPiA+ICsgIHJlZzoK
PiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+ICsKPiA+ICsgIHNpZml2ZSxmZWF0dXJlLWxldmVsOgo+
ID4gKyAgICBkZXNjcmlwdGlvbjogfAo+ID4gKyAgICAgIFN1cHBvcnRlZCBwb3dlciBmZWF0dXJl
cy4gVGhpcyBwcm9wZXJ0eSBpcyBhYnNlbnQgaWYgdGhlIGZ1bGwgc2V0IG9mIGZlYXR1cmVzCj4g
PiArICAgICAgaXMgc3VwcG9ydGVkCj4KPiBDb21wYXRpYmxlIGRlZmluZXMgdGhpcy4gRHJvcC4K
PgpUaGUgcHJvcGVydHkgZGVwZW5kcyBvbiBob3cgdGhlIElQIGlzIGhvb2tlZCB1cCB0byB0aGUg
cmVzdCBvZiB0aGUgU29DLgpIYXZpbmcgdGhpcyBwcm9wZXJ0eSBzaW1wbGlmaWVzIHRoZSBTVyBh
bmQgYWxsb3dzIHVzIHRvIHVzZSBhIHNpbmdsZQpmYWxsYmFjayBjb21wYXRpYmxlIHN0cmluZywg
c28gd2UgcHJlZmVyIHRvIGtlZXAgaXQuCgpCZXN0IFJlZ2FyZHMsCk5pY2sKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
