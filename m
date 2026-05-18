Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99555CD4F4A
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 21:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/vmM/0V+dMnZhN0Q5/sDH+M/kd1DvFsZ6zD0If1gCdE=; b=UuEoxkrskmDsbq
	vOakAfdUWya6V60MJtKzKlFxXAVPwdNnfOdASsN687GdEq/J9itCSH+VBBRFe6tRAuD0HFOErgF9j
	W0N4o3/ro2O9u7ygEzLCES8ihIMutCqF3B5wjnwbxiQOQ0+7oMSaRQbmFS4kqK5VQf7jLcvswYtcv
	jMq1JeKMm157Mtc7CgH10jmsf06br3Fx7PkaCbDktzMlQopAPE+beii20CFXh+w/TVXcb6tmPti6P
	MiL194ChV5IxIeI6q3asFI0SNx36G/VWlI75VkJeWSJExY9vvNLUiP3Jdpfe138tRubcJQCMvl0Cu
	BgB+XRlStx+xDqzlVq7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5P1-0000000Gyvn-3Oli;
	Mon, 18 May 2026 21:21:31 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5Oz-0000000Gyua-36q1
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 21:21:30 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-67c1e0229acso4636985a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 14:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779139287; cv=none;
        d=google.com; s=arc-20240605;
        b=DAsE1OvGgMIBSLJb9B5TjXhT+zCJANn8GNXypLWcnhpmCpHe9gF+ttY+OJrn81aYCh
         BMeU548QPnyzmSX72fc96cSxYg56TsHHLBqygP/lP6n1VF1ALWZ2GhS5RhpT/SxogGCs
         cgMigDVjLu6ND3q2KUg0cOF2g6X0pOFFdLTxdHzysw31Byid7vqNvgUjGfpKeuDmyLue
         gi37V2QKejLyfyM8jyR6ZDiyggWjEoSbluA5c+3DFJGMpK3TpuGXDuG3b0JIFSMw9F0I
         9DDzsJurK1uw3rUNCFLrAkV2tr3JLsIah5BtNPRVEq5GWrZdOj8kxOs+Ybhsz5lmyfHZ
         3fQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EsFks/IQaK5zPrUgVquMlDUWIMq4vDiBKG2waN9CznQ=;
        fh=YihPNi8zaLAh2arQ6GXpBaFQKGC/FVaUryR5kWFb8hA=;
        b=bUOx9jqtnYZlBNmEdwmRh//aemyb3ILDR5WEtvVpc3RDVxX4nT1I8ppyK9t+H3CCBo
         wYLCjhK7/8+Yi7yPNvjswu2rs3rPVysgwXKVlTEMZLOJZxrEZLrwuwpIzgmveCNGUbd+
         qKSdHa8DDZUocJMQZCV5/izyK4Y23Y5Vd+312fxM7ydRr79Y+aZb9WZftzBvafLBbC+Z
         8YqxnDAVr7us5okMS5KmiQCcZuNZyoU+Y7DQpfUUhBLtiBXuqNLbO9oTWYzrsKLqfsUu
         5jeC802HBm2i3Qwmw8XEFU1lQmAmKXxpAZAqv+dF5qNQPQS/CRBH9640E5OPmK6TyMTz
         VKkg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779139287; x=1779744087; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EsFks/IQaK5zPrUgVquMlDUWIMq4vDiBKG2waN9CznQ=;
        b=rBtUJzjAGe8SlkxmEcmk4no6wsIfJg7VB4wdHe26/8NfNiQZjQjSouXVlDrkuWKex0
         sALvLvFj9yzCYXtSP3zr0UCMLhEm2V6RoQeDUacwHIcS4ge4W+4/SCYsrjvIVc+y0eIP
         xPWCONgTlOFoglawYb04eSsLbSV9MeyNV5sSHEQ1ozspMDgMfKpmCZ0os576sq3NCntM
         mXodrIBZ/eBrfhARawJH780yn53nyka1ihCAkDkIIi2oNMWJRO0Laz9JG/jD4B8PSSQq
         /T5Qw9cUTJIB2iu2z/ZB6KYaTYDaEZes7LfUq4JO4PS/23BT3xE6HG73n9TyMjzp9kx0
         b8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779139287; x=1779744087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EsFks/IQaK5zPrUgVquMlDUWIMq4vDiBKG2waN9CznQ=;
        b=Cn0aOzNiHKAHxw5YR539smSxZ8nSIdcWBkWJ1V5eXorRQ+RvZacBWelbdbQe762RAx
         Al2FRM5Bh3LuYNKsm4/NPE4xggO1fA23c/jE9524cw9xqbsNZso5rf8F/N+S8wln8kAp
         XGzhevcJrgC2AQoKAP8GRUiJDI0fVzyNjrcPEhXergCIMlyPxC6OInNEPw35tbeZYbtP
         T+g+6C+uwLT4LN69/+DSWp1cm5cwFZrQiAppuOK2lnvPc24ZIA/R/KMTTovOoZH+VpxR
         kyAbnuPGRolQkcQ12P5DIYE6erAtenqgp5rCT2wGi7hBBat4JlC4FyFStK9k3N9JyXPv
         Rlsw==
