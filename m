Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C715C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Feb 2022 01:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hrXV0ffuzd/hj2GSrqUnabOE2lleVAQ0ky4cTrKzb1c=; b=GUiBo8hvV+ng+D
	xtEDRxwZgNtnyAdY89jiBeMfTmoHoPbKKX1EWC9W414nSvuIbQVBkcLb7Gtcrz6kMXHrr1/Y9e08c
	mwV6bZ7EzA9bd2FB+DNQjLV++7/EfUsOu60vdjZvAErT7UaLtT1ZSwGXyJ4+MTRo1f3bS8XzWfiqq
	6iyrjELTC/Elh/qEQ90brCxrJyZugfMTy+A4DRZ0GwCSKyKIJ7YlxBRrjMMn/n6PwY06Q4cpCWQ3k
	q9MOxSeIvdiAvX4HXFV+c1lYKIbN93n9szOpk8ThS+DRge/4Udr3NXaFneO9f4RpsmHjsN82Jk5GE
	0JYmwrh1VOgL5hAi2l3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nILBn-005SNL-6k; Fri, 11 Feb 2022 01:57:35 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nILBi-005SMu-M7
 for linux-riscv@lists.infradead.org; Fri, 11 Feb 2022 01:57:32 +0000
Received: by mail-yb1-xb36.google.com with SMTP id v186so20845479ybg.1
 for <linux-riscv@lists.infradead.org>; Thu, 10 Feb 2022 17:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AfM/0Cb58q6GUcC0GUIZYtPjVsr66lYC74fJRtgxODI=;
 b=EnNCJZyXUquzo2MhBkvCK0qbobE9W87IWecoDS+rL4un+opt85eXFhJHJdCsslAAjx
 vElioYlY8OIHwQO4p5btZ0Q4jHrOejB0Y80AOqNDO2Yc+hxPN32LOA3Im7+SIOIunSkW
 qf7JLLSDFXR1SDKGYc27cZntGo/Mldylw6Pg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AfM/0Cb58q6GUcC0GUIZYtPjVsr66lYC74fJRtgxODI=;
 b=52ZqijyoUVvPHUCDJe29LDlBF4/G5/p4KtL8fDeUk5jFTxgVTDADThX1lOki2iRy+Q
 JyNidXTPbYa4sN7R3s/LzBipXnwiF/ADlcCQqVS17Aq7R8TkC2MLndjdn7qY2+NDjCbK
 Ppe1T6Ieh49c9GyjkiQ++Oi9dA6AMIBHyjB3WZGFxs5pUr71+ilgFXg0q1jDQMrtjvcU
 TsLMwK7WDLpodIJ227P7LoIu4MDS/C2IqaGBQg8lxuaPS/NDTRNOki21Cq46wKN6oXfO
 1yd6vg+2bgRUhevKeoi1L8+5RUNmuvNVZXtKRKuSUfYabI7SI6ZkWoCPkJKASssw9do7
 p/uA==
X-Gm-Message-State: AOAM533OBQxXfnLJDxvT/FKXiiTThgKL4itudzhg24K/m0kW2ofekD5O
 zJgpjXAXquDCE3gLbx3RqzHuAJRPS/GRBfkHro30orY63g==
X-Google-Smtp-Source: ABdhPJyiFZ6T4FoqoVQz/JR5+sOYmy012dRZdQn9sj6qa2V2tvtDR13uVkUFSQMHhHHw5byKl0LHTAU/kbr5o1PY5uc=
X-Received: by 2002:a81:b148:: with SMTP id p69mr10549545ywh.402.1644544649729; 
 Thu, 10 Feb 2022 17:57:29 -0800 (PST)
MIME-Version: 1.0
References: <20220209123800.269774-1-heiko@sntech.de>
 <20220209123800.269774-9-heiko@sntech.de>
 <CAOnJCULe_5v6cb_JcoPKf-UD3bVze1U=jaYeLTsMu7pFigde+A@mail.gmail.com>
 <2532021.2vfPgEiFAl@diego>
In-Reply-To: <2532021.2vfPgEiFAl@diego>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 10 Feb 2022 17:57:19 -0800
Message-ID: <CAOnJCUJJaPS_U3Hqg-YHT2gVMJ243L=070E7HRXEpt3uPga+cQ@mail.gmail.com>
Subject: Re: [PATCH v6 08/14] riscv: move boot alternatives to a slightly
 earlier position
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Wei Fu <wefu@redhat.com>, liush <liush@allwinnertech.com>,
 Guo Ren <guoren@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Drew Fustini <drew@beagleboard.org>, 
 Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime@cerno.tech>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 Xinhaoqu <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>, 
 Nick Kossifidis <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_175730_769839_79494CD4 
