Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE09C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Feb 2022 10:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mf0o4d9oNdqFlq61s3vu1Us5qDGIwMf3d2REFRc0iuk=; b=ysD+YXnKjN0oIf
	hCjWl/wTc40ajpdI8twYqULl2euVnorIxw/OQ0e4r/LndGLsNeYtzdjVpxM51Epcvi1QaAF6Nkk/Y
	5yfGG3touxthd5z3GrHdSx4m8Z/tnMtoCLyBu6B75taYFnlBxc4zEg5aRj8PA6QuuEUnRdfv8p83k
	Db8h8BWrqJGnuLzPzPE5aiJDge7Nwp3nyADMeqFLrXaGadLznY1IOSUzZB6TY7adLNTvBOnCnL/ar
	oRVgXcNuUBi5y6FMF/+HzI12koxbA3duKCGmMQZXEjFSja7PsfBMl3Qe9DYqEAxfrOevzwyle4l7C
	HHFGseZLJ+y6lH8xBNrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM5rk-004tb5-8X; Mon, 21 Feb 2022 10:24:24 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM5Et-004etM-ET
 for linux-riscv@lists.infradead.org; Mon, 21 Feb 2022 09:44:17 +0000
Received: by mail-wr1-x433.google.com with SMTP id k1so25967555wrd.8
 for <linux-riscv@lists.infradead.org>; Mon, 21 Feb 2022 01:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xZF9VPY+1TXkileF1qxxCQ2LRDWtQxNEI8s6875dzs4=;
 b=4QHLnrhlwnZcj5DJ3/G46uWsDBuCIetkwxkmd/MdlZ6iEoCOeoU5pPwLqeWW44CU7H
 DI+LsFmwDxfHTSQRa7f0QbbmWh0NxjW1SQI7FSqmYNkRSpBiTer4JrE9sskhsIF6LM1K
 4j9H+gnoduOc3RvTapYELk6FotuQPAJFQWd6FDpQ375pGK+KyPita/wrYEt92iAzfotb
 3FwCa7el23sTY6eIO1PmTC+Kz6+8Q4nSMQXnGDrQyT4PohDuqtoTdJScZCJnWOMjM6F6
 T+FFyrRMjdTGv889Bim0VclYZKsn6uokSai1snou9jMQhg2EOSbLaDdYEqa4IUH0IaKK
 xCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xZF9VPY+1TXkileF1qxxCQ2LRDWtQxNEI8s6875dzs4=;
 b=Ypp7iKat4FL376M96alIREW4n6bd5xhJibuHlyfP/BrXvQkgiCWgz8eLPl6U1CfoRo
 d/eyL2dgDhDKP8IfTlW2oIqHMSFitNhR0gO2l7fqzNathPXrC01W358yZdWhglXLPzLc
 hXHp5Mc17xXuU7pJ5scj8D+FT3aipC3HDo50IRX3ly8kinCj3JrJesCaecx3tn/UAAnd
 37MBtvMrAhhw8q7qw4OnrR5s3SnwdWMAIqJ5DpiUWEWBishHfSGiAdNj8ajoRIkVOL4p
 8d1iq1T9fNZwtfuzGlouejB1n+06heWSifOQRuUSWl23rqfHD/efzMLuXAPwHA22s/dM
 TVkg==
X-Gm-Message-State: AOAM533EkLZeHzcbmSRo4Jiydz6u8a3NqX16yOMrKAb5YNIuUutPMaoj
 ODHpDrO7HXJWoODavH/d1frFFTH7YTFW3VsQXFZoYg==
X-Google-Smtp-Source: ABdhPJzxcjh1RSAKHy35QGrgtWqpnYXvOMU3RukzoWMnRQVnYFIlPEMv40fZS1NH1VcazmtLeISGthiK/ESvhfLVWT4=
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr162179wrz.690.1645436653537; Mon, 21
 Feb 2022 01:44:13 -0800 (PST)
MIME-Version: 1.0
References: <20220128052505.859518-1-apatel@ventanamicro.com>
 <20220128052505.859518-3-apatel@ventanamicro.com>
 <063b8a5636d6372f37029946b2c3e0f4@kernel.org>
 <CAAhSdy387r314f=YjvXJCxqxkvjm5q-EBOVu420giFzaVr_NYw@mail.gmail.com>
 <31fea18e51a5021b79adb17973f9528e@kernel.org>
 <4A07582C-80BD-41F8-AEF5-EE48EB7D2D15@jrtc27.com>
 <87ee3w4lmz.wl-maz@kernel.org>
