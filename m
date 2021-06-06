Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D1AC47096
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 16:18:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC0646142B
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 16:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC0646142B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=715YQaRoQdXl6DtiSWS0OMBeH7lD0NUsrqkpJE4VbKg=; b=0ec6zAszqSzw/p
	KGwNaeEVeSWYYpbvaXdPkN1SOUydRUNgvWSWn0QL3KR6Gtk+ZZ1VUsWNMl8pHpzb9GsEhcEaguysE
	vg8Zd8ipoWRAl2uf24CLf47FE14PUqrasnraFZrPgMCp04sKV1bUXbVKgLx/hP/e00nW5K3MGP3yu
	/YO8ANm9nLSYoZvek9jEvraeY7OHMHlvER2blEWrA9pNNG604/4/VCzE8bgehaphuscpzuGJZcdX5
	NpmLZ05hVax5yVh5/8aZpUpwsWXgqkktDPI2t3dvLsnMSpxMwHXgt8fTnyVte679IYK3s81S3zLsn
	/adX8jFC9iYErN5PVyeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpvU0-000XFN-6Y; Sun, 06 Jun 2021 16:18:40 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpvTx-000XEO-3g
 for linux-riscv@lists.infradead.org; Sun, 06 Jun 2021 16:18:38 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MSckp-1lwhlm3PwH-00Sviu for <linux-riscv@lists.infradead.org>; Sun, 06
 Jun 2021 18:18:31 +0200
Received: by mail-wr1-f51.google.com with SMTP id q5so14618205wrm.1
 for <linux-riscv@lists.infradead.org>; Sun, 06 Jun 2021 09:18:31 -0700 (PDT)
X-Gm-Message-State: AOAM531W+0DABy+3aTViI4RCie3DMg4nhHwiDasMUD/dUiJS6+MxVM+T
 cHjORhE0riiWzcG5ZDrllfCvKiCZRoLoIUvXskc=
X-Google-Smtp-Source: ABdhPJx9dKNalsIrm0Lf+lcVcT23HpzJ96dWZFvRiQpmmC6lCKzyeQIjKu301k2n374UAlf86nYIV+I5I0wPvzdJTug=
X-Received: by 2002:a5d:5084:: with SMTP id a4mr13649030wrt.286.1622996311239; 
 Sun, 06 Jun 2021 09:18:31 -0700 (PDT)
MIME-Version: 1.0
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <1622970249-50770-15-git-send-email-guoren@kernel.org>
In-Reply-To: <1622970249-50770-15-git-send-email-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 6 Jun 2021 18:16:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0yHEGH8=o_TQ+ajRn53j+mHxYxqyYLPXnUe=YWkTHDBw@mail.gmail.com>
Message-ID: <CAK8P3a0yHEGH8=o_TQ+ajRn53j+mHxYxqyYLPXnUe=YWkTHDBw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 11/11] riscv: soc: Allwinner D1 GMAC driver only
 for temp use
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Drew Fustini <drew@beagleboard.org>, 
 liush@allwinnertech.com, lazyparser@gmail.com, wefu@redhat.com, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 Corentin Labbe <clabbe@baylibre.com>, Samuel Holland <samuel@sholland.org>, 
 Icenowy Zheng <icenowy@aosc.io>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
 Michael Walle <michael@walle.cc>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:9MM1ZcyNmlBFDxyVM5pYXFYwpxpENGUi44//RTDMSsuSwUF2huQ
 iFGpN2kEArJR37U9fThOIUjhUR5XoZYTGjxUIosU1NKyk8WuU/se30VvNqwWcx/gx09lkt7
 HIdGcwvaGaC/gzbKwbboHIVx2ZdlWPN/CvHSA1t9Jrq8IzhL6fhgkNA2kIG4TLn1U8QO9N5
 Y992umIRCOtsPTcmqlCoA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NwjwjVr9dGs=:1So0ZRE2J6JEHMxr7cy8br
 z2lBy9EKn5r54QvRGJ2DpecsIZbVrk5ZQlLRtRlHZGDN6Apzk21UaS3POqrNcodqbQZOIraB3
 vsgOjlJ7KpRi1rz/FuiCuxr+WA0SrIikSTEt1msVZu/6I2oAePJiNoYEz+VK1guid3k6fWK7s
 4sNEdC3dkj/WN/Vj6F6az3scnoT2uSnL8qvwsWjWmT3gKVMiknWIyjaUP+H6vgq6uMRr4RJzD
 a3TcGeyq1QlO7HqupFN0/gnCK3OoJSEdVTnvCAsIt7Ea8G/Di0dOes7dH2oZDCDvRDWWmlhxh
 uh+LlDDuImUWaufrePBxZmkybnMGoxHhMr6V192AoX0Fnzjv5Priqt/D0nZ6rHEuUZzcamPZk
 lS2gPpV6H8o01bHiMDRDOXvLIDX0/JbLJQfLGm9aco4L1evNXdkA0Tqq97ayl6P77eIG/mdSG
 YlMdaef3JNbmkjVfZJL3sW/ieyWR5TlzrYTB2gdJu6w/MTM4EU20zB3zn+jvMBFJ+n9lO5nTJ
 Pnbbb2Vyc5qGWRJ3b4zTMnbXoaqPI97FUDhWiysTnmTxsPjXcj8aSlLLzqU9bGpIiX/98xmaI
 J5jdFt7euL2muOLnLOy9q2JQo3+mCZvpL9EDOwq98LkdwvacAHdfBIbc3AT0ZxyouaY1mxJ5O
 7lxI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_091837_474614_280D9B2E 
