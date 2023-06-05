Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E77C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 21:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SHJt2VWXq9akGsKKf66OgV/WXLPDghSR1mKfTeB1Zaw=; b=3qpTvQIDk+HNvv
	nUFZdupSz5fufG5Bv2BCpCYJAdiLggxNgNh/h9Vf4AnWKWcsdIIz6Ze5d5J/zRkQHhJawnnm/jLbw
	2CG15gEEH68s19DBE4ArdbOVeZS0WMNS3fmv9rKLF9g8yejjIkFd+kHd2XjDrmnsWKEEPSUGkDdzt
	So8+FOAaDTTk1lxiwfdsjZQNZFeecdSo+GJuFsBT+uQsP9U0Hl+nTxp73QRiHERZoWJoeAA1cwGr5
	tgrvUbY80IN+6pF5cQao9TDItep8u+Gc5JYwFB91WHBHzNh5Ng+NwBK8l+y9otjU6PCXmnPMdDzAT
	179WBhjXajUGpYSiZCbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6HUP-00Go2A-24;
	Mon, 05 Jun 2023 21:11:45 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6HUN-00Go1E-0A;
	Mon, 05 Jun 2023 21:11:44 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2565a9107d2so4561553a91.0;
        Mon, 05 Jun 2023 14:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685999501; x=1688591501;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zh4jJxTAKzbJ9SX27hDt/5kPD49tOPRL7suMPY4/khA=;
        b=HQ7E4KTQocAnFq6ymEbiyQe+71wz1QqkMTqstF6yByE1aQ/3L9xGlsoHE2ty/KmNGx
         kkEIZdBdUpFN5pBuGWGPof3JHvwTsAFbFOBh8LvcbfvZDQcWxan7GhR3qRzMUhCbsynv
         VMO/o8hLS0MUfiw6kmRJdp5TDSqJf1Z98tzNg0TBILGUxmterYeS+YBt+Dmye8jo/cGp
         xxgae6ukPX27OAi5ZxAJI04J0vRi0aYxFh2wrhremSn2C6an+j6jLOUDoZZnWpJAGoFM
         QcM8CesR+0JfQo9SpvdWxAM1li3oZzB0tJjW4MpOn6edHy3LBmjFeUMOqWOY59vgg4DJ
         JYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685999501; x=1688591501;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zh4jJxTAKzbJ9SX27hDt/5kPD49tOPRL7suMPY4/khA=;
        b=EzOVLPdwJL90ga47042qrLtRyLkF5NNMJmXfkdRLo/X/y6DY47zCKA+dZ53jcNDOpI
         ma+cNQ51oUdkcVvxiG/S0eKy3hAkGuD3V7pWL6pkO9f9zhQSfLRcrS6ryU5V9tvd1fus
         /ukj7Y2PJnlMTt3VOK5HvmWoMBbxHZX0oFOsdmTMAhV7MPvf56PFRpg8pjxx4Zi0gxbl
         7b7UGJ9Ys46Q6eyowDbLFgBFVVPjJauUeA4BWthD8n7qVA7odxDkfUhUGC+G3KpMeAkG
         fFeSoJCbkyt9aXEquUPVSkXxPvXeN6garI/EVgXDHnPSwsV0L8zo3TuJcG5jmAcEl1xk
         0VwQ==
X-Gm-Message-State: AC+VfDxyT3GpK9sqPdGADvC9Y55iD+bDr9G8WHC6o89m07um3DOtmByx
	Q8lk02nbcLrSgqiuu0Ehw+w=
X-Google-Smtp-Source: ACHHUZ7ezCBLFh/r5MtsTw99vS986tpwZwM/H7CRc906oLC1p2PgTYZQRvrDYW2mCxZli0+0MYt3BQ==
X-Received: by 2002:a17:90b:1c06:b0:258:9180:1999 with SMTP id oc6-20020a17090b1c0600b0025891801999mr8816659pjb.32.1685999500386;
        Mon, 05 Jun 2023 14:11:40 -0700 (PDT)
Received: from smtpclient.apple (c-24-6-216-183.hsd1.ca.comcast.net. [24.6.216.183])
        by smtp.gmail.com with ESMTPSA id gz18-20020a17090b0ed200b00246f9725ffcsm6255974pjb.33.2023.06.05.14.11.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Jun 2023 14:11:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH 12/13] x86/jitalloc: prepare to allocate exectuatble
 memory as ROX
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <88a62f834688ed77d08c778e1e427014cf7d3c1b.camel@intel.com>
Date: Mon, 5 Jun 2023 14:11:26 -0700
Cc: "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "rppt@kernel.org" <rppt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "deller@gmx.de" <deller@gmx.de>,
 "mcgrof@kernel.org" <mcgrof@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kent.overstreet@linux.dev" <kent.overstreet@linux.dev>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>,
 "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "song@kernel.org" <song@kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>
Message-Id: <B021EE82-9741-4B41-8FF7-91A9336EDD7C@gmail.com>
References: <20230601101257.530867-1-rppt@kernel.org>
 <20230601101257.530867-13-rppt@kernel.org>
 <0f50ac52a5280d924beeb131e6e4717b6ad9fdf7.camel@intel.com>
 <ZHjcr26YskTm+0EF@moria.home.lan>
 <a51c041b61e2916d2b91c990349aabc6cb9836aa.camel@intel.com>
 <ZHjljJfQjhVV/jNS@moria.home.lan>
 <68b8160454518387c53508717ba5ed5545ff0283.camel@intel.com>
 <50D768D7-15BF-43B8-A5FD-220B25595336@gmail.com>
 <20230604225244.65be9103@rorschach.local.home>
 <20230605081143.GA3460@kernel.org>
 <88a62f834688ed77d08c778e1e427014cf7d3c1b.camel@intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
