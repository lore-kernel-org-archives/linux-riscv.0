Return-Path: <SRS0=6gMx=OM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF441C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 11:26:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 610FC60555
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 11:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 610FC60555
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27VdSwGIAyywKH9Y5nWKCv02NzTbIO4b6PPlVYZ+8ZM=; b=XUk+YckvRyyWNG
	4YODOcHEtrUtU5n5vBWqIZbTzZk19bURwls/YqafT6JQQkb8iZrsFJCCfzPaFf+qR9BrImqvSqLHh
	6D3BN7eJUjzR9nP8sqOf86z7pRn5GCcNWu0JZ91CZUdk0GC9DDsoHCDxMTQNVwa/HYuYVF7MGNW2c
	gagjjG8X6QOyEIgo5nmqR9VLzSFPTSE8YIR6awFphip+RQb4lASv7G2Ed8bzwGWF1FhTMOnwr1lXu
	dR/vfEEnaqEzzVm/Cv01AL+KxMrlZ7/pcz0oE0Xee5hhxs5mNh4O1FLCcaF3gxatPnA3oOCQpNJh2
	LreiTwurZq8dTtWe1z5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mT0Of-008J5p-BT; Wed, 22 Sep 2021 11:26:41 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mT0Oc-008J4S-SL
 for linux-riscv@lists.infradead.org; Wed, 22 Sep 2021 11:26:40 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mj7yt-1n7YLc126X-00fEgx for <linux-riscv@lists.infradead.org>; Wed, 22
 Sep 2021 13:26:33 +0200
Received: by mail-wr1-f43.google.com with SMTP id t18so5920072wrb.0
 for <linux-riscv@lists.infradead.org>; Wed, 22 Sep 2021 04:26:32 -0700 (PDT)
X-Gm-Message-State: AOAM533ISZEHnCt67JwxblbqMskO7pK9r2idEGYa7CC73jH3fTzhgeyx
 jxwUPkao5bB48Fzn4uNaRyzfTKaQMctOXlGXVMk=
X-Google-Smtp-Source: ABdhPJx7Vx8CgVkbie6rTHzp0NlK8qWjQiWBbJyQ5+YpxWx+wv3QwjZDGoYajJ4SkwfdROeT/MWSc2i1Jl2U7JktY+8=
X-Received: by 2002:adf:f481:: with SMTP id l1mr10119089wro.411.1632309992502; 
 Wed, 22 Sep 2021 04:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210917061040.2270822-1-alistair.francis@opensource.wdc.com>
 <20210917061040.2270822-2-alistair.francis@opensource.wdc.com>
 <72990864-5ec6-1f73-efd9-61b667a172dd@collabora.com>
 <CAK8P3a3x_EyCiPDpMK54y=Rtm-Wb08ym2TNiuAZgXhYrThcWTw@mail.gmail.com>
 <9db8c79a-f704-84ce-360b-84335f926a48@collabora.com>
In-Reply-To: <9db8c79a-f704-84ce-360b-84335f926a48@collabora.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 22 Sep 2021 13:26:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0LsxOTYeM-o=Ee=XFD6zN7ESV_dhGmAOFSj_zJ8pBDgA@mail.gmail.com>
Message-ID: <CAK8P3a0LsxOTYeM-o=Ee=XFD6zN7ESV_dhGmAOFSj_zJ8pBDgA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] perf bench: Add support for 32-bit systems with
 64-bit time_t
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Alistair Francis <alistair.francis@opensource.wdc.com>, 
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
 Alistair Francis <alistair.francis@wdc.com>
