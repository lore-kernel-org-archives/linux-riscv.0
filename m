Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375B9EE3F3F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 23:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g3GXulZNHopq1hzQkQO9tzt3uwB8+gL3NW4L13t+4Xw=; b=qbGMUVhF644nxN
	temtxxDB/grPwJj0VsWWxqTE3dUQfz5sp6HOzVDMgQ6GEniKp0H0WiH2SsjRzNmyfL4fomUbJzOqK
	gqtkcCnxt/hMpi2FyWhsTUPP8gjuQpKK8BSQ3ZF8ecDpFrIDG08C3rDCDxQk9RcarLLPGO5MNWUNg
	gy0U7wF2HeD0fiYxnTg962uXmljFwgc3lN+jNr4zOiX28cqYxYdQPGxiTrRJttlCIGNlBi/E2nTVD
	nyk7PP6ogHBJE8gmeRzIbkkmztyFYp/gEjDnkTXZmSAApGz6xQveHgC3hvNXepT4RFkTw2ZWXv0Ui
	8w62il7Wfz8e8kDJyr0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgCcw-004G9e-0V;
	Tue, 12 Sep 2023 23:17:02 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgCcs-004G8h-1r;
	Tue, 12 Sep 2023 23:16:59 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-502a4f33440so7072725e87.1;
        Tue, 12 Sep 2023 16:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694560616; x=1695165416; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrbSVU4nZUFvuKXs1rDJFefP9fH0F3hyySGPvLoP9m8=;
        b=TtTHqnA41BLJun+720aL95ARAoGw2Lxyc0atHLW3u8nSOM3NdpzarCKV7ZdKX52973
         w3L5BZuveB6o8BLNU2mVGfDyacr+GhpkRLSygrDNk0S6g92LpbY4l6u/BPdWXisYvGmU
         6Gp7Lf9h1f48DTxTnwYJTaBOq2SPsEZFL56FJ6e6mDmFiq7x6PaBBsDm6SQravasgmLV
         pu4emVDa8rTdpedSzE2s33aA7s3Ob8idd5ad0FfloTt3G5gvvXgTW3DzTNEicNI/3hY2
         plZFtkv4Fs1qKuoYTKV9sdJEAbk797ZZB0ZDg9eQcFLrLfGrWGP8QmmyJ09UhGkkoVBa
         6PVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694560616; x=1695165416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrbSVU4nZUFvuKXs1rDJFefP9fH0F3hyySGPvLoP9m8=;
        b=qIWS5bM1ozeO6yMTdkGsN7j40RNF/BrZVTnoja90/NPLnEIuedtw0Osg3Rgp8DgUZp
         WSyClyqknLcuCOj1LuHMwnHu0QvUzSnn/tzy0M4T2MGP951Rb8AuEnGOK70Xxz8wElgM
         Ip2rw4Rsxy4yv+cyuQAVGbCBpkTuBpWctjOdSUSHruVJZXMo8U1UZ3lcuJ042HPXN6z6
         CxO50s8c373PTnItS1DGg33FLQbKLcfjhjhj8r0jx/EOFgD0S3CVas/fn5LZdzEBCyVt
         i9IbQR7clshGBsoJI/Xo3AC5rOAvUaRiVRidAHsVSCA+ypWFNgu5hloc3T8B5LYjnExq
         nCfA==
X-Gm-Message-State: AOJu0Yx3/46rjs9z7h4ocUFKC4b4yY/udAbWJvegvZW/ErnpGm8KUoWR
	gW8GBMUcmyAw3CzMSkT6TIWmZHGIwm01Le3eVsSpoLevIG5BPc/Tw1s=
X-Google-Smtp-Source: AGHT+IEBY3l3EINWayY7tuJfGoVDjPoP8cqckAfPldb0MCin3ecEklcSeeAUDt1vmekTIwLD2t/Y9JLbGHco4LHds+E=
X-Received: by 2002:a05:6512:31c3:b0:500:a694:46f with SMTP id
 j3-20020a05651231c300b00500a694046fmr951572lfe.19.1694560615656; Tue, 12 Sep
 2023 16:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230912224654.6556-1-puranjay12@gmail.com> <20230912224654.6556-6-puranjay12@gmail.com>
 <ZQDuVTSycDcjDkvi@shell.armlinux.org.uk>
In-Reply-To: <ZQDuVTSycDcjDkvi@shell.armlinux.org.uk>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Wed, 13 Sep 2023 01:16:44 +0200
Message-ID: <CANk7y0iFdgHgu+RXYJvP3swaRS+-Lr0CgOAdcQWtjs4VkrOzdQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 5/6] bpf, arm32: Always zero extend for LDX with B/H/W
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shubham Bansal <illusionist.neo@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Wang YanQing <udknight@gmail.com>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_161658_639893_CAA2EDCB 
X-CRM114-Status: GOOD (  23.80  )
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

