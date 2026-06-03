Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E01CD6E4A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 02:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ofkgtgt1upciBx37AWiwJxl/ZW4J+6O5XEo4yIDvIJ0=; b=cuVGNl2MWBfU6n
	JqXLtBW1+rWA8ly0K3S6jzjZ2B4m8H6p+zqBwrjYoxZZY9kO3Ms57NAibno3PkJXmKgV51z2E+ejJ
	ozfekpbEXiNDZ1DHsnIzpNMrqsEiq9VrKTFWVF5My0b7GQ3uMgRjycwQmS73VUZVe1lDEz6xLN74F
	S5LAeZukSuAT4wfOXQZl/cy3BNDTVEgLKwRbh+Gv3W6N5c90LDrtEXa7/pPGU0DldQ6hAaIiVBSn9
	Y+bQCkiq1MDkgDarYkPw0iBicMYtAKEMNDDaFdVWhYfR5ROcLpPKGQMS/ZZ3c9cs0MuXe9NKHldjq
	f+zQeKnQsrWTf4LnR7+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUb4I-0000000E5Rc-0dTa;
	Wed, 03 Jun 2026 02:10:54 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUb4F-0000000E5RE-37jv
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 02:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780452648; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Jv3cJulouSWGCvGi6TS1IMCaE/rqytDPu3rilFU0XAM=;
	b=ayrbRMoOkYicKPSwXI1S2HZ2m8egc0kDmQLw961oLsYIWX165Ap8fBqwgpBhkoCWOjF+E4QgZMSAS/+bJ5cwnTZGH62GF/Ka+/WdlzdAVJllV5dipwwn7U53Czf166uoN+ilnQBJiP5U4/ftPQ8G0OwvPZIWTF6DlIzmu5FbhCk=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0X45l.8N_1780452644;
Received: from 30.246.180.204(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0X45l.8N_1780452644 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 10:10:47 +0800
Message-ID: <6753385b-c2ab-4ed0-9400-78ce967450ba@linux.alibaba.com>
Date: Wed, 3 Jun 2026 10:10:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] scripts/sorttable: Handle RISC-V patchable ftrace
 entries
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Wang Han <wanghan@linux.alibaba.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
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
 <0a913398-3d0c-472e-89c4-062052eae04d@linux.alibaba.com>
 <20260601095746.70c01d24@fedora>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20260601095746.70c01d24@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_191052_155292_E9D52A24 
X-CRM114-Status: GOOD (  15.61  )
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

