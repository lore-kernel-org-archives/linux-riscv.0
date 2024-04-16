Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74222C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 15:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKIqhDzWCLVpvGEiUKIr/aiu6cFY4chZTswG/QQtw8Q=; b=CpxOSKqJGWB0UKRyalymuYdKlC
	JmuAsgz6Hqvz38FUnX9zJqf9ntL94Lf0uYnUUpHKuy5BMxJUF/l3Kke6+iAw/iyw7YKMzx8MR79nT
	YkXt+GsGkS5373ohi0XmPcJXxV9T+yL2VKpxWIL/sC+a1faXsB36c9qY2zsSHW9juP+mg4iRrrrza
	C63I4MVyIMIFb0hGxerF/6jIeFitd07ScQmCfRlXserklsw5+XMaPgZ2xT9Thx0oyULSAT3fdacDD
	Fk8HX5WD+Qq366wkTTZwNYa3jr32Z+UncjPgk0+v59DUp98YBnaHH4JU7T610l2w2eECt2Ze7nhlJ
	zW5m7A6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkyu-0000000CoRF-22Mz;
	Tue, 16 Apr 2024 15:44:24 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkys-0000000CoQZ-16jA
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 15:44:23 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6ed112c64beso3674456b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 08:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713282260; x=1713887060; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e9KltKjoXDfkbWSeu7VmS8Z2kEX/B6kq3EkTIupIde8=;
        b=leCcxGP9ZKj149IYV4RGFqdxshNozMs7D0zSUPFqF+GHKoINAafoM+icckfU5sgL9G
         iTE39pr8oJ0mzW2hgQ5vNwqknwQKUkdW/wNlSWqHgCXeAE6Xr4VaUgdjT2ICxQ6XIBkF
         BfOltXzF9k/7eYIOyYcwRlTSew2kQ05GoiA+50R3o20mE0doyuefYzm931gz+svc6hvP
         yi/0cME+eb+Iy1vSM0elGgsIIPYaINDcjdZfscADoQyYB2rKw+K4zqqXEZ1rPMsnT4Ue
         6qGO06E6zJO6nbtS2DoF3oE/vUaEcn76ufdCuim/k3LQRo+Rg6I2DHaGt3zWvkbrk6cm
         +sZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713282260; x=1713887060;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e9KltKjoXDfkbWSeu7VmS8Z2kEX/B6kq3EkTIupIde8=;
        b=F34mZAfmzjsg1J1Cnsr3v6nHzgHVKVygPDC4pEBI9JnQG1FbtnRordSynDZYruEEVe
         m5pFNs50VH9s/w/HBtAmyLL2ZhQC7QIvJ/th8mK0lPrY1GYgAATshpDG5j0WYPHYwUTC
         deRxhiiCD02TMx5f3HFCnjpbQ6GgT9m1PRHNQ1kpbwCxK3RzgE6sJF2XgJz7sCtzp6IQ
         bJHHeCqgMHPHW+Xnw09J/ZRGA1cdqyrG2FhhnkOM5mWj26prUmG8R9rZQVShhSoZkXLh
         Al+viVZg+htc2u/MwzTWm296ezoDPU3HRGspag/QQ0QjvkCqakGG170qwV/tHodv2XB9
         p0yw==
X-Forwarded-Encrypted: i=1; AJvYcCVFMjvvvi79zfQ3R5BQRxRB+G11BiFPwjzy9T0E08N92NVqqGAWgaCRxzObt5EyJlWb3Lqr+hhrSa54cbdRjNtKswdUxIBkia3Xz0yrpFP1
X-Gm-Message-State: AOJu0Yw9wxKPaxUJMJm63odx3LQ24j5ugiDiT0mkyqkRP/g3h6u4N/5K
	kq3ZZqRX6huzr+tiKQBzZdt+8ciw3SvcR0d6nmgB+sELp+hu19Ow9seIQdu0Azk=
X-Google-Smtp-Source: AGHT+IFNgClAgjt5IgadPoPwJJY8jHfiJ4L4eLugbC5yjDCPSYARmT9MsoiuwN97dJz0uoqxOuQM5A==
X-Received: by 2002:a05:6a21:1014:b0:1a9:c2a1:3ae2 with SMTP id nk20-20020a056a21101400b001a9c2a13ae2mr11175898pzb.4.1713282260198;
        Tue, 16 Apr 2024 08:44:20 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id q24-20020a62e118000000b006ecf76df20csm9154539pfh.158.2024.04.16.08.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 08:44:19 -0700 (PDT)
Date: Tue, 16 Apr 2024 08:44:16 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Rob Herring <robh@kernel.org>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com,
	broonie@kernel.org, Szabolcs.Nagy@arm.com, kito.cheng@sifive.com,
	keescook@chromium.org, ajones@ventanamicro.com,
	conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
	ebiederm@xmission.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	lstoakes@gmail.com, shuah@kernel.org, brauner@kernel.org,
	andy.chiu@sifive.com, jerry.shih@sifive.com,
	hankuan.chen@sifive.com, greentime.hu@sifive.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, charlie@rivosinc.com,
	apatel@ventanamicro.com, mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com, sameo@rivosinc.com,
	shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 04/29] riscv: zicfilp / zicfiss in dt-bindings
 (extensions.yaml)
