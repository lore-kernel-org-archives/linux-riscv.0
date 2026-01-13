Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2039CF45D4
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 02:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dGiEOypIHrY02YOH+M9P7NNKFvq3iB/wC240Y2UcE9g=; b=3o796rhKVnll4I
	jaSEqcdZ5qU/+ZOgX1nZBxXGIwQzJw2dZOQOCBRLZULWbjm2OCi8E++oKc90cKRCu8psvN6og2VCj
	HRa2svmkIw6HKbXqBNim4wATHXKOzCUKWbowCtRjyg+un9pWEv2P813e1VEgUpa6fCA2hbb85Bi+6
	WH5nUP6LZFlr5Hj9RLOiyVJ0JwkUm4fm2rHC6dvSWY2s4/tfgXa0rrUplRxECQP8dYFzrRQ7NY1n5
	AUCvYfkZgj16pcihpvj21H9BCrDsLVQJAQUpGaybkP7pVhcvBwuLVwXPVgDVBuPgY+WX6vabMuHI4
	z/KWqll/KT2yTuH7x4dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUVV-00000006SIH-0stD;
	Tue, 13 Jan 2026 02:51:45 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUVS-00000006SHq-3ZeS
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 02:51:43 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-6446fcddf2fso7205570d50.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 18:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768272701; x=1768877501; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3EDLsI4gmCoGqH3Z2k2GRncDMxWHUvXOn29qxpSYSQ=;
        b=w9bxQ62Jof6utbv6SQKmxQEiRf4NijuPtQCTdT8ZwZcUFmwzsDbO4wwvjcF7AoHrjY
         zZrg1xVuPvb1Jg3xg8e8AMg2l7P/am3bC1k7pLOl3AUi42Ca/AXolbH0GrmamrRAG2El
         kyBWiDYgHRbwj5Ye8cwWxD7qF/pbu5lb/AFZOVZFSfIQMGhKP+qwD/62iyvhHLmfyKZg
         YHkySF8AEIgcmB9/agJLJieOyrWxQoRgNsc0MG1+a5ccBfXalLDOIkZcWn7fBBle4dXk
         w+Pre/U7FhUxSt0ikg+m5yFxwFmU58auQXpmN4Pn2Q04h28RnuRq+WdliyKPp5RTlEwe
         HbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768272701; x=1768877501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A3EDLsI4gmCoGqH3Z2k2GRncDMxWHUvXOn29qxpSYSQ=;
        b=WcyrbUk534NT/x8+Y3xcFIF/t5uruAtGPVK73m+xVZTqmT38m8S3WtaHd0vo4vbQbW
         3Q45GD3uotz/BBnzbkwlW8bvYAuHodYziavfLUmJQCorr8mVewQt/ZlTpaNhcvyFK0Em
         SeViLSvzsyoPa4PDO+sSPol3e+pZNC01Wn8IMY7iB3vb1pJGFMCl87hFpiniH7qcQVMt
         dC1ZeowhV4/PpBkT8DENscSs9zzpLPgdYkGebLeZAAhcZhZ225iHaeW7fyi53hOpH7Gw
         rR1qqokZwtBau5z7gtfxLTSk0StA+/AolaPHjFXdiKyelS4DReEBxf5wzOzYihk611L0
         vK5g==
X-Forwarded-Encrypted: i=1; AJvYcCXJYSoOYZJTqKm2C8XZbeiqLixuC7YDr/JqQpByRXOaZDojGujQy7GKyrhlsmjATz0BRcFurxAgrp6Eeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyK4zR689s3LR0KNmriWYh9+msuafUTpiYRpaWZnUC7AW55+tJz
	byygbj+ZiR/QauOR13pNpphvURi+ki3xzDpJ4Nyb0WZudsAjc4xtva9+gE+LC+ClFXDB3iKYCmS
	71qFt1W4pn2ikXZPXcpfWPg/x64rOMyAW4W4UglCpgA==
