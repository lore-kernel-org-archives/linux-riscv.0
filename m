Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDB1C30653
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 09:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jpAh7lkmJ4r7xZ9hWQ6ysjJrvibeHLsLg1xsz8BJbZ0=; b=K3bjyYgAmViPTw
	IkPXNFXVih7rUJIgQ2YHwRuOxk6AqcXXJot6hiGj2omH/LThkPdiK3siC/HRA20ZDYCbxGh1ynkaj
	xEKZ548yvfz6m/AkSrNE9YyFbpKW5mNXxJJlayTXfckj6aVyMagWB4jw/4v9iF1odneUbfHRQ3Iyw
	Crh4vbFRjKQaZFLg8cNVsT5iVeTQJEL31RGF07N4al43OHIyyMmkG+YacHe372DHBYcsnXzhjy6Uu
	JmOA2ja+mCBksxt3no90Hjatc0uP5tbVE4RYu1/ISbo1KMqRGsYdArm8wUHpYDbl/ICyNkuzVz0kJ
	udgVuH2/7QQaKx8XWf9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sODIb-00000002R74-2WMh;
	Mon, 01 Jul 2024 09:26:13 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sODIZ-00000002R6V-1AXs
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 09:26:13 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7381b56fb6cso901778a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 02:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719825970; x=1720430770; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLxBYT6lZAnsn3LJAv/RrK+X+sYbyfslVENO8igDdxM=;
        b=k+KVpLyhWSFIme7V8HRba/mQWP1M+cQLAM58DL5CzdnnYuF099pMUs5h9F5lZD4ftB
         2Vp6lP7+G3nk6ppYJAUaVLTH1snelQESaiByb6LIMGD/OS9XZLX+tdty4oX79GE7fQqX
         rhzIsSzGVdSn7rXDYmxFJSW79bsHOHGi4JtNYEzlv36Nrkl675tNCuySSFR+zxq/m9Aa
         JIdmTvs828fj3GW6oWJhyA9+EyXtgHUmZA91dlrSiZ4lZuxOk2QBKI7VDz5okbpG/R7+
         tzzRrHmmh4LGpmqFBcVLxmlKOXS5uER4bIVCXSss90Jjn30NSoWU4hrPDLOHFS1a0sjN
         OGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719825970; x=1720430770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLxBYT6lZAnsn3LJAv/RrK+X+sYbyfslVENO8igDdxM=;
        b=DLyr4qV53JjZ2qIUPFeapmDbw/Jau+CYrnjVGjuBA9Lp2cvSBEVtBszEaXdgcUzdPZ
         1F4dm5K9rDSRGeztqqcVivkm6CpgLv4m4Hd0aAQSk/vothyAzzHBxhf54IJ9Ae/6HleX
         IzqHOo3abj/kDPp45WlYCkjOTHIQDj1MK1vtXwatK54+5I9/V3HRO4k0IAa+LJRn5feZ
         9xzkPuFtEJGAiosdsBmYwcJAf7Cjf9P0o4XYXbAyIoqPUzB0rjkVeYbXCXm0QTwXi1f4
         cBvHJkWDnmeFdlyfHKTxvm8xusiDfIQrL7Kv6wpZsue8brLkMVrBptRc79wHulTFSfOo
         GmvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbcw1nEklLzl3f25F4Dy1npzjM1jvIOEzuytpDfjMAhEZz5xVVg2gTqB6zgfvZQ/Zx4StFnjk7DP0Q0RbW7HfsOXitdyO8B4YjBccLTfoX
X-Gm-Message-State: AOJu0YyiYEpJFhhTIozzoIIynXJRQRK1yW9ZF3jPTjyaUxBSP+0h+wJV
	k5ojQS8FJ2ac+FFbEOgizLnETMX9No1kS862l8B+HKeTcFeKXshwTBF6aVPCgUyZipbzmL/3WpB
	dIIHyQATRgYYsxGpmTxdSKPeRGcZzSqFhR/ZtYw==
X-Google-Smtp-Source: AGHT+IFDGkhs/Uqx9rZKsJJeig7rjQkCf5zVJ9PGVd7JKGl0xn5A1rWbgKarqOMg3F9Uak5en6PJWXoJTcb9RkZko7I=
X-Received: by 2002:a05:6a21:3288:b0:1bd:23c7:ebfb with SMTP id
 adf61e73a8af0-1bef6277352mr4231085637.62.1719825970649; Mon, 01 Jul 2024
 02:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240701072908.25503-1-luxu.kernel@bytedance.com>
 <20240701072908.25503-2-luxu.kernel@bytedance.com> <CAH2o1u7j6pXhWHL2rBZak6LeXxn_KUbQHjygRGQKuEfS_vmtkQ@mail.gmail.com>
 <CAPYmKFtCzQOOsN7vutoY0MrthtvcGxBqRsbr4ZgMQsaY1CrXHQ@mail.gmail.com> <CAPYmKFs-R4SfjZOMyV5wxjrkV+Eawc-zRWKgAZNFpOezZ6JQDA@mail.gmail.com>
In-Reply-To: <CAPYmKFs-R4SfjZOMyV5wxjrkV+Eawc-zRWKgAZNFpOezZ6JQDA@mail.gmail.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Mon, 1 Jul 2024 11:25:59 +0200
Message-ID: <CAH2o1u7u3G0NDj_SjPPasNo9pJ2xDpBAE13=aqSG1EhVQyup6Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/1] iommu/riscv: Support sharing irq lines
 between iommu queues
To: Xu Lu <luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_022611_339492_B4016D00 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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
Cc: apatel@ventanamicro.com, aou@eecs.berkeley.edu, linux@rivosinc.com, will@kernel.org, joro@8bytes.org, linux-kernel@vger.kernel.org, xieyongji@bytedance.com, iommu@lists.linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, robin.murphy@arm.com, lihangjing@bytedance.com, baolu.lu@linux.intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdWwgMSwgMjAyNCBhdCAxMToxNOKAr0FNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IE9oLCBJIHRoaW5rIEkgdW5kZXJzdGFuZCB3aGF0IHlvdSBt
ZWFuIG5vdyBhZnRlciBjaGVja2luZyB0aGUKPiBpbXBsZW1lbnRhdGlvbiBvZiByaXNjdl9pb21t
dV9xdWV1ZV92ZWMoKS4gSSBhcG9sb2dpemUgZm9yIG5vdAo+IHVuZGVyc3RhbmRpbmcgdGhlIG1l
YW5pbmcgb2YgdGhlIGNvZGUgYmVmb3JlLCBwbGVhc2UgaWdub3JlIG15Cj4gZGlzdHVyYmFuY2Uu
Cj4KPiBCZXN0IFJlZ2FyZHMsCj4KPiBYdSBMdQoKTm8gd29ycmllcywgdGhhbmtzIGZvciBjaGVj
a2luZyB0aGF0IHBhdGguIExNSyBpZiB0aGVyZSBhcmUgYW55IG90aGVyCnByb2JsZW1zIHdpdGgg
dGhlIGRyaXZlci4KCkJlc3QsCi0gVG9tYXN6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
