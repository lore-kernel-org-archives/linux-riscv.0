Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE26EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 02:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d7rIe9URRDeDwt7TpMy/KRqAtNPdxaXBllmygBAGK3w=; b=oqdg0oElvWTGxe
	XocIid1oZvKB7yKXkJKkimv7b42PxkREagdnQbRz6xwynIvglT2oNf8HZsyFeI8RMszUxEVZ4+LVq
	jKHqNyf5g0Ntz6Mp8badWwtebpurNEX5dYrprAHTDpKwfjlc+Q2sjHWK6qAmLPxstQk24Y8xIdAf/
	yTQ5U1LmMsTTCBbUcNEnVZ6IY25Gx/VLOWZV3ArlG1yqEAYKzQ89jCqr923sHW2iu6cNJ/K2tVo0q
	Ckc11KtTBfVFmqf1kWSnW8w2LFtLQdT6cDLLVfOHBzqRBNbL8ngKTbjk+6cGjPZGSPSpLqLvtM8qC
	EoNshzaI0mGoFCLtF1zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHEg2-0007JW-23;
	Thu, 06 Jul 2023 02:25:02 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHEfy-0007IM-1U
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 02:25:00 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3144098df56so106181f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 19:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1688610296; x=1691202296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1048vqlXkYGyF+XcnTYa3P+GBqsNCgfDORbZIMSrGAk=;
        b=DhyUYoEM+lzL9QbERr02EhFFYHChXal8YDSzaYHUSk2Ze4dGQn7daxWPR8mVzEhTPw
         bqUAHq0nr9lozZZud75z0XJFitgtT8VeNRHP2MrFWyCIJnLlR4MgYuRxLk23gRD2QHl+
         6SMVGkEa1Q0/7DKUnQkPV27I0CnY13vJI/H3GdzDTUR4S244CJQ4Yo/skMG6F+wCEkvE
         kHugkL4HqAfhJ/R/bOQIrUki9lzCmpCfHQa4dsdLYGADc03tbh3r/JKR6SlMGMT8O8Cc
         LvVXIJGkKJJHXZIquYwvLD4uK4+EMyocJbcaNZMTMVwuQ8fRdi2CtVtryOMUDsGcXdgR
         3abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688610296; x=1691202296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1048vqlXkYGyF+XcnTYa3P+GBqsNCgfDORbZIMSrGAk=;
        b=lL+P2PQ4rTzykGpYUh6B6wmN4zgL1KLDdNz/Tn+xc6GiUopcyPPaOJM0cMEwALFI5B
         C6GVWskThy56slqJpgN/2SCI5912i6CX2TH5J1ZgcNi2JJUOPEEmT+aueD62DR3a3wj2
         gWC2IIDjhIOQNbNCUAcHwDhncq35LZOBgg3FqGAnw5uxFYMjIQ06OrKJi3SSYzW+uwVo
         oafJr3AYu8yZ1xjuR+K8WehB+3crJXmKLMHDKjqrKJyXZzQTNt5f5tN0cpqa+rDb+FY0
         eHj0uehtC9IT1oCPWyrgzp6C64BpFBz/J8BJ/kOebWXc5ItYX1968huyDKWiI3r9hVvH
         yJug==
X-Gm-Message-State: ABy/qLbdhOaKKaS1zkTB7XF/xAeK7WDn0jTx2bo2M3cEepRL0F5wx29T
	JnrdGqg3eDUC95flbd16K1YIn0SYlI0kTkQPp6xOpg==