X-Gm-Gg: AY/fxX4k5mYHB5f4exaU+E67nS8DXcNB4TS7ga4UNvthb9X/q/riQiNeX1q+rqnkup5
	xIJQe/J2NE/7D441cW+1o7ckgB2c/vR9BzIbj+d3qsMcnsG96eDqhoymgy2ifJUF9TF5ZhX9OCY
	odT7TEM37rI5itqX2FiXq7LhqKKPawubFHEHUh43+WiGiW/W1iCFcUHscyee4aG5t9EgpLbUdsA
	8bQJ2Nx7Ly67EdVma7oqhOrmb9nBpXL1wqfCUWwQPVY/kJ5og4CsK86hA+EQuvp/QNQWlO1nYJO
	JlJGRHBqZeOQLKNit6h8EMTuDvor/l7ScZY40Q==
X-Google-Smtp-Source: AGHT+IGY8QkMTn4FKDtsguPkPZlInIEAk3s30SOaRJ7i+o+AsKUMCFEY8+PBpcpdqGZl22WHl4ejg4hQ7dqsombF9rE=
X-Received: by 2002:a05:690e:e8a:b0:641:f5bc:6983 with SMTP id
 956f58d0204a3-64716c2c6eamr15484452d50.79.1768272701490; Mon, 12 Jan 2026
 18:51:41 -0800 (PST)
MIME-Version: 1.0
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com> <20260112-shrivel-sarcastic-36d9acd2d96a@spud>
In-Reply-To: <20260112-shrivel-sarcastic-36d9acd2d96a@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 13 Jan 2026 10:51:29 +0800
X-Gm-Features: AZwV_Qh6psUrOlkmdvJ5XMadMeDGqdGdDoMMCEqx-N5Umm_2TBrLFIEtUXleAvI
Message-ID: <CAH1PCMa_rGWJsNiu3dGiOBxF9df-RL6qyanoGde3YqvmfGLyxA@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] riscv: spacemit: Add SpacemiT K3 SoC and K3
 Pico-ITX board
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Andrew Jones <ajones@ventanamicro.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-serial@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_185142_902441_FF1AF137 
X-CRM114-Status: GOOD (  22.04  )
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

