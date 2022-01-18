Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE24C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jan 2022 01:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Rp17GZIpvou4LgClijn8xTQNe8DVp0a0VMjO5pwN98=; b=AZ4cyhK02Hume+
	yrFECwj0IlzfBzBrzQs4LJJO14On4f/LoogJgSiDzmH8xcrNV1k7rMyE5JGdgXPZn36HFQH49E8UQ
	Q2P2Bsx8Qsu/NgxuGnrRql7KHWbEFDG/uO8OUZ12rytXRIZR0S1q87hFPRK2d1vn9tyyAY9TksUzN
	BgCtDp+WFGvrDL2hSVxIZiA0G4WklQHyAtIJvIkR7u6qApnrAw8knvrkpVdoL5QNhankkbkBdlq3h
	ysBuICVSvM7BCe+UZVz+dtFEErmglFQY7KlGKKZsRt3nzHPC/5C73C1ZJfgFYWC4LmrZlMUSbzDEU
	v3X8+X/AvN0+ybi+IeoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9dG1-00Glal-5k; Tue, 18 Jan 2022 01:25:57 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9dFx-00GlYg-1X
 for linux-riscv@lists.infradead.org; Tue, 18 Jan 2022 01:25:56 +0000
Received: by mail-yb1-xb29.google.com with SMTP id v186so51115956ybg.1
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jan 2022 17:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qNaY1Y/1NbFVilpws7ryUXOr74h6MxLMt3iL7yLL7oc=;
 b=pXqxL3RsHO3TYs3MZ6C4KZX8j7NuCnG/UTmtbQ4eZNl+OZWL0hgOtC7erwUmBWIwRG
 ZDYNBxEt+b9E3itd+hIYzRzUwN7i3wa/MAnDEseFE51s6V/3/tDv9NGmgMN6y3f32Qw1
 RqSY4quKkYNDyhDiXZ5T8PkqWwSx6lWPwnvXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qNaY1Y/1NbFVilpws7ryUXOr74h6MxLMt3iL7yLL7oc=;
 b=cy/ReEjkBItke9ETuy6mPHBecabOV66FhAKeBleFawU3G7+pe5Ruaka2oSK5p4JbZv
 7QpunO07u/7YemV1Q0WRxagZ8THg+8xv9XWLkV1FCqg0KTDYSsay1BMureP/ddUhR2QI
 wL/8eOam7QgpwHnVVKtnPkAP8M7uxyutwPda1tbwvvDoxWx7ZWSzFtO2X2rCDMFUmMgk
 Vq3AaGvPXusbu5KvzfbtGknZL/yVBK93VHItPEdUbo3D+CmRCfcLyqmAruFTadNStrFw
 f+wFu8znJ+t5Gp5P7JQbWblXUFY6DXqkUvHPe0sOV8+bGvfId+gH7/byvPYpV8//AFN1
 DVMQ==
X-Gm-Message-State: AOAM533//Y1ErZUjBhtd8qBZSljkKaBg/U7mouCCBPXwOj+EqqCn5jRR
 qDmYfaYmJHBlF8AzvU8xzjQxIHkdicR4XYOYPTxL
X-Google-Smtp-Source: ABdhPJzqeh0DNSlSzK/xJEGIcofaC4jJ/8yvJCovZ1KCxX4liFq4JnKPW8CvF9cQOP69PK007J7bGPYHjwPHtRKdwxw=
X-Received: by 2002:a25:bc8a:: with SMTP id e10mr8238592ybk.472.1642469151276; 
 Mon, 17 Jan 2022 17:25:51 -0800 (PST)
MIME-Version: 1.0
References: <20220117173941.3798325-1-florian.wagner@nextsilicon.com>
 <20220117173941.3798325-2-florian.wagner@nextsilicon.com>
 <98743A89-2871-434C-B17A-70EFE1D188CC@jrtc27.com>
In-Reply-To: <98743A89-2871-434C-B17A-70EFE1D188CC@jrtc27.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 17 Jan 2022 17:25:40 -0800
Message-ID: <CAOnJCULOcquctjkYoxFSTaBVhRR=FN10OhKzvaXaEOx7V17=5g@mail.gmail.com>
Subject: Re: [PATCH 1/1] RISC-V: Change signature header field to use `.ascii`
 instead of opcode
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Florian Wagner <florian.wagner@nextsilicon.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 yaron.dinkin@nextsilicon.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_172553_180031_D97AF8D8 
X-CRM114-Status: GOOD (  22.30  )
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

