Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F1AFC5936
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 11:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7xoIJjXd40+4vQDBiEkbLPhlFqV+iqeaL6/OfmJQt7c=; b=0BnqYYyTfDUaz3
	GGTKtiI8KIK2s30409k77Xv4C0YjWbAq+MVQTU9hw10QadyHFkbR5Z++9OmrGBspbsQOVdeOud0mm
	6IkSeSYuUJ6+xJd+1Uocny5vYSlGsUQNBF5xMQjaKL7nBlTA/tA8NijFU3rvRr1GZRN3ttxssdoF8
	vRXntuyi17drptoQS0U4i/7BzO2Y885/PHZ4kGGxUEx38OExUVadJ1qFfeeZzPjAg8tZBm1wGZUiP
	wh9NgBj7yFNMwE/asJgibqp5XXrxqX2fVMdLFYqH0tu4WXmHgaZuTJRlR7wxUxBv0vcSzyWvnaaCJ
	lfobvQWxRuKXYUgWnVuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZjw-000000063iH-1BHM;
	Thu, 26 Feb 2026 11:41:08 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZju-000000063hr-0I8d
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 11:41:07 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-389f9e70ae6so3803691fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Feb 2026 03:41:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772106063; cv=none;
        d=google.com; s=arc-20240605;
        b=MpFKSZx49MD8G4V1IUdSgsR9HZ/Ng49k3Z4/6ypX0EGv7nobyy4dKDH3gt6bjPKCBe
         9T0fx3RjSTP8klAYGf2Wgt+VcEgGRAs0UL6MF8EhLlMIWH37AuzcVzudcxZoR9XXMR3i
         JTx/PCdImFBrOvcXd7enAJjHnruvxdqUR/6UWHba9nYNWo6wd4ljR+fkUE5HHW8zriGZ
         zjDQotqWl56oCgdp9wmTtxG6woyo5wP6cnehLQtwF8+ekG5+1MCTqvETYYPxbZ4HNQsO
         ypXCtYGtEhqHEND2gBhDhP0pjUHCdIUXzC/Rp+wGhbar9T/nWm05cHo6Aj1hht1mWld6
         NAGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3D1O6M4hUCk7u+Y07Bfk4cSgft8s6ugu39i8lxX2f7E=;
        fh=qXyb48DenORNfQm8hITW2pZms4QQpjslZOcVqtmDyFk=;
        b=W945XSKFS8yuys9tw/FwZg4mgdesSVURMtTljtqtF5OtIQEkurZ/kwSWM33FMEf3Fs
         Akeav/+qE1KI7MkDbOnCJYM4H6ChHVRQLZR/WcPLaqCvqoZ17TLxyLn64EXtsjEyd1Hb
         x3OHslRGRMdX7yWccrAuNZYI7zGnXIjhClkywfm6ptQ/V+aIlf5AJbDt8Ft7yGLnZ30B
         3FyUm9IPpdv12/JwvrpRJ2SLM/tFmSZG3cC3oD2Zb8s/Ksui5dkJDKp6E63dqCP/PVbp
         mbKrwfEslNzL+GkTMdtzfWYEJ5oE5fdXpJzv2vfSGaekIRhPp/7zwY05iYLYfB1CNdY3
         uGdg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1772106063; x=1772710863; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3D1O6M4hUCk7u+Y07Bfk4cSgft8s6ugu39i8lxX2f7E=;
        b=iRZvP43CNFTzES2/yvcJ/AAPg2smLV5JRjq5C44D1b6W+xKxDG0hEKhn0FH9E889tA
         Dpw3PjCZGJfs1iMIayU0G5GrcjU26Wb9UllqPZdJtA13TtAL8wdTM6JgJClSzT7b7yGa
         F4xhueWv1LbemzVYKMeUCc2UjEG7OuKcpWwI8EGWFdnGHc77WZLfhFwauBClvjH7QZhG
         b3LtEYgtc4doo5QKESIfQVlPR+u3LOCR1bFXKFJSYOm3Ym1TrNLrX3Migt4cpbXWqwfN
         JoX0qPaevcjlzeXpYHeysuDh/a991HmDuNJEtS3TaiVy3GXmOSAXSsUx8dQfduNW6nZI
         eIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772106063; x=1772710863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3D1O6M4hUCk7u+Y07Bfk4cSgft8s6ugu39i8lxX2f7E=;
        b=RDcnv9g07ucHJPmeijpcnL31np5/2qLYp7K3kpJo9jWO+SHFPF0qzzBxh5W6n6Lq7C
         ceBRBg9qy81BE2auWLvZ+gNWN7tSkJJtueJvv77p9SoCSWCOtz8dz3cWEI29vJnH5woC
         vhFXtay+MzOEYootRahekbVvSODEhnowda0s+fcC6z5gfF/2e9oQygJTWg7jZUbwBw5i
         vmanhlUbYL15efLFFcNBvQuC5YT7xbizfOCK2k0JHP0+Y2WEqrYp6D8YT/QV6h2F1SDd
         XcaxXvbmlk5jq8Dq6OVdWFCihbfBcZ5dt4hFiZsmzQxh6fXGMlLbYIOprFkg1x/ob0w2
         m5gw==
