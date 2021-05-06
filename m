Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB3FCC433ED
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 23:16:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FEDA6103E
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 23:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FEDA6103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dtr7qhnu7ry4f2iPIGRwOwLQQUpFJMuSG5yj+M1Hemo=; b=bJWGLLpyWmm4A8aS5nEDaJj6U
	dq1yfnS9Hj/ScECFhVtcwjvoXOkNKm+vy7UlsHzl3S9QtslKkD6V8aRXqH3C8tk5nL01To3iCEcQP
	wvfx66HQM7MqlHGOYcgHB4QPodMrOgC6Mn0mR7pa4ITorHSowmAgGrkGC8t1ESIoOGA/MbGm428IH
	rkCGFsE5lXxxIED2PP3cN5CqTfGsBnPvzzZSeOOmkGXUVf80gxKat7eZLcX0bLZEtbHo6TAWeu1fM
	bExYxDxVWzfPyquIIeJ7i9hQYrr00NSPdeLvgW9RM6mkEMXrHfiPVJGJqqATnNZtNxlbANerQQd4w
	NNtzFHbUw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lenET-005YMS-UN; Thu, 06 May 2021 23:16:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lenER-005YMF-GK
 for linux-riscv@desiato.infradead.org; Thu, 06 May 2021 23:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=BOrIH8jYdhwg2AoZKi4mp4kSodQuFk0nMdHEO0BUTqM=; b=N4lbE5wrk8/rVE87bzjX+5dtjg
 btvt7LX7071Wdtpox9kFMaarAYkv4cVw7yVZITCRt+4aaRajr5EnvO8aqcq1Pr7lsaJYRRLXTWh/d
 ajQEdtSzwRkX1CoCAVaYiOfLI/fNCbY/2isCyfF5q4fnVCGqpv6aZopL9t6FvSlf7yahUzu+FVoGA
 ijqx6yU8wEtNEWH9g7s4I9dSCnp0IzNRRf1JPwSzv0iU01H4d99tsfYSBBxYIP6rRccxT0CpG+qjl
 U0LsOmS5ai4er1Ukq1d6XYs7me6w4OhC9iMdDtk9J55AzU6fxs9tw83uHXa/Y45eToKJOE79Kodii
 1WI4D97Q==;
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lenEO-006Riu-7s
 for linux-riscv@lists.infradead.org; Thu, 06 May 2021 23:16:33 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 146NGIi0043563
 for <linux-riscv@lists.infradead.org>; Fri, 7 May 2021 02:16:20 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1620342973; x=1622934973;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uf0onNfnHBzOPbID0tZ8t011w+r/nxI4x/Q1TyEOdQE=;
 b=PM4UzE0tjJb0ton6+hFqgkCcvCPtBByAxRm712TdGgM8oH0uKI3fYmQulecm+EDP
 VX/y3RFo1wqeqd0M0KT/NGXp67dMJ3EswjXL7/Rvs2m3exSNibfkcTfc4Ds1LdVZ
 zIO1mwOOSeXB/gkB+gBayO9ehtfE1kOLWrgcVaes3kdO9vNH4wOxJv3okCWEcOXq
 7wxQ55OdhLAsE3nZ4q/4x7s7ycQC0w3Gol5dj1eF7An6hnmST3jy8YU3tIa2mTWi
 ctsjP4o/QYbATmSPpaRFC0hLvogkCgCc8SAFLAmz5IdYCrO9I64z/wBrUohkg55F
 bxOCRdo40Lnk7VwOyEhcoA==;
X-AuditID: 8b5b014d-a70347000000209f-ba-609478bd5c23
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 EB.87.08351.DB874906; Fri,  7 May 2021 02:16:13 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 07 May 2021 02:16:03 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: jejb@linux.ibm.com
Cc: David Hildenbrand <david@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>, Dan Williams
 <dan.j.williams@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>,
 Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>, Mike
 Rapoport <rppt@linux.ibm.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Peter Zijlstra <peterz@infradead.org>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>, Shakeel Butt
 <shakeelb@google.com>, Shuah Khan <shuah@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Tycho Andersen <tycho@tycho.ws>, Will Deacon
 <will@kernel.org>, linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-riscv@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH v18 0/9] mm: introduce memfd_secret system call to create
 "secret" memory areas
Organization: FORTH
In-Reply-To: <8eb933f921c9dfe4c9b1b304e8f8fa4fbc249d84.camel@linux.ibm.com>
References: <20210303162209.8609-1-rppt@kernel.org>
 <20210505120806.abfd4ee657ccabf2f221a0eb@linux-foundation.org>
 <de27bfae0f4fdcbb0bb4ad17ec5aeffcd774c44b.camel@linux.ibm.com>
 <996dbc29-e79c-9c31-1e47-cbf20db2937d@redhat.com>
 <8eb933f921c9dfe4c9b1b304e8f8fa4fbc249d84.camel@linux.ibm.com>
