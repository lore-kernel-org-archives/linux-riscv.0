Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719FAC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 06:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+a6VCOUcsC0S+DX3I0aGOt5vOqNASx20IAOZ3KtgpYE=; b=ulRMxu5i6qekYe
	d8DMsOPS2yVeXfGZ86jmy8ZmHR2CQdVKznVNONZOnjwfZD8hMuepdWp96N4fjyTxENWy1Qp6zPyQX
	QOhtTA0vWQk/CM1tvk6J5YuoLzAQJ2UU/RN0AW8CPiutd3UmfjlgvPrhnGIqneJppANdidJuuIG6w
	iTVS++Qh2vOR43xhxx8/4GvQ40z+EUadfIujcW1j98tBsXefzZzDh4oJTIcznELsVmQuwOKJT3hMI
	01WJW8KROXscniFIh33i3kE54WLzem2ukcZjG4EqF069bLRjVD/b4TW/p5f7adGrrYE5mXRZ7l5PB
	sHGy0FRdRjEwoOBe42Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAO3h-000000089Vz-2NAM;
	Fri, 24 May 2024 06:05:41 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAO3f-000000089VH-3mWm
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 06:05:41 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-df771b6cf71so663499276.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 May 2024 23:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716530737; x=1717135537; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dqf26CfH9Re/+9Pm2biqoGGaxQ7Jt/g4liDQMPY2O3U=;
        b=Fjrp1+ilIg+yji1yMHuaEFa5MVJobM61zWYYgEDV5w+bjv3DzIfsqAq2ngmgr8Mdo3
         jkWHihNtik6jF5F0L19bHq2y4b7rHL/B/7tpKlgtb/UhCpgaQ1AVGWo62qZeHNwvROqK
         pe0+2wAyCsjEwq8JbHEwoMrpaJQLH8BIDqeV5fuwMOoV2TobSdtU8xMZk3wX6AJ+nHer
         uq0WMcgOcV/U8bGQMF+Ke9/yES/elKUwuYxbwq0LGT/stup1uCIRNgSIp58n/+xXpd8C
         ED7ljtC7D3e4OStOP7T0gw8lZiyJ9eqFaJJ8zXVcKxNdq4WAhPwICnsKuXsJTcoWjOQI
         Yb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716530737; x=1717135537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dqf26CfH9Re/+9Pm2biqoGGaxQ7Jt/g4liDQMPY2O3U=;
        b=DIm8h/ZHQhT8ff/JnWhPCcENZxtySFAuEhE0z2OztoqiQZlzc8TqLpgiajWomlQIKZ
         lo5D174KpdZyp1gPynCmI0uwwaSGyxzBQl1hjOu+SdIMA6w1ktHGQRgxCWwfP5x/cLUJ
         mnI23T4TkOooruhINK3WMBEEbTNR+wpI9gAeMLlzRd4NckNHfjJgL/zjD/PtLZkVvxih
         c2WqAFUnsGov0+doXTvT7chWCBb93rdgbQcwFZjT0Sd2EAKUrbssZON6+BT90yzsgD+r
         KXviKnUn9TOHs6mq552LfnUwKJoRO7nKgztc/18aVOwMUKgKjGnr7ko7BwqRqauO/G//
         HmXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVTZTA/Sb7AZqExBSRaXDgWkz6TaS12ClLNFBtllzQSVOp+zCHfzkxEJSBg4uzPRb6E9zOzOs3Riom5/ZRq2GCK/B8IClMWa2GwWU0YGyF
X-Gm-Message-State: AOJu0Yykh7DDDYcpnChZGrqjUsuN1SyRQWsWVt8UG+Uxox663+TEvcch
	wQLk7YAxjpZmIocIOHElqUgWXR+IDOMdGBJ4vg3TZ/6WT+VK31iw54urqdt9rdOn2rzOH2jUGG6
	C+imigJWmhc59Wxy73uuXOcqSLkYzHeRE
X-Google-Smtp-Source: AGHT+IGee+Qt9uaBo/fX2ga4vsycCd469jfi6gO7/v7NWE/u6xNyiw74Kwq3zT2+ptn4AxloeMBeekMiROWhGvoeI54=
X-Received: by 2002:a25:8c03:0:b0:de6:1494:f144 with SMTP id
 3f1490d57ef6-df7721a7766mr1317354276.28.1716530737566; Thu, 23 May 2024
 23:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240523094325.3514-1-dqfext@gmail.com> <DM8PR11MB57515218B467E28FFDDB6703B8F52@DM8PR11MB5751.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB57515218B467E28FFDDB6703B8F52@DM8PR11MB5751.namprd11.prod.outlook.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Fri, 24 May 2024 14:05:20 +0800
Message-ID: <CALW65jaHrd_AxhpouVm8rq6zTOPeRWMHv029k0cThVtTNDAaCA@mail.gmail.com>
Subject: Re: [PATCH] riscv: hweight: relax assembly constraints
To: "Wang, Xiao W" <xiao.w.wang@intel.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_230539_961512_EE005723 
X-CRM114-Status: GOOD (  17.67  )
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

