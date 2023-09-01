Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D686CA0FE8
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 10:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qAQelWLIwDBScNOUo2glvr7LoHF3PH3gGkU4JDMM7xk=; b=muMgvO1gyo0WSV
	MJoGopVEz+yXg6UuJEqAsuStDM24voPXK0Xy9Bhq1me/opVb+KaiK1IbrXx3V1JQOjXSlKw+kbZd4
	+KGP0+vwPqZwi0E+A03r10fOZFdW3+dF3oG9yZdeRoPcIWOyQAp6ppVwXBgyjN9AkIWlzzQFWG20f
	JrEq0QbSWXqSYBzGVNLMxMhJZOMJF+byuhPNw4uz3i/QmyEUMBhfGxWV708Bo0W4hT78uAeErjyjG
	WJb0pcHv+PTWKtRFlHLEB3D3iVMEnCFrnSx24ABtdFr3offSWQZm28FRlwNIhBKhFV4MHm8LHsFoz
	g5dN3EwDE5r/LSv2piHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc0yi-00GneP-2B;
	Fri, 01 Sep 2023 10:02:12 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc0yf-00GndP-1H
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 10:02:11 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-401d67434daso18314125e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 03:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1693562525; x=1694167325; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/HkOQzxeW8BnxrMWfNqofeHJy0DGs2aFW803SrTcs8=;
        b=Pg+aAUe0xqWvvlh+TkOkDXnMPLANR1b6DZAhOWFIj5nFeDksiwalIO+rPL9KkYegmH
         epLHBse8z325uFkU17+0R6+u5VA9Vz37qgVHMERQBNMx6lxmUyeIAUOYoroASZvaKfS+
         lgsWlc6wuu45bChA/86iylLOCxCnHxpZdIE1G+fS8aBG486qMikMvPFIAhaShBZ2R2sP
         PpPAhqvNlBCamcBCjPqEzZ6ET9CO0Dp+GfJu6D84eHzxMkbUqDtRhW9NHfJ9GGfGXktj
         rzOvmsLlq9tGmLZLrojtkr9flQKgKxLRDeOUVvrxujAACzWanT/twIrW1CNNSanv0DZt
         mHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693562525; x=1694167325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/HkOQzxeW8BnxrMWfNqofeHJy0DGs2aFW803SrTcs8=;
        b=iprVnNVkr79fgroD6ReWephRDTQqn2c3hrGgrU+86p2EhoNcBWV3OhipY8VTPINNTQ
         ZUxevqUFczTDfonrfr38ZAOGDQ2pQJKAdNbGIm+t49lkAk8RaSC8O4LUXfpJQ49Jnr3S
         vLeiRWYUt66H45VlvnTz9CG4qATlfbLfPs0Y/G0VWJuoq1AsXn/Zbh7NazCAgnWClzmU
         itOS5g0QvJigz3IoS+3lNtaJuMnCtVAsLB62o7EslDzKd+LeJXll4UpOyjQDA/bUFl3B
         k09Sup21DoDZL8tJjPPyGv6FWbkqt5j2dLbSDh/gdmdkEqLPy8ZbmFhswLMNRZvNhXts
         SbxQ==
X-Gm-Message-State: AOJu0YycBGjlZIqX7oSMZAfFNZjHUWoRUUWNHMW+++i7h9V8kpozy3DZ
	L/Aa6ENF4ku5xbHEu3NMmWKoikCbauYRKZDM/Q7n7A==
X-Google-Smtp-Source: AGHT+IGsAzrvsl7U2rv8ejAeCZUTjaHvPimEYWXEpjBR6u8BUJ+R0dDTG7MmG5JN/zBo7osd6rWEMUjBElWIKFhRlJU=
X-Received: by 2002:adf:e7cc:0:b0:31a:dc2e:2db2 with SMTP id
 e12-20020adfe7cc000000b0031adc2e2db2mr1566044wrn.49.1693562524822; Fri, 01
 Sep 2023 03:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230818121504.60492-1-cuiyunhui@bytedance.com>
 <878ra8o4qa.fsf@all.your.base.are.belong.to.us> <CAEEQ3wmL90oOZcmpv8G34u7kg44zGscpHJiiRHLi=_LAm=C1jg@mail.gmail.com>
 <87msy6p8k3.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87msy6p8k3.fsf@all.your.base.are.belong.to.us>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 1 Sep 2023 18:01:53 +0800
