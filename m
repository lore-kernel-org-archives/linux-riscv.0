Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A8FC47096
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 16:53:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55908611C0
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 16:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55908611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0IlQbd23t3cFUFVHaAsvcT4++IyyxFurt4MgFzu2PWA=; b=1F0A115yfekNI1
	MNCBajgCgXe2TIWEy3aecDeJOfZGqLQvwAQJ/S1G0hcXkIbhBbhv2i+b/xt3rGoXW1PTFQxhqWM1e
	iQiBmesDs+ncMRq7WKKzzYAoL7IsbgKeOG9drel/2gNd4Lvcr67EvDqQQUPZVmctM6K+TfYnv8kW+
	Tn6eq67NQubS0z/KtVKSxk9pgf3bbMYfwHYid1ekgC3Belrg4vvd2GNdp8Kd4ud8gQlhiRS0482hk
	FSOgu+fYWkGDzPLyBbhuX9Q1kgDlGHSr2jPut1SOXuGg3j40F9Twze9bny8ASvVOH9K6cj81b+5ub
	NXKCGd32JP0+xB2fI09g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpw1o-000ZmW-RW; Sun, 06 Jun 2021 16:53:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpw1j-000ZlE-Fz
 for linux-riscv@lists.infradead.org; Sun, 06 Jun 2021 16:53:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B7CB6143B
 for <linux-riscv@lists.infradead.org>; Sun,  6 Jun 2021 16:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622998411;
 bh=PCUFcvjW5ZdETuEdS+iuJT4t+i6zWG2NG3M7MxBOHHw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Gglq4Xlt5gvuQ2fLEjSSCEa4SXhxH8EAJPmIoSJl5R4VFssDmKArB2wk7IQwzfdxd
 Ky3RQal+ElhyemZkSiSkNAaTf/aaowATH8TQvdmjOV1aH7XcTpzQSu3oDzotcCG+UP
 ckS4mXSbIRWBHZBHzQNN8MdLQDdHwQHrQlP7jPcGYUhQiQDFGPlEvVtjmfhhkR7xQX
 s/XW2EjXKdzDyNdNGPAgiwElC+pCxNj24NpgpbWv8IgZsmTSz626fwVkZ5sMTuHBDE
 Tc1cmWN3CjbJMp8md/019RLT2onFF8K1HK6FSb4A/NCjM0B9IxjUbTlz7+nPRQltOw
 UiR7do94hc3Qw==
Received: by mail-lj1-f179.google.com with SMTP id x14so4291004ljp.7
 for <linux-riscv@lists.infradead.org>; Sun, 06 Jun 2021 09:53:30 -0700 (PDT)
X-Gm-Message-State: AOAM531ufI074v27JQr6oHjRxfs9UEXTsmxBQRf1eMHRgb6YU4H954mW
 GRdu+g+Pd35V6Cp7+w9hLrs2UDcgt0SomehJRKs=
X-Google-Smtp-Source: ABdhPJzAAGqPqoJ/9s8vs6/WdE8E4ilC4UMPN8WuVGr0yxKfHLU/QAH6LQmWLKgXClq7E3ciDqVU172ziLiu5afqFXM=
X-Received: by 2002:a05:651c:502:: with SMTP id
 o2mr11713139ljp.105.1622998409312; 
 Sun, 06 Jun 2021 09:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <1622970249-50770-15-git-send-email-guoren@kernel.org>
 <CAK8P3a0yHEGH8=o_TQ+ajRn53j+mHxYxqyYLPXnUe=YWkTHDBw@mail.gmail.com>
 <811499816.OAcyhOWOk8@jernej-laptop>
In-Reply-To: <811499816.OAcyhOWOk8@jernej-laptop>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 7 Jun 2021 00:53:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTChtcDaznZSRvU6TvknkCH=St8Fv9Eux1tJDy+s1AagQ@mail.gmail.com>
Message-ID: <CAJF2gTTChtcDaznZSRvU6TvknkCH=St8Fv9Eux1tJDy+s1AagQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 11/11] riscv: soc: Allwinner D1 GMAC driver only
 for temp use
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup.patel@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime@cerno.tech>, Drew Fustini <drew@beagleboard.org>,
 liush@allwinnertech.com, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, wefu@redhat.com, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 Corentin Labbe <clabbe@baylibre.com>, Samuel Holland <samuel@sholland.org>, 
 Icenowy Zheng <icenowy@aosc.io>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
 Michael Walle <michael@walle.cc>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_095331_590364_DE7503B4 
X-CRM114-Status: GOOD (  30.27  )
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

