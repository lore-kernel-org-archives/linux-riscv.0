Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2C7C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 07:29:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBD1A61073
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 07:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EBD1A61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J+WVAD8C2WCr2lST6Zxm1z40pddXQ9g+aHcoQuCfixk=; b=oxjg03tICHdsgw
	x+1KCigoThmY9lUAM7x1yCNNdBFYzDdAwc26IoM5UzYusgiYtSBsxtKpWQkTenXBixZp2mLxKj47d
	oDLOUdqDgG3fg2sFity0oMrQppKpCngXXnQ0RH5gKpBS/BVhQmb3FRdQ/1so2zRldKmSwkVQPXP2c
	VZ4QWa172pHeqXSRlZEWMNb51IUxfs3j9jswffFol/iGKqDuUguLQlZb35FKi+AJpa1qNvpNXHjO6
	Zs9SSgS1cyA7Fk69csPd8lyD5GPE40KQ4aKiRA4cFY3uohbzhbO7i+TZ9Z0U5FL+hFMVtxFD0Rz99
	luB3aWDtTfsteNPnStdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbHeO-005iGe-FS; Fri, 15 Oct 2021 07:29:08 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbHeL-005iEp-0x
 for linux-riscv@lists.infradead.org; Fri, 15 Oct 2021 07:29:07 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 8F2FE21A5F;
 Fri, 15 Oct 2021 07:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1634282942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ajbOHu+rClKJMCVN9IOrg9A779y/UiP4OhkzJFOjSQ0=;
 b=Kgq5rJkdVrVP4IDhfsKBOlKRbJj/ElwH9MtJu3TB/6DSQyKaBrnGTAZEUIHTm9Wg9/R9yP
 gS+2GjVcOOgJ8gcQFMUqXpN0t0LxD5W1VSXuJRJZSg5ELwNykVEIFOvyYognnuQg7wAlZK
 xUQAgCSdgE9t8+fHmbr613MI5spEt8o=
