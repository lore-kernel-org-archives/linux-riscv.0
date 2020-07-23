Return-Path: <SRS0=QO1u=BC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0739BC433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 15:55:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6ABB2071A
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 15:55:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ygDAhCE6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0+JgSJk1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6ABB2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KGs4fqDDxuqdD8W3OKCutwmNOlHmXmKqgjWWZJiZ7Nc=; b=ygDAhCE68r6eWMYUL6owv5jVJ
	8ehUFSRWr9zh36D0FO/eRkWRJa9e4O0+tSn556atJjsMlcJm+SM8eVtDGYCi69TxHFGKexXMgVaRy
	n19rmY5DSLQb/Sc/gS3BpqWsXSmbKXWePX/OXJGUrqRcmisOgd+FQju/qh1Z9ghDVG3A7+r6zxLeV
	0MJXWT/o6Vl/uv0oP+6cJZ5vJZdUKUZY6fK0N8jqT3qbrw06l+hBRG5+cid2Db9TOaBKYGetTW5Vv
	O7UzzHLEFrcUbS8LzYA1Ze++o6ZrFu026uR2KVPCPY1KcScPVIt6qgmTQg1mWgfUIR5ktUj1lpwtv
	vTB+ON3cA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jydZL-0007e2-RY; Thu, 23 Jul 2020 15:55:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jydZK-0007dP-06
 for linux-riscv@lists.infradead.org; Thu, 23 Jul 2020 15:55:39 +0000
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD83120674;
 Thu, 23 Jul 2020 15:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595519736;
 bh=794oAZiy8ioLny+/Vr1tNGrLTY249LqhcFj6aS5p5q0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=0+JgSJk1dXhhIMv0nAOS2nDA1d724WZmuJsOZuKsCI2bSawYdcMTMe1MLG+C72u8O
 s2l0ecLkuJd3yFX8AteP06ydgbYdprPLGMKL/gCsuGvbMHaCukAgG5ek/uk4jRDcMF
 kRmvO0NowMo++AH6lrhBzjfcuHUncWxykhGvW/gQ=
Date: Fri, 24 Jul 2020 00:55:31 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v3 6/7] riscv: Add KPROBES_ON_FTRACE supported
Message-Id: <20200724005531.e1fe3c7f024886a1a04e16eb@kernel.org>
In-Reply-To: <CAJF2gTTM6fsK5A9CKFkEhCC3hdsM8bCfBh613ohvM50fTLc5cw@mail.gmail.com>
References: <1594683562-68149-1-git-send-email-guoren@kernel.org>
 <1594683562-68149-7-git-send-email-guoren@kernel.org>
 <20200714203757.512ce7fb5fa61a88b1dbb2f3@kernel.org>
 <CAJF2gTSMUnHfv3GLj_TGT2dJkKq2zbEsnbPKREiq5i6PPjyTBg@mail.gmail.com>
 <20200721222701.3074315f6a9f6c42c5963f40@kernel.org>
 <CAJF2gTTM6fsK5A9CKFkEhCC3hdsM8bCfBh613ohvM50fTLc5cw@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_115538_175432_F4D39886 
X-CRM114-Status: GOOD (  21.17  )
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