Message-ID: <77fe28bd940b2c1afd69d65b6d349352@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA03SfUwTZxzA8Tx317uDrOFEGZdKwNWRbGwrmsn8JTKijs2LRuLMFhUW5AI3
 YEMkLRAmc2EC8qqjtS+uRXlRAUlHoWUwCoQXZQUFXwpaNhHr4I91MNxkTEaHjK5bwj9PPsnv
 l+f5/vHQuH+HSEKnpmcK8nQ+TUr6EmVxus1vdOeoE7Y8rwmBSpORhGXV9xTMNz8n4UldOQLH
 n7MIdJo7CH5uLkKwYFrCoW5eTcCC6g4J2pZAqB1vw8CorMHB8qyYhGLrAgHmqfsi6OoeImDU
 WkmCbuIJCZPGFRHkKx9Q0DZfQMJt6zciuOK4i8GjszvB3luNwb3HBgJuVDgpcI2W43Ba7we2
 M70YLP+wegzftIvguqkdg3F1Hgl992cQqF1NFFjMGhxODZgwuL1sE0HBRAS4F1cfXWyeEu18
 jXtWeJbgjBeNiHMvqRA363IRnDJ/juI69A8prtqcxVkawrhLXS6MMzeWkJz5qYri5m7dorjB
 826Cmx7TYVxFbS/iLg69fyAo1jcySUhLzRbk4VEJvilu0zSWcdUvx5CnovKQ9oVS5EOzzDZ2
 pP4SKkW+tD8zgNjxDhXlHUSwhu4S5LGYWccOfT1NeIwzwGrGepDXIWz+twbcY4IJZQunlzGP
 SeZVtsret7pP0xuYF9k5Y7B3fUHMOpThHq9nBLbu0SjpsR+znn368K7IYx9mH/tTWRfh7WnE
 2CbVH/81RLNttnukt+1l9je3k/LcH7BqywVpBVqnX1OqX1OqX1NajfBGxPDZb8pSExWyj4/L
 M1NkyXIz+vd3of3foQeWX2X9CKNRP2JpXLpBfLP2XIK/OIn/7IQgP35UnpUmKPrRRpqQBorF
 soqj/kwynyl8KggZgvz/KUb7SPIw2ye49vWaA7G7646gV97u3FS/vSc+sGAXzQTzA+8ym22D
 fVdq9w5+0HCygX4skW48Nzw+c3lP/kRMg7mocleU6PCxbbGNY6f4SbrqWkzPaEn5mb25xS99
 eCI0Lqp+UR2wPTc7aEYjuyHZpI4+KZS3HYmov1z11Wyc1nb+gmEpMqA874uglMPD82NO7Zxj
 x+fh4cnYwc6t6SO7i6xJDvvgis+P7YfYmD36GVPxlwMfheXwzEF5xu9ME52YteN0HHM1VP2L
 zKjtlBiynFH7nWVNrVN/C9b49ux3qt5rPRapmNTxRSst5MhkdHohWWFShiRu+ev6W/amVs2h
 ay1B4vjS4FwpoUjht4bhcgX/D3XLkQHMAwAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_161632_666679_4B5C52AB 
X-CRM114-Status: GOOD (  22.48  )
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

