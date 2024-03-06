Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFBAC5475B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 15:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJx1exrQu+vfoTPmhC0bLehnGVLYmcep37XZdInxRDk=; b=zxB9PUNBHEZxe4
	watVtGRffbZAIC+Dnf6y50qSILIgyPNHANojpiN0avmLMPxsAeZwUtYM1sO1F9F9lCbvmIjkjyjWs
	BqocpS4MP5LSO17Nnqq8S589xg/Y0pPjgdxQ7IZbjNF/Q+VdBKz4RkFIZO6NB0tkULpnmb6aP0H5g
	4Gfg2hlHu/Q7lvaIPkuRMVdwqjEKpOpdSX+Dt4+rky/cPx1Ren6Dl7s1scR8UTQYTf6/e9vQVRK2f
	FNtLWVtNrlSd4AgUCNuSHGSugvYk6U8+3kumyLSSvvovzPxwt/qMDzTUTf8imwIRsTc2QdGAQJ5BG
	49NMp9Gf8UNyfyJmzb6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhtSB-00000000ptB-1aA3;
	Wed, 06 Mar 2024 15:45:11 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhtS2-00000000po2-3cI5
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 15:45:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 74E33CE2248
	for <linux-riscv@lists.infradead.org>; Wed,  6 Mar 2024 15:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C5FC43390
	for <linux-riscv@lists.infradead.org>; Wed,  6 Mar 2024 15:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709739894;
	bh=xAMk5pyQz9UpONsmW/NTVfslqq+/KWb7t3IHJQofhDY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Bt9qKUxpXeQbrb3YWiQG107FywHj/KBKWMw0SlOwakgqbFM5qD08sPyDiZH4wjlek
	 HEJgKL2jFfFLlL485CVPWXisPcoBiMCU/sa5Po2HmrcHO8pnNUs1WdfuONH/h9BQMI
	 WfyiKCITC7HP60eexhpGpwKo4+YfLEt1SAIASxTIhhOkFUGGJSss68mjn9vkH5JY0W
	 G8ag3DY1HdnMu+cNgJDH9dteyZwUcHC1wdDtHRgik6NzjKfLwhnfuAcVOc9jkjEjsJ
	 fOat8NPPi3zWTNZMA30t2CNSBh/Edn88hjUun4/gq+0pw/2G92Y4bBFBsn+foL17Gs
	 fk2eqzYXOcCzQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-512f54fc2dbso6208046e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 07:44:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXOgk0x2RbXOrfBqjg65sxMQwx1Yy1oG8h82USHb/o1EaWwba3Bw6yd+U1HtLFMNAH/wE9cNrXvnivhP7xodcwQc7Ia8fZEHKTvg8wy+VK4
X-Gm-Message-State: AOJu0YyrwLS//5d6twcGpsfs5EkgeD+b+him0F7e0Rh8PscUKHvsrdvq
	8Xwx4Sntf6dzheGLfptpiDM6pEodgfzgNyXzZRlcJzPQo46Qn4LNMs9z8G+QoJ8ueCnAweay9Bg
	f7pIiamYbdhLncbAKweom37uOnmk=
X-Google-Smtp-Source: AGHT+IG8a8zdHPmm0jfwc6beeYzok7P50PDp5pIcrT+wKrTKH+ZlY8xyBP2Rqn0K0ZEENyJUCPedUS9me5kcZsP5RfI=
X-Received: by 2002:a05:6512:e98:b0:513:59fb:1a50 with SMTP id
 bi24-20020a0565120e9800b0051359fb1a50mr3067541lfb.54.1709739892821; Wed, 06
 Mar 2024 07:44:52 -0800 (PST)
MIME-Version: 1.0
References: <CAMj1kXH1oMbONoHFMPaatfaqrHNE2ryfrG7kw-7J-eFsuXkK-Q@mail.gmail.com>
 <mhng-c53211c1-4708-459a-bdc5-6e013c2adaee@palmer-ri-x1c9>
