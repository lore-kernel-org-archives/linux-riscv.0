Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47F9C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 08:57:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2142060E75
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 08:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2142060E75
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DjO/QSHeFPQOVTjjM8v+hrkpEIClxRjx155EJXGIqzE=; b=FzDyx4Y4zOs1gE
	eTbfOBweQCHxtcdJnh9WABNpcRC+ZOcTp4hWcghgTcdsSfrxt01bqmoSl98RznNwm1CGKx/TbgYPc
	5PCrcnygPNfvzDm9m7kUhrXtn7SJjBCI6CV3EqYTDMykVgZvAHZmx+CUvWuXbk+wUWdrD1AFPOaUf
	+FnjjJrB76SpCTHWGgrcPn4LZilyYGwWJcP+JdbedYZDpCy/uvJgSED/RMlCWNpKkmcbD6bVAa5Bt
	mSupdHMOUKv8w/I+AW22cc+8svkulD31my/JleCuD6i97+ziXm2luE3hA8Yb8RB4UuHPHreCBsf1a
	VBKTqL93qJGNW4e1DEow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfIHD-0019Dz-Ff; Tue, 26 Oct 2021 08:57:47 +0000
Received: from mail-ua1-f43.google.com ([209.85.222.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfIH7-0019An-5Q
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 08:57:44 +0000
Received: by mail-ua1-f43.google.com with SMTP id e5so20600939uam.11
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 01:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wHMJT8hsNB0mIrUoXmplhj21JrUEEtFBSYSzEEGXMi4=;
 b=JIZvU1WDIaXz2syqZsoWMcSD28N5/0PvAOMQt2aZUOBagO+GmLG/xUodR7txhT1X6P
 JfIMAjFvwBUmhv6rvB45rvryBWh4/xKrmpdFZus2PzcUdT5FfbXDZwHOCoRI7iG3n4AY
 hbJqn/Hr6h2KTduuJuOn79SxbtbUnJo3fUW9OQT9N6pdLjZrAfjX+g6zLXikLbCSZEer
 SeujfQimtYMUQUMvQOaaZIwum+hwK+XnAytNYkIWXvMDc17jbAfWUBqPiAXUtJXbrZ39
 nwkhMI2Dc0zXRzz9FfZRQgWTP6jjpsdoH1WTz9HlddVv/++aAeQ5n+loXAM/n4lBXwDL
 4UXQ==
X-Gm-Message-State: AOAM533duVOW6mV530ILeWyylkKB9ZS05wUEFvT8G4p8t9b6TuUCrroo
 JL5LwMe3qIfp7/kJ9s2XnYDNtssb6BP9Gg==
X-Google-Smtp-Source: ABdhPJyPwxVISn6oYWwYnBtoAaloCXmNz7YmjCX7d2VxVIrWM6TaDoXaBalJ9KZTuo5sNAuIZ6irYw==
X-Received: by 2002:a05:6102:290b:: with SMTP id
 cz11mr10391264vsb.38.1635238657903; 
 Tue, 26 Oct 2021 01:57:37 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45])
 by smtp.gmail.com with ESMTPSA id l9sm2366115vki.6.2021.10.26.01.57.37
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 01:57:37 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id h4so27729152uaw.1
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 01:57:37 -0700 (PDT)
X-Received: by 2002:ab0:3154:: with SMTP id e20mr21946342uam.14.1635238657335; 
 Tue, 26 Oct 2021 01:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdUPWOjJfJohxLJefHOrJBtXZ0xfHQt4=hXpUXnasiN+AQ@mail.gmail.com>
 <830eda64-6e66-c61b-ceaa-57be87783b2c@w6rz.net>
 <CAMuHMdU+jgNK8QCEysHnURkpUcazPOoepK32XzV8UGwVQdL5tw@mail.gmail.com>
 <2328512.Zi2KH1A685@diego>
In-Reply-To: <2328512.Zi2KH1A685@diego>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Oct 2021 10:57:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW7NCC3siVp6avaTRffrdFr+OMXvLeGzdHZJOg+B5aGJw@mail.gmail.com>
Message-ID: <CAMuHMdW7NCC3siVp6avaTRffrdFr+OMXvLeGzdHZJOg+B5aGJw@mail.gmail.com>
Subject: Re: Out-of-bounds access when hartid >= NR_CPUS
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: re@w6rz.net, linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_015741_278636_9407FCF3 
X-CRM114-Status: GOOD (  30.90  )
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

