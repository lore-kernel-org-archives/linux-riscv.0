Return-Path: <SRS0=PCma=HN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B416DC433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 12:07:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CEBA64E79
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 12:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CEBA64E79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5ckPF+1pp+TZNxCMJQL8oKJnGjAGkQ8Cdf4U7kQ/xWs=; b=YtJoPh7/V/wslHHNIaJpv1Ql4
	1nwLLpuDOjQBHkeXkNUnv1WigG+xNHcyQ7hgAMKGR+OK1uTnFwhd6hnG/XQNeX6Up4yz8AGlwe8T1
	EsIQTovnRRoo3SLAz9VoF6es426vwkaEGLvAasA4ZCnk+G90NPFfI8tAPNfwm7Q3xLX6xw8mR3hNh
	x63KlDVD62Mql/EPvS8cOSVYjHiZDARNkJUQph1PNEgoNMll33S1MO0I2WGfiW+HhC1OeDHkWIt6o
	wVBg2+oYkTkZBwmICKQgpnIt+RpBiJk/ytX+a8+4ox++TfysmyXQ5RRqhTmRh5mUTuzaGOss+CKAM
	HBxVJl5ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAAkz-0004SV-V0; Thu, 11 Feb 2021 12:07:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAAks-0004PK-Ea
 for linux-riscv@lists.infradead.org; Thu, 11 Feb 2021 12:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613045249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FxdQiOdDrI0lN+ynkHsa9xjwUnD3y3w6sb41lTRrq7A=;
 b=KEp6mbGO452Aa13L/XsJPyLboNBxjMDXzEHL14zg0eHqU3oEq20XMpFkITBBTTeNobFoVf
 Ts0VL/ZRxyqxVuT1c5ISawLgboTxQuJcalB9YHah2DH1Y+0ue5LzHH5R0ue/2AmOsqNoTt
 FK78o3ivO8np5LJbBU7EXDAnRajPB34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-HGb2gjz-PHmITs_HU4BpDA-1; Thu, 11 Feb 2021 07:07:25 -0500
X-MC-Unique: HGb2gjz-PHmITs_HU4BpDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51157192AB79;
 Thu, 11 Feb 2021 12:07:20 +0000 (UTC)
