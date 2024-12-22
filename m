Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A2AE77188
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Dec 2024 04:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJZsj48TodzzT+JxyH1ryH7SwRQLGNEETST/bzsDBcg=; b=aQ3Y3URTcpCwFD
	fV8zjKzXYie6IOed0eTiGRcAwipNCVBrfTtmYa0la1mLI3+thZ6SGFS7QkWi2vaaDRI0ejcEanJ8g
	LhmlncaC2mSAsU4m3E0jGtGCViFfLmwSprbuMRF7qy1kaoXbdN2umy9zAzM5s4C9hQU94ZAPjskVH
	ht4PvFTEXz0/14qd5EIEnVBFy/yS74hLhy/yD0v9P0nOkxN57+jp8HlaJxR6EnCPnRRXDdgy6cRVG
	rW2124Xwr4tAnRdWTiOc62vUVhijn3dv4S0Ue3OWq4UBOjFlvEHzphxvFzKIWNODT/t0gQLJ1MvaO
	RqYSTAfM035KpSkUFq+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPDCQ-00000007mAW-3ru5;
	Sun, 22 Dec 2024 04:04:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPDCO-00000007mA4-0LMk
	for linux-riscv@lists.infradead.org;
	Sun, 22 Dec 2024 04:04:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 593B3A4017B
	for <linux-riscv@lists.infradead.org>; Sun, 22 Dec 2024 04:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D243DC4AF09
	for <linux-riscv@lists.infradead.org>; Sun, 22 Dec 2024 04:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734840249;
	bh=ZkehN8/R0QGgJ6gQii9HoygR7SM6huaK21dgWOfITfM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z7B0LTjGM6GDB65OU3HUhbzEmDPsFIUaRhBD1BZtx7ho4e0eqM+rhETAKnYPtHi3X
	 YvxFzfRwgFbf4UD8fSE3BL154VxgZ/n87x9qCWA2ARXgVfwbSY+LO6bgckU4XpgZAU
	 X5BLuzWCgFmiKv6qnBkY25rSNYtWn0mgJpFRJE5apN28qovE2qynmKsrxocMZ298jo
	 fDHzW7Yg1ZM1+mLHJLnOK0Wv0RQioipQpMfNxN4/IAiSLTZQHiYZOKkLxKDYN6YAHu
	 HzwYQcrhSk20VaiS7mpM2QNd97JQtJlKEP9JAO/SqBUwfhCi0xgTh3ejrSPgqx4gEZ
	 7fQ4RDpl5vG/g==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so4224022a12.2
        for <linux-riscv@lists.infradead.org>; Sat, 21 Dec 2024 20:04:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrxsaQeVAyNqEM6Rjq6heaPLHr5i0Jj5gY8sZAt5A+JVKFGAWFBCDjJkRth8EBYukhZk4J0n5NG8goug==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbUb+8yhK4rH73FXIN697LAcDanHexCXQcGhO/aNsBdpg6iNBK
	jucV/PnfD7WtPC58/qT+ZaSvf2xjoevDOizHGFXvGFqQ/6mnBcvJMg3ybiHiiUg5Y88QcNOlJtW
	NWSNB0QBEQmjdPi7CSw6610qFqrI=
X-Google-Smtp-Source: AGHT+IHfsVUt/sze1GXP78hjgyhe6Sq4XuSxY/8M/2w9zhrD0ToMLs4gTEEJ0MWdkoH09fkGqaXbN/xocSAtV6cQOig=
X-Received: by 2002:a05:6402:40c9:b0:5d1:1064:326a with SMTP id
 4fb4d7f45d1cf-5d81ddbf672mr18813886a12.15.1734840248337; Sat, 21 Dec 2024
 20:04:08 -0800 (PST)
MIME-Version: 1.0
References: <20241214043510.3795984-1-guoren@kernel.org> <330c7596-cd93-4ae5-b00d-789c72a944aa@ghiti.fr>
In-Reply-To: <330c7596-cd93-4ae5-b00d-789c72a944aa@ghiti.fr>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 22 Dec 2024 12:03:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRt0c78jPGN8ZX-u3dJKBrOkoV7VZQW2A+rVpuVOzdvLg@mail.gmail.com>
Message-ID: <CAJF2gTRt0c78jPGN8ZX-u3dJKBrOkoV7VZQW2A+rVpuVOzdvLg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add riscv_force_qspinlock for early_param
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: conor@kernel.org, alexghiti@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	bjorn@rivosinc.com, leobras@redhat.com, peterz@infradead.org, 
	parri.andrea@gmail.com, longman@redhat.com, boqun.feng@gmail.com, 
	arnd@arndb.de, will@kernel.org, corbet@lwn.net, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_200412_258319_410E324D 
