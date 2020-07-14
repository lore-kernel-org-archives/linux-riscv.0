Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438F9C433E5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 16:25:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11D732076C
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 16:25:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1VD9mvcZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VTmpkPIz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11D732076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+O98jMnPalcWDyNfzy3CZEBgZs3d1adZ+veyiAmh3lM=; b=1VD9mvcZs/x4FM4HkM4XHw7K6
	qqRcsECQB3GuczcNzWBaJmxIv86nLP7bsGgPzguRLm1h5kk9TjWJkQNKlM6UvtarO9iWmq1PgZ7qJ
	qbmXtsY8lnaB2ltn9G5C1o3KGICodOD8gu+gv5N70gLJdQFejnAe1P7scTcnyMBD+7tGoh3Ar8yFC
	mCtQ73KrNYT0q5ZWDCiieoUDnifXy02LrjtfYqG4GPyt8c52gMVGHEPc3xClmKOMAop7IS2dOMTJ5
	KIXG59tiJYBerOp8Z/fjShj0exwHOUQZ+J7Oml4fLrvrD3r3ZdXFvRXly3qb2ZzWN1CGWzF499at1
	rkvgkbqhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvNjz-0001fb-LL; Tue, 14 Jul 2020 16:25:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvNjw-0001ev-N0
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 16:25:09 +0000
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF8AA2256E
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 16:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594743908;
 bh=k/Tsw6xLqgnJY1o7iH6r4M/K+u3aSSQdGkYMYdYd8I8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VTmpkPIzMgweGoJMVFQhHwPlTmsACcCZYKLnJf4uV5MJbosmzzKJ397vHUls2HOaz
 eFZ69VNZv/h5RjAH/J8ksD9O2qsAxaIIp5R0iwg9VlZld06OGkc2JS41oAV6UtM2Za
 h6VSMX+rCl64xxRhkdYo617vEockbRKEzQ3aA/hg=
Received: by mail-lj1-f171.google.com with SMTP id h19so23575054ljg.13
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 09:25:07 -0700 (PDT)
X-Gm-Message-State: AOAM532VqTTPzWhhTNpHpB+ieDqSdz6L91xiEjpGIueKtEjka4xYXAMo
 F8sZ29c+9rUOyT9I1twSgPcI9+XyfIDZ3V/a+sc=
X-Google-Smtp-Source: ABdhPJw2LgpnAjeHGhekyjVCCVOxT1kK9hVgydd27e2JfjQorPcSs3QPMc/nVkb/g8IlxUzlBQI7f749Aj988uEH82o=
X-Received: by 2002:a2e:864e:: with SMTP id i14mr2747628ljj.441.1594743905973; 
 Tue, 14 Jul 2020 09:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <1594683562-68149-1-git-send-email-guoren@kernel.org>
 <1594683562-68149-7-git-send-email-guoren@kernel.org>
 <20200714203757.512ce7fb5fa61a88b1dbb2f3@kernel.org>