X-Google-Smtp-Source: APBJJlEbQjDa7zV4kzY1QMr+RRPhlGD3O00R3/Q/5tLRT9VcuuHuuAQy1kfD+qZkasgWlox4owNuD+y+UUZXFlhGpwY=
X-Received: by 2002:adf:e310:0:b0:313:f371:aede with SMTP id
 b16-20020adfe310000000b00313f371aedemr450746wrj.1.1688610296508; Wed, 05 Jul
 2023 19:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230702095735.860-1-cuiyunhui@bytedance.com> <20230703-71f67eb66a037f5c0fb825c6@orel>
 <CAEEQ3w=7tBHyG=CvuktPN5cvfpY6ayamnbry6eOYxMDrPN+oZg@mail.gmail.com>
 <CANBLGcwcvK55dZ1__wvWCtcw=XoKt=qki8g6C_QYo+TBqqJ=TA@mail.gmail.com>
 <50F3BD62-78F1-456E-A44A-0C7D9A2D4113@jrtc27.com> <87bkgql8rq.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87bkgql8rq.fsf@all.your.base.are.belong.to.us>
From: =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
Date: Thu, 6 Jul 2023 10:24:45 +0800
Message-ID: <CAEEQ3wnaaMvJ3=7udvAjiP3q36nvqAwb8sh34f+nO8Ua_83yFw@mail.gmail.com>
Subject: Re: [External] [PATCH v2 1/3] riscv: obtain ACPI RSDP from FFI.
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, 
	Emil Renner Berthing <emil.renner.berthing@gmail.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv <linux-riscv@lists.infradead.org>, rminnich@gmail.com, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, jdelvare@suse.com, 
	yc.hung@mediatek.com, angelogioacchino.delregno@collabora.com, 
	allen-kh.cheng@mediatek.com, pierre-louis.bossart@linux.intel.com, 
	tinghan.shen@mediatek.com, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-acpi@vger.kernel.org, geshijian@bytedance.com, weidong.wd@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_192458_523380_437521A1 
X-CRM114-Status: GOOD (  18.51  )
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

