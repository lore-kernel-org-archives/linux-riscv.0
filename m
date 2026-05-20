Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26637CD4F54
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 05:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ll5CdNSQ6Ij0k7HOVAN9tIZaEG46hBEmAJRSoTQW4g=; b=wZe418zahrD64/
	AgEZS73ZdCuUN/wCAKC+JvWJSpEB5W07SJyHKcoOI+flyayl4s7mddLNrDHHoNwUasoWF66sbPD6S
	xQJgfo/PSqNP1+lVpX3EDBk/0KUVmTVz99aj/OuCMznyLhh3XKY6MRxlXTLI4rLYut1QEcF2oSIyZ
	IvbVPUP6Vtz1bx8AzxYmWtFHUGCMQYCggFIcmRSqYnk/jZGFI2s9RJGoFWhTrpcbeKsFmzg5XADGj
	/HbP80tnM/UZ/OwxPxPdhBDdUArjb4RHv1ZOmVjG5apsm//z4gVAoVHvXp+tbUSgCfFee5wNQxx+L
	b1Kd3hcWfRMIFsArB69w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZqI-00000003bG3-06xi;
	Wed, 20 May 2026 05:51:42 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZqE-00000003bEw-03np
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 05:51:39 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-50d864c23bdso15451cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 22:51:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779256296; cv=none;
        d=google.com; s=arc-20240605;
        b=PvGSMJvN4/Og4BQ76NfjT0FRufXjT3Q1VpRuk5qAxUNuP6lansqzkfWOjzXFWpKXGI
         CO/KwaW/U6c6raujgfdzVyZPjNPeUCn2nDy8wT1YHT0Y69i6NosseioEtXkCXFNQK4bR
         Xg92xgaay3Xq3gRP099kCj+vHE6LNKwtujAr+AvwPARYklR1aKNKr1MbH1BFgqJo8qPM
         EEJBPQ5536PXtPFRhA5y49WSyUxd/57e1MmvvzdnBGpuGAYo9Ne8RcMWjAH7nSDVDHPn
         b2dNyKfSrRwYDOHyQfBBs34f9HBcyOFsl2dC5VVWHaId+tuPoHAPdu4ka7UV+AnEHVco
         no/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gt9LoBM9h0v+gvRnQ1bJjfV7wmkEM4+ijibPUWac/Iw=;
        fh=DrNVDr9SsX04u/HH9NZbt8ORm3owzyQVslX+JXhoXLE=;
        b=VGTkbTW6KwiTmjDAtxSUWvM7WVnm0gva/cjSkwGIc1fqNkqL4ZGDbZU+JICghrm+Ot
         et+lHjE0zcUCdd33hR1hUVwURmL32dJBFr91hAJ2UcvWZwANf7+5qSkINgdV0TUDJTcm
         WKBZ0WWNVEcGrnLn/E2ZZCGC7ySsPgclOW7clsp9Pt17X5A2W1Pq63dptU4xOAgYyUvJ
         I+7m/cHlyvnDI3I8Vys95d3ph3tcSakXWEN4Ewg8GBCfOZYNtmbgJLgszH0GPFTaaXi3
         N7qEhLq7Lga+T9hfHYU4uB4KleI/AZ9LJ8sPojOTSWRoTgIJNLRK79YDKo10f4dOYgRE
         TI6g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779256296; x=1779861096; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gt9LoBM9h0v+gvRnQ1bJjfV7wmkEM4+ijibPUWac/Iw=;
        b=mTuXwjhPHWIKm/JeMIASGiz9m95DmTVJbOvkMm2A4MQDpBb4+KfRGXkXbVt0lHVNjw
         fITpUJVYnlgAlKNRa/ZISmhxtGWBDBkkk+iFDCayBkPBU6pJx9GYazEq/CiSLCd2im3u
         FOyKmlVl1kaOIZGE9muqz2Xh1tQV1lyv6rCrCfXm9/mLDfMlIfEn4f58aDUQzNvy1NHD
         RpDOIKZEqa3Jb5BL8FduTyiGePHamwi+0D9vIl5bfBGqZ51ESdSpiM98OcGglzt4YGcr
         Weg7xvxRKvyvV29GNrYjEsJEbiS50MTuL6/SNNfs2YC9f9sx6PWTb0UIlvGg7xhNL9iW
         bVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779256296; x=1779861096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gt9LoBM9h0v+gvRnQ1bJjfV7wmkEM4+ijibPUWac/Iw=;
        b=oVJGlarsFX0GjddfNNf5tQpBI0Ywd1JnkWsC8hp2lfNZCKCtz3smtXTlajfQKOPGQN
         nlCkrZ32mrF4avwfmLILAyHBaecOIM0sqcNvtnsDiP7Ht1aSt09uOQN0kFM/2ukIWiDD
         Fd/74FCWKELKgjMqDlWI7WFQghr6/tESZLgZKbGdnxFfrIBF1KfPoTsmvBE9a1WiIGsE
         W9TlOhF0ls1PWJ13NMIMkrjwqhohH3NwEHhLDaDrJNk9/lN/8WW30D++koo0tdRvtez0
         FNM9CUnK/09jrNbOCPlSKFpkLn6G5KcuFJcFghq+PxBWiq2n3P2wjb1aIbe0gkBJie/X
         SdEg==
