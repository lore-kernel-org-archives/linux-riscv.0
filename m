Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A234CD4F3C
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 09:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z09/Mec3z7HNsNlpbluS8KAvOomgPYyPDbkCMnkVyN0=; b=cE0zIhsPL5DfQY
	paWgkIKWpXN8ZW/aj0PWeooYlzvFkbRkc3jubHJjnFYUcgu5LxHpO43gr9rpNB3MMxOHzUSzpz6Ef
	AsFvdquT1EkxIJ/P42lHnC8igLJHq2uLVGJRSm4I5WZEVgEjLQgz9AshmhICck2+XS35jVj8wqXyr
	Ir4OCKwe/m75NJiJHrFGQVEKjgqjhH7hKo1DPhzpjPgjSkBiwGw9Y9U27uuuUaqJrd8s4SRLWnGzE
	7RxYP9sGUCTzlMxXfyJKTRp6MXT3hRDUjY5zRyU9RJSfpe2esYo7/B0n4FxxmDtz2uUdbEcEvogdA
	pMZZW8R8AvWJM8c6W2WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPctp-000000044Cx-17jj;
	Wed, 20 May 2026 09:07:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPcto-000000044CR-15u0
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 09:07:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A8AB60129
	for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 09:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53DC11F00893
	for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 09:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779268051;
	bh=v4NWBagxYzHasGGEcU79T5ijVXX4z2pUOQ5qYXZ7jJc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HBpj2TO2qA5Oor7OHt5Ye/pMrVKsAa+tgR47UAhIhwI3yvvVE0YC6Uki3M1ZSwg9X
	 asyERscZ397Lo+0XizKdIs72Miu1IMnt3PRJZo3ougkZdBCWhlygkHaiUNzohh15IR
	 vAhXqfXC3iF2RbQvfZPdWAgx6KAPH7jkop0CvuXrEWN21u49pHn8RQZD1BwA27fuvq
	 Bt1H1Lj4ObEpuYoP93W/mda/nuhZ48Up1nhVyCOwnVaQZ1CLCPdw5a+spdcD5TWEp6
	 0QGlED+uyIsjRv5jN30SuEcKCOlN+lu8whLsgH/GtAV5SFLkN7eCCxHzB79FTYk8Yj
	 HlaNDYyigSwqA==
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8b7f937ef44so29959216d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 02:07:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Wet00+3Kq7GmBWNgWHZQuMUaFVL2jCAmFjdOWo9ySR89wvvW6q3bGS1n95qOTMn4ErKVabE1GikbeLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxL/aq9emcwiq8L5z2zCt5S6ukx6QGrQM2OHcVZXpsu5yQll2+Y
	fo20YM2xKJ00AmNb22+DmVbLgy7xb9xB3iN/DPr0lgbHC/+YRMIIoPlAodifRnVqBzI8wq4E1tD
	b/CtzIrUpz/Gsz2nLNunaqtfmH8ZmEe4=
X-Received: by 2002:a05:6214:29e1:b0:8cb:fd76:e904 with SMTP id
 6a1803df08f44-8cbfd76eac8mr35985186d6.17.1779268050694; Wed, 20 May 2026
 02:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer> <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <agxbq1TxJdniMQT3@lucifer> <CAGsJ_4zxyZP_xkFCGWfLyXkqomrX6DNqyMVirk=aggtwB1zExw@mail.gmail.com>
 <ag1mk2DSJsiORaxK@lucifer>
In-Reply-To: <ag1mk2DSJsiORaxK@lucifer>
From: Barry Song <baohua@kernel.org>
Date: Wed, 20 May 2026 17:07:16 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zN5ezh9vvvQDQdMF2KuuDGvkhNjTZWc0y0Lsa-P4Aahw@mail.gmail.com>
X-Gm-Features: AVHnY4JPJjfMfRWu5irKuds8oTQCJquviUDQwK-7Iye_Xeif_N9I88YUISr9aq8
Message-ID: <CAGsJ_4zN5ezh9vvvQDQdMF2KuuDGvkhNjTZWc0y0Lsa-P4Aahw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
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

