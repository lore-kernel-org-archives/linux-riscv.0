Return-Path: <SRS0=MzJO=NO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C945C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  3 Nov 2018 18:32:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAA2820833
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  3 Nov 2018 18:32:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ChybRhmO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="FV1Q0wDv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAA2820833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hX+Swbbl/Kqb2xPkFXSuY1Oiu0TPtuRj8kiI7KKzPqw=; b=ChybRhmOzlQP9c
	CdnRVcLnvGnxoY5p7nG6X6UZpBqmOyRqqK1DbWp80QeVAOTCv+El8EWo6DU92+xFkUMKH89kS4kHL
	4fHFp5OLGc+3ynxhU30a5y+SaMkMIlmHUzzZS9cTTLwsXRms4dYCfPHJ2awKHDxbPlVABgZ6iTTxL
	XnlCH723kz9i/0iyreLiVA7INb+4JP87Lx8rnRx4uQKct1sJSquKisU0zRDtG3nJFM/QJzGHs40WP
	iEH3p5dIgJgAb6iUel7dCclhWLDB/3sq0+y8xHC0O9F57T85g7BkivFlZYpyZ377SI7OFaLIY2wZi
	w6x+I/d2BOLpVWM4LKpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJ0ig-0002pl-MT; Sat, 03 Nov 2018 18:32:26 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJ0id-0002nu-Is
 for linux-riscv@lists.infradead.org; Sat, 03 Nov 2018 18:32:25 +0000
Received: by mail-pf1-x444.google.com with SMTP id g7-v6so230748pfo.10
 for <linux-riscv@lists.infradead.org>; Sat, 03 Nov 2018 11:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=+lLPEfrVQ9C2llxSALOmcEKlDAWxZKsHsAd4XJOgi+8=;
 b=FV1Q0wDvKgkG4kZRj+VZtvFgfpLxegdKxvEOWdUoTsGuYYqOt63vQBXT1gkyiQdbAi
 svoRJLCKxf1oY5viw67ejDUpLUlGpXOV6p6fsqhz+scN/mBqlRF6BsiaYvQifD6XRBSl
 F1mKSr8VXjBVgcSHM1RqfBbz7rT2K+1dKDQgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=+lLPEfrVQ9C2llxSALOmcEKlDAWxZKsHsAd4XJOgi+8=;
 b=mi9tieaA9N4MuJdaO9pZa8m+IBaPEWivPkLbKjbDgUqEOwIefyb5VXV5X2pJaK84ZT
 MxDSl4hZ9osQN4KUK7xctiywWN7nwbgWkfr4VOxnMW/0xlg9SJXb+BT72FJ/TI+qU2dS
 IMjUcuRed2PInenqdqhgE7f2xoDEIzxlMvrB6L4kyqgdONCcRpM/Y3TWW6KZqoiYnb80
 HrdMaWkyO7OpaMw9p8eYiyWLT966Vekbbm7Dvzx9wNkjKIrVnIP56dWpkTT4/l39auDu
 2r1YXXAKmXR36KKSN5JajN0/bc4vD3W3PcFyGACCKw7k6bpmrWbZ7JgJKVFgWEe5wADb
 K23g==
X-Gm-Message-State: AGRZ1gICO5JX+jXR7/Jw619kINyQ48Z6zN/szDZomljE/hHzQsFLA+7S
 f4LWk6cNHkvqzVssXoTSJYCZRg==
X-Google-Smtp-Source: AJdET5cVGh+4UnJ6apMI+3/UlVSbVol0AIxVykI0yDHUDrs2IM14b8w2piyx1JVd0OmDbLiGVERHfA==
X-Received: by 2002:a63:94:: with SMTP id 142mr13240807pga.74.1541269931140;
 Sat, 03 Nov 2018 11:32:11 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
 by smtp.gmail.com with ESMTPSA id f22-v6sm46381558pff.29.2018.11.03.11.32.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 03 Nov 2018 11:32:09 -0700 (PDT)
