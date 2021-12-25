Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC98DC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Dec 2021 05:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Wk8UkBb9G951RdcshdKw8gOtNdT2ypOq1kW8vXxt5c=; b=tuuFK+XdLJ7nAQ
	iRTyOn5TZvOAB0r8CPMJSQoRNi8sRnRarcr+/zWFO5vWjg/tV/pu2B6SbEk4ysuBxytrwCMz875NX
	yBJ8sMecGS+pUJaV57dRIwqjQDEpAs8g90TceSbYwSbrbq0p0dsPKTzqLbD1um4YHMYbOEEIQehEP
	gEYLY0OLoouMMZ3NVpuSGrO3Y+LJx9G/JQD6kmN627EVfCL6n6f5dhHl2PP3o3MBOnbyTZukaED4Y
	Wl+tNS6Nx6CI7Dq7KMz/xGm7E4IFfut+PykZCVaffdV00QTQjldto3e8nRnu+/cfSHuxwDnIusn8/
	0kEvLGSSOuMp0AcxYFSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0zz3-00Eir7-G4; Sat, 25 Dec 2021 05:52:45 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0zz1-00Eiqi-1C
 for linux-riscv@lists.infradead.org; Sat, 25 Dec 2021 05:52:44 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id d10so31076266ybn.0
 for <linux-riscv@lists.infradead.org>; Fri, 24 Dec 2021 21:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P6HnANFjTp8jsFIseB/eEf8MMj7oCNVSoMrgQeo65vw=;
 b=R0syKmcV5CKw7yyTHPlb1d4nptXIdMTAQTe9rbkEdQV3K3BS4xwPYht3sdvxaEpu1F
 KWeTxEpOoFGTiY/1vU06ygAJCxZHTRAKL3nq6JNE8AExlsLiEUm3dpEfyXXfvyAqXfLE
 cM6cVlwEPsDY83EOBn0yOKXQ5igU8uxq5DAeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P6HnANFjTp8jsFIseB/eEf8MMj7oCNVSoMrgQeo65vw=;
 b=q+PBtnSJdbDfZ/tsLfubyLMM7abw/EOLh6HMk8q6MW4SZCMeig/ISab6YdoT4qHpd3
 XELE4rPaUrCYho8xO2+ACJutRJBv6Yrj9/ktNqlAy1A40nHwcBxorXS8zOguMudUv72O
 BzMHhIE0a91h6Chzy+2ODgs4SpDry76fAK+eVbZEaqR4FwVxVOT8FA9LPjzbzs9ah6bs
 9kPJJ7up/XNK6HDO3H1GhRomHOdYvH8OaAuo24kQhEqDyDlOf14mof777EJdmej8W+3+
 hzFQWX92WHzesj7o1eeD1H1bpT35hPi0x11ViRuk3Hlywx6aLshjo90xWClHiF+2vM6Q
 ToIQ==
X-Gm-Message-State: AOAM533WqjN4HSK/5+U3moW9JDvjygjutCeUJBwGftQj4LvmCLmzFqYF
 bVf2jtrDL4FUS/sDZR9/cWDqTIsmMo0zTaygtrEK
X-Google-Smtp-Source: ABdhPJzy7zztHHr13ApOoOFSmvI1GzkLIkvZc5Ye5P5YSBvxMrty+r0cu1DiloBKIBLcnbG5red+iRI1AIxFhmR7ruk=
X-Received: by 2002:a05:6902:568:: with SMTP id
 a8mr13239600ybt.472.1640411561867; 
 Fri, 24 Dec 2021 21:52:41 -0800 (PST)
MIME-Version: 1.0
References: <20211224211632.1698523-1-atishp@rivosinc.com>
 <20211224211632.1698523-3-atishp@rivosinc.com>
 <3188F71E-93A4-452E-A730-A2F393067346@jrtc27.com>
In-Reply-To: <3188F71E-93A4-452E-A730-A2F393067346@jrtc27.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 24 Dec 2021 21:52:31 -0800
Message-ID: <CAOnJCULK54pE1VX=Nt_cLLwSO5ytu_4w_+cnu5+NVnWemdzGeQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] dt-bindings: riscv: Add DT binding for RISC-V ISA
 extensions
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@rivosinc.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree <devicetree@vger.kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_215243_099918_DCEE3F7A 
X-CRM114-Status: GOOD (  20.43  )
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

