Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42769CDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 16:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pp81RmD1vhOV3minOjsIwbgXHwn0x1duGvIPLC7wPE8=; b=iUrzaZI8Z30dsf
	6hhDT4sGbljGsGN4HuRnspKyYmkqRPZaScEybLJvSUaAUqLn96wNpvW3btzu4oJ84RhDzm+lGZmcy
	pkBT3H0QCTuYx3Y/C6rlVoUmacl1h6UbEHnr+//GLLdO8IjAerFq/yC9WwbM/I5II9UUC5mDP/xeY
	v9FtAURioi96wjOCqlxaJhj6yzJpVKF2oJWOjXWDzDhzwgFu8AcP4LUN/v3/QwCnjhnKd1sVSAQc9
	hkcgwjt0V75+vYo6/mCKf9LV07745i7RdwWOJjT9MYmpnshixeBzHnTHCgGz8GrdYLbIV1maFpk7k
	gd/izGuD0DbZqnDwlTaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqymT-001Rsh-1L;
	Thu, 12 Oct 2023 16:43:25 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqymO-001RsA-2O
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 16:43:23 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2bff776fe0bso15168281fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Oct 2023 09:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697128996; x=1697733796; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7qfIgxU19HlWNa4yjrBNm+WFSuMXa6VIF64E0vH4/s=;
        b=QV7t4RUpQ/Gg4Vt2t3cKJub6c3ndRVKB9vuKtHP2RtBi9Fog319CtsM+nC0Vvbe1Af
         6EhyGFy6iKWz4idyR5gHCJnOnuJpaRe0p5nNOKZphKAMVnlO1ZUUKlOkxn68nl8sav2F
         ZsZWw7S/W04aeOKPHDgEeOFzLSCL4ZvOHH7zDL0LwMvIJZ/f8vdJEZ7yPQPVE74opBL0
         xXbZ5XJov2mM4nagIOWCLIXZkWZGmxliCdN63onrk/IWCOF3fRpRf7oe82K4TaVxroi9
         tuEcx6UpS45G79Y1Kder6Qd2HiGAccb59TvpoZCYJ0XanwwOEPufTAswg3yE5RxFd5z1
         j0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697128996; x=1697733796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7qfIgxU19HlWNa4yjrBNm+WFSuMXa6VIF64E0vH4/s=;
        b=dLY7C6fdX85divyKnoASX/2met5dTsGzMrlDRUoldzW3JqV+ABJIzfa6D9tMF0icFN
         L+lH5g9/sRv3tNdzOYdeclmxC4SVW+n/9UMa6dCC3GIhdm+G9rlZ7fA3PaIvSgx/K6+O
         Qa9RfSm0aSZiA8iObina0rj4YdoD7Ge7+h8VZLLKl1bIXchw0SKGZ7sNE0F6U1RdyTjs
         ZXuOkxPJXR26wO8XrRLaNSVpNRQDf2VxgYh8mOgG7uQ9TsBFdqrcLloZdRqNTZAv+kVK
         m5ngr6BLfZFUkAExIcHVNfdsLJ1KpmcXOqHE/zB71NgQJEhR5AXDK+adtiYIHBvI0MOQ
         YOvg==
X-Gm-Message-State: AOJu0YyZeHapSE4+kqmzbaB4hNwi1YlN9pmaT36wxYFV0QKvZ3gGrb42
	sbzXLzYH6AIOpAGgl1yspocvT+HR42i3jUG430vFjQ==
X-Google-Smtp-Source: AGHT+IF/4qDMijbqggnljNOQbJMe3EYKD8NOvpxdRUKv7h97Ea1XVF+8ZrPy0MkiR6n/P0S299iIKFiP+OxBhhpgMDM=
X-Received: by 2002:a2e:9644:0:b0:2bf:f6f6:9fd9 with SMTP id
 z4-20020a2e9644000000b002bff6f69fd9mr20567275ljh.0.1697128996495; Thu, 12 Oct
 2023 09:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231011135610.122850-8-ajones@ventanamicro.com>
 <20231011135610.122850-10-ajones@ventanamicro.com> <20231012-geologist-ramp-71c76a4305c7@spud>
 <20231012-3dc2e811d6a57ffe90719d2a@orel>
