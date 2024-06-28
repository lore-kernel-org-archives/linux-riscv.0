Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6DFC2BBCA
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 09:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vw9vX1j9nCzAmsz97W0tqYD0mWstupqwTRIyK7GeUgE=; b=0fs6e40Ta5SH+d
	UZYNpaeVOWbsrGWqkdOoZdEiRMnJuL+qK+Xqw0WJQ8w+Lnz6nyk8lMZrMCQ6wBKXB56RYNCENkyb2
	hbZpPqb9IL8AkXd4/7QYDvPQf+IzOSfSfERq3X4c8VyvriavLVYnFKZfAIZXG4Yf1Rb7yeDQnrblw
	BFFmkN/oe6ON6iqYVWh7Uftg11TwVDwXMxIjdsxnQkTWviXiYYl4V2QaQoEIVrIhmq5oFvwPcrjVn
	/Y82St0Np82b28FiGhHI1Tij3S317Diy1SKoRNmzmh/7/mpHH/6imjdcxbUU5ZPVcRMkcjPkLk1k4
	8USLrZPpca7W4QuRBshw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN7kg-0000000DEho-2Ksy;
	Fri, 28 Jun 2024 09:18:42 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN7kd-0000000DEhB-2BeH
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 09:18:41 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-57cd26347d3so459842a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 02:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719566317; x=1720171117; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4nRdrD3NJ1hYJ32BRxvgX77ACcWSuo5vSiMAPd1QEo=;
        b=qhwkbg7Ul5PbEti7DrKOx4j9n5J32wMzWVA21w4jg4YvTi3FQUsKYuOosfnRWL4pPy
         9RT1Kcu+kbe9raQW3Pc93P3vmr7oJsVqTDukpbBkd1DWcQDPVPoOC2m8YxTXHYJ14GoG
         swT2UZh0Rv9r2p5uCr6FgJsKBucJSMbJboTF2/6jQQCP8qIvyqGS4D4IxmNBLWbjMyth
         oXCwS4y+a62NSSpAL14Ka665pfbBuFdgESa4Tt6bme5n0pGOM/aCeh0PlqWq1whHlqiO
         sbN3K0QjLSSg7BE2C4cLugPd7xqFRt+g2sSlQKfpMpZoL5uXZICatFsPPf4elQR2l02V
         Baww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719566317; x=1720171117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4nRdrD3NJ1hYJ32BRxvgX77ACcWSuo5vSiMAPd1QEo=;
        b=sK3TNAvEfzkWzaHhqjFfW3BvSE3G+TQx3UtPlRGw6/UrAGjNeE72MhYxEpUdz0/f5P
         Gh6WG4/p9ZHPAp8KTOZWqgDPbzC5Lzb6bbdBszr5Stg6gjjIBOfObb46iZ1QZi9FbmY3
         OAmDo9OaJQAefhFgbqhSYjaJO5iTQDFSLyxoXFGNeEdSQhGPK7B9J+zLO6SvSb78Inqq
         JAMGAfRgsGKGT73J0bTCrBZ/XtKOGRolxnVbW0bjNF7Yvahfii0jjhFNJU5LcOj8ct1t
         /niLZW2yAfQuUPfqhb7zsqkTzXF+xzPYrCVl9IFXtnBl1HnHpnLX6UyCs8rqv8E3/gqW
         WO+w==
X-Gm-Message-State: AOJu0YzUn7TtnxTkcR4cl91e5u/saTayMQ+Nf8mV83JC5fEbnk3luHbx
	+LXAkgC0yg4MlXC0DhTLfv6bJ5KMFyU4pSlTWYMbWbU7y8SXtYoMZKlWswvJ0BjpcMUWUMP3lJP
	juSurC72QRxIN8CdEV4xj96POvq6f2w7+lnanoQ==
X-Google-Smtp-Source: AGHT+IHQJz049InCepkhc9kI7uFveWNYHnmaFhmkq0HnaP5qPMrwHzUEhWfGz6Royoe7qcT6s2kIKsKqsb8mkKgqVpA=
X-Received: by 2002:a17:906:9c87:b0:a72:7a71:7f59 with SMTP id
 a640c23a62f3a-a727a7180b9mr787751266b.57.1719566317015; Fri, 28 Jun 2024
 02:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240626171652.366415-1-jesse@rivosinc.com> <20240626171652.366415-2-jesse@rivosinc.com>