T24gTW9uLCBKdW4gNywgMjAyMSBhdCAxMjozMiBBTSBKZXJuZWogxaBrcmFiZWMgPGplcm5lai5z
a3JhYmVjQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBEbmUgbmVkZWxqYSwgMDYuIGp1bmlqIDIwMjEg
b2IgMTg6MTY6NDQgQ0VTVCBqZSBBcm5kIEJlcmdtYW5uIG5hcGlzYWwoYSk6Cj4gPiBPbiBTdW4s
IEp1biA2LCAyMDIxIGF0IDExOjA0IEFNIDxndW9yZW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9hbGx3aW5uZXItZDEt
bmV6aGEta2l0LmR0cwo+ID4gPiBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL2FsbHdp
bm5lci1kMS1uZXpoYS1raXQuZHRzIGluZGV4Cj4gPiA+IGNkOWY3YzkuLjMxYjY4MWQgMTAwNjQ0
Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL2FsbHdpbm5lci1kMS1u
ZXpoYS1raXQuZHRzCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL2Fs
bHdpbm5lci1kMS1uZXpoYS1raXQuZHRzCj4gPiA+IEBAIC0xMSw3ICsxMSw3IEBACj4gPiA+Cj4g
PiA+ICAgICAgICAgY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsZDEtbmV6aGEta2l0IjsKPiA+ID4K
PiA+ID4gICAgICAgICBjaG9zZW4gewo+ID4gPgo+ID4gPiAtICAgICAgICAgICAgICAgYm9vdGFy
Z3MgPSAiY29uc29sZT10dHlTMCwxMTUyMDAiOwo+ID4gPiArICAgICAgICAgICAgICAgYm9vdGFy
Z3MgPSAiY29uc29sZT10dHlTMCwxMTUyMDAgcm9vdHdhaXQgaW5pdD0vc2Jpbi9pbml0Cj4gPiA+
IHJvb3Q9L2Rldi9uZnMgcncgbmZzcm9vdD0xOTIuMTY4LjEwMS4yMDA6L3RtcC9yb290ZnNfbmZz
LHYzLHRjcCxub2xvY2sKPiA+ID4gaXA9MTkyLjE2OC4xMDEuMjMiOwo+ID4gVGhlc2UgYXJlIG5v
dCBib2FyZCBzcGVjaWZpYyBvcHRpb25zLCB0aGV5IHNob3VsZCBiZSBzZXQgYnkgdGhlIGJvb3Rs
b2FkZXIKPiA+IGFjY29yZGluZyB0byB0aGUgbmV0d29yayBlbnZpcm9ubWVudC4gSXQgY2xlYXJs
eSBkb2Vucyd0IGJlbG9uZwo+ID4gaW50byB0aGlzIHBhdGNoIC4KPiA+Cj4gPiA+ICAgICAgICAg
ICAgICAgICBzdGRvdXQtcGF0aCA9ICZzZXJpYWwwOwo+ID4gPgo+ID4gPiAgICAgICAgIH07Cj4g
PiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9hbGx3
aW5uZXItZDEuZHRzaQo+ID4gPiBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL2FsbHdp
bm5lci1kMS5kdHNpIGluZGV4IDExY2Q5MzguLmQzMTdlMTkKPiA+ID4gMTAwNjQ0Cj4gPiA+IC0t
LSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL2FsbHdpbm5lci1kMS5kdHNpCj4gPiA+
ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL2FsbHdpbm5lci1kMS5kdHNpCj4g
PiA+IEBAIC04MCw1ICs4MCwyMSBAQAo+ID4gPgo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICBjbG9ja3MgPSA8JmR1bW15X2FwYj47Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0
YXR1cyA9ICJkaXNhYmxlZCI7Cj4gPiA+Cj4gPiA+ICAgICAgICAgICAgICAgICB9Owo+ID4gPgo+
ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgICBldGhANDUwMDAwMCB7Cj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bnhpLWdtYWMiOwo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMCAweDQ1MDAwMDAgMHgwMCAweDEw
MDAwIDB4MDAgMHgzMDAwMDMwCj4gPiA+IDB4MDAgMHgwND47ICsgICAgICAgICAgICAgICAgICAg
ICAgIGludGVycnVwdHMtZXh0ZW5kZWQgPSA8JnBsaWMgMHgzZQo+ID4gPiAweDA0PjsKPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LW5hbWVzID0gImdtYWNpcnEiOwo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJnbWFjMCI7Cj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHBoeS1tb2RlID0gInJnbWlpIjsKPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgdXNlX2VwaHkyNW0gPSA8MHgwMT47Cj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHR4LWRlbGF5ID0gPDB4MDM+Owo+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICByeC1kZWxheSA9IDwweDAzPjsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZ21hYy1w
b3dlcjA7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGdtYWMtcG93ZXIxOwo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBnbWFjLXBvd2VyMjsKPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ID4gPiArICAgICAgICAgICAgICAgfTsKPiA+Cj4g
PiBCZWZvcmUgeW91IGFkZCB0aGlzIGluIHRoZSBkdHMgZmlsZSwgdGhlIHByb3BlcnRpZXMgbmVl
ZCB0byBiZSBkb2N1bWVudGVkIGluCj4gPiB0aGUgYmluZGluZyBmaWxlLiBUaGUgImFsbHdpbm5l
cixzdW54aS1nbWFjIiBpZGVudGlmaWVyIGRvZXMgbm90IGFwcGVhciB0bwo+ID4gYmUgc3BlY2lm
aWMgZW5vdWdoIGhlcmUsIGFuZCB0aGUgcHJvcGVydGllcyBkb24ndCBtYXRjaCB3aGF0IGR3bWFj
IHVzZXMsCj4gPiB3aGljaCB3b3VsZCBtYWtlIGl0IHVubmVjZXNzYXJpbHkgaGFyZCB0byBjaGFu
Z2UgdG8gdGhlIG90aGVyIGRyaXZlciBsYXRlcgo+ID4gb24gd2l0aG91dCBicmVha2luZyBjb21w
YXRpYmlsaXR5IHRvIG9sZCBkdGIgZmlsZXMuCj4gPgo+ID4gPiArKysgYi9kcml2ZXJzL25ldC9l
dGhlcm5ldC9hbGx3aW5uZXJ0bXAvc3VueGktZ21hYy1vcHMuYwo+ID4gPiBAQCAtMCwwICsxLDY5
MCBAQAo+ID4gPiArLyoKPiA+ID4gKyAqIGxpbnV4L2RyaXZlcnMvbmV0L2V0aGVybmV0L2FsbHdp
bm5lci9zdW54aV9nbWFjX29wcy5jCj4gPiA+ICsgKgo+ID4gPiArICogQ29weXJpZ2h0IMKpIDIw
MTYtMjAxOCwgZnV6aGFva2UKPiA+ID4gKyAqICAgICAgICAgICAgIEF1dGhvcjogZnV6aGFva2Ug
PGZ1emhhb2tlQGFsbHdpbm5lcnRlY2guY29tPgo+ID4gPiArICoKPiA+ID4gKyAqIFRoaXMgZmls
ZSBpcyBwcm92aWRlZCB1bmRlciBhIGR1YWwgQlNEL0dQTCBsaWNlbnNlLiAgV2hlbiB1c2luZyBv
cgo+ID4gPiArICogcmVkaXN0cmlidXRpbmcgdGhpcyBmaWxlLCB5b3UgbWF5IGRvIHNvIHVuZGVy
IGVpdGhlciBsaWNlbnNlLgo+ID4KPiA+IEFyZSB5b3Ugc3VyZSB0aGlzIGlzIHRoZSBjb3JyZWN0
IGNvcHlyaWdodCBpbmZvcm1hdGlvbiBhbmQgImZ1emhhb2tlIiBpcwo+ID4gdGhlIGNvcHlyaWdo
dCBob2xkZXIgZm9yIHRoaXMgZmlsZT8gSWYgdGhpcyBpcyBkZXJpdmVkIGZyb20gZWl0aGVyIHRo
ZQo+ID4gZGVzaWdud2FyZQo+ID4gY29kZSBvciB0aGUgTGludXggc3RtbWFjIGRyaXZlciwgdGhl
IGF1dGhvcnMgc2hvdWxkIGJlIG1lbnRpb25lZCwKPiA+IGFuZCB0aGUgbGljZW5zZSBiZSBjb21w
YXRpYmxlIHdpdGggdGhlIG9yaWdpbmFsIGxpY2Vuc2UgdGVybXMuCj4gPgo+ID4gQW5kcmUgYWxy
ZWFkeSBjb21tZW50ZWQgb24gdGhlIGRyaXZlciBxdWFsaXR5IGFuZCBjb2RlIGR1cGxpY2F0aW9u
LCB0aG9zZQo+ID4gYXJlIGFsc28gc2hvdy1zdG9wcGVycywgYnV0IHRoZSB1bmNsZWFyIGxpY2Vu
c2UgdGVybXMgYW5kIGR0IGJpbmRpbmcKPiA+IGNvbXBhdGliaWxpdHkgYXJlIGV2ZW4gc3Ryb25n
ZXIgcmVhc29ucyB0byBub3QgZ2V0IGFueXdoZXJlIGNsb3NlIHRvIHRoaXMKPiA+IGRyaXZlci4K
Pgo+IEkgZ290IGltcHJlc3Npb24gdGhhdCB0aGlzIHBhdGNoIGlzIG5vdCBtZWFudCB0byBiZSBt
ZXJnZWQgYW5kIGl0J3MgZm9yd2FyZAo+IHBvcnRlZCBmcm9tIHZlbmRvciBrZXJuZWwgYXMgYSBz
dG9wIGdhcCBtZWFzdXJlIGZvciBkZXZlbG9wZXJzIHVudGlsIHByb3Blcgo+IG1haW5saW5lIGV0
aGVybmV0IGRyaXZlciBpcyBkZXZlbG9wZWQuClllcwoKPgo+IEJlc3QgcmVnYXJkcywKPiBKZXJu
ZWoKPgo+Cj4KPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCk1MOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1jc2t5LwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