T24gRnJpLCBEZWMgMjQsIDIwMjEgYXQgMzoyNSBQTSBKZXNzaWNhIENsYXJrZSA8anJ0YzI3QGpy
dGMyNy5jb20+IHdyb3RlOgo+Cj4gT24gMjQgRGVjIDIwMjEsIGF0IDIxOjE2LCBBdGlzaCBQYXRy
YSA8YXRpc2hwQGF0aXNocGF0cmEub3JnPiB3cm90ZToKPiA+Cj4gPiBSSVNDLVYgSVNBIGV4dGVu
c2lvbnMgY2FuIGJlIHNpbmdsZSBsZXR0ZXIgb3IgbXVsdGktbGV0dGVyIG5hbWVzLgo+ID4gVGhl
IHNpbmdsZSBsZXR0ZXIgZXh0ZW5zaW9ucyBhcmUgbW9zdGx5IGJhc2UgZXh0ZW5zaW9ucyBhbmQg
ZW5jb2RlZCBpbgo+ID4gInJpc2N2LGlzYSIgRFQgcHJvcGVydHkuIEhvd2V2ZXIsIHBhcnNpbmcg
dGhlIG11bHRpLWxldHRlciBleHRlbnNpb25zCj4gPiB2aWEgdGhlIGlzYSBzdHJpbmcgaXMgY3Vt
YmVyc29tZSBhbmQgaXMgbm90IHNjYWxhYmxlLgo+ID4KPiA+IEFkZCBhIG5ldyBEVCBub2RlIGZv
ciBtdWx0aS1sZXR0ZXIgZXh0ZW5zaW9ucy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQ
YXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbCB8IDkgKysrKysrKysrCj4gPiAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gPiBpbmRleCBhYTVmYjY0ZDU3ZWIu
LjZjNGVlY2YzODlhOSAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiA+IEBAIC03OCw2ICs3OCwxNSBAQCBwcm9wZXJ0
aWVzOgo+ID4gICAgICAgLSBydjY0aW1hYwo+ID4gICAgICAgLSBydjY0aW1hZmRjCj4gPgo+ID4g
KyAgcmlzY3YsaXNhLWV4dDoKPiA+ICsgICAgZGVzY3JpcHRpb246Cj4gPiArICAgICAgSWRlbnRp
ZmllcyB0aGUgc3BlY2lmaWMgUklTQy1WIGluc3RydWN0aW9uIHNldCBhcmNoaXRlY3R1cmUgZXh0
ZW5zaW9ucwo+ID4gKyAgICAgIHN1cHBvcnRlZCBieSBvbmUgb3IgbXVsdGlwbGUgaGFydHMuIEFs
bCB0aGUgbXVsdGktbGV0dGVyIGV4dGVuc2lvbnMKPiA+ICsgICAgICBzaG91bGQgYmUgbGlzdGVk
IGhlcmUgYXMgYSBib29sZWFuIHByb3BlcnR5LiBUaGlzIHN1Ym5vZGUgY2FuIGJlIHVuZGVyCj4g
PiArICAgICAgL2NwdXMgb3IgdW5kZXIgaW5kaXZpZHVhbCBjcHUgbm9kZS4gSW4gY2FzZSBvZiBm
b3JtZXIsIGl0IHJlcHJlc2VudAo+ID4gKyAgICAgIHRoZSBjb21tb24gSVNBIGV4dGVuc2lvbnMg
Zm9yIGFsbCBoYXJ0cy4gVGhlIG5hbWUgb2YgdGhlIGJvb2xlYW4gcHJvcGVydHkKPiA+ICsgICAg
ICBtdXN0IG1hdGNoIHRoZSBhY3R1YWwgSVNBIGV4dGVuc2lvbiBuYW1lIGluIGFsbCBsb3dlcmNh
c2UgZm9ybWF0Lgo+Cj4gSSBkb27igJl0IHNlZSB3aHkgdGhpcyBuZWVkcyBleHBsaWNpdGx5IGNh
bGxpbmcgb3V0LCB0aGF04oCZcyB0cnVlIGluCj4gZ2VuZXJhbCBvZiBjcHUgbm9kZSBwcm9wZXJ0
aWVzICgzLjhwNCBvZiB0aGUgRGV2aWNldHJlZSBzcGVjIHYwLjQtcmMxIC8KPiB2MC4zLTQwLWc3
ZTFjYzE3KSwgbm90IHRoYXQgSSBsaWtlIGl0Lgo+CgpUaGFua3MgZm9yIHBvaW50aW5nIGl0IG91
dC4gSSBkaWQgbm90IHJlYWxpemUgdGhlIERUIHNwZWNpZmljYXRpb24KYWxyZWFkeSBoYXMgYSBw
YXJhZ3JhcGgKYWJvdXQgdGhpcy4gSSB3aWxsIHVwZGF0ZSB0aGUgZGVzY3JpcHRpb24gaW4gdGhl
IG5leHQgdmVyc2lvbi4KCj4gSmVzcwo+CgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
