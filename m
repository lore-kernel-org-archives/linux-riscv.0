Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C55C3DA7D
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 01:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ra+/vQv6lYNbowGpiQ8AfKQvSjUruRXrcs5Pxm8ButQ=; b=cNxYP4P7ZLvJAB
	XLLBCVfZfOJoBLGb+rVprsjLmSn3DZaeWJ6ojxM1Fk1iRQjgb6JFtTotWWbaNOXlDsShkQX7OBS8G
	MNTw6Ejub1FRn9NZjBLK+0VIYft1TIps/PsWh6j6+5TFGtu03+vSian8RVrzzV73PZibSnI+0NIHu
	oUmM+SxG6Ur7HTzaX7ERei9cHUgK0MwcGySSckFXPMd7iD0JnPDb2E7TUHdoKUt+pisi8hCz7S3Fy
	J7aQbZAouH/GXIcxHrwB0U/A0ZJtPodimn3DjnfVdnx20QuqiB1w5qxYNAWOWLzGoeqOi1E3hnpET
	c02r4prMxjzraZT0zvZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCsmZ-006D1f-K9; Wed, 04 Jan 2023 01:41:31 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCsm0-006Cmr-TH
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 01:40:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 312B3B811AB
	for <linux-riscv@lists.infradead.org>; Wed,  4 Jan 2023 01:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A2AC4339C
	for <linux-riscv@lists.infradead.org>; Wed,  4 Jan 2023 01:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672796452;
	bh=4+YCVSlmS1xGxI66GjUsM1FciiRv5pR0ZH+g1/QKoos=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hF5inMd2JJa2s9C62pR/YMr3UcBLXs7OeFvbq1rlqV4Hz2x+8e5Q4ylkoJuFXSBua
	 l0EegukYO5PjZe3Bj0DNsVywqQp169cpPLPxQsG01l/SYZOkInqb5SjUa2XZfNgGz4
	 xPgK0x52pl6YC2zKaWszZb0R2dGiLNXiekoU7tEB9WfJ0S1g0KM81yBediPfvM4vpW
	 nD77GSaDTq0XngKa7M+oyu4b1mFkkDgOQ6tFmpBbM4UIVICZNhd34fmZtUz5xcCxOO
	 0oMYAcrFNTXRv+UDs+64ibDK99VwHZXYL00c9dHg+DCPrUNDZemUYULK4k7Cb26H3B
	 S1DXIMNIizfrA==
Received: by mail-ej1-f43.google.com with SMTP id gh17so79335421ejb.6
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 17:40:52 -0800 (PST)
X-Gm-Message-State: AFqh2kqW4nSIearTPVbwg40vnvPppS/08TlUt1S0c44UOcsJePurTFG2
	s6IwxdzHa8M+UNV82iC4gaxe3/1CaUFXh49s4Gk=
X-Google-Smtp-Source: AMrXdXuguKZK0xV2EbDa692rlZxWl3jbDoL9vGT6mVExfffLZNxoo/dIejOpWwEoJqQtPyJfzfwjMbyJ83re0sVpEew=
X-Received: by 2002:a17:906:308a:b0:7c0:f7b0:fbbb with SMTP id
 10-20020a170906308a00b007c0f7b0fbbbmr4720616ejv.266.1672796450559; Tue, 03
 Jan 2023 17:40:50 -0800 (PST)
MIME-Version: 1.0
References: <20230103033531.2011112-1-guoren@kernel.org> <20230103033531.2011112-4-guoren@kernel.org>
 <36314eb6-e41d-30b9-9ac4-12b88a108b7b@ghiti.fr>
In-Reply-To: <36314eb6-e41d-30b9-9ac4-12b88a108b7b@ghiti.fr>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 4 Jan 2023 09:40:38 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTSretKkJGNV7Y6iJboPuAWUQ=to=RPA8_-Nz8dnufGAg@mail.gmail.com>
Message-ID: <CAJF2gTTSretKkJGNV7Y6iJboPuAWUQ=to=RPA8_-Nz8dnufGAg@mail.gmail.com>
Subject: Re: [PATCH -next V12 3/7] riscv: entry: Add noinstr to prevent
 instrumentation inserted
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	mark.rutland@arm.com, ben@decadent.org.uk, bjorn@kernel.org, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_174057_246486_66B35E0A 
X-CRM114-Status: GOOD (  27.80  )
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