Received: from suse.cz (unknown [10.100.224.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 7FDD2A3B84;
 Fri, 15 Oct 2021 07:29:01 +0000 (UTC)
Date: Fri, 15 Oct 2021 09:28:58 +0200
From: Petr Mladek <pmladek@suse.com>
To: =?utf-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Cc: Guo Ren <guoren@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Jisheng Zhang <jszhang@kernel.org>, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 live-patching@vger.kernel.org
Subject: Re: [PATCH v3 1/2] ftrace: disable preemption between
 ftrace_test_recursion_trylock/unlock()
Message-ID: <YWktujP6DcMnRIXT@alley>
References: <609b565a-ed6e-a1da-f025-166691b5d994@linux.alibaba.com>
 <7e4738b5-21d4-c4d0-3136-a096bbb5cd2c@linux.alibaba.com>
 <YWhJP41cNwDphYsv@alley>
 <5e907ed3-806b-b0e5-518d-d2f3b265377f@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e907ed3-806b-b0e5-518d-d2f3b265377f@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_002905_253876_BA00DBC2 
X-CRM114-Status: GOOD (  39.76  )
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

T24gRnJpIDIwMjEtMTAtMTUgMTE6MTM6MDgsIOeOi+i0hyB3cm90ZToKPiAKPiAKPiBPbiAyMDIx
LzEwLzE0IOS4i+WNiDExOjE0LCBQZXRyIE1sYWRlayB3cm90ZToKPiBbc25pcF0KPiA+PiAtCXJl
dHVybiB0cmFjZV90ZXN0X2FuZF9zZXRfcmVjdXJzaW9uKGlwLCBwYXJlbnRfaXAsIFRSQUNFX0ZU
UkFDRV9TVEFSVCwgVFJBQ0VfRlRSQUNFX01BWCk7Cj4gPj4gKwlpbnQgYml0Owo+ID4+ICsKPiA+
PiArCWJpdCA9IHRyYWNlX3Rlc3RfYW5kX3NldF9yZWN1cnNpb24oaXAsIHBhcmVudF9pcCwgVFJB
Q0VfRlRSQUNFX1NUQVJULCBUUkFDRV9GVFJBQ0VfTUFYKTsKPiA+PiArCS8qCj4gPj4gKwkgKiBU
aGUgemVybyBiaXQgaW5kaWNhdGUgd2UgYXJlIG5lc3RlZAo+ID4+ICsJICogaW4gYW5vdGhlciB0
cnlsb2NrKCksIHdoaWNoIG1lYW5zIHRoZQo+ID4+ICsJICogcHJlZW1wdGlvbiBhbHJlYWR5IGRp
c2FibGVkLgo+ID4+ICsJICovCj4gPj4gKwlpZiAoYml0ID4gMCkKPiA+PiArCQlwcmVlbXB0X2Rp
c2FibGVfbm90cmFjZSgpOwo+ID4gCj4gPiBJcyB0aGlzIHNhZmU/IFRoZSBwcmVlbXB0aW9uIGlz
IGRpc2FibGVkIG9ubHkgd2hlbgo+ID4gdHJhY2VfdGVzdF9hbmRfc2V0X3JlY3Vyc2lvbigpIHdh
cyBjYWxsZWQgYnkgZnRyYWNlX3Rlc3RfcmVjdXJzaW9uX3RyeWxvY2soKS4KPiA+IAo+ID4gV2Ug
bXVzdCBlaXRoZXIgYWx3YXlzIGRpc2FibGUgdGhlIHByZWVtdGlvbiB3aGVuIGJpdCA+PSAwLgo+
ID4gT3Igd2UgaGF2ZSB0byBkaXNhYmxlIHRoZSBwcmVlbXRpb24gYWxyZWFkeSBpbgo+ID4gdHJh
Y2VfdGVzdF9hbmRfc2V0X3JlY3Vyc2lvbigpLgo+IAo+IEludGVybmFsIGNhbGxpbmcgb2YgdHJh
Y2VfdGVzdF9hbmRfc2V0X3JlY3Vyc2lvbigpIHdpbGwgZGlzYWJsZSBwcmVlbXB0aW9uCj4gb24g
c3VjY2VlZCwgaXQgc2hvdWxkIGJlIHNhZmUuCgp0cmFjZV90ZXN0X2FuZF9zZXRfcmVjdXJzaW9u
KCkgZG9lcyBfbm90XyBkaXNhYmxlIHByZWVtdGlvbiEKSXQgd29ya3Mgb25seSBiZWNhdXNlIGFs
bCBjYWxsZXJzIGRpc2FibGUgdGhlIHByZWVtcHRpb24uCgpJdCBtZWFucyB0aGF0IHRoZSBjb21t
ZW50IGlzIHdyb25nLiBJdCBpcyBub3QgZ3VhcmFudHRlZCB0aGF0IHRoZQpwcmVlbXB0aW9uIHdp
bGwgYmUgZGlzYWJsZWQuIEl0IHdvcmtzIG9ubHkgYnkgY2hhbmNlLgoKCj4gV2UgY2FuIGFsc28g
Y29uc2lkZXIgbW92ZSB0aGUgbG9naWNhbCBpbnRvIHRyYWNlX3Rlc3RfYW5kX3NldF9yZWN1cnNp
b24oKQo+IGFuZCB0cmFjZV9jbGVhcl9yZWN1cnNpb24oKSwgYnV0IEknbSBub3QgdmVyeSBzdXJl
IGFib3V0IHRoYXQuLi4gZnRyYWNlCj4gaW50ZXJuYWxseSBhbHJlYWR5IG1ha2Ugc3VyZSBwcmVl
bXB0aW9uIGRpc2FibGVkCgpIb3c/IEJlY2F1c2UgaXQgY2FsbHMgdHJhY2VfdGVzdF9hbmRfc2V0
X3JlY3Vyc2lvbigpIHZpYSB0aGUgdHJ5bG9jaygpIEFQST8KCgo+ICwgd2hhdCB1bmNvdmVyZWQg
aXMgdGhvc2UgdXNlcnMgd2hvIGNhbGwgQVBJIHRyeWxvY2svdW5sb2NrLCBpc24ndAo+IGl0PwoK
QW5kIHRoaXMgaXMgZXhhY3RseSB0aGUgcHJvYmxlbS4gdHJhY2VfdGVzdF9hbmRfc2V0X3JlY3Vy
c2lvbigpIGlzIGluCmEgcHVibGljIGhlYWRlci4gQW55b25lIGNvdWxkIHVzZSBpdC4gQW5kIGlm
IGFueW9uZSB1c2VzIGl0IGluIHRoZQpmdXR1cmUgd2l0aG91dCB0aGUgdHJ5bG9jaygpIGFuZCBk
b2VzIG5vdCBkaXNhYmxlIHRoZSBwcmVlbXRpb24KZXhwbGljaXRlbHkgdGhlbiB3ZSBhcmUgbG9z
dCBhZ2Fpbi4KCkFuZCBpdCBpcyBldmVuIG1vcmUgZGFuZ2Vyb3VzLiBUaGUgb3JpZ2luYWwgY29k
ZSBkaXNhYmxlZCB0aGUKcHJlZW10aW9uIG9uIHZhcmlvdXMgbGF5ZXJzLiBBcyBhIHJlc3VsdCwg
dGhlIHByZWVtdGlvbiB3YXMgZGlzYWJsZWQKc2V2ZXJhbCB0aW1lcyBmb3Igc3VyZS4gSXQgbWVh
bnMgdGhhdCB0aGUgZGVlcGVyIGxheWVycyB3ZXJlCmFsd2F5cyBvbiB0aGUgc2FmZSBzaWRlLgoK
V2l0aCB0aGlzIHBhdGNoLCBpZiB0aGUgZmlyc3QgdHJhY2VfdGVzdF9hbmRfc2V0X3JlY3Vyc2lv
bigpIGNhbGxlcgpkb2VzIG5vdCBkaXNhYmxlIHByZWVtdGlvbiB0aGVuIHRyeWxvY2soKSB3aWxs
IG5vdCBkaXNhYmxlIGl0IGVpdGhlcgphbmQgdGhlIGVudGlyZSBjb2RlIGlzIHByb2NjZWVkIHdp
dGggcHJlZW10aW9uIGVuYWJsZWQuCgoKPiA+IEZpbmFsbHksIHRoZSBjb21tZW50IGNvbmZ1c2Vk
IG1lIGEgbG90LiBUaGUgZGlmZmVyZW5jZSBiZXR3ZWVuIG5lc3RpbmcgYW5kCj4gPiByZWN1cnNp
b24gaXMgZmFyIGZyb20gY2xlYXIuIEFuZCB0aGUgY29kZSBpcyB0cmlja3kgbGlreSBsaWtlIGhl
bGwgOi0pCj4gPiBJIHByb3Bvc2UgdG8gYWRkIHNvbWUgY29tbWVudHMsIHNlZSBiZWxvdyBmb3Ig
YSBwcm9wb3NhbC4KPiBUaGUgY29tbWVudHMgZG8gY29uZnVzaW5nLCBJJ2xsIG1ha2UgaXQgc29t
ZXRoaW5nIGxpa2U6Cj4gCj4gVGhlIHplcm8gYml0IGluZGljYXRlIHRyYWNlIHJlY3Vyc2lvbiBo
YXBwZW5lZCwgd2hhdGV2ZXIKPiB0aGUgcmVjdXJzaXZlbHkgY2FsbCB3YXMgbWFkZSBieSBmdHJh
Y2UgaGFuZGxlciBvciBmdHJhY2UKPiBpdHNlbGYsIHRoZSBwcmVlbXB0aW9uIGFscmVhZHkgZGlz
YWJsZWQuCgpJIGFtIHNvcnJ5IGJ1dCBpdCBpcyBzdGlsbCBjb25mdXNpbmcuIFdlIG5lZWQgdG8g
ZmluZCBhIGJldHRlciB3YXkKaG93IHRvIGNsZWFybHkgZXhwbGFpbiB0aGUgZGlmZmVyZW5jZSBi
ZXR3ZWVuIHRoZSBzYWZlIGFuZAp1bnNhZmUgcmVjdXJzaW9uLgoKTXkgdW5kZXJzdGFuZGluZyBp
cyB0aGF0IHRoZSByZWN1cnNpb24gaXM6CgogICsgInVuc2FmZSIgd2hlbiB0aGUgdHJhY2UgY29k
ZSByZWN1cnNpdmVseSBlbnRlcnMgdGhlIHNhbWUgdHJhY2UgcG9pbnQuCgogICsgInNhZmUiIHdo
ZW4gZnRyYWNlX3Rlc3RfcmVjdXJzaW9uX3RyeWxvY2soKSBpcyBjYWxsZWQgcmVjdXJzaXZlbGx5
CiAgICB3aGlsZSBzdGlsbCBwcm9jZXNzaW5nIHRoZSBzYW1lIHRyYWNlIGVudHJ5LgoKPiA+PiAr
Cj4gPj4gKwlyZXR1cm4gYml0Owo+ID4+ICB9Cj4gPj4gIC8qKgo+ID4+IEBAIC0yMjIsOSArMjMz
LDEzIEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgaW50IGZ0cmFjZV90ZXN0X3JlY3Vyc2lvbl90
cnlsb2NrKHVuc2lnbmVkIGxvbmcgaXAsCj4gPj4gICAqIEBiaXQ6IFRoZSByZXR1cm4gb2YgYSBz
dWNjZXNzZnVsIGZ0cmFjZV90ZXN0X3JlY3Vyc2lvbl90cnlsb2NrKCkKPiA+PiAgICoKPiA+PiAg
ICogVGhpcyBpcyB1c2VkIGF0IHRoZSBlbmQgb2YgYSBmdHJhY2UgY2FsbGJhY2suCj4gPj4gKyAq
Cj4gPj4gKyAqIFByZWVtcHRpb24gd2lsbCBiZSBlbmFibGVkIChpZiBpdCB3YXMgcHJldmlvdXNs
eSBlbmFibGVkKS4KPiA+PiAgICovCj4gPj4gIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBm
dHJhY2VfdGVzdF9yZWN1cnNpb25fdW5sb2NrKGludCBiaXQpCj4gPj4gIHsKPiA+PiArCWlmIChi
aXQpCj4gPiAKPiA+IFRoaXMgaXMgbm90IHN5bWV0cmljIHdpdGggdHJ5bG9jaygpLiBJdCBzaG91
bGQgYmU6Cj4gPiAKPiA+IAlpZiAoYml0ID4gMCkKPiA+IAo+ID4gQW55d2F5LCB0cmFjZV9jbGVh
cl9yZWN1cnNpb24oKSBxdWllbnRseSBpZ25vcmVzIGJpdCAhPSAwCj4gCj4gWWVzLCBiaXQgPT0g
MCBzaG91bGQgbm90IGhhcHBlbiBpbiBoZXJlLgoKWWVzLCBpdCAic2hvdWxkIiBub3QgaGFwcGVu
LiBNeSBwb2ludCBpcyB0aGF0IHdlIGNvdWxkIG1ha2UgdGhlIEFQSQptb3JlIHNhZmUuIFdlIGNv
dWxkIGRvIHRoZSByaWdodCB0aGluZyB3aGVuCmZ0cmFjZV90ZXN0X3JlY3Vyc2lvbl91bmxvY2so
KSBpcyBjYWxsZWQgd2l0aCBuZWdhdGl2ZSBAYml0LgpJZGVhbGx5LCB3ZSBzaG91bGQgYWxzbyB3
YXJuIGFib3V0IHRoZSBtaXMtdXNlLgoKCkFueXdheSwgbGV0J3Mgd2FpdCBmb3IgU3RldmVuLiBJ
dCBzZWVtcyB0aGF0IGhlIGZvdW5kIGFub3RoZXIgcHJvYmxlbQp3aXRoIHRoZSBBUEkgdGhhdCBz
aG91bGQgYmUgc29sdmVkIGZpcnN0LiBUaGUgZml4IHdpbGwgcHJvYmFibHkKYWxzbyBoZWxwIHRv
IGJldHRlciB1bmRlcnN0YW5kIHRoZSAic2FmZSIgdnMgInVuc2FmZSIgcmVjdXJzaW9uLgoKQmVz
dCBSZWdhcmRzLApQZXRyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
