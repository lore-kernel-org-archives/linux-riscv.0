Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1B7C52D71
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 14:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F2Ro/SCnfZCrvnRdk/bPkD/fXrLxOHk5kwzxcFRPCzU=; b=zCJFH3XuPIGe3S
	xkJ9hcKQl+3PGdHxGtfNxyplxpIIMRnsHpMyNhDLl5nD0tN3IDZUlqvbDCPaW8el6QJrCwgqVC3+Z
	vl9BvF81nHlslTS36UxIpDC7kq2ueVnAy8M4UUpfTU8dHvgFYhMhtGil9BIhDPM+paO+PMB3GvlaP
	FKUOyDPiz8rZuK5OctDbqhZ/nOOvVU2XKVXizJ9oAZDygxC0h0HiPUJH2EtOL9j+hGWrPBVWSkf98
	oqw3jolFucrtgvkMrFG9Rs3mjwVyrrZ/A4fki8l16GwAhh9WZDe/cx34fXjxBed0PvqA+b8ig0hSO
	IRG7SSPbyQQkNP0icHQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbhqW-00000005N80-44K3;
	Wed, 07 Aug 2024 14:41:00 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbhqS-00000005N56-1Hiz
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 14:40:59 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3d9e13ef8edso1137910b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 07 Aug 2024 07:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1723041655; x=1723646455; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FCSeVm0zgIRrRlVAZ6M3ezYAgjYCe4IP6mmA4qsAbw=;
        b=r9OvECrJpeqhjMTub16g/LRdW++4UlZnPLvLNFx8XTvpK3Pjo/zzR+RadFQ8SQFz7U
         HV9mXBVEvn/Ad/qx69FGXa0axXU0t6y6KJe1ARXpvc5vnMLJdWoZkq5bb9Z/6z6ugKKn
         zHLX5L6jCipX49in7hxnobxaBdX5G7zE+QRj8JW70rtXjYM6BIR0qx9V3PqHOZGE84VP
         nB3PkEh/S/O4cIDDmS7QsGBETyv1s6563H3AjZ2BlLHKomcVf5kTDu26cJ16GXvgnipW
         an3e7P/fc7XXyYfG3KNdBNF2RXqBTyBpQn9KiPi3ZYS+QLt90sm357jV+2/wYhnj5sgu
         MKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723041655; x=1723646455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FCSeVm0zgIRrRlVAZ6M3ezYAgjYCe4IP6mmA4qsAbw=;
        b=sx07Qmv53YlZ/KtwwPxYSLSCHeCyD0g333W5N1cktLJHw8s6aoThFgQc6GkUUK67/F
         2ipXvHjw65q2hMkXTsdobSr9VZfZMSVReYZLIXMQjbsCRaei0iPyfimWK4Q0yMJnRd38
         sPcoY8CMjn2Nz7AlIZa8/fib59YX1LKDnYcAkaDb7YKDGiY31Kz6gMd8e72c9qCGvrls
         HBpTomg/U+VNNXaBzfDclwetzNB5jRGueLErG1l/7RydnrT9RjSUS85Vl4tVOjmBKxg1
         v1cMoxOvWDYRgOCLgVME3WLgmYJUxRcNbg7Tpe8WUB69QruqHcu7Oo0XWvDxnXdDtkdW
         iM1A==
X-Forwarded-Encrypted: i=1; AJvYcCXctGPmk9cRr8FBqwM1Aa48Em3QNXFWuJkkz+Mfxu3LWWMz1bjM410/Ydf8x5svhKZWzeA8pfxuor5V5HRun3Tn5tWx0ZECldNdoKCsl03n
X-Gm-Message-State: AOJu0YwmUgiM9twTh6STupvMm2DR8CJXNTJWZi0A6p8DsuTgbqy4G/O6
	5mPNzRgNXKnWSBSapIVt1aA5klMsgkgoV8Xy9AA4+sDVA+e8924hTp5mvb+9TV/7q8I9dfmZxJp
	G2glXLkTb2/5eUJvliwzbZqFZusSFsLbN2p1S9A==
