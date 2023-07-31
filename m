Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A8BC001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 19:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ejlw+0mIvtsOjdIrGA2taEmzvBd0l6Rs+bhb35iZKgI=; b=ImI8DFR2Li8NiP
	D8a3uqDpNyMGDES6DCZZN6O3gK79AeVvs7HtPoxEXzBVoBNYKcfdz3PWKV9E2mOKQe5V4ZW7XkLOJ
	01mpx2QR+t6TbVJRaS5V0T2mgSzLDrJv3PSfkHVtU6ayxg/EZbkJj3RdJj5f72tUQXM87YJdrfC7o
	Tesuam3fw4WZvN9j7UVhbR6O+23d0eOzBH1qd3ZaAeMTUVc4Mm4RvUYuPdQLxmFI5S/S7WzYYq+uf
	an4LWrkuU7aw/K9cxyUnSXIOBdix2e92QlCfA6CzjLLsLYJDGA5pD6cYSK8Or1akVwbySV7PLF3hG
	V3v8Zaac6LW6gdAVaKyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQYs4-00H9xN-25;
	Mon, 31 Jul 2023 19:48:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQYs2-00H9x1-2C;
	Mon, 31 Jul 2023 19:47:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=G10afZyCNiaw2vu2jAC3R9gIyzTLIVHGE2tClR0IBw8=; b=kBp+2VJp5ZkwgOk6UXkI6Hycfa
	6kT98WUmhx2HQkhtNUZTNNoe07jkAj4Lz4PjP+7r5FBs15S+dQQb2piYzaUHD0peDdc8WIdLQxMQK
	DNFi0PDdxcs5CJoEXFHGSc7/TGeaYG1Ke5nrUTGoljolHji24RtvsxqdvE5A7itlLqUScknltKB3Z
	zWy96M9RwO8SFgNHBjDdAjDnzHwsoV3IjCqVd1ylRCKJHShmoUN00v/rzC7LsqX7U0zpk2QAtFJhj
	LWnDr4Thcm4PrDlyS5MM6o9h4m4nkIP9/R16jO8Ry8c5m88Uki668qErHNvG+0fkJkOImHmzuHHTb
	jeL6dO4A==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qQYry-003T3N-E9; Mon, 31 Jul 2023 19:47:54 +0000
Date: Mon, 31 Jul 2023 20:47:54 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Ian Rogers <irogers@google.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Brendan Sweeney <brs@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?iso-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 09/10] tools: lib: perf: Implement riscv mmap support
Message-ID: <ZMgP6hhD/k7QNQ3t@casper.infradead.org>
References: <20230727141428.962286-1-alexghiti@rivosinc.com>
 <20230727141428.962286-10-alexghiti@rivosinc.com>
 <CAP-5=fU5XYXrVnRUidpwjV2LiTsdebfidL43_Qo4Z7TBxMsVGA@mail.gmail.com>
 <CAHVXubgVAe1WsiZx5Ay+3KPK4u24k_vsnTwFFmBeVsHrGXwhfw@mail.gmail.com>
 <CAHVXubj80rQRShuDS09BeTrfR6nux0A68EMWLbeat8fd_Y3YdA@mail.gmail.com>
 <CAP-5=fWwzuGZ6a6Z38ndsb7gw7_uwS0a2VGXx08hMeiK8eZ91w@mail.gmail.com>
 <CAHVXubjhM9C1fw_Us=8+RuSJbW0pacFAk9gp7j2=BtMUPy_Byw@mail.gmail.com>
 <CAP-5=fUbiaVwSAhTbymyhdUPcVAXHiQZZexAOnrqid0LsPmfpw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fUbiaVwSAhTbymyhdUPcVAXHiQZZexAOnrqid0LsPmfpw@mail.gmail.com>
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

