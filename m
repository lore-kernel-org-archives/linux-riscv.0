Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9996E91297
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 14:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BAe5wAI9JyY3UnGgMpAWAfZeoxPHk88XGAWQ8qwKS6I=; b=sZuDR4S6BI9m1d
	NMvfrpmZE81HRxLgnZQ2elqjKTXHFeZnFOEIE3KzKlBqeb5idqa8nKktZxbxY2I4eOM+oqH7pXUrL
	3hSnffZYQ9+eoyTHysXFpA5SpaksZmqxtsZ4o9IdyBE7ViOi67oHCg3B09vd21kkL9+oboPlIXA2K
	adBaDGnc3nze9KzGpAPOKFynbk2/HECes0jqENceDu4VTmtrjlZ+J4AMzH7hgo9edePTIXqVg4WON
	oMHmrywVfDeFCl1HWhTTPMlVNvMlQdVBwpJgyrew2C+2/hT5Q9ePC6ZtzKjLaHdzgwsV2+EwD0JQn
	DXpmes0awR2SiIZW2P6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo0Os-0000000A1no-1MEl;
	Thu, 05 Feb 2026 14:32:06 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo0Op-0000000A1mm-0Ojg
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 14:32:05 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-64965ee303dso1108064d50.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 06:32:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770301922; cv=none;
        d=google.com; s=arc-20240605;
        b=k9ZFHfvjcbZTe/gAeYlIBng8dUOaW7wFrVu71hpplAep/HZ74VvD91JdC1YM/k/fP3
         pKYEGuPYHAT/Q2nHH09OnEDzEbzj2VP4O7GwY9SvH8j6uuR+KDv44hy+PlnIwZ34YKtg
         20uSV/4yjiOh3uQq8gM32pb1rCu54QNBH5kMth9jBhAHlCQQ8KAkGEZzh/uwV0nLLvK8
         oF9rZOwR+laoffCpFC1Ad1RTdw0CwOquZ8S7GdahcWuv+nJ3ZWVEO5HtTG/Zzc20CV3U
         Tedl1CF/dKVhFBj+u12PPD3K10Xwh3V5wUsaS4Vq7zkYMpLkp8mNyM8omKP3KSgWM7ue
         oWxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s5mMNeV59BxNuCmPNiqNLJdD8q5E/v+np7SsY+Ptj4Y=;
        fh=pTlBxYmzP5cLHAJM/FM7jSYhC4UvyQ2mbmQx7KpIgGw=;
        b=AeL1ItdSW99BL2/cxBc/TgXUeIh5yXr96942srqDz2nqKiuFe8K0TkvPZWyYNgW06y
         TCWKaIHPelvgLSMVWSsstM6N4BuSyNNHbN1ZjjC8F3+EVPAlZozf3a0R7y4D0n9W3iEy
         pl0yncs9AeeWnxXU3RV77YKnpKNo7ViH7/TLyhmJKnSRoJLTH14Slm93gvcDNRxD3yGf
         eK9ZbZuxb0I6sl7/emBR8r8p5bm5sYdWbVsLNJXZGvIRUkbw7erktetrV2llLhlGl+8j
         SPsu4NF2BpVyug980QafeoVwFts37u2TZYg6QyxSO06bOL4pztUYBiLXnumEIFdaVTvu
         yTmg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1770301922; x=1770906722; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5mMNeV59BxNuCmPNiqNLJdD8q5E/v+np7SsY+Ptj4Y=;
        b=EGLAZ27XZxsEP9bdn4sUt/OqODQkG+evWaARAGyk9zem67q4Wbc2VJp40RvDoBtetU
         IUKt+ZfXit+QC7Ich1ww74Xlf9BVPOrsEXXDmNRCP6y0Co+xLsy+gd5dhcY5eLrJZYST
         8LzfxyfMdQqmneCB7LN68o4EJdzA7tlN3ppy9dkpKzrEJNUgt9LRTDutCjpFqogiKvwB
         HPi3ahXmZsHxWvQ6kWCT96d4a264XnvdKUleVURaK1066HAfK0hZ4LkVHBybWpHHpT3E
         6OkWN0cTJdrjCpMxa8CeKs8aeWF46Wr97hefuGu981VemYWj0zZ4qLJ/UDdigKLHDrBI
         xuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770301922; x=1770906722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s5mMNeV59BxNuCmPNiqNLJdD8q5E/v+np7SsY+Ptj4Y=;
        b=v9/RzWflhK/NUy1q+J/spJK3Ia2TFpdh6BXZYVk2r//FPwmt/NPyfSrGC3Ahczbn1f
         21jY5OAAik9K0xs/u5VMx07OVidAyTwSRAznENtUoDecQkSs9JOzqQ+QY7xFTMJ1xIjK
         azMjFsUMfnRXw+7ABaCSxLWNOHExzMJMifteqriTeBIYicD+gciNvcSjp5hOJpMQIkKW
         zkIIrLZ2600o2Rzx9MMJ3Pjq9ukx+1z5VPWSnxh+IfJSMdKiUjzEPH9Id2EFYK28tNSZ
         lyG+ZPyPfMKTcCD0NpbxG9fq9WyHpRuqOd0s1RbZdxZocfVGa9WulHdRHB90PjZgEl2Y
         DYWg==
