Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2934CE9410B
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jan 2026 03:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4mSdrw1zw2k4GCXuvLarCPEa3mucC/bhchhiFUdCtG4=; b=JX9LZuWn4E4fYZ
	hHx2xEZIjkisGDt/VOdek103KYjQKpFnu7hm/NC8BPYxkv+wJLURY8oJhravSKjfMFGhxdAeioZEB
	C4yOdM82HMBimt8hIAynW1ocG9NyE1XR5fvgDMTROAHUOWPC9FFUT9nkke1ArJoaV0SEhYSXvNh75
	ea6VRMaoNFjqEQj/oO2YQleQUwQ98D6boDfFrmYLhN7oHIg77QQQp6gNOTP93q/xd7wQnd8RY4ceK
	zgFTYiEqXPqZ4y85WQycPONB/zLeOGbpkoCuETNW7Hc4oomkI37U287pIXIpdcoE6TEmvkWJD34PO
	wIf0F7M/rplo2N8743WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbW0E-00000007kiQ-1Ii0;
	Fri, 02 Jan 2026 03:39:02 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbW0A-00000007khw-37dp
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jan 2026 03:39:00 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-59911cb8c3cso13076363e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Jan 2026 19:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1767325136; x=1767929936; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekrtQRRLGLXEelflBuetfwrb921FLgqd/BoiKYMjwXM=;
        b=CgXyxj4fPSrihNZtrH5K2boAkQwsCM1xl25wJiB16qgHuYD22fTxODw5qpIMc60EA4
         uB2tFQ70vqrtq7UoOJ10Z6Ltd9DMwYzO5tsWpUOMF0nKbYaKAD3wUS4agaHFwG5m77/Q
         GWShn+R0FVQ1idNUtMvflxVwVPeh7n79L5yBoACfONRUObufsYIa1cO4kZDsIGZkcutC
         YL8tyjV9k6WpZ3rT9OZgBqnErQkulhQ6P5DGsm4nZY9I49+fRooycKTjgz2u+kzDyQ2f
         uaP2JIzqaod0t96wUJ82u34qN0bUjenJMm24qgUhlo8K6IYceHjmGRefRLZ24AfrflHc
         WXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767325136; x=1767929936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ekrtQRRLGLXEelflBuetfwrb921FLgqd/BoiKYMjwXM=;
        b=PC97EJgK+NQN0EoGZ2Vc7MI019rxcbEaNVFAg/igbLdRUNuDP6xfvYhiGlldV7eEKg
         Lt9AsMJHXE15JieOuwGPGZ0p74qnSS+2biyV6C9J1mc0UULUAkoyXBrGos2b38reEQrd
         AvUpmtqJz/IHYaQ0zQbtkqkVYPSWdGur9IE7sFh9651FlcVto5IB6kgDMCXDvHUadweM
         JgOtk0YobzIKGt+yFgA4YYdt00YmCV+hVOKbIldKqAHJR7TPDgRe5d3k8DAMRZwiLG0K
         dfFTm47nQ0mEEXgo5CObINn3LjGMOogUFVJ3pBd0nvLpLBNWPANvyD9vrFassZr7crBg
         Rk8w==
X-Forwarded-Encrypted: i=1; AJvYcCXJ9h1mIlw5edPDtdg+Z3WMLF0nV+429EhU42F99kuU3xkUcLuU7bbxSRXT7WaQCYKvnEzr95tYTtgVkA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwY0Crxj9KcMTsX9Nhhr/WBsYb17MP4rlMSpcO2jx2mymLvpN2C
	FXvSkdl05BLttTlCkt1sjaLknrv1J1wn88G7aUoBQZ3CwbC7D5lPWwubRt+u27vhukVI4bJz0z1
	SGMTqT16V+2M82v6yHGmddbBowzPpNrOZFtSfw7JGfg==
