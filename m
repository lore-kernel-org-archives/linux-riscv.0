Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED04CD128A
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Apr 2024 17:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fF74kBMjnwb3N3/CqO7QEZcVtd4+cNE8jk6vsRHSzho=; b=BlZf8k+I5jvoY7
	0zciIo+DRb5u4ALuE5T8UkKV3j6aqLeoGuDL8n1KltW9syFmQ8KpRCbgCkzevuiQky2HJfjM+GMGI
	maHNgKnxlvZblZxoQZKnosdSa8PNfmH9NbCFAn1YRiDyuVMppIp298jem+yQGB9P4Ar+GjG7hBmhb
	dfffrr+lRFO9n5Bv3ue8LCN6rGlzsQj/TlIMgHuT8HVhmQTVG6j9Hn75wm7yodkTwhg2bYn0cSOG/
	/uNox62eAJlgOgkX4RuoX6/QQp6ABK0bySoUV62gzjN6ySItiP5SosjjQT263eZn0qrrAsVH80h6i
	gg+buczdeVzXN51JFwDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrLtH-00000008Vbq-2G9z;
	Mon, 01 Apr 2024 17:56:15 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrLtD-00000008Vau-2XwP
	for linux-riscv@lists.infradead.org;
	Mon, 01 Apr 2024 17:56:13 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6143fd4c182so28966707b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Apr 2024 10:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711994167; x=1712598967; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ayg8yEodnyIkhrNKh0vWxZ555hD22ZpFvhWL8Rikvao=;
        b=Rb65lKJDNteGpU2HvRelZZmcZeGMmD7SeY+lG9ZSauMwPXHMw5iDfx/XfGRWcLP/Uu
         MvrrqkG5lYPmgkzqF4LPz0ISr0y/aHysGkMwR9AgW8j2v8FWQ50i7xWbvf7OuyBJOCTm
         ZBGHihbPo1mhPU6dcWwR5P81JXRNjaCbRSuh6VEQzFJpstmC6YucQXcjUfrcODj+1wMb
         IqNxXmKI1abYaWisuuidNWRXOn1KjvYekxVJFrEZe+A0ZLfoUTSe6+Lu+FGjhVmPxiXQ
         rS3pW5KhYUWf2Ghx4KjxR7JC05s6H+A4ZD0AIbPuusiJsZUdB1DIMc2ZcVn35vq0HObC
         zRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711994167; x=1712598967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ayg8yEodnyIkhrNKh0vWxZ555hD22ZpFvhWL8Rikvao=;
        b=oP6qoyn/JRs6PZtNIhX3TBkM+/V+IiAm9QBt2HDo7M59jBs2D8iEOrWX1D4URsSSPM
         zWpPj7iv7ukGIbEbGAHqxCe/up5Bk9LTIs95oW09BIhGuk4r47qJF4jdUQDPkvNoCJwh
         aGsYBbotIknEkT64xtkq6Z8qy07cTpNjsg/IvtGEw/UG8rBKpvd5ZE6gZkurmjaCKUTb
         P+7ibn529x30FJw90t9qWgZ5YtaJcarm+iU1zpXi8CGtd6NSGSqBaqOqJM+DUjUv40E3
         3wYcp4iiMlWH1nhT1Q4d+4ROaGxOgETFeB9MVHJfKPv09iCXAITZ0XCxdbvDhYnnNwP6
         VwmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpWkWVr2woMaqV3IVlPS7Gr2sjv1L1sZsM/z6nwiG+4DdeQVtuusuE0NrO6parYYWoZqxGN83vVEEMthOp+NYLegUA8akx5rDhJWyMhDIb
X-Gm-Message-State: AOJu0YwCKgbtCTIiItllKEgl4EhFYso1DByuTi9Bz/KWJF+YvazzenBz
	IIxdhzDuYjac5tklVVTbGVgYvIy0YYbt2+0klBx3sNvBxe7i2463sTQNt2JnsVe9YwP4rSgzlNd
	iktAMNRANdlvHMTT0BUQV9iVT32NqvRZ0MxFxPQ==
X-Google-Smtp-Source: AGHT+IHbNEbSTz8DBCYKR9MqO/caPtbEZWICPniiYQejcusJBa6iSdkbnh9sfMt7GjtTJc/3SigyJ/z+M6qQOU/SrM8=
X-Received: by 2002:a0d:c984:0:b0:611:a5b:337f with SMTP id
 l126-20020a0dc984000000b006110a5b337fmr9528979ywd.10.1711994165573; Mon, 01
 Apr 2024 10:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240329044459.3990638-1-debug@rivosinc.com> <20240329044459.3990638-28-debug@rivosinc.com>
 <4b38393a-f69d-4a77-a896-b6cd42c7edcf@collabora.com> <CAKC1njQ_RU=uHhrna=MFVdjAMjjQNqZWnkjPoJvO7CxtPMeNuQ@mail.gmail.com>
 <ef72ae20-6b68-496a-a819-8818ade0d433@collabora.com> <CAKC1njQj7GfkdE1HJD54utkoPqJXyqMeoXOxa6ActqZ-fSDuKQ@mail.gmail.com>
