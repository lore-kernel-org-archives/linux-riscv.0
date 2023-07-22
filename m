Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0B5C001DC
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 00:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPttOdI6+9mWVtRGwrjXcNYR6zOhKoRNLO2QlP4gqC8=; b=gvRmMga1TB1Myl
	goDcyMBnHFXaW0IErmgrdtCa7OxkbT59q0z7mxfpTx34I7F8zfAjT2cXZdOeqsAu2JRgf2B3z1DYz
	+aAKA57U41E4stMty6uSF68e07SThQThnndHbW2YGh0e9G96mBFVz5AkAaQmrffb8fzRpyqQ5CARR
	1CPFiTlk+wifPwiqKepkBclb8Z7bqOqEbh4cgZHK1ZSXYeTS2ixsRWBK5qltjMrolCKGcj5Qmi9o2
	2QxMKNQOrgP6i93QPMuaddFJnJ6H8LnJbUNSQ/WLPHIq87KgM0ooGXqy0Tiu8shYMOqHCsfZP/xOx
	zZ6YoXKTk3/+05eiv7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN0d2-00FSRw-1N;
	Sat, 22 Jul 2023 00:37:48 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN0cz-00FSQO-06
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 00:37:47 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-40550136e54so136501cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 17:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689986262; x=1690591062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gj3Xl7dsvl9L6KFIj63HJhmaeXyRYFaIHbakrb1Ec4I=;
        b=MAdJRMJYGacsbrazrEuC0rQIeU8QNFQUnJUCPgK7a1vzUNIj82x/4RiX3EPgCAVJv+
         vjDvb5O/dVdRr8MjaYyeLQg7RNJx5mp+B0hz5ymmByPWoPUwC282oofovzofBXW4lOgo
         uDPcDd3ofQhJYWARPXrTAICAs+ZZ75L7XDKUp34xegAxO54nxkG3DD/j1+HS5w3acRR0
         2hKfahZSEDpdXscDRJARFhBCX6IVCFk+ORU7D45GfxMEWXwEwOyTHIDBkfpEdDUfweXI
         ZKFKuO/VLBeM83b2EJkOtpn3jk8ZfPHtjtO2qHeaVp1h/KkAmh89HkmVdmMDwtBOJ0ON
         zzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689986262; x=1690591062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gj3Xl7dsvl9L6KFIj63HJhmaeXyRYFaIHbakrb1Ec4I=;
        b=PAw+IbWcf7IUgnDAd3h8BkFqfLgzGXY8d+IMJa6ZrwJno/+XrM+RTngj+WgErhcMFw
         0+AT8er/0cOjluaMn7MuD4NV/sYBzq51v79pK8wM43Tq0v/OUclsOhmwODi4PoPe8jGf
         JUFxecv0S1GWKHJIrhcL6Ovdg0q64eHwd+jkVW0aSIbXsuJgnDAy+9jGAzJiGDjjMYpT
         hVWGydjZQ0dMFaVuueslr0JU32Ndb4gx8I/tNg+Mpiu64t6oq8MTmOKXWGVWKSvZORBt
         oyVllzuqPyk2lOBCsWEIFwmf6M2WZp1PbPITtKKuZqZLf3m91IBmZdGkGTSe3Lmk9SzE
         duXg==
X-Gm-Message-State: ABy/qLZ9UUnQ59o0QNTzTb7Qgi5ptUDszGdZjfd7VQOFdizzGZPn6ZJm
	95eoMsXvnjomiHpGyWLmLkS1QgND3yj/+BMAzB3XJg==
X-Google-Smtp-Source: APBJJlG6UeFhKQqQQEY9+tUoce4sdevzyvGzeohxg9thFoKM20vYXi0/+fsLHV/dolkPCJEyE+UJo35jN4HgsafYSAQ=
X-Received: by 2002:ac8:5d49:0:b0:3f4:f0fd:fe7e with SMTP id
 g9-20020ac85d49000000b003f4f0fdfe7emr56472qtx.3.1689986262548; Fri, 21 Jul
 2023 17:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230625-radish-comic-b0861fb96023@spud> <mhng-c2d55859-cf3b-48ac-bf38-9aa1344fc93c@palmer-ri-x1c9a>
