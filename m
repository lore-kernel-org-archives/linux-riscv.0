Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C4AD11183
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 11:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PT1ejyx5FhhXYMF1eLHqTFStRF7c8Pp1FpDsx3NeV8k=; b=cu8gu14he6HdGR
	X+PbEKck7HxQR/d7Mhzy/SFPrkYevpGTin6kOz01TZoTSgEQew7KZYASPGukcoJfN+hGXg/KDSBtU
	VpuMk/kw8InrCA1zRObaTkcmWSH52arVDi2JbYXCcxrDbYw1a6jry1G/s32qr2Zd7G6NiYO3LLnhf
	71npZ7yy4Vr90olGFSL/Wr6B+5oDNtDAIdU+i2gon5EowJbU8K8aAM3qWzRFXAiMWk47KjkKEMmbI
	ZZKA0u7nS8dn0nqr//S4bpvw6I5v02b0Fej2XPcFANzCKP25R41kOAyfaRPJS0rfVDbShuo7wtRuo
	LNvMMvdWcKdFdWOlSbaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOaLO-0000000GTIj-29UT;
	Thu, 27 Nov 2025 11:39:26 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOaLL-0000000GTHe-36ve
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 11:39:25 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-8b2da83f721so83981985a.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 03:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764243562; x=1764848362; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTgQXrnGbp8yRV1ffH5aOGb73MnxpAvx9lMPfkiZ/pE=;
        b=Jv9eSDg+tR2213n/rEQxke0t7eNsZBQj3GCsWq6lI4txNH+guaV5esPiNNEOddxMKu
         Lg+HYeIoIyiXxdja16aydzCNWa/b73UmFaj9FjyWh7Kysq1RezMbugRsDb0BOs7C78n2
         Qbwl0WJjoJBarBzbobsYM0lF5MAHlqgtIZq5rb2tHJ/OPCoChZs1NSriyWLlxgYS/8iP
         C0fR1pW7Oe0nd4SnPfr8MnhnMemIDZAAE8hnRdPFSvmrSoW8wRaPfrKU3uJ7AblBhO8I
         VY8zZdMz3rq0zP0KmQp8Q1NlDJ5SRXKPb1u5IquvcbKVlEoEE/UxmsihehpxHxU9ZWea
         d1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764243562; x=1764848362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lTgQXrnGbp8yRV1ffH5aOGb73MnxpAvx9lMPfkiZ/pE=;
        b=KJVLVth5pc3WijcV4nFGjknXRH4cohQjbnJL+m8q/S6+R2Kb28A13LdE3hxL12+VKs
         Br80tviuwkn8uCJd3do1OKQVSl0MFU4ySPYWQnD96wsbdFjqnigVm31ULd7HRrQ5dHni
         d3gZvOtTJnt/T81l1EFu3X3p3OqurqKqjJTB5MPhzzLRb34TJH4eWuxerUQSw9XUGokv
         5eP1JET3oSCI0qISBb9eL/Y7+oDwYeG8haCVcSRNb5ZWFxH2E9ALMPi9bpPykwK0H7ZT
         CfSFKt0rHBToGwsKERzUjM6ns5+SxMPhcGJ9vgHHqyyJtX22Bd79P+S9k7l1+JmdzMKm
         cHGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxkSuYenw4ZfASn1Vtl82smE8rEV5n9JXraCPntQoG3n5zAagw0iM4ItRdNlI0ASVcgM2ICPGRRGq8jA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyB7Q5JfWovbDOLhQHil2SKRyOhKAKQHdpRZyUhjkEZ3HeeJBWr
	LWb1e0HDh4iHQRVAlSpEXSex0RvqtWwRZGkjOQ5HuxdlNDt5nxs6ZbnbDcqVbOjyA7bG13FBbjv
	3ozEzk5ZOce1DZjKiET0EUNLHZzUduPY=
X-Gm-Gg: ASbGncs6EhKGRU/ir7TFdrKN/r8u4jRwxuivW5XecyjgdlkYcjjQlrTUSs2xhSfpr0f
	rAwPrDxqSsY4tWIulkdVntIOSq+0Djerf7I76FMB5Iia766I1pBRcupg2Pu8N4PpDqWhh6eY5C3
	ZaZMfpF2Y9wqZyJwq5N6ueFvUlvXa71ppVco5b2U7V5z30H7S4ouPFMkk7K91q8K0cFYQQZ8o7g
	IDKswpKwI0yYY3tpGZ9V/LCGdtSEmGG5id9SfA5ek/qpPftZmuBqdgyv1EcJEAX9oQNQw==
