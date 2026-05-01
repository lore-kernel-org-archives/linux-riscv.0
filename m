Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689BDCD3423
	for <linux-riscv@archiver.kernel.org>; Fri,  1 May 2026 18:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJXmOLlOEK+f2mWJRoUS3eZu1ciq0MXibjBtvGvl1TA=; b=W6n0aHTQKs7rr+
	naiSxp0G9RNFptcRwjg8Qmld0NVoZL6egincW3ZPq11AzwRDtd9/px/1cGBLt+zUCxUA+w3snUFk2
	ScqtAiW1WF0lvHHN1mFljjNpsI8a1Bv/vPbZTfhZlhklpUWa2fiqriKMtCh3OIX5rH6kkywwXKUFs
	dB7pDbJcmVA9P+6K6tztkMOn8drjrDWLN7dALLCDZc0rSCDHZD+iJlzxfBReizuzRN4sUAQC0gPiu
	NugEtzi3sxeTLpD53HsvKxiII33TwQKVjf0XwQIdKCK0q1NnIVN7g+oIR/qO5bz38oSpy+VExzADs
	cTULvnAhSmDnvL5BU91g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIsYj-00000007ZFX-0YAM;
	Fri, 01 May 2026 18:25:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIsYh-00000007ZFI-0Eyf
	for linux-riscv@lists.infradead.org;
	Fri, 01 May 2026 18:25:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 14FC660125
	for <linux-riscv@lists.infradead.org>; Fri,  1 May 2026 18:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40D6C2BD04
	for <linux-riscv@lists.infradead.org>; Fri,  1 May 2026 18:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777659949;
	bh=lT/rPel9FmT35iq3NDhHuchj5jXwn6oKumOJ4dCsmXc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FIVeO3aI7z+jFqDqXITJ+jWsf7lknsacv1Vzwcn4Qsr6jBLZMM2APApvdOADED8Ln
	 tAIwXt9R3qywh7SwzohMPLV0t1vg1LPT7kOq55TgbdDGfwhWLLAjfL+brTf/OPCywN
	 jEfUkX05+1k8ouTnvv+GA9F+JEnzTnf5Oa3U2Pt8IrB7QbY20FMPALZdtczL2ANGRj
	 CrACi6wIjjOv4ftAgLt74Gg2ts3YaDODuAFLoaOg1uLSZtNISIx6WZBJZfcCC4lqXH
	 2KD3b4Y7/PA6fAAoCZuEsL9/UflhQWvEAIT7FBdFCoa8CcfRc5UKFiKNKCX0uHRqoY
	 UbCOWCsY8mKUw==
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50d6ab4476eso19984671cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 May 2026 11:25:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+xQpAWYwKir1jtdgllgCI4XzvdgsK6gAuZoBqKfjxkieHTD97YIy59K8zcVcBXkvNTTRnHgjIeXP44bw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5MekcwQ12vdga3ptLhQuQYYipRGpx4vUBZ142umcjuD51xdJQ
	QgTRLu+F50WtE3+T1bvXnIqmJlLeRGcHEnXgCCDJlScemfLguUaZPrTpmFp3s/+VoR5PHn+EcWE
	m336ulNv6rKsFbP8kV0Fu6Z4pczoY10A=
X-Received: by 2002:ac8:7dce:0:b0:509:2455:2b53 with SMTP id
 d75a77b69052e-5104bf755a7mr5248631cf.49.1777659948730; Fri, 01 May 2026
 11:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
In-Reply-To: <afTpoL3FklpQZNMM@casper.infradead.org>
From: Barry Song <baohua@kernel.org>
Date: Sat, 2 May 2026 02:25:37 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4x8sNtgv7Y198Gh9NSY+SE2o_JPFAxG9aWE+xXsB9vwGg@mail.gmail.com>
X-Gm-Features: AVHnY4Jc3ag1bUQ2844h_SA5sVSne-TN_r5pli71-jMQXFzkdxM1Ig0IdK36GUU
Message-ID: <CAGsJ_4x8sNtgv7Y198Gh9NSY+SE2o_JPFAxG9aWE+xXsB9vwGg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org, 
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
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

