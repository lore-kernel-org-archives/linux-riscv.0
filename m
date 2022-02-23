Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5287C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 09:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OCALYrUv3fqqDayBe16Adac9g3eyo1s2XqXAaxChD0=; b=LblGxF9iZdQbKg
	nmg/TOqkkSxAcjRjtVgTZG7bzhPimfDMEh54UH8QmGg9hPvJ9l0l3RwN/IWRyA1E7MsP+//zF4Gop
	Lqt+gYvxFkdOk2jOGuETrLae/4KVuB9pDt7+cxHa/ocSyAdYBgWMARND9QMfFxblHZEDg2/smVieP
	jox0yqXsbb4fScNl17qtMLuO2U/AXfnP6qGUBzElWGRxIjGFDIbQnwe1L5A4I73X1jd6rb23X75nA
	4luOqzMy9y6g/5XfUIHFFDyWV9V36QBSiIlhoLzWI/zr7KtpZwMwboUuPU6Yu0EcB1RgxDfXb3DnW
	ZsFMjgoFQB/Q3UrXnoJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMnqw-00DTRY-H6; Wed, 23 Feb 2022 09:22:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMnqf-00DTNy-TN; Wed, 23 Feb 2022 09:22:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 412ADB80E5B;
 Wed, 23 Feb 2022 09:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBFB4C340E7;
 Wed, 23 Feb 2022 09:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645608131;
 bh=qr8aGN/GfpzREfWWEWfy67hMxOcd5xgEZdDkbd5B0Fc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fvP1S9ICDfQF8hCsfx1j5bfZ8MyW/1rG6leAkItXfaKKhotabi5LJfUSgdtHnAs1e
 e//NBoK00IXi9zTUjPv7rNpA1RU7H3GNLpb9V1grfG21006D6HV2Tb4+Qk5tLh0HIo
 Y8xDpIW1XwC917uzpPR1esP/YuSq+XHVf/PTy1JzpDjvNBh8Jh8OysgZZO5Bjpcj+Q
 EJYwG2Z8BOyrYZNJ4iSfk1NrfuQSK+S4t7xQPNsmD2s/GQ8tcuq/JigD7ZEI9VXG1f
 eljgFZP39JEv9+yiNsBLF4dJImtQrUvYwdNENxl33kkrfAUIOs6Dsce/NuZ/ym9xNY
 WkfVAuCjEyWQw==
Received: by mail-ua1-f41.google.com with SMTP id t25so1110930uaa.3;
 Wed, 23 Feb 2022 01:22:10 -0800 (PST)
X-Gm-Message-State: AOAM532bmw03pqC4DnbZquv3WpSqoGv+VAXBe3qGTpTH/uOyrv1zmGu1
 oH4n62tHjrEKpTC6L3EZg8tn+oXijtnNF9NbD5E=
X-Google-Smtp-Source: ABdhPJydckZxxdHIMfr4RcZ21Y/DNoqRFXVrN4eEPW4jdar5CY+FIz7J7onmSF87bCDroUCQYiJcpWM17ymdodrxxjk=
X-Received: by 2002:ab0:5543:0:b0:33c:9e1c:a30d with SMTP id
 u3-20020ab05543000000b0033c9e1ca30dmr11349278uaa.97.1645608129880; Wed, 23
 Feb 2022 01:22:09 -0800 (PST)
MIME-Version: 1.0
References: <20220201150545.1512822-14-guoren@kernel.org>
 <mhng-5c3b969c-9a23-48dc-ab10-a1addc6a5349@palmer-ri-x1c9>
In-Reply-To: <mhng-5c3b969c-9a23-48dc-ab10-a1addc6a5349@palmer-ri-x1c9>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 23 Feb 2022 17:21:59 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQd_5Ei9RDUg5uYAAjf0+idCqUtxdemb0CEMsxq7m3+UA@mail.gmail.com>
Message-ID: <CAJF2gTQd_5Ei9RDUg5uYAAjf0+idCqUtxdemb0CEMsxq7m3+UA@mail.gmail.com>
Subject: Re: [PATCH V5 13/21] riscv: compat: process: Add UXL_32 support in
 start_thread
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>, 
 Greg KH <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_012214_311193_A02755F1 
X-CRM114-Status: GOOD (  25.69  )
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

