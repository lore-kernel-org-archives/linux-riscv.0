Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85DECD6E4C
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 06:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ASwV9YEJPHKu2t9ie25OuQMt+tcBMswQcJ1qm7Sy8gI=; b=QxhMjHlwHSMN2u
	z4bFKqH0BPlbwTtdUVLpT8Se5tkyiasjJ2vLU1N3uEETzzgcdES78PmX0y0gMJqv6vpfTlqITJ3jF
	aCc5xPDi4cepBXbWkBsPYhQCzWI+i7OAqr7tdCZwAnxfE1S2OrfVnMyi8hqtxypCR+iRIkvXnVVEJ
	Sx4VO6+4YgH0PnXhYEzP3bHFZNeszWk+etJ8q2FU6JsM20yn2bNtdYCakt9GH6nANlyATNHISjPOQ
	btkeERhAwF7ZK/EFqcl3zgalCTBawpMBZ/0974THlUPDCIAWOgKNz4+32ESeUXJOj28FSm2k44Dgx
	y+XQve1dstAp1oQXbllQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTvxm-0000000ABiN-0vTr;
	Mon, 01 Jun 2026 06:17:26 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTvxh-0000000ABi1-3z9T
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 06:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780294634; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=trvE0xJ84EkBQvsLZo8DiAzrmg+egpDX0iqFxhFhu0A=;
	b=pMZAocviMj8X9swCHxfiHQgzpnEDTtZvGPtGVh8VxMG9QR2QV36WvSDMUniuoYLYYrC8qu+yYe3xHVlRwxu/+aGZPRXyh6FjPH9CkZiPBXDee/m1obs6r2jazjqPBAvfoHUwuscLrJ1k48Jt7EMIv/DV5ulC4bqVWXdXGan0jPY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0X3x9b9C_1780294629;
Received: from 30.246.178.94(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0X3x9b9C_1780294629 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 01 Jun 2026 14:17:11 +0800
Message-ID: <0a913398-3d0c-472e-89c4-062052eae04d@linux.alibaba.com>
Date: Mon, 1 Jun 2026 14:17:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] scripts/sorttable: Handle RISC-V patchable ftrace
 entries
To: Wang Han <wanghan@linux.alibaba.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Steven Rostedt <rostedt@goodmis.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Chen Pei <cp0613@linux.alibaba.com>, Andy Chiu <andybnac@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Deepak Gupta <debug@rivosinc.com>, Puranjay Mohan <puranjay@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, oliver.yang@linux.alibaba.com,
 zhuo.song@linux.alibaba.com, jkchen@linux.alibaba.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, live-patching@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-perf-users@vger.kernel.org
References: <20260527123530.2593918-1-wanghan@linux.alibaba.com>
 <20260528082310.1994388-2-wanghan@linux.alibaba.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20260528082310.1994388-2-wanghan@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_231722_852398_82D7E493 
