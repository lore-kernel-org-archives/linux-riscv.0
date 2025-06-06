Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F067C61CE8
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 11:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jYLd6RhbRT7U8O9kTd6h1lXPFgkymPlSvQ67x+SQSk=; b=TYiO2s1xnUxTx3
	NxNkF4xwuQ2cyFEpvyW6q0uWGarl2oWKQZKaWJKgCoFvuCNXxnHvbn/mlkgGM4MiayWzZEGYBRnNt
	3x3FPT/L1drqzYSto7XqZp/kQgtPOWj9GM6JQ+jrzUapx9ilV8Jqb3cldbHI9AqdD7WrLNOPdic3/
	fahd+1sghrD194B+1IeHLjH1j4SWxcADVxXZCoG4xB8Aj0hjt6QPdn3R5cLe9C7S/M9AOLJ+fsa4f
	1P6c2OGo6PztKuwi0959Z8YKGn9ykNwFqAiYRuH0HyFpS4hS7Q9gUTVtgi4u0GpQNmyNUT0bgPK9+
	H+g/epiAqFXw/6up0aUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUsh-000000006x5-1oWN;
	Fri, 06 Jun 2025 11:05:03 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUnm-000000006L3-0jiw
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 10:59:59 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6000791e832so6834a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jun 2025 03:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749207597; x=1749812397; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ij6p51RBSpIfTcDNnVZuFN0QIs5BBfAMlgmDV1oy1ao=;
        b=NQiJeUCtUYlqasXtmJgbChtzAGXV4T9/o1q7qTybNL6WTInSSc1tPyIpc4vGpVcJM/
         Tm1wo5yV+SX7fRg5vzIpnxtn+WwqpZrk3fFo1u0vvXzGBmIeTw1+f+spoz6xSLln1XDB
         NEaKaRIzGoU9KLf0mJ8MkAKQ1j2ulBk7Mr0jm7VP/jOZG9Xjy44qmzvfCF/AN9KDDuU6
         hf4rb1Kf6OG1EBIvfdByUlYXpFK3LMKDrPHvRXIpnFaQK+B5H6RDVlAMDna9zKMNdxmj
         UJQE6uF6Fz/7jv3xlmbnB0uN1LEJwXEon8VwyYY2s9CbgPutOS9jksjengKC5391enIe
         taFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749207597; x=1749812397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ij6p51RBSpIfTcDNnVZuFN0QIs5BBfAMlgmDV1oy1ao=;
        b=swcU0f0M619pircCuR+MZPDtaQ/q6s3RM2A5BUmQSwrqdCeeiydiWW/lBysNivIfJe
         KG61j0kh9ppn0PbsS81Itn03kFIpqTk6bBf8l9AFK6Hx4S/v1/ezM0qF60zKkxsAZqkg
         2ij/BOj0iihQ2WsDhfcu990r51UNTMr4KHiJ2TZnqPaVlIYfuf8fANzgHYQQOD2wxDDp
         gpqLQxGeNzec3dCHM8NtCHw0t8OZ/trZ1UyB4xq6PkIDnuX+F6gX8qT644OUThcMLgU6
         dFMTIZSUVYQg6awudKvjlasu0+G0zqDHbwHyR0LPKSKrPcinmlgQeW5TFS8czMHrvXpO
         x05w==
X-Forwarded-Encrypted: i=1; AJvYcCWmKicA9WNJHJK3JD3Z28YEXLasLNvYsMx6VV3zIQ8qrDDFm8vjcuQdbgENHBEieU+X8nSiv6V1F2Heiw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxD8eSrdAnUmFEUnbqj3LTGT7hukUQ+nWnTLdbqzotBrhp81mA4
	fifmJ5at7IVT+MN/2ENzM8/to65z7CfsVw+D6maGT83OD4KhlLPHSwnD/bqDulJOr2/lBGhJ7e7
	4mxvui+HmJJNmj0wdNrQfvf4O88ZCi/cB0hct2yHu
X-Gm-Gg: ASbGncuwSdLzKUOV5kgFuXPBDjCm/2Q5tRHm6BKu8SkPwDpBCIWFKlDrjKdFhJZN62s
	i5Vr/x+7YyYhWTCA53dvPA+otF1TBkBWjEX2sg4iFG89NSnB0G3awQBXvuSs4Acj8YDaZg6xKlP
	R+hC3iOIRpkAx1YrtiP3zlAaxHlFQm4RWJYq5YacifA2GKxYofan98ka7oRWSkkggAuDiVxg+ez
	pt0cjmb
