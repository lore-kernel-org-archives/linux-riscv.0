Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F44C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 07:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=86b6emQfcpreAxF5NLLL9HK8Xt+i7y5x9xqXBdnbC/M=; b=YAj/THibEH/s4p
	juR4muCXDzNPb4EiyZAzM6SXQEJml3hvpuDGu9DN/dr1NWbnenegl+XWUsZLXW+ZopHxndrxG5QbK
	AnHkEqQCXh8qx6I11NdURg7vT8baqB52C331F1od6vCXlFS3lkJ7Ns46xwvw0jo3kKRF0FuaQFXid
	uKRX+MjrC3xOOfDnyQWZ8RXYHNmkG+nli1KTLR5jbO2Tkzq0Yp+FWooOwloi95MmhIO88kUNEneV5
	pSJ5V8IZWb5QHPAttKRMiyFmmOMp5o1dNXk6eFno8k9Hk16FI9oYyACNZdIj5znCjekuk7a89LF92
	ofoPm1mb+NMt+xMAeCCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEnRe-000lBU-AE; Fri, 22 Jul 2022 07:51:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEnRb-000l9J-Ip
	for linux-riscv@lists.infradead.org; Fri, 22 Jul 2022 07:51:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 35C2A60E04
	for <linux-riscv@lists.infradead.org>; Fri, 22 Jul 2022 07:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B42C341D4
	for <linux-riscv@lists.infradead.org>; Fri, 22 Jul 2022 07:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658476287;
	bh=hteyvn0yaPK0/2NRgzXD5OW+6qZL0byNi3OkzsX0uAo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rKVjbDXOBTaNiMUz6SpJ4kE6NZouClsh46kJhMGLk3L+QqUyhEKmkvnsVX7z8Ula4
	 sQuIDMCP21geiA+TpnCitZ6JznpJMXTCjzC+bEu4eZMAoGh/9I6OT8tKDLd7FP9hFr
	 MEoWTpJ0vos0391G5Zj8PWvkK6KJ1MSKWAR+eL2vMeYeR0rh9QXy6GVo80uoWBxqXO
	 XZ6jGkPQuoBIXTkxy6xTKlg/rrvkYgnErPVSb5udHIwPk9FcBMrmKri2K78BCv7NTR
	 jjANJslVkjNfJk4V/OnMbhVQXHiL+WjjQCSR3tJIabIphmTZKz/Dqv4QA8XUGd77Bn
	 FK4m3dza1oaOA==
Received: by mail-lf1-f46.google.com with SMTP id p11so1547366lfu.5
        for <linux-riscv@lists.infradead.org>; Fri, 22 Jul 2022 00:51:26 -0700 (PDT)
X-Gm-Message-State: AJIora+ubomx59UuYAHectE4BlFE7d5OHfp+VgABWhbYx/rTNAriB1dl
	oHh/MFoKV1dEm9FjLTPuoJzXH+V9bZhmm6JQJIY=
X-Google-Smtp-Source: AGRyM1ulyx/y0eJ3gMB2WigTyNk+sRot7MzH9LBTdkd6YkOvurOggIitYqJPWWUU2qS5qF8F4OYRyUlPT9BKgH1CkHk=
X-Received: by 2002:a05:6512:1191:b0:48a:2269:e87 with SMTP id
 g17-20020a056512119100b0048a22690e87mr826633lfr.122.1658476284840; Fri, 22
 Jul 2022 00:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220717101323.370245-1-xianting.tian@linux.alibaba.com>
 <20220717101323.370245-5-xianting.tian@linux.alibaba.com> <7405851.EvYhyI6sBW@diego>
In-Reply-To: <7405851.EvYhyI6sBW@diego>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 22 Jul 2022 15:51:12 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSYp4-2VLq4HmvcdDWq3ygkHiXpDfTyocYStxGpejx7jg@mail.gmail.com>
Message-ID: <CAJF2gTSYp4-2VLq4HmvcdDWq3ygkHiXpDfTyocYStxGpejx7jg@mail.gmail.com>
Subject: Re: [PATCH 4/5] riscv: Add modules to virtual kernel memory layout dump
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Nick Kossifidis <mick@ics.forth.gr>, Alexandre Ghiti <alexandre.ghiti@canonical.com>, 
	Xianting Tian <xianting.tian@linux.alibaba.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, crash-utility@redhat.com, 
	huanyi.xj@alibaba-inc.com, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, k-hagio-ab@nec.com, 
	hschauhan@nulltrace.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_005131_741919_C75A48E1 
X-CRM114-Status: GOOD (  23.32  )
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