Date: Sat, 3 Nov 2018 11:32:08 -0700
From: Joel Fernandes <joel@joelfernandes.org>
To: Anton Ivanov <anton.ivanov@kot-begemot.co.uk>
Subject: Re: [PATCH -next 0/3] Add support for fast mremap
Message-ID: <20181103183208.GA56850@google.com>
References: <20181103040041.7085-1-joelaf@google.com>
 <6886607.O3ZT5bM3Cy@blindfold>
 <e1d039a5-9c83-b9b9-98b5-d39bc48f04e0@kot-begemot.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e1d039a5-9c83-b9b9-98b5-d39bc48f04e0@kot-begemot.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181103_113223_622287_4EE9752D 
X-CRM114-Status: GOOD (  30.82  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-mips@linux-mips.org, Rich Felker <dalias@libc.org>,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, lokeshgidra@google.com,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, elfring@users.sourceforge.net,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, dancol@google.com,
 linux-ia64@vge.kvack.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-xtensa@linux-xtensa.org, Richard Weinberger <richard@nod.at>,
 Helge Deller <deller@gmx.de>, r.kernel.org@lithops.sigma-star.at,
 hughd@google.com, "James E.J. Bottomley" <jejb@parisc-linux.org>,
 kasan-dev@googlegroups.com, kvmarm@lists.cs.columbia.edu,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, Sam Creasey <sammy@sammy.net>,
 Fenghua Yu <fenghua.yu@intel.com>, Jeff Dike <jdike@addtoit.com>,
 linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 nios2-dev@lists.rocketboards.org, kirill@shutemov.name,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Chris Zankel <chris@zankel.net>, Tony Luck <tony.luck@intel.com>,
 linux-parisc@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 pantin@google.com, linux-kernel@vger.kernel.org, minchan@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
 Ley Foon Tan <lftan@altera.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181103183208.mTW7s6cn-h2uPxeTgCawzlJdj9iNX5Wl4hJlIADvH8U@z>

T24gU2F0LCBOb3YgMDMsIDIwMTggYXQgMDk6MjQ6MDVBTSArMDAwMCwgQW50b24gSXZhbm92IHdy
b3RlOgo+IE9uIDAzLzExLzIwMTggMDk6MTUsIFJpY2hhcmQgV2VpbmJlcmdlciB3cm90ZToKPiA+
IEpvZWwsCj4gPiAKPiA+IEFtIFNhbXN0YWcsIDMuIE5vdmVtYmVyIDIwMTgsIDA1OjAwOjM4IENF
VCBzY2hyaWViIEpvZWwgRmVybmFuZGVzOgo+ID4gPiBIaSwKPiA+ID4gSGVyZSBpcyB0aGUgbGF0
ZXN0ICJmYXN0IG1yZW1hcCIgc2VyaWVzLiBUaGlzIGp1c3QgYSByZXBvc3Qgd2l0aCBLaXJpbGwn
cwo+ID4gPiBBY2tlZC1ieXMgYWRkZWQuIEkgd291bGQgbGlrZSB0aGlzIHRvIGJlIGNvbnNpZGVy
ZWQgZm9yIGxpbnV4IC1uZXh0LiAgSSBhbHNvCj4gPiA+IGRyb3BwZWQgdGhlIENPTkZJRyBlbmFi
bGVtZW50IHBhdGNoIGZvciBhcm02NCBzaW5jZSBJIGFtIHlldCB0byB0ZXN0IGl0IHdpdGgKPiA+
ID4gdGhlIG5ldyBUTEIgZmx1c2hpbmcgY29kZSB0aGF0IGlzIGluIHZlcnkgcmVjZW50IGtlcm5l
bCByZWxlYXNlcy4gKE5vbmUgb2YgbXkKPiA+ID4gYXJtNjQgZGV2aWNlcyBydW4gbWFpbmxpbmUg
cmlnaHQgbm93Likgc28gSSB3aWxsIHBvc3QgdGhlIGFybTY0IGVuYWJsZW1lbnQgb25jZQo+ID4g
PiBJIGdldCB0byB0aGF0LiBUaGUgcGVyZm9ybWFuY2UgbnVtYmVycyBpbiB0aGUgc2VyaWVzIGFy
ZSBmb3IgeDg2Lgo+ID4gPiAKPiA+ID4gTGlzdCBvZiBwYXRjaGVzIGluIHNlcmllczoKPiA+ID4g
Cj4gPiA+ICgxKSBtbTogc2VsZWN0IEhBVkVfTU9WRV9QTUQgaW4geDg2IGZvciBmYXN0ZXIgbXJl
bWFwCj4gPiA+IAo+ID4gPiAoMikgbW06IHNwZWVkIHVwIG1yZW1hcCBieSAyMHggb24gbGFyZ2Ug
cmVnaW9ucyAodjQpCj4gPiA+IHYxLT52MjogQWRkZWQgc3VwcG9ydCBmb3IgcGVyLWFyY2ggZW5h
YmxlbWVudCAoS2lyaWxsIFNodXRlbW92KQo+ID4gPiB2Mi0+djM6IFVwZGF0ZWQgY29tbWl0IG1l
c3NhZ2UgdG8gc3RhdGUgdGhlIG9wdGltaXphdGlvbiBtYXkgYWxzbwo+ID4gPiAJcnVuIGZvciBu
b24tdGhwIHR5cGUgb2Ygc3lzdGVtcyAoRGFuaWVsIENvbCkuCj4gPiA+IHYzLT52NDogUmVtb3Zl
IHVzZWxlc3MgcG1kX2xvY2sgY2hlY2sgKEtpcmlsbCBTaHV0ZW1vdikKPiA+ID4gCVJlYmFzZWQg
b250b3Agb2YgTGludXMncyBtYXN0ZXIsIHVwZGF0ZWQgcGVyZiByZXN1bHRzIGJhc2VkCj4gPiA+
ICAgICAgICAgIG9uIHg4NiB0ZXN0aW5nLiBBZGRlZCBLaXJpbGwncyBBY2tzLgo+ID4gPiAKPiA+
ID4gKDMpIG1tOiB0cmVld2lkZTogcmVtb3ZlIHVudXNlZCBhZGRyZXNzIGFyZ3VtZW50IGZyb20g
cHRlX2FsbG9jIGZ1bmN0aW9ucyAodjIpCj4gPiA+IHYxLT52MjogZml4IGFyY2gvdW0vIHByb3Rv
dHlwZSB3aGljaCB3YXMgbWlzc2VkIGluIHYxIChBbnRvbiBJdmFub3YpCj4gPiA+ICAgICAgICAg
IHVwZGF0ZSBjaGFuZ2Vsb2cgd2l0aCBtYW51YWwgZml4dXBzIGZvciBtNjhrIGFuZCBtaWNyb2Js
YXplLgo+ID4gPiAKPiA+ID4gbm90IGluY2x1ZGVkIC0gKDQpIG1tOiBzZWxlY3QgSEFWRV9NT1ZF
X1BNRCBpbiBhcm02NCBmb3IgZmFzdGVyIG1yZW1hcAo+ID4gPiAgICAgIFRoaXMgcGF0Y2ggaXMg
ZHJvcHBlZCBzaW5jZSBsYXN0IHBvc3RpbmcgcGVuZGluZyBmdXJ0aGVyIHBlcmZvcm1hbmNlCj4g
PiA+ICAgICAgdGVzdGluZyBvbiBhcm02NCB3aXRoIG5ldyBUTEIgZ2F0aGVyIHVwZGF0ZXMuIFNl
ZSBub3RlcyBpbiBwYXRjaAo+ID4gPiAgICAgIHRpdGxlZCAibW06IHNwZWVkIHVwIG1yZW1hcCBi
eSA1MDB4IG9uIGxhcmdlIHJlZ2lvbnMiIGZvciBtb3JlCj4gPiA+ICAgICAgZGV0YWlscy4KPiA+
ID4gCj4gPiBUaGlzIGJyZWFrcyBVTUwgYnVpbGQ6Cj4gPiAgICBDQyAgICAgIG1tL21yZW1hcC5v
Cj4gPiBtbS9tcmVtYXAuYzogSW4gZnVuY3Rpb24g4oCYbW92ZV9ub3JtYWxfcG1k4oCZOgo+ID4g
bW0vbXJlbWFwLmM6MjI5OjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlv
biDigJhzZXRfcG1kX2F04oCZOyBkaWQgeW91IG1lYW4g4oCYc2V0X3B0ZV9hdOKAmT8gWy1XZXJy
b3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gPiAgICBzZXRfcG1kX2F0KG1tLCBu
ZXdfYWRkciwgbmV3X3BtZCwgcG1kKTsKPiA+ICAgIF5+fn5+fn5+fn4KPiA+ICAgIHNldF9wdGVf
YXQKPiA+ICAgIENDICAgICAgY3J5cHRvL3JuZy5vCj4gPiAgICBDQyAgICAgIGZzL2RpcmVjdC1p
by5vCj4gPiBjYzE6IHNvbWUgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKPiA+IAo+
ID4gVG8gdGVzdCB5b3Vyc2VsZiwganVzdCBydW4gb24gYSB4ODYgYm94Ogo+ID4gJCBtYWtlIGRl
ZmNvbmZpZyBBUkNIPXVtCj4gPiAkIG1ha2UgbGludXggQVJDSD11bQo+ID4gCj4gPiBUaGFua3Ms
Cj4gPiAvL3JpY2hhcmQKPiA+IAo+ID4gCj4gPiAKPiAKPiBVTSBzb21laG93IG1hbmFnZWQgdG8g
bWlzcyBvbmUgb2YgdGhlIDMtbGV2ZWwgZnVuY3Rpb25zLCBJIHNlbnQgYSBwYXRjaCBhdAo+IHNv
bWUgcG9pbnQgdG8gYWRkIHRvIHRoZSBtbXJlbWFwIHNlcmllcywgYnV0IGl0IGxvb2tzIGxpa2Ug
aXQgZGlkIG5vdCBnZXQKPiBpbmNsdWRlZCBpbiB0aGUgZmluYWwgdmVyc2lvbi4KPiAKPiBZb3Ug
bmVlZCB0aGVzZSB0d28gaW5jcmVtZW50YWwgb24gdG9wIG9mIEpvZWwncyBwYXRjaC4gUmljaGFy
ZCAtIGZlZWwgZnJlZQo+IHRvIHJlbG9jYXRlIHRoZSBhY3R1YWwgaW1wbGVtZW50YXRpb24gb2Yg
dGhlIHNldF9wZ2RfYXQgZWxzZXdoZXJlIC0gSSBwdXQgaXQKPiBhdCB0aGUgZW5kIG9mIHRsYi5j
Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvdW0vaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC91
bS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiBpbmRleCA3NDg1Mzk4ZDA3MzcuLjE2OTJkYTU1ZTYz
YSAxMDA2NDQKPiAtLS0gYS9hcmNoL3VtL2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ICsrKyBiL2Fy
Y2gvdW0vaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gQEAgLTM1OSw0ICszNTksNyBAQCBkbyB7wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gwqDCoMKgwqDCoMKgwqAgX19m
bHVzaF90bGJfb25lKCh2YWRkcikpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+IMKg
fSB3aGlsZSAoMCkKPiAKPiArZXh0ZXJuIHZvaWQgc2V0X3BtZF9hdChzdHJ1Y3QgbW1fc3RydWN0
ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHBtZF90ICpwbWRwLCBwbWRfdCBwbWQpOwo+ICsKPiDCoCNlbmRpZgo+IGRpZmYgLS1naXQgYS9h
cmNoL3VtL2tlcm5lbC90bGIuYyBiL2FyY2gvdW0va2VybmVsL3RsYi5jCj4gaW5kZXggNzYzZDM1
YmRkYTAxLi5kMTdiNzQxODRiYTAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC91bS9rZXJuZWwvdGxiLmMK
PiArKysgYi9hcmNoL3VtL2tlcm5lbC90bGIuYwo+IEBAIC02NDcsMyArNjQ3LDkgQEAgdm9pZCBm
b3JjZV9mbHVzaF9hbGwodm9pZCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdm1h
ID0gdm1hLT52bV9uZXh0Owo+IMKgwqDCoMKgwqDCoMKgIH0KPiDCoH0KPiArdm9pZCBzZXRfcG1k
X2F0KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcG1kX3QgKnBtZHAsIHBtZF90IHBtZCkKPiArewo+ICvCoMKg
wqDCoMKgwqAgKnBtZHAgPSBwbWQ7Cj4gK30KPiArCj4gCgpMb29rcyBsaWtlIG1vcmUgYXJjaGl0
ZWN0dXJlcyBkb24ndCBkZWZpbmUgc2V0X3BtZF9hdC4gSSBhbSB0aGlua2luZyB0aGUKZWFzaWVz
dCB3YXkgZm9yd2FyZCBpcyB0byBqdXN0IGRvIHRoZSBmb2xsb3dpbmcsIGluc3RlYWQgb2YgZGVm
aW5pbmcKc2V0X3BtZF9hdCBmb3IgZXZlcnkgYXJjaGl0ZWN0dXJlIHRoYXQgZG9lc24ndCBjYXJl
IGFib3V0IGl0LiBUaG91Z2h0cz8KCmRpZmYgLS1naXQgYS9tbS9tcmVtYXAuYyBiL21tL21yZW1h
cC5jCmluZGV4IDdjZjZiMDk0MzA5MC4uMzFhZDY0ZGNkYWU2IDEwMDY0NAotLS0gYS9tbS9tcmVt
YXAuYworKysgYi9tbS9tcmVtYXAuYwpAQCAtMjgxLDcgKzI4MSw4IEBAIHVuc2lnbmVkIGxvbmcg
bW92ZV9wYWdlX3RhYmxlcyhzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAkJCXNwbGl0X2h1
Z2VfcG1kKHZtYSwgb2xkX3BtZCwgb2xkX2FkZHIpOwogCQkJaWYgKHBtZF90cmFuc191bnN0YWJs
ZShvbGRfcG1kKSkKIAkJCQljb250aW51ZTsKLQkJfSBlbHNlIGlmIChleHRlbnQgPT0gUE1EX1NJ
WkUgJiYgSVNfRU5BQkxFRChDT05GSUdfSEFWRV9NT1ZFX1BNRCkpIHsKKwkJfSBlbHNlIGlmIChl
eHRlbnQgPT0gUE1EX1NJWkUpIHsKKyNpZmRlZiBDT05GSUdfSEFWRV9NT1ZFX1BNRAogCQkJLyoK
IAkJCSAqIElmIHRoZSBleHRlbnQgaXMgUE1ELXNpemVkLCB0cnkgdG8gc3BlZWQgdGhlIG1vdmUg
YnkKIAkJCSAqIG1vdmluZyBhdCB0aGUgUE1EIGxldmVsIGlmIHBvc3NpYmxlLgpAQCAtMjk2LDYg
KzI5Nyw3IEBAIHVuc2lnbmVkIGxvbmcgbW92ZV9wYWdlX3RhYmxlcyhzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSwKIAkJCQlkcm9wX3JtYXBfbG9ja3Modm1hKTsKIAkJCWlmIChtb3ZlZCkKIAkJ
CQljb250aW51ZTsKKyNlbmRpZgogCQl9CiAKIAkJaWYgKHB0ZV9hbGxvYyhuZXdfdm1hLT52bV9t
bSwgbmV3X3BtZCkpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
