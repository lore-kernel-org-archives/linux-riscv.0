Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFC9CAC5B8
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 20:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kVxckOS1d0bLj1a7z/ueDNTc9R72L8VXZSGCej51lfY=; b=wSl9AzSJ3h+KUR
	hQJbdVpwNNJ7Q9cai9GJ3/nFZjiU6PFaVGsEKLS5Jq79aPOrcChnqh8yaGLivEtqkEZ/B/R8JW+ct
	NAeV8/2kEJMLAQFmSpIa/zp7uZcVAGQBIqBiqr2lHGU5Tr+JvIfYkm2azQs/Zw+jHmxqw8LVGNurM
	ozRLagtbUlJbhUUy6tmih9rrmV4aB7TOO1uCdcK6PB64rLps1lNafhoNlYUQniccEy6ZhbcjRX6fE
	SLmNmLkTZMlIiG7K6fuHgy9Vep03s0yfWi00+rsbGuGcpQIZAOzF7ib82ioiSbzkGRsqw4xGysMVB
	iBd+T+Rt7nA1TGKIrDZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2FVl-00000004ThE-2UZ8;
	Fri, 26 Sep 2025 20:57:49 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2FVh-00000004TeJ-2a7t
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 20:57:47 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b55517e74e3so2753361a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Sep 2025 13:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758920264; x=1759525064; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lH2Sfk58/GaFMno98E5ZZZ0Jezt1oWfRMccsDmLi3+U=;
        b=LoBjKzxOhuR9tDnUYSCoC1iwyxVX06g+as4+KaryPxkY/Kgh//56YdP9ze5rB4/fJw
         BGMojXXqmSXtcGpBEkSgJzMxxxCpaxUSdpXUMhHOdE9lp5A5MBx1bKOy22Lr1TtY3N5S
         IVkvwnX7uLOFyOkZRGD0qdMf2j3y1TuFIbhG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758920264; x=1759525064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lH2Sfk58/GaFMno98E5ZZZ0Jezt1oWfRMccsDmLi3+U=;
        b=EOxHh8WiMKKqJNzaROTLENuyHHnlQEROuKCgoMBNpbvshfDuEUE6xeqvSJ+VKPegQg
         lavqBAyVRfDuGZ3vIC3OqYOIOqC5rTDbgKGT51JPAJ6VkX2U8NstaDEX6mUr4eByjwC/
         TgvacNq1ygyG4/92O7QfkuyQQohCOSbi1bfmX/3fXC0lxS5/+m+galObSBxgYWb6EkBY
         yFTROIP60ulENkOtbw76LgWsED7beJlHIbIZchOe0jdcKGkkLNAhTAimM3Z3+c4YsLzU
         f8gROQBhlSjqDd0wf43SN575iXxJ+YfhkGq4+X2LsiIvgYmWwvMdXdy3g19WdwqM0rkO
         DLXA==
X-Forwarded-Encrypted: i=1; AJvYcCWpypBGt+nRCwbZP6P7g55gP8NUOCRFhx9BpCerNsqhkRuhYBWl0sF+clAlWWEyhkEiXu6Sn6jdPlKVlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCWAItXRa5seCz/p5aiD3gsoQvVZzB0Is6DRy1NGDQVidEs/MY
	t0K3yfB/td+uKn4gqTx4bTueAaWyU5aULo7GXQc5RwxxlHGVDBXzBXlkTlrUf+fRS05z9cr+HGh
	g7SA=
X-Gm-Gg: ASbGncv5e7Wgr+dH+OdGHzFeDUosji7+50YzMhobL2HOPPbxh6zR0mUKUdImhZtPrhD
	I0OnS/G9s8nI98SHYrxxzQ/ZpHdOb26g9M3lYZTL9VLIMJjqoVo6h7QS87CK1ubyog9PV+zPr+e
	BZ6wDOqI7Q0WhUDo5j5tIM/n+4pa0cRVcOQkErkuSDFRPmjBC66ii9F58nE+X4OULCWhjlVUtG4
	hn+92a4v1emITf1msKChtN5RUKHKQj+jjM1ShV3s0OwhncduZhDSeRhPRnPoYF8bFYjVA86VOP1
	5r6PnOq4QqUuLrD2IlpUAScenkcwcLhWRdwuYZr2oeq66YLKM+OHUdp8kc//svOiuV/sVMoyy/f
	LWx4HJthsqn5OYFRZEdJCPB+A0q/dhO8UwZDSXOM/a+d3XWLTrS0WTI42fNg7dVgpNw==
