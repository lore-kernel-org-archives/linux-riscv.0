Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D857EEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 11:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V98FRVV5Yo4QDQ9Go4lbnlYyqEJw3DNmFde8BREi9AU=; b=hZkP27PrkNvaiA
	8RR8ce3GLknrXxokxxb9VbGZGXQMSJh0Z+ACJJlSDdTJ5e8be/JOCiQBwy+28j2AI51T8AKtT+Gfd
	k4vOXgSIcBOQGTync62rgtiK4xTxNwSrTcaAIt2woSnmZrvvHGnxDbTdlambpKyu9GcMClW86LNN0
	Pzc8UkxGa8UcMwF23NYvHpQCzJkXd/MsJq7x/pNwJ9MmMecpsWfRyU8U0P42VmIu/70EE/aBudfMU
	h/FGWsYhnWavacgg6pAU10osCotOJyDMg85jf7ftxKzWXBJMmqrcYWKJGSVNgxzDmKiYJbpvTvJsI
	DdAucYmIg60NCY8+nBfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFC6u-003Zk2-0I;
	Fri, 30 Jun 2023 11:16:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFC6r-003ZjA-0F
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 11:16:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2676961714
	for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 11:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CD7C433CD
	for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 11:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688123775;
	bh=Qg6mtJKrAYAKJ/g+ZZims8G6rMhWUl/iHHzBDRbgkt8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FAt/tTKQD2GJsTXXg46D0dmIOpXB7x8kqbM9hJKn6kR3dWvDwvb1piYc0BJDmWRM7
	 CJ5AnqZSgnE3r8jXkawG7AlPkd70Pxa8eStDuoq8haB+WZIogBI8fk8hjHeCGLrdKQ
	 /ja/9udU6YLY8jqGJfbBUn6PHCSmKdiP4I5bE6vVrA2tIw+MPtm2Mmg610+bLdj01a
	 8MHmsGuFDLMg+pDfxWVJ8dG2+7ES27HIqTaUWzI1EEV3iY3PX/jaX5eqBZpfS6wnzI
	 Gaw6Sv5LliIFsCQ/Ei+/KtrPL0VNPGZx+klbvhVVyBH24/3xceTHmlfosoBbQK3Yn1
	 RQfTQ8BY1j4wg==
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fba545d743so19924435e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 04:16:14 -0700 (PDT)
X-Gm-Message-State: AC+VfDynZ4km436pcLigs5qTmLhVwYMn4hyxrQ00UiRwc4YHju7nKhDC
	Ks42MN4eeBdf32KxOkbeTALKizr0/Hg64/C+LQE=
X-Google-Smtp-Source: ACHHUZ40bhVMwu6PtmLXC7PKR9i31qcI1Ik0b5RtktK7GbB/gRM2EyRl/TpExinoDJ8sTXblct7BlMBvZcymTfy6wuI=
X-Received: by 2002:a05:600c:21c5:b0:3f9:c0f8:de72 with SMTP id
 x5-20020a05600c21c500b003f9c0f8de72mr1790329wmj.7.1688123773271; Fri, 30 Jun
 2023 04:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230222033021.983168-1-guoren@kernel.org> <20230222033021.983168-5-guoren@kernel.org>
 <ZJ2PBosSQtSX28Mf@wychelm>
In-Reply-To: <ZJ2PBosSQtSX28Mf@wychelm>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 30 Jun 2023 07:16:01 -0400
X-Gmail-Original-Message-ID: <CAJF2gTRPYDxDpia=o6oqbt_8_5hqAQk-pwY1uPwUjcxCFg1EPw@mail.gmail.com>
Message-ID: <CAJF2gTRPYDxDpia=o6oqbt_8_5hqAQk-pwY1uPwUjcxCFg1EPw@mail.gmail.com>
Subject: Re: [PATCH -next V17 4/7] riscv: entry: Convert to generic entry
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	mark.rutland@arm.com, ben@decadent.org.uk, bjorn@kernel.org, 
	palmer@dabbelt.com, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Yipeng Zou <zouyipeng@huawei.com>, Vincent Chen <vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_041617_214630_9BD17647 
X-CRM114-Status: GOOD (  24.81  )
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

