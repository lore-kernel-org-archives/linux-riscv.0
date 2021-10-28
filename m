Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEFCC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 16:21:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C3D160FC4
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 16:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C3D160FC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGTz1nno8D8I9qS2Otw7XaZrO7Z4HOeOeUV5l763vfo=; b=myC79PwZ72vIxD
	EyxnAoUMTSp1euXKTgoBESOV3xHMwtN64FObKlz1ykTMIFpGk2JqspsYKSo3AJEikK9H0hrDFPalD
	mz/y/TxPOVT7skyzjyKm4md9tUP2357NueFhHiaK7xkOzKxmYLbfFlqhe32t/Rw6b7hMNc8+eiF4v
	k+foABWnbiVeY5T9AvC9rFYjcEAhYj4xN9e6qZtoBv+sJrznqRYfiI5AWbOGToIflNMQbFrjQJyEk
	aDTHsxaAQ5P7/O5iR8sBj7Zhnbsp/VMogvKcrME2ryu0ZCiiIduefYH9eUiv69ewrgbblLblFdn0U
	NUIzOtP/KoBn7aqx1qsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg89z-008ZHe-Jz; Thu, 28 Oct 2021 16:21:47 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg89w-008ZGn-NX
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 16:21:46 +0000
Received: by mail-wm1-x32a.google.com with SMTP id m42so6313181wms.2
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 09:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m20iJzl8FCJn3/Aq4QjAnuM6BFP3jWxbcygupmKPknQ=;
 b=WDooaRy7PXz6OqsUeaLv8dmpmyg/sNWvRiEqsEd6HD4elIO6AGrhnc/P5BFTMA1H+W
 Jz2XP6P5SrsOusyzxIfKt0gpEyZhSY+5rSvk956c5oZ/+0QN3iiHOzfe9kUAvqI0fPHi
 /gxnjfzRLGkZ9clVei9RxyalrDzjj4WAvaK/3YiiRjBGXB1pVBa6WKUAusNMAEpB/A7T
 eWIKGk/eRkw7P5kJarT06cSwfAtnLqpIiweucWHx/RIhJpMHAX0BWbdlQwbWS+nDIb2z
 130XTrigzHvGSJEpKEcMaojXdlddl5LgaZNHKeMqvmoYDyH4jndO469YjiPsv7ByOxo+
 L5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m20iJzl8FCJn3/Aq4QjAnuM6BFP3jWxbcygupmKPknQ=;
 b=rnxoElo/ADI0e73/Z1m1DZg7OZnN81f+K60evgS/WqW62nCnaqCOh1xWL+GK/er6dT
 SgnSR5iRBcqs1ekpaOeAjKUXIGgpEH+jwYOoJy4ZcVElO//82AFKeEuGrfLvEjAre0l3
 SEK7utyb2VuQnNfLTfz4xerPOKHEu64lBu+3+BQUIAcGyuk/rviqjdq8zR0+pUPyAVMM
 NnsU8SAN8xNjCntO8oFton0Wn2FP1pK+z6hB+MZtbCS+3mJxLv4ppN1v40kYyzyBRy6b
 7lecL82pweh+sYBzLfayoDBSWCFNARjx8BmLD0FUaw5bGaJJ2M4blC50SZ5ThF/LeMq6
 jGsg==
X-Gm-Message-State: AOAM531o9HqWTHt5YNlnEdTq4YkJcdvF4BdFsqixGFkvjj8q+IamtVot
 4/57JM+vBpD+iFLM+eF51SmjFZ7qkPt5dEYaxtm92Q==
X-Google-Smtp-Source: ABdhPJzclTDye6i6Mg+/6rgfW/2emgoOi3qnHH4nhc0/AORC01ItLoXAFvdAIP1y/8e/hTe3hzSkvV1n0cRr4jofZ+g=
X-Received: by 2002:a05:600c:2f97:: with SMTP id
 t23mr13981310wmn.59.1635438102851; 
 Thu, 28 Oct 2021 09:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAOnJCU+MSP1QdpRRGYUpen8xZU+kn3PcSMJnZnRQw-iATs8JgQ@mail.gmail.com>
 <mhng-51188428-41ff-4962-b548-bf514a779723@palmerdabbelt-glaptop>
In-Reply-To: <mhng-51188428-41ff-4962-b548-bf514a779723@palmerdabbelt-glaptop>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 28 Oct 2021 21:51:31 +0530
Message-ID: <CAAhSdy2oV9fNtsY258h6zQS6Us7GyW6B_ox6U1Um2Why354-gA@mail.gmail.com>
Subject: Re: Out-of-bounds access when hartid >= NR_CPUS
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Atish Patra <atishp@atishpatra.org>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, re@w6rz.net, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_092144_805055_4A40F7A8 
X-CRM114-Status: GOOD (  34.94  )
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