X-Forwarded-Encrypted: i=1; AFNElJ+JFy+7WeKE7TH4kEBFBxNq9MvRJgiRBg5tAZ/b6GMStw/TrsKAft/2zQ9tvRh9HxmChFlrnnTgrO79MA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNBZYN6YHbNmdsjV2HSkoH6bSn7RiDNsKho54WVur+BgasCDpu
	sSF5FrZinX6SCu7nva/oNqV6oXje/y3IavDka5WDew4oNrkfXYcDRIySDfTxXbw/JKxzPpb56lk
	SlR38aQTZ1r5a5pKR6zkFvLNgnU4ZdJ0=
X-Gm-Gg: Acq92OEgUuWWkZKbOBSn+Cgr8hkRu31kP5mzXEzPe4ssNFTfTnSF8+vasiYWEo5oFQr
	tvt5nGD81+2s8qr8/MC1tRBuWHUbcFoUNc59BPlU52fmyT7PRWqaw7LFJefQavJHxMuoByAtmBf
	tAbvt56r6nvn2PSmbFvOS3NK3sf7ODVDteJU8X6eah9aHdfeIdfhEFMJ4GIctOQjVposeiVAYYC
	TUoTJvK8G3rgXEVM5GHqSUAjAMKCguTzSpQ26+RONa6ovSxI1JnvareJg6S4B9FZdTFLmdjmGqP
	V3N5whU=
X-Received: by 2002:aa7:d315:0:b0:683:6705:6e09 with SMTP id
 4fb4d7f45d1cf-683bd38d823mr5757913a12.13.1779139286945; Mon, 18 May 2026
 14:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
From: Yang Shi <shy828301@gmail.com>
Date: Mon, 18 May 2026 14:21:14 -0700
X-Gm-Features: AVHnY4JdohddXKx4c8RBQ6M1uUtTSitdJHlU74cl49fvebK4jjJ2w6iuf3X83y8
Message-ID: <CAHbLzkrOSoh-jmR=uaNvx73n_wn+vExoKY0UzH5zGcfdAiDbNg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Barry Song <baohua@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, surenb@google.com, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, jack@suse.cz, 
	pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, 
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com, 
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Nanzhe Zhao <nzzhao@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_142129_809039_3ADC2B5D 
X-CRM114-Status: GOOD (  50.02  )
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

