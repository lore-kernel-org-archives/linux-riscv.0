Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED41AC4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 18:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RXIYhq3NoXDYTtGu+CaN6UJtk76OM6NoPBQvozGdJfw=; b=0Si8XQF68ng9Fd
	HjeYBBb6oOexL2TeclyjYYQK/pEQjFhtxSUZCulns1VPGRwdml71iJYc4wkUadzNAJIHnnLigaO3C
	U7PfilV+3dzr+PJpMpeAy5Cyy9MTTgBygkqnGITRtqf6B7d531gMF7QL6a6hZLWvqvSqws8jajFWn
	OVcUWzdBl08R6VsnVmUL6vURJ6zqWMP/mV/im7GWNFPuexgX2xuOcN4U42QYFehuKd1D2SVsr2XRD
	ML4ICYeirI4aYCH5HLgk33RM5q23mI1gnNzAeqfFz/sNAoyk9fYRmHQt3fQnf5aAwChjl56dNodb3
	Ebm/WYZ8Nyus9oZTrI9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOMZ7-003dsG-3B;
	Fri, 12 Jan 2024 18:47:37 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOMZ5-003drT-0N
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 18:47:36 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50ed808db11so4094204e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 10:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705085251; x=1705690051; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8+usNc1e4bLAb/I2ZKw26MyVGl5zZe9MPSVtU7WkJ8=;
        b=Ih7GAqA10Heryp5mddFw2zKWDgp6UrkvSGRIFIM/XSJvcBJWop1fHSphDtk+fGK77Z
         KZS/3/tOQ0JIRf+C/pd7WIvCp58sA0cy8RhkZAy4nXlVm/r2TbsNAx6lwOPSTiMdudjp
         tE1vAa/2N7Rv2ZBlJ3HLq8LEb+uEs6nBcyKJLRlbF0rQocS6SE8M/yyFZC71p8XgplYP
         xcjcwqxh3BgJtZ8Prn2yRyL1WLetZiMCdrdeiXA4COZr0bTbivBi+SHJR87rXudX44h5
         MieKRhuNWijoBK+sF0/rHiDh09johsdeRHOqZj6rYpxAKtQnLaGiNJdxNroCouK/0Yk/
         9Duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705085251; x=1705690051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8+usNc1e4bLAb/I2ZKw26MyVGl5zZe9MPSVtU7WkJ8=;
        b=XV11mBCkdPNeRxwXQ3S20Ex6f7FKt7kH+V5GRDNld1QuHkxl2OLqAOaRT9QKqMNYLC
         TQDZtIbVx9fRpb1KNZDgutp+vxQ67EXDfcD80ybNBXbktJi/1Xar1SyevKgtQS8m6LW+
         0XGWaAMQ9p3zJcarD9zRR+63y5FGiUQOBH1iJLrs3Bu6Jr0mYpfu0Sbch5NuP9bFcFsB
         WRaCWJV8Dl1TB1YHQYynCpoGwBlQf0n2JoV62zjmUyr3Pdnw0QotLVu8psTFGhVFG3rB
         ypd7MTYmvehpn1gvDWN9NE2R0s830wzOcjjpRPiCrzneVonRSC/V9ncJOWq7Yt8GDo0q
         jF0Q==
X-Gm-Message-State: AOJu0YwpSV71Y2CqtFom/kBRQzQXQDYz9CBFQ+K+iNFh/laThj6EswUP
	f2FC8MRgmKQKZKWjGHZYurOEX/VGq0nQUFReXaSNhIatYqn8Ig==
X-Google-Smtp-Source: AGHT+IGFH1aprWsz1j/fdpZXpw0duT+0xsQqjy/6tk5/HmfH+33eOd9uVAtWVrpm4b/C/RsbNdNlUXeI7BtQX6nCbLI=
X-Received: by 2002:ac2:4241:0:b0:50e:902d:b48 with SMTP id
 m1-20020ac24241000000b0050e902d0b48mr817681lfl.64.1705085251142; Fri, 12 Jan
 2024 10:47:31 -0800 (PST)
