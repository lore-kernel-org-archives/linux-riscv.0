Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB57FEC1130
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Feb 2026 20:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UAhcizpkxxSdjAPmeD3bJjgKCgzdilsZDQkTIqDhgYI=; b=IdiFaLMcRMyTyx
	UfyI7wmTQ5P993rpAaoUbgW2UYzihLLKGUcePMTkbobyDbWabuyNlpqbDbFoM7fWvdHIOOo5mdJfw
	3oC48I91d785bARJgDHzjAT3Fi2Ozp+MZ3tIDbMxU1hVEWVhrjrhHumdDAtrakNXDT1lMZRe+MGs8
	PbhowIOczSvlFsT00hnDzrWK0FWIuQoL2QYzAwEqAccXsNcDhHcBOwxwU4og63KNGljWu2+3vgYZp
	3aGRUaesfVp5/CSiyYUcWT0cdw+tRuAvEW1YMwuGBtMs0v2ZK1U+YAo2v+Dl1eJI5b7U258d/mcWH
	E5Jq8AjxTVMzxjGYYhaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vucpg-0000000129B-2G9b;
	Mon, 23 Feb 2026 20:47:08 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vucpd-0000000128n-131i
	for linux-riscv@lists.infradead.org;
	Mon, 23 Feb 2026 20:47:06 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4806b0963a9so16335e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Feb 2026 12:47:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771879623; cv=none;
        d=google.com; s=arc-20240605;
        b=WVhE3+IRPC1wbab4cIOVGX4wyUbLzXUlqfT674yf3IfO6N+NlOJEOt6SX5UYkzxa6U
         aAhz+lnuptrNE2vslrMEEuLCeM8VxDlSPCGUtiGgBGi45V4sIx4GtFLjUMNa125MJ9Lk
         /r3N6E685nNYfzdyrYl86ES3cf0Poy/wNKo9BEU0SX2/4Vvt9ZMNRdoSJqdFjQAPeS/n
         USto/Cdu9E5ghMslteQc3NkPGwPbO7uJHhD7N4OcglmSM6HAXZPn8faHYVleO59dQQnP
         zcxkl0hmkQ5z28HYJMc13mEanhzPsubQbrxK2tcV2fwBNug3q57OqK80PgDU2ot8+iE7
         sGpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LLvPmAWJUbvsu9W27Db/ZOo45wfaEQF3rbARD4LQ3sw=;
        fh=+j5RvJhSi+1+KVYScsi7QUzDZHspriX/wcM0THY4yMk=;
        b=NQ3Sz0y2GLZw+QTrpqxj10+OlRPmauH/ov8EvgBsTBHFD6lwmPFrAeweBTFIg1nYWN
         TMHxoM2AdTMq1BdpxNGJQrovnyk307Mk+e3w4Jk0Y9h9iTft1Bo1PPGZ2Aiu49lO3ag6
         C3ggjSZsfGSJzNONfBAXKFSbOChazyWIBkzzDMx/AH7iy0bZuEzlkfG+cmwYdjTthhjr
         xA8nZZVoK1NtE3+WSWAJXx6NDSaH1t4vF64UksxoEZeLqNzQd48OQggytjnRThwvkBWD
         L2VP93lnML/VeHWXiiDXwpyCTF0DDcsWUo0nUNc6N2GvYNDDx5Z1HGj/cHWGm9ycYo+D
         MkxQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771879623; x=1772484423; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLvPmAWJUbvsu9W27Db/ZOo45wfaEQF3rbARD4LQ3sw=;
        b=RNgaGbIxu0Z8uDbrD1cbNnLGyoSZPluGqN5ilJJjQ1K+iWXxydekfcXfZGUeVsA2xl
         DRc2L1PbaNLWjFBjzP0BgTucQYetlnxW32Z4LLs26c3fgWzF6wKdHln5vkS/FNqtnJ6Y
         97VqlbFOWtihEsB33iCH7Gp+s1GpGnxM76AvGIbYO2au+7hBUPd88TTF4S/2JSdKp48M
         5u8XbFVhr5UitRJxvfY/aYClAqiEXiHdJ1yd7J656u4e17KNCm/N/QxSJvPx6xDJ0wEB
         73c5GR0YnYwRHIP7y++Gs1PLPPdQ4jSSv3ZGNPkZuWuy2gNRLerz86nvKcI1UeP1EbD+
         O6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771879623; x=1772484423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LLvPmAWJUbvsu9W27Db/ZOo45wfaEQF3rbARD4LQ3sw=;
        b=ZIyKERU8XsMOWO9msyGo/cK2u4nvx1tI6tQRkuu6cb2Tvcz4bx4BoVY/WgL738Nmw5
         uJzHrPaJ2fWHc/l/EZLoYAvQTY2fdMzsIugqLTWIXG7yarPGLVlLsT8Y8ixXNfri4FPD
         hwYRAv47AjLxDHk1+K7nqvpPH6HIQsrXAq9t1x0NNwwUYqTpgG0UZE87Vxbv/xMR8/5W
         bVEHTyxPZguCZbXJXsukQOOl1F5OKGtOz71CrQoQf05fOZv3WtXoUSiZDt/Q6rCAD3DU
         cT51ALNBO4r7qobE+RgyttUok9kgbE9rUBE2r/qsIs5TFZiG5X8QZeKG1MHTdoBagYtK
         mKhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjzaVCetd/GjZLZy+QCF+oA0q2OpkfuKi/ahbdkmC9SUh9eBbZ6hb5hYTJjpf6k14IdDMgZDJRG2shJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCXcVCmRS9TZmjAZvdxNiIdkU+zexihfZ/OCRXHiLoCaJ98FJ2
	9Jle+LiHCCql6VJaEn7ttDuaxkF3b7g/h+4rLpz7xplOPEzGH8pbigLDPuTcwPy/+2g6JkTFBeu
	QTdGgk23pTJBs/kat0sjnUCjyIv0ZoPQbPJd3Fhzo