T24gVGh1LCBKdW4gMjksIDIwMjMgYXQgMTA6MDLigK9BTSBEYW5pZWwgVGhvbXBzb24KPGRhbmll
bC50aG9tcHNvbkBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgRmViIDIxLCAyMDIzIGF0
IDEwOjMwOjE4UE0gLTA1MDAsIGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+ID4gRnJvbTogR3Vv
IFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4KPiA+IFRoaXMgcGF0Y2ggY29udmVy
dHMgcmlzY3YgdG8gdXNlIHRoZSBnZW5lcmljIGVudHJ5IGluZnJhc3RydWN0dXJlIGZyb20KPiA+
IGtlcm5lbC9lbnRyeS8qLiBUaGUgZ2VuZXJpYyBlbnRyeSBtYWtlcyBtYWludGFpbmVycycgd29y
ayBlYXNpZXIgYW5kCj4gPiBjb2RlcyBtb3JlIGVsZWdhbnQuIEhlcmUgYXJlIHRoZSBjaGFuZ2Vz
Ogo+ID4KPiA+ICAtIE1vcmUgY2xlYXIgZW50cnkuUyB3aXRoIGhhbmRsZV9leGNlcHRpb24gYW5k
IHJldF9mcm9tX2V4Y2VwdGlvbgo+ID4gIC0gR2V0IHJpZCBvZiBjb21wbGV4IGN1c3RvbSBzaWdu
YWwgaW1wbGVtZW50YXRpb24KPiA+ICAtIE1vdmUgc3lzY2FsbCBwcm9jZWR1cmUgZnJvbSBhc3Nl
bWJseSB0byBDLCB3aGljaCBpcyBtdWNoIG1vcmUKPiA+ICAgIHJlYWRhYmxlLgo+ID4gIC0gQ29u
bmVjdCByZXRfZnJvbV9mb3JrICYgcmV0X2Zyb21fa2VybmVsX3RocmVhZCB0byBnZW5lcmljIGVu
dHJ5Lgo+ID4gIC0gV3JhcCB3aXRoIGlycWVudHJ5X2VudGVyL2V4aXQgYW5kIHN5c2NhbGxfZW50
ZXIvZXhpdF9mcm9tX3VzZXJfbW9kZQo+ID4gIC0gVXNlIHRoZSBzdGFuZGFyZCBwcmVlbXB0aW9u
IGNvZGUgaW5zdGVhZCBvZiBjdXN0b20KPiA+Cj4gPiBTdWdnZXN0ZWQtYnk6IEh1YWNhaSBDaGVu
IDxjaGVuaHVhY2FpQGtlcm5lbC5vcmc+Cj4gPiBSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8
Ympvcm5Acml2b3NpbmMuY29tPgo+ID4gVGVzdGVkLWJ5OiBZaXBlbmcgWm91IDx6b3V5aXBlbmdA
aHVhd2VpLmNvbT4KPiA+IFRlc3RlZC1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwu
b3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29t
Pgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiBDYzog
QmVuIEh1dGNoaW5ncyA8YmVuQGRlY2FkZW50Lm9yZy51az4KPgo+IEFwb2xvZ2llcyBmb3IgdGhl
IGxhdGUgZmVlZGJhY2sgYnV0IEkndmUgYmVlbiBzd2FtcGVkIGxhdGVseSBhbmQgb25seQo+IHJl
Y2VudGx5IGdvdCByb3VuZCB0byBydW5uaW5nIHRoZSBmdWxsIGtnZGIgdGVzdCBzdWl0ZSBvbiB0
aGUgdjYuNAo+IHNlcmllcy4KPgo+IFRoZSBrZ2RiIHRlc3Qgc3VpdGUgaW5jbHVkZXMgYSBjb3Vw
bGUgb2YgdGVzdHMgdGhhdCB2ZXJpZnkgdGhhdCB0aGUKPiBzeXN0ZW0gcmVzdW1lcyBhZnRlciBi
cmVha3BvaW50aW5nIGR1ZSB0byBhIEJVRygpOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9kYW5pZWwt
dGhvbXBzb24va2dkYnRlc3QvYmxvYi9tYXN0ZXIvdGVzdHMvdGVzdF9rZGJfZmF1bHRfaW5qZWN0
aW9uLnB5I0wyNC1MNDUKPgo+IFRoZXNlIHRlc3RzIGhhdmUgcmVncmVzc2VkIG9uIHJpc2N2IGJl
dHdlZW4gdjYuMyBhbmQgdjYuNCBhbmQgYSBiaXNlY3QKPiBpcyBwb2ludGluZyBhdCB0aGlzIHBh
dGNoLiBXaXRoIHRoZXNlIGNoYW5nZXMgaW4gcGxhY2UgdGhlbiwgYWZ0ZXIga2RiCj4gcmVzdW1l
cyB0aGUgc3lzdGVtLCB0aGUgQlVHKCkgbWVzc2FnZSBpcyBwcmludGVkIGFzIG5vcm1hbCBidXQg
dGhlbgo+IGltbWVkaWF0ZWx5IGZhaWxzLiBGcm9tIHRoZSBiYWNrdHJhY2UgaXQgbG9va3MgbGlr
ZSB0aGUgbmV3IGVudHJ5L2V4aXQKPiBjb2RlIGNhbm5vdCBhZHZhbmNlIHBhc3QgYSBjb21waWxl
ZCBicmVha3BvaW50IGluc3RydWN0aW9uOgo+IH5+fgo+IFBBTklDOiBGYXRhbCBleGNlcHRpb24g
aW4gaW50ZXJydXB0Ckl0IGNvbWVzIGZyb206CnZvaWQgZGllKHN0cnVjdCBwdF9yZWdzICpyZWdz
LCAuLi4KewouLi4KaWYgKGluX2ludGVycnVwdCgpKQogICAgICAgIHBhbmljKCJGYXRhbCBleGNl
cHRpb24gaW4gaW50ZXJydXB0Iik7Ci4uLgoKV2UgY291bGQgYWRkIGEgZHVtcF9iYWNrdHJhY2Ug
dG8gc2VlIHdoYXQgaGFwcGVuZWQ6CmlmIChpbl9pbnRlcnJ1cHQoKSkgeworICAgICAgZHVtcF9i
YWNrdHJhY2UocmVncywgTlVMTCwgS0VSTl9ERUZBVUxUKTsKICAgICAgICBwYW5pYygiRmF0YWwg
ZXhjZXB0aW9uIGluIGludGVycnVwdCIpOwp9CgoKCj4KPiBFbnRlcmluZyBrZGIgKGN1cnJlbnQ9
MHhmZjYwMDAwMDAxYTJhMjgwLCBwaWQgMTA0KSBvbiBwcm9jZXNzb3IgMSBkdWUgdG8KPiBOb25N
YXNrCj4gYWJsZSBJbnRlcnJ1cHQgQCAweGZmZmZmZmZmODAwYmIzYzQKPiBbMV1rZGI+IGJ0Cj4g
U3RhY2sgdHJhY2ViYWNrIGZvciBwaWQgMTA0Cj4gMHhmZjYwMDAwMDAxYTJhMjgwICAgICAgMTA0
ICAgICAgIDkyICAxICAgIDEgICBSICAweGZmNjAwMDAwMDFhMmFjNTAKPiAqZWNobwo+IENQVTog
MSBQSUQ6IDEwNCBDb21tOiBlY2hvIFRhaW50ZWQ6IEcgICAgICBECj4gNi4zLjAtcmMxLTAwMDAz
LWdmMGJkZGY1MDU4NmQgIzExOQo+IEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11IChE
VCkKPiBDYWxsIFRyYWNlOgo+IFs8ZmZmZmZmZmY4MDAwNTBkYz5dIGR1bXBfYmFja3RyYWNlKzB4
MWMvMHgyNAo+IFs8ZmZmZmZmZmY4MDg0NThmOD5dIHNob3dfc3RhY2srMHgyYy8weDM4Cj4gWzxm
ZmZmZmZmZjgwODUxYjAwPl0gZHVtcF9zdGFja19sdmwrMHgzYy8weDU0Cj4gWzxmZmZmZmZmZjgw
ODUxYjJjPl0gZHVtcF9zdGFjaysweDE0LzB4MWMKPiBbPGZmZmZmZmZmODAwYmM0Yjg+XSBrZGJf
ZHVtcF9zdGFja19vbl9jcHUrMHg2NC8weDY2Cj4gWzxmZmZmZmZmZjgwMGMzZDJhPl0ga2RiX3No
b3dfc3RhY2srMHg4Mi8weDg4Cj4gWzxmZmZmZmZmZjgwMGMzZGMwPl0ga2RiX2J0MSsweDkwLzB4
ZjIKPiBbPGZmZmZmZmZmODAwYzQyMDY+XSBrZGJfYnQrMHgzNGMvMHgzODQKPiBbPGZmZmZmZmZm
ODAwYzFkMjg+XSBrZGJfcGFyc2UrMHgyN2EvMHg2MTgKPiBbPGZmZmZmZmZmODAwYzI1NjY+XSBr
ZGJfbWFpbl9sb29wKzB4M2IyLzB4OGZhCj4gWzxmZmZmZmZmZjgwMGM0YzVhPl0ga2RiX3N0dWIr
MHgxYmEvMHgzYTgKPiBbPGZmZmZmZmZmODAwYmJiYTg+XSBrZ2RiX2NwdV9lbnRlcisweDM0Mi8w
eDViYQo+IFs8ZmZmZmZmZmY4MDBiYzNkYT5dIGtnZGJfaGFuZGxlX2V4Y2VwdGlvbisweGUwLzB4
MTFhCj4gWzxmZmZmZmZmZjgwMDA4MTBjPl0ga2dkYl9yaXNjdl9ub3RpZnkrMHg4Ni8weGI0Cj4g
WzxmZmZmZmZmZjgwMDJmMjEwPl0gbm90aWZ5X2RpZSsweDZhLzB4YTYKPiBbPGZmZmZmZmZmODAw
MDRkYjA+XSBoYW5kbGVfYnJlYWsrMHg3MC8weGUwCj4gWzxmZmZmZmZmZjgwODUyNDYyPl0gZG9f
dHJhcF9icmVhaysweDQ4LzB4NWMKPiBbPGZmZmZmZmZmODAwMDM1OTg+XSByZXRfZnJvbV9leGNl
cHRpb24rMHgwLzB4NjQKPiBbPGZmZmZmZmZmODAwYmIzYzQ+XSBrZ2RiX2NvbXBpbGVkX2JyZWFr
KzB4MC8weDE0Cj4gfn5+Cj4KPgo+IERhbmllbC4KCgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
