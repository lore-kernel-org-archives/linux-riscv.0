Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BC7CD6E4A
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 11:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/YJRZfbaDN0VDhr6uTB+pQxqFvafuy7j2sMtIDLe4wc=; b=V4rj10vXVxX/iK
	mxcsW+eCplxUZnHtnL8MdAKNOWgK4bLkgDaNnD7vvsrFggs2jxttP7PqzamEewot66FVTbKt7qrJd
	H7+MhB5IvBHvlXlIXfJfc+jtMLmVa0LS+Un9H1rFQ3alNRSTphAlXb52HvskUqtIRwwXfQWSifAqy
	Ydy14RLQFmKGGLhUutv+r9gHKuTkIAow8VVWvJ7B3Wy2SrXGnj2xGYfsUKqE3GxHO93h4DgtIqvzk
	f3KeD5LNeFFBmtiFKVDHLK6IYtE4Cyz2I0QTbCO34++P3AvySgFdudi7ljvkabGfwniHgY1i55Mam
	88Obb3zOpCGy4Lz2+PYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUND0-0000000Crpd-1b6T;
	Tue, 02 Jun 2026 11:22:58 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNCx-0000000CrpB-3BEp
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 11:22:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780399373; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Zbw5BKJXHyNT/TPLzF2MYusKHtOC6lHLUdejhNl1Q64=;
	b=ld2B9ySg6F8F9XA/6m5nnP0Y1YKK264jBfRluFKD3qskhQC4jGRCO+yFUZRhxfr38WTt62sSJWVZ9e+BOEFlWm2P0RYSDgZt4UMegURoMyDwjZzkAA9WGOdQ05PQyzQB5RVrPfgE3Nwfbhl1yitjKCxZFRA3TRLESrAI3JBl288=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R831e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0X44JnKC_1780399369;
Received: from 30.100.154.88(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0X44JnKC_1780399369 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 19:22:51 +0800
Message-ID: <a385e57a-e895-4044-ae94-8cd8dfbd3bed@linux.alibaba.com>
Date: Tue, 2 Jun 2026 19:22:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] riscv: stacktrace: disable KASAN instrumentation
 for stacktrace.o
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
 <20260528082310.1994388-4-wanghan@linux.alibaba.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20260528082310.1994388-4-wanghan@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_042256_038627_4B88243E 
X-CRM114-Status: GOOD (  16.03  )
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