In-Reply-To: <20200714203757.512ce7fb5fa61a88b1dbb2f3@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 15 Jul 2020 00:24:54 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSMUnHfv3GLj_TGT2dJkKq2zbEsnbPKREiq5i6PPjyTBg@mail.gmail.com>
Message-ID: <CAJF2gTSMUnHfv3GLj_TGT2dJkKq2zbEsnbPKREiq5i6PPjyTBg@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] riscv: Add KPROBES_ON_FTRACE supported
To: Masami Hiramatsu <mhiramat@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_122509_035605_24890448 
X-CRM114-Status: GOOD (  13.91  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>,
 Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
 Pekka Enberg <penberg@kernel.org>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGh4IE1hc2FtaSwKCk9uIFR1ZSwgSnVsIDE0LCAyMDIwIGF0IDc6MzggUE0gTWFzYW1pIEhpcmFt
YXRzdSA8bWhpcmFtYXRAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIDEzIEp1bCAyMDIw
IDIzOjM5OjIxICswMDAwCj4gZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4KPiA+IEZyb206IEd1
byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+Cj4gPiBUaGlzIHBhdGNoIGFkZHMg
c3VwcG9ydCBmb3Iga3Byb2JlcyBvbiBmdHJhY2UgY2FsbCBzaXRlcyB0byBhdm9pZHMKPiA+IG11
Y2ggb2YgdGhlIG92ZXJoZWFkIHdpdGggcmVndWxhciBrcHJvYmVzLiBUcnkgaXQgd2l0aCBzaW1w
bGUKPiA+IHN0ZXBzOgo+ID4KPiA+IDEuIEdldCBfZG9fZm9yayBmdHJhY2UgY2FsbCBzaXRlLgo+
ID4gRHVtcCBvZiBhc3NlbWJsZXIgY29kZSBmb3IgZnVuY3Rpb24gX2RvX2Zvcms6Cj4gPiAgICAw
eGZmZmZmZmUwMDAyMGFmNjQgPCswPjogICAgIGFkZGkgICAgc3Asc3AsLTEyOAo+ID4gICAgMHhm
ZmZmZmZlMDAwMjBhZjY2IDwrMj46ICAgICBzZCAgICAgIHMwLDExMihzcCkKPiA+ICAgIDB4ZmZm
ZmZmZTAwMDIwYWY2OCA8KzQ+OiAgICAgc2QgICAgICByYSwxMjAoc3ApCj4gPiAgICAweGZmZmZm
ZmUwMDAyMGFmNmEgPCs2PjogICAgIGFkZGkgICAgczAsc3AsMTI4Cj4gPiAgICAweGZmZmZmZmUw
MDAyMGFmNmMgPCs4PjogICAgIHNkICAgICAgczEsMTA0KHNwKQo+ID4gICAgMHhmZmZmZmZlMDAw
MjBhZjZlIDwrMTA+OiAgICBzZCAgICAgIHMyLDk2KHNwKQo+ID4gICAgMHhmZmZmZmZlMDAwMjBh
ZjcwIDwrMTI+OiAgICBzZCAgICAgIHMzLDg4KHNwKQo+ID4gICAgMHhmZmZmZmZlMDAwMjBhZjcy
IDwrMTQ+OiAgICBzZCAgICAgIHM0LDgwKHNwKQo+ID4gICAgMHhmZmZmZmZlMDAwMjBhZjc0IDwr
MTY+OiAgICBzZCAgICAgIHM1LDcyKHNwKQo+ID4gICAgMHhmZmZmZmZlMDAwMjBhZjc2IDwrMTg+
OiAgICBzZCAgICAgIHM2LDY0KHNwKQo+ID4gICAgMHhmZmZmZmZlMDAwMjBhZjc4IDwrMjA+OiAg
ICBzZCAgICAgIHM3LDU2KHNwKQo+ID4gICAgMHhmZmZmZmZlMDAwMjBhZjdhIDwrMjI+OiAgICBt
diAgICAgIHM0LGEwCj4gPiAgICAweGZmZmZmZmUwMDAyMGFmN2MgPCsyND46ICAgIG12ICAgICAg
YTAscmEKPiA+ICAgIDB4ZmZmZmZmZTAwMDIwYWY3ZSA8KzI2PjogICAgbm9wICAgPDw8PDw8PDwg
aGVyZSEKPiA+ICAgIDB4ZmZmZmZmZTAwMDIwYWY4MiA8KzMwPjogICAgbm9wCj4gPiAgICAweGZm
ZmZmZmUwMDAyMGFmODYgPCszND46ICAgIGxkICAgICAgczMsMChzNCkKPiA+Cj4gPiAyLiBTZXQg
X2RvX2ZvcmsrMjYgYXMgdGhlIGtwcm9iZS4KPiA+ICAgZWNobyAncDpteXByb2JlIF9kb19mb3Jr
KzI2IGRmZD0lYTAgZmlsZW5hbWU9JWExIGZsYWdzPSVhMiBtb2RlPSs0KCRzdGFjayknID4gL3N5
cy9rZXJuZWwvZGVidWcvdHJhY2luZy9rcHJvYmVfZXZlbnRzCj4gPiAgIGVjaG8gMSA+IC9zeXMv
a2VybmVsL2RlYnVnL3RyYWNpbmcvZXZlbnRzL2twcm9iZXMvZW5hYmxlCj4gPiAgIGNhdCAvc3lz
L2tlcm5lbC9kZWJ1Zy90cmFjaW5nL3RyYWNlCj4gPiAgIHRyYWNlcjogbm9wCj4gPgo+ID4gICBl
bnRyaWVzLWluLWJ1ZmZlci9lbnRyaWVzLXdyaXR0ZW46IDMvMyAgICNQOjEKPiA+Cj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXy0tLS0tPT4gaXJxcy1vZmYKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC8gXy0tLS09PiBuZWVkLXJlc2NoZWQKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAvIF8tLS09PiBoYXJkaXJxL3NvZnRpcnEKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfHwgLyBfLS09PiBwcmVlbXB0LWRlcHRoCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHx8fCAvICAgICBkZWxheQo+ID4gICAgICAgICAgICAg
VEFTSy1QSUQgICBDUFUjICB8fHx8ICAgIFRJTUVTVEFNUCAgRlVOQ1RJT04KPiA+ICAgICAgICAg
ICAgICAgIHwgfCAgICAgICB8ICAgfHx8fCAgICAgICB8ICAgICAgICAgfAo+ID4gICAgICAgICAg
ICAgICBzaC04NyAgICBbMDAwXSAuLi4uICAgNTUxLjU1NzAzMTogbXlwcm9iZTogKF9kb19mb3Jr
KzB4MWEvMHgyZTYpIGRmZD0weGZmZmZmZmUwMDAyMGFmN2UgZmlsZW5hbWU9MHhmZmZmZmZlMDAw
MjBiMzRlIGZsYWdzPTB4ZmZmZmZmZTAwMTAxZTdjMCBtb2RlPTB4MjBhZjg2ZmZmZmZmZTAKPiA+
Cj4gPiAgIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9rcHJvYmVzL2xpc3QKPiA+IGZmZmZmZmUwMDAy
MGFmN2UgIGsgIF9kb19mb3JrKzB4MWEgICAgW0ZUUkFDRV0KPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXgo+Cj4gSG1tLCB0aGlzIHNlZW1zIGZlbnRyeSBp
cyBub3Qgc3VwcG9ydGVkIG9uIFJJU0MtViB5ZXQuIEJ1dCBhbnl3YXksCj4gaXQgd2lsbCBiZSB1
c2VmdWwgZm9yIHVzZXJzIChpZiB0aGV5IGNhbiBmaW5kIHRoZSBvZmZzZXQpLgoKU2VlbXMgb25s
eSB4ODYgJiDirIbvuI85MCB1c2UgZmVudHJ577yMY2FuIHlvdSBlbGFib3JhdGUgbW9yZSBhYm91
dCBmZW50cnkncwpiZW5lZml0IGFuZCBob3cgdGhlIHVzZXIgY291bGQgc2V0IGtwcm9iZSBvbiBm
dHJhY2UgY2FsbCBzaXRlIHdpdGhvdXQKZGlzYXNzZW1ibGU/CgotLQpCZXN0IFJlZ2FyZHMKIEd1
byBSZW4KCk1MOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jc2t5LwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
