Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E9CEB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 08:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7LQRdDAL5pI1QK460ggUjvJ1knziJYx0hWwLIptMXo=; b=Rc6o56Rhz+ksQP
	d202XmwDehbG9ZUKYhzfN0uRlDwVKU+nWGk6kt7fuBdKEkz6IAq+TA4qwVhpgIHAPqxFAQru4k8ua
	zgY7sfJBJxgJG0qZUSsx+ZZbZu7ExxGYqb0Ru0LG7/HFrl53a3CHnna2a53uHMptnvEg18+sJDAiB
	+VACpKLJOi3O93we3W+G3p6i/iro09See+TNks3oivSHRivoOO4UiwBT3xu5M632QVrsIkaI+mUhf
	ssG6nZskQjp/s89iX6wmAOMADCtAFbO7twbESjAqaPNOUuX+DMzd0MPt4bHH7fXDv9YiuBpl5qLy0
	TNNnAS+ibGPNtYsdHebQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBWfj-00AZZA-1x;
	Tue, 20 Jun 2023 08:25:07 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBWfg-00AZX4-0Z
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 08:25:06 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3112f2b9625so2762863f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 01:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687249500; x=1689841500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3evY5tN6qzgdFsrfqIXUpcoFzb3IStfjYrKcL0qrqdw=;
        b=ivDz+WrTZTztk9Hn4W1CcvPZJxZcZTemxrC0UQ4ymMFfLVisimBS1DynRpr6KUAf16
         jXCuYD5cPRMP6uUm+RTj13Y4/o0xrIvbbhdD7Slt+29ye7bhoAQddcyuCP8qSzbQZQUH
         kUN+xh63LiHxrPky7aPHYHS7QsRdqwTNiSy83IvPf8rM7kIKcJoYoSRM3A7YeWclugKw
         bMRy8aHUjM/vl7b9enIR/T+jMNdH6Oc+UzYaRjl8+b2YS1Yd6WUMMHB5HQl0FloC1Y20
         5MJ3ldMawWHeBXZkwL5d3ZzEqNPebSpDLkXO3Whm2hbZjmwieYGXGuDCcm6U0DKW6C1D
         MFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687249500; x=1689841500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3evY5tN6qzgdFsrfqIXUpcoFzb3IStfjYrKcL0qrqdw=;
        b=k/uEV/US7xupXgTRJgmArT6xHzAvyVped9x+JD3hveeSRBUAttf+QZqfz2lUfOIRSE
         T78v3IX4tF4FPv5lbGw2yHKQ99do9n4+bxg7MsEy42o9W9UXwUuGpoKnePjetgq14Joz
         Q3vNfm8Vh5yX8aJ7Gl+i2s+8h0dDC7RtiKZ+BdUa39TDy6Jig9OU2VGmDFHfujILPqSF
         D6+O1GJU/JGQGlhaO5OvJKyMXS4pR8hD5cota96Xp+wG9VEVdmD58AyTNbV41zlz1I4+
         oR2Lg8nscpIuqNz7Y0mSLOT4ZLlxAiYLkwAJnUff2Y/xVBKRah5gxUSKMAFK2k44KoXF
         8vfw==
X-Gm-Message-State: AC+VfDwaRKUuiBmfSwSe15HR4uXlqAVfLLw9x/CXLUzoKRNHYrrMsOrp
	hftzUiQz85Ok/MyOq1OXXrE6srhYRNrdKa4/39YiYA==
X-Google-Smtp-Source: ACHHUZ6fEAAE+PddtHZkYCJKGXLQzqQWugmbMrdnZ+rUOZ3Xiut5GzkNY1WIVBRLi221yjqaYsWvNhTixpIWiEMgsDE=
X-Received: by 2002:adf:df0b:0:b0:311:1009:10c9 with SMTP id
 y11-20020adfdf0b000000b00311100910c9mr9231916wrl.5.1687249500404; Tue, 20 Jun
 2023 01:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230619094705.51337-1-alexghiti@rivosinc.com>
 <20230619-kerchief-unmixed-cfdbeb1cf242@wendy> <CAHVXubjV=0HNyc0-UMAQRQfi4ZUnwH8dmghV-BGogZsJiumtZA@mail.gmail.com>
 <ZJFYE+Ss/OgMIjda@sunil-laptop>
