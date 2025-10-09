Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9B4CCD184
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 13:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OsBIOmnSHk3RV5RfTV8DKlpkO8JjsmChLY+MYy4XjGg=; b=J77r4fLD0rfutn
	bur5JhWnLSUvF90wlUsVmBUNKpd7HxSBiuhYg6dacguifhW5m9sdyrM6x9e+XZzF2tZ/neO6yC4cC
	9kfJ1yN1fbPdQXZFlQFQnmcV2QzRGqumqw0c8HlI5h4VmR5BfyrA1fkRS3ztyvHt8SBg06aSDxthS
	1Tyoz6DLS1j/SjCsBjZD0inGQ3miZPESEie4Uj1VgszpynQDdiUsfYJUse1uGhe1aAb96u0UC9U75
	UNuLuluV8yM2iFh5CNLRqTPf/+bZJc/f/mkrVHVKSJiMIWZx4PhmnMG6BibWccUUsKyG3KlkHsLI0
	ezH82Uv1mw/YhDjh8R1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qn2-00000006Exu-0hLN;
	Thu, 09 Oct 2025 13:34:40 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qmz-00000006ExI-0Hi5
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 13:34:38 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-59066761388so1996188e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 06:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760016874; x=1760621674; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dSErVy5gy3iTqfs+Fv+uBfQPNdt1PnHnP4LjyzMeiA=;
        b=LBBRuR4jCbIhfMJ/JahOTPdgenLW3hZ47tqE9cWmNptLahEH1Wq7Vigk5BtY9p87qF
         oy4W5K8JCdmrYqvON6xJxnxwIcbD+i2moGEkr/6z+ii0sQUpMY+nC6pz0x5EdoFna6+Z
         ZC66CxbkRRYdjuIRxFacMRS/c4sUQDmRtWnx86pCjrE3W/seQaH1jRqusse1dpyf6OCL
         IBX4bVK8CTSQK/xA2SqLnyZv39/akXVNCCboETlCe5M50LVehA0CE0/syBzgFRv7GIwg
         VMdSNr3JNB7H0WQVwsg6nUmZh2caUj5Avdjn4d0/UWF7YiwCaA+4yuwpqF9hdw6/Ch7Q
         Xavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760016874; x=1760621674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dSErVy5gy3iTqfs+Fv+uBfQPNdt1PnHnP4LjyzMeiA=;
        b=xB4NsPs3FSjLpNGdV9IOI4R0gry+BHQUGtxGWSo1zdtCXiBH3gFgmpRsz8XE8WybAR
         aBZswccnCvalCGxr2QMZbJ3JawrrjDNNzWTRcO0KR7iZ8uiC6CjX7iIzWAwQLRAlD0FR
         T/cfd8zVr46Ie576edh6/sNa9w5bbz7hVpTiNvRtUZ4uR8VvtQE2SxA7aJ42nIII9aPe
         6lNWOZmitCMFPn1CdYzeqYY577x+brOCZnFF2Cm6jEctuoVzCuSkHiSjKbQ0Uh16RZuv
         tva8cO4++UmgZOynCtLTVmEGOIR10GNGSxbgeE/BMTrxamJAD9d9lOW6Ed5vLjTijRnk
         BVAA==
X-Forwarded-Encrypted: i=1; AJvYcCVBvbiVq6ZhOHkGU5pwFn7S11m9u5ql23CUkF9udHu+4/zYz9fxzPSR+GMKVpbnBO3gKyGZz8NH5yFA7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFa3qn3uQo9RmwbwwB1vTEu8HHXpDfbif61+B2tNZfzwkDTT4c
	UWKM3VTPmKDF/PLOIU1YLcf2Z+grdwWHLeDF36OhDvYM4UbzothhIEfSEsC2SlB0m6YuZkBUNDi
	7BHl580Zsu9+ArAdfAX2ZsJNTlqWTGzNgivEZty1clA==
X-Gm-Gg: ASbGncvnwCnBG6HXTRA/CVJ0YhpOtTKNIFCAOKa7vSO2woSYtqfUtDHF3OkK7fN+DCc
	FAGj8qp9e0lrLfHhryaJtorZ/swWzzNG2f4cjkmzK90XSlF6lfplSV9OGADA8eLIzVkAJBGehLG
	0bnz9FAvD/uQUriBAv9sW7mPoKKhKz5nKtTbwRfJUIGrtgnOcEkGwFEdfF7p/K+C930nMxEsGl+
	P66kVr23f80wlXWjl4l8zGIYG7GGkyJg8lDQdqDyg==
