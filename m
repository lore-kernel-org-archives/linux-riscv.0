Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB75C83F01
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 15:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BKhJFrZr0Uy8T95Da2F1JlLkZL2HGLpIdShs+ZH+nmo=; b=IOxtlnBQojIg51
	GqlqlL4LSjIgrUj0IKafwhHkuJGa2ItwbkfKg8Nxb6ESixKMM0cfTiorp/lCpqoqPFlt86P8uF9Be
	//FRBHOUTaAhyRTh/ZYS4ZVXfVlL0I3eGNtwZsAHSrai0l8QL1U1ciPfbwPvNhT7NmRH5Ov6NQjyo
	nfs1yQDQyPYvd+dgf1rNGZLy07ZCe6IwPO077YNQouCuaxmojua6EkQ8iUUWZelmrb2lgHZJfH0d+
	yqx+7zt69HeyLzsAyknDbQaCpksXoalueUku0zZrDNcG022iB8QkXPy352Fla1VCo4Hu5LIX6tmlw
	TgMOWmqCvYW4MMFX3MlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbN7H-00DlJr-2R;
	Wed, 30 Aug 2023 15:28:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbN7E-00DlJU-2S
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 15:28:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4021DB81F6C;
	Wed, 30 Aug 2023 15:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D00EC433C7;
	Wed, 30 Aug 2023 15:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693409298;
	bh=eJALBHCOH5TNLwcXGS4IHCmyippx6NMKrCvUKry2GQM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nhzi6KfuNMLLKMLYQz+CTspkyOAHr2fx0TU1jDN91VvxBfExqgoAFaVBPFiX8D/67
	 rYU41bkX5HVHBttIchBMF59LrzrpFc8K5sCmi90Lu4j1JZ6IOwNCygdydITpM10OAS
	 Hsa0aKGFHX5qI3oXjjTMgR4sB6RPIRW/UNAiXa+hugcMKyOqCfvbQxKy0cQxF1uA2R
	 yFoXsNnRqULDYI8f7hdcnMrX9267Gl3x1vAK3xz6FLdQjns5eIvOp2zklWa/S5k+UH
	 gBrjdWt6gGY5/wo/mVxZAcmlsXFrlSs6ovwMv8VlOkeywrjn706gFRJhaejf5lbDVN
	 fql+08fXAs7jA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: suagrfillet@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, rostedt@goodmis.org, mhiramat@kernel.org, Mark
 Rutland <mark.rutland@arm.com>, guoren@kernel.org, suagrfillet@gmail.com,
 Bjorn Topel <bjorn@rivosinc.com>, jszhang@kernel.org, Conor Dooley
 <conor.dooley@microchip.com>, pulehui@huawei.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, songshuaishuai@tinylab.org,
 bpf@vger.kernel.org
Subject: Re: [PATCH V11 0/5] riscv: Optimize function trace
In-Reply-To: <87zg2hse7m.fsf@all.your.base.are.belong.to.us>
References: <mhng-a2c88f43-3cf7-4caa-8e4a-b0fc9d7e4628@palmer-ri-x1c9a>
 <87zg2hse7m.fsf@all.your.base.are.belong.to.us>
