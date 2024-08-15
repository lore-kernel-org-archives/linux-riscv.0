Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D92C52D7D
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 06:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9PgRTl6+1AcctAtwjHwASXCFyv9kzMaDbZUlCOkPX94=; b=trvcnsvCLhPWnS
	40cQPFrffclPVevheV7DS5mNA/LHX/1EVCSF5GJdS7/APOAhDrVvNQw1tbVV4kg8pb0CPuPKimLWd
	5FtYFWgvVaTPI+bGsLceZ8xHUZrUTaNrj8q82z3dJkAIsAI4+oyXuP8wY479tRRUCRmPQ2lOaO67L
	ojucAX+xesAS2D8F03YzAzYUhLNw3biNTpajg7mpIxSyrkRnOisNHQ5jvPGlqUfYGyt+foVVeXZoC
	83hRu71LVXBF4EDkT4rq82UBHjcwjtNgWJUC1I+8SfeflmLN4kqXGkCrCDGWOXngAp6fsTiC2EDEZ
	Kj/HDg0MlMCgx9ifi4BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seU20-00000009B1w-33Qm;
	Thu, 15 Aug 2024 06:32:20 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seU1v-00000009B0K-40tl;
	Thu, 15 Aug 2024 06:32:17 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fd9e70b592so6142795ad.3;
        Wed, 14 Aug 2024 23:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723703535; x=1724308335; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nt+p09uz8tAqwLeLii8cPw/zrSYX75ywbDJiGCl6kRA=;
        b=IhvTy2je1+Ye71peGmzgPD5djj7eFhcWSGOHuX88lKyZ0RPkpcDqdu9+PronAuzZZB
         4yFlMwWxF8B6tuF0cyCdoTKJT1au2VD0QEsWRaUDShXIYj6SHqhI+aPZY4N7aoEUmwLo
         ei48LhBlsdN65vNow7gNxrPxq+cZWnoGKylYsAgtKV2vMoP1yMHrrks9HthSs7R2uLQX
         s7QA8zuiNLI6nXkJnTUgws1N92iazPj83vtCtqQQ2qXVDAs3RpkRsFbh7DU0W8qSzP/k
         Ama9F+uVnhv+zTFFDBv34CWinjhOJIHkOwUGsFB/FabEV3sGZ9OXz1DAAQRtizlDLX4l
         IbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723703535; x=1724308335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nt+p09uz8tAqwLeLii8cPw/zrSYX75ywbDJiGCl6kRA=;
        b=kcZgLJQ0Z/KZvpmQWaAwROqqdvX3ypUHddWERehWIWwwkg6PVYHzGMhqsMAFix7FKW
         FExubDKKoqR9X9G+aik8VEnxjkmjpY6vGeGCBHBNeOykuHvrpp73kokCcvLQBkbpq95I
         4omNgsvEQCfEwPUQM0XQMjQq01nxrZ2F7JhvN4TdZwxIOsfKPQ0BnoEzoQ6HCDJ7GDiD
         rc1dhmTRY9xj4rROMOKcr0U9Jw4hZjM+B7kNZwsPuasDWuPA2Imvri/OxH3vTquCkziT
         Jw2yRYEqY41jgkSjMUeGuXZaBD5YuBmZkeVG4UCfR7J1UU1ChcDoeC+aS/RaBgp5msQa
         CRDA==
X-Forwarded-Encrypted: i=1; AJvYcCWI2l9QHaeoOv51U1V7MOVrKqSUEM9+5fwJw2IrNulxmiv3eVCtURQFyAka690zX8XtknEXDAYUQckP1mrKh1cV2VO/sEk6ARyPYZZLN7UcNTntPWE3TSxQPSEgvvY50Tn/GEO7l51Z3Utdx1YisyRvdx98Zak=
X-Gm-Message-State: AOJu0YwkmpkK2g3/n2JiM1XlUVNCNAlLOhH+34pTeUjMhD7pxVr3OngU
	My99saQwex6zwhvVPMk+I12kofFQ3i1AJAAiyJqk5Yk4Q2H/lTVZ
X-Google-Smtp-Source: AGHT+IGHQF6v1wj4OnSDtmW1i+o0W3hXKMZnU/CMxWJVexuFM/VLhfFkwN0de8G4/UHXSn+MbeyB0Q==
X-Received: by 2002:a17:903:11c4:b0:1fb:cf82:11b4 with SMTP id d9443c01a7336-201d63bc296mr66187655ad.6.1723703534763;
        Wed, 14 Aug 2024 23:32:14 -0700 (PDT)
