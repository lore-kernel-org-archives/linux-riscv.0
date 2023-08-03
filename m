Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455F1EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 15:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nzNQjj73kSYz2K+5PKNReyaMyiWsX05KtgvxcfdTQqQ=; b=1KQ/vWNiViR957
	cYgNq4Ib7YyEVzBxePAb1RFuPVNdsgIF+j9uPL5QyeHjtWeH4LOR87xqnQvJcdGQyfrpsn1sXfGm4
	NWvxIK9vZrCGzFnXXR+OaEq53Q15OrEcXhAv9ZBdWVtR5C/TL1acR+q5NnNPTijgKhV0OKxG87rPn
	bacxVCDFoN87mmtct+YNpCTZ1Fq1enyZKZLO0wOlBYQ0mkkoB95k/w1WHknNw4zzJqoKTBAjfNSZR
	Sz46VybcpJetl07ew64LwC6K+nfR5bLSEE3rYJL3ufFQffV2qSj52kyj4B15XRscaB2HYsgZuchwd
	ogxpPmjP07XlAnVhVUAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRa8Y-00ABW7-17;
	Thu, 03 Aug 2023 15:21:14 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRa8U-00ABT1-17
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 15:21:13 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bba48b0bd2so7488815ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 08:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691076069; x=1691680869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHMLZFWHP4GSNpR79JtI8BrtGsCZ/YdpbJ6vEHW5Cqk=;
        b=j0okR7Fs8lVyMVctOaIoaw6mtP82u97YDeY6hQKkHRlYYdwwOPp1zfY0aEaLhvzT8S
         yHUuGum8HruKQXCdWqcBCZO4rs7DNNzBfEa/PYfVQGOSXxRjy5uSnzX3Jr6xpl980kRt
         HeJ4iv2gp3xsJ7p8sD4ThOlAbRMZ/MTyozb0DbQrd+FGvbuTLBrMehm/mrNdiKZOd2Hm
         8T++RZSFxGrWCSSiF0oCnIh8qaYis1BJ3VktbhTrDXA/2IfsGA/4AL+QZssxHsklgcYP
         tjNGnh7wDV1q2/vGros9xW4zRLEPOTXXYz5UzccTFZMG+pkWAl8ivhK+QTZyFYHD+cWI
         9QKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691076069; x=1691680869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHMLZFWHP4GSNpR79JtI8BrtGsCZ/YdpbJ6vEHW5Cqk=;
        b=SXr2jLXFtC1OF/oDvIDGB2XI4JKAnlgI9PDCRzTBwhyjxcN7kNvrHB/hiVzI7iX05D
         aXeyn9VzBkKWamykJBD+VMg1SWraLtjts80q1c0sWgFSW9SdgthZpW/ZzNVEO4FF1Tlz
         0RGGJMv52kG8Out0J6m1HIypzGUGXHhLrM5EuP8f+JpQZccIe39Qry63poF7WUSX7yLT
         d2hAWIzkPZe0c9ZNsMe5rPN/rjkVEMWkutBzpU5diGN2YC/p4t5nzjc7AaXhtJbdesc0
         HABMlbVC9e1xSloJOly5LbqbT+LcAQjPfIdesxUBa7S/KXGW2kYXy/9KQv8THGioqxTp
         n3gw==
X-Gm-Message-State: ABy/qLZuJ0AvS4TLVdG7ZeGomKM0dFu7uf0Ah4ojLx+mMRcrPOOVFtFm
	4wrNZEn0AbGvb3eMwOmeR81kwLg2iyTCfb55sOCVYA==
X-Google-Smtp-Source: APBJJlFiySFGocXSADBXguYYyEKkxDN7ynIC7VKd86S/kjKPkvXKr753AS8x+xBTAP8ioj+8F1+9/vUOJxVXcB04k4w=
X-Received: by 2002:a17:902:c246:b0:1b8:59f0:c748 with SMTP id
 6-20020a170902c24600b001b859f0c748mr17350585plg.2.1691076069560; Thu, 03 Aug
 2023 08:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230803132818.2092166-1-luxu.kernel@bytedance.com> <20230803-curtly-sandbox-9ff8c7aafb85@spud>
In-Reply-To: <20230803-curtly-sandbox-9ff8c7aafb85@spud>
From: =?UTF-8?B?5pet6Lev?= <luxu.kernel@bytedance.com>
Date: Thu, 3 Aug 2023 23:20:53 +0800
Message-ID: <CAPYmKFsbGMRY7S6WguDHkkY1futTS7+piKf83Pb+aktO2yLXpw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH RESEND] riscv: Fix local irq restore when
 flags indicates irq disabled
To: Conor Dooley <conor@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_082110_390919_1A63A202 
X-CRM114-Status: GOOD (  25.54  )
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