X-Provags-ID: V03:K1:4h/B//T1opln9tItZwLhEXvfbJp3DnPmQnPHQ9ywsSC0D8LvZv8
 oCxXECRlziUGA3kkZyBDG6PyHplKmEcRBczmZ/dxE6BDtDbyyou+d7ZhgASPmRYc7ZPQI+I
 v59oAfYeHFcon5BfGPDPUFzYkgbFVFAeGI+jO7Cyq/twYJMQ6zGKz/9PTqzYTM0LsGa2e4j
 0dEl7F0LRgsH0qi6jb70A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QL9itHNhCF0=:2+w/SqeAwtNyhxdUXIZoe/
 dq08TNPFC8fFDpCpetH14vbDCVd2CbYoDLBmwJL2FlZIxo4eHF5Iu1ELpNpYF5dTJZLFaaaIJ
 /e1JB99CgEwigyM7b5cMDzqtIeWKH1Aw4UdHVMPliDspSYW9BTELECEUA0KZG1S5SZDSarbjv
 zUnLnx3VgYllr7m9/viB8JTxZ1A99YBoECj2yQxyVjAM86jezkNrxGN6wVnJU1DT/jmROtV3W
 rXR62myhJitQ4cD95+uxgcPqNTC6k4hj2KgWLJ4ZVOQLfEs5QwyjbQ2BkyyVd+oaOaai5pGmH
 cqwpj3bpuKyYURKS/kmhd1a0vZW//beLHb4KMR+807XyVXiohOyHviI6dk+SmJJPlynEbiXr+
 HH/OtUttEy5oZD9Wk31x5HQh7up2cBaF8TFCVNcEhU1+7zTzzDsVn3HDY2pG/0KzwtWT8iv7c
 7DigTPO+c6X1nUkFIJ73MtFCQSWayHZt6LpFM0qEmF5Y/wb8UE/sprssRlRH34lceJzeomK5m
 VKfzvCtaM5J9T81zw3xKEgyj0B6qpuzlTX8eQYKfoHndkPFc2V+5lfnU5Ozbq+7LNu8AAJXuf
 5pmGyVpT0FPmPCHBiBE6ozXse2J6O/AHgFRmkXOZ/XmAv1LqZkY4BgBbJGcx07ymPIZZmfsc0
 xcGPP9Hc2pUOR0PTuXutzDFcF06VXOdhnNBAAj87XMBOm6eCBhjozEpSGxJHD7PGFoNPwCljV
 h+XsVd0ar2G+HnYzLV3rI2unzAHLh0PAxDSMOPmqWyjdq/itg0shn3p0SpGUATUI8PnSZd7VU
 4WEg+DFNH0NJU8lIKTGWHWJTiBTrC0xDJ/2G9YYeokx3N3g1L7mS0FnAj5O5cZN5adeRVqm+j
 /oSVrRmXFJsuA/xDQ89g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_042639_253460_180D83F5 
X-CRM114-Status: GOOD (  16.03  )
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

T24gV2VkLCBTZXAgMjIsIDIwMjEgYXQgMTowNiBBTSBBbmRyw6kgQWxtZWlkYSA8YW5kcmVhbG1l
aWRAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4gw4BzIDA1OjA4IGRlIDIxLzA5LzIxLCBBcm5kIEJl
cmdtYW5uIGVzY3JldmV1Ogo+ID4gSSB3b3VsZCBsb3ZlIHRvIHNlZSB0aGUgd3JhcHBlciB0aGF0
IEFsaXN0YWlyIHdyb3RlIGFzIHBhcnQgb2Ygc29tZSBrZXJuZWwKPiA+IHVhcGkgaGVhZGVyIHBy
b3ZpZGVkIHRvIHVzZXIgc3BhY2UuIGZ1dGV4IGlzIHVzZWQgYnkgdG9ucyBvZiBhcHBsaWNhdGlv
bnMsCj4gPiBhbmQgd2UgbmV2ZXIgaGFkIGEgbGlicmFyeSBhYnN0cmFjdGlvbiBmb3IgaXQsIHNv
IGV2ZXJ5b25lIGhhcyB0byBkbyB0aGVzZQo+ID4gYnkgaGFuZCwgYW5kIHRoZXkgYWxsIGdldCB0
aGVtIHNsaWdodGx5IHdyb25nIGluIGRpZmZlcmVudCB3YXlzLgo+Cj4gV2h5IHdlIGRvbid0IGhh
dmUgYSBmdXRleCgpIHdyYXBwZXIgYXQgZ2xpYmMgYXMgd2UgZG8gaGF2ZSBmb3Igb3RoZXJzCj4g
c3lzY2FsbHM/CgpJIHRoaW5rIG1haW5seSBiZWNhdXNlIHRoZXJlIHdhcyBubyBhZ3JlZW1lbnQg
b24gd2hhdCB0aGUgY2FsbGluZwpjb252ZW50aW9ucyBzaG91bGQgYmU6CgpUaGUgcmF3IHN5c2Nh
bGwgaXMgYXdrd2FyZCBiZWNhdXNlIG9mIHRoZSBhcmd1bWVudCBvdmVybG9hZGluZyB0aGF0IGNh
bm5vdAplYXNpbHkgYmUgZXhwcmVzc2VkIGluIHN0YW5kYXJkIEMgaW4gYSB0eXBlc2FmZSB3YXku
IEhhdmluZyBhIHBlci1vcGVyYXRpb24KaW50ZXJmYWNlIHdvdWxkIGF2b2lkIHRoYXQgcHJvYmxl
bSBidXQgcmVxdWlyZXMgc3BlY2lmeWluZyB3aGF0IHRoYXQKcGFydGljdWxhciBpbnRlcmZhY2Ug
aGFzIHRvIGJlLCBhbmQgdGhlcmUgaXMgbm8gc3RhbmRhcmQgdG8gZmFsbCBiYWNrIG9uIGZvcgp0
aGlzIHN5c2NhbGwuCgogICAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
