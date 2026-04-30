Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605EDCD13D3
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 22:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5GGYEIVZRaj90yg9MzfA6pXbnlmf+taFnKrHG7f5eIw=; b=D+KxYoiHzlT82+
	Glj0l1rjB7HhTvMUyxGovvMRF0DWRlnOH6KsrPUzBpEyq8EOSQNYDChNuAz2+korXAnfDGB0MR57W
	8ZoMmBNZwYvJFoCRwdd5K8O2YcxgBnIWcAOx+RFQXwEPMIC6IO1jWsYvHEnd4ezzo7AJnFVoZsf3L
	4iAs4isJbt7gSe1gicdych8Xf582E4ksS89q/2vT2tZsd0D/0JABczuuciQX1T1MNNsLAM6wJyEc+
	hcTI8JjA3liNnJbf0eAeBJRGCM0Snmp5A4UDDVukeWCUirlj9JQRy3GFiru8K9WEQATZMy1FG3dG3
	gPBw4JuITF9Ke8bt1BPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIaD2-000000064RT-3aRM;
	Thu, 30 Apr 2026 22:50:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIaCz-000000064Qj-3mP5
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 22:50:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C87244515
	for <linux-riscv@lists.infradead.org>; Thu, 30 Apr 2026 22:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2257DC2BCF4
	for <linux-riscv@lists.infradead.org>; Thu, 30 Apr 2026 22:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777589412;
	bh=EwR29NH5HVcLbVvA5ViI57mAmHT3DBCHHsLg0gf7Cic=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dBXZ2oY8bPD0T7Gd4Of7GUZOb84hKrxvQlNnKxyNarxinIUzFHyBM9s+qDR4U9LPp
	 +Hc8F8WFDCZQqqo+npT5fUj0txmJKGzK48NWf+a5HFI0nv9pWEpw/7Z7MiE/1dYHmC
	 B12UZdt6YCq68u/rqEbIGy9P6FZiNurFRNlp3PZg9yOU7Gob8iSTSCXSUBOt2JbkAC
	 Fwp47SUVHvHazO57YaIALODnh+Wg6M0vRWtAdK9btMOZWw3UF7+id1X74wqvWjE3jS
	 uK3gMgeJ00mb08GoZiRN6AIHhiPzdeZPoa0S7aYZkNoWzKQDPWrMHLEaBFdV5I1od5
	 XDQUtFcs0lleA==
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-89f1e767f92so13294916d6.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Apr 2026 15:50:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/qbgNJJpYegVUF3BmnPiy4rBynJge1w8bLw3L1n+EqJwM+/5KXVuvFt24M21iBeiA1JekAPfYUvO2+1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYyX3gK/RVsg+5fLKxKHG4WhccR93RPXn+Fux47d05gk4l5kWa
	s2ogMTMq1NWyp6lmjK0HomjdrcH8wpnVBhZqgPB/5ekUfUywpqoTlA5jvwqVpge0wKxmnDO129e
	TgLUY8n6FTS00lYDazaE7b7GG5yVWNxM=
X-Received: by 2002:a05:6214:3f81:b0:899:f092:9da with SMTP id
 6a1803df08f44-8b3fe7bd179mr81439146d6.28.1777589410935; Thu, 30 Apr 2026
 15:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
In-Reply-To: <afNM-gIqxpyJ6ro7@casper.infradead.org>
From: Barry Song <baohua@kernel.org>
Date: Fri, 1 May 2026 06:49:58 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
X-Gm-Features: AVHnY4LNqeENq1Hu8yfE3Ha6l6qy4pcPzLhOvHSM0QbVepERNdbmRODWwcwvH-c
Message-ID: <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_155014_027323_361C2B53 
X-CRM114-Status: GOOD (  16.66  )
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