X-Forwarded-Encrypted: i=1; AJvYcCXCfcdoGevs0rD1FoKG9zTQdYEGcPSpc6VxOne/k566UoGZ9F2GFWeK4FsoQqukGJKizWWwtE8UlEDh9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBUq3FvYbGlUCxCGR6o1hXpEZd8qVqXreiNDf5KhLTSEdcp7Lt
	ZrlJXFVtc0bsN3VY/UhSvQ0p7nSAB8GIWmvHqOLiT6gSaqlq5v6v8X3e8iWz7DuUbozzCNDHXwf
	VwcxuN2fzd9NjKvpSisLTHS5HNVkyN7KEhoPXDfgY1Q==
X-Gm-Gg: ATEYQzzyfZbrOJFjypUQ8uMGEA/MUbmNH1HC8X9pz8P7ZQaS9TuHGvh8rifGq3HHBV0
	zmF2seRVhNY3Jhckz6+WeIY9Zm8d+C436sXEcdckfcR3rQruWhSFCs15aTdYsaFgJYUcHYGMPPi
	JYbe+9yxuNeBuso+xpLOXBfPmBXNULNGA231kxhuX0n8hyrFV1230RAnwT6LPs1liVWnKSdyWxv
	2xD4Iv9/85zM92LSPiYjI5yw7VP50zM/F8p5Tb7fHqyOTsZT9jPdw2MXIE8ZMBMcgH7nrlJZSw4
	Dgl4Kqg4hz7Op1ywj5T3Q4E491RttYvK5DNw17jY
X-Received: by 2002:a2e:bcc7:0:b0:383:1a8b:a330 with SMTP id
 38308e7fff4ca-389ee2483f9mr13731261fa.4.1772106062980; Thu, 26 Feb 2026
 03:41:02 -0800 (PST)
MIME-Version: 1.0
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
 <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
 <20260223-mouth-plated-50294c7a6ac0@wendy> <CA+Ht8=aoxQp-RcFGWXXsfDyNarCn=zRhUOoG9rUCGeEw83BQvw@mail.gmail.com>
 <20260224-likewise-rimless-151f6a12b092@wendy> <CA+Ht8=Z-iaQ+zys5UOy6iNtdTsdtjq7mARwz=KJA_vbNYcfF6w@mail.gmail.com>
 <20260225-compress-moody-400a1e2f46fb@spud> <CAAhSdy2WHLahqPMTCqoSff6Z3no8sX2j_g858jp4XW5Et4dJXw@mail.gmail.com>
 <20260226-shifty-stingily-acfd81c08fde@spud>
In-Reply-To: <20260226-shifty-stingily-acfd81c08fde@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 26 Feb 2026 17:10:51 +0530
X-Gm-Features: AaiRm50kaZRw3cQDLQo2gWgp8k5Maohm1y8YZcJzjARuFg3oVBGsBeqoOzrqBtc
Message-ID: <CAK9=C2VmEWyPuvGLKhuU+Uew_x2nrj-CMuf_4=5UmNvFMb55qw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware break/watchpoints
To: Conor Dooley <conor@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, 
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, shuah@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_034106_149281_EE8EB7D9 
X-CRM114-Status: GOOD (  21.13  )
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

