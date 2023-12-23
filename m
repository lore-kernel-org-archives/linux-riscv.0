Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F089C46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 03:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YcW2EKD4nAn0I42TeIlI504uTDzVaQ0qjA78h7ghgdU=; b=Wv/Ea4Lx1W/xzv
	Y1vcmRQS+o5HqDSUadJw/MRi3UEp+M9Bk1RLyNXUAVGmZOBO//5RbRyouaAo8v2okuO6ZA+HfXdz/
	UFWTGSTt9jpQuiyBbLuKHZ2GV+cmkFg3Nnhzzo/gbrIKkEDbTkOdyxh5rMtsduihxgyeKCrD987xE
	X2Cembg4btrc+roUf6FmjPKnQJKd8Q1stuHK44KIBcF94WbRDpw7lkMuuWLc0WePG6EYArJezDgoe
	XlQBfaxJOleLAKprvnubzDNXsEkwAHTknsfzhFB9ZHpsD9/ETMWWud0t83ddF8Imll/gPnZKDC1If
	kCJXVTnctrHJrnsfTEXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGsUg-007Gfo-1K;
	Sat, 23 Dec 2023 03:16:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGsUd-007GfA-1P
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 03:16:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2ED88CE2304
	for <linux-riscv@lists.infradead.org>; Sat, 23 Dec 2023 03:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED79C433CA
	for <linux-riscv@lists.infradead.org>; Sat, 23 Dec 2023 03:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703301359;
	bh=YgXV2H2E4lib63YZl+21aGNsinOP8zIoh4LQ+TSqQqc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gppMJeW+EYMbS3bNIbyANp/orqGarhbzFzGusbqRCe8ohURH49pAfbOs+hHsvxMdJ
	 BqlfNTKvgPF3GzLuTtGgrVSHsHFGtziNWewn9pBKKinh43SooW2MRxf/z70ukzD2X6
	 c7B9RopPYsWgYkwWBl//aEuwNEn16lnKdciIHlqDoH7EJjjvgjhf48XKpuFlwf65Dx
	 IXYo3b1mHCjHF4H64S6xhDkwx0JNx/wHQv/gQOJuPcc0zRmqUa1hhZJ1lIir5oHsQ/
	 VfnKAHw2t1AF8UhzWU04fAkbuwVLtSQn6+g9NH0tUnnu6yboIKolKuiTTIhoEgHZ6X
	 8cBRfTr6B6vIg==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5543aec7440so2155833a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 19:15:59 -0800 (PST)
X-Gm-Message-State: AOJu0Yw8a7gcEmNMzCCm1AVbqovw9EvVhYLov3LrdvMoKsZwyo6Gd1H2
	K6cfAUOPUf1o5ugT/hqWC/R2Euj1IbtVLzaVtFI=
X-Google-Smtp-Source: AGHT+IEAXORQPrk2FyHUNnxz7BvwRV5zSaBsntJOpgsIdpjqLihNl+lKwgPFNStbngrYGGgkg+gRb2bdrN8z9mRyM+Q=
X-Received: by 2002:a50:ee09:0:b0:554:2905:a529 with SMTP id
 g9-20020a50ee09000000b005542905a529mr1202503eds.85.1703301357716; Fri, 22 Dec
 2023 19:15:57 -0800 (PST)
MIME-Version: 1.0
References: <20230810040349.92279-2-leobras@redhat.com> <ZP2DVap64lJZj9g4@gmail.com>
 <ZYZPA-Ugfowk1VXq@LeoBras>
In-Reply-To: <ZYZPA-Ugfowk1VXq@LeoBras>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 23 Dec 2023 11:15:46 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTKb6_E+hKXB063oZtyWJ9vQxRgq4j-8TbqZtNgd=WJOg@mail.gmail.com>
Message-ID: <CAJF2gTTKb6_E+hKXB063oZtyWJ9vQxRgq4j-8TbqZtNgd=WJOg@mail.gmail.com>
Subject: Re: [RFC PATCH v5 0/5] Rework & improve riscv cmpxchg.h and atomic.h
To: Leonardo Bras <leobras@redhat.com>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_191603_939957_0C54DE51 
X-CRM114-Status: GOOD (  37.92  )
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

