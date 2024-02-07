Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D67FC4828F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 15:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=anhKOUXtNYs5G+DaE2KSK6t6uey7CMiOUB20xjhLwmI=; b=aAVwwud6cbsOKX
	TqScXFnznhnTVIoRpphsPSAGkGbtxST+XoxqM7bR0LzKYcl/gcEvZRI9p5+6Z0fm4bsjITIzA2E+5
	JG2WyCN4t2oEbzYQzqUKRdgrm/sk7zE3kuIFfHUcjnaTRfRYFUEgJrEIHcc2+YlkUe3TUtuPAuyVY
	ZYrbgd67M9cHCg/oGMpXObLZg4PFf9Mg/Z7kjHDAAoaTR5ubdyuZoE9Wq0hbGx2vOiQUPwfUoctwY
	a31/wpTe3QAOF5AO4/S0MuaPI7dulSFTJ0hmm6aoszglKhsk35miEZICc8Oe9BWIFNOJ7EzyxWDeL
	+ybv/kUKd0O+dxX13E1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXkJd-0000000B9Wp-0hdv;
	Wed, 07 Feb 2024 15:58:25 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXkJa-0000000B9U8-3KN8
	for linux-riscv@lists.infradead.org;
	Wed, 07 Feb 2024 15:58:24 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-363ca193a7eso1720555ab.2
        for <linux-riscv@lists.infradead.org>; Wed, 07 Feb 2024 07:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1707321495; x=1707926295; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThW4UOydoSx884aXPLxWcHCPZYcLHmO6NwU0Jp/gx9M=;
        b=fF3McIxo//LkVkZ+IE6RwRtxNK3Ljr6eWj2spfxo01rnqStsKMMQM4lz8A4p6u+Pc0
         yMM4ra4YATTA0sZU6hrK6w2CpeGJEnuPf21CvEa36ZzvL1JgN5AUpBwcVjuOthK2Pskd
         QZgiMeyVqzFeptklWB1DBbjOTHQ0NyY3y/49wQzbBwr3x/JtUK03wHbRr2TMOd/Z7Pu9
         p6dXXi3YQvzxr2cGkcqda8+YXvBWX3cbbVlwzXLHW1i57gOWmLqj2MaT4o1zHggrFbJs
         2jldxAu/fKmXtNdjMncdzOhwvac4t4eODF84uRiaVoxOgbm9sc06IKa9ABSptjrQXhET
         xfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707321495; x=1707926295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThW4UOydoSx884aXPLxWcHCPZYcLHmO6NwU0Jp/gx9M=;
        b=DDKlor6YnrwYEWpiWya5e5BZuQ4veuXMst92oylun5HCPkG9HROJkHRd2ntq05Mekg
         bQRpG/Ic0ranEl6X4846pKJWenF2kAsw8JS/JIFpbOQuOfduAhdZnfNFO9Ux/CUrD2oI
         jPM2/kRGBUgfEBo47nxfjvHrHbtcePsQReGG+dxsi8gUmSOTFyrTqAYbXxatpgdCY6zh
         CeXJVIoqZ/C4odNffOx70sZ4bMn72aTc6nOTbCpJnag0IjdjFmaUt9ZPSgp4Us8hngu8
         i2rzaoRoT8OoGm9GNsvmCn9/DMHI/zrmUH90wNgMvuBlZwCo4g9O+Z7M2jfgcI5P+5DZ
         XwYA==
X-Forwarded-Encrypted: i=1; AJvYcCXPDKgAMRAiQFifukoVMH35ZZB0thzVWwk3kMP7Nsyy+2F1tKD91xbPs1CxWYBNBXJpXyZ993SPjE4Qn0gWbJGybjjWyuH6s31WvdMXQ5uw
X-Gm-Message-State: AOJu0Yy70JmBNLAYrb8sgNshERjlNIJkJkHuYWzgNLrBeCDb0IjyFgZJ
	7Zt38PtZ5Eps4IpEeekOz55R7PDUfaMj/+5pJnwK+fDSE3X6MmkEcE+ieWR/SHmz8rc8Dgkn/c8
	DM+TcaizjS5mDxzhAAGVxLbnQgM3vOIkmJGz2Pg==
X-Google-Smtp-Source: AGHT+IFCMccHnOQccdE1uuYts0EwIbRXGd1LC1MRLGFWoBZRBmKBJLB8KbPbNhmf/iNYEURqw+cqufs3Yf929+3A1QM=
X-Received: by 2002:a92:de4d:0:b0:363:c63a:7975 with SMTP id
 e13-20020a92de4d000000b00363c63a7975mr5867115ilr.24.1707321495246; Wed, 07
 Feb 2024 07:58:15 -0800 (PST)
