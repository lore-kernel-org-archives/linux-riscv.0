Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D02AEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 15:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5EzuBIxYs6SBSMjVZOHCpuGWq/u8FdXkTkes+QhK7kc=; b=cSJr7B1fOZg1TL
	33z5oZnRacRQ+lHG9k4CvUW9O+Yy0qSSGTKN2p0iGWkSfCKcTDeY42Y2i7/O8meCStRWNPoxvrsZk
	z/OWI7kDywShsupRc65ohtRyfd+J9vg8KHFg0TWDOsZUkCC+EXBEUeCmV7wJIBMQPumYKV6iX1l/Q
	UEJ4krGoHnYR917hlgPwKVaJjyDf2hgfAygJsYX+9mj4AEFzb9GNsKJROXUIVUKwjHoM9cUjEa7Ie
	UJw6BrV8oNVk5GjQbDty3Ps9sztmesomwiTziS77x4m1bGGLQO2HpZ01kx3v6JFMUzFiMCW3XltJS
	yO9/KT/2fVTDbnexJqCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRaPF-00ADyZ-0Z;
	Thu, 03 Aug 2023 15:38:29 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRaPC-00ADy4-03
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 15:38:27 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-56433b1b12dso637525a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 08:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691077104; x=1691681904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QvK5qLFHmDLYgmxeLVpHf8hOEC5ENBQua82Fe9j6mw=;
        b=RaDdMNGHVBiDOw5FJ7FnpNp7JDEPA3rmoZZARR0MqdZBedo4Aa7wjec/zk94WFTD9A
         n5yIlrryCLjvPzw3JqLMR2ek0cU5+zlLq86tMwiFc3SfFoWuxSAUFOqHPS3KVXy9qsg3
         PAe09TqVnh0qg0qGWPsRTqiSUIyJUOpecWgiIx/m7J8kCAf3kWP8s6Kv9QIBZR48cjG+
         auQ0gaALf15tGTxx79k+JI3B1MaHeLIvqe8/MbJh9CpsGCD54vUnGd7ahE1G2GnzoXJ1
         eUd1s/9eiqe8eAcN6k54kVtUiZ8L+M7jOX2mJbgTom4RZ/XQGTNCUxP30t1IRoMnyIEJ
         sYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691077104; x=1691681904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2QvK5qLFHmDLYgmxeLVpHf8hOEC5ENBQua82Fe9j6mw=;
        b=EW3VZ5aZnm4gF9Umn3AIGUkUjA5LjZh8mR+FtdZCzEHIP3UBDTZeuSM/cJlJ7GjG4L
         DDeEIxi7GdPtJ/Pme13ZDfsQRSCnj1PMmeeytFur11VNcJO41B0DgNrgTaU89N45hcMQ
         /GsrOPjnGuAei9DISBNtfV3iZWA5g8ylpJhUTGKelSU3JMX++QcbTJfJdf4aaFBcE+yY
         CTxEZpdidXkMN7QJaO8mBCIVCOiZl0RI2AF8EUR2yoO7sErTTyQiPZ9RZsFvZwxueMm2
         FqsDTEEXr4iniTejt1L6TE9ef1sgasXc/xylJuMfZ8p3GpVaJhXQUJPya2X5lUHCjRBd
         hb8A==
X-Gm-Message-State: ABy/qLaltxu2nDW5LDyz4kaRtrmLOl/90WbRYvNNZKHNyPtLfJxIEIbw
	txi1i4yrS3NHD3HLtZpzCsL11bWXao/IIeuR8uWIJA==
X-Google-Smtp-Source: APBJJlFi3FG0mAvcMB9URJbwWzw7i1zKH1Hu2Qv4hQ03Ohnz0WVeZbzZgJo+XDAz8aN7gZRHOMPt1IZFV5uBcYVsoeU=
X-Received: by 2002:a17:902:ab0c:b0:1b3:ea47:796c with SMTP id
 ik12-20020a170902ab0c00b001b3ea47796cmr15680373plb.29.1691077104397; Thu, 03
 Aug 2023 08:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230803132818.2092166-1-luxu.kernel@bytedance.com>
 <20230803-curtly-sandbox-9ff8c7aafb85@spud> <CAPYmKFsbGMRY7S6WguDHkkY1futTS7+piKf83Pb+aktO2yLXpw@mail.gmail.com>
 <20230803-sage-mongoose-2452dbe3109d@spud>
In-Reply-To: <20230803-sage-mongoose-2452dbe3109d@spud>
From: =?UTF-8?B?5pet6Lev?= <luxu.kernel@bytedance.com>
Date: Thu, 3 Aug 2023 23:38:09 +0800
Message-ID: <CAPYmKFsQxA+TpecdmK6rcOnH+AeF0PmGMNriowZ=aK1=vfetBg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH RESEND] riscv: Fix local irq restore when
 flags indicates irq disabled
To: Conor Dooley <conor@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_083826_073015_361EF620 
X-CRM114-Status: GOOD (  22.20  )
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

