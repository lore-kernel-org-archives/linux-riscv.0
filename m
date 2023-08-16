Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3873C27C6D
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 22:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bL9KSveOQ7X+7j7izE12RnpRTj8R1733BxhJL+HpkOE=; b=yMaghlUBwXzX0e
	gXXXMGHeg4e/DR18JPTSs2WhsUBZGRzDfO5OQBOaxFNr+m9Ch0Ea3c9t/yxyeRTs6qO+Dw1VCMoUz
	RQEewLiFOWQIYx/Awd9o96UPJEnEPbfie17MaJ194Ue1DFJFP+nMtVyMF0hpk0hOPTVGg3P8muXoj
	qdcGYZPl7GYU8+fapsnHHTlz6+a+VFs6C2iNE6eJfFGFc2TYHQ2OYsUOZQSj0vsB7pDhol2QFg1ia
	QtiSPvspeRDFnzWEew9YbfiymIdrUmNXjOGa9+ZCI1SCXnZuvElW+vJ62NGYbIpPK1ZO62qxwfVQF
	BhQVlLAmPY/J3bYKZbFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWPCl-00574l-2j;
	Wed, 16 Aug 2023 22:41:31 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWPCi-00574H-2v
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 22:41:30 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-407db3e9669so62981cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Aug 2023 15:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692225686; x=1692830486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9Paa0v1ravHMTVpZPXZD6S/7y0k3tuVxrGRZui4T4g=;
        b=yuLIbWj0ndGCTBfEUMxmcy1U7qRYzAnlX/r6cAI7WSDFr7lJ44BoAPmVuafCxmBXGs
         Yl1kLoMVmA7fH1aP/ZTBsICyEGWKwk8EpcjIXyFqfNUbTCRqO38tM3b0JqAcgHFRnwwo
         scyChh4+23DL0RmOpkKY9VRAcecrBSauNl4oEShfb79Je7PNRNluHfm577nAcvCjamVD
         3QfOrl5015SDHhfKdR20bfWe0ZxNy1t24yfR+Q1dAedSbLKfIP01s8q7u7Vh1M3H8P6Y
         VwD2v5GTeNpsbomGnP1xwatyxwcdFXhjlZaT2gQxJZe7HBEXRtbBOgVgCLUTriT0RRAo
         8cFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692225686; x=1692830486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9Paa0v1ravHMTVpZPXZD6S/7y0k3tuVxrGRZui4T4g=;
        b=aXStp0x5boZH18GdLnjyG1mKds3I8vPHOts5ppZ95Xf2AOxP9nVBNn/eL1FUZIvOUT
         AcDqspp+gEy2qhmr50EWvGdK3zYtVSkd2zCJbgjT3t9DYkxXv/0GNN3Y31GzaJClZSEW
         38NGcUDPWdK2lK15I3z1JUz5Uj8vBdLrCI6h341jaS+/n/8NN03Xsw1x3yVrTBVrcZes
         948q/3o5Nkp1xu9aUCVLWTeqK794nylt910KpletlMVEBDOrOWoQHjU+rdW4jQzb2kBh
         mFxDVG5yq/J9Uc7seXu7l6I63+ts392ux7LGu1TNWLlIhXlZ94PNL5lkNuBq52N03xF9
         Shuw==
X-Gm-Message-State: AOJu0YyhHKvBqB5HZnYV5bR6eKsJvgqdNR2VjdZAOHUKwkLgCsXE3UDq
	kJQQxKKxmXo9JmdiAZf+m0A9r9zlwncolalbX7GtDw==
X-Google-Smtp-Source: AGHT+IF6JWEDCSKLUVNR5Pubq/VVpxeJie1GCRuH7hfHz3D8W3HCTN8Rw035Pu4ZVTdsuvdT6cFcRsGo+kakuONFvqs=
X-Received: by 2002:a05:622a:1b89:b0:3f8:e0a:3e66 with SMTP id
 bp9-20020a05622a1b8900b003f80e0a3e66mr60587qtb.3.1692225686462; Wed, 16 Aug
 2023 15:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230816-riscv-debug_info_split-v1-1-d1019d6ccc11@kernel.org>
 <20230816220457.kqzlbiibeomvki4y@google.com> <CAKwvOdnRb1OmLWNWnj5f-r-rqL0=OsBXJV9d7OU3bjXtOLLtiA@mail.gmail.com>
