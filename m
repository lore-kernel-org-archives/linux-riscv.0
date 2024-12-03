Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9355E64AA3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 13:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OD6BecAvS+7T9jfWXxlVuGxkj2H2YQQGQsykjA1A4U=; b=k/aHZVuLGfaefX
	/7dQRuCOLbWDtwDXiQaLeUZ5QbJHZ4388YLPa2L3cTTmx2+O9eBfRRnN4nZkd/104tnZKRlKMjM5K
	9ebjXNx3NMToHXp93+zzG1aBp1Uq2Pj4frzkqtVNuDtv/gJELIJ0Kd6VSgD444IC5o8ODNt6IfmtG
	sbUfy3MQaRIwi9ZUzevSC6lQYiKt6nAO/B1iLPJB7ANv5UOjMmI3TdjlHnaxcFLDDvc3C/reMEBp0
	iJhOtEI1h5FV1yLl+jXE0LqH9wZ42wvPnq+NkU3Q54OtDo5828WTVnxl2ck7c2pv44ZaPl5cHjhcl
	iOhww5Fh1zE5qrXrGMEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIT6v-00000009dVv-2FRG;
	Tue, 03 Dec 2024 13:38:41 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIT68-00000009dIh-1nfC
	for linux-riscv@lists.infradead.org;
	Tue, 03 Dec 2024 13:37:53 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2e59746062fso4350760a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Dec 2024 05:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733233066; x=1733837866; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkDSy/og10q+Zv9hHO6LOGn9F3ogfIv993ECev/acMM=;
        b=T1k2bLvlLyv1Kdwm7uZPHm+DjEdBlN4OzUnOObGJ7ot4ipkFpQtnlDvpLMqMR+HZna
         f9ZLOxi2moxBm/gdcc0avKVJ1aIqaJSgvje1kd4Ft9CQf4HqMo4+3Iju8RsI8AeeV08h
         1w7u+275B66zBasimgiJgitbmD8znCz0a/khqZW8d/14iu/z41rnHQx9wRvL/uSKLwBw
         UEujJgRD8yDjQke5CuSaiV7ckoep+8XuFfgxQI6eFp1dlNaAaisHXJ6reDg4SS/2DZU+
         XIw/B+Gs1vdmSCYL2Jd6RJfGbE0lT4lK3sjvzuAohuWGtgS1YEfbo+NFPovxzhceT63b
         zCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233066; x=1733837866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GkDSy/og10q+Zv9hHO6LOGn9F3ogfIv993ECev/acMM=;
        b=rjXg3RX8eLQQkbLEOju2xhCxHJ7mv2ws0VxOswylOspgkPacnBHNexnCZJv9UiUuoC
         LdG/xEt6w5D/ZaVIoyVBWgOeLgsZhaf09fIm2bB30cPo4BTkTE/vl+LYyHvC1if7PGAy
         XqOcFZFEaUSinoZz9fBmlyYJTRJ/5T8+cLKtBlD3zEOtim2uF5Qqzy2mR/Lf+CtQCvcN
         PMgwMLJcIZwPT6BS8MKwLsKmEHg0GzA4FR7Sd7Yhos2HpzduUez02wp99bdC3cVljGnu
         mUOIDKQOi5g7zWBilTgaTpzrIv1GWGiwYw9TApXjcWhjMFvkp4lI88O4CafhUOkzH6J5
         es/A==
X-Forwarded-Encrypted: i=1; AJvYcCVM6UTf/ood4L9Dfl+4zrZGqY7GxOWkKhddtnqNiCLBRB8iAIIvCMxfaALmRVVkKucHWm6nnAHHI/9WIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGvoQcvqu1tCQdFHbDBrX2J/9t6Y7b73EwuFpQz7VBI9hQXJNb
	27dXSzmvAv/pdYIeNEfZLjVD2NrAN4GREzZo65t6HiTZlOmuLd4dWmlJgyTTIjRo1q3oDJp0qaK
	jcV9hXgfDAnlavn5NFldKsbDz296tFS9R9nkMEg==
X-Gm-Gg: ASbGnctoATio2ieEo2fiYZ6FuxJ2daEAJkiVnHew31YlPwNqvlSWX+vSNUUs6NcsVZV
	js75GTuoXZSk7ZGQsw2m5Z2aKQOU2qayw5DlwewJawC26