T24gVGh1LCBGZWIgMjYsIDIwMjYgYXQgMjoxNOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEZlYiAyNiwgMjAyNiBhdCAxMTowNToxNEFNICsw
NTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gT24gV2VkLCBGZWIgMjUsIDIwMjYgYXQgMjozMeKA
r1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9u
IFdlZCwgRmViIDI1LCAyMDI2IGF0IDEwOjMzOjI3QU0gKzA1MzAsIEhpbWFuc2h1IENoYXVoYW4g
d3JvdGU6Cj4gPiA+ID4gT24gVHVlLCBGZWIgMjQsIDIwMjYgYXQgMTozM+KAr1BNIENvbm9yIERv
b2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4g
PiA+IE9uIFR1ZSwgRmViIDI0LCAyMDI2IGF0IDA5OjMwOjI0QU0gKzA1MzAsIEhpbWFuc2h1IENo
YXVoYW4gd3JvdGU6Cj4gPiA+ID4gPiA+IEhpLAo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBPbiBN
b24sIEZlYiAyMywgMjAyNiBhdCAzOjU14oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlA
bWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBPbiBNb24s
IEZlYiAyMywgMjAyNiBhdCAxMDoxOToxN0FNICswNTMwLCBIaW1hbnNodSBDaGF1aGFuIHdyb3Rl
Ogo+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IERpZCB5b3UgbWlzcyB0aGUgY29tbWVudCBhdCB0
aGUgZW5kIGFib3V0IHRoZSByZW1haW5pbmcgVE9ET3M/Cj4gPiA+ID4KPiA+ID4gPiBOby4gQXMg
SSBtZW50aW9uZWQgaW4gdGhlIGNvdmVyIGxldHRlciwgdGhlIHB0cmFjZSBzdXBwb3J0IGlzIG5v
dAo+ID4gPiA+IGltcGxlbWVudGVkIGhlcmUuIEkgYW0gYWN0aXZlbHkgd29ya2luZyBvbiBpdCBh
bmQgdGhlc2UgYXJlCj4gPiA+ID4gaW1wbGVtZW50ZWQgaW4gcHRyYWNlIHdvcmsuCj4gPiA+ID4g
VGhlIHRlc3QgaXMgZG9uZSB1c2luZyB0aGUgcGVyZiBldmVudHMgZGlyZWN0bHkuIFRoZSBzZWNv
bmQgcGF0Y2ggaW4KPiA+ID4gPiB0aGlzIHBhdGNoIHNldCBoYXMgdGhlIHRlc3QgYXBwbGljYXRp
b24uCj4gPiA+Cj4gPiA+IFRoZW4gdGhlIHBhdGNoc2V0IHNob3VsZCBzdGlsbCBiZSBtYXJrZWQg
UkZDLCBzaW5jZSBpdCBpcyBub3QgZmluaXNoZWQuCj4gPgo+ID4gV293ISBsZXQncyBhbGwgb2Yg
dXMgcG9zdCBvbmx5IGxhcmdlIHNlcmllcyAoY292ZXJpbmcgbXVsdGlwbGUgZmVhdHVyZXMpCj4g
PiB3aGljaCBhcmUgZGlmZmljdWx0IHRvIHJldmlldyBpbnN0ZWFkIG9mIG1ha2luZyBsaWZlIGVh
c2llciBmb3IgcmV2aWV3ZXJzCj4gPiB0aHJvdWdoIGluY3JlbWVudGFsIHNlcmllcyB3aGljaCBt
YWtlIGdyYWR1YWwgcHJvZ3Jlc3Mgb3Zlci10aW1lLgo+Cj4gV2hlcmUgZGlkIEkgc2F5IGRvbid0
IHBvc3QgaXQ/IEluIGZhY3QsIG1hcmtpbmcgaXQgUkZDICpyZXF1aXJlcyoKPiBwb3N0aW5nIGl0
LiBEb24ndCBwdXQgd29yZHMgaW4gbXkgbW91dGguCj4KCldlbGwsIEkgZGlzYWdyZWUgd2l0aCB5
b3Ugc3VnZ2VzdGlvbiBvZiBtYXJraW5nIHRoaXMgc2VyaWVzIGFzIFJGQy4KVGhpcyBzZXJpZXMg
aGFzIHdlbGwgZGVmaW5lZCBzY29wZSBhbmQgaXMgYmFzZWQgb24gcmF0aWZpZWQgc3BlYy4KQSBz
ZXJpZXMgbmVlZCBub3QgY292ZXIgYWxsIHBvc3NpYmxlIGZlYXR1cmVzIHRvIGJlIGEgcmVndWxh
cgpub24tUkZDIHBhdGNoZXMuCgpEb24ndCB0aHJvdyB5b3VyIFJGQyByZWxhdGVkIG9waW5pb25z
IHBvaW50bGVzc2x5LgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
