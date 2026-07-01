Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140A9C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 08:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/3Ht+JZE5cHxqhU8AgmYlMdDq9JLUDePKjjbvekIis8=; b=mZiOnh74YHlQMlfIuMS6Q6n2ao
	eBH0QWJG2KBVGC3vQMNxRtpybI6jH/9nfgggoY4yuC/gPFMhtJoTAuoEAb0Zd+R4/rOHV9Z83zvHr
	CbwO3iZMLhs66PoRmhuvGJOtZdagqcMoOtRu3y/Yxt2Bdet08iO1ZcMa2L4c6wwN2MKmwZm24+afB
	MaEOpmOFTypuG7FpRkDulrI0moRj/zev5Sl3DiKsVaXj9jFKFF948Mb1HeMRzpsp1mvyOIa6A9MT0
	o7oIUmdXvF5i9fJUUhmJGB42HqSReqgL0a0fXzJUzXZ+wf7/fkGblSUoqNMgktn02WSyoQVzWCQtz
	DppwIvog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqAR-000000010jY-3FQC;
	Wed, 01 Jul 2026 08:19:35 +0000
Received: from flow-a3-smtp.messagingengine.com ([103.168.172.138])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqAO-000000010jD-2KVN
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 08:19:34 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 229A213803CC;
	Wed,  1 Jul 2026 04:19:31 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 01 Jul 2026 04:19:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782893971;
	 x=1782901171; bh=atm/oFB1k6o/+QMlFBz13OKx3DmwNZLM96tS29Pr8hU=; b=
	K1AVRFkIbXU1+TlESA73lCoZj4w01drEjtVNM2dgYeXN8CtYE6op3ikZ/8GDwEEC
	RMuZOdzHE21ZpHCOizk9L4gK+c9CGo8P6hhyTNfDV/wOxUb0e0MpgYZmXW/t+6dH
	smEoBASYTNWCLOXk5Jbtl/0ZJi9erI0qIGPgcMgMV3Ew/NPzZa4LIxiDmUxYCL+c
	yK8oaa+26WZM8iJPDZnFJRVk80pR3jRylRTpdE2A1+n5dW5BD4+pLluZqp9VgwQU
	mkIXi9q2Um9LLxEy+JKSE3Q60fhRlniCFuRH5/g33D3M1NYl34CF5GQc5n53F9xt
	Cn5kepwaoRbMs7HHqp4f6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782893971; x=
	1782901171; bh=atm/oFB1k6o/+QMlFBz13OKx3DmwNZLM96tS29Pr8hU=; b=k
	iPaY/Ua005wvf+bsQ/pbv7beYQi4BKVuSKAGtdOqyIGUgeuCXzL1xsbBtupHNdW/
	sE1ukihF+76MvC2mHYAEugHi66PRWJNhb/R0+yY7LKk75xyN0RxD6le8gIiVk5Gs
	DB50jTrjqFooq4KMl4nmEWzap1bZrRVjG5rBL0BkdPUlQpSdUBNEKGxjpG3o5Qop
	3ico2mD3vEpbH3yDLdIk1KeUrUi21Q1hibvvV71qcBM8wA0u9zMwXsHAlivnI6f6
	QDm3F/1mQwsR4kG5+yJ7XTx6VvrZG++9l4t5xzlBDA4ITWfsbE/1w/ZB3Fw8qle3
	+06tiEVkrQZ9y8Qu6/tFw==
X-ME-Sender: <xms:kM1EapagAks29Mlj6Hc9tVn10-N9GeiSr3f3R--dXG63jxphRP-6LQ>
    <xme:kM1EarP3O0ZM9HBVFzIuWjfPN70pwh9m5CwrQ0_B6jL1CVnDo3_rWKvohUHUq4iKT
    ATpwHUnijPxhQhyctojGblQMW3UQVrEtd287ZqFaKsFvx15tOjswito>
