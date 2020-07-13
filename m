Return-Path: <SRS0=aCEi=AY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B6CC433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 10:07:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63CCE20758
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 10:07:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P+5bG46Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ptiRUWo4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63CCE20758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qurFbbZMLMH5lv+LkdCutDhnGod8+E6fKXnCuwTd6Ek=; b=P+5bG46YdNQJtvmuCJtdK6rNm
	Z1h8e13b85SFUOnf9gJLiUADeIaqpzMQyaeuUVfk9ISR5dynW/ydWL0TDwSnZMuobsp6VDvqVhnuB
	wIGA2Zvlf67YKXdP/8W5n1NOETufcYnZiqiXx13qk1Q2lPFUp2HlZsnYeQXnU59Zk3QSB+MxM2/DZ
	bbnzN5SwgFA0MQ/Uwil5PM1CKno/VZBAFYMvXL1pS5hD2Qh5Qp7gkCKJ6l5Q7XvOUY4DStpcQF5Dq
	pZ9D8cBERz1Zwe9YBa3sj7HLl04K5cCypTztfUGt1QhTBFIkOOaMiQthFHdzlsg0RvOxoDSxAs1i6
	DEE2paGHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juvMr-0005UR-Cp; Mon, 13 Jul 2020 10:07:25 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juvMn-0005S0-9v
 for linux-riscv@lists.infradead.org; Mon, 13 Jul 2020 10:07:22 +0000
Received: by mail-qt1-x844.google.com with SMTP id x62so9483079qtd.3
 for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2020 03:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Hra1SVxTdrHnmSqT77/bjMGWIFkz435wwiQ+ZLnZoDI=;
 b=ptiRUWo4gXYQycmEkPKTyJJZRN7Bj54mqkYIggzhcdgIJddti3yb3pwt2oKuq5Q0Y0
 WjRZjIT2ThsoI09IUDHLACAsItQWoXa0IyjIue11vonhfNd670q6xTS4V3v97YgiDQMA
 9yR5LmgfcdAQcV0tZN6ZvDXveHjOeIcK+uy24VE8hssRLCTGam408lxayc6b7XsN6Q7P
 /Hg5geh/iVhe2vjX46XGDIe3OpMNLs4eV7XDlhV5kAKDDMQ93DvVh1CI0Lqh5zWXIOu9
 6sZow05O2kidzix7prq9gGoF0WJeZHV8Y+YxmAp2F367+5dENJvvpy2Aqcwb5eiIAX0R
 J+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hra1SVxTdrHnmSqT77/bjMGWIFkz435wwiQ+ZLnZoDI=;
 b=PNFNcbag0P8sZ6s2rFq2pcfNdj/LJ3pO1V4dE9ROIOyzqV35a51Ikhrnu+9DtaV1O4
 z/ZKFbwjQJuWqL3aoiRncLckM0jSlv0q60GtkjxzkgEBQ4Z/afAi54DtFbOT2fZIekBw
 nr3Nv9KPTySgi4FQ2xZ/uqS+BuZbCpD4iG823tvW9Z++5DAA+PXWpZSCFhjGShim7dba
 8XILqXUfGLOFJv5Lo+JlpqgyHl0CqhztifaTLvMwjMwODOurAfyLYDaCMctum9oq3f1U
 +/qvUzdyh7rqLDurbhFudS7o514Hei+7i/bakx3oC0NkCICfQfjITVZhZHF4cOzsniZ0
 c2Yw==
X-Gm-Message-State: AOAM533j+rYXJdTHBVDPTJJIXw1HU7vP0H84p8TLrZ7kYRxNlXnHnVUO
 Q3kg+EkX1hCeXNiuwftVc8EiJfoPqqc4xP+Cf9w=
X-Google-Smtp-Source: ABdhPJx2Tkh9kzNP5zejlcgntpWG6iqUsWwAdhz/7Y2gf+TeAPNupDdNYWVSICr1330Epz0MkIk6TUJ4OuKUEr4Uoj0=
X-Received: by 2002:ac8:19c4:: with SMTP id s4mr79036237qtk.117.1594634839691; 
 Mon, 13 Jul 2020 03:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200710135706.537715-1-hch@lst.de>
 <20200710135706.537715-6-hch@lst.de>
