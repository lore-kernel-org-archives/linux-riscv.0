Return-Path: <SRS0=W16s=BP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15963C433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 17:29:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD32F22D06
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 17:28:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sXVttm9G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD32F22D06
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2eduUFn4yA67Mb46FpYcOqTm2X8gD0xPnkshruw/rIY=; b=sXVttm9GfCiqg5mgEDNlC1AxL
	0bUPK1u03EqLF4lkjgp5rWyJiNa+d/a7X0npVI4RHgPiN91ur5BHj4h6R6uOeVvzPPyRctfc/Cq8O
	0yTVqAs538N9NJ0lXfNmKoov9NcYvc7WOsI/xP8ossDTdhHJfMRQRW3u3y5hyWMqLNubhGVCsJcxI
	7FgHIXxNXgKCRRsooL7vGUTTo0xy8RDTJetylrZwCjU2RZ+1nilqRYaqSgYELZJwKZ3ermlk4JgcG
	YPxFb2PDAKv8cXDYbnzp3WxEMtzDq0A1AhF0OhOEll62GpJ+tCiuffZWXAvYkdheIq0M6Ir0mvFGv
	twgxOH8QA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3NDc-0000uk-Ky; Wed, 05 Aug 2020 17:28:48 +0000
Received: from mail-yb1-f195.google.com ([209.85.219.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3NDa-0000u5-AE
 for linux-riscv@lists.infradead.org; Wed, 05 Aug 2020 17:28:47 +0000
Received: by mail-yb1-f195.google.com with SMTP id e187so11874941ybc.5
 for <linux-riscv@lists.infradead.org>; Wed, 05 Aug 2020 10:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jIESkjbosNzI2i/4mKhOLQJDIy5XIt98gpDKy5En5c4=;
 b=pafpX3ELfnvs0K2LdGlneRs3235TD/RdfYWe786so23h4YJsjfTLP9a7xKSOEdy0a6
 V3RqNzSo7aCB/MbiGWYciwafxJtgUXCo3YBz/x34Kl5rh35aufGiQBPxZZZK9FVNCiPG
 v4t7jRyfW1KeTOKX4xKgFBt0Rsn+J/X609sQUbjUBaW5OBW3m5CeThTuBqXqkHyMVpHA
 T3QyW+hiCA+equI/yDcq4mgIry6pjV7On2zDjhA6eQZf1h8aQ6riiGkHpcl6nxHT1w+J
 gqbM/VVUd6DVmsowJ/LEYMLdpQJR6ZlHmdo6nqRjjqoSa89rfFBO2wsZ5hiCyhh9VgVp
 o9kQ==
X-Gm-Message-State: AOAM533y9S6jrzdTobbmxIv9lX1t667VEID44+p8+YlWu99gDFgtykAg
 R92lyJJC9Rd0brLYfEBOozywgrFRUmAOq61sMzc=
X-Google-Smtp-Source: ABdhPJzte+8NoKSJuGw9eYFA13DSpKHsDBmKqgn4k/Mm9Ytk75/dvy05IZxLYFMiua2sOAJDf1Wocp/j2vKgV+Qprrs=
X-Received: by 2002:a25:4609:: with SMTP id t9mr6233360yba.231.1596648521373; 
 Wed, 05 Aug 2020 10:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200722152422.72532-1-kernel@esmil.dk>
 <20200722152422.72532-2-kernel@esmil.dk>
 <CADasFoDfRwcfFHM_Sa-HzwSDyXEr2PNu3Wfe5riwZJM9XsELBQ@mail.gmail.com>
In-Reply-To: <CADasFoDfRwcfFHM_Sa-HzwSDyXEr2PNu3Wfe5riwZJM9XsELBQ@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Wed, 5 Aug 2020 19:28:29 +0200
Message-ID: <CANBLGcym5LER30xEVCmVU=6BTNTTLJDUL72DnVSB0V2MsBOwuA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] riscv: Clean up module relocations
To: Luke Nelson <lukenels@cs.washington.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_132846_377941_65D81F47 
X-CRM114-Status: GOOD (  19.29  )
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
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, LKML <linux-kernel@vger.kernel.org>,
 Zong Li <zong@andestech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andreas Schwab <schwab@suse.de>, linux-riscv <linux-riscv@lists.infradead.org>,
 Xi Wang <xi.wang@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAzMCBKdWwgMjAyMCBhdCAyMDo1MywgTHVrZSBOZWxzb24gPGx1a2VuZWxzQGNzLndh
c2hpbmd0b24uZWR1PiB3cm90ZToKPgo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoIQo+Cj4gPiBBbHNv
IFJJU0MtViBoYXMgYSBudW1iZXIgb2YgaW5zdHJ1Y3Rpb24gcGFpcnMgdG8KPiA+IGdlbmVyYXRl
IDMyYml0IGltbWVkaWF0ZXMgb3IganVtcC9jYWxsIG9mZnNldHMuIEVnLjoKPiA+Cj4gPiBsdWkg
ICByZCwgaGkyMAo+ID4gYWRkaSAgcmQsIHJkLCBsbzEyCj4KPiBPbiBSVjY0LCBib3RoIGhpMjAg
ZnJvbSBsdWkgYW5kIGxvMTIgZnJvbSBhZGRpIGFyZSBzaWduLWV4dGVuZGVkIHRvIDY0IGJpdHMu
Cj4gVGhpcyBtZWFucyB0aGF0IHRoZXJlIGFyZSBzb21lIDMyLWJpdCBzaWduZWQgb2Zmc2V0cyAo
aW4gdGhlIHJhbmdlCj4gWzJeMzEtMl4xMSwgMl4zMS0xXSkKPiB0aGF0IGFyZSBub3QgZW5jb2Rh
YmxlIHVzaW5nIChsdWkrYWRkaSksIChhdWlwYytqYWxyKSwgZXRjLiAoc2VlCj4gZGlzY3Vzc2lv
biBhdCBbMV0pLgo+Cj4gVGhlIGZvbGxvd2luZyBub3RlIGlzIGZyb20gdGhlIElTQSBtYW51YWw6
Cj4gPj4+IE5vdGUgdGhhdCB0aGUgc2V0IG9mIGFkZHJlc3Mgb2Zmc2V0cyB0aGF0IGNhbiBiZSBm
b3JtZWQgYnkgcGFpcmluZyBMVUkgd2l0aCBMRCwKPiA+Pj4gQVVJUEMgd2l0aCBKQUxSLCBldGMu
IGluIFJWNjRJIGlzIFviiJIyXjMx4oiSMl4xMSwgMl4zMeKIkjJeMTHiiJIxXS4KCkdvb2QgcG9p
bnQhCgo+IFRoZSBleGlzdGluZyBjb2RlIGFuZCB0aGUgbmV3IGNvZGUgYm90aCBzZWVtIGJ1Z2d5
IGlmIHRoZSBvZmZzZXQgaGFwcGVucyB0bwo+IGJlIGEgMzItYml0IGludCBidXQgZmFsbHMgb3V0
c2lkZSBvZiB0aGUgZW5jb2RhYmxlIHJhbmdlLgo+Cj4gPiArICAgICAgIGlmIChvZmZzZXQgIT0g
KHMzMilvZmZzZXQpIHsKPiA+IFsuLi5dCj4gPiArICAgICAgIGlmIChvZmZzZXQgIT0gKHMzMilv
ZmZzZXQpIHsKPiA+IFsuLi5dCj4KPiBUaGVzZSBjaGVja3Mgc2hvdWxkIHByb2JhYmx5IGJlIHJl
cGxhY2VkIHdpdGggc29tZXRoaW5nIHNpbWlsYXIgdG8KPiB3aGF0J3MgdXNlZCBpbiB0aGUgUlY2
NCBCUEYgSklUIGhlcmU6IFsyXSwKPiBleGNlcHQgdGhhdCB0aGlzIGNvZGUgc2hvdWxkIGNoZWNr
IGlmIHVzaW5nIFJWMzIgb3IgUlY2NCwgc2luY2UgdGhlCj4gZW5jb2RhYmxlIHJhbmdlIGRpZmZl
cnMgZm9yIGVhY2guCgpZZWFoLCBJIGRlY2lkZWQgdG8gbGVhdmUgdGhlc2UgY2hlY2tzIGFzIHRo
ZXkgYXJlIHRvIG5vdCBjaGFuZ2UKZXZlcnl0aGluZyBhdCBvbmNlLCBidXQgSSdsbCBzZWUgaWYg
SSBjYW4gaW1wcm92ZSBvbiB0aG9zZSBpbiB0aGUgbmV4dAp2ZXJzaW9uLgoKPiA+IE15IGhvcGUg
aXMgdGhhdCB3ZSBjYW4gZXZlbnR1YWxseSBmYWN0b3Igb3V0IHRoZSBjb2RlIHRvIGdlbmVyYXRl
Cj4gPiBpbW1lZGlhdGVzIGFuZCBpbnN0cnVjdGlvbnMgc28gaXQgY2FuIGJlIHJldXNlZCBib3Ro
IGhlcmUsIGluIHRoZQo+ID4ganVtcC1sYWJlbCBjb2RlIGFuZCBpbiB0aGUgYnBmLWppdCBjb2Rl
LCBidXQgbGV0J3MgdGFrZSBpdAo+ID4gb25lIHN0ZXAgYXQgYSB0aW1lLgo+Cj4gVGhpcyBzb3Vu
ZHMgZ3JlYXQhIEhhdmluZyBmZXdlciBjb3BpZXMgb2YgUklTQy1WIGVuY29kaW5nIGxvZ2ljIGFy
b3VuZCB3aWxsCj4gaG9wZWZ1bGx5IGRlY3JlYXNlIHRoZSBsaWtlbGlob29kIG9mIGJ1Z3MgOikg
U29tZSBvdGhlciBhcmNocyBhbHJlYWR5Cj4gaGF2ZSBzaGFyZWQKPiBpbmZyYXN0cnVjdHVyZSBm
b3IgZG9pbmcgaW5zdHJ1Y3Rpb24gZW5jb2RpbmcgKGUuZy4sIGluCj4gYXJjaC9hcm02NC9rZXJu
ZWwvaW5zbi5jKTsKPiB3ZSBzaG91bGQgY29uc2lkZXIgZG9pbmcgc29tZXRoaW5nIHNpbWlsYXIg
Zm9yIFJJU0MtVi4KCkV4YWN0bHkgdGhpcy4gSSd2ZSBldmVuIHRyaWVkIHRvIGNvcHkgdGhlIG5h
bWluZyBmcm9tIGFybTY0IGFzIHdlbGwuCkknbGwgc2VuZCBhIDJuZCB2ZXJzaW9uIG9mIHRoaXMg
YWZ0ZXIgLXJjMS4KCj4KPiAtIEx1a2UgTmVsc29uCj4KPiBbMV06IGh0dHBzOi8vZ3JvdXBzLmdv
b2dsZS5jb20vYS9ncm91cHMucmlzY3Yub3JnL2ZvcnVtLyMhdG9waWMvaXNhLWRldi9id1dGaEJu
blpGUQo+IFsyXTogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvYnBmL2JwZi5naXQvY29tbWl0Lz9pZD00ODk1NTNkZDEzYTg4ZDhhODgyZGIxMDYyMmJhOGI5
YjU4NTgyY2U0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