X-Google-Smtp-Source: AGHT+IHxO2eadHOlfPVxuGh+iyeVA+X2FQXWYvnzf8QlbhCwgU3Fgf6hl8bb87wyCATPpiU1tP4xwP8RO2klSRm0ODw=
X-Received: by 2002:aa7:d98f:0:b0:601:7b94:b80e with SMTP id
 4fb4d7f45d1cf-607793d441bmr49798a12.3.1749207596298; Fri, 06 Jun 2025
 03:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250604141958.111300-1-lorenzo.stoakes@oracle.com>
 <CAG48ez3hvPbfc2dapQQu9TKrjdi5mhZ4tAWi+m0tNZeEtSZBrQ@mail.gmail.com> <af6d28d0-d646-45d5-832c-66add20ea388@redhat.com>
In-Reply-To: <af6d28d0-d646-45d5-832c-66add20ea388@redhat.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 6 Jun 2025 12:59:20 +0200
X-Gm-Features: AX0GCFuSeBKSZUd4LEoLg2wIZ296FSomM3Hd1AfilUwfRktV5EvXRfsEyT3g3G0
Message-ID: <CAG48ez3-QiaT1hSFz64xiucR4azQsrcj+6rQrLoz+d0zd-BUuQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/pagewalk: split walk_page_range_novma() into
 kernel/user parts
To: David Hildenbrand <david@redhat.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Barry Song <baohua@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_035958_212693_ADE0889B 
X-CRM114-Status: GOOD (  28.05  )
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

