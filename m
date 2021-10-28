Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E734FC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 23:41:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 816206108F
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 23:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 816206108F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfNpHM9VCqI5CG5rcaQ+ipapVujHQmkkYD+yjM+pMRA=; b=JUQ4rYC/fUoaAr
	IubUJl1zFhnqg69Nz21mZOryzkMNZxCgYsW+HwYQdLy5aKsRfU9luqWEuozGvdFoZhc+DINWB3KPK
	6rZpyXUhF9QaBt/n9o/NXrrJZm8Ye8a3yxBsENOoW7/FKArd0mvXCbYoE710qgUebW7jlzlhR1W2M
	vi8UYEsndalNDfgd1yTKrf9ID61cMicjBcEANzHqRw4fImmWdZfIt4RBubSKFgHJSXMo/17TOOFAh
	L4E8x6Zkjavx8lOEtJ1D57LWKfGr8vxiHFjN0gXw5i0xkzJdweR3+GDlniEjzc0+T2sEaYN8EN5LJ
	MNituCEQ/D1LoMu6tSNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgF1A-009IsU-Bu; Thu, 28 Oct 2021 23:41:08 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgF18-009Iry-17
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 23:41:07 +0000
Received: by mail-yb1-xb35.google.com with SMTP id a129so6447465yba.10
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 16:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yl1nkZWSVdhXNZgNIo/eN9U2NpZji7LG27lqyAkf4fQ=;
 b=UkcSh/HJZO1lLDNloPUHsimUNnqPhpZeCaegj1Ec73j0+DOokq75vZT/jNJvxzBHDx
 VLTnOs/QnGWTOiWahQ3Lqh5Lrbjk4mCe5iH6Z9884Bs2woaz9RIUts2L5tunPn/aNdpR
 Mf0SkobiPWPdwzJswOpMmVbrJSeIwtNv9BZnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yl1nkZWSVdhXNZgNIo/eN9U2NpZji7LG27lqyAkf4fQ=;
 b=mY/XuJyTIPUh6JdS3MhFKr7RErXzP0w0i+zM6ifogWxMgOJvGPqfTCdTvNy2uw5XC5
 bu1iXy4BqFgADtp20Nc2oFrJt7dV5jQfdJgLMGO8gr9tCFAUWwEfBwGSJkeBu52O0Lph
 +89dMwNAN7BhSRkxOIsHcUYVrNkSxenfukv2i1tV5ZUuKi+Zq+plPxfDEwdnfy3jYQur
 LJ/ZU5QEGyYDXrjohPtkwTgOlKpp/ZKYOyNH8oCLQ6TcpmrLqefGbO7uYuWsfOKLm8R8
 zE78Vv8D4MVbqHxPjuya4u2tJ7WYTVBSyjYasv5rS/tX8GVA6VQ/WPxk5lFcVu9VC0Md
 O7IQ==
X-Gm-Message-State: AOAM533WN7iy0SNVyjRW8CI4gBxQ+rsvQ0OizWncqp2LEaXvrxUqN8o8
 wZeSDR72zRBwM5W9Q+U7W8iA9wZzjDKLOSFGcu7f
X-Google-Smtp-Source: ABdhPJzdwnYiDfjlPyPemJ3Ro9PhM3VNHou0DSNi3u6TdxFi0k8NACvo6B/YP5o1op79bxLGBjRvFi3nTcqQAlAWIPU=
X-Received: by 2002:a25:86c4:: with SMTP id y4mr7865478ybm.258.1635464464543; 
 Thu, 28 Oct 2021 16:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2oV9fNtsY258h6zQS6Us7GyW6B_ox6U1Um2Why354-gA@mail.gmail.com>
 <mhng-730fea8d-0455-4333-a731-1e7b0e062587@palmerdabbelt-glaptop>
In-Reply-To: <mhng-730fea8d-0455-4333-a731-1e7b0e062587@palmerdabbelt-glaptop>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 28 Oct 2021 16:40:53 -0700
Message-ID: <CAOnJCU+ikYtAh5Pjzk+jkc_sUpTktmF-aDkafv2EE_6Ymp5F_Q@mail.gmail.com>
Subject: Re: Out-of-bounds access when hartid >= NR_CPUS
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, re@w6rz.net, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_164106_124320_C9396311 
X-CRM114-Status: GOOD (  39.51  )
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

