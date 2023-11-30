Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD50C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 11:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eew5yh27uEb7sSrlvLc0FjnLVqmJ+qfos/cynNgNWD0=; b=0bIhaRFmEb8JuR
	9uxxgUvBnKY2ovH0Bn+ttkJjdkLl8GsAQnwaLyjpUlJ3Tqv0nL+hy+6jiXai727kD3n/CSbr3nHyO
	GnpZ2cXPfG/0aOHB6qn++FwaTtUTpTXipt95xNv6hjNIfKlv7twvB42aejkjB76I0gkhvGdg66Kr+
	r/bDZMFCyr0857JQ7zc5c3ua+X59pm+rRLbEvARpT2c7Hwo5QqFrhNxC+AosaXAruVUXhsQEJIjJX
	PD1KDVhAgtKENMdU2HfCkL0n0b9ngfBrMBVXoQDxS5WIwF+sw9QzxUXxU1OL6zzWCkILynffhwjQa
	U5NwhQxn1oacZHXCzOEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8fX0-00AeoB-0I;
	Thu, 30 Nov 2023 11:48:34 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8fWw-00AekT-0q
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 11:48:32 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-286447abfbeso183673a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 03:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701344908; x=1701949708; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5xVQObOoSd+luGlbgeWIPH7/3pbckJn6omk5INMCc8=;
        b=HWpu6bpp2ZUf1OZpAXSryUScp9J30SRDuruD44zwg3VaDnvjsmVifMgpqjBFG6EeAR
         hI0NI1D2bInxu/pTM4zWU2btHFlrgh0G0714Iun3w4sZ7kf/w0/HQX0MYCjNqhqMMOjr
         uivyOr416xD5CvdkGJ4lmm77nnsAqd94yif1rb97JF4xId4/fVdVe9zVWoqPgVQIRYr1
         0JrvDlg2CB67bna+JAvv05lcf0O2WUhS/SkEXhtYk3gkKaUoD0zFpnHv8ewQAdawZMgz
         j4eC/Rx7LBB1O5NSp/zE+Shn5q0J19IXqH9X/USz6tnJIsjEn5zuUgXFpaS9FSV3t4w+
         mg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701344908; x=1701949708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5xVQObOoSd+luGlbgeWIPH7/3pbckJn6omk5INMCc8=;
        b=f4rBQ0ijQhgZ9Sd6IV3LNRcO1xhL4zQHWvbbRqtqK6nArLzCMglVWHc61Fwoz/MOY5
         NO1WJiewX7qdggBCP0ZU8OZSFBdUxQeIVgkJmv4okODctCi2f9kMri9LmDFUgCu/N1we
         O/7WpyBvzFw2P5jVAi2zJ/UhhhDDLumY8TpQq5EhzihXoSOdySrzSgYm3M5Ecn5aG7HV
         cfnF8itBwtZGstQhoCEWmjv7qEKZosbFVa63hDBBldHZH/dcpXvzqO6PEuspU8JEyFGY
         scs3Ra6+y5z55tTJjsiJeGauHuw3qfy2NAxFOTIxjnZqPU3JkzRPyQVk/9LJ+YWdGrgU
         M3mg==
X-Gm-Message-State: AOJu0Yzk5cMjVElReybIER8gk1Cnq7RTUJzsy3mF2Jrppk9/rVPrOWWc
	J8p74kyAxC2mwVyyzHJvoUl192OJYZ8fC+oELVoQqw==
X-Google-Smtp-Source: AGHT+IFTmJeU2BC41RfxCo4Hb6eAP+kSriPWB9Hzj5XXCXlBKjrBq16vH0SwZWA6USdqgl/1JnjAj/QuHOy5XuumlTM=
X-Received: by 2002:a17:90a:bc84:b0:286:2013:cfe9 with SMTP id
 x4-20020a17090abc8400b002862013cfe9mr6667826pjr.2.1701344908209; Thu, 30 Nov
 2023 03:48:28 -0800 (PST)
