Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E811D2A543
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 19:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZH3QzyHSZ4QzNdCBDPMo+YFis3u3X6x5leyosZxzQhE=; b=riVKhKX13CrGpG
	dznkpQR/byqiaX9m0jYPi8tbWNz7JaILcQt37I0t5JSMAyCeMa82p6asiFwi7BhMKPIcBAzOU5l8+
	1d5cv4ArtWQktSJNAn2lyL6tnf/L85/R+tYEBJ89H2/3WOfv0kB64qhiKOY0eTwdC66OYZ7xhRHwC
	UNmIa55Oax/VQPm6etXOqyiZyQGsO6WYJl5H88RN6iQR5MSPvwUJTg84vUBWKHAYKyjSbWo7zIQ5C
	nizb26WJ81aPB/9tna3Wkk5UItDrQ165anmuXZJd5onBFyTtnVbEwHftF/7bJO+jovfIOAB03ZMfQ
	OARGNExzQGb1wLGTHOAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t19lf-0000000Cop1-1uph;
	Wed, 16 Oct 2024 19:33:11 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t19lc-0000000CooA-1r5p
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 19:33:09 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-6e1f48e7c18so2299377b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 12:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729107187; x=1729711987; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0/ojgL2fvBi172Wbp3BrgprcWdWI/pifihLOrfrqFU=;
        b=rLneQ7GjsS5MEGwGOHVwgetPKEFpPmpho//krfxP77Mfcre+6UlcEe/SQCKE97xar7
         YpLSxfFCrTk/Hy7QIyJnVEnqZGW/wsW5SufhEDJ5jdqUPn/x41QmgUP9hZS/Hbc7m9Sm
         4O8AfLGOjzb1r+8c05tPwx7SDIdfJXdfjKnw5BrjPFKEBfstuhLkQfPtZMQUwoCZtvBH
         erCVQrQ5Yq31oKVVupULmcaPLEx5NburCnjAgiJkI8Teix6bwCXI662fWssN0/N3UoNN
         NWRrjCyyfaK1V6wKIDt6Z+yB+sMtNYTEFoo+7+qDYV+a20RiYfDaQLTmTmWoaU37pKeC
         ny4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107187; x=1729711987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0/ojgL2fvBi172Wbp3BrgprcWdWI/pifihLOrfrqFU=;
        b=p9TTPRSEQG7vXDNwMjuVU15Uk5fKWnZkrs26BThtxorYcp2M9wZsNnY3VbWp/eIqUg
         4H4SUvMQ3hK7TgCrxmyjvsaFlXWflhsYbKNTFmsiUodVLK9VQ4hkaskfcx6/am5/Py7V
         58OCfoTOKfdwqQIzjTprqIggirwwRCcDqEqAFBuY5l/weR8tdeL0U8Wm1BL3NHAKTRLk
         AzKueEFMqDZTtWGsV8tO6oZRePiih2fGjejDoXCljGGv2TKkDt/urzJQF8MdJzeHCVyM
         EOqBKDLklFGoTeb+0wTCyeP+uM4PhR0SeiZYGxWTZnciPjQdYFEkx+TQ2itjsiJYcD6X
         21fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEwDac/KI+Z7NR/cJx2/Eq3u19fX5pDuuCaasg2GJEVzuG2PjGG6221Se8KxfXhxtec6Csyo66l5y1Ig==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRISWGlhudktIU8OnsVl/W5+orDx2JoMbElx4fEG5z9MTJDxNc
	ubnOKz+z2XLWF4ttl9E+WoUDVlw6LVJW+cUnEPIc2QAU4P3Xx8bkbuxqTK7nh5C7wpVbGvMGkVt
	/47w+o+G3Q0iidFGM0U3ymOXASDg+1C4wmkVc8w==
X-Google-Smtp-Source: AGHT+IGX07jif9j6w8MTv7ARHJ9/+lXGQIE504CDxiXkTKXqPtoikEAqB670DW1Rp7uFgjkSTFhaEJvJ5+tdTlNVD8w=
X-Received: by 2002:a05:690c:388:b0:6e2:e22:12d9 with SMTP id
 00721157ae682-6e3d41d08c3mr58083187b3.35.1729107187330; Wed, 16 Oct 2024
 12:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20241016155655.334518-1-colin.i.king@gmail.com> <CACRpkdYhsnRSOgdrDKp7BNqE4TpY3r--cPByFMsq0VRRjW-sAA@mail.gmail.com>
In-Reply-To: <CACRpkdYhsnRSOgdrDKp7BNqE4TpY3r--cPByFMsq0VRRjW-sAA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 21:32:55 +0200
Message-ID: <CACRpkdYxsGC5Yay0dOaQEegrLKKkLrcivX7_GVpfQsEa=psdDA@mail.gmail.com>
Subject: Re: [PATCH][next] pinctrl: th1520: Fix potential null pointer
 dereference on func
To: Colin Ian King <colin.i.king@gmail.com>, Kees Cook <kees@kernel.org>, 
	Kees Bakker <kees@ijzerbout.nl>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_123308_502237_AD8E38E9 
X-CRM114-Status: UNSURE (   9.07  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgOTozMeKAr1BNIExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4gT24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgNTo1NuKA
r1BNIENvbGluIElhbiBLaW5nIDxjb2xpbi5pLmtpbmdAZ21haWwuY29tPiB3cm90ZToKPgo+ID4g
VGhlIGluaXRpYWxpemF0aW9uIG9mIG11eHR5cGUgZGVmZXJlbmNlcyBwb2ludGVyIGZ1bmMgYmVm
b3JlIGZ1bmMKPiA+IGlzIHNhbml0eSBjaGVja2VkIHdpdGggYSBudWxsIHBvaW50ZXIgY2hlY2ss
IGhlbmNlIHdlIGhhdmUgYSBudWxsCj4gPiBwb2ludGVyIGRlZmVyZW5jZSBpc3N1ZS4gRml4IHRo
aXMgYnkgb25seSBkZWZlcmVuY2luZyBmdW5jIHdpdGgKPiA+IHRoZSBhc3NpZ25tZW50IHRvIG11
eHR5cGUgYWZ0ZXIgZnVuYyBoYXMgYmVlbiBudWxsIHBvaW50ZXIgY2hlY2tlZC4KPiA+Cj4gPiBG
aXhlczogMWZjMzBjZDkyNzcwICgicGluY3RybDogdGgxNTIwOiBGYWN0b3Igb3V0IGNhc3RzIikK
PiA+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5pLmtpbmdAZ21haWwuY29t
Pgo+Cj4gUGF0Y2ggYXBwbGllZCwgYWRkZWQgUmVwb3J0ZWQtYnkgS2VlcyBzaW5jZSBoZSBtYWls
ZWQgYWJvdXQgdGhpcyB0b28uCgouLi53aGljaCB3YXMgYWN0dWFsbHkgdGhlICJvdGhlciBLZWVz
IiAoQmFra2VyKSwgbm90IHRoZSBvbmUgdGhlIG1haWxlcgpzdWdnZXN0ZWQuCgpZb3VycywKTGlu
dXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