T24gVHVlLCBKYW4gMTMsIDIwMjYgYXQgNTo0NuKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsIEphbiAxMCwgMjAyNiBhdCAwMToxODoxMlBNICsw
ODAwLCBHdW9kb25nIFh1IHdyb3RlOgo+Cj4gPiBIaSwgQ29ub3IKPiA+Cj4gPiBGb3IgdGhlIGJp
bmRpbmcgcmlzY3YvZXh0ZW5zaW9ucy55bWFsLCBoZXJlJ3Mgd2hhdCBjaGFuZ2VkIGluIHYzIChu
bwo+ID4gY2hhbmdlIGluIHY0KToKPiA+Cj4gPiAgMS4gRHJvcHBlZCB0aGUgcGF0Y2ggb2YgYWRk
aW5nICJzdXBtIiBpbnRvIGV4dGVuc2lvbnMueWFtbC4gQXQgdGhlIHNhbWUKPiA+ICAgICB0aW1l
LCBJIHdpbGwgc3RhcnQgYW5vdGhlciBwYXRjaHNldCB3aGljaCBpbXBsZW1lbnRzIHRoZSBzdHJh
dGVneQo+ID4gICAgIG91dGxpbmVkIGJ5IENvbm9yIGluIExpbmsgWzJdIGFuZCBieSBTYW11ZWwg
aW4gTGluayBbM10uCj4KPiBPa2F5LCB0aGF0IHNlZW1zIHJlYXNvbmFibGUgdG8gc2VwYXJhdGUg
b3V0Lgo+Cj4gPgo+ID4gIDIuIERyb3BwZWQgdGhlIGRlcGVuZGVuY3kgY2hlY2tzIGZvciAic2hh
IiBvbiAiaCIsICJzaGNvdW50ZXJlbnciLCBhbmQKPiA+ICAgICA2IG90aGVycy4gInNoYSIgaW1w
bGllcyB0aGVzZSBleHRlbnNpb25zLCBhbmQgaXQgc2hvdWxkIGJlIGFsbG93ZWQKPiA+ICAgICB0
byBiZSBkZWNsYXJlZCBpbmRlcGVuZGVudGx5LiBMaWtlICJhIiBpbXBsaWVzICJ6YWFtbyIgYW5k
ICJ6YWxyc2MiLgo+ID4KPiA+ICAzLiBFbmNoYW5jZWQgdGhlIGRlcGVuZGVuY3kgY2hlY2sgb2Yg
InppY2NhbW9hIiBvbiAiYSIuIFNwZWNpZmljYWxseSwKPiA+ICAgICAgLSBhZGRlZCB0aGUgZGVw
ZW5kZW5jeSBjaGVjayBvZiAiemljY2Ftb2EiIG9uICJ6YWFtbyIgb3Igb24gImEiLgo+ID4gICAg
ICAtIGFkZGVkIHRoZSBkZXBlbmRlbmN5IGNoZWNrIG9mICJ6YTY0cnMiIG9uICJ6YWxyc2MiIG9y
IG9uICJhIi4KPiA+ICAgICAgLSBhZGRlZCB0aGUgZGVwZW5kZW5jeSBjaGVjayBvZiAiemljY3Jz
ZSIgb24gInphbHJzYyIgb3IgImEiLgo+ID4gICAgIFRoZSBjb21taXQgbWVzc2FnZSBvZiB0aGlz
IHBhdGNoIGlzIHVwZGF0ZWQgdG9vLCB0byBiZXR0ZXIgZXhwbGFpbiB0aGUKPiA+ICAgICByZWxh
dGlvbnNoaXAgIGJldHdlZW4gInppY2NhbW9hIiwgInphNjRycyIsICJ6aWNjcnNlIiBhbmQgImEi
Lgo+ID4KPiA+ICA0LiBFbmhhbmNlZCBjaGVja2luZyBkZXBlbmRlbmN5IG9mICJiIiBhbmQgInpi
YSIsICJ6YmIiLCAiemJzIiwgbWFraW5nIHRoZQo+ID4gICAgIGRlcGVuZGVuY3kgY2hlY2sgaW4g
Ym90aCBkaXJlY3Rpb25zLCBhcyBkaXNjdXNzZWQgaW4gWzRdLiBTaW5jZSAiYiIKPiA+ICAgICB3
YXMgcmF0aWZpZWQgbXVjaCBsYXRlciB0aGFuIGl0cyBjb21wb25lbnQgZXh0ZW5zaW9ucyAoemJh
L3piYi96YnMpLAo+ID4gICAgIGV4aXN0aW5nIHNvZnR3YXJlIGFuZCBrZXJuZWxzIGV4cGVjdCB0
aGVzZSBleHBsaWNpdCBzdHJpbmdzLiBUaGlzCj4gPiAgICAgYmlkaXJlY3Rpb25hbCBjaGVjayBl
bnN1cmVzIGNvcmVzIGRlY2xhcmluZyAiYiIgcmVtYWluIGNvbXBhdGlibGUKPiA+ICAgICB3aXRo
IG9sZGVyIHNvZnR3YXJlIHRoYXQgb25seSByZWNvZ25pemVzIHpiYS96YmIvemJzLgo+Cj4gVGhp
cyBJIGFza2VkIGFib3V0IGluIHRoZSByZWxldmFudCBwYXRjaCwgSSB3b3VsZCBsaWtlIHRvIGtu
b3cgd2hhdCB5b3VyCj4gcGxhbiBmb3IgYWRkaW5nIHRoZSAiYiJzIGlzLgoKVGhhbmtzIGZvciBj
b25maXJtaW5nIHRoZSBhYm92ZS4gWWVzLCBJIHdpbGwgc3RhcnQgYSBmb2xsb3cgdXAgcGF0Y2gg
dG8gdXBkYXRlCnRoZSBkdHNpIGZpbGVzIHJlbGF0ZWQgdG8gdGhlICJiIiBleHRlbnNpb24uCgpC
ZXN0IHJlZ2FyZHMsCkd1b2RvbmcgWHUKCj4KPiBTcGFjZW1pdCBmb2xrcywgSSBhc3N1bWUgeW91
IHdlcmVuJ3QgcGxhbm5pbmcgb24gdGFraW5nIHRoZQo+IGV4dGVuc2lvbnMueWFtbCBzdHVmZiB2
aWEgeW91ciB0cmVlPyBJZiB5b3Ugd2VyZW4ndCwgSSdsbCBncmFiIGl0IG9uY2UKPiB0aGUgcXVl
c3Rpb24gYWJvdXQgYiBpcyBhbnN3ZXJlZC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
