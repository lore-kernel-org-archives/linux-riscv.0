Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9CFFF885A
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 14:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0HR7Z6L0/yTrohLoOyVy1KE1vuB3olQgTYzGaY2FXY=; b=frPIifNLEM/kNC
	rqdPENjykDWUaVJsmWY8IDKkNhRhv3Vr1ljKUBPP/zuM1xvMKUm7P3jbjKYkgwbDF+Y4KingBYYML
	u4IzEOH8S78jMryi7AfemtLznTs2UPhtUT+koU632OB+PRRD3T7HTBW8izbxNwCkvMUzgcrAATCil
	m/XlX5HhsYwRZQUjPZkYWgckrc1qf88JDqABaf9lnd3pUe9rQwtbCRmJF9uqxPz5COQ3CAbP8R1JF
	Bu3dW0VGNw4D/+kGFCOGTueghebkhcqoCDaQCAZpVTb+HbnPPwZFR6Ar9Lr4heyWbG/APHpk9/gw0
	/TSRm8jI/H21+a9tfxLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJu6B-0000000DPM1-42TE;
	Mon, 04 May 2026 14:16:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJu68-0000000DPJu-1ZRq
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 14:16:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D53544514
	for <linux-riscv@lists.infradead.org>; Mon,  4 May 2026 14:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02783C2BCB8
	for <linux-riscv@lists.infradead.org>; Mon,  4 May 2026 14:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777904196;
	bh=dnulhm1JTuoUEhQzuO1u5rEt0FwJiLQjQxWn1rCEVQ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AazNF5N1aHDR+UXaFTE8Ym6YCJqUHugZO6w7ZQjJEbo4f+Ky5hcCpxnLMiX5T1CnT
	 H84Hfr4SiOszuSzdFDS3CtchBEDDk7auUlGDiAQa9uPuZdQ4sjMHts6zOF/ITwiAmh
	 XN7kgXmsex5cXA8nEc6s+rh1c8xo932KGvwpuhrulTt7gkhSPzDdZFmkspL9yqY1FE
	 MPZSCWkTcGOTWT4WjDKrj5sB4ZXO8fmLasFt9NxX/yEZOkOeHYWfKc34F330hSfSCA
	 b4YWrnUjpu8S5MvQ806OuL02Ho2/uj5nLbUdMsIHkZcLyULEjzZtRIAH+jup3lH6Le
	 3Cg054Wb96zTQ==
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8b7ec7bedcbso5147766d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 May 2026 07:16:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+KAFZJc1k4EwmYc3jl4bjgG1mg9QLQruw29SWg+haDwCNDFJ0KiPxCF/wtrbMtiq9XjtbN/r7DZRLm/w==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnz0wWpfeTQLXHjL/qAApuRyqAm/IOB8DnZt1m2pqMykAdqS7R
	NrArQwhgMun1rZekgl9BiqQT7apyGALNRffuPcHmT7SiYsDc1hSNBoUgeK4TCWrb6mdEEJ0AZyc
	UpJzs7LJHHGBWDsrtxNeDfsxvQgRHopY=
X-Received: by 2002:a05:6214:27c3:b0:8a4:db54:b3a4 with SMTP id
 6a1803df08f44-8b665d1127bmr158681076d6.7.1777904164104; Mon, 04 May 2026
 07:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <yezmezj26xntushmylductlmytfgvwsnbnzlhffkfwugfxkt6m@gleq22spziyk>
 <CAGsJ_4y8JtCxEy9hVxVd8eaf8D9WC8BcRQp9afUVu=FJA1-awA@mail.gmail.com> <n5vsmp6ingbhfztl6wzcwmrz56gkkfbpzardk43scr7rcgqsw5@evtnov34c5bt>
In-Reply-To: <n5vsmp6ingbhfztl6wzcwmrz56gkkfbpzardk43scr7rcgqsw5@evtnov34c5bt>
From: Barry Song <baohua@kernel.org>
Date: Mon, 4 May 2026 22:15:52 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xM8W5NHB4J2c1dVyXhu9SHAK_iiVZPAtH0fMvJoz77ww@mail.gmail.com>
X-Gm-Features: AVHnY4LS13GrbYqayhsefNP68ODiwhwvddGMrFC2vbCyG8eLOAO_PeI0iks995A
Message-ID: <CAGsJ_4xM8W5NHB4J2c1dVyXhu9SHAK_iiVZPAtH0fMvJoz77ww@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Jan Kara <jack@suse.cz>
Cc: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_071636_689248_9F42B213 
X-CRM114-Status: GOOD (  42.60  )
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

