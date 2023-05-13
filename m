Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A3DC77B7F
	for <linux-riscv@archiver.kernel.org>; Sat, 13 May 2023 21:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YkghH69L7M4durHEKxOmHF9MPD1R0alBgTjB7YdPvYk=; b=257p/rX9uIHmnx
	L5A8JwpeGYB05fl9Frm7yLaVrn5YcN3S8Qstac9G+RtwBC0wC5FXzRfOK8fiW/NvNWgE/QEtl4Tiw
	cH6NG+v0qceivKdqL0anUMOvTHC3wHtYgdZpGIhNUMJzM9WKmNORijA2+tbaDnYJIBrm2hLLQi//w
	62ajGky4ynlA8MI4APytHCYpnjGfZ/pPISYe7uHhHBd27AKXjORn1Yt7Ndqe6XOewW+RvZfX8PuMn
	FCrS+QSxQsQQxcn+WMwMcydedp5xyVkQD9owXov2zCnEVa6lp05FDiZlCEqSE5LFQrOTUku5ECVcu
	iaeRKN8N3INji7SdhBmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxwsu-00FtXr-06;
	Sat, 13 May 2023 21:34:36 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxwsq-00FtWU-2k
	for linux-riscv@lists.infradead.org;
	Sat, 13 May 2023 21:34:34 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f49bf0223cso44672465e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 13 May 2023 14:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1684013667; x=1686605667;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/vLBPvrsIsiN7w5pMy74KH2saDihqP0R8Ezgeiomxc=;
        b=YbDe5y43mVbdrIywbptD4VHiFZRVJnd1oaaqkVH6PGzzfAsCXMu6F1Z3vzyn9FVHek
         ddCQcGnt+7EHJm2YTyynSbCFtSF/e5i31q+Hrd++JzDIRnEt/Kl56ukkwiFE4ufZWQTg
         NWuinPqcg2MOjZhHA+R55T9XX4BoKsrHPYHQgI/mnwSAm3RApB6AXE4SREPXtk0rSV/9
         A/BEwiFoBSnxAex5XFnNGMjEYlUlNBj2ewc0FTK2DRDshHLLWr3VpCp1egDOxMZynF1g
         fSJPBONW36VWG9+HPZZrBc9/THsx3S4WUdjG7G7oGPCkfPEP4lVsm0YoV3k41GTA+zoY
         hwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684013667; x=1686605667;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/vLBPvrsIsiN7w5pMy74KH2saDihqP0R8Ezgeiomxc=;
        b=Kvb5zIE1aXaF/gsXzp0SJ/MEFxAClw+A0YLMpbZYzM49nEdqGYI5VHnbspvrCoMLES
         Bx9meD7FR9SDFCpmUhepIYOh3E1McF7W03aJd1BQO6bM/5PEIiUoZaDLSVNflOFmft4R
         Id7X8HeKItbsotNak+N6fACsPKywiQpwKbF3w88P8HMEYEshRky5qcxfNotReypcU/z0
         h9sKWjtJkD5N3loxI11g2NXUxas7WY2JVvwFEHGPm4MwORHxbSfbr1LIXxw+juIczbTY
         D8UgKHXPtBk/sp3M32xCTo2OnVym3oZmh1exTe0RSfCt6CSowwM/83pZAZNil8g8dbhg
         4tgQ==
X-Gm-Message-State: AC+VfDw1O1bPftjZUkkrs2H71mzNXzJ9Sa/jA5yK/KNQrMdsgUG3zr+J
	gsZrnDfAJ92VeIAwamweEtu7yg==