MIME-Version: 1.0
References: <CABgGipXYeE4J3226yoAU9J25eeP+vWofqL1mMYoD9axthJrk2Q@mail.gmail.com>
 <mhng-275a5587-68ad-4ad6-9fd9-e973e78d9b22@palmer-ri-x1c9>
In-Reply-To: <mhng-275a5587-68ad-4ad6-9fd9-e973e78d9b22@palmer-ri-x1c9>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Sat, 13 Jan 2024 02:47:19 +0800
Message-ID: <CABgGipVuT_+M42_rteCb9OOjUToJxz2JGJQYCYqcjRGY3mMAdw@mail.gmail.com>
Subject: Re: [v10, 00/10] riscv: support kernel-mode Vector
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: bjorn@kernel.org, linux-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, 
	guoren@linux.alibaba.com, charlie@rivosinc.com, 
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, peterz@infradead.org, 
	tglx@linutronix.de, ebiggers@kernel.org, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_104735_156379_5EB7FFA5 
X-CRM114-Status: GOOD (  32.01  )
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

SGkgUGFsbWVyLAoKT24gU2F0LCBKYW4gMTMsIDIwMjQgYXQgMjozNeKAr0FNIFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCAxMiBKYW4gMjAyNCAw
ODowMzoyNCBQU1QgKC0wODAwKSwgYW5keS5jaGl1QHNpZml2ZS5jb20gd3JvdGU6Cj4gPiBPbiBG
cmksIEphbiAxMiwgMjAyNCBhdCAxMToyOeKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5l
bC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gQW5keSwKPiA+Pgo+ID4+ID4gSGVsbG86Cj4gPj4gPgo+
ID4+ID4gVGhpcyBzZXJpZXMgd2FzIGFwcGxpZWQgdG8gcmlzY3YvbGludXguZ2l0IChmb3ItbmV4
dCkKPiA+PiA+IGJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKPiA+PiA+
Cj4gPj4KPiA+PiBJJ20gZ2V0dGluZyBzb21lIGJvb3QgaXNzdWVzIHdpdGggdGhpcyBzZXJpZXMg
YXBwbGllZCB0byByaXNjdi9mb3ItbmV4dC4KPiA+Pgo+ID4+IFRoZSBmdWxsIHJ1bnMgKHdpdGgg
bG9ncykgaXMgaGVyZToKPiA+PiBodHRwczovL2dpdGh1Yi5jb20vbGludXgtcmlzY3YvbGludXgt
cmlzY3YvYWN0aW9ucy9ydW5zLzc0OTg3MDYzMjYKPiA+Pgo+ID4+IFR5cGljYWxseSBpdCBmYWls
cyBpbiB0d28gd2F5czoKPiA+PiBVYnVudHUgcm9vdGZzOgo+ID4+IC0tODwtLQo+ID4+IFsgNC4z
NDY0MTRdIChzZC1nZW5zKVs2OF06IEZhaWxlZCB0byBleHRyYWN0IGZpbGUgbmFtZSBmcm9tICcn
OiBJbnZhbGlkIGFyZ3VtZW50Cj4gPj4gWyA0LjM5MDgzMl0gc3lzdGVtZFsxXTogRmFpbGVkIHRv
IGZvcmsgb2ZmIHNhbmRib3hpbmcgZW52aXJvbm1lbnQgZm9yIGV4ZWN1dGluZyBnZW5lcmF0b3Jz
OiBQcm90b2NvbCBlcnJvcgo+ID4+IFtFU0NbMDsxOzMxbSEhISEhIUVTQ1swbV0gRmFpbGVkIHRv
IHN0YXJ0IHVwIG1hbmFnZXIuCj4gPj4gWyA0LjQ0MDE2NF0gc3lzdGVtZFsxXTogRnJlZXppbmcg
ZXhlY3V0aW9uLgo+ID4+IC0tODwtLQo+ID4+Cj4gPj4gb3I6Cj4gPj4gLS04PC0tCj4gPj4gWyAg
IDE0LjkwOTkxMl0gKHNkLWdlbnMpWzcxXTogQXNzZXJ0aW9uICchc3Rydl9pc2VtcHR5KGRpcnMp
JyBmYWlsZWQgYXQgc3JjL3NoYXJlZC9leGVjLXV0aWwuYzoyMTEsIGZ1bmN0aW9uIGV4ZWN1dGVf
ZGlyZWN0b3JpZXMoKS4gQWJvcnRpbmcuCj4gPj4gWyAgIDE1LjAwODQ4MF0gc3lzdGVtZFsxXTog
RmFpbGVkIHRvIGZvcmsgb2ZmIHNhbmRib3hpbmcgZW52aXJvbm1lbnQgZm9yIGV4ZWN1dGluZyBn
ZW5lcmF0b3JzOiBQcm90b2NvbCBlcnJvcgo+ID4+IFtFU0NbMDsxOzMxbSEhISEhIUVTQ1swbV0g
RmFpbGVkIHRvIHN0YXJ0IHVwIG1hbmFnZXIuCj4gPj4gWyAgIDE1LjExMTk4OV0gc3lzdGVtZFsx
XTogRnJlZXppbmcgZXhlY3V0aW9uLgo+ID4+IC0tODwtLQo+ID4+Cj4gPj4gYW5kIEFscGluZSB3
aXRoOgo+ID4+IC0tODwtLQo+ID4+IFsgMC4wMzY3MDNdIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5j
aW5nOiBrbWVtX2NhY2hlX2NyZWF0ZV91c2VyY29weTogRmFpbGVkIHRvIGNyZWF0ZSBzbGFiICdy
aXNjdl92ZWN0b3JfY3R4Jy4gRXJyb3IgLTIyCj4gPj4gWyAwLjAzOTE5NV0gQ1BVOiAwIFBJRDog
MCBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQgNi43LjAtcmMxLWRlZmNvbmZpZ19wbGFpbi1n
ZGY5NDQ3MDQxODJlICMxCj4gPj4gWyAwLjA0MDc0NF0gSGFyZHdhcmUgbmFtZTogcmlzY3Ytdmly
dGlvLHFlbXUgKERUKQo+ID4+IFsgMC4wNDE5NzVdIENhbGwgVHJhY2U6Cj4gPj4gWyAwLjA0Mjgx
M10gWzxmZmZmZmZmZjgwMDA2N2E0Pl0gZHVtcF9iYWNrdHJhY2UrMHgxYy8weDI0Cj4gPj4gWyAw
LjA0NDgzMl0gWzxmZmZmZmZmZjgwOTQ1OTgwPl0gc2hvd19zdGFjaysweDJjLzB4MzgKPiA+PiBb
IDAuMDQ1NzI0XSBbPGZmZmZmZmZmODA5NTIyMTQ+XSBkdW1wX3N0YWNrX2x2bCsweDNjLzB4NTQK
PiA+PiBbIDAuMDQ2ODQxXSBbPGZmZmZmZmZmODA5NTIyNDA+XSBkdW1wX3N0YWNrKzB4MTQvMHgx
Ywo+ID4+IFsgMC4wNDc0MjhdIFs8ZmZmZmZmZmY4MDk0NWU3Yz5dIHBhbmljKzB4MTA2LzB4Mjll
Cj4gPj4gWyAwLjA0Nzk5OF0gWzxmZmZmZmZmZjgwMTVmMTRjPl0ga21lbV9jYWNoZV9jcmVhdGVf
dXNlcmNvcHkrMHgyMGUvMHgyNTgKPiA+PiBbIDAuMDQ4Nzg2XSBbPGZmZmZmZmZmODBhMDQ0ZGM+
XSByaXNjdl92X3NldHVwX2N0eF9jYWNoZSsweDJjLzB4M2MKPiA+PiBbIDAuMDQ5NTIxXSBbPGZm
ZmZmZmZmODBhMDNhNDg+XSBhcmNoX3Rhc2tfY2FjaGVfaW5pdCsweDEwLzB4MTgKPiA+PiBbIDAu
MDU3ODMyXSBbPGZmZmZmZmZmODBhMDcwNmM+XSBmb3JrX2luaXQrMHg0Mi8weDE2OAo+ID4+IFsg
MC4wNTg3MzddIFs8ZmZmZmZmZmY4MGEwMGQ3MD5dIHN0YXJ0X2tlcm5lbCsweDZiYS8weDczYQo+
ID4+IC0tODwtLQo+ID4+Cj4gPj4gVGhlIEFscGluZSBib290IGNhbiBiZSBmaXhlZCB3aXRoIHNv
bWV0aGluZyBsaWtlOgo+ID4+IC0tODwtLQo+ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC92ZWN0b3IuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCj4gPj4gaW5kZXggZjk3
Njk3MDNmZDM5Li4wYWM3OWE5Y2RiYTUgMTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvdmVjdG9yLmMKPiA+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+ID4+IEBA
IC01Myw2ICs1Myw5IEBAIGludCByaXNjdl92X3NldHVwX3ZzaXplKHZvaWQpCj4gPj4KPiA+PiAg
dm9pZCBfX2luaXQgcmlzY3Zfdl9zZXR1cF9jdHhfY2FjaGUodm9pZCkKPiA+PiAgewo+ID4+ICsg
ICAgICAgaWYgKCFyaXNjdl92X3ZzaXplKQo+ID4+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4g
Pj4gKwo+ID4+ICAgICAgICAgcmlzY3Zfdl91c2VyX2NhY2hlcCA9IGttZW1fY2FjaGVfY3JlYXRl
X3VzZXJjb3B5KCJyaXNjdl92ZWN0b3JfY3R4IiwKPiA+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByaXNjdl92X3ZzaXplLCAxNiwgU0xB
Ql9QQU5JQywKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAwLCByaXNjdl92X3ZzaXplLCBOVUxMKTsKPiA+PiAtLTg8LS0KPiA+Cj4g
PiBTb3JyeSBmb3IgdGhhdCEgSSBmb3Jnb3QgdG8gZG8gYSBoYXNfdmVjdG9yKCkgY2hlY2sgYmVm
b3JlIGNyZWF0aW5nCj4gPiB0aGUgY2FjaGUuIEkgYW0gZ29pbmcgdG8gc2VuZCBhIHBhdGNoIHRv
IGZpeCBpdC4KPgo+IFRoZXkgZG9uJ3QgZmFpbCBmb3IgbWUgZWl0aGVyLCB3aGljaCBpcyBob3cg
dGhleSBlbmRlZCB1cCBvbiBmb3ItbmV4dC4KPiBTbyBzb3JyeSBJIG1pc3NlZCBpdC4KPgo+IERv
IHlvdSBoYXZlIGEgZml4PyAgT3RoZXJ3aXNlIEkgY2FuIGp1c3QgZHJvcCB0aGVzZSBmcm9tIGZv
ci1uZXh0IGFuZCB3ZQo+IGNhbiBkbyBhIHYxMSAtLSBpdCdzIHRoZSB0aXAgb2YgZm9yLW5leHQs
IHNvIHN0aWxsIHByZXR0eSBlYXN5IHRhIGJhY2sKPiBvdXQuCgpJIGRvbid0IGhhdmUgdGhlIGZ1
bGwgZml4IGZvciBub3csIHNvIEkgdGhpbmsgd2Ugc2hvdWxkIGRyb3AgdG8KcHJldmVudCBibG9j
a2luZyBvdGhlcnMnIHdvcmtmbG93LgoKPgo+ID4KPiA+Pgo+ID4+IGJ1dCB3aXRoIHRoaXMgImZp
eCIgaW4gcGxhY2UgSSBzdGlsbCBnZXQgVWJ1bnR1IGJvb3QgZmFpbHVyZXMuIFRvCj4gPj4gcmVw
cm9kdWNlIHRoZSBDSSBsb2NhbGx5Ogo+ID4+Cj4gPj4gICB8IGdpdCBmZXRjaCBodHRwczovL2dp
dGh1Yi5jb20vbGludXgtcmlzY3YvbGludXgtcmlzY3YgZTJhYWQ3NWIzNDBkNjViMGJlNGQxYTY4
OWRiM2UxMGM2ZWQzZjE4ZQo+ID4+ICAgfCBnaXQgY2hlY2tvdXQgRkVUQ0hfSEVBRAo+ID4+ICAg
fCBkb2NrZXIgcHVsbCBnaGNyLmlvL2xpbnV4LXJpc2N2L3B3LWJ1aWxkZXItbXVsdGk6bGF0ZXN0
Cj4gPj4gICB8IGRvY2tlciBydW4gLWl0IC0tdm9sdW1lICRQV0Q6L2J1aWxkL215LWxpbnV4IGdo
Y3IuaW8vbGludXgtcmlzY3YvcHctYnVpbGRlci1tdWx0aTpsYXRlc3QgYmFzaAo+ID4+ICAgfCAj
IEluIGNvbnRhaW5lcgo+ID4+ICAgfCBiYXNoIC1sCj4gPj4gICB8IG1rZGlyIC1wIC9idWlsZC9r
ZXJuZWxzL2xvZ3MKPiA+PiAgIHwgLmdpdGh1Yi9zY3JpcHRzL3Nlcmllcy9wcmVwYXJlX3Rlc3Rz
LnNoCj4gPj4gICB8IGNkIC9idWlsZC9teS1saW51eAo+ID4+ICAgfCAuZ2l0aHViL3NjcmlwdHMv
c2VyaWVzL2tlcm5lbF9idWlsZGVyLnNoIHJ2NjQgZGVmY29uZmlnIHBsYWluIGdjYwo+ID4+ICAg
fCAuZ2l0aHViL3NjcmlwdHMvc2VyaWVzL3Rlc3RfcnVubmVyLnNoIHJ2NjQgZGVmY29uZmlnIHBs
YWluIGdjYyB1YnVudHUKPiA+PiAgIHwgLmdpdGh1Yi9zY3JpcHRzL3Nlcmllcy90ZXN0X3J1bm5l
ci5zaCBydjY0IGRlZmNvbmZpZyBwbGFpbiBnY2MgYWxwaW5lCj4gPgo+ID4gSXQncyB3ZWlyZCB0
aGF0IHRoZXNlIGVycm9ycyBkbyBub3Qgc2hvdyB1cCBpbiBteSB0ZXN0IGVudmlyb25tZW50LiBJ
Cj4gPiB3aWxsIHRyeSB0byByZXByb2R1Y2UgaXQgd2l0aCB0aGUgc2NyaXB0IGFib3ZlLgo+ID4K
PiA+Pgo+ID4+IExvZ3MgaW4gL2J1aWxkL3Rlc3RzL3J1bl90ZXN0Kgo+ID4+Cj4gPj4gSSdsbCBj
b250aW51ZSB0byBkZWJ1ZyBpbiB0aGUgbWVhbnRpbWUuCj4gPj4KPiA+Pgo+ID4+IEJqw7Zybgo+
ID4KPiA+IFRoYW5rcywKPiA+IEFuZHkKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiBs
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpTb3JyeSBmb3IgdGhhdCEKClRoYW5r
cywKQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