In-Reply-To: <ZJFYE+Ss/OgMIjda@sunil-laptop>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 20 Jun 2023 10:24:49 +0200
Message-ID: <CAHVXubjNHS1goZx=hiAC0Y5n2Ox_-6=+9wb+qphgn_AV0+hAHw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation: riscv: Add early boot document
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_012504_220016_303A399D 
X-CRM114-Status: GOOD (  48.43  )
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

T24gVHVlLCBKdW4gMjAsIDIwMjMgYXQgOTo0MeKAr0FNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVuIDE5LCAyMDIzIGF0IDA0OjA0OjUy
UE0gKzAyMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+IE9uIE1vbiwgSnVuIDE5LCAyMDIz
IGF0IDI6MjbigK9QTSBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3
cm90ZToKPiA+ID4KPiA+ID4gSGV5IEFsZXgsCj4gPiA+Cj4gPiA+IFRoYW5rcyBmb3Igd29ya2lu
ZyBvbiB0aGlzIDopIEkndmUgZ290IGEgbWl4IG9mIHN1Z2dlc3Rpb25zIGFuZAo+ID4gPiBxdWVz
dGlvbnMgYmVsb3cuIEhvcGVmdWxseSBpdCBpcyBub3QgdG9vIGRpc2pvaW50LCBzaW5jZSBJIGRp
ZG4ndCB3cml0ZQo+ID4gPiB0aGVtIGluIG9yZGVyLgo+ID4gPgo+ID4gPiBPbiBNb24sIEp1biAx
OSwgMjAyMyBhdCAxMTo0NzowNEFNICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiA+
ID4gVGhpcyBkb2N1bWVudCBkZXNjcmliZXMgdGhlIGNvbnN0cmFpbnRzIGFuZCByZXF1aXJlbWVu
dHMgb2YgdGhlIGVhcmx5Cj4gPiA+ID4gYm9vdCBwcm9jZXNzIGluIGEgUklTQy1WIGtlcm5lbC4K
PiA+ID4gPgo+ID4gPiA+IFN6aWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0
aUByaXZvc2luYy5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIERvY3VtZW50YXRpb24vcmlzY3Yv
Ym9vdC1pbWFnZS1oZWFkZXIucnN0IHwgICAzIC0KPiA+ID4gPiAgRG9jdW1lbnRhdGlvbi9yaXNj
di9ib290LnJzdCAgICAgICAgICAgICAgfCAxODEgKysrKysrKysrKysrKysrKysrKysrKwo+ID4g
PiA+ICBEb2N1bWVudGF0aW9uL3Jpc2N2L2luZGV4LnJzdCAgICAgICAgICAgICB8ICAgMSArCj4g
PiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTgyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
Cj4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3Jpc2N2L2Jvb3QucnN0
Cj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9yaXNjdi9ib290LWlt
YWdlLWhlYWRlci5yc3QgYi9Eb2N1bWVudGF0aW9uL3Jpc2N2L2Jvb3QtaW1hZ2UtaGVhZGVyLnJz
dAo+ID4gPiA+IGluZGV4IGQ3NzUyNTMzODY1Zi4uYTRhNDUzMTBjNGM0IDEwMDY0NAo+ID4gPiA+
IC0tLSBhL0RvY3VtZW50YXRpb24vcmlzY3YvYm9vdC1pbWFnZS1oZWFkZXIucnN0Cj4gPiA+ID4g
KysrIGIvRG9jdW1lbnRhdGlvbi9yaXNjdi9ib290LWltYWdlLWhlYWRlci5yc3QKPiA+ID4gPiBA
QCAtNyw5ICs3LDYgQEAgQm9vdCBpbWFnZSBoZWFkZXIgaW4gUklTQy1WIExpbnV4Cj4gPiA+ID4K
PiA+ID4gPiAgVGhpcyBkb2N1bWVudCBvbmx5IGRlc2NyaWJlcyB0aGUgYm9vdCBpbWFnZSBoZWFk
ZXIgZGV0YWlscyBmb3IgUklTQy1WIExpbnV4Lgo+ID4gPiA+Cj4gPiA+ID4gLVRPRE86Cj4gPiA+
ID4gLSAgV3JpdGUgYSBjb21wbGV0ZSBib290aW5nIGd1aWRlLgo+ID4gPiA+IC0KPiA+ID4gPiAg
VGhlIGZvbGxvd2luZyA2NC1ieXRlIGhlYWRlciBpcyBwcmVzZW50IGluIGRlY29tcHJlc3NlZCBM
aW51eCBrZXJuZWwgaW1hZ2U6Ogo+ID4gPiA+Cj4gPiA+ID4gICAgICAgdTMyIGNvZGUwOyAgICAg
ICAgICAgICAgICAvKiBFeGVjdXRhYmxlIGNvZGUgKi8KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9yaXNjdi9ib290LnJzdCBiL0RvY3VtZW50YXRpb24vcmlzY3YvYm9vdC5yc3QK
PiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4u
YjAyMjMwODE4Yjc5Cj4gPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiA+ICsrKyBiL0RvY3VtZW50
YXRpb24vcmlzY3YvYm9vdC5yc3QKPiA+ID4gPiBAQCAtMCwwICsxLDE4MSBAQAo+ID4gPiA+ICsu
LiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ID4gPiA+ICsKPiA+ID4gPiArPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPiA+ID4gK0Vhcmx5
IGJvb3QgcmVxdWlyZW1lbnRzL2NvbnN0cmFpbnRzIG9uIFJJU0MtVgo+ID4gPiA+ICs9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+ID4KPiA+ID4gUGxlYXNl
IHVzZSAidGl0bGUgY2FzZSIsIGhlcmUgYW5kIGVsc2V3aGVyZSBpbiB0aGUgZG9jLgo+ID4KPiA+
IFlvdSBtZWFuIHVzaW5nICJ0aXRsZTogIiBpbnN0ZWFkIG9mICI9PT09Ij8gT3IgdXNpbmcgdXBw
ZXJjYXNlIGZvciB0aGUKPiA+IGZpcnN0IGxldHRlciBvZiBlYWNoIHdvcmQ/IEZZSSBJIGZvbGxv
d2VkCj4gPiBodHRwczovL2RvY3Mua2VybmVsLm9yZy9kb2MtZ3VpZGUvc3BoaW54Lmh0bWw/aGln
aGxpZ2h0PXRpdGxlI3NwZWNpZmljLWd1aWRlbGluZXMtZm9yLXRoZS1rZXJuZWwtZG9jdW1lbnRh
dGlvbgo+ID4KPiA+ID4gSSdkIGFsc28gYmUgaW5jbGluZWQgdG8gZHJvcCB0aGUgIkVhcmx5IiBm
cm9tIGhlcmUsIGFzIGl0IHBlcm1pdHMgbW9yZQo+ID4gPiBuYXR1cmFsIHNlY3Rpb24gaGVhZGlu
Z3MuIFBlcmhhcHMgIlJJU0MtViBLZXJuZWwgQm9vdCBSZXF1aXJlbWVudHMgYW5kCj4gPiA+IENv
bnN0cmFpbnRzIj8KPiA+Cj4gPiBHb29kIHN1Z2dlc3Rpb24sIEknbGwgZ28gd2l0aCB0aGF0LCB0
aGFua3MKPiA+Cj4gPiA+Cj4gPiA+ID4gKwo+ID4gPiA+ICs6QXV0aG9yOiBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gPiA+ID4gKzpEYXRlOiAyMyBNYXkgMjAyMwo+
ID4gPiA+ICsKPiA+ID4gPiArVGhpcyBkb2N1bWVudCBkZXNjcmliZXMgd2hhdCB0aGUgUklTQy1W
IGtlcm5lbCBleHBlY3RzIGZyb20gdGhlIHByZXZpb3VzIHN0YWdlcwo+ID4gPgo+ID4gPiAidGhl
IHByZXZpb3VzIHN0YWdlcyIgaXMgYSBiaXQgdmFndWUgSU1PLiBZb3UgbWVhbiBib290bG9hZGVy
IHN0YWdlcyBJCj4gPiA+IGFzc3VtZSwgYnV0IEkgdGhpbmsgaXQgc2hvdWxkIGJlIGV4cGxpY2l0
LiBQZXJoYXBzOgo+ID4gPiAiLi4ud2hhdCBhIFJJU0MtViBrZXJuZWwgZXhwZWN0cyBmcm9tIGJv
b3Rsb2FkZXJzIGFuZCBmaXJtd2FyZSwgYW5kIHRoZQo+ID4gPiBjb25zdHJhaW50cy4uLiIKPiA+
ID4KPiA+ID4gPiArYW5kIHRoZSBmaXJtd2FyZSwgYnV0IGFsc28gdGhlIGNvbnN0cmFpbnRzIHRo
YXQgYW55IGRldmVsb3BlciBtdXN0IGhhdmUgaW4gbWluZAo+ID4gPiA+ICt3aGVuIHRvdWNoaW5n
IHRoZSBlYXJseSBib290IHByb2Nlc3MsIGUuZy4gYmVmb3JlIHRoZSBmaW5hbCB2aXJ0dWFsIG1h
cHBpbmcgaXMKPiA+ID4gPiArc2V0dXAuCj4gPiA+Cj4gPiA+IHMvc2V0dXAuL3NldCB1cC4vCj4g
PiA+Cj4gPiA+IERvIHlvdSBtZWFuIHRvIGhhdmUgIkZvciBleGFtcGxlIiBoZXJlPyBPciBpcyAi
YmVmb3JlIHRoZSBmaW5hbCB2aXJ0dWFsCj4gPiA+IG1hcHBpbmcgaXMgc2V0IHVwIiB0aGUgZGVm
aW5pdGlvbiBvciAiZWFybHkgYm9vdCI/IElmIHRoZSBsYXR0ZXIsIEkKPiA+ID4gd291bGQgcmV3
b3JkIHRoaXMgYXMgc29tZXRoaW5nIGxpa2U6Cj4gPiA+ICIuLi53aGVuIG1vZGlmeWluZyB0aGUg
ZWFybHkgYm9vdCBwcm9jZXNzLiBGb3IgdGhlIHB1cnBvc2VzIG9mIHRoaXMKPiA+ID4gZG9jdW1l
bnQsIHRoZSAnZWFybHkgYm9vdCBwcm9jZXNzJyByZWZlcnMgdG8gYW55IGNvZGUgdGhhdCBydW5z
IGJlZm9yZQo+ID4gPiB0aGUgZmluYWwgdmlydHVhbCBtYXBwaW5nIGlzIHNldCB1cC4iCj4gPgo+
ID4gVGhhbmtzLCB0aGF0J3Mgd2hhdCBJIG1lYW50Lgo+ID4KPiA+ID4KPiA+ID4gPiArUHJlLWtl
cm5lbCBib290IChFeHBlY3RhdGlvbnMgZnJvbSBmaXJtd2FyZSkKPiA+ID4KPiA+ID4gRmlybXdh
cmUgb3IgYm9vdGxvYWRlcnM/IFRCSCwgSSB3b3VsZCBqdXN0IGRyb3AgdGhlIHNlY3Rpb24gaW4g
KCkgYW5kCj4gPiA+IGRvIHNvbWV0aGluZyBsaWtlOgo+ID4gPiAgICAgICAgIFByZS1rZXJuZWwg
UmVxdWlyZW1lbnRzIGFuZCBDb25zdHJhaW50cwo+ID4gPiAgICAgICAgID09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4gPgo+ID4gPiAgICAgICAgIFRoZSBSSVNDLVYg
a2VybmVsIGV4cGVjdHMgdGhlIGZvbGxvd2luZyBvZiBib290bG9hZGVycyBhbmQgcGxhdGZvcm0K
PiA+ID4gICAgICAgICBmaXJtd2FyZToKPiA+ID4KPiA+Cj4gPiBPawo+ID4KPiA+ID4gPiArCj4g
PiA+ID4gK1JlZ2lzdGVycyBzdGF0ZQo+ID4gPgo+ID4gPiBzL1JlZ2lzdGVycyBzdGF0ZS9SZWdp
c3RlciBTdGF0ZS8KPiA+Cj4gPiBPawo+ID4KPiA+ID4KPiA+ID4gPiArLS0tLS0tLS0tLS0tLS0t
Cj4gPiA+ID4gKwo+ID4gPiA+ICtUaGUgUklTQy1WIGtlcm5lbCBleHBlY3RzOgo+ID4gPiA+ICsK
PiA+ID4gPiArICAqIGAkYTBgIHRvIGNvbnRhaW4gdGhlIGhhcnRpZCBvZiB0aGUgY3VycmVudCBj
b3JlLgo+ID4gPiA+ICsgICogYCRhMWAgdG8gY29udGFpbiB0aGUgYWRkcmVzcyBvZiB0aGUgZGV2
aWNlIHRyZWUgaW4gbWVtb3J5Lgo+ID4gPiA+ICsKPiA+ID4gPiArQ1NSIHN0YXRlCj4gPiA+ID4g
Ky0tLS0tLS0tLQo+ID4gPiA+ICsKPiA+ID4gPiArVGhlIFJJU0MtViBrZXJuZWwgZXhwZWN0czoK
PiA+ID4gPiArCj4gPiA+ID4gKyAgKiBgJHNhdHAgPSAwYDogdGhlIE1NVSBtdXN0IGJlIGRpc2Fi
bGVkLgo+ID4gPgo+ID4gPiAidGhlIE1NVSwgaWYgcHJlc2VudCwgbXVzdCBiZSBkaXNhYmxlZC4i
IDspCj4gPgo+ID4gQWhhaCBmb3Jnb3QgdGhlICFtbXUgY2FzZSwgdGhhbmtzIDopCj4gPgo+ID4g
Pgo+ID4gPiA+ICsKPiA+ID4gPiArUmVzZXJ2ZWQgbWVtb3J5IGZvciByZXNpZGVudCBmaXJtd2Fy
ZQo+ID4gPiA+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ID4g
Kwo+ID4gPiA+ICtUaGUgUklTQy1WIGtlcm5lbCBleHBlY3RzIHRoZSBmaXJtd2FyZSB0byBtYXJr
IGFueSByZXNpZGVudCBtZW1vcnkgd2l0aCB0aGUKPiA+ID4KPiA+ID4gU2hvdWxkIHRoaXMgYmUK
PiA+ID4gIi4uLnJlc2lkZW50IG1lbW9yeSwgb3IgbWVtb3J5IGl0IGhhcyBwcm90ZWN0ZWQgd2l0
aCBQTVBzLCB3aXRoLi4uIgo+ID4gPiA/Cj4gPgo+ID4gSSB1c2VkICJyZXNpZGVudCIgbWVtb3J5
IGluc3RlYWQgb2YgIlBNUCIgbWVtb3J5IGJlY2F1c2UgaXQgd2FzIG1vcmUKPiA+IGdlbmVyYWwu
IEkgbWVhbiB5b3UgY2FuIGhhdmUgYSByZWdpb24gdGhhdCBpcyByZXNpZGVudCBidXQgbm90Cj4g
PiBwcm90ZWN0ZWQgYnkgUE1QLCBhbmQgSSBkb24ndCB0aGluayB0aGUga2VybmVsIHNob3VsZCBh
c2sgZm9yIHRoaXMKPiA+IHJlc2lkZW50IG1lbW9yeSB0byBiZSBwcm90ZWN0ZWQgd2l0aCBQTVAg
cmlnaHQ/Cj4gPgo+ID4gPgo+ID4gPiA+ICtgbm8tbWFwYCBmbGFnLCB0aHVzIHRoZSBrZXJuZWwg
d29uJ3QgbWFwIHRob3NlIHJlZ2lvbnMgaW4gdGhlIGRpcmVjdCBtYXBwaW5nCj4gPiA+Cj4gPiA+
ICJuby1tYXAiIGlzIGEgRFQgc3BlY2lmaWMgdGVybSwgc2hvdWxkIHRoaXMgc2VjdGlvbiBiZSBt
b3ZlZCBkb3duIHVuZGVyCj4gPiA+IERULCBhcyBhIHN1Yi1zZWN0aW9uIG9mIHRoYXQ/Cj4gPgo+
ID4gTWF5YmUgSSBjYW4gcmVwaHJhc2Ugd2l0aCBzb21ldGhpbmcgbGlrZSB0aGF0Ogo+ID4KPiA+
ICJUaGUgUklTQy1WIGtlcm5lbCBtdXN0IG5vdCBtYXAgYW55IHJlc2lkZW50IG1lbW9yeSBpbiB0
aGUgZGlyZWN0Cj4gPiBtYXBwaW5nLCBzbyB0aGUgZmlybXdhcmUgbXVzdCBjb3JyZWN0bHkgbWFy
ayB0aG9zZSByZWdpb25zIGFzIGZvbGxvd3M6Cj4gPiAtIHdoZW4gdXNpbmcgYSBkZXZpY2V0cmVl
LCB1c2luZyB0aGUgYG5vLW1hcGAgZmxhZywKPiA+IC0gd2hlbiBib290aW5nIHdpdGggVUVGSSB3
aXRob3V0IGRldmljZXRyZWUsIGVpdGhlciBhcwo+ID4gYEVmaVJ1bnRpbWVTZXJ2aWNlc0RhdGEv
Q29kZWAgb3IgYEVmaVJlc2VydmVkYC4iCj4gPgo+IEhpIEFsZXgsCj4KPiBJIGFtIG5vdCBzdXJl
IGFib3V0IHRoZSBpZGVhIGJlaGluZCBtZW50aW9uaW5nIG9ubHkgVUVGSSBib290IHdpdGhvdXQK
PiBEVCBzaW5jZSBVRUZJIGJvb3QgaXMgc3VwcG9ydGVkIHdpdGggRFQgYWxzby4gU2hvdWxkIHdl
IGp1c3QgbWVudGlvbgo+IHRoYXQgIndoZW4gYm9vdGluZyB3aXRoIFVFRkksIHJlc2lkZW50IGZp
cm13YXJlIHJhbmdlcyBtdXN0IGJlIG1hcmtlZCBhcwo+IHBlciBVRUZJIHNwZWNpZmljYXRpb24i
ID8gQ29udmVydGluZyByZXNlcnZlZC1tZW1vcnkgbm9kZSBpbiBEVCB0byBVRUZJCj4gbWVtb3J5
IG1hcCBpcyBhbnl3YXkgbWVudGlvbmVkIHNlcGFyYXRlbHkgdW5kZXIgVUVGSSBtZW1vcnkgbWFw
IHNlY3Rpb24KPiByaWdodD8KClJpZ2h0LCBsZXQncyBtYWtlIGl0IHNpbXBsZToKCiJUaGUgUklT
Qy1WIGtlcm5lbCBtdXN0IG5vdCBtYXAgYW55IHJlc2lkZW50IG1lbW9yeSBpbiB0aGUgZGlyZWN0
Cm1hcHBpbmcsIHNvIHRoZQpmaXJtd2FyZSBtdXN0IGNvcnJlY3RseSBtYXJrIHRob3NlIHJlZ2lv
bnMgYXMgcGVyIHRoZSBkZXZpY2V0cmVlCnNwZWNpZmljYXRpb24gYW5kL29yIHRoZSBVRUZJIHNw
ZWNpZmljYXRpb24uIgoKRmVlbCBmcmVlIHRvIGNvbW1lbnQgaWYgdGhhdCdzIHN0aWxsIG5vdCBy
aWdodCB0byB5b3UsCgpUaGFua3MsCgo+Cj4gVGhhbmtzLAo+IFN1bmlsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