In-Reply-To: <87ee3w4lmz.wl-maz@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 21 Feb 2022 15:14:01 +0530
Message-ID: <CAAhSdy0LAqNerpd+qXwJj8NTTOX+Qu_CjmtpKPJFSbMH-HT_4g@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] irqchip/riscv-intc: Create domain using named
 fwnode
To: Marc Zyngier <maz@kernel.org>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Anup Patel <apatel@ventanamicro.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_014415_525778_92E3A4A4 
X-CRM114-Status: GOOD (  28.83  )
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

T24gTW9uLCBGZWIgMjEsIDIwMjIgYXQgMjo1NSBQTSBNYXJjIFp5bmdpZXIgPG1hekBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFNhdCwgMTkgRmViIDIwMjIgMTQ6NTE6MjIgKzAwMDAsCj4gSmVz
c2ljYSBDbGFya2UgPGpydGMyN0BqcnRjMjcuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiAxOSBGZWIg
MjAyMiwgYXQgMDk6MzIsIE1hcmMgWnluZ2llciA8bWF6QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4g
Pgo+ID4gPiBCdXQgaG93IGRvIHlvdSBwbGFuIHRvIHdvcmsgYXJvdW5kIHRoZSBmYWN0IHRoYXQg
ZXZlcnl0aGluZyBpcyBjdXJyZW50bHkKPiA+ID4gYnVpbGQgYXJvdW5kIGhhdmluZyBhIG5vZGUg
KGFuZCBhbiBpcnFkb21haW4pIHBlciBDUFU/IFRoZSBQTElDLCBmb3IgZXhhbXBsZSwKPiA+ID4g
Y2xlYXJseSBoYXMgb25lIHBhcmVudCBwZXIgQ1BVLCBub3Qgb25lIGdsb2JhbCBwYXJlbnQuCj4g
PiA+Cj4gPiA+IEknbSBzdXJlIHRoZXJlIHdhcyBhIGdvb2QgcmVhc29uIGZvciB0aGlzLCBhbmQg
SSBzdXNwZWN0IG1lcmdpbmcgdGhlIGRvbWFpbnMKPiA+ID4gd2lsbCBzaW1wbHkgZW5kIHVwIGJy
ZWFraW5nIHRoaW5ncy4KPiA+Cj4gPiBPbiB0aGUgY29udHJhcnksIHRoZSBkcml2ZXJzIHJlbHkg
b24gdGhlIGNvbnRyb2xsZXIgYmVpbmcgdGhlIHNhbWUKPiA+IGFjcm9zcyBhbGwgaGFydHMsIHdp
dGggcmlzY3ZfaW50Y19pbml0IHNraXBwaW5nIGluaXRpYWxpc2F0aW9uIGZvciBhbGwKPiA+IGJ1
dCB0aGUgYm9vdCBoYXJ04oCZcyBjb250cm9sbGVyLiBUaGUgYmluZGluZ3MgYXJlIGEgY29tcGxl
dGUgcGFpbiB0bwo+ID4gZGVhbCB3aXRoIGFzIGEgcmVzdWx0LCB3aGF0IHlvdSAqd2FudCogaXMg
bGlrZSB5b3UgaGF2ZSBpbiB0aGUgQXJtCj4gPiB3b3JsZCB3aGVyZSB0aGVyZSBpcyBqdXN0IG9u
ZSBpbnRlcnJ1cHQgY29udHJvbGxlciBpbiB0aGUgZGV2aWNlIHRyZWUKPiA+IHdpdGggc29tZSBv
ZiB0aGUgaW50ZXJydXB0cyBwZXItcHJvY2Vzc29yLCBidXQgaW5zdGVhZCB3ZSBoYXZlIHRoaXMK
PiA+IG92ZXJlbmdpbmVlcmVkIG51aXNhbmNlLiBUaGUgb25seSByZWFzb24gdGhlcmUgYXJlIHBl
ci1oYXJ0IGludGVycnVwdAo+ID4gY29udHJvbGxlcnMgaXMgYmVjYXVzZSB0aGF04oCZcyBob3cg
dGhlIGNvbnRleHRzIGZvciB0aGUgQ0xJTlQvUExJQyBhcmUKPiA+IHNwZWNpZmllZCwgYnV0IHRo
YXQgcmVhbGx5IHNob3VsZCBoYXZlIGJlZW4gZG9uZSBhbm90aGVyIHdheSByYXRoZXIKPiA+IHRo
YW4gYWJ1c2luZyB0aGUgaW50ZXJydXB0cy1leHRlbmRlZCBwcm9wZXJ0eSBmb3IgdGhhdC4gSW4g
dGhlIEZyZWVCU0QKPiA+IHdvcmxkIHdl4oCZdmUgYmVlbiB0b3RhbGx5IGlnbm9yaW5nIHRoZSBk
ZXZpY2UgdHJlZSBub2RlcyBmb3IgdGhlIGxvY2FsCj4gPiBpbnRlcnJ1cHQgY29udHJvbGxlcnMg
YnV0IGZvciBteSBBSUEgYW5kIEFDTElOVCBicmFuY2ggSSBzdGFydGVkIGEgZmV3Cj4gPiBtb250
aHMgYWdvICh0aG91Z2ggQUNMSU5UJ3Mgbm93IGJlZW4gY29tcGxldGVseSBzY3Jld2VkIHVwIGJ5
IFJWSQo+ID4gcG9saXRpY3MsIHRoaW5ncyBoYXZlIGJlZW4gcmVuYW1lZCBhbmQgc3BsaXQgdXAg
ZGlmZmVyZW50bHkgaW4gdGhlIHBhc3QKPiA+IGZldyBkYXlzIGFuZCBzb2Z0d2FyZSBpbnRlcnJ1
cHRzIGRlLXByaW9yaXRpc2VkIHdpdGggbm8gY3VycmVudCBwYXRoIHRvCj4gPiByYXRpZmljYXRp
b24sIHNvIHRoYXQgd2FzIGEgd2FzdGUgb2YgbXkgdGltZSkgSSBqdXN0IGhhbmcgdGhlIGRyaXZl
cgo+ID4gb2ZmIHRoZSBib290IGhhcnTigJlzIG5vZGUgYW5kIGxlYXZlIGFsbCB0aGUgb3RoZXJz
IGFzIHRvdGFsbHkgaWdub3JlZAo+ID4gYW5kIGEgd2FzdGUgb2Ygc3BhY2Ugb3RoZXIgdGhhbiB0
byBmaWd1cmUgb3V0IHRoZSBjb250ZXh0cyBmb3IgdGhlIFBMSUMKPiA+IGV0Yy4KPiA+Cj4gPiBU
TDtEUiB5ZXMgdGhlIGJpbmRpbmdzIGFyZSBhd2Z1bCwgbm8gdGhlcmXigJlzIG5vIGlzc3VlIHdp
dGggbWVyZ2luZyB0aGUKPiA+IGRvbWFpbnMuCj4KPiBJIGRvbid0IGtub3cgaG93IHRoYXQgZmxp
ZXMgd2l0aCBzb21ldGhpbmcgbGlrZVsxXSwgd2hlcmUgQ1BVMCBvbmx5Cj4gZ2V0cyBpbnRlcnJ1
cHRzIGluIE0tTW9kZSBhbmQgbm90IFMtTW9kZS4gTWF5YmUgaXQgZG9lc24ndCByZWFsbHkKPiBt
YXR0ZXIsIGJ1dCB0aGlzIHNvcnQgb2YgYXN5bW1ldHJpYyByb3V0aW5nIGlzIHRvdGFsbHkgYmFj
a3dhcmQuCgpUaGUgZXhhbXBsZSBQTElDIERUIG5vZGUgd2hpY2ggSSBwcm92aWRlZCBpcyBmcm9t
IFNpRml2ZSBGVTU0MCwgd2hlcmUKd2UgaGF2ZSA1IENQVXMuIFRoZSBDUFUwIGluIEZVNTQwIGlz
IGEgY2FjaGUtY29oZXJlbnQgbWljcm9jb250cm9sbGVyCmhhdmluZyBvbmx5IE0tbW9kZSAoaS5l
LiBObyBNTVUgaGVuY2Ugbm90IExpbnV4IGNhcGFibGUpLgoKPgo+IEl0IHNvbWV0aW1lIGZlZWxz
IGxpa2UgdGhlIFJWIGZvbGtzIGFyZSBhY3RpdmVseSB0cnlpbmcgdG8gbWFrZSB0aGlzCj4gYXJj
aGl0ZWN0dXJlIGEgbWVzcy4uLiA6LS8KCldlbGwsIEkgc3RpbGwgZmFpbCB0byB1bmRlcnN0YW5k
IHdoYXQgaXMgbWVzc3kgaGVyZS4KClJlZ2FyZHMsCkFudXAKCj4KPiAgICAgICAgIE0uCj4KPiBb
MV0gQ0FBaFNkeTBqVFREem9jKzNUXzh1TGlXZkJOM0FGQ1dqOTlBeWMtWWg4RkJmelVZMnNRQG1h
aWwuZ21haWwuY29tCj4KPiAtLQo+IFdpdGhvdXQgZGV2aWF0aW9uIGZyb20gdGhlIG5vcm0sIHBy
b2dyZXNzIGlzIG5vdCBwb3NzaWJsZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