Received: from [192.168.255.10] ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f039ef06sm5216095ad.249.2024.08.14.23.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 23:32:14 -0700 (PDT)
Message-ID: <3351b0db-4764-48a4-8bab-478ba7bfa4f4@gmail.com>
Date: Thu, 15 Aug 2024 14:32:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/18] use struct ptdesc to replace pgtable_t
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>,
 "alexs@kernel.org" <alexs@kernel.org>, Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Brian Cain <bcain@quicinc.com>,
 WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Naveen N Rao <naveen@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Bibo Mao <maobibo@loongson.cn>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Vishal Moola <vishal.moola@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Lance Yang <ioworker0@gmail.com>,
 Peter Xu <peterx@redhat.com>, Barry Song <baohua@kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Jisheng Zhang
 <jszhang@kernel.org>, Samuel Holland <samuel.holland@sifive.com>,
 Anup Patel <anup@brainfault.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Breno Leitao <leitao@debian.org>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Hugh Dickins <hughd@google.com>, David Hildenbrand <david@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>
References: <20240730064712.3714387-1-alexs@kernel.org>
 <392b267e-cf98-4aa0-bb6e-90f6861d097d@cs-soprasteria.com>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <392b267e-cf98-4aa0-bb6e-90f6861d097d@cs-soprasteria.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_233216_030311_3F04A7B6 
X-CRM114-Status: GOOD (  19.08  )
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

