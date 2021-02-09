Return-Path: <SRS0=3nDB=HL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989ABC433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 08:59:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3425C64E99
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 08:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3425C64E99
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gY26+1D0v2VbOJyVBq50Eho3SwjkwmfifkrwiBjRi/w=; b=FvMrX0AiGG6vwdQkwyAW4WX3R
	ezl3UXHNAe8tVv6Es0bzwEun/F2Ux8ZwS/riYI95b99S2HtVV/9qvgy5An6rPjQQpaUa5f37w59VL
	EWtnQTVlLqbHW0APCDq45IAZCF1t1Fdh3ZNbUCQ2bjz8pmaZ+SqLkCmlG2KITmyF/FXaNLDab4Hl8
	E6F/Ho8vXg2Qbt6n+KgsEWyyBS6FoqjrxZBBogtyRkOQuluZd5PUDsHHCyxSqLs8RFJFBrqN2IioX
	BgDIo/9cWEX+FP7feFd0k+ce8YX+nMvWCqgl3dFbeqmPNQOfFCbvC/WUdyBoRh3mMhAmTsei7dS4e
	ELZoXr7Uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Ory-0000Ut-UO; Tue, 09 Feb 2021 08:59:38 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Ort-0000Sq-AT; Tue, 09 Feb 2021 08:59:35 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1612861172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qKmPZ6awqg5hjlBR0sI2r8zXB8YBdpf3Fstd9lWw2l4=;
 b=p4niOOYBVsAxuZvLvSyfuqafhhIwTbqalQ0XUlb0o+XPLT9GQJWEuScror9bMiRAM/VDNR
 Gg1qoKrVPkiLaebs0ekDczrIK91xZLqc+rSpU+PO8Uxxh1llnmK79t7ldLJZVcdfnC2J7E
 dBwPdj8xY5v0EllSgVlDCcSTDxSJc8Y=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 14A0BAB71;
 Tue,  9 Feb 2021 08:59:32 +0000 (UTC)
Date: Tue, 9 Feb 2021 09:59:31 +0100
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v17 00/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <YCJO8zLq8YkXGy8B@dhcp22.suse.cz>
References: <20210208211326.GV242749@kernel.org>
 <1F6A73CF-158A-4261-AA6C-1F5C77F4F326@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1F6A73CF-158A-4261-AA6C-1F5C77F4F326@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_035933_895378_A700B12F 
X-CRM114-Status: GOOD (  24.49  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uIDA4LTAyLTIxIDIyOjM4OjAzLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPiAKPiA+
IEFtIDA4LjAyLjIwMjEgdW0gMjI6MTMgc2NocmllYiBNaWtlIFJhcG9wb3J0IDxycHB0QGtlcm5l
bC5vcmc+Ogo+ID4gCj4gPiDvu79PbiBNb24sIEZlYiAwOCwgMjAyMSBhdCAxMDoyNzoxOEFNICsw
MTAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPiA+PiBPbiAwOC4wMi4yMSAwOTo0OSwgTWlr
ZSBSYXBvcG9ydCB3cm90ZToKPiA+PiAKPiA+PiBTb21lIHF1ZXN0aW9ucyAoYW5kIHJlcXVlc3Qg
dG8gZG9jdW1lbnQgdGhlIGFuc3dlcnMpIGFzIHdlIG5vdyBhbGxvdyB0byBoYXZlCj4gPj4gdW5t
b3ZhYmxlIGFsbG9jYXRpb25zIGFsbCBvdmVyIHRoZSBwbGFjZSBhbmQgSSBkb24ndCBzZWUgYSBz
aW5nbGUgY29tbWVudAo+ID4+IHJlZ2FyZGluZyB0aGF0IGluIHRoZSBjb3ZlciBsZXR0ZXI6Cj4g
Pj4gCj4gPj4gMS4gSG93IHdpbGwgdGhlIGlzc3VlIG9mIHBsZW50eSBvZiB1bm1vdmFibGUgYWxs
b2NhdGlvbnMgZm9yIHVzZXIgc3BhY2UgYmUKPiA+PiB0YWNrbGVkIGluIHRoZSBmdXR1cmU/Cj4g
Pj4gCj4gPj4gMi4gSG93IGhhcyB0aGlzIGlzc3VlIGJlZW4gZG9jdW1lbnRlZD8gRS5nLiwgaW50
ZXJhY3Rpb24gd2l0aCBaT05FX01PVkFCTEUKPiA+PiBhbmQgQ01BLCBhbGxvY19jb25pZ19yYW5n
ZSgpL2FsbG9jX2NvbnRpZ19wYWdlcz8uCj4gPiAKPiA+IFNlY3JldG1lbSBzZXRzIHRoZSBtYXBw
aW5ncyBnZnAgbWFzayB0byBHRlBfSElHSFVTRVIsIHNvIGl0IGRvZXMgbm90Cj4gPiBhbGxvY2F0
ZSBtb3ZhYmxlIHBhZ2VzIGF0IHRoZSBmaXJzdCBwbGFjZS4KPiAKPiBUaGF0IGlzIG5vdCB0aGUg
cG9pbnQuIFNlY3JldG1lbSBjYW5ub3QgZ28gb24gQ01BIC8gWk9ORV9NT1ZBQkxFCj4gbWVtb3J5
IGFuZCBiZWhhdmVzIGxpa2UgbG9uZy10ZXJtIHBpbm5pbmdzIGluIHRoYXQgc2Vuc2UuIFRoaXMg
aXMgYQo+IHJlYWwgaXNzdWUgd2hlbiB1c2luZyBhIGxvdCBvZiBzZWN0cmVtZW0uCgpBIGxvdCBv
ZiB1bmV2aWN0YWJsZSBtZW1vcnkgaXMgYSBjb25jZXJuIHJlZ2FyZGxlc3Mgb2YgQ01BL1pPTkVf
TU9WQUJMRS4KQXMgSSd2ZSBzYWlkIGl0IGlzIHF1aXRlIGVhc3kgdG8gbGFuZCBhdCB0aGUgc2lt
aWxhciBzaXR1YXRpb24gZXZlbiB3aXRoCnRtcGZzL01BUF9BTk9OfE1BUF9TSEFSRUQgb24gc3dh
cGxlc3Mgc3lzdGVtLiBOZWl0aGVyIG9mIHRoZSB0d28gaXMKcmVhbGx5IHVuY29tbW9uLiBJdCB3
b3VsZCBiZSBldmVuIHdvcnNlIHRoYXQgdGhvc2Ugd291bGQgYmUgYWxsb3dlZCB0bwpjb25zdW1l
IGJvdGggQ01BL1pPTkVfTU9WQUJMRS4KCk9uZSBoYXMgdG8gYmUgdmVyeSBjYXJlZnVsIHdoZW4g
cmVseWluZyBvbiBDTUEgb3IgbW92YWJsZSB6b25lcy4gVGhpcyBpcwpkZWZpbml0ZWx5IHdvcnRo
IGEgY29tbWVudCBpbiB0aGUga2VybmVsIGNvbW1hbmQgbGluZSBwYXJhbWV0ZXIKZG9jdW1lbnRh
dGlvbi4gQnV0IHRoaXMgaXMgbm90IGEgbmV3IHByb2JsZW0uCgotLSAKTWljaGFsIEhvY2tvClNV
U0UgTGFicwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
