Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D35CAC5B0
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 20:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkXJFVdF9pUA8DWNDZ6Yh5CFvLhViIpMNQWXniA5r/k=; b=TXAputWfedvAtzSE0dZNNYVEN0
	O01VyfjzyEn0Z6CN/ICN/LNyEJK9HMkncOQYhOTVv5wdBl8YSWmuWLi02n6bi1dedDG/MZV8pX7S9
	P4P4v7C5eQVQewAzynlGu/tTEeUrXkQ9Ab7/a6w3aOXOBBNbqDsTFsfCJJx/Az02/qf22PFbKAlwC
	B0st1ZPOaX1L/a3frFv1epDE3yGMqAcJ/NoPW2Z8lvxilzBEtH3pN+Yl92JZbVREuHcvcGRk1d5JQ
	RolWXBAl3xEqr/QdhqOSWKWCPHLPW2b50VQkkXNl80f2KSsHv5BMzgw3LrPysHILl6++NQOv/YBqt
	FBCuaDFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Q9V-0000000BBek-34uy;
	Thu, 02 Oct 2025 20:43:49 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Q9T-0000000BBdh-0aEy
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 20:43:48 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b49c1c130c9so1032692a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Oct 2025 13:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759437826; x=1760042626; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HRY0VePK+ES3Imbvh+CGHLFf9jXlNxuHmEATSkHnxuM=;
        b=FgfvlP7w09VwlJv+z2vzo9aNGfH/dAqiA/c3E1iNN5TvMug1zdyJSKSQT400AQrOCt
         YUgAsPrW7vfUL8t4F+7DxmsWZNmmiCY1pOORAvHTZ/ZJzIDVSiPO7U5RUip+oAJCq2VE
         esNOtRJod0m+toQXKXIy/50fcqnExAfcfkzNLe0mn7YI3EbdrqO9+e9ltYprhjkV2aXK
         Pp93flYEPh7drNqxzgnkc9woAlqmy85iK6v1FrPdjHxUYNWzH1GqoAQSP4HHyVss9K9m
         WzgTBTkDzrqfYL+GlhJga0mUEGUQo/G3MAM4pCVC8kgvXEr8NlDb8u9TS9uwfuQj4B0R
         NclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759437826; x=1760042626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRY0VePK+ES3Imbvh+CGHLFf9jXlNxuHmEATSkHnxuM=;
        b=UHZeUwXP0nJeW1bF80AHF1SkLOkNGOCDMrdOEDdkfc381kTFslETVqXlDkT6HvF6HU
         /KqrYNMtQRGvJQvnIm/NO2R3UzYkQjryluF7iqJ4j/RbOR0LRP+86qXlPbq5xRktWObj
         eN/shwMIBKb7XBZGAzfxOKSrNztwgbddJS2syFt8AOsQ7C298+bIgquaB99pkO0wgQpK
         T46qRX1WQYwSDb2W3P9X1LoG2b5yHfIdxIjkz11iEE2NdBFtvnn5SpEa1X6qJ/m9VOcz
         et80WgzOzbBjDHekEjXSoNUMQcQ7cXYxKTa8MD5GZT/JxeUH/aJvx5icF+BTvG3rC3Se
         jq+w==
X-Forwarded-Encrypted: i=1; AJvYcCXTqLoWb1Egwl9cb6fpPySYYIspJcKjWYxMdh7egyY0Nye1haqyPWxRVqVrS9wCByU2w7Wy4ZqOo4xdrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIhe8n8SaqxtBqDYn8ijCPo5TohCV2nKrjDgWnMFK81cBdGWSq
	T6jP1vIk7rsw6yFm0rqq6N3aj8YzioH4T7bT7z8spq0OMluyQ3LUa4Z1