T24gU2F0LCBNYXkgMiwgMjAyNiBhdCAxOjU44oCvQU0gTWF0dGhldyBXaWxjb3ggPHdpbGx5QGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCBNYXkgMDIsIDIwMjYgYXQgMDE6NDQ6MzRB
TSArMDgwMCwgQmFycnkgU29uZyB3cm90ZToKPiA+IE9uIEZyaSwgTWF5IDEsIDIwMjYgYXQgMTA6
NTfigK9QTSBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPiA+
Cj4gPiA+IE9uIEZyaSwgTWF5IDAxLCAyMDI2IGF0IDA2OjQ5OjU4QU0gKzA4MDAsIEJhcnJ5IFNv
bmcgd3JvdGU6Cj4gPiA+ID4gMS4gVGhlcmUgaXMgbm8gZGV0ZXJtaW5pc3RpYyBsYXRlbmN5IGZv
ciBJL08gY29tcGxldGlvbi4gSXQgZGVwZW5kcyBvbgo+ID4gPiA+IGJvdGggdGhlIGhhcmR3YXJl
IGFuZCB0aGUgc29mdHdhcmUgc3RhY2sgKGJpby9yZXF1ZXN0IHF1ZXVlcyBhbmQgdGhlCj4gPiA+
ID4gYmxvY2sgc2NoZWR1bGVyKS4gU29tZXRpbWVzIHRoZSBsYXRlbmN5IGlzIHNob3J0OyBhdCBv
dGhlciB0aW1lcyBpdCBjYW4KPiA+ID4gPiBiZSBxdWl0ZSBsb25nLiBJbiBzdWNoIGNhc2VzLCBh
IGhpZ2gtcHJpb3JpdHkgdGhyZWFkIHBlcmZvcm1pbmcgb3BlcmF0aW9ucwo+ID4gPiA+IHN1Y2gg
YXMgbXByb3RlY3QsIHVubWFwLCBwcmN0bF9zZXRfdm1hLCBvciBtYWR2aXNlIG1heSBiZSBmb3Jj
ZWQgdG8gd2FpdAo+ID4gPiA+IGZvciBhbiB1bnByZWRpY3RhYmxlIGFtb3VudCBvZiB0aW1lLgo+
ID4gPgo+ID4gPiBCdXQgZG9lcyB0aGF0IGFjdHVhbGx5IGhhcHBlbj8gIEkgZmluZCBpdCBoYXJk
IHRvIGJlbGlldmUgdGhhdCB0aHJlYWQgQQo+ID4gPiB1bm1hcHMgYSBWTUEgd2hpbGUgdGhyZWFk
IEIgaXMgaW4gdGhlIG1pZGRsZSBvZiB0YWtpbmcgYSBwYWdlIGZhdWx0IGluCj4gPiA+IHRoYXQg
c2FtZSBWTUEuICBtcHJvdGVjdCgpIGFuZCBtYWR2aXNlKCkgYXJlIG1vcmUgbGlrZWx5IHRvIGhh
cHBlbiwgYnV0Cj4gPiA+IGl0IHN0aWxsIHNlZW1zIHJlYWxseSB1bmxpa2VseSB0byBtZS4KPiA+
Cj4gPiBJdCBkb2VzbuKAmXQgaGF2ZSB0byBpbnZvbHZlIHVubWFwcGluZyBvciBhcHBseWluZyBt
cHJvdGVjdCB0bwo+ID4gdGhlIGVudGlyZSBWTUHigJRqdXN0IGEgcG9ydGlvbiBvZiBpdCBpcyBz
dWZmaWNpZW50Lgo+Cj4gWWVzLCBidXQgdGhhdCBzdGlsbCBmYWlscyB0byBhbnN3ZXIgImRvZXMg
dGhpcyBhY3R1YWxseSBoYXBwZW4iLiAgSG93IG11Y2gKPiBwZXJmb3JtYW5jZSBpcyBhbGwgdGhp
cyBjb21wbGV4aXR5IGluIHRoZSBwYWdlIGZhdWx0IGhhbmRsZXIgYnV5aW5nIHVzPwo+IElmIHlv
dSBkb24ndCBhbnN3ZXIgdGhpcyBxdWVzdGlvbiwgSSdtIGp1c3QgZ29pbmcgdG8gZ28gaW4gYW5k
IHJpcCBpdAo+IGFsbCBvdXQuCgpJ4oCZbSBnZXR0aW5nIHF1aXRlIGNvbmZ1c2VkLiBJbiBwYXRj
aCA0LzUsIHlvdSBzdWdnZXN0IGEgbW9yZQpyZXN0cmljdGl2ZSBjb25kaXRpb24gdXNpbmcKaWYg
KGZvbGlvX3Rlc3RfdXB0b2RhdGUoZm9saW8pICYmICFmb2xpb190ZXN0X3dyaXRlYmFjayhmb2xp
bykpCnJhdGhlciB0aGFuIGlmIChmb2xpb190ZXN0X3VwdG9kYXRlKGZvbGlvKSksIGJlZm9yZSB3
ZSBkZWNpZGUgdG8gc2tpcApyZXRyeWluZyB0aGUgcGFnZSBmYXVsdCBbMV0uClRoYXQgc2VlbXMg
dG8gc3VnZ2VzdCB3ZSBzaG91bGQgYmUgbW9yZSBjYXV0aW91cyBhYm91dCB3aGVuIHdlIGNhbiBz
a2lwCnJldHJ5aW5nIHRoZSBwYWdlIGZhdWx0LgoKSG93ZXZlciwgaW4gdGhlIGNvdmVyIGxldHRl
ciwgeW91IHN1Z2dlc3QgcmVtb3ZpbmcgYWxsIHJldHJ5IGNvZGUgZW50aXJlbHkuCkRvZXMgdGhp
cyBzdWdnZXN0aW9uIGFwcGx5IG9ubHkgdG8gZmlsZS1iYWNrZWQgcGFnZSBmYXVsdHM/CgpbMV0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbW0vYWZUUWwxMlhjWFZua3U5SkBjYXNwZXIu
aW5mcmFkZWFkLm9yZy8KCkJlc3QgUmVnYXJkcwpCYXJyeQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
