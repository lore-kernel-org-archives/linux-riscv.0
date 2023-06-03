Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE7AC7EE24
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 21:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mgt/EAZAoQrqmi94XacgDdKWhwxshLpqB4l1ZKKurAA=; b=t3f1mNDAS5/Qp0
	WRjdAO0qCMfNUhQt0rZSG2diWakVmG7ByaBeffbcKTRbfgc0u040N9CPBEghGqosJdE2IrDcRre6U
	ce1dXrsq9uOOhA0cbN9rQqE33ILAxV0AlUKoav6MY5cPj14ff6Gc9Ifu3Uj2atuOJTu7c6l9yGtnb
	BgQjOKZPfaOCmzL2NMqkQPxkuzwUkD+55KZg+2fPrFr9683BkPYS1q79L+dlLyNxL194Cyu8vdLtm
	H3hYCP1vverYRXSj6arg55Hp7/OvCNoGRYnNIBN6xItwYs+qIWNPu57CyFMGTiLhOSbOvRAec5nkF
	XytnEEKOr5GMIdSe0jkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5YMT-00Abcc-04;
	Sat, 03 Jun 2023 21:00:33 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5YMP-00AbZR-0W
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jun 2023 21:00:31 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-75d4094f9baso65599485a.1
        for <linux-riscv@lists.infradead.org>; Sat, 03 Jun 2023 14:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685826023; x=1688418023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ChwqNHO4n4dQaIkmbrYTAbuxsb0lC0FfWkWbJO6tejQ=;
        b=VeUQ8P9h6V2oQUzyNVd2Pu3Epb210rRaSp6gpHPVimQvYzgUESWQnd6MJG1ZJZETjf
         6kpE/Jpz5XiqUdCDnYS2XhoAspvjh2Kn/fZZtCqsN2aviyCE1kEEMDk5BKi8prG8zXvz
         5SMK1zCH6bxrDS0MaCAHB1mgs8eAWs5r0qSEwCl3qaaFlGuxPppaKbbnk0Xi9S72R4KC
         2ICrayGS5nzIrGUAxrElGxB5HxdavqsiXPsjafaiJihKJkurQyH6yFwV1plvUnlsCiXZ
         trUexfi9WnZYQBczTb4MhBUyawbwWFMS6fNSEfRGXS5dJGnxFiQyvcsHqcV4lcJpiWnA
         1KEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685826023; x=1688418023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ChwqNHO4n4dQaIkmbrYTAbuxsb0lC0FfWkWbJO6tejQ=;
        b=gCNuC26Zpr6blkQ7kYXojsbxc+KUDf3yQqm0UwWrFxheG5d+PBMhJsCK/TivgDjH4T
         NDOhuvC/8oQSpfc2GXB11x3MTAGmXCuWL5mbHjngd+xztguOSpz0T1cfnQhY8lv/C4bG
         D7dEBdaTVwiHwdUI8KV5yCwj56agNZopsM4ay9aihpSruEQGFAuUYwKndII2P9lzx9oQ
         Eajcw2qrSKsAfREoNVTrewTIgWmg8uM2SuFpHGVFeMmRdnpUg877uJ1FCKSLpGZ0z2wk
         AXFsyvKBhmLaEpJ8FImINjSdz44p+P4umNm+ujkdJm/9Jl6DIoVOwbqGIW68MQVI1Fxp
         r94A==
X-Gm-Message-State: AC+VfDxQcYzCxuhRL0pvWlaTo6eOI5XXoRMfmUas64YwFQGKTlrp/2lz
	HwaPZYEr2B68Xv9PuqjvaCc3b3dcu1kKTvkbtQs=
X-Google-Smtp-Source: ACHHUZ6O6ocQPxrRPXRp56qxVt9JI6j/OmIasCsxVz7ZcWpqDycSCaZskg8m9gb0afNTySqEgIKd2BzUrcYw3LgVmmc=
X-Received: by 2002:a05:620a:4903:b0:75b:23a1:3651 with SMTP id
 ed3-20020a05620a490300b0075b23a13651mr18777415qkb.18.1685826022846; Sat, 03
 Jun 2023 14:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230602072755.7314-1-jiasheng@iscas.ac.cn> <202306040153.RPAlkz3U-lkp@intel.com>
In-Reply-To: <202306040153.RPAlkz3U-lkp@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Jun 2023 23:59:46 +0300
Message-ID: <CAHp75Ve2sQ1i9tOAzOxuBmiA0G5djY6yXcQ_-P9ux6vnOr+DvQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: sifive: Add missing check for platform_get_irq
To: kernel test robot <lkp@intel.com>
Cc: Jiasheng Jiang <jiasheng@iscas.ac.cn>, oe-kbuild-all@lists.linux.dev, 
	linus.walleij@linaro.org, brgl@bgdev.pl, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_140029_290241_63E8817D 