T24gTW9uLCBKdWwgMzEsIDIwMjMgYXQgMDk6NDY6MDdBTSAtMDcwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBNb24sIEp1bCAzMSwgMjAyMyBhdCA5OjA24oCvQU0gQWxleGFuZHJlIEdoaXRpIDxh
bGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+IEkgaGF2ZSBqdXN0IGhhZCB0aGUgYW5z
d2VyIGludGVybmFsbHkgKHRoYW5rcyB0byBAQnJlbmRhbiBTd2VlbmV5KToKPiA+IGNzciBtb2Rp
ZmljYXRpb25zIGNhbiBhbHRlciBob3cgdGhlIG1lbW9yeSBpcyBhY2Nlc3NlZCAoc2F0cCB3aGlj
aAo+ID4gY2hhbmdlcyB0aGUgYWRkcmVzcyBzcGFjZSwgc3VtIHdoaWNoIGFsbG93cy9kaXNhbGxv
d3MgdXNlcnNwYWNlCj4gPiBhY2Nlc3MuLi4pLCBzbyB3ZSBuZWVkIHRoZSBtZW1vcnkgYmFycmll
ciB0byBtYWtlIHN1cmUgdGhlIGNvbXBpbGVyCj4gPiBkb2VzIG5vdCByZW9yZGVyIHRoZSBtZW1v
cnkgYWNjZXNzZXMuCj4gCj4gVGhlIGNvbmRpdGlvbnMgeW91IG1lbnRpb24gc2hvdWxkbid0IGFw
cGx5IGhlcmUgdGhvdWdoPyBFdmVuIGlmIHlvdQo+IGFkZCBhIG1lbW9yeSBiYXJyaWVyIGZvciB0
aGUgY29tcGlsZXIgd2hhdCBpcyBzdG9wcGluZyB0aGUgaGFyZHdhcmUKPiByZW9yZGVyaW5nIGxv
YWRzIGFuZCBzdG9yZXM/IElmIGl0IGFic29sdXRlbHkgaGFzIHRvIGJlIHRoZXJlIHRoZW4gYQo+
IGNvbW1lbnQgc29tZXRoaW5nIGxpa2UgIlRoZXJlIGlzIGEgYnVnIGlzIHJpc2N2IHdoZXJlIHRo
ZSBjc3JyCj4gaW5zdHJ1Y3Rpb24gY2FuIGNsb2JiZXIgbWVtb3J5IGJyZWFraW5nIGZ1dHVyZSBy
ZWFkcyBhbmQgc29tZSBob3cgdGhpcwo+IGNvbnN0cmFpbnQgZml4ZXMgaXQgYnkgLi4uICIuCgpJ
ZiB0aGUgaGFyZHdhcmUgZG9lc24ndCBrbm93IHRoYXQgd3JpdGluZyB0byBhIGNzciBjYW4gY2hh
bmdlIGhvdyBtZW1vcnkKYWNjZXNzZXMgYXJlIGRvbmUgYW5kIHJlb3JkZXJzIG1lbW9yeSBhY2Nl
c3NlcyBhcm91bmQgdGhhdCBjc3Igd3JpdGUsCnlvdSd2ZSBnb3QgYSByZWFsbHkgYnJva2VuIHBp
ZWNlIG9mIGhhcmR3YXJlIG9uIHlvdXIgaGFuZHMgLi4uCgpJIGtub3cgbm90aGluZyBhYm91dCBy
aXNjLXYsIGFuZCBtYXliZSB0aGUgZGVmaW5pdGlvbiBzYXlzIHRoYXQgeW91IG5lZWQKdG8gcHV0
IGEgbWVtb3J5IGJhcnJpZXIgYmVmb3JlIGFuZC9vciBhZnRlciBpdCBpbiB0aGUgaW5zdHJ1Y3Rp
b24gc3RyZWFtLApidXQgb24gYWxsIGhhcmR3YXJlIEknbSBmYW1pbGlhciB3aXRoLCB3cml0aW5n
IHRvIGEgQ1NSIGlzIGFuIGltcGxpY2l0bHkKc2VyaWFsaXNpbmcgb3BlcmF0aW9uLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