X-Google-Smtp-Source: AGHT+IF8AX3QuwU8PWoyMHubrE0YEf7OwwbSbZImelOgI0KoQ85t34HoENkNaCeescbBRgk60ctOqyrcZAkFR1pI8MI=
X-Received: by 2002:a05:620a:4094:b0:8b2:3484:8e22 with SMTP id
 af79cd13be357-8b32a8d7accmr3051143885a.0.1764243562227; Thu, 27 Nov 2025
 03:39:22 -0800 (PST)
MIME-Version: 1.0
References: <20251127011438.6918-1-21cnbao@gmail.com> <20251127011438.6918-2-21cnbao@gmail.com>
 <5by7tko4v3kqvvpu4fdsgpw42yl5ed5qisbaz3la4an52hq4j2@v75fagey6gva>
In-Reply-To: <5by7tko4v3kqvvpu4fdsgpw42yl5ed5qisbaz3la4an52hq4j2@v75fagey6gva>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 27 Nov 2025 19:39:11 +0800
X-Gm-Features: AWmQ_bmMHpk-p6E2I_jCY1Xqg4XmWm0x9ikXHEjIDdMSrcjAo4PIsH4k_44adgY
Message-ID: <CAGsJ_4xQKARuEuhrVuV+WmBC7+NCNd==Zi9nGmze5mfSjF1kdw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] mm/filemap: Retry fault by VMA lock if the lock
 was released for I/O
To: Pedro Falcato <pfalcato@suse.de>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	Oven Liyang <liyangouwen1@oppo.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Matthew Wilcox <willy@infradead.org>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Rutland <mark.rutland@arm.com>, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, Robin Murphy <robin.murphy@arm.com>, 
	=?UTF-8?Q?Kristina_Mart=C5=A1enko?= <kristina.martsenko@arm.com>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	Wentao Guan <guanwentao@uniontech.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Steven Rostedt <rostedt@goodmis.org>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Nam Cao <namcao@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <bhe@redhat.com>, Barry Song <v-songbaohua@oppo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_033923_813745_0E146A89 
X-CRM114-Status: GOOD (  29.88  )
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