X-ME-Proxy-Cause: dmFkZTEeP3G8xkQ1KP2SrTZAasNCY4M11KLkbOP0XnfWNC56L/qn/u391laENuopD5qAGX
    XdSeYYcaBv6U+0mlnw2hojg24bMIldkeh9rJOlPHHXTtzPg61OMH6Gx+iskhxcRCmCZmZv
    QavFULhHqvGwLZkiRtpz3dNO7Waxs6/pvwvxnhzNoFetGCQZM42JLxmZGkKTYEecIwuICl
    Y2CC9WchXcEToEYwVevwrE9N+xqu5ZpX08PAFOH9lxU2U2ch9g5gEeV7Brt0Sh/zlWI/Gp
    8mR4RrKv7hZlyjOLkjY0vA0iBQ5BUM5fS4EV8M1tmtLpPpxoJuMH8Kd9lyq15ZFJfn78Pt
    VClB6BjhVMdiVYBbPJYeqPE3vBC+zz6n6Fuzn5HfWwyZDJpniXbGO3VZQo8FiPpqmUiA9K
    UJtupIKp1vwbXqLHr157ohtF0Q002sR8l1AYDqlkgdlTInmUYdsolbT+3dW3JoAZuiYOr1
    f1MhsV4HS6Guo6IQOLhFqOhJR1enGLBdSwe4FDyMz2Vj1KAYckH9WpT/puZ85UhGSys65p
    jCThNKAoBetrV8EAioQL7lY8AHPXoKM8zBXz5sK9iwdDL1/rKbkdmzYVqUps4apsZ0/jfS
    a2XsSeGWIcqQDyeYWYY9QL17fuyxcH488dnKgSvHjj5lRoGdRTHEEBqzSQVw
X-ME-Proxy: <xmx:kM1EaqjK-Q-QQqjwudu22I-4ML_A_b0oP3RF9myugQeQLVdX_ESRkw>
    <xmx:kM1Eamyj0NYYg1ZMPYC3cdgYclqhVqAZkUORLd6lGAC6eo1YzROHcw>
    <xmx:kM1EaqocZzkhUxt34UZqXUdB_uwBL1J-Pwb_SAhoVr14RC6ZmtP0nA>
    <xmx:kM1EakYm7um2lJ_bXL6tdlc17DYysxvtCyLnZvHT8V4gfpjmTtfErg>
    <xmx:k81EagCHXXhD8NQoqX1MdQCFcr3Uhmbp6ftT2TcxWhYaetfMYfkzI70k>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 65D24182007E; Wed,  1 Jul 2026 04:19:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A7c2EfDQgAZJ
Date: Wed, 01 Jul 2026 10:18:58 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yunhui Cui" <cuiyunhui@bytedance.com>
Cc: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Dennis Zhou" <dennis@kernel.org>, "Tejun Heo" <tj@kernel.org>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>,
 "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>,
 "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Song Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>,
 "Jiri Olsa" <jolsa@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, pulehui@huawei.com,
 puranjay@kernel.org, "Thomas Huth" <thuth@redhat.com>,
 "Andrew Jones" <ajones@ventanamicro.com>,
 "Ben Dooks" <ben.dooks@codethink.co.uk>,
 =?UTF-8?Q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>,
 "Samuel Holland" <samuel.holland@sifive.com>,
 "Zong Li" <zong.li@sifive.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Deepak Gupta" <debug@rivosinc.com>,
 seanwascoding@gmail.com, "Andy Chiu" <andybnac@gmail.com>,
 menglong8.dong@gmail.com, cyrilbur@tenstorrent.com,
 "Vivian Wang" <wangruikang@iscas.ac.cn>,
 "Atish Patra" <atishp@rivosinc.com>,
 "Anup Patel" <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, qingfang.deng@siflower.com.cn,
 Linux-Arch <linux-arch@vger.kernel.org>, llvm@lists.linux.dev
Message-Id: <220b899c-58fe-4110-a6d8-c6f25324ee4a@app.fastmail.com>
In-Reply-To: <CAEEQ3wn8AFVqWZAiXfQd4a1ZzH=2L8qRX4W3S=KcmQ5FORjn+Q@mail.gmail.com>
References: <20260505062026.91724-1-cuiyunhui@bytedance.com>
 <20260505062026.91724-2-cuiyunhui@bytedance.com>
 <3720c3a4-cc0d-4ba8-97ae-35def0189e2e@app.fastmail.com>
 <CAEEQ3wn8AFVqWZAiXfQd4a1ZzH=2L8qRX4W3S=KcmQ5FORjn+Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 1/3] riscv: io: avoid null-pointer arithmetic in
 PIO helpers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_011933_128688_C47EF0BB 
X-CRM114-Status: GOOD (  24.72  )
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

