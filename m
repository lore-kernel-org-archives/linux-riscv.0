Return-Path: <SRS0=VVci=OL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BB9C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 08:09:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5349261181
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 08:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5349261181
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKGtJuWGSlMoV9YRnfLeUtSJwEIcYPR1KGYtbmVZ5mo=; b=gQYgfooOxpIoN4
	cJQYZR6uQ0LwCRL8cEqmYAm7HUeH40bahh6U03ywnnNsx8KsyueTRaul1vWxYBR4oHm45YHLpihX5
	5FK14/2rK2QpSjI6o0hr3PGQ5VmAVrHLHfO9oXKvyIuLASTJ+aj7pYoQExjySb2YFHSaD1eYo3Int
	XGL0R6W58+rfNxqzszaoL5ATfRzAXqTU1FqajrNbTcJd5dBvJccaLWDcwyIy6kQDH97G8SQBtzuHp
	ANtvLODam/pUKKUAOKCE/NgHiPd7Xf27/gxjyS0NPJcZKqFHpW7wh97x42SeKHydbIfGYJjvyXSrl
	o0Uyy2/PbpT7hPMWjvHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSapZ-003txF-KA; Tue, 21 Sep 2021 08:08:45 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSapX-003twd-3v
 for linux-riscv@lists.infradead.org; Tue, 21 Sep 2021 08:08:44 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MiaLn-1n7Pd22l7v-00fiBq for <linux-riscv@lists.infradead.org>; Tue, 21 Sep
 2021 10:08:39 +0200
Received: by mail-wr1-f49.google.com with SMTP id g16so36606309wrb.3
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 01:08:39 -0700 (PDT)
X-Gm-Message-State: AOAM530XYPFGqFmsfqXL2XG6D8vetGT0ZA42hKpoSX905SwYMXIl/QJD
 fUNSUkhK9cPtWblUT+sNWwjDjZC5aJtdyP9vkd8=
X-Google-Smtp-Source: ABdhPJy6gNp3mnAgyb/iPHvO2OC6clNZlGkHnTCwBMBfOS6i3DFhHXtaQsZqW3ibIVTDOgQQF2uucpdNu1A4eKHz32Y=
X-Received: by 2002:adf:f481:: with SMTP id l1mr2382016wro.411.1632211718939; 
 Tue, 21 Sep 2021 01:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210917061040.2270822-1-alistair.francis@opensource.wdc.com>
 <20210917061040.2270822-2-alistair.francis@opensource.wdc.com>
 <72990864-5ec6-1f73-efd9-61b667a172dd@collabora.com>
In-Reply-To: <72990864-5ec6-1f73-efd9-61b667a172dd@collabora.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 Sep 2021 10:08:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3x_EyCiPDpMK54y=Rtm-Wb08ym2TNiuAZgXhYrThcWTw@mail.gmail.com>
Message-ID: <CAK8P3a3x_EyCiPDpMK54y=Rtm-Wb08ym2TNiuAZgXhYrThcWTw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] perf bench: Add support for 32-bit systems with
 64-bit time_t
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alistair Francis <alistair23@gmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Namhyung Kim <namhyung@kernel.org>, 
 Jiri Olsa <jolsa@redhat.com>, linux-perf-users@vger.kernel.org, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Darren Hart <dvhart@infradead.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Atish Patra <atish.patra@wdc.com>,
 Arnd Bergmann <arnd@arndb.de>, Alistair Francis <alistair.francis@wdc.com>
X-Provags-ID: V03:K1:PEvISiQIhKubvPXaAcfYyx1a7D66wggOlihWEe+Tho3Pua5lZdx
 e0UVgqnKKyjyd7/ZBExAQDuDPzUK3XfUq8m/zeRxnA1HBJjYtaMlvfJyQ6Aftqr8xx93Ohh
 bLt4SzlPXj7KPxYTjLUZRDFKsRwQmhyNTOjXwxxAwyB5K46dlQx2AsaDUTxZd7s008DX2T2
 8/3q96d3wzeHxxAcazupw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OUtr6erNd0k=:joWECaremrhk4Y1aE4S/P7
 lETLWdkMW1Li94yVNUAhw2b0tfhuDGqQM9/bG6/xK+bUjsqfRLzNEXKICSjSdWr9Gz1HNmJPR
 X8aGpjWUuohbl9wwZm0dHYa1IEV8VAWAXlgblQ0Hr0xb/xpJ5uZDchdQP/R/olYSYyzbELWPt
 Cifxupnib4wXC0LZcb3NHCnGdGk2ajJorZ0IWVqzCpcy3wGxeTLFlyKALOD7YCkVAkZlOAOH2
 J05itgPZdgsFZUGjocpNCqO2SRuHDGzY9JAez5QZwas+k06zNHlY38c3Jh07Ys8zMWK0O6tvF
 oPe4RgBmQVfRgmEKmdssJcbqppV8/STM7G5TbA92SvnSgZzb8wG7Jbrye+TKDIOX9e3U/1fvo
 PlTaOl2ZX0L2NX0pEHm5XjhtpXmnZ9gW9BOAiZU5HhAftoRbP9zg25R227NbTA3XOLoL+GqdI
 x2K5UDhbd4FaBV0niOGoBS4Z4Sy8Rxa6l+kYHmW4lhMyHWDjYAYMqqmksUU5utSeJD1mqzGTX
 t7O4pWQyGKr62Z374DiqI6o07YsZJqL8zSxrWMMJ7xVTGznjhMZxwH/PWB/hgcqpFNJjncoWh
 XXOinGiFou50/JHMd785cchcsOzZ9cGaokQKj57Z+yxLs2z63TBH71oe9lqKSCcOaQ42wo/tY
 xOkcL4NrrRYHhjnoYG32F2B8+7wlHJE8GHc/LUXJ1zr7iQNlJYAg41Yg7iCN6nkwsSVDRls/9
 xNv5leYQIBLA58fcyPwM5R08eOIMGTZzyhgSEmG+kfYuVGC7K7Y6dVRGUQV/fWl7toWJXkwrY
 S2HZibVZc3i7jvCMdflpdHpNzX8omgwnGhK0wyEivQVl+/MRvbodwkzjjbCRLeJKPnYt4dsDD
 2g+jt0hh3LMQzHSonz2Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_010843_495804_E98AA0E3 
