Return-Path: <SRS0=3nDB=HL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8957C433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 09:15:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4CF464EB4
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 09:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4CF464EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zSky5lf8vUPKsNp+HKIW/UD0ssM2mkEXWkWK+8fKPLg=; b=cvlyvZalLOfOqXdgvDfuYGYkj
	w8V2B4UQiZMWSgI0T4z6NF1oH3t3Sq73ix6zx5208eE8eMKfjA/tP8hFjMZnW3T1gO1xyMoTGPtSw
	0m5o+s/NxZVO2AwnX+QseJnaxTIVArWIkwpPi8//pAK7yIVZ4Wxg8gWghCCKMHlvgiFycMXfjXPyf
	VAMYcKdHtG+USmb9bMGpkSQPAKCQ+qk18tERfsmXWdZEgU23ALMSmgHovrHxkirJ86QFx2E0NWBlA
	ID8UeQD4FQ0pHPbP80xtoTShu0RS8XLcOX4vldlMKPfZVy6tP8ePPhGvBZH9jDgGCKc8PJyCjtvfd
	X+XeuALyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9P7X-0003IQ-Ea; Tue, 09 Feb 2021 09:15:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9P7U-0003Gc-Gw
 for linux-riscv@lists.infradead.org; Tue, 09 Feb 2021 09:15:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612862138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uS7AnbSaMBJT+nB4CnATGQkmbCcT2ALwEDRI78KagxU=;
 b=DEQ9QfzRbiEiIfDxXiw6oIwNxllL3F82yeiFvH+ASc+u+8CyAhyXu6P7Et/QrPxzAOH0qf
 Z72DiRiCPSKFOBtLeqo+w+lZGu+jXn8aCrJjwQm/izBytK8VsTMSEwUPBV9tZ6qCzmKYCj
 k/0PII51pOVtcFIKIp01trDwJmBVTsk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-NwZYbqYANyOm-qFvzH4vwA-1; Tue, 09 Feb 2021 04:15:34 -0500
X-MC-Unique: NwZYbqYANyOm-qFvzH4vwA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBB2C79EC5;
 Tue,  9 Feb 2021 09:15:29 +0000 (UTC)
