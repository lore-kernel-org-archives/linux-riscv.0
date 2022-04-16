Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AE7C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Apr 2022 00:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iP2W3EMYvbtjEvTUOSpDfnaSt2JxtCz1nahv4T+BqYY=; b=ARcMnE2MBxql7+
	MiwLmephhbQ7h8zMzsI9xzhBUfCH9j48/VbWTfEuCKSeFNpImwGqvWf47FlR8bkTKHReQzHTTrEhM
	5j5PF8kltjgriA8hVwYrQB7zBAh/djY0e8mFPGcLCljYcDd8mSX0BhPDw6CNc8CB0FNHUKxzP1RuR
	ZTepm3ZaFjKnWZzmBi9oM1uCCPPGozQByOAVi4HiJ4HsWSodZBOZvM3+5fvQqIlDwUh6FsMI4rkrT
	ZCpk6F9e9VPG6IZZE1SK7IxSu2jb9kfA2pPzt1E3FGPW3lpi9Kjew3mxOPFFi4KInQNoX1oYDpf4b
	lEG4ksZgpmEjmfJzPkCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfW4o-00Bmj4-Nw; Sat, 16 Apr 2022 00:14:10 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfW4m-00Bmi2-52
 for linux-riscv@lists.infradead.org; Sat, 16 Apr 2022 00:14:09 +0000
Received: by mail-pl1-x633.google.com with SMTP id n8so8212505plh.1
 for <linux-riscv@lists.infradead.org>; Fri, 15 Apr 2022 17:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=YDAMdut8vUmhZEo+u+sVvhEH17aBkfLLoPALv7vOiPs=;
 b=BgeBgGT1ait8U0/BHza0JXV85o7bBnhJL0TpF5JPsWvJIk05pGpM+tuDB4PT5hDL6U
 gGCnn6n4F/KUAc06HGiLMZIyQZoAHOduREeyYRRUbhH7l39CDRwwwfNU7wjaCXS7p8j4
 z/n4rBrtg3sNGZ2pSZkfIaSCmg7HpVr/GXgiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YDAMdut8vUmhZEo+u+sVvhEH17aBkfLLoPALv7vOiPs=;
 b=iDuI1fmAjI4zwabDNhLrSkrOCqkmR3/haH4Ozy/R/XblhJN8F13eHxJOCbjLiEIpeK
 sfE+Mq9k2Ek4+o7SG+nQyjGcMiTsag8+2jNHBK/mRA6tdQIGVUJLcEuNbfCUxzwD7eov
 fwqKvouTyTdWY7f8SM29Ky2R5u1nGibwZUuCdb2ZP3/11x1IUZAQlsJ6LBibqhAO64A8
 uVOwXF8RARWazupc97KucobITPtD0OKBWCqX9wUicKHvcjLIZQ9f9cOzNhJt3ivaRI2h
 KQw8NhcLn2+OfEWfMTnICxnrq5qKbFlFEx2QMb6fYKpZpKv2hNRVAjjUBjlS7RChwWA5
 /Crw==
X-Gm-Message-State: AOAM533If2J2R5C0mPZBRaCUeph2M2d/NSthFWDwRjYnWYQtYOuO70WP
 dC8mjwMP2gTMTo+N7rLB083+pw==
X-Google-Smtp-Source: ABdhPJz7gG8OaArrj60bX3xNsZIOTnb5QGee+Uj57upaqwTu6tD+kh6NB8aVzTsd5Pn3smREnpnwHw==
X-Received: by 2002:a17:902:6acb:b0:158:8923:86df with SMTP id
 i11-20020a1709026acb00b00158892386dfmr1444104plt.144.1650068045861; 
 Fri, 15 Apr 2022 17:14:05 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 t38-20020a634626000000b0039cc30b7c93sm5242501pga.82.2022.04.15.17.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 17:14:05 -0700 (PDT)
Date: Fri, 15 Apr 2022 17:14:04 -0700
From: Kees Cook <keescook@chromium.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Eric Biederman <ebiederm@xmission.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Ungerer <gerg@linux-m68k.org>, Mike Frysinger <vapier@gentoo.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 stable@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] binfmt_flat: do not stop relocating GOT entries
 prematurely on riscv
