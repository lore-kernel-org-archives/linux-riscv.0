Return-Path: <SRS0=+l7Y=HK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06977C433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 21:46:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C81464EA4
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 21:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C81464EA4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:Date:Subject:
	Mime-Version:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S99ihfQoTIA6C9JLifp/7r3j9Fulm9XkVDXJcIfF3lE=; b=aNqzKn63NwoLdWPwwKt2/eK0q
	vXIEvTGr8KIrDO4wBelaMwm3U1aZ+vGuZUB/2KM5q5J9va6l0ELOEt+93yJHMN/FN+hZY+8LX8Jcw
	F5qTwV7etWR+7tMAKqT2Rc33LKmrGgx1FLiyaZgh/yrZ5y/bdY2MZU+7TJ1zVvMb6T0ZpAZLOZtnJ
	4SfDXIWJX/54MtsVgYveebQ3O2ogCVLerCz5dezAfMaQxZ2pl+mdH11NxN3uqASbGXhaHhlAnOBX8
	an+SKF6GnxnugWAN8XLxAo+pAe1ugYhNhg5BquPxScskDK/3TJ0hgECyPdxbmcHVrvEO/KkgvsO2+
	/w0lWngtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9EMJ-00038g-Q6; Mon, 08 Feb 2021 21:46:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9EMG-00038J-Iw
 for linux-riscv@lists.infradead.org; Mon, 08 Feb 2021 21:46:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612820772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2rpEa4PXmR1i2BkerHYaYcliPU1ybbsCKViRbwN9DgE=;
 b=S1xhYyIqqqXzi418ptMOpd4lCtdoXC3j9qXqCgfBpcjZL8JlYRM7tJcOOweemirsg2syf9
 QRPOwRtd3Z+MVONB3nwa/VLPSxaX4b8HDgznIhS33ntAc6VBrDcfPNLHy3lrW3iOtIDv2b
 3cMj+QC7vdyEp3EdwuEUkp8ld2H8wJQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-py5T_OyJNYa4eqnM8AYvvQ-1; Mon, 08 Feb 2021 16:46:10 -0500
X-MC-Unique: py5T_OyJNYa4eqnM8AYvvQ-1
Received: by mail-wr1-f71.google.com with SMTP id d7so14279619wri.23
 for <linux-riscv@lists.infradead.org>; Mon, 08 Feb 2021 13:46:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=4aepynJlknVRj6NFbhX2n2ebQXb/zj5Dsa2tNMP+Ofs=;
 b=VyiKsf6zK8v+9WcrqZd+1hLTw53T8Wv8pKLUUn6/5JxB2hZ0ORCC0YNzSsyJVjHzsB
 Job5P72+vbtuK68+jf7GGFAxHwDN8clmbwykOW86xGiNodVD60C3/gTH74KZhPklAmgS
 T6IpDHnT+cftHg+sVoOf/EOs/0Osw0GMoECXIZ7ZOLvsaBoupaFctHXlB6TqImAhNPJe
 p3Pd2D1S6ORC92u8u1dMsRi/oj5NlBAuY9SFWxk7gA6TogyUA/PqMseTnIym3nivtdUM
 gHZqNmkcjQJ5NUZJmUL5TtXnYI6lXEjKzBtrxrPP9tqq76pWQbRtEDoDjBy4TllpN8qx
 zpPQ==
X-Gm-Message-State: AOAM53318nrfqWmhcXRbQEf+0vtQv/7oGJf50k7W8otmGTry7Q9/m5zV
 NrazAmxKZHU8MI8TrQUq4gAjsXqvvfQqMeKN8BqJIREUlFBNEhDcWWeqg4Ub2HXaVWhqJgP98Kf
 zacN4wY3B2967c0tvp+rOLWjOby/Y
X-Received: by 2002:adf:ea12:: with SMTP id q18mr8490776wrm.79.1612820769107; 
 Mon, 08 Feb 2021 13:46:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYU+ahfuGJ3mGlPDTjZ5sBTd5prIK5bha/7jxkj2wK46UMNjmdy8O20OWQnrZzKp7lrPlvQQ==