zqPPhM65z4IgMjAyMS0wNS0wNiAyMDowNSwgSmFtZXMgQm90dG9tbGV5IM6tzrPPgc6xz4jOtToK
PiBPbiBUaHUsIDIwMjEtMDUtMDYgYXQgMTg6NDUgKzAyMDAsIERhdmlkIEhpbGRlbmJyYW5kIHdy
b3RlOgo+PiAKPj4gQWxzbywgdGhlcmUgaXMgYSB3YXkgdG8gc3RpbGwgcmVhZCB0aGF0IG1lbW9y
eSB3aGVuIHJvb3QgYnkKPj4gCj4+IDEuIEhhdmluZyBrZHVtcCBhY3RpdmUgKHdoaWNoIHdvdWxk
IG9mdGVuIGJlIHRoZSBjYXNlLCBidXQgbWF5YmUgbm90Cj4+IHRvIGR1bXAgdXNlciBwYWdlcyAp
Cj4+IDIuIFRyaWdnZXJpbmcgYSBrZXJuZWwgY3Jhc2ggKGVhc3kgdmlhIHByb2MgYXMgcm9vdCkK
Pj4gMy4gV2FpdGluZyBmb3IgdGhlIHJlYm9vdCBhZnRlciBrdW1wKCkgY3JlYXRlZCB0aGUgZHVt
cCBhbmQgdGhlbgo+PiByZWFkaW5nIHRoZSBjb250ZW50IGZyb20gZGlzay4KPiAKPiBBbnl0aGlu
ZyB0aGF0IGNhbiBsZWF2ZSBwaHlzaWNhbCBtZW1vcnkgaW50YWN0IGJ1dCBib290IHRvIGEga2Vy
bmVsCj4gd2hlcmUgdGhlIG1pc3NpbmcgZGlyZWN0IG1hcCBlbnRyeSBpcyByZXN0b3JlZCBjb3Vs
ZCB0aGVvcmV0aWNhbGx5Cj4gZXh0cmFjdCB0aGUgc2VjcmV0LiAgSG93ZXZlciwgaXQncyBub3Qg
ZXhhY3RseSBnb2luZyB0byBiZSBhIHN0ZWFsdGh5Cj4gZXh0cmFjdGlvbiAuLi4KPiAKPj4gT3Is
IGFzIGFuIGF0dGFja2VyLCBsb2FkIGEgY3VzdG9tIGtleGVjKCkga2VybmVsIGFuZCByZWFkIG1l
bW9yeQo+PiBmcm9tIHRoZSBuZXcgZW52aXJvbm1lbnQuIE9mIGNvdXJzZSwgdGhlIGxhdHRlciB0
d28gYXJlIGFkdmFuY2VkCj4+IG1lY2hhbmlzbXMsIGJ1dCB0aGV5IGFyZSBwb3NzaWJsZSB3aGVu
IHJvb3QuIFdlIG1pZ2h0IGJlIGFibGUgdG8KPj4gbWl0aWdhdGUsIGZvciBleGFtcGxlLCBieSB6
ZXJvaW5nIG91dCBzZWNyZXRtZW0gcGFnZXMgYmVmb3JlIGJvb3RpbmcKPj4gaW50byB0aGUga2V4
ZWMga2VybmVsLCBpZiB3ZSBjYXJlIDopCj4gCj4gSSB0aGluayB3ZSBjb3VsZCBoYW5kbGUgaXQg
YnkgbWFya2luZyB0aGUgcmVnaW9uLCB5ZXMsIGFuZCBhIHplcm8gb24KPiBzaHV0ZG93biBtaWdo
dCBiZSB1c2VmdWwgLi4uIGl0IHdvdWxkIHByZXZlbnQgYWxsIHdhcm0gcmVib290IHR5cGUKPiBh
dHRhY2tzLgo+IAoKSSBoYWQgc2ltaWxhciBjb25jZXJucyBhYm91dCByZWNvdmVyaW5nIHNlY3Jl
dHMgd2l0aCBrZHVtcCwgYW5kIApjb25zaWRlcmVkIGNsZWFuaW5nIHVwIGtleXJpbmdzIGJlZm9y
ZSBqdW1waW5nIHRvIHRoZSBuZXcga2VybmVsLiBUaGUgCnByb2JsZW0gaXMgd2UgY2FuJ3QgcHJv
dmlkZSBndWFyYW50ZWVzIGluIHRoYXQgY2FzZSwgb25jZSB0aGUga2VybmVsIGhhcyAKY3Jhc2hl
ZCBhbmQgd2UgYXJlIG9uIG91ciB3YXkgdG8gcnVuIGNyYXNoa2VybmVsLCB3ZSBjYW4ndCBiZSBz
dXJlIHdlIApjYW4gcmVsaWFibHkgemVyby1vdXQgYW55dGhpbmcsIHRoZSBtb3JlIGNvZGUgd2Ug
YWRkIHRvIHRoYXQgcGF0aCB0aGUgCm1vcmUgcmlza3kgaXQgZ2V0cy4gSG93ZXZlciBkdXJpbmcg
cmVib290L25vcm1hbCBrZXhlYygpIHdlIHNob3VsZCBkbyAKc29tZSBjbGVhbnVwLCBpdCBtYWtl
cyBzZW5zZSBhbmQgc2VjcmV0bWVtIGNhbiBpbmRlZWQgYmUgdXNlZnVsIGluIHRoYXQgCmNhc2Uu
IFJlZ2FyZGluZyBsb2FkaW5nIGN1c3RvbSBrZXhlYygpIGtlcm5lbHMsIHdlIG1pdGlnYXRlIHRo
aXMgd2l0aCAKdGhlIGtleGVjIGZpbGUtYmFzZWQgQVBJIHdoZXJlIHdlIGNhbiB2ZXJpZnkgdGhl
IHNpZ25hdHVyZSBvZiB0aGUgbG9hZGVkIApraW1hZ2UgKGFzc3VtaW5nIHRoZSBzeXN0ZW0gcnVu
cyBhIGtlcm5lbCBwcm92aWRlZCBieSBhIHRydXN0ZWQgM3JkIApwYXJ0eSBhbmQgd2UgJ3ZlIG1h
aW50YWluZWQgYSBjaGFpbiBvZiB0cnVzdCBzaW5jZSBib290aW5nKS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
