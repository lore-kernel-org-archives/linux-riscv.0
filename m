Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51690CD4F35
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 08:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zIjafEMKWkpTYBgc1FwdGzABK0MrYiEPWwEKeG2EFJc=; b=vbZOJYU/Vti6F4
	aU7xJ6riP0t3Ge2u8TH6e6aog/IziLGwcaoscqzBX2q1aaJ26CV0NVas3YvKIikQ3Fcbss1F+OEm/
	3i8WAbdZ6RfP/BZsiGs4bbsNFwcYofCkPaT+Ce2O9CxoY2a1Ji3+SQXS0D8LtAmyzkValLECTnIXa
	75gSijh4HRZAAnsfLsQYLrth9TAmKXIPyTvpl/OD1WDDLjESbzy/RGQPtX+4RvxM7pKa1ZuT9TMtD
	1L+RmzZRDo0i0DhvoMnmPXX9gRmNZCKMEPk6nZ/VcVND7ZMcIoZ2bZumZsngq7Ul7kv0Xbo6OV3QB
	+6tvUVyj77l8mUS4TC3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbx0-008SzG-1F;
	Fri, 22 Sep 2023 08:55:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbww-008Sx8-2X;
	Fri, 22 Sep 2023 08:55:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 52DEB620F5;
	Fri, 22 Sep 2023 08:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49D4C433C7;
	Fri, 22 Sep 2023 08:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695372943;
	bh=8QkGhwghTGYPhExKboS3z0PsUiDKGGvXCleAsd5SH5o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CjAAOHnW+m8+RDAztDmFbJSI8mdUHvPboMtroHiybyvatO27zYyfR1Wv55g8Fv01I
	 te0s9HGkJ0VGUxcVzi6S21q5ZnP3kW3G91E9EzkcgwFh/S+KI1A7tuuEMTGE3HIqBt
	 6nRrji+IFh6kZxhnMEpdwcEddc5XEiLgoKEsYESe9+KRFo95Dw/rmUlDTh3/54BTTX
	 9KM5MArpAD0s7o4CKVI6Ii4apE868YOc1Vz8d3/fGW7P9s5e+247+f0d/ycaOQufD9
	 8mHhukuVVMeyYfCV4bv8fVCeskg+IFFN9ztlmxGPfhc3ExSSu6BsWAGJwgW8ktELWJ
	 FSaXLLenObg+g==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-502a4f33440so3234085e87.1;
        Fri, 22 Sep 2023 01:55:43 -0700 (PDT)
X-Gm-Message-State: AOJu0YxTUeeEWhdVNKfx1Vr87pzhPHq3gbNIsuiqw1KQptVbf929D5/B
	fTiX56TRb2PwytuF3cszxQzaE56cRXPLLUC5USQ=
X-Google-Smtp-Source: AGHT+IF8cgUepodrWyUy99Ge6z4o9GbKwpmdAjZ3R33ypUsIeilkKxYeO+uhK8l2iNZFEKGHs3hnsEm9jfUciGjro48=
X-Received: by 2002:ac2:5bc5:0:b0:503:79e:fb7b with SMTP id
 u5-20020ac25bc5000000b00503079efb7bmr6817575lfn.68.1695372941964; Fri, 22 Sep
 2023 01:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230918072955.2507221-1-rppt@kernel.org> <20230918072955.2507221-7-rppt@kernel.org>
 <CAPhsuW73NMvdpmyrhGouQSAHEL9wRw_A+8dZ-5R4BU=UHH83cw@mail.gmail.com> <9b73ad3d-cfda-bce5-2589-e8674a58c827@csgroup.eu>
In-Reply-To: <9b73ad3d-cfda-bce5-2589-e8674a58c827@csgroup.eu>
From: Song Liu <song@kernel.org>
Date: Fri, 22 Sep 2023 01:55:29 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4_3oYhN6LnPPyBVA4VAM=7voXKmcJNKLqiNEUboq1rnA@mail.gmail.com>
Message-ID: <CAPhsuW4_3oYhN6LnPPyBVA4VAM=7voXKmcJNKLqiNEUboq1rnA@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] mm/execmem: introduce execmem_data_alloc()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Mike Rapoport <rppt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, "David S. Miller" <davem@davemloft.net>, 
	Dinh Nguyen <dinguyen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Puranjay Mohan <puranjay12@gmail.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Russell King <linux@armlinux.org.uk>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Will Deacon <will@kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>, 
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_015546_907842_BE5327E9 
X-CRM114-Status: GOOD (  20.12  )
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

