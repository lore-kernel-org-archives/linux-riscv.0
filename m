Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355FEC27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 16:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dNI4SX1b+A8PV/gtnT9ViYsDMZucu9OjYL0LeHBWpaQ=; b=CXvhoMyntEXWuj
	OmGK78O7IZYD17dxYHmYZSBBeGUDneBPsrUnJV5Hq5vigybS51IFy/FbZ6VSyF574px3BSR+oOIWn
	BGtS9/hjlAlWEZ4nJHm7ebYHEOxZ6I4LYYWij4jwRnCt15DJm9+aJE0ZEBPRpIwz/bnWexY7nYKXK
	ZSgiSLRaq9I9oKpLr+1mrqo2pxgZwFEGLK8dzdivdPq+h/hsUMJu3XM3LHzmRKl2DQKHzIh+Yb2RQ
	FhoAAezRBHs7LFT/KFyw7aSirbH4XazkP1DmFVw24nnlj4RYxkZz+BDr3EG0JY/T4XuryLG6STOUu
	1m4LSTt2rii/GmZVNI4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMVMV-00000007ZV4-2Ujt;
	Wed, 26 Jun 2024 16:19:11 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMVMJ-00000007ZPJ-2Cwt
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 16:19:09 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-52cdea1387eso4645639e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 09:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719418736; x=1720023536; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOXAoPOZbipJ93XdyhTiv94Fgw7fYvC41s+vnDXKabQ=;
        b=zU8gpvV4GRStvQ+b5eU3qDJBwka7A6AcAh797idZW80IiyPHf80Fr2xcqwXlp8mW5F
         vyJurOxs1Iqpa992T993PLLO4LHWJPzi4mCZUzABffyNZWB1kgmiuTbh29uLsFiHGy7Y
         tHIRzA+o4vtHncKLpcy6W1UqahyU7exjwozJp5dglf6Fx6uj1uyq/Ripd0A036KTzc9a
         jJjS9E09jyuiYyvz8aMzJKtHevJcpzUgV4wI9rouNAoKtBYp758rXlvTyUwJs/Vz+kW5
         Il3CM5uuOxXEdsuZSCzlfOGIIQQt4bMY/D9cQnzj+eprBP0h8yNHw/6KSlv+JtGHpyO7
         4iCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719418736; x=1720023536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JOXAoPOZbipJ93XdyhTiv94Fgw7fYvC41s+vnDXKabQ=;
        b=EOzdI8od8hL80FXmWxE/gDsWpfKkKbfufzrT4d3xbp1tPmKmwXHoPooFZAgYKpJUjs
         i3yhPpDAkVhM+Q6c7q6OycCuFTOVE2yhZ1tOvg/561keWtW1hqGotOZ/TQXqe6LGFKH3
         BNqU4HQYUfGsfz8vggKJk/7/TaPoYPntXd8FFKTNcouw3DgPvF+gFixo711fHyfCRU3J
         bdHhBCH9zL6dz2oo8ny6KIBwzyKaWq1zU8FtFC6BF0cOhSqF0NMQe+LHCw5zpQmjGPDM
         PUkXyb5ETMMZF3g3dpvp1gg7zgvYiMVFtQz39WxUzAaoORQTwEtjVc5WSX/mP4uchL6Z
         eNIQ==
X-Gm-Message-State: AOJu0YxL+OcvUWHUAZPhiZ/QPEWNp8zNWuuuqXGYVudm1DUHbbIUATLF
	Qy0czTW6w7+i4PWODd/XiXCPtMNkvwyCLYgJSVf2YCBVAnAblFGcaxVf6Csi8FYhWpUX4oB0fsp
	uG8jslL5NIjczn3f1NoO6Ry1r7ONSxspIxDl71w==
X-Google-Smtp-Source: AGHT+IHNMa1ftMAu8i49jJuPkee7HG52HPPQSvV++KhF04KmDg7GQRHQsI3P2aVaZhduWTy7dwIB7UF0h0Ip+fgNqPY=
X-Received: by 2002:a05:6512:2111:b0:52c:7fe8:6489 with SMTP id
 2adb3069b0e04-52cf5110982mr2440255e87.63.1719418736102; Wed, 26 Jun 2024
 09:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240626-misc_perf_fixes-v3-0-de3f8ed88dab@rivosinc.com>
 <20240626-misc_perf_fixes-v3-2-de3f8ed88dab@rivosinc.com> <96ff4dd2-db66-4653-80e9-97d4f1381581@sifive.com>
