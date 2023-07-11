Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B4AEB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 14:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vBX4B0dxmxBIXX9lGNwcxC0iB4Wc8WHWQXcha3uI5Vc=; b=ZytDnHGGrdCREr
	evdnnw8UgjAex8PlhqJXqVhe9SvglAXUNO1hhoidG/Kf3qjnkApiXjYpp3/kKazvVwl8R4pFKcqhh
	QMFLgStt1a5HtnrVfqSLH+1P6l6QP8QlY0SgZ4VIrOh3ALD04RzoJyjsoT5Sg8i/dV7H0zOZF4+uU
	4ie51rR6pJ++vQubI7xI6TTfaFmIlExUSfuVJ2orctMNXkmO4ZSCFQSrZEO7o84qtVGVh8/+vJCpi
	dHrtBx6IECQESGNnRusK/apCfskJNtVzMorH79o9C+jP4rIvsgaX8t499NvtCILcamc52H9FdS3Ro
	xNNBB/9r0CIxdfzs8XFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJE0n-00F4Iw-1l;
	Tue, 11 Jul 2023 14:06:41 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJE0k-00F4Go-2p
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 14:06:40 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1b055511b85so4423265fac.2
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 07:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689084396; x=1691676396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtrkZvukDlSziDN0KAKNR+HUJU/841tM48VnLXRDDo8=;
        b=gVd/zFyUl9h+6SBBXjG51zIBilQ1u4dSoyT8qx7Bso6co7Yaj2St+v85ljUCtMqbW3
         jyXUt75WjxaqgXrCu2um1Bzcd58A912zP27YhTBdKhrAPAXatLpXGa5CwQsFiZZ/LepT
         2Cs7PHpk6HVlMty/bcidQRJaivdCTJS8abXDcYiX39XhqGsq5WiWF6MZYuTtgxrVB62C
         av6afEwP7eOx3UyW4T9n38jj49kdRBp7HcCPG2BwRfLclpRBxJrsPd7GazP1QIlw2fg6
         MyhGbKXrUaiMaOvl6f/RZtdwLSndEX9zVxK23opWkOO5wuAt/jPi9zRgmD9TPV4hflBI
         nywQ==
X-Gm-Message-State: ABy/qLa/esEl5vXbmR2B6O7y3nYOpWIxhWC3z+DV/tEiOd/fIS9VhI4t
	aH30s2iCXFguyt544Npw3wyvigj6AGLKXQ==
X-Google-Smtp-Source: APBJJlFbyWhiFGyu3pwjX9KvLxIXR+YLIu+hndghaEjmZn/EQui73VG0OBIC/Phj166DHBy1H4/ZtQ==
X-Received: by 2002:a05:6870:f60f:b0:1b7:4521:2f2 with SMTP id ek15-20020a056870f60f00b001b7452102f2mr4450680oab.32.1689084396030;
        Tue, 11 Jul 2023 07:06:36 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id i2-20020a056870344200b001a9911765efsm1021347oah.40.2023.07.11.07.06.35
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 07:06:35 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6b711c3ad1fso4686111a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 07:06:35 -0700 (PDT)
X-Received: by 2002:a9d:560a:0:b0:6b8:83ca:560a with SMTP id
 e10-20020a9d560a000000b006b883ca560amr13140949oti.18.1689084395442; Tue, 11
 Jul 2023 07:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230511181931.869812-1-tj@kernel.org> <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org> <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
In-Reply-To: <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Jul 2023 16:06:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
Message-ID: <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
Subject: Re: Consider switching to WQ_UNBOUND messages (was: Re: [PATCH v2
 6/7] workqueue: Report work funcs that trigger automatic CPU_INTENSIVE mechanism)
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, 
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-team@meta.com, 
	Linux PM list <linux-pm@vger.kernel.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, linux-rtc@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, netdev <netdev@vger.kernel.org>, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, Linux MMC List <linux-mmc@vger.kernel.org>, 
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_070638_912031_F262371D 
X-CRM114-Status: GOOD (  25.55  )
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