X-Google-Smtp-Source: AGHT+IEytUmGAQJIZV4RMw3J4df9EDQdIov2/8WoCFV2lzw5wsWU8TeeY4Kj3V7o/GhhJdk87A4myA==
X-Received: by 2002:a17:902:f542:b0:269:805c:9447 with SMTP id d9443c01a7336-27ed49df2a4mr102548295ad.4.1758920264532;
        Fri, 26 Sep 2025 13:57:44 -0700 (PDT)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com. [209.85.214.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6882140sm61150115ad.70.2025.09.26.13.57.44
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 13:57:44 -0700 (PDT)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-269af38418aso33051065ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Sep 2025 13:57:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU39QhLDDwjbUKVkOmdK/bWG9zi+Rz+jU22c2Jj7QtB1PEY2H/HyiA5Kuqb94vnEMgDCMyfFlGMrlG9Iw==@lists.infradead.org
X-Received: by 2002:a17:902:c402:b0:25c:d4b6:f119 with SMTP id
 d9443c01a7336-27ed49df307mr105837165ad.12.1758920263386; Fri, 26 Sep 2025
 13:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250925084806.89715-1-cuiyunhui@bytedance.com>
 <20250925084806.89715-2-cuiyunhui@bytedance.com> <CAD=FV=VZLYqPQCOEhbH4QtndeG5e1-0wey24fgYNTeFiqd8qJg@mail.gmail.com>
 <CAEEQ3wnwNdTgt6ByHCzM43fhZMLSxwXvYx-AGBpsktraXqif2Q@mail.gmail.com>
In-Reply-To: <CAEEQ3wnwNdTgt6ByHCzM43fhZMLSxwXvYx-AGBpsktraXqif2Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 26 Sep 2025 13:57:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X6Xv_WYPMXKtOWLJX7skCoQmia3JbQej_u38qxqAbqDg@mail.gmail.com>
X-Gm-Features: AS18NWDVMqIM3NdX-t4tF69rrS3UxfWVNc7ZvIbAVZlF3PJHNdBYWzKZ9mUJzVc
Message-ID: <CAD=FV=X6Xv_WYPMXKtOWLJX7skCoQmia3JbQej_u38qxqAbqDg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 1/2] watchdog: move arm64 watchdog_hld
 into common code
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	johannes@sipsolutions.net, lihuafei1@huawei.com, mark.rutland@arm.com, 
	masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_135745_702006_1399CCBE 
X-CRM114-Status: GOOD (  23.93  )
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