T24gTW9uLCBNYXkgNCwgMjAyNiBhdCA5OjA04oCvUE0gSmFuIEthcmEgPGphY2tAc3VzZS5jej4g
d3JvdGU6Cj4KPiBPbiBNb24gMDQtMDUtMjYgMDM6NTU6NDMsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4g
PiBPbiBNb24sIE1heSA0LCAyMDI2IGF0IDI6MTfigK9BTSBKYW4gS2FyYSA8amFja0BzdXNlLmN6
PiB3cm90ZToKPiA+ID4gT24gRnJpIDAxLTA1LTI2IDE4OjU3OjUyLCBNYXR0aGV3IFdpbGNveCB3
cm90ZToKPiA+ID4gPiBPbiBTYXQsIE1heSAwMiwgMjAyNiBhdCAwMTo0NDozNEFNICswODAwLCBC
YXJyeSBTb25nIHdyb3RlOgo+ID4gPiA+ID4gT24gRnJpLCBNYXkgMSwgMjAyNiBhdCAxMDo1N+KA
r1BNIE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiA+ID4gPiA+
ID4gT24gRnJpLCBNYXkgMDEsIDIwMjYgYXQgMDY6NDk6NThBTSArMDgwMCwgQmFycnkgU29uZyB3
cm90ZToKPiA+ID4gPiA+ID4gPiAxLiBUaGVyZSBpcyBubyBkZXRlcm1pbmlzdGljIGxhdGVuY3kg
Zm9yIEkvTyBjb21wbGV0aW9uLiBJdCBkZXBlbmRzIG9uCj4gPiA+ID4gPiA+ID4gYm90aCB0aGUg
aGFyZHdhcmUgYW5kIHRoZSBzb2Z0d2FyZSBzdGFjayAoYmlvL3JlcXVlc3QgcXVldWVzIGFuZCB0
aGUKPiA+ID4gPiA+ID4gPiBibG9jayBzY2hlZHVsZXIpLiBTb21ldGltZXMgdGhlIGxhdGVuY3kg
aXMgc2hvcnQ7IGF0IG90aGVyIHRpbWVzIGl0IGNhbgo+ID4gPiA+ID4gPiA+IGJlIHF1aXRlIGxv
bmcuIEluIHN1Y2ggY2FzZXMsIGEgaGlnaC1wcmlvcml0eSB0aHJlYWQgcGVyZm9ybWluZyBvcGVy
YXRpb25zCj4gPiA+ID4gPiA+ID4gc3VjaCBhcyBtcHJvdGVjdCwgdW5tYXAsIHByY3RsX3NldF92
bWEsIG9yIG1hZHZpc2UgbWF5IGJlIGZvcmNlZCB0byB3YWl0Cj4gPiA+ID4gPiA+ID4gZm9yIGFu
IHVucHJlZGljdGFibGUgYW1vdW50IG9mIHRpbWUuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEJ1
dCBkb2VzIHRoYXQgYWN0dWFsbHkgaGFwcGVuPyAgSSBmaW5kIGl0IGhhcmQgdG8gYmVsaWV2ZSB0
aGF0IHRocmVhZCBBCj4gPiA+ID4gPiA+IHVubWFwcyBhIFZNQSB3aGlsZSB0aHJlYWQgQiBpcyBp
biB0aGUgbWlkZGxlIG9mIHRha2luZyBhIHBhZ2UgZmF1bHQgaW4KPiA+ID4gPiA+ID4gdGhhdCBz
YW1lIFZNQS4gIG1wcm90ZWN0KCkgYW5kIG1hZHZpc2UoKSBhcmUgbW9yZSBsaWtlbHkgdG8gaGFw
cGVuLCBidXQKPiA+ID4gPiA+ID4gaXQgc3RpbGwgc2VlbXMgcmVhbGx5IHVubGlrZWx5IHRvIG1l
Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IEl0IGRvZXNu4oCZdCBoYXZlIHRvIGludm9sdmUgdW5tYXBw
aW5nIG9yIGFwcGx5aW5nIG1wcm90ZWN0IHRvCj4gPiA+ID4gPiB0aGUgZW50aXJlIFZNQeKAlGp1
c3QgYSBwb3J0aW9uIG9mIGl0IGlzIHN1ZmZpY2llbnQuCj4gPiA+ID4KPiA+ID4gPiBZZXMsIGJ1
dCB0aGF0IHN0aWxsIGZhaWxzIHRvIGFuc3dlciAiZG9lcyB0aGlzIGFjdHVhbGx5IGhhcHBlbiIu
ICBIb3cgbXVjaAo+ID4gPiA+IHBlcmZvcm1hbmNlIGlzIGFsbCB0aGlzIGNvbXBsZXhpdHkgaW4g
dGhlIHBhZ2UgZmF1bHQgaGFuZGxlciBidXlpbmcgdXM/Cj4gPiA+ID4gSWYgeW91IGRvbid0IGFu
c3dlciB0aGlzIHF1ZXN0aW9uLCBJJ20ganVzdCBnb2luZyB0byBnbyBpbiBhbmQgcmlwIGl0Cj4g
PiA+ID4gYWxsIG91dC4KPiA+ID4KPiA+ID4gSSBmdWxseSBhZ3JlZSB3aXRoIHlvdSB3ZSBzaG91
bGQgdmVyaWZ5IHdoZXRoZXIgdGhlIHJldHJ5IGNvZGUgc3RpbGwgYnJpbmdzCj4gPiA+IGluIHJl
YWwtd29ybGQgYWR2YW50YWdlIHRvZGF5IHdpdGggVk1BIGxvY2tzLiBBZnRlciBhbGwgdGhlIHJl
dHJ5IGxvZ2ljIGhhcwo+ID4gPiBiZWVuIGludHJvZHVjZWQgaW4gMjAxMC4gVGhhdCBiZWluZyBz
YWlkIGlmIHRoZXJlIGFyZSByZWFsaXN0aWMgbG9hZHMgd2hlcmUKPiA+ID4gb25lIHRocmVhZCBu
ZWVkcyBWTUEgd3JpdGUgbG9jayB3aGlsZSBhbm90aGVyIHRocmVhZCBpcyBmYXVsdGluZyB0aGUg
Vk1BLAo+ID4gPiB0aGVuIHRoZSBsYXRlbmNpZXMgY2FuIGJlIGluZGVlZCBleHRyZW1lLiBGb3Ig
ZXhhbXBsZSB0aGluZ3MgbGlrZSBjZ3JvdXAgSU8KPiA+ID4gdGhyb3R0bGluZyBoYXBwZW4gb24g
dGhlIElPIHBhdGggYW5kIHRodXMgY2FuIHRocm90dGxlIElPIG9mIGEgbG93LXByaW9yaXR5Cj4g
PiA+IHRocmVhZCBmb3IgYSBsb25nIHRpbWUuCj4gPgo+ID4gSeKAmW0gcXVpdGUgc3VyZSB0aGF0
IHN3YXAtaW4gYW5kIFZNQSB3cml0ZXMgY2FuIG9jY3VyCj4gPiBjb25jdXJyZW50bHksIGFuZCB0
aGlzIGlzIGZhaXJseSBjb21tb24uIEZvciBleGFtcGxlLAo+ID4gSmF2YSBHQyBtYXkgdXNlIG1w
cm90ZWN0IG9yIHVzZXJmYXVsdGZkIG9uIGEgc21hbGwKPiA+IHBvcnRpb24gb2YgYSBsYXJnZSBK
YXZhIGhlYXAgd2hpbGUgb3RoZXIgcG9ydGlvbnMgYXJlCj4gPiBzdGlsbCB1bmRlciBkb19zd2Fw
X3BhZ2UoKS4KPgo+IE9LLCBtYWtlcyBzZW5zZS4KPgo+ID4gSWYgd2Ugc3RhcnQgZXhwbG9yaW5n
IGRpZmZlcmVudCBhcHByb2FjaGVzIGZvciBhbm9uIGFuZAo+ID4gZmlsZSwgSSBhZ3JlZSBJIGNh
biByZXZpc2l0IHRoaXMgb24gYW4gQW5kcm9pZCBwaG9uZSBpZgo+ID4gdGhlcmUgaXMgYSByZWFs
LCBzZXJpb3VzIGNhc2Ugd2hlcmUgYSBmaWxlIFZNQSBjYW4gYmUKPiA+IHdyaXR0ZW4gYW5kIGEg
cGFnZSBmYXVsdCBvY2N1cnMgYXQgdGhlIHNhbWUgdGltZS4KPiA+Cj4gPiBQbGVhc2Ugbm90ZSB0
aGF0LCBhcyBhbiBBbmRyb2lkIGRldmVsb3BlciwgSSBhbSBwYXJ0aWN1bGFybHkKPiA+IGNhdXRp
b3VzIGFib3V0IHByaW9yaXR5IGludmVyc2lvbi4gQSByZWNlbnQgaXNzdWUgY2F1c2luZwo+ID4g
c2V2ZXJlIHByaW9yaXR5IGludmVyc2lvbiBpcyB6cmFtIGF0dGVtcHRpbmcgdG8gc3VwcG9ydAo+
ID4gcHJlZW1wdGlvblsxXS4gV2hlbiBhIHRhc2sgcGVyZm9ybWluZyBjb21wcmVzc2lvbiBvcgo+
ID4gZGVjb21wcmVzc2lvbiBpcyBtaWdyYXRlZCB0byBhbm90aGVyIENQVSBhbmQgdGhlbiBwcmVl
bXB0ZWQKPiA+IGJ5IG90aGVyIHRhc2tzLCBoaWdoLXByaW9yaXR5IHRhc2tzIHdhaXRpbmcgb24g
dGhlIG11dGV4IG1heQo+ID4gYmUgc2lnbmlmaWNhbnRseSBkZWxheWVkLCBpbXBhY3RpbmcgdXNl
ciBleHBlcmllbmNlLgo+Cj4gV2VsbCwgY29udGFpbmVyIHBlb3BsZSBhcmUgY29uY2VybmVkIGFi
b3V0IHByaW9yaXR5IGludmVyc2lvbiBhcyB3ZWxsLiBCdXQKPiB1c3VhbGx5IHRoaXMgaXMgd2l0
aCBjb2Fyc2UgbG9jayAoc3VjaCBhcyBnbG9iYWwgZmlsZXN5c3RlbSBsb2NrcykgYnV0IFZNQQo+
IGxvY2sgaXMgc3BlY2lmaWMgdG8gYSB0YXNrIChhbmQgYSBWTUEpIHNvIHRoZXJlIHRoZSBvcHBv
cnR1bml0eSBmb3IKPiBwcmlvcml0eSBpbnZlcnNpb24gbG9va3MgbW9yZSBsaW1pdGVkLiAgQnV0
IHRoZSBleGFtcGxlIHdpdGggSmF2YSB3aGVyZSBHQwo+IHRocmVhZCBjYW4gcHJlc3VtYWJseSBo
YXZlIGhpZ2hlciBwcmlvcml0eSB0aGFuIG9yZGluYXJ5IEphdmEgdGhyZWFkcyBpcyBhbgo+IGlu
dGVyZXN0aW5nIG9uZS4KCkEgbWFqb3IgZGlmZmVyZW5jZSBpbiBBbmRyb2lkIGFwcHMgaXMgdGhh
dCBlYWNoIHRocmVhZCBjYW4KYWZmZWN0IHVzZXIgZXhwZXJpZW5jZSBkaWZmZXJlbnRseS4gQW5k
IGl0IGlzIG5vdCBzaW1wbHkgYSBtYXR0ZXIKb2Ygd2hldGhlciBhIFZNQSB3cml0ZXIgaGFzIGhp
Z2hlciBvciBsb3dlciBwcmlvcml0eSB0aGFuIGEKcGFnZS1mYXVsdCAoUEYpIHRocmVhZCBwZXJm
b3JtaW5nIEkvTy4KCkZvciBleGFtcGxlLCB0aHJlYWQgQSBoYW5kbGVzIGEgUEY7IHRocmVhZCBC
IGF0dGVtcHRzIHRvCm1vZGlmeSB0aGUgVk1BIHdoZXJlIHRoZSBQRiBvY2N1cnM7IHRocmVhZCBD
IHRyaWVzIHRvIG1vZGlmeQphbm90aGVyIFZNQSAocmVxdWlyaW5nIG1tYXBfbG9jayBpbiB3cml0
ZSBtb2RlKSBvciBpdGVyYXRlClZNQXMgKHJlcXVpcmluZyBtbWFwX2xvY2sgaW4gcmVhZCBtb2Rl
KS4gUmVnYXJkbGVzcyBvZgp0aHJlYWQgQuKAmXMgcHJpb3JpdHksIGl0IGhvbGRzIG1tYXBfbG9j
ayBpbiB3cml0ZSBtb2RlIHdoaWxlCndhaXRpbmcgZm9yIHRoZSBWTUEgbG9jay4gVGhlIHVzdWFs
IHBhdHRlcm4gZm9yIGEgVk1BIHdyaXRlcgppczoKCm1tYXBfd3JpdGVfbG9jaygpCnZtYV9zdGFy
dF93cml0ZSgpCgpBcyBhIHJlc3VsdCwgdGhyZWFkIEMgY2FuIGJlIGJsb2NrZWQgZXZlbiBpZiBp
dCBoYXMgaGlnaGVyCnByaW9yaXR5IGJ1dCBvcGVyYXRlcyBvbiBhIGRpZmZlcmVudCBWTUEuCgpJ
biBlc3NlbmNlLCB3aGVuIGEgUEYgYW5kIGEgVk1BIHdyaXRlIG9jY3VyIGNvbmN1cnJlbnRseSwK
aGlnaC1wcmlvcml0eSB0aHJlYWRzIG1heSBiZSBibG9ja2VkIGV2ZW4gaWYgdGhleSBvcGVyYXRl
IG9uCmRpZmZlcmVudCBWTUFzLCBub3QgbmVjZXNzYXJpbHkgdGhlIHNhbWUgb25lLgoKVGhhbmtz
CkJhcnJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