X-Forwarded-Encrypted: i=1; AFNElJ/06widjMCcIdcZX1UkGDbaxOY+q/Pgef7Cy/mU/7PUbhKy+HuHDZ+oNa8wWDTGQnXy1xRZTPukAUL7rw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDHDAp0S7lImLIAYiOtinqGXD22rD75aHtPkzj9JzeWBFBEC9w
	aVoADaUOjiG2GT18H6Uge1f03vSi4ct9tRY/BziDMVysBPkpc/g7MP9uysOYtHYOaaJlg9rzeNg
	0DGoMO57EUvk88vkPwD4vWi0PcN03kCi2WQTbzLix
X-Gm-Gg: Acq92OHr1cw+jNHViVzxCpB7rCWYckF+Wzo5a2euY+SNeHCS8g5QLkwX7JYn1NpCmz/
	/etbGdouhbXQBsBwivVO/tlBbyy7NXQJmUJ+KISiK4OsSEZqQLKjEh7znYGqnVfNg8e2nuxTPtl
	l/wSM3bWNq04+9fhyK5tLMaAa53D/DaudPcPxz8KdAlM9cUC4y1oMXbcz5bMlTmkC4ExjbKNLEO
	4JitfwIxX8h/8Y5BgAVDT196ajAYlqemmPA8048rr99du4KDdlwlJyXNv5bSOwbbcerYJxXBSps
	+SzKHP2MNuGb41zsx0PcBFtyq4HS2CGxzR/vUMlHqn8NBw==
X-Received: by 2002:a05:622a:1920:b0:514:b17e:86f3 with SMTP id
 d75a77b69052e-51679461795mr15633081cf.12.1779256295164; Tue, 19 May 2026
 22:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer> <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com> <agxbq1TxJdniMQT3@lucifer>
In-Reply-To: <agxbq1TxJdniMQT3@lucifer>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 20 May 2026 05:51:23 +0000
X-Gm-Features: AVHnY4KMccW5pUeVLxDyTF9Gnh50gzRE3EOZpgiKFqqXipSU5KPE9rQdYzJrFBQ
Message-ID: <CAJuCfpG2Zmpf5N_ejB6ZDv8LDjpVtTfA_tYQ6sW+Noc9Y+XhdA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Barry Song <baohua@kernel.org>, Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_225138_230493_CE9BA13E 
X-CRM114-Status: GOOD (  29.60  )
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

