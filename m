Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369BFCCFA05
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 03:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvcBLuvGvKNeMR/FSkOVuaHjUb30aIxxaVZWDHEdQ9A=; b=ocayLwArjNxvjj
	MdVT23FOCf/cF3Q/PZ8clve0QY9zl6At3+2D17lF31DqacIIdxAAFCsnRbNXEo8JHHuk7h0/gpBaH
	7liFaGG4WRHLMAs9H9aDL6BaSsL11eX5cxL2U52QAqhzNfhKIM0OS/JqW9qD1FhLJvFjGOQmIfsR3
	U8PVXV2/0XdAxQfXYQYCqpeylh2So8dBy1+rLCb6vwvppWVBAWejGm/5+4I4f6JBl3AeRmOmkdVF4
	8QPghq2KSmkAAC2XqRMYnthokf5yl6ItY5lxXkjiM4wSjRYp1KkuF8mqNwLRQqdzu2RMIIjuNuxZX
	pyLHlGzt/plf7DBlfs0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFlUo-000000098ov-2ql6;
	Mon, 03 Nov 2025 03:44:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFlUm-000000098oU-2CL0
	for linux-riscv@lists.infradead.org;
	Mon, 03 Nov 2025 03:44:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 379DA4473F
	for <linux-riscv@lists.infradead.org>; Mon,  3 Nov 2025 03:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15195C116C6
	for <linux-riscv@lists.infradead.org>; Mon,  3 Nov 2025 03:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762141480;
	bh=4AFAXNkKcaOcnR6vhsrUWpV/8CEIBLI5x/Z+Qu0dr9s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OpMZNyB1V9/sPoyFYBmL5a0tN0c3kh2fFdpJ1v2ON3XehRykZ+K1BJadGRWkHs/uU
	 LoR/MmFnfONaGTT+KZHiHJc8+eHjOMyKlVFYnpm5jA9UewIECy1z1cTlhUnm6t5HWg
	 SGJexdV2zvzq8CCe+Id+ksP3WkzFgJYJ88LcJRNQVz6fQbgGuJ0V91FT2TdCsd//KD
	 JoJg4+kLR0z6EZyTi9Gg7Q8mEOhXJ9ufYydTRNFgdJLH1ADXX4FEwrk5bt+Am5mVFU
	 WxUc9RL5W07YmAxzuaoLqXOB3Mi69q9R1yECxMCbFRVOMNTt41Y7hHN/lWKD6LV3sB
	 j6/HnEgJPFYdA==
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-429c7869704so1753307f8f.2
        for <linux-riscv@lists.infradead.org>; Sun, 02 Nov 2025 19:44:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU97PQjSCvmsTVO9LtP9Bz1OgDv5dtgdkF9gM6HvjrwTEbvbiYPxx7DsjOk+okDoVbr9fEvcZkfOsHXWA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcqUAeChTi7lZtniFN0hfluetptDfdQn9erQTr8MpYJByo/Drz
	FnhyvFl0yDGZiOD6NBQzn9paT/2PeTQwfE1p3M0RQG1h0XFL5soX2XEZnNh2XrrHRNfV6fr9bNb
	xZAfcJxZzxHMSkHWXLxN9uPMtQsXnYQQ=
X-Google-Smtp-Source: AGHT+IEkRmRc5XeVSedzsO4yQqj7NniTjW7qsPuRsj/aC6ozhk5nvDc1TGdpavdkBKeAP/hE69r2ZNcp3d3iH5d7qY8=
X-Received: by 2002:a5d:5d11:0:b0:425:825d:2c64 with SMTP id
 ffacd0b85a97d-429bd6801aamr8766463f8f.17.1762141478635; Sun, 02 Nov 2025
 19:44:38 -0800 (PST)
MIME-Version: 1.0
References: <20251030135652.63837-1-luxu.kernel@bytedance.com>
In-Reply-To: <20251030135652.63837-1-luxu.kernel@bytedance.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 3 Nov 2025 11:44:25 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTi1=LfmCaMi9vzvUdcqRDqRDRVJ3KEPWdHamk6N01R0w@mail.gmail.com>
X-Gm-Features: AWmQ_bkMtbGH4DczTxT6oIArwMuBPA1I5yu6EgbGTXcignxiYJGggRhy2O4V1C8
Message-ID: <CAJF2gTTi1=LfmCaMi9vzvUdcqRDqRDRVJ3KEPWdHamk6N01R0w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/4] riscv: mm: Defer tlb flush to context_switch
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	apatel@ventanamicro.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_194440_600252_D2F6400B 
X-CRM114-Status: GOOD (  20.01  )
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