In-Reply-To: <20240626171652.366415-2-jesse@rivosinc.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 28 Jun 2024 11:18:25 +0200
Message-ID: <CAHVXubgUnHOQ4QF_sSYVD88W6Zuj32W3U9NSJ0Xzf9N36cqh6g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] RISC-V: pi: Add kernel/pi/pi.h
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Wende Tan <twd2.me@gmail.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Sami Tolvanen <samitolvanen@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Chen Jiahao <chenjiahao16@huawei.com>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_021839_774260_22077F9E 
X-CRM114-Status: GOOD (  19.77  )
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

SGkgSmVzc2UsCgpPbiBXZWQsIEp1biAyNiwgMjAyNCBhdCA3OjE34oCvUE0gSmVzc2UgVGF1YmUg
PGplc3NlQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBBZGQgcGkuaCBoZWFkZXIgZm9yIGRlY2xh
cmF0aW9ucyBvZiB0aGUga2VybmVsL3BpIHByZWZpeGVkIGZ1bmN0aW9ucwo+IGFuZCBhbnkgb3Ro
ZXIgcmVsYXRlZCBkZWNsYXJhdGlvbnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKZXNzZSBUYXViZSA8
amVzc2VAcml2b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9waS9jbWRsaW5l
X2Vhcmx5LmMgfCAxMCArKy0tLS0tLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3BpL2ZkdF9lYXJs
eS5jICAgICB8ICA3ICstLS0tLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvcGkvcGkuaCAgICAgICAg
ICAgIHwgMTcgKysrKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRp
b25zKCspLCAxNCBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yv
a2VybmVsL3BpL3BpLmgKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9waS9jbWRs
aW5lX2Vhcmx5LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9waS9jbWRsaW5lX2Vhcmx5LmMKPiBpbmRl
eCBmNmQ0ZGVkZmZiODQuLmZiY2RjOWU0ZTE0MyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tl
cm5lbC9waS9jbWRsaW5lX2Vhcmx5LmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9waS9jbWRs
aW5lX2Vhcmx5LmMKPiBAQCAtNiwxNSArNiw5IEBACj4gICNpbmNsdWRlIDxhc20vcGd0YWJsZS5o
Pgo+ICAjaW5jbHVkZSA8YXNtL3NldHVwLmg+Cj4KPiAtc3RhdGljIGNoYXIgZWFybHlfY21kbGlu
ZVtDT01NQU5EX0xJTkVfU0laRV07Cj4gKyNpbmNsdWRlICJwaS5oIgo+Cj4gLS8qCj4gLSAqIERl
Y2xhcmUgdGhlIGZ1bmN0aW9ucyB0aGF0IGFyZSBleHBvcnRlZCAoYnV0IHByZWZpeGVkKSBoZXJl
IHNvIHRoYXQgTExWTQo+IC0gKiBkb2VzIG5vdCBjb21wbGFpbiBpdCBsYWNrcyB0aGUgJ3N0YXRp
Yycga2V5d29yZCAod2hpY2gsIGlmIGFkZGVkLCBtYWtlcwo+IC0gKiBMTFZNIGNvbXBsYWluIGJl
Y2F1c2UgdGhlIGZ1bmN0aW9uIGlzIGFjdHVhbGx5IHVudXNlZCBpbiB0aGlzIGZpbGUpLgo+IC0g
Ki8KPiAtdTY0IHNldF9zYXRwX21vZGVfZnJvbV9jbWRsaW5lKHVpbnRwdHJfdCBkdGJfcGEpOwo+
IC1ib29sIHNldF9ub2thc2xyX2Zyb21fY21kbGluZSh1aW50cHRyX3QgZHRiX3BhKTsKPiArc3Rh
dGljIGNoYXIgZWFybHlfY21kbGluZVtDT01NQU5EX0xJTkVfU0laRV07Cj4KPiAgc3RhdGljIGNo
YXIgKmdldF9lYXJseV9jbWRsaW5lKHVpbnRwdHJfdCBkdGJfcGEpCj4gIHsKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvcGkvZmR0X2Vhcmx5LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9w
aS9mZHRfZWFybHkuYwo+IGluZGV4IDg5OTYxMGUwNDJhYi4uNDBlZTI5OTcwMmJmIDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3BpL2ZkdF9lYXJseS5jCj4gKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvcGkvZmR0X2Vhcmx5LmMKPiBAQCAtMywxMiArMyw3IEBACj4gICNpbmNsdWRlIDxs
aW51eC9pbml0Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9saWJmZHQuaD4KPgo+IC0vKgo+IC0gKiBE
ZWNsYXJlIHRoZSBmdW5jdGlvbnMgdGhhdCBhcmUgZXhwb3J0ZWQgKGJ1dCBwcmVmaXhlZCkgaGVy
ZSBzbyB0aGF0IExMVk0KPiAtICogZG9lcyBub3QgY29tcGxhaW4gaXQgbGFja3MgdGhlICdzdGF0
aWMnIGtleXdvcmQgKHdoaWNoLCBpZiBhZGRlZCwgbWFrZXMKPiAtICogTExWTSBjb21wbGFpbiBi
ZWNhdXNlIHRoZSBmdW5jdGlvbiBpcyBhY3R1YWxseSB1bnVzZWQgaW4gdGhpcyBmaWxlKS4KPiAt
ICovCj4gLXU2NCBnZXRfa2FzbHJfc2VlZCh1aW50cHRyX3QgZHRiX3BhKTsKPiArI2luY2x1ZGUg
InBpLmgiCj4KPiAgdTY0IGdldF9rYXNscl9zZWVkKHVpbnRwdHJfdCBkdGJfcGEpCj4gIHsKPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcGkvcGkuaCBiL2FyY2gvcmlzY3Yva2VybmVs
L3BpL3BpLmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNjVk
YTk5NDY2YmFmCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3BpL3Bp
LmgKPiBAQCAtMCwwICsxLDE3IEBACj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wICovCj4gKyNpZm5kZWYgX1JJU0NWX1BJX0hfCj4gKyNkZWZpbmUgX1JJU0NWX1BJX0hfCj4g
Kwo+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiArCj4gKy8qCj4gKyAqIFRoZSBmb2xvd2lu
ZyBmdW5jdGlvbnMgYXJlIGV4cG9ydGVkIChidXQgcHJlZml4ZWQpIGRlY2xhcmUgdGhlbSBoZXJl
IHNvCgpzL2ZvbG93aW5nL2ZvbGxvd2luZwoKQW5kIGl0IGxhY2tzIHNvbWV0aGluZyBiZXR3ZWVu
ICIoYnV0IHByZWZpeGVkKSIgYW5kICJkZWNsYXJlIjogd2hhdAp3YXMgd3Jvbmcgd2l0aCB0aGUg
aW5pdGlhbCBjb21tZW50PwoKPiArICogdGhhdCBMTFZNIGRvZXMgbm90IGNvbXBsYWluIGl0IGxh
Y2tzIHRoZSAnc3RhdGljJyBrZXl3b3JkICh3aGljaCwgaWYKPiArICogYWRkZWQsIG1ha2VzIExM
Vk0gY29tcGxhaW4gYmVjYXVzZSB0aGUgZnVuY3Rpb24gaXMgdW51c2VkKS4KPiArICovCj4gKwo+
ICt1NjQgZ2V0X2thc2xyX3NlZWQodWludHB0cl90IGR0Yl9wYSk7Cj4gK2Jvb2wgc2V0X25va2Fz
bHJfZnJvbV9jbWRsaW5lKHVpbnRwdHJfdCBkdGJfcGEpOwo+ICt1NjQgc2V0X3NhdHBfbW9kZV9m
cm9tX2NtZGxpbmUodWludHB0cl90IGR0Yl9wYSk7Cj4gKwo+ICsjZW5kaWYgLyogX1JJU0NWX1BJ
X0hfICovCj4gLS0KPiAyLjQ1LjIKPgoKU3VnZ2VzdGVkLWJ5OiBDaGFybGllIEplbmtpbnMgPGNo
YXJsaWVAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPgoKVGhhbmtzLAoKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