In-Reply-To: <20200710135706.537715-6-hch@lst.de>
From: Greentime Hu <green.hu@gmail.com>
Date: Mon, 13 Jul 2020 18:06:42 +0800
Message-ID: <CAEbi=3fk9u9n5vcENFuSMkob81+hg2r2dd0oN2FfaqLg0eosSw@mail.gmail.com>
Subject: Re: [PATCH 5/6] uaccess: add force_uaccess_{begin,end} helpers
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_060721_394848_E6857E00 
X-CRM114-Status: GOOD (  15.81  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch <linux-arch@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vincent Chen <deanbo422@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+IOaWvCAyMDIw5bm0N+aciDEw5pelIOmAseS6
lCDkuIvljYg5OjU35a+r6YGT77yaCj4KPiBBZGQgaGVscGVycyB0byB3cmFwZXIgdGhlIGdldF9m
cy9zZXRfZnMgbWFnaWMgZm9yIHVuZG9pbmcgYW55IGRhbWFuZ2UKPiBkb25lIGJ5IHNldF9mcyhL
RVJORUxfRFMpLiAgVGhlcmUgaXMgbm8gcmVhbCBmdW5jdGlvbmFsIGJlbmVmaXQsIGJ1dCB0aGlz
Cj4gZG9jdW1lbnRzIHRoZSBpbnRlbnQgb2YgdGhlc2UgY2FsbHMgYmV0dGVyLCBhbmQgd2lsbCBh
bGxvdyBzdHViYmluZyB0aGUKPiBmdW5jdGlvbnMgb3V0IGVhc2lseSBmb3Iga2VybmVscyBidWls
ZHMgdGhhdCBkbyBub3QgYWxsb3cgYWRkcmVzcyBzcGFjZQo+IG92ZXJyaWRlcyBpbiB0aGUgZnV0
dXJlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4g
LS0tCj4gIGFyY2gvYXJtNjQva2VybmVsL3NkZWkuYyAgICAgICAgIHwgIDIgKy0KPiAgYXJjaC9t
NjhrL2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggfCAxMiArKysrKystLS0tLS0KPiAgYXJjaC9taXBz
L2tlcm5lbC91bmFsaWduZWQuYyAgICAgfCAyNyArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0K
PiAgYXJjaC9uZHMzMi9tbS9hbGlnbm1lbnQuYyAgICAgICAgfCAgNyArKystLS0tCj4gIGFyY2gv
c2gva2VybmVsL3RyYXBzXzMyLmMgICAgICAgIHwgMTggKysrKysrKystLS0tLS0tLS0tCj4gIGRy
aXZlcnMvZmlybXdhcmUvYXJtX3NkZWkuYyAgICAgIHwgIDUgKystLS0KPiAgaW5jbHVkZS9saW51
eC91YWNjZXNzLmggICAgICAgICAgfCAxOCArKysrKysrKysrKysrKysrKysKPiAga2VybmVsL2V2
ZW50cy9jYWxsY2hhaW4uYyAgICAgICAgfCAgNSArKy0tLQo+ICBrZXJuZWwvZXZlbnRzL2NvcmUu
YyAgICAgICAgICAgICB8ICA1ICsrLS0tCj4gIGtlcm5lbC9rdGhyZWFkLmMgICAgICAgICAgICAg
ICAgIHwgIDUgKystLS0KPiAga2VybmVsL3N0YWNrdHJhY2UuYyAgICAgICAgICAgICAgfCAgNSAr
Ky0tLQo+ICBtbS9tYWNjZXNzLmMgICAgICAgICAgICAgICAgICAgICB8IDIyICsrKysrKysrKyst
LS0tLS0tLS0tLS0KPiAgMTIgZmlsZXMgY2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygrKSwgNjIgZGVs
ZXRpb25zKC0pCj4KWy4uLl0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9uZHMzMi9tbS9hbGlnbm1lbnQu
YyBiL2FyY2gvbmRzMzIvbW0vYWxpZ25tZW50LmMKPiBpbmRleCBjOGI5MDYxYTJlZTNkNS4uMWVi
N2RlZDY5OTJiNTcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9uZHMzMi9tbS9hbGlnbm1lbnQuYwo+ICsr
KyBiL2FyY2gvbmRzMzIvbW0vYWxpZ25tZW50LmMKPiBAQCAtNTEyLDcgKzUxMiw3IEBAIGludCBk
b191bmFsaWduZWRfYWNjZXNzKHVuc2lnbmVkIGxvbmcgYWRkciwgc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpCj4gIHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgaW5zdDsKPiAgICAgICAgIGludCByZXQg
PSAtRUZBVUxUOwo+IC0gICAgICAgbW1fc2VnbWVudF90IHNlZyA9IGdldF9mcygpOwo+ICsgICAg
ICAgbW1fc2VnbWVudF90IHNlZzsKPgo+ICAgICAgICAgaW5zdCA9IGdldF9pbnN0KHJlZ3MtPmlw
Yyk7Cj4KPiBAQCAtNTIwLDEzICs1MjAsMTIgQEAgaW50IGRvX3VuYWxpZ25lZF9hY2Nlc3ModW5z
aWduZWQgbG9uZyBhZGRyLCBzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAgICAgICAgICAgICAgICJG
YXVsdGluZyBhZGRyOiAweCUwOGx4LCBwYzogMHglMDhseCBbaW5zdDogMHglMDhseCBdXG4iLCBh
ZGRyLAo+ICAgICAgICAgICAgICAgcmVncy0+aXBjLCBpbnN0KTsKPgo+IC0gICAgICAgc2V0X2Zz
KFVTRVJfRFMpOwo+IC0KPiArICAgICAgIHNlZyA9IGZvcmNlX3VhY2Nlc3NfYmVnaW4oKTsKPiAg
ICAgICAgIGlmIChpbnN0ICYgTkRTMzJfMTZCSVRfSU5TVFJVQ1RJT04pCj4gICAgICAgICAgICAg
ICAgIHJldCA9IGRvXzE2KChpbnN0ID4+IDE2KSAmIDB4ZmZmZiwgcmVncyk7Cj4gICAgICAgICBl
bHNlCj4gICAgICAgICAgICAgICAgIHJldCA9IGRvXzMyKGluc3QsIHJlZ3MpOwo+IC0gICAgICAg
c2V0X2ZzKHNlZyk7Cj4gKyAgICAgICBmb3JjZV91YWNjZXNzX2VuZChzZWcpOwo+Cj4gICAgICAg
ICByZXR1cm4gcmV0Owo+ICB9CgpIaSBDaHJpc3RvcGgsIFRoYW5rIHlvdS4KQWNrZWQtYnk6IEdy
ZWVudGltZSBIdSA8Z3JlZW4uaHVAZ21haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
