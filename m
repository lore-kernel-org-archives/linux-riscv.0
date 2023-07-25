Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B694C04A6A
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 07:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZlcLnE0FN0otw6MKJzdu9heQXl//xKh4jyj6DZcHCA=; b=iAyIlDZ5ucZ0lM
	u2fJhdzpvGOClEO4GK50D49Pc/b2zkMuvoIVh51RDBj4Jg2u7dRXG20TSNqd5cmVvNCCfrLqHPcl+
	Z5JHd69CthC/sJ7joLey08h11uSfYjMHTV2MO8OGtz/jiTK+EOkWPTBTU3FOup40oYp+adDrBnJ3g
	I8GQOkcGRBmbk3ID+ucy76wNHjXBHHO+hUNoaeo6qpmeX7kqrR/eeTfaDqu4TpVLPviWKsB039Xqk
	3BzvffJO8qnJBKaZ1MIKFgJKGiWLip2bI1mQRK0RPUTbjyVqQz9/rFVYtWSPzh4L/Id7fD+JBYeJU
	arwwZvNPUlg17g/0AD+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOC9a-006X1k-0x;
	Tue, 25 Jul 2023 07:08:18 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOC9W-006X0c-3B
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 07:08:16 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31438512cafso4697607f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jul 2023 00:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690268893; x=1690873693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nemwt6odA/W6LAzXazKdN7X8FI/tGQtoSYxpSs1lg8c=;
        b=zWJ7gNOev2UK2JbtjZgRfPfqW0WArnCMDMvfXl8Yonl2R6MPL5/7DFkC3BGCcw82W2
         mGd/ShG6plEokjzXzt0/QOJoQIFzFH1z0dKLOgoWmY7IhSZTFc17xbJlvxGT0JbgFFTW
         r3wE232x+WJwcKlBZQ0GCrV1aj18OwIdCqeqOAnmEScGNlaU6viHri7P+FFW/cF0JE8Y
         l0N8flrR7Ko4pQzV1VwUlD4Ba2S5wBckSGhOTyrZ69xiBIUcMQPnBt3A2ATtNV+IMoa0
         SBveIjNOrybY5vtXxx9R3+VLB0d8GC4UdmjVuQfL0/4mO+KnApIPbMDDgBozjHcBX5uE
         wrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690268893; x=1690873693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nemwt6odA/W6LAzXazKdN7X8FI/tGQtoSYxpSs1lg8c=;
        b=KQEUM4qA73arYQlqBziY2PU/PmAeTPPCxoF/DpwTcCaLEOZiOhVksHOJ/kBeUs8JKX
         T738sPnGRVmKhGYa0f6ATmhaoMANraP8W/8DLB9oyJO1T4tcW4oQXPyD8qolLJcQMhgA
         MrUllPcAhIBTHwflWB5xH8wgEHFHiykB29I7mYQLfOZHXGRW6ki5Vw9Rk35IAfWRti34
         yx9Xjpf6D698T/P2DFFheS2KVtutbpr16p546azDeNXW+TLVsVaoqoRlhVQqZ1+h4bUm
         9QIuBA99rDuaEfAL8174/98M+qdVpK/cIybfiYgXDKnSfu3xeRNcaJWzEZcDAG5IMfMV
         5sAw==
X-Gm-Message-State: ABy/qLZbxUoIMifYcx/EsgqQPJMMouqu60mV9pn5AyZ7ujrpRWWblSxR
	sKvbKsOJfe4NPW4a7UB7Od4Jv9FU8wIe6IXQSohdNQ==
X-Google-Smtp-Source: APBJJlHOWVgAfvIWE3SwJNOHRN5kzve0ponjdSKN9AOGetzWhgHdBcNHiCtvHHaLdos5NlKV+C9CkHsTD+IMBIjKLQ8=
X-Received: by 2002:adf:ce8a:0:b0:317:5c18:f31d with SMTP id
 r10-20020adfce8a000000b003175c18f31dmr5125722wrn.35.1690268893182; Tue, 25
 Jul 2023 00:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230722123850.634544-1-alexghiti@rivosinc.com> <20230724-sanded-dental-c9125c76ad74@wendy>
