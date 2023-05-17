Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D1BC77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 02:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KKRPRmVVJfZbOybitD4cAr96OmN0QhuNmOfVKQfP3I=; b=wMvKgL30pXQQOZ
	lFLVdkXMy4ZlKpBlemkN92kqBANm3l++LlpEQkGKtFio5ikoPEw6GbFr/soBmKTQhZ5sx3PMUMhFZ
	zrBWpg6s9Qtjb2yj19F8Q08+2f+xOqMgyvEVVOGj2okr5aX24HKhja5D54pH/3rTJ9TRqNQEVGtB+
	9BdDXWGpbkKTL2uVxpSUyXCaUe4tKB4PG+aMY+U2ydDRV39tUQhGqg8Vj1ybhO/F1ipGFg3fL7QuD
	PckbIu+V1vA9coZEVw1q762ayMgJvhntBteWo4pLg6IUdnPJX3jHLZkR/oGQKQI49+6JitSr25Tp3
	/icSs5p432bT26SOIjQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz7JL-007u6H-0V;
	Wed, 17 May 2023 02:54:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz7JH-007u5E-3B
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 02:54:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5BB4960B7F;
	Wed, 17 May 2023 02:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81329C433EF;
	Wed, 17 May 2023 02:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684292078;
	bh=sFe/hVwr1RlqKJNFm/E/CQUy8RQP2QPCq5ps+biUM9c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=g+5EQcDL1aJVnKUa9P7oA57b/J0fhJzeYfjHTKmU/TRp0LWprYJG7s3i3FWeWbRbR
	 X9bJ2KLuZB6L62KxGGDwk739uH0Oh9865Gapt7hV+NuajubaQCh6YPj9tbebJHDEDM
	 m4WRnqNvcl5a8uF/AJsgrjlgrsp316p+SBDagEbisG/VbjrjDb5BpoisrcGEw9u51G
	 c0DhunDC++nODeOS0aUyO8UbMBnjA5G21/4mLTf1ex2oAI9Chbs6Sa/GrxQfBk2sDt
	 jDGp9OjmVhTV+sjsYTUpARxL546bJitU/aBLs7h9L9thv4XQsaKVUXYpHn+8/AZZoU
	 ZMmYifuUoeDag==
Date: Wed, 17 May 2023 11:54:32 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Ze Gao <zegao2021@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Steven Rostedt
 <rostedt@goodmis.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>, Borislav
 Petkov <bp@alien8.de>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens
 <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar
 <mingo@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, Conor Dooley
 <conor@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Yonghong Song
 <yhs@fb.com>, Ze Gao <zegao@tencent.com>
Subject: Re: [PATCH v2 2/4] fprobe: make fprobe_kprobe_handler recursion
 free
Message-Id: <20230517115432.94a65364e53cbd5b40c54e82@kernel.org>
In-Reply-To: <CAD8CoPAw_nKsm4vUJ_=aSwzLc5zo8D5pY6A7-grXENxpMYz9og@mail.gmail.com>
References: <20230516071830.8190-1-zegao@tencent.com>
	<20230516071830.8190-3-zegao@tencent.com>
	<20230516091820.GB2587705@hirez.programming.kicks-ass.net>
	<CAD8CoPDFp2_+D6nykj6mu_Pr57iN+8jO-kgA_FRrcxD8C7YU+Q@mail.gmail.com>
	<20230517010311.f46db3f78b11cf9d92193527@kernel.org>
	<CAD8CoPAw_nKsm4vUJ_=aSwzLc5zo8D5pY6A7-grXENxpMYz9og@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_195440_130811_87182201 
X-CRM114-Status: GOOD (  24.29  )
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

