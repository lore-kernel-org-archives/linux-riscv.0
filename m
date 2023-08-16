Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1734DC27C5E
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 22:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ilDelbvdeTG6uAm6ETM/JOLnkWq8Pd/KCHFAZ2qPq48=; b=lwMginN8kjtix1
	O6498oFxDfkY6dQEl/esZdqa1YMvvXF0551jQFa+gxSUhvh4OTp31JUTeidYJox6rUGASuJ/wTJP+
	RrJrskH0mykXqYQZBHY/E0GK9XYP8dELFPwHlOoZA74mEQFFi5adle4T9crA6HuUlGD/fLqVrqgXN
	gVnpfoLrwmz2tNq+4CGcBqQEvENpH29s/3R0Hv/MmYmFdxn+ySCDIZ9iiAz9e6tNZyBLuDkpk/iCl
	hngDRtCIqRG0tLzY4D/wzCSAaVchfPP3hB7P/cpXxjgSrxC/obPNM3uQP4sW1+XXRtkngdF1kkQbz
	ZeF6DW7wusu29glUmzvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWP6t-0056fv-08;
	Wed, 16 Aug 2023 22:35:27 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWP6q-0056fL-0m
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 22:35:25 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-4882787744eso755449e0c.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Aug 2023 15:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692225317; x=1692830117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SX8jlMVqMi1+mLRoYyUfc72SUd+crYgBsYv56+9V6E=;
        b=EfLFo/b41aCL09FPShvIG4tmRfEM0AwoIXv4zJi49BVDrF9iPI0A8tbq7wR4GQ0e9p
         oivgK7oz9AKcXdl2AHm4mwT2RWJEekqG5ehDH0h1D2QkJmPpDLbEgyyHCyZLK1PmVn3e
         zovIeprLeYevzeyj5NnQkJKitard3wRxq1Pejhayb3ju9rtFqyqs28IVC0TJIMjgED+n
         5seVZQzsp70BDVbVQDuVR9Va4sPDH8z1COdrb2bVRzEbIxHnHvfdk724UhKH9YayP2np
         +JMvf40D3KN/T+WBRDVcd3vov+V6HWZTYVP8sbiRt4HJWrQb8+IndhjuTc1UXuyD23Tz
         PTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692225317; x=1692830117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7SX8jlMVqMi1+mLRoYyUfc72SUd+crYgBsYv56+9V6E=;
        b=C8zdrXS346TxWTyxv5TJ01IenyPvJ+RyR+r62Rvet9Vty5+L7MyPehTWh6Kiu3bFXF
         ton7Kd/YHyNq9sDNURxqDmRcgtyx95sesAZyOqVQ/frQPbjp2T3sIgjoFRY4qiHgmywX
         1YTC8nrgpbVDb3jD+WWft56Hg5wxyCLnwGRnnc3yfgjE/F8XkYjFsBvGB+csCcopfoPu
         XQ4WEqU7Boj6qMukxLGjH4diQpfjs1zQ3as7PQsBzqLIQhlPo+cVQj5N5iZpimtBjTVp
         2RLfcGeovnJLas7l91cbt0eb7NFJOKgmnvqNTeX7WjFL7KbvINA06DhAVBuD1Ca4ya8I
         Lcmw==
X-Gm-Message-State: AOJu0YwrFUi9xTsjvQO/AoUCRanj2CoU2inVBK9su8+SyDryy6FA3z4c
	RgtSWZgvU+dVKFF6d4CHF43iXX9Bt9MsgiXKTT4QIQ==
X-Google-Smtp-Source: AGHT+IGxyLfu+paRIoexaD6++oCBn/XHtUBIo0chldIV2SAMVOqAwfY5RYFRwl6Gb08X8o6pYt8fWuN4GCV6exZuHyU=
X-Received: by 2002:a67:f299:0:b0:446:a2f8:9fe4 with SMTP id
 m25-20020a67f299000000b00446a2f89fe4mr2962206vsk.16.1692225317332; Wed, 16
 Aug 2023 15:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230816-riscv-debug_info_split-v1-1-d1019d6ccc11@kernel.org> <20230816220457.kqzlbiibeomvki4y@google.com>
In-Reply-To: <20230816220457.kqzlbiibeomvki4y@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 16 Aug 2023 15:35:06 -0700
Message-ID: <CAKwvOdnRb1OmLWNWnj5f-r-rqL0=OsBXJV9d7OU3bjXtOLLtiA@mail.gmail.com>
Subject: Re: [PATCH] lib/Kconfig.debug: Restrict DEBUG_INFO_SPLIT for RISC-V
To: Fangrui Song <maskray@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, akpm@linux-foundation.org, conor@kernel.org, 
	trix@redhat.com, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_153524_286941_36E03F42 
X-CRM114-Status: GOOD (  21.63  )
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