In-Reply-To: <20230724-sanded-dental-c9125c76ad74@wendy>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 25 Jul 2023 09:08:01 +0200
Message-ID: <CAHVXubhiYT07L2ve2iEB5AZZdOgA0Sux8vDP4tMfdR6UTWuMgg@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] riscv: Introduce KASLR
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>, 
	Kees Cook <keescook@chromium.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_000815_025426_696D16AF 
X-CRM114-Status: GOOD (  16.86  )
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

T24gTW9uLCBKdWwgMjQsIDIwMjMgYXQgNDozMuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gSGV5IEFsZXgsCj4KPiBPbiBTYXQsIEp1bCAy
MiwgMjAyMyBhdCAwMjozODo0NVBNICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiBU
aGUgZm9sbG93aW5nIEtBU0xSIGltcGxlbWVudGF0aW9uIGFsbG93cyB0byByYW5kb21pemUgdGhl
IGtlcm5lbCBtYXBwaW5nOgo+ID4KPiA+IC0gdmlydHVhbGx5OiB3ZSBleHBlY3QgdGhlIGJvb3Rs
b2FkZXIgdG8gcHJvdmlkZSBhIHNlZWQgaW4gdGhlIGRldmljZS10cmVlCj4gPiAtIHBoeXNpY2Fs
bHk6IG9ubHkgaW1wbGVtZW50ZWQgaW4gdGhlIEVGSSBzdHViLCBpdCByZWxpZXMgb24gdGhlIGZp
cm13YXJlIHRvCj4gPiAgIHByb3ZpZGUgYSBzZWVkIHVzaW5nIEVGSV9STkdfUFJPVE9DT0wuIGFy
bTY0IGhhcyBhIHNpbWlsYXIgaW1wbGVtZW50YXRpb24KPiA+ICAgaGVuY2UgdGhlIHBhdGNoIDMg
ZmFjdG9yaXplcyBLQVNMUiByZWxhdGVkIGZ1bmN0aW9ucyBmb3IgcmlzY3YgdG8gdGFrZQo+ID4g
ICBhZHZhbnRhZ2UuCj4gPgo+ID4gVGhlIG5ldyB2aXJ0dWFsIGtlcm5lbCBsb2NhdGlvbiBpcyBs
aW1pdGVkIGJ5IHRoZSBlYXJseSBwYWdlIHRhYmxlIHRoYXQgb25seQo+ID4gaGFzIG9uZSBQVUQg
YW5kIHdpdGggdGhlIFBNRCBhbGlnbm1lbnQgY29uc3RyYWludCwgdGhlIGtlcm5lbCBjYW4gb25s
eSB0YWtlCj4gPiA8IDUxMiBwb3NpdGlvbnMuCj4KPiBJIGdhdmUgdGhpcyBhbGwgYSBnbyB0b2Rh
eSwgaXQgc2VlbXMgdG8gZG8gd2hhdCBpdCBpdCBzYXlzIG9uIHRoZSB0aW4sCj4gYW5kIGNyYXNo
aW5nIG15IGtlcm5lbCBkb2VzIGR1bXAgb3V0IGFuIG9mZnNldCBldGMuCj4KPiBUZXN0ZWQtYnk6
IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+CgpHcmVhdCwgdGhhbmtz
IGZvciB0ZXN0aW5nIQoKPgo+IEknbGwgaG9wZWZ1bGx5IGdldCBzb21lIHRpbWUgbGF0ZXIgaW4g
dGhlIHdlZWsgdG8gZ28gdGhyb3VnaCB0aGUgY29kZS4KCkkgd2lsbCBiZSBvbiBob2xpZGF5IGlu
IDMgd2Vla3MsIHlvdSBoYXZlIHNvbWUgdGltZSwgbm8gd29ycmllcyA6KQoKVGhhbmtzIGFnYWlu
LAoKQWxleAoKPgo+IENoZWVycywKPiBDb25vci4KPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
