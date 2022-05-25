Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D170C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 16:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N8BqlTJhFPnHv6oVVS25Odt6GrWReJHzf8QaEhbw/sA=; b=tEnjTVyf1jjYzb
	NgD0dJzUwbji/rjoJgalwnFkbbsITFpxso6hy322lLh1IASeonSYs+72AX2ELoHOSdTLOiucdjprR
	RNImjgVAQHKxfXynzMQBVhDeiQKMGdui2WrDwHS+3IaBiw2H9hdy5r7jI1NYlnUbIQypRv0j0eyev
	o+XXL1bEymrnj1LyEwfcqwL2GMN4kzUZtt/hHHszNj2x3bkYQ1CXiCLIgwenxv66pVJrfCrzJU3t2
	kGnnDfjvV/EyRI3E3LhVJlsM7d6+ur0WT2VuoqP20ryYxUIYoIkzV0r473IToRuYPcAtWTeTAl/f8
	FvJltN8ScOsXEcQD8AoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttZD-00Bm4e-Bh; Wed, 25 May 2022 16:08:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttZ2-00Bm2W-I2; Wed, 25 May 2022 16:08:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 50D08CE1FB0;
	Wed, 25 May 2022 16:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC283C34114;
	Wed, 25 May 2022 16:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653494917;
	bh=yKZpZ7SIZeLHb0X8nC5bqkpDaZyHuZo++7kw37oIcGQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=goVP0r/5GwDlgxrUTVvx6jhaOtTm7pWUyfqhP1hgj2iDGXU4Tiq8pzDnwCvAkgpG4
	 L1r86pR2gPdL9aCADSayVXaRv86iKfwqr3WFbWOZxdLnDhv1govZgITWE7RtDWiB5+
	 LSjycCUndGv9y0jhBd0U8lb2tsEZKd0fEkC2wJsMf/1yO50v0Dzuq7GoqJ/s9pQejc
	 wNgI7SjceSjeavb7oG9cfRxObqafmjEdCwDyFAraqlxbB1zYcaDbq+IRyVfomMK/KY
	 bNjIBroLqZ8u1NSoR6dO+y5X61zbeNatpUa3EJ8SCurI9i1y8SKf6MZABNuUT5W2GC
	 6go17gsxUHsuQ==
Received: by mail-vk1-f173.google.com with SMTP id x11so9602699vkn.11;
        Wed, 25 May 2022 09:08:37 -0700 (PDT)
X-Gm-Message-State: AOAM533W1/iWG7CPrHR3i+q5RW5lsat2kVXuOMtYO8AF1lulPd/upK7m
	zdOBJcfOTxX7rTgYnaoDVaShGQkm3o6cunbPLL0=
X-Google-Smtp-Source: ABdhPJw1WHHqxuzdMTtb2eEqwRRFtvXa8jU3vxrvtrww8g1vIS4KjJWMDyxFq63Hm2BXr071eyutBaZ38+UIdXynb6U=
X-Received: by 2002:a1f:2106:0:b0:357:a8c9:a8d6 with SMTP id
 h6-20020a1f2106000000b00357a8c9a8d6mr5907118vkh.2.1653494913806; Wed, 25 May
 2022 09:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220322144003.2357128-1-guoren@kernel.org> <20220524220646.GA3990738@roeck-us.net>
 <6435704.4vTCxPXJkl@diego> <3418219.V25eIC5XRa@diego>
In-Reply-To: <3418219.V25eIC5XRa@diego>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 26 May 2022 00:08:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTkpHLZf-+VXZE_gCn=5ZJ5FS3jOxKLVoMyL4i=baPd7Q@mail.gmail.com>
Message-ID: <CAJF2gTTkpHLZf-+VXZE_gCn=5ZJ5FS3jOxKLVoMyL4i=baPd7Q@mail.gmail.com>
Subject: Re: [PATCH V9 20/20] riscv: compat: Add COMPAT Kbuild skeletal support
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
	linux-s390 <linux-s390@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Parisc List <linux-parisc@vger.kernel.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_090848_982613_D902EFD0 
X-CRM114-Status: GOOD (  29.89  )
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

