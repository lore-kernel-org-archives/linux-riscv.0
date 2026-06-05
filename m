Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBC5CD6E74
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 04:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0AfGvk3vDhIOEsaqSxYjBrOeME6VNtu0JkcGkVLib2w=; b=RxK5b6SfCd5gd1
	RNfl0sLA3p2fYr7PtMPi6OjaQ0bxMpwq6wGxdkilUX74mau8occB9eqa719r9HK5daHDi4Nit9Sig
	XEZOTCEsUf7xle0mxyArCEFZgLiiR2gWNS06le3EftUClI4rlwVrGf3+coSC/pLsR0ZkxrECh6MtL
	aw9uVqlWk57sWmUFh5eMlKsWdsWLkyohiIM0ZzRE9DIrlo5Rgp/kjwb/IO5v7/9BAwJ5agcRGRkVg
	vhrb1OL04AqkWOtuQcBweQO0/p55Vi0VTk9H/Li0MihSbNvrTA/9HIU1/1+t+EyxGE0RrjyqqZZ/F
	XHUZiNhxZZE37WtPNvQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVLn6-000000003vh-2hYi;
	Fri, 05 Jun 2026 04:04:16 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVLn4-000000003vK-2nLR
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 04:04:16 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-43f5927e70aso648484fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jun 2026 21:04:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780632250; cv=none;
        d=google.com; s=arc-20240605;
        b=M4SgAsM/047HJlqLBNBJZutxsaAf9BjG9u9qUibcrnUXAeTBL3GhJ00d5u2tGRHExc
         2NmYWPXkNdRy5fG9J9+AtEVvXuJqmBwztl9HXa9JR0Iy8JhQjz+ab9RnKsK5ZkkI686z
         JmMwJqO/1N7+476YlFH6dJxWhQ8skb2bFZ8FmYgN5I44auC5qicjKSd073B/YELEde9T
         k1a87pza2XHBtOklUbUi9xBCPQw6/wi5Qt6At9afXCBPM1t8fW9YU0R42XkR1KHYEHJC
         8v6KtMHO7gY9YchNcth0ALAwDHiA74DovsfN++l2L9vNo1NSzt44wDGuWO5tL23UnQwR
         KC2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WU2MZ9gTzdCxj3z3pNHIH3hYvAv4mvLkS53mP/Ms51g=;
        fh=HhdR+YfKLYHGZzKNoG2xFj1DS/YZtZUCwUXyCqR38dE=;
        b=Ud+/pJ63c6JIKUIT5ipv6GOUQstP3qGyOI3YEMCkRIlmRQgoDUDOqZyhlNp6C4O1TO
         kTpJ85Y8REZcWRheKB7fgK2te5YquOAAXvSnvnR+uXxgZvbhqueVvh4aE6D9T/TIdgiF
         v5ML11+HTfkSrd7jORTUh4Xyr0GVAsOGOzrxK+ePAL0J92BG86okoKhv1n3W682NU7Ab
         pGk7wObewQCSPGKpg0jPUoXYJnOKpIahxhyVrhTrWXqItGg9o+BFHUWSQET6DJp2ohW8
         q8twZTwD0Ggq/mqsNmIA//pPjpGuME21xAv17MN7TWo0kyZNlMyjeeoTw4kdHgcXy1ZY
         y9gA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780632250; x=1781237050; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WU2MZ9gTzdCxj3z3pNHIH3hYvAv4mvLkS53mP/Ms51g=;
        b=GeEEOUYvvmSK7GE9LxjsKBpvegi9KKYdW3nuCr6vP6Ild54WAKJP9wrVYJDy8GeWui
         hTRxdykZQp3M6JLuU9x2lJzsBYjCzzziC9FMaQAGt2nGZoLoAt4RRXUL8KnMb9oQQ/01
         pOwRj0fM847e21v9t4SiLVMNNSUscQSZUsnTeDEBkR8Np/ziwo+Q3Oxrltr6bIP1r3Pp
         gNhe0ZZJ7v95g7RbgPlqRWTRzbTbVHVIwdRZ88XcwkXQq7K9SB6x+kMF7cM7Xpq4yte+
         7O5nFgOaas9mQK64fdch4Qso3lLP8kU+3lJcEuhPYTE3IskVNJnSvtslyHwDX0rJ8dI0
         Z+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780632250; x=1781237050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WU2MZ9gTzdCxj3z3pNHIH3hYvAv4mvLkS53mP/Ms51g=;
        b=gzH23Yd/V2TA7w4sDLxRaSTz9sWyb8F6Xi31kG8DqktBY42ZWOeR6duV8JeWS5YD6E
         RUUG4MtvO+sIT2KvqV33t0shbPzjHfH+JxzraBYEZxghI7PXNlArnISJpPtpDsEnKurR
         SH5BEuwRZeKw2zUH0erwHQvl33LYXm7PvCzk3ZpWQrF31Uud8roIr4ef8nOaRsB91Fke
         EsJi9FlbB2Fk8PzrGWiZgyz1JsnzhLiZHViPeK9ohiHg71D9UjZdtX58rQ6KSRakHy40
         wVls1QN1h+92pT5TBKCko3gZ0OVAsWB58esQ2+p3O/U86SCEEaOCbK/R4lLBkXnh9m0y
         yS6w==