T24gRnJpLCBKdWwgMjIsIDIwMjIgYXQgMzoyNCBQTSBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPgo+IEFtIFNvbm50YWcsIDE3LiBKdWxpIDIwMjIsIDEyOjEzOjIyIENF
U1Qgc2NocmllYiBYaWFudGluZyBUaWFuOgo+ID4gTW9kdWxlcyBhbHdheXMgbGl2ZSBiZWZvcmUg
dGhlIGtlcm5lbCwgTU9EVUxFU19FTkQgaXMgZml4ZWQgYnV0Cj4gPiBNT0RVTEVTX1ZBRERSIGlz
bid0IGZpeGVkLCBpdCBkZXBlbmRzIG9uIHRoZSBrZXJuZWwgc2l6ZS4KPiA+IExldCdzIGFkZCBp
dCB0byB2aXJ0dWFsIGtlcm5lbCBtZW1vcnkgbGF5b3V0IGR1bXAuCj4gPgo+ID4gQXMgTU9EVUxF
UyBpcyBvbmx5IGRlZmluZWQgZm9yIENPTkZJR182NEJJVCwgc28gd2UgZHVtcCBpdCB3aGVuCj4g
PiBDT05GSUdfNjRCSVQ9eS4KPiA+Cj4gPiBlZywKPiA+IE1PRFVMRVNfVkFERFIgLSBNT0RVTEVT
X0VORAo+ID4gMHhmZmZmZmZmZjAxMTMzMDAwIC0gMHhmZmZmZmZmZjgwMDAwMDAwCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogWGlhbnRpbmcgVGlhbiA8eGlhbnRpbmcudGlhbkBsaW51eC5hbGliYWJh
LmNvbT4KPgo+IEknbSBzdGlsbCBub3Qgc3VyZSBpZiBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gZGVm
aW5lIE1PRFVMRVNfKiBjb25zdGFudHMKPiBldmVuIG9uIDMyYml0ICh3aXRoIHRoZWlyIFZNQUxM
T0NfU1RBUlQgZXRjIHZhbHVlcykgYW5kIHByZXZlbnQKPiBuZWVkaW5nIHRoZSBDT05GSUdfNjRC
SVQgaWZkZWYsIGJ1dCB0aGF0J3MgZm9yIG90aGVycyB0byBkZWNpZGUgOi0pClRoZXJlIGlzIG5v
IE1PRFVMRVNfVkFERFIgZm9yIDMyLWJpdCwgYmVjYXVzZSBpdCByZXVzZXMgdm1hbGxvYyBhcmVh
LgoKV2Ugc2hvdWxkIHByaW50IE1PRFVMRVNfVkFERFIgaGVyZSB0byBtYWtlIHBlb3BsZSBjbGVh
ciB0byBrbm93LgoKUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKPgo+
IFRoZSBiZWxvdyBhbHNvIGxvb2tzIGdvb2QsIHNvCj4gUmV2aWV3ZWQtYnk6IEhlaWtvIFN0dWVi
bmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvbW0vaW5pdC5j
IHwgNCArKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4g
PiBpbmRleCBkNDY2ZWM2NzBlMWYuLjJjNGE2NGU5N2FlYyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gv
cmlzY3YvbW0vaW5pdC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ID4gQEAgLTEz
NSw2ICsxMzUsMTAgQEAgc3RhdGljIHZvaWQgX19pbml0IHByaW50X3ZtX2xheW91dCh2b2lkKQo+
ID4gICAgICAgICAgICAgICAodW5zaWduZWQgbG9uZylWTUVNTUFQX0VORCk7Cj4gPiAgICAgICBw
cmludF9tbCgidm1hbGxvYyIsICh1bnNpZ25lZCBsb25nKVZNQUxMT0NfU1RBUlQsCj4gPiAgICAg
ICAgICAgICAgICh1bnNpZ25lZCBsb25nKVZNQUxMT0NfRU5EKTsKPiA+ICsjaWZkZWYgQ09ORklH
XzY0QklUCj4gPiArICAgICBwcmludF9tbCgibW9kdWxlcyIsICh1bnNpZ25lZCBsb25nKU1PRFVM
RVNfVkFERFIsCj4gPiArICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nKU1PRFVMRVNfRU5EKTsK
PiA+ICsjZW5kaWYKPiA+ICAgICAgIHByaW50X21sKCJsb3dtZW0iLCAodW5zaWduZWQgbG9uZylQ
QUdFX09GRlNFVCwKPiA+ICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcpaGlnaF9tZW1vcnkp
Owo+ID4gICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHXzY0QklUKSkgewo+ID4KPgo+Cj4KPgoK
Ci0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