X-Gm-Gg: AY/fxX6ml7/g9iJNeJryQUQ+seFJLtS3aI1flhAAfr21OeFM4goBog56o1b+I0tMVpi
	edURqucysZAKKQs6J+/tYYOZAKIrNYl7cq8XeXlbQ6IUeRfZfAC2OskDFGIU+uD4bsYiWj362FM
	mLr7ZMVVaHPMMSpqtil3IpPx7lKwx3q6TmPeg62ZiyUFBmJ1rVceAFe5T5pNph69pWhKUrvvVmE
	L+LI+NNpZrdkk5mTS8nrrh4rD/90tFWKb1wpH3GUS23/BbwNaVmlCatmUbZVkT39UOIZqvXXO/u
	5olD0RlTIP2bPkolNl6qQgy676at
X-Google-Smtp-Source: AGHT+IEU0W/Byk2CEQA1P8tKcGxz+ScuXDHfZr5Xxq56aX1LeEsjkOwe93LcHwW5oBNnJ6TEwytUSyZTNOt6CHhVdNw=
X-Received: by 2002:a05:6512:3f09:b0:594:4e9f:98ec with SMTP id
 2adb3069b0e04-59a17d253ffmr15991375e87.20.1767325135062; Thu, 01 Jan 2026
 19:38:55 -0800 (PST)
MIME-Version: 1.0
References: <20251101154245.162492-1-apatel@ventanamicro.com>
 <20251101154245.162492-2-apatel@ventanamicro.com> <20251120163905.GA1484818-robh@kernel.org>
In-Reply-To: <20251120163905.GA1484818-robh@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 2 Jan 2026 09:08:39 +0530
X-Gm-Features: AQt7F2qdQ6mbf-zJ09J9whWJtEKkafZOw5WFR2pX5ragkLNPbOysXfUzX8lh30U
Message-ID: <CAK9=C2Uh5oMERkf9hX7ZH77pOjecx4iHDJNySa+c+frsxfqV1w@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: Add RISC-V trace component bindings
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_193858_846543_4E8C3A66 
X-CRM114-Status: GOOD (  26.44  )
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

