Return-Path: <SRS0=PCma=HN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2508C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 11:27:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7922964DCF
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 11:27:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7922964DCF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/Dp01j47nFyL3t4kcbhek3XHtldrpShthljoEkAqdlw=; b=Mv8taPnplJ9txN4wXfC6Oi/IM
	lgCKIPTMLr3tReXf9av+9VCre8htDD7OLmCEorANpzgrlRqUPCfkU66wuMvCcHwLIvqDkzZv82FqO
	BaWBRr17w6I/B4m34rajqPACSsrYPIQq8LoLYbFrx2M5Y4BCKlrc9RytxyvwizWXB/yRQEBzQ+WTt
	mBeRFhhLXIIT5MToGU+d4PKqlcc6zV9hZmNYWIBx/ngtTnIE7juoFI1HJGyAjulHfep89oJfMzxXi
	2piGpxdBmHcP4lLW4zbzN13Q91galZIT3WbOAm/jj63WijN7Ou9OrH86j7P0R6ex9Zzh3RjyTOdn8
	iSEjDzBWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAA83-0006aO-Tk; Thu, 11 Feb 2021 11:27:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAA7y-0006YH-IX; Thu, 11 Feb 2021 11:27:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 418C664E26;
 Thu, 11 Feb 2021 11:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613042837;
 bh=opUcWXi7xUrvrbmjoDXPB2U6cbnKyKBkuV2eGoN2RQ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A5/jbbX3iRUf/Jtm1xCh7A2cWOvkK3kzDtdhjuXDmdNdtTGER2HK1BFbOMjDHidEz
 SSAvvaYro9hQ+4UOj7rZChw3GBiogzmiN+96ZwTf8KpbmHjppkBqlpNOGx1+GYSKnW
 iiIhy5VQwzOPRd5nhGKpZX9Mb+eGqJHBo98bQp3LuQGfqZdzRYf/BQyRJyHvb6rQIR
 vf9QchKbM0VCUg7uK5ktt19qAUj7CPyDJjv4a7QDFu0SNwMWyc8ZvtWr5Inmu5RJdS
 kK6a/mH5rwOREuKbaRyEGTNNkx6bq86w3omRuJcmAk5yyZCS72ObmTWwCdBPlR5ydV
 SRb+HO2Qsif8g==
Date: Thu, 11 Feb 2021 13:27:02 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <20210211112702.GI242749@kernel.org>
References: <20210208084920.2884-1-rppt@kernel.org>
 <20210208084920.2884-8-rppt@kernel.org>
 <YCEXMgXItY7xMbIS@dhcp22.suse.cz>
 <20210208212605.GX242749@kernel.org>
 <YCJMDBss8Qhha7g9@dhcp22.suse.cz>
 <20210209090938.GP299309@linux.ibm.com>
 <YCKLVzBR62+NtvyF@dhcp22.suse.cz>
 <20210211071319.GF242749@kernel.org>
 <YCTtSrCEvuBug2ap@dhcp22.suse.cz>
 <0d66baec-1898-987b-7eaf-68a015c027ff@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0d66baec-1898-987b-7eaf-68a015c027ff@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_062718_789907_29C07D61 