Message-ID: <CAEEQ3wk-n0B0UmJ_fpw1kKn5TT+Nohxarv3QbmCbAUUrK8K8Gw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4] riscv: add userland instruction dump to
 RISC-V splats
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	guoren@kernel.org, bjorn@rivosinc.com, conor.dooley@microchip.com, 
	jszhang@kernel.org, andy.chiu@sifive.com, dave.hansen@linux.intel.com, 
	elver@google.com, glider@google.com, cyphar@cyphar.com, 
	kirill.shutemov@linux.intel.com, keescook@chromium.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_030209_772121_340C6030 
X-CRM114-Status: GOOD (  23.43  )
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

SGkgQmrDtnJuLAoKT24gRnJpLCBTZXAgMSwgMjAyMyBhdCA1OjA24oCvUE0gQmrDtnJuIFTDtnBl
bCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiB5dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0
ZWRhbmNlLmNvbT4gd3JpdGVzOgo+Cj4gPiBIaSBCasO2cm7vvIwKPiA+Cj4gPiBPbiBGcmksIEF1
ZyAxOCwgMjAyMyBhdCA5OjMz4oCvUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPj4KPiA+PiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3Jp
dGVzOgo+ID4+Cj4gPj4gPiBBZGQgdXNlcmxhbmQgaW5zdHJ1Y3Rpb24gZHVtcCBhbmQgcmVuYW1l
IGR1bXBfa2VybmVsX2luc3RyKCkKPiA+PiA+IHRvIGR1bXBfaW5zdHIoKS4KPiA+PiA+Cj4gPj4g
PiBBbiBleGFtcGxlOgo+ID4+ID4gWyAgICAwLjgyMjQzOV0gRnJlZWluZyB1bnVzZWQga2VybmVs
IGltYWdlIChpbml0bWVtKSBtZW1vcnk6IDY5MTZLCj4gPj4gPiBbICAgIDAuODIzODE3XSBSdW4g
L2luaXQgYXMgaW5pdCBwcm9jZXNzCj4gPj4gPiBbICAgIDAuODM5NDExXSBpbml0WzFdOiB1bmhh
bmRsZWQgc2lnbmFsIDQgY29kZSAweDEgYXQgMHgwMDAwMDAwMDAwMDViZTE4IGluIGJiWzEwMDAw
KzVmYjAwMF0KPiA+PiA+IFsgICAgMC44NDA3NTFdIENQVTogMCBQSUQ6IDEgQ29tbTogaW5pdCBO
b3QgdGFpbnRlZCA1LjE0LjAtcmM0LTAwMDQ5LWdiZDY0NDI5MGFhNzItZGlydHkgIzE4Nwo+ID4+
ID4gWyAgICAwLjg0MTM3M10gSGFyZHdhcmUgbmFtZTogICwgQklPUwo+ID4+ID4gWyAgICAwLjg0
MTc0M10gZXBjIDogMDAwMDAwMDAwMDA1YmUxOCByYSA6IDAwMDAwMDAwMDAwNzllNzQgc3AgOiAw
MDAwMDAzZmZmY2FmZGEwCj4gPj4gPiBbICAgIDAuODQyMjcxXSAgZ3AgOiBmZmZmZmZmZjgxNmU5
ZGM4IHRwIDogMDAwMDAwMDAwMDAwMDAwMCB0MCA6IDAwMDAwMDAwMDAwMDAwMDAKPiA+PiA+IFsg
ICAgMC44NDI5NDddICB0MSA6IDAwMDAwMDNmZmZjOWZkZjAgdDIgOiAwMDAwMDAwMDAwMDAwMDAw
IHMwIDogMDAwMDAwMDAwMDAwMDAwMAo+ID4+ID4gWyAgICAwLjg0MzQzNF0gIHMxIDogMDAwMDAw
MDAwMDAwMDAwMCBhMCA6IDAwMDAwMDNmZmZjYTAxOTAgYTEgOiAwMDAwMDAzZmZmY2FmZTE4Cj4g
Pj4gPiBbICAgIDAuODQzODkxXSAgYTIgOiAwMDAwMDAwMDAwMDAwMDAwIGEzIDogMDAwMDAwMDAw
MDAwMDAwMCBhNCA6IDAwMDAwMDAwMDAwMDAwMDAKPiA+PiA+IFsgICAgMC44NDQzNTddICBhNSA6
IDAwMDAwMDAwMDAwMDAwMDAgYTYgOiAwMDAwMDAwMDAwMDAwMDAwIGE3IDogMDAwMDAwMDAwMDAw
MDAwMAo+ID4+ID4gWyAgICAwLjg0NDgwM10gIHMyIDogMDAwMDAwMDAwMDAwMDAwMCBzMyA6IDAw
MDAwMDAwMDAwMDAwMDAgczQgOiAwMDAwMDAwMDAwMDAwMDAwCj4gPj4gPiBbICAgIDAuODQ1MjUz
XSAgczUgOiAwMDAwMDAwMDAwMDAwMDAwIHM2IDogMDAwMDAwMDAwMDAwMDAwMCBzNyA6IDAwMDAw
MDAwMDAwMDAwMDAKPiA+PiA+IFsgICAgMC44NDU3MjJdICBzOCA6IDAwMDAwMDAwMDAwMDAwMDAg
czkgOiAwMDAwMDAwMDAwMDAwMDAwIHMxMDogMDAwMDAwMDAwMDAwMDAwMAo+ID4+ID4gWyAgICAw
Ljg0NjE4MF0gIHMxMTogMDAwMDAwMDAwMGQxNDRlMCB0MyA6IDAwMDAwMDAwMDAwMDAwMDAgdDQg
OiAwMDAwMDAwMDAwMDAwMDAwCj4gPj4gPiBbICAgIDAuODQ2NjE2XSAgdDUgOiAwMDAwMDAwMDAw
MDAwMDAwIHQ2IDogMDAwMDAwMDAwMDAwMDAwMAo+ID4+ID4gWyAgICAwLjg0NzIwNF0gc3RhdHVz
OiAwMDAwMDAwMjAwMDAwMDIwIGJhZGFkZHI6IDAwMDAwMDAwZjAwMjgwNTMgY2F1c2U6IDAwMDAw
MDAwMDAwMDAwMDIKPiA+PiA+IFsgICAgMC44NDgyMTldIENvZGU6IGYwNmYgZmY1ZiAzODIzIGZh
MTEgMDExMyBmYjAxIDJlMjMgMDIwMSAwMjkzIDAwMDAgKDgwNTMpIGYwMDIKPiA+PiA+IFsgICAg
MC44NTEwMTZdIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBBdHRlbXB0ZWQgdG8ga2lsbCBp
bml0ISBleGl0Y29kZT0weDAwMDAwMDA0Cj4gPj4gPgo+ID4+ID4gU2lnbmVkLW9mZi1ieTogWXVu
aHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gPj4KPiA+PiBOaWNlIQo+ID4+Cj4g
Pj4gUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiA+Cj4g
PiBXaGVuIGNhbiB0aGlzIHBhdGNoIGJlIGFwcGxpZWQgdG8gdGhlIGxpbnV4LW5leHQgYnJhbmNo
Pwo+Cj4gSXQgbG9va3MgbGlrZSB5b3UncmUgZ2V0dGluZyBhIHNwYXJzZSB3YXJuaW5nIG9uIHRo
ZSBwYXRjaCBbMV0sIGFuZAo+IHRoYXQncyBwcm9iYWJseSB3aHkgaXQgaGFzbid0IGJlZW4gY29u
c2lkZXJlZC4gWW91IG5lZWQgc29tZXRoaW5nIGxpa2U6Cj4KPiAtLQo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+IGlu
ZGV4IDY5YjVkMThiNWFlOS4uYzUzNjQxMzFiOGJkIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gQEAgLTM0
LDcgKzM0LDcgQEAgaW50IHNob3dfdW5oYW5kbGVkX3NpZ25hbHMgPSAxOwo+ICBzdGF0aWMgREVG
SU5FX1NQSU5MT0NLKGRpZV9sb2NrKTsKPgo+ICAjZGVmaW5lIGdldF91c2VyX25vZmF1bHQodmFs
LCBwdHIpICh7ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gLSAgICAgICBjb25zdCB0eXBl
b2YodmFsKSAqX19na19wdHIgPSAocHRyKTsgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAg
IGNvbnN0IHR5cGVvZih2YWwpIF9fdXNlciAqX19na19wdHIgPSAoX19mb3JjZSBjb25zdCB0eXBl
b2YodmFsKSBfX3VzZXIgKikocHRyKTsgXAo+ICAgICAgICAgY29weV9mcm9tX3VzZXJfbm9mYXVs
dCgmKHZhbCksIF9fZ2tfcHRyLCBzaXplb2YodmFsKSk7XAo+ICB9KQo+IC0tCj4KPiBJREssIG1h
eWJlIGl0IHdvcnRoIHJlbW92aW5nIHRoZSBkZWZpbmUgYWxsIHRvZ2V0aGVyLCBhbmQganVzdCBv
cGVuIGNvZGUKPiBpdC4KPgo+IFdoZW4geW91J3JlIHN1Ym1pdHRpbmcgcGF0Y2hlcywgaXQncyBh
IGdvb2QgdGhpbmcgdG8gdHJhY2sgcGF0Y2h3b3JrIGZvcgo+IHdhcm5pbmdzL2Vycm9ycy4KPgo+
Cj4gQmrDtnJuCj4KPiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xp
bnV4LXJpc2N2L3BhdGNoLzIwMjMwODE4MTIxNTA0LjYwNDkyLTEtY3VpeXVuaHVpQGJ5dGVkYW5j
ZS5jb20vCgpPa2F5LCBJIG1pZ2h0IGFzIHdlbGwgcmVtb3ZlIHRoZSBtYWNybywgYWZ0ZXIgYWxs
LCB0aGUgZGVmaW5pdGlvbiBpcyBvbmx5IGhlcmUuCkknbGwgdXBkYXRlIGl0IHY1IGxpa2U6Citz
dGF0aWMgaW50IGNvcHlfY29kZShzdHJ1Y3QgcHRfcmVncyAqcmVncywgdTE2ICp2YWwsIGNvbnN0
IHUxNiAqaW5zbnMpCit7CisgICAgICAgaWYgKCF1c2VyX21vZGUocmVncykpCisgICAgICAgICAg
ICAgICByZXR1cm4gZ2V0X2tlcm5lbF9ub2ZhdWx0KCp2YWwsIGluc25zKTsKKworICAgICAgIC8q
IFRoZSB1c2VyIHNwYWNlIGNvZGUgZnJvbSBvdGhlciB0YXNrcyBjYW5ub3QgYmUgYWNjZXNzZWQu
ICovCisgICAgICAgaWYgKHJlZ3MgIT0gdGFza19wdF9yZWdzKGN1cnJlbnQpKQorICAgICAgICAg
ICAgICAgcmV0dXJuIC1FUEVSTTsKKworICAgICAgIHJldHVybiBjb3B5X2Zyb21fdXNlcl9ub2Zh
dWx0KHZhbCwgaW5zbnMsIHNpemVvZigqdmFsKSk7Cit9CgpUaGFua3MsCll1bmh1aQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