X-CRM114-Status: GOOD (  33.81  )
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

T24gVGh1LCBGZWIgMTAsIDIwMjIgYXQgNToxMSBQTSBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPgo+IEhpIEF0aXNoLAo+Cj4gQW0gRG9ubmVyc3RhZywgMTAuIEZlYnJ1
YXIgMjAyMiwgMjM6NDI6MzUgQ0VUIHNjaHJpZWIgQXRpc2ggUGF0cmE6Cj4gPiBPbiBXZWQsIEZl
YiA5LCAyMDIyIGF0IDQ6MzkgQU0gSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IE1vdmUgdGhlIGFwcGxpY2F0aW9uIG9mIGJvb3QgYWx0ZXJuYXRpdmVz
IHRvIHNvY19lYXJseV9pbml0KCkuCj4gPiA+IFRoaXMgYWxsb3dzIHRvIGNhdGNoIG1vcmUgZ2Vu
ZXJpYyBjYXNlcyBvZiBjb2RlIG5lZWRpbmcgcGF0Y2hlcwo+ID4gPiB0aGFuIGRvaW5nIGl0IGlu
IHNtcF9wcmVwYXJlX2Jvb3RfY3B1KCkgYW5kIGFsc28gbWFrZXMgaXQgYWN0dWFsbHkKPiA+ID4g
d29yayBpZiBDT05GSUdfU01QIGlzIGRpc2FibGVkIGZvciB3aGF0ZXZlciByZWFzb24uCj4gPiA+
Cj4gPiA+IFRoZSBwb3NpdGlvbiBpcyBjaG9zZW4gbWFpbmx5IGFzIGl0IGlzIGJlZm9yZSB0aGUg
YWN0dWFsIHNvYyBlYXJseQo+ID4gPiBpbml0IHJ1bnMgYnV0IGFsc28gYWxyZWFkeSBhbGxvd3Mg
YWNjZXNzaW5nIHRoZSBkZXZpY2V0cmVlCj4gPiA+IHZpYSBmZHRfKiBmdW5jdGlvbnMuCj4gPiA+
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4g
PiA+IC0tLQo+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TICAgIHwgMiArKwo+ID4gPiAg
YXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jIHwgMiAtLQo+ID4gPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKPiA+
ID4gaW5kZXggMjM2M2I0MzMxMmZjLi4wZTFiYjk3Zjk3NDkgMTAwNjQ0Cj4gPiA+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFk
LlMKPiA+ID4gQEAgLTEwLDYgKzEwLDcgQEAKPiA+ID4gICNpbmNsdWRlIDxhc20vdGhyZWFkX2lu
Zm8uaD4KPiA+ID4gICNpbmNsdWRlIDxhc20vcGFnZS5oPgo+ID4gPiAgI2luY2x1ZGUgPGFzbS9w
Z3RhYmxlLmg+Cj4gPiA+ICsjaW5jbHVkZSA8YXNtL2FsdGVybmF0aXZlLmg+Cj4gPiA+ICAjaW5j
bHVkZSA8YXNtL2Nzci5oPgo+ID4gPiAgI2luY2x1ZGUgPGFzbS9jcHVfb3BzX3NiaS5oPgo+ID4g
PiAgI2luY2x1ZGUgPGFzbS9od2NhcC5oPgo+ID4gPiBAQCAtMzQxLDYgKzM0Miw3IEBAIGNsZWFy
X2Jzc19kb25lOgo+ID4gPiAgICAgICAgIGNhbGwga2FzYW5fZWFybHlfaW5pdAo+ID4gPiAgI2Vu
ZGlmCj4gPiA+ICAgICAgICAgLyogU3RhcnQgdGhlIGtlcm5lbCAqLwo+ID4gPiArICAgICAgIGNh
bGwgYXBwbHlfYm9vdF9hbHRlcm5hdGl2ZXMKPiA+Cj4gPiBEbyB5b3UgcmVhbGx5IG5lZWQgdGhp
cyBlYXJseSA/Cj4gPiBpZiBub24tc21wIGNvbmZpZ3VyYXRpb24gaXMgdGhlIG9ubHkgb3B0aW9u
LCBDYW4geW91IGRvIGl0IGluCj4gPiBzZXR1cF9hcmNoKCkgYWZ0ZXIgcmlzY3ZfZmlsbF9od2Nh
cCgpIGlzIGNhbGxlZCA/Cj4KPiBUaGUgaXNzdWUgSSBzZWUgaXMsIHdlIHdlIGhhdmUgdGhlIHNv
Y19lYXJseV9pbml0IFswXSBydW5uaW5nCj4gZGlyZWN0bHkgYWZ0ZXIgdGhpcyBhbmQgdGhlIG9u
ZSB1c2VyIEkgc2VlIFsxXSBhbHJlYWR5IHdhbnRzIHRvCj4gaW9yZW1hcCBpby1tZW1vcnkgYXQg
dGhpcyBzdGFnZS4KPgoKS2VuZHJ5dGUgaXMgYWx3YXlzIGEgc3BlY2lhbCBjYXNlLiBJSVJDLCBp
b3JlbWFwIGlzIGRvbmUgc28gZWFybHkKc28gdGhhdCBpdCBjYW4gdXNlIGFsbCA4TUIgb2YgU1JB
TS4KCj4gU28ganVkZ2luZyBieSB0aGUgZmFjdCB0aGF0IG1vcmUgZWFybHktaW5pdHMgd2lsbCBn
ZXQgYWRkZWQKPiBpbiB0aGUgZnV0dXJlIEkgZG8gZ3Vlc3Mgd2Ugc2hvdWxkJ3ZlIHNldCB1cCB0
aGUgaW8tbWVtb3J5Cj4gcGFnZS10eXBlIGJ5IHRoaXMgcG9pbnQ/Cj4KCkkgaG9wZSB0aGVyZSB3
b24ndCBiZSA6KS4gRm9yIGFueSBub3JtYWwgbW11IGNhcGFibGUgU29DLCBJIGRvbid0CnNlZSB3
aHkgdGhhdCB3b3VsZCBiZSByZXF1aXJlZC4KCj4KPiBIZWlrbwo+Cj4gWzBdIGh0dHBzOi8vZWxp
eGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvYXJjaC9yaXNjdi9rZXJuZWwvc29j
LmMjTDE0Cj4gWzFdIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3Vy
Y2UvZHJpdmVycy9zb2MvY2FuYWFuL2syMTAtc3lzY3RsLmMjTDY2Cj4KPiA+IEJ5IGRvaW5nIHRo
YXQsIHdlIGNhbiB1bmlmeSB0aGUgY3B1IGZlYXR1cmUgcHJvYmluZyBhbmQgeW91IGRvbid0IG5l
ZWQKPiA+IGEgc2VwYXJhdGUgRFQgcGFyc2luZyBqdXN0IGZvciBzdnBibXQuCj4gPgo+ID4gPiAg
ICAgICAgIGNhbGwgc29jX2Vhcmx5X2luaXQKPiA+ID4gICAgICAgICB0YWlsIHN0YXJ0X2tlcm5l
bAo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jCj4gPiA+IGluZGV4IGE2ZDEzZGNhMTQwMy4uZjFl
NDk0OGE0YjUyIDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMK
PiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jCj4gPiA+IEBAIC0zMiw3ICsz
Miw2IEBACj4gPiA+ICAjaW5jbHVkZSA8YXNtL3NlY3Rpb25zLmg+Cj4gPiA+ICAjaW5jbHVkZSA8
YXNtL3NiaS5oPgo+ID4gPiAgI2luY2x1ZGUgPGFzbS9zbXAuaD4KPiA+ID4gLSNpbmNsdWRlIDxh
c20vYWx0ZXJuYXRpdmUuaD4KPiA+ID4KPiA+ID4gICNpbmNsdWRlICJoZWFkLmgiCj4gPiA+Cj4g
PiA+IEBAIC00MSw3ICs0MCw2IEBAIHN0YXRpYyBERUNMQVJFX0NPTVBMRVRJT04oY3B1X3J1bm5p
bmcpOwo+ID4gPiAgdm9pZCBfX2luaXQgc21wX3ByZXBhcmVfYm9vdF9jcHUodm9pZCkKPiA+ID4g
IHsKPiA+ID4gICAgICAgICBpbml0X2NwdV90b3BvbG9neSgpOwo+ID4gPiAtICAgICAgIGFwcGx5
X2Jvb3RfYWx0ZXJuYXRpdmVzKCk7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICB2b2lkIF9faW5pdCBz
bXBfcHJlcGFyZV9jcHVzKHVuc2lnbmVkIGludCBtYXhfY3B1cykKPiA+ID4gLS0KPiA+ID4gMi4z
MC4yCj4gPiA+Cj4gPiA+Cj4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4gPiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPiA+Cj4gPgo+ID4KPiA+Cj4KPgo+Cj4KCgot
LSAKUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
