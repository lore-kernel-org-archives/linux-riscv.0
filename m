Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D64C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 13:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TFfuV6Qf/hI+HvbnN3T7Hz30FzJPOEJQx0tdKLuGe8Y=; b=3I2TTjZA6rAt32
	p7it3+KceMOUB7mYnN6GwwrV69OkBQf0AvmiWFAo54d69kqIM/5WUfBnD0y8lHrej47V8p9JfuAyx
	Toc8EW91RdY3+TgZf9xsAInp/vQPyvfE+iiNx2NjbpHU5Bxc4gW/4o2TO38LCnhFSwOr8msdUSno7
	Lcitu1xkXS7I0YPFCO0CjrA4Lst79r8DyX/2yH7coWzc0vCdOxxny4sDmX7R4Y7oHqv8CrnBl6KmJ
	4a9DlZoX3+Mhrnua7okncLiSRuXDBCG96TKKvQ2g50ZzcmMpFWZVYMHK8TgAjM26CTITi21tNweIc
	9W1ArK12Si/FwH1j927Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNuqv-0006p1-18;
	Thu, 11 Jan 2024 13:12:09 +0000
Received: from mail-yw1-f179.google.com ([209.85.128.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNuqr-0006nK-0j;
	Thu, 11 Jan 2024 13:12:06 +0000
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5edbcdc323dso50334947b3.3;
        Thu, 11 Jan 2024 05:11:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704978718; x=1705583518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQ5ASUjPjhRUwAFEFid0Fjz0cuH2JwdEJzRuxsRLB6E=;
        b=RI1I7B3kq4YHYmRjgoJQ54kr3qARmIgVcw/dNc1V6dxfdkBT0C6oKD4WTgLOwcDVU9
         664KDVQF08fJLPnLlAh3ajaaggyMYfwfCRDSsGz1dyciGcoVOppivKJDmWYZvBZ7jY+t
         4ZgPHg0sSOXSx5HT8eub+Tn/G5Rwd1bZYmYtOKam53F9XrtSfIwspkYuUvtJEFPbbelm
         WLsaJzqCitjpKlrJ4LZ5lk7UTYc2AfQezlmri5eJTcHNClkKN7WZq/DeA2QER5N6QHof
         2nNSDgVZmeMLzheJZ3DxliPFQ9ENadHbw9d4yPU0yrTBgdyF2DGFfMPRnnebjckquZx1
         ANuw==
X-Gm-Message-State: AOJu0YzFdbs/a992MFzZ5KJj55DUmnhl7DlRcUJrPU++Hay7oYeJXvxM
	ccf/fOCGBVKqqiSni/7h9Hw+zgV1B7y5jw==
X-Google-Smtp-Source: AGHT+IGjjztpr1vm4i5RbXWsaUnx0t2WgvL/uMtJeJmImT52K4UBLXyvFVi4z6Z0PJPmVyHxvs+viw==
X-Received: by 2002:a81:ac5c:0:b0:5e7:c181:e66d with SMTP id z28-20020a81ac5c000000b005e7c181e66dmr544778ywj.20.1704978718362;
        Thu, 11 Jan 2024 05:11:58 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id i21-20020a0ddf15000000b005e739f09057sm384692ywe.121.2024.01.11.05.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 05:11:57 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dbed4b84667so4727852276.0;
        Thu, 11 Jan 2024 05:11:56 -0800 (PST)
X-Received: by 2002:a25:41cf:0:b0:dbd:ab41:60d5 with SMTP id
 o198-20020a2541cf000000b00dbdab4160d5mr1033855yba.123.1704978716687; Thu, 11
 Jan 2024 05:11:56 -0800 (PST)
MIME-Version: 1.0
References: <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
 <20240103114957.GD1073466@pevik> <CAMuHMdX0s0gLRoPtjJmDnSmZ_MNY590dN+JxM1HKAL1g_bjX+w@mail.gmail.com>
 <ZZVOhlGPg5KRyS-F@yuki> <5a1f1ff3-8a61-67cf-59a9-ce498738d912@landley.net>
 <20240105131135.GA1484621@pevik> <90c1ddc1-c608-30fc-d5aa-fdf63c90d055@landley.net>
 <20240108090338.GA1552643@pevik> <ZZvJXTshFUYSaMVH@yuki> <SA3PR13MB6372498CC6372F8B16237244FD6A2@SA3PR13MB6372.namprd13.prod.outlook.com>
 <20240110141455.GC1698252@pevik> <40996ea1-3417-1c2f-ddd2-e6ed45cb6f4b@landley.net>
In-Reply-To: <40996ea1-3417-1c2f-ddd2-e6ed45cb6f4b@landley.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Jan 2024 14:11:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX5ACKVBQvEwMi7KHZkSVGZPJoocEC1wosfB7zc0u2mbA@mail.gmail.com>
Message-ID: <CAMuHMdX5ACKVBQvEwMi7KHZkSVGZPJoocEC1wosfB7zc0u2mbA@mail.gmail.com>
Subject: Re: [Automated-testing] Call for nommu LTP maintainer [was: Re:
 [PATCH 00/36] Remove UCLINUX from LTP]
To: Rob Landley <rob@landley.net>
Cc: Petr Vorel <pvorel@suse.cz>, Tim Bird <tim.bird@sony.com>, Cyril Hrubis <chrubis@suse.cz>, 
	"ltp@lists.linux.it" <ltp@lists.linux.it>, Li Wang <liwang@redhat.com>, 
	Andrea Cervesato <andrea.cervesato@suse.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Christophe Lyon <christophe.lyon@linaro.org>, 
	"linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Linux-sh list <linux-sh@vger.kernel.org>, 
	"automated-testing@lists.yoctoproject.org" <automated-testing@lists.yoctoproject.org>, 
	"buildroot@buildroot.org" <buildroot@buildroot.org>, Niklas Cassel <niklas.cassel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_051205_262911_7CA44210 
X-CRM114-Status: GOOD (  25.00  )
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

SGkgUm9iLAoKT24gV2VkLCBKYW4gMTAsIDIwMjQgYXQgODoxN+KAr1BNIFJvYiBMYW5kbGV5IDxy
b2JAbGFuZGxleS5uZXQ+IHdyb3RlOgo+IFlvdSBjYW4ndCBmb3JrKCkgb24gbm9tbXUgYmVjYXVz
ZSBjb3BpZXMgb2YgdGhlIG1hcHBpbmdzIGhhdmUgZGlmZmVyZW50Cj4gYWRkcmVzc2VzLCBtZWFu
aW5nIGFueSBwb2ludGVycyBpbiB0aGUgY29waWVkIG1hcHBpbmdzIHdvdWxkIHBvaW50IGludG8g
dGhlIE9MRAo+IG1hcHBpbmdzIChiZWxvbmdpbmcgdG8gdGhlIHBhcmVudCBwcm9jZXNzKSwgYW5k
IGZpeGluZyB0aGVtIHVwIGlzIDEwMCUKPiBlcXVpdmFsZW50IHRvIHRoZSAiZ2FyYmFnZSBjb2xs
ZWN0aW9uIGluIEMiIHByb2JsZW0uIChJdCdzIEFJLWNvbXBsZXRlLiBPZiB0aGUKPiBDM1BPIGtp
bmQsIG5vdCB0aGUgImF1dG9jb3JyZWN0IHdpdGggc3ludGF4IGNoZWNraW5nIiBraW5kLikgUGVv
cGxlIGdldCBodW5nIHVwCj4gb24gdGhlICJpdCB3b3VsZCBiZSB2ZXJ5IGluZWZmaWNpZW50IHRv
IGRvIHRoYXQgYmVjYXVzZSBubyBjb3B5LW9uLXdyaXRlIgo+IHByb2JsZW0gYW5kIG1pc3MgdGhl
ICJ0aGUgY2hpbGQgY291bGRuJ3QgRlVOQ1RJT04gYmVjYXVzZSBpdHMgcG9pbnRlciB2YXJpYWJs
ZXMKPiBhbGwgY29udGFpbiBwYXJlbnQgYWRkcmVzc2VzIiBwcm9ibGVtLgoKQWN0dWFsbHkgeW91
IGNhbiBpbXBsZW1lbnQgZm9yaygpLCBpZiB5b3UgdGVhY2ggdGhlIGNvbXBpbGVyIHRvIHVzZQpz
ZXBhcmF0ZSBzdGFja3MgZm9yIHJldHVybiBhZGRyZXNzZXMgYW5kIGRhdGE6CiAgLSBUaGUgZmly
c3Qgc3RhY2sgd291bGQgY29udGFpbiBvbmx5IGFic29sdXRlIGFkZHJlc3NlcywgdG8gYmUKICAg
IHJlbG9jYXRlZCBhZnRlciBjb3B5aW5nLAogIC0gVGhlIHNlY29uZCBzdGFjayB3b3VsZCBjb250
YWluIGludGVnZXJzIGFuZCByZWxhdGl2ZSBwb2ludGVycwogICAgKHNlZSBGRFBJQyBiZWxvdyks
IHdoaWNoIGRvIG5vdCBuZWVkIHJlbG9jYXRpb24gYWZ0ZXIgY29weWluZy4KCj4gVGhlIE9USEVS
IGZ1biB0aGluZyBhYm91dCBub21tdSBpcyB5b3UgY2FuJ3QgcnVuIGNvbnZlbnRpb25hbCBFTEYg
YmluYXJpZXMsCj4gYmVjYXVzZSBldmVyeXRoaW5nIGlzIGxpbmtlZCBhdCBmaXhlZCBhZGRyZXNz
LiBTbyB5b3UgbWlnaHQgYmUgYWJsZSB0byBydW4gT05FCj4gaW5zdGFuY2Ugb2YgdGhlIHByb2dy
YW0gYXMgeW91ciBpbml0IHRhc2ssIGFzc3VtaW5nIHRob3NlIGFkZHJlc3NlcyB3ZXJlCj4gYXZh
aWxhYmxlIGV2ZW4gdGhlbiwgYnV0IGFzIHNvb24gYXMgeW91IHRyeSB0byBydW4gYSBzZWNvbmQg
b25lIGl0J3MgYSBjb25mbGljdC4KPgo+IFRoZSBxdWljayBhbmQgZGlydHkgd29yayBhcm91bmQg
aXMgdG8gbWFrZSBQSUUgYmluYXJpZXMsIHdoaWNoIGNhbiByZWxvY2F0ZQo+IGV2ZXJ5dGhpbmcg
aW50byBhdmFpbGFibGUgc3BhY2UsIHdoaWNoIHdvcmtzIGJ1dCBkb2Vzbid0IHNjYWxlLiBUaGUg
cHJvYmxlbSB3aXRoCj4gRUxGIFBJRSBpcyB0aGF0IGV2ZXJ5dGhpbmcgaXMgbGlua2VkIGNvbnRp
Z3VvdXNseSBmcm9tIGEgc2luZ2xlIGJhc2UgcG9pbnRlciwKPiBtZWFuaW5nIHlvdXIgdGV4dCwg
cm9kYXRhLCBkYXRhLCBhbmQgYnNzIHNlZ21lbnRzIGFyZSBhbGwgb25lIGxpbmVhciBibG9iLiBT
byBpZgo+IHlvdSBydW4gdHdvIGluc3RhbmNlcyBvZiBiYXNoLCB5b3UndmUgbG9hZGVkIHR3byBj
b3BpZXMgb2YgdGhlIHRlc3QgYW5kIHRoZQo+IHJvZG9hdGEuIFRoaXMgZmlsbHMgdXAgeW91ciBt
ZW1vcnkgZmFzdC4KPgo+IEFORCBQSUUgcmVxdWlyZXMgY29udGlndW91cyBtZW1vcnksIHdoaWNo
IG5vbW11IGlzIGJhZCBhdCBwcm92aWRpbmcgYmVjYXVzZSBpdAo+IGhhcyBubyBwYWdlIHRhYmxl
cyB0byByZW1hcCBzdHVmZi4gV2l0aCBhbiBtbXUgaXQgY2FuIGNvYWxlc2NlIHNjYXR0ZXJlZAo+
IHBoeXNpY2FsIHBhZ2VzIGludG8gYSB2aXJ0dWFsbHkgY29udGlndW91cyByYW5nZSwgYnV0IHdp
dGhvdXQgYW4gbW11IHlvdSBjYW4KPiBoYXZlIHBsZW50eSBvZiBtZW1vcnkgZnJlZSBidXQgaW4g
dGlueSBjaHVua3MsIG5vbmUgYmlnIGVub3VnaCB0byBzYXRpc2Z5IGFuCj4gYWxsb2NhdGlvbiBy
ZXF1ZXN0Lgo+Cj4gU28gdGhleSBpbnZlbnRlZCBGRFBJQywgd2hpY2ggaXMgRUxGIHdpdGggRk9V
UiBiYXNlIHBvaW50ZXJzLiBFYWNoIG1ham9yIHNlY3Rpb24KPiAocm9kYXRhLCB0ZXh0LCBkYXRh
LCBhbmQgYnNzKSBoYXMgaXRzIG93biBiYXNlIHBvaW50ZXIsIHNvIHlvdSBuZWVkIHRvIGZpbmQK
PiBzbWFsbGVyIGNodW5rcyBvZiBtZW1vcnkgdG8gbG9hZCB0aGVtIGludG8gKGFuZCB0aHVzIGl0
IGNhbiB3b3JrIG9uIGEgbW9yZQo+IGZyYWdtZW50ZWQgc3lzdGVtKSwgQU5EIGl0IG1lYW5zIHRo
YXQgdHdvIGluc3RhbmNlcyBvZiB0aGUgc2FtZSBwcm9ncmFtIGNhbgo+IHNoYXJlIHRoZSByZWFk
LW9ubHkgc2VjdGlvbnMgKHJvZGF0YSBhbmQgdGV4dCkgc28geW91IG9ubHkgbmVlZCBuZXcgY29w
aWVzIG9mCj4gdGhlIHdyaXRlYWJsZSBzZWdtZW50cyAoZGF0YSBhbmQgYnNzLiBBbmQgdGhlIGhl
YXAuIEFuZCB0aGUgc3RhY2suKQoKT3IgQW1pZ2EgTG9hZFNlZygpIHJlbG9jYXRhYmxlIGJpbmFy
aWVzIGFuZCBzaGFyZWQgbGlicmFyaWVzIDstKQpBcyB0aGlzIHN1cHBvcnRlZCBzcGxpdHRpbmcg
Y29kZSwgZGF0YSwgYW5kIGJzcyBpbiBsb3RzIG9mIHNtYWxsZXIKaHVua3MsIGl0IGNvdWxkIGNv
dW50ZXIgZnJhZ21lbnRlZCBtZW1vcnkgcXVpdGUgd2VsbC4KCkJUVywgY2FuJ3QgeW91IHJ1biBh
bmQgdGh1cyB0ZXN0IG5vbW11LWJpbmFyaWVzIHVuZGVyIG5vcm1hbCBMaW51eCwgdG9vPwoKR3J7
b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0
IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2Vl
cnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0
byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0
aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
