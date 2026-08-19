Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731D1C5DF6D
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 05:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MCQVD8MDSGh1uCh23lf3EttOvDtuefjQiAZUvMonHQg=; b=U+zp73dL06mJDb
	JtC0DgSIkuWNV+8hsjwsEYE5MMQCJqWWwEI9tjqn+vmZFagvzrrPK/2PhEC7jr6Tp6KwxLd8pxbdo
	2tRUWadM1ttK/8vlRm2Sa5xnQqO88wCcEhR5gd3m/8+eWI4RaQ/2klwzP5H6SXsz71CK3/xm7p3tm
	ZDlZpTpnXcFfJu2TZf2MAC2R/pz2W4NBHOEyCgJ2OE3vldoSbArAaGjwQyn9AVj7ZbdjzTv7YNTo4
	OMQIPan9CZj2XzlTNxwTuTy4ZGaCSQoMw2iAHJ+9opCu+FdUaZDGzfEBOIsf6u+puUdYFtPZ87eRk
	8LkaX6YLk/mKiREjeCjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwZJr-000000093QP-2VVd;
	Wed, 19 Aug 2026 05:58:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwZJn-000000093P8-2ACC
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 05:58:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787119110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3wN405h1WvQQ42J9aP5itCeH3PDbeYvXDW/m8ee+hMM=;
	b=Q1fga5FakXmsDticrGAMGocmEaDfpNBM+mAXv3RhD023ONrbOp+u73J7xp8bGwkbSxZ9lL
	wKhwPKwZvN+zl71c+2+ELDPY43aZDjqoq5ug31wScSWwOVM4MfTo6bAGxBGd8lctWQk17u
	tAd81o7v64bf5m8bPieHME16c2m/QvI=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-J-XMMUiBOeei0cOHSodtmQ-1; Wed, 19 Aug 2026 01:58:23 -0400
X-MC-Unique: J-XMMUiBOeei0cOHSodtmQ-1
X-Mimecast-MFC-AGG-ID: J-XMMUiBOeei0cOHSodtmQ_1787119102
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cccfa32670so11555475ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Aug 2026 22:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787119102; x=1787723902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wN405h1WvQQ42J9aP5itCeH3PDbeYvXDW/m8ee+hMM=;
        b=FuaH5Hq1kdgOlNV+iypQyWK5A+U06Nb8HddhxEad3/9iGbbjACqmcKmIP5SC6wVZQJ
         Ycm4tFEv2NMkFSyZHccKIL8KnM0vLEJ8JNSqzsE+X+4IA5Wjs3HE5tMFHeLJYTjdOiV8
         U6A4lylcU1zvp9fQPmyr2PbPGLqpu/ZdPv5MpmBrrSi0vOEEqvBds/wBpoS7f//c51Fq
         v17KfTPgd4Ith3PNwU74NOt60vKxA7+cnmqqblSASxyaPY5hOUzYUpjkZkk7Mx3vhVSQ
         cyNyKjzGuOpEPyzp12ckI70jWIcy4KON3BLzeK5VjC1G0WPFI3VyPwHH175RkrIo+VUo
         P8Fg==
X-Forwarded-Encrypted: i=1; AHgh+RqEfK3P4hgBrNycjqBJ9IqkTe9HOvFCwsERRlusxg3pfWaLm7fTU2yBEC28CaY6NHGEU+NI7C12+aDPog==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCijB3ZC6aqJR+p8KiSxINXxoy/UXsDTEzjm0C4qjCMQrqSV7r
	NyZfYAfNYKB9WV30o1j+R4jD8QccM7wJ389si1bCfodFLDe/4U3OlsY5sAbZhg6bkLLZcIuDjNn
	boja4SW2Xuv2I4B3tAmMOWu8bwGenvZd6LD9Gpc9Y2mLZO5ZWgWNuMSWus2fuS07f/sh0Ug==
