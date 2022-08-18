Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00F7C00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 21:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l6+YjkUt/xDkF1ntSGtynS3sUJDm5RNJq4qinnUWRew=; b=eFB1Sgazqyxy/h
	Wb2Sw7IQsaMTDOeYYleCkk+6OlRZIJBxPkYUzzfNCEm4s4PVctpJDWE9f2kzyRM+IlqX02ETLYuSV
	kqGYtW37togmqy2HGcN77mWhb0DtlZKC6qlQp4En7aACFR06rlBBvD5XZyJ9FKvK0dxQxKwcTxiL4
	cbN/FZXIwm1+DdIKYrvjiAIlcwKIflZqCjnBlQU7p/2tvklAn4TLPP24G+vFwe5FyGIrjYbws6C+A
	N2E8erhaV22T8n56dJb1dBXYL8ql7ZZiprI6oKJbcABAlLYQl+1dGpW663vcEWmbYEqgKT6Pb1jKY
	jbFHEcCNfovejJpdS/Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOnAu-009uLD-Jr; Thu, 18 Aug 2022 21:35:36 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOnAr-009uIs-It
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 21:35:35 +0000
Received: by mail-wm1-x335.google.com with SMTP id n23-20020a7bc5d7000000b003a62f19b453so146829wmk.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 14:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc;
        bh=fquV4zrBUkCxMg9XM2E4knhacUl50yaXuaT1YgMNaNs=;
        b=F3CVrOr7VZCVCqNaVaKO6tYMd7S91n3H4UEV3kwf2afGDQIZow15H5MwvqGxmM0Otz
         f/WvTvn0xUrB1pAMs9lh8g0LVzu/eSucNsMys+RPjPhu5M/ExnJnx6sNZo32n8GgHLzE
         QTKJ9zQN0gNR8EpwHifjaBtQXPkS0dlWCsAUS10+Qo6u+rNYBhnOfH0SzxaOAH+pmYnt
         9xSiCU4k6O9fHdWkQcGuQcMEENMox4T+IdCGtfZ9NLigqNaoMEbF1hx9/FRIcMj0eORq
         BZpX70l4t62Qac/XROXpGSQc9cnb5ngPnGikZMKz2xXLOFm6KzmGjQl8F/Q9e2FPdLjz
         1NeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc;
        bh=fquV4zrBUkCxMg9XM2E4knhacUl50yaXuaT1YgMNaNs=;
        b=TD+LBO74UgslsSu23GHNqL+PCEaexQI3JiCntiRxYEn4eHHfYi6zFKlHlSR5n090CC
         tRVN10Uu9uD/SvX0nz/b3nMO21X8D12Lmb1XVWhU6n10TP0iT5s3/fATDsiYrlrL68J+
         ELNFSkMAqcWfuKcepNTx7JTShIOHPzQB3GNcWTmzwvfAUkUjV1prn+d0I1FXH4RemgRw
         KLnfcXD2zdViV8LeV+KINSa9Q8mZHQvBS5MfZ0Pf5LKbLXSR7w5XpyaavNARY78D0AyF
         x5D7xQVchnHb0j2VTAmnUauThxEN6lGiYPIYEqel2qtbanx9zFrNi4EC/lNbWax8+g4r
         UaUQ==
X-Gm-Message-State: ACgBeo1qhCXtT0ca1MybEDrBy9K/g4/OI3XvSrVgEcuvI5ofimM+hHcx
	3w5lHNJo7TdY2fjnw4sWQIjGBQ==
X-Google-Smtp-Source: AA6agR5aa6aAeFg5v4W333DgPi3KJrgw9GnWAKbyM9mum+daWcCABK9mSLRHyN23M3aLX5qoEjphMA==
X-Received: by 2002:a05:600c:19ce:b0:3a5:ffb3:d546 with SMTP id u14-20020a05600c19ce00b003a5ffb3d546mr3009556wmq.6.1660858529929;
        Thu, 18 Aug 2022 14:35:29 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.n-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id k40-20020a05600c1ca800b003a5f3de6fddsm7250398wms.25.2022.08.18.14.35.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Aug 2022 14:35:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH] riscv: dma-mapping: Use conventional cache operations for
 dma_sync*()
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <0fb64928174f49f81f4a9b97760b2771cbcdbf14.camel@yadro.com>
Date: Thu, 18 Aug 2022 22:35:28 +0100
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "samuel@sholland.org" <samuel@sholland.org>,
 "linux@yadro.com" <linux@yadro.com>,
 "heiko@sntech.de" <heiko@sntech.de>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>
