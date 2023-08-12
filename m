Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8051C001B0
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Aug 2023 00:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eF7IOHR5QRNDJdr5rbvfMO2XnNb9/XKJZTL06b4ns98=; b=V+yWjxomCZaGhm
	oBGKdLJYN0SZoB7UepZPqkozEoZ8rx74SFglYvz8pO0YcK4r/VT7DueggMyM6jmDCazsE5SrwBNSB
	frx3RY9gE+M43DLGq06ioa54evIFd3Rl4n4IOTki7KSipsVH4tgBz+wh3ZZziEmMlAMgWDzNRL9iZ
	ab0OGxn5t2sSUYKVFhfQ3ouHHSyxRrIGpqR+o95ke4mPwXk+xw8w8r2j9UQnLKbscJfkkH31Evig1
	12N1lIduSCmpn37Jw0QboxmpO8ChkSeUXBusGdHJdtSAo2cdA6AVFUWxcEzaO48BEkNRsKcwmDKPl
	CNYEiudh7PK/4CzS1Emw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUcQl-00C65O-1V;
	Sat, 12 Aug 2023 00:24:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUcQf-00C639-1G
	for linux-riscv@lists.infradead.org;
	Sat, 12 Aug 2023 00:24:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9E04466C08
	for <linux-riscv@lists.infradead.org>; Sat, 12 Aug 2023 00:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870BEC433B6
	for <linux-riscv@lists.infradead.org>; Sat, 12 Aug 2023 00:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691799867;
	bh=jhgYu8MJh1qa3T7KkFqRcAa6o5bbnrkYuVvKruWBUmw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SHX/Je8TBmBEQyq5tvyzKwN44lRflfAmfGdV+8nG0SGW87vcz68BvPXuwcEfSrfoa
	 UJGJm03DegglVeohu68ot9KYVyyHv6DC+icq2mPV5iFdaALUqmND4uxCPJM75Mi8iH
	 2vF/FJ82RrII72tI/KAf3ioQ/5FoZHYjobpDFbe8obvlyARMwlUhflHwehTZ+WskOB
	 hjgDsA66T/XdyYvLq7c9lP1/ukpHIMYKCGGmOuYahNSB8e1lQqNqudYxs0L0NN9UoQ
	 1SglrDdWx6yrrHAu9ywlwpnV3zCMu6oYQjAcw5bpQ/mIO7CzdDCTAGH4wMsKSBFfP5
	 ktKhWxf9LKQag==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-52340d9187aso3186260a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 17:24:27 -0700 (PDT)
X-Gm-Message-State: AOJu0YxIs87jKOHf8Tybst+5NeJE97uprgKiZi0MhxpS9m0j6AriWf85
	hM1bVq+dLImDbrZipYzs9NIVvOeIlD2my8l5PPs=
X-Google-Smtp-Source: AGHT+IEqaTqaAtAhCmcGnNvIeNuoOUng8kNkaL94dQUaCSqUdRXJ4J/UpnpZeNm/RT3qQaiZQWX91614H1XSKE3q1F4=
X-Received: by 2002:a50:ed06:0:b0:523:10fa:e132 with SMTP id
 j6-20020a50ed06000000b0052310fae132mr2789289eds.23.1691799865757; Fri, 11 Aug
 2023 17:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230802164701.192791-1-guoren@kernel.org> <20230802164701.192791-19-guoren@kernel.org>
 <5cf1117c-d537-703c-cdcf-f43c5bd9ed1b@redhat.com>
In-Reply-To: <5cf1117c-d537-703c-cdcf-f43c5bd9ed1b@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 12 Aug 2023 08:24:11 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ6zJrcyOVCqF+xDXTEzFYUVQuTP0rKy=K6R99TQ05CrA@mail.gmail.com>
Message-ID: <CAJF2gTQ6zJrcyOVCqF+xDXTEzFYUVQuTP0rKy=K6R99TQ05CrA@mail.gmail.com>
Subject: Re: [PATCH V10 18/19] locking/qspinlock: Move pv_ops into x86 directory
To: Waiman Long <longman@redhat.com>
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org, 
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com, boqun.feng@gmail.com, 
	tglx@linutronix.de, paulmck@kernel.org, rostedt@goodmis.org, 
	rdunlap@infradead.org, catalin.marinas@arm.com, conor.dooley@microchip.com, 
	xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, alexghiti@rivosinc.com, 
	keescook@chromium.org, greentime.hu@sifive.com, ajones@ventanamicro.com, 
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn, 
	linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-csky@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_172429_473058_CB2FBD41 
X-CRM114-Status: GOOD (  13.29  )
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

T24gU2F0LCBBdWcgMTIsIDIwMjMgYXQgNDo0MuKAr0FNIFdhaW1hbiBMb25nIDxsb25nbWFuQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gOC8yLzIzIDEyOjQ3LCBndW9yZW5Aa2VybmVsLm9yZyB3
cm90ZToKPiA+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+Cj4g
PiBUaGUgcHZfb3BzIGJlbG9uZ3MgdG8geDg2IGN1c3RvbSBpbmZyYXN0cnVjdHVyZSBhbmQgY2xl
YW5zIHVwIHRoZQo+ID4gY25hX2NvbmZpZ3VyZV9zcGluX2xvY2tfc2xvd3BhdGgoKSB3aXRoIHN0
YW5kYXJkIGNvZGUuIFRoaXMgaXMKPiA+IHByZXBhcmF0aW9uIGZvciByaXNjdiBzdXBwb3J0IENO
QSBxc3BvaW5sb2NrLgo+Cj4gQ05BIHFzcGlubG9jayBoYXMgbm90IGJlZW4gbWVyZ2VkIGludG8g
bWFpbmxpbmUgeWV0LiBJIHdpbGwgc3VnZ2VzdCB5b3UKPiBkcm9wIHRoZSBsYXN0IDIgcGF0Y2hl
cyBmb3Igbm93LiBPZiBjb3Vyc2UsIHlvdSBjYW4gcHJvdmlkZSBiZW5jaG1hcmsKPiBkYXRhIHRv
IGJvb3N0IHRoZSBjYXNlIGZvciB0aGUgaW5jbHVzaW9uIG9mIHRoZSBDTkEgcXNwaW5sb2NrIHBh
dGNoIGludG8KPiB0aGUgbWFpbmxpbmUuClllcywgbXkgbGF6eSwgSSB3b3VsZCBzZXBhcmF0ZSBw
YXJhdmlydCBhbmQgQ05BIGZyb20gdGhpcyBzZXJpZXMuCgo+Cj4gQ2hlZXJzLAo+IExvbmdtYW4K
PgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
