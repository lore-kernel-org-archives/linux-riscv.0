Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF46EC1EBA
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 13:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gzq82+x/I/nlCxYpmlMV5VKZ2FrwHc1aPm3MRZqhElQ=; b=ZMYpLnJBhR1fpV
	oil+FNftpLjxnUjVZjPoLthWBWs8l/9SpH3xCS8kaeVABv0+12GNznBcZ3WX6Q/FN4du9pPn2xiUY
	hfLDPe12hae6YBxfaJlwm2BNwpVwv4cIBvxxANUPJKTQYE5h2CozoPHYujYookpL9Zy+gnqBTNqRx
	U7xbqyzZEL4Eh2RVgSzb9+JNFTShF3MIhZ/lnFCXI0o0QlJ5SLKE9lDsKLHx4MynWCRhKDI9AvGp8
	BzIAg1bPtiv1UshRqg2z5u6MUsNj6nTFbVhSytW7V8DXV3DER6PEopx18uzI1EmTlJ19hY42LTohr
	yYr2UNKAyGUh2fry4d+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzmg-00000009zZ5-3LnE;
	Thu, 05 Feb 2026 13:52:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzmf-00000009zYp-1ii8
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 13:52:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B077A600AD;
	Thu,  5 Feb 2026 13:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65A40C4CEF7;
	Thu,  5 Feb 2026 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770299556;
	bh=ZKRLdfY8j+3tSCOhu7lXU/4i+dGzR6BqlTNQ2fMayes=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PABi8CWRapGvnWwD6wZA0gWf2kzC85OADNDNQ+5ZsMgQULKe7P+pTF23HBeTY30cO
	 KncdahQa08a9SOtjZiIXcDaq0NA2sMxkMtq3Vx8YJS6VwVo5vg1hX5RPIsKZbe7TER
	 gHSDA6A11s1XLgW1RnDZgeE6tIS0vcfjGeqvQY7P1Apfb+CW9XPlcRH/QVyqUWwWrS
	 p/zLhgjBcOqqzYiOQ7v+xph6zhf1Kd9yvckyXNT4+DjrG0tCeCWk/n1KFI0jzBgM8r
	 YpeBP8DHGBG3KF0r/0gQlrl5i9l0jcR/amYMxz8bYX5bGsWBk7+qINuqHd4b9uJv6K
	 O8YXH7FHEUCEQ==
Message-ID: <460457b0-64c5-48a2-a5e4-d88ecc222884@kernel.org>
Date: Thu, 5 Feb 2026 14:52:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6 06/17] LoongArch/mm: Align vmemmap to maximal folio size
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>,
 Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-7-kas@kernel.org>
 <2ce0e684-de54-43ec-be7d-c58bbffb3f4e@kernel.org>
 <062900fa-6419-4748-81d1-9128ce6c46d0@kernel.org>
 <aYSdW2YaJdpgXYos@thinkstation>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzS5EYXZpZCBIaWxk
 ZW5icmFuZCAoQ3VycmVudCkgPGRhdmlkQGtlcm5lbC5vcmc+wsGQBBMBCAA6AhsDBQkmWAik
 AgsJBBUKCQgCFgICHgUCF4AWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaYJt/AIZAQAKCRBN
 3hD3AP+DWriiD/9BLGEKG+N8L2AXhikJg6YmXom9ytRwPqDgpHpVg2xdhopoWdMRXjzOrIKD
 g4LSnFaKneQD0hZhoArEeamG5tyo32xoRsPwkbpIzL0OKSZ8G6mVbFGpjmyDLQCAxteXCLXz
 ZI0VbsuJKelYnKcXWOIndOrNRvE5eoOfTt2XfBnAapxMYY2IsV+qaUXlO63GgfIOg8RBaj7x
 3NxkI3rV0SHhI4GU9K6jCvGghxeS1QX6L/XI9mfAYaIwGy5B68kF26piAVYv/QZDEVIpo3t7
 /fjSpxKT8plJH6rhhR0epy8dWRHk3qT5tk2P85twasdloWtkMZ7FsCJRKWscm1BLpsDn6EQ4
 jeMHECiY9kGKKi8dQpv3FRyo2QApZ49NNDbwcR0ZndK0XFo15iH708H5Qja/8TuXCwnPWAcJ
 DQoNIDFyaxe26Rx3ZwUkRALa3iPcVjE0//TrQ4KnFf+lMBSrS33xDDBfevW9+Dk6IISmDH1R
 HFq2jpkN+FX/PE8eVhV68B2DsAPZ5rUwyCKUXPTJ/irrCCmAAb5Jpv11S7hUSpqtM/6oVESC
 3z/7CzrVtRODzLtNgV4r5EI+wAv/3PgJLlMwgJM90Fb3CB2IgbxhjvmB1WNdvXACVydx55V7
 LPPKodSTF29rlnQAf9HLgCphuuSrrPn5VQDaYZl4N/7zc2wcWM7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <aYSdW2YaJdpgXYos@thinkstation>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMi81LzI2IDE0OjQzLCBLaXJ5bCBTaHV0c2VtYXUgd3JvdGU6Cj4gT24gVGh1LCBGZWIgMDUs
