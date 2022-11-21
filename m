Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1440EC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 11:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTGCuaGAaoGJ40xMdwQMiPRvw6pNQKbQKMKNXX3FEN0=; b=B7O3+VOnSUQGh8
	cT0Ziyn/sDLih1Ej5xsBPEED8amPmtVUnoMklQ82kbz62EHvQdMyGtpg5biJ3BCROiSsNWSuP8Xms
	PuPUo/CCrzaMxWjG3+x/i3v7YF9FZdZd2wR3uKKIWLW8UsHjbAs8ABLoptiNV7616/9WuAcRPuQKk
	1AjeUkdSOTP5bncTogk6n2p1jEdhtdOMUFb4VfvwRJ5289qJEYdLVFqZ+yunWoko5Nm24iFG6Jqn6
	ZXlmZ8xwug16tw+kwv5HaNo48VM/lJhO5Cg764mV5OLRESavEKrZA2P9XnsE6FF1/QbsfKn84vc+T
	L+4BS0/JF1t5Y9u+Q+LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox4wF-00CuRA-Ld; Mon, 21 Nov 2022 11:26:11 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox4wB-00CuP7-V9
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 11:26:10 +0000
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com [209.85.219.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CE9763F32C
	for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 11:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1669029959;
	bh=FiGkcGbzyfgd+faqNuzsk0J93877S/Msc6ZRoL9HQP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=qTWcb+mcPupDV2MGKFxLHVNzBflDIkphnwn2YttuS/sVDJ1gpq5fHQUGatfZTz3/O
	 7mVmq0qp2eKhhk1x2CsQY08WWII/XrvuaJmUQHXauPyv74VzQDcAbR+M8xdwY7cB9T
	 l9XwZAanOEpVI5Fo2Rg1ZkGspA4w3XiKfKJQPe3w/P2TpSFCESDgb0TiWx7Rq5adrJ
	 1YPAD/1dqapWGQkz0UpsE/X0GdFVVD4CJ/bsqk9Gw8DX8R5uMdsuaeqahKaVFoHREc
	 rWZVhAfLKk0GfrBtah4M8E8xLN4s0DqmJ9IVyb7S3+GCNlca+i/TyG0U185xo5z/My
	 JZ2c1sACprPDw==
Received: by mail-yb1-f200.google.com with SMTP id 137-20020a25048f000000b006e6a76f05e3so10781353ybe.14
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 03:25:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FiGkcGbzyfgd+faqNuzsk0J93877S/Msc6ZRoL9HQP0=;
        b=OSlZUDqxbNo3cM8SCoQrkQjPQrVjOr8LYP1Ku3UD2eZYbbc5/MFk+LmhXxp78nO4xr
         q0dD1r/z71pJT81JaPMOBsZ20CGXHMdLCbd3JjBfu807SIOzikX1L94H+LIgx5pXhsqa
         hFiwItVhLS+sTeTKVIH1Yrd+QqukQLZugoHJz2k7gRz8d0x7rYwOtSsq/yED9ikCGfyo
         +H5v/PY52pAFtuCPyCZ/nFczcawJMKy/r99qqoUM01GNZNSeVt78Aam2EyUCVsxI3kky
         1X8BirmVJQsV49IPoEoHU6o0fQImyhtGcCMqJy9Jeax0BO90q6LN5Df1uO5x1QhuN38F
         7Rig==
X-Gm-Message-State: ANoB5plr2peTW1Yi2WkL6470qQcKfX4150h0q807jh41mifKG91Ujc2Z
	+GyfqAvHXb6KSW1b2b3GONpCVRlCXda1GE/sQFdrBfglvJmi3S7PKo/Qmv3lGFlnNkcDnfbaTvK
	G/6lBh4pRMVUAIAlKuQfQ0NtVEEqOegxLelqBUN1WDqOfU8KZaK4j+FoJ4RuvvA==
X-Received: by 2002:a25:abe4:0:b0:6e7:cbc4:1ac3 with SMTP id v91-20020a25abe4000000b006e7cbc41ac3mr15644379ybi.559.1669029958932;
        Mon, 21 Nov 2022 03:25:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Xq9tjSs4Qr1D2ghrSTz4SnS2vs/YppSYp35p6mK+zW9yruVxeUf3o6O+n1peXM/7BVePjaiCc53Vd+/yylUE=
X-Received: by 2002:a25:abe4:0:b0:6e7:cbc4:1ac3 with SMTP id
 v91-20020a25abe4000000b006e7cbc41ac3mr15644356ybi.559.1669029958721; Mon, 21
 Nov 2022 03:25:58 -0800 (PST)
MIME-Version: 1.0
References: <20221120082114.3030-1-jszhang@kernel.org> <20221120082114.3030-6-jszhang@kernel.org>
 <CAJM55Z_f=zp3Z=wno_yr7csAUMQ472RiZXD19CrDTTxmGAmU4w@mail.gmail.com> <540beefcad5f9921068d54d056f168a4c45ffeaf.camel@icenowy.me>
In-Reply-To: <540beefcad5f9921068d54d056f168a4c45ffeaf.camel@icenowy.me>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 21 Nov 2022 12:25:42 +0100
Message-ID: <CAJM55Z9D1=T-mZkScP2LJbRfi=gB8bmpKDMndHhXGomFGN9OOA@mail.gmail.com>
Subject: Re: [PATCH 5/7] riscv: dts: bouffalolab: add the bl808 SoC base
 device tree
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Jisheng Zhang <jszhang@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_032608_334072_60CF220B 
X-CRM114-Status: GOOD (  28.48  )
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

T24gTW9uLCAyMSBOb3YgMjAyMiBhdCAwNDozNywgSWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3ku
bWU+IHdyb3RlOgo+Cj4g5ZyoIDIwMjItMTEtMjDmmJ/mnJ/ml6XnmoQgMTU6NTcgKzAxMDDvvIxF
bWlsIFJlbm5lciBCZXJ0aGluZ+WGmemBk++8mgo+ID4gT24gU3VuLCAyMCBOb3YgMjAyMiBhdCAw
OTozMiwgSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+ID4gd3JvdGU6Cj4gPiA+
Cj4gPiA+IEFkZCBhIGJhaXNjIGR0c2kgZm9yIHRoZSBib3VmZmFsb2xhYiBibDgwOCBTb0MuCj4g
PiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9y
Zz4KPiA+ID4gLS0tCj4gPiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL01ha2VmaWxlICAgICAgICAg
ICAgICAgfCAgMSArCj4gPiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2JvdWZmYWxvbGFiL2JsODA4
LmR0c2kgfCA3NAo+ID4gPiArKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDc1IGluc2VydGlvbnMoKykKPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL2JvdWZmYWxvbGFiL2JsODA4LmR0c2kKPiA+ID4KPiA+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvTWFrZWZpbGUKPiA+ID4gYi9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL01ha2VmaWxlCj4gPiA+IGluZGV4IGZmMTc0OTk2Y2RmZC4uYjUyNTQ2NzE1MmIyIDEwMDY0
NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL01ha2VmaWxlCj4gPiA+ICsrKyBiL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvTWFrZWZpbGUKPiA+ID4gQEAgLTEsNCArMSw1IEBACj4gPiA+ICAj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gPiA+ICtzdWJkaXIteSArPSBib3Vm
ZmFsb2xhYgo+ID4gPiAgc3ViZGlyLXkgKz0gc2lmaXZlCj4gPiA+ICBzdWJkaXIteSArPSBzdGFy
Zml2ZQo+ID4gPiAgc3ViZGlyLSQoQ09ORklHX1NPQ19DQU5BQU5fSzIxMF9EVEJfQlVJTFRJTikg
Kz0gY2FuYWFuCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2JvdWZmYWxv
bGFiL2JsODA4LmR0c2kKPiA+ID4gYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2JvdWZmYWxvbGFiL2Js
ODA4LmR0c2kKPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gaW5kZXggMDAwMDAwMDAw
MDAwLi5jOThlYmIxNGVlMTAKPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiArKysgYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL2JvdWZmYWxvbGFiL2JsODA4LmR0c2kKPiA+ID4gQEAgLTAsMCArMSw3NCBA
QAo+ID4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wKyBvciBNSVQpCj4g
PiA+ICsvKgo+ID4gPiArICogQ29weXJpZ2h0IChDKSAyMDIyIEppc2hlbmcgWmhhbmcgPGpzemhh
bmdAa2VybmVsLm9yZz4KPiA+ID4gKyAqLwo+ID4gPiArCj4gPiA+ICsjaW5jbHVkZSA8ZHQtYmlu
ZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+Cj4gPiA+ICsKPiA+ID4gKy8gewo+ID4g
PiArICAgICAgIGNvbXBhdGlibGUgPSAiYm91ZmZhbG9sYWIsYmw4MDgiOwo+ID4gPiArICAgICAg
ICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4gPiArICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+
ID4gPiArCj4gPiA+ICsgICAgICAgY3B1cyB7Cj4gPiA+ICsgICAgICAgICAgICAgICB0aW1lYmFz
ZS1mcmVxdWVuY3kgPSA8MTAwMDAwMD47Cj4gPiA+ICsgICAgICAgICAgICAgICAjYWRkcmVzcy1j
ZWxscyA9IDwxPjsKPiA+ID4gKyAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+ID4g
PiArCj4gPiA+ICsgICAgICAgICAgICAgICBjcHUwOiBjcHVAMCB7Cj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidGhlYWQsYzkwNiIsICJyaXNjdiI7Cj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGRldmljZV90eXBlID0gImNwdSI7Cj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ZC1jYWNoZS1ibG9jay1zaXplID0gPDY0PjsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ZC1jYWNoZS1zZXRzID0gPDI1Nj47Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGQtY2Fj
aGUtc2l6ZSA9IDwzMjc2OD47Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGktY2FjaGUt
YmxvY2stc2l6ZSA9IDw2ND47Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGktY2FjaGUt
c2V0cyA9IDwxMjg+Owo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBpLWNhY2hlLXNpemUg
PSA8MzI3Njg+Owo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBtbXUtdHlwZSA9ICJyaXNj
dixzdjM5IjsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmlzY3YsaXNhID0gInJ2NjRp
bWFmZGMiOwo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNwdTBfaW50Yzog
aW50ZXJydXB0LWNvbnRyb2xsZXIgewo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAicmlzY3YsY3B1LWludGMiOwo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGludGVycnVwdC1jb250cm9sbGVyOwo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDA+Owo+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICNpbnRlcnJ1cHQtY2VsbHMgPSA8MT47Cj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIH07Cj4gPiA+ICsgICAgICAgICAgICAgICB9Owo+ID4gPiArICAg
ICAgIH07Cj4gPiA+ICsKPiA+ID4gKyAgICAgICB4dGFsOiB4dGFsLWNsayB7Cj4gPiA+ICsgICAg
ICAgICAgICAgICBjb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsKPiA+ID4gKyAgICAgICAgICAg
ICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDw0MDAwMDAwMD47Cj4gPgo+ID4gVGhpcyB3YXMgZGlzY3Vz
c2VkIG1hbnkgdGltZXMgYmVmb3JlLCBidXQgSSB0aGluayB0aGUgY29uY2x1c2lvbiB3YXMKPiA+
IHRoYXQgdGhlIGZyZXF1ZW5jeSBpcyBhIHByb3BlcnR5IG9mIHRoZSBjcnlzdGFsIG9uIHRoZSBi
b2FyZCwgc28gdGhpcwo+ID4gc2hvdWxkIGJlIDAgaW4gdGhlIFNvQyBkdHNpLCBhbmQgdGhlbiBv
dmVyd3JpdHRlbiBpbiB0aGUgYm9hcmQgZGV2aWNlCj4gPiB0cmVlLgo+Cj4gQnV0IG1hbnkgY2hp
cHMganVzdCBzcGVjaWZ5IGFuIGFjY2VwdGVkIGZyZXF1ZW5jeSBpbiB0aGVpciBkYXRhc2hlZXQs
Cj4gYW5kIHVzaW5nIGEgZnJlcXVlbmN5IG90aGVyIHRoYW4gdGhpcyBpcyB1bmRlZmluZWQgYmVo
YXZpb3IuCgpZZXMsIHRoaXMgd2FzIHRoZSBhcmd1bWVudCBpbiBwcmV2aW91cyBkaXNjdXNzaW9u
cywgYnV0IHRoZSBjb25jbHVzaW9uCndhcyBzdGlsbCB0aGF0IGl0IHNob3VsZCBnbyBpbiB0aGUg
Ym9hcmQgZHRzLiBUbyBiZSBjbGVhciBJJ20ganVzdApzdW1taW5nIHVwIHRoZSBjb25jbHVzaW9u
IGZyb20gcHJldmlvdXMgZGlzY3Vzc2lvbnMgYWJvdXQgdGhpcywgYW5kCmhhdmUgbm8gc3Ryb25n
IG9waW5pb24gb3RoZXIgdGhhbiB3ZSBzaG91bGQgZG8gdGhlIHNhbWUgZXZlcnl3aGVyZS4KCj4g
Pgo+ID4gPiArICAgICAgICAgICAgICAgY2xvY2stb3V0cHV0LW5hbWVzID0gInh0YWwiOwo+ID4g
PiArICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDA+Owo+ID4gPiArICAgICAgIH07Cj4g
PiA+ICsKPiA+ID4gKyAgICAgICBzb2Mgewo+ID4gPiArICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJzaW1wbGUtYnVzIjsKPiA+ID4gKyAgICAgICAgICAgICAgIHJhbmdlczsKPiA+ID4gKyAg
ICAgICAgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JnBsaWM+Owo+ID4gPiArICAgICAgICAg
ICAgICAgZG1hLW5vbmNvaGVyZW50Owo+ID4gPiArICAgICAgICAgICAgICAgI2FkZHJlc3MtY2Vs
bHMgPSA8MT47Cj4gPiA+ICsgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsKPiA+ID4g
Kwo+ID4gPiArICAgICAgICAgICAgICAgdWFydDA6IHNlcmlhbEAzMDAwMjAwMCB7Cj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYm91ZmZhbG9sYWIsdWFydCI7Cj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDMwMDAyMDAwIDB4MTAwMD47Cj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MjAgSVJRX1RZUEVfTEVW
RUxfSElHSD47Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmeHRhbD47
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gPiA+
ICsgICAgICAgICAgICAgICB9Owo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgICBwbGljOiBp
bnRlcnJ1cHQtY29udHJvbGxlckBlMDAwMDAwMCB7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAidGhlYWQsYzkwMC1wbGljIjsKPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcmVnID0gPDB4ZTAwMDAwMDAgMHg0MDAwMDAwPjsKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgaW50ZXJydXB0cy1leHRlbmRlZCA9IDwmY3B1MF9pbnRjCj4gPiA+IDB4ZmZm
ZmZmZmY+LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgPCZjcHUwX2ludGMgOT47Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVw
dC1jb250cm9sbGVyOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxs
cyA9IDwwPjsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgI2ludGVycnVwdC1jZWxscyA9
IDwyPjsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmlzY3YsbmRldiA9IDw2ND47Cj4g
PiA+ICsgICAgICAgICAgICAgICB9Owo+ID4gPiArICAgICAgIH07Cj4gPiA+ICt9Owo+ID4gPiAt
LQo+ID4gPiAyLjM3LjIKPiA+ID4KPiA+ID4KPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4g
PiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+ID4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+ID4KPiA+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