T24gVHVlLCBKdWwgMTEsIDIwMjMgYXQgMzo1NeKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+Cj4gSGkgVGVqdW4sCj4KPiBPbiBGcmksIE1heSAx
MiwgMjAyMyBhdCA5OjU04oCvUE0gVGVqdW4gSGVvIDx0akBrZXJuZWwub3JnPiB3cm90ZToKPiA+
IFdvcmtxdWV1ZSBub3cgYXV0b21hdGljYWxseSBtYXJrcyBwZXItY3B1IHdvcmsgaXRlbXMgdGhh
dCBob2cgQ1BVIGZvciB0b28KPiA+IGxvbmcgYXMgQ1BVX0lOVEVOU0lWRSwgd2hpY2ggZXhjbHVk
ZXMgdGhlbSBmcm9tIGNvbmN1cnJlbmN5IG1hbmFnZW1lbnQgYW5kCj4gPiBwcmV2ZW50cyBzdGFs
bGluZyBvdGhlciBjb25jdXJyZW5jeS1tYW5hZ2VkIHdvcmsgaXRlbXMuIElmIGEgd29yayBmdW5j
dGlvbgo+ID4ga2VlcHMgcnVubmluZyBvdmVyIHRoZSB0aGVyc2hvbGQsIGl0IGxpa2VseSBuZWVk
cyB0byBiZSBzd2l0Y2hlZCB0byB1c2UgYW4KPiA+IHVuYm91bmQgd29ya3F1ZXVlLgo+ID4KPiA+
IFRoaXMgcGF0Y2ggYWRkcyBhIGRlYnVnIG1lY2hhbmlzbSB3aGljaCB0cmFja3MgdGhlIHdvcmsg
ZnVuY3Rpb25zIHdoaWNoCj4gPiB0cmlnZ2VyIHRoZSBhdXRvbWF0aWMgQ1BVX0lOVEVOU0lWRSBt
ZWNoYW5pc20gYW5kIHJlcG9ydCB0aGVtIHVzaW5nCj4gPiBwcl93YXJuKCkgd2l0aCBleHBvbmVu
dGlhbCBiYWNrb2ZmLgo+ID4KPiA+IHYyOiBEcm9wIGJvdW5jaW5nIHRocm91Z2gga3RocmVhZF93
b3JrZXIgZm9yIHByaW50aW5nIG1lc3NhZ2VzLiBJdCB3YXMgdG8KPiA+ICAgICBhdm9pZCBpbnRy
b2R1Y2luZyBjaXJjdWxhciBsb2NraW5nIGRlcGVuZGVuY3kgYnV0IHdhc24ndCBlZmZlY3RpdmUg
YXMgaXQKPiA+ICAgICBzdGlsbCBoYWQgcG9vbCBsb2NrIC0+IHdjaV9sb2NrIC0+IHByaW50ayAt
PiBwb29sIGxvY2sgbG9vcC4gTGV0J3MganVzdAo+ID4gICAgIHByaW50IGRpcmVjdGx5IHVzaW5n
IHByaW50a19kZWZlcnJlZCgpLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFRlanVuIEhlbyA8dGpA
a2VybmVsLm9yZz4KPiA+IFN1Z2dlc3RlZC1ieTogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZy
YWRlYWQub3JnPgo+Cj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLCB3aGljaCBpcyBub3cgY29tbWl0
IDYzNjM4NDUwMDUyMDIxNDgKPiAoIndvcmtxdWV1ZTogUmVwb3J0IHdvcmsgZnVuY3MgdGhhdCB0
cmlnZ2VyIGF1dG9tYXRpYyBDUFVfSU5URU5TSVZFCj4gbWVjaGFuaXNtIikgaW4gdjYuNS1yYzEu
Cj4KPiBJIGd1ZXNzIHlvdSBhcmUgaW50ZXJlc3RlZCB0byBrbm93IHdoZXJlIHRoaXMgdHJpZ2dl
cnMuCj4gSSBlbmFibGVkIENPTkZJR19XUV9DUFVfSU5URU5TSVZFX1JFUE9SVD15LCBhbmQgdGVz
dGVkCj4gdGhlIHJlc3VsdCBvbiB2YXJpb3VzIG1hY2hpbmVzLi4uCgo+IE9yYW5nZUNyYWIvTGlu
dXgtb24tTGl0ZVgtVmV4UmlzY1Ygd2l0aCBodDE2azMzIDE0LXNlZyBkaXNwbGF5IGFuZCBzc2Qx
MzB4ZHJtZmI6Cj4KPiAgIHdvcmtxdWV1ZTogY2hlY2tfbGlmZXRpbWUgaG9nZ2VkIENQVSBmb3Ig
PjEwMDAwdXMgNCB0aW1lcywgY29uc2lkZXIKPiBzd2l0Y2hpbmcgdG8gV1FfVU5CT1VORAo+ICAg
d29ya3F1ZXVlOiBkcm1fZmJfaGVscGVyX2RhbWFnZV93b3JrIGhvZ2dlZCBDUFUgZm9yID4xMDAw
MHVzIDEwMjQKPiB0aW1lcywgY29uc2lkZXIgc3dpdGNoaW5nIHRvIFdRX1VOQk9VTkQKPiAgIHdv
cmtxdWV1ZTogZmJfZmxhc2hjdXJzb3IgaG9nZ2VkIENQVSBmb3IgPjEwMDAwdXMgMTI4IHRpbWVz
LAo+IGNvbnNpZGVyIHN3aXRjaGluZyB0byBXUV9VTkJPVU5ECj4gICB3b3JrcXVldWU6IGh0MTZr
MzNfc2VnMTRfdXBkYXRlIGhvZ2dlZCBDUFUgZm9yID4xMDAwMHVzIDEyOCB0aW1lcywKPiBjb25z
aWRlciBzd2l0Y2hpbmcgdG8gV1FfVU5CT1VORAo+ICAgd29ya3F1ZXVlOiBtbWNfcmVzY2FuIGhv
Z2dlZCBDUFUgZm9yID4xMDAwMHVzIDEyOCB0aW1lcywgY29uc2lkZXIKPiBzd2l0Y2hpbmcgdG8g
V1FfVU5CT1VORAoKR290IG9uZSBtb3JlIGFmdGVyIGEgd2hpbGU6Cgp3b3JrcXVldWU6IG5laWdo
X21hbmFnZWRfd29yayBob2dnZWQgQ1BVIGZvciA+MTAwMDB1cyA0IHRpbWVzLApjb25zaWRlciBz
d2l0Y2hpbmcgdG8gV1FfVU5CT1VORAoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAg
ICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMg
b2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFs
IGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFj
a2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9n
cmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