T24gTW9uLCBKYW4gMTcsIDIwMjIgYXQgMTE6MDAgQU0gSmVzc2ljYSBDbGFya2UgPGpydGMyN0Bq
cnRjMjcuY29tPiB3cm90ZToKPgo+IE9uIDE3IEphbiAyMDIyLCBhdCAxNzozOSwgRmxvcmlhbiBX
YWduZXIgPGZsb3JpYW4ud2FnbmVyQG5leHRzaWxpY29uLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhl
IGBNWmAgaW4gdGhlIHNpZ25hdHVyZSBoZWFkZXIgZmllbGQgaXMgbm93IGVuY29kZWQgdmlhIGAu
YXNjaWlgIHRvIG1ha2UKPiA+IHRoZSBrZXJuZWwgY29tcGlsZSB3aXRob3V0IHRoZSBgY2AgZXh0
ZW5zaW9uLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZsb3JpYW4gV2FnbmVyIDxmbG9yaWFuLndh
Z25lckBuZXh0c2lsaWNvbi5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZYXJvbiBEaW5raW4gPHlh
cm9uLmRpbmtpbkBuZXh0c2lsaWNvbi5jb20+Cj4gPiAtLS0KPiA+IGFyY2gvcmlzY3Yva2VybmVs
L2hlYWQuUyB8IDIgKy0KPiA+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKPiA+IGluZGV4IGY1MmYwMWVjYmVlYS4uOTMxYjYzNDY0
YjkwIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCj4gPiArKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKPiA+IEBAIC00OCw3ICs0OCw3IEBAIEVOVFJZKF9zdGFy
dCkKPiA+ICAgICAgIC8qCj4gPiAgICAgICAgKiBUaGlzIGluc3RydWN0aW9uIGRlY29kZXMgdG8g
Ik1aIiBBU0NJSSByZXF1aXJlZCBieSBVRUZJLgo+ID4gICAgICAgICovCj4gPiAtICAgICBjLmxp
IHM0LC0xMwo+ID4gKyAgICAgLmFzY2lpICJNWiIKPiA+ICAgICAgIGogX3N0YXJ0X2tlcm5lbAo+
Cj4gQ09ORklHX0VGSSBoYXMgc2VsZWN0IFJJU0NWX0lTQV9DLCBzbyB0aGlzIGRvZXNu4oCZdCBz
ZWVtIHRvIGFjaGlldmUKPiBhbnl0aGluZz8gSWYgeW91IHRoZW4gcmVtb3ZlIHRoYXQgc2VsZWN0
LCB3ZWxsLCB5b3UgZ2V0IGFuIEVGSSBiaW5hcnkKPiB0aGF0IHdvcmtzLCBidXQgaWYgeW91IGp1
bXAgdG8gaXQgZGlyZWN0bHkgYXMgYSBub24tRUZJIGJpbmFyeSB0aGVuCj4geW914oCZbGwgdHJh
cCBvbiBhIG5vbi1SVkMgc3lzdGVtIGFzIHRoYXQgd29u4oCZdCBiZSBhIHZhbGlkIGluc3RydWN0
aW9uLgo+IFNvIEkgdGhpbmsgdGhpcyBuZWVkcyBtb3JlIGV4cGxhbmF0aW9uIGFuZCBkaXNjdXNz
aW9uLgo+CgpIZXJlIGlzIHRoZSBwcmV2aW91cyBkaXNjdXNzaW9uIHJlZ2FyZGluZyB0aGlzLgoK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LXJpc2N2LzIwMjEtTWFy
Y2gvMDA0OTk4Lmh0bWwKClRMRFIsIHRoZXJlIGlzIG5vIGNsZWFuZXIgd2F5IHRvIHN1cHBvcnQg
Ym90aCBFRkkgJiBub24tVUVGSSBib290aW5nCm9uIGEgcGxhdGZvcm0Kd2l0aG91dCBDIGV4dGVu
c2lvbi4gTGludXgga2VybmVsIGFueXdheXMgcmVjb21tZW5kIHJ2NjRnYyBmb3IgcGxhdGZvcm1z
LgoKPiBKZXNzCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YKCgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