T24gRnJpLCBTZXAgMjIsIDIwMjMgYXQgMTI6MTfigK9BTSBDaHJpc3RvcGhlIExlcm95CjxjaHJp
c3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+Cj4KPgo+IExlIDIyLzA5LzIwMjMgw6Ag
MDA6NTIsIFNvbmcgTGl1IGEgw6ljcml0IDoKPiA+IE9uIE1vbiwgU2VwIDE4LCAyMDIzIGF0IDEy
OjMx4oCvQU0gTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Pgo+ID4g
Wy4uLl0KPiA+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9leGVjbWVtLmggYi9pbmNsdWRl
L2xpbnV4L2V4ZWNtZW0uaAo+ID4+IGluZGV4IDUxOWJkZmRjYTU5NS4uMDlkNDVhYzc4NmU5IDEw
MDY0NAo+ID4+IC0tLSBhL2luY2x1ZGUvbGludXgvZXhlY21lbS5oCj4gPj4gKysrIGIvaW5jbHVk
ZS9saW51eC9leGVjbWVtLmgKPiA+PiBAQCAtMjksNiArMjksNyBAQAo+ID4+ICAgICogQEVYRUNN
RU1fS1BST0JFUzogcGFyYW1ldGVycyBmb3Iga3Byb2Jlcwo+ID4+ICAgICogQEVYRUNNRU1fRlRS
QUNFOiBwYXJhbWV0ZXJzIGZvciBmdHJhY2UKPiA+PiAgICAqIEBFWEVDTUVNX0JQRjogcGFyYW1l
dGVycyBmb3IgQlBGCj4gPj4gKyAqIEBFWEVDTUVNX01PRFVMRV9EQVRBOiBwYXJhbWV0ZXJzIGZv
ciBtb2R1bGUgZGF0YSBzZWN0aW9ucwo+ID4+ICAgICogQEVYRUNNRU1fVFlQRV9NQVg6Cj4gPj4g
ICAgKi8KPiA+PiAgIGVudW0gZXhlY21lbV90eXBlIHsKPiA+PiBAQCAtMzcsNiArMzgsNyBAQCBl
bnVtIGV4ZWNtZW1fdHlwZSB7Cj4gPj4gICAgICAgICAgRVhFQ01FTV9LUFJPQkVTLAo+ID4+ICAg
ICAgICAgIEVYRUNNRU1fRlRSQUNFLAo+ID4KPiA+IEluIGxvbmdlciB0ZXJtLCBJIHRoaW5rIHdl
IGNhbiBpbXByb3ZlIHRoZSBKSVRlZCBjb2RlIGFuZCBtZXJnZQo+ID4ga3Byb2JlL2Z0cmFjZS9i
cGYuIHRvIHVzZSB0aGUgc2FtZSByYW5nZXMuIEFsc28sIGRvIHdlIG5lZWQgc3BlY2lhbAo+ID4g
c2V0dGluZyBmb3IgRlRSQUNFPyBJZiBub3QsIGxldCdzIGp1c3QgcmVtb3ZlIGl0Lgo+Cj4gSG93
IGNhbiB3ZSBkbyB0aGF0ID8gU29tZSBwbGF0Zm9ybXMgbGlrZSBwb3dlcnBjIHJlcXVpcmUgZXhl
Y3V0YWJsZQo+IG1lbW9yeSBmb3IgQlBGIGFuZCBub24tZXhlYyBtZW0gZm9yIEtQUk9CRSBzbyBp
dCBjYW4ndCBiZSBpbiB0aGUgc2FtZQo+IGFyZWEvcmFuZ2VzLgoKSG1tLi4uIG5vbi1leGVjIG1l
bSBmb3Iga3Byb2Jlcz8KCiAgICAgICBpZiAoc3RyaWN0X21vZHVsZV9yd3hfZW5hYmxlZCgpKQog
ICAgICAgICAgICAgICBleGVjbWVtX3BhcmFtcy5yYW5nZXNbRVhFQ01FTV9LUFJPQkVTXS5wZ3By
b3QgPSBQQUdFX0tFUk5FTF9ST1g7CiAgICAgICBlbHNlCiAgICAgICAgICAgICAgIGV4ZWNtZW1f
cGFyYW1zLnJhbmdlc1tFWEVDTUVNX0tQUk9CRVNdLnBncHJvdCA9IFBBR0VfS0VSTkVMX0VYRUM7
CgpEbyB5b3UgbWVhbiB0aGUgbGF0dGVyIGNhc2U/CgpUaGFua3MsClNvbmcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