T24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgMzo1MOKAr1BNIExvcmVuem8gU3RvYWtlcyA8bGpzQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgMDU6MTg6NTJBTSAr
MDgwMCwgQmFycnkgU29uZyB3cm90ZToKPiA+IE9uIFR1ZSwgTWF5IDE5LCAyMDI2IGF0IDg6NTPi
gK9QTSBMb3JlbnpvIFN0b2FrZXMgPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4g
T24gTW9uLCBNYXkgMTgsIDIwMjYgYXQgMTI6NTY6NTlQTSAtMDcwMCwgU3VyZW4gQmFnaGRhc2Fy
eWFuIHdyb3RlOgo+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IEkgdGhpbmsgd2UgZWl0aGVyIG5l
ZWQgdG8gZml4IGBmb3JrKClgLCBvciBrZWVwIHRoZSBjdXJyZW50Cj4gPiA+ID4gPiBiZWhhdmlv
ciBvZiBkcm9wcGluZyB0aGUgVk1BIGxvY2sgYmVmb3JlIHBlcmZvcm1pbmcgSS9PLgo+ID4gPiA+
Cj4gPiA+ID4gSSBzZWUuIFNvLCB0aGlzIHByb2JsZW0gYXJpc2VzIGZyb20gdGhlIGZhY3QgdGhh
dCB3ZSBhcmUgY2hhbmdpbmcgdGhlCj4gPiA+ID4gcGFnZWZhdWx0cyByZXF1aXJpbmcgSS9PIG9w
ZXJhdGlvbiB0byBob2xkIFZNQSBsb2NrLi4uCj4gPiA+ID4gQW5kIHlvdSB3YW50IHRvIGxvY2sg
Vk1BIG9uIGZvcmsgb25seSBpZiB2bWFfaXNfYW5vbnltb3VzKHZtYSkgfHwKPiA+ID4gPiBpc19j
b3dfbWFwcGluZyh2bWEtPnZtX2ZsYWdzKS4gU28sIHdlIHdpbGwgYmUgYmxvY2tpbmcgcGFnZSBm
YXVsdHMgZm9yCj4gPiA+ID4gYW5vbnltb3VzIGFuZCBDT1cgVk1BcyBvbmx5IHdoaWxlIGhvbGRp
bmcgbW1hcF93cml0ZV9sb2NrLCBwcmV2ZW50aW5nCj4gPiA+ID4gYW55IFZNQSBtb2RpZmljYXRp
b24uIE9uIHRoZSBzdXJmYWNlLCB0aGF0IGxvb2tzIG9rIHRvIG1lIGJ1dCBJIG1pZ2h0Cj4gPiA+
ID4gYmUgbWlzc2luZyBzb21lIGNvcm5lciBjYXNlcy4gSWYgbm9ib2R5IHNlZXMgYW55IG9idmlv
dXMgaXNzdWVzLCBJCj4gPiA+ID4gdGhpbmsgaXQncyB3b3J0aCBhIHRyeS4KPiA+ID4KPiA+ID4g
Tm90IHN1cmUgaWYgeW91IG5vdGljZWQgYnV0IEkgZGlkIHJhaXNlIGNvbmNlcm5zIDspCj4gPiA+
Cj4gPiA+IEkgd29uZGVyIGlmIHlvdSd2ZSBjb25mdXNlZCB0aGUgZmF1bHQgcGF0aCBhbmQgZm9y
ayBoZXJlLCBhcyBJIHRoaW5rIEJhcnJ5IGhhcwo+ID4gPiBiZWVuIGEgbGl0dGxlIHVuY2xlYXIg
b24gdGhhdC4KPiA+Cj4gPiBJIHRoaW5rIEnigJl2ZSBiZWVuIGFic29sdXRlbHkgY2xlYXIgOi0p
Cj4KPiBPbiB0aGlzIHBvaW50IHN1cmUsIEkgd291bGQgYXJndWUgbGVzcyBzbyBhcm91bmQgdGhl
IGZvcmsgc3R1ZmYgYnV0IEkgcmVzcG9uZGVkCj4gb24gdGhhdCBzcGVjaWZpY2FsbHkgZWxzZXdo
ZXJlIHNvIGxldCdzIGtlZXAgdGhpbmdzIG1vdmluZyA6PikKPgo+ID4gV2Ugc2hvdWxkIGVpdGhl
ciBzdGljayB0byB0aGUgY3VycmVudCBiZWhhdmlvciAtIGRyb3AKPiA+IHRoZSBWTUEgbG9jayBi
ZWZvcmUgZG9pbmcgSS9PLCBvciBjaGFuZ2UgZm9yaygpIHNvIHRoYXQgaXQKPiA+IGRvZXMgbm90
IHdhaXQgb24gdm1hX3N0YXJ0X3dyaXRlKCkuCj4KPiBBZ2FpbiwgYXMgSSBzYWlkIGVsc2V3aGVy
ZSwgSSB0aGluayB0aGVyZSBtaWdodCBiZSBhIDNyZCB3YXkgcG9zc2libHkuIEl0J3MgYQo+IGJp
ZyBtaXN0YWtlIHRvIGFzc3VtZSB0aGF0IHRoZXJlIGFyZSBvbmx5IHNwZWNpZmljIHNvbHV0aW9u
cyB0byBwcm9ibGVtcyBpbiB0aGUKPiBrZXJuZWwgdGhlbiB0byBwcmVzZW50IGEgZmFsc2UgZGlj
aG90b215LgoKSSByZWNhbGxlZCB0aGF0IHdoZW4gd2UgZGlzY3Vzc2VkIHRoaXMgcGFydCBpbiBt
eSBzbGlkZXM6CgrigJhGb3Igc2ltcGxpY2l0eSwgcmF0aGVyIHRoYW4gdXNpbmcgYSB3aGl0ZWxp
c3QgbWVjaGFuaXNtIGZvcgpwZXItVk1BIHJldHJ5LCB3ZSBjb3VsZCB1c2UgYSBibGFja2xpc3Qg
aW5zdGVhZDogZGVmYXVsdCB0bwphbHdheXMgcmV0cnkgdmlhIHRoZSBWTUEgbG9jaywgYW5kIG9u
bHkgYWxsb3cgbW1hcF9sb2NrLWJhc2VkCnBhZ2UtZmF1bHQgcmV0cnkgZm9yIHNwZWNpZmljIGNh
c2VzIHN1Y2ggYXMKX192bWZfYW5vbl9wcmVwYXJlKCku4oCZCgpTdXJlbiBtZW50aW9uZWQgaW50
cm9kdWNpbmcgYSBGQUxMQkFDSyBmbGFnLiBXaXRoIHRoZQpGQUxMQkFDSyBmbGFnLCB3ZSB3b3Vs
ZCByZXRyeSB2aWEgbW1hcF9sb2NrOyB3aXRoIHRoZSBSRVRSWQpmbGFnLCB3ZSB3b3VsZCByZXRy
eSB2aWEgdGhlIFZNQSBsb2NrLgoKTm90IHN1cmUgd2hldGhlciB0aGlzIGNvdWxkIHJlYWxseSBi
ZSBjYWxsZWQgYSDigJh0aGlyZCB3YXks4oCZCmJ1dCBpdCBzZWVtcyBtb3JlIGxpa2UgYSBzaGlm
dCBmcm9tIGEgd2hpdGVsaXN0IG1vZGVsIHRvIGEKYmxhY2tsaXN0IG1vZGVsLCB3aXRob3V0IGNo
YW5naW5nIHRoZSBmdW5kYW1lbnRhbCBkZXNpZ24sIGJ1dAppdCBkb2VzIGNoYW5nZSB3aGVyZSB3
ZSB3b3VsZCBuZWVkIHRvIHRvdWNoIHRoZSBzb3VyY2UgY29kZS4KCj4KPiBXZSBhYnNvbHV0ZWx5
IGhlYXIgeW91IG9uIHRoaXMgYmVpbmcgYSBwcm9ibGVtIGFuZCBpdCBXSUxMIGJlIGFkZHJlc3Nl
ZCBvbmUgd2F5Cj4gb3IgYW5vdGhlci4KClRoYW5rcy4gVGhpcyBpcyBhIGJpdCBvZiBsaWdodCBp
biB3aGF0IGhhcyBmZWx0IGxpa2UgYSBmYWlybHkKZGFyayBzaXR1YXRpb24uIEkgcmVhbGx5IGFw
cHJlY2lhdGUgeW91ciB0aG91Z2h0ZnVsIGFuZApyZXNwb25zaWJsZSBhcHByb2FjaC4KCj4KPiBP
ZiB0aGUgdHdvIGFwcHJvYWNoZXMsIGFzIEkgc2FpZCBlbHNld2hlcmUsIEkgcHJlZmVyIHdoYXQg
eW91J3ZlIGRvbmUgaW4gdGhpcwo+IHNlcmllcyB0byBhbnl0aGluZyB0b3VjaGluZyBmb3JrLgo+
Cj4gQnV0IGdpdmUgbWUgdGltZSB0byBsb29rIHRocm91Z2ggdGhlIHNlcmllcyBwbGVhc2UgKEkn
ZCBhbHNvIHN1Z2dlc3QgUkZDJ2luZwo+IHdoZW4gaXQncyBzb21ldGhpbmcga2luZGEgZnVuZGFt
ZW50YWwgdGhhdCBtaWdodCBnZW5lcmF0ZSBjb252ZXJhc3Rpb24sIG1ha2VzCj4gbGlmZSBhIGJp
dCBlYXNpZXIgb24gdGhlIHJldmlldyBzaWRlIDopCgpUaGFua3MhIFN1cmUsIEnigJltIGhhcHB5
IHRvIHdhaXQgYW5kIHRoZXJl4oCZcyBubyB1cmdlbmN5LgoKTGFzdCB5ZWFyIHlvdSBtYWRlIHF1
aXRlIGEgc2lnbmlmaWNhbnQgY29udHJpYnV0aW9uIHRvIHRoZSB3b3JrCndoZW4gSSB0cmllZCB0
byByZW1vdmUgbW1hcF9sb2NrIGluIG1hZHZpc2UuIEkgcmVhbGx5CmFwcHJlY2lhdGVkIGl0LiBO
b3cgd2XigJlyZSBiYWNrIHRvIHRoZSBzYW1lIGxvY2sgYWdhaW4sIGp1c3QgaW4KZGlmZmVyZW50
IHBsYWNlcy4KCkJlc3QgUmVnYXJkcwpCYXJyeQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
