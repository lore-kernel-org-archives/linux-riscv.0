Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EBDCD6E55
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 13:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AwxPoqcxz0uTBdUw0N1ngwLwa83LSTf0eZtzkI/SJj4=; b=0wtLoxLnW58+Hu
	W35QGyTV0kDT7Ygi0f+PUnV76KnV/lowKSEFhkeABYc/q/mH0PGubBkpKYLFMyry2XmSL7hFc+VPG
	iIM+3tcJwubofzlwp+QV9UorUnSktPSPJ75QI++cSWreTpeBWvbaiRZhwggRnu9zQzuzuBoYS4snd
	FraremdpIiBBsM8rYaKSgX/bJeE0QFGDDLNAAABUB1OiUashRH+zDy/VVqRiZ57Oat8owcLPy4oe1
	OoYjK5cpOqoYPRtCpxg/p8qa22nckgyCuseLa7aHvMNARAiav1XFzfLSwC0K+Fx1kAV0TSVh88vw8
	eZg/j+OD9GO2IOX4g9YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU39a-0000000BF5y-0fA1;
	Mon, 01 Jun 2026 13:58:06 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU39X-0000000BF5K-1Sr5
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 13:58:04 +0000
Received: from omf16.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 62784C25AE;
	Mon,  1 Jun 2026 13:57:56 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id 559FF2000F;
	Mon,  1 Jun 2026 13:57:48 +0000 (UTC)
Date: Mon, 1 Jun 2026 09:57:46 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: Wang Han <wanghan@linux.alibaba.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Chen Pei <cp0613@linux.alibaba.com>, Andy Chiu
 <andybnac@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Deepak Gupta <debug@rivosinc.com>, Puranjay Mohan
 <puranjay@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Josh
 Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, Miroslav
 Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de
 Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 oliver.yang@linux.alibaba.com, zhuo.song@linux.alibaba.com,
 jkchen@linux.alibaba.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v2 1/8] scripts/sorttable: Handle RISC-V patchable
 ftrace entries
Message-ID: <20260601095746.70c01d24@fedora>
In-Reply-To: <0a913398-3d0c-472e-89c4-062052eae04d@linux.alibaba.com>
References: <20260527123530.2593918-1-wanghan@linux.alibaba.com>
	<20260528082310.1994388-2-wanghan@linux.alibaba.com>
	<0a913398-3d0c-472e-89c4-062052eae04d@linux.alibaba.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Rspamd-Queue-Id: 559FF2000F
X-Rspamd-Server: rspamout06
X-Stat-Signature: f447gedbzrerco4pdpduczfnka86u36g
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX194pc8QTmXaS/d93wdj0DvE5EOOw5sTtk4=
X-HE-Tag: 1780322268-32769
X-HE-Meta: U2FsdGVkX1+yVgV/w52pVzTLLqyvVAY9J7gVdB5Q1WuUAGM+lsRLxst53oCPsODAVFZnfliDVWsZcm6mLFinY/0IjFZHPb7CSMn8LIhKh7qtGtlpAjvpgVz4uEBhr2YExi/iahHXazkS5LqTxk2sga2susKYFqYsc4ZedAO9lXwWAiEiEvtBok619UN83VMlbMMYI5ORxSJkORJrEsagLayD4xVGn8q5hyVAdJgn5WRHWqMyFrDA/DRy3tn1I75zMJ/Vb6ubTTbSu1X1UsW4R0NdWkcWDfgaW6x9dkOznSUkBNMTIweGHS+UG5tNc9VWEeDvYkqEtJpT6v4X4SdrJ9Vr1t1Z9Yhd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_065803_447242_B1FD4C83 
X-CRM114-Status: GOOD (  14.59  )
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