T24gV2VkLCAyMiBKdWwgMjAyMCAxNjozOTo1MyArMDgwMApHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IEhpIE1hc2FtaSwKPiAKPiBPbiBUdWUsIEp1bCAyMSwgMjAyMCBhdCA5
OjI3IFBNIE1hc2FtaSBIaXJhbWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4K
PiA+IE9uIFdlZCwgMTUgSnVsIDIwMjAgMDA6MjQ6NTQgKzA4MDAKPiA+IEd1byBSZW4gPGd1b3Jl
bkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiA+IFRoeCBNYXNhbWksCj4gPiA+Cj4gPiA+IE9u
IFR1ZSwgSnVsIDE0LCAyMDIwIGF0IDc6MzggUE0gTWFzYW1pIEhpcmFtYXRzdSA8bWhpcmFtYXRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBNb24sIDEzIEp1bCAyMDIwIDIz
OjM5OjIxICswMDAwCj4gPiA+ID4gZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiA+ID4KPiA+
ID4gPiA+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+ID4gPiA+
Cj4gPiA+ID4gPiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3Iga3Byb2JlcyBvbiBmdHJhY2Ug
Y2FsbCBzaXRlcyB0byBhdm9pZHMKPiA+ID4gPiA+IG11Y2ggb2YgdGhlIG92ZXJoZWFkIHdpdGgg
cmVndWxhciBrcHJvYmVzLiBUcnkgaXQgd2l0aCBzaW1wbGUKPiA+ID4gPiA+IHN0ZXBzOgo+ID4g
PiA+ID4KPiA+ID4gPiA+IDEuIEdldCBfZG9fZm9yayBmdHJhY2UgY2FsbCBzaXRlLgo+ID4gPiA+
ID4gRHVtcCBvZiBhc3NlbWJsZXIgY29kZSBmb3IgZnVuY3Rpb24gX2RvX2Zvcms6Cj4gPiA+ID4g
PiAgICAweGZmZmZmZmUwMDAyMGFmNjQgPCswPjogICAgIGFkZGkgICAgc3Asc3AsLTEyOAo+ID4g
PiA+ID4gICAgMHhmZmZmZmZlMDAwMjBhZjY2IDwrMj46ICAgICBzZCAgICAgIHMwLDExMihzcCkK
PiA+ID4gPiA+ICAgIDB4ZmZmZmZmZTAwMDIwYWY2OCA8KzQ+OiAgICAgc2QgICAgICByYSwxMjAo
c3ApCj4gPiA+ID4gPiAgICAweGZmZmZmZmUwMDAyMGFmNmEgPCs2PjogICAgIGFkZGkgICAgczAs
c3AsMTI4Cj4gPiA+ID4gPiAgICAweGZmZmZmZmUwMDAyMGFmNmMgPCs4PjogICAgIHNkICAgICAg
czEsMTA0KHNwKQo+ID4gPiA+ID4gICAgMHhmZmZmZmZlMDAwMjBhZjZlIDwrMTA+OiAgICBzZCAg
ICAgIHMyLDk2KHNwKQo+ID4gPiA+ID4gICAgMHhmZmZmZmZlMDAwMjBhZjcwIDwrMTI+OiAgICBz
ZCAgICAgIHMzLDg4KHNwKQo+ID4gPiA+ID4gICAgMHhmZmZmZmZlMDAwMjBhZjcyIDwrMTQ+OiAg
ICBzZCAgICAgIHM0LDgwKHNwKQo+ID4gPiA+ID4gICAgMHhmZmZmZmZlMDAwMjBhZjc0IDwrMTY+
OiAgICBzZCAgICAgIHM1LDcyKHNwKQo+ID4gPiA+ID4gICAgMHhmZmZmZmZlMDAwMjBhZjc2IDwr
MTg+OiAgICBzZCAgICAgIHM2LDY0KHNwKQo+ID4gPiA+ID4gICAgMHhmZmZmZmZlMDAwMjBhZjc4
IDwrMjA+OiAgICBzZCAgICAgIHM3LDU2KHNwKQo+ID4gPiA+ID4gICAgMHhmZmZmZmZlMDAwMjBh
ZjdhIDwrMjI+OiAgICBtdiAgICAgIHM0LGEwCj4gPiA+ID4gPiAgICAweGZmZmZmZmUwMDAyMGFm
N2MgPCsyND46ICAgIG12ICAgICAgYTAscmEKPiA+ID4gPiA+ICAgIDB4ZmZmZmZmZTAwMDIwYWY3
ZSA8KzI2PjogICAgbm9wICAgPDw8PDw8PDwgaGVyZSEKPiA+ID4gPiA+ICAgIDB4ZmZmZmZmZTAw
MDIwYWY4MiA8KzMwPjogICAgbm9wCj4gPiA+ID4gPiAgICAweGZmZmZmZmUwMDAyMGFmODYgPCsz
ND46ICAgIGxkICAgICAgczMsMChzNCkKPiA+ID4gPiA+Cj4gPiA+ID4gPiAyLiBTZXQgX2RvX2Zv
cmsrMjYgYXMgdGhlIGtwcm9iZS4KPiA+ID4gPiA+ICAgZWNobyAncDpteXByb2JlIF9kb19mb3Jr
KzI2IGRmZD0lYTAgZmlsZW5hbWU9JWExIGZsYWdzPSVhMiBtb2RlPSs0KCRzdGFjayknID4gL3N5
cy9rZXJuZWwvZGVidWcvdHJhY2luZy9rcHJvYmVfZXZlbnRzCj4gPiA+ID4gPiAgIGVjaG8gMSA+
IC9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcvZXZlbnRzL2twcm9iZXMvZW5hYmxlCj4gPiA+ID4g
PiAgIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy90cmFjaW5nL3RyYWNlCj4gPiA+ID4gPiAgIHRyYWNl
cjogbm9wCj4gPiA+ID4gPgo+ID4gPiA+ID4gICBlbnRyaWVzLWluLWJ1ZmZlci9lbnRyaWVzLXdy
aXR0ZW46IDMvMyAgICNQOjEKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXy0tLS0tPT4gaXJxcy1vZmYKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC8gXy0tLS09PiBuZWVkLXJlc2NoZWQKPiA+ID4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAvIF8tLS09PiBoYXJkaXJxL3NvZnRpcnEKPiA+ID4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfHwgLyBfLS09PiBwcmVlbXB0LWRlcHRoCj4gPiA+
ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHx8fCAvICAgICBkZWxheQo+ID4gPiA+
ID4gICAgICAgICAgICAgVEFTSy1QSUQgICBDUFUjICB8fHx8ICAgIFRJTUVTVEFNUCAgRlVOQ1RJ
T04KPiA+ID4gPiA+ICAgICAgICAgICAgICAgIHwgfCAgICAgICB8ICAgfHx8fCAgICAgICB8ICAg
ICAgICAgfAo+ID4gPiA+ID4gICAgICAgICAgICAgICBzaC04NyAgICBbMDAwXSAuLi4uICAgNTUx
LjU1NzAzMTogbXlwcm9iZTogKF9kb19mb3JrKzB4MWEvMHgyZTYpIGRmZD0weGZmZmZmZmUwMDAy
MGFmN2UgZmlsZW5hbWU9MHhmZmZmZmZlMDAwMjBiMzRlIGZsYWdzPTB4ZmZmZmZmZTAwMTAxZTdj
MCBtb2RlPTB4MjBhZjg2ZmZmZmZmZTAKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgIGNhdCAvc3lzL2tl
cm5lbC9kZWJ1Zy9rcHJvYmVzL2xpc3QKPiA+ID4gPiA+IGZmZmZmZmUwMDAyMGFmN2UgIGsgIF9k
b19mb3JrKzB4MWEgICAgW0ZUUkFDRV0KPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF5eXl5eXgo+ID4gPiA+Cj4gPiA+ID4gSG1tLCB0aGlzIHNlZW1zIGZl
bnRyeSBpcyBub3Qgc3VwcG9ydGVkIG9uIFJJU0MtViB5ZXQuIEJ1dCBhbnl3YXksCj4gPiA+ID4g
aXQgd2lsbCBiZSB1c2VmdWwgZm9yIHVzZXJzIChpZiB0aGV5IGNhbiBmaW5kIHRoZSBvZmZzZXQp
Lgo+ID4gPgo+ID4gPiBTZWVtcyBvbmx5IHg4NiAmIOKshu+4jzkwIHVzZSBmZW50cnnvvIxjYW4g
eW91IGVsYWJvcmF0ZSBtb3JlIGFib3V0IGZlbnRyeSdzCj4gPiA+IGJlbmVmaXQgYW5kIGhvdyB0
aGUgdXNlciBjb3VsZCBzZXQga3Byb2JlIG9uIGZ0cmFjZSBjYWxsIHNpdGUgd2l0aG91dAo+ID4g
PiBkaXNhc3NlbWJsZT8KPiA+Cj4gPiBPbiB4ODYsIHRoZSBmZW50cnkgcmVwbGFjZXMgdGhlIG1j
b3VudCB3aXRoIGp1c3Qgb25lIGNhbGwgaW5zdHJ1Y3Rpb24sIHdpdGhvdXQKPiA+IHNhdmluZyBh
bnkgYXJndW1lbnRzLiBUaGlzIG1lYW5zIGFsbCBwcm9iZXMgd2hpY2ggYXJlIHB1dHMgb24gdGhl
IGFkZHJlc3Mgb2YKPiA+IHRhcmdldCBzeW1ib2wsIGFyZSBhdXRvbWF0aWNhbGx5IHVzaW5nIGZ0
cmFjZS4gSU9XLCBhbGwgcHJvYmVzIG9uIF9kb19mb3JrKzAKPiA+IHdpbGwgdXNlIGZ0cmFjZS4g
V2UgZG9uJ3QgbmVlZCBhbnkgZGlzYXNzZW1ibGluZy4KPiA+Cj4gPiBJIHRoaW5rIGlmIFJJU0Mt
ViBhbHJlYWR5IHN1cHBvcnQgIi1mcGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5PTIiIG9wdGlvbiBv
bgo+ID4gR0NDLCB5b3UgY2FuIGVhc2lseSBlbmFibGUgaXQgYXMgc2FtZSBhcyBhcm02NC4gU2Vl
IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzYvMTgvNjQ4Cj4gdGhlIGxpbmsgaXM6Cj4gW1BB
VENIIDAvN10gcG93ZXJwYy9mdHJhY2U6IFBhdGNoIG91dCAtbXByb2ZpbGUta2VybmVsIGluc3Ry
dWN0aW9ucwoKT29wcywgc29ycnkuCgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0t
a2VybmVsLzIwMTkxMjI1MTcyNjI1LjY5ODExYjNlQHhoYWNrZXIuZGViaWFuLwoKdGhpcyBzaG91
bGQgYmUgdGhlIHJpZ2h0IG9uZS4KCi0tIApNYXNhbWkgSGlyYW1hdHN1IDxtaGlyYW1hdEBrZXJu
ZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
