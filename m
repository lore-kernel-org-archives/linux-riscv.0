Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D20C38A2D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Oct 2022 02:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcXQm7J5kbACuVy8jFMfoDGx4ijMcJEPdcuy8bqibj4=; b=GulFvkEUcTDCqd
	Wq/C2HnAlaVUrRs5/V6mfOUswRfgnlKpHeDjtPdPsR1rTeveGIT+d6FdaEvmcXKb6+SsCCVQ6aOCI
	G52qyTYbXToTgGEaD43KVMKZzQNM6wG35srkDYuukwpcaAgbcnEq/ozd7Tuj3QsYb/PFgL6K1B113
	2Qt3oijLPTUnyMagWYLhT+dpCnp+pu+/NHuB3V716nSuBtFgbWcc7CYjBN0vYA4HLOlPL1LIo6TD9
	8Fx5H4V9O6deJfDZpbh2JHKSsYb7kVRxBzM+1G2KIlK1D9ORYI2F72iPmBZ14Ey/ZrjatNPisXf8L
	kYNLTy6nW4P/6vVlFYHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on9od-003eo8-Dk; Tue, 25 Oct 2022 02:37:19 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on9oa-003ekp-Fg
	for linux-riscv@lists.infradead.org; Tue, 25 Oct 2022 02:37:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 4B4A9CE1B24
	for <linux-riscv@lists.infradead.org>; Tue, 25 Oct 2022 02:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927E5C43140
	for <linux-riscv@lists.infradead.org>; Tue, 25 Oct 2022 02:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666665427;
	bh=JA84N9WO2TmET99sX5eCB++lHmqV7Efj8StS7V4zZrE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D3OuhF34gR5RgDg2U60zsEBErN9HIETg1Rf/pWQXpywrPyt9e9CyR6lMIaoooUNPb
	 hBEJzjLEKtaVeO8ua8TNszqaOqlJZm1k8nOrs9qSgnU1zBM8zFIMIf0+qwQ0fSGwDS
	 Lo/6ffITsfoveHLpafnRWJ9YuCV5+0FA5kHTXJjSR5KkDXrphTGwG79aqS/jj49631
	 WRPFBKGlOgdMoU9cOLXGhr2kR5zKsqEMjlYW0Jrq6/iMW230SvsMv1JSXQIO4MAyc/
	 ZP05LuEVMjfASExdgIs1GcHWYZPjgh3UMmow7affjM6+ea9WcLHsNhsSOi2Gn0vRue
	 H3+Ncm1wbhpOA==
Received: by mail-oo1-f54.google.com with SMTP id z194-20020a4a49cb000000b00480dc60b905so1647713ooa.4
        for <linux-riscv@lists.infradead.org>; Mon, 24 Oct 2022 19:37:07 -0700 (PDT)
X-Gm-Message-State: ACrzQf3Ky/tbqnnznbvcGJ7KZslz0Y64PEh4SqSXAnZuB5TfzrzuDTdS
	J9yfiqJenj7DpZ2DlCm8fwvWDLx9E03LK7R6edA=
X-Google-Smtp-Source: AMsMyM5IoTpxXuNt5TpA0kB/nNR4wZxH/vqFwOrKOI+KR3Vs1NONL8jFM/czimrMdFZ5XFBgHPX+HjIY2v8RdsoAcXE=
X-Received: by 2002:a4a:2144:0:b0:481:a4:d2b0 with SMTP id u65-20020a4a2144000000b0048100a4d2b0mr8825891oou.48.1666665426275;
 Mon, 24 Oct 2022 19:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221002012451.2351127-1-guoren@kernel.org> <20221002012451.2351127-2-guoren@kernel.org>
 <f0785930-8f2a-9d09-4dbf-545d11994cbe@huawei.com>
In-Reply-To: <f0785930-8f2a-9d09-4dbf-545d11994cbe@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 25 Oct 2022 10:36:54 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQLBycxqXfguWpSeNANiJ2ReMraNp_jaCd2UtWT8Oknqw@mail.gmail.com>
Message-ID: <CAJF2gTQLBycxqXfguWpSeNANiJ2ReMraNp_jaCd2UtWT8Oknqw@mail.gmail.com>
Subject: Re: [PATCH V6 01/11] riscv: elf_kexec: Fixup compile warning
To: "liaochang (A)" <liaochang1@huawei.com>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com, 
	zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com, 
	chenzhongjin@huawei.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_193716_895611_BE7082DE 