X-Gm-Gg: ASbGnctiiQ3Y5g3k3z0TdDM1UqLbc5xUi0GyO9yN6nc7sqtoxm9Z4ZJzprpZ4kIan11
	fhs6xv8cPm+VPriIWwfsETi9TUmj9qpnwV5eK5eTAxJHOee16+uOd9NJ9mMz+sdyp56L0aOyTUP
	cjNHfSfkuSrdsX82quNseoXo+ZmzE5mnHduDaeS6R/AGah+0TSGWjL1eWxeevTE5F42CeKJWiR7
	IbtBplpcGODlBt7jMzgUbgCq/iVvQUolQxnIUPGKGizjWYmpWRVi4p6XdzsiIgezFMiCcZT2s1H
	+iwRaPoZU9KpkBWpK1Pe6mvegMJB8c1aiPYZeNTeOLmmOdmu+kp/paPm4DAb3y+bXA9nrRtjYMQ
	8LcQUVZKzchMY3q4zkF8P04bCt2+e9xQn+jh9z5QHYX3D6LIM
X-Google-Smtp-Source: AGHT+IHwQNosp0cXnn1EJbHqUTcUQOaG4RULI0Bh4YmEkrcrselSen1z+26ZGolK8E4JLN9dpIcDCA==
X-Received: by 2002:a17:902:cece:b0:27d:6f49:feb8 with SMTP id d9443c01a7336-28e9a546360mr7478395ad.16.1759437825699;
        Thu, 02 Oct 2025 13:43:45 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d125e9fsm29618905ad.36.2025.10.02.13.43.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 13:43:45 -0700 (PDT)
Message-ID: <30efd90b-ba9f-4291-b9a1-8739f1c5f24b@gmail.com>
Date: Thu, 2 Oct 2025 13:42:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] Linux RISC-V trace framework and drivers
To: Greg KH <gregkh@linuxfoundation.org>, Anup Patel <apatel@ventanamicro.com>
References: <20251002060732.100213-1-apatel@ventanamicro.com>
 <2025100208-challenge-protrude-d6c3@gregkh>
 <CAK9=C2U9FV6crTL1G2X6tUM=RyRnPBm1dPeFc29n3vmrFTcfHw@mail.gmail.com>
 <2025100255-catcall-drinkable-23f5@gregkh>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <2025100255-catcall-drinkable-23f5@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_134347_199111_37F51184 
