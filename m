Return-Path: <SRS0=QIML=M4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93F0C5ACCC
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 20:03:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E0372145D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 20:03:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NgDzWPbL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E0372145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BysUH38euFX43pfKFNcgxR8pIIdgONLnl9XLmATt9f4=; b=NgDzWPbLVT5loV
	EjKpufMISbFsdJN/nO9SRA9b0WwlPJbeyXLKhIxMJzFnFQWBd6EoSYFQ7fvB6NZCEGgaXD3XzXQg3
	9PoH+LOxjglnuUGgu1bikgJnNd56NGGK3wHtkCMtVLtFToL7/O9ZKQEnoERYFEtwpU5al4MHHa2nY
	mCmj7l/hBxJRGwjNNbzNq9VuOoLMcbMtoQes8YdRhFuSAQ23wz0y/5CV0bXU/CUwSoguETM02AJOa
	1y6HH5rJ7KAAu5Zh+XP5Tm514HBGPRBUmBXA9DXKKziP6eoLaGCe9El7bozKijrDNvRJd0DygKPJW
	rfuuJ1vkEiiDN/A56lJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCVYd-00067o-Gl; Tue, 16 Oct 2018 20:03:11 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCVYa-00066b-Fk
 for linux-riscv@lists.infradead.org; Tue, 16 Oct 2018 20:03:10 +0000