Message-ID: <Zh6c0FH2OvrfDLje@debug.ba.rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-5-debug@rivosinc.com>
 <20240410115806.GA4044117-robh@kernel.org>
 <CAKC1njSsZ6wfvJtXkp4J4J6wXFtU92W9JGca-atKxBy8UvUwRg@mail.gmail.com>
 <20240415194105.GA94432-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415194105.GA94432-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_084422_395125_6E29F2DC 
X-CRM114-Status: GOOD (  19.29  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBBcHIgMTUsIDIwMjQgYXQgMDI6NDE6MDVQTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj5PbiBXZWQsIEFwciAxMCwgMjAyNCBhdCAwMjozNzoyMVBNIC0wNzAwLCBEZWVwYWsgR3Vw
dGEgd3JvdGU6Cj4+IE9uIFdlZCwgQXByIDEwLCAyMDI0IGF0IDQ6NTjigK9BTSBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKPj4gPgo+PiA+IE9uIFdlZCwgQXByIDAzLCAyMDI0
IGF0IDA0OjM0OjUyUE0gLTA3MDAsIERlZXBhayBHdXB0YSB3cm90ZToKPj4gPiA+IE1ha2UgYW4g
ZW50cnkgZm9yIGNmaSBleHRlbnNpb25zIGluIGV4dGVuc2lvbnMueWFtbC4KPj4gPiA+Cj4+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4KPj4gPiA+
IC0tLQo+PiA+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFt
bCAgICAgICAgICB8IDEwICsrKysrKysrKysKPj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKQo+PiA+ID4KPj4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+PiA+ID4gaW5kZXggNjNkODFk
Yzg5NWU1Li40NWI4N2FkNmNjMWMgMTAwNjQ0Cj4+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4+ID4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4+ID4g
PiBAQCAtMzE3LDYgKzMxNywxNiBAQCBwcm9wZXJ0aWVzOgo+PiA+ID4gICAgICAgICAgICAgIFRo
ZSBzdGFuZGFyZCBaaWNib3ogZXh0ZW5zaW9uIGZvciBjYWNoZS1ibG9jayB6ZXJvaW5nIGFzIHJh
dGlmaWVkCj4+ID4gPiAgICAgICAgICAgICAgaW4gY29tbWl0IDNkZDYwNmYgKCJDcmVhdGUgY21v
YmFzZS12MS4wLnBkZiIpIG9mIHJpc2N2LUNNT3MuCj4+ID4gPgo+PiA+ID4gKyAgICAgICAgLSBj
b25zdDogemljZmlscAo+PiA+ID4gKyAgICAgICAgICBkZXNjcmlwdGlvbjoKPj4gPiA+ICsgICAg
ICAgICAgICBUaGUgc3RhbmRhcmQgWmljZmlscCBleHRlbnNpb24gZm9yIGVuZm9yY2luZyBmb3J3
YXJkIGVkZ2UgY29udHJvbC1mbG93Cj4+ID4gPiArICAgICAgICAgICAgaW50ZWdyaXR5IGluIGNv
bW1pdCAzYTIwZGM5IG9mIHJpc2N2LWNmaSBhbmQgaXMgaW4gcHVibGljIHJldmlldy4KPj4gPgo+
PiA+IERvZXMgaW4gcHVibGljIHJldmlldyBtZWFuIHRoZSBjb21taXQgc2hhIGlzIGdvaW5nIHRv
IGNoYW5nZT8KPj4gPgo+Pgo+PiBMZXNzIGxpa2VseS4gTmV4dCBzdGVwIGFmdGVyIHB1YmxpYyBy
ZXZpZXcgaXMgdG8gZ2F0aGVyIGNvbW1lbnRzIGZyb20KPj4gcHVibGljIHJldmlldy4KPj4gSWYg
c29tZXRoaW5nIGlzIHJlYWxseSBwcmVzc2luZyBhbmQgbmVlZHMgdG8gYmUgYWRkcmVzc2VkLCB0
aGVuIHllcwo+PiB0aGlzIHdpbGwgY2hhbmdlLgo+PiBFbHNlIHRoaXMgZ2V0cyByYXRpZmllZCBh
cyBpdCBpcy4KPgo+SWYgdGhlIGNvbW1pdCBzaGEgY2FuIGNoYW5nZSwgdGhlbiBpdCBpcyB1c2Vs
ZXNzLiBXaGF0J3MgdGhlIGd1YXJhbnRlZQo+c29tZW9uZSBpcyBnb2luZyB0byByZW1lbWJlciB0
byB1cGRhdGUgaXQgaWYgaXQgY2hhbmdlcz8KClNvcnJ5IGZvciBsYXRlIHJlcGx5LgoKSSB3YXMg
Zm9sbG93aW5nIGV4aXN0aW5nIHdvcmRpbmdzIGFuZCBwYXR0ZXJucyBmb3IgbWVzc2FnaW5nIGlu
IHRoaXMgZmlsZS4KWW91IHdvdWxkIHJhdGhlciBoYXZlIG1lIHJlbW92ZSBzaGEgYW5kIG9ubHkg
bWVudGlvbiB0aGF0IHNwZWMgaXMgaW4gcHVibGljCnJldmlldz8KCj4KPlJvYgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