T24gU3VuLCBNYXkgMTcsIDIwMjYgYXQgMTo0NeKAr0FNIEJhcnJ5IFNvbmcgPGJhb2h1YUBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFNhdCwgTWF5IDIsIDIwMjYgYXQgMTo1OOKAr0FNIE1hdHRo
ZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBTYXQsIE1h
eSAwMiwgMjAyNiBhdCAwMTo0NDozNEFNICswODAwLCBCYXJyeSBTb25nIHdyb3RlOgo+ID4gPiBP
biBGcmksIE1heSAxLCAyMDI2IGF0IDEwOjU34oCvUE0gTWF0dGhldyBXaWxjb3ggPHdpbGx5QGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gRnJpLCBNYXkgMDEsIDIwMjYg
YXQgMDY6NDk6NThBTSArMDgwMCwgQmFycnkgU29uZyB3cm90ZToKPiA+ID4gPiA+IDEuIFRoZXJl
IGlzIG5vIGRldGVybWluaXN0aWMgbGF0ZW5jeSBmb3IgSS9PIGNvbXBsZXRpb24uIEl0IGRlcGVu
ZHMgb24KPiA+ID4gPiA+IGJvdGggdGhlIGhhcmR3YXJlIGFuZCB0aGUgc29mdHdhcmUgc3RhY2sg
KGJpby9yZXF1ZXN0IHF1ZXVlcyBhbmQgdGhlCj4gPiA+ID4gPiBibG9jayBzY2hlZHVsZXIpLiBT
b21ldGltZXMgdGhlIGxhdGVuY3kgaXMgc2hvcnQ7IGF0IG90aGVyIHRpbWVzIGl0IGNhbgo+ID4g
PiA+ID4gYmUgcXVpdGUgbG9uZy4gSW4gc3VjaCBjYXNlcywgYSBoaWdoLXByaW9yaXR5IHRocmVh
ZCBwZXJmb3JtaW5nIG9wZXJhdGlvbnMKPiA+ID4gPiA+IHN1Y2ggYXMgbXByb3RlY3QsIHVubWFw
LCBwcmN0bF9zZXRfdm1hLCBvciBtYWR2aXNlIG1heSBiZSBmb3JjZWQgdG8gd2FpdAo+ID4gPiA+
ID4gZm9yIGFuIHVucHJlZGljdGFibGUgYW1vdW50IG9mIHRpbWUuCj4gPiA+ID4KPiA+ID4gPiBC
dXQgZG9lcyB0aGF0IGFjdHVhbGx5IGhhcHBlbj8gIEkgZmluZCBpdCBoYXJkIHRvIGJlbGlldmUg
dGhhdCB0aHJlYWQgQQo+ID4gPiA+IHVubWFwcyBhIFZNQSB3aGlsZSB0aHJlYWQgQiBpcyBpbiB0
aGUgbWlkZGxlIG9mIHRha2luZyBhIHBhZ2UgZmF1bHQgaW4KPiA+ID4gPiB0aGF0IHNhbWUgVk1B
LiAgbXByb3RlY3QoKSBhbmQgbWFkdmlzZSgpIGFyZSBtb3JlIGxpa2VseSB0byBoYXBwZW4sIGJ1
dAo+ID4gPiA+IGl0IHN0aWxsIHNlZW1zIHJlYWxseSB1bmxpa2VseSB0byBtZS4KPiA+ID4KPiA+
ID4gSXQgZG9lc27igJl0IGhhdmUgdG8gaW52b2x2ZSB1bm1hcHBpbmcgb3IgYXBwbHlpbmcgbXBy
b3RlY3QgdG8KPiA+ID4gdGhlIGVudGlyZSBWTUHigJRqdXN0IGEgcG9ydGlvbiBvZiBpdCBpcyBz
dWZmaWNpZW50Lgo+ID4KPiA+IFllcywgYnV0IHRoYXQgc3RpbGwgZmFpbHMgdG8gYW5zd2VyICJk
b2VzIHRoaXMgYWN0dWFsbHkgaGFwcGVuIi4gIEhvdyBtdWNoCj4gPiBwZXJmb3JtYW5jZSBpcyBh
bGwgdGhpcyBjb21wbGV4aXR5IGluIHRoZSBwYWdlIGZhdWx0IGhhbmRsZXIgYnV5aW5nIHVzPwo+
ID4gSWYgeW91IGRvbid0IGFuc3dlciB0aGlzIHF1ZXN0aW9uLCBJJ20ganVzdCBnb2luZyB0byBn
byBpbiBhbmQgcmlwIGl0Cj4gPiBhbGwgb3V0Lgo+ID4KPgo+IEhpIE1hdHRoZXcgKGFuZCBMb3Jl
bnpvLCBKYW4sIGFuZCBhbnlvbmUgZWxzZSB3aG8gbWF5IGJlCj4gd2FpdGluZyBmb3IgYW5zd2Vy
cyksCj4KPiBBcyBwcm9taXNlZCBkdXJpbmcgTFNGL01NL0JQRiwgd2UgY29uZHVjdGVkIHRob3Jv
dWdoCj4gdGVzdGluZyBvbiBBbmRyb2lkIHBob25lcyB0byBkZXRlcm1pbmUgd2hldGhlciBwZXJm
b3JtaW5nCj4gSS9PIGluIGBmaWxlbWFwX2ZhdWx0KClgIGNhbiBibG9jayBgdm1hX3N0YXJ0X3dy
aXRlKClgLgo+IEkgd2FudGVkIHRvIGdpdmUgYSBxdWljayB1cGRhdGUgb24gdGhpcyBxdWVzdGlv
bi4KPgo+IE5hbnpoZSBhdCBYaWFvbWkgY3JlYXRlZCB0cmFjaW5nIHNjcmlwdHMgYW5kIHJhbiB2
YXJpb3VzCj4gYXBwbGljYXRpb25zIG9uIEFuZHJvaWQgZGV2aWNlcyB3aXRoIEkvTyBwZXJmb3Jt
ZWQgdW5kZXIKPiB0aGUgVk1BIGxvY2sgaW4gYGZpbGVtYXBfZmF1bHQoKWAuIFdlIGZvdW5kIHRo
YXQ6Cj4KPiAxLiBUaGVyZSBhcmUgdmVyeSBmZXcgY2FzZXMgd2hlcmUgdW5tYXAoKSBpcyBibG9j
a2VkIGJ5Cj4gICAgcGFnZSBmYXVsdHMuIEkgYXNzdW1lIHRoaXMgaXMgZHVlIHRvIGJ1Z2d5IHVz
ZXIgY29kZQo+ICAgIG9yIHBvb3Igc3luY2hyb25pemF0aW9uIGJldHdlZW4gcmVhZHMgYW5kIHVu
bWFwKCkuCj4gU28gSSBhc3N1bWUgaXQgaXMgbm90IGEgcHJvYmxlbS4KPgo+IDIuIFdlIG9ic2Vy
dmVkIG1hbnkgY2FzZXMgd2hlcmUgYHZtYV9zdGFydF93cml0ZSgpYAo+ICAgIGlzIGJsb2NrZWQg
YnkgcGFnZS1mYXVsdCBJL08gaW4gc29tZSBhcHBsaWNhdGlvbnMuCj4gICAgVGhlIGJsb2NraW5n
IG9jY3VycyBpbiB0aGUgYGR1cF9tbWFwKClgIHBhdGggZHVyaW5nCj4gICAgZm9yaygpLgo+Cj4g
V2l0aCBTdXJlbidzIGNvbW1pdCBmYjQ5YzQ1NTMyM2ZmICgiZm9yazogbG9jayBWTUFzIG9mCj4g
dGhlIHBhcmVudCBwcm9jZXNzIHdoZW4gZm9ya2luZyIpLCB3ZSBub3cgYWx3YXlzIGhvbGQKPiBg
dm1hX3dyaXRlX2xvY2soKWAgZm9yIGVhY2ggVk1BLiBOb3RlIHRoYXQgdGhlCj4gYG1tYXBfbG9j
a2Agd3JpdGUgbG9jayBpcyBhbHNvIGhlbGQsIHdoaWNoIGNvdWxkIGxlYWQgdG8KPiBjaGFpbmVk
IHdhaXRpbmcgaWYgcGFnZS1mYXVsdCBJL08gaXMgcGVyZm9ybWVkIHdpdGhvdXQKPiByZWxlYXNp
bmcgdGhlIFZNQSBsb2NrLgo+Cj4gTXkgZ3V0IGZlZWxpbmcgaXMgdGhhdCBTdXJlbidzIGNvbW1p
dCBtYXkgYmUgb3ZlcnNob290aW5nLAo+IHNvIG15IHJvdWdoIGlkZWEgaXMgdGhhdCB3ZSBtaWdo
dCB3YW50IHRvIGRvIHNvbWV0aGluZyBsaWtlCj4gdGhlIGZvbGxvd2luZyAod2UgaGF2ZW4ndCB0
ZXN0ZWQgaXQgeWV0IGFuZCBpdCBtaWdodCBiZQo+IHdyb25nKToKPgo+IGRpZmYgLS1naXQgYS9t
bS9tbWFwLmMgYi9tbS9tbWFwLmMKPiBpbmRleCAyMzExYWU3YzJmZjQuLjVkZGFmMjk3ZjMxYSAx
MDA2NDQKPiAtLS0gYS9tbS9tbWFwLmMKPiArKysgYi9tbS9tbWFwLmMKPiBAQCAtMTc2Miw3ICsx
NzYyLDEzIEBAIF9fbGF0ZW50X2VudHJvcHkgaW50IGR1cF9tbWFwKHN0cnVjdCBtbV9zdHJ1Y3QK
PiAqbW0sIHN0cnVjdCBtbV9zdHJ1Y3QgKm9sZG1tKQo+ICAgICAgICAgZm9yX2VhY2hfdm1hKHZt
aSwgbXBudCkgewo+ICAgICAgICAgICAgICAgICBzdHJ1Y3QgZmlsZSAqZmlsZTsKPgo+IC0gICAg
ICAgICAgICAgICByZXR2YWwgPSB2bWFfc3RhcnRfd3JpdGVfa2lsbGFibGUobXBudCk7Cj4gKyAg
ICAgICAgICAgICAgIC8qCj4gKyAgICAgICAgICAgICAgICAqIEZvciBhbm9ueW1vdXMgb3Igd3Jp
dGFibGUgcHJpdmF0ZSBWTUFzLCBwcmV2ZW50Cj4gKyAgICAgICAgICAgICAgICAqIGNvbmN1cnJl
bnQgQ29XIGZhdWx0cy4KPiArICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgIGlm
ICghbXBudC0+dm1fZmlsZSB8fCAoIShtcG50LT52bV9mbGFncyAmIFZNX1NIQVJFRCkgJiYKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKG1wbnQtPnZtX2ZsYWdzICYg
Vk1fV1JJVEUpKSkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR2YWwgPSB2bWFfc3RhcnRf
d3JpdGVfa2lsbGFibGUobXBudCk7Cj4gICAgICAgICAgICAgICAgIGlmIChyZXR2YWwgPCAwKQo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gbG9vcF9vdXQ7Cj4gICAgICAgICAgICAgICAg
IGlmIChtcG50LT52bV9mbGFncyAmIFZNX0RPTlRDT1BZKSB7CgpNYXliZSBhIGxpdHRsZSBiaXQg
b2ZmIHRvcGljLiBUaGlzIGlzIGFuIGludGVyZXN0aW5nIGlkZWEuIEl0IHNlZW1zCnBvc3NpYmxl
IHdlIGRvbid0IGhhdmUgdG8gdGFrZSB2bWEgd3JpdGUgbG9jayB1bmNvbmRpdGlvbmFsbHkuIElJ
VUMKdGhlIHdyaXRlIGxvY2sgaXMgbWFpbmx5IHVzZWQgdG8gc2VyaWFsaXplIGFnYWluc3QgcGFn
ZSBmYXVsdCBhbmQKbWFkdmlzZSwgcmlnaHQ/IEkgZ290IGEgY3JhenkgaWRlYSBvZmYgdGhlIHRv
cCBvZiBteSBoZWFkLiBXZSBtYXkgYmUKYWJsZSB0byBqdXN0IHRha2Ugdm1hIHdyaXRlIGxvY2sg
aWZmIHZtYS0+YW5vbl92bWEgaXMgbm90IE5VTEwuCgpGaXJzdCBvZiBhbGwsIHdyaXRlIG1tYXBf
bG9jayBpcyBoZWxkLCBzbyB0aGUgdm1hIGNhbid0IGdvIG9yIGJlCmNoYW5nZWQgdW5kZXIgdXMu
CgpTZWNvbmRseSwgaWYgdm1hLT5hbm9uX3ZtYSBpcyBOVUxMLCBpdCBiYXNpY2FsbHkgbWVhbnMg
ZWl0aGVyIG5vIHBhZ2UKZmF1bHQgaGFwcGVuZWQgb3Igbm8gY293IGhhcHBlbmVkLCBzbyB0aGVy
ZSBpcyBubyBwYWdlIHRhYmxlIHRvIGNvcHksCnRoaXMgaXMgYWxzbyB3aGF0IGNvcHlfcGFnZV9y
YW5nZSgpIGRvZXMgY3VycmVudGx5LiBTbyB3ZSBjYW4gc2hyaW5rCnRoZSBjcml0aWNhbCBzZWN0
aW9uIHRvOgoKaWYgKHZtYS0+YW5vbl92bWEpIHsKICAgIHZtYV9zdGFydF93cml0ZV9raWxsYWJs
ZShzcmNfdm1hKTsKICAgIGFub25fdm1hX2ZvcmsoZHN0X3ZtYSwgc3JjX3ZtYSk7CiAgICBjb3B5
X3BhZ2VfcmFuZ2UoZHN0X3ZtYSwgc3JjX3ZtYSk7Cn0KCkJ1dCBwYWdlIGZhdWx0IGNhbiBoYXBw
ZW4gYmVmb3JlIHdyaXRlIG1tYXBfbG9jayBpcyB0YWtlbiwgd2hlbiB3ZQpjaGVjayB2bWEtPmFu
b25fdm1hLCBpdCBpcyBwb3NzaWJsZSBpdCBoYXMgbm90IGJlZW4gc2V0IHVwIHlldC4gQnV0IGl0
CnNlZW1zIHRvIGJlIGVxdWl2YWxlbnQgdG8gcGFnZSBmYXVsdCBhZnRlciBmb3JrIGFuZCB3b24n
dCBicmVhayB0aGUKc2VtYW50aWMuCgpBbnl3YXksIGp1c3QgYSBjcmF6eSBpZGVhLCBJIG1heSBt
aXNzIHNvbWUgY29ybmVyIGNhc2VzLgoKVGhhbmtzLApZYW5nCgp9Cgo+Cj4gQmFzZWQgb24gdGhl
IGFib3ZlLCB3ZSBtYXkgd2FudCB0byByZS1jaGVjayB3aGV0aGVyIGZvcmsoKQo+IGNhbiBiZSBi
bG9ja2VkIGJ5IHBhZ2UgZmF1bHRzLiBBdCB0aGUgc2FtZSB0aW1lLCBpZiBTdXJlbiwKPiB5b3Us
IG9yIGFueW9uZSBlbHNlIGhhcyBhbnkgY29tbWVudHMsIHBsZWFzZSBmZWVsIGZyZWUgdG8KPiBz
aGFyZSB0aGVtLgo+Cj4gQmVzdCBSZWdhcmRzCj4gQmFycnkKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