In-Reply-To: <96ff4dd2-db66-4653-80e9-97d4f1381581@sifive.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 26 Jun 2024 09:18:46 -0700
Message-ID: <CAHBxVyHx9hTRPosizV_yn6DUZi-MTNTrAbJdkV3049D-qsDHcw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drivers/perf: riscv: Reset the counter to hpmevent
 mapping while starting cpus
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_091906_506182_BFEFEFF0 
X-CRM114-Status: GOOD (  19.94  )
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

T24gV2VkLCBKdW4gMjYsIDIwMjQgYXQgNjoyNOKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IE9uIDIwMjQtMDYtMjYgMjoyMyBBTSwgQXRp
c2ggUGF0cmEgd3JvdGU6Cj4gPiBGcm9tOiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRA
c2lmaXZlLmNvbT4KPiA+Cj4gPiBDdXJyZW50bHksIHdlIHN0b3AgYWxsIHRoZSBjb3VudGVycyB3
aGlsZSBhIG5ldyBjcHUgaXMgYnJvdWdodCBvbmxpbmUuCj4gPiBIb3dldmVyLCB0aGUgaHBtZXZl
bnQgdG8gY291bnRlciBtYXBwaW5ncyBhcmUgbm90IHJlc2V0LiBUaGUgZmlybXdhcmUgbWF5Cj4g
PiBoYXZlIHNvbWUgc3RhbGUgZW5jb2RpbmcgaW4gdGhlaXIgbWFwcGluZyBzdHJ1Y3R1cmUgd2hp
Y2ggbWF5IGxlYWQgdG8KPiA+IHVuZGVzaXJhYmxlIHJlc3VsdHMuIFdlIGhhdmUgbm90IGVuY291
bnRlcmVkIHN1Y2ggc2NlbmFyaW8gdGhvdWdoLgo+ID4KPgo+IFRoaXMgbmVlZHM6Cj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPgoK
T29wcy4gU29ycnkgSSBtaXNzZWQgdGhhdC4KCkBBbGV4YW5kcmUgR2hpdGkgQFBhbG1lciBEYWJi
ZWx0IDogQ2FuIHlvdSBhZGQgdGhhdCB3aGlsZSBwaWNraW5nIHVwCnRoZSBwYXRjaCBvciBzaG91
bGQgSSByZXNwaW4gYSB2NCA/Cgo+IG90aGVyd2lzZSB5b3VyIGNvbW1pdCBtZXNzYWdlIGxvb2tz
IGZpbmUgdG8gbWUuCj4KPiA+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyB8IDIg
Ky0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyBiL2RyaXZlcnMv
cGVyZi9yaXNjdl9wbXVfc2JpLmMKPiA+IGluZGV4IGEyZTQwMDVlMWZkMC4uOTRiYzM2OWEzNDU0
IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+ID4gKysrIGIv
ZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+ID4gQEAgLTc2Miw3ICs3NjIsNyBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgcG11X3NiaV9zdG9wX2FsbChzdHJ1Y3QgcmlzY3ZfcG11ICpwbXUpCj4g
PiAgICAgICAgKiB3aGljaCBtYXkgaW5jbHVkZSBjb3VudGVycyB0aGF0IGFyZSBub3QgZW5hYmxl
ZCB5ZXQuCj4gPiAgICAgICAgKi8KPiA+ICAgICAgIHNiaV9lY2FsbChTQklfRVhUX1BNVSwgU0JJ
X0VYVF9QTVVfQ09VTlRFUl9TVE9QLAo+ID4gLSAgICAgICAgICAgICAgIDAsIHBtdS0+Y21hc2ss
IDAsIDAsIDAsIDApOwo+ID4gKyAgICAgICAgICAgICAgIDAsIHBtdS0+Y21hc2ssIFNCSV9QTVVf
U1RPUF9GTEFHX1JFU0VULCAwLCAwLCAwKTsKPiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyBpbmxpbmUg
dm9pZCBwbXVfc2JpX3N0b3BfaHdfY3RycyhzdHJ1Y3QgcmlzY3ZfcG11ICpwbXUpCj4gPgo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
