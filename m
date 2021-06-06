Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D848FC4743D
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 16:53:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B22161435
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 16:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B22161435
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PkwRFXt3CaWBDqYGmsRaLMEKmugEcIhV2FtLkeJTf8g=; b=iC0kAVwAsgfxT3
	0bjFYWdMAUcsEDn9+Ms9PKC/cLXm7Atxdrj1mcwATkt/EPf2zIfK7+Tk6ya6FSnIOQViNr5FwADkH
	C8iXCbJk3+KB7urljgA1jYmRoQVWVnF3Hbql1finIffo9TaL7VBaiXXU1ieN0nLRiDTqzDzRGJcAk
	aX8NZL1dXU99kuOH+VXvgOgHrxLgmXJ0ZXNaOuCWbJDCKF1FiS/IXA6gBecithgIsK4q6Si194j9l
	tT146stqxLikLHFfW05RwLtSXtOf1hflE1TBRnBp+Y49Z24S0iFsNryRpgEJ8AgHvPcljvD52nQvB
	wnyTuZgb2WfoXrf2VKUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpw1W-000ZjV-GW; Sun, 06 Jun 2021 16:53:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpw1T-000Zj9-4Y
 for linux-riscv@lists.infradead.org; Sun, 06 Jun 2021 16:53:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA8296142E
 for <linux-riscv@lists.infradead.org>; Sun,  6 Jun 2021 16:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622998394;
 bh=ppjcq7VkjHh/NHO3vr18zVl9plR0YmQ9qVLmLi4Sae4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HO+Exc0RhWVIC+33kNfgBuctRrWSXz46aZYoLOw8pF/Z1GT+uYjEh0rczgEeK+IeH
 Egq9Il2/HBsPhNq4imHUFkWsk9ALLqSPtwWDbT6nn/ggYw8SFNJoe5UtsINttPGsjf
 wk4Qxlff6wRaH9b1n7twqU0z4smyND0HPP57vGRxyi6oR5xSyWuszIQisLo4HnEPPO
 ZeZCkuB1kNqnn698FS5v7HX128Us2YZhAt2MPA2ewe3m7ZFBwYSnqXhJ8rEEa3V4Ei
 +pWa/SET70RPP7b4YiqH7kKfa5zlWrI7C4vxu0gH+iVNtjbMmhtIChcBcHWbrDqVmz
 1Mn/zULMEzGeA==
Received: by mail-lj1-f181.google.com with SMTP id 131so18658659ljj.3
 for <linux-riscv@lists.infradead.org>; Sun, 06 Jun 2021 09:53:14 -0700 (PDT)
X-Gm-Message-State: AOAM531Om0Z6mXMtU5FCu6sVBg1gI0CFlmm5p888BwhxTg3i0Gl91UA1
 nIpuP/Ws/2W5ElE54VEStVO2+FyP8+r9P2+KcfY=
X-Google-Smtp-Source: ABdhPJy9NxOQCV1ZlTuxLXychZNM2kX2ZVKFBTMqs91GG1T/HBvezNA7d5kTjc5TxQ1zjFWPC1Y5PAOynB67SzT8zZA=
X-Received: by 2002:a2e:320f:: with SMTP id y15mr11478502ljy.498.1622998392940; 
 Sun, 06 Jun 2021 09:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <1622970249-50770-15-git-send-email-guoren@kernel.org>
 <CAK8P3a0yHEGH8=o_TQ+ajRn53j+mHxYxqyYLPXnUe=YWkTHDBw@mail.gmail.com>
In-Reply-To: <CAK8P3a0yHEGH8=o_TQ+ajRn53j+mHxYxqyYLPXnUe=YWkTHDBw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 7 Jun 2021 00:53:01 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT-nBuOybOq3qsBhP7nJOexG36D=GMJaut1qqcm3p1Uuw@mail.gmail.com>
Message-ID: <CAJF2gTT-nBuOybOq3qsBhP7nJOexG36D=GMJaut1qqcm3p1Uuw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 11/11] riscv: soc: Allwinner D1 GMAC driver only
 for temp use
To: Arnd Bergmann <arnd@arndb.de>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Drew Fustini <drew@beagleboard.org>, liush@allwinnertech.com,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 wefu@redhat.com, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 Corentin Labbe <clabbe@baylibre.com>, Samuel Holland <samuel@sholland.org>, 
 Icenowy Zheng <icenowy@aosc.io>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
 Michael Walle <michael@walle.cc>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_095315_301984_763120BD 