X-Forwarded-Encrypted: i=1; AFNElJ8LKtQ9wkGRTLyBszU5sLvGRszOAPbjanlgKhlmKr8JnL0yWHgnw3BrjI5WW9z14FXF0H5yDGVEz5i8EA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwR63mVPTi7NLsKRTU9VCy6sFp8MycEu0BIU7lNCyPv9Dbo7I2n
	FEwHt5sUQj5iEM/Qko10007iuqkIuqlhEDEZU6p2QzgPAg/IM4w2JDWDm2u4zIGJEhZg4I+6kym
	R+NbW7eiQ2OUKrpYpMXYwtrU7nl99RjCckSt770XY5A==
X-Gm-Gg: Acq92OGevtEVVsOMGG4yDj3YFpIGanKb68TuHS8xxjyMNE6yXa8OzpXjaCpuJw80q3I
	xEAFF3ECC0StE9KwPmO80C2Z6WqW9qDZG8KbG+HhLuf/GAr/teGA3dyFCpPUFwXYPBEgi8gCk8L
	+O94LNjHdxeG5O0MCR41QopezXtVSNboGmxHmUUlOxg9BepSpLRgVvT5yKqKlzABdoQ6eVvtQrs
	bIpPSxX64Ed9RlJjPxr8+07YzGWR1+BktOplYqROJUn369NU1zEI4HrabZSeaqHpZPTZbxA7qGr
	cLNfzVbmEhSL+5WQFhFv
X-Received: by 2002:a05:6871:729:b0:440:e18f:c17b with SMTP id
 586e51a60fabf-4413d8c1927mr1043972fac.14.1780632250264; Thu, 04 Jun 2026
 21:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260515065048.94564-1-cuiyunhui@bytedance.com> <252be770-4d9f-954a-9388-8f7b52a92d90@kernel.org>
In-Reply-To: <252be770-4d9f-954a-9388-8f7b52a92d90@kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 5 Jun 2026 12:03:57 +0800
X-Gm-Features: AVVi8CfJzfw8QQiRtunxFq-NUfTJkIEqAOk44niae1WxngDtB7-RHX2XNxBPT3Y
Message-ID: <CAEEQ3wmnZnoDm_YvHTwSdTs1RJTt009tVFQM-TtS+6O8TJpG2w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] riscv: mm: exclude invalid THP PMDs from
 page table check
To: Paul Walmsley <pjw@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	tongtiangen@huawei.com, akpm@linux-foundation.org, pasha.tatashin@soleen.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_210414_741313_D294543F 
X-CRM114-Status: GOOD (  18.20  )
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

