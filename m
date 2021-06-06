Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4254DC47096
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 15:42:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D930A613C7
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 15:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D930A613C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lsx7SO3wxI+2HV373VpRmhNNeA8LxIRMXtsW7hKs7vo=; b=wfoTrj0hdxviqa
	4mFrdd4bcfgyWpGqQIACaD+aluYhTOj41L+qgdpH1JZK6EQ2rP5NSLgSb9Y+cKSOS2OpV0AKZmmkX
	QlCcjU+Gloxjan9Dem9tkCXs+PRI4x79I5mMsyUIE+7QkqVTBZLEmZ7Uui/KFJ+8srGu9dE6SErLH
	Pk2V7GgHr/cSGTU7Du664sgZVQRUHw5ADVT21fpVcJmCWaAQc60y+ymEtXIBFitmmYDLWjtidnEnu
	lwPVVLLHYolWxCfKZ92coYquEL6mZEV0fLnoCtW/LpwG9hzmXPp28GjnBLkeAB7f5pXx0fxOsuehp
	xYsd+UJAGnpyC4JZ5yVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpuud-000Umh-9D; Sun, 06 Jun 2021 15:42:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpuuY-000Ulw-Hg
 for linux-riscv@lists.infradead.org; Sun, 06 Jun 2021 15:42:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F087C6142D
 for <linux-riscv@lists.infradead.org>; Sun,  6 Jun 2021 15:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622994122;
 bh=UALv1P9ICCpdZuB9WXtufq8mFK4k0gfcSTsGNuUHdbs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZvUHWZOxEB4p2yT9vqorPLCRtERb1j5w3t+41XzMDxKZYrkorJwMIGmYiT7FBsZhA
 9IhtC35kzhwK8UO+DGWfX4acSUC/xoLVM4Ol43XIQ/wBJvjDsUlpStXk3gRVwoVUun
 Kx7bNiKB8hZFxbxQvOHj+RTJmMEZl71f7CAy28IkYPo0mJzOParvV+YgwwJ8+4NzQH
 HErPOYdE4dXvDkBqI0yNyMyXF58GO4uSW+hfhc73W5TOeMZjIDnE64fzhUpTghBeXE
 aTsRqe7ZvcRlqagr3CzmU5R6PBe/Gi2Z/hNDxGZVl/o9hhj2eAmMpQq6uOHt6S2NI1
 MPJAAkifdxxqg==
Received: by mail-lj1-f176.google.com with SMTP id o8so18513976ljp.0
 for <linux-riscv@lists.infradead.org>; Sun, 06 Jun 2021 08:42:01 -0700 (PDT)
X-Gm-Message-State: AOAM531fvpQYAisa8EtyMg03oQI8fYQ2mo1zgQsM5+qtaAwC8T/agKdu
 4CLIQoWj/7Q6y0GMBk4GWs4d4hRBMZluzh4wiAk=
X-Google-Smtp-Source: ABdhPJz/ymuruvAxsVBO3eBrDTvU5oqkJkvuhWlYn5kOpMHnRZRI9xA7WGJSBhIVrhRZH65ESpGQlHUhEJNlEggaNUM=
X-Received: by 2002:a2e:8e90:: with SMTP id z16mr11137106ljk.508.1622994120228; 
 Sun, 06 Jun 2021 08:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <20210606115027.5c715e64@slackpad.fritz.box>
 <CAJF2gTQgaJFW9knuVmW8J8zMAt_Gtq3KJ9gsGKg6=xLBuq0=uA@mail.gmail.com>
 <49182865.cm8dGOVcTj@jernej-laptop>
In-Reply-To: <49182865.cm8dGOVcTj@jernej-laptop>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 6 Jun 2021 23:41:48 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR3nUYsFv5=29DbE=nrgDaqmcj3KRm8F-WKsdTXHX02sQ@mail.gmail.com>
Message-ID: <CAJF2gTR3nUYsFv5=29DbE=nrgDaqmcj3KRm8F-WKsdTXHX02sQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 11/11] riscv: soc: Allwinner D1 GMAC driver only
 for temp use
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Anup Patel <anup.patel@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 wens@csie.org, 
 maxime@cerno.tech, Drew Fustini <drew@beagleboard.org>, liush@allwinnertech.com,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, wefu@redhat.com, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 Corentin Labbe <clabbe@baylibre.com>, Samuel Holland <samuel@sholland.org>, 
 Icenowy Zheng <icenowy@aosc.io>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
 Michael Walle <michael@walle.cc>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_084202_639172_794EEDEC 