T24gVGh1LCBPY3QgMjgsIDIwMjEgYXQgODozOSBQTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRh
YmJlbHQuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgMjcgT2N0IDIwMjEgMTY6MzQ6MTUgUERUICgt
MDcwMCksIGF0aXNocEBhdGlzaHBhdHJhLm9yZyB3cm90ZToKPiA+IE9uIFR1ZSwgT2N0IDI2LCAy
MDIxIGF0IDI6MzQgQU0gSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4g
Pj4KPiA+PiBBbSBEaWVuc3RhZywgMjYuIE9rdG9iZXIgMjAyMSwgMTA6NTc6MjYgQ0VTVCBzY2hy
aWViIEdlZXJ0IFV5dHRlcmhvZXZlbjoKPiA+PiA+IEhpIEhlaWtvLAo+ID4+ID4KPiA+PiA+IE9u
IFR1ZSwgT2N0IDI2LCAyMDIxIGF0IDEwOjUzIEFNIEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRl
Y2guZGU+IHdyb3RlOgo+ID4+ID4gPiBBbSBEaWVuc3RhZywgMjYuIE9rdG9iZXIgMjAyMSwgMDg6
NDQ6MzEgQ0VTVCBzY2hyaWViIEdlZXJ0IFV5dHRlcmhvZXZlbjoKPiA+PiA+ID4gPiBPbiBUdWUs
IE9jdCAyNiwgMjAyMSBhdCAyOjM3IEFNIFJvbiBFY29ub21vcyA8cmVAdzZyei5uZXQ+IHdyb3Rl
Ogo+ID4+ID4gPiA+ID4gT24gMTAvMjUvMjEgODo1NCBBTSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdy
b3RlOgo+ID4+ID4gPiA+ID4gPiBXaGVuIGJvb3RpbmcgYSBrZXJuZWwgd2l0aCBDT05GSUdfTlJf
Q1BVUz00IG9uIE1pY3JvY2hpcCBQb2xhckZpcmUsCj4gPj4gPiA+ID4gPiA+IHRoZSA0dGggQ1BV
IGVpdGhlciBmYWlscyB0byBjb21lIG9ubGluZSwgb3IgdGhlIHN5c3RlbSBjcmFzaGVzLgo+ID4+
ID4gPiA+ID4gPgo+ID4+ID4gPiA+ID4gPiBUaGlzIGhhcHBlbnMgYmVjYXVzZSBQb2xhckZpcmUg
aGFzIDUgQ1BVIGNvcmVzOiBoYXJ0IDAgaXMgYW4gZTUxLAo+ID4+ID4gPiA+ID4gPiBhbmQgaGFy
dHMgMS00IGFyZSB1NTRzLCB3aXRoIHRoZSBsYXR0ZXIgYmVjb21pbmcgQ1BVcyAwLTMgaW4gTGlu
dXg6Cj4gPj4gPiA+ID4gPiA+ICAgIC0gdW51c2VkIGNvcmUgaGFzIGhhcnRpZCAwIChzaWZpdmUs
ZTUxKSwKPiA+PiA+ID4gPiA+ID4gICAgLSBwcm9jZXNzb3IgMCBoYXMgaGFydGlkIDEgKHNpZml2
ZSx1NzQtbWMpLAo+ID4+ID4gPiA+ID4gPiAgICAtIHByb2Nlc3NvciAxIGhhcyBoYXJ0aWQgMiAo
c2lmaXZlLHU3NC1tYyksCj4gPj4gPiA+ID4gPiA+ICAgIC0gcHJvY2Vzc29yIDIgaGFzIGhhcnRp
ZCAzIChzaWZpdmUsdTc0LW1jKSwKPiA+PiA+ID4gPiA+ID4gICAgLSBwcm9jZXNzb3IgMyBoYXMg
aGFydGlkIDQgKHNpZml2ZSx1NzQtbWMpLgo+ID4+ID4gPiA+ID4gPgo+ID4+ID4gPiA+ID4gPiBJ
IGFzc3VtZSB0aGUgc2FtZSBpc3N1ZSBpcyBwcmVzZW50IG9uIHRoZSBTaUZpdmUgZnU1NDAgYW5k
IGZ1NzQwCj4gPj4gPiA+ID4gPiA+IFNvQ3MsIGJ1dCBJIGRvbid0IGhhdmUgYWNjZXNzIHRvIHRo
ZXNlLiAgVGhlIGlzc3VlIGlzIG5vdCBwcmVzZW50Cj4gPj4gPiA+ID4gPiA+IG9uIFN0YXJGaXZl
IEpINzEwMCwgYXMgcHJvY2Vzc29yIDAgaGFzIGhhcnRpZCAxLCBhbmQgcHJvY2Vzc29yIDEgaGFz
Cj4gPj4gPiA+ID4gPiA+IGhhcnRpZCAwLgo+ID4+ID4gPiA+ID4gPgo+ID4+ID4gPiA+ID4gPiBh
cmNoL3Jpc2N2L2tlcm5lbC9jcHVfb3BzLmMgaGFzOgo+ID4+ID4gPiA+ID4gPgo+ID4+ID4gPiA+
ID4gPiAgICAgIHZvaWQgKl9fY3B1X3VwX3N0YWNrX3BvaW50ZXJbTlJfQ1BVU10gX19zZWN0aW9u
KCIuZGF0YSIpOwo+ID4+ID4gPiA+ID4gPiAgICAgIHZvaWQgKl9fY3B1X3VwX3Rhc2tfcG9pbnRl
cltOUl9DUFVTXSBfX3NlY3Rpb24oIi5kYXRhIik7Cj4gPj4gPiA+ID4gPiA+Cj4gPj4gPiA+ID4g
PiA+ICAgICAgdm9pZCBjcHVfdXBkYXRlX3NlY29uZGFyeV9ib290ZGF0YSh1bnNpZ25lZCBpbnQg
Y3B1aWQsCj4gPj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRpZGxlKQo+ID4+ID4gPiA+ID4gPiAgICAgIHsKPiA+
PiA+ID4gPiA+ID4gICAgICAgICAgICAgIGludCBoYXJ0aWQgPSBjcHVpZF90b19oYXJ0aWRfbWFw
KGNwdWlkKTsKPiA+PiA+ID4gPiA+ID4KPiA+PiA+ID4gPiA+ID4gICAgICAgICAgICAgIC8qIE1h
a2Ugc3VyZSB0aWRsZSBpcyB1cGRhdGVkICovCj4gPj4gPiA+ID4gPiA+ICAgICAgICAgICAgICBz
bXBfbWIoKTsKPiA+PiA+ID4gPiA+ID4gICAgICAgICAgICAgIFdSSVRFX09OQ0UoX19jcHVfdXBf
c3RhY2tfcG9pbnRlcltoYXJ0aWRdLAo+ID4+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICB0YXNrX3N0YWNrX3BhZ2UodGlkbGUpICsgVEhSRUFEX1NJWkUpOwo+ID4+ID4gPiA+ID4g
PiAgICAgICAgICAgICAgV1JJVEVfT05DRShfX2NwdV91cF90YXNrX3BvaW50ZXJbaGFydGlkXSwg
dGlkbGUpOwo+ID4+ID4gPiA+ID4gPgo+ID4+ID4gPiA+ID4gPiBUaGUgYWJvdmUgdHdvIHdyaXRl
cyBjYXVzZSBvdXQtb2YtYm91bmQgYWNjZXNzZXMgYmV5b25kCj4gPj4gPiA+ID4gPiA+IF9fY3B1
X3VwX3tzdGFjayxwb2ludGVyfV9wb2ludGVyW10gaWYgaGFydGlkID49IENPTkZJR19OUl9DUFVT
Lgo+ID4+ID4gPiA+ID4gPgo+ID4+ID4gPiA+ID4gPiAgICAgIH0KPiA+PiA+Cj4gPj4gPiA+ID4g
aHR0cHM6Ly9yaXNjdi5vcmcvd3AtY29udGVudC91cGxvYWRzLzIwMTcvMDUvcmlzY3YtcHJpdmls
ZWdlZC12MS4xMC5wZGYKPiA+PiA+ID4gPiBzYXlzOgo+ID4+ID4gPiA+Cj4gPj4gPiA+ID4gICAg
IEhhcnQgSURzIG1pZ2h0IG5vdCBuZWNlc3NhcmlseSBiZSBudW1iZXJlZCBjb250aWd1b3VzbHkg
aW4gYQo+ID4+ID4gPiA+ICAgICBtdWx0aXByb2Nlc3NvciBzeXN0ZW0sIGJ1dCBhdCBsZWFzdCBv
bmUgaGFydCBtdXN0IGhhdmUgYSBoYXJ0Cj4gPj4gPiA+ID4gICAgIElEIG9mIHplcm8uCj4gPj4g
PiA+ID4KPiA+PiA+ID4gPiBXaGljaCBtZWFucyBpbmRleGluZyBhcnJheXMgYnkgaGFydCBJRCBp
cyBhIG5vLWdvPwo+ID4+ID4gPgo+ID4+ID4gPiBJc24ndCB0aGF0IGFsc28gc2ltaWxhciBvbiBh
YXJjaDY0Pwo+ID4+ID4gPgo+ID4+ID4gPiBPbiBhIHJrMzM5OSB5b3UgZ2V0IDAtMyBhbmQgMTAw
LTEwMSBhbmQgd2l0aCB0aGUgcGFyYWdyYXBoIGFib3ZlCj4gPj4gPiA+IHNvbWV0aGluZyBsaWtl
IHRoaXMgY291bGQgdmVyeSB3ZWxsIGV4aXN0IG9uIHNvbWUgcmlzY3YgY3B1IHRvbyBJIGd1ZXNz
Lgo+ID4+ID4KPiA+PiA+IFllcywgaXQgbG9va3MgbGlrZSBoYXJ0IElEcyBhcmUgc2ltaWxhciB0
byBNUElEUnMgb24gQVJNLgo+ID4+Cj4gPj4gYW5kIHRoZXkgaGF2ZSB0aGUgc2V0X2NwdV9sb2dp
Y2FsX21hcCBjb25zdHJ1Y3QgdG8gbWFwIGh3aWRzCj4gPj4gdG8gYSBjb250aW51b3VzIGxpc3Qg
b2YgY3B1LWlkcy4KPiA+Pgo+ID4+IFNvIHdpdGggaGFydGlkcyBub3QgYmVpbmcgbmVjZXNzYXJp
bHkgY29udGludW91cyB0aGlzIGxvb2tzIGxpa2UKPiA+PiByaXNjdiB3b3VsZCBuZWVkIGEgc2lt
aWxhciBtZWNoYW5pc20uCj4gPj4KPiA+Cj4gPiBSSVNDLVYgYWxyZWFkeSBoYXMgYSBzaW1pbGFy
IG1lY2hhbmlzbSBjcHVpZF90b19oYXJ0aWRfbWFwLiBMb2dpY2FsCj4gPiBjcHUgaWRzIGFyZSBj
b250aW51b3VzCj4gPiB3aGlsZSBoYXJ0aWQgY2FuIGJlIHNwYXJzZS4KPiA+Cj4gPiBUaGUgaXNz
dWUgaGVyZSBpcyB0aGF0IF9fY3B1X3VwX3N0YWNrL3Rhc2tfcG9pbnRlciBhcmUgcGVyIGhhcnQg
YnV0Cj4gPiBhcnJheSBzaXplIGRlcGVuZHMgb24gdGhlIE5SX0NQVXMKPiA+IHdoaWNoIHJlcHJl
c2VudHMgdGhlIGxvZ2ljYWwgQ1BVLgo+ID4KPiA+IFRoYXQncyB3aHksIGhhdmluZyBhIG1heGlt
dW0gbnVtYmVyIG9mIGhhcnRpZHMgZGVmaW5lZCBpbiBjb25maWcgd2lsbAo+ID4gYmUgaGVscGZ1
bC4KPgo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgd2UnZCBoYXZlIGJvdGg6IGlmIHdlIGNhbid0
IGZpbmQgYSBDUFUgbnVtYmVyIGZvcgo+IGEgaGFydCwgdGhlbiBhbGwgd2UgY2FuIGRvIGlzIGp1
c3QgbGVhdmUgaXQgb2ZmbGluZS4gIFdvdWxkbid0IGl0IGJlCj4gc2ltcGxlciB0byBqdXN0IHJl
bHkgb24gTlJfQ1BVUz8gIFdlJ2xsIG5lZWQgdG8gZml4IHRoZSBjcmFzaGVzIG9uCj4gb3ZlcmZs
b3dzIGVpdGhlciB3YXkuLAoKRm9yIEhTTSBvcHMsIHdlIGNhbiBlYXNpbHkgZml4IHRoaXMgbGlt
aXRhdGlvbiBiZWNhdXNlIHRoZSBIQVJUCnN0YXJ0IGNhbGwgaGFzIGFuIG9wYXF1ZSBwYXJhbWV0
ZXIgd2hpY2ggY2FuIGJlIHVzZWQgdG8gc3BlY2lmeSBUUAphbmQgU1AgZm9yIHRoZSBIQVJUIGJl
aW5nIGJyb3VnaHQgdXAuCgpGb3Igc3BpbndhaXQgb3BzLCBJIGRvbid0IHNlZSBtdWNoIHZhbHVl
IGluIGZpeGluZyBzcGFyc2UgaGFydGlkCnByb2JsZW1zIHNvIGxldCdzIGRvY3VtZW50IHRoaXMg
cHJvYmxlbSBhbmQgaGF2ZSBhcHByb3ByaWF0ZQpjaGVja3MgaW4gc3BpbndhaXQgb3BzIGZvciBv
dXQtb2YtYm91bmQgYXJyYXkgY2hlY2tzLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