X-Google-Smtp-Source: AGHT+IFmL3luaw1fnUdkh1ethVTZLBB6zltFLUW1aXb5eColAWRa6bIo8F/gj0oAA0w7i3i8cjizJlLYIm1495p+Zcw=
X-Received: by 2002:a17:90b:3907:b0:2ee:fc08:1bc1 with SMTP id
 98e67ed59e1d1-2ef01275b48mr3480962a91.37.1733233065824; Tue, 03 Dec 2024
 05:37:45 -0800 (PST)
MIME-Version: 1.0
References: <20241202101601.48284-1-luxu.kernel@bytedance.com> <871pypq942.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <871pypq942.fsf@all.your.base.are.belong.to.us>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Tue, 3 Dec 2024 21:37:35 +0800
Message-ID: <CAPYmKFvoEwec7NfMyaf=oO9jQz2o9Bvebunh=cvbNO_ESOnk5A@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] riscv: mm: Fix alignment of phys_ram_base
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	lihangjing@bytedance.com, xieyongji@bytedance.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_053752_715441_118CE534 
X-CRM114-Status: GOOD (  26.21  )
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

T24gVHVlLCBEZWMgMywgMjAyNCBhdCA3OjUw4oCvUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4gd3Jp
dGVzOgo+Cj4gPiBUaGlzIGNvbW1pdCBmaXhlcyB0aGUgYWxpZ25tZW50IG9mIHBoeXNfcmFtX2Jh
c2UgaW4gUklTQy1WLgo+ID4KPiA+IEluIHNwYXJzZSB2bWVtbWFwIG1vZGVsLCB0aGUgdmlydHVh
bCBhZGRyZXNzIG9mIHZtZW1tYXAgaXMgY2FsY3VsYXRlZCBhczoKPiA+ICcoc3RydWN0IHBhZ2Ug
KilWTUVNTUFQX1NUQVJUIC0gKHBoeXNfcmFtX2Jhc2UgPj4gUEFHRV9TSElGVCknLgo+ID4gQW5k
IHRoZSBzdHJ1Y3QgcGFnZSdzIHZhIGNhbiBiZSBjYWxjdWxhdGVkIHdpdGggYW4gb2Zmc2V0Ogo+
ID4gJ3ZtZW1tYXAgKyAocGZuKScuCj4gPgo+ID4gSG93ZXZlciwgd2hlbiBpbml0aWFsaXppbmcg
c3RydWN0IHBhZ2VzLCBrZXJuZWwgYWN0dWFsbHkgc3RhcnRzIGZyb20gdGhlCj4gPiBmaXJzdCBw
YWdlIGZyb20gdGhlIHNhbWUgc2VjdGlvbiB0aGF0IHBoeXNfcmFtX2Jhc2UgYmVsb25ncyB0by4g
SWYgdGhlCj4gPiBmaXJzdCBwYWdlJ3MgcGh5c2ljYWwgYWRkcmVzcyBpcyBub3QgJ3BoeXNfcmFt
X2Jhc2UgPj4gUEFHRV9TSElGVCcsIHRoZW4KPiA+IHdlIGdldCBhbiB2YSBiZWxvdyBWTUVNTUFQ
X1NUQVJUIHdoZW4gY2FsY3VsYXRpbmcgdmEgZm9yIGl0J3Mgc3RydWN0IHBhZ2UuCj4KPiBOaWNl
IGNhdGNoISBJIG1hbmFnZWQgdG8gcmVwcm9kdWNlIHRoaXMgb24gYSBoYWNrZWQgcWVtdSB2aXJ0
IG1hY2hpbmUuCj4KPiA+IEZvciBleGFtcGxlLCBpZiBwaHlzX3JhbV9iYXNlIHN0YXJ0cyBmcm9t
IDB4ODIwMDAwMDAgd2l0aCBwZm4gMHg4MjAwMCwgdGhlCj4gPiBmaXJzdCBwYWdlIGluIHRoZSBz
YW1lIHNlY3Rpb24gaXMgYWN0dWFsbHkgcGZuIDB4ODAwMDAuIER1cmluZwo+ID4gaW5pdF91bmF2
YWlsYWdlX3JhbmdlLCB3ZSB3aWxsIGluaXRpYWxpemUgc3RydWN0IHBhZ2UgZm9yIHBmbiAweDgw
MDAwCj4KPiAiaW5pdF91bmF2YWlsYWJsZV9yYW5nZSgpIiBzcGVsbGluZyBmb3IgZ3JlcHBhYmls
aXR5Lgo+Cj4gPiB3aXRoIHZpcnR1YWwgYWRkcmVzcyAnKHN0cnVjdCBwYWdlICopVk1FTU1BUF9T
VEFSVCAtIDB4MjAwMCcsIHdoaWNoIGlzCj4gPiBiZWxvdyBWTUVNTUFQX1NUQVJUIGFzIHdlbGwg
YXMgUENJX0lPX0VORC4KPiA+Cj4gPiBUaGlzIGNvbW1pdCBmaXhlcyB0aGlzIGJ1ZyBieSBhbGln
bmluZyBwaHlzX3JhbV9iYXNlIHdpdGggU0VDVElPTl9TSVpFLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPgo+Cj4gUGxlYXNlIGFkZCBhIGZp
eGVzIHRhZy4KClJvZ2VyIHRoYXQuCgo+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L21tL2luaXQu
YyB8IDUgKysrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9y
aXNjdi9tbS9pbml0LmMKPiA+IGluZGV4IDBlOGMyMGFkY2Q5OC4uOTg2NmRlMjY3Yjc0IDEwMDY0
NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0v
aW5pdC5jCj4gPiBAQCAtNTksNiArNTksOCBAQCBFWFBPUlRfU1lNQk9MKHBndGFibGVfbDRfZW5h
YmxlZCk7Cj4gPiAgRVhQT1JUX1NZTUJPTChwZ3RhYmxlX2w1X2VuYWJsZWQpOwo+ID4gICNlbmRp
Zgo+ID4KPiA+ICsjZGVmaW5lIFJJU0NWX01FTVNUQVJUX0FMSUdOICgxVUwgPDwgU0VDVElPTl9T
SVpFX0JJVFMpCj4gPiArCj4gPiAgcGh5c19hZGRyX3QgcGh5c19yYW1fYmFzZSBfX3JvX2FmdGVy
X2luaXQ7Cj4gPiAgRVhQT1JUX1NZTUJPTChwaHlzX3JhbV9iYXNlKTsKPiA+Cj4gPiBAQCAtMjQx
LDcgKzI0Myw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9ib290bWVtKHZvaWQpCj4gPiAg
ICAgICAgKiBhdCB3b3JzdCwgd2UgbWFwIHRoZSBsaW5lYXIgbWFwcGluZyB3aXRoIFBNRCBtYXBw
aW5ncy4KPiA+ICAgICAgICAqLwo+ID4gICAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19YSVBf
S0VSTkVMKSkKPiA+IC0gICAgICAgICAgICAgcGh5c19yYW1fYmFzZSA9IG1lbWJsb2NrX3N0YXJ0
X29mX0RSQU0oKSAmIFBNRF9NQVNLOwo+ID4gKyAgICAgICAgICAgICBwaHlzX3JhbV9iYXNlID0g
cm91bmRfZG93bihtZW1ibG9ja19zdGFydF9vZl9EUkFNKCksCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFJJU0NWX01FTVNUQVJUX0FMSUdOKTsKPgo+IE5vIG5l
ZWQgdG8gd3JhcCB0aGlzIGxpbmUuIEFsc28sIGlzIHRoZSBSSVNDVl9NRU1TVEFSVF9BTElHTiBk
ZWZpbmUKPiByZWFsbHkgbmVlZGVkPwoKTWF5YmUgaXQgaXMgbm90IHNvIGZyaWVuZGx5IHRvIEZM
QVRNRU0gbW9kZWwgaWYgd2UgYWx3YXlzIGFsaWduCnBoeXNfcmFtX2Jhc2Ugd2l0aCBTRUNUSU9O
X1NJWkUuCkkgd2lsbCByZWZpbmUgdGhlIGNvZGUgYW5kIHNlbmQgYWdhaW4gbGF0ZXIuCgo+Cj4g
VGhlIGtlcm5lbCB0ZXN0IHJvYm90IGhhZCBzb21lIGJ1aWxkIGlzc3VlcyBhcyB3ZWxsIQo+Cj4K
PiBCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