X-Received: by 2002:a5d:4ac5:: with SMTP id y5mr589823wrs.345.1612820285413;
 Mon, 08 Feb 2021 13:38:05 -0800 (PST)
Received: from [192.168.3.108] (p5b0c696d.dip0.t-ipconnect.de. [91.12.105.109])
 by smtp.gmail.com with ESMTPSA id w15sm30039179wrp.15.2021.02.08.13.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 13:38:04 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v17 00/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Date: Mon, 8 Feb 2021 22:38:03 +0100
Message-Id: <1F6A73CF-158A-4261-AA6C-1F5C77F4F326@redhat.com>
References: <20210208211326.GV242749@kernel.org>
In-Reply-To: <20210208211326.GV242749@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
X-Mailer: iPhone Mail (18D52)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_164612_735467_CDDFA57C 
X-CRM114-Status: GOOD (  14.68  )
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
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
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
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Cj4gQW0gMDguMDIuMjAyMSB1bSAyMjoxMyBzY2hyaWViIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz46Cj4gCj4g77u/T24gTW9uLCBGZWIgMDgsIDIwMjEgYXQgMTA6Mjc6MThBTSArMDEw
MCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+IE9uIDA4LjAyLjIxIDA5OjQ5LCBNaWtlIFJh
cG9wb3J0IHdyb3RlOgo+PiAKPj4gU29tZSBxdWVzdGlvbnMgKGFuZCByZXF1ZXN0IHRvIGRvY3Vt
ZW50IHRoZSBhbnN3ZXJzKSBhcyB3ZSBub3cgYWxsb3cgdG8gaGF2ZQo+PiB1bm1vdmFibGUgYWxs
b2NhdGlvbnMgYWxsIG92ZXIgdGhlIHBsYWNlIGFuZCBJIGRvbid0IHNlZSBhIHNpbmdsZSBjb21t
ZW50Cj4+IHJlZ2FyZGluZyB0aGF0IGluIHRoZSBjb3ZlciBsZXR0ZXI6Cj4+IAo+PiAxLiBIb3cg
d2lsbCB0aGUgaXNzdWUgb2YgcGxlbnR5IG9mIHVubW92YWJsZSBhbGxvY2F0aW9ucyBmb3IgdXNl
ciBzcGFjZSBiZQo+PiB0YWNrbGVkIGluIHRoZSBmdXR1cmU/Cj4+IAo+PiAyLiBIb3cgaGFzIHRo
aXMgaXNzdWUgYmVlbiBkb2N1bWVudGVkPyBFLmcuLCBpbnRlcmFjdGlvbiB3aXRoIFpPTkVfTU9W
QUJMRQo+PiBhbmQgQ01BLCBhbGxvY19jb25pZ19yYW5nZSgpL2FsbG9jX2NvbnRpZ19wYWdlcz8u
Cj4gCj4gU2VjcmV0bWVtIHNldHMgdGhlIG1hcHBpbmdzIGdmcCBtYXNrIHRvIEdGUF9ISUdIVVNF
Uiwgc28gaXQgZG9lcyBub3QKPiBhbGxvY2F0ZSBtb3ZhYmxlIHBhZ2VzIGF0IHRoZSBmaXJzdCBw
bGFjZS4KClRoYXQgaXMgbm90IHRoZSBwb2ludC4gU2VjcmV0bWVtIGNhbm5vdCBnbyBvbiBDTUEg
LyBaT05FX01PVkFCTEUgbWVtb3J5IGFuZCBiZWhhdmVzIGxpa2UgbG9uZy10ZXJtIHBpbm5pbmdz
IGluIHRoYXQgc2Vuc2UuIFRoaXMgaXMgYSByZWFsIGlzc3VlIHdoZW4gdXNpbmcgYSBsb3Qgb2Yg
c2VjdHJlbWVtLgoKUGxlYXNlIGhhdmUgYSBsb29rIGF0IHdoYXQgUGF2ZWwgZG9jdW1lbnRzIHJl
Z2FyZGluZyBsb25nIHRlcm0gcGlubmluZ3MgYW5kIFpPTkVfTU9WQUJMRSBpbiBoaXMgcGF0Y2hl
cyBjdXJyZW50bHkgb24gdGhlIGxpc3QuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