T24gU2F0LCBEZWMgMjMsIDIwMjMgYXQgMTE6MDjigK9BTSBMZW9uYXJkbyBCcmFzIDxsZW9icmFz
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gU3VuLCBTZXAgMTAsIDIwMjMgYXQgMDQ6NTA6MjlB
TSAtMDQwMCwgR3VvIFJlbiB3cm90ZToKPiA+IE9uIFRodSwgQXVnIDEwLCAyMDIzIGF0IDAxOjAz
OjQyQU0gLTAzMDAsIExlb25hcmRvIEJyYXMgd3JvdGU6Cj4gPiA+IFdoaWxlIHN0dWR5aW5nIHJp
c2N2J3MgY21weGNoZy5oIGZpbGUsIEkgZ290IHJlYWxseSBpbnRlcmVzdGVkIGluCj4gPiA+IHVu
ZGVyc3RhbmRpbmcgaG93IFJJU0NWIGFzbSBpbXBsZW1lbnRlZCB0aGUgZGlmZmVyZW50IHZlcnNp
b25zIG9mCj4gPiA+IHtjbXAsfXhjaGcuCj4gPiA+Cj4gPiA+IFdoZW4gSSB1bmRlcnN0b29kIHRo
ZSBwYXR0ZXJuLCBpdCBtYWRlIHNlbnNlIGZvciBtZSB0byByZW1vdmUgdGhlCj4gPiA+IGR1cGxp
Y2F0aW9ucyBhbmQgY3JlYXRlIG1hY3JvcyB0byBtYWtlIGl0IGVhc2llciB0byB1bmRlcnN0YW5k
IHdoYXQgZXhhY3RseQo+ID4gPiBjaGFuZ2VzIGJldHdlZW4gdGhlIHZlcnNpb25zOiBJbnN0cnVj
dGlvbiBzdWZpeGVzICYgYmFycmllcnMuCj4gPiA+Cj4gPiA+IEFsc28sIGRpZCB0aGUgc2FtZSBr
aW5kIG9mIHdvcmsgb24gYXRvbWljLmMuCj4gPiA+Cj4gPiA+IEFmdGVyIHRoYXQsIEkgbm90ZWQg
Ym90aCBjbXB4Y2hnIGFuZCB4Y2hnIG9ubHkgYWNjZXB0IHZhcmlhYmxlcyBvZgo+ID4gPiBzaXpl
IDQgYW5kIDgsIGNvbXBhcmVkIHRvIHg4NiBhbmQgYXJtNjQgd2hpY2ggZG8gMSwyLDQsOC4KPiA+
ID4KPiA+ID4gTm93IHRoYXQgZGVkdXBsaWNhdGlvbiBpcyBkb25lLCBpdCBpcyBxdWl0ZSBkaXJl
Y3QgdG8gaW1wbGVtZW50IHRoZW0KPiA+ID4gZm9yIHZhcmlhYmxlIHNpemVzIDEgYW5kIDIsIHNv
IEkgZGlkIGl0LiBUaGVuIEd1byBSZW4gYWxyZWFkeSBwcmVzZW50ZWQKPiA+ID4gbWUgc29tZSBw
b3NzaWJsZSB1c2VycyA6KQo+ID4gPgo+ID4gPiBJIGRpZCBjb21wYXJlIHRoZSBnZW5lcmF0ZWQg
YXNtIG9uIGEgdGVzdC5jIHRoYXQgY29udGFpbmVkIHVzYWdlIGZvciBldmVyeQo+ID4gPiBjaGFu
Z2VkIGZ1bmN0aW9uLCBhbmQgY291bGQgbm90IGRldGVjdCBhbnkgY2hhbmdlIG9uIHBhdGNoZXMg
MSArIDIgKyAzCj4gPiA+IGNvbXBhcmVkIHdpdGggdXBzdHJlYW0uCj4gPiA+Cj4gPiA+IFBhdGhl
cyA0ICYgNSB3ZXJlIGNvbXBpbGVkLXRlc3RlZCwgbWVyZ2VkIHdpdGggZ3VvcmVuL3FzcGlubG9j
a192MTEgYW5kCj4gPiA+IGJvb3RlZCBqdXN0IGZpbmUgd2l0aCBxZW11IC1tYWNoaW5lIHZpcnQg
LWFwcGVuZCAicXNwaW5sb2NrIi4KPiA+ID4KPiA+ID4gKHRyZWU6IGh0dHBzOi8vZ2l0bGFiLmNv
bS9MZW9CcmFzL2xpbnV4Ly0vY29tbWl0cy9ndW9fcXNwaW5sb2NrX3YxMSkKPiA+IFRlc3RlZC1i
eTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPgo+Cj4gSGVsbG8gR3VvIFJlbiwgdGhh
bmtzIGZvciB0ZXN0aW5nIQo+Cj4gSSB3aWxsIHJlc2VuZCB0aGlzIHNlcmllcywgYW5kIEkgd291
bGQgbGlrZSB0byB1bmRlcnN0YW5kIGhvdyBzaG91bGQgSSBwdXQKPiB5b3VyIFRlc3RlZC1ieSBv
dmVyIHRoaXMgcGF0Y2hzZXQ6Cj4KPiBJcyBpdCBvayBpZiBJIGFkZCBpdCBvbiBlYWNoIHBhdGNo
IG9mIHRoaXMgc2VyaWVzPwpZZXMsIG15IHFzcGlubG9ja192MTIgYmFzZWQgb24geW91ciBwYXRj
aCBzZXJpZXMuCmh0dHBzOi8vZ2l0aHViLmNvbS9ndW9yZW44My9saW51eC90cmVlL3FzcGlubG9j
a192MTIKClNvbWUgcGVvcGxlIHRlbGwgbWUgcGFyYXZpcnQtcXNwaW5sb2NrIGNhbid0IHdvcmsg
d2l0aCBuZXN0ZWQKdmlydHVhbGl6YXRpb24sIGJ1dCBJIGhhdmVuJ3QgZm91bmQgYSB3YXkgdG8g
c2V0IHVwIGEgdGVzdAplbnZpcm9ubWVudC4gSSdtIHdvcmtpbmcgb24gdGhhdC4KCgoKPgo+IFRo
YW5rcyEKPiBMZW8KPgo+Cj4gPiBTb3JyeSBmb3IgbGF0ZSByZXBseSwgYmVjYXVzZSB3ZSBhcmUg
c3RyZXNzIHRlc3RpbmcgQ05BIHFzcGlubG9jayBvbgo+ID4gc2cyMDQyIDEyOCBjb3JlcyBoYXJk
d2FyZSBwbGF0Zm9ybS4gVGhpcyBzZXJpZXMgaGFzIHBhc3NlZCBvdXIgdGVzdCBmb3IKPiA+IHNl
dmVyYWwgd2Vla3MuIEZvciBtb3JlIGRldGFpbCwgcmVmOgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtcmlzY3YvMjAyMzA5MTAwODI5MTEuMzM3ODc4Mi0xLWd1b3JlbkBrZXJuZWwu
b3JnLwo+ID4KPiA+ID4KPiA+ID4gVGhhbmtzIQo+ID4gPiBMZW8KPiA+ID4KPiA+ID4gQ2hhbmdl
cyBzaW5jZSBzcXVhc2hlZCBjbXB4Y2hnIFJGQ3Y0Ogo+ID4gPiAtIEFkZGVkIChfX3R5cGVvZl9f
KCoocCkpKSBiZWZvcmUgcmV0dXJuaW5nIGZyb20ge2NtcCx9eGNoZywgYXMgZG9uZQo+ID4gPiAg
IGluIGN1cnJlbnQgdXBzdHJlYW0sIChwb3NzaWJseSkgZml4aW5nIHRoZSBidWcgZnJvbSBrZXJu
ZWwgdGVzdCByb2JvdAo+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA4MDkw
MjEzMTEuMTM5MDU3OC0yLWxlb2JyYXNAcmVkaGF0LmNvbS8KPiA+ID4KPiA+ID4gQ2hhbmdlcyBz
aW5jZSBzcXVhc2hlZCBjbXB4Y2hnIFJGQ3YzOgo+ID4gPiAtIEZpeGVkIGJ1ZyBvbiBjbXB4Y2hn
IG1hY3JvIGZvciB2YXIgc2l6ZSAxICYgMjogbm93IHdvcmtpbmcKPiA+ID4gLSBNYWNyb3MgZm9y
IHZhciBzaXplIDEgJiAyJ3MgbHIudyBhbmQgc2MudyBub3cgYXJlIGd1YXJhbnRlZWQgdG8gcmVj
ZWl2ZQo+ID4gPiAgIGlucHV0IG9mIGEgMzItYml0IGFsaWduZWQgYWRkcmVzcwo+ID4gPiAtIFJl
bmFtZWQgaW50ZXJuYWwgbWFjcm9zIGZyb20gX21hc2sgdG8gX21hc2tlZCBmb3IgcGF0Y2hlcyA0
ICYgNQo+ID4gPiAtIF9fcmMgdmFyaWFibGUgb24gbWFjcm9zIGZvciB2YXIgc2l6ZSAxICYgMiBj
aGFuZ2VkIGZyb20gcmVnaXN0ZXIgdG8gdWxvbmcKPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjMwODA0MDg0OTAwLjExMzU2NjAtMi1sZW9icmFzQHJlZGhhdC5jb20vCj4gPiA+
Cj4gPiA+IENoYW5nZXMgc2luY2Ugc3F1YXNoZWQgY21weGNoZyBSRkN2MjoKPiA+ID4gLSBSZW1v
dmVkIHJjIHBhcmFtZXRlciBmcm9tIHRoZSBuZXcgbWFjcm86IGl0IGNhbiBiZSBpbnRlcm5hbCB0
byB0aGUgbWFjcm8KPiA+ID4gLSAyIG5ldyBwYXRjaGVzOiBjbXB4Y2hnIHNpemUgMSBhbmQgMiwg
eGNoZyBzaXplIDEgYW5kIDIKPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMw
ODAzMDUxNDAxLjcxMDIzNi0yLWxlb2JyYXNAcmVkaGF0LmNvbS8KPiA+ID4KPiA+ID4gQ2hhbmdl
cyBzaW5jZSBzcXVhc2hlZCBjbXB4Y2hnIFJGQ3YxOgo+ID4gPiAtIFVuaWZpZWQgd2l0aCBhdG9t
aWMuYyBwYXRjaHNldAo+ID4gPiAtIFJlYmFzZWQgb24gdG9wIG9mIHRvcnZhbGRzL21hc3RlciAo
dGhhbmtzIEFuZHJlYSBQYXJyaSEpCj4gPiA+IC0gUmVtb3ZlZCBoZWxwZXIgbWFjcm9zIHRoYXQg
d2VyZSBub3QgYmVpbmcgdXNlZCBlbHNld2hlcmUgaW4gdGhlIGtlcm5lbC4KPiA+ID4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwNDE5MDYyNTA1LjI1NzIzMS0xLWxlb2JyYXNAcmVk
aGF0LmNvbS8KPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwNDA2MDgyMDE4
LjcwMzY3LTEtbGVvYnJhc0ByZWRoYXQuY29tLwo+ID4gPgo+ID4gPiBDaGFuZ2VzIHNpbmNlIChj
bXB4Y2hnKSBSRkN2MzoKPiA+ID4gLSBTcXVhc2hlZCB0aGUgNiBvcmlnaW5hbCBwYXRjaGVzIGlu
IDI6IG9uZSBmb3IgY21weGNoZyBhbmQgb25lIGZvciB4Y2hnCj4gPiA+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8yMDIzMDQwNDE2Mzc0MS4yNzYyMTY1LTEtbGVvYnJhc0ByZWRoYXQuY29t
Lwo+ID4gPgo+ID4gPiBDaGFuZ2VzIHNpbmNlIChjbXB4Y2hnKSBSRkN2MjoKPiA+ID4gLSBGaXhl
ZCAgbWFjcm9zIHRoYXQgZGVwZW5kIG9uIGhhdmluZyBhIGxvY2FsIHZhcmlhYmxlIHdpdGggYSBt
YWdpYyBuYW1lCj4gPiA+IC0gUHJldmlvdXMgY2FzdCB0byAobG9uZykgaXMgbm93IG9ubHkgYXBw
bGllZCBvbiA0LWJ5dGVzIGNtcHhjaGcKPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjMwMzIxMDc0MjQ5LjIyMjE2NzQtMS1sZW9icmFzQHJlZGhhdC5jb20vCj4gPiA+Cj4gPiA+
IENoYW5nZXMgc2luY2UgKGNtcHhjaGcpIFJGQ3YxOgo+ID4gPiAtIEZpeGVkIHBhdGNoIDQvNiBz
dWZmaXggZnJvbSAndy5hcXJsJyB0byAnLncuYXFybCcsIHRvIGF2b2lkIGJ1aWxkIGVycm9yCj4g
PiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDMxODA4MDA1OS4xMTA5Mjg2LTEt
bGVvYnJhc0ByZWRoYXQuY29tLwo+ID4gPgo+ID4gPiBMZW9uYXJkbyBCcmFzICg1KToKPiA+ID4g
ICByaXNjdi9jbXB4Y2hnOiBEZWR1cGxpY2F0ZSB4Y2hnKCkgYXNtIGZ1bmN0aW9ucwo+ID4gPiAg
IHJpc2N2L2NtcHhjaGc6IERlZHVwbGljYXRlIGNtcHhjaGcoKSBhc20gYW5kIG1hY3Jvcwo+ID4g
PiAgIHJpc2N2L2F0b21pYy5oIDogRGVkdXBsaWNhdGUgYXJjaF9hdG9taWMuKgo+ID4gPiAgIHJp
c2N2L2NtcHhjaGc6IEltcGxlbWVudCBjbXB4Y2hnIGZvciB2YXJpYWJsZXMgb2Ygc2l6ZSAxIGFu
ZCAyCj4gPiA+ICAgcmlzY3YvY21weGNoZzogSW1wbGVtZW50IHhjaGcgZm9yIHZhcmlhYmxlcyBv
ZiBzaXplIDEgYW5kIDIKPiA+ID4KPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXRvbWlj
LmggIHwgMTY0ICsrKysrKy0tLS0tLS0KPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY21w
eGNoZy5oIHwgNDA0ICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gIDIgZmls
ZXMgY2hhbmdlZCwgMjAwIGluc2VydGlvbnMoKyksIDM2OCBkZWxldGlvbnMoLSkKPiA+ID4KPiA+
ID4KPiA+ID4gYmFzZS1jb21taXQ6IGNhY2M2ZTIyOTMyZjM3M2E5MWQ3YmU1NWE5Yjk5MmRjNzdm
NGM1OWIKPiA+ID4gLS0KPiA+ID4gMi40MS4wCj4gPiA+Cj4gPiA+Cj4gPiA+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+IGxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdAo+ID4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiA+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPiA+
ID4KPiA+Cj4KCgotLQpCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