X-Forwarded-Encrypted: i=1; AJvYcCVZuPD+nmxlOPWqhrjMfyCL0kcEGJVTIjVVDwxSNFZ1P/C+Oi76zSZ5irHVrS3uUDgpPHyA/pbC05zvug==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMJyf+AVm2v7FBy92NRl+9+LDqfDGq1GUQbuJn8DFRvZ23Xg/b
	O6/3FCDgzzNWRHmKsRVUhnFeV5PkveAlssW5apOTii15y2Ot5Pkl701LI9pXPCweXR+phwzUAcU
	SvHNeBdS71tw/maMmquPpYlVPmCIBlP4OgTBeSyhcww==
X-Gm-Gg: AZuq6aLMqKDGEnt1byP4bpfPjHWJI+QfIgIDCsaJu74ilOD4/4RMoKXkc6YWLzMGICC
	JsfgtBPh/LuRD0GaEXu+PMHAzILk6hozvvr67iHdLTpJiR8PlR9SqIjz8QNmgAI3ylHWTaE3bCm
	z//t87w7m97t1dkxS+w82B2N7OkKaFRjYiWedN+Hr5AgyalvzM0a3IvkNbwneEISdSAsIgluaQP
	Isj+Yz+HlVJ6c37ooqICN8B/7++W04xFwJo/BWZVw2elt4z0cDPOpC2fpzbo55GYGMuqyMMNuBn
	vSGdOKak/37ieVTi3U48VOctRDDmvtuAdI4uNtCj9nKhgtVg9M78I7a3o19WA17SJpSKGzU=
X-Received: by 2002:a05:690e:e88:b0:649:e501:21b2 with SMTP id
 956f58d0204a3-649e501241cmr3675188d50.12.1770301921673; Thu, 05 Feb 2026
 06:32:01 -0800 (PST)
MIME-Version: 1.0
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
 <20260202-atlantis-clocks-v5-1-0922e43acaba@oss.tenstorrent.com> <20260205-upbeat-tortoise-of-admiration-b3c0eb@quoll>
In-Reply-To: <20260205-upbeat-tortoise-of-admiration-b3c0eb@quoll>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 5 Feb 2026 08:31:50 -0600
X-Gm-Features: AZwV_Qh-ae-dWwwvtEXuKahrL02iNou0eQ7ZulAZRSirBJyrvo1tifhCxLYVs9s
Message-ID: <CAEev2e8_4LSLNvHsiC4d7Rrd2GmjQ_5GRHU6b9-Ha69+yvn5cA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: clk: tenstorrent: Add tenstorrent,atlantis-prcm
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com, bmasney@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_063203_148087_8D6A057A 
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