X-CRM114-Status: GOOD (  19.14  )
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

T24gVHVlLCBPY3QgMjUsIDIwMjIgYXQgOToyMCBBTSBsaWFvY2hhbmcgKEEpIDxsaWFvY2hhbmcx
QGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4KPgo+IOWcqCAyMDIyLzEwLzIgOToyNCwgZ3VvcmVuQGtl
cm5lbC5vcmcg5YaZ6YGTOgo+ID4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEu
Y29tPgo+ID4KPiA+IElmIENSWVRQTyBvciBDUllQVE9fU0hBMjU2IG9yIEtFWEVfRklMRSBpcyBu
b3QgZW5hYmxlZCwgdGhlbjoKPiA+Cj4gPiBDT01QSUxFUl9JTlNUQUxMX1BBVEg9JEhPTUUvMGRh
eSBDT01QSUxFUj1nY2MtMTIuMS4wIG1ha2UuY3Jvc3MgVz0xCj4gPiBPPWJ1aWxkX2RpciBBUkNI
PXJpc2N2IFNIRUxMPS9iaW4vYmFzaCBhcmNoL3Jpc2N2Lwo+ID4KPiA+IC4uL2FyY2gvcmlzY3Yv
a2VybmVsL2VsZl9rZXhlYy5jOiBJbiBmdW5jdGlvbiAnZWxmX2tleGVjX2xvYWQnOgo+ID4gLi4v
YXJjaC9yaXNjdi9rZXJuZWwvZWxmX2tleGVjLmM6MTg1OjIzOiB3YXJuaW5nOiB2YXJpYWJsZQo+
ID4gJ2tlcm5lbF9zdGFydCcgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJp
YWJsZV0KPiA+ICAgMTg1IHwgICAgICAgICB1bnNpZ25lZCBsb25nIGtlcm5lbF9zdGFydDsKPiA+
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fgo+ID4KPiA+IEZpeGVz
OiA4MzhiM2UyODQ4OGYgKCJSSVNDLVY6IExvYWQgcHVyZ2F0b3J5IGluIGtleGVjX2ZpbGUiKQo+
ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4g
U2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiBSZXZpZXdlZC1i
eTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiA+IFJlcG9ydGVk
LWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gv
cmlzY3Yva2VybmVsL2VsZl9rZXhlYy5jIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC9lbGZfa2V4ZWMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2VsZl9rZXhlYy5jCj4gPiBp
bmRleCAwY2I5NDk5MmMxNWIuLjRiOTI2NDM0MGI3OCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL2VsZl9rZXhlYy5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbGZfa2V4
ZWMuYwo+ID4gQEAgLTE5OCw3ICsxOTgsNyBAQCBzdGF0aWMgdm9pZCAqZWxmX2tleGVjX2xvYWQo
c3RydWN0IGtpbWFnZSAqaW1hZ2UsIGNoYXIgKmtlcm5lbF9idWYsCj4gPiAgICAgICBpZiAocmV0
KQo+ID4gICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+ICAgICAgIGtlcm5lbF9zdGFydCA9IGlt
YWdlLT5zdGFydDsKPiA+IC0gICAgIHByX25vdGljZSgiVGhlIGVudHJ5IHBvaW50IG9mIGtlcm5l
bCBhdCAweCVseFxuIiwgaW1hZ2UtPnN0YXJ0KTsKPiA+ICsgICAgIHByX25vdGljZSgiVGhlIGVu
dHJ5IHBvaW50IG9mIGtlcm5lbCBhdCAweCVseFxuIiwga2VybmVsX3N0YXJ0KTsKPiA+Cj4gPiAg
ICAgICAvKiBBZGQgdGhlIGtlcm5lbCBiaW5hcnkgdG8gdGhlIGltYWdlICovCj4gPiAgICAgICBy
ZXQgPSByaXNjdl9rZXhlY19lbGZfbG9hZChpbWFnZSwgJmVoZHIsICZlbGZfaW5mbywKPgo+IExH
VE0KPgo+IFJldmlld2VkLWJ5OiBMaWFvIENoYW5nIDxsaWFvY2hhbmcxQGh1YXdlaS5jb20+ClRo
eAoKPgo+IC0tCj4gQlIsCj4gTGlhbywgQ2hhbmcKCgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
