Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CE7C4707B
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 13:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KDkYqnJWCIJPqk8z/XpP52bhF2YQThYH4YmV0Ehx3BY=; b=cE84BfuQ0vQ62G
	Z4xzvus+9VQBY2EKSPNpouHdu6gd19ix4JdWoRjSy8DDJlVK/1JyB2GAPIIV9E2WpwVAAwnxNyJ8s
	L7TfPNmpSVsWEXfTK8bLrjtbpBPD400wrJzXBJTR9fqW8cTlU6me42U73VcIrP1IfR+UFmjbGC3V3
	cv53/Q4mQ0LnFJaWsMzg1fqzUj4Z25vspHGSha0gFRELHItG1AvuskhLwALKRe8oFG1znZ6bAR3fm
	y7RLrCz+9tteohOQVPwXQN364tZgU87QEBHpyjWgI3DPzXaHIH6c2zDKbRwQOJyCi+vqzMcaPtq5L
	Gk/AZ5rUnO6rm4yRARPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQS1n-002nPM-1K;
	Thu, 18 Jan 2024 13:01:51 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQS1j-002nOH-0T
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 13:01:49 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a28a997f3dfso917492766b.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jan 2024 05:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705582904; x=1706187704; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CV99ndMBEnv7+i0KgO9Jy4dZrWznQQ7WCTJP40FuP9k=;
        b=nC//mvzypBC0N/9NYWOI6/yu+OoIjsW8ef80DhLajyzaGAjSjbYvsr/L2m85b3ANR0
         COOctkNQbSJzJp5/edczOwZubYKkWQyZma4UcY/LVwna/uDIvAwoe+hQvbAOsA4Dqqtf
         BFPu8tJ4UJLT84KthhzUBDwVRMxngKjnvpLwWFDgo0pPjyG7vVJQ8l7eht5gcHKvl1II
         BlPgN7VqG1LCHG/Rz0sy95f1jVnSA/NBqb1B5hY5JQdGJOliTfBDyHDuLdunqGTRSXfx
         6Jkywlyesa3kzaaV+7cvONKqYXFgDvrXYaiRZgeCwd5VkBsm/TMtHVxjw52T+F3yx/Mm
         pijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705582904; x=1706187704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CV99ndMBEnv7+i0KgO9Jy4dZrWznQQ7WCTJP40FuP9k=;
        b=NetrurUUVwSA6ADL2GOx6DUUgi+26oeq+WAYfKfP/Cy03+NtRa1kjzwMUvW/TZ+vz8
         JgZpYDPVVFr18OozJ0/vxq3RiG33XefDAOOYVqzAC8OeakwRJh5ktHQLq2UW8QVZhGof
         EmsJLFKWmE/JhSJwAxTz8mK1yAOVdTVA2hvFRsKz3YHybSwZI21rOWLchzg9b1GISP5G
         Pv/IjxRZIunlfryjCUaCT3bSDrjVX/bX8fBWGFYacT0DqphS0ZcnaEFNAD9YhTovzZGD
         ZhvcZGSjZiQ8SLelBb15skd34ayAKWzkYAeMb6+mxcab5uHrnSGwcZ2z7kFt20jObOM9
         1+bA==
X-Gm-Message-State: AOJu0Yxr7QmyKpgk4pWMk9rv6JhKBgyVLo7sqM6L0gjdtRE3o6dvDyi6
	WpR7NkeIsOFMWQGsYCNf0vWVg765aTZbzsKP2iKiguReWPsOYcuKsLJVfc8y0z38LEYIi1GmsUF
	OyfgSJrZ4y8zLMFTPnIp4TkZv2Fz8TxVYwk4NjQ==
X-Google-Smtp-Source: AGHT+IGXHWuAbZf6vP7bFyGlIWm/V3xNm9G1zzWXciRpuQQcls3Pd1mtfB3eXcJXawXwCc8Me/YMNC+4PA9rLOOa3OQ=
X-Received: by 2002:a17:906:3b10:b0:a2c:b0a6:8b6 with SMTP id
 g16-20020a1709063b1000b00a2cb0a608b6mr488211ejf.1.1705582904215; Thu, 18 Jan
 2024 05:01:44 -0800 (PST)