VGh4IEhlaWtvICYgR3VlbnRlciwKCk9uIFdlZCwgTWF5IDI1LCAyMDIyIGF0IDc6MTAgUE0gSGVp
a28gU3TDvGJuZXIgPGhlaWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4KPiBBbSBNaXR0d29jaCwgMjUu
IE1haSAyMDIyLCAxMjo1NzozMCBDRVNUIHNjaHJpZWIgSGVpa28gU3TDvGJuZXI6Cj4gPiBBbSBN
aXR0d29jaCwgMjUuIE1haSAyMDIyLCAwMDowNjo0NiBDRVNUIHNjaHJpZWIgR3VlbnRlciBSb2Vj
azoKPiA+ID4gT24gV2VkLCBNYXkgMjUsIDIwMjIgYXQgMDE6NDY6MzhBTSArMDgwMCwgR3VvIFJl
biB3cm90ZToKPiA+ID4gWyAuLi4gXQo+ID4gPgo+ID4gPiA+ID4gVGhlIHByb2JsZW0gaXMgY29t
ZSBmcm9tICJfX2RsczMncyB2ZHNvIGRlY29kZSBwYXJ0IGluIG11c2wncwo+ID4gPiA+ID4gbGRz
by9keW5saW5rLmMiLiBUaGUgZWhkci0+ZV9waG51bSAmIGVoZHItPmVfcGhlbnRzaXplIGFyZSB3
cm9uZy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIHRoaW5rIHRoZSByb290IGNhdXNlIGlzIGZyb20g
bXVzbCdzIGltcGxlbWVudGF0aW9uIHdpdGggdGhlIHdyb25nCj4gPiA+ID4gPiBlbGYgcGFyc2Vy
LiBJIHdvdWxkIGZpeCB0aGF0IHNvb24uCj4gPiA+ID4gTm90IGVsZiBwYXJzZXIsIGl0J3MgImF1
eCB2ZWN0b3IganVzdCBwYXN0IGVudmlyb25bXSIuIEkgdGhpbmsgSSBjb3VsZAo+ID4gPiA+IHNv
bHZlIHRoaXMsIGJ1dCBhbnlvbmUgd2hvIGNvdWxkIGhlbHAgZGlnIGluIGlzIHdlbGNvbWUuCj4g
PiA+ID4KPiA+ID4KPiA+ID4gSSBhbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgd2hhdCB5b3UgYXJl
IHNheWluZyBoZXJlLiBQb2ludCBpcyB0aGF0IG15Cj4gPiA+IHJvb3QgZmlsZSBzeXN0ZW0sIGdl
bmVyYXRlZCB3aXRoIG11c2wgYSB5ZWFyIG9yIHNvIGFnbywgY3Jhc2hlcyB3aXRoCj4gPiA+IHlv
dXIgcGF0Y2ggc2V0IGFwcGxpZWQuIFRoYXQgaXMgYSByZWdyZXNzaW9uLCBldmVuIGlmIHRoZXJl
IGlzIGEgYnVnCj4gPiA+IGluIG11c2wuClRoeCBmb3IgdGhlIHJlcG9ydCwgaXQncyBhIHZhbHVh
YmxlIHJlZ3Jlc3Npb24gZm9yIHJpc2N2LWNvbXBhdC4KCj4gPgo+ID4gQWxzbyBhcyBJIHNhaWQg
aW4gdGhlIG90aGVyIHBhcnQgb2YgdGhlIHRocmVhZCwgdGhlIHJvb3RmcyBzZWVtcyBpbm5vY2Vu
dCwKPiA+IGFzIG15IGNvbXBsZXRlbHktc3RhbmRhcmQgRGViaWFuIHJpc2N2NjQgcm9vdGZzIGlz
IGFsc28gYWZmZWN0ZWQuCj4gPgo+ID4gVGhlIG1lcmdlZCB2ZXJzaW9uIHNlZW1zIHRvIGJlIHYx
MiBbMF0gLSBub3Qgc3VyZSBob3cgd2UgdGhpcyBkaXNjdXNzaW9uCj4gPiBlbmRlZCB1cCBpbiB2
OSwgYnV0IEkganVzdCB0ZXN0ZWQgdGhpcyByZXZpc2lvbiBpbiB0d28gdmFyaWFudHM6Cj4gPgo+
ID4gLSB2NS4xNyArIHRoaXMgdjkgLT4gd29ya3MgbmljZWx5Cj4KPiBJIHRha2UgdGhhdCBiYWNr
IC4uLiBub3cgZ29pbmcgYmFjayB0byB0aGF0IGJ1aWxkIEkgc29tZWhvdyBhbHNvIHJ1biBpbnRv
Cj4gdGhhdCBpc3N1ZSBoZXJlIC4uLiB3aWxsIGludmVzdGlnYXRlIG1vcmUuClllYWgsIGl0J3Mg
bXkgZmF1bHQuIEkndmUgZml4ZWQgdXAgaXQsIHBsZWFzZSBoYXZlIGEgdHJ5OgoKaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMjA1MjUxNjA0MDQuMjkzMDk4NC0xLWd1b3Jl
bkBrZXJuZWwub3JnL1QvI3UKCj4KPgo+ID4gLSB2NS4xOC1yYzYgKyB0aGlzIHY5IChyZWJhc2Vk
IG9udG8gaXQpIC0+IGJyZWFrcyB0aGUgYm9vdAo+ID4gICBUaGUgb25seSByZWJhc2UtY29uZmxp
Y3Qgd2FzIHdpdGggdGhlIGludHJvZHVjdGlvbiBvZiByZXN0YXJ0YWJsZQo+ID4gICBzZXF1ZW5j
ZXMgYW5kIHJlbW92YWwgb2YgdGhlIHRyYWNlaG9vayBpbmNsdWRlLCBidXQgdHVybmluZyBDT05G
SUdfUlNFUQo+ID4gICBvZmYgZG9lc24ndCBzZWVtIHRvIGFmZmVjdCB0aGUgYnJlYWthZ2UuCj4g
Pgo+ID4gU28gaXQgbG9va3MgbGlrZSBzb21ldGhpbmcgY2hhbmdlZCBiZXR3ZWVuIDUuMTcgYW5k
IDUuMTggdGhhdCBjYXVzZXMgdGhlIGlzc3VlLgo+ID4KPiA+Cj4gPiBIZWlrbwo+ID4KPiA+Cj4g
PiBbMF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwNDA1MDcxMzE0LjMyMjU4MzIt
MS1ndW9yZW5Aa2VybmVsLm9yZy8KPiA+Cj4KPgo+Cj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8g
UmVuCgpNTDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY3NreS8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