T24gV2VkLCBKdWwgMSwgMjAyNiwgYXQgMDU6MTEsIHl1bmh1aSBjdWkgd3JvdGU6Cj4gT24gVHVl
LCBNYXkgNSwgMjAyNiBhdCAyOjM04oCvUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4g
d3JvdGU6Cj4+IE9uIFR1ZSwgTWF5IDUsIDIwMjYsIGF0IDA4OjIwLCBZdW5odWkgQ3VpIHdyb3Rl
Ogo+PiA+IFRoZSBSSVNDLVYgUElPIGhlbHBlcnMgZGVyaXZlIEkvTyBhZGRyZXNzZXMgZnJvbSBQ
Q0lfSU9CQVNFIGluIGlucyooKSwKPj4gPiBvdXRzKigpLCBhbmQgaW9wb3J0X21hcCgpLgo+PiA+
Cj4+ID4gVW5kZXIgY29uZmlndXJhdGlvbnMgd2hlcmUgSS9PIHBvcnQgc3VwcG9ydCBpcyBub3Qg
YXZhaWxhYmxlLCB0aGVzZQo+PiA+IGV4cHJlc3Npb25zIGNhbiBzdGlsbCBiZSBmb3JtZWQgZHVy
aW5nIGNvbXBpbGF0aW9uIGFuZCB0cmlnZ2VyCj4+ID4gLVdudWxsLXBvaW50ZXItYXJpdGhtZXRp
YyB3YXJuaW5ncyBmcm9tIGNsYW5nLgo+Pgo+PiBJZiBhIGRyaXZlciBhdHRlbXB0cyB0byB1c2Ug
SVNBIHBvcnQgb3BlcmF0aW9ucyBpbiBhIGNvbmZpZ3VyYXRpb24KPj4gd2l0aG91dCBDT05GSUdf
SEFTX0lPUE9SVCwgdGhlcmUgaXMgYSBOVUxMIHBvaW50ZXIgd2FybmluZyBiZWNhdXNlCj4+IHRo
aXMgaXMgYWN0dWFsbHkgYSBOVUxMIHBvaW50ZXIgYWNjZXNzIHRoYXQgd2lsbCBjcmFzaCB0aGUK
Pj4ga2VybmVsIGlmIHRoZSBkcml2ZXIgaXMgZXZlciBsb2FkZWQuIFlvdSBzaG91bGQgbm90IGF0
dGVtcHQKPj4gdG8gc2h1dCB1cCB0aGUgdXNlZnVsIHdhcm5pbmcgaGVyZSBidXQgaW5zdGVhZCBt
YWtlIHN1cmUgZXZlcnkKPj4gc3VjaCBjb2RlIGhhcyBhIHByb3BlciAnZGVwZW5kcyBvbiBIQVNf
SU9QT1JUJyBkZXBlbmRlbmN5Lgo+Cj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lgo+Cj4gSSBhZ3Jl
ZSB0aGF0IE5VTEwtcG9pbnRlciBhcml0aG1ldGljIHdhcm5pbmdzIGNhbiBwb2ludCB0byByZWFs
IG1pc3NpbmcKPiBIQVNfSU9QT1JUIGRlcGVuZGVuY2llcyBpbiBkcml2ZXJzLCBhbmQgd2Ugc2hv
dWxkIG5vdCBoaWRlIHRob3NlIGdsb2JhbGx5Lgo+Cj4gWW91IGFyZSByaWdodCBhYm91dCB0aGUg
Z2VuZXJpYyBpb3BvcnRfbWFwKCkgY2hhbmdlOiB0aGUgaGVscGVyIGlzIGFscmVhZHkKPiBndWFy
ZGVkIGJ5IENPTkZJR19IQVNfSU9QT1JUX01BUCwgc28gdGhlIGV4dHJhIENPTkZJR19IQVNfSU9Q
T1JUIGNoZWNrIGlzCj4gcmVkdW5kYW50LiBJIHdpbGwgZHJvcCB0aGF0IGNoYW5nZS4KClNvdW5k
cyBnb29kLCB0aGFua3MhCgo+IEZvciB0aGUgUklTQy1WIGlucyovb3V0cyogaGVscGVycywgdGhl
eSB1c2UgUElPLXNwZWNpZmljIGZlbmNlcwo+IChfX2lvX3BicigpL19faW9fcGFyKCkgYW5kIF9f
aW9fcGJ3KCkvX19pb19wYXcoKSksIHdoaWxlIHRoZSBhc20tZ2VuZXJpYwo+IGhlbHBlcnMgd291
bGQgZ28gdGhyb3VnaCByZWFkc2IoKS93cml0ZXNiKCkgYW5kIHVzZSBub3JtYWwgTU1JTyBzdHJp
bmcKPiBvcmRlcmluZy4gU28gcmVtb3ZpbmcgdGhlbSB3b3VsZCBjaGFuZ2Ugb3JkZXJpbmcgc2Vt
YW50aWNzLgo+Cj4gSSB3aWxsIGtlZXAgdGhlIFJJU0MtViBoZWxwZXJzIGZvciBub3cgYW5kIG9u
bHkgZ3VhcmQgdGhlIHBvcnQtSS9PCj4gdmFyaWFudHMgd2l0aCBDT05GSUdfSEFTX0lPUE9SVC4K
CkZvciB0aGUgbm9uLXN0cmluZyB2ZXJzaW9ucywgSSB0aGluayB0aGUgZ2VuZXJpYyBpbXBsZW1l
bnRhdGlvbgpzaG91bGQgYmUgaWRlbnRpY2FsIHRvIHdoYXQgcmlzY3YgaGFzLCBpdCBzaG91bGQg
YmUgdHJpdmlhbCB0bwp1bmlmeSB0aGVzZS4KClRoZSBzdHJpbmcgaGVscGVycyBhcmUgYSBsaXR0
bGUgcXVpcmt5IGhlcmUsIGFzIHRoZXkgZG9uJ3QgcmVhbGx5CmhhdmUgYW55IGJhcnJpZXJzIGF0
IGFsbCBpbiB0aGUgZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbiBidXQgZ28KdGhyb3VnaCB0aGUgbG93
LWxldmVsIF9fcmF3X3JlYWRsKCkvX19yYXdfd3JpdGVsKCkgbG9vcHMuIFRoaXMKaXMgbmVjZXNz
YXJ5IHRvIGF2b2lkIGVuZGlhbmVzcyBpc3N1ZXMgYW5kIGJhcnJpZXJzIGluc2lkZSBvZgp0aGUg
bG9vcC4KSSB0aGluayBjb25jZXB0dWFsbHksIHdlJ2Qgd2FudCB0aGUgc3RyaW5nIGhlbHBlcnMg
dG8gaGF2ZSB0aGUKc2FtZSBiYXJyaWVycyBhcyB0aGUgcmVsYXhlZCBzaW5nbGUgSS9PIGFjY2Vz
c29ycyBhbmQgb25seQpzZXJpYWxpemUgYWdhaW5zdCBvdGhlciBJL08gb3BlcmF0aW9ucyBidXQg
bm90IGFnYWluc3QgRE1BLgpPbiBtb3N0IGFyY2hpdGVjdHVyZXMsIHRoaXMgd291bGQgbWVhbiBu
byBiYXJyaWVyIGF0IGFsbCwKd2hpY2ggaXMgd2h5IHRoZSBnZW5lcmljIHZlcnNpb24gd29ya3Mg
Zm9yIHRoZW0uCgpPbiByaXNjdiwgd2UgY3VycmVudGx5IGhhdmUgY3VzdG9tIG1hY3JvcyB0aGF0
IGFsc28gZG8gbm90aGluZzoKCi8qIEZJWE1FOiBUaGVzZSBhcmUgbm93IHRoZSBzYW1lIGFzIGFz
bS1nZW5lcmljICovCiNkZWZpbmUgX19pb19yYnIoKSAgICAgICAgICAgICBkbyB7fSB3aGlsZSAo
MCkKI2RlZmluZSBfX2lvX3JhcigpICAgICAgICAgICAgIGRvIHt9IHdoaWxlICgwKQojZGVmaW5l
IF9faW9fcmJ3KCkgICAgICAgICAgICAgZG8ge30gd2hpbGUgKDApCiNkZWZpbmUgX19pb19yYXco
KSAgICAgICAgICAgICBkbyB7fSB3aGlsZSAoMCkKCklmIGl0IGhlbHBzIHVuaWZ5IHJpc2N2IHdp
dGggdGhlIHJlc3QsIHdlIGNhbiBjZXJ0YWlubHkgYWRkCnRob3NlIHRvIHRoZSByZWFkbF9yZWxh
eGVkKCkvcmVhZHNsKCkvaW5zbCgpIGhlbHBlcnMKaW4gdGhlIGFzbS1nZW5lcmljIHZlcnNpb24s
IGJ1dCBJIGRvbid0IHVuZGVyc3RhbmQKZXhhY3RseSB3aHkgdGhleSBldmVuIGV4aXN0LCBvciBp
ZiB5b3UnZCB3YW50IHRvIGhhdmUKYSBzZXBhcmF0ZSBkZWZpbml0aW9uIGZvciByZWFkc2woKSBh
bmQgaW5zbCgpIGhlcmUuCgogICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
