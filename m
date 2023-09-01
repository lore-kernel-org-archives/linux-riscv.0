Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B8BCA0FF8
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 19:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXEgw3954S1QSkKnKWpPJuii6ilISz+vtOLzXtOmymA=; b=beEPZ01mvp9KhO
	vkcHLWBN7Fp/GMCAL0/vxuo4g5if+zP9wT8zTDQrMn7QByLXB3ZcQDn1XMeQEvLO518RwWB8f2tyT
	Y5XmIkeS+SRf2/5xDNWAFp0HbVaQ3Y34I8Kp5AR4JmLMLvLmvagKcwE/kSWNBleEg/0DSR1pEILPg
	0XSUonc3v9+JIgP9X/wZ6APfig3T8KJQ/0U4D+r5F9noipZhrvjdXCUoPPHBYVV/d94dvePu9NYnq
	71+XCtGkL5s3jAKkgGWlYseZISXfgJ9ql8mYS1Vvw+MTpiFTfpc/XkVgheRKYRqXTl/3Uz/5Nejr1
	SI2HPBK35NqhszG09YQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcAA8-000KwZ-2o;
	Fri, 01 Sep 2023 19:50:36 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcAA5-000KvA-1V
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 19:50:35 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bf3a2f4528so19498545ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 12:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693597831; x=1694202631; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TnGlOgpcJfhSyX3oWtweduRxRFI+vcvjVBEfz8W6REE=;
        b=kAfJhIU7Z0kMFLPzqnleHU+2nD0JRJWDzV8LQ+5su8TxrAl8+xpA4CM6SJCVrOTSGS
         RwdUNfagFjmIhKcxBN01QHjzXK8k30sYmK1PylsobaDwGCV7mzIu/9Umtg225V6jlwFZ
         oD6ExlgQjZPSq34q3NGqQxEdnNeO564i3XPl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693597831; x=1694202631;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TnGlOgpcJfhSyX3oWtweduRxRFI+vcvjVBEfz8W6REE=;
        b=cQykqeyOfQ95RvYohhwss4+v6RRBz4lyCUlFe3+kR4QkLfWDd5SjLyLeBVh3wDpNev
         5kwQ9/cafKmhOFrBtoVZXyQpIgTGLUVP4rPJHoIo139aheG2PCnJHQxX0WCNQXkvmBoo
         G+ZmbpN3cf16RutpvwNtnsoUWJkDke9Cj31/rFPN4rvArfdRwGMD3SVpPfHikGivh8Rr
         gAcXLqKiyDfZQCBK6WF/jSp+UQrataqLxgpwzjBui/KLVyDtKMvAxy/zkQnuWHllUi+q
         kEAAahbmQH+tO0O5jYYvs5Aet08eZ3DF/ZeeG677yD2tC1++mN46ouJmLgFR+PZ5UCcB
         A/yw==
X-Gm-Message-State: AOJu0Yz72AWf3Nl2e8/whD90OG4FSQZHLXWAjdmyQMDGNFFR1roEej/x
	i285paAbyXhv/e8iL0VfhEjOeQ==
X-Google-Smtp-Source: AGHT+IFLMLtB06xgjItzzUv50zhsXFZ37ehwBfgJSIF2V6heU41cis1M/xhTkDTyzQL7J2okpu7MHw==
X-Received: by 2002:a17:902:f682:b0:1c0:b7f4:5b86 with SMTP id l2-20020a170902f68200b001c0b7f45b86mr3871500plg.65.1693597830846;
        Fri, 01 Sep 2023 12:50:30 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d10-20020a170902654a00b001b8b2b95068sm3397478pln.204.2023.09.01.12.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 12:50:30 -0700 (PDT)
Date: Fri, 1 Sep 2023 12:50:29 -0700
From: Kees Cook <keescook@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3] kbuild: Show marked Kconfig fragments in "help"
Message-ID: <202309011250.AB0DAA03@keescook>
References: <20230831191335.give.534-kees@kernel.org>
 <CAK7LNATENQQy6LrWS10S-EXsyAvTraSj2WA=O7rFsS9Ht6a+3g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK7LNATENQQy6LrWS10S-EXsyAvTraSj2WA=O7rFsS9Ht6a+3g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_125033_571046_36F6E920 
X-CRM114-Status: GOOD (  24.48  )
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