In-Reply-To: <mhng-c53211c1-4708-459a-bdc5-6e013c2adaee@palmer-ri-x1c9>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 6 Mar 2024 16:44:41 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEFqMx8qUHQEbg=OqbG-H0Zpj-nWu=a6qhhvNEZPO7f4Q@mail.gmail.com>
Message-ID: <CAMj1kXEFqMx8qUHQEbg=OqbG-H0Zpj-nWu=a6qhhvNEZPO7f4Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 3/3] efistub: fix missed the initialization
 of gp
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: cuiyunhui@bytedance.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	aou@eecs.berkeley.edu, xuzhipeng.1973@bytedance.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, bp@alien8.de, xiao.w.wang@intel.com, 
	jan.kiszka@siemens.com, kirill.shutemov@linux.intel.com, nathan@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_074504_704223_3115199E 
X-CRM114-Status: GOOD (  38.90  )
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

T24gV2VkLCA2IE1hciAyMDI0IGF0IDE2OjIxLCBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJl
bHQuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgMDYgTWFyIDIwMjQgMDU6MDk6MDcgUFNUICgtMDgw
MCksIEFyZCBCaWVzaGV1dmVsIHdyb3RlOgo+ID4gT24gV2VkLCA2IE1hciAyMDI0IGF0IDE0OjAy
LCBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Pgo+ID4+IE9uIFdl
ZCwgNiBNYXIgMjAyNCBhdCAxMzozNCwgeXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5j
b20+IHdyb3RlOgo+ID4+ID4KPiA+PiA+IEhpIEFyZCwKPiA+PiA+Cj4gPj4gPiBPbiBXZWQsIE1h
ciA2LCAyMDI0IGF0IDU6MzbigK9QTSBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPiB3
cm90ZToKPiA+PiA+ID4KPiA+PiA+ID4gT24gV2VkLCA2IE1hciAyMDI0IGF0IDA5OjU2LCBZdW5o
dWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPj4gPiA+ID4KPiA+PiA+
ID4gPiBDb21wYXJlZCB3aXRoIGdjYyB2ZXJzaW9uIDEyLCBnY2MgdmVyc2lvbiAxMyB1c2VzIHRo
ZSBncAo+ID4+ID4gPiA+IHJlZ2lzdGVyIGZvciBjb21waWxhdGlvbiBvcHRpbWl6YXRpb24sIGJ1
dCB0aGUgZWZpc3R1YiBtb2R1bGUKPiA+PiA+ID4gPiBkb2VzIG5vdCBpbml0aWFsaXplIGdwLgo+
ID4+ID4gPiA+Cj4gPj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVp
QGJ5dGVkYW5jZS5jb20+Cj4gPj4gPiA+ID4gQ28tRGV2ZWxvcGVkLWJ5OiBaaGlwZW5nIFh1IDx4
dXpoaXBlbmcuMTk3M0BieXRlZGFuY2UuY29tPgo+ID4+ID4gPgo+ID4+ID4gPiBUaGlzIG5lZWRz
IGEgc2lnbi1vZmYsIGFuZCB5b3VyIHNpZ25vZmYgbmVlZHMgdG8gY29tZSBhZnRlci4KPiA+PiA+
ID4KPiA+PiA+ID4gPiAtLS0KPiA+PiA+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvZWZpLWhlYWRl
ci5TIHwgMTEgKysrKysrKysrKy0KPiA+PiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+PiA+ID4gPgo+ID4+ID4gPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2tlcm5lbC9lZmktaGVhZGVyLlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lZmkt
aGVhZGVyLlMKPiA+PiA+ID4gPiBpbmRleCA1MTViMmRmYmNhNzUuLmZhMTdjMDhjMDkyYSAxMDA2
NDQKPiA+PiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9lZmktaGVhZGVyLlMKPiA+PiA+
ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lZmktaGVhZGVyLlMKPiA+PiA+ID4gPiBAQCAt
NDAsNyArNDAsNyBAQCBvcHRpb25hbF9oZWFkZXI6Cj4gPj4gPiA+ID4gICAgICAgICAubG9uZyAg
IF9fcGVjb2ZmX2RhdGFfdmlydF9lbmQgLSBfX3BlY29mZl90ZXh0X2VuZCAgICAgIC8vIFNpemVP
ZkluaXRpYWxpemVkRGF0YQo+ID4+ID4gPiA+ICAjZW5kaWYKPiA+PiA+ID4gPiAgICAgICAgIC5s
b25nICAgMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8vIFNpemVPZlVu
aW5pdGlhbGl6ZWREYXRhCj4gPj4gPiA+ID4gLSAgICAgICAubG9uZyAgIF9fZWZpc3R1Yl9lZmlf
cGVfZW50cnkgLSBfc3RhcnQgICAgICAgICAvLyBBZGRyZXNzT2ZFbnRyeVBvaW50Cj4gPj4gPiA+
ID4gKyAgICAgICAubG9uZyAgIF9lZmlzdHViX2VudHJ5IC0gX3N0YXJ0ICAgICAgICAgLy8gQWRk
cmVzc09mRW50cnlQb2ludAo+ID4+ID4gPiA+ICAgICAgICAgLmxvbmcgICBlZmlfaGVhZGVyX2Vu
ZCAtIF9zdGFydCAgICAgICAgICAgICAgICAgLy8gQmFzZU9mQ29kZQo+ID4+ID4gPiA+ICAjaWZk
ZWYgQ09ORklHXzMyQklUCj4gPj4gPiA+ID4gICAgICAgICAubG9uZyAgX19wZWNvZmZfdGV4dF9l
bmQgLSBfc3RhcnQgICAgICAgICAgICAgICAvLyBCYXNlT2ZEYXRhCj4gPj4gPiA+ID4gQEAgLTEy
MSw0ICsxMjEsMTMgQEAgc2VjdGlvbl90YWJsZToKPiA+PiA+ID4gPgo+ID4+ID4gPiA+ICAgICAg
ICAgLmJhbGlnbiAweDEwMDAKPiA+PiA+ID4gPiAgZWZpX2hlYWRlcl9lbmQ6Cj4gPj4gPiA+ID4g
Kwo+ID4+ID4gPiA+ICsgICAgICAgLmdsb2JhbCBfZWZpc3R1Yl9lbnRyeQo+ID4+ID4gPiA+ICtf
ZWZpc3R1Yl9lbnRyeToKPiA+PiA+ID4KPiA+PiA+ID4gVGhpcyBzaG91bGQgZ28gaW50byAudGV4
dCBvciAuaW5pdC50ZXh0LCBub3QgdGhlIGhlYWRlci4KPiA+PiA+ID4KPiA+PiA+ID4gPiArICAg
ICAgIC8qIFJlbG9hZCB0aGUgZ2xvYmFsIHBvaW50ZXIgKi8KPiA+PiA+ID4gPiArICAgICAgIGxv
YWRfZ2xvYmFsX3BvaW50ZXIKPiA+PiA+ID4gPiArCj4gPj4gPiA+Cj4gPj4gPiA+IFdoYXQgaXMg
c3VwcG9zZWQgdG8gaGFwcGVuIGhlcmUgaWYgQ09ORklHX1NIQURPV19DQUxMX1NUQUNLPXk/IFRo
ZSBFRkkKPiA+PiA+ID4gc3R1YiBNYWtlZmlsZSByZW1vdmVzIHRoZSBTQ1MgQ0ZMQUdTLCBzbyB0
aGUgc3R1YiB3aWxsIGJlIGJ1aWx0Cj4gPj4gPiA+IHdpdGhvdXQgc2hhZG93IGNhbGwgc3RhY2sg
c3VwcG9ydCwgd2hpY2ggSSBndWVzcyBtZWFucyB0aGF0IGl0IG1pZ2h0Cj4gPj4gPiA+IHVzZSBH
UCBhcyBhIGdsb2JhbCBwb2ludGVyIGFzIHVzdWFsPwo+ID4+ID4gPgo+ID4+ID4gPiA+ICsgICAg
ICAgY2FsbCBfX2VmaXN0dWJfZWZpX3BlX2VudHJ5Cj4gPj4gPiA+ID4gKyAgICAgICByZXQKPiA+
PiA+ID4gPiArCj4gPj4gPiA+Cj4gPj4gPiA+IFlvdSBhcmUgcmV0dXJuaW5nIHRvIHRoZSBmaXJt
d2FyZSBoZXJlLCBidXQgYWZ0ZXIgbW9kaWZ5aW5nIHRoZSBHUAo+ID4+ID4gPiByZWdpc3Rlci4g
U2hvdWxkbid0IHlvdSByZXN0b3JlIGl0IHRvIGl0cyBvbGQgdmFsdWU/Cj4gPj4gPiBUaGVyZSBp
cyBubyBuZWVkIHRvIHJlc3RvcmUgdGhlIHZhbHVlIG9mIHRoZSBncCByZWdpc3Rlci4gV2hlcmUg
Z3AgaXMKPiA+PiA+IG5lZWRlZCwgdGhlIGdwIHJlZ2lzdGVyIG11c3QgZmlyc3QgYmUgaW5pdGlh
bGl6ZWQuIEFuZCBoZXJlIGlzIHRoZQo+ID4+ID4gZW50cnkuCj4gPj4gPgo+ID4+Cj4gPj4gQnV0
IGhvdyBzaG91bGQgdGhlIGZpcm13YXJlIGtub3cgdGhhdCBHUCB3YXMgY29ycnVwdGVkIGFmdGVy
IGNhbGxpbmcKPiA+PiB0aGUga2VybmVsJ3MgRUZJIGVudHJ5cG9pbnQ/IFRoZSBFRkkgc3R1YiBj
YW4gcmV0dXJuIHRvIHRoZSBmaXJtd2FyZQo+ID4+IGlmIGl0IGVuY291bnRlcnMgYW55IGVycm9y
cyB3aGlsZSBzdGlsbCBydW5uaW5nIGluIHRoZSBFRkkgYm9vdAo+ID4+IHNlcnZpY2VzLgo+ID4+
Cj4gPgo+ID4gQWN0dWFsbHksIEkgd29uZGVyIGlmIEdQIGNhbiBiZSBtb2RpZmllZCBhdCBhbGwg
YmVmb3JlCj4gPiBFeGl0Qm9vdFNlcnZpY2VzKCkuIFRoZSBFRkkgdGltZXIgaW50ZXJydXB0IGlz
IHN0aWxsIGxpdmUgYXQgdGhpcwo+ID4gcG9pbnQsIGFuZCBzbyB0aGUgZmlybXdhcmUgaXMgYmVp
bmcgY2FsbGVkIGJlaGluZCB5b3VyIGJhY2ssIGFuZCBtaWdodAo+ID4gcmVseSBvbiBHUCByZXRh
aW5pbmcgaXRzIG9yaWdpbmFsIHZhbHVlLgo+Cj4gW0EgZmV3IG9mIHVzIGFyZSB0YWxraW5nIG9u
IElSQyBhcyBJJ20gd3JpdGluZyB0aGlzLi4uXQo+Cj4gVGhlIFVFRkkgc3BlYyBzYXlzICJVRUZJ
IGZpcm13YXJlIG11c3QgbmVpdGhlciB0cnVzdCB0aGUKPiB2YWx1ZXMgb2YgdHAgYW5kIGdwIG5v
ciBtYWtlIGFuIGFzc3VtcHRpb24gb2Ygb3duaW5nIHRoZSB3cml0ZSBhY2Nlc3MgdG8KPiB0aGVz
ZSByZWdpc3RlciBpbiBhbnkgY2lyY3Vtc3RhbmNlcyIuICBJdCdzIGtpbmQgb2YgdmFndWUgd2hh
dCAiVUVGSQo+IGZpcm13YXJlIiBtZWFucyBoZXJlLCBidXQgSSB0aGluayBpdCdzIHJlYXNvbmFi
bGUgdG8gYXNzdW1lIHRoYXQgdGhlCj4ga2VybmVsIChhbmQgdGh1cyB0aGUgRUZJIHN0dWIpIGlz
IG5vdCBpbmNsdWRlZCB0aGVyZS4KPgo+IFNvIHVuZGVyIHRoYXQgaW50ZXJwcmV0YXRpb24sIHRo
ZSBrZXJuZWwgKGluY2x1ZGluZyB0aGUgRUZJIHN0dWIpIHdvdWxkCj4gYmUgYWxsb3dlZCB0byBv
dmVyd3JpdGUgR1Agd2l0aCB3aGF0ZXZlciBpdCB3YW50cy4KPgoKT0ssIHNvIGV2ZW4gaWYgdGhl
IFVFRkkgc3BlYyBzZWVtcyB0byBzdWdnZXN0IHRoYXQgdXNpbmcgR1AgaW4gRUZJCmFwcGxpY2F0
aW9ucyBzdWNoIGFzIHRoZSBMaW51eCBFRkkgc3R1YiBzaG91bGQgYmUgc2FmZSwgSSdkIHN0aWxs
IGxpa2UKdG8gdW5kZXJzdGFuZCB3aHkgdGhpcyBjaGFuZ2UgaXMgbmVjZXNzYXJ5LiBUaGUgcGF0
Y2hlcyB5b3UgYXJlCnJldmVydGluZyBhcmUgc3VwcG9zZWQgdG8gZW5zdXJlIHRoYXQgYSkgdGhl
IGNvbXBpbGVyIGRvZXMgbm90CmdlbmVyYXRlIHJlZmVyZW5jZXMgdGhhdCBjYW4gYmUgcmVsYXhl
ZCB0byBHUCBiYXNlZCBvbmVzLCBhbmQgYikgbm8KUl9SSVNDVl9SRUxBWCByZWxvY2F0aW9ucyBh
cmUgcHJlc2VudCBpbiBhbnkgb2YgdGhlIGNvZGUgdGhhdCBydW5zIGluCnRoZSBjb250ZXh0IG9m
IHRoZSBFRkkgZmlybXdhcmUuCgpBcmUgeW91IHN0aWxsIHNlZWluZyBHUCBiYXNlZCBzeW1ib2wg
cmVmZXJlbmNlcz8gSXMgdGhlcmUgQyBjb2RlIHRoYXQKZ2V0cyBwdWxsZWQgaW50byB0aGUgRUZJ
IHN0dWIgdGhhdCB1c2VzIEdQIGJhc2VkIHJlbG9jYXRpb25zIHBlcmhhcHM/CihzZWUgbGlzdCBi
ZWxvdykuIElmIGFueSBvZiB0aG9zZSBhcmUgaW1wbGVtZW50ZWQgaW4gQywgdGhleSBzaG91bGQK
bm90IGJlIHVzZWQgYnkgdGhlIEVGSSBzdHViIGRpcmVjdGx5IHVubGVzcyB0aGV5IGFyZSBndWFy
YW50ZWVkIHRvIGJlCnVuaW5zdHJ1bWVudGVkIGFuZCBjYWxsYWJsZSBhdCBhcmJpdHJhcnkgb2Zm
c2V0cyBvdGhlciB0aGFuIHRoZSBvbmUKdGhleSB3ZXJlIGxpbmtlZCB0byBydW4gYXQuCgoKX19l
ZmlzdHViX21lbWNtcCAgICAgICAgID0gbWVtY21wOwpfX2VmaXN0dWJfbWVtY2hyICAgICAgICAg
PSBtZW1jaHI7Cl9fZWZpc3R1Yl9tZW1jcHkgICAgICAgICA9IG1lbWNweTsKX19lZmlzdHViX21l
bW1vdmUgICAgICAgID0gbWVtbW92ZTsKX19lZmlzdHViX21lbXNldCAgICAgICAgID0gbWVtc2V0
OwpfX2VmaXN0dWJfc3RybGVuICAgICAgICAgPSBzdHJsZW47Cl9fZWZpc3R1Yl9zdHJubGVuICAg
ICAgICA9IHN0cm5sZW47Cl9fZWZpc3R1Yl9zdHJjbXAgICAgICAgICA9IHN0cmNtcDsKX19lZmlz
dHViX3N0cm5jbXAgICAgICAgID0gc3RybmNtcDsKX19lZmlzdHViX3N0cnJjaHIgICAgICAgID0g
c3RycmNocjsKX19lZmlzdHViX19fbWVtY3B5ICAgICAgID0gbWVtY3B5OwpfX2VmaXN0dWJfX19t
ZW1tb3ZlICAgICAgPSBtZW1tb3ZlOwpfX2VmaXN0dWJfX19tZW1zZXQgICAgICAgPSBtZW1zZXQ7
Cl9fZWZpc3R1Yl9fc3RhcnQgICAgICAgICA9IF9zdGFydDsKX19lZmlzdHViX19zdGFydF9rZXJu
ZWwgID0gX3N0YXJ0X2tlcm5lbDsKCihmcm9tIGFyY2gvcmlzY3Yva2VybmVsL2ltYWdlLXZhcnMu
aCkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