X-Google-Smtp-Source: ACHHUZ4rPgcBTpiZtTgCqnVJCy0Jkz69uCx7oHYA5esBE3P4BnAvs7i69nk/mFf2Yvha/RarjOQukQ==
X-Received: by 2002:a7b:cb94:0:b0:3f4:ec32:69fd with SMTP id m20-20020a7bcb94000000b003f4ec3269fdmr5831997wmi.40.1684013667334;
        Sat, 13 May 2023 14:34:27 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id i1-20020a5d55c1000000b003062b2c5255sm27567562wrw.40.2023.05.13.14.34.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 May 2023 14:34:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [RFC 0/6] Deprecate riscv,isa DT property?
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAK9=C2XJDDYKN_HO8Q2OShQs=crQUhx4aUi5Xx4=YiAA9OYSqQ@mail.gmail.com>
Date: Sat, 13 May 2023 22:34:15 +0100
Cc: Conor Dooley <conor@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 conor+dt@kernel.org,
 =?utf-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greg Favor <gfavor@ventanamicro.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Andrew Waterman <andrew@sifive.com>,
 cyy@cyyself.name,
 Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Atish Patra <atishp@atishpatra.org>,
 Krste Asanovic <krste@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Mark Himelstein <markhimelstein@riscv.org>,
 Andrew Jones <ajones@ventanamicro.com>
Message-Id: <12BD8A89-CC3C-4C67-A501-7BB6BAD2EF59@jrtc27.com>
References: <20230511-occupancy-cleat-06e532e3ea11@spud>
 <mhng-495c690b-454c-408f-a4f2-287d7ce8a9ea@palmer-ri-x1c9a>
 <20230512-streak-camper-08a68afb5897@spud>
 <20230512-exhume-unfold-f104dd4c4cbf@spud>
 <CAK9=C2XJDDYKN_HO8Q2OShQs=crQUhx4aUi5Xx4=YiAA9OYSqQ@mail.gmail.com>