Message-Id: <C2642AD9-0DE6-4468-A282-D43A131752B3@jrtc27.com>
References: <20220818165105.99746-1-s.miroshnichenko@yadro.com>
 <1B438F95-364E-4125-B2EE-D673E0B4BEB3@jrtc27.com>
 <0fb64928174f49f81f4a9b97760b2771cbcdbf14.camel@yadro.com>
To: Sergei Miroshnichenko <s.miroshnichenko@yadro.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_143533_728110_9C1A050C 
X-CRM114-Status: GOOD (  20.62  )
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

T24gMTggQXVnIDIwMjIsIGF0IDIxOjUyLCBTZXJnZWkgTWlyb3NobmljaGVua28gPHMubWlyb3No
bmljaGVua29AeWFkcm8uY29tPiB3cm90ZToKPiAKPiBIaSBKZXNzLAo+IAo+IE9uIFRodSwgMjAy
Mi0wOC0xOCBhdCAxOToxMiArMDEwMCwgSmVzc2ljYSBDbGFya2Ugd3JvdGU6Cj4+IE9uIDE4IEF1
ZyAyMDIyLCBhdCAxNzo1MSwgU2VyZ2VpIE1pcm9zaG5pY2hlbmtvCj4+IDxzLm1pcm9zaG5pY2hl
bmtvQHlhZHJvLmNvbT4gd3JvdGU6Cj4+PiAKPj4+IFN1cHBvcnQgb2YgYXJjaF9zeW5jX2RtYV9m
b3Jfe2RldmljZSxjcHV9KCkgZm9yIFJJU0MtViB3YXMgYWRkZWQKPj4+IHJlY2VudGx5Lgo+Pj4g
Cj4+PiBDdXJyZW50bHksIGZvcl9jcHUoRlJPTV9ERVZJQ0UpIHVzZXMgdGhlIGZsdXNoICh3cml0
ZWJhY2sgcGx1cwo+Pj4gaW52YWxpZGF0ZSkKPj4+IGNhY2hlIG9wZXJhdGlvbiwgd2hpY2ggY2Fu
IG92ZXJ3cml0ZSB0aGUgZGF0YSAocmVjZWl2ZWQgZnJvbSBhCj4+PiBkZXZpY2UgdmlhCj4+PiBE
TUEpIHdpdGggZGlydHkgY2FjaGUgbGluZXMuIFJlcGxhY2UgaXQgd2l0aCB0aGUgaW52YWwgdG8g
YXZvaWQKPj4+IGRhdGEKPj4+IGNvcnJ1cHRpb25zLgo+Pj4gCj4+PiBUaGUgc2FtZSBnb2VzIGZv
ciBmb3JfY3B1KEJJRElSRUNUSU9OQUwpLCBpdCB3YXMgYWxzbyBmbHVzaGluZyB0aGUKPj4+IGNh
Y2hlLAo+Pj4gYnV0IGl0IGlzIGNhbGxlZCBhZnRlciB0aGUgZGV2aWNlIGhhZCBvd25lZCB0aGUg
YnVmZmVyLiBTbyBpbiBvcmRlcgo+Pj4gdG8gbm90Cj4+PiBsb29zZSB0aGUgcmVjZWl2ZWQgZGF0
YSwgc3RpY2sgdG8gdGhlIGludmFsIGhlcmUgYXMgd2VsbC4KPj4+IAo+Pj4gQXMgb2YgZm9yX2Rl
dmljZShGUk9NX0RFVklDRSksIGFjY29yZGluZyB0byB0aGUgaW5zcGlyYXRpb25hbAo+Pj4gZGlz
Y3Vzc2lvbgo+Pj4gYWJvdXQgbWF0Y2hpbmcgdGhlIERNQSBBUEkgYW5kIGNhY2hlIG9wZXJhdGlv
bnMgWzFdLCB0aGUgaW52YWwgb3IgYQo+Pj4gbm8tb3AKPj4+IHNob3VsZCBiZSBoZXJlLCBhbmQg
dGhpcyB3b3VsZCByZXNvbmF0ZSB3aXRoIG1vc3Qgb3RoZXIgYXJjaGVzLiBCdXQKPj4+IGluIGEK
Pj4+IGxhdGVyIGRpc2N1c3Npb24gWzJdIGl0IHdhcyBkZWNpZGVkIHRoYXQgdGhlIGNsZWFuICh3
aGljaCBpcyB1c2VkCj4+PiBub3cpIGlzCj4+PiBpbmRlZWQgcHJlZmVyYWJsZSBhbmQgc2FmZXIs
IHRob3VnaCBzbG93ZXIuIFRoZSBhcm02NCBoYXMgYmVlbgo+Pj4gcmVjZW50bHkKPj4+IGNoYW5n
ZWQgaW4gdGhlIHNhbWUgd2F5IFszXS4KPj4gCj4+IEZsdXNoIGlzIGFsd2F5cyBhIHZhbGlkIHdh
eSB0byBpbXBsZW1lbnQgaW52YWxpZGF0ZSwgYW5kIGlmIGl0IGRvZXMKPj4gbm90Cj4+IHdvcmsg
dGhlbiB5b3UgaGF2ZSBidWdzIGVsc2V3aGVyZSwgc2luY2UgdGhlIENQVSBpcyBmcmVlIHRvIHdy
aXRlIG91dAo+PiB0aGUgZGlydHkgY2FjaGUgbGluZXMgYXQgYW55IHBvaW50IGJlZm9yZSBhbiBp
bnZhbGlkYXRlLiBTbyB3aGlsc3QKPj4gaXTigJlzCj4+IG1vcmUgZWZmaWNpZW50IHRvIHVzZSBp
bnZhbGlkYXRlIGFuZCBoaW50IHRvIHRoZSBjb3JlIHRoYXQgaXQgZG9lcwo+PiBub3QKPj4gbmVl
ZCB0byBkbyBhbnkgd3JpdGluZywgaXQgaXMgbm8gbW9yZSBjb3JyZWN0LCBhbmQgdGhpcyB0aGlz
IHBhdGNoCj4+IGRlc2NyaXB0aW9uIGlzIG1pc2d1aWRlZC4gWW91IGV2ZW4gbWlnaHQgd2lzaCB0
byB1c2UgdGhlIGZhY3QgdGhhdCBpdAo+PiBpcyBjdXJyZW50bHkgYSBmbHVzaCBhcyBhIGNvbnZl
bmllbnQgc2FuaXRpc2VyIGZvciB3aGF0ZXZlciBpcwo+PiBjdXJyZW50bHkgdmlvbGF0aW5nIHRo
ZSBub24tY29oZXJlbnQgRE1BIHJ1bGVzIGFuZCBmaXggdGhhdCBiZWZvcmUKPj4gaXTigJlzCj4+
IHN3aXRjaGVkIHRvIGludmFsaWRhdGUgYW5kIHBhcGVycyBvdmVyIHRoZSBpc3N1ZSAoYXQgbGVh
c3QgaW4KPj4gd2hhdGV2ZXIKPj4gaW1wbGVtZW50YXRpb24geW914oCZcmUgcnVubmluZyBvbiku
Cj4gCj4gWW91IGFyZSByaWdodCwgdGhhbmsgeW91LCB0aGUgZGVzY3JpcHRpb24gKmlzKiBtaXNs
ZWFkaW5nOiBjYWNoZSBsaW5lcwo+IGNhbid0IGdldCBkaXJ0eSBiZWZvcmUgZm9yX2NwdSgpLCBh
cyB0aGV5IGFyZSBjbGVhbmVkIGR1cmluZwo+IGZvcl9kZXZpY2UoKSwgYW5kIGFyZSBub3Qgd3Jp
dHRlbiB0byBieSB0aGUgQ1BVIGluIGJldHdlZW4uCj4gCj4gSSBnYXZlIGl0IGFub3RoZXIgdGhv
dWdodDogdGhlIHJlYXNvbiB0byBpbnZhbGlkYXRlIGluIGZvcl9jcHUoKSBpcwo+IHRoYXQgdGhl
IENQVSBjYW4gc3BlY3VsYXRpdmVseSBwcmVmZXRjaCB0aGUgYnVmZmVyIGFmdGVyCj4gbWFwKCkv
Zm9yX2RldmljZSgpIGJ1dCBiZWZvcmUgdGhlIERNQSBpcyBmaW5pc2hlZC4KPiAKPiBFdmVuIGlm
IHJlcGxhY2UgdGhlIGNsZWFuIGluIGZvcl9kZXZpY2UoRlJPTV9ERVZJQ0UpIHdpdGggdGhlIGZs
dXNoLCBhCj4gcHJlZmV0Y2ggc3RpbGwgbWF5IGhhcHBlbiwgcmVxdWlyaW5nIGFuIGludmFsaWRh
dGlvbi4KCkluIHRoYXQgY2FzZSB0aGUgbGluZSBpcyBzdGlsbCBjbGVhbiwgbm90IGRpcnR5LCBz
byBhIGZsdXNoIHdpbGwgYmVoYXZlCnRoZSBzYW1lIGFzIGFuIGludmFsaWRhdGUuIFNvIG5vLCB0
aGlzIGlzIHN0aWxsIHdyb25nLCBmbHVzaCBpcyBhbHdheXMKY29ycmVjdCwgZXZlbiBpZiBpbnZh
bGlkYXRlIGlzIHBvdGVudGlhbGx5IGZhc3Rlci4KCkplc3MKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