T24gVHVlLCBKYW4gMywgMjAyMyBhdCA1OjEyIFBNIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0
aS5mcj4gd3JvdGU6Cj4KPiBIaSBHdW8sCj4KPiBPbiAxLzMvMjMgMDQ6MzUsIGd1b3JlbkBrZXJu
ZWwub3JnIHdyb3RlOgo+ID4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29t
Pgo+ID4KPiA+IFdpdGhvdXQgbm9pbnN0ciB0aGUgY29tcGlsZXIgaXMgZnJlZSB0byBpbnNlcnQg
aW5zdHJ1bWVudGF0aW9uICh0aGluawo+ID4gYWxsIHRoZSBrKlNBTiwgS0NvdiwgR0NvdiwgZnRy
YWNlIGV0Yy4uKSB3aGljaCBjYW4gY2FsbCBjb2RlIHdlJ3JlIG5vdAo+ID4geWV0IHJlYWR5IHRv
IHJ1biB0aGlzIGVhcmx5IGluIHRoZSBlbnRyeSBwYXRoLCBmb3IgaW5zdGFuY2UgaXQgY291bGQK
PiA+IHJlbHkgb24gUkNVIHdoaWNoIGlzbid0IG9uIHlldCwgb3IgZXhwZWN0IGxvY2tkZXAgc3Rh
dGUuIChieSBwZXRlcnopCj4gPgo+ID4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtcmlzY3YvWXhjUTZOb1BmM0FIMEVYZUBoaXJlei5wcm9ncmFtbWluZy5raWNrcy1hc3MubmV0
Lwo+ID4gUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiA+
IFN1Z2dlc3RlZC1ieTogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+ID4g
VGVzdGVkLWJ5OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gICBhcmNoL3Jpc2N2
L2tlcm5lbC90cmFwcy5jIHwgNCArKy0tCj4gPiAgIGFyY2gvcmlzY3YvbW0vZmF1bHQuYyAgICAg
fCAyICstCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ID4gaW5kZXggNTQ5YmRlNWM5NzBhLi45NmVjNzZjNTRm
ZjIgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPiArKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPiBAQCAtOTUsOSArOTUsOSBAQCBzdGF0aWMgdm9p
ZCBkb190cmFwX2Vycm9yKHN0cnVjdCBwdF9yZWdzICpyZWdzLCBpbnQgc2lnbm8sIGludCBjb2Rl
LAo+ID4gICB9Cj4gPgo+ID4gICAjaWYgZGVmaW5lZChDT05GSUdfWElQX0tFUk5FTCkgJiYgZGVm
aW5lZChDT05GSUdfUklTQ1ZfQUxURVJOQVRJVkUpCj4gPiAtI2RlZmluZSBfX3RyYXBfc2VjdGlv
biAgICAgICAgICAgICAgIF9fc2VjdGlvbigiLnhpcC50cmFwcyIpCj4gPiArI2RlZmluZSBfX3Ry
YXBfc2VjdGlvbiBfX25vaW5zdHJfc2VjdGlvbigiLnhpcC50cmFwcyIpCj4gPiAgICNlbHNlCj4g
PiAtI2RlZmluZSBfX3RyYXBfc2VjdGlvbgo+ID4gKyNkZWZpbmUgX190cmFwX3NlY3Rpb24gbm9p
bnN0cgo+ID4gICAjZW5kaWYKPiA+ICAgI2RlZmluZSBET19FUlJPUl9JTkZPKG5hbWUsIHNpZ25v
LCBjb2RlLCBzdHIpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICAgYXNtbGlu
a2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBuYW1lKHN0cnVjdCBwdF9yZWdzICpy
ZWdzKSBcCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9mYXVsdC5jIGIvYXJjaC9yaXNj
di9tbS9mYXVsdC5jCj4gPiBpbmRleCBkODZmN2NlYmQ0YTcuLmIyNmY2OGVhYzYxYyAxMDA2NDQK
PiA+IC0tLSBhL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9tbS9m
YXVsdC5jCj4gPiBAQCAtMjA0LDcgKzIwNCw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBhY2Nlc3Nf
ZXJyb3IodW5zaWduZWQgbG9uZyBjYXVzZSwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4g
PiAgICAqIFRoaXMgcm91dGluZSBoYW5kbGVzIHBhZ2UgZmF1bHRzLiAgSXQgZGV0ZXJtaW5lcyB0
aGUgYWRkcmVzcyBhbmQgdGhlCj4gPiAgICAqIHByb2JsZW0sIGFuZCB0aGVuIHBhc3NlcyBpdCBv
ZmYgdG8gb25lIG9mIHRoZSBhcHByb3ByaWF0ZSByb3V0aW5lcy4KPiA+ICAgICovCj4gPiAtYXNt
bGlua2FnZSB2b2lkIGRvX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiArYXNt
bGlua2FnZSB2b2lkIG5vaW5zdHIgZG9fcGFnZV9mYXVsdChzdHJ1Y3QgcHRfcmVncyAqcmVncykK
Pgo+Cj4gKEkgZHVnIHRoZSBhcmNoaXZlIGJ1dCBjYW4ndCBmaW5kIHRoZSBzZXJpZXMgYmVmb3Jl
IHY0LCBzbyBzb3JyeSBpZiBpdAo+IHdhcyBhbHJlYWR5IGFuc3dlcmVkKQo+Cj4gSSB0aGluayB3
ZSBzaG91bGQgbm90IGRpc2FibGUgdGhlIGluc3RydW1lbnRhdGlvbiBvZiB0aG9zZSB0cmFwIGhh
bmRsZXJzCj4gYXMgYXQgbGVhc3QgcHJvZmlsaW5nIHRoZW0gd2l0aCBmdHJhY2Ugd291bGQgcHJv
dmlkZSB2YWx1YWJsZQo+IGluZm9ybWF0aW9uIChhbmQgZ2NvdiB3b3VsZCBiZSBuaWNlIHRvbyk6
IHdoeSBkbyB3ZSBuZWVkIHRvIGRvIHRoYXQ/IEEKPiB0cmFwIHZlcnkgZWFybHkgaW4gdGhlIGJv
b3QgcHJvY2VzcyBpcyBub3QgcmVjb3ZlcmFibGUgYW55d2F5LgpFdmVyeXRoaW5nIHRoYXQgY2Fs
bHMgaXJxZW50cnlfZW50ZXIoKSBzaG91bGQgYmUgbm9pbnN0ciwgYW5kIHRoaXMKcGF0Y2ggcHJl
cGFyZXMgZm9yIHRoZSBuZXh0IGdlbmVyaWNfZW50cnkgY29udmVydC4KCmVnOgphc21saW5rYWdl
IHZvaWQgbm9pbnN0ciBkb19wYWdlX2ZhdWx0KHN0cnVjdCBwdF9yZWdzICpyZWdzKQp7CiAgICAg
ICAgaXJxZW50cnlfc3RhdGVfdCBzdGF0ZSA9IGlycWVudHJ5X2VudGVyKHJlZ3MpOwoKICAgICAg
ICBfX2RvX3BhZ2VfZmF1bHQocmVncyk7CgogICAgICAgIGxvY2FsX2lycV9kaXNhYmxlKCk7Cgog
ICAgICAgIGlycWVudHJ5X2V4aXQocmVncywgc3RhdGUpOwp9Ck5PS1BST0JFX1NZTUJPTChkb19w
YWdlX2ZhdWx0KTsKCllvdSBzdGlsbCBjb3VsZCBwcm9maWxlIF9fZG9fcGFnZV9mYXVsdC4KCj4K
PiBBbmQgSSB0b29rIGEgbG9vayBhdCBvdGhlciBhcmNoaXRlY3R1cmVzLCBub25lIG9mIHRoZW0g
ZGlzYWJsZXMgdGhlCj4gaW5zdHJ1bWVudGF0aW9uIG9uIGRvX3BhZ2VfZmF1bHQuClRoYXQncyBu
b3QgdHJ1ZSwgaGF2ZSBhIGxvb2sgYXQgcG93ZXIgJiBhcm02NC4gQWxsIG9mIHRoZW0gaGF2ZSBz
b21lCmxpbWl0YXRpb25zIGF0IHRoZSBlbnRyeSBvZiBwYWdlX2ZhdWx0LgoKPgo+Cj4gPiAgIHsK
PiA+ICAgICAgIHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrOwo+ID4gICAgICAgc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWE7CgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