T24gRnJpLCBTZXAgMDEsIDIwMjMgYXQgMDQ6NTg6MzdQTSArMDkwMCwgTWFzYWhpcm8gWWFtYWRh
IHdyb3RlOgo+IE9uIEZyaSwgU2VwIDEsIDIwMjMgYXQgNDoxM+KAr0FNIEtlZXMgQ29vayA8a2Vl
c2Nvb2tAY2hyb21pdW0ub3JnPiB3cm90ZToKPiA+Cj4gPiBDdXJyZW50bHkgdGhlIEtjb25maWcg
ZnJhZ21lbnRzIGluIGtlcm5lbC9jb25maWdzIGFuZCBhcmNoLyovY29uZmlncwo+ID4gdGhhdCBh
cmVuJ3QgdXNlZCBpbnRlcm5hbGx5IGFyZW4ndCBkaXNjb3ZlcmFibGUgdGhyb3VnaCAibWFrZSBo
ZWxwIiwKPiA+IHdoaWNoIGNvbnNpc3RzIG9mIGhhcmQtY29kZWQgbGlzdHMgb2YgY29uZmlnIGZy
YWdtZW50cy4gSW5zdGVhZCwgbGlzdAo+ID4gYWxsIHRoZSBmcmFnbWVudCB0YXJnZXRzIHRoYXQg
aGF2ZSBhICIjIEhlbHA6ICIgY29tbWVudCBwcmVmaXggc28gdGhlCj4gPiB0YXJnZXRzIGNhbiBi
ZSBnZW5lcmF0ZWQgZHluYW1pY2FsbHkuCj4gPgo+ID4gQWRkIGxvZ2ljIHRvIHRoZSBNYWtlZmls
ZSB0byBzZWFyY2ggZm9yIGFuZCBkaXNwbGF5IHRoZSBmcmFnbWVudCBhbmQKPiA+IGNvbW1lbnQu
IEFkZCBjb21tZW50cyB0byBmcmFnbWVudHMgdGhhdCBhcmUgaW50ZW5kZWQgdG8gYmUgZGlyZWN0
IHRhcmdldHMuCj4gPgo+ID4gQ2M6IE5pY29sYXMgU2NoaWVyIDxuaWNvbGFzQGZqYXNsZS5ldT4K
PiA+IENjOiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+Cj4gPiBDYzogQ2hy
aXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pgo+ID4gQ2M6IFJhbmR5
IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+ID4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmcKPiA+IENjOiB4ODZAa2VybmVsLm9yZwo+ID4gQ2M6IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gQ2M6IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMu
b3JnCj4gPiBDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gQ2M6IGxpbnV4
LXMzOTBAdmdlci5rZXJuZWwub3JnCj4gPiBDYzogbGludXgta2J1aWxkQHZnZXIua2VybmVsLm9y
Zwo+ID4gQ2M6IGxpbnV4LWhhcmRlbmluZ0B2Z2VyLmtlcm5lbC5vcmcKPiA+IFNpZ25lZC1vZmYt
Ynk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgo+ID4gQ28tZGV2ZWxvcGVkLWJ5
OiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiB2MzoK
PiA+IC0gVXNlIE1ha2VmaWxlIGxvZ2ljIGZyb20gTWFzYWhpcm8gWWFtYWRhCj4gPiAtIFVzZSAi
IyBIZWxwOiAiIHByZWZpeCwgYnV0IG9ubHkgb24gZGVzaXJlZCBmcmFnbWVudCB0YXJnZXRzCj4g
PiB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwODI1MTk0MzI5Lmdvbm5hLjkx
MS1rZWVzQGtlcm5lbC5vcmcKPiA+IHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
MzA4MjQyMjM2MDYubmV2ZXIuNzYyLWtlZXNAa2VybmVsLm9yZwo+ID4gLS0tCj4gPiAgTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgLQo+ID4gIGFyY2gvYXJt
L2NvbmZpZ3MvZHJhbV8weDAwMDAwMDAwLmNvbmZpZyAgICB8ICAxICsKPiA+ICBhcmNoL2FybS9j
b25maWdzL2RyYW1fMHhjMDAwMDAwMC5jb25maWcgICAgfCAgMSArCj4gPiAgYXJjaC9hcm0vY29u
Zmlncy9kcmFtXzB4ZDAwMDAwMDAuY29uZmlnICAgIHwgIDEgKwo+ID4gIGFyY2gvYXJtL2NvbmZp
Z3MvbHBhZS5jb25maWcgICAgICAgICAgICAgICB8ICAxICsKPiA+ICBhcmNoL2FybTY0L2NvbmZp
Z3MvdmlydC5jb25maWcgICAgICAgICAgICAgfCAgMSArCj4gPiAgYXJjaC9wb3dlcnBjL2NvbmZp
Z3MvZGlzYWJsZS13ZXJyb3IuY29uZmlnIHwgIDEgKwo+ID4gIGFyY2gvcG93ZXJwYy9jb25maWdz
L3NlY3VyaXR5LmNvbmZpZyAgICAgICB8ICA0ICsrKy0KPiA+ICBhcmNoL3Jpc2N2L2NvbmZpZ3Mv
MzItYml0LmNvbmZpZyAgICAgICAgICAgfCAgMSArCj4gPiAgYXJjaC9yaXNjdi9jb25maWdzLzY0
LWJpdC5jb25maWcgICAgICAgICAgIHwgIDEgKwo+ID4gIGFyY2gvczM5MC9jb25maWdzL2J0Zi5j
b25maWcgICAgICAgICAgICAgICB8ICAxICsKPiA+ICBhcmNoL3MzOTAvY29uZmlncy9rYXNhbi5j
b25maWcgICAgICAgICAgICAgfCAgMSArCj4gPiAgYXJjaC94ODYvTWFrZWZpbGUgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDQgLS0tLQo+ID4gIGtlcm5lbC9jb25maWdzL2RlYnVnLmNvbmZp
ZyAgICAgICAgICAgICAgICB8ICAyICsrCj4gPiAga2VybmVsL2NvbmZpZ3Mva3ZtX2d1ZXN0LmNv
bmZpZyAgICAgICAgICAgIHwgIDEgKwo+ID4gIGtlcm5lbC9jb25maWdzL25vcG0uY29uZmlnICAg
ICAgICAgICAgICAgICB8ICAyICsrCj4gPiAga2VybmVsL2NvbmZpZ3MvcnVzdC5jb25maWcgICAg
ICAgICAgICAgICAgIHwgIDEgKwo+ID4gIGtlcm5lbC9jb25maWdzL3RpbnkuY29uZmlnICAgICAg
ICAgICAgICAgICB8ICAyICsrCj4gPiAga2VybmVsL2NvbmZpZ3MveDg2X2RlYnVnLmNvbmZpZyAg
ICAgICAgICAgIHwgIDEgKwo+ID4gIGtlcm5lbC9jb25maWdzL3hlbi5jb25maWcgICAgICAgICAg
ICAgICAgICB8ICAyICsrCj4gPiAgc2NyaXB0cy9rY29uZmlnL01ha2VmaWxlICAgICAgICAgICAg
ICAgICAgIHwgMTUgKysrKysrKysrKysrLS0tCj4gPiAgMjEgZmlsZXMgY2hhbmdlZCwgMzYgaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiA+Cj4gCj4gCj4gSnVzdCBvbmUgdGhpbmcuCj4g
Cj4gCj4gCj4gCj4gCj4gPiBkaWZmIC0tZ2l0IGEva2VybmVsL2NvbmZpZ3MvdGlueS5jb25maWcg
Yi9rZXJuZWwvY29uZmlncy90aW55LmNvbmZpZwo+ID4gaW5kZXggMDAwMDlmN2QwODM1Li42MGE0
YjZkODBiMzYgMTAwNjQ0Cj4gPiAtLS0gYS9rZXJuZWwvY29uZmlncy90aW55LmNvbmZpZwo+ID4g
KysrIGIva2VybmVsL2NvbmZpZ3MvdGlueS5jb25maWcKPiA+IEBAIC0xLDMgKzEsNSBAQAo+ID4g
KyMgSGVscDogU2l6ZS1vcHRpbWl6ZWQga2VybmVsIGltYWdlCj4gCj4gCj4gSSB3aWxsIGRyb3Ag
dGhpcy4KPiAKPiAKPiBXZSBhbHJlYWR5IGhhdmUgYSBoYXJkLWNvZGVkIGhlbHAgbWVzc2FnZS4K
PiAKPiAgIHRpbnljb25maWcgICAtIENvbmZpZ3VyZSB0aGUgdGluaWVzdCBwb3NzaWJsZSBrZXJu
ZWwKPiAKPiAKPiAKPiAKPiBUaGVuLCBzb21lIGxpbmVzIGJlbG93LCBhZ2Fpbi4KPiAKPiAgIHRp
bnkuY29uZmlnICAgICAgICAgICAgICAgLSBTaXplLW9wdGltaXplZCBrZXJuZWwgaW1hZ2UKPiAK
PiAKPiAKPiB0aW55LmNvbmZpZyBpcyBmb3IgaW50ZXJuYWwgdXNlIGZvciB0aW55Y29uZmlnLgoK
U2hhbGwgSSBzZW5kIGEgdjQsIG9yIGRpZCB5b3UgZml4IHRoaXMgdXAgYWxyZWFkeT8KCi0tIApL
ZWVzIENvb2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
