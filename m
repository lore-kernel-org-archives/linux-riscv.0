Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9728FC61DC4
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Aug 2026 03:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Message-Id:
	Date:Subject:From:Mime-Version:Cc:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5YwmZpNZfHkW/r9MIYOyobNW8ZOjE41mN2wevkp0QLk=; b=YvI3gAjkDwaYrt
	HXrKUDo38orr+pQrHm6rOZvwSkeYOmbhHyQL83GyQdHAKOYrwSfEnhINR+4bCddscI92OeOHI/QXX
	sefi0ENJQaavbIxpjkIhYYhSuFHFczKAQQ96PSGyElOvOpEGJ8ib26aJQF0C7qCJtNFfMBAN6DLDx
	x+BqE69Jbs+QBpZ21yPhrCOLH8jgGN7jQ6Y9V6vNpY17AGDhEfQKI4kB2drfHzxvfYIAznidIsHd9
	pEl94nrCtco4glWxf/qEcD0HrH8/iVTBrIMOkB1cSA8RAKjFXajIShDSw0g0aWWF/Heze1x8HBEs9
	ApTjx33H7E04T6l5PBVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0A1C-00000006gka-1fJk;
	Sat, 29 Aug 2026 03:46:10 +0000
Received: from va-1-113.ptr.blmpb.com ([209.127.230.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0A1A-00000006gkF-01ZN
	for linux-riscv@lists.infradead.org;
	Sat, 29 Aug 2026 03:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1787975158; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=ATP/kUiSwffiaR2fVHyPd7W9IcoS9IWeEorLQ80/wEY=;
 b=S1IVKUOPa+oaX/d8Ymttzq5b6KNPcCZTY1n1A8Hvt2KimyK9VTTRDzdIhq02xKjLX+bVpP
 0Z6RuumjEIjvpQShUBjYUA6lkIY5uWxJmUkxn9OhjaFZxrX0+PXYEOYyESLs6JK8FyCTcM
 IY9PsW+wiDUp3gcKAFHwMHnmt70aQHtgr8dKQi//PbYXH3diQEi11kEwNNPPLGxxNj7lKr
 2lyr/z20PGGlUAO5TTqBxWUiZrFJwUjJYzCheXboxNP65eXuhERwJ1FKvOmCL/EkwmcjBV
 kMEyYx2YCVwZBsAZoJYlzrWMMk7DNF4SclJVskW59JyWUCA+Rlas1j59dm/wbQ==
Cc: <stable@vger.kernel.org>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Andy Chiu" <andybnac@gmail.com>, "Puranjay Mohan" <puranjay@kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list" <linux-kernel@vger.kernel.org>, 
	"Mark Rutland" <mark.rutland@arm.com>, <stable@vger.kernel.org>, 
	<linux-trace-kernel@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26a9255f4+faa523+lists.infradead.org+qirui.001@bytedance.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Subject: Re: [PATCH] riscv: ftrace: only use pre-function NOPs with call ops
Date: Sat, 29 Aug 2026 11:45:38 +0800
Message-Id: <0d448a8f-1695-47ab-bf88-fd49b5b20bc3@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
To: <palmer@dabbelt.com>, <pjw@kernel.org>, <aou@eecs.berkeley.edu>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	"Steven Rostedt" <rostedt@goodmis.org>
User-Agent: Mozilla Thunderbird
References: <20260706123554.455065-1-qirui.001@bytedance.com>
In-Reply-To: <20260706123554.455065-1-qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_204608_140826_645DB2BC 
X-CRM114-Status: GOOD (  15.86  )
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

T24gNy82LzI2IDg6MzUgUE0sIFJ1aSBRaSB3cm90ZToKPiBDb21taXQgYzIxNzE1N2JjZDFkICgi
cmlzY3Y6IEltcGxlbWVudAo+IEhBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9DQUxMX09QUyIpIGNo
YW5nZWQgQ0NfRkxBR1NfRlRSQUNFIHRvIHVzZQo+IC1mcGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5
PTgsNCBvciAtZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeT00LDIKPiBmb3IgYWxsIGR5bmFtaWMg
ZnRyYWNlIGJ1aWxkcy4gVGhhdCBsYXlvdXQgbWFrZXMgdGhlIGNvbXBpbGVyIHBsYWNlIGFuCj4g
OC1ieXRlIGFyZWEgYmVmb3JlIHRoZSBmdW5jdGlvbiBlbnRyeSwgd2hpY2ggaXMgdXNlZCBhcyB0
aGUgcGVyLWNhbGxzaXRlCj4gZnRyYWNlX29wcyBsaXRlcmFsIHdoZW4gQ09ORklHX0RZTkFNSUNf
RlRSQUNFX1dJVEhfQ0FMTF9PUFMgaXMgZW5hYmxlZC4KPiAKPiBSSVNDLVYgY2FuIHN0aWxsIGJ1
aWxkIHdpdGggQ09ORklHX0RZTkFNSUNfRlRSQUNFPXkgYW5kCj4gQ09ORklHX0RZTkFNSUNfRlRS
QUNFX1dJVEhfQ0FMTF9PUFM9biwgZm9yIGV4YW1wbGUgd2hlbgo+IENPTkZJR19DRklfQ0xBTkcg
aXMgZW5hYmxlZCBiZWNhdXNlIEhBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9DQUxMX09QUwo+IGlz
IHNlbGVjdGVkIG9ubHkgd2hlbiAhQ0ZJX0NMQU5HLiBJbiB0aGF0IGNvbmZpZ3VyYXRpb24KPiBm
dHJhY2VfY2FsbF9hZGp1c3QoKSBkb2VzIG5vdCBza2lwIHRoZSBwcmUtZnVuY3Rpb24gbGl0ZXJh
bCBhcmVhIGFuZAo+IG9ubHkgcmV0dXJucyBhZGRyICsgTUNPVU5UX0FVSVBDX1NJWkUuIFdpdGgg
dGhlIHByZS1mdW5jdGlvbiBsYXlvdXQsCj4gdGhhdCBwb2ludHMgaW50byB0aGUgcHJlLWVudHJ5
IHBhZGRpbmcgaW5zdGVhZCBvZiB0aGUgY2FsbHNpdGUgamFsciwgc28KPiBkeW5hbWljIGZ0cmFj
ZSByZWNvcmRzIHRoZSB3cm9uZyBwYXRjaCBhZGRyZXNzLgo+IAo+IFVzZSB0aGUgcHJlLWZ1bmN0
aW9uIGxpdGVyYWwgbGF5b3V0IG9ubHkgd2hlbiBjYWxsIG9wcyBhcmUgZW5hYmxlZC4KPiBPdGhl
cndpc2Uga2VlcCB0aGUgcHJldmlvdXMgcGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5IGNvdW50cyBz
byB0aGUKPiByZWNvcmRlZCBhZGRyZXNzIG1hdGNoZXMgZnRyYWNlX2NhbGxfYWRqdXN0KCkgbm9u
LWNhbGwtb3BzIHBhdGguCj4gCj4gRml4ZXM6IGMyMTcxNTdiY2QxZCAoInJpc2N2OiBJbXBsZW1l
bnQgSEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRIX0NBTExfT1BTIikKPiBDYzogc3RhYmxlQHZnZXIu
a2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IFJ1aSBRaSA8cWlydWkuMDAxQGJ5dGVkYW5jZS5j
b20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvTWFrZWZpbGUgfCA4ICsrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9NYWtl
ZmlsZSBiL2FyY2gvcmlzY3YvTWFrZWZpbGUKPiBpbmRleCAzMDcwYzM4NzQzMDUuLjIzNTczMGEy
NDNhYSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L01ha2VmaWxlCj4gKysrIGIvYXJjaC9yaXNj
di9NYWtlZmlsZQo+IEBAIC0xNCwxMSArMTQsMTkgQEAgZW5kaWYKPiAgaWZlcSAoJChDT05GSUdf
RFlOQU1JQ19GVFJBQ0UpLHkpCj4gIAlMREZMQUdTX3ZtbGludXggKz0gLS1uby1yZWxheAo+ICAJ
S0JVSUxEX0NQUEZMQUdTICs9IC1EQ0NfVVNJTkdfUEFUQ0hBQkxFX0ZVTkNUSU9OX0VOVFJZCj4g
K2lmZXEgKCQoQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJVEhfQ0FMTF9PUFMpLHkpCj4gIGlmZXEg
KCQoQ09ORklHX1JJU0NWX0lTQV9DKSx5KQo+ICAJQ0NfRkxBR1NfRlRSQUNFIDo9IC1mcGF0Y2hh
YmxlLWZ1bmN0aW9uLWVudHJ5PTgsNAo+ICBlbHNlCj4gIAlDQ19GTEFHU19GVFJBQ0UgOj0gLWZw
YXRjaGFibGUtZnVuY3Rpb24tZW50cnk9NCwyCj4gIGVuZGlmCj4gK2Vsc2UKPiAraWZlcSAoJChD
T05GSUdfUklTQ1ZfSVNBX0MpLHkpCj4gKwlDQ19GTEFHU19GVFJBQ0UgOj0gLWZwYXRjaGFibGUt
ZnVuY3Rpb24tZW50cnk9NAo+ICtlbHNlCj4gKwlDQ19GTEFHU19GVFJBQ0UgOj0gLWZwYXRjaGFi
bGUtZnVuY3Rpb24tZW50cnk9Mgo+ICtlbmRpZgo+ICtlbmRpZgo+ICBlbmRpZgo+ICAKPiAgaWZl
cSAoJChDT05GSUdfQ01PREVMX01FRExPVykseSkKCgpIaSwKCkdlbnRsZSBwaW5nIG9uIHRoaXMg
cGF0Y2guIEl0J3MgYmVlbiBhYm91dCB0d28gbW9udGhzIHNpbmNlIHN1Ym1pc3Npb24Kd2l0aG91
dCBhbnkgcmV2aWV3IGZlZWRiYWNrLgoKVGhlIHBhdGNoIGZpeGVzIGEgYnVnIHdoZXJlIGZ0cmFj
ZV9jYWxsX2FkanVzdCgpIHJldHVybnMgdGhlIHdyb25nCnBhdGNoIGFkZHJlc3Mgd2hlbiBDT05G
SUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9DQUxMX09QUyBpcyBkaXNhYmxlZAooZS5nLiwgdW5kZXIg
Q09ORklHX0NGSV9DTEFORyksIGJlY2F1c2UgdGhlIHByZS1mdW5jdGlvbiBsaXRlcmFsCmxheW91
dCBpcyBzdGlsbCB1c2VkIHVuY29uZGl0aW9uYWxseS4KCkFkZGluZyB0aGUgZnRyYWNlIG1haW50
YWluZXJzIGFuZCBtYWlsaW5nIGxpc3QsIHdoaWNoIHdlcmUgbWlzc2luZwpmcm9tIHRoZSBvcmln
aW5hbCBzdWJtaXNzaW9uIOKAlCB0aGF0IGxpa2VseSBleHBsYWlucyB0aGUgbGFjayBvZgpyZXNw
b25zZS4KCkxpbms6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA3MDYxMjM1NTQuNDU1
MDY1LTEtcWlydWkuMDAxQGJ5dGVkYW5jZS5jb20KClRoYW5rcywKUnVpCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