In-Reply-To: <20231012-3dc2e811d6a57ffe90719d2a@orel>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 12 Oct 2023 09:42:39 -0700
Message-ID: <CALs-HssbhmFhH6BRUs+B7rwab5KGGaZRC67jOTJL5XJ9EsFa8g@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] RISC-V: Move the hwprobe syscall to its own file
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, apatel@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_094320_778896_F575CBB8 
X-CRM114-Status: GOOD (  17.34  )
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

T24gVGh1LCBPY3QgMTIsIDIwMjMgYXQgOToxMeKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBPY3QgMTIsIDIwMjMgYXQgMDI6NDU6
MTRQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gT24gV2VkLCBPY3QgMTEsIDIwMjMg
YXQgMDM6NTY6MTNQTSArMDIwMCwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+ID4KPiA+ID4gKysrIGIv
YXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+ID4gPiBAQCAtMCwwICsxLDI3NiBAQAo+
ID4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+ID4gPiArLyoK
PiA+ID4gKyAqIFRoZSBod3Byb2JlIGludGVyZmFjZSwgZm9yIGFsbG93aW5nIHVzZXJzcGFjZSB0
byBwcm9iZSB0byBzZWUgd2hpY2ggZmVhdHVyZXMKPiA+ID4gKyAqIGFyZSBzdXBwb3J0ZWQgYnkg
dGhlIGhhcmR3YXJlLiAgU2VlIERvY3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QgZm9yIG1v
cmUKPiA+ID4gKyAqIGRldGFpbHMuCj4gPiA+ICsgKgo+ID4gPiArICogQ29weXJpZ2h0IChDKSAy
MDEyIFJlZ2VudHMgb2YgdGhlIFVuaXZlcnNpdHkgb2YgQ2FsaWZvcm5pYQo+ID4gPiArICogQ29w
eXJpZ2h0IChDKSAyMDE0IERhcml1cyBSYWQgPGRhcml1c0BibHVlc3BlYy5jb20+Cj4gPiA+ICsg
KiBDb3B5cmlnaHQgKEMpIDIwMTcgU2lGaXZlCj4gPgo+ID4gU28gdWgsIHRoaXMgaXMgYWxsIG5l
dyhpc2gpIGNvZGUsIG9yaWdpbmFsbHkgd3JpdHRlbiBsYXN0IFNlcHRlbWJlciwKPiA+IHRoYXQg
aXMgYmVpbmcgbW92ZWQsIHJpZ2h0Pwo+Cj4gWWVhaCwgSSBqdXN0IHB1bGxlZCB0aGUgQ29weXJp
Z2h0cyBvdmVyIGJ5IHN0YW5kYXJkIHByYWN0aWNlIG9mIGNvZGUKPiBtb3ZlbWVudCwgYnV0IEkg
YWdyZWUgdGhleSBkb24ndCBtYWtlIG11Y2ggc2Vuc2UgZm9yIHRoZSBjb2RlIEkgbW92ZWQuCj4g
SSBzdWNrIGF0IGNvcHlyaWdodCBtYW5hZ2VtZW50IGFuZCB3b3VsZCBiZSBoYXBweSBmb3Igc3Vn
Z2VzdGlvbnMgaGVyZS4KPiBJZiBSaXZvcyB3b3VsZCBsaWtlIHRvIHB1dCBvbmUgaGVyZSBmb3Ig
dGhlIHdvcmsgRXZhbiBkaWQsIHRoZW4gSSdsbCBiZQo+IGhhcHB5IHRvIGFkZCBpdC4gT3IsIGlm
IHBlb3BsZSBwcmVmZXIsIEkgY291bGQgYWRkIGEgVmVudGFuYSBjb3B5cmlnaHQuCgpJIHByb2Jh
Ymx5IHdvdWxkIGhhdmUgc3R1Y2sgYSBSaXZvcyBiYW5uZXIgb24gaXQgaWYgSSBoYWQgd3JpdHRl
biBpdAphcyBhIG5ldyBmaWxlIG15c2VsZiwgYXMgSSB0aGluayB0aGV5ICJvd24iIHRoZSB3b3Jr
IEkgZG8uIEJ1dCBpdCBhbGwgZmVlbHMKYSBiaXQgbGlrZSB2YW5pdHkgbGljZW5zZSBwbGF0ZXMg
Z2l2ZW4gaXQncyBHUEwsIHNvIEkgaW1hZ2luZSB3aGF0ZXZlcgp5b3UgZG8gd2lsbCBnZXQgbm8g
cmVhbCBjb21wbGFpbnRzLgoKCi1FdmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