X-CRM114-Status: GOOD (  26.55  )
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

U29ycnksIHdhc3QgeW91ciB0aW1lIHJldmlld2luZyB0aGUgcGF0Y2guIEl0J3Mgbm90IHJlYWR5
IHRvIG1lcmdlLApqdXN0IGZvciB0aGUgdGVzdC4KCk9uIE1vbiwgSnVuIDcsIDIwMjEgYXQgMTI6
MTkgQU0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4gd3JvdGU6Cj4KPiBPbiBTdW4sIEp1
biA2LCAyMDIxIGF0IDExOjA0IEFNIDxndW9yZW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9hbGx3aW5uZXItZDEtbmV6
aGEta2l0LmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL2FsbHdpbm5lci1kMS1u
ZXpoYS1raXQuZHRzCj4gPiBpbmRleCBjZDlmN2M5Li4zMWI2ODFkIDEwMDY0NAo+ID4gLS0tIGEv
YXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvYWxsd2lubmVyLWQxLW5lemhhLWtpdC5kdHMK
PiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL2FsbHdpbm5lci1kMS1uZXpo
YS1raXQuZHRzCj4gPiBAQCAtMTEsNyArMTEsNyBAQAo+ID4gICAgICAgICBjb21wYXRpYmxlID0g
ImFsbHdpbm5lcixkMS1uZXpoYS1raXQiOwo+ID4KPiA+ICAgICAgICAgY2hvc2VuIHsKPiA+IC0g
ICAgICAgICAgICAgICBib290YXJncyA9ICJjb25zb2xlPXR0eVMwLDExNTIwMCI7Cj4gPiArICAg
ICAgICAgICAgICAgYm9vdGFyZ3MgPSAiY29uc29sZT10dHlTMCwxMTUyMDAgcm9vdHdhaXQgaW5p
dD0vc2Jpbi9pbml0IHJvb3Q9L2Rldi9uZnMgcncgbmZzcm9vdD0xOTIuMTY4LjEwMS4yMDA6L3Rt
cC9yb290ZnNfbmZzLHYzLHRjcCxub2xvY2sgaXA9MTkyLjE2OC4xMDEuMjMiOwo+Cj4gVGhlc2Ug
YXJlIG5vdCBib2FyZCBzcGVjaWZpYyBvcHRpb25zLCB0aGV5IHNob3VsZCBiZSBzZXQgYnkgdGhl
IGJvb3Rsb2FkZXIKPiBhY2NvcmRpbmcgdG8gdGhlIG5ldHdvcmsgZW52aXJvbm1lbnQuIEl0IGNs
ZWFybHkgZG9lbnMndCBiZWxvbmcKPiBpbnRvIHRoaXMgcGF0Y2ggLgo+Cj4gPiAgICAgICAgICAg
ICAgICAgc3Rkb3V0LXBhdGggPSAmc2VyaWFsMDsKPiA+ICAgICAgICAgfTsKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvYWxsd2lubmVyLWQxLmR0c2kg
Yi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9hbGx3aW5uZXItZDEuZHRzaQo+ID4gaW5k
ZXggMTFjZDkzOC4uZDMxN2UxOSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMv
YWxsd2lubmVyL2FsbHdpbm5lci1kMS5kdHNpCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L2FsbHdpbm5lci9hbGx3aW5uZXItZDEuZHRzaQo+ID4gQEAgLTgwLDUgKzgwLDIxIEBACj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmR1bW15X2FwYj47Cj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ID4gICAgICAgICAgICAgICAg
IH07Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgZXRoQDQ1MDAwMDAgewo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VueGktZ21hYyI7Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMCAweDQ1MDAwMDAgMHgwMCAweDEwMDAw
IDB4MDAgMHgzMDAwMDMwIDB4MDAgMHgwND47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBp
bnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZwbGljIDB4M2UgMHgwND47Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBpbnRlcnJ1cHQtbmFtZXMgPSAiZ21hY2lycSI7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJnbWFjMCI7Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBwaHktbW9kZSA9ICJyZ21paSI7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICB1c2Vf
ZXBoeTI1bSA9IDwweDAxPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHR4LWRlbGF5ID0g
PDB4MDM+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcngtZGVsYXkgPSA8MHgwMz47Cj4g
PiArICAgICAgICAgICAgICAgICAgICAgICBnbWFjLXBvd2VyMDsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGdtYWMtcG93ZXIxOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZ21hYy1w
b3dlcjI7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gPiAr
ICAgICAgICAgICAgICAgfTsKPgo+IEJlZm9yZSB5b3UgYWRkIHRoaXMgaW4gdGhlIGR0cyBmaWxl
LCB0aGUgcHJvcGVydGllcyBuZWVkIHRvIGJlIGRvY3VtZW50ZWQgaW4KPiB0aGUgYmluZGluZyBm
aWxlLiBUaGUgImFsbHdpbm5lcixzdW54aS1nbWFjIiBpZGVudGlmaWVyIGRvZXMgbm90IGFwcGVh
ciB0bwo+IGJlIHNwZWNpZmljIGVub3VnaCBoZXJlLCBhbmQgdGhlIHByb3BlcnRpZXMgZG9uJ3Qg
bWF0Y2ggd2hhdCBkd21hYyB1c2VzLAo+IHdoaWNoIHdvdWxkIG1ha2UgaXQgdW5uZWNlc3Nhcmls
eSBoYXJkIHRvIGNoYW5nZSB0byB0aGUgb3RoZXIgZHJpdmVyCj4gbGF0ZXIgb24gd2l0aG91dCBi
cmVha2luZyBjb21wYXRpYmlsaXR5IHRvIG9sZCBkdGIgZmlsZXMuCj4KPiA+ICsrKyBiL2RyaXZl
cnMvbmV0L2V0aGVybmV0L2FsbHdpbm5lcnRtcC9zdW54aS1nbWFjLW9wcy5jCj4gPiBAQCAtMCww
ICsxLDY5MCBAQAo+ID4gKy8qCj4gPiArICogbGludXgvZHJpdmVycy9uZXQvZXRoZXJuZXQvYWxs
d2lubmVyL3N1bnhpX2dtYWNfb3BzLmMKPiA+ICsgKgo+ID4gKyAqIENvcHlyaWdodCDCqSAyMDE2
LTIwMTgsIGZ1emhhb2tlCj4gPiArICogICAgICAgICAgICAgQXV0aG9yOiBmdXpoYW9rZSA8ZnV6
aGFva2VAYWxsd2lubmVydGVjaC5jb20+Cj4gPiArICoKPiA+ICsgKiBUaGlzIGZpbGUgaXMgcHJv
dmlkZWQgdW5kZXIgYSBkdWFsIEJTRC9HUEwgbGljZW5zZS4gIFdoZW4gdXNpbmcgb3IKPiA+ICsg
KiByZWRpc3RyaWJ1dGluZyB0aGlzIGZpbGUsIHlvdSBtYXkgZG8gc28gdW5kZXIgZWl0aGVyIGxp
Y2Vuc2UuCj4KPiBBcmUgeW91IHN1cmUgdGhpcyBpcyB0aGUgY29ycmVjdCBjb3B5cmlnaHQgaW5m
b3JtYXRpb24gYW5kICJmdXpoYW9rZSIgaXMKPiB0aGUgY29weXJpZ2h0IGhvbGRlciBmb3IgdGhp
cyBmaWxlPyBJZiB0aGlzIGlzIGRlcml2ZWQgZnJvbSBlaXRoZXIgdGhlCj4gZGVzaWdud2FyZQo+
IGNvZGUgb3IgdGhlIExpbnV4IHN0bW1hYyBkcml2ZXIsIHRoZSBhdXRob3JzIHNob3VsZCBiZSBt
ZW50aW9uZWQsCj4gYW5kIHRoZSBsaWNlbnNlIGJlIGNvbXBhdGlibGUgd2l0aCB0aGUgb3JpZ2lu
YWwgbGljZW5zZSB0ZXJtcy4KPgo+IEFuZHJlIGFscmVhZHkgY29tbWVudGVkIG9uIHRoZSBkcml2
ZXIgcXVhbGl0eSBhbmQgY29kZSBkdXBsaWNhdGlvbiwgdGhvc2UgYXJlCj4gYWxzbyBzaG93LXN0
b3BwZXJzLCBidXQgdGhlIHVuY2xlYXIgbGljZW5zZSB0ZXJtcyBhbmQgZHQgYmluZGluZyBjb21w
YXRpYmlsaXR5Cj4gYXJlIGV2ZW4gc3Ryb25nZXIgcmVhc29ucyB0byBub3QgZ2V0IGFueXdoZXJl
IGNsb3NlIHRvIHRoaXMgZHJpdmVyLgo+Cj4gICAgICAgICBBcm5kCgoKCi0tIApCZXN0IFJlZ2Fy
ZHMKIEd1byBSZW4KCk1MOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jc2t5LwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