X-CRM114-Status: GOOD (  11.96  )
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

T24gU2F0LCBKdW4gMywgMjAyMyBhdCA4OjQ44oCvUE0ga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBp
bnRlbC5jb20+IHdyb3RlOgo+Cj4gSGkgSmlhc2hlbmcsCj4KPiBrZXJuZWwgdGVzdCByb2JvdCBu
b3RpY2VkIHRoZSBmb2xsb3dpbmcgYnVpbGQgd2FybmluZ3M6Cj4KPiBbYXV0byBidWlsZCB0ZXN0
IFdBUk5JTkcgb24gYnJnbC9ncGlvL2Zvci1uZXh0XQo+IFthbHNvIGJ1aWxkIHRlc3QgV0FSTklO
RyBvbiBsaW51cy9tYXN0ZXIgdjYuNC1yYzQgbmV4dC0yMDIzMDYwMl0KPiBbSWYgeW91ciBwYXRj
aCBpcyBhcHBsaWVkIHRvIHRoZSB3cm9uZyBnaXQgdHJlZSwga2luZGx5IGRyb3AgdXMgYSBub3Rl
Lgo+IEFuZCB3aGVuIHN1Ym1pdHRpbmcgcGF0Y2gsIHdlIHN1Z2dlc3QgdG8gdXNlICctLWJhc2Un
IGFzIGRvY3VtZW50ZWQgaW4KPiBodHRwczovL2dpdC1zY20uY29tL2RvY3MvZ2l0LWZvcm1hdC1w
YXRjaCNfYmFzZV90cmVlX2luZm9ybWF0aW9uXQo+Cj4gdXJsOiAgICBodHRwczovL2dpdGh1Yi5j
b20vaW50ZWwtbGFiLWxrcC9saW51eC9jb21taXRzL0ppYXNoZW5nLUppYW5nL2dwaW8tc2lmaXZl
LUFkZC1taXNzaW5nLWNoZWNrLWZvci1wbGF0Zm9ybV9nZXRfaXJxLzIwMjMwNjAyLTE1Mjg1Ngo+
IGJhc2U6ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
YnJnbC9saW51eC5naXQgZ3Bpby9mb3ItbmV4dAo+IHBhdGNoIGxpbms6ICAgIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvMjAyMzA2MDIwNzI3NTUuNzMxNC0xLWppYXNoZW5nJTQwaXNjYXMuYWMu
Y24KPiBwYXRjaCBzdWJqZWN0OiBbUEFUQ0ggdjJdIGdwaW86IHNpZml2ZTogQWRkIG1pc3Npbmcg
Y2hlY2sgZm9yIHBsYXRmb3JtX2dldF9pcnEKPiBjb25maWc6IG9wZW5yaXNjLXJhbmRjb25maWct
bTA0MS0yMDIzMDUzMSAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIw
MjMwNjA0LzIwMjMwNjA0MDE1My5SUEFsa3ozVS1sa3BAaW50ZWwuY29tL2NvbmZpZykKPiBjb21w
aWxlcjogb3Ixay1saW51eC1nY2MgKEdDQykgMTIuMy4wCj4KPiBJZiB5b3UgZml4IHRoZSBpc3N1
ZSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFnIHdoZXJlIGFwcGxpY2FibGUKPiB8IFJlcG9ydGVk
LWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiB8IENsb3NlczogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDIzMDYwNDAxNTMuUlBBbGt6M1UtbGtw
QGludGVsLmNvbS8KPgo+IHNtYXRjaCB3YXJuaW5nczoKPiBkcml2ZXJzL2dwaW8vZ3Bpby1zaWZp
dmUuYzoyMjYgc2lmaXZlX2dwaW9fcHJvYmUoKSB3YXJuOiB1bnNpZ25lZCAnY2hpcC0+aXJxX251
bWJlcltpXScgaXMgbmV2ZXIgbGVzcyB0aGFuIHplcm8uCgpOaWNlIQoKLi4uCgo+ICAgIDIyNCAg
ICAgICAgICBmb3IgKGkgPSAwOyBpIDwgbmdwaW87IGkrKykgewo+ICAgIDIyNSAgICAgICAgICAg
ICAgICAgIGNoaXAtPmlycV9udW1iZXJbaV0gPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIGkpOwo+
ICA+IDIyNiAgICAgICAgICAgICAgICAgIGlmIChjaGlwLT5pcnFfbnVtYmVyW2ldIDwgMCkKPiAg
ICAyMjcgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBjaGlwLT5pcnFfbnVtYmVyW2ld
OwoKU28sIHRoaXMgc2hvdWxkIGJlCgogIHJldCA9IC4uLgogIGlmIChyZXQgPCAwKQogICAgcmV0
dXJuIHJldDsKICBpcnFfbnVtYmVyID0gcmV0OwoKPiAgICAyMjggICAgICAgICAgfQoKCi0tIApX
aXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