MIME-Version: 1.0
References: <20240129072625.2837771-1-leyfoon.tan@starfivetech.com>
In-Reply-To: <20240129072625.2837771-1-leyfoon.tan@starfivetech.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 7 Feb 2024 21:28:02 +0530
Message-ID: <CAAhSdy2Hp9GeXFBYVNSCGDNaHjYQjCgj+kPQtOaGz6RQecoDbw@mail.gmail.com>
Subject: Re: [PATCH v2] clocksource: timer-riscv: Clear timer interrupt on
 timer initialization
To: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, atishp@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ley Foon Tan <lftan.linux@gmail.com>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_075823_038728_A0E8500C 
X-CRM114-Status: GOOD (  14.95  )
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

T24gTW9uLCBKYW4gMjksIDIwMjQgYXQgMToxMuKAr1BNIExleSBGb29uIFRhbgo8bGV5Zm9vbi50
YW5Ac3RhcmZpdmV0ZWNoLmNvbT4gd3JvdGU6Cj4KPiBJbiB0aGUgUklTQy1WIHNwZWNpZmljYXRp
b24sIHRoZSBzdGltZWNtcCByZWdpc3RlciBkb2Vzbid0IGhhdmUgYSBkZWZhdWx0Cj4gdmFsdWUu
IFRvIHByZXZlbnQgdGhlIHRpbWVyIGludGVycnVwdCBmcm9tIGJlaW5nIHRyaWdnZXJlZCBkdXJp
bmcgdGltZXIKPiBpbml0aWFsaXphdGlvbiwgY2xlYXIgdGhlIHRpbWVyIGludGVycnVwdCBieSB3
cml0aW5nIHN0aW1lY21wIHdpdGggYQo+IG1heGltdW0gdmFsdWUuCj4KPiBGaXhlczogOWY3YThm
ZjYzOTFmICgiUklTQy1WOiBQcmVmZXIgc3N0YyBleHRlbnNpb24gaWYgYXZhaWxhYmxlIikKPiBD
YzogIDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IExleSBGb29uIFRh
biA8bGV5Zm9vbi50YW5Ac3RhcmZpdmV0ZWNoLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51
cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCj4KPiAtLS0KPiB2
MjoKPiBSZXNvbHZlZCBjb21tZW50cyBmcm9tIEFudXAuCj4gLSBNb3ZlZCByaXNjdl9jbG9ja19l
dmVudF9zdG9wKCkgdG8gcmlzY3ZfdGltZXJfc3RhcnRpbmdfY3B1KCkuCj4gLSBBZGRlZCBGaXhl
cyB0YWcKPiAtLS0KPiAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIHwgMyArKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXIt
cmlzY3YuYwo+IGluZGV4IGU2NmRjYmQ2NjU2Ni4uNjcyNjY5ZWI3MjgxIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYwo+ICsrKyBiL2RyaXZlcnMvY2xvY2tz
b3VyY2UvdGltZXItcmlzY3YuYwo+IEBAIC0xMTYsNiArMTE2LDkgQEAgc3RhdGljIGludCByaXNj
dl90aW1lcl9zdGFydGluZ19jcHUodW5zaWduZWQgaW50IGNwdSkKPiAgICAgICAgICAgICAgICAg
Y2UtPnJhdGluZyA9IDQ1MDsKPiAgICAgICAgIGNsb2NrZXZlbnRzX2NvbmZpZ19hbmRfcmVnaXN0
ZXIoY2UsIHJpc2N2X3RpbWViYXNlLCAxMDAsIDB4N2ZmZmZmZmYpOwo+Cj4gKyAgICAgICAvKiBD
bGVhciB0aW1lciBpbnRlcnJ1cHQgKi8KPiArICAgICAgIHJpc2N2X2Nsb2NrX2V2ZW50X3N0b3Ao
KTsKPiArCj4gICAgICAgICBlbmFibGVfcGVyY3B1X2lycShyaXNjdl9jbG9ja19ldmVudF9pcnEs
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICBpcnFfZ2V0X3RyaWdnZXJfdHlwZShyaXNjdl9j
bG9ja19ldmVudF9pcnEpKTsKPiAgICAgICAgIHJldHVybiAwOwo+IC0tCj4gMi40My4wCj4KPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