T24gVGh1LCBBcHIgMzAsIDIwMjYgYXQgODozN+KAr1BNIE1hdHRoZXcgV2lsY294IDx3aWxseUBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgQXByIDMwLCAyMDI2IGF0IDEyOjA0OjIy
UE0gKzA4MDAsIEJhcnJ5IFNvbmcgKFhpYW9taSkgd3JvdGU6Cj4gPiAoMSkgSWYgd2UgbmVlZCB0
byB3YWl0IGZvciBJL08gY29tcGxldGlvbiwgd2Ugc3RpbGwgZHJvcCB0aGUgcGVyLVZNQSBsb2Nr
LCBhcwo+ID4gY3VycmVudCBwYWdlIGZhdWx0IGhhbmRsaW5nIGFscmVhZHkgZG9lcy4gSG9sZGlu
ZyBpdCBmb3IgdG9vIGxvbmcgbWF5IGludHJvZHVjZQo+ID4gdmFyaW91cyBwcmlvcml0eSBpbnZl
cnNpb24gaXNzdWVzIG9uIG1vYmlsZSBkZXZpY2VzLiBBZnRlciBJL08gY29tcGxldGVzLCB3ZQo+
ID4gcmV0cnkgdGhlIHBhZ2UgZmF1bHQgd2l0aCB0aGUgcGVyLVZNQSBsb2NrLCByYXRoZXIgdGhh
biBmYWxsaW5nIGJhY2sgdG8KPiA+IG1tYXBfbG9jay4KPgo+IFlvdSdyZSBnb2luZyB0byBoYXZl
IHRvIGRvIGJldHRlciB0aGFuIHRoYXQuICBZb3Uga25vdyBJIGhhdGUgdGhlCj4gYWRkaXRpb25h
bCBjb21wbGV4aXR5IHlvdSdyZSBhZGRpbmcuICBZb3UgbmVlZCB0byBleHBsYWluIHdoeSBteSBp
ZGVhIG9mCj4gcmlwcGluZyBvdXQgYWxsIHRoZSBjb21wbGV4aXR5IG5vdyB0aGF0IHdlIGhhdmUg
cGVyLVZNQSBsb2NrcyBkb2Vzbid0Cj4gd29yay4KClllcCwgSSBrbm93IHlvdSBkb27igJl0IGxp
a2UgdGhlIGFkZGVkIGNvbXBsZXhpdHksIGJ1dCBJIHdvdWxkIHJhdGhlciBwcmlvcml0aXplCnVz
ZXIgZXhwZXJpZW5jZSBvdmVyIHNpbXBsaWNpdHkuIExldCBtZSB0cnkgdG8gZXhwbGFpbiBpbiBt
b3JlIGRldGFpbC4KCjEuIFRoZXJlIGlzIG5vIGRldGVybWluaXN0aWMgbGF0ZW5jeSBmb3IgSS9P
IGNvbXBsZXRpb24uIEl0IGRlcGVuZHMgb24KYm90aCB0aGUgaGFyZHdhcmUgYW5kIHRoZSBzb2Z0
d2FyZSBzdGFjayAoYmlvL3JlcXVlc3QgcXVldWVzIGFuZCB0aGUKYmxvY2sgc2NoZWR1bGVyKS4g
U29tZXRpbWVzIHRoZSBsYXRlbmN5IGlzIHNob3J0OyBhdCBvdGhlciB0aW1lcyBpdCBjYW4KYmUg
cXVpdGUgbG9uZy4gSW4gc3VjaCBjYXNlcywgYSBoaWdoLXByaW9yaXR5IHRocmVhZCBwZXJmb3Jt
aW5nIG9wZXJhdGlvbnMKc3VjaCBhcyBtcHJvdGVjdCwgdW5tYXAsIHByY3RsX3NldF92bWEsIG9y
IG1hZHZpc2UgbWF5IGJlIGZvcmNlZCB0byB3YWl0CmZvciBhbiB1bnByZWRpY3RhYmxlIGFtb3Vu
dCBvZiB0aW1lLiBGb3IgZXhhbXBsZSwgaWYgbG93LXByaW9yaXR5IHRhc2tzCnRyaWdnZXIgcGFn
ZSBmYXVsdHMgYW5kIGlzc3VlIGxvdy1wcmlvcml0eSBJL08sIGEgaGlnaC1wcmlvcml0eSB0YXNr
CnJlcXVpcmluZyB0aGUgd3JpdGUgbG9jayBtYXkgZW5kIHVwIHdhaXRpbmcgZm9yIGFuIHVua25v
d24gYW1vdW50IG9mIHRpbWUsCmRlcGVuZGluZyBvbiB0aGUgYmxvY2sgbGF5ZXIgYW5kIGZpbGVz
eXN0ZW0gYmVoYXZpb3IuCgpBcyBhIHJlc3VsdCwgaGlnaC1wcmlvcml0eSB0YXNrcyBhcmUgZXhw
b3NlZCB0byB1bnByZWRpY3RhYmxlIEkvTyBsYXRlbmN5CmludHJvZHVjZWQgYnkgbWFueSBsb3ct
cHJpb3JpdHkgdGFza3MgdGhhdCBtYXkgZ2VuZXJhdGUgYSBsYXJnZSBudW1iZXIgb2YKcGFnZSBm
YXVsdHMuCgpPbiBBbmRyb2lkLCBsYXRlbmN5IGluIGNlcnRhaW4gdGFza3MgY2FuIHNpZ25pZmlj
YW50bHkgYWZmZWN0IHVzZXIgZXhwZXJpZW5jZSwKc3VjaCBhcyBpbnRlcmFjdGl2ZSB0aHJlYWRz
LiBQcmlvcml0eSBpbnZlcnNpb24gaXMgcGFydGljdWxhcmx5IHByb2JsZW1hdGljIGFuZApzaG91
bGQgYmUgYXZvaWRlZCwgZXNwZWNpYWxseSBzaW5jZSB3ZSBoYXZlIG5vIGNsZWFyIGJvdW5kIG9u
IGhvdyBsb25nIHdlIG1heQpoYXZlIHRvIHdhaXQgZm9yIEkvTyBmcm9tIG90aGVyIHRhc2tzLgoK
TWVhbndoaWxlLCBwcmlvcml0eSBpbnZlcnNpb24gY2FuIHByb3BhZ2F0ZSB0aHJvdWdoIGEgbG9u
ZyBjaGFpbjogYSB3cml0ZXIKd2FpdGluZyBvbiBJL08gZnJvbSBtdWx0aXBsZSBjb25jdXJyZW50
IHBhZ2UgZmF1bHRzIG1heSBlbmQgdXAgYmxvY2tpbmcgb3RoZXIKd3JpdGVycyBhbmQgcmVhZGVy
cyBhcyB3ZWxsLiBBIGxvbmctd2FpdGluZyB3cml0ZXIgY2FuIGFsc28gYW1wbGlmeQptbWFwX2xv
Y2sgY29udGVudGlvbiwgd2hpY2ggd2Ugc3RpbGwgcmVseSBvbiBpbiBtYW55IGNhc2VzLgoKMi4g
Vk1BIHNpemVzIGNhbiBiZSBoaWdobHkgdW5ldmVuOiBzb21lIFZNQXMgbWF5IGJlIHZlcnkgbGFy
Z2Ugd2hpbGUgb3RoZXJzIGFyZQpzbWFsbC4gV2UgdXNlZCB0byBoYXZlIG1hbnkgcmVhc29ucyB0
byByZWxlYXNlIG1tYXBfbG9jayB3aGVuIHdlIGRpZCBub3QgaGF2ZSBhCnBlci1WTUEgbG9jay4g
U2luY2UgVk1BIHNpemVzIGFyZSBub3QgdW5pZm9ybSwgdGhvc2Ugc2FtZSBjb25zaWRlcmF0aW9u
cyBtYXkKc3RpbGwgYXBwbHkgdG8gdGhlIHBlci1WTUEgbG9jayB3aGVuIGEgc21hbGwgbnVtYmVy
IG9mIFZNQXMgYWNjb3VudCBmb3IgbW9zdApvZiBhIHByb2Nlc3PigJlzIGFkZHJlc3Mgc3BhY2Uu
IEkgcmVjYWxsIHRoYXQgU3VyZW4gYWxzbyBtZW50aW9uZWQgdGhpc1sxXS4KClNvIEkgd291bGQg
cHJlZmVyIHRoYXQgd2UgaG9sZCBvbmx5IHRoZSBwZXItVk1BIGxvY2sgYW5kIGF2b2lkIHJldHJ5
aW5nIHRoZQpwYWdlIGZhdWx0IHdoZW4gd2UgYXJlIHJlYXNvbmFibHkgc3VyZSB0aGF0IEkvTyBo
YXMgYWxyZWFkeSBjb21wbGV0ZWQgYW5kIHdlCmFyZSBvbmx5IHdhaXRpbmcgZm9yIHNob3J0LWxp
dmVkIGNvbmRpdGlvbnMuIFVuY2VydGFpbnRpZXMgaW4gdGhlIGJsb2NrIGxheWVyLApmaWxlc3lz
dGVtLCBhbmQgR0MgYmVoYXZpb3IsIGFzIHdlbGwgYXMgbGF0ZW5jeS1pbmR1Y2VkIHByaW9yaXR5
IGludmVyc2lvbgpjaGFpbnMgYW5kIHBvdGVudGlhbGx5IGFtcGxpZmllZCBtbWFwX2xvY2sgY29u
dGVudGlvbiwgY2FuIHNpZ25pZmljYW50bHkgaHVydApBbmRyb2lkIHVzZXIgZXhwZXJpZW5jZS4K
ClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbS9DQUp1Q2ZwRlZRSnR2Ymo1ZlYy
Zm1tNEFQaE5aREwxcVBnLVlFeHc3Z08xcG1uZ0MzUndAbWFpbC5nbWFpbC5jb20vCgpUaGFua3MK
QmFycnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