To: Anup Patel <apatel@ventanamicro.com>
X-Mailer: Apple Mail (2.3731.500.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230513_143432_967888_79C67143 
X-CRM114-Status: GOOD (  28.89  )
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

T24gMTMgTWF5IDIwMjMsIGF0IDA4OjQ3LCBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3Jv
LmNvbT4gd3JvdGU6Cj4gCj4gT24gU2F0LCBNYXkgMTMsIDIwMjMgYXQgMzozNeKAr0FNIENvbm9y
IERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4+IAo+PiArQ0MgR3JlZywgTWFyaywg
S3JzdGUsIFBoaWxpcHAsIEFuZHJldywKPj4gCj4+ICh0aGlzIGlzIExLTUwgbm93LCBubyB0b3Ag
cG9zdGluZyBvciBodG1sIHJlcGxpZXMpCj4+IAo+PiBPbiBGcmksIE1heSAxMiwgMjAyMyBhdCAw
ODo0MDoxMFBNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+PiBPbiBGcmksIE1heSAxMiwg
MjAyMyBhdCAxMTowMTowOUFNIC0wNzAwLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPj4+PiBPbiBU
aHUsIDExIE1heSAyMDIzIDE1OjM4OjEwIFBEVCAoLTA3MDApLCBDb25vciBEb29sZXkgd3JvdGU6
Cj4+Pj4+IE9uIFRodSwgTWF5IDExLCAyMDIzIGF0IDAzOjM0OjI0UE0gLTA3MDAsIEF0aXNoIFBh
dHJhIHdyb3RlOgo+Pj4+Pj4gT24gVGh1LCBNYXkgMTEsIDIwMjMgYXQgMjo0N+KAr1BNIENvbm9y
IERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pj4+Pj4gT24gVGh1LCBNYXkgMTEs
IDIwMjMgYXQgMDI6Mjc6NDRQTSAtMDcwMCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4+Pj4+IAo+Pj4+
Pj4+IFRoYXQncyBtb3JlIHRoYW4gbGFzdCB5ZWFyIGF0IHRoaXMgcG9pbnQsIGFuZCBub3RoaW5n
IGhhcyBjaGFuZ2VkIGluIHRoZQo+Pj4+Pj4+IGRvY3VtZW50YXRpb24hIFRhbGsncyBjaGVhcCwg
ZWhoPwo+Pj4+Pj4+IAo+Pj4+Pj4gCj4+Pj4+PiBZdXAuIEkgd2lsbCBwb2tlIFJWSSBmb2xrcyB0
byBjaGVjayBpZiBpdCBzdGlsbCBpcyB0aGUgcGxhbiBvciBjaGFuZ2VkICEhCj4+Pj4+IAo+Pj4+
PiBTb3VuZHMgZ29vZCwgdGhhbmtzIQo+Pj4gCj4+PiBUaGVyZSBoYXMgYmVlbiBzb21lIG1vdmVt
ZW50IG9uIHRoYXQgZnJvbnQsIHNoYWxsIHNlZSB3aGVyZSBpdCBnb2VzCj4+PiA6dXBzaWRlZG93
bl9zbWlsZToKPj4gCj4+IFRoZXJlJ3MgYmVlbiBzb21lIG9mZi1saXN0IGRpc2N1c3Npb24gcHJv
bXB0ZWQgYnkgQXRpc2ggd2l0aCBzb21lIG9mIHRoZQo+PiBSVkkgc3BlYyBmb2xrLCBmcm9tIHdo
aWNoIHRoZSB1cHNob3QgX19hcHBlYXJzX18gdG8gYmUgYW4gdW5kZXJzdGFuZGluZwo+PiB0aGF0
IHVzaW5nIHZlcnNpb24gbnVtYmVyaW5nIHRvIGluZGljYXRlIHJlbW92YWwgb2YgSVNBIGZlYXR1
cmVzIGlzIGEgYmFkCj4+IGlkZWEuCj4+IEknbSBob3BpbmcgdGhhdCB0aGlzIHJlc3VsdHMgaW4g
dGhlIGVuc2hyaW5lbWVudCBvZiB0aGlzIGluIHRoZSBJU0EKPj4gc3BlY3MsIHNvIHRoYXQgd2Ug
aGF2ZSBzb21ldGhpbmcgY29uY3JldGUgdG8gcG9pbnQgdG8gYXMgdGhlIGJhc2lzIGZvcgo+PiBu
b3QgbmVlZGluZyB0byBoYW5kbGUgdmVyc2lvbiBudW1iZXJpbmcuCj4+IENlcnRhaW5seSB0aGF0
J2QgYmUgZ3JlYXQgZm9yIEFDUEkgYW5kIHJlbW92ZSBjb25jZXJucyB0aGVyZS4KPj4gCj4+Pj4+
PiBXZSB3aWxsIGxpa2VseSBoYXZlIGEgdmVuZG9yIHNwZWNpZmljIHN0cmluZyBwYXJzaW5nIGxv
Z2ljLgo+Pj4+PiAKPj4+Pj4gQ29tcGxpY2F0aW5nIHRoZSBwYXJzaW5nIGxvZ2ljIGlzIHRoZSBl
eGFjdCBzb3J0IG9mIGNyYXAgdGhhdCBJIHdhbnQKPj4+Pj4gdG8gYXZvaWQuCj4+Pj4gCj4+Pj4g
WWEsIEkgdGhpbmsgd2UncmUgcmVhbGxseSBvdmVyY29tcGxpY2F0aW5nIHRoaW5ncyB3aXRoIHRo
ZSBJU0Egc3RyaW5ncy4KPj4+PiBMZXQncyBqdXN0IGRlcHJlY2F0ZSB0aGVtIGFuZCBtb3ZlIHRv
IHNvbWV0aGluZyB0aGF0IGRvZXNuJ3QgbmVlZCBhbGwgdGhlCj4+Pj4gYmVzcG9rZSBzdHJpbmcg
cGFyc2luZy4KPj4+IAo+Pj4gVmVyc2lvbmluZyBhc2lkZSwgYWx0aG91Z2ggdGhhdCByZW1vdmVz
IGEgbGFyZ2UgcGFydCBvZiB0aGUgbW90aXZhdGlvbiwKPj4+IHRoZSBpbnRlcmZhY2UgYmVjb21l
cyBxdWl0ZSBuaWNlOgo+Pj4gb2ZfcHJvcGVydHlfcHJlc2VudChub2RlLCAicmlzY3YsaXNhLWV4
dGVuc2lvbi16aWNib20iKQo+PiAKPj4gTXkgY3VycmVudCBmZWVsaW5nIGlzIHRoYXQsIHJhdGhl
ciB0aGFuIGludHJvZHVjaW5nIGEga2V5LXZhbHVlIHR5cGUgb2YKPj4gcHJvcGVydHksIGFkZGlu
ZyBib29sZWFuIHByb3BlcnRpZXMgZm9yIGV4dGVuc2lvbnMgaXMgdGhlIHdheSB0byBnbwo+PiBo
ZXJlLiBUaGUgInJpc2N2LGlzYSIgcGFydCBvZiB0aGUgRFQgQUJJIHByZS1kYXRlcyBldmVuIHRo
ZSByYXRpZmljYXRpb24KPj4gb2YgdGhlIGJhc2UgZXh0ZW5zaW9ucyAoYW5kIHRodXMgdGhlIHJl
bW92YWwgb2Ygc29tZSBmZWF0dXJlcy4uLikuCj4+IFN0YXJ0aW5nIGFnYWluIHdpdGggYSBuZXcg
cHJvcGVydHkgd291bGQgYWxsb3cgdXMgdG8gZGVmaW5lIGV4dGVuc2lvbnMKPj4gYXMgcGVyIHRo
ZWlyIHJhdGlmaWVkIHN0YXRlLCByYXRoZXIgdGhhbiB0aGUgaW50ZXJtZWRpYXRlICYgaW5jb21w
YXRpYmxlCj4+IHN0YXRlcyB0aGF0IHdlIGhhdmUgY3VycmVudGx5IGdvdCB3aXRoICJyaXNjdixp
c2EiLgo+PiBTdWNoIGEgbW9kZWwgZG9lcyByZWx5IG9uIHRoZSBzdHJlbmd0aGVuaW5nIG9mIHRo
ZSB3b3JkaW5nIGluIHRoZQo+PiBzcGVjaWZpY2F0aW9uLgo+IAo+IElTQSBzdHJpbmcgcGFyc2Vk
IGZvciBib3RoIERUIGFuZCBBQ1BJLgo+IAo+IEZvciBBQ1BJLCBtb3ZpbmcgdG8gYSBwZXItZXh0
ZW5zaW9uIGJpdCBpbiBhIGJpdG1hcCBhbmQgZGVmaW5pbmcKPiBhIG5ldyBiaXQgd2l0aCBldmVy
eSBJU0EgZXh0ZW5zaW9uIHdpbGwgYmUgdmVyeSB2ZXJ5IGluY29udmVuaWVudAo+IGZvciB1cGRh
dGluZyB0aGUgQUNQSSBzcGVjcy4gV2Ugc2hvdWxkIGNvbnRpbnVlIHRoZSBJU0Egc3RyaW5nCj4g
cGFyc2luZyBhdCBsZWFzdCBmb3IgQUNQSS4KPiAKPiBGb3IgRFQsIHVzZXJzIGNhbiBlaXRoZXIg
dXNlICJyaXNjdixpc2EiIERUIHByb3BlcnR5IG9yIHVzZSBib29sZWFuCj4gRFQgcHJvcGVydGll
cy4KCkNhbiB3ZSBwbGVhc2Ugbm90IGdyYXR1aXRvdXNseSBoYXZlIHR3byB3YXlzIG9mIGRvaW5n
IHRoZSBzYW1lIHRoaW5nLgoKSSBzYXkgdGhpcyBhcyBhIG5vbi1MaW51eCBPUyB0aGF0IGhhcyB0
byBkZWFsIHdpdGggd2hhdGV2ZXIgTGludXgKZGVjaWRlcyB0byBkbyB3aXRoIGRldmljZSB0cmVl
cy4gSXQgaXMgYSB0b3RhbCBudWlzYW5jZSB3aGVuIHlvdSBmbGlwCmZsb3Agb24gdGhpbmdzIGFu
ZCB3ZSBoYXZlIHRvIGZvbGxvdyBzdWl0LiBQbGVhc2UgY29uc2lkZXIgdGhlIGJyZWFrYWdlCnZl
cnkgY2FyZWZ1bGx5LgoKSmVzcwoKPj4gVGhpcyBoYWQgdGhlIGFkdmFudGFnZSBvZiBiZWluZywg
YXMgSSBtZW50aW9uIGFib3ZlLCBldmVuIGVhc2llciB0bwo+PiBwYXJzZSBpbiBzb2Z0d2FyZSB0
aGFuIHRoZSBrZXktdmFsdWUgcGFpciBidXNpbmVzcyAtIGJ1dCBhbHNvIGlzCj4+IHRyaXZpYWxs
eSBpbXBsZW1lbnRlZCBpbiBhIGR0LWJpbmRpbmcuIFdoYXQgSSBoYXZlIGJlZW4gdHJ5aW5nIHRv
IGRvCj4+IHdpdGggdGhlIHZhbGlkYXRpb24gb2YgdGhlIGtleS12YWx1ZSBzdHVmZiBkb2VzIG5v
dCBhcHBlYXIgdG8gYmUgcmVhZGlseQo+PiBkb2FibGUhCj4+IAo+PiAoQW5vdGhlciBkcmF3YmFj
ayB0aGF0IGhhcyBjb21lIHRvIG1pbmQgaXMgdGhhdCB3ZSBoYXZlIG5vIHdheSB0bwo+PiB2YWxp
ZGF0ZSB3aGV0aGVyIG11dHVhbGx5IGV4Y2x1c2l2ZSBleHRlbnNpb25zIGhhdmUgYmVlbiBhZGRl
ZCB3aXRoCj4+ICJyaXNjdixpc2EiKQo+PiAKPj4+IFRoYXQgYWxzbyBnaXZlcyB1cyB0aGUgYWJp
bGl0eSB0byBkZWZpbmUgd2hhdCBzdXBwb3J0ZWQgdmVuZG9yCj4+PiBleHRlbnNpb25zIGFjdHVh
bGx5IG1lYW4gaW4gYSBkdC1iaW5kaW5nLCB3aGljaCB0byBtZSBpcyBhIGJpZyB3aW4gaW4KPj4+
IHRlcm1zIG9mIHRoZSBhZm9yZW1lbnRpb25lZCAid2lsZCB3ZXN0Ii4KPj4gCj4+IFZlbmRvciBl
eHRlbnNpb25zIGV0YyBhcmUgb2Z0IHF1b3RlZCBhcyBvbmUgb2YgdGhlIHN0cmVuZ3RocyBvZiBS
SVNDLVYsCj4+IGFuZCBteSBmZWVsaW5nIGlzIHRoYXQgInJpc2N2LGlzYSIgaXMgbm90IGEgbWVj
aGFuaXNtIHdoZXJlIHdlIGNhbgo+PiBlYXNpbHkgaGFuZGxlIG1lYW5pbmdzIC0gZXNwZWNpYWxs
eSBmb3IgdmVuZG9yIHN0dWZmIHdoZXJlIHRoZXJlIGlzCj4+IG90aGVyd2lzZSBubyBjZW50cmFs
aXNlZCBsb2NhdGlvbiBmb3IgX3hmb28gLT4gZmVhdHVyZSBtYXBwaW5ncy4KPj4gCj4+IENoZWVy
cywKPj4gQ29ub3IuCj4gCj4gUmVnYXJkcywKPiBBbnVwCj4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