T24gV2VkLCBBdWcgMTYsIDIwMjMgYXQgMzowNeKAr1BNIEZhbmdydWkgU29uZyA8bWFza3JheUBn
b29nbGUuY29tPiB3cm90ZToKPgo+IE9uIDIwMjMtMDgtMTYsIE5hdGhhbiBDaGFuY2VsbG9yIHdy
b3RlOgo+ID5XaGVuIGJ1aWxkaW5nIGZvciBBUkNIPXJpc2N2IHVzaW5nIExMVk0gPCAxNCwgdGhl
cmUgaXMgYW4gZXJyb3Igd2l0aAo+ID5DT05GSUdfREVCVUdfSU5GT19TUExJVD15Ogo+ID4KPiA+
ICBlcnJvcjogQSBkd28gc2VjdGlvbiBtYXkgbm90IGNvbnRhaW4gcmVsb2NhdGlvbnMKPiA+Cj4g
PlRoaXMgd2FzIHdvcmtlZCBhcm91bmQgaW4gTExWTSAxNSBieSBkaXNhbGxvd2luZyAnLWdzcGxp
dC1kd2FyZicgd2l0aAo+ID4nLW1yZWxheCcgKHRoZSBkZWZhdWx0KSwgc28gQ09ORklHX0RFQlVH
X0lORk9fU1BMSVQgaXMgbm90IHNlbGVjdGFibGUKPiA+d2l0aCBuZXdlciB2ZXJzaW9ucyBvZiBM
TFZNOgo+ID4KPiA+ICAkIGNsYW5nIC0tdGFyZ2V0PXJpc2N2NjQtbGludXgtZ251IC1nc3BsaXQt
ZHdhcmYgLWMgLW8gL2Rldi9udWxsIC14IGMgL2Rldi9udWxsCj4gPiAgY2xhbmc6IGVycm9yOiAt
Z3NwbGl0LWR3YXJmIGlzIHVuc3VwcG9ydGVkIHdpdGggUklTQy1WIGxpbmtlciByZWxheGF0aW9u
ICgtbXJlbGF4KQo+ID4KPiA+R0NDIHNpbGVudGx5IGhhZCBhIHNpbWlsYXIgaXNzdWUgdGhhdCB3
YXMgcmVzb2x2ZWQgd2l0aCBHQ0MgMTIueC4KPiA+UmVzdHJpY3QgQ09ORklHX0RFQlVHX0lORk9f
U1BMSVQgZm9yIFJJU0MtViB3aGVuIHVzaW5nIExMVk0gb3IgR0NDIDwKPiA+MTIueCB0byBhdm9p
ZCB0aGVzZSBrbm93biBpc3N1ZXMuCj4gPgo+ID5MaW5rOiBodHRwczovL2dpdGh1Yi5jb20vQ2xh
bmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy8xOTE0Cj4gPkxpbms6IGh0dHBzOi8vZ2NjLmdudS5v
cmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTk5MDkwCj4gPlJlcG9ydGVkLWJ5OiBrZXJuZWwg
dGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiA+Q2xvc2VzOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyMzA4MDkwMjA0Ljl5WmZmQldvLWxrcEBpbnRlbC5jb20vCj4gPlNpZ25lZC1v
ZmYtYnk6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4KPiA+LS0tCj4gPlNp
bmNlIHRoaXMgb25seSBpbXBhY3RzIFJJU0MtViwgaXQgc2VlbXMgcmVhc29uYWJsZSB0aGF0IHRo
aXMgd291bGQgZ28KPiA+aW4gdmlhIHRoZWlyIHRyZWUgYnV0IEkgaGF2ZSBhZGRlZCBBbmRyZXcg
aW4gY2FzZSBoZSB3YW50cyB0byB0YWtlIGl0Lgo+ID4tLS0KPiA+IGxpYi9LY29uZmlnLmRlYnVn
IHwgNSArKysrKwo+ID4gMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+ID4KPiA+ZGlm
ZiAtLWdpdCBhL2xpYi9LY29uZmlnLmRlYnVnIGIvbGliL0tjb25maWcuZGVidWcKPiA+aW5kZXgg
ZDY3OTg1MTNhOGMyLi5iZDUxMjc0ZjQ3NzEgMTAwNjQ0Cj4gPi0tLSBhL2xpYi9LY29uZmlnLmRl
YnVnCj4gPisrKyBiL2xpYi9LY29uZmlnLmRlYnVnCj4gPkBAIC0zNTUsNiArMzU1LDExIEBAIGVu
ZGNob2ljZSAjICJDb21wcmVzc2VkIERlYnVnIGluZm9ybWF0aW9uIgo+ID4gY29uZmlnIERFQlVH
X0lORk9fU1BMSVQKPiA+ICAgICAgIGJvb2wgIlByb2R1Y2Ugc3BsaXQgZGVidWdpbmZvIGluIC5k
d28gZmlsZXMiCj4gPiAgICAgICBkZXBlbmRzIG9uICQoY2Mtb3B0aW9uLC1nc3BsaXQtZHdhcmYp
Cj4gPisgICAgICAjIFJJU0MtViBsaW5rZXIgcmVsYXhhdGlvbiArIC1nc3BsaXQtZHdhcmYgaGFz
IGlzc3VlcyB3aXRoIExMVk0gYW5kIEdDQwo+ID4rICAgICAgIyBwcmlvciB0byAxMi54Ogo+ID4r
ICAgICAgIyBodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QvaXNzdWVzLzU2NjQy
Cj4gPisgICAgICAjIGh0dHBzOi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lk
PTk5MDkwCj4gPisgICAgICBkZXBlbmRzIG9uICFSSVNDViB8fCBHQ0NfVkVSU0lPTiA+PSAxMjAw
MDAKClRoYW5rcyBmb3IgdGhlIHBhdGNoLiBJIHdhcyBpbml0aWFsbHkgc3VycHJpc2VkIHRvIHNl
ZSBubyBleHBsaWNpdApjaGVjayBmb3IgTExWTSB2ZXJzaW9uLiAgUmVyZWFkaW5nIHRoZSBjb21t
aXQgZGVzY3JpcHRpb24gYSBmZXcgdGltZXMsCkkgdGhpbmsgaXQgbWFrZXMgc2Vuc2UsIGJ1dCBJ
J20gZ3Vlc3Npbmcgd2UgbWF5IG5lZWQgdG8gcmV3b3JrIHRoaXMKY29uZGl0aW9uIGFnYWluIHNo
b3VsZCB3ZSBldmVudHVhbGx5IGdldCBzcGxpdCBkZWJ1ZyBpbmZvIHdvcmtpbmcgZm9yCnJpc2N2
IGZvciBsbHZtLiAgSSBhbSBsb29raW5nIHRvIGVuYWJsZSBzcGxpdCBkZWJ1ZyBpbmZvIGZvciBr
ZXJuZWxzCmZvciBBbmRyb2lkJ3MgbmV4dCByZWxlYXNlLgoKRmFuZ3J1aSwgYW55IHRob3VnaHRz
IG9uIGZlYXNpYmlsaXR5IGZvciBgLW1yZWxheGAgYW5kIGAtZ3NwbGl0LWR3YXJmYApjb21wb3Nh
YmlsaXR5IGZvciBsbHZtPwoKTGluazogaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9q
ZWN0L2lzc3Vlcy81NjY0MgpSZXZpZXdlZC1ieTogTmljayBEZXNhdWxuaWVycyA8bmRlc2F1bG5p
ZXJzQGdvb2dsZS5jb20+Cgo+ID4gICAgICAgaGVscAo+ID4gICAgICAgICBHZW5lcmF0ZSBkZWJ1
ZyBpbmZvIGludG8gc2VwYXJhdGUgLmR3byBmaWxlcy4gVGhpcyBzaWduaWZpY2FudGx5Cj4gPiAg
ICAgICAgIHJlZHVjZXMgdGhlIGJ1aWxkIGRpcmVjdG9yeSBzaXplIGZvciBidWlsZHMgd2l0aCBE
RUJVR19JTkZPLAo+ID4KPiA+LS0tCj4gPmJhc2UtY29tbWl0OiAyY2NkZDFiMTNjNTkxZDMwNmYw
NDAxZDk4ZGVkYzRiZGNkMDJiNDIxCj4gPmNoYW5nZS1pZDogMjAyMzA4MTYtcmlzY3YtZGVidWdf
aW5mb19zcGxpdC0wNzEzNTcxYTFhYzIKPiA+Cj4gPkJlc3QgcmVnYXJkcywKPiA+LS0KPiA+TmF0
aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPgo+ID4KPgo+IExHVE0gYXMgdGhlIGF1
dGhvciBvZiB0aGUgQ2xhbmcgbWl0aWdhdGlvbgo+IChodHRwczovL2dpdGh1Yi5jb20vbGx2bS9s
bHZtLXByb2plY3QvaXNzdWVzLzU2NjQyKSBhbmQgc2V2ZXJhbCByZWNlbnQKPiBMTFZNIGFzc2Vt
YmxlciBzaWRlIGxpbmtlciByZWxheGF0aW9uIGltcHJvdmVtZW50IChJIGNvbnRpbnVlIHVwZGF0
aW5nCj4gaHR0cHM6Ly9tYXNrcmF5Lm1lL2Jsb2cvMjAyMS0wMy0xNC10aGUtZGFyay1zaWRlLW9m
LXJpc2N2LWxpbmtlci1yZWxheGF0aW9uCj4gYWJvdXQgdGhlIGNvbXBsaWNhdGlvbiBvZiBsaW5r
ZXIgcmVsYXhhdGlvbikuCj4KPiBSZXZpZXdlZC1ieTogRmFuZ3J1aSBTb25nIDxtYXNrcmF5QGdv
b2dsZS5jb20+CgoKCi0tIApUaGFua3MsCn5OaWNrIERlc2F1bG5pZXJzCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