MIME-Version: 1.0
References: <20230316131711.1284451-1-alexghiti@rivosinc.com>
 <CAK9=C2XJtSG2d_nsyDv7kU1v7Jj0chdevqrMc0MpJswukcEABA@mail.gmail.com>
 <CAHVXubhhxpzHDM-n91V_rceY5t_VqLvrwZj3RP_tNL2=F9mqjQ@mail.gmail.com>
 <CAK9=C2WVOpSqtt8r1U4hnzSZ=cc1PocpukgQjNyahP2XuPhozw@mail.gmail.com>
 <d0087922-4721-ccf1-80bf-9f74099d0948@ghiti.fr> <CAPqJEFr6MgUyARfbWAo7EeQKLVd4xRJz_LOYN68UC-kPD1Hr5A@mail.gmail.com>
 <20240118082346.GB31078@hsinchu15>
In-Reply-To: <20240118082346.GB31078@hsinchu15>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 18 Jan 2024 14:01:33 +0100
Message-ID: <CAHVXubiQ5N+ngdy=Fk3j-hS_KkOEg272b++-hB4-oGeSSZKtNQ@mail.gmail.com>
Subject: Re: Fwd: [PATCH v8 0/4] riscv: Use PUD/P4D/PGD pages for the linear mapping
To: Nylon Chen <nylon.chen@sifive.com>
Cc: alex@ghiti.fr, apatel@ventanamicro.com, catalin.marinas@arm.com, 
	will@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, robh+dt@kernel.org, frowand.list@gmail.com, 
	rppt@kernel.org, akpm@linux-foundation.org, anup@brainfault.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mm@kvack.org, zong.li@sifive.com, nylon7717@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_050147_392723_39C55D02 
X-CRM114-Status: GOOD (  49.66  )
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

