Return-Path: <SRS0=QO1u=BC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89558C433E3
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 16:12:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5721120714
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 16:12:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j0IOJ1lh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KTAu2n/t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5721120714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d4PK9tZPuIkc5vtzC/wBtG1h20Qkc3d47jNowwyly2Q=; b=j0IOJ1lhFkBoNnCLrYjMoZd5+
	DwVWIa+cwXcvF2qvkZ8y+Ia6cH5Fb6zmLRUjlNPZstFkTvrOa+7LTnVp1lusCR65r4GTbE74rpr5/
	WaxTbhyidjk7RKp+fcYsHW8z46p9RnhWepj41QAV3MSoray3QvkxIwzWohq5id9/njhsksGSU+CtR
	d5shrpzUInB8ptEErRcgcbuKHncZnKoOqrtXI5W1/IHqRDRR7iYK5Omtpb8YftvOlckp/jjnePnVL
	kS9vB9LBrf3Re84oD35ZROr21me/DjndryFDBYFV/F0IFF34QbtcjHjfARBmAF4dqRP+BJJhdIsxb
	AoatZKtDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jydp1-0001Ho-V5; Thu, 23 Jul 2020 16:11:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jydoz-0001H7-1z
 for linux-riscv@lists.infradead.org; Thu, 23 Jul 2020 16:11:50 +0000
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3E0EC20714;
 Thu, 23 Jul 2020 16:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595520708;
 bh=UwNbjNnkRhPtN3M1FcHhf18EPEdkbGS8hia36IkGCMU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KTAu2n/tep3Ope7nKjpIkD+hDh2cBrQhD+vCOEIs3a+CvHULRCInnNBPVRtiJjVFz
 y2b0cdYj8JDxlEzZaYRf3gdCEFZ2VHlj9ynUF6u0mFAZJRGgFPQzDsuL1mPD6bhOB6
 bQrPjm1rSyM1gVdo1QEcqD83BrODAPLuHymSTkTU=
Date: Fri, 24 Jul 2020 01:11:43 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v3 6/7] riscv: Add KPROBES_ON_FTRACE supported
Message-Id: <20200724011143.a2dd2e231411e46edde2e8c4@kernel.org>
In-Reply-To: <CAJF2gTR4319vMy9hStLeR3+42WG4opnsZTaGdN__Bm23VCHjBg@mail.gmail.com>
References: <1594683562-68149-1-git-send-email-guoren@kernel.org>
 <1594683562-68149-7-git-send-email-guoren@kernel.org>
 <20200714203757.512ce7fb5fa61a88b1dbb2f3@kernel.org>
 <CAJF2gTSMUnHfv3GLj_TGT2dJkKq2zbEsnbPKREiq5i6PPjyTBg@mail.gmail.com>
 <20200721222701.3074315f6a9f6c42c5963f40@kernel.org>
 <CAJF2gTR4319vMy9hStLeR3+42WG4opnsZTaGdN__Bm23VCHjBg@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_121149_276439_91FE8948 
X-CRM114-Status: GOOD (  26.68  )
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
Cc: Patrick =?UTF-8?B?U3TDpGhsaW4=?= <me@packi.ch>,
 Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
 Pekka Enberg <penberg@kernel.org>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMiBKdWwgMjAyMCAyMTozMToyMCArMDgwMApHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IEhpIE1hc2FtaSwKPiAKPiBDdXJyZW50IHJpc2N2IGZ0cmFjZV9jYWxs