X-CRM114-Status: GOOD (  25.20  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiA1LzI4LzI2IDQ6MjMgUE0sIFdhbmcgSGFuIHdyb3RlOgo+IFJJU0MtViB1c2VzIC1mcGF0
Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5PTgsNCB3aGVuIHRoZSBjb21wcmVzc2VkIElTQSBpcwo+IGVu
YWJsZWQgYW5kIC1mcGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5PTQsMiBvdGhlcndpc2UuIEluIGJv
dGggY2FzZXMsIHRoZQo+IHBhdGNoYWJsZSBOT1AgYXJlYSBzdGFydHMgOCBieXRlcyBiZWZvcmUg
dGhlIGZ1bmN0aW9uIHN5bWJvbCBhZGRyZXNzLgo+IFRoZSBfX21jb3VudF9sb2MgZW50cmllcyB0
aGVyZWZvcmUgcG9pbnQgYXQgdGhlIHBhdGNoYWJsZSBOT1AgYXJlYQo+IGFzc29jaWF0ZWQgd2l0
aCBhIGZ1bmN0aW9uLCB3aGlsZSBubSByZXBvcnRzIHRoZSBmdW5jdGlvbiBzeW1ib2wgYXQgdGhl
Cj4gZW50cnkgYWRkcmVzcyB1c2VkIGZvciB0aGUgZnVuY3Rpb24gcmFuZ2UgY2hlY2suCj4gCj4g
QWZ0ZXIgUklTQy1WIHNlbGVjdGVkIEhBVkVfQlVJTERUSU1FX01DT1VOVF9TT1JULCBzb3J0dGFi
bGUgc3RhcnRlZAo+IGFwcGx5aW5nIHRoYXQgcmFuZ2UgY2hlY2sgYXQgYnVpbGQgdGltZS4gV2l0
aG91dCBhbGxvd2luZyBlbnRyaWVzIGp1c3QKPiBiZWZvcmUgdGhlIHJlcG9ydGVkIGZ1bmN0aW9u
IGFkZHJlc3MsIHRoZSBtY291bnQgc29ydGVyIHRyZWF0cyB2YWxpZAo+IFJJU0MtViBmdHJhY2Ug
Y2FsbHNpdGVzIGFzIGludmFsaWQgd2Vhay1mdW5jdGlvbiBlbnRyaWVzIGFuZCB3cml0ZXMKPiB0
aGVtIGJhY2sgYXMgemVyby4gVGhlIHJlc3VsdGluZyBrZXJuZWwgYm9vdHMgd2l0aCBubyBmdHJh
Y2UgZW50cmllcywKPiBicmVha2luZyBkeW5hbWljIGZ0cmFjZSBhbmQgdXNlcnMgc3VjaCBhcyBs
aXZlcGF0Y2guCj4gCj4gVGhlIGZhaWx1cmUgaXMgc2lsZW50IGR1cmluZyB0aGUgZmluYWwgbGlu
ayBiZWNhdXNlIHplcm9pbmcgd2Vhay1mdW5jdGlvbgo+IGVudHJpZXMgaXMgYW4gZXhwZWN0ZWQg
c29ydHRhYmxlIG9wZXJhdGlvbi4gQXQgYm9vdCwgdGhvc2UgemVybyBlbnRyaWVzCj4gYXJlIHNr
aXBwZWQgYnkgZnRyYWNlX3Byb2Nlc3NfbG9jcygpLCBzbyB0aGUgb25seSBvYnZpb3VzIHN5bXB0
b20gaXMgdGhhdAo+IHRoZSB2bWxpbnV4IGZ0cmFjZSB0YWJsZSBoYXMgbG9zdCB2YWxpZCBjYWxs
c2l0ZXMgYW5kIGZ0cmFjZSB1c2VycyBjYW5ub3QKPiBhdHRhY2ggdG8gdGhlbS4KPiAKPiBDT05G
SUdfRlRSQUNFX1NPUlRfU1RBUlRVUF9URVNUIGFsc28gcmVwb3J0cyB0aGUgdGFibGUgYXMgc29y
dGVkIGluIHRoaXMKPiBzdGF0ZTogaXQgb25seSBjaGVja3MgdGhhdCB0aGUgX19tY291bnRfbG9j
IGVudHJpZXMgYXJlIGluIGFzY2VuZGluZwo+IG9yZGVyLCB3aGljaCBhIGZ1bGx5IHplcm9lZCB0
YWJsZSB0cml2aWFsbHkgc2F0aXNmaWVzLiBUaGUgb3JpZ2luYWwKPiBjb21taXQgcmVsaWVkIG9u
IHRoaXMgY2hlY2sgYW5kIGRpZCBub3Qgc2VlIHRoZSByZWdyZXNzaW9uLgo+IAo+IE9uIGFuIGFm
ZmVjdGVkIFJJU0MtViBRRU1VIGJvb3Qgd2l0aCBib3RoIENPTkZJR19GVFJBQ0VfU09SVF9TVEFS
VFVQX1RFU1QKPiBhbmQgQ09ORklHX0ZUUkFDRV9TVEFSVFVQX1RFU1QgZW5hYmxlZCwgdGhlIHNv
cnQgY2hlY2sgc3RpbGwgcGFzc2VzCj4gd2hpbGUgZnRyYWNlIHJlcG9ydHMgemVybyB1c2FibGUg
ZW50cmllcyBhbmQgdGhlIGVhcmx5IHNlbGZ0ZXN0cyBmYWlsOgo+IAo+ICAgIFsgICAgMC4wMDAw
MDBdIGZ0cmFjZSBzZWN0aW9uIGF0IGZmZmZmZmZmODEwMWRhOTggc29ydGVkIHByb3Blcmx5Cj4g
ICAgWyAgICAwLjAwMDAwMF0gZnRyYWNlOiBhbGxvY2F0aW5nIDAgZW50cmllcyBpbiAxMjggcGFn
ZXMKPiAgICBbICAgIDAuMDU0OTk5XSBUZXN0aW5nIHRyYWNlciBmdW5jdGlvbjogLi4gbm8gZW50
cmllcyBmb3VuZCAuLkZBSUxFRCEKPiAgICBbICAgIDAuMTcyNDA3XSB0cmFjZXI6IGZ1bmN0aW9u
IGZhaWxlZCBzZWxmdGVzdCwgZGlzYWJsaW5nCj4gICAgWyAgICAwLjE3ODE4Nl0gRmFpbGVkIHRv
IGluaXQgZnVuY3Rpb25fZ3JhcGggdHJhY2VyLCBpbml0IHJldHVybmVkIC0xOQo+IAo+IEhhbmRs
ZSBSSVNDLVYgbGlrZSBhcm02NCBmb3IgdGhlIGZ1bmN0aW9uLXJhbmdlIGNoZWNrIGFuZCBhbGxv
dwo+IHBhdGNoYWJsZSBlbnRyaWVzIHVwIHRvIDggYnl0ZXMgYmVmb3JlIHRoZSBmdW5jdGlvbiBh
ZGRyZXNzLgo+IAo+IFdpdGggdGhpcyBmaXgsIGEgUklTQy1WIFFFTVUgc21va2UgYm9vdCB3aXRo
IGZ0cmFjZSBzdGFydHVwIHRlc3RzIHNob3dzCj4gdGhlIHZtbGludXggZnRyYWNlIHRhYmxlIGlz
IHBvcHVsYXRlZCBhbmQgZHluYW1pYyBmdHJhY2Ugc3RpbGwgd29ya3M6Cj4gCj4gICAgWyAgICAw
LjAwMDAwMF0gZnRyYWNlOiBhbGxvY2F0aW5nIDQ2NzQ5IGVudHJpZXMgaW4gMTg0IHBhZ2VzCj4g
ICAgWyAgICAwLjA1MTExNV0gVGVzdGluZyB0cmFjZXIgZnVuY3Rpb246IFBBU1NFRAo+ICAgIFsg
ICAgMS4yODM3ODJdIFRlc3RpbmcgZHluYW1pYyBmdHJhY2U6IFBBU1NFRAo+ICAgIFsgICAgNi4y
NzU0NTZdIFRlc3RpbmcgdHJhY2VyIGZ1bmN0aW9uX2dyYXBoOiBQQVNTRUQKPiAKPiBGaXhlczog
MGNhMTcyNGI1NmFmICgicmlzY3Y6IGZ0cmFjZTogc2VsZWN0IEhBVkVfQlVJTERUSU1FX01DT1VO
VF9TT1JUIikKPiBTdWdnZXN0ZWQtYnk6IFN0ZXZlbiBSb3N0ZWR0IChHb29nbGUpIDxyb3N0ZWR0
QGdvb2RtaXMub3JnPgo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDUy
NzExMzAyOC40YjIxYTVkZUBmZWRvcmEvCj4gU2lnbmVkLW9mZi1ieTogV2FuZyBIYW4gPHdhbmdo
YW5AbGludXguYWxpYmFiYS5jb20+Cj4gLS0tCj4gICBzY3JpcHRzL3NvcnR0YWJsZS5jIHwgMTAg
KysrKysrKy0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9zb3J0dGFibGUuYyBiL3NjcmlwdHMvc29y
dHRhYmxlLmMKPiBpbmRleCBlOGVkMTFjNjgwYzYuLjRjMTBlODViYjVhZiAxMDA2NDQKPiAtLS0g
YS9zY3JpcHRzL3NvcnR0YWJsZS5jCj4gKysrIGIvc2NyaXB0cy9zb3J0dGFibGUuYwo+IEBAIC04
OTEsMTcgKzg5MSwyMSBAQCBzdGF0aWMgaW50IGRvX2ZpbGUoY2hhciBjb25zdCAqY29uc3QgZm5h
bWUsIHZvaWQgKmFkZHIpCj4gICAJdGFibGVfc29ydF90IGN1c3RvbV9zb3J0ID0gTlVMTDsKPiAg
IAo+ICAgCXN3aXRjaCAoZWxmX21hcF9tYWNoaW5lKGVoZHIpKSB7Cj4gLQljYXNlIEVNX0FBUkNI
NjQ6Cj4gICAjaWZkZWYgTUNPVU5UX1NPUlRfRU5BQkxFRAo+ICsJY2FzZSBFTV9BQVJDSDY0Ogo+
ICAgCQlzb3J0X3JlbG9jID0gdHJ1ZTsKPiAgIAkJcmVsYV90eXBlID0gMHg0MDM7Cj4gLQkJLyog
YXJtNjQgdXNlcyBwYXRjaGFibGUgZnVuY3Rpb24gZW50cnkgcGxhY2luZyBiZWZvcmUgZnVuY3Rp
b24gKi8KPiArCQkvKiBmYWxsdGhyb3VnaCAqLwo+ICsJY2FzZSBFTV9SSVNDVjoKPiArCQkvKiBh
cm02NCBhbmQgUklTQy1WIHBsYWNlIHBhdGNoYWJsZSBlbnRyaWVzIGJlZm9yZSB0aGUgZnVuY3Rp
b24gKi8KPiAgIAkJYmVmb3JlX2Z1bmMgPSA4OwoKTml0OiBUaGUgc2hhcmVkIGNvbW1lbnQgbm93
IHNpdHMgdW5kZXIgYGNhc2UgRU1fUklTQ1Y6YCBidXQgdGhlIHR3bwpsaW5lcyBhYm92ZSBpdCAo
c29ydF9yZWxvYyAvIHJlbGFfdHlwZSA9IDB4NDAzKSBhcmUgc3RyaWN0bHkKYXJtNjQtb25seSDi
gJQgdGhleSBjb25maWd1cmUgdGhlIFJFTEEtYmFzZWQgd2Vhay1mdW5jdGlvbiBmaXh1cCB0aGF0
ClJJU0MtViBkb2VzIG5vdCBuZWVkLiBPbiBhIHF1aWNrIHJlYWQgaXQgaXMgZWFzeSB0byB3b25k
ZXIgaWYgUklTQy1WCmlzIGltcGxpY2l0bHkgaW5oZXJpdGluZyB0aGF0IHBhdGguIFNwbGl0dGlu
ZyB0aGUgY29tbWVudHMgd291bGQKaGVscCwgZS5nLjoKCiAgICAgICAgY2FzZSBFTV9BQVJDSDY0
OgogICAgICAgICAgICAvKiBhcm02NCBuZWVkcyBSRUxBLWJhc2VkIHdlYWstZnVuY3Rpb24gZml4
dXAgKi8KICAgICAgICAgICAgc29ydF9yZWxvYyA9IHRydWU7CiAgICAgICAgICAgIHJlbGFfdHlw
ZSA9IDB4NDAzOwogICAgICAgICAgICAvKiBmYWxsdGhyb3VnaCAqLwogICAgICAgIGNhc2UgRU1f
UklTQ1Y6CiAgICAgICAgICAgIC8qIGFybTY0IGFuZCBSSVNDLVYgcGxhY2UgcGF0Y2hhYmxlIGVu
dHJpZXMgYmVmb3JlIHRoZSBmdW5jdGlvbiAqLwogICAgICAgICAgICBiZWZvcmVfZnVuYyA9IDg7
CgoKPiArI2Vsc2UKPiArCWNhc2UgRU1fQUFSQ0g2NDoKPiArCWNhc2UgRU1fUklTQ1Y6Cj4gICAj
ZW5kaWYKPiAgIAkJLyogZmFsbHRocm91Z2ggKi8KPiAgIAljYXNlIEVNXzM4NjoKPiAgIAljYXNl
IEVNX0xPT05HQVJDSDoKPiAtCWNhc2UgRU1fUklTQ1Y6Cj4gICAJY2FzZSBFTV9TMzkwOgo+ICAg
CWNhc2UgRU1fWDg2XzY0Ogo+ICAgCQljdXN0b21fc29ydCA9IHNvcnRfcmVsYXRpdmVfdGFibGVf
d2l0aF9kYXRhOwoKUmV2aWV3ZWQtYnk6IFNodWFpIFh1ZSA8eHVlc2h1YWlAbGludXguYWxpYmFi
YS5jb20+CgpUaGFua3MuClNodWFpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
