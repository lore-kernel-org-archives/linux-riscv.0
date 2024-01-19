Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E56C47422
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 03:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ttw2gNv4L7LCYoSUW2KT9GGJFdk2PD+Pd9DjoBQeT+A=; b=jVglyYathp86tW
	wOjp0t4wGOiesYJYz0p6iLBIzP5EQ5lWeUSwO4x96j4PtBpdcBccCPVTUrCRwNQ0GvTCmu5P7ETJ4
	L9eUNodZHofRukqzm6eBrR+PIndWFL8/uYSXgNZemk9LjsnegWYFC0+DzeESbYEuyy6R0OCVMaweW
	W/9isrwmPrfvQbYjph3ZTkmmOn1m/Bt8pUnRyCwCIdSlICEM0m9H00U9Txp29qLIyZXwuMVkgbC/K
	lLuORjUodwr6veyEAXduNsvR1x8EzDjMgT0R5jJCnNYLxlOTV2g0C2BBRGrcUazDZT6XH/PFR/MrN
	XBVul45Z6BweG5tDyXBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQfJh-004MaV-1x;
	Fri, 19 Jan 2024 03:13:13 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQfJd-004MZW-2o
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 03:13:11 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50e7d6565b5so358086e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jan 2024 19:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705633986; x=1706238786; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfU1RR3yVXE2aFjE6KuwO1NTsoIa0IOOIUzkc/YADig=;
        b=UsSktVnRaI+VN9xOtSHZfClTvDi6kXDT5505XhQoPEIPXizTAsC9qBnKG35np2LbKL
         zXfMZe7hzAfGg5CcANM2GmzwxNnSiV4/cf1w5DVWQItAkipj1gy9QaoWoNpJTTqbmLrv
         4SSBzJxD8dQrfKCj3uzWJ/YU2Do87JY736/rrxzlhPQ6ofV/Mu/PbPYwGYstIFORB+YG
         4bvbFK0l1NoSr/8841hButPuZN39ZS/UWrTFuedeVSA2q9mkkN1/im/82kPdA7QqdRX8
         LvfYxrmSby7/Aq2coWaB4ZfbkzIsVAlYncI6K6vwSMNG0gB09TZYvNLdhFbTKJNLeJ8R
         4oxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705633986; x=1706238786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfU1RR3yVXE2aFjE6KuwO1NTsoIa0IOOIUzkc/YADig=;
        b=TipPHGQJl4uSfu6xs+zBNqK+UMrJIYFsZ8cH26DR5uLaAHPkVH5P12BAzbNk3VlSCe
         N4VLmFDZpt0EsN7CXacJLUuxsARxi/jZPAojA26obXJ98jMeSwepmmC0FiQeCYzAjq1I
         q0RAAkBOIw+yzU3fd6AUlSRr8ZVMm7p4hfwrFhXAgT3NzpEBFIQxxXrdpWZkq4irMC/v
         Zn33q5lAu2SQSTRL5Ew8ZTGKnRu91EoZKp/xCOicY60gUW0Qgi2gFKp4KUYEVidoTjnE
         irWTTPMAkZ1zIam58TbO1VWoHAZ2sxZRaHbLMsUN/ph1pNdNj+HEQ4d6GcAqo6546D29
         so6w==
X-Gm-Message-State: AOJu0YwTozH6VGszyLpuw3WtnnjPcwwlY9Dr3B8jI1L/+QprYWWXbcsJ
	jxww+ZMv7e/AyngZPYwuS1VvQkCH3MGCs8+u5DIya8ci5Ftn8ftFI6w2SAXR7zzeo3y3FqGr6Up
	2kb1Qv7iv+qaS4MFtR+iWLJpM4q48kbv84Up44Q==
X-Google-Smtp-Source: AGHT+IE+iUkkY6fxTl1+JfpkYAQ0slyXdEkKVq40J5n5SU1ZLhag+ZXwroh2Z1WoXt0AjKQUbiW1WyNyUstIlFIKEPY=
X-Received: by 2002:ac2:41c9:0:b0:50e:314c:76da with SMTP id
 d9-20020ac241c9000000b0050e314c76damr265337lfi.82.1705633986292; Thu, 18 Jan
 2024 19:13:06 -0800 (PST)
MIME-Version: 1.0
References: <20240104123727.76987-2-ajones@ventanamicro.com>
 <CAAhSdy0SxZWdCHQVW0Bki+bHpg4qrHWV0aFzJq8V2xYtwsMWhw@mail.gmail.com> <ZalilFSHBa_XHolD@google.com>