X-Gm-Gg: AZuq6aKMIFMm7yHnYUuPLVkwRDkkgHAu3Pv+B2AsuSh5tbAvwGVTL8tJfo+SKfkVhZb
	hedXADVCRbVtDn70uTHwG7VTp/+1W2c9r+YnjNgorPiejY8rVbMcXSUVd9GjG+7ryU9gDsEuCGd
	kjFnktRJyNlomW4uOnN8ma51OADmud68TDsGeGvqanSLbENCI59J+7qb80/sko0w3ZZ4NlRM4dN
	amgu4Uq+VdSOZ7+u/Cys3CqIzvKWqh9kW0jxVM+F3xXAwqiC9Sgb8+FFiRA8KEsIFbMVqUZMelZ
	Co+zwNw=
X-Received: by 2002:a05:600c:4454:b0:477:86fd:fb1b with SMTP id
 5b1f17b1804b1-483b878837emr163415e9.11.1771879622202; Mon, 23 Feb 2026
 12:47:02 -0800 (PST)
MIME-Version: 1.0
References: <20260202155634.650837-1-kas@kernel.org> <20260202155634.650837-9-kas@kernel.org>
 <aZJTLwV2SaaKu1k_@casper.infradead.org> <ec4a9a1e-8c08-4879-a787-3b9e0bc38160@kernel.org>
 <aZyZ2-7Xr-zUnInC@casper.infradead.org> <9a972701-00b4-440d-8bc2-24b8dc469843@kernel.org>
In-Reply-To: <9a972701-00b4-440d-8bc2-24b8dc469843@kernel.org>
From: Frank van der Linden <fvdl@google.com>
Date: Mon, 23 Feb 2026 12:46:50 -0800
X-Gm-Features: AaiRm53V0083kx17uKl1QJe6iH0-QHdntImophIuh0y8aAfRVd2RH3p-ebZ7RBQ
Message-ID: <CAPTztWbr7y0myXB17Vz5HEZTw8a3PJ4qaxRKgtZmt-qXx1ofeA@mail.gmail.com>
Subject: Re: [PATCHv6 08/17] mm: Make page_zonenum() use head page
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Kiryl Shutsemau <kas@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Muchun Song <muchun.song@linux.dev>, 
	Usama Arif <usamaarif642@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, 
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_124705_556315_F02AEA13 
X-CRM114-Status: GOOD (  19.30  )
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

