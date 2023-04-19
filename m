Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B809C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 08:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQXCIMYNpJYXzTBGz8EUS87EGwYjclaNlN2TkanVSLk=; b=ZQMKKuwerdrlZu
	6k8R4zWP82tE9aJns3QfhDtzb5tuJiVo1TVuZjzK5DE/MCT/MCNWc976fz2FYUhtjQwjpkGBvoD8b
	DzoamaUlsle9OcsTsDDwi5TcP6rQKkpAUgZ9wDt9rzvC14mB/yTKl6WF4YtKrQ/MDAKrJ3BCKXOK7
	Jk5s4ipd63XEzAVGIn3uNU6NkrUZVyAWYNVm2jJPMekN7OfHY9gbvIC8WqhcHYTnpZgyt6SaP5Z7F
	FxhNdEo7oxwVgnzMOoKYXKtzOVtYDDqsLWfcNZkQhj/BO2n+tx2n00Zax5QzLi3ICJClPvB60IvSC
	Z8Pjmeyd7J8Lq9gREqIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp2qy-004XUG-1M;
	Wed, 19 Apr 2023 08:07:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp2qv-004XTU-1d
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 08:07:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8303463C40
	for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 08:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E839FC4339B
	for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 08:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681891663;
	bh=AXquwKy5LjLh7tSnRzd0VsL8D1TiNE1DyoFpIoSW6NA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oxMBS2EN9qZRCjsTeLRXPJUZlwlWXOEdR3Av9ztu1/YBhvrkDfqgGIxjl1dCAvORh
	 BURw4isKEl6NgsYBY7gUONzJqdjKH2ps8cKTdgm3DSmE1KM6ALWraK/WVTnq95X6PW
	 h3eST1bt0cnjFS1bntqGf4bDuWH1cw/Zcsod9qlUDrNG30hHlALE9s61m0Zsr1Iwfs
	 dJe2G5fQ+s5E8CxQXIgJwYFpZ65FTBnkILC06uHbimZUJKlDcDdKYL3kvDGNbM3M1o
	 P33crnvgNoA/9ljgEgHpkFee0AIanbMBOriBlscqIgj7GXmJhCP8ayuOtkN1jQlnC3
	 4JpmeDGcz7c4g==
Received: by mail-qv1-f51.google.com with SMTP id qh25so21631417qvb.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 01:07:43 -0700 (PDT)
X-Gm-Message-State: AAQBX9fZ3/HSKx5b7rEVTO0K6KaUBURPD7YJEU4QSmDjRaLQFCeAiB0B
	kokJzyaPY7UUE9vVfIztKEm0kHGO4K3/66iBfAw=
X-Google-Smtp-Source: AKy350bdQVlRWqsqeS6TRYbu0RmPCz51xkA13vrz1KtzyFZ8SBsJ/CulCVdIHrwUKbMaG/ei0H3CuUjCZH3hhJeLmF8=
X-Received: by 2002:a05:6214:d0d:b0:5b4:89b4:1af8 with SMTP id
 13-20020a0562140d0d00b005b489b41af8mr26907505qvh.16.1681891663014; Wed, 19
 Apr 2023 01:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <16007014-c5f2-4b07-baec-e19952236aa5@spud> <ZAbGSA6F0kfv9YYw@sunil-laptop>
 <E7FB4927-1FE6-435A-914E-9615C2AD9D34@kernel.org> <a9823561-2e32-49e8-b6c9-73e4b8f8cf8d@spud>
 <ZAfeaO52pnYhiyLN@sunil-laptop> <CAFiDJ58bRo6R1qOFaSSNgAdbQJZ3xDY6Wth-t8M8XKRFbig2hA@mail.gmail.com>
 <ZCvJpnNZYzrIcfPe@sunil-laptop> <CAHBxVyHA8ZouSUnqHaZTa=uMQxx61RqZuSBHx15Hg8+AVYLXZg@mail.gmail.com>
