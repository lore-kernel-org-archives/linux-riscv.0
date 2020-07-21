Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE42C433E3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 13:27:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9834E206E9
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 13:27:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1+3hMkeh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BjmXkpeM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9834E206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8XxS7ss0hdwNEI/ze/J1oKH7nuGnAo8thz2AGHCx0oA=; b=1+3hMkehEr9tC8Z024Q8fMZZA
	LXeWxjdOrhQ+JGzS4Ns2p5GloNtUi6A5tG3srusqVCjGlb6wT9NgiRzv2PVNvMDOeg83v9KlSUM7K
	QQCyi5RbzZeleER24zi72BesMHn4hcVYA6NGnv08fwOLEdhEWBTxGNEZuih9AvTjjbuMX73xAnddE
	74RC1GNQETOAUTrlbE2oMIbIfKc8OrzzkjHBrIVCQ5NxIkxqAfkYE+N/xnIICicjr9aM8IUqoP9fk
	7yqIjAhK9Xu1DOVWJxbMWqxjEh9KOw45nZQ/cOj2Z/m8zr5MIB5pJGNWs7FI7JHUuP4qpgTJIXhCP
	yBYEJ97rg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxsIX-0002Tk-HU; Tue, 21 Jul 2020 13:27:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxsIV-0002T7-K0
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 13:27:08 +0000
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9DB0B206E9;
 Tue, 21 Jul 2020 13:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595338026;
 bh=VMw8YE5x3FLHqpQGkH/mADRhXIT9v2v+BirY/MVEvvA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BjmXkpeMj7JySjDEpkGsYN3u59UQW0/R5lAcuVxbLMI4lu8y3U3un1Zbis1T2oWpR
 SDAVBuGUc9o5iTFEmzgnGXEtvuSA20k1ntorTYvIX7W9ctgzCgmlDQB2umeE1yFWS9
 7dgDPUjCRPor0Brr/UVjFZG3Uvo6WPP2W2SEuaLY=
Date: Tue, 21 Jul 2020 22:27:01 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v3 6/7] riscv: Add KPROBES_ON_FTRACE supported
Message-Id: <20200721222701.3074315f6a9f6c42c5963f40@kernel.org>
In-Reply-To: <CAJF2gTSMUnHfv3GLj_TGT2dJkKq2zbEsnbPKREiq5i6PPjyTBg@mail.gmail.com>
References: <1594683562-68149-1-git-send-email-guoren@kernel.org>
 <1594683562-68149-7-git-send-email-guoren@kernel.org>
 <20200714203757.512ce7fb5fa61a88b1dbb2f3@kernel.org>
 <CAJF2gTSMUnHfv3GLj_TGT2dJkKq2zbEsnbPKREiq5i6PPjyTBg@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_092707_793266_9717DA65 
X-CRM114-Status: GOOD (  15.79  )
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