X-CRM114-Status: GOOD (  16.45  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Atish Patra <atish.patra@linux.dev>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Liang Kan <kan.liang@linux.intel.com>, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@redhat.com>, Adrian Hunter <adrian.hunter@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTAvMS8yNSAyMzo0NCwgR3JlZyBLSCB3cm90ZToKPiBPbiBUaHUsIE9jdCAwMiwgMjAyNSBh
dCAxMjowOToyM1BNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+PiBPbiBUaHUsIE9jdCAyLCAy
MDI1IGF0IDExOjU24oCvQU0gR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdy
b3RlOgo+Pj4KPj4+IE9uIFRodSwgT2N0IDAyLCAyMDI1IGF0IDExOjM3OjIxQU0gKzA1MzAsIEFu
dXAgUGF0ZWwgd3JvdGU6Cj4+Pj4gVGhpcyBzZXJpZXMgYWRkcyBpbml0aWFsIHN1cHBvcnQgZm9y
IFJJU0MtViB0cmFjZSBmcmFtZXdvcmsgYW5kIGRyaXZlcnMuCj4+Pj4gVGhlIFJJU0MtViB0cmFj
ZSB2MS4wIHNwZWNpZmljYXRpb24gaXMgYWxyZWFkeSByYXRpZmllZCBhbmQgY2FuIGJlIGZvdW5k
IGF0Ogo+Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL2UtdHJhY2UtZW5jYXAv
cmVsZWFzZXMvdGFnL3YxLjAuMC1yYXRpZmllZAo+Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNj
di1ub24taXNhL3RnLW5leHVzLXRyYWNlL3JlbGVhc2VzL3RhZy8xLjBfUmF0aWZpZWQKPj4+Pgo+
Pj4+IFRoZSBSSVNDLVYgdHJhY2UgZnJhbWV3b3JrIGFuZCBkcml2ZXJzIGFyZSBkZXNpZ25lZCB0
byBiZSBhZ25vc3RpYyB0byB0aGUKPj4+PiB1bmRlcmx5aW5nIHRyYWNlIHByb3RvY29sIGhlbmNl
IGJvdGggUklTQy1WIEUtdHJhY2UgYW5kIFJJU0MtViBOLXRyYWNlIHNob3VsZAo+Pj4+IHdvcmsg
ZmluZS4gVGhlIGRpc2NvdmVyeSBvZiB0cmFjZSBwcm90b2NsIHBhcmFtZXRlcnMgYXJlIGxlZnQg
dG8gdXNlci1zcGFjZQo+Pj4+IHRyYWNlIGRlY29kZXIuCj4+Pj4KPj4+PiBJbiB0aGVyIGZ1dHVy
ZSwgdGhlcmUgd2lsbCBiZSBzdWJzZXF1ZW50IHNlcmllcyBhZGRpbmc6Cj4+Pj4gMSkgU3lzZnMg
c3VwcG9ydAo+Pj4KPj4+IHdoeSBkb2VzICJ0cmFjZSIgbmVlZCBzeXNmcyBzdXBwb3J0PyAgTm8g
b3RoZXIgY3B1IHBsYXRmb3JtIHVzZXMgdGhhdAo+Pj4gdG9kYXksIHNvIHdoeSBpcyBhIG5ldyB1
c2VyL2tlcm5lbCBhcGkgbmVlZGVkPwo+Pgo+PiBXZSBzYXcgdHJhY2Ugc3VwcG9ydCBmb3Igb3Ro
ZXIgYXJjaGl0ZWN0dXJlcyAoZS5nLiBBUk0gY29yZXNpZ2h0KSBhbGxvd2luZwo+PiB0cmFjZSBz
dGFydC9zdG9wIHRocm91Z2ggc3lzZnMuIElmIHRoaXMgaXMgYW4gb2Jzb2xldGUgb3Igbm90IHBy
ZWZlcnJlZCBhcHByb2FjaAo+PiB0aGVuIHdlIHdpbGwgZGVwcmlvcml0aXplIGFuZCBwb3NzaWJs
eSBuZXZlciBhZGQgaXQuCj4gCj4gV2h5IGlzIHRoYXQgbmVlZGVkIGZvciBjb3Jlc2lnaHQgYW5k
IG90aGVyIGFyY2hlcyBkbyBub3QgbmVlZCBpdD8KPiBQZXJoYXBzIGl0IHNob3VsZCBiZSBkZWxl
dGVkIGZyb20gdGhhdCBjb2RlYmFzZSBpbnN0ZWFkPwo+IAo+IHRoYW5rcywKPiAKPiBncmVnIGst
aAoKSGkgR3JlZywKCnN5c2ZzIGlzIGhlbHBmdWwgZm9yIGNvbnRyb2xsaW5nIHRoZSB0cmFjZSBp
ZiBub3QgdXRpbGl6ZWQgdGhyb3VnaCBwZXJmCmZyYW1ld29yay4gSXQgY2FuIGFsc28gYmUgdXNl
ZCBieSB1c2Vyc3BhY2UgdG8gZGlzY292ZXIgdGhlIHRvcG9sb2d5IG9mCnRyYWNlIGNvbXBvbmVu
dHMgYW5kIHRoZWlyIGNhcGFiaWxpdGllcy4gQEFudXAgSSBhc3N1bWUgdGhpcyBkcml2ZXIgaXMK
ZGVzaWduZWQgd2l0aCBvdGhlciBzaW5rcyBpbiBtaW5kIChub3QganVzdCByYW1zaW5rKSwgc28g
aXQgY2FuIGJlIHVzZWQKdG8gZW1pdCB0cmFjZSB0byBleHRlcm5hbCBwcm9iZXMsIHJpZ2h0PwoK
Qm8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