T24gV2VkLCBGZWIgMjMsIDIwMjIgYXQgOTo0MiBBTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRh
YmJlbHQuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgMDEgRmViIDIwMjIgMDc6MDU6MzcgUFNUICgt
MDgwMCksIGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+ID4gRnJvbTogR3VvIFJlbiA8Z3VvcmVu
QGxpbnV4LmFsaWJhYmEuY29tPgo+ID4KPiA+IElmIHRoZSBjdXJyZW50IHRhc2sgaXMgaW4gQ09N
UEFUIG1vZGUsIHNldCBTUl9VWExfMzIgaW4gc3RhdHVzIGZvcgo+ID4gcmV0dXJuaW5nIHVzZXJz
cGFjZS4gV2UgbmVlZCBDT05GSUcgX0NPTVBBVCB0byBwcmV2ZW50IGNvbXBpbGluZwo+ID4gZXJy
b3JzIHdpdGggcnYzMiBkZWZjb25maWcuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8
Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3Vv
cmVuQGtlcm5lbC5vcmc+Cj4gPiBDYzogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiA+
IENjOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPgo+ID4gLS0tCj4gPiAgYXJj
aC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jIHwgNSArKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJv
Y2Vzcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gPiBpbmRleCAwM2FjM2FhNjEx
ZjUuLjFhNjY2YWQyOTliNCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nl
c3MuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gPiBAQCAtOTcsNiAr
OTcsMTEgQEAgdm9pZCBzdGFydF90aHJlYWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVk
IGxvbmcgcGMsCj4gPiAgICAgICB9Cj4gPiAgICAgICByZWdzLT5lcGMgPSBwYzsKPiA+ICAgICAg
IHJlZ3MtPnNwID0gc3A7Cj4gPiArCj4gPiArI2lmZGVmIENPTkZJR19DT01QQVQKPiA+ICsgICAg
IGlmIChpc19jb21wYXRfdGFzaygpKQo+ID4gKyAgICAgICAgICAgICByZWdzLT5zdGF0dXMgfD0g
U1JfVVhMXzMyOwo+Cj4gTm90IHN1cmUgaWYgSSdtIGp1c3QgbWlzdW5kZXJzdGFuZGluZyB0aGUg
Yml0IG9wcyBoZXJlLCBidXQgYXJlbid0IHdlCj4gdHJ5aW5nIHRvIHNldCB0aGUgVVhMIGZpZWxk
IHRvIDEgKGZvciBVWEw9MzIpPyAgVGhhdCBzaG91bGQgYmUgYSBiaXQKPiBmaWVsZCBzZXQgb3As
IG5vdCBqdXN0IGFuIE9SLgpZb3UgYXJlIHJpZ2h0LCBJIHdvdWxkIG1vZGlmeSBsaWtlIHRoaXM6
CisgICAgIGlmIChpc19jb21wYXRfdGFzaygpKQorICAgICAgICAgICAgIHJlZ3MtPnN0YXR1cyA9
IO+8iHJlZ3MtPnN0YXR1cyAmIH5TUl9VWEwpIHwgU1JfVVhMXzMyOworICAgICBlbHNlCisuICAg
ICAgICAgICAgcmVncy0+c3RhdHVzID0g77yIcmVncy0+c3RhdHVzICYgflNSX1VYTCkgfCBTUl9V
WExfNjQ7CgoKPgo+ID4gKyNlbmRpZgo+ID4gIH0KPiA+Cj4gPiAgdm9pZCBmbHVzaF90aHJlYWQo
dm9pZCkKPgo+IEFkZGl0aW9uYWxseTogdGhpcyBpc24ndCByZWFsbHkgYW4gaXNzdWUgc28gbXVj
aCB3aXRoIHRoaXMgcGF0Y2gsIGJ1dCBpdAo+IGRvZXMgYnJpbmcgdXAgdGhhdCB3ZSdyZSByZWx5
aW5nIG9uIHNvbWVvbmUgZWxzZSB0byBoYXZlIHNldCBVWEw9NjQgb24KPiBDT05GSUdfQ09NUEFU
PW4gc3lzdGVtcy4gIEkgZG9uJ3Qgc2VlIHRoYXQgaW4gYW55IHNwZWMgYW55d2hlcmUsIHNvIHdl
Cj4gc2hvdWxkIHJlYWxseSBiZSBzZXR0aW5nIFVYTCBpbiBMaW51eCBmb3IgYWxsIHN5c3RlbXMg
KGllLCBub3QganVzdCB0aG9zZSB3aXRoCj4gQ09NUEFUPXkpLgoKCgotLSAKQmVzdCBSZWdhcmRz
CiBHdW8gUmVuCgpNTDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY3NreS8KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