T24gTW9uLCBGZWIgMjMsIDIwMjYgYXQgMTE6MzLigK9BTSBEYXZpZCBIaWxkZW5icmFuZCAoQXJt
KQo8ZGF2aWRAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAyLzIzLzI2IDE5OjE4LCBNYXR0aGV3
IFdpbGNveCB3cm90ZToKPiA+IE9uIE1vbiwgRmViIDE2LCAyMDI2IGF0IDEwOjA2OjU3QU0gKzAx
MDAsIERhdmlkIEhpbGRlbmJyYW5kIChBcm0pIHdyb3RlOgo+ID4+IE9uIDIvMTYvMjYgMDA6MTMs
IE1hdHRoZXcgV2lsY294IHdyb3RlOgo+ID4+Pgo+ID4+PiBZb3UncmUgcmlnaHQgdGhhdCBkaWZm
ZXJlbnQgcGFnZXMgaW4gdGhlIHNhbWUgZm9saW8gY2FuIGhhdmUgZGlmZmVyZW50Cj4gPj4+IHpv
bmUgbnVtYmVyLiAgQnV0IGRvZXMgaXQgbWF0dGVyIC4uLiBvciB0byBwdXQgaXQgYW5vdGhlciB3
YXksIHdoeSBpcwo+ID4+PiByZXR1cm5pbmcgdGhlIHpvbmUgbnVtYmVyIG9mIHRoZSBoZWFkIHBh
Z2UgdGhlIGNvcnJlY3Qgd2F5IHRvIHJlc29sdmUKPiA+Pj4gdGhpcz8KPiA+Pgo+ID4+IEhvdyBj
YW4gYSBmb2xpbyBjcm9zcyB6b25lcz8KPiA+Cj4gPiBJIHRob3VnaHQgMUdCIHBhZ2VzIGluIGh1
Z2V0bGIgY291bGQgY3Jvc3Mgem9uZXM/ICBNYXliZSB0aGF0IHVzZWQgdG8gYmUKPiA+IHRydWUg
YW5kIGlzbid0IGFueSBtb3JlLCBvciBtYXliZSBpdCB3YXMgbmV2ZXIgdHJ1ZSBhbmQgSSB3YXMg
anVzdAo+ID4gY29uZnVzZWQuCj4KPiBJIHJlY2FsbCB0aGF0IDFHIGZvbGlvcyBjb3VsZCBlbmQg
dXAgaW4gWk9ORV9NT1ZBQkxFIChjb21tZW50IGluCj4gcGFnZV9pc191bm1vdmFibGUoKSksIGJ1
dCBteSBtZW1vcnkgaXMgZnV6enkgd2hlbiBpdCBjb21lcyB0byBjcm9zc2luZwo+IHpvbmVzICha
T05FX05PUk1BTCAtPiBaT05FX01PVkFCTEUpLgo+Cj4gRnJlZWluZytyZWluaXRpYWxpemluZyB0
aGUgdm1lbW1hcCBmb3IgSFZPIHdpdGggc3VjaCBmb2xpb3Mgd291bGQKPiBhbHJlYWR5IGJlIHBy
b2JsZW1hdGljIEkgc3VwcG9zZTogd2Ugd291bGQgc2lsZW50bHkgc3dpdGNoIHRoZSB6b25lIGZv
cgo+IHNvbWUgb2YgdGhlc2UgcGFnZXMuCj4KPiBXaGVuIGZyZWVpbmcgc3VjaCAoYm9vdHRpbWUp
IGh1Z2V0bGIgZm9saW9zIHRvIHRoZSBidWRkeSwgd2UgdXNlCj4gZnJlZV9mcm96ZW5fcGFnZXMo
KS4gSW4gdGhlcmUgd2UgbG9va3VwIHRoZSB6b25lIG9uY2UuCj4KPiBMaWtlbHkgYWxzbyBwcm9i
bGVtYXRpYyA6KQoKSHVnZVRMQiBmb2xpb3Mgd2VyZW4ndCBzdXBwb3NlZCB0byBjcm9zcyB6b25l
cywgYnV0IHRoZXkgY291bGQgZG8gdGhhdAppbiBzb21lIGNhc2VzIGZvciBib290bWVtIChtZW1i
bG9jaykgYWxsb2NhdGVkIHBhZ2VzLCBjYXVzaW5nIHRoZQppc3N1ZSB5b3UgZGVzY3JpYmUuCgpJ
IGZpeGVkIHRoYXQgd2l0aCAxNGVkM2E1OTVmYTQgKCJtbS9odWdldGxiOiBjaGVjayBib290bWVt
IHBhZ2VzIGZvcgp6b25lIGludGVyc2VjdGlvbnMiKSwgc28gdGhleSB3b24ndCBjcm9zcyB6b25l
cyBhbnltb3JlLiBUaGUgb3RoZXIKYWxsb2NhdGlvbiBtZXRob2RzIHVzZWQgZm9yIEh1Z2VUTEIg
Zm9saW9zLCBhbGxvY19jb250aWdfcGFnZXMoKSBhbmQKY21hX2FsbG9jX2ZvbGlvLCB3b24ndCBy
ZXR1cm4gYW55dGhpbmcgdGhhdCBjcm9zc2VzIGEgem9uZSBib3VuZGFyeSBieQp0aGVpciBuYXR1
cmUuCgpTbyBJIHRoaW5rIHRoYXQncyBhbGwgZ29vZC4KCi0gRnJhbmsKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