In-Reply-To: <CAHBxVyHA8ZouSUnqHaZTa=uMQxx61RqZuSBHx15Hg8+AVYLXZg@mail.gmail.com>
From: Ley Foon Tan <lftan@kernel.org>
Date: Wed, 19 Apr 2023 16:07:30 +0800
X-Gmail-Original-Message-ID: <CAFiDJ5-7qY2vQvbcTU7QPLmqrbCmXWkCxmswO4OqeYtsNOiOFw@mail.gmail.com>
Message-ID: <CAFiDJ5-7qY2vQvbcTU7QPLmqrbCmXWkCxmswO4OqeYtsNOiOFw@mail.gmail.com>
Subject: Re: [PATCH V3 00/20] Add basic ACPI support for RISC-V
To: Atish Kumar Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_010745_641279_313BEA48 
X-CRM114-Status: GOOD (  21.53  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Jonathan Corbet <corbet@lwn.net>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-doc@vger.kernel.org, Marc Zyngier <maz@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, llvm@lists.linux.dev, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv <linux-riscv@lists.infradead.org>, Andrew Jones <ajones@ventanamicro.com>, Thomas Gleixner <tglx@linutronix.de>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBcHIgNiwgMjAyMyBhdCAxMDo0NeKAr0FNIEF0aXNoIEt1bWFyIFBhdHJhIDxhdGlz
aHBAcml2b3NpbmMuY29tPiB3cm90ZToKPgoKPiA+ID4KPiA+ID4gSGkgU3VuaWwKPiA+ID4KPiA+
ID4gT25lIHF1ZXN0aW9uIHJlZ2FyZGluZyBQTVUgaW4gQUNQSSBmbG93Lgo+ID4gPgo+ID4gPiBX
ZSB1c2UgRFQgdG8gZGVjb2RlIHRoZSBzdXBwb3J0ZWQgSFBNIGNvdW50ZXJzL2V2ZW50cyBmb3Ig
dGhlCj4gPiA+IGRpZmZlcmVudCBwbGF0Zm9ybXMgbm93Lgo+ID4gPiBIb3cgZG8gd2UgZW5hYmxl
IFBNVSAoZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYykgd2hlbiB1c2luZyBBQ1BJIG1ldGhv
ZD8KPiA+ID4gTm90ZSwgdGhpcyBtaWdodCBiZSBpbiBzZXBhcmF0ZSBwYXRjaCBzZXJpZXMuCj4g
PiA+Cj4gPiBIaSBMYXkgRm9vbiwKPiA+Cj4gPiBUaGlzIGRyaXZlciB1c2VzIFNCSSBjYWxscyBh
bmQgaGVuY2Ugc2hvdWxkIHdvcmsgaW4gY2FzZSBvZiBBQ1BJIGFsc28uCj4gPgo+ID4gVGhlcmUg
aXMgb25lIG1pbm9yIGNoYW5nZSByZXF1aXJlZCBpbiB0aGlzIGRyaXZlciBmb3Igb3ZlcmZsb3cK
PiA+IGludGVycnVwdC4gSSBoYXZlIGEgcGF0Y2ggZm9yIHRoYXQgaW4gZnV0dXJlIHNlcmllcy4K
Pgo+IEp1c3QgdG8gYWRkIGZ1cnRoZXIgY2xhcmlmaWNhdGlvbjogT3BlblNCSSB3aWxsIGNvbnRp
bnVlIHRvIHVzZSB0aGUKPiBkZXZpY2UgdHJlZSBzbyB0aGF0Cj4gdGhlIGZpcm13YXJlIHdpbGwg
aGF2ZSBhY2Nlc3MgdG8gYWxsIHRoZSBQTVUgZGV0YWlscy4KPgpTb3JyeSBmb3IgdGhlIGxhdGUg
cmVwbHksIG1pc3NlZCBvdXQgb24gdGhpcyBlbWFpbCBpbiBteSBrZXJuZWwub3JnIG1haWxib3gu
CgpEbyB5b3UgbWVhbiBPcGVuU0JJIHN0aWxsIHVzaW5nIHRoZSBkZXZpY2UgdHJlZSwgYnV0IEVE
SyBJSSBhbmQgTGludXgKdXNpbmcgdGhlIEFDUEkgdGFibGU/IE5vcm1hbGx5IExpbnV4IHNob3Vs
ZG4ndCBtaXggYmV0d2VlbiBBQ1BJIGFuZApkZXZpY2UgdHJlZS4KClJlZ2FyZHMKTGV5IEZvb24K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