X-Mailer: Apple Mail (2.3731.600.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_141143_113566_09C4230D 
X-CRM114-Status: GOOD (  20.39  )
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

Cgo+IE9uIEp1biA1LCAyMDIzLCBhdCA5OjEwIEFNLCBFZGdlY29tYmUsIFJpY2sgUCA8cmljay5w
LmVkZ2Vjb21iZUBpbnRlbC5jb20+IHdyb3RlOgo+IAo+IE9uIE1vbiwgMjAyMy0wNi0wNSBhdCAx
MToxMSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPj4gT24gU3VuLCBKdW4gMDQsIDIwMjMg
YXQgMTA6NTI6NDRQTSAtMDQwMCwgU3RldmVuIFJvc3RlZHQgd3JvdGU6Cj4+PiBPbiBUaHUsIDEg
SnVuIDIwMjMgMTY6NTQ6MzYgLTA3MDAKPj4+IE5hZGF2IEFtaXQgPG5hZGF2LmFtaXRAZ21haWwu
Y29tPiB3cm90ZToKPj4+IAo+Pj4+PiBUaGUgd2F5IHRleHRfcG9rZSgpIGlzIHVzZWQgaGVyZSwg
aXQgaXMgY3JlYXRpbmcgYSBuZXcgd3JpdGFibGUKPj4+Pj4gYWxpYXMKPj4+Pj4gYW5kIGZsdXNo
aW5nIGl0IGZvciAqZWFjaCogd3JpdGUgdG8gdGhlIG1vZHVsZSAobGlrZSBmb3IgZWFjaAo+Pj4+
PiB3cml0ZSBvZgo+Pj4+PiBhbiBpbmRpdmlkdWFsIHJlbG9jYXRpb24sIGV0YykuIEkgd2FzIGp1
c3QgdGhpbmtpbmcgaXQgbWlnaHQKPj4+Pj4gd2FycmFudAo+Pj4+PiBzb21lIGJhdGNoaW5nIG9y
IHNvbWV0aGluZy4gIAo+PiAKPj4+PiBJIGFtIG5vdCBhZHZvY2F0aW5nIHRvIGRvIHNvLCBidXQg
aWYgeW91IHdhbnQgdG8gaGF2ZSBtYW55Cj4+Pj4gZWZmaWNpZW50Cj4+Pj4gd3JpdGVzLCBwZXJo
YXBzIHlvdSBjYW4ganVzdCBkaXNhYmxlIENSMC5XUC4gSnVzdCBzYXlpbmcgdGhhdCBpZgo+Pj4+
IHlvdQo+Pj4+IGFyZSBhYm91dCB0byB3cml0ZSBhbGwgb3ZlciB0aGUgbWVtb3J5LCB0ZXh0X3Bv
a2UoKSBkb2VzIG5vdAo+Pj4+IHByb3ZpZGUKPj4+PiB0b28gbXVjaCBzZWN1cml0eSBmb3IgdGhl
IHBva2luZyB0aHJlYWQuCj4+IAo+PiBIZWgsIHRoaXMgaXMgZGVmaW5pdGVseSBhbmQgZWFzaWVy
IGhhY2sgdG8gaW1wbGVtZW50IDopCj4gCj4gSSBkb24ndCBrbm93IHRoZSBkZXRhaWxzLCBidXQg
cHJldmlvdXNseSB0aGVyZSB3YXMgc29tZSBzdHJvbmcgZGlzbGlrZQo+IG9mIENSMC5XUCB0b2dn
bGluZy4gQW5kIG5vdyB0aGVyZSBpcyBhbHNvIHRoZSBwcm9ibGVtIG9mIENFVC4gU2V0dGluZwo+
IENSMC5XUD0wIHdpbGwgI0dQIGlmIENSNC5DRVQgaXMgMSAoYXMgaXQgY3VycmVudGx5IGlzIGZv
ciBrZXJuZWwgSUJUKS4KPiBJIGd1ZXNzIHlvdSBtaWdodCBnZXQgYXdheSB3aXRoIHRvZ2dsaW5n
IHRoZW0gYm90aCBpbiBzb21lIGNvbnRyb2xsZWQKPiBzaXR1YXRpb24sIGJ1dCBpdCBtaWdodCBi
ZSBhIGxvdCBlYXNpZXIgdG8gaGFjayB1cCB0aGVuIHRvIGJlIG1hZGUKPiBmdWxseSBhY2NlcHRh
YmxlLiBJdCBkb2VzIHNvdW5kIG11Y2ggbW9yZSBlZmZpY2llbnQgdGhvdWdoLgoKVGhhbmtzIGZv
ciBoaWdobGlnaHRpbmcgdGhpcyBpc3N1ZS4gSSB1bmRlcnN0YW5kIHRoZSBsaW1pdGF0aW9ucyBv
ZgpDUjAuV1AuIFRoZXJlIGlzIGFsc28gYWx3YXlzIHRoZSBjb25jZXJucyB0aGF0IHdpdGhvdXQg
Q0VUIG9yIG90aGVyCmNvbnRyb2wgZmxvdyBpbnRlZ3JpdHkgbWVjaGFuaXNtLCBzb21lb25lIHdv
dWxkIGFidXNlICh1c2luZyBST1AvSk9QKQpmdW5jdGlvbnMgdGhhdCBjbGVhciBDUjAuV1DigKYK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