T24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgMTowNOKAr0FNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IE9uIFR1ZSwgU2VwIDEyLCAyMDIzIGF0
IDEwOjQ2OjUzUE0gKzAwMDAsIFB1cmFuamF5IE1vaGFuIHdyb3RlOgo+ID4gVGhlIEpJVHMgc2hv
dWxkIG5vdCBkZXBlbmQgb24gdGhlIHZlcmlmaWVyIGZvciB6ZXJvIGV4dGVuZGluZyB0aGUgdXBw
ZXIKPiA+IDMyIGJpdHMgb2YgdGhlIGRlc3RpbmF0aW9uIHJlZ2lzdGVyIHdoZW4gbG9hZGluZyBh
IGJ5dGUsIGhhbGYtd29yZCwgb3IKPiA+IHdvcmQuCj4gPgo+ID4gQSBmb2xsb3dpbmcgcGF0Y2gg
d2lsbCBtYWtlIHRoZSB2ZXJpZmllciBzdG9wIHBhdGNoaW5nIHpleHQgaW5zdHJ1Y3Rpb25zCj4g
PiBhZnRlciBMRFguCj4KPiBUaGlzIHdhcyBpbnRyb2R1Y2VkIGJ5Ogo+Cj4gMTYzNTQxZTZiYTM0
ICgiYXJtOiBicGY6IGVsaW1pbmF0ZSB6ZXJvIGV4dGVuc2lvbiBjb2RlLWdlbiIpCj4KPiBhbG9u
ZyB3aXRoIGFuIGFkZGl0aW9uYWwgZnVuY3Rpb24uIFNvIHRocmVlIHBvaW50czoKPgo+IDEpIHRo
ZSBjb21taXQgc2hvdWxkIHByb2JhYmx5IGV4cGxhaW4gd2h5IGl0IGhhcyBub3cgYmVjb21lIHVu
ZGVzaXJhYmxlCj4gdG8gYWNjZXNzIHRoaXMgdmVyaWZpZXIgc3RhdGUsIHdoZXJlYXMgaXQgYXBw
ZWFycyBpdCB3YXMgZXhwbGljaXRseQo+IGFkZGVkIHRvIHBlcm1pdCB0aGlzIG9wdGltaXNhdGlv
bi4KCkkgYWRkZWQgc29tZSBkZXRhaWxzIGluIHRoZSBjb3ZlciBsZXR0ZXIuCgpGb3IgdGhlIGNv
bXBsZXRlIGRpc2N1c3Npb24gc2VlOiBbMV0KCj4gMikgeW91IHN0YXRlIHRoYXQgaml0cyBzaG91
bGQgbm90IGRlcGVuZCBvbiB0aGlzIHN0YXRlLCBidXQgdGhlIGFib3ZlCj4gY29tbWl0IGFkZHMg
bW9yZSByZWZlcmVuY2VzIHRoYW4geW91J3JlIHJlbW92aW5nLCBzbyBhcmVuJ3QgdGhlcmUgc3Rp
bGwKPiByZWZlcmVuY2VzIHRvIHRoZSB2ZXJpZmllciByZW1haW5pbmcgYWZ0ZXIgdGhpcyBwYXRj
aD8gSSBjb3VudCBhIHRvdGFsCj4gb2YgMTAsIGFuZCB0aGUgcGF0Y2ggYmVsb3cgcmVtb3ZlcyB0
aHJlZS4KClRoZSBKSVRzIHNob3VsZCBub3QgZGVwZW5kIG9uIHRoaXMgc3RhdGUgZm9yIExEWCAo
bG9hZGluZwphIEIvSC9XLgpUaGlzIHBhdGNoIHJlbW92ZXMgdGhlIHVzYWdlIG9ubHkgZm9yIExE
WC4KCj4gMykgd2hhdCBhYm91dCB0aGUgYnBmX2ppdF9uZWVkc196ZXh0KCkgZnVuY3Rpb24gdGhh
dCB3YXMgYWRkZWQgdG8KPiBzdXBwb3J0IHRoZSBleHBvcnQgb2YgdGhpcyB6ZXh0IHN0YXRlPwoK
VGhhdCBpcyBzdGlsbCBhcHBsaWNhYmxlLCBUaGUgdmVyaWZpZXIgd2lsbCBzdGlsbCBlbWl0IHpl
eHQKaW5zdHJ1Y3Rpb25zIGZvciBvdGhlcgppbnN0cnVjdGlvbnMgbGlrZSBCUEZfQUxVIC8gQlBG
X0FMVTY0Cgo+Cj4gRXNzZW50aWFsbHksIHRoZSBsb2dpYyBzdGF0ZWQgaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlIGRvZXNuJ3Qgc2VlbSB0byBiZQo+IHJlZmxlY3RlZCBieSB0aGUgcHJvcG9zZWQgY29k
ZSBjaGFuZ2UuCgpJIHdpbGwgdHJ5IHRvIHByb3ZpZGUgbW9yZSBpbmZvcm1hdGlvbi4KQ3VycmVu
dGx5IEkgaGF2ZSBhc2tlZCBBbGV4ZWkgaWYgd2UgcmVhbGx5IG5lZWQgdGhpcyBpbiBbMl0uCkkg
c3RpbGwgdGhpbmsgdGhpcyBvcHRpbWl6YXRpb24gaXMgdXNlZnVsIGFuZCB3ZSBzaG91bGQga2Vl
cCBpdC4KClRoYW5rcywKUHVyYW5qYXkKClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
Q0FOazd5MGoyZi1nUGdad2QrWWZUTDcxLTZ3ZnZreStmPWtCQ19jY3FzUzBFSEF5c3lBQG1haWwu
Z21haWwuY29tLwpbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmL0NBTms3eTBoSzlzUUot
a1J4M25RcFZKU3hwUD1OenpGYUxpdE9ZcTg9UGI2RHZrOWZwZ0BtYWlsLmdtYWlsLmNvbS8KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