MIME-Version: 1.0
References: <IA1PR20MB4953C82499C5D81D2C6A020BBBB6A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953F9D77FFC76A9D236922DBBB6A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CAK9=C2WAv5jJBt56xBea268DeyUA+YvbU7i+ahVjueafCi-r6A@mail.gmail.com>
 <20231130-decibel-passenger-6e932b1ce554@spud> <CAK9=C2Vsx8ddpYiqUhvqnJpdb-FKeNhLz3PsVpSeEz4TeQHiEg@mail.gmail.com>
 <20231130-shower-award-3cd5f1bba5db@spud>
In-Reply-To: <20231130-shower-award-3cd5f1bba5db@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 30 Nov 2023 17:18:15 +0530
Message-ID: <CAK9=C2WgN=3BjxS+nF2ibFQoquNwXfxr_UQv8Kbf1+e4Teyfcw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: thead,c900-aclint-mtimer:
 separate mtime and mtimecmp regs
To: Conor Dooley <conor@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Chen Wang <unicorn_wang@outlook.com>, 
	Anup Patel <anup@brainfault.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_034830_306330_C0565937 
X-CRM114-Status: GOOD (  43.04  )
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

T24gVGh1LCBOb3YgMzAsIDIwMjMgYXQgNToxNeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIE5vdiAzMCwgMjAyMyBhdCAwNDo1MTozMlBNICsw
NTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gT24gVGh1LCBOb3YgMzAsIDIwMjMgYXQgMzoyN+KA
r1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9u
IFRodSwgTm92IDMwLCAyMDIzIGF0IDAzOjAxOjI0UE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6
Cj4gPiA+ID4gT24gU2F0LCBOb3YgMTgsIDIwMjMgYXQgMTI6MznigK9QTSBJbm9jaGkgQW1hb3Rv
IDxpbm9jaGlhbWFAb3V0bG9vay5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSB0
aW1lciByZWdpc3RlcnMgb2YgYWNsaW50IGRvbid0IGZvbGxvdyB0aGUgY2xpbnQgbGF5b3V0IGFu
ZCBjYW4KPiA+ID4gPiA+IGJlIG1hcHBlZCBvbiBhbnkgZGlmZmVyZW50IG9mZnNldC4gQXMgc2cy
MDQyIHVzZXMgc2VwYXJhdGVkIHRpbWVyCj4gPiA+ID4gPiBhbmQgbXN3aSBmb3IgaXRzIGNsaW50
LCBpdCBzaG91bGQgZm9sbG93IHRoZSBhY2xpbnQgc3BlYyBhbmQgaGF2ZQo+ID4gPiA+ID4gc2Vw
YXJhdGVkIHJlZ2lzdGVycy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGUgcHJldmlvdXMgcGF0Y2gg
aW50cm9kdWNlZCBhIG5ldyB0eXBlIG9mIFQtSEVBRCBhY2xpbnQgdGltZXIgd2hpY2gKPiA+ID4g
PiA+IGhhcyBjbGludCB0aW1lciBsYXlvdXQuIEFsdGhvdWdoIGl0IGhhcyB0aGUgY2xpbnQgdGlt
ZXIgbGF5b3V0LCBpdAo+ID4gPiA+ID4gc2hvdWxkIGZvbGxvdyB0aGUgYWNsaW50IHNwZWMgYW5k
IHVzZXMgdGhlIHNlcGFyYXRlZCBtdGltZSBhbmQgbXRpbWVjbXAKPiA+ID4gPiA+IHJlZ3MuIFNv
IGEgQUJJIGNoYW5nZSBpcyBuZWVkZWQgdG8gbWFrZSB0aGUgdGltZXIgZml0IHRoZSBhY2xpbnQg
c3BlYy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUbyBtYWtlIFQtSEVBRCBhY2xpbnQgdGltZXIgbW9y
ZSBjbG9zZXIgdG8gdGhlIGFjbGludCBzcGVjLCB1c2UKPiA+ID4gPiA+IHJlZ3MtbmFtZXMgdG8g
cmVwcmVzZW50IHRoZSBtdGltZWNtcCByZWdpc3Rlciwgd2hpY2ggY2FuIGF2b2lkIGhhY2sKPiA+
ID4gPiA+IGZvciB1bnN1cHBvcnQgbXRpbWUgcmVnaXN0ZXIgb2YgVC1IRUFEIGFjbGludCB0aW1l
ci4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9j
aGlhbWFAb3V0bG9vay5jb20+Cj4gPiA+ID4gPiBGaXhlczogNDczNDQ0OWY3MzExICgiZHQtYmlu
ZGluZ3M6IHRpbWVyOiBBZGQgU29waGdvIHNnMjA0MiBDTElOVCB0aW1lciIpCj4gPiA+ID4gPiBM
aW5rOiBodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL29wZW5zYmkvMjAyMy1P
Y3RvYmVyLzAwNTY5My5odG1sCj4gPiA+ID4gPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcmlz
Y3YvcmlzY3YtYWNsaW50L2Jsb2IvbWFpbi9yaXNjdi1hY2xpbnQuYWRvYwo+ID4gPiA+Cj4gPiA+
ID4gVGhlIHJhdGlmaWVkIFByaXYgdjEuMTIgc3BlY2lmaWNhdGlvbiBkZWZpbmVzIHBsYXRmb3Jt
IHNwZWNpZmljIE0tbW9kZSB0aW1lcgo+ID4gPiA+IHJlZ2lzdGVycyB3aXRob3V0IGRlZmluaW5n
IGFueSBsYXlvdXQgb2YgbXRpbWUgYW5kIG10aW1lY21wIHJlZ2lzdGVycy4KPiA+ID4gPiAoUmVm
ZXIsICIzLjIuMSBNYWNoaW5lIFRpbWVyIFJlZ2lzdGVycyAobXRpbWUgYW5kIG10aW1lY21wKSIp
Cj4gPiA+ID4KPiA+ID4gPiBUaGUgInRoZWFkLGM5MDAtYWNsaW50LW10aW1lciIgY2FuIGJlIHRo
b3VnaHQgb2YgYXMgaXMgb25lIHBvc3NpYmxlCj4gPiA+ID4gaW1wbGVtZW50YXRpb24gb2YgInJp
c2N2LG10aW1lciIgZGVmaW5lZCBieSB0aGUgUHJpdiB2MS4xMiBzcGVjaWZpY2FpdG9uLgo+ID4g
PiA+Cj4gPiA+ID4gSWYgaXQgaXMgbm90IHRvbyBsYXRlIHRoZW4gSSBzdWdnZXN0IG1ha2luZyB0
aGlzIGJpbmRpbmcgaW50byBnZW5lcmljCj4gPiA+ID4gInJpc2N2LG10aW1lciIgYmluZGluZy4K
PiA+ID4KPiA+ID4gV2UgY291bGQgZGVmaW5pdGVseSByZW9yZ2FuaXNlIHRoaW5ncywgaXQncyBu
b3QgdG9vIGxhdGUgZm9yIHRoYXQgYXMKPiA+ID4gaW1wbGVtZW50YXRpb24gc3BlY2lmaWMgY29t
cGF0aWJsZXMgd291bGQgYmUgbmVlZGVkIHJlZ2FyZGxlc3MsIHNvCj4gPiA+IHNvZnR3YXJlIHRo
YXQgd291bGQndmUgbWF0Y2hlZCBvbiB0aG9zZSB3aWxsIGNvbnRpbnVlIHRvIGRvIHNvLgo+ID4g
Pgo+ID4gPiBUaGF0IHNhaWQsIGRvZXMgdGhpcyBwbGF0Zm9ybSBhY3R1YWxseSBpbXBsZW1lbnQg
dGhlIDEuMTIgcHJpdiBzcGVjIGlmCj4gPiA+IHRoZXJlIGlzIG5vIG10aW1lIHJlZ2lzdGVyPyBU
aGUgc2VjdGlvbiB5b3UgcmVmZXJlbmNlIHNheXM6Cj4gPiA+ICJQbGF0Zm9ybXMgcHJvdmlkZSBh
IHJlYWwtdGltZSBjb3VudGVyLCBleHBvc2VkIGFzIGEgbWVtb3J5LW1hcHBlZAo+ID4gPiBtYWNo
aW5lLW1vZGUgcmVhZC13cml0ZSByZWdpc3RlciwgbXRpbWUuIiBJdCBzZWVtcyB0byBtZSBsaWtl
IHRoaXMKPiA+ID4gaGFyZHdhcmUgaXMgbm90IHN1aXRhYmxlIGZvciBhIGdlbmVyaWMgInJpc2N2
LG10aW1lciIgZmFsbGJhY2suCj4gPgo+ID4gWWVzLCB0aGUgVC1IZWFkIG10aW1lciBkb2VzIG5v
dCBpbXBsZW1lbnQgYm90aCBtdGltZSBhbmQgbXRpbWVjbXAKPiA+IHNvIHRlY2huaWNhbGx5IGl0
IG9ubHkgaW1wbGVtZW50cyBhIHBvcnRpb24gb2YgdGhlIHJhdGlmaWVkIFJJU0MtViBtdGltZXIK
PiA+IGNoYXB0ZXIuCj4gPgo+ID4gPgo+ID4gPiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nIHRoZXJl
IEFudXA/Cj4gPiA+Cj4gPiA+IEl0IGRvZXNuJ3QgZXZlbiBpbXBsZW1lbnQgdGhlIGRyYWZ0IGFj
bGludCBzcGVjLCBnaXZlbiB0aGF0IHRoYXQgc2F5czoKPiA+ID4gIlRoZSBNVElNRVIgZGV2aWNl
IHByb3ZpZGVzIG1hY2hpbmUtbGV2ZWwgdGltZXIgZnVuY3Rpb25hbGl0eSBmb3IgYSBzZXQKPiA+
ID4gb2YgSEFSVHMgb24gYSBSSVNDLVYgcGxhdGZvcm0uIEl0IGhhcyBhIHNpbmdsZSBmaXhlZC1m
cmVxdWVuY3kgbW9ub3RvbmljCj4gPiA+IHRpbWUgY291bnRlciAoTVRJTUUpIHJlZ2lzdGVyIGFu
ZCBhIHRpbWUgY29tcGFyZSByZWdpc3RlciAoTVRJTUVDTVApIGZvcgo+ID4gPiBlYWNoIEhBUlQg
Y29ubmVjdGVkIHRvIHRoZSBNVElNRVIgZGV2aWNlLiIKPiA+ID4KPiA+ID4gQnV0IEkgYWxyZWFk
eSBzYWlkIG5vIHRvIGhhdmluZyBhIGdlbmVyaWMsICJyaXNjdiIgcHJlZml4ZWQsIGNvbXBhdGli
bGUKPiA+ID4gZm9yIHRoYXQsIGdpdmVuIGl0IGlzIGluIGRyYWZ0IGZvcm0uCj4gPgo+ID4gSSBh
bSBub3Qgc3VnZ2VzdGluZyBULUhlYWQgdGltZXIgaW1wbGVtZW50cyBhY2xpbnQgc3BlYy4gQWxz
bywKPiA+IHNpbmNlIGFjbGludCBzcGVjIGlzIGluIGRyYWZ0IHN0YXRlIGl0IGlzIG91dCBvZiB0
aGUgcXVlc3Rpb24uCj4KPiBJIGRpZCBub3QgaW50ZW5kIHRvIGltcGx5IHRoYXQgeW91IHdlcmUg
c3VnZ2VzdGluZyB0aGF0IHRoZXJlIHNob3VsZCBiZQo+IG9uZS4gSSB3YXMganVzdCB0cnlpbmcg
dG8gY2xhcmlmeSB0aGF0IEkgd2FzIG5vdCB0cnlpbmcgdG8gYnJpbmcgYmFjawo+IHRoZSB0b3Bp
YyBvZiBhIGdlbmVyaWMgYWNsaW50IGJpbmRpbmcgYXBwbHlpbmcgaGVyZS4KPgo+ID4gTXkgc3Vn
Z2VzdGlvbiBpcyB0byB0cmVhdCAiMy4yLjEgTWFjaGluZSBUaW1lciBSZWdpc3RlcnMgKG10aW1l
Cj4gPiBhbmQgbXRpbWVjbXApIiBhcyBSSVNDLVYgbXRpbWVyIGRlZmluZWQgYnkgdGhlIFJJU0Mt
ViBwcml2aWxlZ2VkCj4gPiBzcGVjaWZpY2F0aW9uIGFuZCBkZWZpbmUgInJpc2N2IiBwcmVmaXhl
ZCBEVCBiaW5kaW5nIGZvciB0aGlzLgo+Cj4gSSdtIG5vdCBhZ2FpbnN0IGEgYmluZGluZyBmb3Ig
dGhhdCBhdCBhbGwuCgpUaGFua3MuCgo+Cj4gPiBUaGlzIGJpbmRpbmcgZGVmaW5lcyB0d28gcG9z
c2libGUgdmFsdWVzIGZvciAicmVnIiBwcm9wZXJ0eToKPiA+IDEpIGNvbnRhaW5zIHR3byBpdGVt
czogYSkgbXRpbWUgcmVnaXN0ZXIgYWRkcmVzcyBhbmQsCj4gPiAgICAgIGIpIGJhc2UgYWRkcmVz
cyBvZiBtdGltZWNtcCByZWdpc3RlcnMKPiA+IDIpIGNvbnRhaW4gb25lIGl0ZW06IGEpIGJhc2Ug
YWRkcmVzcyBvZiBtdGltZWNtcCByZWdpc3RlcnMKPiA+Cj4gPiBUaGUgdC1oZWFkIG10aW1lciBz
ZWVtcyB0byBpbXBsZW1lbnQgIzIgd2hlcmVhcyB0aGUgUklTQy1WCj4gPiBtdGltZXIgKFByaXYg
c3BlYykgYWxpZ25zIHdpdGggIzEuCj4gPgo+ID4gSWYgd2Ugd2FudCB0byBrZWVwIHRoaXMgRFQg
YmluZGluZyB0LWhlYWQgc3BlY2lmaWMgdGhlbgo+ID4gd2Ugc2hvdWxkIHJlbW92ZSBvcHRpb24g
IzEgKGFib3ZlKSBmcm9tIHRoaXMgRFQgYmluZGluZwo+Cj4gVGhpcyBwYXJ0IGlzIGFscmVhZHkg
dGhlIGNvbmNsdXNpb24gb2Ygb25lIG9mIHRoZSBvdGhlciAiYnJhbmNoZXMiIG9mCj4gdGhpcyB0
aHJlYWQgYW5kIGlzIChBRkFJVSkgSW5vY2hpJ3MgcGxhbiBmb3IgdGhlIG5leHQgdmVyc2lvbi4K
ClNvdW5kcyBnb29kLgoKPgo+ID4gYW5kIGFkZCBzZXBhcmF0ZSAicmlzY3YiIHByZWZpeGVkIERU
IGJpbmRpbmcgZm9yIFJJU0MtViBtdGltZXIuCj4KPiBEbyB5b3Uga25vdyBvZiBhbnkgdXNlcnMg
Zm9yIGEgInJpc2N2LG10aW1lciIgYmluZGluZyB0aGF0IGFyZSBub3QKPiBjb3ZlcmVkIGJ5IGV4
aXN0aW5nIGJpbmRpbmdzIGZvciB0aGUgY2xpbnQ/CgpWZW50YW5hIFZleXJvbi12MSBpbXBsZW1l
bnRzIGEgbXRpbWVyIHBlci1jbHVzdGVyIChvciBjaGlwbGV0KQp3aGljaCBpcyBjb21wYXRpYmxl
IHRvICJyaXNjdixtdGltZXIiIChpLmUuIHdlIGhhdmUgYm90aCBtdGltZQphbmQgbXRpbWVjbXAg
TU1JTyByZWdpc3RlcnMpLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