X-CRM114-Status: GOOD (  46.89  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 Peter Zijlstra <peterz@infradead.org>,
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
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBGZWIgMTEsIDIwMjEgYXQgMTA6MDE6MzJBTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gT24gMTEuMDIuMjEgMDk6MzksIE1pY2hhbCBIb2NrbyB3cm90ZToKPiA+IE9u
IFRodSAxMS0wMi0yMSAwOToxMzoxOSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiA+ID4gT24gVHVl
LCBGZWIgMDksIDIwMjEgYXQgMDI6MTc6MTFQTSArMDEwMCwgTWljaGFsIEhvY2tvIHdyb3RlOgo+
ID4gPiA+IE9uIFR1ZSAwOS0wMi0yMSAxMTowOTozOCwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiA+
IFsuLi5dCj4gPiA+ID4gPiBDaXRpbmcgbXkgb2xkZXIgZW1haWw6Cj4gPiA+ID4gPiAKPiA+ID4g
PiA+ICAgICAgSSd2ZSBoZXNpdGF0ZWQgd2hldGhlciB0byBjb250aW51ZSB0byB1c2UgbmV3IGZs
YWdzIHRvIG1lbWZkX2NyZWF0ZSgpIG9yIHRvCj4gPiA+ID4gPiAgICAgIGFkZCBhIG5ldyBzeXN0
ZW0gY2FsbCBhbmQgSSd2ZSBkZWNpZGVkIHRvIHVzZSBhIG5ldyBzeXN0ZW0gY2FsbCBhZnRlciBJ
J3ZlCj4gPiA+ID4gPiAgICAgIHN0YXJ0ZWQgdG8gbG9vayBpbnRvIG1hbiBwYWdlcyB1cGRhdGUu
IFRoZXJlIHdvdWxkIGhhdmUgYmVlbiB0d28gY29tcGxldGVseQo+ID4gPiA+ID4gICAgICBpbmRl
cGVuZGVudCBkZXNjcmlwdGlvbnMgYW5kIEkgdGhpbmsgaXQgd291bGQgaGF2ZSBiZWVuIHZlcnkg
Y29uZnVzaW5nLgo+ID4gPiA+IAo+ID4gPiA+IENvdWxkIHlvdSBlbGFib3JhdGU/IFVubWFwcGlu
ZyBmcm9tIHRoZSBrZXJuZWwgYWRkcmVzcyBzcGFjZSBjYW4gd29yawo+ID4gPiA+IGJvdGggZm9y
IHNlYWxlZCBvciBodWdldGxiIG1lbWZkcywgbm8/IFRob3NlIGZlYXR1cmVzIGFyZSBjb21wbGV0
ZWx5Cj4gPiA+ID4gb3J0aG9nb25hbCBBRkFJQ1MuIFdpdGggYSBkZWRpY2F0ZWQgc3lzY2FsbCB5
b3Ugd2lsbCBuZWVkIHRvIGludHJvZHVjZQo+ID4gPiA+IHRoaXMgZnVuY3Rpb25hbGl0eSBvbiB0
b3AgaWYgdGhhdCBpcyByZXF1aXJlZC4gSGF2ZSB5b3UgY29uc2lkZXJlZCB0aGF0Pwo+ID4gPiA+
IEkgbWVhbiBodWdldGxiIHBhZ2VzIGFyZSB1c2VkIHRvIGJhY2sgZ3Vlc3QgbWVtb3J5IHZlcnkg
b2Z0ZW4uIElzIHRoaXMKPiA+ID4gPiBzb21ldGhpbmcgdGhhdCB3aWxsIGJlIGEgc2VjcmV0IG1l
bW9yeSB1c2VjYXNlPwo+ID4gPiA+IAo+ID4gPiA+IFBsZWFzZSBiZSByZWFsbHkgc3BlY2lmaWMg
d2hlbiBnaXZpbmcgYXJndW1lbnRzIHRvIGJhY2sgYSBuZXcgc3lzY2FsbAo+ID4gPiA+IGRlY2lz
aW9uLgo+ID4gPiAKPiA+ID4gSXNuJ3QgInN5c2NhbGxzIGhhdmUgY29tcGxldGVseSBpbmRlcGVu
ZGVudCBkZXNjcmlwdGlvbiIgc3BlY2lmaWMgZW5vdWdoPwo+ID4gCj4gPiBObywgaXQncyBub3Qg
YXMgeW91IGNhbiBzZWUgZnJvbSBxdWVzdGlvbnMgSSd2ZSBoYWQgYWJvdmUuIE1vcmUgb24gdGhh
dAo+ID4gYmVsb3cuCj4gPiAKPiA+ID4gV2UgYXJlIHRhbGtpbmcgYWJvdXQgQVBJIGhlcmUsIG5v
dCB0aGUgaW1wbGVtZW50YXRpb24gZGV0YWlscyB3aGV0aGVyCj4gPiA+IHNlY3JldG1lbSBzdXBw
b3J0cyBsYXJnZSBwYWdlcyBvciBub3QuCj4gPiA+IAo+ID4gPiBUaGUgcHVycG9zZSBvZiBtZW1m
ZF9jcmVhdGUoKSBpcyB0byBjcmVhdGUgYSBmaWxlLWxpa2UgYWNjZXNzIHRvIG1lbW9yeS4KPiA+
ID4gVGhlIHB1cnBvc2Ugb2YgbWVtZmRfc2VjcmV0KCkgaXMgdG8gY3JlYXRlIGEgd2F5IHRvIGFj
Y2VzcyBtZW1vcnkgaGlkZGVuCj4gPiA+IGZyb20gdGhlIGtlcm5lbC4KPiA+ID4gCj4gPiA+IEkg
ZG9uJ3QgdGhpbmsgb3ZlcmxvYWRpbmcgbWVtZmRfY3JlYXRlKCkgd2l0aCB0aGUgc2VjcmV0bWVt
IGZsYWdzIGJlY2F1c2UKPiA+ID4gdGhleSBoYXBwZW4gdG8gcmV0dXJuIGEgZmlsZSBkZXNjcmlw
dG9yIHdpbGwgYmUgYmV0dGVyIGZvciB1c2VycywgYnV0Cj4gPiA+IHJhdGhlciB3aWxsIGJlIG1v
cmUgY29uZnVzaW5nLgo+ID4gCj4gPiBUaGlzIGlzIHF1aXRlIGEgc3ViamVjdGl2ZSBjb25jbHVz
aW9uLiBJIGNvdWxkIHZlcnkgd2VsbCBhcmd1ZSB0aGF0IGl0Cj4gPiB3b3VsZCBiZSBtdWNoIGJl
dHRlciB0byBoYXZlIGEgc2luZ2xlIHN5c2NhbGwgdG8gZ2V0IGEgZmQgYmFja2VkIG1lbW9yeQo+
ID4gd2l0aCBzcGVkaWZpYyByZXF1aXJlbWVudHMgKHNlYWxpbmcsIHVubWFwcGluZyBmcm9tIHRo
ZSBrZXJuZWwgYWRkcmVzcwo+ID4gc3BhY2UpLiBOZWl0aGVyIG9mIHVzIHdvdWxkIGJlIGNsZWFy
bHkgcmlnaHQgb3Igd3JvbmcuIEEgbW9yZSBpbXBvcnRhbnQKPiA+IHBvaW50IGlzIGEgZnV0dXJl
IGV4dGVuc2liaWxpdHkgYW5kIHVzYWJpbGl0eSwgdGhvdWdoLiBTbyBsZXQncyBqdXN0Cj4gPiB0
aGluayBvZiBmZXcgdXNlY2FzZXMgSSBoYXZlIG91dGxpbmVkIGFib3ZlLiBJcyBpdCB1bnJlYWxp
c3RpYyB0byBleHBlY3QKPiA+IHRoYXQgc2VjcmV0IG1lbW9yeSBzaG91bGQgYmUgc2VhbGFibGU/
IFdoYXQgYWJvdXQgaHVnZXRsYj8gQmVjYXVzZSBpZgo+ID4gdGhlIGFuc3dlciBpcyBubyB0aGVu
IGEgbmV3IEFQSSBpcyBhIGNsZWFyIHdpbiBhcyB0aGUgY29tYmluYXRpb24gb2YKPiA+IGZsYWdz
IHdvdWxkIG5ldmVyIHdvcmsgYW5kIHRoZW4gd2Ugd291bGQganVzdCBzdWZmZXIgZnJvbSB0aGUg
c3lzY2FsbAo+ID4gbXVsdGlwbGV4aW5nIHdpdGhvdXQgbXVjaCBnYWluLiBPbiB0aGUgb3RoZXIg
aGFuZCBpZiBjb21iaW5hdGlvbiBvZiB0aGUKPiA+IGZ1bmN0aW9uYWxpdHkgaXMgdG8gYmUgZXhw
ZWN0ZWQgdGhlbiB5b3Ugd2lsbCBoYXZlIHRvIGphbSBpdCBpbnRvCj4gPiBtZW1mZF9jcmVhdGUg
YW5kIGNvcHkgdGhlIGludGVyZmFjZSBsaWtlbHkgY2F1c2luZyBtb3JlIGNvbmZ1c2lvbi4gU2Vl
Cj4gPiB3aGF0IEkgbWVhbj8KPiA+IAo+ID4gSSBieSBubyBtZWFucyBkbyBub3QgaW5zaXN0IG9u
ZSB3YXkgb3IgdGhlIG90aGVyIGJ1dCBmcm9tIHdoYXQgSSBoYXZlCj4gPiBzZWVuIHNvIGZhciBJ
IGhhdmUgYSBmZWVsaW5nIHRoYXQgdGhlIGludGVyZmFjZSBoYXNuJ3QgYmVlbiB0aG91Z2h0Cj4g
PiB0aHJvdWdoIGVub3VnaC4gU3VyZSB5b3UgaGF2ZSBsYW5kZWQgd2l0aCBmZCBiYXNlZCBhcHBy
b2FjaCBhbmQgdGhhdAo+ID4gc2VlbXMgZmFpci4gQnV0IGhvdyB0byBnZXQgdGhhdCBmZCBzZWVt
cyB0byBzdGlsbCBoYXZlIHNvbWUgZ2FwcyBJTUhPLgo+ID4gCj4gCj4gSSBhZ3JlZSB3aXRoIE1p
Y2hhbC4gVGhpcyBoYXMgYmVlbiByYWlzZWQgYnkgZGlmZmVyZW50Cj4gcGVvcGxlIGFscmVhZHks
IGluY2x1ZGluZyBvbiBMV04gKGh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy84MzUzNDIvKS4KPiAK
PiBJIGNhbiBmb2xsb3cgTWlrZSdzIHJlYXNvbmluZyAobWFuIHBhZ2UpLCBhbmQgSSBhbSBhbHNv
IGZpbmUgaWYgdGhlcmUgaXMKPiBhIHZhbGlkIHJlYXNvbi4gSG93ZXZlciwgSU1ITyB0aGUgYmFz
aWMgZGVzY3JpcHRpb24gc2VlbXMgdG8gbWF0Y2ggcXVpdGUgZ29vZDoKPiAKPiAgICAgICAgbWVt
ZmRfY3JlYXRlKCkgY3JlYXRlcyBhbiBhbm9ueW1vdXMgZmlsZSBhbmQgcmV0dXJucyBhIGZpbGUg
ZGVzY3JpcHRvciB0aGF0IHJlZmVycyB0byBpdC4gIFRoZQo+ICAgICAgICBmaWxlIGJlaGF2ZXMg
bGlrZSBhIHJlZ3VsYXIgZmlsZSwgYW5kIHNvIGNhbiBiZSBtb2RpZmllZCwgdHJ1bmNhdGVkLCBt
ZW1vcnktbWFwcGVkLCBhbmQgc28gb24uCj4gICAgICAgIEhvd2V2ZXIsICB1bmxpa2UgYSByZWd1
bGFyIGZpbGUsIGl0IGxpdmVzIGluIFJBTSBhbmQgaGFzIGEgdm9sYXRpbGUgYmFja2luZyBzdG9y
YWdlLiAgT25jZSBhbGwKPiAgICAgICAgcmVmZXJlbmNlcyB0byB0aGUgZmlsZSBhcmUgZHJvcHBl
ZCwgaXQgaXMgYXV0b21hdGljYWxseSByZWxlYXNlZC4gIEFub255bW91cyAgbWVtb3J5ICBpcyAg
dXNlZAo+ICAgICAgICBmb3IgIGFsbCAgYmFja2luZyBwYWdlcyBvZiB0aGUgZmlsZS4gIFRoZXJl
Zm9yZSwgZmlsZXMgY3JlYXRlZCBieSBtZW1mZF9jcmVhdGUoKSBoYXZlIHRoZSBzYW1lCj4gICAg
ICAgIHNlbWFudGljcyBhcyBvdGhlciBhbm9ueW1vdXMgbWVtb3J5IGFsbG9jYXRpb25zIHN1Y2gg
YXMgdGhvc2UgYWxsb2NhdGVkIHVzaW5nIG1tYXAoMikgd2l0aCB0aGUKPiAgICAgICAgTUFQX0FO
T05ZTU9VUyBmbGFnLgoKRXZlbiBkZXNwaXRlIG15IGxhemluZXNzIGFuZCBodWdlIGFtb3VudCBv
ZiBjb3B5LXBhc3RlIHlvdSBjYW4gc3BvdCB0aGUKZGlmZmVyZW5jZXMgKHRoaXMgaXMgYSB2ZXJ5
IG9sZCB2ZXJzaW9uLCB1cGRhdGUgaXMgZHVlKToKCiAgICAgICBtZW1mZF9zZWNyZXQoKSAgY3Jl
YXRlcyBhbiBhbm9ueW1vdXMgZmlsZSBhbmQgcmV0dXJucyBhIGZpbGUgZGVzY3JpcHRvcgogICAg
ICAgdGhhdCByZWZlcnMgdG8gaXQuICBUaGUgZmlsZSBjYW4gb25seSBiZSBtZW1vcnktbWFwcGVk
OyB0aGUgIG1lbW9yeSAgaW4KICAgICAgIHN1Y2ggIG1hcHBpbmcgIHdpbGwgIGhhdmUgIHN0cm9u
Z2VyIHByb3RlY3Rpb24gdGhhbiB1c3VhbCBtZW1vcnkgbWFwcGVkCiAgICAgICBmaWxlcywgYW5k
IHNvIGl0IGNhbiBiZSB1c2VkIHRvIHN0b3JlIGFwcGxpY2F0aW9uICBzZWNyZXRzLiAgIFVubGlr
ZSAgYQogICAgICAgcmVndWxhciBmaWxlLCBhIGZpbGUgY3JlYXRlZCB3aXRoIG1lbWZkX3NlY3Jl
dCgpIGxpdmVzIGluIFJBTSBhbmQgaGFzIGEKICAgICAgIHZvbGF0aWxlIGJhY2tpbmcgc3RvcmFn
ZS4gIE9uY2UgYWxsIHJlZmVyZW5jZXMgdG8gdGhlIGZpbGUgYXJlIGRyb3BwZWQsCiAgICAgICBp
dCAgaXMgIGF1dG9tYXRpY2FsbHkgcmVsZWFzZWQuICBUaGUgaW5pdGlhbCBzaXplIG9mIHRoZSBm
aWxlIGlzIHNldCB0bwogICAgICAgMC4gIEZvbGxvd2luZyB0aGUgY2FsbCwgdGhlIGZpbGUgc2l6
ZSBzaG91bGQgYmUgc2V0IHVzaW5nIGZ0cnVuY2F0ZSgyKS4KCiAgICAgICBUaGUgbWVtb3J5IGFy
ZWFzIG9idGFpbmVkIHdpdGggbW1hcCgyKSBmcm9tIHRoZSBmaWxlIGRlc2NyaXB0b3IgYXJlIGV4
4oCQCiAgICAgICBjbHVzaXZlIHRvIHRoZSBvd25pbmcgY29udGV4dC4gIFRoZXNlIGFyZWFzIGFy
ZSByZW1vdmVkIGZyb20gdGhlIGtlcm5lbAogICAgICAgcGFnZSB0YWJsZXMgYW5kIG9ubHkgdGhl
IHBhZ2UgdGFibGUgb2YgdGhlIHByb2Nlc3MgaG9sZGluZyB0aGUgZmlsZSBkZeKAkAogICAgICAg
c2NyaXB0b3IgbWFwcyB0aGUgY29ycmVzcG9uZGluZyBwaHlzaWNhbCBtZW1vcnkuCiAKPiBBRkFJ
S1MsIHdlIHdvdWxkIG5lZWQgTUZEX1NFQ1JFVCBhbmQgZGlzYWxsb3cKPiBNRkRfQUxMT1dfU0VB
TElORyBhbmQgTUZEX0hVR0VUTEIuCgpTbyBoZXJlIHdlIHN0YXJ0IHRvIG11bHRpcGxleC4KCj4g
SW4gYWRkaXRpb24sIHdlIGNvdWxkIGFkZCBNRkRfU0VDUkVUX05FVkVSX01BUCwgd2hpY2ggY291
bGQgZGlzYWxsb3cgYW55IGtpbmQgb2YKPiB0ZW1wb3JhcnkgbWFwcGluZ3MgKGVvciBtaWdyYXRp
b24pLiBUQkMuCgpOZXZlciBtYXAgaXMgdGhlIGRlZmF1bHQuIFdoZW4gd2UnbGwgbmVlZCB0byBt
YXAgd2UnbGwgYWRkIGFuIGV4cGxpY2l0IGZsYWcKZm9yIGl0LgoKLS0gClNpbmNlcmVseSB5b3Vy
cywKTWlrZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