X-Google-Smtp-Source: AGHT+IGOXQAzEiXp6xdPGUMTTnKI09YBOs1Vk6kj0LXvCI51MvBrgaaI5JzS3LcBWq8pGTljqab9RWCOjdJxV6Tr6zo=
X-Received: by 2002:a05:6808:130f:b0:3db:251b:c16 with SMTP id
 5614622812f47-3db558397b9mr20918330b6e.42.1723041654777; Wed, 07 Aug 2024
 07:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240806221454.1971755-1-pasha.tatashin@soleen.com>
 <20240806221454.1971755-2-pasha.tatashin@soleen.com> <345ba221-e094-47e8-9481-562faf4acd85@redhat.com>
 <e780e9af-e23d-44ff-ae0f-a8f4ee098a1c@redhat.com>
In-Reply-To: <e780e9af-e23d-44ff-ae0f-a8f4ee098a1c@redhat.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 7 Aug 2024 10:40:17 -0400
Message-ID: <CA+CK2bBuDu-3XeeAsy4zggOrxTrp84bcZp9p6mQipzc3NqpcSg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm: keep nid around during hot-remove
To: David Hildenbrand <david@redhat.com>
Cc: agordeev@linux.ibm.com, akpm@linux-foundation.org, alexghiti@rivosinc.com, 
	aou@eecs.berkeley.edu, ardb@kernel.org, arnd@arndb.de, bhe@redhat.com, 
	bjorn@rivosinc.com, borntraeger@linux.ibm.com, bp@alien8.de, 
	catalin.marinas@arm.com, chenhuacai@kernel.org, chenjiahao16@huawei.com, 
	christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com, 
	dawei.li@shingroup.cn, gerald.schaefer@linux.ibm.com, gor@linux.ibm.com, 
	hca@linux.ibm.com, hpa@zytor.com, kent.overstreet@linux.dev, 
	kernel@xen0n.name, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, loongarch@lists.linux.dev, luto@kernel.org, 
	maobibo@loongson.cn, mark.rutland@arm.com, mcgrof@kernel.org, 
	mingo@redhat.com, mpe@ellerman.id.au, muchun.song@linux.dev, 
	namcao@linutronix.de, naveen@kernel.org, npiggin@gmail.com, osalvador@suse.de, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, peterz@infradead.org, 
	philmd@linaro.org, rdunlap@infradead.org, rientjes@google.com, 
	rppt@kernel.org, ryan.roberts@arm.com, souravpanda@google.com, 
	svens@linux.ibm.com, tglx@linutronix.de, tzimmermann@suse.de, will@kernel.org, 
	x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_074056_566389_5C5D9796 
X-CRM114-Status: GOOD (  20.30  )
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

