Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B217C83F2C
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Sep 2023 13:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:
	From:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3GLy7DHYjPHsTK0c8efDDa84ONQmx62anqsDBHscxng=; b=S+H+iMsm+Qpw4p
	TKQoOG1s0Unrn/qzozoJMXvKFum8RvdsnZNSDCFR0WaSDUwHuV2cT78FHFx45zfkGlOXj2HuMlNxq
	QpU8dXXTDQ3cKfrJEgQcT/UL+vZvpYovmq1ptUb+K4xy8uUgyJoz3TYpkC5IW4BKXuVTkGuOXrK8y
	8fq23MG6hhg66ItS3mo4+sAvTjs7LS300LA6ChbbGwuXdR0IxkoD3cc8/5GMgdeB99iX3PKRkTcDH
	FeRazlQrswhAt9sfp4IhDY63impqOqxWQXtpeaGubXAPld6effjk1c8F9JLU3abbckIxymp5VmtfV
	xvSIvXpGglAEb8kIqRdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdW0Z-0065R5-19;
	Tue, 05 Sep 2023 13:22:19 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdW0W-0065QJ-0T
	for linux-riscv@lists.infradead.org;
	Tue, 05 Sep 2023 13:22:17 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qdW0L-0002Yj-32; Tue, 05 Sep 2023 15:22:05 +0200
Message-ID: <ea283ec4-5db2-488c-90e7-64dbb0e16b17@leemhuis.info>
Date: Tue, 5 Sep 2023 15:22:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] RISC-V: Add ptrace support for vectors
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Conor Dooley <conor@kernel.org>, Andy Chiu <andy.chiu@sifive.com>,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 greentime.hu@sifive.com, guoren@linux.alibaba.com,
 20230816155450.26200-4-andy.chiu@sifive.com, bjorn@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>,
 Kees Cook <keescook@chromium.org>, Vincent Chen <vincent.chen@sifive.com>,
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>,
 Benjamin Gray <bgray@linux.ibm.com>, Qing Zhang <zhangqing@loongson.cn>,
 Baruch Siach <baruch@tkos.co.il>, Rolf Eike Beer <eb@emlix.com>,
 llvm@lists.linux.dev, nathan@kernel.org
References: <20230825050248.32681-1-andy.chiu@sifive.com>
 <ZPDIQEVaEJHXR5IW@google.com> <20230831-resize-spherical-4f46639097b8@spud>
 <676f392a-12bb-b9ce-0b69-7d27261eaf33@leemhuis.info>
 <CAKwvOdnGy_R_C3KsjMZ0+1+r0hVcqKrw9yDOUJuK=CCYL18gNg@mail.gmail.com>
 <455be372-ee2c-7d96-9aaf-86256e018d25@leemhuis.info>
In-Reply-To: <455be372-ee2c-7d96-9aaf-86256e018d25@leemhuis.info>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1693920136;a5cbcc46;
X-HE-SMSGID: 1qdW0L-0002Yj-32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_062216_350903_D37964D9 
X-CRM114-Status: GOOD (  10.22  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

W1RMRFI6IFRoaXMgbWFpbCBpbiBwcmltYXJpbHkgcmVsZXZhbnQgZm9yIExpbnV4IGtlcm5lbCBy
ZWdyZXNzaW9uCnRyYWNraW5nLiBTZWUgbGluayBpbiBmb290ZXIgaWYgdGhlc2UgbWFpbHMgYW5u
b3kgeW91Ll0KCk9uIDMxLjA4LjIzIDIwOjI0LCBUaG9yc3RlbiBMZWVtaHVpcyB3cm90ZToKPiBP
biAzMS4wOC4yMyAxOTo1OSwgTmljayBEZXNhdWxuaWVycyB3cm90ZToKPj4gT24gVGh1LCBBdWcg
MzEsIDIwMjMgYXQgMTA6NTDigK9BTSBUaG9yc3RlbiBMZWVtaHVpcwo+PiA8cmVncmVzc2lvbnNA
bGVlbWh1aXMuaW5mbz4gd3JvdGU6Cj4+Pgo+Pj4gT24gMzEuMDguMjMgMTk6MTcsIENvbm9yIERv
b2xleSB3cm90ZToKPj4+PiBPbiBUaHUsIEF1ZyAzMSwgMjAyMyBhdCAxMDowNTowNEFNIC0wNzAw
LCBOaWNrIERlc2F1bG5pZXJzIHdyb3RlOgo+Pj4+PiBPbiBGcmksIEF1ZyAyNSwgMjAyMyBhdCAw
NTowMjo0NkFNICswMDAwLCBBbmR5IENoaXUgd3JvdGU6Cj4+Pj4+PiBUaGlzIHBhdGNoIGFkZCBi
YWNrIHRoZSBwdHJhY2Ugc3VwcG9ydCB3aXRoIHRoZSBmb2xsb3dpbmcgZml4Ogo+Pj4+Pj4gIC0g
RGVmaW5lIE5UX1JJU0NWX0NTUiBhbmQgcmUtbnVtYmVyIE5UX1JJU0NWX1ZFQ1RPUiB0byBwcmV2
ZW50Cj4+Pj4+PiAgICBjb25mbGljdGluZyB3aXRoIGdkYidzIE5UX1JJU0NWX0NTUi4KPj4+Pj4+
ICAtIFVzZSBzdHJ1Y3QgX19yaXNjdl92X3JlZ3NldF9zdGF0ZSB0byBoYW5kbGUgcHRyYWNlIHJl
cXVlc3RzCj4+Pj4+Pgo+Pj4+PiBIaSBBbmR5LCB0aGlzIGlzIGNhdXNpbmcgYW4gaW5zdGFuY2Ug
b2YgLVd1bnVzZWQtdmFyaWFibGUuIFBUQUwuCj4gWy4uLl0KPj4+IFlvdSBtZWFuIHRoZSBjb21t
aXQtaWQgb2YgdGhlIGNoYW5nZSBjdXJyZW50bHkga25vd24gYXMgZGJlNDZiMDk0MDI2Cj4+PiB3
aWxsIGNoYW5nZT8gCgpUaGF0IGhhcHBlbmVkIGluIGJldHdlZW4gYW5kIHRoZSBmaXggd2FzIGZv
bGRlZCBpbiwgc28gdGVsbCByZWd6Ym90IHRoaXMKd2FzIHJlc29sdmVkOgoKI3JlZ3pib3QgcmVz
b2x2ZTogY3VscHJpdCB1cGRhdGVkIGFuZCBmaXggd2FzIGZvbGRlZCBpbiAoY3VycmVudGx5IGtu
b3duCmFzIDkzMDBmMDA0Mzk3NCkKI3JlZ3pib3QgaWdub3JlLWFjdGl2aXR5CgpDaWFvLCBUaG9y
c3RlbiAod2VhcmluZyBoaXMgJ3RoZSBMaW51eCBrZXJuZWwncyByZWdyZXNzaW9uIHRyYWNrZXIn
IGhhdCkKLS0KRXZlcnl0aGluZyB5b3Ugd2FubmEga25vdyBhYm91dCBMaW51eCBrZXJuZWwgcmVn
cmVzc2lvbiB0cmFja2luZzoKaHR0cHM6Ly9saW51eC1yZWd0cmFja2luZy5sZWVtaHVpcy5pbmZv
L2Fib3V0LyN0bGRyClRoYXQgcGFnZSBhbHNvIGV4cGxhaW5zIHdoYXQgdG8gZG8gaWYgbWFpbHMg
bGlrZSB0aGlzIGFubm95IHlvdS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
