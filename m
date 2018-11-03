Return-Path: <SRS0=MzJO=NO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA2CC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  3 Nov 2018 15:20:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3EA920833
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  3 Nov 2018 15:20:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YEd3AS49";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="kNJTtkYt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3EA920833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BvlEBbB2UC/L3kBac6Lp6I2sY98hnXJCyRNQGTu6/FA=; b=YEd3AS49n/JprB
	2OynjL4LkfNPyVvw7aumrOwfkNPUdFP0LVUreCSO+zL5kkFmIPKbDBsYmykqLAMb9R9yYvKsMHzBP
	yqpCtnZJguH7dUcQ2zv2RiWx+Pii4cq++D/AVJu17KegP8Ndd0dQ5Yr5UiniDHiy5CQhLxdcezv8m
	Jd6IdNInDjTpCPTQDWeHWAeZa7Yw8LstW8TO0HY09FaRibTB5kowzBJ+8VfaKFAotv52XjmWYF2lA
	5DshKF5FdQoW3uHtOfjEs1gNUKvO8Wr2zkiHUU3OJ3OwodAGJkMk0DcMxalfNxDQYEHhRp4Cyi971
	G9L+Xv7eIxGCZF7UxlJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIxir-0007JP-9a; Sat, 03 Nov 2018 15:20:25 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIxim-0007HX-FD
 for linux-riscv@lists.infradead.org; Sat, 03 Nov 2018 15:20:22 +0000
Received: by mail-pl1-x644.google.com with SMTP id b5-v6so2361201pla.6
 for <linux-riscv@lists.infradead.org>; Sat, 03 Nov 2018 08:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=i6yaJB2o9sU7RuXm3r4UBsrPg8iuns5RuNX/tH/zwXQ=;
 b=kNJTtkYtds3pxV2uBXIy49B35JnxurHkW0tix9slazii0qnVoqVSf1Xxe/L1hwjEfD
 2efnl2GTOwtRrE6WE/ClAtE07lZUOFoMtDfdJMIKLRVgjmEzRmLZZatgukQdreHt/srx
 wKq5XJFi/LFWMZ6B0kM34SGCvehl8RS8FFwSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=i6yaJB2o9sU7RuXm3r4UBsrPg8iuns5RuNX/tH/zwXQ=;
 b=K5/5TINSEGi6NOnaY9UYIkw6T2Tk7u12uQhh8y2asC0BJiYm2p3Qqv1o/8N+kJ78Bc
 ed1ytfKCGUFafVWFBKdgFb5Xpy2e97cc5rJyWdij9dnZODJxEWkitVFbRrsYzA7oCehI
 Mq+/jNxEOdJuG8huONQB5z0v5DTWpeuxNO+ZPwS6RR1kJW+BexveKi+5LXzQq32SsnoY
 ykH2FtuhpIndA5e1gpJF75OTdyu1jo6mBQKLnnMubLw1ffl5UciK8w1PuHXXYpXrpQfm
 BRD7wdpy/ehvAp8fj3UG2ntmpWs5/OYFa1swhZDls1g2BiQa/w5nXPRgFPREhApIN5sB
 nLqg==
X-Gm-Message-State: AGRZ1gI5TNPXIW15xNpEImPnBL+nIQwz4j+hKoWlTS6UZHhp+uVzKuUD
 cOZfniLnwBF5t/82q0QNmoqTcA==
X-Google-Smtp-Source: AJdET5dI1MLr4wRZbH7JvxzuiOr+hjXlr7MrDVt6HsOhVN9g4qLIJr2xZEdzSnHS0FC+5fBNd9BRdA==
X-Received: by 2002:a17:902:70c3:: with SMTP id
 l3-v6mr14941058plt.329.1541258409136; 
 Sat, 03 Nov 2018 08:20:09 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
 by smtp.gmail.com with ESMTPSA id i2-v6sm36388663pgq.35.2018.11.03.08.20.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 03 Nov 2018 08:20:07 -0700 (PDT)
Date: Sat, 3 Nov 2018 08:20:06 -0700
From: Joel Fernandes <joel@joelfernandes.org>
To: Anton Ivanov <anton.ivanov@kot-begemot.co.uk>
Subject: Re: [PATCH -next 0/3] Add support for fast mremap
Message-ID: <20181103152006.GB259637@google.com>
References: <20181103040041.7085-1-joelaf@google.com>
 <6886607.O3ZT5bM3Cy@blindfold>
 <e1d039a5-9c83-b9b9-98b5-d39bc48f04e0@kot-begemot.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e1d039a5-9c83-b9b9-98b5-d39bc48f04e0@kot-begemot.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181103_082020_537929_92DD8119 
X-CRM114-Status: GOOD (  30.70  )
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
Message-ID: <20181103152006.fB4HYFJOLqd0GROWdYNNCM1MDCDG24LtGnHtPRl5zGo@z>

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
wqDCoMKgwqAgKnBtZHAgPSBwbWQ7Cj4gK30KPiArCj4gCgpJIHNlZSBpdCBub3c6Cmh0dHBzOi8v
d3d3Lm1haWwtYXJjaGl2ZS5jb20vbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcvbXNnMTQw
MDA1Lmh0bWwKClNvcnJ5IGFib3V0IHRoYXQuCkFjdHVhbGx5IHRoZSByZWFzb24gdGhlIHN1Z2dl
c3Rpb24gZ290IG1pc3NlZCBpcyBpdCBkaWQgbm90IGJlbG9uZyBpbiB0aGUKcGF0Y2ggcmVtb3Zp
bmcgdGhlIHB0ZV9hbGxvYyBhZGRyZXNzIGFyZ3VtZW50LiBUaGUgcHRlX2FsbG9jIHBhcnRzIG9m
IHRoZQpwYXRjaCB5b3UgcHJvcG9zZWQgYXJlIGluZmFjdCBhbHJlYWR5IGluY2x1ZGVkLgoKVGhp
cyBzZXRfcG1kX2F0IGZvciBVTSBzaG91bGQgZ28gaW50byBhIHNlcGFyYXRlIHBhdGNoIGFuZCBz
aG91bGQgbm90IGJlCnJvbGxlZCBpbnRvIGFueSBleGlzdGluZyBvbmUuIENvdWxkIHlvdSBzZW5k
IGEgcHJvcGVyIHBhdGNoIGFkZGluZyB0aGlzCmZ1bmN0aW9uIHdpdGggYSBjb21taXQgbWVzc2Fn
ZSBhbmQgZXZlcnl0aGluZz8gSSBjYW4gdGhlbiBpbmNsdWRlIGl0IGFzIGEKc2VwYXJhdGUgcGF0
Y2ggb2YgbXkgc2VyaWVzLgoKdGhhbmtzIQoKIC0gSm9lbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