X-Google-Smtp-Source: AGHT+IHWWJUMwgLO59lk5lakKRaZ+/wVoeJhFN8a16uOzpMmsGJAl1afZO0Y0UWvv4eDfAIFgKUZh54hbk7hVJVmV4E=
X-Received: by 2002:a05:6512:23a8:b0:571:d258:5639 with SMTP id
 2adb3069b0e04-5905e398890mr3351104e87.25.1760016874419; Thu, 09 Oct 2025
 06:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20251002060732.100213-1-apatel@ventanamicro.com>
 <20251002060732.100213-2-apatel@ventanamicro.com> <20251002192506.GA236729-robh@kernel.org>
In-Reply-To: <20251002192506.GA236729-robh@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 9 Oct 2025 19:04:22 +0530
X-Gm-Features: AS18NWACKtl7ERcN8H5MlfK2QBMUHI9VMMe2RI6b1AOyUjn27L1IFJvaV0ijKkc
Message-ID: <CAK9=C2WO5vNs0Y_w8Pk9WWMeYe8Kxhaow5b_QxQWfobL5mrZoQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] dt-bindings: Add RISC-V trace component bindings
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_063437_175614_17B63629 
X-CRM114-Status: GOOD (  30.56  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Atish Patra <atish.patra@linux.dev>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Liang Kan <kan.liang@linux.intel.com>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@redhat.com>, Greg KH <gregkh@linuxfoundation.org>, Adrian Hunter <adrian.hunter@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUm9iLAoKQXBvbG9naWVzIGZvciB0aGUgZGVsYXllZCByZXNwb25zZSAuLi4KCk9uIEZyaSwg
T2N0IDMsIDIwMjUgYXQgMTI6NTXigK9BTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3
cm90ZToKPgo+IE9uIFRodSwgT2N0IDAyLCAyMDI1IGF0IDExOjM3OjIyQU0gKzA1MzAsIEFudXAg
UGF0ZWwgd3JvdGU6Cj4gPiBBZGQgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSBtZW1vcnkg
bWFwcGVkIFJJU0MtViB0cmFjZSBjb21wb25lbnRzCj4gPiB3aGljaCBzdXBwb3J0IGJvdGggdGhl
IFJJU0MtViBlZmZpY2llbnQgdHJhY2UgKEUtdHJhY2UpIHByb3RvY29sIGFuZAo+ID4gdGhlIFJJ
U0MtViBOZXh1cy1iYXNlZCB0cmFjZSAoTi10cmFjZSkgcHJvdG9jb2wuCj4gPgo+ID4gVGhlIFJJ
U0MtViB0cmFjZSBjb21wb25lbnRzIGFyZSBkZWZpbmVkIGJ5IHRoZSBSSVNDLVYgdHJhY2UgY29u
dHJvbAo+ID4gaW50ZXJmYWNlIHNwZWNpZmljYXRpb24uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
QW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vYmlu
ZGluZ3MvcmlzY3YvcmlzY3YsdHJhY2UtY29tcG9uZW50LnlhbWwgfCAxMTAgKysrKysrKysrKysr
KysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDExMCBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9yaXNj
dix0cmFjZS1jb21wb25lbnQueWFtbAo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvcmlzY3YsdHJhY2UtY29tcG9uZW50LnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvcmlzY3YsdHJhY2UtY29tcG9u
ZW50LnlhbWwKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAu
Ljc4YTcwZmUwNGRmZQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3Jpc2N2LHRyYWNlLWNvbXBvbmVudC55YW1sCj4gPiBA
QCAtMCwwICsxLDExMCBAQAo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4w
LW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ID4gKyVZQU1MIDEuMgo+ID4gKy0tLQo+ID4gKyRpZDog
aHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcmlzY3YvcmlzY3YsdHJhY2UtY29tcG9uZW50
LnlhbWwjCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9j
b3JlLnlhbWwjCj4gPiArCj4gPiArdGl0bGU6IFJJU0MtViBUcmFjZSBDb21wb25lbnQKPiA+ICsK
PiA+ICttYWludGFpbmVyczoKPiA+ICsgIC0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz4KPiA+ICsKPiA+ICtkZXNjcmlwdGlvbjoKPiA+ICsgIFRoZSBSSVNDLVYgdHJhY2UgY29udHJv
bCBpbnRlcmZhY2Ugc3BlY2lmaWNhdGlvbiBzdGFuZGFyZCBtZW1vcnkgbWFwcGVkCj4gPiArICBj
b21wb25lbnRzIChvciBkZXZpY2VzKSB3aGljaCBzdXBwb3J0IGJvdGggdGhlIFJJU0MtViBlZmZp
Y2llbnQgdHJhY2UKPiA+ICsgIChFLXRyYWNlKSBwcm90b2NvbCBhbmQgdGhlIFJJU0MtViBOZXh1
cy1iYXNlZCB0cmFjZSAoTi10cmFjZSkgcHJvdG9jb2wuCj4gPiArICBUaGUgUklTQy1WIHRyYWNl
IGNvbXBvbmVudHMgaGF2ZSBpbXBsZW1lbnRhdGlvbiBzcGVjaWZpYyBkaXJlY3RlZCBhY3ljbGlj
Cj4gPiArICBncmFwaCBzdHlsZSBpbnRlcmRlcGVuZGVuY3kgd2hlcmUgb3V0cHV0IG9mIG9uZSBj
b21wb25lbnQgc2VydmVzIGFzIGlucHV0Cj4gPiArICB0byBhbm90aGVyIGNvbXBvbmVudCBhbmQg
Y2VydGFpbiBjb21wb25lbnRzIChzdWNoIGFzIGZ1bm5lbCkgY2FuIHRha2UgaW5wdXRzCj4gPiAr
ICBmcm9tIG11bHRpcGxlIGNvbXBvbmVudHMuCj4gPiArCj4gPiArcHJvcGVydGllczoKPiA+ICsg
IGNvbXBhdGlibGU6Cj4gPiArICAgIGl0ZW1zOgo+ID4gKyAgICAgIC0gZW51bToKPiA+ICsgICAg
ICAgICAgLSBxZW11LHRyYWNlLWNvbXBvbmVudAo+ID4gKyAgICAgIC0gY29uc3Q6IHJpc2N2LHRy
YWNlLWNvbXBvbmVudAo+Cj4gR2l2ZW4gdGhlIGdlbmVyaWMtbmVzcyBvZiB0aGVzZSBuYW1lcywg
SSdtIGFzc3VtaW5nIHRoZSBleGFjdCB0eXBlIG9mCj4gY29tcG9uZW50IGlzIGRpc2NvdmVyYWJs
ZS4gSSBkb24ndCBsaWtlIHRvIGFzc3VtZSB0aGluZ3MgaW4gYmluZGluZ3MsIHNvCj4gc3BlbGwg
dGhhdCBvdXQuCj4KPiBJcyB0aGUgaW1wbGVtZW50ZXIgZGlzY292ZXJhYmxlPyBJZiBzbywgeW91
IGNvdWxkIG9taXQgdGhlIDFzdAo+IGNvbXBhdGlibGUuCgpUaGUgY29tcG9uZW50IHR5cGUgYW5k
IGNvbXBvbmVudCB2ZXJzaW9uIGlzIGRpc2NvdmVyYWJsZSB0aHJvdWdoCnJlYWQtb25seSBNTUlP
IHJlZ2lzdGVycyBidXQgdGhlIGltcGxlbWVudGVyIG9mIHRoZSBjb21wb25lbnQKbmVlZHMgdG8g
YmUgaW5mZXJyZWQgdXNpbmcgaW1wbGVtZW50YXRpb24gc3BlY2lmaWMgY29tcGF0aWJsZSBzdHJp
bmcuCkkgd2lsbCBhZGQgc29tZSB0ZXh0IGFsb25nIHRoZXNlIGxpbmVzIGluIHRoZSBhYm92ZSBk
ZXNjcmlwdGlvbi4KCj4KPiA+ICsKPiA+ICsgIHJlZzoKPiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+
ICsKPiA+ICsgIGNwdToKPgo+ICdjcHVzJyBpcyB0aGUgbW9yZSBzdGFuZGFyZCBwcm9wZXJ0eS4K
Ck9rYXksIEkgd2lsbCB1cGRhdGUuCgo+Cj4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAg
IHBoYW5kbGUgdG8gdGhlIGNwdSB0byB3aGljaCB0aGUgUklTQy1WIHRyYWNlIGNvbXBvbmVudCBp
cyBib3VuZC4KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMv
cGhhbmRsZQo+Cj4gd2hpY2ggYWxyZWFkeSBoYXMgYSB0eXBlLiBTbyBqdXN0ICdtYXhJdGVtczog
MScgaGVyZS4KCk9rYXksIEkgd2lsbCB1cGRhdGUuCgo+Cj4gPiArCj4gPiArICBpbi1wb3J0czoK
PiA+ICsgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0cwo+ID4g
KyAgICBwYXR0ZXJuUHJvcGVydGllczoKPiA+ICsgICAgICAnXnBvcnQoQFswLTddKT8kJzoKPiA+
ICsgICAgICAgIGRlc2NyaXB0aW9uOiBJbnB1dCBjb25uZWN0aW9ucyBmcm9tIFJJU0MtViB0cmFj
ZSBjb21wb25lbnQKPiA+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3Bl
cnRpZXMvcG9ydAo+Cj4gSWYgdGhlIE4gcG9ydHMgYXJlIE4gb2YgdGhlIHNhbWUgZGF0YSAobGlr
ZSBhIG11eCksIHRoZW4gZmluZS4gSWYgZWFjaAo+IHBvcnQgaXMgZGlmZmVyZW50LCB0aGVuIHlv
dSBuZWVkIHRvIGRlZmluZSB3aGF0IGVhY2ggcG9ydCBpcy4KClllcywgdGhlIGRhdGEgKGFrYSB0
cmFjZSBwYWNrZXRzKSBpcyB0aGUgc2FtZSBmb3IgYWxsIGlucHV0IHRyYWNlIHBvcnRzCmV2ZW4g
aW4tY2FzZSBvZiBmdW5uZWwgKGFrYSBtdXgpLiBTYW1lIHRoaW5nIGFsc28gYXBwbGllcyB0byB0
aGUKb3V0cHV0IHBvcnRzLgoKPgo+ID4gKwo+ID4gKyAgb3V0LXBvcnRzOgo+ID4gKyAgICAkcmVm
OiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnRzCj4gPiArICAgIHBhdHRlcm5Q
cm9wZXJ0aWVzOgo+ID4gKyAgICAgICdecG9ydChAWzAtN10pPyQnOgo+ID4gKyAgICAgICAgZGVz
Y3JpcHRpb246IE91dHB1dCBjb25uZWN0aW9ucyBmcm9tIFJJU0MtViB0cmFjZSBjb21wb25lbnQK
PiA+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydAo+
ID4gKwo+ID4gK3JlcXVpcmVkOgo+ID4gKyAgLSBjb21wYXRpYmxlCj4gPiArICAtIHJlZwo+ID4g
Kwo+ID4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPiA+ICsKPiA+ICtleGFtcGxlczoK
PiA+ICsgIC0gfAo+ID4gKyAgICAvLyBFeGFtcGxlIDEgKFBlci1oYXJ0IGVuY29kZXIgYW5kIHJh
bXNpbmsgY29tcG9uZW50cyk6Cj4gPiArCj4gPiArICAgIGVuY29kZXJAYzAwMDAwMCB7Cj4KPiBQ
ZXJoYXBzIGl0IGlzIHRpbWUgdG8gc3RhbmRhcmRpemUgdGhlIG5vZGUgbmFtZXMgaGVyZS4gUGVy
aGFwcyAndHJhY2UnLgoKSXQgaXMgYmV0dGVyIHRvIG5vdCBmaXggdGhlIG5vZGUgbmFtZXMgYmVj
YXVzZSB0aGlzIGFsbG93cyB1c2Vycwp0byBpbmZlciB0eXBlIG9mIGNvbXBvbmVudCBmcm9tIG5v
ZGUgbmFtZSBoZW5jZSBtb3JlIGh1bWFuCnJlYWRhYmxlLgoKPgo+ID4gKyAgICAgIGNvbXBhdGli
bGUgPSAicWVtdSx0cmFjZS1jb21wb25lbnQiLCAicmlzY3YsdHJhY2UtY29tcG9uZW50IjsKPiA+
ICsgICAgICByZWcgPSA8MHhjMDAwMDAwIDB4MTAwMD47Cj4gPiArICAgICAgY3B1ID0gPCZDUFUw
PjsKPiA+ICsgICAgICBvdXQtcG9ydHMgewo+ID4gKyAgICAgICAgcG9ydCB7Cj4gPiArICAgICAg
ICAgIENQVTBfRU5DT0RFUl9PVVRQVVQ6IGVuZHBvaW50IHsKPiA+ICsgICAgICAgICAgICByZW1v
dGUtZW5kcG9pbnQgPSA8JkNQVTBfUkFNU0lOS19JTlBVVD47Cj4gPiArICAgICAgICAgIH07Cj4g
PiArICAgICAgICB9Owo+ID4gKyAgICAgIH07Cj4gPiArICAgIH07Cj4gPiArCj4gPiArICAgIHJh
bXNpbmtAYzAwMTAwMCB7Cj4gPiArICAgICAgY29tcGF0aWJsZSA9ICJxZW11LHRyYWNlLWNvbXBv
bmVudCIsICJyaXNjdix0cmFjZS1jb21wb25lbnQiOwo+ID4gKyAgICAgIHJlZyA9IDwweGMwMDEw
MDAgMHgxMDAwPjsKPiA+ICsgICAgICBjcHUgPSA8JkNQVTA+Owo+ID4gKyAgICAgIGluLXBvcnRz
IHsKPiA+ICsgICAgICAgIHBvcnQgewo+ID4gKyAgICAgICAgICBDUFUwX1JBTVNJTktfSU5QVVQ6
IGVuZHBvaW50IHsKPiA+ICsgICAgICAgICAgfTsKPiA+ICsgICAgICAgIH07Cj4gPiArICAgICAg
fTsKPiA+ICsgICAgfTsKPiA+ICsKPiA+ICsgICAgZW5jb2RlckBjMDAyMDAwIHsKPiA+ICsgICAg
ICBjb21wYXRpYmxlID0gInFlbXUsdHJhY2UtY29tcG9uZW50IiwgInJpc2N2LHRyYWNlLWNvbXBv
bmVudCI7Cj4gPiArICAgICAgcmVnID0gPDB4YzAwMjAwMCAweDEwMDA+Owo+ID4gKyAgICAgIGNw
dSA9IDwmQ1BVMT47Cj4gPiArICAgICAgb3V0LXBvcnRzIHsKPiA+ICsgICAgICAgIHBvcnQgewo+
ID4gKyAgICAgICAgICBDUFUxX0VOQ09ERVJfT1VUUFVUOiBlbmRwb2ludCB7Cj4gPiArICAgICAg
ICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZDUFUxX1JBTVNJTktfSU5QVVQ+Owo+ID4gKyAgICAg
ICAgICB9Owo+ID4gKyAgICAgICAgfTsKPiA+ICsgICAgICB9Owo+ID4gKyAgICB9Owo+ID4gKwo+
ID4gKyAgICByYW1zaW5rQGMwMDMwMDAgewo+ID4gKyAgICAgIGNvbXBhdGlibGUgPSAicWVtdSx0
cmFjZS1jb21wb25lbnQiLCAicmlzY3YsdHJhY2UtY29tcG9uZW50IjsKPiA+ICsgICAgICByZWcg
PSA8MHhjMDAzMDAwIDB4MTAwMD47Cj4gPiArICAgICAgY3B1ID0gPCZDUFUxPjsKPiA+ICsgICAg
ICBpbi1wb3J0cyB7Cj4gPiArICAgICAgICBwb3J0IHsKPiA+ICsgICAgICAgICAgQ1BVMV9SQU1T
SU5LX0lOUFVUOiBlbmRwb2ludCB7Cj4gPiArICAgICAgICAgIH07Cj4gPiArICAgICAgICB9Owo+
ID4gKyAgICAgIH07Cj4gPiArICAgIH07Cj4gPiArCj4gPiArLi4uCj4gPiAtLQo+ID4gMi40My4w
Cj4gPgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