X-Gm-Gg: AR+sD10jAgi8m8TlWrSHO3k6Mxn1tEQmCojyc0gZKjLn03sfDG4pmptKjcj8ypS97SX
	sWABZtO/xD/71xu4BMvspF79m6BvUBw4EPE6T+zcke+LLcy4rxcSK48Xq/sp+cp3xJWF2TzD2Xb
	k5ydlezNLJddJqq6qdDvY2b8HA1mXlKs1gni1C2Yoyui5HGFga0U1GJ/zVotBx1wRRj4y2I5svD
	/D/u2AlQq68tG/AXnHid7DZnVUHxq7zncccqQ6AArFU1FPazXCFDL9oVlfJcQRj5ZzJnaGAymQ6
	rSilB+JMKLZtWmNhB5AAgt3eo6VS7S7OZQho8PWOx1svXnAq5oDe8FAoYYLk23crm8JoK6ql3b0
	VZtBOJpCT0Jjk7TIah9Bx
X-Received: by 2002:a17:902:fd87:b0:2cb:ea0b:9164 with SMTP id d9443c01a7336-2d5fd6b0aebmr41700135ad.6.1787119101996;
        Tue, 18 Aug 2026 22:58:21 -0700 (PDT)
X-Received: by 2002:a17:902:fd87:b0:2cb:ea0b:9164 with SMTP id d9443c01a7336-2d5fd6b0aebmr41699365ad.6.1787119101427;
        Tue, 18 Aug 2026 22:58:21 -0700 (PDT)
Received: from [10.76.99.122] ([115.110.236.142])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e5506asm20846515ad.43.2026.08.18.22.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 22:58:20 -0700 (PDT)
Message-ID: <0d7acb43-2eb4-44ec-9bfb-b89440afc605@redhat.com>
Date: Wed, 19 Aug 2026 11:28:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kexec: return -ENOEXEC from image probe functions on
 mismatch
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Tao Liu <ltao@redhat.com>,
 Philipp Rudo <prudo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org
References: <20260813-mpilaniy-v1-1-777d4d0e30f7@redhat.com>
 <2vxzv79c23j6.fsf@kernel.org>
 <9cbe111c-ff63-4f24-b518-094ddd7cea30@redhat.com>
 <2vxzbjaz2269.fsf@kernel.org>
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <2vxzbjaz2269.fsf@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mQhz8QbqPjpdloKgIsggWoMNKF_zbjZz-vKrjb_B8u0_1787119102
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_225831_655106_1C635C5C 
X-CRM114-Status: GOOD (  45.24  )
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

