Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4DEC77B7C
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 02:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDd/osFe11NhHB4qcq7JThoDoynCSIIqZQ1RWx9qxsw=; b=VCIZiMGzxQGVSJ
	ylTdXhIdFwzjFjuhZ+2AVSSPz3dEK15VIG47U+t32gaTqXooC9c0N7o2Ib+ruGyhvHeYadAVOuVkI
	633bxR1S5onusKgHfyaxeTGygTYvFznej9rB7ws77tHj4UMffJ2jaVJKUlPcWPZE5KDJn4tn0Rz5Y
	YIhCi1gBW7CR76PeJl47hpvJvNQQjdfRkvskBCGO+uuNuXtePIzm62s6ghG+K2AyomVEOMmlF+8z+
	qsO44p9AdRqGbhRbGcAlbvsaoEuH4WTDq69Yo0H/isRuqTzP9+EiM8sPOJAPZ3M5vW/kSxnhNBT+b
	lsFjSFKCxpURAXKvayLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0vXM-00581g-18;
	Mon, 22 May 2023 02:44:40 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0vXK-00581F-15
	for linux-riscv@lists.infradead.org;
	Mon, 22 May 2023 02:44:39 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-53487355877so2183882a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 21 May 2023 19:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684723477; x=1687315477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWDVQ2z9KbD5MMR01fZ/nUn7dd6pMxIl5hvJiDhQHvo=;
        b=UaHBoDKS854frBK/ZKm/R5ak1GHqwLRbN0J3coRoqw85jDzTznan3Fh68I9q/yJBSW
         aq3sxoWgOF2YZcpy+SO29NYWNygI9aypJTjTDDuGIHXYy4Hmo6n0saTKnvLpgafSE+ti
         OFt6MoYdT+7QtRBcSKSL8crqbuTBkBxkcFmgj3OVi4G0STdrKDwEs2WMkxtJySmH2/RH
         PNsSHbRO6SQNegR7LYf2TbmKVPniZkq2Tki8kTRTlJ1qNvqoKMMLn69EiuQXlw8v85cu
         AySeapHgW/ZzU/NHYy8hDzQpXQJNmJ2l1W3LryPqDUZWKV4nEZTKFjqtU1MiBgjfAD/h
         ie1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684723477; x=1687315477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWDVQ2z9KbD5MMR01fZ/nUn7dd6pMxIl5hvJiDhQHvo=;
        b=eqKML6XJ2ia4FCPjJzfcXysSf20oox8MPdkOudi6w38bXljNBe/wO0riEwdxxSoC74
         oG13sXSYeki3U33eR9gc4FpGu8jOM9XuNkxgurSNwOIo6dxryXkaBtHdX/4k9QM6w5MT
         7yyKLCjtxqZXvR+aycHXby2ZB4GsMYbsz3norY59sz/tfPuMROnxbXRFGGXznsw2VJc2
         ishQoCfvhhml2frzfjdqW8LdOym0JHcMTeqqo2pd1bKNNIZnufEREw4RttNpxvRdZ/Bf
         5qj+HMKY/vjG2KAhfy1Va5kL4Ho+R5G6p3HS1rpYpII2PIpzBkNFeI9iAgYO4e7o1B3P
         nQxQ==
X-Gm-Message-State: AC+VfDztr4QsIy3u+PrlKjVzj0YRKE7wPGXD0TGf0ArdFdb4UKQel9F1
	AGNZZw4wDNANVxelEPlaOE5CtPzUhRwA+9BdLUv2aibMZWo=
X-Google-Smtp-Source: ACHHUZ6EDNCD2w7OjNMSQxovKBobBHr0OevXHMTn+rnQzJVWq4xGtQU/acDIDmYoH5whN3zuJBgRRH97gwDGQs2BrXQ=
X-Received: by 2002:a17:902:daca:b0:1ac:859a:5b5a with SMTP id
 q10-20020a170902daca00b001ac859a5b5amr13057446plx.0.1684723476850; Sun, 21
 May 2023 19:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230519102908.253458-1-suagrfillet@gmail.com>
 <9a274a44b61345e8aba747a44250c4d8@EXMBX066.cuchost.com> <20230519-clarinet-collar-ba2c0fa37e11@wendy>
 <20230519-roundup-legwarmer-e26b31db3123@spud>
In-Reply-To: <20230519-roundup-legwarmer-e26b31db3123@spud>
From: Song Shuai <suagrfillet@gmail.com>
Date: Mon, 22 May 2023 02:44:24 +0000
Message-ID: <CAAYs2=iF9P_pXwNXRitXmk9pUAB7n8wMnNkqYAh-SMh44kYqDQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: hibernation: Remove duplicate call of suspend_restore_csrs
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, JeeHeng Sia <jeeheng.sia@starfivetech.com>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Mason Huo <mason.huo@starfivetech.com>, 
	Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Song Shuai <songshuaishuai@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_194438_400176_7D200082 
X-CRM114-Status: GOOD (  24.84  )
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