SGksCgpPbiBGcmksIE1heSAyNCwgMjAyNCBhdCA5OjAy4oCvQU0gV2FuZywgWGlhbyBXIDx4aWFv
Lncud2FuZ0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4KPgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0KPiA+IEZyb206IFFpbmdmYW5nIERlbmcgPGRxZmV4dEBnbWFpbC5jb20+Cj4gPiBTZW50
OiBUaHVyc2RheSwgTWF5IDIzLCAyMDI0IDU6NDMgUE0KPiA+IFRvOiBQYXVsIFdhbG1zbGV5IDxw
YXVsLndhbG1zbGV5QHNpZml2ZS5jb20+OyBQYWxtZXIgRGFiYmVsdAo+ID4gPHBhbG1lckBkYWJi
ZWx0LmNvbT47IEFsYmVydCBPdSA8YW91QGVlY3MuYmVya2VsZXkuZWR1PjsgbGludXgtCj4gPiBy
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4g
PiBDYzogV2FuZywgWGlhbyBXIDx4aWFvLncud2FuZ0BpbnRlbC5jb20+OyBRaW5nZmFuZyBEZW5n
Cj4gPiA8cWluZ2ZhbmcuZGVuZ0BzaWZsb3dlci5jb20uY24+Cj4gPiBTdWJqZWN0OiBbUEFUQ0hd
IHJpc2N2OiBod2VpZ2h0OiByZWxheCBhc3NlbWJseSBjb25zdHJhaW50cwo+ID4KPiA+IEZyb206
IFFpbmdmYW5nIERlbmcgPHFpbmdmYW5nLmRlbmdAc2lmbG93ZXIuY29tLmNuPgo+ID4KPiA+IHJk
IGFuZCBycyBkb24ndCBoYXZlIHRvIGJlIHRoZSBzYW1lLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IFFpbmdmYW5nIERlbmcgPHFpbmdmYW5nLmRlbmdAc2lmbG93ZXIuY29tLmNuPgo+ID4gLS0tCj4g
PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hcmNoX2h3ZWlnaHQuaCB8IDggKysrKy0tLS0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FyY2hfaHdlaWdodC5oCj4gPiBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXJjaF9od2VpZ2h0LmgKPiA+IGluZGV4IDg1YjJjNDQz
ODIzZS4uNjEzNzY5YjljZGM5IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9hcmNoX2h3ZWlnaHQuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hcmNoX2h3
ZWlnaHQuaAo+ID4gQEAgLTI2LDkgKzI2LDkgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB1bnNp
Z25lZCBpbnQKPiA+IF9fYXJjaF9od2VpZ2h0MzIodW5zaWduZWQgaW50IHcpCj4gPgo+ID4gICAg
ICAgYXNtICgiLm9wdGlvbiBwdXNoXG4iCj4gPiAgICAgICAgICAgICIub3B0aW9uIGFyY2gsK3pi
YlxuIgo+ID4gLSAgICAgICAgICBDUE9QVyAiJTAsICUwXG4iCj4gPiArICAgICAgICAgIENQT1BX
ICIlMCwgJTFcbiIKPiA+ICAgICAgICAgICAgIi5vcHRpb24gcG9wXG4iCj4gPiAtICAgICAgICAg
IDogIityIiAodykgOiA6KTsKPiA+ICsgICAgICAgICAgOiAiPXIiICh3KSA6ICJyIiAodykgOik7
Cj4KPiBUaGUgYWJvdmUgY29kZSBwaWVjZSB0YWtlcyB2YXJpYWJsZSAidyIgYXMgYm90aCBpbnB1
dCBhbmQgb3V0cHV0LCBzbyBpbnR1aXRpdmVseSwgdGhlIHByZXZpb3VzCj4gcGF0Y2ggbWFkZSBy
cyBhbmQgcmQgdGhlIHNhbWUuCj4gVGhvdWdoIHJzIGFuZCByZCBjYW4gYmUgZGlmZmVyZW50LCBk
byB5b3Ugc2VlIHBlcmZvcm1hbmNlIGRpZmZlcmVuY2Ugd2l0aCB0aGlzIGNoYW5nZT8KPiBPciBh
bnkgYW5hbHlzaXMgZnJvbSBhc3NlbWJseSBkdW1wPwoKQnkgbWFraW5nIHJzIGFuZCByZCBkaWZm
ZXJlbnQsIHdlIGNhbiBzYXZlIHNvbWUgYG12YCBpbnN0cnVjdGlvbnMuCgo+Cj4gQlJzLAo+IFhp
YW8KPgo+ID4KPiA+ICAgICAgIHJldHVybiB3Owo+ID4KPiA+IEBAIC01Nyw5ICs1Nyw5IEBAIHN0
YXRpYyBfX2Fsd2F5c19pbmxpbmUgdW5zaWduZWQgbG9uZwo+ID4gX19hcmNoX2h3ZWlnaHQ2NChf
X3U2NCB3KQo+ID4KPiA+ICAgICAgIGFzbSAoIi5vcHRpb24gcHVzaFxuIgo+ID4gICAgICAgICAg
ICAiLm9wdGlvbiBhcmNoLCt6YmJcbiIKPiA+IC0gICAgICAgICAgImNwb3AgJTAsICUwXG4iCj4g
PiArICAgICAgICAgICJjcG9wICUwLCAlMVxuIgo+ID4gICAgICAgICAgICAiLm9wdGlvbiBwb3Bc
biIKPiA+IC0gICAgICAgICAgOiAiK3IiICh3KSA6IDopOwo+ID4gKyAgICAgICAgICA6ICI9ciIg
KHcpIDogInIiICh3KSA6KTsKPiA+Cj4gPiAgICAgICByZXR1cm4gdzsKPiA+Cj4gPiAtLQo+ID4g
Mi4zNC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