T24gV2VkLCAxNSBKdWwgMjAyMCAwMDoyNDo1NCArMDgwMApHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IFRoeCBNYXNhbWksCj4gCj4gT24gVHVlLCBKdWwgMTQsIDIwMjAgYXQg
NzozOCBQTSBNYXNhbWkgSGlyYW1hdHN1IDxtaGlyYW1hdEBrZXJuZWwub3JnPiB3cm90ZToKPiA+
Cj4gPiBPbiBNb24sIDEzIEp1bCAyMDIwIDIzOjM5OjIxICswMDAwCj4gPiBndW9yZW5Aa2VybmVs
Lm9yZyB3cm90ZToKPiA+Cj4gPiA+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJh
LmNvbT4KPiA+ID4KPiA+ID4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIGtwcm9iZXMgb24g
ZnRyYWNlIGNhbGwgc2l0ZXMgdG8gYXZvaWRzCj4gPiA+IG11Y2ggb2YgdGhlIG92ZXJoZWFkIHdp
dGggcmVndWxhciBrcHJvYmVzLiBUcnkgaXQgd2l0aCBzaW1wbGUKPiA+ID4gc3RlcHM6Cj4gPiA+
Cj4gPiA+IDEuIEdldCBfZG9fZm9yayBmdHJhY2UgY2FsbCBzaXRlLgo+ID4gPiBEdW1wIG9mIGFz
c2VtYmxlciBjb2RlIGZvciBmdW5jdGlvbiBfZG9fZm9yazoKPiA+ID4gICAgMHhmZmZmZmZlMDAw
MjBhZjY0IDwrMD46ICAgICBhZGRpICAgIHNwLHNwLC0xMjgKPiA+ID4gICAgMHhmZmZmZmZlMDAw
MjBhZjY2IDwrMj46ICAgICBzZCAgICAgIHMwLDExMihzcCkKPiA+ID4gICAgMHhmZmZmZmZlMDAw
MjBhZjY4IDwrND46ICAgICBzZCAgICAgIHJhLDEyMChzcCkKPiA+ID4gICAgMHhmZmZmZmZlMDAw
MjBhZjZhIDwrNj46ICAgICBhZGRpICAgIHMwLHNwLDEyOAo+ID4gPiAgICAweGZmZmZmZmUwMDAy
MGFmNmMgPCs4PjogICAgIHNkICAgICAgczEsMTA0KHNwKQo+ID4gPiAgICAweGZmZmZmZmUwMDAy
MGFmNmUgPCsxMD46ICAgIHNkICAgICAgczIsOTYoc3ApCj4gPiA+ICAgIDB4ZmZmZmZmZTAwMDIw
YWY3MCA8KzEyPjogICAgc2QgICAgICBzMyw4OChzcCkKPiA+ID4gICAgMHhmZmZmZmZlMDAwMjBh
ZjcyIDwrMTQ+OiAgICBzZCAgICAgIHM0LDgwKHNwKQo+ID4gPiAgICAweGZmZmZmZmUwMDAyMGFm
NzQgPCsxNj46ICAgIHNkICAgICAgczUsNzIoc3ApCj4gPiA+ICAgIDB4ZmZmZmZmZTAwMDIwYWY3
NiA8KzE4PjogICAgc2QgICAgICBzNiw2NChzcCkKPiA+ID4gICAgMHhmZmZmZmZlMDAwMjBhZjc4
IDwrMjA+OiAgICBzZCAgICAgIHM3LDU2KHNwKQo+ID4gPiAgICAweGZmZmZmZmUwMDAyMGFmN2Eg
PCsyMj46ICAgIG12ICAgICAgczQsYTAKPiA+ID4gICAgMHhmZmZmZmZlMDAwMjBhZjdjIDwrMjQ+
OiAgICBtdiAgICAgIGEwLHJhCj4gPiA+ICAgIDB4ZmZmZmZmZTAwMDIwYWY3ZSA8KzI2PjogICAg
bm9wICAgPDw8PDw8PDwgaGVyZSEKPiA+ID4gICAgMHhmZmZmZmZlMDAwMjBhZjgyIDwrMzA+OiAg
ICBub3AKPiA+ID4gICAgMHhmZmZmZmZlMDAwMjBhZjg2IDwrMzQ+OiAgICBsZCAgICAgIHMzLDAo
czQpCj4gPiA+Cj4gPiA+IDIuIFNldCBfZG9fZm9yaysyNiBhcyB0aGUga3Byb2JlLgo+ID4gPiAg
IGVjaG8gJ3A6bXlwcm9iZSBfZG9fZm9yaysyNiBkZmQ9JWEwIGZpbGVuYW1lPSVhMSBmbGFncz0l
YTIgbW9kZT0rNCgkc3RhY2spJyA+IC9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcva3Byb2JlX2V2
ZW50cwo+ID4gPiAgIGVjaG8gMSA+IC9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcvZXZlbnRzL2tw
cm9iZXMvZW5hYmxlCj4gPiA+ICAgY2F0IC9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcvdHJhY2UK
PiA+ID4gICB0cmFjZXI6IG5vcAo+ID4gPgo+ID4gPiAgIGVudHJpZXMtaW4tYnVmZmVyL2VudHJp
ZXMtd3JpdHRlbjogMy8zICAgI1A6MQo+ID4gPgo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXy0tLS0tPT4gaXJxcy1vZmYKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLyBfLS0tLT0+IG5lZWQtcmVzY2hlZAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgLyBfLS0tPT4gaGFyZGlycS9zb2Z0aXJxCj4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfHwgLyBfLS09PiBwcmVlbXB0LWRlcHRoCj4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfHx8IC8gICAgIGRlbGF5Cj4gPiA+ICAgICAgICAgICAgIFRBU0stUElE
ICAgQ1BVIyAgfHx8fCAgICBUSU1FU1RBTVAgIEZVTkNUSU9OCj4gPiA+ICAgICAgICAgICAgICAg
IHwgfCAgICAgICB8ICAgfHx8fCAgICAgICB8ICAgICAgICAgfAo+ID4gPiAgICAgICAgICAgICAg
IHNoLTg3ICAgIFswMDBdIC4uLi4gICA1NTEuNTU3MDMxOiBteXByb2JlOiAoX2RvX2ZvcmsrMHgx
YS8weDJlNikgZGZkPTB4ZmZmZmZmZTAwMDIwYWY3ZSBmaWxlbmFtZT0weGZmZmZmZmUwMDAyMGIz
NGUgZmxhZ3M9MHhmZmZmZmZlMDAxMDFlN2MwIG1vZGU9MHgyMGFmODZmZmZmZmZlMAo+ID4gPgo+
ID4gPiAgIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9rcHJvYmVzL2xpc3QKPiA+ID4gZmZmZmZmZTAw
MDIwYWY3ZSAgayAgX2RvX2ZvcmsrMHgxYSAgICBbRlRSQUNFXQo+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl4KPiA+Cj4gPiBIbW0sIHRoaXMgc2VlbXMg
ZmVudHJ5IGlzIG5vdCBzdXBwb3J0ZWQgb24gUklTQy1WIHlldC4gQnV0IGFueXdheSwKPiA+IGl0
IHdpbGwgYmUgdXNlZnVsIGZvciB1c2VycyAoaWYgdGhleSBjYW4gZmluZCB0aGUgb2Zmc2V0KS4K
PiAKPiBTZWVtcyBvbmx5IHg4NiAmIOKshu+4jzkwIHVzZSBmZW50cnnvvIxjYW4geW91IGVsYWJv
cmF0ZSBtb3JlIGFib3V0IGZlbnRyeSdzCj4gYmVuZWZpdCBhbmQgaG93IHRoZSB1c2VyIGNvdWxk
IHNldCBrcHJvYmUgb24gZnRyYWNlIGNhbGwgc2l0ZSB3aXRob3V0Cj4gZGlzYXNzZW1ibGU/CgpP
biB4ODYsIHRoZSBmZW50cnkgcmVwbGFjZXMgdGhlIG1jb3VudCB3aXRoIGp1c3Qgb25lIGNhbGwg
aW5zdHJ1Y3Rpb24sIHdpdGhvdXQKc2F2aW5nIGFueSBhcmd1bWVudHMuIFRoaXMgbWVhbnMgYWxs
IHByb2JlcyB3aGljaCBhcmUgcHV0cyBvbiB0aGUgYWRkcmVzcyBvZgp0YXJnZXQgc3ltYm9sLCBh
cmUgYXV0b21hdGljYWxseSB1c2luZyBmdHJhY2UuIElPVywgYWxsIHByb2JlcyBvbiBfZG9fZm9y
ayswCndpbGwgdXNlIGZ0cmFjZS4gV2UgZG9uJ3QgbmVlZCBhbnkgZGlzYXNzZW1ibGluZy4KCkkg
dGhpbmsgaWYgUklTQy1WIGFscmVhZHkgc3VwcG9ydCAiLWZwYXRjaGFibGUtZnVuY3Rpb24tZW50
cnk9MiIgb3B0aW9uIG9uCkdDQywgeW91IGNhbiBlYXNpbHkgZW5hYmxlIGl0IGFzIHNhbWUgYXMg
YXJtNjQuIFNlZSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS82LzE4LzY0OAoKVGhhbmsgeW91
LAoKLS0gCk1hc2FtaSBIaXJhbWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5vcmc+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