ZXIgdXRpbGl6ZSBmcChzMCkgLSA4IGluIHN0YWNrIHRvIGdldCByYSBvZgo+IGZ1bmN0aW9uLCBl
ZzoKPiBmb286Cj4gICAgMmJiMDogICAgICAgNzExOSAgICAgICAgICAgICAgICAgICAgYWRkaSAg
ICBzcCxzcCwtMTI4Cj4gICAgIDJiYjI6ICAgICAgIGY4YTIgICAgICAgICAgICAgICAgICAgIHNk
ICAgICAgczAsMTEyKHNwKQo+ICAgICAyYmI0OiAgICAgICBmYzg2ICAgICAgICAgICAgICAgICAg
ICBzZCAgICAgIHJhLDEyMChzcCkKPiAuLi4KPiAgICAgMmJjNDogICAgICAgMDEwMCAgICAgICAg
ICAgICAgICAgICAgYWRkaSAgICBzMCxzcCwxMjgKPiAuLi4KPiAwMDAwMDAwMDAwMDAyYmNhIDwu
TFZMODI4PjoKPiAgICAgMmJjYTogICAgICAgMDAwMDAwOTcgICAgICAgICAgICAgICAgYXVpcGMg
ICByYSwweDAKPiAgICAgMmJjZTogICAgICAgMDAwMDgwZTcgICAgICAgICAgICAgICAgamFsciAg
ICByYSAjIDJiY2EgPC5MVkw4Mjg+IC8vX21jb3VudAo+IAo+IFNvIGp1c3QgcHV0IHR3byBub3Bz
IGJlZm9yZSBwcm9sb2d1ZSBvZiBmdW5jdGlvbiBpc24ndCBlbm91Z2gsIGJlY2F1c2UKPiByaXNj
diBkb24ndCBsaWtlIGFybTY0IHdoaWNoIGNvdWxkIHVzZSB4OS14MTggcmVzZXJ2ZWQgcmVncyB0
byBwYXNzCj4gcmEoeDMwKS4KPiAgICAgfCBtb3YgICAgICAgeDksIHgzMAo+ICAgICB8IGJsICAg
ICAgICA8ZnRyYWNlLWVudHJ5Pgo+IElmIHRoZSBiZW5lZml0IGlzIGp1c3QgbWFraW5nIGEga3By
b2JlIG9uIGZ1bmN0aW9uIHN5bWJvbCBhZGRyZXNzIHRvCj4gcHJldmVudCBkaXNhc3NlbWJsaW5n
LCBJJ2xsIGRlbGF5IHRoaXMgZmVhdHVyZS4KCkkgcmVjb21tZW5kIHRoYXQuIFRoaXMgZmVhdHVy
ZSBoYXMgdG8gaW52b2x2ZSBmdHJhY2UgYW5kIGdjYywgc28KaXQgaXMgYmV0dGVyIHRvIHNwbGl0
IGl0IGZyb20gdGhpcyBzZXJpZXMuCgo+IAo+IAo+IEkgYWxzbyBoYXZlIGEgbG9vayBhdCBIQVZF
X0ZFTlRSWSAmIEhBVkVfTk9QX01DT1VOVC4gU2VlbXMgaXQganVzdAo+IGF2b2lkIHVzaW5nIHNj
cmlwdHMvcmVjb3JkbWNvdW50LnBsIHNjcmlwdCBhbmQgZGlyZWN0bHkgZ2VuZXJhdGUgbm9wcwo+
IGZvciBfbWNvdW50LgoKUmlnaHQuCgo+IEl0J3MgZGlmZmVyZW50IGZyb20gLWZwYXRjaGFibGUt
ZnVuY3Rpb24tZW50cnk9MiB3aGljaCBnZW5lcmF0aW5nIG5vcHMKPiBiZWZvcmUgZnVuY3Rpb24g
cHJvbG9ndWUgaW4gYXJtNjQsIGlzbid0IGl0PwoKWWVzLCBmZW50cnkgaXMgZm9yIHg4NiwgYnV0
IC1mcGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5PTIgaXMgbWFraW5nIGEKcGxhY2Vob2xkZXIgd2l0
aCBub3AgYXQgdGhlIGVudHJ5IG9mIHRoZSBmdW5jdGlvbnMgZm9yIGRpcmVjdCBwYXRjaGluZy4K
ClRoYW5rIHlvdSwKCj4gCj4gT24gVHVlLCBKdWwgMjEsIDIwMjAgYXQgOToyNyBQTSBNYXNhbWkg
SGlyYW1hdHN1IDxtaGlyYW1hdEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIDE1
IEp1bCAyMDIwIDAwOjI0OjU0ICswODAwCj4gPiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPgo+ID4gPiBUaHggTWFzYW1pLAo+ID4gPgo+ID4gPiBPbiBUdWUsIEp1bCAxNCwg
MjAyMCBhdCA3OjM4IFBNIE1hc2FtaSBIaXJhbWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5vcmc+IHdy
b3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gTW9uLCAxMyBKdWwgMjAyMCAyMzozOToyMSArMDAwMAo+
ID4gPiA+IGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gPiBGcm9tOiBH
dW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhp
cyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIGtwcm9iZXMgb24gZnRyYWNlIGNhbGwgc2l0ZXMgdG8g
YXZvaWRzCj4gPiA+ID4gPiBtdWNoIG9mIHRoZSBvdmVyaGVhZCB3aXRoIHJlZ3VsYXIga3Byb2Jl
cy4gVHJ5IGl0IHdpdGggc2ltcGxlCj4gPiA+ID4gPiBzdGVwczoKPiA+ID4gPiA+Cj4gPiA+ID4g
PiAxLiBHZXQgX2RvX2ZvcmsgZnRyYWNlIGNhbGwgc2l0ZS4KPiA+ID4gPiA+IER1bXAgb2YgYXNz
ZW1ibGVyIGNvZGUgZm9yIGZ1bmN0aW9uIF9kb19mb3JrOgo+ID4gPiA+ID4gICAgMHhmZmZmZmZl
MDAwMjBhZjY0IDwrMD46ICAgICBhZGRpICAgIHNwLHNwLC0xMjgKPiA+ID4gPiA+ICAgIDB4ZmZm
ZmZmZTAwMDIwYWY2NiA8KzI+OiAgICAgc2QgICAgICBzMCwxMTIoc3ApCj4gPiA+ID4gPiAgICAw
eGZmZmZmZmUwMDAyMGFmNjggPCs0PjogICAgIHNkICAgICAgcmEsMTIwKHNwKQo+ID4gPiA+ID4g
ICAgMHhmZmZmZmZlMDAwMjBhZjZhIDwrNj46ICAgICBhZGRpICAgIHMwLHNwLDEyOAo+ID4gPiA+
ID4gICAgMHhmZmZmZmZlMDAwMjBhZjZjIDwrOD46ICAgICBzZCAgICAgIHMxLDEwNChzcCkKPiA+
ID4gPiA+ICAgIDB4ZmZmZmZmZTAwMDIwYWY2ZSA8KzEwPjogICAgc2QgICAgICBzMiw5NihzcCkK
PiA+ID4gPiA+ICAgIDB4ZmZmZmZmZTAwMDIwYWY3MCA8KzEyPjogICAgc2QgICAgICBzMyw4OChz
cCkKPiA+ID4gPiA+ICAgIDB4ZmZmZmZmZTAwMDIwYWY3MiA8KzE0PjogICAgc2QgICAgICBzNCw4
MChzcCkKPiA+ID4gPiA+ICAgIDB4ZmZmZmZmZTAwMDIwYWY3NCA8KzE2PjogICAgc2QgICAgICBz
NSw3MihzcCkKPiA+ID4gPiA+ICAgIDB4ZmZmZmZmZTAwMDIwYWY3NiA8KzE4PjogICAgc2QgICAg
ICBzNiw2NChzcCkKPiA+ID4gPiA+ICAgIDB4ZmZmZmZmZTAwMDIwYWY3OCA8KzIwPjogICAgc2Qg
ICAgICBzNyw1NihzcCkKPiA+ID4gPiA+ICAgIDB4ZmZmZmZmZTAwMDIwYWY3YSA8KzIyPjogICAg
bXYgICAgICBzNCxhMAo+ID4gPiA+ID4gICAgMHhmZmZmZmZlMDAwMjBhZjdjIDwrMjQ+OiAgICBt
diAgICAgIGEwLHJhCj4gPiA+ID4gPiAgICAweGZmZmZmZmUwMDAyMGFmN2UgPCsyNj46ICAgIG5v
cCAgIDw8PDw8PDw8IGhlcmUhCj4gPiA+ID4gPiAgICAweGZmZmZmZmUwMDAyMGFmODIgPCszMD46
ICAgIG5vcAo+ID4gPiA+ID4gICAgMHhmZmZmZmZlMDAwMjBhZjg2IDwrMzQ+OiAgICBsZCAgICAg
IHMzLDAoczQpCj4gPiA+ID4gPgo+ID4gPiA+ID4gMi4gU2V0IF9kb19mb3JrKzI2IGFzIHRoZSBr
cHJvYmUuCj4gPiA+ID4gPiAgIGVjaG8gJ3A6bXlwcm9iZSBfZG9fZm9yaysyNiBkZmQ9JWEwIGZp
bGVuYW1lPSVhMSBmbGFncz0lYTIgbW9kZT0rNCgkc3RhY2spJyA+IC9zeXMva2VybmVsL2RlYnVn
L3RyYWNpbmcva3Byb2JlX2V2ZW50cwo+ID4gPiA+ID4gICBlY2hvIDEgPiAvc3lzL2tlcm5lbC9k
ZWJ1Zy90cmFjaW5nL2V2ZW50cy9rcHJvYmVzL2VuYWJsZQo+ID4gPiA+ID4gICBjYXQgL3N5cy9r
ZXJuZWwvZGVidWcvdHJhY2luZy90cmFjZQo+ID4gPiA+ID4gICB0cmFjZXI6IG5vcAo+ID4gPiA+
ID4KPiA+ID4gPiA+ICAgZW50cmllcy1pbi1idWZmZXIvZW50cmllcy13cml0dGVuOiAzLzMgICAj
UDoxCj4gPiA+ID4gPgo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF8t
LS0tLT0+IGlycXMtb2ZmCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAv
IF8tLS0tPT4gbmVlZC1yZXNjaGVkCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgLyBfLS0tPT4gaGFyZGlycS9zb2Z0aXJxCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHx8IC8gXy0tPT4gcHJlZW1wdC1kZXB0aAo+ID4gPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8fHwgLyAgICAgZGVsYXkKPiA+ID4gPiA+ICAgICAgICAgICAg
IFRBU0stUElEICAgQ1BVIyAgfHx8fCAgICBUSU1FU1RBTVAgIEZVTkNUSU9OCj4gPiA+ID4gPiAg
ICAgICAgICAgICAgICB8IHwgICAgICAgfCAgIHx8fHwgICAgICAgfCAgICAgICAgIHwKPiA+ID4g
PiA+ICAgICAgICAgICAgICAgc2gtODcgICAgWzAwMF0gLi4uLiAgIDU1MS41NTcwMzE6IG15cHJv
YmU6IChfZG9fZm9yaysweDFhLzB4MmU2KSBkZmQ9MHhmZmZmZmZlMDAwMjBhZjdlIGZpbGVuYW1l
PTB4ZmZmZmZmZTAwMDIwYjM0ZSBmbGFncz0weGZmZmZmZmUwMDEwMWU3YzAgbW9kZT0weDIwYWY4
NmZmZmZmZmUwCj4gPiA+ID4gPgo+ID4gPiA+ID4gICBjYXQgL3N5cy9rZXJuZWwvZGVidWcva3By
b2Jlcy9saXN0Cj4gPiA+ID4gPiBmZmZmZmZlMDAwMjBhZjdlICBrICBfZG9fZm9yaysweDFhICAg
IFtGVFJBQ0VdCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBeXl5eXl4KPiA+ID4gPgo+ID4gPiA+IEhtbSwgdGhpcyBzZWVtcyBmZW50cnkgaXMgbm90IHN1
cHBvcnRlZCBvbiBSSVNDLVYgeWV0LiBCdXQgYW55d2F5LAo+ID4gPiA+IGl0IHdpbGwgYmUgdXNl
ZnVsIGZvciB1c2VycyAoaWYgdGhleSBjYW4gZmluZCB0aGUgb2Zmc2V0KS4KPiA+ID4KPiA+ID4g
U2VlbXMgb25seSB4ODYgJiDirIbvuI85MCB1c2UgZmVudHJ577yMY2FuIHlvdSBlbGFib3JhdGUg
bW9yZSBhYm91dCBmZW50cnkncwo+ID4gPiBiZW5lZml0IGFuZCBob3cgdGhlIHVzZXIgY291bGQg
c2V0IGtwcm9iZSBvbiBmdHJhY2UgY2FsbCBzaXRlIHdpdGhvdXQKPiA+ID4gZGlzYXNzZW1ibGU/
Cj4gPgo+ID4gT24geDg2LCB0aGUgZmVudHJ5IHJlcGxhY2VzIHRoZSBtY291bnQgd2l0aCBqdXN0
IG9uZSBjYWxsIGluc3RydWN0aW9uLCB3aXRob3V0Cj4gPiBzYXZpbmcgYW55IGFyZ3VtZW50cy4g
VGhpcyBtZWFucyBhbGwgcHJvYmVzIHdoaWNoIGFyZSBwdXRzIG9uIHRoZSBhZGRyZXNzIG9mCj4g
PiB0YXJnZXQgc3ltYm9sLCBhcmUgYXV0b21hdGljYWxseSB1c2luZyBmdHJhY2UuIElPVywgYWxs
IHByb2JlcyBvbiBfZG9fZm9yayswCj4gPiB3aWxsIHVzZSBmdHJhY2UuIFdlIGRvbid0IG5lZWQg
YW55IGRpc2Fzc2VtYmxpbmcuCj4gPgo+ID4gSSB0aGluayBpZiBSSVNDLVYgYWxyZWFkeSBzdXBw
b3J0ICItZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeT0yIiBvcHRpb24gb24KPiA+IEdDQywgeW91
IGNhbiBlYXNpbHkgZW5hYmxlIGl0IGFzIHNhbWUgYXMgYXJtNjQuIFNlZSBodHRwczovL2xrbWwu
b3JnL2xrbWwvMjAxOS82LzE4LzY0OAo+ID4KPiA+IFRoYW5rIHlvdSwKPiA+Cj4gPiAtLQo+ID4g
TWFzYW1pIEhpcmFtYXRzdSA8bWhpcmFtYXRAa2VybmVsLm9yZz4KPiAKPiAKPiAKPiAtLSAKPiBC
ZXN0IFJlZ2FyZHMKPiAgR3VvIFJlbgo+IAo+IE1MOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1jc2t5LwoKCi0tIApNYXNhbWkgSGlyYW1hdHN1IDxtaGlyYW1hdEBrZXJuZWwub3JnPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