T24gVGh1LCBPY3QgMjgsIDIwMjEgYXQgMTA6MTYgQU0gUGFsbWVyIERhYmJlbHQgPHBhbG1lckBk
YWJiZWx0LmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIDI4IE9jdCAyMDIxIDA5OjIxOjMxIFBEVCAo
LTA3MDApLCBhbnVwQGJyYWluZmF1bHQub3JnIHdyb3RlOgo+ID4gT24gVGh1LCBPY3QgMjgsIDIw
MjEgYXQgODozOSBQTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPiB3cm90ZToK
PiA+Pgo+ID4+IE9uIFdlZCwgMjcgT2N0IDIwMjEgMTY6MzQ6MTUgUERUICgtMDcwMCksIGF0aXNo
cEBhdGlzaHBhdHJhLm9yZyB3cm90ZToKPiA+PiA+IE9uIFR1ZSwgT2N0IDI2LCAyMDIxIGF0IDI6
MzQgQU0gSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4gPj4gPj4KPiA+
PiA+PiBBbSBEaWVuc3RhZywgMjYuIE9rdG9iZXIgMjAyMSwgMTA6NTc6MjYgQ0VTVCBzY2hyaWVi
IEdlZXJ0IFV5dHRlcmhvZXZlbjoKPiA+PiA+PiA+IEhpIEhlaWtvLAo+ID4+ID4+ID4KPiA+PiA+
PiA+IE9uIFR1ZSwgT2N0IDI2LCAyMDIxIGF0IDEwOjUzIEFNIEhlaWtvIFN0w7xibmVyIDxoZWlr
b0BzbnRlY2guZGU+IHdyb3RlOgo+ID4+ID4+ID4gPiBBbSBEaWVuc3RhZywgMjYuIE9rdG9iZXIg
MjAyMSwgMDg6NDQ6MzEgQ0VTVCBzY2hyaWViIEdlZXJ0IFV5dHRlcmhvZXZlbjoKPiA+PiA+PiA+
ID4gPiBPbiBUdWUsIE9jdCAyNiwgMjAyMSBhdCAyOjM3IEFNIFJvbiBFY29ub21vcyA8cmVAdzZy
ei5uZXQ+IHdyb3RlOgo+ID4+ID4+ID4gPiA+ID4gT24gMTAvMjUvMjEgODo1NCBBTSwgR2VlcnQg
VXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4+ID4+ID4gPiA+ID4gPiBXaGVuIGJvb3RpbmcgYSBrZXJu
ZWwgd2l0aCBDT05GSUdfTlJfQ1BVUz00IG9uIE1pY3JvY2hpcCBQb2xhckZpcmUsCj4gPj4gPj4g
PiA+ID4gPiA+IHRoZSA0dGggQ1BVIGVpdGhlciBmYWlscyB0byBjb21lIG9ubGluZSwgb3IgdGhl
IHN5c3RlbSBjcmFzaGVzLgo+ID4+ID4+ID4gPiA+ID4gPgo+ID4+ID4+ID4gPiA+ID4gPiBUaGlz
IGhhcHBlbnMgYmVjYXVzZSBQb2xhckZpcmUgaGFzIDUgQ1BVIGNvcmVzOiBoYXJ0IDAgaXMgYW4g
ZTUxLAo+ID4+ID4+ID4gPiA+ID4gPiBhbmQgaGFydHMgMS00IGFyZSB1NTRzLCB3aXRoIHRoZSBs
YXR0ZXIgYmVjb21pbmcgQ1BVcyAwLTMgaW4gTGludXg6Cj4gPj4gPj4gPiA+ID4gPiA+ICAgIC0g
dW51c2VkIGNvcmUgaGFzIGhhcnRpZCAwIChzaWZpdmUsZTUxKSwKPiA+PiA+PiA+ID4gPiA+ID4g
ICAgLSBwcm9jZXNzb3IgMCBoYXMgaGFydGlkIDEgKHNpZml2ZSx1NzQtbWMpLAo+ID4+ID4+ID4g
PiA+ID4gPiAgICAtIHByb2Nlc3NvciAxIGhhcyBoYXJ0aWQgMiAoc2lmaXZlLHU3NC1tYyksCj4g
Pj4gPj4gPiA+ID4gPiA+ICAgIC0gcHJvY2Vzc29yIDIgaGFzIGhhcnRpZCAzIChzaWZpdmUsdTc0
LW1jKSwKPiA+PiA+PiA+ID4gPiA+ID4gICAgLSBwcm9jZXNzb3IgMyBoYXMgaGFydGlkIDQgKHNp
Zml2ZSx1NzQtbWMpLgo+ID4+ID4+ID4gPiA+ID4gPgo+ID4+ID4+ID4gPiA+ID4gPiBJIGFzc3Vt
ZSB0aGUgc2FtZSBpc3N1ZSBpcyBwcmVzZW50IG9uIHRoZSBTaUZpdmUgZnU1NDAgYW5kIGZ1NzQw
Cj4gPj4gPj4gPiA+ID4gPiA+IFNvQ3MsIGJ1dCBJIGRvbid0IGhhdmUgYWNjZXNzIHRvIHRoZXNl
LiAgVGhlIGlzc3VlIGlzIG5vdCBwcmVzZW50Cj4gPj4gPj4gPiA+ID4gPiA+IG9uIFN0YXJGaXZl
IEpINzEwMCwgYXMgcHJvY2Vzc29yIDAgaGFzIGhhcnRpZCAxLCBhbmQgcHJvY2Vzc29yIDEgaGFz
Cj4gPj4gPj4gPiA+ID4gPiA+IGhhcnRpZCAwLgo+ID4+ID4+ID4gPiA+ID4gPgo+ID4+ID4+ID4g
PiA+ID4gPiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVfb3BzLmMgaGFzOgo+ID4+ID4+ID4gPiA+ID4g
Pgo+ID4+ID4+ID4gPiA+ID4gPiAgICAgIHZvaWQgKl9fY3B1X3VwX3N0YWNrX3BvaW50ZXJbTlJf
Q1BVU10gX19zZWN0aW9uKCIuZGF0YSIpOwo+ID4+ID4+ID4gPiA+ID4gPiAgICAgIHZvaWQgKl9f
Y3B1X3VwX3Rhc2tfcG9pbnRlcltOUl9DUFVTXSBfX3NlY3Rpb24oIi5kYXRhIik7Cj4gPj4gPj4g
PiA+ID4gPiA+Cj4gPj4gPj4gPiA+ID4gPiA+ICAgICAgdm9pZCBjcHVfdXBkYXRlX3NlY29uZGFy
eV9ib290ZGF0YSh1bnNpZ25lZCBpbnQgY3B1aWQsCj4gPj4gPj4gPiA+ID4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRpZGxl
KQo+ID4+ID4+ID4gPiA+ID4gPiAgICAgIHsKPiA+PiA+PiA+ID4gPiA+ID4gICAgICAgICAgICAg
IGludCBoYXJ0aWQgPSBjcHVpZF90b19oYXJ0aWRfbWFwKGNwdWlkKTsKPiA+PiA+PiA+ID4gPiA+
ID4KPiA+PiA+PiA+ID4gPiA+ID4gICAgICAgICAgICAgIC8qIE1ha2Ugc3VyZSB0aWRsZSBpcyB1
cGRhdGVkICovCj4gPj4gPj4gPiA+ID4gPiA+ICAgICAgICAgICAgICBzbXBfbWIoKTsKPiA+PiA+
PiA+ID4gPiA+ID4gICAgICAgICAgICAgIFdSSVRFX09OQ0UoX19jcHVfdXBfc3RhY2tfcG9pbnRl
cltoYXJ0aWRdLAo+ID4+ID4+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICB0YXNr
X3N0YWNrX3BhZ2UodGlkbGUpICsgVEhSRUFEX1NJWkUpOwo+ID4+ID4+ID4gPiA+ID4gPiAgICAg
ICAgICAgICAgV1JJVEVfT05DRShfX2NwdV91cF90YXNrX3BvaW50ZXJbaGFydGlkXSwgdGlkbGUp
Owo+ID4+ID4+ID4gPiA+ID4gPgo+ID4+ID4+ID4gPiA+ID4gPiBUaGUgYWJvdmUgdHdvIHdyaXRl
cyBjYXVzZSBvdXQtb2YtYm91bmQgYWNjZXNzZXMgYmV5b25kCj4gPj4gPj4gPiA+ID4gPiA+IF9f
Y3B1X3VwX3tzdGFjayxwb2ludGVyfV9wb2ludGVyW10gaWYgaGFydGlkID49IENPTkZJR19OUl9D
UFVTLgo+ID4+ID4+ID4gPiA+ID4gPgo+ID4+ID4+ID4gPiA+ID4gPiAgICAgIH0KPiA+PiA+PiA+
Cj4gPj4gPj4gPiA+ID4gaHR0cHM6Ly9yaXNjdi5vcmcvd3AtY29udGVudC91cGxvYWRzLzIwMTcv
MDUvcmlzY3YtcHJpdmlsZWdlZC12MS4xMC5wZGYKPiA+PiA+PiA+ID4gPiBzYXlzOgo+ID4+ID4+
ID4gPiA+Cj4gPj4gPj4gPiA+ID4gICAgIEhhcnQgSURzIG1pZ2h0IG5vdCBuZWNlc3NhcmlseSBi
ZSBudW1iZXJlZCBjb250aWd1b3VzbHkgaW4gYQo+ID4+ID4+ID4gPiA+ICAgICBtdWx0aXByb2Nl
c3NvciBzeXN0ZW0sIGJ1dCBhdCBsZWFzdCBvbmUgaGFydCBtdXN0IGhhdmUgYSBoYXJ0Cj4gPj4g
Pj4gPiA+ID4gICAgIElEIG9mIHplcm8uCj4gPj4gPj4gPiA+ID4KPiA+PiA+PiA+ID4gPiBXaGlj
aCBtZWFucyBpbmRleGluZyBhcnJheXMgYnkgaGFydCBJRCBpcyBhIG5vLWdvPwo+ID4+ID4+ID4g
Pgo+ID4+ID4+ID4gPiBJc24ndCB0aGF0IGFsc28gc2ltaWxhciBvbiBhYXJjaDY0Pwo+ID4+ID4+
ID4gPgo+ID4+ID4+ID4gPiBPbiBhIHJrMzM5OSB5b3UgZ2V0IDAtMyBhbmQgMTAwLTEwMSBhbmQg
d2l0aCB0aGUgcGFyYWdyYXBoIGFib3ZlCj4gPj4gPj4gPiA+IHNvbWV0aGluZyBsaWtlIHRoaXMg
Y291bGQgdmVyeSB3ZWxsIGV4aXN0IG9uIHNvbWUgcmlzY3YgY3B1IHRvbyBJIGd1ZXNzLgo+ID4+
ID4+ID4KPiA+PiA+PiA+IFllcywgaXQgbG9va3MgbGlrZSBoYXJ0IElEcyBhcmUgc2ltaWxhciB0
byBNUElEUnMgb24gQVJNLgo+ID4+ID4+Cj4gPj4gPj4gYW5kIHRoZXkgaGF2ZSB0aGUgc2V0X2Nw
dV9sb2dpY2FsX21hcCBjb25zdHJ1Y3QgdG8gbWFwIGh3aWRzCj4gPj4gPj4gdG8gYSBjb250aW51
b3VzIGxpc3Qgb2YgY3B1LWlkcy4KPiA+PiA+Pgo+ID4+ID4+IFNvIHdpdGggaGFydGlkcyBub3Qg
YmVpbmcgbmVjZXNzYXJpbHkgY29udGludW91cyB0aGlzIGxvb2tzIGxpa2UKPiA+PiA+PiByaXNj
diB3b3VsZCBuZWVkIGEgc2ltaWxhciBtZWNoYW5pc20uCj4gPj4gPj4KPiA+PiA+Cj4gPj4gPiBS
SVNDLVYgYWxyZWFkeSBoYXMgYSBzaW1pbGFyIG1lY2hhbmlzbSBjcHVpZF90b19oYXJ0aWRfbWFw
LiBMb2dpY2FsCj4gPj4gPiBjcHUgaWRzIGFyZSBjb250aW51b3VzCj4gPj4gPiB3aGlsZSBoYXJ0
aWQgY2FuIGJlIHNwYXJzZS4KPiA+PiA+Cj4gPj4gPiBUaGUgaXNzdWUgaGVyZSBpcyB0aGF0IF9f
Y3B1X3VwX3N0YWNrL3Rhc2tfcG9pbnRlciBhcmUgcGVyIGhhcnQgYnV0Cj4gPj4gPiBhcnJheSBz
aXplIGRlcGVuZHMgb24gdGhlIE5SX0NQVXMKPiA+PiA+IHdoaWNoIHJlcHJlc2VudHMgdGhlIGxv
Z2ljYWwgQ1BVLgo+ID4+ID4KPiA+PiA+IFRoYXQncyB3aHksIGhhdmluZyBhIG1heGltdW0gbnVt
YmVyIG9mIGhhcnRpZHMgZGVmaW5lZCBpbiBjb25maWcgd2lsbAo+ID4+ID4gYmUgaGVscGZ1bC4K
PiA+Pgo+ID4+IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgd2UnZCBoYXZlIGJvdGg6IGlmIHdlIGNh
bid0IGZpbmQgYSBDUFUgbnVtYmVyIGZvcgo+ID4+IGEgaGFydCwgdGhlbiBhbGwgd2UgY2FuIGRv
IGlzIGp1c3QgbGVhdmUgaXQgb2ZmbGluZS4gIFdvdWxkbid0IGl0IGJlCj4gPj4gc2ltcGxlciB0
byBqdXN0IHJlbHkgb24gTlJfQ1BVUz8gIFdlJ2xsIG5lZWQgdG8gZml4IHRoZSBjcmFzaGVzIG9u
Cj4gPj4gb3ZlcmZsb3dzIGVpdGhlciB3YXkuLAo+ID4KPiA+IEZvciBIU00gb3BzLCB3ZSBjYW4g
ZWFzaWx5IGZpeCB0aGlzIGxpbWl0YXRpb24gYmVjYXVzZSB0aGUgSEFSVAo+ID4gc3RhcnQgY2Fs
bCBoYXMgYW4gb3BhcXVlIHBhcmFtZXRlciB3aGljaCBjYW4gYmUgdXNlZCB0byBzcGVjaWZ5IFRQ
Cj4gPiBhbmQgU1AgZm9yIHRoZSBIQVJUIGJlaW5nIGJyb3VnaHQgdXAuCj4gPgoKU291bmRzIGdv
b2QgdG8gbWUuIEkgd2lsbCB0cnkgdG8gc2VuZCBhIHBhdGNoLgoKPiA+IEZvciBzcGlud2FpdCBv
cHMsIEkgZG9uJ3Qgc2VlIG11Y2ggdmFsdWUgaW4gZml4aW5nIHNwYXJzZSBoYXJ0aWQKPiA+IHBy
b2JsZW1zIHNvIGxldCdzIGRvY3VtZW50IHRoaXMgcHJvYmxlbSBhbmQgaGF2ZSBhcHByb3ByaWF0
ZQo+ID4gY2hlY2tzIGluIHNwaW53YWl0IG9wcyBmb3Igb3V0LW9mLWJvdW5kIGFycmF5IGNoZWNr
cy4KPgo+IFNlZW1zIHJlYXNvbmFibGUuICBUaGF0J3MgdGhlIGxlZ2FjeSBtZXRob2QgYW55d2F5
LCBzbyBob3BlZnVsbHkgdmVuZG9ycwo+IHdpbGwgaGF2ZSBtb3ZlZCB0byB0aGUgbmV3IHN0dWZm
IGJ5IHRoZSB0aW1lIHdlIGdldCBzdWZmaWNpZW50bHkgc3BhcnNlCj4gaGFydCBJRHMgdGhhdCB0
aGlzIG1hdHRlcnMuCgpJIGhvcGUgc28gdG9vLiBBdCBsZWFzdCBkb2N1bWVudGluZyB0aGlzIGJ1
ZyB3b3VsZCBiZSB1c2VmdWwgZm9yCmFueWJvZHkgdHJhcHBpbmcgdGhpcyBidWcgd2hpbGUKdXNp
bmcgb2xkZXIgc3BpbndhaXQgbWV0aG9kcy4gSXQgd2lsbCBiZSBhbiBleGN1c2UgZm9yIHRoZW0g
dG8gbW92ZSB0bwpzaGlueSAmIGJldHRlciBib290aW5nIG1ldGhvZHMuCgo+Cj4gV2Ugc2hvdWxk
IGZpeCB0aGUgY3Jhc2hlcywgdGhvdWdoLiAgSGFwcHkgdG8gdGFrZSBhIHBhdGNoLCBvdGhlcndp
c2UKPiBJJ2xsIHRocm93IHNvbWV0aGluZyB0b2dldGhlci4KPgo+ID4KPiA+IFJlZ2FyZHMsCj4g
PiBBbnVwCgoKCi0tIApSZWdhcmRzLApBdGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