SGksCgpPbiBGcmksIFNlcCAyNiwgMjAyNSBhdCAyOjM34oCvQU0geXVuaHVpIGN1aSA8Y3VpeXVu
aHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gSGkgRG91ZywKPgo+IE9uIEZyaSwgU2VwIDI2
LCAyMDI1IGF0IDQ6MDDigK9BTSBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+
IHdyb3RlOgo+ID4KPiA+IEhpLAo+ID4KPiA+IE9uIFRodSwgU2VwIDI1LCAyMDI1IGF0IDE6NDji
gK9BTSBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IEBAIC0xNyw2ICsxNyw3IEBACj4gPiA+ICAjaW5jbHVkZSA8bGludXgvY3B1X3BtLmg+Cj4g
PiA+ICAjaW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+Cj4gPiA+ICAjaW5jbHVkZSA8bGludXgva2Vy
bmVsLmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvbm1pLmg+Cj4gPiA+ICAjaW5jbHVkZSA8bGlu
dXgvcGVyZi9hcm1fcG11Lmg+Cj4gPiA+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ID4gPiAg
I2luY2x1ZGUgPGxpbnV4L3NjaGVkL2Nsb2NrLmg+Cj4gPiA+IEBAIC02OTYsMTAgKzY5NywxMiBA
QCBzdGF0aWMgaW50IGFybXBtdV9nZXRfY3B1X2lycShzdHJ1Y3QgYXJtX3BtdSAqcG11LCBpbnQg
Y3B1KQo+ID4gPiAgICAgICAgIHJldHVybiBwZXJfY3B1KGh3X2V2ZW50cy0+aXJxLCBjcHUpOwo+
ID4gPiAgfQo+ID4gPgo+ID4gPiAtYm9vbCBhcm1fcG11X2lycV9pc19ubWkodm9pZCkKPiA+ID4g
KyNpZmRlZiBDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RPUl9QRVJGCj4gPiA+ICtib29sIGFyY2hf
cGVyZl9ubWlfaXNfYXZhaWxhYmxlKHZvaWQpCj4gPiA+ICB7Cj4gPiA+ICAgICAgICAgcmV0dXJu
IGhhc19ubWk7Cj4gPiA+ICB9Cj4gPiA+ICsjZW5kaWYKPiA+Cj4gPiBTaG91bGQgdGhlIHByZXZp
b3VzIGNvbW1lbnQgbW92ZSBoZXJlLCBBS0E6Cj4gPgo+ID4gLyoKPiA+ICAqIGhhcmRsb2NrdXBf
ZGV0ZWN0b3JfcGVyZl9pbml0KCkgd2lsbCBzdWNjZXNzIGV2ZW4gaWYgUHNldWRvLU5NSSB0dXJu
cyBvZmYsCj4KPiBPa2F5LCB3ZSBhbHNvIG5lZWQgdG8gY2hhbmdlIGl0IHRvIOKAnHdhdGNoZG9n
X2hhcmRsb2NrdXBfcHJvYmUoKeKAnQo+Cj4gPiAgKiBob3dldmVyLCB0aGUgcG11IGludGVycnVw
dHMgd2lsbCBhY3QgbGlrZSBhIG5vcm1hbCBpbnRlcnJ1cHQgaW5zdGVhZCBvZgo+ID4gICogTk1J
IGFuZCB0aGUgaGFyZGxvY2t1cCBkZXRlY3RvciB3b3VsZCBiZSBicm9rZW4uCj4gPiAqLwo+ID4K
PiA+Cj4gPiA+ICtzdGF0aWMgaW50IF9faW5pdCBpbml0X3dhdGNoZG9nX2ZyZXFfbm90aWZpZXIo
dm9pZCkKPiA+ID4gK3sKPiA+ID4gKyAgICAgICByZXR1cm4gY3B1ZnJlcV9yZWdpc3Rlcl9ub3Rp
Zmllcigmd2F0Y2hkb2dfZnJlcV9ub3RpZmllciwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBDUFVGUkVRX1BPTElDWV9OT1RJRklFUik7Cj4gPgo+ID4gSSB0
aGluayB5b3UgbmVlZCB0byBkbyBzb21ldGhpbmcgdG8gcHJldmVudCB0aGlzIGZyb20gaGFwcGVu
aW5nIG9uIGFueQo+ID4gcGxhdGZvcm1zIHRoYXQgb3ZlcnJpZGUgaHdfbm1pX2dldF9zYW1wbGVf
cGVyaW9kKCksIHJpZ2h0PyBUaGVzZQo+ID4gY3B1ZnJlcSBub3RpZmllcnMgd2lsbCBiZSB1c2Vs
ZXNzIGluIHRoYXQgY2FzZS4uLgo+Cj4gSSB1bmRlcnN0YW5kIHRoaXMgaXMgbm90IGEgcHJvYmxl
bS4gd2F0Y2hkb2dfcGVyZiB1c2VzCj4gUEVSRl9DT1VOVF9IV19DUFVfQ1lDTEVTLCB3aGljaCBt
ZWFucyBpdCBpcyBpbmhlcmVudGx5IGxpbWl0ZWQgYnkgdGhlCj4gQ1BVJ3MgbWFpbiBmcmVxdWVu
Y3kuIEFmdGVyIHdlIG1ha2Ugc3VjaCBhIGNoYW5nZSwgYSBsYXJnZXIgdmFsdWUgbWF5Cj4gYmUg
dXNlZCBhcyB0aGUgcGVyaW9kLCBzbyB0aGUgTk1JIHBlcmlvZCB3aWxsIGJlY29tZSBsb25nZXIs
IGJ1dCB0aGlzCj4gdmFsdWUgd2lsbCBub3QgY2hhbmdlIGFmdGVyIHRoZSBzeXN0ZW0gc3RhcnRz
LgoKSSdtIG5vdCBzdXJlIEkgZm9sbG93LiBPbiB4ODYsIGh3X25taV9nZXRfc2FtcGxlX3Blcmlv
ZCgpIGlzOgoKdTY0IGh3X25taV9nZXRfc2FtcGxlX3BlcmlvZChpbnQgd2F0Y2hkb2dfdGhyZXNo
KQp7CiAgcmV0dXJuICh1NjQpKGNwdV9raHopICogMTAwMCAqIHdhdGNoZG9nX3RocmVzaDsKfQoK
T24gUG93ZXJQQyBpdCdzOgoKdTY0IGh3X25taV9nZXRfc2FtcGxlX3BlcmlvZChpbnQgd2F0Y2hk
b2dfdGhyZXNoKQp7CiAgcmV0dXJuIHBwY19wcm9jX2ZyZXEgKiB3YXRjaGRvZ190aHJlc2g7Cn0K
Ck5laXRoZXIgb2YgdGhvc2UgYXJlIG5lY2Vzc2FyaWx5IGJhc2VkIG9uIHRoZSByZXN1bHRzIHRo
ZSBjcHVmcmVxCnJlcG9ydHMuIC4uLnNvIHRoZXJlZm9yZSBJIGRvbid0IHRoaW5rIHlvdSBzaG91
bGQgYmUgdGFraW5nIHRoZQpjcHVmcmVxIHJlcG9ydGVkIG51bWJlcnMgYW5kIGFzc3VtaW5nIHRo
ZXkncmUgT0sgb24geDg2IGFuZCBwb3dlcnBjLgoKLURvdWcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