Q29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiDkuo4yMDIz5bm0NeaciDE55pel5ZGo5LqU
IDIwOjA35YaZ6YGT77yaCj4KPiBPbiBGcmksIE1heSAxOSwgMjAyMyBhdCAxMjoyODowN1BNICsw
MTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiBIZXksCj4gPgo+ID4gT24gRnJpLCBNYXkgMTks
IDIwMjMgYXQgMTE6MTQ6MjdBTSArMDAwMCwgSmVlSGVuZyBTaWEgd3JvdGU6Cj4gPgo+ID4gPiA+
IFRoZSBzdXNwZW5kX3Jlc3RvcmVfY3NycyBpcyBjYWxsZWQgaW4gYm90aCBfX2hpYmVybmF0ZV9j
cHVfcmVzdW1lCj4gPiA+ID4gYW5kIHRoZSBgZWxzZWAgb2Ygc3Vic2VxdWVudCBzd3N1c3BfYXJj
aF9zdXNwZW5kLgo+ID4gPiA+Cj4gPiA+ID4gUmVtb3ZpbmcgdGhlIGZpcnN0IGNhbGwgbWFrZXMg
Ym90aCBzdXNwZW5kX3tzYXZlLHJlc3RvcmV9X2NzcnMKPiA+ID4gPiBsZWZ0IGluIHN3c3VzcF9h
cmNoX3N1c3BlbmQgZm9yIGNsZWFuIGNvZGUuCj4KPiBJdCB0b29rIG1lIGVtYmFycmFzc2luZ2x5
IGxvbmcgdG8gd3JhcCBteSBoZWFkIGFyb3VuZCB0aGUgY29udHJvbCBmbG93Cj4gaGVyZSBhZ2Fp
bi4gSSdtIG5vdCBzdXJlIHRoYXQgSSBhZ3JlZSB3aXRoIHlvdSB0aGF0IHNwbGl0dGluZyB0aGUg
Y2FsbHMKPiBiZXR3ZWVuIGFzbSAmIGMgaXMgY2xlYW5lciwgYnV0IHdoYXRldmVyOgo+IFJldmll
d2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+Cj4gPiA+
ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTb25nIFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5j
b20+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogU29uZyBTaHVhaSA8c29uZ3NodWFpc2h1YWlAdGlu
eWxhYi5vcmc+Cj4gPgo+ID4gQlRXLCB3aHkgdGhlIHR3byBlbWFpbCBhZGRyZXNzZXM/IFRoZSB0
aW55bGFiIG9uZSBoZXJlIHNlZW1zIGVudGlyZWx5Cj4gPiByZWR1bmRhbnQgLSB1bmxlc3MgaXQg
aXMgeW91ciBlbXBsb3llciwgaW4gd2hpY2ggY2FzZSBzaG91bGQgaXQgYmUgdGhlCj4gPiBvbmx5
IFNvQiBhZGRyZXNzICYgYWxzbyBpbiB0aGUgYXV0aG9yIGZpZWxkPwo+Cj4gRGVqYSB2dSB3aXRo
IG15IHF1ZXN0aW9uaW5nIHlvdXIgZW1haWwgYWRkcmVzcywgYnV0IGRvZXMgeW91cgo+IHRpbnls
YWIgYWRkcmVzcyBhY3R1YWxseSByZXBlYXQgInNodWFpIj8KPgpZZXMsIHRoYXQncyBteSBmdWxs
IG5hbWUuCkFzIHlvdSBub3RpY2VkLCBJJ20gc3dpdGNoaW5nIG15IGVtYWlsIGZyb20gR21haWwg
dG8gVGlueWxhYiBidXQgZGlkCnNvbWV0aGluZyB3cm9uZy4KVGhhbmtzIGZvciB5b3VyIGNvcnJl
Y3Rpb24sIEknbGwgcmUtc2VuZCB0aGlzIHBhdGNoIHdpdGggeW91cgpzdWdnZXN0aW9ucyBhcHBs
aWVkLgoKPiA+IEFsc28sIEZpeGVzIHRhZz8KPiA+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGFyY2gv
cmlzY3Yva2VybmVsL2hpYmVybmF0ZS1hc20uUyB8IDEgLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBkZWxldGlvbigtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL2hpYmVybmF0ZS1hc20uUyBiL2FyY2gvcmlzY3Yva2VybmVsL2hpYmVybmF0ZS1hc20u
Uwo+ID4gPiA+IGluZGV4IDVjNzY2NzFjN2UxNS4uZDY5OGRkN2RmNjM3IDEwMDY0NAo+ID4gPiA+
IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2hpYmVybmF0ZS1hc20uUwo+ID4gPiA+ICsrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL2hpYmVybmF0ZS1hc20uUwo+ID4gPiA+IEBAIC0yOCw3ICsyOCw2IEBA
IEVOVFJZKF9faGliZXJuYXRlX2NwdV9yZXN1bWUpCj4gPiA+ID4KPiA+ID4gPiAgIFJFR19MICAg
YTAsIGhpYmVybmF0ZV9jcHVfY29udGV4dAo+ID4gPiA+Cj4gPiA+ID4gLSBzdXNwZW5kX3Jlc3Rv
cmVfY3Nycwo+ID4gPiA+ICAgc3VzcGVuZF9yZXN0b3JlX3JlZ3MKPiA+Cj4gPiA+IEdvb2QgY2F0
Y2guIFRoaXMgZnVuY3Rpb24gaXMgaW52b2tlZCB0d2ljZSB0byByZXN0b3JlIHRoZSBDU1JzLgo+
ID4gPiBJIGFtIGdvb2Qgd2l0aCByZW1vdmluZyB0aGlzIGZ1bmN0aW9uIGZyb20gaGVyZS4KPiA+
Cj4gPiBJZiB0aGF0J3MgYSByZXZpZXcsIHRoZW4gcGxlYXNlIGVpdGhlciBnaXZlIGFuIFItYiBv
ciBBLWIgdGFnIDopCj4gPgo+ID4gVGhhbmtzLAo+ID4gQ29ub3IuCj4KPgoKCi0tIApUaGFua3Ms
ClNvbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