CgpPbiA2LzEvMjYgOTo1NyBQTSwgU3RldmVuIFJvc3RlZHQgd3JvdGU6Cj4gT24gTW9uLCAxIEp1
biAyMDI2IDE0OjE3OjA4ICswODAwCj4gU2h1YWkgWHVlIDx4dWVzaHVhaUBsaW51eC5hbGliYWJh
LmNvbT4gd3JvdGU6Cj4gCj4+PiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9zb3J0dGFibGUuYyBiL3Nj
cmlwdHMvc29ydHRhYmxlLmMKPj4+IGluZGV4IGU4ZWQxMWM2ODBjNi4uNGMxMGU4NWJiNWFmIDEw
MDY0NAo+Pj4gLS0tIGEvc2NyaXB0cy9zb3J0dGFibGUuYwo+Pj4gKysrIGIvc2NyaXB0cy9zb3J0
dGFibGUuYwo+Pj4gQEAgLTg5MSwxNyArODkxLDIxIEBAIHN0YXRpYyBpbnQgZG9fZmlsZShjaGFy
IGNvbnN0ICpjb25zdCBmbmFtZSwgdm9pZCAqYWRkcikKPj4+ICAgIAl0YWJsZV9zb3J0X3QgY3Vz
dG9tX3NvcnQgPSBOVUxMOwo+Pj4gICAgCj4+PiAgICAJc3dpdGNoIChlbGZfbWFwX21hY2hpbmUo
ZWhkcikpIHsKPj4+IC0JY2FzZSBFTV9BQVJDSDY0Ogo+Pj4gICAgI2lmZGVmIE1DT1VOVF9TT1JU
X0VOQUJMRUQKPj4+ICsJY2FzZSBFTV9BQVJDSDY0Ogo+Pj4gICAgCQlzb3J0X3JlbG9jID0gdHJ1
ZTsKPj4+ICAgIAkJcmVsYV90eXBlID0gMHg0MDM7Cj4+PiAtCQkvKiBhcm02NCB1c2VzIHBhdGNo
YWJsZSBmdW5jdGlvbiBlbnRyeSBwbGFjaW5nIGJlZm9yZSBmdW5jdGlvbiAqLwo+Pj4gKwkJLyog
ZmFsbHRocm91Z2ggKi8KPj4+ICsJY2FzZSBFTV9SSVNDVjoKPj4+ICsJCS8qIGFybTY0IGFuZCBS
SVNDLVYgcGxhY2UgcGF0Y2hhYmxlIGVudHJpZXMgYmVmb3JlIHRoZSBmdW5jdGlvbiAqLwo+Pj4g
ICAgCQliZWZvcmVfZnVuYyA9IDg7Cj4+Cj4+IE5pdDogVGhlIHNoYXJlZCBjb21tZW50IG5vdyBz
aXRzIHVuZGVyIGBjYXNlIEVNX1JJU0NWOmAgYnV0IHRoZSB0d28KPj4gbGluZXMgYWJvdmUgaXQg
KHNvcnRfcmVsb2MgLyByZWxhX3R5cGUgPSAweDQwMykgYXJlIHN0cmljdGx5Cj4+IGFybTY0LW9u
bHkg4oCUIHRoZXkgY29uZmlndXJlIHRoZSBSRUxBLWJhc2VkIHdlYWstZnVuY3Rpb24gZml4dXAg
dGhhdAo+PiBSSVNDLVYgZG9lcyBub3QgbmVlZC4gT24gYSBxdWljayByZWFkIGl0IGlzIGVhc3kg
dG8gd29uZGVyIGlmIFJJU0MtVgo+PiBpcyBpbXBsaWNpdGx5IGluaGVyaXRpbmcgdGhhdCBwYXRo
LiBTcGxpdHRpbmcgdGhlIGNvbW1lbnRzIHdvdWxkCj4+IGhlbHAsIGUuZy46Cj4+Cj4+ICAgICAg
ICAgIGNhc2UgRU1fQUFSQ0g2NDoKPj4gICAgICAgICAgICAgIC8qIGFybTY0IG5lZWRzIFJFTEEt
YmFzZWQgd2Vhay1mdW5jdGlvbiBmaXh1cCAqLwo+PiAgICAgICAgICAgICAgc29ydF9yZWxvYyA9
IHRydWU7Cj4+ICAgICAgICAgICAgICByZWxhX3R5cGUgPSAweDQwMzsKPj4gICAgICAgICAgICAg
IC8qIGZhbGx0aHJvdWdoICovCj4+ICAgICAgICAgIGNhc2UgRU1fUklTQ1Y6Cj4+ICAgICAgICAg
ICAgICAvKiBhcm02NCBhbmQgUklTQy1WIHBsYWNlIHBhdGNoYWJsZSBlbnRyaWVzIGJlZm9yZSB0
aGUgZnVuY3Rpb24gKi8KPj4gICAgICAgICAgICAgIGJlZm9yZV9mdW5jID0gODsKPiAKPiBNYWtl
cyBzZW5zZS4KPiAKPiBDYXJlIHRvIHNlbmQgYSB2Mz8KPiAKPiAtLSBTdGV2ZQoKSGksIFN0ZXZl
LAoKSXQncyBhIHB1cmUgY29tbWVudCBjb3NtZXRpYywgbm90IHdvcnRoIGEgcmVzcGluIG9uIGl0
cyBvd24uIEJ1dCBmb3IgdGhlCnJlc3Qgb2YgdGhlIGZlZWRiYWNrIG9uIHRoaXMgc2VyaWVzICh0
aGUgZnJhbWUtcmVjb3JkIG1ldGFkYXRhIGNvbnRyYWN0CmluIHBhdGNoIDIgYW5kIHRoZSBkZWFk
IHN0YXRlLT5yZWdzIGZpZWxkIC8gQ2FsbCBUcmFjZSBvdXRwdXQgY2hhbmdlIGluCnBhdGNoIDYp
IGFyZSB0aGUgb25lcyBhY3R1YWxseSB3b3J0aCBhIG5ldyB2ZXJzaW9uLgoKSnVzdCB0byBnZXQg
dGhlIHJvdXRpbmcgc3RyYWlnaHQ6IGFyZSB5b3UgcGxhbm5pbmcgdG8gcGljayB0aGlzIG9uZSB1
cAp0aHJvdWdoIHRoZSB0cmFjaW5nIHRyZWUgb24gaXRzIG93bj8KCkl0IGZlZWxzIGxpa2UgYSBn
b29kIGNhbmRpZGF0ZSBmb3IgdGhhdCAtLSBpdCdzIGFuIGluZGVwZW5kZW50CnJlZ3Jlc3Npb24g
Zml4IChGaXhlczogMGNhMTcyNGI1NmFmKSB0aGF0IGJyZWFrcyAqYWxsKiBSSVNDLVYgZHluYW1p
YwpmdHJhY2UsIG5vdCBqdXN0IGxpdmVwYXRjaCwgc28gaXQgc2hvdWxkbid0IGhhdmUgdG8gd2Fp
dCBvbiB0aGUgcmVzdCBvZgp0aGUgbGl2ZXBhdGNoIHNlcmllcy4KClRoYW5rcy4KU2h1YWkKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