T24gV2VkLCBBdWcgNywgMjAyNCBhdCA3OjUw4oCvQU0gRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlk
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gMDcuMDguMjQgMTM6MzIsIERhdmlkIEhpbGRlbmJy
YW5kIHdyb3RlOgo+ID4gT24gMDcuMDguMjQgMDA6MTQsIFBhc2hhIFRhdGFzaGluIHdyb3RlOgo+
ID4+IG5pZCBpcyBuZWVkZWQgZHVyaW5nIG1lbW9yeSBob3QtcmVtb3ZlIGluIG9yZGVyIHRvIGFj
Y291bnQgdGhlCj4gPj4gaW5mb3JtYXRpb24gYWJvdXQgdGhlIG1lbW1hcCBvdmVyaGVhZCB0aGF0
IGlzIGJlaW5nIHJlbW92ZWQuCj4gPj4KPiA+PiBJbiBhZGRpdGlvbiwgd2UgY2Fubm90IHVzZSBw
YWdlX3BnZGF0KHBmbl90b19wYWdlKHBmbikpIGR1cmluZwo+ID4+IGhvdHJlbW92ZSBhZnRlciBy
ZW1vdmVfcGZuX3JhbmdlX2Zyb21fem9uZSgpLgo+ID4+Cj4gPj4gV2UgYWxzbyBjYW5ub3QgZGV0
ZXJtaW5lIG5pZCBmcm9tIHdhbGtpbmcgdGhyb3VnaCBtZW1ibG9ja3MgYWZ0ZXIKPiA+PiByZW1v
dmVfbWVtb3J5X2Jsb2NrX2RldmljZXMoKSBpcyBjYWxsZWQuCj4gPj4KPiA+PiBUaGVyZWZvcmUs
IHBhc3MgbmlkIGRvd24gZnJvbSB0aGUgYmVnaW5uaW5nIG9mIGhvdHJlbW92ZSB0byB3aGVyZQo+
ID4+IGl0IGlzIHVzZWQgZm9yIHRoZSBhY2NvdW50aW5nIHB1cnBvc2VzLgo+ID4KPiA+IEkgd2Fz
IGhhcHB5IHRvIGZpbmFsbHkgcmVtb3ZlIHRoYXQgbmlkIHBhcmFtZXRlciBmb3IgZ29vZCBpbjoK
PiA+Cj4gPiBjb21taXQgNjVhMmFhNWY0ODJlZDBjMWI1YWZiOWU2YjBiOWUwYjE2YmI4YjYxNgo+
ID4gQXV0aG9yOiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KPiA+IERhdGU6
ICAgVHVlIFNlcCA3IDE5OjU1OjA0IDIwMjEgLTA3MDAKPiA+Cj4gPiAgICAgICBtbS9tZW1vcnlf
aG90cGx1ZzogcmVtb3ZlIG5pZCBwYXJhbWV0ZXIgZnJvbSBhcmNoX3JlbW92ZV9tZW1vcnkoKQo+
ID4KPiA+IFRvIGFzayB0aGUgcmVhbCBxdWVzdGlvbjogRG8gd2UgcmVhbGx5IG5lZWQgdGhpcyBj
b3VudGVyIHBlci1uaWQgYXQgYWxsPwo+ID4KPiA+IFNlZW1zIHRvIG92ZXItY29tcGxpY2F0ZSB0
aGluZ3MuCj4KPiBDYXNlIGluIHBvaW50OiBJIHRoaW5rIHRoZSBoYW5kbGluZyBpcyB3cm9uZz8K
Pgo+IEp1c3QgYmVjYXVzZSBzb21lIG1lbW9yeSBiZWxvbmdzIHRvIGEgbmlkIGRvZXNuJ3QgbWVh
biB0aGF0IHRoZSB2bWVtbWFwCj4gd2FzIGFsbG9jYXRlZCBmcm9tIHRoYXQgbmlkPwoKSSBiZWxp
ZXZlIHdoZW4gd2UgaG90LWFkZCB3ZSB1c2UgbmlkIGZvciB0aGUgbWVtb3J5IHRoYXQgaXMgYmVp
bmcKYWRkZWQgdG8gYWNjb3VudCB2bWVtbWFwLCBhbmQgd2hlbiB3ZSBkbyBob3QtcmVtb3ZlIHdl
IGFsc28gdXNlIG5pZCBvZgp0aGUgbWVtb3J5IHRoYXQgaXMgYmVpbmcgcmVtb3ZlZC4gQnV0LCB5
b3UgYXJlIGNvcnJlY3QsIHRoaXMgZG9lcyBub3QKZ3VhcmFudGVlIHRoYXQgdGhlIGFjdHVhbCB2
bWVtbWFwIG1lbW9yeSBpcyBiZWluZyBhbGxvY2F0ZWQgb3IgcmVtb3ZlZApmcm9tIHRoZSBnaXZl
biBuaWQuCgo+IFdvdWxkbid0IHdlIHdhbnQgdG8gbG9vayBhdCB0aGUgYWN0dWFsIG5pZCB0aGUg
dm1lbW1hcCBwYWdlIGJlbG9uZ3MgdG8KPiB0aGF0IHdlIGFyZSByZW1vdmluZz8KCkkgYW0gbm93
IGxvb2tpbmcgaW50byBjb252ZXJ0aW5nIHRoaXMgY291bnRlciB0byBiZSBzeXN0ZW0gd2lkZSwg
aS5lLgp2bV9ldmVudCwgaXQgaXMgYWxsIGRvbmUgdW5kZXIgaG90cGx1ZyBsb2NrLCBzbyB0aGVy
ZSBpcyBubwpjb250ZW50aW9uLgoKUGFzaGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
