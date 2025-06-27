Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636A0C7EE31
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 07:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ht1905yLF1Z60qCS41Z7YPoimRaQFs/HZuQU76mpijg=; b=AuhAbOkv76Sx8G
	luN2vZoEr4mW1dGf6+RtD59itcFR+Efqq6E2yzZOjFfVkVkFTXLKweafuyL45A7tjJXBR+qJwwlUH
	d2LsQlQ1Xd0rfo8StClfCLKnplxRCkDHciWYdg+z3Pcj6Ck7Gp+Sp+79uXLpdkMvVe7uPJaEFx2/M
	WcaMaGch1WgJMFNedxxCUk/n/WxD9JZdLTSAMgEBGOlFiODIxFKKbqMhM293UFYeKB6stkgJWH3Jz
	nLJIJcV1pS3BNZyo+b3PP/dTv0r3P4HXl5x417sbbAIixbRLZYptqOLqd64UXUkNQ9r0Ys8SiC/rm
	LVv2K+wPZftlQDHkOXmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV346-0000000DlFS-1tem;
	Fri, 27 Jun 2025 07:00:02 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV2zz-0000000DkSs-17AL;
	Fri, 27 Jun 2025 06:55:48 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-4e7ef5d6bffso482928137.3;
        Thu, 26 Jun 2025 23:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751007346; x=1751612146; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AonkeL2UG9zbG1SpDxserAwv5MTYfIP9basgeC0vKE8=;
        b=XaPdIEau78ELlYZLdMs8dScXws3W9cyS05+bfeI69ignyo1c3zPV8TwPBkWdCPpdHb
         8CoKINq+RNI6gQAue8so9l8i9qI7f82/b6NlGZuDQS+zjFW51D2V6FO3jWApF0OMjYyx
         LnwzhHHGvQuDLRkItaUpOiO4skdxCzxNz6S3GtJNoyAhuqE7RDAYp9VQ8B8vRiqmrXS3
         pV5Ef+Z3Jy6VoA0KpWeWDeT3T+ZPCwed9XbY5N8wYA6ezFjRXI7DUftL4hRtJap94HCK
         qxIjDjzpTjk3ToR1KjrUg+Ph82syVRRX1bcWwhCiAJxQ0XmWkNBfEpQKjeIcbZm6G1nD
         YsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751007346; x=1751612146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AonkeL2UG9zbG1SpDxserAwv5MTYfIP9basgeC0vKE8=;
        b=fMkfPLzbm/qb02Snn2WiPUugHs1IwLIIUhwBa7HoJh2hYHsdRHO7eSU/pY6RX9lu8c
         kJUWmOND0g01z5kG2PZo9gqmQoocKTOIynW9DglOBsevZqx3qdlhN4MlKEJeD0t1gE1Y
         DHia051g6Ml041xwGXr9iwCvnYQwPTBPufOTaB8asNRG8hMevvNftZ6kyBzk/957xY83
         SlmiZgbh/8Zk6x6ZtlNlbLDUd0rqO16L1I72XTwgQQpqnF9C8AuLXS0EqIu8mMs6/eU8
         M2x7qO1Pllzrk8Rdu0Ei0fUYJUDthwZpC1iAqs78T5IrqSCJqvRQysYhV7Xl6e+Be5h+
         6Jyw==
X-Forwarded-Encrypted: i=1; AJvYcCU2tbaSC3yNMyXumXEPpzWumZbsKzFpDVjFbzn6i1FjzOWE31KP1aja1IPZi7n3RZuDfiJneB6KRusHPaw=@lists.infradead.org, AJvYcCVbszxCZFVBn4enTxuinF0Mf7zA+r68LJAesBY9m3NugKRhjYyTK0MJP/rxjcDZ2FJPe9mT/+Wnj7+mDpR4qyoz@lists.infradead.org
X-Gm-Message-State: AOJu0YxUw0Jf2NIla5kSROD9/pIxqontVrih+9fpqLdYHhBZvTyudvwv
	rvqNsY+pEnvLLpxZMt+8NKfCN7b8f5nuBto2wsGFZGiuzwrnzpjRG6SBaKxlHFP/AbvHUveF/zc
	9XMHFtVUsAD5LQy3Z8Lv7DoXy3iQCUtI=