In-Reply-To: <CAKC1njQj7GfkdE1HJD54utkoPqJXyqMeoXOxa6ActqZ-fSDuKQ@mail.gmail.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 1 Apr 2024 10:55:54 -0700
Message-ID: <CAKC1njR3+mxZHEig8iZo+=0k_VFWg9ZYO3pzGi6s=uLZ5hOkKw@mail.gmail.com>
Subject: Re: [PATCH v2 27/27] kselftest/riscv: kselftest for user mode cfi
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com, broonie@kernel.org, 
	Szabolcs.Nagy@arm.com, kito.cheng@sifive.com, keescook@chromium.org, 
	ajones@ventanamicro.com, conor.dooley@microchip.com, cleger@rivosinc.com, 
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com, 
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, corbet@lwn.net, 
	tech-j-ext@lists.risc-v.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com, 
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com, shuah@kernel.org, 
	brauner@kernel.org, andy.chiu@sifive.com, jerry.shih@sifive.com, 
	hankuan.chen@sifive.com, greentime.hu@sifive.com, evan@rivosinc.com, 
	xiao.w.wang@intel.com, charlie@rivosinc.com, apatel@ventanamicro.com, 
	mchitale@ventanamicro.com, dbarboza@ventanamicro.com, sameo@rivosinc.com, 
	shikemeng@huaweicloud.com, willy@infradead.org, vincent.chen@sifive.com, 
	guoren@kernel.org, samitolvanen@google.com, songshuaishuai@tinylab.org, 
	gerg@kernel.org, heiko@sntech.de, bhe@redhat.com, 
	jeeheng.sia@starfivetech.com, cyy@cyyself.name, maskray@google.com, 
	ancientmodern4@gmail.com, mathis.salmen@matsal.de, cuiyunhui@bytedance.com, 
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il, alx@kernel.org, 
	david@redhat.com, catalin.marinas@arm.com, revest@chromium.org, 
	josh@joshtriplett.org, shr@devkernel.io, deller@gmx.de, omosnace@redhat.com, 
	ojeda@kernel.org, jhubbard@nvidia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_105611_677212_9E3AB588 
X-CRM114-Status: GOOD (  14.21  )
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

T24gTW9uLCBBcHIgMSwgMjAyNCBhdCAxMDozNOKAr0FNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgQXByIDEsIDIwMjQgYXQgMjo0OOKAr0FNIE11
aGFtbWFkIFVzYW1hIEFuanVtCj4gPHVzYW1hLmFuanVtQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+
ID4KPiA+ID4+PiBTaWduZWQtb2ZmLWJ5OiBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNv
bT4KPiA+ID4+PiAtLS0KPiA+ID4+PiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvTWFr
ZWZpbGUgICAgICAgIHwgICAyICstCj4gPiA+Pj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jp
c2N2L2NmaS9NYWtlZmlsZSAgICB8ICAxMCArCj4gPiA+Pj4gIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0
cy9yaXNjdi9jZmkvY2ZpX3J2X3Rlc3QuaCB8ICA4NSArKysrCj4gPiA+Pj4gIC4uLi9zZWxmdGVz
dHMvcmlzY3YvY2ZpL3Jpc2N2X2NmaV90ZXN0LmMgICAgICB8ICA5MSArKysrKwo+ID4gPj4+ICAu
Li4vdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvY2ZpL3NoYWRvd3N0YWNrLmMgfCAzNzYgKysrKysr
KysrKysrKysrKysrCj4gPiA+Pj4gIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9jZmkvc2hh
ZG93c3RhY2suaCB8ICAzOSArKwo+ID4gPj4gUGxlYXNlIGFkZCBnZW5lcmF0ZWQgYmluYXJpZXMg
aW4gdGhlIC5naXRpZ25vcmUgZmlsZXMuCj4gPiA+Cj4gPiA+IGhtbS4uLgo+ID4gPiBJIGRvbid0
IHNlZSBiaW5hcnkgYXMgcGFydCBvZiB0aGUgcGF0Y2guIFdoaWNoIGZpbGUgYXJlIHlvdSByZWZl
cnJpbmcKPiA+ID4gdG8gaGVyZSBiZWluZyBiaW5hcnk/Cj4gPiBzaGFkb3dzdGFjayB3b3VsZCBi
ZSBnZW5lcmF0ZWQgYnkgdGhlIGJ1aWxkLiBDcmVhdGUgYSAuZ2l0aWdub3JlIGZpbGUgYW5kCj4g
PiBhZGQgaXQgdGhlcmUuIEZvciBleGFtcGxlLCBsb29rIGF0Cj4gPiB0b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9yaXNjdi92ZWN0b3IvLmdpdGlnbm9yZSB0byB1bmRlcnN0YW5kLgo+Cj4gSXQncyBg
c2hhZG93c3RhY2suY2AgKGEgQyBzb3VyY2UgZmlsZSkgYW5kIG5vdCBhIGJpbmFyeSBmaWxlLgoK
TmV2ZXJtaW5kLiBJIHRoaW5rIHdoYXQgeW91IHdhbnQgbWUgdG8gZG8gaXMgYWRkIGEgcnVsZSBp
biBgLmdpdGlnbm9yZWAuCkkgd2FzIHRoaW5raW5nIG90aGVyd2lzZSAodGhhdCBzb21laG93IHlv
dSdyZSBzZWVpbmcgYSBiaW5hcnkgZmlsZSBpbgpwYXRjaCBzZXQpLgoKVGhhbmtzLiBXaWxsIGRv
IHRoYXQgaW4gdGhlIG5leHQgaXRlcmF0aW9uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