Received: from [10.36.114.52] (ovpn-114-52.ams2.redhat.com [10.36.114.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 001DD60C0F;
 Thu, 11 Feb 2021 12:07:10 +0000 (UTC)
To: Mike Rapoport <rppt@kernel.org>
References: <20210208084920.2884-1-rppt@kernel.org>
 <20210208084920.2884-8-rppt@kernel.org> <YCEXMgXItY7xMbIS@dhcp22.suse.cz>
 <20210208212605.GX242749@kernel.org> <YCJMDBss8Qhha7g9@dhcp22.suse.cz>
 <20210209090938.GP299309@linux.ibm.com> <YCKLVzBR62+NtvyF@dhcp22.suse.cz>
 <20210211071319.GF242749@kernel.org> <YCTtSrCEvuBug2ap@dhcp22.suse.cz>
 <0d66baec-1898-987b-7eaf-68a015c027ff@redhat.com>
 <20210211112702.GI242749@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <05082284-bd85-579f-2b3e-9b1af663eb6f@redhat.com>
Date: Thu, 11 Feb 2021 13:07:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210211112702.GI242749@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_070730_693753_78182D07 
X-CRM114-Status: GOOD (  39.92  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTEuMDIuMjEgMTI6MjcsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gT24gVGh1LCBGZWIgMTEs
IDIwMjEgYXQgMTA6MDE6MzJBTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+IE9u
IDExLjAyLjIxIDA5OjM5LCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4+PiBPbiBUaHUgMTEtMDItMjEg
MDk6MTM6MTksIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4+Pj4gT24gVHVlLCBGZWIgMDksIDIwMjEg
YXQgMDI6MTc6MTFQTSArMDEwMCwgTWljaGFsIEhvY2tvIHdyb3RlOgo+Pj4+PiBPbiBUdWUgMDkt
MDItMjEgMTE6MDk6MzgsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4+PiBbLi4uXQo+Pj4+Pj4gQ2l0
aW5nIG15IG9sZGVyIGVtYWlsOgo+Pj4+Pj4KPj4+Pj4+ICAgICAgIEkndmUgaGVzaXRhdGVkIHdo
ZXRoZXIgdG8gY29udGludWUgdG8gdXNlIG5ldyBmbGFncyB0byBtZW1mZF9jcmVhdGUoKSBvciB0
bwo+Pj4+Pj4gICAgICAgYWRkIGEgbmV3IHN5c3RlbSBjYWxsIGFuZCBJJ3ZlIGRlY2lkZWQgdG8g
dXNlIGEgbmV3IHN5c3RlbSBjYWxsIGFmdGVyIEkndmUKPj4+Pj4+ICAgICAgIHN0YXJ0ZWQgdG8g
bG9vayBpbnRvIG1hbiBwYWdlcyB1cGRhdGUuIFRoZXJlIHdvdWxkIGhhdmUgYmVlbiB0d28gY29t
cGxldGVseQo+Pj4+Pj4gICAgICAgaW5kZXBlbmRlbnQgZGVzY3JpcHRpb25zIGFuZCBJIHRoaW5r
IGl0IHdvdWxkIGhhdmUgYmVlbiB2ZXJ5IGNvbmZ1c2luZy4KPj4+Pj4KPj4+Pj4gQ291bGQgeW91
IGVsYWJvcmF0ZT8gVW5tYXBwaW5nIGZyb20gdGhlIGtlcm5lbCBhZGRyZXNzIHNwYWNlIGNhbiB3
b3JrCj4+Pj4+IGJvdGggZm9yIHNlYWxlZCBvciBodWdldGxiIG1lbWZkcywgbm8/IFRob3NlIGZl
YXR1cmVzIGFyZSBjb21wbGV0ZWx5Cj4+Pj4+IG9ydGhvZ29uYWwgQUZBSUNTLiBXaXRoIGEgZGVk
aWNhdGVkIHN5c2NhbGwgeW91IHdpbGwgbmVlZCB0byBpbnRyb2R1Y2UKPj4+Pj4gdGhpcyBmdW5j
dGlvbmFsaXR5IG9uIHRvcCBpZiB0aGF0IGlzIHJlcXVpcmVkLiBIYXZlIHlvdSBjb25zaWRlcmVk
IHRoYXQ/Cj4+Pj4+IEkgbWVhbiBodWdldGxiIHBhZ2VzIGFyZSB1c2VkIHRvIGJhY2sgZ3Vlc3Qg
bWVtb3J5IHZlcnkgb2Z0ZW4uIElzIHRoaXMKPj4+Pj4gc29tZXRoaW5nIHRoYXQgd2lsbCBiZSBh
IHNlY3JldCBtZW1vcnkgdXNlY2FzZT8KPj4+Pj4KPj4+Pj4gUGxlYXNlIGJlIHJlYWxseSBzcGVj
aWZpYyB3aGVuIGdpdmluZyBhcmd1bWVudHMgdG8gYmFjayBhIG5ldyBzeXNjYWxsCj4+Pj4+IGRl
Y2lzaW9uLgo+Pj4+Cj4+Pj4gSXNuJ3QgInN5c2NhbGxzIGhhdmUgY29tcGxldGVseSBpbmRlcGVu
ZGVudCBkZXNjcmlwdGlvbiIgc3BlY2lmaWMgZW5vdWdoPwo+Pj4KPj4+IE5vLCBpdCdzIG5vdCBh
cyB5b3UgY2FuIHNlZSBmcm9tIHF1ZXN0aW9ucyBJJ3ZlIGhhZCBhYm92ZS4gTW9yZSBvbiB0aGF0
Cj4+PiBiZWxvdy4KPj4+Cj4+Pj4gV2UgYXJlIHRhbGtpbmcgYWJvdXQgQVBJIGhlcmUsIG5vdCB0
aGUgaW1wbGVtZW50YXRpb24gZGV0YWlscyB3aGV0aGVyCj4+Pj4gc2VjcmV0bWVtIHN1cHBvcnRz
IGxhcmdlIHBhZ2VzIG9yIG5vdC4KPj4+Pgo+Pj4+IFRoZSBwdXJwb3NlIG9mIG1lbWZkX2NyZWF0
ZSgpIGlzIHRvIGNyZWF0ZSBhIGZpbGUtbGlrZSBhY2Nlc3MgdG8gbWVtb3J5Lgo+Pj4+IFRoZSBw
dXJwb3NlIG9mIG1lbWZkX3NlY3JldCgpIGlzIHRvIGNyZWF0ZSBhIHdheSB0byBhY2Nlc3MgbWVt
b3J5IGhpZGRlbgo+Pj4+IGZyb20gdGhlIGtlcm5lbC4KPj4+Pgo+Pj4+IEkgZG9uJ3QgdGhpbmsg
b3ZlcmxvYWRpbmcgbWVtZmRfY3JlYXRlKCkgd2l0aCB0aGUgc2VjcmV0bWVtIGZsYWdzIGJlY2F1
c2UKPj4+PiB0aGV5IGhhcHBlbiB0byByZXR1cm4gYSBmaWxlIGRlc2NyaXB0b3Igd2lsbCBiZSBi
ZXR0ZXIgZm9yIHVzZXJzLCBidXQKPj4+PiByYXRoZXIgd2lsbCBiZSBtb3JlIGNvbmZ1c2luZy4K
Pj4+Cj4+PiBUaGlzIGlzIHF1aXRlIGEgc3ViamVjdGl2ZSBjb25jbHVzaW9uLiBJIGNvdWxkIHZl
cnkgd2VsbCBhcmd1ZSB0aGF0IGl0Cj4+PiB3b3VsZCBiZSBtdWNoIGJldHRlciB0byBoYXZlIGEg
c2luZ2xlIHN5c2NhbGwgdG8gZ2V0IGEgZmQgYmFja2VkIG1lbW9yeQo+Pj4gd2l0aCBzcGVkaWZp
YyByZXF1aXJlbWVudHMgKHNlYWxpbmcsIHVubWFwcGluZyBmcm9tIHRoZSBrZXJuZWwgYWRkcmVz
cwo+Pj4gc3BhY2UpLiBOZWl0aGVyIG9mIHVzIHdvdWxkIGJlIGNsZWFybHkgcmlnaHQgb3Igd3Jv
bmcuIEEgbW9yZSBpbXBvcnRhbnQKPj4+IHBvaW50IGlzIGEgZnV0dXJlIGV4dGVuc2liaWxpdHkg
YW5kIHVzYWJpbGl0eSwgdGhvdWdoLiBTbyBsZXQncyBqdXN0Cj4+PiB0aGluayBvZiBmZXcgdXNl
Y2FzZXMgSSBoYXZlIG91dGxpbmVkIGFib3ZlLiBJcyBpdCB1bnJlYWxpc3RpYyB0byBleHBlY3QK
Pj4+IHRoYXQgc2VjcmV0IG1lbW9yeSBzaG91bGQgYmUgc2VhbGFibGU/IFdoYXQgYWJvdXQgaHVn
ZXRsYj8gQmVjYXVzZSBpZgo+Pj4gdGhlIGFuc3dlciBpcyBubyB0aGVuIGEgbmV3IEFQSSBpcyBh
IGNsZWFyIHdpbiBhcyB0aGUgY29tYmluYXRpb24gb2YKPj4+IGZsYWdzIHdvdWxkIG5ldmVyIHdv
cmsgYW5kIHRoZW4gd2Ugd291bGQganVzdCBzdWZmZXIgZnJvbSB0aGUgc3lzY2FsbAo+Pj4gbXVs
dGlwbGV4aW5nIHdpdGhvdXQgbXVjaCBnYWluLiBPbiB0aGUgb3RoZXIgaGFuZCBpZiBjb21iaW5h
dGlvbiBvZiB0aGUKPj4+IGZ1bmN0aW9uYWxpdHkgaXMgdG8gYmUgZXhwZWN0ZWQgdGhlbiB5b3Ug
d2lsbCBoYXZlIHRvIGphbSBpdCBpbnRvCj4+PiBtZW1mZF9jcmVhdGUgYW5kIGNvcHkgdGhlIGlu
dGVyZmFjZSBsaWtlbHkgY2F1c2luZyBtb3JlIGNvbmZ1c2lvbi4gU2VlCj4+PiB3aGF0IEkgbWVh
bj8KPj4+Cj4+PiBJIGJ5IG5vIG1lYW5zIGRvIG5vdCBpbnNpc3Qgb25lIHdheSBvciB0aGUgb3Ro
ZXIgYnV0IGZyb20gd2hhdCBJIGhhdmUKPj4+IHNlZW4gc28gZmFyIEkgaGF2ZSBhIGZlZWxpbmcg
dGhhdCB0aGUgaW50ZXJmYWNlIGhhc24ndCBiZWVuIHRob3VnaHQKPj4+IHRocm91Z2ggZW5vdWdo
LiBTdXJlIHlvdSBoYXZlIGxhbmRlZCB3aXRoIGZkIGJhc2VkIGFwcHJvYWNoIGFuZCB0aGF0Cj4+
PiBzZWVtcyBmYWlyLiBCdXQgaG93IHRvIGdldCB0aGF0IGZkIHNlZW1zIHRvIHN0aWxsIGhhdmUg
c29tZSBnYXBzIElNSE8uCj4+Pgo+Pgo+PiBJIGFncmVlIHdpdGggTWljaGFsLiBUaGlzIGhhcyBi
ZWVuIHJhaXNlZCBieSBkaWZmZXJlbnQKPj4gcGVvcGxlIGFscmVhZHksIGluY2x1ZGluZyBvbiBM
V04gKGh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy84MzUzNDIvKS4KPj4KPj4gSSBjYW4gZm9sbG93
IE1pa2UncyByZWFzb25pbmcgKG1hbiBwYWdlKSwgYW5kIEkgYW0gYWxzbyBmaW5lIGlmIHRoZXJl
IGlzCj4+IGEgdmFsaWQgcmVhc29uLiBIb3dldmVyLCBJTUhPIHRoZSBiYXNpYyBkZXNjcmlwdGlv
biBzZWVtcyB0byBtYXRjaCBxdWl0ZSBnb29kOgo+Pgo+PiAgICAgICAgIG1lbWZkX2NyZWF0ZSgp
IGNyZWF0ZXMgYW4gYW5vbnltb3VzIGZpbGUgYW5kIHJldHVybnMgYSBmaWxlIGRlc2NyaXB0b3Ig
dGhhdCByZWZlcnMgdG8gaXQuICBUaGUKPj4gICAgICAgICBmaWxlIGJlaGF2ZXMgbGlrZSBhIHJl
Z3VsYXIgZmlsZSwgYW5kIHNvIGNhbiBiZSBtb2RpZmllZCwgdHJ1bmNhdGVkLCBtZW1vcnktbWFw
cGVkLCBhbmQgc28gb24uCj4+ICAgICAgICAgSG93ZXZlciwgIHVubGlrZSBhIHJlZ3VsYXIgZmls
ZSwgaXQgbGl2ZXMgaW4gUkFNIGFuZCBoYXMgYSB2b2xhdGlsZSBiYWNraW5nIHN0b3JhZ2UuICBP
bmNlIGFsbAo+PiAgICAgICAgIHJlZmVyZW5jZXMgdG8gdGhlIGZpbGUgYXJlIGRyb3BwZWQsIGl0
IGlzIGF1dG9tYXRpY2FsbHkgcmVsZWFzZWQuICBBbm9ueW1vdXMgIG1lbW9yeSAgaXMgIHVzZWQK
Pj4gICAgICAgICBmb3IgIGFsbCAgYmFja2luZyBwYWdlcyBvZiB0aGUgZmlsZS4gIFRoZXJlZm9y
ZSwgZmlsZXMgY3JlYXRlZCBieSBtZW1mZF9jcmVhdGUoKSBoYXZlIHRoZSBzYW1lCj4+ICAgICAg
ICAgc2VtYW50aWNzIGFzIG90aGVyIGFub255bW91cyBtZW1vcnkgYWxsb2NhdGlvbnMgc3VjaCBh
cyB0aG9zZSBhbGxvY2F0ZWQgdXNpbmcgbW1hcCgyKSB3aXRoIHRoZQo+PiAgICAgICAgIE1BUF9B
Tk9OWU1PVVMgZmxhZy4KPiAKPiBFdmVuIGRlc3BpdGUgbXkgbGF6aW5lc3MgYW5kIGh1Z2UgYW1v
dW50IG9mIGNvcHktcGFzdGUgeW91IGNhbiBzcG90IHRoZQo+IGRpZmZlcmVuY2VzICh0aGlzIGlz
IGEgdmVyeSBvbGQgdmVyc2lvbiwgdXBkYXRlIGlzIGR1ZSk6Cj4gCj4gICAgICAgICBtZW1mZF9z
ZWNyZXQoKSAgY3JlYXRlcyBhbiBhbm9ueW1vdXMgZmlsZSBhbmQgcmV0dXJucyBhIGZpbGUgZGVz
Y3JpcHRvcgo+ICAgICAgICAgdGhhdCByZWZlcnMgdG8gaXQuICBUaGUgZmlsZSBjYW4gb25seSBi
ZSBtZW1vcnktbWFwcGVkOyB0aGUgIG1lbW9yeSAgaW4KPiAgICAgICAgIHN1Y2ggIG1hcHBpbmcg
IHdpbGwgIGhhdmUgIHN0cm9uZ2VyIHByb3RlY3Rpb24gdGhhbiB1c3VhbCBtZW1vcnkgbWFwcGVk
Cj4gICAgICAgICBmaWxlcywgYW5kIHNvIGl0IGNhbiBiZSB1c2VkIHRvIHN0b3JlIGFwcGxpY2F0
aW9uICBzZWNyZXRzLiAgIFVubGlrZSAgYQo+ICAgICAgICAgcmVndWxhciBmaWxlLCBhIGZpbGUg
Y3JlYXRlZCB3aXRoIG1lbWZkX3NlY3JldCgpIGxpdmVzIGluIFJBTSBhbmQgaGFzIGEKPiAgICAg
ICAgIHZvbGF0aWxlIGJhY2tpbmcgc3RvcmFnZS4gIE9uY2UgYWxsIHJlZmVyZW5jZXMgdG8gdGhl
IGZpbGUgYXJlIGRyb3BwZWQsCj4gICAgICAgICBpdCAgaXMgIGF1dG9tYXRpY2FsbHkgcmVsZWFz
ZWQuICBUaGUgaW5pdGlhbCBzaXplIG9mIHRoZSBmaWxlIGlzIHNldCB0bwo+ICAgICAgICAgMC4g
IEZvbGxvd2luZyB0aGUgY2FsbCwgdGhlIGZpbGUgc2l6ZSBzaG91bGQgYmUgc2V0IHVzaW5nIGZ0
cnVuY2F0ZSgyKS4KPiAKPiAgICAgICAgIFRoZSBtZW1vcnkgYXJlYXMgb2J0YWluZWQgd2l0aCBt
bWFwKDIpIGZyb20gdGhlIGZpbGUgZGVzY3JpcHRvciBhcmUgZXjigJAKPiAgICAgICAgIGNsdXNp
dmUgdG8gdGhlIG93bmluZyBjb250ZXh0LiAgVGhlc2UgYXJlYXMgYXJlIHJlbW92ZWQgZnJvbSB0
aGUga2VybmVsCj4gICAgICAgICBwYWdlIHRhYmxlcyBhbmQgb25seSB0aGUgcGFnZSB0YWJsZSBv
ZiB0aGUgcHJvY2VzcyBob2xkaW5nIHRoZSBmaWxlIGRl4oCQCj4gICAgICAgICBzY3JpcHRvciBt
YXBzIHRoZSBjb3JyZXNwb25kaW5nIHBoeXNpY2FsIG1lbW9yeS4KPiAgIAoKU28gbGV0J3MgdGFs
ayBhYm91dCB0aGUgbWFpbiB1c2VyLXZpc2libGUgZGlmZmVyZW5jZXMgdG8gb3RoZXIgbWVtZmQg
CmZpbGVzIChlc3BlY2lhbGx5LCBvdGhlciBwdXJlbHkgdmlydHVhbCBmaWxlcyBsaWtlIGh1Z2V0
bGJmcykuIFdpdGggCnNlY3JldG1lbToKCi0gRmlsZSBjb250ZW50IGNhbiBvbmx5IGJlIHJlYWQv
d3JpdHRlbiB2aWEgbWVtb3J5IG1hcHBpbmdzLgotIEZpbGUgY29udGVudCBjYW5ub3QgYmUgc3dh
cHBlZCBvdXQuCgpJIHRoaW5rIHRoZXJlIGFyZSBzdGlsbCB2YWxpZCB3YXlzIHRvIG1vZGlmeSBm
aWxlIGNvbnRlbnQgdXNpbmcgCnN5c2NhbGxzOiBlLmcuLCBmYWxsb2NhdGUoUFVOQ0hfSE9MRSku
IFRoaW5ncyBsaWtlIHRydW5jYXRlIGFsc28gc2VlbXMgCnRvIHdvcmsganVzdCBmaW5lLgoKV2hh
dCBlbHNlPwoKCj4+IEFGQUlLUywgd2Ugd291bGQgbmVlZCBNRkRfU0VDUkVUIGFuZCBkaXNhbGxv
dwo+PiBNRkRfQUxMT1dfU0VBTElORyBhbmQgTUZEX0hVR0VUTEIuCj4gCj4gU28gaGVyZSB3ZSBz
dGFydCB0byBtdWx0aXBsZXguCgpZZXMuIEFuZCBhcyBNaWNoYWwgc2FpZCwgbWF5YmUgd2UgY2Fu
IHN1cHBvcnQgY29tYmluYXRpb25zIGluIHRoZSBmdXR1cmUuCgo+IAo+PiBJbiBhZGRpdGlvbiwg
d2UgY291bGQgYWRkIE1GRF9TRUNSRVRfTkVWRVJfTUFQLCB3aGljaCBjb3VsZCBkaXNhbGxvdyBh
bnkga2luZCBvZgo+PiB0ZW1wb3JhcnkgbWFwcGluZ3MgKGVvciBtaWdyYXRpb24pLiBUQkMuCj4g
Cj4gTmV2ZXIgbWFwIGlzIHRoZSBkZWZhdWx0LiBXaGVuIHdlJ2xsIG5lZWQgdG8gbWFwIHdlJ2xs
IGFkZCBhbiBleHBsaWNpdCBmbGFnCj4gZm9yIGl0LgoKTm8gc3Ryb25nIG9waW5pb24uIChJJ2Qg
dHJ5IHRvIGh1cnQgdGhlIGtlcm5lbCBsZXNzIGFzIGRlZmF1bHQpCgotLSAKVGhhbmtzLAoKRGF2
aWQgLyBkaGlsZGVuYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
