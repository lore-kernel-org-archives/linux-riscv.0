Return-Path: <SRS0=vaJP=W6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B03C3A5A2
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2019 14:32:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B9A9206B8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2019 14:32:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q4blVmso";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="To2J9hU4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B9A9206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IqDXE0hrsWBuUx4WskoOEo7kMRXKoZV6wSwDAGOLRRI=; b=Q4blVmsoGzS2d2
	r4/xwcdtjz77MYA0i/oVpulVbJ4aduzNqC1/pncXphdhLyUy7pc9vpwnLKfNrmMvNJiYZYIygBFTz
	pGaEZY7bQUfgxRIY++OsaSStNy2/9NvI1EQJueq4Jp1G3VyYB/84m9EZF17bQDUD+Xy2qFMCsYb7q
	AiQQZoor2jaRKlE1/qtLX2w0lVm1GJQIT20OWc0s8Ps9oN+Wn4Pf/8Py/k8eL/ASNUj0mERO88f7u
	ynIf9ddVK155lbNgCHX9bOZfOapByXoWxkKdVbIA5lguYZKe3pfmanB+mRf/aDWSSs129LxjOT/Ni
	2HWGNl9nH7QOTJJYQWaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i59r3-00071l-3a; Tue, 03 Sep 2019 14:32:21 +0000
Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i59r1-00071N-30
 for linux-riscv@lists.infradead.org; Tue, 03 Sep 2019 14:32:20 +0000
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id x83EVte1017186
 for <linux-riscv@lists.infradead.org>; Tue, 3 Sep 2019 23:31:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x83EVte1017186
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1567521116;
 bh=peXU42EyKwQnnz8I8342mhS/H7burl4NL19/9YgGjD0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=To2J9hU4oq963etpjneGoIRkK8muL4ge1eFeFd+JOKSAJyIFu3eQLEfFuPe/7fCfD
 T6Ev74+Bkwbd1zwYdlvOP/d2NpKZCY+Hzd8zQD1nzMEigbEsphDDV/eIrwuyVYscvM
 j0A2ou96yem5vS0c3y30DGhGUicO2XSK2Rst8fxojqelE7n4rTVQBy1a5c0h8ImzIr
 rGlQg/N9hc6wngoGrFAX16cLhWEnalbrkeA0kX3OCEtSbM1PYQQre9cTthEKjkO2A7
 ECX/HlIMqBK/5owGmVEGMlrjUp2m2wbc6DhoPmskMp4Gs9OBrMAgV/SpAdK3DsI0ri
 PBR0ztSiH6jAA==
X-Nifty-SrcIP: [209.85.222.52]
Received: by mail-ua1-f52.google.com with SMTP id h23so1514116uao.10
 for <linux-riscv@lists.infradead.org>; Tue, 03 Sep 2019 07:31:55 -0700 (PDT)
X-Gm-Message-State: APjAAAXRxDCqNyLn2KkVNDCMA3RPoEXSMW+3aDAT9uje/7m3mH5sHOOv
 OxKWCduptq4Cw9L9IezPSXfnQ9cv053Ws8yqyS8=
X-Google-Smtp-Source: APXvYqx4IX1fbc76BZv6H/GxXFHjyN7GN25SCkBJrPe9gxiGH6cezOB6+0NoGTi8i0Op3jHd2IuwId/eGsLoOtOPNkg=
X-Received: by 2002:a9f:2213:: with SMTP id 19mr4944903uad.25.1567521114572;
 Tue, 03 Sep 2019 07:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190821092658.32764-1-yamada.masahiro@socionext.com>
 <20190826113526.GA23425@infradead.org>
 <CAK7LNAQ_5Hz_CXAdx8W0bLjMWQ08KDWK3gG2pfDZOEE+cr0KEw@mail.gmail.com>
 <20190830155322.GA30046@infradead.org>
 <CAK7LNAR2JuZkdJGxO=f2hUxmQca5d7430NC-2hiqZwkJphJ9sA@mail.gmail.com>
 <20190902074256.GA754@infradead.org>