Message-ID: <202204151713.4EB07DECC@keescook>
References: <20220414091018.896737-1-niklas.cassel@wdc.com>
 <202204141624.6689D6B@keescook>
 <20220415012610.f2uph3vpwehyc27u@meerkat.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220415012610.f2uph3vpwehyc27u@meerkat.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_171408_228737_88E16927 
X-CRM114-Status: GOOD (  16.58  )
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

T24gVGh1LCBBcHIgMTQsIDIwMjIgYXQgMDk6MjY6MTBQTSAtMDQwMCwgS29uc3RhbnRpbiBSeWFi
aXRzZXYgd3JvdGU6Cj4gT24gVGh1LCBBcHIgMTQsIDIwMjIgYXQgMDQ6Mjc6MzhQTSAtMDcwMCwg
S2VlcyBDb29rIHdyb3RlOgo+ID4gT24gVGh1LCBBcHIgMTQsIDIwMjIgYXQgMTE6MTA6MThBTSAr
MDIwMCwgTmlrbGFzIENhc3NlbCB3cm90ZToKPiA+ID4gYkZMVCBiaW5hcmllcyBhcmUgdXN1YWxs
eSBjcmVhdGVkIHVzaW5nIGVsZjJmbHQuCj4gPiA+IFsuLi5dCj4gPiAKPiA+IEhtLCBzb21ldGhp
bmcgaW4gdGhlIGNoYWluIGJyb2tlIERLSU0sIGJ1dCBJIGNhbid0IHNlZSB3aGF0Ogo+ID4gCj4g
PiAgIOKclyBbUEFUQ0ggdjJdIGJpbmZtdF9mbGF0OiBkbyBub3Qgc3RvcCByZWxvY2F0aW5nIEdP
VCBlbnRyaWVzIHByZW1hdHVyZWx5IG9uIHJpc2N2Cj4gPiAgICAg4pyXIEJBRFNJRzogREtJTS93
ZGMuY29tCj4gPiAKPiA+IEtvbnN0YW50aW4sIGRvIHlvdSBoYXZlIGEgcHJvY2VzcyBmb3IgZGVi
dWdnaW5nIHRoZXNlPyBJIGRvbid0IHNlZSB0aGUKPiA+ICJub3JtYWwiIHN0dWZmIHRoYXQgYnJl
YWtzIERLSU0gKGkuZS4gYSB0cmFpbGluZyBtYWlsaW5nIGxpc3QgZm9vdGVyLCBldGMpCj4gCj4g
SXQncyBvdXIgdXN1YWwgZnJpZW5kICJjPXNpbXBsZS9zaW1wbGUiIC0tIHZnZXIganVzdCBkb2Vz
bid0IHdvcmsgd2l0aCB0aGF0Lgo+IFNlZSBoZXJlIGZvciByZWFzb25zOgo+IAo+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMTEyMTQxNTAwMzIubmlvZWxndm1hc2U3eXl1c0BtZWVy
a2F0LmxvY2FsLwo+IAo+IFlvdSBzaG91bGQgdHJ5IHRvIGNvbnZpbmNlIHdkYy5jb20gbWFpbCBh
ZG1pbnMgdG8gc2V0IGl0IHRvIGM9cmVsYXhlZC9zaW1wbGUsCj4gb3IgeW91IGNhbiBjYyBhbGwg
eW91ciBwYXRjaGVzIHRvIHBhdGNoZXNAbGlzdHMubGludXguZGV2ICh3aGljaCBkb2VzIHdvcmsK
PiB3aXRoIGM9c2ltcGxlL3NpbXBsZSksIGFuZCB0aGVuIGI0IHdpbGwgZ2l2ZSB0aG9zZSBwcmlv
cml0eSB0cmVhdG1lbnQuCgpBaC1oYSEgVGhhbmsgeW91ISA6KQoKLS0gCktlZXMgQ29vawoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