SGkgUHJhdHl1c2gsCgpPbiAxOC8wOC8yNiAzOjE0IHBtLCBQcmF0eXVzaCBZYWRhdiB3cm90ZToK
PiBPbiBGcmksIEF1ZyAxNCAyMDI2LCBNdWtlc2ggUGlsYW5peWEgd3JvdGU6Cj4gCj4+IEhpIFBy
YXR5dXNoLAo+PiBPbiAxNC8wOC8yNiA3OjQzIHBtLCBQcmF0eXVzaCBZYWRhdiB3cm90ZToKPj4+
IE9uIFRodSwgQXVnIDEzIDIwMjYsIE11a2VzaCBQaWxhbml5YSB3cm90ZToKPj4+Cj4+Pj4gU2V2
ZXJhbCBrZXhlY19maWxlX2xvYWQoKSBpbWFnZSBwcm9iZSBmdW5jdGlvbnMgcmV0dXJuIC1FSU5W
QUwgd2hlbgo+Pj4+IHRoZXkgZG8gbm90IHJlY29nbml6ZSB0aGUgaW1hZ2UgZm9ybWF0LiAgQSBw
cm9iZSBmdW5jdGlvbiB0aGF0IHJlamVjdHMKPj4+PiBhbiBpbWFnZSBzaG91bGQgcmV0dXJuIC1F
Tk9FWEVDIHRvIGluZGljYXRlIHRoYXQgdGhlIGltYWdlIGlzIG5vdCBhCj4+Pj4gcmVjb2duaXpl
ZCBleGVjdXRhYmxlIGZvcm1hdC4gIC1FSU5WQUwgaW1wbGllcyBhIHByb2JsZW0gd2l0aCB0aGUK
Pj4+PiBzeXNjYWxsIHBhcmFtZXRlcnMsIG5vdCB3aXRoIGltYWdlIHJlY29nbml0aW9uLgo+Pj4+
Cj4+Pj4ga2V4ZWNfaW1hZ2VfcHJvYmVfZGVmYXVsdCgpIGl0ZXJhdGVzIHRocm91Z2ggcmVnaXN0
ZXJlZCBsb2FkZXJzIGFuZAo+Pj4+IHJldHVybnMgdGhlIGxhc3QgcHJvYmUncyBlcnJvciBjb2Rl
IHRvIHRoZSBjYWxsZXIuICBUaGF0IGVycm9yCj4+Pj4gcHJvcGFnYXRlcyBhcyB0aGUga2V4ZWNf
ZmlsZV9sb2FkKCkgcmV0dXJuIHZhbHVlIHRvIHVzZXJzcGFjZS4KPj4+PiBSZXR1cm5pbmcgLUVJ
TlZBTCBmcm9tIGEgcHJvYmUgd2hlbiBubyBsb2FkZXIgbWF0Y2hlcyBpcyBzZW1hbnRpY2FsbHkK
Pj4+PiBpbmNvcnJlY3QgYW5kIG1pc2xlYWRzIHVzZXJzcGFjZSBhYm91dCB0aGUgbmF0dXJlIG9m
IHRoZSBmYWlsdXJlLgo+Pj4+Cj4+Pj4gUmV0dXJuIC1FTk9FWEVDIGZyb20gYWxsIHByb2JlIGZ1
bmN0aW9ucyBhbmQgdGhlaXIgaGVscGVycyB3aGVuIHRoZQo+Pj4+IGltYWdlIGZvcm1hdCBpcyBu
b3QgcmVjb2duaXplZC4KPj4+Cj4+PiBTb3VuZHMgZmluZSBpbiBwcmluY2lwbGUgYnV0IGNhbiB5
b3UgcGxlYXNlIGFsc28gc2hhcmUgd2hhdCB0aGUgcmVhbAo+Pj4gcHJvYmxlbSB5b3UgZmFjZSBp
cyBhbmQgaG93IGNoYW5naW5nIHRoZXNlIHJldHVybiBjb2RlcyBoZWxwcz8gVGhlc2UKPj4+IGVy
cm9yIGNvZGVzIGFyZSB1QVBJIGFuZCB3aGlsZSB3ZSBfY2FuXyBjaGFuZ2UgdGhlbSBhcyBsb25n
IGFzIHdlIGRvbid0Cj4+PiBicmVhayBzb21ldGhpbmcsIHRoZXJlIHNob3VsZCBiZSBhIGNsZWFy
IG1vdGl2YXRpb24gZm9yIGRvaW5nIHNvLgo+Pj4KPj4+IFsuLi5dCj4+Pgo+PiBXaGlsZSBkZWJ1
Z2dpbmcgYSBtaXNsZWFkaW5nIGVycm9yIG9uIHMzOTB4IHdoZXJlIGtleGVjIC1zIHJlcG9ydGVk
Cj4+ICJzeXNjYWxsIGtleGVjX2ZpbGVfbG9hZCBub3QgYXZhaWxhYmxlIiBpbnN0ZWFkIG9mIHRo
ZSBhY3R1YWwgRUlOVkFMCj4+IGZyb20gYSBrZXJuZWwgY29tbWFuZCBsaW5lIHRoYXQgZXhjZWVk
ZWQgdGhlIGFyY2hpdGVjdHVyZSBsaW1pdCwgd2UKPj4gdHJhY2VkIHRoZSBwcm9ibGVtIHRvIHRo
ZSBrZXhlYy10b29scyB1c2Vyc3BhY2UgdXRpbGl0eSB0cmVhdGluZwo+PiBFSU5WQUwgdGhlIHNh
bWUgYXMgRU5PU1lTIGFuZCBFTk9FWEVDIC0tIGFzIGEgc2lnbmFsIHRvIHNpbGVudGx5IGZhbGwK
Pj4gYmFjayB0byBrZXhlY19sb2FkKCkuCj4+Cj4+IGtleGVjLXRvb2xzIHN1cHBvcnRzIHR3byBz
eXNjYWxsczoga2V4ZWNfZmlsZV9sb2FkKCkgYW5kIHRoZSBvbGRlcgo+PiBrZXhlY19sb2FkKCku
IFdpdGggLWEgKHRoZSBkZWZhdWx0KSwgaXQgdHJpZXMga2V4ZWNfZmlsZV9sb2FkKCkKPj4gZmly
c3QgYW5kIGZhbGxzIGJhY2sgdG8ga2V4ZWNfbG9hZCgpIHdoZW4gdGhlIHN5c2NhbGwgaXMgbm90
Cj4+IGltcGxlbWVudGVkIChFTk9TWVMpIG9yIHRoZSBrZXJuZWwgZG9lcyBub3QgaGF2ZSBhIGxv
YWRlciBmb3IgdGhlCj4+IGltYWdlIGZvcm1hdC4gV2l0aCAtcywgaXQgdXNlcyBrZXhlY19maWxl
X2xvYWQoKSBvbmx5IHdpdGggbm8KPj4gZmFsbGJhY2suCj4+Cj4+IFdoZW4gdGhlIGtlcm5lbCBy
ZXR1cm5zIC1FSU5WQUwgaXQgbWVhbnMgc29tZXRoaW5nIHdlbnQgd3Jvbmcgd2hpbGUKPj4gbG9h
ZGluZyB0aGUgaW1hZ2UsIG5vdCB0aGF0IHRoZSBzeXNjYWxsIGlzIG1pc3Npbmcgb3IgdGhlIGlt
YWdlCj4+IGZvcm1hdCBpcyB1bnJlY29nbml6ZWQuIGtleGVjLXRvb2xzIHNob3VsZCBub3QgZmFs
bCBiYWNrIHRvIHRoZQo+PiBvbGRlciBzeXNjYWxsIGluIHRoYXQgY2FzZS4gSG93ZXZlciwgc29t
ZSBrZXJuZWwgcHJvYmUgZnVuY3Rpb25zCj4+IGN1cnJlbnRseSByZXR1cm4gLUVJTlZBTCB3aGVu
IHRoZSBpbWFnZSBoZWFkZXIgZG9lcyBub3QgbWF0Y2gsCj4+IGluc3RlYWQgb2YgcmV0dXJuaW5n
IC1FTk9FWEVDLiBLZWVwaW5nIEVJTlZBTCBpbiB0aGUgZmFsbGJhY2sgc2V0Cj4+IHRvIGFjY29t
bW9kYXRlIHRoZXNlIHByb2JlcyBoYXMgdGhlIHNpZGUgZWZmZWN0IG9mIGFsc28gaGlkaW5nCj4+
IGdlbnVpbmUgbG9hZGluZyBlcnJvcnMgbGlrZSBhbiBvdmVyc2l6ZWQgY29tbWFuZCBsaW5lLgo+
Pgo+PiBrZXhlYy10b29scyBzaG91bGQgb25seSBmYWxsIGJhY2sgd2hlbiBrZXhlY19maWxlX2xv
YWQoKSBpcyBub3QKPj4gaW1wbGVtZW50ZWQgb3IgZG9lcyBub3QgaGF2ZSBhIG1hdGNoaW5nIGxv
YWRlciAtLSBub3Qgd2hlbiBzb21ldGhpbmcKPj4gZ29lcyB3cm9uZyBkdXJpbmcgbG9hZC4KPj4K
Pj4gVGhlIGZpeCBvbiB0aGUga2V4ZWMtdG9vbHMgc2lkZSBpcyB0byByZW1vdmUgRUlOVkFMIGZy
b20gdGhlIGZhbGxiYWNrCj4+IHNldCwgYnV0IHRoYXQgcmVxdWlyZXMgdGhlIGtlcm5lbCB0byBi
ZSBjbGVhbiBmaXJzdCAtLSBwcm9iZSBmdW5jdGlvbnMKPj4gbXVzdCByZXR1cm4gLUVOT0VYRUMg
d2hlbiB0aGV5IGRvIG5vdCByZWNvZ25pemUgYW4gaW1hZ2UgZm9ybWF0LCBub3QgLUVJTlZBTC4K
PiAKPiBPa2F5LCB0aGUgaWRlYSBtYWtlcyBzZW5zZS4gVGhvdWdoIEkgYW0gY3VyaW91cyBpZiBp
biBwcmFjdGljZSB0aGVyZSBhcmUKPiBpbWFnZXMgdGhhdCBrZXhlY19maWxlX2xvYWQoKSBjYW4n
dCBsb2FkIGJ1dCBrZXhlYy10b29scyBjYW4uCj4gCj4gQnV0IHRoZW4gSSB3ZW50IGFuZCBsb29r
ZWQgYXQgdGhlIGNvZGUuIFRoZSBvbmx5IGNhbGxlciBvZiB0aGUgcHJvYmUKPiBmdW5jdGlvbnMg
SSBjYW4gc2VlIGlzIGtleGVjX2ltYWdlX3Byb2JlX2RlZmF1bHQoKS4gTG9va2luZyBhdCBpdHMg
Y29kZToKPiAKPiAgIGludCBrZXhlY19pbWFnZV9wcm9iZV9kZWZhdWx0KHN0cnVjdCBraW1hZ2Ug
KmltYWdlLCB2b2lkICpidWYsCj4gICAJCQkgICAgICB1bnNpZ25lZCBsb25nIGJ1Zl9sZW4pCj4g
ICB7Cj4gICAJY29uc3Qgc3RydWN0IGtleGVjX2ZpbGVfb3BzICogY29uc3QgKmZvcHM7Cj4gICAJ
aW50IHJldCA9IC1FTk9FWEVDOwo+ICAgCj4gICAJZm9yIChmb3BzID0gJmtleGVjX2ZpbGVfbG9h
ZGVyc1swXTsgKmZvcHMgJiYgKCpmb3BzKS0+cHJvYmU7ICsrZm9wcykgewo+ICAgCQlyZXQgPSAo
KmZvcHMpLT5wcm9iZShidWYsIGJ1Zl9sZW4pOwo+ICAgCQlpZiAoIXJldCkgewo+ICAgCQkJaW1h
Z2UtPmZvcHMgPSAqZm9wczsKPiAgIAkJCXJldHVybiByZXQ7Cj4gICAJCX0KPiAgIAl9Cj4gICAK
PiAgIAlyZXR1cm4gcmV0Owo+ICAgfQo+IAo+IEl0IGRlZmF1bHRzIHJldCB0byAtRU5PRVhFQywg
d2hpY2ggbWFrZXMgc2Vuc2UsIGJ1dCB0aGVuIGxldHMgaXQgYmUKPiBvdmVyLXdyaXR0ZW4gYnkg
ZWFjaCBsb2FkZXIuIFNvIGluIHByYWN0aWNlLCBpdCByZXR1cm5zIHdoYXQgdGhlIF9sYXN0Xwo+
IGxvYWRlciByZXR1cm5lZC4gX1RoaXNfIG1ha2VzIG5vIHNlbnNlLiBXaHkgc2hvdWxkIHRoZSBs
YXN0IGxvYWRlciBiZQo+IGFueSBzcGVjaWFsPwpSaWdodCwgdGhlIGxhc3QgbG9hZGVyIG92ZXJ3
cml0aW5nIHJldCwgdGhlIGNvbW1pdCBtZXNzYWdlIGRlc2NyaWJlcwp0aGlzIGFzIHdlbGwuIEl0
IG1ha2VzIG5vIHNlbnNlIGZvciB0aGUgcmV0dXJuIHZhbHVlIHRvIGRlcGVuZCBvbgp3aGljaGV2
ZXIgbG9hZGVyIGhhcHBlbnMgdG8gYmUgbGFzdCBpbiB0aGUgYXJyYXkuCgo+IAo+IEZyb20gcmVh
ZGluZyB0aGUgY29kZSwgSSB0aGluayB3aGF0IHRoZSBhdXRob3Igb2YgdGhpcyB3YW50ZWQgdG8g
ZG8gaXMKPiB0byB0cnkgYWxsIGxvYWRlcnMsIGFuZCByZXR1cm4gLUVOT0VYRUMgaWYgbm9uZSBz
dWNjZWVkZWQuIEJ1dCB0aGUgY29kZQo+IG9mIGNvdXJzZSBzdHJheXMgZnJvbSB0aGF0IGFuZCBl
bmRzIHVwIHJldHVybmluZyB0aGUgbGFzdCBsb2FkZXIncwo+IHZhbHVlLklNSE8gdGhlIGZ1bmN0
aW9uIHNob3VsZCBvbmx5IHRyeSB0aGUgbmV4dCBsb2FkZXIgd2hlbiBhIHByb2JlIHJldHVybnMK
LUVOT0VYRUMsIG5vdCBmb3IgYW55IG90aGVyIGVycm9yIGxpa2UgLUVOT01FTSwgd2hpY2ggaXMg
YSByZWFsIGZhaWx1cmUKYW5kIHNob3VsZCBiZSBwcm9wYWdhdGVkIGltbWVkaWF0ZWx5LCBub3Qg
c2lsZW50bHkgZGlzY2FyZGVkLgoKPiAKPiBTbyBob3cgYWJvdXQgdGhlIGJlbG93IGRpZmYgaW5z
dGVhZD8gKCoqIG9ubHkgY29tcGlsZSB0ZXN0ZWQgKiopCj4gCj4gLS0tIDg8IC0tLQo+IGRpZmYg
LS1naXQgYS9rZXJuZWwva2V4ZWNfZmlsZS5jIGIva2VybmVsL2tleGVjX2ZpbGUuYwo+IGluZGV4
IDJiZmJiMmQxNDRlNi4uY2ZiMmI4Y2Q1Njc5IDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9rZXhlY19m
aWxlLmMKPiArKysgYi9rZXJuZWwva2V4ZWNfZmlsZS5jCj4gQEAgLTY3LDE3ICs2NywxNiBAQCBp
bnQga2V4ZWNfaW1hZ2VfcHJvYmVfZGVmYXVsdChzdHJ1Y3Qga2ltYWdlICppbWFnZSwgdm9pZCAq
YnVmLAo+ICAJCQkgICAgICB1bnNpZ25lZCBsb25nIGJ1Zl9sZW4pCj4gIHsKPiAgCWNvbnN0IHN0
cnVjdCBrZXhlY19maWxlX29wcyAqIGNvbnN0ICpmb3BzOwo+IC0JaW50IHJldCA9IC1FTk9FWEVD
Owo+ICAKPiAgCWZvciAoZm9wcyA9ICZrZXhlY19maWxlX2xvYWRlcnNbMF07ICpmb3BzICYmICgq
Zm9wcyktPnByb2JlOyArK2ZvcHMpIHsKPiAtCQlyZXQgPSAoKmZvcHMpLT5wcm9iZShidWYsIGJ1
Zl9sZW4pOwo+IC0JCWlmICghcmV0KSB7Cj4gKwkJaWYgKCEoKmZvcHMpLT5wcm9iZShidWYsIGJ1
Zl9sZW4pKSB7Cj4gIAkJCWltYWdlLT5mb3BzID0gKmZvcHM7Cj4gLQkJCXJldHVybiByZXQ7Cj4g
KwkJCXJldHVybiAwOwo+ICAJCX0KPiAgCX0KPiAgCj4gLQlyZXR1cm4gcmV0Owo+ICsJLyogTm8g
bG9hZGVyIGZvdW5kLiAqLwo+ICsJcmV0dXJuIC1FTk9FWEVDOwo+ICB9Ck5pY2UgY2F0Y2gsIFBy
YXR5dXNoIGJ1dCB0aGlzIGRpc2NhcmRzIGFsbCBub24temVybyByZXR1cm4gdmFsdWVzIGZyb20K
cHJvYmUgZnVuY3Rpb25zLCB3aGljaCBtZWFucyByZWFsIGVycm9ycyBnZXQgc3dhbGxvd2VkLiBG
b3IgZXhhbXBsZSwKa2V4ZWNfZWxmX3Byb2JlKCkgY2FuIHJldHVybiAtRU5PTUVNIHdoZW4ga3ph
bGxvYygpIGZhaWxzIGluCmVsZl9yZWFkX3BoZHJzKCkuIFdpdGggdGhpcyBkaWZmLCB0aGF0IC1F
Tk9NRU0gYmVjb21lcyAtRU5PRVhFQywgd2hpY2gKdGVsbHMgdXNlcnNwYWNlICJubyBsb2FkZXIg
Zm91bmQiIHdoZW4gdGhlIGFjdHVhbCBwcm9ibGVtIHdhcyBhIG1lbW9yeQphbGxvY2F0aW9uIGZh
aWx1cmUuCgo+ICAKPiAgc3RhdGljIHZvaWQgKmtleGVjX2ltYWdlX2xvYWRfZGVmYXVsdChzdHJ1
Y3Qga2ltYWdlICppbWFnZSkKPiAKSG93IGFib3V0IHRoZSBmb2xsb3dpbmcgaW5zdGVhZD8gSXQg
a2VlcHMgdGhlIHByb2JlIHJldHVybiB2YWx1ZSBhbmQKZGlzdGluZ3Vpc2hlcyAtRU5PRVhFQyAo
Zm9ybWF0IG5vdCByZWNvZ25pemVkLCB0cnkgbmV4dCBsb2FkZXIpIGZyb20gYW55Cm90aGVyIGVy
cm9yIChyZWFsIGZhaWx1cmUsIHByb3BhZ2F0ZSBpbW1lZGlhdGVseSk6Cu+7vwpkaWZmIC0tZ2l0
IGEva2VybmVsL2tleGVjX2ZpbGUuYyBiL2tlcm5lbC9rZXhlY19maWxlLmMKaW5kZXggNTlmYjlk
NzFlOWQ4Li5jZWI1Yzk3Y2VkYWMgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9rZXhlY19maWxlLmMKKysr
IGIva2VybmVsL2tleGVjX2ZpbGUuYwpAQCAtNjgsMTcgKzY4LDE5IEBAIGludCBrZXhlY19pbWFn
ZV9wcm9iZV9kZWZhdWx0KHN0cnVjdCBraW1hZ2UgKmltYWdlLAp2b2lkICpidWYsCiAJCQkgICAg
ICB1bnNpZ25lZCBsb25nIGJ1Zl9sZW4pCiB7CiAJY29uc3Qgc3RydWN0IGtleGVjX2ZpbGVfb3Bz
ICogY29uc3QgKmZvcHM7Ci0JaW50IHJldCA9IC1FTk9FWEVDOworCWludCByZXQ7CgogCWZvciAo
Zm9wcyA9ICZrZXhlY19maWxlX2xvYWRlcnNbMF07ICpmb3BzICYmICgqZm9wcyktPnByb2JlOyAr
K2ZvcHMpIHsKIAkJcmV0ID0gKCpmb3BzKS0+cHJvYmUoYnVmLCBidWZfbGVuKTsKLQkJaWYgKCFy
ZXQpIHsKKwkJaWYgKHJldCA9PSAwKSB7CiAJCQlpbWFnZS0+Zm9wcyA9ICpmb3BzOwotCQkJcmV0
dXJuIHJldDsKKwkJCXJldHVybiAwOwogCQl9CisJCWlmIChyZXQgIT0gLUVOT0VYRUMpCisJCQly
ZXR1cm4gcmV0OwogCX0KCi0JcmV0dXJuIHJldDsKKwlyZXR1cm4gLUVOT0VYRUM7CiB9Cgogc3Rh
dGljIHZvaWQgKmtleGVjX2ltYWdlX2xvYWRfZGVmYXVsdChzdHJ1Y3Qga2ltYWdlICppbWFnZSkK
CgpUaGlzIHJlcXVpcmVzIHByb2JlIGZ1bmN0aW9ucyB0byByZXR1cm4gLUVOT0VYRUMgZnJvbSBm
aXhlcyBpbiBwYXRjaCAxLgpJIHdpbGwgYWRkIHRoaXMgYXMgYSBzZXBhcmF0ZSBwYXRjaCBvbiB0
b3AgaW4gdjIuCgpEb2VzIHRoaXMgbG9va3MgZ29vZCB0byB5b3UgPwoKLS0KUmVnYXJkcywKTXVr
ZXNoIFBpbGFuaXlhCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