In-Reply-To: <ZalilFSHBa_XHolD@google.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 19 Jan 2024 08:42:53 +0530
Message-ID: <CAK9=C2X4R+3F5Lh-f33dPVMkyGt+koXorfwMOmB-JnqSs79eQw@mail.gmail.com>
Subject: Re: [PATCH -fixes v2] RISC-V: KVM: Require HAVE_KVM
To: Sean Christopherson <seanjc@google.com>
Cc: Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-next@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, atishp@atishpatra.org, rdunlap@infradead.org, 
	sfr@canb.auug.org.au, alex@ghiti.fr, mpe@ellerman.id.au, npiggin@gmail.com, 
	linuxppc-dev@lists.ozlabs.org, pbonzini@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_191309_975047_4D6C774C 
X-CRM114-Status: GOOD (  12.87  )
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

T24gVGh1LCBKYW4gMTgsIDIwMjQgYXQgMTE6MTDigK9QTSBTZWFuIENocmlzdG9waGVyc29uIDxz
ZWFuamNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEphbiAxOCwgMjAyNCwgQW51cCBQ
YXRlbCB3cm90ZToKPiA+IE9uIFRodSwgSmFuIDQsIDIwMjQgYXQgNjowN+KAr1BNIEFuZHJldyBK
b25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBLVk0gcmVx
dWlyZXMgRVZFTlRGRCwgd2hpY2ggaXMgc2VsZWN0ZWQgYnkgSEFWRV9LVk0uIE90aGVyIEtWTQo+
ID4gPiBzdXBwb3J0aW5nIGFyY2hpdGVjdHVyZXMgc2VsZWN0IEhBVkVfS1ZNIGFuZCB0aGVuIHRo
ZWlyIEtWTQo+ID4gPiBLY29uZmlncyBlbnN1cmUgaXRzIHRoZXJlIHdpdGggYSBkZXBlbmRzIG9u
IEhBVkVfS1ZNLiBNYWtlIFJJU0NWCj4gPiA+IGNvbnNpc3RlbnQgd2l0aCB0aGF0IGFwcHJvYWNo
IHdoaWNoIGZpeGVzIGNvbmZpZ3Mgd2hpY2ggaGF2ZSBLVk0KPiA+ID4gYnV0IG5vdCBFVkVOVEZE
LCBhcyB3YXMgZGlzY292ZXJlZCB3aXRoIGEgcmFuZGNvbmZpZyB0ZXN0Lgo+ID4gPgo+ID4gPiBG
aXhlczogOTljZGM2YzE4YzJkICgiUklTQy1WOiBBZGQgaW5pdGlhbCBza2VsZXRhbCBLVk0gc3Vw
cG9ydCIpCj4gPiA+IFJlcG9ydGVkLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFk
Lm9yZz4KPiA+ID4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvNDQ5MDdjNmIt
YzViZC00ZTRhLWE5MjEtZTRkMzgyNTUzOWQ4QGluZnJhZGVhZC5vcmcvCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPgo+ID4gUXVl
dWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTYuOAo+Cj4gVGhhdCBzaG91bGQgYmUgdW5uZWNlc3Nh
cnkuICBDb21taXQgY2FhZGY4NzZiYjc0ICgiS1ZNOiBpbnRyb2R1Y2UgQ09ORklHX0tWTV9DT01N
T04iKSwKPiB3aGljaCBpcyBpbiBQYW9sbydzIHB1bGwgcmVxdWVzdCBmb3IgNi44LCBhZGRyZXNz
ZXMgdGhlIEVWRU5URkQgaXNzdWUuICBBbmQgdGhlCj4gcmVzdCBvZiBQYW9sbydzIHNlcmllc1sq
XSwgd2hpY2ggcHJlc3VtYWJseSB3aWxsIGdldCBxdWV1ZWQgZm9yIDYuOSwgZWxpbWluYXRlcwo+
IEhBVkVfS1ZNIGVudGlyZWx5Lgo+Cj4gWypdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI0MDEwODEyNDc0MC4xMTQ0NTMtNi1wYm9uemluaUByZWRoYXQuY29tCgpJIHdhcyBub3Qgc3Vy
ZSBhYm91dCB0aGUgdGltZWxpbmUgb2Ygd2hlbiBQYW9sbydzIHNlcmllcyB3b3VsZCBiZSBtZXJn
ZWQKaGVuY2UgdGhvdWdodCBvZiB0YWtpbmcgdGhpcyBwYXRjaCBhcyBhIGZpeC4KCkZvciBub3cs
IEkgd2lsbCBkcm9wIHRoaXMgcGF0Y2ggZnJvbSBteSBxdWV1ZS4gSWYgcmVxdWlyZWQgd2UgY2Fu
IGhhdmUgaXQKYXMgYSA2LjgtcmMgZml4LgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