In-Reply-To: <CAKwvOdnRb1OmLWNWnj5f-r-rqL0=OsBXJV9d7OU3bjXtOLLtiA@mail.gmail.com>
From: Fangrui Song <maskray@google.com>
Date: Wed, 16 Aug 2023 15:41:15 -0700
Message-ID: <CAFP8O3LzmUQNHMPKwW6cz05hdC576WbbUsrBSkWMTSMc=P1vaQ@mail.gmail.com>
Subject: Re: [PATCH] lib/Kconfig.debug: Restrict DEBUG_INFO_SPLIT for RISC-V
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, akpm@linux-foundation.org, conor@kernel.org, 
	trix@redhat.com, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_154128_971785_2F1CA151 
X-CRM114-Status: GOOD (  27.63  )
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

T24gV2VkLCBBdWcgMTYsIDIwMjMgYXQgMzozNeKAr1BNIE5pY2sgRGVzYXVsbmllcnMKPG5kZXNh
dWxuaWVyc0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgQXVnIDE2LCAyMDIzIGF0IDM6
MDXigK9QTSBGYW5ncnVpIFNvbmcgPG1hc2tyYXlAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
T24gMjAyMy0wOC0xNiwgTmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6Cj4gPiA+V2hlbiBidWlsZGlu
ZyBmb3IgQVJDSD1yaXNjdiB1c2luZyBMTFZNIDwgMTQsIHRoZXJlIGlzIGFuIGVycm9yIHdpdGgK
PiA+ID5DT05GSUdfREVCVUdfSU5GT19TUExJVD15Ogo+ID4gPgo+ID4gPiAgZXJyb3I6IEEgZHdv
IHNlY3Rpb24gbWF5IG5vdCBjb250YWluIHJlbG9jYXRpb25zCj4gPiA+Cj4gPiA+VGhpcyB3YXMg
d29ya2VkIGFyb3VuZCBpbiBMTFZNIDE1IGJ5IGRpc2FsbG93aW5nICctZ3NwbGl0LWR3YXJmJyB3
aXRoCj4gPiA+Jy1tcmVsYXgnICh0aGUgZGVmYXVsdCksIHNvIENPTkZJR19ERUJVR19JTkZPX1NQ
TElUIGlzIG5vdCBzZWxlY3RhYmxlCj4gPiA+d2l0aCBuZXdlciB2ZXJzaW9ucyBvZiBMTFZNOgo+
ID4gPgo+ID4gPiAgJCBjbGFuZyAtLXRhcmdldD1yaXNjdjY0LWxpbnV4LWdudSAtZ3NwbGl0LWR3
YXJmIC1jIC1vIC9kZXYvbnVsbCAteCBjIC9kZXYvbnVsbAo+ID4gPiAgY2xhbmc6IGVycm9yOiAt
Z3NwbGl0LWR3YXJmIGlzIHVuc3VwcG9ydGVkIHdpdGggUklTQy1WIGxpbmtlciByZWxheGF0aW9u
ICgtbXJlbGF4KQo+ID4gPgo+ID4gPkdDQyBzaWxlbnRseSBoYWQgYSBzaW1pbGFyIGlzc3VlIHRo
YXQgd2FzIHJlc29sdmVkIHdpdGggR0NDIDEyLnguCj4gPiA+UmVzdHJpY3QgQ09ORklHX0RFQlVH
X0lORk9fU1BMSVQgZm9yIFJJU0MtViB3aGVuIHVzaW5nIExMVk0gb3IgR0NDIDwKPiA+ID4xMi54
IHRvIGF2b2lkIHRoZXNlIGtub3duIGlzc3Vlcy4KPiA+ID4KPiA+ID5MaW5rOiBodHRwczovL2dp
dGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy8xOTE0Cj4gPiA+TGluazogaHR0
cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9OTkwOTAKPiA+ID5SZXBv
cnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gPiA+Q2xvc2VzOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA4MDkwMjA0Ljl5WmZmQldvLWxrcEBpbnRl
bC5jb20vCj4gPiA+U2lnbmVkLW9mZi1ieTogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJu
ZWwub3JnPgo+ID4gPi0tLQo+ID4gPlNpbmNlIHRoaXMgb25seSBpbXBhY3RzIFJJU0MtViwgaXQg
c2VlbXMgcmVhc29uYWJsZSB0aGF0IHRoaXMgd291bGQgZ28KPiA+ID5pbiB2aWEgdGhlaXIgdHJl
ZSBidXQgSSBoYXZlIGFkZGVkIEFuZHJldyBpbiBjYXNlIGhlIHdhbnRzIHRvIHRha2UgaXQuCj4g
PiA+LS0tCj4gPiA+IGxpYi9LY29uZmlnLmRlYnVnIHwgNSArKysrKwo+ID4gPiAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+ZGlmZiAtLWdpdCBhL2xpYi9LY29uZmln
LmRlYnVnIGIvbGliL0tjb25maWcuZGVidWcKPiA+ID5pbmRleCBkNjc5ODUxM2E4YzIuLmJkNTEy
NzRmNDc3MSAxMDA2NDQKPiA+ID4tLS0gYS9saWIvS2NvbmZpZy5kZWJ1Zwo+ID4gPisrKyBiL2xp
Yi9LY29uZmlnLmRlYnVnCj4gPiA+QEAgLTM1NSw2ICszNTUsMTEgQEAgZW5kY2hvaWNlICMgIkNv
bXByZXNzZWQgRGVidWcgaW5mb3JtYXRpb24iCj4gPiA+IGNvbmZpZyBERUJVR19JTkZPX1NQTElU
Cj4gPiA+ICAgICAgIGJvb2wgIlByb2R1Y2Ugc3BsaXQgZGVidWdpbmZvIGluIC5kd28gZmlsZXMi
Cj4gPiA+ICAgICAgIGRlcGVuZHMgb24gJChjYy1vcHRpb24sLWdzcGxpdC1kd2FyZikKPiA+ID4r
ICAgICAgIyBSSVNDLVYgbGlua2VyIHJlbGF4YXRpb24gKyAtZ3NwbGl0LWR3YXJmIGhhcyBpc3N1
ZXMgd2l0aCBMTFZNIGFuZCBHQ0MKPiA+ID4rICAgICAgIyBwcmlvciB0byAxMi54Ogo+ID4gPisg
ICAgICAjIGh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC9pc3N1ZXMvNTY2NDIK
PiA+ID4rICAgICAgIyBodHRwczovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9p
ZD05OTA5MAo+ID4gPisgICAgICBkZXBlbmRzIG9uICFSSVNDViB8fCBHQ0NfVkVSU0lPTiA+PSAx
MjAwMDAKPgo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLiBJIHdhcyBpbml0aWFsbHkgc3VycHJpc2Vk
IHRvIHNlZSBubyBleHBsaWNpdAo+IGNoZWNrIGZvciBMTFZNIHZlcnNpb24uICBSZXJlYWRpbmcg
dGhlIGNvbW1pdCBkZXNjcmlwdGlvbiBhIGZldyB0aW1lcywKPiBJIHRoaW5rIGl0IG1ha2VzIHNl
bnNlLCBidXQgSSdtIGd1ZXNzaW5nIHdlIG1heSBuZWVkIHRvIHJld29yayB0aGlzCj4gY29uZGl0
aW9uIGFnYWluIHNob3VsZCB3ZSBldmVudHVhbGx5IGdldCBzcGxpdCBkZWJ1ZyBpbmZvIHdvcmtp
bmcgZm9yCj4gcmlzY3YgZm9yIGxsdm0uICBJIGFtIGxvb2tpbmcgdG8gZW5hYmxlIHNwbGl0IGRl
YnVnIGluZm8gZm9yIGtlcm5lbHMKPiBmb3IgQW5kcm9pZCdzIG5leHQgcmVsZWFzZS4KPgo+IEZh
bmdydWksIGFueSB0aG91Z2h0cyBvbiBmZWFzaWJpbGl0eSBmb3IgYC1tcmVsYXhgIGFuZCBgLWdz
cGxpdC1kd2FyZmAKPiBjb21wb3NhYmlsaXR5IGZvciBsbHZtPwoKWWVzLCB0aGlzIHNob3VsZCBi
ZSBmZWFzaWJsZSBhbmQgaXMgb24gbXkgcmFkYXIKKGh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xs
dm0tcHJvamVjdC9pc3N1ZXMvNTY2NDIjaXNzdWVjb21tZW50LTE1NDg0MjEwMjYpLgoKSXQncyB0
aGUgbmV4dCB0aGluZyBJJ2xsIGRvIGluIG15IHNwYXJlIHRpbWUgYWZ0ZXIgRFdBUkYgdjUgJiBs
aW5rZXIKcmVsYXhhdGlvbiBpbnRlcm9wOiBodHRwczovL3Jldmlld3MubGx2bS5vcmcvRDE1NzY1
NwoKPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QvaXNzdWVzLzU2
NjQyCj4gUmV2aWV3ZWQtYnk6IE5pY2sgRGVzYXVsbmllcnMgPG5kZXNhdWxuaWVyc0Bnb29nbGUu
Y29tPgo+Cj4gPiA+ICAgICAgIGhlbHAKPiA+ID4gICAgICAgICBHZW5lcmF0ZSBkZWJ1ZyBpbmZv
IGludG8gc2VwYXJhdGUgLmR3byBmaWxlcy4gVGhpcyBzaWduaWZpY2FudGx5Cj4gPiA+ICAgICAg
ICAgcmVkdWNlcyB0aGUgYnVpbGQgZGlyZWN0b3J5IHNpemUgZm9yIGJ1aWxkcyB3aXRoIERFQlVH
X0lORk8sCj4gPiA+Cj4gPiA+LS0tCj4gPiA+YmFzZS1jb21taXQ6IDJjY2RkMWIxM2M1OTFkMzA2
ZjA0MDFkOThkZWRjNGJkY2QwMmI0MjEKPiA+ID5jaGFuZ2UtaWQ6IDIwMjMwODE2LXJpc2N2LWRl
YnVnX2luZm9fc3BsaXQtMDcxMzU3MWExYWMyCj4gPiA+Cj4gPiA+QmVzdCByZWdhcmRzLAo+ID4g
Pi0tCj4gPiA+TmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPgo+ID4gPgo+ID4K
PiA+IExHVE0gYXMgdGhlIGF1dGhvciBvZiB0aGUgQ2xhbmcgbWl0aWdhdGlvbgo+ID4gKGh0dHBz
Oi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC9pc3N1ZXMvNTY2NDIpIGFuZCBzZXZlcmFs
IHJlY2VudAo+ID4gTExWTSBhc3NlbWJsZXIgc2lkZSBsaW5rZXIgcmVsYXhhdGlvbiBpbXByb3Zl
bWVudCAoSSBjb250aW51ZSB1cGRhdGluZwo+ID4gaHR0cHM6Ly9tYXNrcmF5Lm1lL2Jsb2cvMjAy
MS0wMy0xNC10aGUtZGFyay1zaWRlLW9mLXJpc2N2LWxpbmtlci1yZWxheGF0aW9uCj4gPiBhYm91
dCB0aGUgY29tcGxpY2F0aW9uIG9mIGxpbmtlciByZWxheGF0aW9uKS4KPiA+Cj4gPiBSZXZpZXdl
ZC1ieTogRmFuZ3J1aSBTb25nIDxtYXNrcmF5QGdvb2dsZS5jb20+Cj4KPgo+Cj4gLS0KPiBUaGFu
a3MsCj4gfk5pY2sgRGVzYXVsbmllcnMKCgoKLS0gCuWui+aWueedvwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