CgpPbiA1LzI4LzI2IDQ6MjMgUE0sIFdhbmcgSGFuIHdyb3RlOgo+IEtBU0FOIHJlY29yZHMgc3Rh
Y2sgdHJhY2VzIGZvciBldmVyeSBhbGxvYy9mcmVlLCB3aGljaCBtZWFucyBpdCB3YWxrcwo+IHRo
ZSB1bndpbmRlciB2ZXJ5IGZyZXF1ZW50bHkuIEluc3RydW1lbnRpbmcgdGhlIHN0YWNrIHRyYWNl
IGNvbGxlY3Rpb24KPiBjb2RlIGl0c2VsZiBhZGRzIHN1YnN0YW50aWFsIG92ZXJoZWFkIGFuZCBt
YWtlcyB0aGUgdHJhY2VzIHRoZW1zZWx2ZXMKPiBub2lzaWVyLgo+IAo+IE1hcmsgc3RhY2t0cmFj
ZS5vIGFzIG5vdCBLQVNBTi1pbnN0cnVtZW50ZWQsIG1hdGNoaW5nIHRoZSBhcm0sIGFybTY0Cj4g
YW5kIHg4NiB0cmVhdG1lbnQgb2YgdGhlaXIgc3RhY2sgdW53aW5kaW5nIGNvZGUuIFRoaXMgaXMg
YSBwcmVyZXF1aXNpdGUKPiBwcmVmZXJlbmNlIGZvciB0aGUgdXBjb21pbmcgcmVsaWFibGUgdW53
aW5kZXIsIGJ1dCB0aGUgY2hhbmdlIGlzIHZhbGlkCj4gb24gaXRzIG93bi4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBXYW5nIEhhbiA8d2FuZ2hhbkBsaW51eC5hbGliYWJhLmNvbT4KPiAtLS0KPiAgIGFy
Y2gvcmlzY3Yva2VybmVsL01ha2VmaWxlIHwgNSArKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmls
ZSBiL2FyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlCj4gaW5kZXggY2FiYjk5Y2FkZmI2Li4xY2I2
YzlhYjI5ODEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUKPiArKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZQo+IEBAIC00NCw2ICs0NCwxMSBAQCBDRkxBR1Nf
UkVNT1ZFX3JldHVybl9hZGRyZXNzLm8JPSAkKENDX0ZMQUdTX0ZUUkFDRSkKPiAgIENGTEFHU19S
RU1PVkVfc2JpX2VjYWxsLm8gPSAkKENDX0ZMQUdTX0ZUUkFDRSkKPiAgIGVuZGlmCj4gICAKPiAr
IyBXaGVuIEtBU0FOIGlzIGVuYWJsZWQsIGEgc3RhY2sgdHJhY2UgaXMgcmVjb3JkZWQgZm9yIGV2
ZXJ5IGFsbG9jL2ZyZWUsIHdoaWNoCj4gKyMgY2FuIHNpZ25pZmljYW50bHkgaW1wYWN0IHBlcmZv
cm1hbmNlLiBBdm9pZCBpbnN0cnVtZW50aW5nIHRoZSBzdGFjayB0cmFjZQo+ICsjIGNvbGxlY3Rp
b24gY29kZSB0byBtaW5pbWl6ZSB0aGlzIGltcGFjdC4KPiArS0FTQU5fU0FOSVRJWkVfc3RhY2t0
cmFjZS5vIDo9IG4KPiArCgpJIGNoZWNrZWQgdGhlIHRocmVlIHJlZmVyZW5jZWQgYXJjaGVzOgog
ICAtIGFybSAgICAoYXJjaC9hcm0va2VybmVsL01ha2VmaWxlKTogICAgS0FTQU4gb25seQogICAt
IGFybTY0ICAoYXJjaC9hcm02NC9rZXJuZWwvTWFrZWZpbGUpOiAgS0FTQU4gb25seQogICAtIHg4
NiAgICAoYXJjaC94ODYva2VybmVsL01ha2VmaWxlKTogICAgS0FTQU4gKmFuZCogS0NPVgogICAg
ICAgICAgICAoS0NPVl9JTlNUUlVNRU5UX3N0YWNrdHJhY2UubyA6PSBuLCBwbHVzIGR1bXBzdGFj
ayBhbmQKICAgICAgICAgICAgIHRoZSB1bndpbmRfKi5vIFRVcykKClNvIGFzIHdyaXR0ZW4sIHRo
aXMgcGF0Y2ggbWF0Y2hlcyBhcm0vYXJtNjQgYnV0IE5PVCB4ODYuIEtDT1YKaW5zdHJ1bWVudHMg
ZXZlcnkgYmFzaWMtYmxvY2sgZWRnZTsgdGhlIHVud2luZGVyIGlzIGEgaG90IHBhdGgKKGRvdWJs
eSBzbyB1bmRlciBLQVNBTiwgd2hlcmUgaXQgcnVucyBvbiBldmVyeSBhbGxvYy9mcmVlKSwgc28g
dGhlCnNhbWUgcmF0aW9uYWxlIHRoYXQganVzdGlmaWVzIGRpc2FibGluZyBLQVNBTiBhcHBsaWVz
IHRvIEtDT1YuIEknZApzdWdnZXN0IG1ha2luZyB0aGUgY2xhaW0gdHJ1ZSBieSBhZGRpbmc6Cgog
IEtDT1ZfSU5TVFJVTUVOVF9zdGFja3RyYWNlLm8gOj0gbgoKKFJJU0MtViBrZWVwcyBpdHMgZW50
aXJlIHVud2luZGVyIGluIHN0YWNrdHJhY2Uubywgc28gdW5saWtlIHg4Ngp0aGVyZSdzIG5vIGR1
bXBzdGFjay91bndpbmRfKi5vIHRvIGFsc28gYW5ub3RhdGUg4oCUIHRoZSBzaW5nbGUgVFUKY292
ZXJzIHRoZSBlcXVpdmFsZW50IHNjb3BlLikKCkFsdGVybmF0aXZlbHksIGlmIHlvdSdkIHJhdGhl
ciBrZWVwIGl0IG1pbmltYWwsIGp1c3QgZHJvcCAiYW5kIHg4NiIKZnJvbSB0aGUgY2hhbmdlbG9n
IHNvIHRoZSBjbGFpbSBtYXRjaGVzIHRoZSBjb2RlLgoKClRoYW5rcy4KU2h1YWkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