T24gTW9uLCAxIEp1biAyMDI2IDE0OjE3OjA4ICswODAwClNodWFpIFh1ZSA8eHVlc2h1YWlAbGlu
dXguYWxpYmFiYS5jb20+IHdyb3RlOgoKPiA+IGRpZmYgLS1naXQgYS9zY3JpcHRzL3NvcnR0YWJs
ZS5jIGIvc2NyaXB0cy9zb3J0dGFibGUuYwo+ID4gaW5kZXggZThlZDExYzY4MGM2Li40YzEwZTg1
YmI1YWYgMTAwNjQ0Cj4gPiAtLS0gYS9zY3JpcHRzL3NvcnR0YWJsZS5jCj4gPiArKysgYi9zY3Jp
cHRzL3NvcnR0YWJsZS5jCj4gPiBAQCAtODkxLDE3ICs4OTEsMjEgQEAgc3RhdGljIGludCBkb19m
aWxlKGNoYXIgY29uc3QgKmNvbnN0IGZuYW1lLCB2b2lkICphZGRyKQo+ID4gICAJdGFibGVfc29y
dF90IGN1c3RvbV9zb3J0ID0gTlVMTDsKPiA+ICAgCj4gPiAgIAlzd2l0Y2ggKGVsZl9tYXBfbWFj
aGluZShlaGRyKSkgewo+ID4gLQljYXNlIEVNX0FBUkNINjQ6Cj4gPiAgICNpZmRlZiBNQ09VTlRf
U09SVF9FTkFCTEVECj4gPiArCWNhc2UgRU1fQUFSQ0g2NDoKPiA+ICAgCQlzb3J0X3JlbG9jID0g
dHJ1ZTsKPiA+ICAgCQlyZWxhX3R5cGUgPSAweDQwMzsKPiA+IC0JCS8qIGFybTY0IHVzZXMgcGF0
Y2hhYmxlIGZ1bmN0aW9uIGVudHJ5IHBsYWNpbmcgYmVmb3JlIGZ1bmN0aW9uICovCj4gPiArCQkv
KiBmYWxsdGhyb3VnaCAqLwo+ID4gKwljYXNlIEVNX1JJU0NWOgo+ID4gKwkJLyogYXJtNjQgYW5k
IFJJU0MtViBwbGFjZSBwYXRjaGFibGUgZW50cmllcyBiZWZvcmUgdGhlIGZ1bmN0aW9uICovCj4g
PiAgIAkJYmVmb3JlX2Z1bmMgPSA4OyAgCj4gCj4gTml0OiBUaGUgc2hhcmVkIGNvbW1lbnQgbm93
IHNpdHMgdW5kZXIgYGNhc2UgRU1fUklTQ1Y6YCBidXQgdGhlIHR3bwo+IGxpbmVzIGFib3ZlIGl0
IChzb3J0X3JlbG9jIC8gcmVsYV90eXBlID0gMHg0MDMpIGFyZSBzdHJpY3RseQo+IGFybTY0LW9u
bHkg4oCUIHRoZXkgY29uZmlndXJlIHRoZSBSRUxBLWJhc2VkIHdlYWstZnVuY3Rpb24gZml4dXAg
dGhhdAo+IFJJU0MtViBkb2VzIG5vdCBuZWVkLiBPbiBhIHF1aWNrIHJlYWQgaXQgaXMgZWFzeSB0
byB3b25kZXIgaWYgUklTQy1WCj4gaXMgaW1wbGljaXRseSBpbmhlcml0aW5nIHRoYXQgcGF0aC4g
U3BsaXR0aW5nIHRoZSBjb21tZW50cyB3b3VsZAo+IGhlbHAsIGUuZy46Cj4gCj4gICAgICAgICBj
YXNlIEVNX0FBUkNINjQ6Cj4gICAgICAgICAgICAgLyogYXJtNjQgbmVlZHMgUkVMQS1iYXNlZCB3
ZWFrLWZ1bmN0aW9uIGZpeHVwICovCj4gICAgICAgICAgICAgc29ydF9yZWxvYyA9IHRydWU7Cj4g
ICAgICAgICAgICAgcmVsYV90eXBlID0gMHg0MDM7Cj4gICAgICAgICAgICAgLyogZmFsbHRocm91
Z2ggKi8KPiAgICAgICAgIGNhc2UgRU1fUklTQ1Y6Cj4gICAgICAgICAgICAgLyogYXJtNjQgYW5k
IFJJU0MtViBwbGFjZSBwYXRjaGFibGUgZW50cmllcyBiZWZvcmUgdGhlIGZ1bmN0aW9uICovCj4g
ICAgICAgICAgICAgYmVmb3JlX2Z1bmMgPSA4OwoKTWFrZXMgc2Vuc2UuCgpDYXJlIHRvIHNlbmQg
YSB2Mz8KCi0tIFN0ZXZlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