SGkgS3J6eXN6dG9mLAoKT24gVGh1LCBGZWIgNSwgMjAyNiBhdCAzOjIz4oCvQU0gS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgRmViIDAyLCAy
MDI2IGF0IDAxOjQ2OjQ5UE0gLTA2MDAsIEFuaXJ1ZGggU3Jpbml2YXNhbiB3cm90ZToKPiA+IERv
Y3VtZW50IGJpbmRpbmdzIGZvciBUZW5zdG9ycmVudCBBdGxhbnRpcyBQUkNNIHRoYXQgbWFuYWdl
cyBjbG9ja3MKPiA+IGFuZCByZXNldHMuIFRoaXMgYmxvY2sgaXMgaW5zdGFudGlhdGVkIG11bHRp
cGxlIHRpbWVzIGluIHRoZSBTb0MuCj4gPiBUaGlzIGNvbW1pdCBkb2N1bWVudHMgdGhlIGNsb2Nr
cyBmcm9tIHRoZSBSQ1BVIFBSQ00gYmxvY2suCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5pcnVk
aCBTcmluaXZhc2FuIDxhc3Jpbml2YXNhbkBvc3MudGVuc3RvcnJlbnQuY29tPgo+ID4gLS0tCj4g
PiAgLi4uL2JpbmRpbmdzL2Nsb2NrL3RlbnN0b3JyZW50LGF0bGFudGlzLXByY20ueWFtbCAgfCAg
NTQgKysrKysrKysrKysKPiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgMiArCj4gPiAgLi4uL2R0LWJpbmRpbmdzL2Nsb2NrL3RlbnN0b3Jy
ZW50LGF0bGFudGlzLXByY20uaCAgfCAxMDMgKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMyBm
aWxlcyBjaGFuZ2VkLCAxNTkgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svdGVuc3RvcnJlbnQsYXRsYW50aXMt
cHJjbS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3RlbnN0
b3JyZW50LGF0bGFudGlzLXByY20ueWFtbAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uMGYzZTE4ZjVlYTFhCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svdGVuc3RvcnJlbnQsYXRs
YW50aXMtcHJjbS55YW1sCj4KPiBTdGlsbCB3cm9uZyBuYW1lLiBMb29rIGhvdyBpcyB5b3VyIGNv
bXBhdGlibGUgY2FsbGVkLgoKPgo+ID4gQEAgLTAsMCArMSw1NCBAQAo+ID4gKyMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ID4gKyVZQU1M
IDEuMgo+ID4gKy0tLQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvY2xv
Y2svdGVuc3RvcnJlbnQsYXRsYW50aXMtcHJjbS55YW1sIwo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gKwo+ID4gK3RpdGxlOiBU
ZW5zdG9ycmVudCBBdGxhbnRpcyBQUkNNIChQb3dlciwgUmVzZXQsIENsb2NrIE1hbmFnZW1lbnQp
IE1vZHVsZQo+ID4gKwo+ID4gK21haW50YWluZXJzOgo+ID4gKyAgLSBBbmlydWRoIFNyaW5pdmFz
YW4gPGFzcmluaXZhc2FuQG9zcy50ZW5zdG9ycmVudC5jb20+Cj4gPiArCj4gPiArZGVzY3JpcHRp
b246Cj4gPiArICBNdWx0aWZ1bmN0aW9uYWwgcmVnaXN0ZXIgYmxvY2sgZm91bmQgaW4gVGVuc3Rv
cnJlbnQgQXRsYW50aXMgU29DIHdob3NlIG1haW4KPiA+ICsgIGZ1bmN0aW9uIGlzIHRvIGNvbnRy
b2wgY2xvY2tzIGFuZCByZXNldHMuIFRoaXMgYmxvY2sgaXMgaW5zdGFudGlhdGVkIG11bHRpcGxl
Cj4gPiArICB0aW1lcyBpbiB0aGUgU29DLCBlYWNoIGJsb2NrIGNvbnRyb2xzIGNsb2NrIGFuZCBy
ZXNldHMgZm9yIGEgZGlmZmVyZW50Cj4gPiArICBzdWJzeXN0ZW0uIFJDUFUgcHJjbSBzZXJ2ZXMg
bG93IHNwZWVkIElPIGludGVyZmFjZXMuCj4gPiArCj4gPiArcHJvcGVydGllczoKPiA+ICsgIGNv
bXBhdGlibGU6Cj4gPiArICAgIGVudW06Cj4gPiArICAgICAgLSB0ZW5zdG9ycmVudCxhdGxhbnRp
cy1wcmNtLXJjcHUKPgo+IE5vdGhpbmcgaW4gdGhlIGNoYW5nZWxvZyBleHBsYWluZWQgd2h5IDIg
b3RoZXIgY29tcGF0aWJsZXMgd2VyZSBkcm9wcGVkLgoKSSBoYXZlIG1lbnRpb25lZCBpbiB0aGUg
Y2hhbmdlbG9nIGluIHRoZSBjb3ZlciBsZXR0ZXIgdGhhdCB0aGVzZSB3aWxsCmJlIGFkZGVkIGJh
Y2sgd2hlbiB0aGUgZHJpdmVyIGZvciB0aGVtIGlzIGFkZGVkIChiYXNlZCBvbiBteQpkaXNjdXNz
aW9uIHdpdGggQ29ub3IpLgoKPgo+ID4gKwo+ID4gKyAgcmVnOgo+ID4gKyAgICBtYXhJdGVtczog
MQo+ID4gKwo+ID4gKyAgY2xvY2tzOgo+ID4gKyAgICBtYXhJdGVtczogMQo+ID4gKwo+ID4gKyAg
IiNjbG9jay1jZWxscyI6Cj4gPiArICAgIGNvbnN0OiAxCj4gPiArICAgIGRlc2NyaXB0aW9uOgo+
ID4gKyAgICAgIFNlZSA8ZHQtYmluZGluZ3MvY2xvY2svdGVuc3RvcnJlbnQsYXRsYW50aXMtcHJj
bS5oPiBmb3IgdmFsaWQgaW5kaWNlcy4KPiA+ICsKPiA+ICsgICIjcmVzZXQtY2VsbHMiOgo+ID4g
KyAgICBjb25zdDogMQo+ID4gKwo+ID4gK3JlcXVpcmVkOgo+ID4gKyAgLSBjb21wYXRpYmxlCj4g
PiArICAtIHJlZwo+ID4gKyAgLSBjbG9ja3MKPiA+ICsgIC0gIiNjbG9jay1jZWxscyIKPiA+ICsg
IC0gIiNyZXNldC1jZWxscyIKPiA+ICsKPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UK
PiA+ICsKPiA+ICtleGFtcGxlczoKPiA+ICsgIC0gfAo+ID4gKyAgICBjbG9jay1jb250cm9sbGVy
QGE4MDAwMDAwIHsKPiA+ICsgICAgICBjb21wYXRpYmxlID0gInRlbnN0b3JyZW50LGF0bGFudGlz
LXByY20tcmNwdSI7Cj4gPiArICAgICAgcmVnID0gPDB4YTgwMDAwMDAgMHgxMDAwMD47Cj4gPiAr
ICAgICAgY2xvY2tzID0gPCZvc2NfMjRtPjsKPiA+ICsgICAgICAjY2xvY2stY2VsbHMgPSA8MT47
Cj4gPiArICAgICAgI3Jlc2V0LWNlbGxzID0gPDE+Owo+ID4gKyAgICB9Owo+ID4gZGlmZiAtLWdp
dCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiA+IGluZGV4IGRjNzMxZDM3YzhmZS4uMGZj
N2JjNmQwNDU4IDEwMDY0NAo+ID4gLS0tIGEvTUFJTlRBSU5FUlMKPiA+ICsrKyBiL01BSU5UQUlO
RVJTCj4gPiBAQCAtMjI1MzQsOCArMjI1MzQsMTAgQEAgTTogICBKb2VsIFN0YW5sZXkgPGptc0Bv
c3MudGVuc3RvcnJlbnQuY29tPgo+ID4gIEw6ICAgbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+ID4gIFM6ICAgTWFpbnRhaW5lZAo+ID4gIFQ6ICAgZ2l0IGh0dHBzOi8vZ2l0aHViLmNv
bS90ZW5zdG9ycmVudC9saW51eC5naXQKPiA+ICtGOiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9jbG9jay90ZW5zdG9ycmVudCxhdGxhbnRpcy1wcmNtLnlhbWwKPiA+ICBGOiAg
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi90ZW5zdG9ycmVudC55YW1s
Cj4gPiAgRjogICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3RlbnN0b3JyZW50Lwo+ID4gK0Y6ICAgaW5j
bHVkZS9kdC1iaW5kaW5ncy9jbG9jay90ZW5zdG9ycmVudCxhdGxhbnRpcy1wcmNtLmgKPiA+Cj4g
PiAgUklTQy1WIFRIRUFEIFNvQyBTVVBQT1JUCj4gPiAgTTogICBEcmV3IEZ1c3RpbmkgPGZ1c3Rp
bmlAa2VybmVsLm9yZz4KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2Nr
L3RlbnN0b3JyZW50LGF0bGFudGlzLXByY20uaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2sv
dGVuc3RvcnJlbnQsYXRsYW50aXMtcHJjbS5oCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4g
aW5kZXggMDAwMDAwMDAwMDAwLi4zODIwNzgxMTI3YzMKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsr
KyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svdGVuc3RvcnJlbnQsYXRsYW50aXMtcHJjbS5o
Cj4KPiBTdGlsbCB3cm9uZyBuYW1lLi4uIExvb2sgYXQgeW91ciBjb21wYXRpYmxlLgo+Cj4gUGxl
YXNlIHJlYWQgd3JpdGluZyBiaW5kaW5ncyBkb2MgaW4gRFQgZGlyLgoKV2Ugd2lsbCBoYXZlIG11
bHRpcGxlIGNvbXBhdGlibGVzIGluIHRoZSBmdXR1cmUgKEkgZHJvcHBlZCB0aGVzZSBpbgp0aGlz
IHZlcnNpb24gYW5kIEkgaGF2ZSBtZW50aW9uZWQgdGhpcyBpbiB0aGUgY2hhbmdlbG9nIGluIHRo
ZSBjb3ZlcgpsZXR0ZXIpIG5hbWVkICJ0ZW5zdG9ycmVudCxhdGxhbnRpcy1wcmNtLXh5eiIuIFRo
ZSBiaW5kaW5ncyBkb2N1bWVudApzdWdnZXN0cyBwaWNraW5nIGEgbW9yZSBnZW5lcmljIG5hbWUg
aW4gdGhpcyBjYXNlLCBzbyBpc24ndAoidGVuc3RvcnJlbnQsYXRsYW50aXMtcHJjbSIgb2theSBm
b3IgdGhhdD8KCj4KPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