T24gVGh1LCBKdW4gNSwgMjAyNSBhdCAxMDoyM+KAr1BNIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZp
ZEByZWRoYXQuY29tPiB3cm90ZToKPiBPbiAwNS4wNi4yNSAyMToxOSwgSmFubiBIb3JuIHdyb3Rl
Ogo+ID4gT24gV2VkLCBKdW4gNCwgMjAyNSBhdCA0OjIx4oCvUE0gTG9yZW56byBTdG9ha2VzCj4g
PiA8bG9yZW56by5zdG9ha2VzQG9yYWNsZS5jb20+IHdyb3RlOgo+ID4+IFRoZSB3YWxrX3BhZ2Vf
cmFuZ2Vfbm92bWEoKSBmdW5jdGlvbiBpcyByYXRoZXIgY29uZnVzaW5nIC0gaXQgc3VwcG9ydHMg
dHdvCj4gPj4gbW9kZXMsIG9uZSB1c2VkIG9mdGVuLCB0aGUgb3RoZXIgdXNlZCBvbmx5IGZvciBk
ZWJ1Z2dpbmcuCj4gPj4KPiA+PiBUaGUgZmlyc3QgbW9kZSBpcyB0aGUgY29tbW9uIGNhc2Ugb2Yg
dHJhdmVyc2FsIG9mIGtlcm5lbCBwYWdlIHRhYmxlcywgd2hpY2gKPiA+PiBpcyB3aGF0IG5lYXJs
eSBhbGwgY2FsbGVycyB1c2UgdGhpcyBmb3IuCj4gPj4KPiA+PiBTZWNvbmRseSBpdCBwcm92aWRl
cyBhbiB1bnVzdWFsIGRlYnVnZ2luZyBpbnRlcmZhY2UgdGhhdCBhbGxvd3MgZm9yIHRoZQo+ID4+
IHRyYXZlcnNhbCBvZiBwYWdlIHRhYmxlcyBpbiBhIHVzZXJsYW5kIHJhbmdlIG9mIG1lbW9yeSBl
dmVuIGZvciB0aGF0IG1lbW9yeQo+ID4+IHdoaWNoIGlzIG5vdCBkZXNjcmliZWQgYnkgYSBWTUEu
Cj4gPj4KPiA+PiBJdCBpcyBmYXIgZnJvbSBjZXJ0YWluIHRoYXQgc3VjaCBwYWdlIHRhYmxlcyBz
aG91bGQgZXZlbiBleGlzdCwgYnV0IHBlcmhhcHMKPiA+PiB0aGlzIGlzIHByZWNpc2VseSB3aHkg
aXQgaXMgdXNlZnVsIGFzIGEgZGVidWdnaW5nIG1lY2hhbmlzbS4KPiA+Pgo+ID4+IEFzIGEgcmVz
dWx0LCB0aGlzIGlzIHV0aWxpc2VkIGJ5IHB0ZHVtcCBvbmx5LiBIaXN0b3JpY2FsbHksIHRoaW5n
cyB3ZXJlCj4gPj4gcmV2ZXJzZWQgLSBwdGR1bXAgd2FzIHRoZSBvbmx5IHVzZXIsIGFuZCBvdGhl
ciBwYXJ0cyBvZiB0aGUga2VybmVsIGV2b2x2ZWQKPiA+PiB0byB1c2UgdGhlIGtlcm5lbCBwYWdl
IHRhYmxlIHdhbGtpbmcgaGVyZS4KPiA+Cj4gPiBKdXN0IGZvciB0aGUgcmVjb3JkLCBjb3B5LXBh
c3RpbmcgbXkgY29tbWVudCBvbiB2MSB0aGF0IHdhcwo+ID4gYWNjaWRlbnRhbGx5IHNlbnQgb2Zm
LWxpc3Q6Cj4gPiBgYGAKPiA+IFNvcnQgb2YgYSB0YW5nZW50aWFsIGNvbW1lbnQ6IEkgd29uZGVy
IGlmIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gZ2l2ZQo+ID4gcHRkdW1wIGEgZGlmZmVyZW50IHBh
Z2UgdGFibGUgd2Fsa2VyIHRoYXQgdXNlcyByb3VnaGx5IHRoZSBzYW1lIHNhZmV0eQo+ID4gY29u
dHJhY3QgYXMgZ3VwX2Zhc3QoKSAtIHR1cm4gb2ZmIElSUXMgYW5kIHRoZW4gd2FsayB0aGUgcGFn
ZSB0YWJsZXMKPiA+IGxvY2tsZXNzbHkuIFdlJ2QgbmVlZCBiYXNpY2FsbHkgbm8gbG9ja2luZyBh
bmQgbm8gc3BlY2lhbCBjYXNlcwo+ID4gKHJlZ2FyZGluZyB1c2Vyc3BhY2UgbWFwcGluZ3MgYXQg
bGVhc3QpLCBhdCB0aGUgY29zdCBvZiBoYXZpbmcgdG8KPiA+IHdyaXRlIHRoZSB3YWxrZXIgY29k
ZSBzdWNoIHRoYXQgd2UgcGVyaW9kaWNhbGx5IHJlc3RhcnQgdGhlIHdhbGsgZnJvbQo+ID4gc2Ny
YXRjaCBhbmQgbm90IGJlaW5nIGFibGUgdG8gaW5zcGVjdCByZWZlcmVuY2VkIHBhZ2VzLiAoVGhh
dCBtaWdodAo+ID4gYWxzbyBiZSBuaWNlciBmb3IgZGVidWdnaW5nLCBzaW5jZSBpdCB3b3VsZG4n
dCBibG9jayBvbiBsb2Nrcy4uLikKPiA+IGBgYAo+Cj4gSSBhc3N1bWUgd2UgZG9uJ3QgaGF2ZSB0
byBkdW1wIG1vcmUgdGhhbiBwdGUgdmFsdWVzIGV0Yz8gU28KPiBwdGVfc3BlY2lhbCgpIGFuZCBm
cmllbmRzIGFyZSBub3QgcmVsZXZhbnQgdG8gZ2V0IGl0IHJpZ2h0Lgo+Cj4gR1VQLWZhc3QgZGVw
ZW5kIG9uIENPTkZJR19IQVZFX0dVUF9GQVNULCBub3Qgc3VyZSBpZiB0aGF0IHdvdWxkIGJlIGEK
PiBjb25jZXJuIGZvciBub3cuCgpBaCwgZ29vZCBwb2ludCwgdGhhdCdzIGFubm95aW5nLi4uIG1h
YWF5YmUgd2Ugc2hvdWxkIGp1c3QgZ2F0ZSB0aGlzCmVudGlyZSBmZWF0dXJlIG9uIENPTkZJR19I
QVZFX0dVUF9GQVNUIHRvIG1ha2Ugc3VyZSB0aGUgdXNlcnNwYWNlCm1hcHBpbmdzIGFyZSBkZXNp
Z25lZCB0byBiZSB3YWxrYWJsZSBpbiB0aGlzIHdheT8gSXQncyBpbiBkZWJ1Z2ZzLAp3aGljaCBf
dGhlb3JldGljYWxseV8KKGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2ZpbGVzeXN0ZW1zL2RlYnVn
ZnMuaHRtbCkgbWVhbnMgdGhlcmUgYXJlIG5vCnN0YWJpbGl0eSBndWFyYW50ZWVzLCBhbmQgSSB0
aGluayBpdCBpcyBub3JtYWxseSB1c2VkIG9uIGFyY2hpdGVjdHVyZXMKdGhhdCBkZWZpbmUgQ09O
RklHX0hBVkVfR1VQX0ZBU1QuLi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