Received: from [10.36.113.141] (ovpn-113-141.ams2.redhat.com [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 282C760CEC;
 Tue,  9 Feb 2021 09:15:18 +0000 (UTC)
To: Michal Hocko <mhocko@suse.com>
References: <20210208211326.GV242749@kernel.org>
 <1F6A73CF-158A-4261-AA6C-1F5C77F4F326@redhat.com>
 <YCJO8zLq8YkXGy8B@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v17 00/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <662b5871-b461-0896-697f-5e903c23d7b9@redhat.com>
Date: Tue, 9 Feb 2021 10:15:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YCJO8zLq8YkXGy8B@dhcp22.suse.cz>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_041540_606682_C75273DB 
X-CRM114-Status: GOOD (  27.96  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDkuMDIuMjEgMDk6NTksIE1pY2hhbCBIb2NrbyB3cm90ZToKPiBPbiBNb24gMDgtMDItMjEg
MjI6Mzg6MDMsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+Pgo+Pj4gQW0gMDguMDIuMjAyMSB1
bSAyMjoxMyBzY2hyaWViIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2VybmVsLm9yZz46Cj4+Pgo+Pj4g
77u/T24gTW9uLCBGZWIgMDgsIDIwMjEgYXQgMTA6Mjc6MThBTSArMDEwMCwgRGF2aWQgSGlsZGVu
YnJhbmQgd3JvdGU6Cj4+Pj4gT24gMDguMDIuMjEgMDk6NDksIE1pa2UgUmFwb3BvcnQgd3JvdGU6
Cj4+Pj4KPj4+PiBTb21lIHF1ZXN0aW9ucyAoYW5kIHJlcXVlc3QgdG8gZG9jdW1lbnQgdGhlIGFu
c3dlcnMpIGFzIHdlIG5vdyBhbGxvdyB0byBoYXZlCj4+Pj4gdW5tb3ZhYmxlIGFsbG9jYXRpb25z
IGFsbCBvdmVyIHRoZSBwbGFjZSBhbmQgSSBkb24ndCBzZWUgYSBzaW5nbGUgY29tbWVudAo+Pj4+
IHJlZ2FyZGluZyB0aGF0IGluIHRoZSBjb3ZlciBsZXR0ZXI6Cj4+Pj4KPj4+PiAxLiBIb3cgd2ls
bCB0aGUgaXNzdWUgb2YgcGxlbnR5IG9mIHVubW92YWJsZSBhbGxvY2F0aW9ucyBmb3IgdXNlciBz
cGFjZSBiZQo+Pj4+IHRhY2tsZWQgaW4gdGhlIGZ1dHVyZT8KPj4+Pgo+Pj4+IDIuIEhvdyBoYXMg
dGhpcyBpc3N1ZSBiZWVuIGRvY3VtZW50ZWQ/IEUuZy4sIGludGVyYWN0aW9uIHdpdGggWk9ORV9N
T1ZBQkxFCj4+Pj4gYW5kIENNQSwgYWxsb2NfY29uaWdfcmFuZ2UoKS9hbGxvY19jb250aWdfcGFn
ZXM/Lgo+Pj4KPj4+IFNlY3JldG1lbSBzZXRzIHRoZSBtYXBwaW5ncyBnZnAgbWFzayB0byBHRlBf
SElHSFVTRVIsIHNvIGl0IGRvZXMgbm90Cj4+PiBhbGxvY2F0ZSBtb3ZhYmxlIHBhZ2VzIGF0IHRo
ZSBmaXJzdCBwbGFjZS4KPj4KPj4gVGhhdCBpcyBub3QgdGhlIHBvaW50LiBTZWNyZXRtZW0gY2Fu
bm90IGdvIG9uIENNQSAvIFpPTkVfTU9WQUJMRQo+PiBtZW1vcnkgYW5kIGJlaGF2ZXMgbGlrZSBs
b25nLXRlcm0gcGlubmluZ3MgaW4gdGhhdCBzZW5zZS4gVGhpcyBpcyBhCj4+IHJlYWwgaXNzdWUg
d2hlbiB1c2luZyBhIGxvdCBvZiBzZWN0cmVtZW0uCj4gCj4gQSBsb3Qgb2YgdW5ldmljdGFibGUg
bWVtb3J5IGlzIGEgY29uY2VybiByZWdhcmRsZXNzIG9mIENNQS9aT05FX01PVkFCTEUuCj4gQXMg
SSd2ZSBzYWlkIGl0IGlzIHF1aXRlIGVhc3kgdG8gbGFuZCBhdCB0aGUgc2ltaWxhciBzaXR1YXRp
b24gZXZlbiB3aXRoCj4gdG1wZnMvTUFQX0FOT058TUFQX1NIQVJFRCBvbiBzd2FwbGVzcyBzeXN0
ZW0uIE5laXRoZXIgb2YgdGhlIHR3byBpcwo+IHJlYWxseSB1bmNvbW1vbi4gSXQgd291bGQgYmUg
ZXZlbiB3b3JzZSB0aGF0IHRob3NlIHdvdWxkIGJlIGFsbG93ZWQgdG8KPiBjb25zdW1lIGJvdGgg
Q01BL1pPTkVfTU9WQUJMRS4KCklJUkMsIHRtcGZzL01BUF9BTk9OfE1BUF9TSEFSRUQgbWVtb3J5
CmEpIElzIG1vdmFibGUsIGNhbiBsYW5kIGluIFpPTkVfTU9WQUJMRS9DTUEKYikgQ2FuIGJlIGxp
bWl0ZWQgYnkgc2l6aW5nIHRtcGZzIGFwcHJvcHJpYXRlbHkKCkFGQUlLLCB3aGF0IHlvdSBkZXNj
cmliZSBpcyBhIHByb2JsZW0gd2l0aCBtZW1vcnkgb3ZlcmNvbW1pdCwgbm90IHdpdGggCnpvbmUg
aW1iYWxhbmNlcyAoYmVsb3cpLiBPciB3aGF0IGFtIEkgbWlzc2luZz8KCj4gCj4gT25lIGhhcyB0
byBiZSB2ZXJ5IGNhcmVmdWwgd2hlbiByZWx5aW5nIG9uIENNQSBvciBtb3ZhYmxlIHpvbmVzLiBU
aGlzIGlzCj4gZGVmaW5pdGVseSB3b3J0aCBhIGNvbW1lbnQgaW4gdGhlIGtlcm5lbCBjb21tYW5k
IGxpbmUgcGFyYW1ldGVyCj4gZG9jdW1lbnRhdGlvbi4gQnV0IHRoaXMgaXMgbm90IGEgbmV3IHBy
b2JsZW0uCgpJIHNlZSB0aGUgZm9sbG93aW5nIHRoaW5nIHdvcnRoIGRvY3VtZW50aW5nOgoKQXNz
dW1lIHlvdSBoYXZlIGEgc3lzdGVtIHdpdGggMkdCIG9mIFpPTkVfTk9STUFML1pPTkVfRE1BIGFu
ZCA0R0Igb2YgClpPTkVfTU9WQUJMRS9DTUEuCgpBc3N1bWUgeW91IG1ha2UgdXNlIG9mIDEuNUdC
IG9mIHNlY3JldG1lbS4gWW91ciBzeXN0ZW0gbWlnaHQgcnVuIGludG8gCk9PTSBhbnkgdGltZSBh
bHRob3VnaCB5b3Ugc3RpbGwgaGF2ZSBwbGVudHkgb2YgbWVtb3J5IG9uIFpPTkVfTU9WQVZMRSAK
KGFuZCBldmVuIHN3YXAhKSwgc2ltcGx5IGJlY2F1c2UgeW91IGFyZSBtYWtpbmcgZXhjZXNzaXZl
IHVzZSBvZiAKdW5tb3ZhYmxlIGFsbG9jYXRpb25zIChmb3IgdXNlciBzcGFjZSEpIGluIGFuIGVu
dmlyb25tZW50IHdoZXJlIHlvdSAKc2hvdWxkIG5vdCBtYWtlIGV4Y2Vzc2l2ZSB1c2Ugb2YgdW5t
b3ZhYmxlIGFsbG9jYXRpb25zIChlLmcuLCB3aGVyZSAKc2hvdWxkIHBhZ2UgdGFibGVzIGdvPyku
CgpUaGUgZXhpc3RpbmcgY29udHJvbHMgKG1sb2NrIGxpbWl0KSBkb24ndCByZWFsbHkgbWF0Y2gg
dGhlIGN1cnJlbnQgCnNlbWFudGljcyBvZiB0aGF0IG1lbW9yeS4gSSByZXBlYXQgaXQgb25jZSBh
Z2Fpbjogc2VjcmV0bWVtICpjdXJyZW50bHkqIApyZXNlbWJsZXMgbG9uZy10ZXJtIHBpbm5lZCBt
ZW1vcnksIG5vdCBtbG9ja2VkIG1lbW9yeS4gVGhpbmdzIHdpbGwgCmNoYW5nZSB3aGVuIGltcGxl
bWVudGluZyBtaWdyYXRpb24gc3VwcG9ydCBmb3Igc2VjcmV0bWVtIHBhZ2VzLiBVbnRpbCAKdGhl
biwgdGhlIHNlbWFudGljcyBhcmUgZGlmZmVyZW50IGFuZCB0aGlzIHNob3VsZCBiZSBzcGVsbGVk
IG91dC4KCkZvciBsb25nLXRlcm0gcGlubmluZ3MgdGhpcyBpcyBraW5kIG9mIG9idmlvdXMsIHN0
aWxsIHdlJ3JlIG5vdyAKZG9jdW1lbnRpbmcgaXQgYmVjYXVzZSBpdCdzIGRhbmdlcm91cyB0byBu
b3QgYmUgYXdhcmUgb2YuIFNlY3JldG1lbSAKYmVoYXZlcyBleGFjdGx5IHRoZSBzYW1lIGFuZCBJ
IHRoaW5rIHRoaXMgaXMgd29ydGggc3BlbGxpbmcgb3V0OiAKc2VjcmV0bWVtIGhhcyB0aGUgcG90
ZW50aWFsIG9mIGJlaW5nIHVzZWQgbXVjaCBtb3JlIG9mdGVuIHRoYW4gZmFpcmx5IApzcGVjaWFs
IHZmaW8vcmRtYS8gLi4uCgpMb29raW5nIGF0IGEgY292ZXIgbGV0dGVyIHRoYXQgZG9lc24ndCBl
dmVuIG1lbnRpb24gdGhlIGlzc3VlIG9mIAp1bm1vdmFibGUgYWxsb2NhdGlvbnMgbWFrZXMgbWUg
dGhpbmcgdGhhdCB3ZSBhcmUgZWl0aGVyIHRyeWluZyB0byBpZ25vcmUgCnRoZSBwcm9ibGVtIG9y
IGFyZSBub3QgYXdhcmUgb2YgdGhlIHByb2JsZW0uCgotLSAKVGhhbmtzLAoKRGF2aWQgLyBkaGls
ZGVuYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