T24gVGh1LCBOb3YgMjcsIDIwMjUgYXQgNjo1MuKAr1BNIFBlZHJvIEZhbGNhdG8gPHBmYWxjYXRv
QHN1c2UuZGU+IHdyb3RlOgo+Cj4gT24gVGh1LCBOb3YgMjcsIDIwMjUgYXQgMDk6MTQ6MzdBTSAr
MDgwMCwgQmFycnkgU29uZyB3cm90ZToKPiA+IEZyb206IE92ZW4gTGl5YW5nIDxsaXlhbmdvdXdl
bjFAb3Bwby5jb20+Cj4gPgo+ID4gSWYgdGhlIGN1cnJlbnQgcGFnZSBmYXVsdCBpcyB1c2luZyB0
aGUgcGVyLVZNQSBsb2NrLCBhbmQgd2Ugb25seSByZWxlYXNlZAo+ID4gdGhlIGxvY2sgdG8gd2Fp
dCBmb3IgSS9PIGNvbXBsZXRpb24gKGUuZy4sIHVzaW5nIGZvbGlvX2xvY2soKSksIHRoZW4gd2hl
bgo+ID4gdGhlIGZhdWx0IGlzIHJldHJpZWQgYWZ0ZXIgdGhlIEkvTyBjb21wbGV0ZXMsIGl0IHNo
b3VsZCBzdGlsbCBxdWFsaWZ5IGZvcgo+ID4gdGhlIHBlci1WTUEtbG9jayBwYXRoLgo+ID4KPiA8
c25pcD4KPiA+IFNpZ25lZC1vZmYtYnk6IE92ZW4gTGl5YW5nIDxsaXlhbmdvdXdlbjFAb3Bwby5j
b20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCYXJyeSBTb25nIDx2LXNvbmdiYW9odWFAb3Bwby5jb20+
Cj4gPiAtLS0KPiA+ICBhcmNoL2FybS9tbS9mYXVsdC5jICAgICAgIHwgNSArKysrKwo+ID4gIGFy
Y2gvYXJtNjQvbW0vZmF1bHQuYyAgICAgfCA1ICsrKysrCj4gPiAgYXJjaC9sb29uZ2FyY2gvbW0v
ZmF1bHQuYyB8IDQgKysrKwo+ID4gIGFyY2gvcG93ZXJwYy9tbS9mYXVsdC5jICAgfCA1ICsrKyst
Cj4gPiAgYXJjaC9yaXNjdi9tbS9mYXVsdC5jICAgICB8IDQgKysrKwo+ID4gIGFyY2gvczM5MC9t
bS9mYXVsdC5jICAgICAgfCA0ICsrKysKPiA+ICBhcmNoL3g4Ni9tbS9mYXVsdC5jICAgICAgIHwg
NCArKysrCj4KPiBJZiBvbmx5IHdlIGNvdWxkIHVuaWZ5IGFsbCB0aGVzZSBwYXRocyA6KAoKUmln
aHQsIGl04oCZcyBhIHBhaW4sIGJ1dCB3ZSBkbyBoYXZlIGJvdHMgZm9yIHRoYXQ/CkFuZCBpdOKA
mXMgYmFzaWNhbGx5IGp1c3QgY29weS1hbmQtcGFzdGUgYWNyb3NzIGRpZmZlcmVudCBhcmNoaXRl
Y3R1cmVzLgoKPgo+ID4gIGluY2x1ZGUvbGludXgvbW1fdHlwZXMuaCAgfCA5ICsrKysrLS0tLQo+
ID4gIG1tL2ZpbGVtYXAuYyAgICAgICAgICAgICAgfCA1ICsrKystCj4gPiAgOSBmaWxlcyBjaGFu
Z2VkLCAzOSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L21tX3R5cGVzLmggYi9pbmNsdWRlL2xpbnV4L21tX3R5cGVzLmgKPiA+
IGluZGV4IGI3MTYyNTM3OGNlMy4uMTJiMmQ2NWVmMWI5IDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVk
ZS9saW51eC9tbV90eXBlcy5oCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L21tX3R5cGVzLmgKPiA+
IEBAIC0xNjcwLDEwICsxNjcwLDExIEBAIGVudW0gdm1fZmF1bHRfcmVhc29uIHsKPiA+ICAgICAg
IFZNX0ZBVUxUX05PUEFHRSAgICAgICAgID0gKF9fZm9yY2Ugdm1fZmF1bHRfdCkweDAwMDEwMCwK
PiA+ICAgICAgIFZNX0ZBVUxUX0xPQ0tFRCAgICAgICAgID0gKF9fZm9yY2Ugdm1fZmF1bHRfdCkw
eDAwMDIwMCwKPiA+ICAgICAgIFZNX0ZBVUxUX1JFVFJZICAgICAgICAgID0gKF9fZm9yY2Ugdm1f
ZmF1bHRfdCkweDAwMDQwMCwKPiA+IC0gICAgIFZNX0ZBVUxUX0ZBTExCQUNLICAgICAgID0gKF9f
Zm9yY2Ugdm1fZmF1bHRfdCkweDAwMDgwMCwKPiA+IC0gICAgIFZNX0ZBVUxUX0RPTkVfQ09XICAg
ICAgID0gKF9fZm9yY2Ugdm1fZmF1bHRfdCkweDAwMTAwMCwKPiA+IC0gICAgIFZNX0ZBVUxUX05F
RUREU1lOQyAgICAgID0gKF9fZm9yY2Ugdm1fZmF1bHRfdCkweDAwMjAwMCwKPiA+IC0gICAgIFZN
X0ZBVUxUX0NPTVBMRVRFRCAgICAgID0gKF9fZm9yY2Ugdm1fZmF1bHRfdCkweDAwNDAwMCwKPiA+
ICsgICAgIFZNX0ZBVUxUX1JFVFJZX1ZNQSAgICAgID0gKF9fZm9yY2Ugdm1fZmF1bHRfdCkweDAw
MDgwMCwKPgo+IFNvLCB3aGF0IEkgYW0gd29uZGVyaW5nIGhlcmUgaXMgd2h5IHdlIG5lZWQgb25l
IG1vcmUgZmF1bHQgZmxhZyB2ZXJzdXMKPiBqdXN0IGJsaW5kbHkgZG9pbmcgdGhpcyBvbiBhIHBs
YWluLW9sZCBSRVRSWS4gSXMgdGhlcmUgYW55IHBhcnRpY3VsYXIKPiByZWFzb24gd2h5PyBJIGNh
bid0IHRoaW5rIG9mIG9uZS4KCkJlY2F1c2UgaW4gc29tZSBjYXNlcyB3ZSByZXRyeSBzaW1wbHkg
ZHVlIHRvIG5lZWRpbmcgdG8gdGFrZSBtbWFwX2xvY2suCkZvciBleGFtcGxlOgoKLyoqCiAqIF9f
dm1mX2Fub25fcHJlcGFyZSAtIFByZXBhcmUgdG8gaGFuZGxlIGFuIGFub255bW91cyBmYXVsdC4K
ICogQHZtZjogVGhlIHZtX2ZhdWx0IGRlc2NyaXB0b3IgcGFzc2VkIGZyb20gdGhlIGZhdWx0IGhh
bmRsZXIuCiAqCiAqIFdoZW4gcHJlcGFyaW5nIHRvIGluc2VydCBhbiBhbm9ueW1vdXMgcGFnZSBp
bnRvIGEgVk1BIGZyb20gYQogKiBmYXVsdCBoYW5kbGVyLCBjYWxsIHRoaXMgZnVuY3Rpb24gcmF0
aGVyIHRoYW4gYW5vbl92bWFfcHJlcGFyZSgpLgogKiBJZiB0aGlzIHZtYSBkb2VzIG5vdCBhbHJl
YWR5IGhhdmUgYW4gYXNzb2NpYXRlZCBhbm9uX3ZtYSBhbmQgd2UgYXJlCiAqIG9ubHkgcHJvdGVj
dGVkIGJ5IHRoZSBwZXItVk1BIGxvY2ssIHRoZSBjYWxsZXIgbXVzdCByZXRyeSB3aXRoIHRoZQog
KiBtbWFwX2xvY2sgaGVsZC4gIF9fYW5vbl92bWFfcHJlcGFyZSgpIHdpbGwgbG9vayBhdCBhZGph
Y2VudCBWTUFzIHRvCiAqIGRldGVybWluZSBpZiB0aGlzIFZNQSBjYW4gc2hhcmUgaXRzIGFub25f
dm1hLCBhbmQgdGhhdCdzIG5vdCBzYWZlIHRvCiAqIGRvIHdpdGggb25seSB0aGUgcGVyLVZNQSBs
b2NrIGhlbGQgZm9yIHRoaXMgVk1BLgogKgogKiBSZXR1cm46IDAgaWYgZmF1bHQgaGFuZGxpbmcg
Y2FuIHByb2NlZWQuICBBbnkgb3RoZXIgdmFsdWUgc2hvdWxkIGJlCiAqIHJldHVybmVkIHRvIHRo
ZSBjYWxsZXIuCiAqLwp2bV9mYXVsdF90IF9fdm1mX2Fub25fcHJlcGFyZShzdHJ1Y3Qgdm1fZmF1
bHQgKnZtZikKewouLi4KfQoKVGh1cywgd2UgaGF2ZSB0byBjaGVjayBlYWNoIGJyYW5jaCBvbmUg
Ynkgb25lLCBidXQgSS9PIHdhaXQgaXMgdGhlIG1vc3QKZnJlcXVlbnQgcGF0aCwgc28gd2UgaGFu
ZGxlIGl0IGZpcnN0LgoKPgo+IEkgd291bGQgYWxzbyBsaWtlIHRvIHNlZSBwZXJmb3JtYW5jZSBu
dW1iZXJzLgoKWWVzLiBGcm9tIHdoYXQgSSB1bmRlcnN0YW5kLCB0aGlzIHBhdGNoc2V0IHNob3Vs
ZCBpbXByb3ZlIHBlcmZvcm1hbmNlIGluIGEKZmFpcmx5IHN0cmFpZ2h0Zm9yd2FyZCB3YXkuCkJ1
dCB5ZXMsIEkgY2FuIGNlcnRhaW5seSBpbmNsdWRlIHNvbWUgZGF0YSBpbiB2Mi4KCj4KPiBUaGUg
cmVzdCBvZiB0aGUgcGF0Y2ggbG9va3MgT0sgdG8gbWUuCgpUaGFua3MKQmFycnkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