In-Reply-To: <mhng-c2d55859-cf3b-48ac-bf38-9aa1344fc93c@palmer-ri-x1c9a>
From: Fangrui Song <maskray@google.com>
Date: Fri, 21 Jul 2023 17:37:31 -0700
Message-ID: <CAFP8O3+41QFVyNTVJ2iZYkB0tqnvdLTAoGShgGy-qPP1PHjBEw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor@kernel.org>, jszhang@kernel.org, ndesaulniers@google.com, 
	bjorn@kernel.org, llvm@lists.linux.dev, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_173745_087705_0B5317DF 
X-CRM114-Status: GOOD (  43.10  )
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

T24gU3VuLCBKdW4gMjUsIDIwMjMgYXQgMTowNuKAr1BNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
ZGFiYmVsdC5jb20+IHdyb3RlOgo+Cj4gT24gU3VuLCAyNSBKdW4gMjAyMyAwNTo0MzoxMyBQRFQg
KC0wNzAwKSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gT24gU3VuLCBKdW4gMjUsIDIwMjMgYXQg
MDg6MjQ6NTZQTSArMDgwMCwgSmlzaGVuZyBaaGFuZyB3cm90ZToKPiA+PiBPbiBGcmksIEp1biAy
MywgMjAyMyBhdCAxMDoxNzo1NEFNIC0wNzAwLCBOaWNrIERlc2F1bG5pZXJzIHdyb3RlOgo+ID4+
ID4gT24gVGh1LCBKdW4gMjIsIDIwMjMgYXQgMTE6MTg6MDNQTSArMDAwMCwgTmF0aGFuIENoYW5j
ZWxsb3Igd3JvdGU6Cj4gPj4gPiA+IElmIHlvdSB3YW50ZWQgdG8gcmVzdHJpY3QgaXQgdG8ganVz
dCBMRF9JU19CRkQgaW4gYXJjaC9yaXNjdi9LY29uZmlnLAo+ID4+ID4gPiB0aGF0IHdvdWxkIGJl
IGZpbmUgd2l0aCBtZSB0b28uCj4gPj4gPiA+Cj4gPj4gPiA+ICAgc2VsZWN0IEhBVkVfTERfREVB
RF9DT0RFX0RBVEFfRUxJTUlOQVRJT04gaWYgTERfSVNfQkZECj4gPj4gPgo+ID4+ID4gSGkgSmlz
aGVuZywgd291bGQgeW91IG1pbmQgc2VuZGluZyBhIHYzIHdpdGggdGhlIGF0dGFjaGVkIHBhdGNo
IGFwcGxpZWQKPiA+PiA+IG9uIHRvcCAvIGF0IHRoZSBlbmQgb2YgeW91ciBzZXJpZXM/Cj4gPj4K
PiA+PiBIaSBOaWNrLCBOYXRoYW4sIFBhbG1lciwKPiA+Pgo+ID4+IEkgc2F3IHRoZSBzZXJpZXMg
aGFzIGJlZW4gYXBwbGllZCB0byByaXNjdi1uZXh0LCBzbyBJJ20gbm90IHN1cmUgd2hpY2gKPiA+
PiBzb2x1dGlvbiB3b3VsZCBpdCBiZSwgUGFsbWVyIHRvIGFwcGx5IE5pY2sncyBwYXRjaCB0byBy
aXNjdi1uZXh0IG9yCj4gPj4gSSB0byBzZW5kIG91dCB2MywgYW55IHN1Z2dlc3Rpb24gaXMgYXBw
cmVjaWF0ZWQuCj4gPgo+ID4gSSBkb24ndCBzZWUgd2hhdCB5b3UgYXJlIHNlZWluZyB3LyByaXNj
di9mb3ItbmV4dC4gSEVBRCBpcyBjdXJyZW50bHkgYXQKPiA+IDQ2ODFkYWNhZGVlZiAoInJpc2N2
OiByZXBsYWNlIGRlcHJlY2F0ZWQgc2NhbGwgd2l0aCBlY2FsbCIpIGFuZCB0aGVyZQo+ID4gYXJl
IG5vIHBhdGNoZXMgZnJvbSB5b3VyIHNlcmllcyBpbiB0aGUgYnJhbmNoOgo+ID4gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0L2xv
Zy8/aD1mb3ItbmV4dAo+Cj4gSXQncyBiZWVuIGluIGFuZCBvdXQgb2Ygc3RhZ2luZyBhIGZldyB0
aW1lcyBhcyB3ZSB0cmFja2VkIGRvd24gdGhlCj4gcGVyZm9ybWFuY2UgcmVncmVzc2lvbiwgYnV0
IGl0IHNob3VsZG4ndCBoYXZlIGV2ZXIgbWFkZSBpdCB0byBsaW51eC1uZXh0Cj4gZm9yIHJlYWwu
Cj4KPiBJJ20gZmluZSBqdXN0IHBpY2tpbmcgdXAgdGhlIHBhdGNoIHRvIGRpc2FibGUgRENFLCBJ
J3ZlIGdvdCBhIGZldyBvdGhlcgo+IChob3BlZnVsbHkgc21hbGwpIHRoaW5ncyB0byB3b3JrIHRo
cm91Z2ggZmlyc3QgdGhvdWdoLgoKTm90ZTogZm9yIEdDQywgLWZwYXRjaGFibGUtZnVuY3Rpb24t
ZW50cnk9ICh1c2VkIGJ5CmFyY2gvcmlzY3YvS2NvbmZpZykgcmVxdWlyZSBHQ0MgMTMgZm9yIGNv
cnJlY3QgZ2FyYmFnZSBjb2xsZWN0aW9uCnNlbWFudGljcy4KaHR0cHM6Ly9nY2MuZ251Lm9yZy9i
dWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9MTEwNzI5Cgo+ID4gQ2hlZXJzLAo+ID4gQ29ub3IuCj4g
Pgo+ID4+ID4gPiBOaWNrIHNhaWQgaGUgd291bGQgd29yayBvbiBhIHJlcG9ydCBmb3IgdGhlIExM
Vk0gc2lkZSwgc28gYXMgbG9uZyBhcwo+ID4+ID4gPiB0aGlzIGlzc3VlIGlzIGhhbmRsZWQgaW4g
c29tZSB3YXkgdG8gYXZvaWQgcmVncmVzc2luZyBMTEQgYnVpbGRzIHVudGlsCj4gPj4gPiA+IGl0
IGlzIHJlc29sdmVkLCBJIGRvbid0IHRoaW5rIHRoZXJlIGlzIGFueXRoaW5nIGVsc2UgZm9yIHRo
ZSBrZXJuZWwgdG8KPiA+PiA+ID4gZG8uIFdlIGxpa2UgdG8gaGF2ZSBicmVhZGNydW1icyB2aWEg
aXNzdWUgbGlua3MsIG5vdCBzdXJlIGlmIHRoZSByZXBvcnQKPiA+PiA+ID4gd2lsbCBiZSBpbnRl
cm5hbCB0byBHb29nbGUgb3Igb24gTExWTSdzIGlzc3VlIHRyYWNrZXIgdGhvdWdoOwo+ID4+ID4g
PiByZWdhcmRsZXNzLCB3ZSB3aWxsIGhhdmUgdG8gdG91Y2ggdGhpcyBibG9jayB0byBhZGQgYSB2
ZXJzaW9uIGNoZWNrCj4gPj4gPiA+IGxhdGVyLCBhdCB3aGljaCBwb2ludCB3ZSBjYW4gYWRkIGEg
bGluayB0byB0aGUgZml4IGluIExMRC4KPiA+PiA+Cj4gPj4gPiBodHRwczovL2dpdGh1Yi5jb20v
Q2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy8xODgxCj4gPj4KPiA+PiA+IEZyb20gM2U1ZTAx
MDk1OGVlNDFiOWZiNDA4Y2ZhZGU4ZmIwMTdjMmZlNzE2OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKPiA+PiA+IEZyb206IE5pY2sgRGVzYXVsbmllcnMgPG5kZXNhdWxuaWVyc0Bnb29nbGUuY29t
Pgo+ID4+ID4gRGF0ZTogRnJpLCAyMyBKdW4gMjAyMyAxMDowNjoxNyAtMDcwMAo+ID4+ID4gU3Vi
amVjdDogW1BBVENIXSByaXNjdjogZGlzYWJsZSBIQVZFX0xEX0RFQURfQ09ERV9EQVRBX0VMSU1J
TkFUSU9OIGZvciBMTEQKPiA+PiA+Cj4gPj4gPiBMaW5raW5nIGFsbHllc2NvbmZpZyB3aXRoIGxk
LmxsZC0xNyB3aXRoIENPTkZJR19ERUFEX0NPREVfRUxJTUlOQVRJT049eQo+ID4+ID4gdGFrZXMg
aG91cnMuICBBc3N1bWluZyB0aGlzIGlzIGEgcGVyZm9ybWFuY2UgcmVncmVzc2lvbiB0aGF0IGNh
biBiZQo+ID4+ID4gZml4ZWQsIHRlbnRhdGl2ZWx5IGRpc2FibGUgdGhpcyBmb3Igbm93IHNvIHRo
YXQgYWxseWVzY29uZmlnIGJ1aWxkcwo+ID4+ID4gZG9uJ3Qgc3RhcnQgdGltaW5nIG91dC4gIElm
IGFuZCB3aGVuIHRoZXJlJ3MgYSBmaXggdG8gbGQubGxkLCB0aGlzIGNhbgo+ID4+ID4gYmUgY29u
dmVydGVkIHRvIGEgdmVyc2lvbiBjaGVjayBpbnN0ZWFkIHNvIHRoYXQgdXNlcnMgb2Ygb2xkZXIg
YnV0IHN0aWxsCj4gPj4gPiBzdXBwb3J0ZWQgdmVyc2lvbnMgb2YgbGQubGxkIGRvbid0IGh1cnQg
dGhlbXNlbHZlcyBieSBlbmFibGluZwo+ID4+ID4gQ09ORklHX0xEX0RFQURfQ09ERV9EQVRBX0VM
SU1JTkFUSU9OPXkuCj4gPj4gPgo+ID4+ID4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0NsYW5n
QnVpbHRMaW51eC9saW51eC9pc3N1ZXMvMTg4MQo+ID4+ID4gUmVwb3J0ZWQtYnk6IFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+Cj4gPj4gPiBTdWdnZXN0ZWQtYnk6IE5hdGhhbiBD
aGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4KPiA+PiA+IFNpZ25lZC1vZmYtYnk6IE5pY2sg
RGVzYXVsbmllcnMgPG5kZXNhdWxuaWVyc0Bnb29nbGUuY29tPgo+ID4+ID4gLS0tCj4gPj4gPiBI
aSBKaXNoZW5nLCB3b3VsZCB5b3UgbWluZCBzZW5kaW5nIGEgdjMgd2l0aCB0aGlzIHBhdGNoIG9u
IHRvcC9hdCB0aGUKPiA+PiA+IGVuZCBvZiB5b3VyIHBhdGNoIHNlcmllcz8KPiA+PiA+Cj4gPj4g
PiAgYXJjaC9yaXNjdi9LY29uZmlnIHwgMyArKy0KPiA+PiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPj4gPgo+ID4+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4+ID4gaW5kZXggOGVmZmU1
YmI3Nzg4Li4wNTczOTkxZTliNzggMTAwNjQ0Cj4gPj4gPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25m
aWcKPiA+PiA+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4+ID4gQEAgLTExNiw3ICsxMTYs
OCBAQCBjb25maWcgUklTQ1YKPiA+PiA+ICAgIHNlbGVjdCBIQVZFX0tQUk9CRVMgaWYgIVhJUF9L
RVJORUwKPiA+PiA+ICAgIHNlbGVjdCBIQVZFX0tQUk9CRVNfT05fRlRSQUNFIGlmICFYSVBfS0VS
TkVMCj4gPj4gPiAgICBzZWxlY3QgSEFWRV9LUkVUUFJPQkVTIGlmICFYSVBfS0VSTkVMCj4gPj4g
PiAtICBzZWxlY3QgSEFWRV9MRF9ERUFEX0NPREVfREFUQV9FTElNSU5BVElPTgo+ID4+ID4gKyAg
IyBodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy8xODgxCj4g
Pj4gPiArICBzZWxlY3QgSEFWRV9MRF9ERUFEX0NPREVfREFUQV9FTElNSU5BVElPTiBpZiAhTERf
SVNfTExECj4gPj4gPiAgICBzZWxlY3QgSEFWRV9NT1ZFX1BNRAo+ID4+ID4gICAgc2VsZWN0IEhB
VkVfTU9WRV9QVUQKPiA+PiA+ICAgIHNlbGVjdCBIQVZFX1BDSQo+ID4+ID4gLS0KPiA+PiA+IDIu
NDEuMC4xNjIuZ2ZhZmRkYjBhZjktZ29vZwo+ID4+ID4KPiA+Pgo+CgoKLS0gCuWui+aWueedvwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