SGkgTnlsb24sCgpPbiBUaHUsIEphbiAxOCwgMjAyNCBhdCA5OjIz4oCvQU0gTnlsb24gQ2hlbiA8
bnlsb24uY2hlbkBzaWZpdmUuY29tPiB3cm90ZToKPgo+ID4gT24gMy8yMy8yMyAxNTo1NSwgQW51
cCBQYXRlbCB3cm90ZToKPiA+ID4gT24gVGh1LCBNYXIgMjMsIDIwMjMgYXQgNjoyNOKAr1BNIEFs
ZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+PiBIaSBB
bnVwLAo+ID4gPj4KPiA+ID4+IE9uIFRodSwgTWFyIDIzLCAyMDIzIGF0IDE6MTjigK9QTSBBbnVw
IFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPiA+Pj4gSGkgQWxleCwK
PiA+ID4+Pgo+ID4gPj4+IE9uIFRodSwgTWFyIDE2LCAyMDIzIGF0IDY6NDjigK9QTSBBbGV4YW5k
cmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPj4+PiBUaGlzIHBh
dGNoc2V0IGludGVuZHMgdG8gaW1wcm92ZSB0bGIgdXRpbGl6YXRpb24gYnkgdXNpbmcgaHVnZXBh
Z2VzIGZvcgo+ID4gPj4+PiB0aGUgbGluZWFyIG1hcHBpbmcuCj4gPiA+Pj4+Cj4gPiA+Pj4+IEFz
IHJlcG9ydGVkIGJ5IEFudXAgaW4gdjYsIHdoZW4gU1RSSUNUX0tFUk5FTF9SV1ggaXMgZW5hYmxl
ZCwgd2UgbXVzdAo+ID4gPj4+PiB0YWtlIGNhcmUgb2YgaXNvbGF0aW5nIHRoZSBrZXJuZWwgdGV4
dCBhbmQgcm9kYXRhIHNvIHRoYXQgdGhleSBhcmUgbm90Cj4gPiA+Pj4+IG1hcHBlZCB3aXRoIGEg
UFVEIG1hcHBpbmcgd2hpY2ggd291bGQgdGhlbiBhc3NpZ24gd3JvbmcgcGVybWlzc2lvbnMgdG8K
PiA+ID4+Pj4gdGhlIHdob2xlIHJlZ2lvbjogaXQgaXMgYWNoaWV2ZWQgYnkgaW50cm9kdWNpbmcg
YSBuZXcgbWVtYmxvY2sgQVBJLgo+ID4gPj4+Pgo+ID4gPj4+PiBBbm90aGVyIHBhdGNoIG1ha2Vz
IHVzZSBvZiB0aGlzIG5ldyBBUEkgaW4gYXJtNjQgd2hpY2ggdXNlZCBzb21lIHNvcnQgb2YKPiA+
ID4+Pj4gaGFjayB0byBzb2x2ZSB0aGlzIGlzc3VlOiBpdCB3YXMgYnVpbHQvYm9vdCB0ZXN0ZWQg
c3VjY2Vzc2Z1bGx5Lgo+ID4gPj4+Pgo+ID4gPj4+PiBiYXNlLWNvbW1pdC10YWc6IHY2LjMtcmMx
Cj4gPiA+Pj4+Cj4gPiA+Pj4+IHY4Ogo+ID4gPj4+PiAtIEZpeCBydjMyLCBhcyByZXBvcnRlZCBi
eSBBbnVwCj4gPiA+Pj4+IC0gRG8gbm90IG1vZGlmeSBtZW1ibG9ja19pc29sYXRlX3JhbmdlIGFu
ZCBmaXhlcyBjb21tZW50LCBhcyBzdWdnZXN0ZWQgYnkgTWlrZQo+ID4gPj4+PiAtIFVzZSB0aGUg
bmV3IG1lbWJsb2NrIEFQSSBmb3IgY3Jhc2gga2VybmVsIHRvbyBpbiBhcm02NCwgYXMgc3VnZ2Vz
dGVkIGJ5IEFuZHJldwo+ID4gPj4+PiAtIEZpeCBhcm02NCBkb3VibGUgbWFwcGluZyAod2hpY2gg
dG8gbWUgZGlkIG5vdCB3b3JrIGluIHY3KSwgYnV0IGVuZHMgdXAgbm90Cj4gPiA+Pj4+ICAgIGJl
aW5nIHByZXR0eSBhdCBhbGwsIHdpbGwgd2FpdCBmb3IgY29tbWVudHMgZnJvbSBhcm02NCByZXZp
ZXdlcnMsIGJ1dAo+ID4gPj4+PiAgICB0aGlzIHBhdGNoIGNhbiBlYXNpbHkgYmUgZHJvcHBlZCBp
ZiB0aGV5IGRvIG5vdCB3YW50IGl0Lgo+ID4gPj4+Pgo+ID4gPj4+PiB2NzoKPiA+ID4+Pj4gLSBG
aXggQW51cCBidWcgcmVwb3J0IGJ5IGludHJvZHVjaW5nIG1lbWJsb2NrX2lzb2xhdGVfbWVtb3J5
IHdoaWNoCj4gPiA+Pj4+ICAgIGFsbG93cyB1cyB0byBzcGxpdCB0aGUgbWVtYmxvY2sgbWFwcGlu
Z3MgYW5kIHRoZW4gYXZvaWQgdG8gbWFwIHRoZQo+ID4gPj4+PiAgICB0aGUgUFVEIHdoaWNoIGNv
bnRhaW5zIHRoZSBrZXJuZWwgYXMgcmVhZCBvbmx5Cj4gPiA+Pj4+IC0gQWRkIGEgcGF0Y2ggdG8g
YXJtNjQgdG8gdXNlIHRoaXMgbmV3bHkgaW50cm9kdWNlZCBBUEkKPiA+ID4+Pj4KPiA+ID4+Pj4g
djY6Cj4gPiA+Pj4+IC0gcXVpZXQgTExWTSB3YXJuaW5nIGJ5IGNhc3RpbmcgcGh5c19yYW1fYmFz
ZSBpbnRvIGFuIHVuc2lnbmVkIGxvbmcKPiA+ID4+Pj4KPiA+ID4+Pj4gdjU6Cj4gPiA+Pj4+IC0g
Rml4IG5vbW11IGJ1aWxkcyBieSBnZXR0aW5nIHJpZCBvZiByaXNjdl9wZm5fYmFzZSBpbiBwYXRj
aCAxLCB0aGFua3MKPiA+ID4+Pj4gICAgQ29ub3IKPiA+ID4+Pj4gLSBBZGQgUkIgZnJvbSBBbmRy
ZXcKPiA+ID4+Pj4KPiA+ID4+Pj4gdjQ6Cj4gPiA+Pj4+IC0gUmViYXNlIG9uIHRvcCBvZiB2Ni4y
LXJjMywgYXMgbm90ZWQgYnkgQ29ub3IKPiA+ID4+Pj4gLSBBZGQgQWNrZWQtYnkgUm9iCj4gPiA+
Pj4+Cj4gPiA+Pj4+IHYzOgo+ID4gPj4+PiAtIENoYW5nZSB0aGUgY29tbWVudCBhYm91dCBpbml0
cmRfc3RhcnQgVkEgY29udmVyc2lvbiBzbyB0aGF0IGl0IGZpdHMKPiA+ID4+Pj4gICAgQVJNNjQg
YW5kIFJJU0NWNjQgKGFuZCBvdGhlcnMgaW4gdGhlIGZ1dHVyZSBpZiBuZWVkZWQpLCBhcyBzdWdn
ZXN0ZWQKPiA+ID4+Pj4gICAgYnkgUm9iCj4gPiA+Pj4+Cj4gPiA+Pj4+IHYyOgo+ID4gPj4+PiAt
IEFkZCBhIGNvbW1lbnQgb24gd2h5IFJJU0NWNjQgZG9lcyBub3QgbmVlZCB0byBzZXQgaW5pdHJk
X3N0YXJ0L2VuZCB0aGF0Cj4gPiA+Pj4+ICAgIGVhcmx5IGluIHRoZSBib290IHByb2Nlc3MsIGFz
IGFza2VkIGJ5IFJvYgo+ID4gPj4+Pgo+ID4gPj4+PiBBbGV4YW5kcmUgR2hpdGkgKDQpOgo+ID4g
Pj4+PiAgICByaXNjdjogR2V0IHJpZCBvZiByaXNjdl9wZm5fYmFzZSB2YXJpYWJsZQo+ID4gPj4+
PiAgICBtbTogSW50cm9kdWNlIG1lbWJsb2NrX2lzb2xhdGVfbWVtb3J5Cj4gPiA+Pj4+ICAgIGFy
bTY0OiBNYWtlIHVzZSBvZiBtZW1ibG9ja19pc29sYXRlX21lbW9yeSBmb3IgdGhlIGxpbmVhciBt
YXBwaW5nCj4gPiA+Pj4+ICAgIHJpc2N2OiBVc2UgUFVEL1A0RC9QR0QgcGFnZXMgZm9yIHRoZSBs
aW5lYXIgbWFwcGluZwo+ID4gPj4+IEtlcm5lbCBib290IGZpbmUgb24gUlY2NCBidXQgdGhlcmUg
aXMgYSBmYWlsdXJlIHdoaWNoIGlzIHN0aWxsIG5vdAo+ID4gPj4+IGFkZHJlc3NlZC4gWW91IGNh
biBzZWUgdGhpcyBmYWlsdXJlIGFzIGZvbGxvd2luZyBtZXNzYWdlIGluCj4gPiA+Pj4ga2VybmVs
IGJvb3QgbG9nOgo+ID4gPj4+ICAgICAgMC4wMDAwMDBdIEZhaWxlZCB0byBhZGQgYSBTeXN0ZW0g
UkFNIHJlc291cmNlIGF0IDgwMjAwMDAwCj4gPiA+PiBIbW1tIEkgZG9uJ3QgZ2V0IHRoYXQgaW4g
YW55IG9mIG15IHRlc3QgY29uZmlncywgd291bGQgeW91IG1pbmQKPiA+ID4+IHNoYXJpbmcgeW91
cnMgYW5kIHlvdXIgcWVtdSBjb21tYW5kIGxpbmU/Cj4gPiA+IFRyeSBhbGV4Z2hpdGlfdGVzdCBi
cmFuY2ggYXQKPiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0ZWwvbGludXguZ2l0Cj4gPiA+
Cj4gPiA+IEkgYW0gYnVpbGRpbmcgdGhlIGtlcm5lbCB1c2luZyBkZWZjb25maWcgYW5kIG15IHJv
b3RmcyBpcwo+ID4gPiBiYXNlZCBvbiBidXN5Ym94Lgo+ID4gPgo+ID4gPiBNeSBRRU1VIGNvbW1h
bmQgaXM6Cj4gPiA+IHFlbXUtc3lzdGVtLXJpc2N2NjQgLU0gdmlydCAtbSA1MTJNIC1ub2dyYXBo
aWMgLWJpb3MKPiA+ID4gb3BlbnNiaS9idWlsZC9wbGF0Zm9ybS9nZW5lcmljL2Zpcm13YXJlL2Z3
X2R5bmFtaWMuYmluIC1rZXJuZWwKPiA+ID4gLi9idWlsZC1yaXNjdjY0L2FyY2gvcmlzY3YvYm9v
dC9JbWFnZSAtYXBwZW5kICJyb290PS9kZXYvcmFtIHJ3Cj4gPiA+IGNvbnNvbGU9dHR5UzAgZWFy
bHljb24iIC1pbml0cmQgLi9yb290ZnNfcmlzY3Y2NC5pbWcgLXNtcCA0Cj4gPgo+ID4KPiA+IFNv
IHNwbGl0dGluZyBtZW1ibG9jay5tZW1vcnkgaXMgdGhlIGN1bHByaXQsIGl0ICJjb25mdXNlcyIg
dGhlIHJlc291cmNlcwo+ID4gYWRkaXRpb24gYW5kIEkgY2FuIG9ubHkgZmluZCBoYWNreSB3YXlz
IHRvIGZpeCB0aGF0Li4uCj4gSGkgQWxleGFuZHJlLAo+Cj4gV2UgZW5jb3VudGVyZWQgdGhlIHNh
bWUgZXJyb3IgYXMgQW51cC4gQWZ0ZXIgYWRkaW5nIHlvdXIgcGF0Y2gKPiAoMzMzNTA2OGY4NzIx
N2VhNTlkMDhmNDYyMTg3ZGM4NTY2NTJlZWExNSksIHdlIHdpbGwgbm90IGVuY291bnRlciB0aGUK
PiBlcnJvciBhZ2Fpbi4KPgo+IFdoYXQgSSBoYXZlIG9ic2VydmVkIHNvIGZhciBpcwo+Cj4gLSBi
ZWZvcmUgeW91ciBwYXRjaAo+IFdoZW4gbWVyZ2luZyBjb25zZWN1dGl2ZSBtZW1ibG9ja3MsIGlm
IHRoZSBtZW1ibG9jayB0eXBlcyBhcmUgZGlmZmVyZW50LAo+IHRoZXkgd2lsbCBiZSBtZXJnZWQg
aW50byByZXNlcnZlZAo+IC0gYWZ0ZXIgeW91ciBwYXRjaAo+IFdoZW4gY29uc2VjdXRpdmUgbWVt
YmxvY2tzIGFyZSBtZXJnZWQsIGlmIHRoZSBtZW1ibG9jayB0eXBlcyBhcmUKPiBkaWZmZXJlbnQs
IHRoZXkgd2lsbCBiZSBtZXJnZWQgaW50byBtZW1vcnkuCj4KPiBTdWNoIGEgcmVzdWx0IHdpbGwg
Y2F1c2UgdGhlIG1lbW9yeSBsb2NhdGlvbiBvZiBPcGVuU0JJIHRvIGJlIGNoYW5nZWQKPiBmcm9t
IHJlc2VydmVkIHRvIG1lbW9yeS4gV2lsbCB0aGlzIGhhdmUgYW55IHNpZGUgZWZmZWN0cz8KCkkg
Z3Vlc3MgaXQgd2lsbCBlbmQgdXAgaW4gdGhlIG1lbW9yeSBwb29sIGFuZCBwYWdlcyBmcm9tIG9w
ZW5TQkkKcmVnaW9uIHdpbGwgYmUgYWxsb2NhdGVkLCBzbyB3ZSBzaG91bGQgc2VlIHZlcnkgcXVp
Y2tseSBiYWQgc3R1ZmYKaGFwcGVuaW5nIChlaXRoZXIgUE1QIHZpb2xhdGlvbiBvciBNLW1vZGUg
ZWNhbGwgbmV2ZXIKcmV0dXJuaW5nL3RyYXBwaW5nL2V0YykuCgpCdXQgSSBkb24ndCBvYnNlcnZl
IHRoZSBzYW1lIHRoaW5nLCBJIGFsd2F5cyBzZWUgdGhlIG9wZW5TQkkgcmVnaW9uCmJlaW5nIHJl
c2VydmVkOgoKcmVzZXJ2ZWRbMHgwXSBbMHgwMDAwMDAwMDgwMDAwMDAwLTB4MDAwMDAwMDA4MDA3
ZmZmZl0sCjB4MDAwMDAwMDAwMDA4MDAwMCBieXRlcyBmbGFnczogMHgwCgpDYW4geW91IGVsYWJv
cmF0ZSBhIGJpdCBtb3JlIGFib3V0ICJXaGVuIGNvbnNlY3V0aXZlIG1lbWJsb2NrcyBhcmUKbWVy
Z2VkLCBpZiB0aGUgbWVtYmxvY2sgdHlwZXMgYXJlIGRpZmZlcmVudCwgdGhleSB3aWxsIGJlIG1l
cmdlZCBpbnRvCm1lbW9yeSI/IFdoZXJlL3doZW4gZG9lcyB0aGlzIG1lcmdlIGhhcHBlbj8gQ2Fu
IHlvdSBnaXZlIG1lIGEgY29uZmlnCmZpbGUgYW5kIGEga2VybmVsIHJldmlzaW9uIHNvIHRoYXQg
SSBjYW4gdGFrZSBhIGxvb2s/CgpUaGFua3MsCgpBbGV4Cgo+ID4KPiA+IFNvIGdpdmVuIHRoYXQg
dGhlIGFybTY0IHBhdGNoIHdpdGggdGhlIG5ldyBBUEkgaXMgbm90IHByZXR0eSBhbmQgdGhhdAo+
ID4gdGhlIHNpbXBsZXN0IHNvbHV0aW9uIGlzIHRvIHJlLW1lcmdlIHRoZSBtZW1ibG9jayByZWdp
b25zIGFmdGVyd2FyZHMKPiA+ICh3aGljaCBpcyBkb25lIGJ5IG1lbWJsb2NrX2NsZWFyX25vbWFw
KSwgSSdsbCBkcm9wIHRoZSBuZXcgQVBJIGFuZCB0aGUKPiA+IGFybTY0IHBhdGNoIHRvIHVzZSB0
aGUgbm9tYXAgQVBJIGxpa2UgYXJtNjQ6IEknbGwgdGFrZSBhZHZhbnRhZ2Ugb2YgdGhhdAo+ID4g
dG8gY2xlYW4gc2V0dXBfdm1fZmluYWwgd2hpY2ggSSBoYXZlIHdhbnRlZCB0byBkbyBmb3IgYSBs
b25nIHRpbWUuCj4gPgo+ID4gQE1pa2UgVGhhbmtzIGZvciB5b3UgcmV2aWV3cyEKPiA+Cj4gPiBA
QW51cCBUaGFua3MgZm9yIGFsbCB5b3VyIGJ1ZyByZXBvcnRzIG9uIHRoaXMgcGF0Y2hzZXQsIEkg
aGF2ZSB0bwo+ID4gaW1wcm92ZSBteSB0ZXN0IGZsb3cgKGl0IGlzIGluIHRoZSB3b3JrIDopKS4K
PiA+Cj4gPgo+ID4gPiBSZWdhcmRzLAo+ID4gPiBBbnVwCj4gPiA+Cj4gPiA+PiBUaGFua3MKPiA+
ID4+Cj4gPiA+Pj4gUmVnYXJkcywKPiA+ID4+PiBBbnVwCj4gPiA+Pj4KPiA+ID4+Pj4gICBhcmNo
L2FybTY0L21tL21tdS5jICAgICAgICAgICB8IDI1ICsrKysrKysrKysrLS0tLS0tCj4gPiA+Pj4+
ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmggfCAxOSArKysrKysrKysrKy0tCj4gPiA+
Pj4+ICAgYXJjaC9yaXNjdi9tbS9pbml0LmMgICAgICAgICAgfCA1MyArKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLQo+ID4gPj4+PiAgIGFyY2gvcmlzY3YvbW0vcGh5c2FkZHIuYyAg
ICAgIHwgMTYgKysrKysrKysrKysKPiA+ID4+Pj4gICBkcml2ZXJzL29mL2ZkdC5jICAgICAgICAg
ICAgICB8IDExICsrKystLS0tCj4gPiA+Pj4+ICAgaW5jbHVkZS9saW51eC9tZW1ibG9jay5oICAg
ICAgfCAgMSArCj4gPiA+Pj4+ICAgbW0vbWVtYmxvY2suYyAgICAgICAgICAgICAgICAgfCAyMCAr
KysrKysrKysrKysrCj4gPiA+Pj4+ICAgNyBmaWxlcyBjaGFuZ2VkLCAxMTkgaW5zZXJ0aW9ucygr
KSwgMjYgZGVsZXRpb25zKC0pCj4gPiA+Pj4+Cj4gPiA+Pj4+IC0tCj4gPiA+Pj4+IDIuMzcuMgo+
ID4gPj4+Pgo+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+ID4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+ID4gbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+ID4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4gbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