X-CRM114-Status: GOOD (  20.19  )
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

T24gU3VuLCBKdW4gNiwgMjAyMSBhdCAxMTowNCBBTSA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3Rl
OgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvYWxsd2lubmVy
LWQxLW5lemhhLWtpdC5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9hbGx3aW5u
ZXItZDEtbmV6aGEta2l0LmR0cwo+IGluZGV4IGNkOWY3YzkuLjMxYjY4MWQgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvYWxsd2lubmVyLWQxLW5lemhhLWtpdC5k
dHMKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9hbGx3aW5uZXItZDEtbmV6
aGEta2l0LmR0cwo+IEBAIC0xMSw3ICsxMSw3IEBACj4gICAgICAgICBjb21wYXRpYmxlID0gImFs
bHdpbm5lcixkMS1uZXpoYS1raXQiOwo+Cj4gICAgICAgICBjaG9zZW4gewo+IC0gICAgICAgICAg
ICAgICBib290YXJncyA9ICJjb25zb2xlPXR0eVMwLDExNTIwMCI7Cj4gKyAgICAgICAgICAgICAg
IGJvb3RhcmdzID0gImNvbnNvbGU9dHR5UzAsMTE1MjAwIHJvb3R3YWl0IGluaXQ9L3NiaW4vaW5p
dCByb290PS9kZXYvbmZzIHJ3IG5mc3Jvb3Q9MTkyLjE2OC4xMDEuMjAwOi90bXAvcm9vdGZzX25m
cyx2Myx0Y3Asbm9sb2NrIGlwPTE5Mi4xNjguMTAxLjIzIjsKClRoZXNlIGFyZSBub3QgYm9hcmQg
c3BlY2lmaWMgb3B0aW9ucywgdGhleSBzaG91bGQgYmUgc2V0IGJ5IHRoZSBib290bG9hZGVyCmFj
Y29yZGluZyB0byB0aGUgbmV0d29yayBlbnZpcm9ubWVudC4gSXQgY2xlYXJseSBkb2Vucyd0IGJl
bG9uZwppbnRvIHRoaXMgcGF0Y2ggLgoKPiAgICAgICAgICAgICAgICAgc3Rkb3V0LXBhdGggPSAm
c2VyaWFsMDsKPiAgICAgICAgIH07Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0
cy9hbGx3aW5uZXIvYWxsd2lubmVyLWQxLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdp
bm5lci9hbGx3aW5uZXItZDEuZHRzaQo+IGluZGV4IDExY2Q5MzguLmQzMTdlMTkgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvYWxsd2lubmVyLWQxLmR0c2kKPiAr
KysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9hbGx3aW5uZXItZDEuZHRzaQo+IEBA
IC04MCw1ICs4MCwyMSBAQAo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmZHVt
bXlfYXBiPjsKPiAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+
ICAgICAgICAgICAgICAgICB9Owo+ICsKPiArICAgICAgICAgICAgICAgZXRoQDQ1MDAwMDAgewo+
ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bnhpLWdt
YWMiOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAwIDB4NDUwMDAwMCAweDAw
IDB4MTAwMDAgMHgwMCAweDMwMDAwMzAgMHgwMCAweDA0PjsKPiArICAgICAgICAgICAgICAgICAg
ICAgICBpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZwbGljIDB4M2UgMHgwND47Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgaW50ZXJydXB0LW5hbWVzID0gImdtYWNpcnEiOwo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGRldmljZV90eXBlID0gImdtYWMwIjsKPiArICAgICAgICAgICAgICAgICAg
ICAgICBwaHktbW9kZSA9ICJyZ21paSI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgdXNlX2Vw
aHkyNW0gPSA8MHgwMT47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgdHgtZGVsYXkgPSA8MHgw
Mz47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcngtZGVsYXkgPSA8MHgwMz47Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgZ21hYy1wb3dlcjA7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
Z21hYy1wb3dlcjE7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ21hYy1wb3dlcjI7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ICsgICAgICAgICAgICAgICB9
OwoKQmVmb3JlIHlvdSBhZGQgdGhpcyBpbiB0aGUgZHRzIGZpbGUsIHRoZSBwcm9wZXJ0aWVzIG5l
ZWQgdG8gYmUgZG9jdW1lbnRlZCBpbgp0aGUgYmluZGluZyBmaWxlLiBUaGUgImFsbHdpbm5lcixz
dW54aS1nbWFjIiBpZGVudGlmaWVyIGRvZXMgbm90IGFwcGVhciB0bwpiZSBzcGVjaWZpYyBlbm91
Z2ggaGVyZSwgYW5kIHRoZSBwcm9wZXJ0aWVzIGRvbid0IG1hdGNoIHdoYXQgZHdtYWMgdXNlcywK
d2hpY2ggd291bGQgbWFrZSBpdCB1bm5lY2Vzc2FyaWx5IGhhcmQgdG8gY2hhbmdlIHRvIHRoZSBv
dGhlciBkcml2ZXIKbGF0ZXIgb24gd2l0aG91dCBicmVha2luZyBjb21wYXRpYmlsaXR5IHRvIG9s
ZCBkdGIgZmlsZXMuCgo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2FsbHdpbm5lcnRtcC9z
dW54aS1nbWFjLW9wcy5jCj4gQEAgLTAsMCArMSw2OTAgQEAKPiArLyoKPiArICogbGludXgvZHJp
dmVycy9uZXQvZXRoZXJuZXQvYWxsd2lubmVyL3N1bnhpX2dtYWNfb3BzLmMKPiArICoKPiArICog
Q29weXJpZ2h0IMKpIDIwMTYtMjAxOCwgZnV6aGFva2UKPiArICogICAgICAgICAgICAgQXV0aG9y
OiBmdXpoYW9rZSA8ZnV6aGFva2VAYWxsd2lubmVydGVjaC5jb20+Cj4gKyAqCj4gKyAqIFRoaXMg
ZmlsZSBpcyBwcm92aWRlZCB1bmRlciBhIGR1YWwgQlNEL0dQTCBsaWNlbnNlLiAgV2hlbiB1c2lu
ZyBvcgo+ICsgKiByZWRpc3RyaWJ1dGluZyB0aGlzIGZpbGUsIHlvdSBtYXkgZG8gc28gdW5kZXIg
ZWl0aGVyIGxpY2Vuc2UuCgpBcmUgeW91IHN1cmUgdGhpcyBpcyB0aGUgY29ycmVjdCBjb3B5cmln
aHQgaW5mb3JtYXRpb24gYW5kICJmdXpoYW9rZSIgaXMKdGhlIGNvcHlyaWdodCBob2xkZXIgZm9y
IHRoaXMgZmlsZT8gSWYgdGhpcyBpcyBkZXJpdmVkIGZyb20gZWl0aGVyIHRoZQpkZXNpZ253YXJl
CmNvZGUgb3IgdGhlIExpbnV4IHN0bW1hYyBkcml2ZXIsIHRoZSBhdXRob3JzIHNob3VsZCBiZSBt
ZW50aW9uZWQsCmFuZCB0aGUgbGljZW5zZSBiZSBjb21wYXRpYmxlIHdpdGggdGhlIG9yaWdpbmFs
IGxpY2Vuc2UgdGVybXMuCgpBbmRyZSBhbHJlYWR5IGNvbW1lbnRlZCBvbiB0aGUgZHJpdmVyIHF1
YWxpdHkgYW5kIGNvZGUgZHVwbGljYXRpb24sIHRob3NlIGFyZQphbHNvIHNob3ctc3RvcHBlcnMs
IGJ1dCB0aGUgdW5jbGVhciBsaWNlbnNlIHRlcm1zIGFuZCBkdCBiaW5kaW5nIGNvbXBhdGliaWxp
dHkKYXJlIGV2ZW4gc3Ryb25nZXIgcmVhc29ucyB0byBub3QgZ2V0IGFueXdoZXJlIGNsb3NlIHRv
IHRoaXMgZHJpdmVyLgoKICAgICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