Date: Wed, 30 Aug 2023 17:28:15 +0200
Message-ID: <87a5u85z3k.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_082821_116976_C6FF97A6 
X-CRM114-Status: GOOD (  17.27  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBQYWxtZXIgRGFiYmVs
dCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4gd3JpdGVzOgo+Cj4+IE9uIFdlZCwgMTIgSnVsIDIwMjMg
MTE6MTE6MDggUERUICgtMDcwMCksIGJqb3JuQGtlcm5lbC5vcmcgd3JvdGU6Cj4+PiBTb25nIFNo
dWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+IHdyaXRlczoKPj4+Cj4+PiBbLi4uXQo+Pj4KPj4+
PiBBZGQgV0lUSF9ESVJFQ1RfQ0FMTFMgc3VwcG9ydCBbM10gKHBhdGNoIDMsIDQpCj4+Pj4gPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+Pj4KPj4+IFdlJ3Zl
IGhhZCBzb21lIG9mZmxpc3QgZGlzY3Vzc2lvbnMsIHNvIGhlcmUncyBzb21lIGlucHV0IGZvciBh
IHdpZGVyCj4+PiBhdWRpZW5jZSEgTW9zdCBpbXBvcnRhbnRseSwgdGhpcyBpcyBmb3IgUGFsbWVy
LCBzbyB0aGF0IHRoaXMgc2VyaWVzIGlzCj4+PiBub3QgbWVyZ2VkIHVudGlsIGEgcHJvcGVyIEJQ
RiB0cmFtcG9saW5lIGZpeCBpcyBpbiBwbGFjZS4KPj4+Cj4+PiBOb3RlIHRoYXQgd2hhdCdzIGN1
cnJlbnRseSB1c2FibGUgZnJvbSBCUEYgdHJhbXBvbGluZSAqd29ya3MqLiBJdCdzCj4+PiB3aGVu
IHRoaXMgc2VyaWVzIGlzIGFkZGVkIHRoYXQgaXQgYnJlYWtzLgo+Pj4KPj4+IFRMO0RSIFRoaXMg
c2VyaWVzIGFkZHMgRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMsIHdoaWNoIGVuYWJs
ZXMKPj4+IGZlbnRyeS9mZXhpdCBCUEYgdHJhbXBvbGluZSBzdXBwb3J0LiBVbmZvcnR1bmF0ZWx5
IHRoZQo+Pj4gZmV4aXQvQlBGX1RSQU1QX0ZfU0tJUF9GUkFNRSBwYXJ0cyBvZiB0aGUgUlYgQlBG
IHRyYW1wb2xpbmUgYnJlYWtzCj4+PiB3aXRoIHRoaXMgYWRkaXRpb24sIGFuZCBuZWVkIHRvIGJl
IGFkZHJlc3NlZCAqcHJpb3IqIG1lcmdpbmcgdGhpcwo+Pj4gc2VyaWVzLiBBbiBlYXN5IHdheSB0
byByZXByb2R1Y2UsIGlzIGp1c3QgY2FsbGluZyBhbnkgb2YgdGhlIGtzZWxmdGVzdAo+Pj4gdGVz
dHMgdGhhdCB1c2VzIGZleGl0IHBhdGNoaW5nLgo+Pj4KPj4+IFRoZSBpc3N1ZSBpcyBhcm91bmQg
dGhlIG5vcCBzZWxkLCBhbmQgaG93IGEgY2FsbCBpcyBkb25lOyBUaGUgbm9wIHNsZWQKPj4+IChw
YXRjaGFibGUtZnVuY3Rpb24tZW50cnkpIHNpemUgY2hhbmdlZCBmcm9tIDE2QiB0byA4QiBpbiBj
b21taXQKPj4+IDY3MjRhNzZjZmY4NSAoInJpc2N2OiBmdHJhY2U6IFJlZHVjZSB0aGUgZGV0b3Vy
IGNvZGUgc2l6ZSB0byBoYWxmIiksIGJ1dAo+Pj4gQlBGIGNvZGUgc3RpbGwgdXNlcyB0aGUgb2xk
IDE2Qi4gU28gaXQnbGwgd29yayBmb3IgQlBGIHByb2dyYW1zLCBidXQgbm90Cj4+PiBmb3IgcmVn
dWxhciBrZXJuZWwgZnVuY3Rpb25zLgo+Pj4KPj4+IEFuIGV4YW1wbGU6Cj4+Pgo+Pj4gICB8IGZm
ZmZmZmZmODBmYTQxNTAgPGJwZl9mZW50cnlfdGVzdDE+Ogo+Pj4gICB8IGZmZmZmZmZmODBmYTQx
NTA6ICAgICAgIDAwMDEgICAgICAgICAgICAgICAgICAgIG5vcAo+Pj4gICB8IGZmZmZmZmZmODBm
YTQxNTI6ICAgICAgIDAwMDEgICAgICAgICAgICAgICAgICAgIG5vcAo+Pj4gICB8IGZmZmZmZmZm
ODBmYTQxNTQ6ICAgICAgIDAwMDEgICAgICAgICAgICAgICAgICAgIG5vcAo+Pj4gICB8IGZmZmZm
ZmZmODBmYTQxNTY6ICAgICAgIDAwMDEgICAgICAgICAgICAgICAgICAgIG5vcAo+Pj4gICB8IGZm
ZmZmZmZmODBmYTQxNTg6ICAgICAgIDExNDEgICAgICAgICAgICAgICAgICAgIGFkZCAgICAgc3As
c3AsLTE2Cj4+PiAgIHwgZmZmZmZmZmY4MGZhNDE1YTogICAgICAgZTQyMiAgICAgICAgICAgICAg
ICAgICAgc2QgICAgICBzMCw4KHNwKQo+Pj4gICB8IGZmZmZmZmZmODBmYTQxNWM6ICAgICAgIDA4
MDAgICAgICAgICAgICAgICAgICAgIGFkZCAgICAgczAsc3AsMTYKPj4+ICAgfCBmZmZmZmZmZjgw
ZmE0MTVlOiAgICAgICA2NDIyICAgICAgICAgICAgICAgICAgICBsZCAgICAgIHMwLDgoc3ApCj4+
PiAgIHwgZmZmZmZmZmY4MGZhNDE2MDogICAgICAgMjUwNSAgICAgICAgICAgICAgICAgICAgYWRk
dyAgICBhMCxhMCwxCj4+PiAgIHwgZmZmZmZmZmY4MGZhNDE2MjogICAgICAgMDE0MSAgICAgICAg
ICAgICAgICAgICAgYWRkICAgICBzcCxzcCwxNgo+Pj4gICB8IGZmZmZmZmZmODBmYTQxNjQ6ICAg
ICAgIDgwODIgICAgICAgICAgICAgICAgICAgIHJldAo+Pj4KPj4+IGlzIHBhdGNoZWQgdG86Cj4+
Pgo+Pj4gICB8IGZmZmZmZmZmODBmYTQxNTA6ICBmNzBjMDI5NyAgICAgICAgICAgICAgICAgICAg
IGF1aXBjICAgdDAsLTE1MDIwODUxMgo+Pj4gICB8IGZmZmZmZmZmODBmYTQxNTQ6ICBlYjAyODJl
NyAgICAgICAgICAgICAgICAgICAgIGphbHIgICAgdDAsdDAsLTMzNgo+Pj4KPj4+IFRoZSByZXR1
cm4gYWRkcmVzcyB0byBicGZfZmVudHJ5X3Rlc3QxIGlzIHN0b3JlZCBpbiB0MCBhdCBCUEYKPj4+
IHRyYW1wb2xpbmUgZW50cnkuIFJldHVybiB0byB0aGUgKnBhcmVudCogaXMgaW4gcmEuIFRoZSB0
cmFtcGxpbmUgaGFzCj4+PiB0byBkZWFsIHdpdGggdGhpcy4KPj4+Cj4+PiBGb3IgQlBGX1RSQU1Q
X0ZfU0tJUF9GUkFNRS9DQUxMX09SSUcsIHRoZSBCUEYgdHJhbXBvbGluZSB3aWxsIHNraXAgdG9v
Cj4+PiBtYW55IGJ5dGVzLCBhbmQgbm90IGNvcnJlY3RseSBoYW5kbGUgcGFyZW50IGNhbGxzLgo+
Pj4KPj4+IEZ1cnRoZXI7IFRoZSBCUEYgdHJhbXBvbGluZSBjdXJyZW50bHkgaGFzIGEgZGlmZmVy
ZW50IHdheSBvZiBwYXRjaGluZwo+Pj4gdGhlIG5vcHMgZm9yIEJQRiBwcm9ncmFtcywgdGhhbiB3
aGF0IGZ0cmFjZSBkb2VzLiBUaGF0IHNob3VsZCBiZSBjaGFuZ2VkCj4+PiB0byBtYXRjaCB3aGF0
IGZ0cmFjZSBkb2VzIChhdWlwYy9qYWxyIHQwKS4KPj4+Cj4+PiBUbyBzdW1tYXJpemU6Cj4+PiAg
KiBBbGlnbiBCUEYgbm9wIHNsZWQgd2l0aCBwYXRjaGFibGUtZnVuY3Rpb24tZW50cnk6IDhCLgo+
Pj4gICogQWRhcHQgQlBGIHRyYW1wb2xpbmUgZm9yIDhCIG5vcCBzbGVkcy4KPj4+ICAqIEFkYXB0
IEJQRiB0cmFtcG9saW5lIHQwIHJldHVybiwgcmEgcGFyZW50IHNjaGVtZS4KPj4KPj4gVGhhbmtz
IGZvciBkaWdnaW5nIGludG8gdGhpcyBvbmUsIEkgYWdyZWUgd2UgbmVlZCB0byBzb3J0IG91dCB0
aGUgQlBGIAo+PiBicmVha2FnZXMgYmVmb3JlIHdlIG1lcmdlIHRoaXMuICBTb3VuZHMgbGlrZSB0
aGVyZSdzIGEgcmFiYml0IGhvbGUgaGVyZSwgCj4+IGJ1dCBob3BlZnVsbHkgd2UgY2FuIGdldCBp
dCBzb3J0ZWQgb3V0Lgo+Pgo+PiBJJ3ZlIGRyb3BwZWQgdGhpcyBmcm9tIHBhdGNod29yayBhbmQg
c3VjaCwgYXMgd2UnbGwgbmVlZCBhdCBsZWFzdCAKPj4gYW5vdGhlciBzcGluLgo+Cj4gUGFsbWVy
LAo+Cj4gVGhlIG5lZWRlZCBCUEYgcGF0Y2ggaXMgdXBzdHJlYW0gaW4gdGhlIGJwZi1uZXh0IHRy
ZWUsIGFuZCBoYXMgYmVlbiBmb3IKPiBhIGNvdXBsZSBvZiB3ZWVrcy4KPgo+IEkgdGhpbmsgdGhp
cyBzZXJpZXMgaXMgYSBjYW5kaWRhdGUgZm9yIFJJU0MtViAtbmV4dCEgSXQgd291bGQgaGVscAo+
IFJJU0MtViBCUEYgYSBsb3QgaW4gdGVybXMgb2YgY29tcGxldGVuZXNzLgoKUGFsbWVyLAoKVGhl
IG5lZWRlZCBmaXggZm9yIEJQRiBpcyBub3cgaW4gTGludXMnIHRyZWUsIGNvbW1pdCAyNWFkMTA2
NThkYzEKKCJyaXNjdiwgYnBmOiBBZGFwdCBicGYgdHJhbXBvbGluZSB0byBvcHRpbWl6ZWQgcmlz
Y3YgZnRyYWNlCmZyYW1ld29yayIpLiBJT1csIHRoaXMgZnRyYWNlIHNlcmllcyBjYW4gYmUgbWVy
Z2VkIG5vdy4KCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