T24gVGh1LCBBdWcgMywgMjAyMyBhdCAxMDozNuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBIZXksCj4KPiBPbiBUaHUsIEF1ZyAwMywgMjAyMyBhdCAwOToy
ODoxOFBNICswODAwLCBYdSBMdSB3cm90ZToKPiA+IFdoZW4gYXJjaF9sb2NhbF9pcnFfcmVzdG9y
ZSgpIGlzIGNhbGxlZCB3aXRoIGZsYWdzIGluZGljYXRpbmcgaXJxcwo+ID4gZGlzYWJsZWQsIHdl
IG5lZWQgdG8gY2xlYXIgU1JfSUUgYml0IGluIENTUl9TVEFUVVMsIHdoZXJlYXMgY3VycmVudAo+
ID4gaW1wbGVtZW50YXRpb24gYmFzZWQgb24gY3NyX3NldCgpIGZ1bmN0aW9uIG9ubHkgc2V0cyBT
Ul9JRSBiaXQgb2YKPiA+IENTUl9TVEFUVVMgd2hlbiBTUl9JRSBiaXQgb2YgZmxhZ3MgaXMgaGln
aCBhbmQgZG9lcyBub3RoaW5nIHdoZW4KPiA+IFNSX0lFIGJpdCBvZiBmbGFncyBpcyBsb3cuCj4g
Pgo+ID4gVGhpcyBjb21taXQgc3VwcGxpZXMgY3NyIGNsZWFyIG9wZXJhdGlvbiB3aGVuIGNhbGxp
bmcgaXJxIHJlc3RvcmUKPiA+IGZ1bmN0aW9uIHdpdGggZmxhZ3MgaW5kaWNhdGluZyBpcnEgZGlz
YWJsZWQuCj4gPgo+ID4gRml4ZXM6IDZkNjBiNmVlMGM5NyAoIlJJU0MtVjogRGV2aWNlLCB0aW1l
ciwgSVJRcywgYW5kIHRoZSBTQkkiKQo+ID4gU2lnbmVkLW9mZi1ieTogWHUgTHUgPGx1eHUua2Vy
bmVsQGJ5dGVkYW5jZS5jb20+Cj4gPiAtLS0KPgo+IFRoZXJlJ3Mgbm8gY2hhbmdlbG9nIG9yIGV4
cGxhbmF0aW9uLCBzbyB3aGF0IGlzIHRoZSByZWFzb24gZm9yIHRoZQo+IHJlc2VuZD8KPgo+IENo
ZWVycywKPiBDb25vci4KClNvcnJ5IGZvciBkaXN0dXJiaW5nIHlvdS4KCkkgaGF2ZW4ndCByZWNl
aXZlZCBhbnkgcmVzcG9uc2Ugc2luY2UgdGhlIHBhdGNoIHdhcyBzZW50IGxhc3Qgd2Vlay4gSQp0
aGluayBtYWludGFpbmVycyBhcmUgYnVzeSBhbmQgdGh1cyBJIHdhbnQgdG8gaGF2ZSBhIHBpbmcu
IFRoaXMgcGF0Y2gKd2FzIHJlc2VudCBiZWNhdXNlIEkgZm91bmQgaXQgaXMgc2FpZCB0aGF0IHJl
c2VuZGluZyBwYXRjaCBpcyBvbmUgb2YKdGhlIG1ldGhvZHMgdG8gcGluZyBtYWludGFpbmVycyBp
biB0aGlzIGtlcm5lbCBkb2M6Cmh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0
L3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLmh0bWwuCgo+ID4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vaXJxZmxhZ3MuaCB8IDUgKysrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vaXJxZmxhZ3MuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaXJxZmxhZ3MuaAo+
ID4gaW5kZXggMDhkNGQ2YTViN2U5Li43YzMxZmMzYzM1NTkgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2lycWZsYWdzLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vaXJxZmxhZ3MuaAo+ID4gQEAgLTQ5LDcgKzQ5LDEwIEBAIHN0YXRpYyBpbmxpbmUgaW50
IGFyY2hfaXJxc19kaXNhYmxlZCh2b2lkKQo+ID4gIC8qIHNldCBpbnRlcnJ1cHQgZW5hYmxlZCBz
dGF0dXMgKi8KPiA+ICBzdGF0aWMgaW5saW5lIHZvaWQgYXJjaF9sb2NhbF9pcnFfcmVzdG9yZSh1
bnNpZ25lZCBsb25nIGZsYWdzKQo+ID4gIHsKPiA+IC0gICAgIGNzcl9zZXQoQ1NSX1NUQVRVUywg
ZmxhZ3MgJiBTUl9JRSk7Cj4gPiArICAgICBpZiAoZmxhZ3MgJiBTUl9JRSkKPiA+ICsgICAgICAg
ICAgICAgY3NyX3NldChDU1JfU1RBVFVTLCBTUl9JRSk7Cj4gPiArICAgICBlbHNlCj4gPiArICAg
ICAgICAgICAgIGNzcl9jbGVhcihDU1JfU1RBVFVTLCBTUl9JRSk7Cj4gPiAgfQo+ID4KPiA+ICAj
ZW5kaWYgLyogX0FTTV9SSVNDVl9JUlFGTEFHU19IICovCj4gPiAtLQo+ID4gMi4yMC4xCj4gPgo+
ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