In-Reply-To: <20190902074256.GA754@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 3 Sep 2019 23:31:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNASMx7XBDUALd+UOj1jw=0kU-XoJBExCpSvKyQwV37mz7A@mail.gmail.com>
Message-ID: <CAK7LNASMx7XBDUALd+UOj1jw=0kU-XoJBExCpSvKyQwV37mz7A@mail.gmail.com>
Subject: Re: [PATCH] riscv: add arch/riscv/Kbuild
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_073219_348481_22DAA945 
X-CRM114-Status: GOOD (  16.29  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBTZXAgMiwgMjAxOSBhdCA0OjQyIFBNIENocmlzdG9waCBIZWxsd2lnIDxoY2hAaW5m
cmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsIEF1ZyAzMSwgMjAxOSBhdCAxMDowNDo1M1BN
ICswOTAwLCBNYXNhaGlybyBZYW1hZGEgd3JvdGU6Cj4gPiBLYnVpbGQgc3VwcG9ydCB0d28gZmls
ZSBuYW1lcywgIk1ha2VmaWxlIiBhbmQgIktidWlsZCIKPiA+IGZvciBkZXNjcmliaW5nIG9iai15
LCBvYmotbSwgZXRjLgo+Cj4gPHNuaXBwaW5nIHRoZSBiYXNpYyBleHBsYW5hdGlvbiwgd2hpY2gg
aXMgZG9jdW1lbnRlZCBwcmV0dHkgd2VsbCwKPiBJIEkgdGhpbmsgSSBmdWxsIHVuZGVyc3RhbmQ+
Cj4KPiA+IFNpbWlsYXJseSwgYXJjaC8kKFNSQ0FSQ0gpL01ha2VmaWxlIGlzIHZlcnkgc3BlY2lh
bAo+ID4gaW4gdGhhdCBpdCBpcyBpbmNsdWRlZCBmcm9tIHRoZSB0b3AtbGV2ZWwgTWFrZWZpbGUs
Cj4gPiBhbmQgc3BlY2lmeSBhcmNoLXNwZWNpZmljIGNvbXBpbGVyIGZsYWdzIGV0Yy4KPiA+Cj4g
PiBXZSBjYW4gdXNlIGFyY2gvJChTUkNBUkNIKS9LYnVpbGQKPiA+IHRvIHNwZWNpZnkgb2JqLXks
IG9iai1tLgo+ID4gVGhlIHRvcC1sZXZlbCBNYWtlZmlsZSBkb2VzIG5vdCBuZWVkIHRvIGtub3cK
PiA+IHRoZSBkaXJlY3Rvcnkgc3RydWN0dXJlIHVuZGVyIGFyY2gvJChTUkNBUkNIKS8uCj4gPgo+
ID4gVGhpcyBpcyBsb2dpY2FsIHNlcGFyYXRpb24uCj4KPiBCdXQgb25seSBpZiB3ZSBkb2N1bWVu
dCB0aGlzIHNwZWNpZmljIHNwbGl0IGFuZCBldmVudHVhbGx5IHN0b3AgYWxsb3dpbmcKPiB0byBi
dWlsZCBvYmplY3RzIGZyb20gYXJjaC8kKFNSQ0FSQ0gpL01ha2VmaWxlLgoKSSBsaWtlIHRoaXMg
aWRlYSwgYnV0IGl0IHdvdWxkIGNoYW5nZSB0aGUgbGluayBvcmRlciAoaS5lLiBwcm9iZSBvcmRl
cikKCkZvciBleGFtcGxlLCBJIHdhbnQgbW92ZSBhbGwgZHJpdmVycy15IGluIGFyY2gveDg2L01h
a2VmaWxlCnRvIGFyY2gveDg2L0tidWlsZC4KCkkgZG8gbm90IGtub3cgaG93IG11Y2ggd2UgY2Fy
ZSBhYm91dCB0aGUgcHJvYmUgb3JkZXIuCgoKPiAgQW5kIGluIG15IHBlcmZlY3Qgd29ybGQKPiB3
ZSdkIGV2ZW50dWFsbHkgcGhhc2Ugb3V0IHRoZSBtYWdpYyBhcmNoLyQoU1JDQVJDSCkvTWFrZWZp
bGUgZW50aXJlxYB5Lgo+IEluIGFkZGl0aW9uIHRvIHRoZSBub3JtYWwgS2J1aWxkIGZpbGUgd2Un
ZCB0aGVuIGhhdmUgc2F5IChuYW1lcyBlbnRpcmVseQo+IG1hZGUgdXAgYW5kIHByb2JhYmx5IG5v
dCB0aGUgYmVzdCBpZGVhKQo+Cj4gICBhcmNoLyQoU1JDQVJDSCkvZmxhZ3MubWsgdG8gc2V0IHRo
ZSB2YXJpb3VzIGNvbXBpbGVyIGZsYWdzIGFuZCBjbwo+ICAgYXJjaC8kKFNSQ0FSQ0gpL3Rhcmdl
dHMubWsgZm9yIGV4dHJhIGFyY2gtc3BlY2lmaWMgdGFyZ2V0cwoKSSBhbSBub3Qgc3VyZSB3aGV0
aGVyIHRoaXMgc3BsaXQgaXMgYSBnb29kIGlkZWEuCldoYXQgaXMgdGhlIHByb2JsZW0gd2l0aCBo
YXZpbmcgdGhlIHNpbmdsZSBhcmNoLU1ha2VmaWxlPwoKCi0tIApCZXN0IFJlZ2FyZHMKTWFzYWhp
cm8gWWFtYWRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
