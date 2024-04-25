Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4857BC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 20:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hiCaE4FvYDgqBVQ4RBabHSmQNizLsgJ8S7E+8GwugD0=; b=VDQiykMrJd0gzh
	yJNJDXO8eXoXRf0v4/gqij3Vac3B7n5cOFk17G0lmpErYy9KenCuPSfiGVi45LXVsdncw3hQICu8h
	CZa0AnNv/G/cpyZYvyS+PM4ZtBsNyL4G1LinJxfUBgtRrs4Wlf24AB8vexCXEY1u/WnxeBAsmbKrH
	DuvQsOnLJl1WfsigrOCjXt+bTdvpNJVfqvU36kH/qh5ILUN1QbgXNfVZSuHqM6SAmC4/okrTR3VxQ
	wn4PHGRD/zJIcbs+cveW8/qTJpvRyImQEQ89K6IWj1ao269Toexxx5XySFB3OqnVYAg7+5th5vIgL
	mAtU+C3N1FqEZd8O3DOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s05bv-0000000A2xP-0dkM;
	Thu, 25 Apr 2024 20:22:27 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s05bs-0000000A2vd-06uK
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 20:22:25 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2d872102372so19288591fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2024 13:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1714076540; x=1714681340; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqqSigyROQSHlUq3V4XKgpMi7kpUzFBPzo0oPCMdIRM=;
        b=QJFO5xatDhOIuWAQoScXFhNrvnuQ+7exvEJty/YSnbfJeDnftEuhS5qPcSYaNOQgGF
         BA2E0NXQFMrbrV2piyKJi5gR0GB1ksFqgVB71iCFnjwNklOFRhqI184KPz+kLVnKLZoM
         +QYbliu6uWNUp+7lzgNFDPZyeDICHGAUFYy5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714076540; x=1714681340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqqSigyROQSHlUq3V4XKgpMi7kpUzFBPzo0oPCMdIRM=;
        b=jybeLYV0BeV+dfA60QuvzcJnrLCauFrKPH1T8GzOChhQjV89YSdBe/jkckGLAWOLXZ
         GM/S7P6XkIrQK3tmYGz/uStqM5s+zjdEYP2ZhjzDgBBhfwzfJ3agm133kTN1jN99ipRZ
         yMbec1ExeQED+bMrCPPF03bApdRC5ZFTL1aCUKg6ggidAyaBV1ewIJqMFliMlDUL/GEM
         aq6ZqoH67rtW5s9FeuKegC7RbElW2LX+AMHpoOoqj2tvWJjfxA8237i+lRPU1/zHbtGa
         fuzNJYgl7wHxfoGPLEIfS8ti14nVr684fo9FdCey7ypdAOwWq1BG8HlX/Uki+Ti7R2Bf
         Ku+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWB3GU6F6+PF03nQiMifGcJi5MEfYXYql0xCqQ2KCKywiW9HtB/RK/YYiw+Pd/6IDqE3ZbUJT+vSncrPbxn8t/WOcP+AAUKdUcFr7QfjWVp
X-Gm-Message-State: AOJu0YzMfUbfKUHcq5vO8qxW0+wngXM08CsCwPa1TpX6FHp1rlNy17B0
	8lN2StiqvGyWotqUuniTDrLcTH/+9AEt+XaZQBocxuBVFut6SKTTbGuiNvIzGEMkbptmdz3J8sV
	0++I4DMlPW5MovB6Vb9+55Gt9w8vr/L4BMkDj
X-Google-Smtp-Source: AGHT+IFAS0Vx6zJ8q71LCwUAqEEt2U8m/AKyfn45JERsHJeTEw6P8lopex0Wp1m7BwKSb0wEkMNTAMNCEUYMhcMmQ18=
X-Received: by 2002:a2e:2e15:0:b0:2d8:79d6:454d with SMTP id
 u21-20020a2e2e15000000b002d879d6454dmr242743lju.23.1714076539984; Thu, 25 Apr
 2024 13:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240425232933.4111680-1-atishp@rivosinc.com> <20240425232933.4111680-2-atishp@rivosinc.com>
 <d2742ee1-7e3c-4c0d-8172-d3543fe78e5e@sifive.com>
In-Reply-To: <d2742ee1-7e3c-4c0d-8172-d3543fe78e5e@sifive.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 25 Apr 2024 13:22:08 -0700
Message-ID: <CAOnJCUKtEZxK4TdL7G6zXBWDibFUwHMNz9cDcMMRT3p9jTrXkQ@mail.gmail.com>
Subject: Re: [kvm-riscv/for-next 1/2] drivers/perf: riscv: Remove the warning
 from stop function
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_132224_177308_0D0236EC 
X-CRM114-Status: GOOD (  20.67  )
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