Received: from excalibur.cnev.de ([213.196.203.128]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1My3Ad-1fR1yL2JuJ-00zVZy; Tue, 16 Oct 2018 22:02:46 +0200
Received: from excalibur.cnev.de ([213.196.203.128]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1My3Ad-1fR1yL2JuJ-00zVZy; Tue, 16 Oct 2018 22:02:46 +0200
Received: from karsten by excalibur.cnev.de with local (Exim 4.89)
 (envelope-from <merker@debian.org>)
 id 1gCVYD-00030t-GE; Tue, 16 Oct 2018 22:02:45 +0200
Date: Tue, 16 Oct 2018 22:02:45 +0200
From: Karsten Merker <merker@debian.org>
To: pintu.ping@gmail.com, Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [sw-dev] Re: [isa-dev] riscv-qemu - linux boot is failing for
 vda device
Message-ID: <20181016200245.j2gesmdjgoi7zmqh@excalibur.cnev.de>
References: <CAOuPNLiR+BLUno8sYjwLwW1BqJbBrH-suBiHEx1-dtMO906Ung@mail.gmail.com>
 <mhng-14c6ccbd-b9ff-40e3-b69b-4333d814c6c1@palmer-si-x1c4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-14c6ccbd-b9ff-40e3-b69b-4333d814c6c1@palmer-si-x1c4>
X-No-Archive: yes
User-Agent: NeoMutt/20170113 (1.7.2)
X-Provags-ID: V03:K1:WL2XED6WigiZipL/J0n/xrpMCXyJ2YQU+3qK/8IG8BPFOv6Tr37
 HcvbjEGPM8V28mYuxS+7g04b+BnYTQwgLUbwNOXIcqDvJU1sYM3Epg8F3u7I90oBpGiJOk9
 rS6rMsbk1+qKug+8hkmkQAQ/UtyRNHvb6rPFdKqjCS6JIKegcgr+wN2mPxRDyKdNqY2Oz+3
 C+yTHCSEXVYRKmmFMZtNg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:tpYpUVwIt/c=:8KDqcW393xh4qHiPbHND3i
 jFr7Iy3QwOW+VjOMxELUoZ2pcpOa/jPvLR/Xf8agOrfib/e4cRwxtyDTbFY7fr5bbcYHAD9wR
 /BJSIDdN/BdccFcuGEg0jBQtE4w1iwWdqcoa7yBgJ1N9fLdQYmVQ7Ho7USo8t+qQtKUv2orWK
 f69R0pMe7/ueVPSr4qWFg6JRnlPY4y9+bffjIrNmEjQGGq/SA5hIshN5uM7D91B4rL5nY+A5Z
 uS1uggAos5dSUPeK45L/FBR2IEBF04tLp+6wArOh8ycOmnI5NyWczUg3J9BZJlbVhgaNYZ6J4
 F+mOyo4XYWG7SktghB4PMy3mw477KoA18WhFwiktgiN1ZQpvZJpNl0XJR3DTQ5G0CWfY351Pf
 +bwcqWJWPxX2U0dGjPhRM5lAFIcOUbVOgHsMBA3RHKAc2YH6f4mLiiDuD6c+iN0AMPfYxFwY5
 H0euGjg1Sk1ynTwpqFnkTUSGjbP1JDcS4soPDeoqellGiqHWDmyCQw+5s7UTh1VQ6Y8/pTqXC
 xZ0hyJaXgVZAL8tcxoRvKSHOmt9Vh2d9oB+VLswBmXcFVvgCY5YlKfH/bjOsxqFC3KwZKgxpX
 yTmlKyydOCYkOZ/vgl+DkhVQmOvo51hDFqgbj0J8NEos99/nNny8FN0W3Io9gSRQgEJy9byWn
 Y/aXcObMsRYIrIkTH1QNiKimvFihUXAgJQEbKXvX9GjtZmx0iY4pvANP5u6zEpHX7fac=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181016_130308_824756_1FA5B4A9 
X-CRM114-Status: GOOD (  15.24  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, sw-dev@groups.riscv.org, rjones@redhat.com,
 Michael Clark <michaeljclark@mac.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBPY3QgMTYsIDIwMTggYXQgMTE6Mzg6NTNBTSAtMDcwMCwgUGFsbWVyIERhYmJlbHQg
d3JvdGU6Cj4gT24gVHVlLCAxNiBPY3QgMjAxOCAwNjoxMjoxMSBQRFQgKC0wNzAwKSwgcGludHUu
cGluZ0BnbWFpbC5jb20gd3JvdGU6Cj4gPiBPbiBUdWUsIE9jdCAxNiwgMjAxOCBhdCA2OjEwIEFN
IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPiA+IE9uIE1vbiwg
MTUgT2N0IDIwMTggMTQ6MTQ6NTEgUERUICgtMDcwMCksIHJqb25lc0ByZWRoYXQuY29tIHdyb3Rl
OgpbLi4uXQo+ID4gPiBZb3VyIGJlc3QgYmV0IHRvZGF5IGlzIHRvIHJ1biA0LjE5LXJjOCwgd2hp
Y2ggc2hvdWxkIGJlIHByZXR0eSBzdGFibGUuCj4gPiAKPiA+IFllcywgSSBjaGVja2VkIHdpdGgg
bWFpbmxpbmUgbGludXgta2VybmVsIDQuMTkuCj4gPiBOb3cgSSBhbSBhYmxlIHRvIGJvb3Qgc3Vj
Y2Vzc2Z1bGx5IGFuZCBsb2dpbiBpbnRvIHFlbXUtcmlzY3Ygc2hlbGwuCj4gPiBUaGFuayB5b3Ug
c28gbXVjaCA6KQo+ID4gCj4gPiBCdXQgSSBhbSBjdXJpb3VzIHRvIGtub3cgd2hhdCBjaGFuZ2Vz
IHJlc3VsdGVkIGludG8gdGhpcyBmaXgsIGluIDQuMTkga2VybmVsID8KPiA+IFdoaWNoIGlzIHRo
ZSBleGFjdCBwYXRjaCBpbiBtYWlubGluZSwgdGhhdCBmaXhlcyB0aGlzIGlzc3VlPwo+ID4gQmVj
YXVzZSBhdCB0aW1lcyBkdXJpbmcgdGhlIGRldmVsb3BtZW50LCBpdCB3aWxsIGJlIGRpZmZpY3Vs
dCB0bwo+ID4gc2ltcGx5IHVwZ3JhZGUgdGhlIGtlcm5lbCB2ZXJzaW9uLgo+IAo+IFllcywgdGhh
dCdzIGV4cGVjdGVkLiAgUklTQy1WIExpbnV4IGlzIHN0aWxsIHByZXR0eSBibGVlZGluZyBlZGdl
LCB5b3UganVzdAo+IGhhcHBlbmVkIHRvIGNhdGNoIGl0IGJldHdlZW4gd2hlbiBtYXN0ZXIgc3Rh
cnRlZCB3b3JraW5nIGFuZCB3aGVuIHRoZXJlIHdhcwo+IGEgcHJvcGVyIHJlbGVhc2UgdGhhdCBj
b250YWluZWQgeW91ciBwYXRjaGVzLiAgU2luY2UgbWFzdGVyIGlzIHZlcnkgY2FsbQo+IHJpZ2h0
IG5vdyAodGhlcmUgd2FzIGFuIHJjOCBiZWZvcmUgcmVsZWFzZSwgYnV0IGl0J3MgdmVyeSBjbG9z
ZSB0byBhCj4gcmVsZWFzZSkgaXQncyBPSyB0byB1c2UsIGJ1dCB5b3UgYmVzdCBiZXQgZ29pbmcg
Zm9yd2FyZCBpcyB0byB1c2UgdGhlCj4gcmVsZWFzZSB0YXJiYWxscyBqdXN0IGxpa2Ugbm9ybWFs
LgoKSnVzdCBhcyBhIGRhdGEgcG9pbnQgaW4gY2FzZSB5b3Ugc2hvdWxkIGZpbmQgaXQgaGVscGZ1
bDogSSdtCnNpbmNlIHR3byB3ZWVrcyBydW5uaW5nIDQuMTktcmM2Ly1yYzcgb24gdGhlIHFlbXUt
cmlzY3YgInZpcnQiCmJvYXJkIHVuZGVyIHBlcm1hbmVudCBoZWF2eSBsb2FkICh0aGUgc3lzdGVt
IGlzIHJ1bm5pbmcgYSBEZWJpYW4KcGFja2FnZSBidWlsZGVyKSB3aXRob3V0IGEgc2luZ2xlIGhp
Y2N1cC4KCkhUSCwKS2Fyc3RlbgotLSAKR2VtLiBQYXIuIDI4IEFicy4gNCBCdW5kZXNkYXRlbnNj
aHV0emdlc2V0eiB3aWRlcnNwcmVjaGUgaWNoIGRlciBOdXR6dW5nCnNvd2llIGRlciBXZWl0ZXJn
YWJlIG1laW5lciBwZXJzb25lbmJlem9nZW5lbiBEYXRlbiBmw7xyIFp3ZWNrZSBkZXIKV2VyYnVu
ZyBzb3dpZSBkZXIgTWFya3QtIG9kZXIgTWVpbnVuZ3Nmb3JzY2h1bmcuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