SGkgQmrDtnJuLAoKT24gV2VkLCBKdWwgNSwgMjAyMyBhdCAxMDo0M+KAr1BNIEJqw7ZybiBUw7Zw
ZWwgPGJqb3JuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSmVzc2ljYSBDbGFya2UgPGpydGMyN0Bq
cnRjMjcuY29tPiB3cml0ZXM6Cj4KPiA+IE9uIDMgSnVsIDIwMjMsIGF0IDE5OjU4LCBFbWlsIFJl
bm5lciBCZXJ0aGluZyA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAZ21haWwuY29tPiB3cm90ZToKPiA+
Pgo+ID4+IE9uIE1vbiwgMyBKdWwgMjAyMyBhdCAxNTozMywg6L+Q6L6J5bSUIDxjdWl5dW5odWlA
Ynl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPj4+Cj4gPj4+IEhpIGRyZXcsCj4gPj4+Cj4gPj4+IE9u
IE1vbiwgSnVsIDMsIDIwMjMgYXQgOTowMeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+ID4+Pj4KPiA+Pj4+Cj4gPj4+PiAoVGhpcyBpcyBhIHJlcGx5
IHRvIGEgbm9uLWV4aXN0ZW50IGNvdmVyIGxldHRlci4pCj4gPj4+Cj4gPj4+IFRoaXMgaGFzIGJl
ZW4gZGlzY3Vzc2VkIG1hbnkgdGltZXMgd2l0aCBBcmQsIFBsZWFzZSByZWZlciB0byA6Cj4gPj4+
IGh0dHBzOi8vcGF0Y2hlcy5saW5hcm8ub3JnL3Byb2plY3QvbGludXgtYWNwaS9wYXRjaC8yMDIz
MDQyNjAzNDAwMS4xNi0xLWN1aXl1bmh1aUBieXRlZGFuY2UuY29tLwo+ID4+Cj4gPj4gSGkgWXVu
aHVpLAo+ID4+Cj4gPj4gRnJvbSB0aGF0IGRpc2N1c3Npb24gaXQgd2FzIG1lbnRpb25lZCB0aGF0
IHRoYXQgYXJtIHN1cHBvcnRzIDMgbWV0aG9kcwo+ID4+IG9mIGJvb3Rpbmc6Cj4gPj4gIGRpcmVj
dCArIGRldmljZXRyZWUKPiA+PiAgRUZJICsgZGV2aWNldHJlZQo+ID4+ICBFRkkgKyBBQ1BJCj4g
Pj4gLi5idXQgbm90Cj4gPj4gIGRpcmVjdCArIEFDUEkKPiA+Pgo+ID4+IFRvIG1lIGl0IGlzbid0
IG9idmlvdXMgZnJvbSB0aGF0IG9yIHRoaXMgdGhyZWFkLCBhbmQgc2luY2UgYXJtIHNlZW1zCj4g
Pj4gdG8gYmUgZG9pbmcgZmluZSB3aXRob3V0IHRoZSA0dGggb3B0aW9uIEknbSBjdXJpb3VzIHdo
eSB0aGF0J3MKPiA+PiBuZWNlc3Nhcnkgb24gcmlzY3Y/Cj4gPgo+ID4gSWYgYW55dGhpbmcgd2Ug
c2hvdWxkIGJlIHJlbW92aW5nIG9wdGlvbiAxLCBiZWNhdXNlIHRoYXTigJlzIG5vdCBhCj4gPiBj
cm9zcy1PUyBzdGFuZGFyZCAodGhvdWdoIFJJU0MtVuKAmXMgU0JJIGRpcmVjdCBib290aW5nIGlz
IGF0IGxlYXN0IG5vdAo+ID4gdGllZCB0byB0aGUgT1MpLiBBbnkgYXBwbGljYXRpb24tY2xhc3Mg
cGxhdGZvcm0gc3BlYyBpcyBnb2luZyB0bwo+ID4gbWFuZGF0ZSBFRkksIGJlY2F1c2UsIHdoYXRl
dmVyIHlvdXIgdGhvdWdodHMgb2YgRUZJIGFyZSwgdGhhdCBpcyAqdGhlKgo+ID4gc3RhbmRhcmQu
IEFuZCBpZiB5b3XigJlyZSB3aWxsaW5nIHRvIHBpY2sgdXAgYWxsIHRoZSBjb21wbGV4aXR5IG9m
IEFDUEksCj4gPiB3aGF04oCZcyBhIGJpdCBvZiBFRkkgKGVzcGVjaWFsbHkgaWYgeW91IG9ubHkg
Z28gZm9yIGEgbWluaW1hbCBvbmUgYSBsYQo+ID4gVS1Cb290KT8KPgo+IFdlbGwgc2FpZCEKPgo+
IFl1bmh1aSwgd2h5IG5vdCBzaW1wbHkgYWRkIGEgbWluaW1hbCBVRUZJIHN0dWIgdG8gQ29yZWJv
b3QgKGxpa2UgSmVzcwo+IHBvaW50cyBvdXQgYWJvdmUpPwoKSW4gZmFjdCwgaW4gdGhlIHYxIGVt
YWlsLCBDb3JlYm9vdCdzIG1haW50YWluZXIgUm9uIGhhcyBtYWRlIGl0IGNsZWFyCnRoYXQgQ29y
ZWJvb3QgZG9lcyBub3Qgc3VwcG9ydCBFRkksIGFuZCBpdCBpcyBuZWNlc3NhcnkgdG8gdHJhbnNt
aXQKZmlybXdhcmUgaW5mb3JtYXRpb24gdGhyb3VnaCBEVFMgb24gUklTQy1WLgpAUm9uLCBjYW4g
eW91IGhlbHAgZXhwbGFpbiBpdCB0byB0aGVtPwoKPiBJTU8gd2hhdCBVLWJvb3QgKG9yCj4gaHR0
cHM6Ly9naXRodWIuY29tL2Nsb3VkLWh5cGVydmlzb3IvcnVzdC1oeXBlcnZpc29yLWZpcm13YXJl
IGlmIHlvdSdyZQo+IGludG8gUnVzdCA7LSkpIGlzIGRvaW5nLCBhbmQganVzdCBoYXZpbmcgYSBz
bWFsbCBVRUZJIHNoaW0gaXMgdGhlIHdheSB0bwo+IGdvLgoKVGhhbmtzLApZdW5odWkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