X-Gm-Gg: ASbGnctMfelxvfoM2ixXAN+Do5zLVk+ZmtrDQrYit66YqxOSY/+0l/dGuyWX4KQgS6c
	AXIz1yBrUFng+yfs0tv0MaJSapwSFcVEMXpZDvDG1DARHp0xMW5bhwlhW3qk2Nw515Vz2GiP4R0
	rLS8S8VwRbNtH9+Q3eaT6bJU4rFMceOoCeA9kTWqWWmhg8xIP1SwLbpA==
X-Google-Smtp-Source: AGHT+IHID72abIG7KO9tY0TMUT/7rvTScdoSDX7SF0tYvqk7dfZNu62uOYY7u8MoIAmAQhMkN3cJSxhZsgMz1pZQ9R4=
X-Received: by 2002:a05:6102:919:b0:4e5:acea:2dec with SMTP id
 ada2fe7eead31-4ee4f6a6083mr1641746137.7.1751007346178; Thu, 26 Jun 2025
 23:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250627062319.84936-1-lance.yang@linux.dev> <CAGsJ_4xQW3O=-VoC7aTCiwU4NZnK0tNsG1faAUgLvf4aZSm8Eg@mail.gmail.com>
In-Reply-To: <CAGsJ_4xQW3O=-VoC7aTCiwU4NZnK0tNsG1faAUgLvf4aZSm8Eg@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 27 Jun 2025 18:55:35 +1200
X-Gm-Features: Ac12FXxvwUg1I8DIO0v6b56l2GT04XdFM5Ht5dpca7QYboGTabvmi5kE5vPkba0
Message-ID: <CAGsJ_4z+DU-FhNk9vkS-epdxgUMjrCvh31ZBwoAs98uWnbTK-A@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
To: Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, david@redhat.com, baolin.wang@linux.alibaba.com, 
	chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com, 
	ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org, 
	huang.ying.caritas@gmail.com, zhengtangquan@oppo.com, riel@surriel.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, harry.yoo@oracle.com, 
	mingzhe.yang@ly.com, stable@vger.kernel.org, 
	Lance Yang <lance.yang@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_235547_308582_C4650E99 
X-CRM114-Status: GOOD (  18.91  )
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