SGkgSGVpa28sCgpPbiBUdWUsIE9jdCAyNiwgMjAyMSBhdCAxMDo1MyBBTSBIZWlrbyBTdMO8Ym5l
ciA8aGVpa29Ac250ZWNoLmRlPiB3cm90ZToKPiBBbSBEaWVuc3RhZywgMjYuIE9rdG9iZXIgMjAy
MSwgMDg6NDQ6MzEgQ0VTVCBzY2hyaWViIEdlZXJ0IFV5dHRlcmhvZXZlbjoKPiA+IE9uIFR1ZSwg
T2N0IDI2LCAyMDIxIGF0IDI6MzcgQU0gUm9uIEVjb25vbW9zIDxyZUB3NnJ6Lm5ldD4gd3JvdGU6
Cj4gPiA+IE9uIDEwLzI1LzIxIDg6NTQgQU0sIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+
ID4gPiBXaGVuIGJvb3RpbmcgYSBrZXJuZWwgd2l0aCBDT05GSUdfTlJfQ1BVUz00IG9uIE1pY3Jv
Y2hpcCBQb2xhckZpcmUsCj4gPiA+ID4gdGhlIDR0aCBDUFUgZWl0aGVyIGZhaWxzIHRvIGNvbWUg
b25saW5lLCBvciB0aGUgc3lzdGVtIGNyYXNoZXMuCj4gPiA+ID4KPiA+ID4gPiBUaGlzIGhhcHBl
bnMgYmVjYXVzZSBQb2xhckZpcmUgaGFzIDUgQ1BVIGNvcmVzOiBoYXJ0IDAgaXMgYW4gZTUxLAo+
ID4gPiA+IGFuZCBoYXJ0cyAxLTQgYXJlIHU1NHMsIHdpdGggdGhlIGxhdHRlciBiZWNvbWluZyBD
UFVzIDAtMyBpbiBMaW51eDoKPiA+ID4gPiAgICAtIHVudXNlZCBjb3JlIGhhcyBoYXJ0aWQgMCAo
c2lmaXZlLGU1MSksCj4gPiA+ID4gICAgLSBwcm9jZXNzb3IgMCBoYXMgaGFydGlkIDEgKHNpZml2
ZSx1NzQtbWMpLAo+ID4gPiA+ICAgIC0gcHJvY2Vzc29yIDEgaGFzIGhhcnRpZCAyIChzaWZpdmUs
dTc0LW1jKSwKPiA+ID4gPiAgICAtIHByb2Nlc3NvciAyIGhhcyBoYXJ0aWQgMyAoc2lmaXZlLHU3
NC1tYyksCj4gPiA+ID4gICAgLSBwcm9jZXNzb3IgMyBoYXMgaGFydGlkIDQgKHNpZml2ZSx1NzQt
bWMpLgo+ID4gPiA+Cj4gPiA+ID4gSSBhc3N1bWUgdGhlIHNhbWUgaXNzdWUgaXMgcHJlc2VudCBv
biB0aGUgU2lGaXZlIGZ1NTQwIGFuZCBmdTc0MAo+ID4gPiA+IFNvQ3MsIGJ1dCBJIGRvbid0IGhh
dmUgYWNjZXNzIHRvIHRoZXNlLiAgVGhlIGlzc3VlIGlzIG5vdCBwcmVzZW50Cj4gPiA+ID4gb24g
U3RhckZpdmUgSkg3MTAwLCBhcyBwcm9jZXNzb3IgMCBoYXMgaGFydGlkIDEsIGFuZCBwcm9jZXNz
b3IgMSBoYXMKPiA+ID4gPiBoYXJ0aWQgMC4KPiA+ID4gPgo+ID4gPiA+IGFyY2gvcmlzY3Yva2Vy
bmVsL2NwdV9vcHMuYyBoYXM6Cj4gPiA+ID4KPiA+ID4gPiAgICAgIHZvaWQgKl9fY3B1X3VwX3N0
YWNrX3BvaW50ZXJbTlJfQ1BVU10gX19zZWN0aW9uKCIuZGF0YSIpOwo+ID4gPiA+ICAgICAgdm9p
ZCAqX19jcHVfdXBfdGFza19wb2ludGVyW05SX0NQVVNdIF9fc2VjdGlvbigiLmRhdGEiKTsKPiA+
ID4gPgo+ID4gPiA+ICAgICAgdm9pZCBjcHVfdXBkYXRlX3NlY29uZGFyeV9ib290ZGF0YSh1bnNp
Z25lZCBpbnQgY3B1aWQsCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCB0YXNrX3N0cnVjdCAqdGlkbGUpCj4gPiA+ID4gICAgICB7Cj4gPiA+ID4g
ICAgICAgICAgICAgIGludCBoYXJ0aWQgPSBjcHVpZF90b19oYXJ0aWRfbWFwKGNwdWlkKTsKPiA+
ID4gPgo+ID4gPiA+ICAgICAgICAgICAgICAvKiBNYWtlIHN1cmUgdGlkbGUgaXMgdXBkYXRlZCAq
Lwo+ID4gPiA+ICAgICAgICAgICAgICBzbXBfbWIoKTsKPiA+ID4gPiAgICAgICAgICAgICAgV1JJ
VEVfT05DRShfX2NwdV91cF9zdGFja19wb2ludGVyW2hhcnRpZF0sCj4gPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgdGFza19zdGFja19wYWdlKHRpZGxlKSArIFRIUkVBRF9TSVpFKTsKPiA+
ID4gPiAgICAgICAgICAgICAgV1JJVEVfT05DRShfX2NwdV91cF90YXNrX3BvaW50ZXJbaGFydGlk
XSwgdGlkbGUpOwo+ID4gPiA+Cj4gPiA+ID4gVGhlIGFib3ZlIHR3byB3cml0ZXMgY2F1c2Ugb3V0
LW9mLWJvdW5kIGFjY2Vzc2VzIGJleW9uZAo+ID4gPiA+IF9fY3B1X3VwX3tzdGFjayxwb2ludGVy
fV9wb2ludGVyW10gaWYgaGFydGlkID49IENPTkZJR19OUl9DUFVTLgo+ID4gPiA+Cj4gPiA+ID4g
ICAgICB9Cgo+ID4gaHR0cHM6Ly9yaXNjdi5vcmcvd3AtY29udGVudC91cGxvYWRzLzIwMTcvMDUv
cmlzY3YtcHJpdmlsZWdlZC12MS4xMC5wZGYKPiA+IHNheXM6Cj4gPgo+ID4gICAgIEhhcnQgSURz
IG1pZ2h0IG5vdCBuZWNlc3NhcmlseSBiZSBudW1iZXJlZCBjb250aWd1b3VzbHkgaW4gYQo+ID4g
ICAgIG11bHRpcHJvY2Vzc29yIHN5c3RlbSwgYnV0IGF0IGxlYXN0IG9uZSBoYXJ0IG11c3QgaGF2
ZSBhIGhhcnQKPiA+ICAgICBJRCBvZiB6ZXJvLgo+ID4KPiA+IFdoaWNoIG1lYW5zIGluZGV4aW5n
IGFycmF5cyBieSBoYXJ0IElEIGlzIGEgbm8tZ28/Cj4KPiBJc24ndCB0aGF0IGFsc28gc2ltaWxh
ciBvbiBhYXJjaDY0Pwo+Cj4gT24gYSByazMzOTkgeW91IGdldCAwLTMgYW5kIDEwMC0xMDEgYW5k
IHdpdGggdGhlIHBhcmFncmFwaCBhYm92ZQo+IHNvbWV0aGluZyBsaWtlIHRoaXMgY291bGQgdmVy
eSB3ZWxsIGV4aXN0IG9uIHNvbWUgcmlzY3YgY3B1IHRvbyBJIGd1ZXNzLgoKWWVzLCBpdCBsb29r
cyBsaWtlIGhhcnQgSURzIGFyZSBzaW1pbGFyIHRvIE1QSURScyBvbiBBUk0uCgpHcntvZXRqZSxl
ZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLQpHZWVydCBVeXR0ZXJo
b2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4
LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3Bs
ZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5h
bGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