T24gVGh1LCBBcHIgMjUsIDIwMjQgYXQgMTowOOKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IE9uIDIwMjQtMDQtMjUgNjoyOSBQTSwgQXRp
c2ggUGF0cmEgd3JvdGU6Cj4gPiBUaGUgd2FybmluZyBtZXNzYWdlIHdhcyBpbml0aWFsbHkgYWRk
ZWQganVzdCB0byBpbmRpY2F0ZSB0aGF0IGNvdW50ZXIKPiA+IHN0b3AgZnVuY3Rpb24gaXMgYmVp
bmcgY2FsbGVkIHdoaWxlIHRoZSBldmVudCBpcyBhbHJlYWR5IHN0b3BwZWQuCj4gPgo+ID4gSG93
ZXZlciwgd2UgdXBkYXRlIHRoZSBzdGF0ZSB0byBzdG9wcGVkIGNhc2Ugbm93IGluIGFuIG92ZXJm
bG93IGhhbmRsZXIKPiA+IGFmdGVyIHN0b3BwaW5nIHRoZSBjb3VudGVyLiBJZiB0aGVyZSBpcyBh
bm90aGVyIGNoaWxkIG92ZXJmbG93IGhhbmRsZXIKPiA+IGlzIHJlZ2lzdGVyZWQgKGUuZyBrdm0p
IGl0IG1heSBjYWxsIHN0b3AgYWdhaW4gd2hpY2ggd2lsbCB0cmlnZ2VyIHRoZQo+ID4gd2Fybmlu
Zy4KPiA+Cj4gPiBGaXhlcyA6IGNvbW1pdCAyMmY1ZGFjNDEwMDRkICgiZHJpdmVycy9wZXJmOiBy
aXNjdjogSW1wbGVtZW50IFNCSSBQTVUgc25hcHNob3QgZnVuY3Rpb24iKQo+Cj4gVGhpcyBtYXkg
YmUgaW50ZW50aW9uYWwsIHNpbmNlIHlvdSB3YW50ZWQgdGhlc2UgdG8gYmUgc3F1YXNoZWQsIGJ1
dCB0aGlzIGlzbid0Cj4gdGhlIHJpZ2h0IGZvcm1hdCBmb3IgYSBGaXhlczogdGFnIChubyBzcGFj
ZSBiZWZvcmUgIjoiIGFuZCBubyAiY29tbWl0IikuIE90aGVyd2lzZSwKPgoKWWVhaC4gSnVzdCB3
YW50ZWQgdG8gYmUgZXhwbGljaXQgYXMgdGhlIGNvbW1pdCBpcyBiYXNlZCBvbiBrdm0tcmlzY3YK
cXVldWUgYW5kIG5vdCBiYXNlZCBvbiB1cHN0cmVhbSBjb21taXQuCgo+IFJldmlld2VkLWJ5OiBT
YW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPgo+ID4gU2lnbmVkLW9m
Zi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gPiAtLS0KPiA+ICBkcml2
ZXJzL3BlcmYvcmlzY3ZfcG11LmMgfCAyIC0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRp
b25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXUuYyBiL2Ry
aXZlcnMvcGVyZi9yaXNjdl9wbXUuYwo+ID4gaW5kZXggMzZkMzQ4NzUzZDA1Li43OGM0OTBlMDUw
NWEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11LmMKPiA+ICsrKyBiL2Ry
aXZlcnMvcGVyZi9yaXNjdl9wbXUuYwo+ID4gQEAgLTE5MSw4ICsxOTEsNiBAQCB2b2lkIHJpc2N2
X3BtdV9zdG9wKHN0cnVjdCBwZXJmX2V2ZW50ICpldmVudCwgaW50IGZsYWdzKQo+ID4gICAgICAg
c3RydWN0IGh3X3BlcmZfZXZlbnQgKmh3YyA9ICZldmVudC0+aHc7Cj4gPiAgICAgICBzdHJ1Y3Qg
cmlzY3ZfcG11ICpydnBtdSA9IHRvX3Jpc2N2X3BtdShldmVudC0+cG11KTsKPiA+Cj4gPiAtICAg
ICBXQVJOX09OX09OQ0UoaHdjLT5zdGF0ZSAmIFBFUkZfSEVTX1NUT1BQRUQpOwo+ID4gLQo+ID4g
ICAgICAgaWYgKCEoaHdjLT5zdGF0ZSAmIFBFUkZfSEVTX1NUT1BQRUQpKSB7Cj4gPiAgICAgICAg
ICAgICAgIGlmIChydnBtdS0+Y3RyX3N0b3ApIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBy
dnBtdS0+Y3RyX3N0b3AoZXZlbnQsIDApOwo+CgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