X-CRM114-Status: GOOD (  18.09  )
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

T24gVHVlLCBTZXAgMjEsIDIwMjEgYXQgMTI6NDcgQU0gQW5kcsOpIEFsbWVpZGEKPGFuZHJlYWxt
ZWlkQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Cj4gI2lmIGRlZmluZWQoX19pMzg2X18pIHx8IF9f
VElNRVNJWkUgPT0gMzIKPiAjIGRlZmluZSBOUl9nZXR0aW1lNjQgX19OUl9jbG9ja19nZXR0aW1l
NjQKPiAjZWxzZQo+ICMgZGVmaW5lIE5SX2dldHRpbWU2NCBfX05SX2Nsb2NrX2dldHRpbWUKPiAj
ZW5kaWYKPgo+IHN0cnVjdCB0aW1lc3BlYzY0IHsKPiAgICAgICAgIGxvbmcgbG9uZyB0dl9zZWM7
ICAgICAgIC8qIHNlY29uZHMgKi8KPiAgICAgICAgIGxvbmcgbG9uZyB0dl9uc2VjOyAgICAgIC8q
IG5hbm9zZWNvbmRzICovCj4gfTsKPgo+IGludCBnZXR0aW1lNjQoY2xvY2tfdCBjbG9ja2lkLCBz
dHJ1Y3QgdGltZXNwZWM2NCAqdHYpCj4gewo+ICAgICAgICAgcmV0dXJuIHN5c2NhbGwoTlJfZ2V0
dGltZTY0LCBjbG9ja2lkLCB0dik7Cj4gfQo+Cj4gVGhlbiB3ZSBjYW4ganVzdCB1c2UgJnRpbWVv
dXQgYXQgX19OUl9mdXRleF90aW1lNjQgZm9yIDMyYml0IGFyY2ggYW5kIGF0Cj4gX19OUl9mdXRl
eCBmb3IgNjRiaXQgYXJjaC4KClRoaXMgaXMgc3RpbGwgYnJva2VuIHdoZW4geW91IGRpc2FibGUg
Q09ORklHX0NPTVBBVF8zMkJJVF9USU1FLAp3aGljaCBkaXNhYmxlcyBhbGwgc3lzdGVtIGNhbGxz
IHRoYXQgdGFrZSB0aW1lMzIgYXJndW1lbnRzLgoKPiBUaGlzIG1pZ2h0IGJlIGEgc2ltcGxlciBz
b2x1dGlvbiB0byB0aGUgcHJvYmxlbSB0aGF0IHlvdSBhcmUgZmFjaW5nIGJ1dAo+IEknbSBub3Qg
ZW50aXJlbHkgc3VyZS4gQWxzbywgZnV0ZXgncyBzZWxmdGVzdHMgZG8gdXNlIHRoZSB0aW1lb3V0
Cj4gYXJndW1lbnQgYW5kIEkgdGhpbmsgdGhhdCB0aGV5IGFsc28gd29uJ3QgY29tcGlsZSBpbiAz
Mi1iaXQgUklTQy1WLCBzbwo+IG1heWJlIHdlIGNhbiBzdGFydCBmcm9tIHRoZXJlIHNvIHdlIGNh
biBhY3R1YWxseSB0ZXN0IHRoZSB0aW1lb3V0Cj4gYXJndW1lbnQgYW5kIGNoZWNrIGlmIGl0J3Mg
d29ya2luZy4KCkkgd291bGQgbG92ZSB0byBzZWUgdGhlIHdyYXBwZXIgdGhhdCBBbGlzdGFpciB3
cm90ZSBhcyBwYXJ0IG9mIHNvbWUga2VybmVsCnVhcGkgaGVhZGVyIHByb3ZpZGVkIHRvIHVzZXIg
c3BhY2UuIGZ1dGV4IGlzIHVzZWQgYnkgdG9ucyBvZiBhcHBsaWNhdGlvbnMsCmFuZCB3ZSBuZXZl
ciBoYWQgYSBsaWJyYXJ5IGFic3RyYWN0aW9uIGZvciBpdCwgc28gZXZlcnlvbmUgaGFzIHRvIGRv
IHRoZXNlCmJ5IGhhbmQsIGFuZCB0aGV5IGFsbCBnZXQgdGhlbSBzbGlnaHRseSB3cm9uZyBpbiBk
aWZmZXJlbnQgd2F5cy4KCldlIG5vcm1hbGx5IGRvbid0IGRvIHRoaXMgaW4ga2VybmVsIGhlYWRl
cnMsIGJ1dCBJIHRoaW5rIHRoZSBiZW5lZml0cwp3b3VsZCBiZSBmYXIgZ3JlYXRlciBjb21wYXJl
ZCB0byB0b2RheSdzIHNpdHVhdGlvbi4KCiAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