T24gVGh1LCBOb3YgMjAsIDIwMjUgYXQgMTA6MDnigK9QTSBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFNhdCwgTm92IDAxLCAyMDI1IGF0IDA5OjEyOjM0UE0gKzA1
MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBBZGQgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRo
ZSBtZW1vcnkgbWFwcGVkIFJJU0MtViB0cmFjZSBjb21wb25lbnRzCj4gPiB3aGljaCBzdXBwb3J0
IGJvdGggdGhlIFJJU0MtViBlZmZpY2llbnQgdHJhY2UgKEUtdHJhY2UpIHByb3RvY29sIGFuZAo+
ID4gdGhlIFJJU0MtViBOZXh1cy1iYXNlZCB0cmFjZSAoTi10cmFjZSkgcHJvdG9jb2wuCj4gPgo+
ID4gVGhlIFJJU0MtViB0cmFjZSBjb21wb25lbnRzIGFyZSBkZWZpbmVkIGJ5IHRoZSBSSVNDLVYg
dHJhY2UgY29udHJvbAo+ID4gaW50ZXJmYWNlIHNwZWNpZmljYXRpb24uCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAtLS0KPiA+
ICAuLi4vYmluZGluZ3MvcmlzY3YvcmlzY3YsdHJhY2UtY29tcG9uZW50LnlhbWwgfCAxMTIgKysr
KysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDExMiBpbnNlcnRpb25zKCspCj4g
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
aXNjdi9yaXNjdix0cmFjZS1jb21wb25lbnQueWFtbAo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvcmlzY3YsdHJhY2UtY29tcG9uZW50
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvcmlzY3YsdHJh
Y2UtY29tcG9uZW50LnlhbWwKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAw
MDAwMDAwMDAuLjc5NzlhZjNkNDE3NAo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3Jpc2N2LHRyYWNlLWNvbXBvbmVudC55
YW1sCj4gPiBAQCAtMCwwICsxLDExMiBAQAo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ID4gKyVZQU1MIDEuMgo+ID4gKy0tLQo+
ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcmlzY3YvcmlzY3YsdHJhY2Ut
Y29tcG9uZW50LnlhbWwjCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEt
c2NoZW1hcy9jb3JlLnlhbWwjCj4gPiArCj4gPiArdGl0bGU6IFJJU0MtViBUcmFjZSBDb21wb25l
bnQKPiA+ICsKPiA+ICttYWludGFpbmVyczoKPiA+ICsgIC0gQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KPiA+ICsKPiA+ICtkZXNjcmlwdGlvbjoKPiA+ICsgIFRoZSBSSVNDLVYgdHJh
Y2UgY29udHJvbCBpbnRlcmZhY2Ugc3BlY2lmaWNhdGlvbiBzdGFuZGFyZCBtZW1vcnkgbWFwcGVk
Cj4gPiArICBjb21wb25lbnRzIChvciBkZXZpY2VzKSB3aGljaCBzdXBwb3J0IGJvdGggdGhlIFJJ
U0MtViBlZmZpY2llbnQgdHJhY2UKPiA+ICsgIChFLXRyYWNlKSBwcm90b2NvbCBhbmQgdGhlIFJJ
U0MtViBOZXh1cy1iYXNlZCB0cmFjZSAoTi10cmFjZSkgcHJvdG9jb2wuCj4gPiArICBUaGUgUklT
Qy1WIHRyYWNlIGNvbXBvbmVudHMgaGF2ZSBpbXBsZW1lbnRhdGlvbiBzcGVjaWZpYyBkaXJlY3Rl
ZCBhY3ljbGljCj4gPiArICBncmFwaCBzdHlsZSBpbnRlcmRlcGVuZGVuY3kgd2hlcmUgb3V0cHV0
IG9mIG9uZSBjb21wb25lbnQgc2VydmVzIGFzIGlucHV0Cj4gPiArICB0byBhbm90aGVyIGNvbXBv
bmVudCBhbmQgY2VydGFpbiBjb21wb25lbnRzIChzdWNoIGFzIGZ1bm5lbCkgY2FuIHRha2UgaW5w
dXRzCj4gPiArICBmcm9tIG11bHRpcGxlIGNvbXBvbmVudHMuIFRoZSB0eXBlIGFuZCB2ZXJzaW9u
IG9mIGEgUklTQy1WIHRyYWNlIGNvbXBvbmVudAo+ID4gKyAgY2FuIGJlIGRpc2NvdmVyZWQgZnJv
bSBpdCdzIElNUEwgbWVtb3J5IG1hcHBlZCByZWdpc3RlciBoZW5jZSBjb21wb25lbnQKPiA+ICsg
IHNwZWNpZmljIGNvbXBhdGlibGUgc3RyaW5ncyBhcmUgbm90IG5lZWRlZC4KPiA+ICsKPiA+ICtw
cm9wZXJ0aWVzOgo+ID4gKyAgY29tcGF0aWJsZToKPiA+ICsgICAgaXRlbXM6Cj4gPiArICAgICAg
LSBlbnVtOgo+ID4gKyAgICAgICAgICAtIHFlbXUsdHJhY2UtY29tcG9uZW50Cj4gPiArICAgICAg
LSBjb25zdDogcmlzY3YsdHJhY2UtY29tcG9uZW50Cj4KPiAnY29tcG9uZW50JyBzZWVtcyBhIGJp
dCByZWR1bmRhbnQuCgpUaGUgUklTQy1WIHRyYWNlIGNvbnRyb2wgc3BlY2lmaWNhdGlvbiByZWZl
cnMgdG8gTU1JTyB0cmFjZQpkZXZpY2VzIGFzICdjb21wb25lbnRzJyBoZW5jZSB3ZSBzaG91bGQg
a2VlcCB0aGUgJ2NvbXBvbmVudCcKbmFtZSBpbiB0aGUgY29tcGF0aWJsZSBzdHJpbmcuCgo+Cj4g
PiArCj4gPiArICByZWc6Cj4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiArCj4gPiArICBjcHVzOgo+
ID4gKyAgICBtYXhJdGVtczogMQo+ID4gKyAgICBkZXNjcmlwdGlvbjoKPiA+ICsgICAgICBwaGFu
ZGxlIHRvIHRoZSBjcHUgdG8gd2hpY2ggdGhlIFJJU0MtViB0cmFjZSBjb21wb25lbnQgaXMgYm91
bmQuCj4gPiArCj4gPiArICBpbi1wb3J0czoKPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgu
eWFtbCMvcHJvcGVydGllcy9wb3J0cwo+ID4gKyAgICBwYXR0ZXJuUHJvcGVydGllczoKPiA+ICsg
ICAgICAnXnBvcnQoQFswLTddKT8kJzoKPiA+ICsgICAgICAgIGRlc2NyaXB0aW9uOiBJbnB1dCBj
b25uZWN0aW9ucyBmcm9tIFJJU0MtViB0cmFjZSBjb21wb25lbnQKPiA+ICsgICAgICAgICRyZWY6
IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydAo+ID4gKwo+ID4gKyAgb3V0LXBv
cnRzOgo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnRz
Cj4gPiArICAgIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+ID4gKyAgICAgICdecG9ydChAWzAtN10pPyQn
Ogo+ID4gKyAgICAgICAgZGVzY3JpcHRpb246IE91dHB1dCBjb25uZWN0aW9ucyBmcm9tIFJJU0Mt
ViB0cmFjZSBjb21wb25lbnQKPiA+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwj
L3Byb3BlcnRpZXMvcG9ydAo+ID4gKwo+ID4gK3JlcXVpcmVkOgo+ID4gKyAgLSBjb21wYXRpYmxl
Cj4gPiArICAtIHJlZwo+Cj4gSXMgbm8gaW4gb3Igb3V0IHBvcnRzIHZhbGlkPyBJZiBub3QsIHlv
dSBuZWVkOgo+Cj4gYW55T2Y6Cj4gICAtIHJlcXVpcmVkOiBbIGluLXBvcnRzIF0KPiAgIC0gcmVx
dWlyZWQ6IFsgb3V0LXBvcnRzIF0KClRyYWNlIGNvbXBvbmVudCB3aXRoIG5vIGluIG9yIG91dCBw
b3J0IGlzIGludmFsaWQKc28gSSB3aWxsIGluY2x1ZGUgdGhlIGFib3ZlICJhbnlPZiIgc25pcHBl
dCBpbiB0aGUKbmV4dCByZXZpc2lvbi4KCj4KPiA+ICsKPiA+ICt1bmV2YWx1YXRlZFByb3BlcnRp
ZXM6IGZhbHNlCj4gPiArCj4gPiArZXhhbXBsZXM6Cj4gPiArICAtIHwKPiA+ICsgICAgLy8gRXhh
bXBsZSAxIChQZXItaGFydCBlbmNvZGVyIGFuZCByYW1zaW5rIGNvbXBvbmVudHMpOgo+ID4gKwo+
ID4gKyAgICBlbmNvZGVyQGMwMDAwMDAgewo+Cj4gdHJhY2VALi4uPwoKT2theSwgSSB3aWxsIHVw
ZGF0ZS4KCj4KPiBOb2RlIG5hbWVzIHNob3VsZCBiZSBnZW5lcmljIGFuZCBhIGdpdmVuIGNvbXBh
dGlibGUgc2hvdWxkIG9ubHkgaGF2ZSAxCj4gcG9zc2libGUgbm9kZSBuYW1lLiAoWWVzLCB3ZSBm
YWlsZWQgdG8gZG8gdGhpcyBvbiBBcm0gY29yZXNpZ2h0IHN0dWZmLikKPgo+ID4gKyAgICAgIGNv
bXBhdGlibGUgPSAicWVtdSx0cmFjZS1jb21wb25lbnQiLCAicmlzY3YsdHJhY2UtY29tcG9uZW50
IjsKPiA+ICsgICAgICByZWcgPSA8MHhjMDAwMDAwIDB4MTAwMD47Cj4gPiArICAgICAgY3B1cyA9
IDwmQ1BVMD47Cj4KPiBibGFuayBsaW5lIGJldHdlZW4gcHJvcGVydGllcyBhbmQgY2hpbGQgbm9k
ZXMuCgpPa2F5LCBJIHdpbGwgdXBkYXRlLgoKPgo+ID4gKyAgICAgIG91dC1wb3J0cyB7Cj4gPiAr
ICAgICAgICBwb3J0IHsKPiA+ICsgICAgICAgICAgQ1BVMF9FTkNPREVSX09VVFBVVDogZW5kcG9p
bnQgewo+ID4gKyAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmQ1BVMF9SQU1TSU5LX0lO
UFVUPjsKPiA+ICsgICAgICAgICAgfTsKPiA+ICsgICAgICAgIH07Cj4gPiArICAgICAgfTsKPiA+
ICsgICAgfTsKPiA+ICsKPiA+ICsgICAgcmFtc2lua0BjMDAxMDAwIHsKPiA+ICsgICAgICBjb21w
YXRpYmxlID0gInFlbXUsdHJhY2UtY29tcG9uZW50IiwgInJpc2N2LHRyYWNlLWNvbXBvbmVudCI7
Cj4gPiArICAgICAgcmVnID0gPDB4YzAwMTAwMCAweDEwMDA+Owo+ID4gKyAgICAgIGNwdXMgPSA8
JkNQVTA+Owo+ID4gKyAgICAgIGluLXBvcnRzIHsKPiA+ICsgICAgICAgIHBvcnQgewo+ID4gKyAg
ICAgICAgICBDUFUwX1JBTVNJTktfSU5QVVQ6IGVuZHBvaW50IHsKPiA+ICsgICAgICAgICAgfTsK
PiA+ICsgICAgICAgIH07Cj4gPiArICAgICAgfTsKPiA+ICsgICAgfTsKPiA+ICsKPiA+ICsgICAg
ZW5jb2RlckBjMDAyMDAwIHsKPiA+ICsgICAgICBjb21wYXRpYmxlID0gInFlbXUsdHJhY2UtY29t
cG9uZW50IiwgInJpc2N2LHRyYWNlLWNvbXBvbmVudCI7Cj4gPiArICAgICAgcmVnID0gPDB4YzAw
MjAwMCAweDEwMDA+Owo+ID4gKyAgICAgIGNwdXMgPSA8JkNQVTE+Owo+ID4gKyAgICAgIG91dC1w
b3J0cyB7Cj4gPiArICAgICAgICBwb3J0IHsKPiA+ICsgICAgICAgICAgQ1BVMV9FTkNPREVSX09V
VFBVVDogZW5kcG9pbnQgewo+ID4gKyAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmQ1BV
MV9SQU1TSU5LX0lOUFVUPjsKPiA+ICsgICAgICAgICAgfTsKPiA+ICsgICAgICAgIH07Cj4gPiAr
ICAgICAgfTsKPiA+ICsgICAgfTsKPiA+ICsKPiA+ICsgICAgcmFtc2lua0BjMDAzMDAwIHsKPiA+
ICsgICAgICBjb21wYXRpYmxlID0gInFlbXUsdHJhY2UtY29tcG9uZW50IiwgInJpc2N2LHRyYWNl
LWNvbXBvbmVudCI7Cj4gPiArICAgICAgcmVnID0gPDB4YzAwMzAwMCAweDEwMDA+Owo+ID4gKyAg
ICAgIGNwdXMgPSA8JkNQVTE+Owo+ID4gKyAgICAgIGluLXBvcnRzIHsKPiA+ICsgICAgICAgIHBv
cnQgewo+ID4gKyAgICAgICAgICBDUFUxX1JBTVNJTktfSU5QVVQ6IGVuZHBvaW50IHsKPiA+ICsg
ICAgICAgICAgfTsKPiA+ICsgICAgICAgIH07Cj4gPiArICAgICAgfTsKPiA+ICsgICAgfTsKPiA+
ICsKPiA+ICsuLi4KPiA+IC0tCj4gPiAyLjQzLjAKPiA+CgpSZWdhcmRzLApBbnVwCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