T24gVGh1LCBBdWcgMywgMjAyMyBhdCAxMToyNOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEF1ZyAwMywgMjAyMyBhdCAxMToyMDo1M1BNICsw
ODAwLCDml63ot68gd3JvdGU6Cj4gPiBPbiBUaHUsIEF1ZyAzLCAyMDIzIGF0IDEwOjM24oCvUE0g
Q29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gSGV5LAo+
ID4gPgo+ID4gPiBPbiBUaHUsIEF1ZyAwMywgMjAyMyBhdCAwOToyODoxOFBNICswODAwLCBYdSBM
dSB3cm90ZToKPiA+ID4gPiBXaGVuIGFyY2hfbG9jYWxfaXJxX3Jlc3RvcmUoKSBpcyBjYWxsZWQg
d2l0aCBmbGFncyBpbmRpY2F0aW5nIGlycXMKPiA+ID4gPiBkaXNhYmxlZCwgd2UgbmVlZCB0byBj
bGVhciBTUl9JRSBiaXQgaW4gQ1NSX1NUQVRVUywgd2hlcmVhcyBjdXJyZW50Cj4gPiA+ID4gaW1w
bGVtZW50YXRpb24gYmFzZWQgb24gY3NyX3NldCgpIGZ1bmN0aW9uIG9ubHkgc2V0cyBTUl9JRSBi
aXQgb2YKPiA+ID4gPiBDU1JfU1RBVFVTIHdoZW4gU1JfSUUgYml0IG9mIGZsYWdzIGlzIGhpZ2gg
YW5kIGRvZXMgbm90aGluZyB3aGVuCj4gPiA+ID4gU1JfSUUgYml0IG9mIGZsYWdzIGlzIGxvdy4K
PiA+ID4gPgo+ID4gPiA+IFRoaXMgY29tbWl0IHN1cHBsaWVzIGNzciBjbGVhciBvcGVyYXRpb24g
d2hlbiBjYWxsaW5nIGlycSByZXN0b3JlCj4gPiA+ID4gZnVuY3Rpb24gd2l0aCBmbGFncyBpbmRp
Y2F0aW5nIGlycSBkaXNhYmxlZC4KPiA+ID4gPgo+ID4gPiA+IEZpeGVzOiA2ZDYwYjZlZTBjOTcg
KCJSSVNDLVY6IERldmljZSwgdGltZXIsIElSUXMsIGFuZCB0aGUgU0JJIikKPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4KPiA+ID4gPiAtLS0K
PiA+ID4KPiA+ID4gVGhlcmUncyBubyBjaGFuZ2Vsb2cgb3IgZXhwbGFuYXRpb24sIHNvIHdoYXQg
aXMgdGhlIHJlYXNvbiBmb3IgdGhlCj4gPiA+IHJlc2VuZD8KPiA+ID4KPiA+ID4gQ2hlZXJzLAo+
ID4gPiBDb25vci4KPiA+Cj4gPiBTb3JyeSBmb3IgZGlzdHVyYmluZyB5b3UuCj4KPiBOYWgsIHRp
cyBmaW5lLgo+Cj4gPiBJIGhhdmVuJ3QgcmVjZWl2ZWQgYW55IHJlc3BvbnNlIHNpbmNlIHRoZSBw
YXRjaCB3YXMgc2VudCBsYXN0IHdlZWsuIEkKPiA+IHRoaW5rIG1haW50YWluZXJzIGFyZSBidXN5
IGFuZCB0aHVzIEkgd2FudCB0byBoYXZlIGEgcGluZy4gVGhpcyBwYXRjaAo+ID4gd2FzIHJlc2Vu
dCBiZWNhdXNlIEkgZm91bmQgaXQgaXMgc2FpZCB0aGF0IHJlc2VuZGluZyBwYXRjaCBpcyBvbmUg
b2YKPiA+IHRoZSBtZXRob2RzIHRvIHBpbmcgbWFpbnRhaW5lcnMgaW4gdGhpcyBrZXJuZWwgZG9j
Ogo+ID4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9zdWJt
aXR0aW5nLXBhdGNoZXMuaHRtbC4KPgo+IFJpZ2h0LCByZXNlbmRpbmcgaXMgYSB2YWxpZCB3YXkg
dG8gZG8gdGhhdCAtIGJ1dCBsZWF2aW5nIGEgY29tbWVudCBhYm91dAo+IHdoeSB5b3UgYXJlIHJl
c2VuZGluZyB1bmRlciB0aGUgLS0tIGxpbmUgaXMgYWR2aXNlZCBzbyB0aGF0IHBlb3BsZSBrbm93
Cj4gd2h5IGl0IGlzIHRoYXQgeW91IGFyZSByZXNlbmRpbmcuCj4KPiBUaGFua3MsCj4gQ29ub3Iu
CgpHb3QgdGhhdC4gVGhhbmtzIHZlcnkgbXVjaC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