SGkgUGF1bCwKCk9uIFNhdCwgTWF5IDIzLCAyMDI2IGF0IDc6MTDigK9BTSBQYXVsIFdhbG1zbGV5
IDxwandAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIDE1IE1heSAyMDI2LCBZdW5odWkg
Q3VpIHdyb3RlOgo+Cj4gPiBSSVNDLVYgVEhQIHNwbGl0dGluZyB1c2VzIGEgdGVtcG9yYXJ5IGlu
dmFsaWQgUE1EIHN0YXRlIHdoZXJlCj4gPiBwbWRfbWtpbnZhbGlkKCkgY2xlYXJzIF9QQUdFX1BS
RVNFTlQgYW5kIF9QQUdFX1BST1RfTk9ORSBidXQgbGVhdmVzCj4gPiBfUEFHRV9MRUFGIHNldCBz
byB0aGUgTU0gY29kZSBjYW4gc3RpbGwgcmVjb2duaXplIHRoZSBQTUQgYXMgYSBUSFAgc3BsaXQK
PiA+IGluLXByb2dyZXNzIGVudHJ5Lgo+ID4KPiA+IFRoYXQgdGVtcG9yYXJ5IHN0YXRlIG5vIGxv
bmdlciBkZXNjcmliZXMgYSB1c2VyLWFjY2Vzc2libGUgbWFwcGluZywgYnV0Cj4gPiBwYWdlX3Rh
YmxlX2NoZWNrIGN1cnJlbnRseSB0cmVhdHMgaXQgYXMgb25lIGJlY2F1c2UgdGhlIFJJU0MtViBQ
TUQKPiA+IHVzZXItYWNjZXNzaWJpbGl0eSB0ZXN0IG9ubHkgY2hlY2tzIHdoZXRoZXIgdGhlIFBN
RCBpcyBhIGxlYWYgYW5kIGhhcwo+ID4gdXNlciBwZXJtaXNzaW9ucy4KPiA+Cj4gPiBBcyBhIHJl
c3VsdCwgd2hlbiBhIFBNRC1zaXplZCBhbm9ueW1vdXMgVEhQIGlzIHNwbGl0IGR1cmluZyBhIENP
VyBmYXVsdCwKPiA+IHBhZ2VfdGFibGVfY2hlY2sgY2FuIGFjY291bnQgdGhlIGludmFsaWQgaW50
ZXJtZWRpYXRlIFBNRCBhcyBhIGxpdmUgUE1ECj4gPiBtYXBwaW5nLCBhbmQgdGhlbiBhY2NvdW50
IHRoZSByZXBsYWNlbWVudCBQVEUgbWFwcGluZ3MgYWdhaW4gd2hlbiB0aGUKPiA+IHNwbGl0IGlu
c3RhbGxzIHRoZSBQVEUgdGFibGUuIFRoaXMgbGVhdmVzIHN0YWxlIFBNRCBhY2NvdW50aW5nIGJl
aGluZCBhbmQKPiA+IGxhdGVyIHRyaWdnZXJzIHBhZ2VfdGFibGVfY2hlY2sgZmFpbHVyZXMgc3Vj
aCBhcyBhIG5vbi16ZXJvCj4gPiBhbm9uX21hcF9jb3VudCB3aGVuIHRoZSBmb2xpbyBpcyBmcmVl
ZC4KPiA+Cj4gPiBGaXggdGhpcyBieSB0aWdodGVuaW5nIHBtZF91c2VyX2FjY2Vzc2libGVfcGFn
ZSgpIHNvIFBNRCBwYWdlLXRhYmxlLWNoZWNrCj4gPiBhY2NvdW50aW5nIG9ubHkgY29uc2lkZXJz
IGxlYWYgUE1EcyB0aGF0IHN0aWxsIGNhcnJ5IGVpdGhlcgo+ID4gX1BBR0VfUFJFU0VOVCBvciBf
UEFHRV9QUk9UX05PTkUuIFRoaXMgcHJlc2VydmVzIHRoZSBUSFAgc3BsaXQgc2VtYW50aWNzCj4g
PiByZXF1aXJlZCBieSB0aGUgTU0gY29kZSB3aGlsZSBwcmV2ZW50aW5nIHBhZ2VfdGFibGVfY2hl
Y2sgZnJvbSB0cmVhdGluZwo+ID4gaW52YWxpZCBzcGxpdCBQTURzIGFzIGxpdmUgdXNlciBtYXBw
aW5ncy4KPiA+Cj4gPiBXaXRoIENPTkZJR19QQUdFX1RBQkxFX0NIRUNLPXkgYW5kIENPTkZJR19Q
QUdFX1RBQkxFX0NIRUNLX0VORk9SQ0VEPXksCj4gPiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9t
bS9jb3cgY29tcGxldGVzIHN1Y2Nlc3NmdWxseSBvbiBSSVNDLVYgYWZ0ZXIKPiA+IHRoaXMgY2hh
bmdlLgo+ID4KPiA+IEZpeGVzOiAzZmVlMjI5YThlYjkgKCJyaXNjdi9tbTogZW5hYmxlIEFSQ0hf
U1VQUE9SVFNfUEFHRV9UQUJMRV9DSEVDSyIpCj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
Zwo+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+
Cj4KPiBUaGFua3MgZm9yIHRoZSBwYXRjaCwgYnV0IGl0IGRvZXNuJ3QgYXBwbHkgYXMtaXMuICBD
b3VsZCB5b3UgZml4IGl0IGFuZAo+IHJlc2VuZD8KClRoYW5rcyBmb3IgdGhlIGhlYWRzLXVwLiBJ
IGhhdmUgZml4ZWQgdGhlIGFwcGx5IGlzc3VlIGFuZCByZXNlbnQgaXQgaGVyZToKaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNTIzMDQyMDUyLjM1NDc2LTEtY3VpeXVuaHVpQGJ5dGVk
YW5jZS5jb20vCgo+Cj4KPiAtIFBhdWwKCiBUaGFua3MsCiBZdW5odWkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