CgpPbiA4LzE1LzI0IDEyOjUwIEFNLCBMRVJPWSBDaHJpc3RvcGhlIHdyb3RlOgo+IEhpLAo+IAo+
IExlIDMwLzA3LzIwMjQgw6AgMDg6NDYsIGFsZXhzQGtlcm5lbC5vcmcgYSDDqWNyaXTCoDoKPj4g
RnJvbTogQWxleCBTaGkgPGFsZXhzQGtlcm5lbC5vcmc+Cj4+Cj4+IFdlIGhhdmUgc3RydWN0IHB0
ZGVzYyBmb3IgcGFnZSB0YWJsZSBkZXNjcmlwdG9yIGEgeWVhciBhZ28sIGJ1dCBpdAo+PiBoYXMg
bm8gbXVjaCB1c2FnZXMgaW4ga2VybmVsLCB3aGlsZSBwZ3RhYmxlX3QgaXMgdXNlZCB3aWRlbHku
Cj4+Cj4+IFRoZSBwZ3RhYmxlX3QgaXMgdHlwZWRlZmVkIGFzICdwdGVfdCAqJyBpbiBzcGFyYywg
czM5MCwgcG93ZXJwYyBhbmQgbTY4awo+PiBleGNlcHQgU1VOMywgb3RoZXJzIGFyY2hzIGFyZSBh
bGwgc2FtZSBhcyAnc3RydWN0IHBhZ2UgKicuCj4+Cj4+IFRoZXNlIGJsb2NrcyB0aGUgY29uY2Vw
dGlvbiBhbmQgY29kZSB1cGRhdGUgZm9yIHBhZ2UgdGFibGUgZGVzY3JpcHRvciB0bwo+PiBzdHJ1
Y3QgcHRkZXNjLgo+Pgo+PiBTbywgdGhlIHNpbXBsZSBpZGVhIHRvIHB1c2ggdGhlIHB0ZGVzYyBj
b25jZXB0aW9uIGZvcndhcmQgaXMgdG8gdXBkYXRlCj4+IGFsbCBwZ3RhYmxlX3QgYnkgcHRkZXNj
IG9yIHB0ZV90IHBvaW50ZXIuIEJ1dCB0aGlzIG5lZWRzIHdpZGVseQo+PiBrbm93bGVkZ2VzIGZv
ciBtb3N0IGFsbCBvZiBkaWZmZXJlbnQgYXJjaHMuIENvbW1vbiBjb2RlIGNoYW5nZSBpcyBlYXN5
Cj4+IGZvciBpbmNsdWRlLyBhbmQgbW0vIGRpcmVjdG9yeSwgYnV0IGl0J3MgaGFyZCBpbiBhbGwg
YXJjaHMuCj4+Cj4+IFRoYW5rcyBmb3IgaW50ZWwgTEtQIGZyYW1ld29yaywgSSBmaXhlZCBtb3N0
IGFsbCBvZiBidWlsZCBpc3N1ZXMgZXhjZXB0Cj4+IGEgYnVnIG9uIHBvd2VycGMgd2hpY2ggcmVw
b3J0cyBhICJzdHJ1Y3QgcHRkZXNjICoiIGluY29tcGF0aWJsZSB3aXRoCj4+IHN0cnVjdCBwdGRl
c2MgKicgcG9pbnRlciBpc3N1ZS4uLgo+IAo+IENhbiB5b3UgdGVsbCBtb3JlIGFib3V0IHRoYXQg
cHJvYmxlbSBvbiBwb3dlcnBjID8gV2hpY2ggZGVmY29uZmlnIGZvciAKPiBpbnN0YW5jZSA/Cj4g
CgpIaSBMZXJveSwKClRoYW5rcyBhIGxvdCBmb3IgcmVzcG9uc2UuIFRoZSBkZXRhaWxlZCBlcnJv
ciBhbmQgY29kZSB0cmVlIGlzIGZyb20gTEtQOgoKT24gOC8zLzI0IDExOjI2IEFNLCBrZXJuZWwg
dGVzdCByb2JvdCB3cm90ZToKPiB0cmVlOiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9hbGV4c2hpL2xp
bnV4LmdpdCBwdGRlc2MKPiBoZWFkOiAgIDM3MzVlNjM0ZjhmZWI2N2M5NDFkMTcyMjJiNTM5MDZh
Y2UyZmQyYjgKPiBjb21taXQ6IDhhYzJlYTVmMjk5NDQ0ZDA2NWIyOTIwNDNhZWQwYTFlOTQ5OTYx
NTkgWzE0LzE3XSBtbS9wZ3RhYmxlOiB1c2UgcHRkZXNjIGluIHBndGFibGVfdHJhbnNfaHVnZV9k
ZXBvc2l0Cj4gY29uZmlnOiBwb3dlcnBjLWFsbHllc2NvbmZpZyAoaHR0cHM6Ly9kb3dubG9hZC4w
MS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjQwODAzLzIwMjQwODAzMTEzMC5VbndnbnVMUy1sa3BA
aW50ZWwuY29tL2NvbmZpZykKPiBjb21waWxlcjogY2xhbmcgdmVyc2lvbiAyMC4wLjBnaXQgKGh0
dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdCA0MjNhZWM2NTczZGY0NDI0ZjkwNTU1
NDY4MTI4ZTE3MDczZGRjNjllKQo+IHJlcHJvZHVjZSAodGhpcyBpcyBhIFc9MSBidWlsZCk6ICho
dHRwczovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAyNDA4MDMvMjAyNDA4MDMx
MTMwLlVud2dudUxTLWxrcEBpbnRlbC5jb20vcmVwcm9kdWNlKQoKPiAgICBJbiBmaWxlIGluY2x1
ZGVkIGZyb20gYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9tbXUtaGFzaC5oOjIw
Ogo+Pj4gYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmg6MTM3Mjo1
MjogZXJyb3I6IGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGVzIHBhc3NpbmcgJ3N0cnVjdCBwdGRl
c2MgKicgdG8gcGFyYW1ldGVyIG9mIHR5cGUgJ3N0cnVjdCBwdGRlc2MgKicgWy1XZXJyb3IsLVdp
bmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10KCj4+Cj4+IEFub3RoZXIgdHJvdWJsZSBpcyBwbWRf
cGd0YWJsZSgpIGNvbnZlcnNpb24gaW4gdGhlIGxhc3QgcGF0Y2guCj4+IE1heWJlIHNvbWUgb2Yg
YXJjaCBuZWVkIGRlZmluZSB0aGVpcnNlbGYgb3duIHBtZF9wdGRlc2MoKT8KPj4KPj4gVGhpcyBw
YXRjaHNldCBpcyBpbW1hdHVyZSwgZXZlbiBleGNlcHQgYWJvdmUgMiBpc3N1ZXMsIEkganVzdCB0
ZXN0ZWQKPj4gdmlydXRhbCBtYWNoaW5lIGJvb3RpbmcgYW5kIGtzZWxmdGVzdCBtbSBvbiB4ODYg
YW5kIGFybTY0Lgo+Pgo+PiBBbnl3YXkgYW55IGlucHV0IGFyZSBhcHByZWNpYXRlZCEKPiAKPiBD
YW4geW91IHRlbGwgb24gd2hpY2ggdHJlZSB5b3UgYmFzZWQgdGhpcyBzZXJpZXMgPyBMYXN0IHBh
dGNoIGRvZXNuJ3QgCj4gYXBwbHkgb24gNi4xMS1yYzE6CgpUaGUgY29kZSBiYXNlZCBvbiBha3Bt
L21tLXVuc3RhYmxlIHRyZWUsIG5vdCB1cHN0cmVhbSwgeW91IGNhbiBjaGVjayB0aGUgY29kZSBv
bjoKaHR0cHM6Ly9naXRodWIuY29tL2FsZXhzaGkvbGludXguZ2l0IHB0ZGVzYwoKVGhhbmtzIGEg
bG90IQpBbGV4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