T24gVGh1LCBPY3QgMzAsIDIwMjUgYXQgOTo1N+KAr1BNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IFdoZW4gbmVlZCB0byBmbHVzaCB0bGIgb2YgYSByZW1vdGUg
Y3B1LCB0aGVyZSBpcyBubyBuZWVkIHRvIHNlbmQgYW4gSVBJCj4gaWYgdGhlIHRhcmdldCBjcHUg
aXMgbm90IHVzaW5nIHRoZSBhc2lkIHdlIHdhbnQgdG8gZmx1c2guIEluc3RlYWQsIHdlCj4gY2Fu
IGNhY2hlIHRoZSB0bGIgZmx1c2ggaW5mbyBpbiBwZXJjcHUgYnVmZmVyLCBhbmQgZGVmZXIgdGhl
IHRsYiBmbHVzaAo+IHRvIHRoZSBuZXh0IGNvbnRleHRfc3dpdGNoLgo+Cj4gVGhpcyByZWR1Y2Vz
IHRoZSBudW1iZXIgb2YgSVBJIGR1ZSB0byB0bGIgZmx1c2g6Cj4KPiAqIGx0cCAtIG1tYXBzdHJl
c3MwMQo+IEJlZm9yZTogfjEwOGsKPiBBZnRlcjogfjQ2awpHcmVhdCByZXN1bHQhCgpJJ3ZlIHNv
bWUgcXVlc3Rpb25zOgoxLiBEbyB3ZSBuZWVkIGFuIGFjY3VyYXRlIGFkZHJlc3MgZmx1c2ggYnkg
YSBuZXcgcXVldWUgb2YKZmx1c2hfdGxiX3JhbmdlX2RhdGE/IFdoeSBub3QgZmx1c2ggdGhlIHdo
b2xlIGFzaWQ/CjIuIElmIHdlIHJldXNlIHRoZSBjb250ZXh0X3RsYl9mbHVzaF9wZW5kaW5nIG1l
Y2hhbmlzbSwgY291bGQKbW1hcHN0cmVzczAxIGdhaW4gdGhlIHJlc3VsdCBiZXR0ZXIgdGhhbiB+
NDZrPwozLiBJZiB3ZSBtZWV0IHRoZSBrZXJuZWwgYWRkcmVzcyBzcGFjZSwgd2UgbXVzdCB1c2Ug
SVBJIGZsdXNoCmltbWVkaWF0ZWx5LCBidXQgSSBkaWRuJ3Qgc2VlIHlvdXIgcGF0Y2ggY29uc2lk
ZXIgdGhhdCBjYXNlLCBvciBhbSBJCndyb25nPwoKPgo+IEZ1dHVyZSBwbGFuIGluIHRoZSBuZXh0
IHZlcnNpb246Cj4KPiAtIFRoaXMgcGF0Y2ggc2VyaWVzIHJlZHVjZXMgSVBJIGJ5IGRlZmVycmlu
ZyB0bGIgZmx1c2ggdG8KPiBjb250ZXh0X3N3aXRjaC4gSXQgZG9lcyBub3QgY2xlYXIgdGhlIG1t
X2NwdW1hc2sgb2YgdGFyZ2V0IG1tX3N0cnVjdC4gSW4KPiB0aGUgbmV4dCB2ZXJzaW9uLCBJIHdp
bGwgYXBwbHkgYSB0aHJlc2hvbGQgdG8gdGhlIG51bWJlciBvZiBBU0lEcwo+IG1haW50YWluZWQg
YnkgZWFjaCBjcHUncyB0bGIuIE9uY2UgdGhlIHRocmVzaG9sZCBpcyBleGNlZWRlZCwgQVNJRCB0
aGF0Cj4gaGFzIG5vdCBiZWVuIHVzZWQgZm9yIHRoZSBsb25nZXN0IHRpbWUgd2lsbCBiZSBmbHVz
aGVkIG91dC4gQW5kIGN1cnJlbnQKPiBjcHUgd2lsbCBiZSBjbGVhcmVkIGluIHRoZSBtbV9jcHVt
YXNrLgo+Cj4gVGhhbmtzIGluIGFkdmFuY2UgZm9yIHlvdXIgY29tbWVudHMuCj4KPiBYdSBMdSAo
NCk6Cj4gICByaXNjdjogbW06IEludHJvZHVjZSBwZXJjcHUgbG9hZGVkX2FzaWQKPiAgIHJpc2N2
OiBtbTogSW50cm9kdWNlIHBlcmNwdSB0bGIgZmx1c2ggcXVldWUKPiAgIHJpc2N2OiBtbTogRW5x
dWV1ZSB0bGJmbHVzaCBpbmZvIGlmIHRhc2sgaXMgbm90IHJ1bm5pbmcgb24gdGFyZ2V0IGNwdQo+
ICAgcmlzY3Y6IG1tOiBQZXJmb3JtIHRsYiBmbHVzaCBkdXJpbmcgY29udGV4dF9zd2l0Y2gKPgo+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL21tdV9jb250ZXh0LmggfCAgMSArCj4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCAgICB8ICA0ICsrCj4gIGFyY2gvcmlzY3YvbW0vY29u
dGV4dC5jICAgICAgICAgICAgICB8IDEwICsrKysKPiAgYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5j
ICAgICAgICAgICAgIHwgNzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ICA0IGZpbGVz
IGNoYW5nZWQsIDkwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IC0tCj4gMi4yMC4x
Cj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