T24gV2VkLCAxNyBNYXkgMjAyMyAwOTo1NDo1MyArMDgwMApaZSBHYW8gPHplZ2FvMjAyMUBnbWFp
bC5jb20+IHdyb3RlOgoKPiBPb3BzLCBJIG1pc3VuZGVyc3Rvb2QgeW91ciBjb21tZW50cyBiZWZv
cmUuCj4gCj4gWWVzLCBpdCdzIG5vdCBuZWNlc3NhcnkgdG8gZG8gdGhpcyByZW9yZGVyaW5nIGFz
IHJlZ2FyZHMgdG8ga3Byb2JlLgoKTGV0IG1lIGNvbmZpcm0sIEkgbWVhbnQgdGhhdCB5b3VyIGN1
cnJlbnQgcGF0Y2ggaXMgY29ycmVjdC4gSSBqdXN0IG1lbnRpb25lZAp0aGF0IGtwcm9iZV9idXN5
X3tiZWdpbixlbmR9IHdpbGwgY29udGludWUgdXNlIHN0YW5kYXJkIHZlcnNpb24gYmVjYXVzZQpr
cHJvYmUgaXRzZWxmIGhhbmRsZXMgdGhhdC4gUGxlYXNlIHVwZGF0ZSBvbmx5IHRoZSBwYXRjaCBk
ZXNjcmlwdGlvbiBhbmQKYWRkIG15IGFjay4KCkFja2VkLWJ5OiBNYXNhbWkgSGlyYW1hdHN1IChH
b29nbGUpIDxtaGlyYW1hdEBrZXJuZWwub3JnPgoKSWYgeW91IGFkZCBTdGV2ZSdzIGNhbGwgZ3Jh
cGggZm9yIHRoZSBleHBsYW5hdGlvbiwgaXQgd2lsbCBoZWxwIHVzIHRvCnVuZGVyc3RhbmQgd2hh
dCB3aWxsIGJlIGZpeGVkLgoKVGhhbmsgeW91LAoKPiAKPiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3
Lgo+IAo+IEknbGwgcmViYXNlIG9udG8gdGhlIGxhdGVzdCB0cmVlIGFuZCBzZW5kIHYzIEFTQVAu
Cj4gCj4gUmVnYXJkcywKPiBaZQo+IAo+IE9uIFdlZCwgTWF5IDE3LCAyMDIzIGF0IDEyOjAz4oCv
QU0gTWFzYW1pIEhpcmFtYXRzdSA8bWhpcmFtYXRAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4g
T24gVHVlLCAxNiBNYXkgMjAyMyAxNzo0Nzo1MiArMDgwMAo+ID4gWmUgR2FvIDx6ZWdhbzIwMjFA
Z21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiA+IFByZWNpc2VseSwgdGhlc2UgdGhhdCBhcmUgY2Fs
bGVkIHdpdGhpbiBrcHJvYmVfYnVzeV97YmVnaW4sIGVuZH0sCj4gPiA+IHdoaWNoIHRoZSBwcmV2
aW91cyBwYXRjaCBkb2VzIG5vdCByZXNvbHZlLgo+ID4KPiA+IE5vdGUgdGhhdCBrcHJvYmVfYnVz
eV97YmVnaW4sZW5kfSBkb24ndCBuZWVkIHRvIHVzZSBub3RyYWNlIHZlcnNpb24KPiA+IGJlY2F1
c2Uga3Byb2JlIGl0c2VsZiBwcm9oaWJpdHMgcHJvYmluZyBvbiBwcmVlbXB0X2NvdW50X3thZGQs
c3VifS4KPiA+Cj4gPiBUaGFuayB5b3UsCj4gPgo+ID4gPiBJIHdpbGwgcmVmaW5lIHRoZSBjb21t
aXQgbWVzc2FnZSB0byBtYWtlIGl0IGNsZWFyLgo+ID4gPgo+ID4gPiBGWUksIGRldGFpbHMgY2Fu
IGNoZWNrZWQgb3V0IGhlcmU6Cj4gPiA+ICAgICBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC10cmFjZS1rZXJuZWwvMjAyMzA1MTYxMzI1MTYuYzkwMmVkY2YyMTAyODg3NGE3NGZi
ODY4QGtlcm5lbC5vcmcvCj4gPiA+Cj4gPiA+IFJlZ2FyZHMsCj4gPiA+IFplCj4gPiA+Cj4gPiA+
IE9uIFR1ZSwgTWF5IDE2LCAyMDIzIGF0IDU6MTjigK9QTSBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6
QGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gVHVlLCBNYXkgMTYsIDIw
MjMgYXQgMDM6MTg6MjhQTSArMDgwMCwgWmUgR2FvIHdyb3RlOgo+ID4gPiA+ID4gQ3VycmVudCBp
bXBsZW1lbnRhdGlvbiBjYWxscyBrcHJvYmUgcmVsYXRlZCBmdW5jdGlvbnMgYmVmb3JlIGRvaW5n
Cj4gPiA+ID4gPiBmdHJhY2UgcmVjdXJzaW9uIGNoZWNrIGluIGZwcm9iZV9rcHJvYmVfaGFuZGxl
ciwgd2hpY2ggb3BlbnMgZG9vcgo+ID4gPiA+ID4gdG8ga2VybmVsIGNyYXNoIGR1ZSB0byBzdGFj
ayByZWN1cnNpb24gaWYgcHJlZW1wdF9jb3VudF97YWRkLCBzdWJ9Cj4gPiA+ID4gPiBpcyB0cmFj
ZWFibGUuCj4gPiA+ID4KPiA+ID4gPiBXaGljaCBwcmVlbXB0X2NvdW50KigpIGFyZSB5b3UgcmVm
ZXJyaW5nIHRvPyBUaGUgb25lcyB5b3UganVzdCBtYWRlCj4gPiA+ID4gX25vdHJhY2UgaW4gdGhl
IHByZXZpb3VzIHBhdGNoPwo+ID4KPiA+Cj4gPiAtLQo+ID4gTWFzYW1pIEhpcmFtYXRzdSAoR29v
Z2xlKSA8bWhpcmFtYXRAa2VybmVsLm9yZz4KCgotLSAKTWFzYW1pIEhpcmFtYXRzdSAoR29vZ2xl
KSA8bWhpcmFtYXRAa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