T24gVHVlLCBNYXkgMTksIDIwMjYgYXQgMTI6NTPigK9QTSBMb3JlbnpvIFN0b2FrZXMgPGxqc0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgTWF5IDE4LCAyMDI2IGF0IDEyOjU2OjU5UE0g
LTA3MDAsIFN1cmVuIEJhZ2hkYXNhcnlhbiB3cm90ZToKPgo+ID4gPgo+ID4gPiBJIHRoaW5rIHdl
IGVpdGhlciBuZWVkIHRvIGZpeCBgZm9yaygpYCwgb3Iga2VlcCB0aGUgY3VycmVudAo+ID4gPiBi
ZWhhdmlvciBvZiBkcm9wcGluZyB0aGUgVk1BIGxvY2sgYmVmb3JlIHBlcmZvcm1pbmcgSS9PLgo+
ID4KPiA+IEkgc2VlLiBTbywgdGhpcyBwcm9ibGVtIGFyaXNlcyBmcm9tIHRoZSBmYWN0IHRoYXQg
d2UgYXJlIGNoYW5naW5nIHRoZQo+ID4gcGFnZWZhdWx0cyByZXF1aXJpbmcgSS9PIG9wZXJhdGlv
biB0byBob2xkIFZNQSBsb2NrLi4uCj4gPiBBbmQgeW91IHdhbnQgdG8gbG9jayBWTUEgb24gZm9y
ayBvbmx5IGlmIHZtYV9pc19hbm9ueW1vdXModm1hKSB8fAo+ID4gaXNfY293X21hcHBpbmcodm1h
LT52bV9mbGFncykuIFNvLCB3ZSB3aWxsIGJlIGJsb2NraW5nIHBhZ2UgZmF1bHRzIGZvcgo+ID4g
YW5vbnltb3VzIGFuZCBDT1cgVk1BcyBvbmx5IHdoaWxlIGhvbGRpbmcgbW1hcF93cml0ZV9sb2Nr
LCBwcmV2ZW50aW5nCj4gPiBhbnkgVk1BIG1vZGlmaWNhdGlvbi4gT24gdGhlIHN1cmZhY2UsIHRo
YXQgbG9va3Mgb2sgdG8gbWUgYnV0IEkgbWlnaHQKPiA+IGJlIG1pc3Npbmcgc29tZSBjb3JuZXIg
Y2FzZXMuIElmIG5vYm9keSBzZWVzIGFueSBvYnZpb3VzIGlzc3VlcywgSQo+ID4gdGhpbmsgaXQn
cyB3b3J0aCBhIHRyeS4KPgo+IE5vdCBzdXJlIGlmIHlvdSBub3RpY2VkIGJ1dCBJIGRpZCByYWlz
ZSBjb25jZXJucyA7KQoKU29ycnksIEkgZGlkbid0IHJlYWxpemUgeW91ciBmaXJzdCBjb21tZW50
IHdhcyBhIGNvbmNlcHR1YWwgb2JqZWN0aW9uCnRvIHRoaXMgYXBwcm9hY2ggb2YgYWxsb3dpbmcg
cGFnZSBmYXVsdHMgdG8gcmFjZSB3aXRoIHRoZSBmb3JrLgoKCj4KPiBJIHdvbmRlciBpZiB5b3Un
dmUgY29uZnVzZWQgdGhlIGZhdWx0IHBhdGggYW5kIGZvcmsgaGVyZSwgYXMgSSB0aGluayBCYXJy
eSBoYXMKPiBiZWVuIGEgbGl0dGxlIHVuY2xlYXIgb24gdGhhdC4KPgo+IFdoYXQncyBiZWluZyBz
dWdnZXN0ZWQgaW4gdGhpcyB0aHJlYWQgaXMgdG8gZnVuZGFtZW50YWxseSBjaGFuZ2UgZm9yayBi
ZWhhdmlvdXIKPiBzbyBpdCdzIGRpZmZlcmVudCBmcm9tIHRoZSBlbnRpcmUgaGlzdG9yeSBvZiB0
aGUga2VybmVsIChvciAtIHByZXN1bWFibHkgLSBhdAo+IGxlYXN0IHJlY2VudCBoaXN0b3J5IDop
IGFuZCBwZXJtaXQgY29uY3VycmVudCBwYWdlIGZhdWx0cyB0byBvY2N1ciBvbiBhIGZvcmtpbmcK
PiBwcm9jZXNzLgo+Cj4gSSBhYnNvbHV0ZWx5IG9iamVjdCB0byB0aGlzIGZvciBiZWluZyBwcmV0
dHkgY3JhenkuIEkgbWVhbiBJJ20gbm90IHN1cmUgd2UKPiByZWFsbHkgd2FudCB0byBiZSBzaW11
bHRhbmVvdXNseSBtb2RpZnlpbmcgcGFnZSB0YWJsZXMgd2hpbGUgaW52b2tpbmcKPiBjb3B5X3Bh
Z2VfcmFuZ2UoKT8gTm8/Cj4KPiBPSyB5b3UgY292ZXIgYW5vbiBhbmQgTUFQX1BSSVZBVEUgZmls
ZS1iYWNrZWQgYnV0IGhhbmcgb24gdGhlcmUncwo+IFZNX0NPUFlfT05fRk9SSyB0b28uLiBzbyBQ
Rk4gbWFwcGVkLCBtaXhlZCBtYXAgYW5kICh0aGUgYWNjdXJzZWQpIFVGRkQgVy9QIGFzCj4gd2Vs
bCBhcyBwb3NzaWJseS1ndWFyZCByZWdpb24gY29udGFpbmluZyBWTUFzIG5vdyBjYW4gaGF2ZSBw
YWdlIHRhYmxlcyByYWNlZC4KClVnaCwgeWVhaCwgSSByZWFsaXplIG5vdyB0aGlzIGlzIGEgbWlu
ZWZpZWxkLiBSZXNvbHZpbmcgYWxsIHBvc3NpYmxlCnJhY2VzIHRoZXJlIHdvdWxkIG5vdCBiZSB0
cml2aWFsIGFuZCBtaWdodCBpbnRyb2R1Y2Ugb3RoZXIgcGVyZm9ybWFuY2UKaXNzdWVzLgoKPgo+
IFRoYXQncyBub3QgdG8gbWVudGlvbiBhbnl0aGluZyBlbHNlIHRoYXQgcmVsaWVzIG9uIHNlcmlh
bGlzYXRpb24gaGVyZSAodGhpcwo+IHdvdWxkIGJlIGNoYW5naW5nIGhvdyBmb3JraW5nIGhhcyBi
ZWVuIGRvbmUgaW4gZ2VuZXJhbCkgdGhhdCB3ZSBtYXkgb3IgbWF5IG5vdAo+IGtub3cgYWJvdXQu
Cj4KPiBUaGUgcmlzayBsZXZlbCBpcyBoaWdoLCBmb3Igd2hhdCBhbW91bnRzIHRvIGEgaGFjayB0
byB3b3JrIGFyb3VuZCB0aGUgZmF1bHQKPiBpc3N1ZS4KPgo+IEkgc3VnZ2VzdCB0aGF0IGlmIHdl
IGhhdmUgYSBwcm9ibGVtIHdpdGggdGhlIGZhdWx0IHBhdGgsIGxldCdzIGxvb2sgYXQgdGhlIGZh
dWx0Cj4gcGF0aCA6KQo+Cj4gU28geWVhaCBJJ20gdmVyeSBvcHBvc2VkIHRvIHRoaXMgdW5sZXNz
IEknbSBzb21laG93IGhvcnJpYmx5IG1pc3Rha2VuIGhlcmUgb3IgYQo+IHZlcnkgY29udmluY2lu
ZyBhcmd1bWVudCBpcyBtYWRlLgoKU28sIGN1cnJlbnQgYXBwcm9hY2ggb2YgZHJvcHBpbmcgbG9j
a3MgZHVyaW5nIEkvTyBzb3VuZHMgbGlrZSBzdGlsbAp0aGUgYmVzdCBzb2x1dGlvbi4KCj4KPgo+
ID4KPiA+Cj4gPgo+ID4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+IEknZCBhbHNvIGxpa2UgdG8gZ2V0
IFN1cmVuJ3MgaW5wdXQsIGhvd2V2ZXIuCj4gPiA+Cj4gPiA+IFllcy4gb2YgY291cnNlLgo+ID4g
Pgo+ID4gPiA+Cj4gPiA+ID4gVGhhbmtzLCBMb3JlbnpvCj4gPiA+Cj4gPiA+IEJlc3QgUmVnYXJk
cwo+ID4gPiBCYXJyeQo+Cj4gQ2hlZXJzLCBMb3JlbnpvCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