IDIwMjYgYXQgMDE6NTY6MzZQTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJhbmQgKEFybSkgd3JvdGU6
Cj4+IE9uIDIvNC8yNiAxNzo1NiwgRGF2aWQgSGlsZGVuYnJhbmQgKGFybSkgd3JvdGU6Cj4+Pgo+
Pj4KPj4+IFNhbWUgY29tbWVudCwgdGhlICJNQVhfRk9MSU9fTlJfUEFHRVMgKiBzaXplb2Yoc3Ry
dWN0IHBhZ2UpIiBpcyBqdXN0Cj4+PiBibGFjayBtYWdpYyBoZXJlCj4+PiBhbmQgdGhlIGRlc2Ny
aXB0aW9uIG9mIHRoZSBzaXR1YXRpb24gaXMgd3JvbmcuCj4+Pgo+Pj4gTWF5YmUgeW91IHdhbnQg
dG8gcHVsbCB0aGUgbWFnaWMgIk1BWF9GT0xJT19OUl9QQUdFUyAqIHNpemVvZihzdHJ1Y3QKPj4+
IHBhZ2UpIiBpbnRvIHRoZSBjb3JlIGFuZCBjYWxsIGl0Cj4+Pgo+Pj4gI2RlZmluZSBNQVhfRk9M
SU9fVk1FTU1BUF9BTElHTsKgwqDCoCAoTUFYX0ZPTElPX05SX1BBR0VTICogc2l6ZW9mKHN0cnVj
dAo+Pj4gcGFnZSkpCj4+Pgo+Pj4gQnV0IHRoZW4gc3BlY2lhbCBjYXNlIGl0IGJhc2Ugb24gKGEp
IEhWTyBiZWluZyBjb25maWd1cmVkIGluIGFuIChiKSBIVk8KPj4+IGJlaW5nIHBvc3NpYmxlCj4+
Pgo+Pj4gI2lmZGVmIEhVR0VUTEJfUEFHRV9PUFRJTUlaRV9WTUVNTUFQICYmIGlzX3Bvd2VyX29m
XzIoc2l6ZW9mKHN0cnVjdCBwYWdlKQo+Pj4gLyogQSB2ZXJ5IGhlbHBmdWwgY29tbWVudCBleHBs
YWluaW5nIHRoZSBzaXR1YXRpb24uICovCj4+PiAjZGVmaW5lIE1BWF9GT0xJT19WTUVNTUFQX0FM
SUdOwqDCoMKgIChNQVhfRk9MSU9fTlJfUEFHRVMgKiBzaXplb2Yoc3RydWN0Cj4+PiBwYWdlKSkK
Pj4+ICNlbHNlCj4+PiAjZGVmaW5lIE1BWF9GT0xJT19WTUVNTUFQX0FMSUdOwqDCoMKgIDAKPj4+
ICNlbmRpZgo+Pj4KPj4+IFNvbWV0aGluZyBsaWtlIHRoYXQuCj4+Pgo+Pgo+PiBUaGlua2luZyBh
Ym91dCB0aGlzIC4uLgo+Pgo+PiB0aGUgdm1lbW1hcCBzdGFydCBpcyBhbHdheXMgc3RydWN0LXBh
Z2UtYWxpZ25lZC4gT3RoZXJ3aXNlIHdlJ2QgYmUgaW4KPj4gdHJvdWJsZSBhbHJlYWR5Lgo+Pgo+
PiBJc24ndCBpdCB0aGVuIHN1ZmZpY2llbnQgdG8ganVzdCBhbGlnbiB0aGUgc3RhcnQgdG8gTUFY
X0ZPTElPX05SX1BBR0VTPwo+Pgo+PiBMZXQncyBhc3N1bWUgc2l6ZW9mKHN0cnVjdCBwYWdlKSA9
PSA2NCBhbmQgTUFYX0ZPTElPX05SX1BBR0VTID0gNTEyIGZvcgo+PiBzaW1wbGljaXR5Lgo+Pgo+
PiB2bWVtbWFwIHN0YXJ0IHdvdWxkIGJlIG11bHRpcGxlcyBvZiA1MTIgKDB4MDAxMDAwMDAwMCku
Cj4+Cj4+IDUxMiwgMTAyNCwgMTUzNiwgMjA0OCAuLi4KPj4KPj4gQXNzdW1lIHdlIGhhdmUgYW4g
MjU2LXBhZ2VzIGZvbGlvIGF0IDE1MzYrMjU2ID0gMHgxMTEwMDAwMDAKPiAKPiBzLzB4LzBiLywg
YnV0IG9rYXkuCgo6KQoKPiAKPj4gQXNzdW1lIHdlIGhhdmUgdGhlIGxhc3QgcGFnZSBvZiB0aGF0
IGZvbGlvICgweDAxMTExMTExMTExMSksIHdlIHdvdWxkIGp1c3QKPj4gZ2V0IHRvIHRoZSBzdGFy
dCBvZiB0aGF0IGZvbGlvIGJ5IEFORC1pbmcgd2l0aCB+KDI1Ni0xKS4KPj4KPj4gV2hpY2ggY2Fz
ZSBhbSBJIGlnbm9yaW5nPwo+IAo+IElJVUMsIHlvdSBhcmUgaWdub3JpbmcgdGhlIGFjdHVhbCBz
aXplIG9mIHN0cnVjdCBwYWdlLiBJdCBpcyBub3QgMSBieXRlIDpQCgpJIHRob3VnaHQgaXQgd291
bGRuJ3QgbWF0dGVyIGJ1dCwgeWVhaCwgdGhhdCdzIGl0LgoKIkFsaWduIHRoZSB2bWVtbWFwIHRv
IHRoZSBtYXhpbXVtIGZvbGlvIG1ldGFkYXRhIHNpemUiIGl0IGlzLgoKVGhlbiB5b3UgY2FuIGV4
cGxhaW4gdGhlIHNpdHVhdGlvbiBhbHNvIGFsb25nc2lkZSAKTUFYX0ZPTElPX1ZNRU1NQVBfQUxJ
R04sIGFuZCB0aGF0IHdlIGV4cGVjdCB0aGlzIHRvIGJlIGEgcG93ZXIgb2YgMi4KCi0tIApDaGVl
cnMsCgpEYXZpZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