X-CRM114-Status: GOOD (  23.58  )
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

T24gTW9uLCBEZWMgMTYsIDIwMjQgYXQgNToxNeKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBn
aGl0aS5mcj4gd3JvdGU6Cj4KPiBIaSBHdW8sCj4KPiBPbiAxNC8xMi8yMDI0IDA1OjM1LCBndW9y
ZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGli
YWJhLmNvbT4KPiA+Cj4gPiBXaGVuIENPTkZJR19SSVNDVl9DT01CT19TUElOTE9DS1MgaXMgZW5h
YmxlZCwgcGVybWl0IHFzcGlubG9jawo+ID4gZm9yY2UgZW5hYmxlZC4gU2VlIHRoZSBLY29uZmln
IGVudHJ5IGZvciBSSVNDVl9DT01CT19TUElOTE9DS1MuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
R3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogR3Vv
IFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICAgRG9jdW1lbnRhdGlvbi9hZG1p
bi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgfCAgNSArKysrKwo+ID4gICBhcmNoL3Jpc2N2
L2tlcm5lbC9zZXR1cC5jICAgICAgICAgICAgICAgICAgICAgICB8IDEzICsrKysrKysrKysrKy0K
PiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFt
ZXRlcnMudHh0IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50
eHQKPiA+IGluZGV4IDM4NzJiYzZlYzQ5ZC4uNDNkMGRmMjkyMmIyIDEwMDY0NAo+ID4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0Cj4gPiBAQCAt
NTg4Nyw2ICs1ODg3LDExIEBACj4gPiAgICAgICAgICAgICAgICAgICAgICAgW0tOTF0gRGlzYWJs
ZSByaW5nIDMgTU9OSVRPUi9NV0FJVCBmZWF0dXJlIG9uIHN1cHBvcnRlZAo+ID4gICAgICAgICAg
ICAgICAgICAgICAgIENQVXMuCj4gPgo+ID4gKyAgICAgcmlzY3ZfZm9yY2VfcXNwaW5sb2NrIFtS
SVNDViwgRUFSTFldCj4gPiArICAgICAgICAgICAgICAgICAgICAgV2hlbiBDT05GSUdfUklTQ1Zf
Q09NQk9fU1BJTkxPQ0tTIGlzIGVuYWJsZWQsIHBlcm1pdAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIHFzcGlubG9jayBmb3JjZSBlbmFibGVkLiBTZWUgdGhlIEtjb25maWcgZW50cnkgZm9yCj4g
PiArICAgICAgICAgICAgICAgICAgICAgUklTQ1ZfQ09NQk9fU1BJTkxPQ0tTLgo+ID4gKwo+ID4g
ICAgICAgcmlzY3ZfaXNhX2ZhbGxiYWNrIFtSSVNDVixFQVJMWV0KPiA+ICAgICAgICAgICAgICAg
ICAgICAgICBXaGVuIENPTkZJR19SSVNDVl9JU0FfRkFMTEJBQ0sgaXMgbm90IGVuYWJsZWQsIHBl
cm1pdAo+ID4gICAgICAgICAgICAgICAgICAgICAgIGZhbGxpbmcgYmFjayB0byBkZXRlY3Rpbmcg
ZXh0ZW5zaW9uIHN1cHBvcnQgYnkgcGFyc2luZwo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL3NldHVwLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4gPiBpbmRleCA0NTAx
MGU3MWRmODYuLjc0YjEzYmM2NGM5YyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3NldHVwLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPiA+IEBAIC0yNDcs
NiArMjQ3LDE1IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwYXJzZV9kdGIodm9pZCkKPiA+ICAgI2lm
IGRlZmluZWQoQ09ORklHX1JJU0NWX0NPTUJPX1NQSU5MT0NLUykKPiA+ICAgREVGSU5FX1NUQVRJ
Q19LRVlfVFJVRShxc3BpbmxvY2tfa2V5KTsKPiA+ICAgRVhQT1JUX1NZTUJPTChxc3BpbmxvY2tf
a2V5KTsKPiA+ICsKPiA+ICtzdGF0aWMgYm9vbCBmb3JjZV9xc3BpbmxvY2s7Cj4gPiArCj4gPiAr
c3RhdGljIGludCBfX2luaXQgcmlzY3ZfZm9yY2VfcXNwaW5sb2NrKGNoYXIgKnApCj4gPiArewo+
ID4gKyAgICAgZm9yY2VfcXNwaW5sb2NrID0gdHJ1ZTsKPiA+ICsgICAgIHJldHVybiAwOwo+ID4g
K30KPiA+ICtlYXJseV9wYXJhbSgicmlzY3ZfZm9yY2VfcXNwaW5sb2NrIiwgcmlzY3ZfZm9yY2Vf
cXNwaW5sb2NrKTsKPiA+ICAgI2VuZGlmCj4gPgo+ID4gICBzdGF0aWMgdm9pZCBfX2luaXQgcmlz
Y3Zfc3BpbmxvY2tfaW5pdCh2b2lkKQo+ID4gQEAgLTI2Nyw3ICsyNzYsOSBAQCBzdGF0aWMgdm9p
ZCBfX2luaXQgcmlzY3Zfc3BpbmxvY2tfaW5pdCh2b2lkKQo+ID4gICAgICAgICAgICAgICB1c2lu
Z19leHQgPSAidXNpbmcgWmljY3JzZSI7Cj4gPiAgICAgICB9Cj4gPiAgICNpZiBkZWZpbmVkKENP
TkZJR19SSVNDVl9DT01CT19TUElOTE9DS1MpCj4gPiAtICAgICBlbHNlIHsKPiA+ICsgICAgIGVs
c2UgaWYgKGZvcmNlX3FzcGlubG9jaykgewo+ID4gKyAgICAgICAgICAgICB1c2luZ19leHQgPSAi
Zm9yY2UiOwo+ID4gKyAgICAgfSBlbHNlIHsKPiA+ICAgICAgICAgICAgICAgc3RhdGljX2JyYW5j
aF9kaXNhYmxlKCZxc3BpbmxvY2tfa2V5KTsKPiA+ICAgICAgICAgICAgICAgcHJfaW5mbygiVGlj
a2V0IHNwaW5sb2NrOiBlbmFibGVkXG4iKTsKPiA+ICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4K
PiBXaGF0J3MgdGhlIHVzZSBjYXNlIGZvciB0aGlzIGVhcmx5IHBhcmFtPyBUbyBtZSB0aGF0IGlt
cGxpZXMgdGhhdCBhCj4gcGxhdGZvcm0gbWF5IGhhdmUgYW5vdGhlciBleHRlbnNpb24gd2hpY2gg
d291bGQgYWxsb3cgdGhlIHVzYWdlIG9mCldlIHdhbnQgdG8gdXNlIGl0IGZvciBzZzIwNDIgJiB0
aDE1MjAuIE5vIG5ldyBleHRlbnNpb24gd2FzCmludHJvZHVjZWQsIGFuZCBzb21lIG1pY3JvLWFy
Y2hpdGVjdHVyZSBjb3VsZCBnaXZlIExSL1NDCmltcGxlbWVudGF0aW9uIGEgZm9yd2FyZCBwcm9n
cmVzcyBndWFyYW50ZWUgbW9yZSB0aGFuIHRoZSBzcGVjCnJlcXVpcmVkLgoKPiBxc3BpbmxvY2ss
IHNvIHdoeSBub3QgbGlzdGluZyBpdCBpbiByaXNjdl9zcGlubG9ja19pbml0KCkgaW5zdGVhZD8K
TGlzdCBhbGwgcGxhdGZvcm1zIGluIHJpc2N2X3NwaW5sb2NrX2luaXQgaXMgbm9pc3ksIG1heWJl
IGdpdmUgYQpxc3BpbmxvY2sgcGFyYW0gaW4gY21kbGluZSwgYW5kIHRoZXkgY291bGQgcHV0IGl0
IGluIHRoZWlyIGJvb3QgYXJncy4KCj4KPiBUaGFua3MsCj4KPiBBbGV4Cj4KCgotLSAKQmVzdCBS
ZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