X-CRM114-Status: GOOD (  28.50  )
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

T24gU3VuLCBKdW4gNiwgMjAyMSBhdCAxMTozOSBQTSBKZXJuZWogxaBrcmFiZWMgPGplcm5lai5z
a3JhYmVjQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSEKPgo+IERuZSBuZWRlbGphLCAwNi4ganVu
aWogMjAyMSBvYiAxNzozMjoyMiBDRVNUIGplIEd1byBSZW4gbmFwaXNhbChhKToKPiA+ICAsCj4g
Pgo+ID4gT24gU3VuLCBKdW4gNiwgMjAyMSBhdCA2OjUwIFBNIEFuZHJlIFByenl3YXJhIDxhbmRy
ZS5wcnp5d2FyYUBhcm0uY29tPgo+IHdyb3RlOgo+ID4gPiBPbiBTdW4sICA2IEp1biAyMDIxIDA5
OjA0OjA5ICswMDAwCj4gPiA+IGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+ID4gPgo+ID4gPiBI
aSwKPiA+ID4KPiA+ID4gPiBGcm9tOiBsaXVzaCA8bGl1c2hAYWxsd2lubmVydGVjaC5jb20+Cj4g
PiA+ID4KPiA+ID4gPiBUaGlzIGlzIGEgdGVtcG9yYXJ5IGRyaXZlciwgb25seSBndWFyYW50ZWVk
IHRvIHdvcmsgb24gYWxsd2lubmVyCj4gPiA+ID4gRDEuIEluIG9yZGVyIHRvIGVuc3VyZSB0aGUg
ZGV2ZWxvcGVyJ3MgZGVtYW5kIGZvciBuZXR3b3JrIHVzYWdlLgo+ID4gPgo+ID4gPiBUaGF0IGxv
b2tzIGxpa2Ugc29tZSBBbGx3aW5uZXIgQlNQIGRyaXZlciwgcGxlYXNlIGRvbid0IGVuZG9yc2Ug
Y29kZQo+ID4gPiBvZiB0aGlzIHF1YWxpdHkgKGp1c3QgbG9vayBhdCBhbGwgdGhhdCBjb21tZW50
ZWQgY29kZSBhbmQgdGhlIGF0dGVtcHQKPiA+ID4gZm9yIGNvbXBpbGUtdGltZSBjb25maWd1cmF0
aW9uKS4KPiA+ID4KPiA+ID4gPiBJdCBvbmx5IGNvdWxkIHdvcmsgYXQgMUdwcyBtb2RlLgo+ID4g
PiA+Cj4gPiA+ID4gVGhlIGNvcnJlY3QgZ21hYyBkcml2ZXIgc2hvdWxkIGZvbGxvdyAoSSBndWVz
cykKPiA+ID4gPiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdW44
aS5jCj4gPiA+ID4KPiA+ID4gPiBJZiBhbnlvbmUgaXMgZmFtaWxpYXIgd2l0aCBpdCBhbmQgY2Fu
IGhlbHAgcG9ydGluZywgSSB3b3VsZCBiZQo+ID4gPiA+IHZlcnkgZ3JhdGVmdWwuCj4gPiA+Cj4g
PiA+IEhhdmUgeW91IHRyaWVkIGNvbXBpbGluZyBhbmQgdXNpbmcgdGhhdCBkcml2ZXI/IElkZWFs
bHkgaXQgc2hvdWxkIGp1c3QKPiA+ID4gd29yaywgTGludXggZHJpdmVycyBhcmUgbWVhbnQgdG8g
YmUgcG9ydGFibGUsIGJ5IGRlc2lnbi4gQW5kIHRoZSBkcml2ZXIKPiA+ID4gaXMgYWxyZWFkeSBl
bmFibGVkIGJ5IENPTVBJTEVfVEVTVC4KPiA+Cj4gPiBJdCBzdGlsbCBuZWVkcyBzb21lIHdvcmsg
d2l0aCBkd21hYy1zdW44aS5jIGdsdWUgbGF5ZXIsIGVnOgo+ID4gdHgvcngtZGVsYXkgc2V0dGlu
ZywgY2xrICYgcGlubXV4IGRyaXZlcnMuCj4gPgo+ID4gVGhlIHBhdGNoIGlzIGp1c3QgdG8gaGVs
cCBwZW9wbGUgdXNpbmcgRDEgd2l0aCBHTUFDIHRlbXBvcmFyaWx5IHdpdGgKPiA+IG5ldHdvcmsg
ZnVuY3Rpb24uCj4KPiBJdCBzaG91bGQgYmUgbWFya2VkICJETyBOT1QgTUVSR0UiIG9yIHNpbWls
YXIgdGhlbi4KWWVzLCB0aHggZm9yIHJlbWluZGluZy4gSSdsbCBmaXggaXQgbmV4dCB0aW1lLgoK
Pgo+IEJlc3QgcmVnYXJkcywKPiBKZXJuZWoKPgo+ID4KPiA+ID4gQnV0IEkgZ3Vlc3MgeW91IG5l
ZWQgc29tZSBleHRyYSBjYXJlIHRvIG1ha2UgdGhlIG5vbi1jb2hlcmVudCBETUEgd29yaz8KPiA+
ID4gSSBoYXZlbid0IGxvb2tlZCBpbiBkZXRhaWwsIGJ1dCBhcmUgdGhvc2UgbmV3IENNT3MgaG9v
a2VkIGludG8gdGhlCj4gPiA+IGdlbmVyaWMgRE1BIGZyYW1ld29yaz8KPiA+Cj4gPiBZZXMsIHdl
IGhhdmUgdGhlIHNpbWxpYXIgcHJpbmNpcGxlIHdpdGggYXJtICYgY3NreSBmb3Igbm9uLWNvaGVy
ZW50Ogo+ID4gIC0gVXNpbmcgUFRFIGF0dHJpYnV0ZXMgc2V0dGluZyBVc2luZyBQVEUgYXR0cmli
dXRlcyB0byBzdXBwb3J0Cj4gPiBfUEFHRV9JT1JFTUFQICYgX1BBR0VfV1JJVEVDT01CSU5FCj4g
PiAgLSBVc2luZyBDTU8gaW5zdHJ1Y3Rpb25zIGRlYWwgU1lOQ19ETUFfRk9SX0NQVS9ERVZJQ0Uu
Cj4gPgo+ID4gPiBDaGVlcnMsCj4gPiA+IEFuZHJlCj4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogTGl1IFNoYW9odWEgPGxpdXNoQGFsbHdpbm5lcnRlY2guY29tPgo+ID4gPiA+IFRlc3RlZC1i
eTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogR3Vv
IFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiA+ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBh
cmRAa2VybmVsLm9yZz4KPiA+ID4gPiBDYzogQ29yZW50aW4gTGFiYmUgPGNsYWJiZUBiYXlsaWJy
ZS5jb20+Cj4gPiA+ID4gQ2M6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWxAc2hvbGxhbmQub3JnPgo+
ID4gPiA+IENjOiBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFvc2MuaW8+Cj4gPiA+ID4gQ2M6IExB
QkJFIENvcmVudGluIDxjbGFiYmUubW9udGpvaWVAZ21haWwuY29tPgo+ID4gPiA+IENjOiBNaWNo
YWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPgo+ID4gPiA+IENjOiBDaGVuLVl1IFRzYWkgPHdl
bnNAY3NpZS5vcmc+Cj4gPiA+ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNo
Pgo+ID4gPiA+IENjOiBXZWkgRnUgPHdlZnVAcmVkaGF0LmNvbT4KPiA+ID4gPiBDYzogV2VpIFd1
IDxsYXp5cGFyc2VyQGdtYWlsLmNvbT4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxn
dW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4KPgo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJl
bgoKTUw6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNza3kvCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