T24gRnJpLCBKdW4gMjcsIDIwMjUgYXQgNjo1MuKAr1BNIEJhcnJ5IFNvbmcgPDIxY25iYW9AZ21h
aWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVuIDI3LCAyMDI1IGF0IDY6MjPigK9QTSBMYW5j
ZSBZYW5nIDxpb3dvcmtlcjBAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBMYW5jZSBZ
YW5nIDxsYW5jZS55YW5nQGxpbnV4LmRldj4KPiA+Cj4gPiBBcyBwb2ludGVkIG91dCBieSBEYXZp
ZFsxXSwgdGhlIGJhdGNoZWQgdW5tYXAgbG9naWMgaW4gdHJ5X3RvX3VubWFwX29uZSgpCj4gPiBj
YW4gcmVhZCBwYXN0IHRoZSBlbmQgb2YgYSBQVEUgdGFibGUgaWYgYSBsYXJnZSBmb2xpbyBpcyBt
YXBwZWQgc3RhcnRpbmcgYXQKPiA+IHRoZSBsYXN0IGVudHJ5IG9mIHRoYXQgdGFibGUuIEl0IHdv
dWxkIGJlIHF1aXRlIHJhcmUgaW4gcHJhY3RpY2UsIGFzCj4gPiBNQURWX0ZSRUUgdHlwaWNhbGx5
IHNwbGl0cyB0aGUgbGFyZ2UgZm9saW8gOykKPiA+Cj4gPiBTbyBsZXQncyBmaXggdGhlIHBvdGVu
dGlhbCBvdXQtb2YtYm91bmRzIHJlYWQgYnkgcmVmYWN0b3JpbmcgdGhlIGxvZ2ljIGludG8KPiA+
IGEgbmV3IGhlbHBlciwgZm9saW9fdW5tYXBfcHRlX2JhdGNoKCkuCj4gPgo+ID4gVGhlIG5ldyBo
ZWxwZXIgbm93IGNvcnJlY3RseSBjYWxjdWxhdGVzIHRoZSBzYWZlIG51bWJlciBvZiBwYWdlcyB0
byBzY2FuIGJ5Cj4gPiBsaW1pdGluZyB0aGUgb3BlcmF0aW9uIHRvIHRoZSBib3VuZGFyaWVzIG9m
IHRoZSBjdXJyZW50IFZNQSBhbmQgdGhlIFBURQo+ID4gdGFibGUuCj4gPgo+ID4gSW4gYWRkaXRp
b24sIHRoZSAiYWxsLW9yLW5vdGhpbmciIGJhdGNoaW5nIHJlc3RyaWN0aW9uIGlzIHJlbW92ZWQg
dG8KPiA+IHN1cHBvcnQgcGFydGlhbCBiYXRjaGVzLiBUaGUgcmVmZXJlbmNlIGNvdW50aW5nIGlz
IGFsc28gY2xlYW5lZCB1cCB0byB1c2UKPiA+IGZvbGlvX3B1dF9yZWZzKCkuCj4gPgo+ID4gWzFd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1tL2E2OTQzOThjLTlmMDMtNDczNy04MWI5
LTdlNDljODU3ZmNiZUByZWRoYXQuY29tCj4gPgo+Cj4gV2hhdCBhYm91dCA/Cj4KPiBBcyBwb2lu
dGVkIG91dCBieSBEYXZpZFsxXSwgdGhlIGJhdGNoZWQgdW5tYXAgbG9naWMgaW4gdHJ5X3RvX3Vu
bWFwX29uZSgpCj4gbWF5IHJlYWQgcGFzdCB0aGUgZW5kIG9mIGEgUFRFIHRhYmxlIHdoZW4gYSBs
YXJnZSBmb2xpbyBzcGFucyBhY3Jvc3MgdHdvIFBNRHMsCj4gcGFydGljdWxhcmx5IGFmdGVyIGJl
aW5nIHJlbWFwcGVkIHdpdGggbXJlbWFwKCkuIFRoaXMgcGF0Y2ggZml4ZXMgdGhlCj4gcG90ZW50
aWFsIG91dC1vZi1ib3VuZHMgYWNjZXNzIGJ5IGNhcHBpbmcgdGhlIGJhdGNoIGF0IHZtX2VuZCBh
bmQgdGhlIFBNRAo+IGJvdW5kYXJ5Lgo+Cj4gSXQgYWxzbyByZWZhY3RvcnMgdGhlIGxvZ2ljIGlu
dG8gYSBuZXcgaGVscGVyLCBmb2xpb191bm1hcF9wdGVfYmF0Y2goKSwKPiB3aGljaCBzdXBwb3J0
cyBiYXRjaGluZyBiZXR3ZWVuIDEgYW5kIGZvbGlvX25yX3BhZ2VzLiBUaGlzIGltcHJvdmVzIGNv
ZGUKPiBjbGFyaXR5LiBOb3RlIHRoYXQgc3VjaCBjYXNlcyBhcmUgcmFyZSBpbiBwcmFjdGljZSwg
YXMgTUFEVl9GUkVFIHR5cGljYWxseQo+IHNwbGl0cyBsYXJnZSBmb2xpb3MuCgpTb3JyeSwgSSBt
ZWFudCB0aGF0IE1BRFZfRlJFRSB0eXBpY2FsbHkgc3BsaXRzIGxhcmdlIGZvbGlvcyBpZiB0aGUg
c3BlY2lmaWVkCnJhbmdlIGRvZXNuJ3QgY292ZXIgdGhlIGVudGlyZSBmb2xpby4KCj4KPiBUaGFu
a3MKPiBCYXJyeQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
