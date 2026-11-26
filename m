Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852CF606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 14:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I2DawX/2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2pz3ZCU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8PpC57Go0+yTLxnn1e4VbElrFXQCZZHo0+7nlxRt7d8=; b=I2DawX/2ug6bjHr/yqeQbjFUYa
	CMM+Gk0XP2IQ9xCMxVL1ZOaBoY4py/5XKitZvbSOvk/1/eV4OaHFSCi/YuVGFVGB9u8UyPuT10BpP
	ukJdiRrvW0sQACabHl0vF8gNn920bplWg/U4BsrTOvD9S3hHBuav0yq0mmIjgfu80kZj3dmnr+nbl
	o2tQ5POj+2kuo8mBsVBpd/9f5GYMz0sPhlVjiNkBAghTZ9RZXI/PYDoRgMom8Qnx/GF5/Gk8mP2dH
	IWhk18fMUS/9yyjjcDIRiC163SOECPFt2eD1qiSOvEjM/LZuSkXiSgAFQ5pkFXt7fuWgtRt2LL4SH
	EyThbTMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaBd-0000000DTjx-3NhM;
	Thu, 26 Nov 2026 14:10:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaBc-0000000DTjO-2ESp
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 14:10:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F1A9840A3A;
	Thu, 26 Nov 2026 14:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D773A1F01564;
	Thu, 26 Nov 2026 14:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795702255;
	bh=6O9fFPnsC2fRnN/QRfMcf6hwkntt/ekyLWGe+pOVc4U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=N2pz3ZCU176TcfVQhG2iuo5458/3FyeO0kX903oXUUqvpGySu15X6A3HfU+AA6eEX
	 Iyuu5ZeD+XYBv18n6tsOIpEp93zp+oW+TZJ5dWBH0buqUinIxKYdy8l3CUWtUi4XFX
	 pvBTZZKDkZzVDnGB5RiefR2c+6IyGyAI2gTVRmQRvax7uxgNKTLf+anD7RIAVJAlG+
	 b/al4pBnu6+4vPkZ33ZiV45scsPGvwc5+zgRH+84qQrDGn0aoD0Epzt46iXl1Lr3cf
	 wZHHg+PhqTYEg39ZnAp9rK/bbQl58DGdd+2EzysXttKD5OgpysLYjSVuEoM8A1bMFv
	 69QeNtO35FVEA==
Message-ID: <59ac6564-519e-43f0-9a4a-11600e1d794e@kernel.org>
Date: Thu, 26 Nov 2026 15:10:44 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] mm: keep writable entries writable on protection
 changes
To: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>, kvm@vger.kernel.org,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-riscv@lists.infradead.org, seanjc@google.com, pbonzini@redhat.com,
 akpm@linux-foundation.org, peterx@redhat.com, ljs@kernel.org,
 imbrenda@linux.ibm.com, borntraeger@linux.ibm.com, frankja@linux.ibm.com,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>
References: <20261112142039.907090-2-clopez@suse.de>
 <20261112142039.907090-6-clopez@suse.de>
 <603cd8e0-c2c5-4c1e-85c4-d0a5ceda8d4c@kernel.org>
 <743f60f7-d611-4d73-a2d1-d5873bcdda36@suse.de>
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
In-Reply-To: <743f60f7-d611-4d73-a2d1-d5873bcdda36@suse.de>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvMTUvMjYgMjI6NTksIENhcmxvcyBMw7NwZXogd3JvdGU6Cj4gT24gMTEvMTMvMjYgNzo1
NiBQTSwgRGF2aWQgSGlsZGVuYnJhbmQgKEFybSkgd3JvdGU6Cj4+IE9uIDExLzEyLzI2IDE1OjIw
LCBDYXJsb3MgTMOzcGV6IHdyb3RlOgo+Pj4gY2hhbmdlX3Byb3RlY3Rpb24oKSBhcHBsaWVzIHZt
YS0+dm1fcGFnZV9wcm90LCB3aGljaCBsYWNrcyB0aGUgd3JpdGUgYml0Cj4+PiBmb3IgQ29XIGFu
ZCB3cml0ZS1ub3RpZmllZCBtYXBwaW5ncy4gTU1fQ1BfVFJZX0NIQU5HRV9XUklUQUJMRSBtYWtl
cwo+Pj4gZW50cmllcyB3cml0YWJsZSBhZ2FpbiBpZiBhIHdyaXRlIGZhdWx0IHdvdWxkIG9ubHkg
c2V0IHRoZSB3cml0ZSBiaXQuCj4+PiBJbiBzaGFyZWQgbWFwcGluZ3MsIGl0IHJlbGllcyBvbiB0
aGUgZGlydHkgYml0IGZvciB0aGlzLCBhcyBhIGNsZWFuCj4+PiBlbnRyeSBtaWdodCBzdGlsbCBu
ZWVkIGEgd3JpdGUgZmF1bHQgdG8gbm90aWZ5IHRoZSBGUy4KPj4+Cj4+PiBIb3dldmVyLCB0aGlz
IG1pc3NlcyBjbGVhbiBlbnRyaWVzIHRoYXQgd2VyZSBhbHJlYWR5IHdyaXRhYmxlLiBGb3IKPj4+
IGV4YW1wbGUsIGEgdWZmZC13cCB1bnByb3RlY3QgbWFrZXMgc2htZW0gUFRFcyByZWFkLW9ubHkg
aWYgdGhleSB3ZXJlCj4+PiBtYXBwZWQgYnkgYSByZWFkIGZhdWx0IGJlZm9yZSB1ZmZkLXdwIHdh
cyByZWdpc3RlcmVkLCBzbyB0aGUgbmV4dCB3cml0ZQo+Pj4gdG8gZWFjaCBvZiB0aGVtIGZhdWx0
cy4KPj4KPj4gU2VlIG15IG90aGVyIHJlcGx5LCBhZGRpbmcgc3VjaCBvcHRpbWl6YXRpb25zIHdp
dGhvdXQgYW55IG1vdGl2YXRpb24gd2h5IHdlCj4+IHNob3VsZCBldmVuIGNhcmUgaXMgbm90IHJl
YWxseSB3aGF0IHdlIHdhbnQuCj4+Cj4+IERyb3AgaXQgZnJvbSB5b3VyIHNlcmllcyBhbmQga2Vl
cCB0aGUgTU0gY2hhbmdlcyB0byBhIGJhcmUgbWluaW11bSBwbGVhc2UuCj4+Cj4+IE9yIGlzIHRo
ZXJlIGEgcmVhbCBkZXBlbmRlbmN5IGZvciB5b3VyIHdvcms/Cj4+Cj4gCj4gWWVzIHRoZXJlIGlz
LCBidXQgSSBjbGVhcmx5IGRpZCBub3QgZXhwbGFpbiBpdCBwcm9wZXJseS4KPiAKPiBUaGUgd2hv
bGUgcG9pbnQgb2YgdGhlIHNlcmllcyBpcyB0byBhdm9pZCB6YXBzIHdoZW4gbm8gcGVybWlzc2lv
biBiaXRzCj4gYXJlIHJlbW92ZWQgYnkgYSBwcm90ZWN0aW9uIGNoYW5nZSwgZS5nLiBtcHJvdGVj
dChQUk9UX1JFQUQgfAo+IFBST1RfV1JJVEUpIG9uIGEgcmVhZC1vbmx5IFZNQS4gTXkgcHJvcG9z
YWwgaXMgZm9yIGNoYW5nZV9wcm90ZWN0aW9uKCkKPiB0byBzaWduYWwgdGhpcyBpcyB0aGUgY2Fz
ZSB0byBNTVUgbm90aWZpZXJzIHdpdGggYSBuZXcgZmxhZy4gSG93ZXZlciwKPiBjaGFuZ2VfcHJv
dGVjdGlvbigpIHNvbWV0aW1lcyB3cml0ZS1wcm90ZWN0cyBlbnRyaWVzIHRoYXQgd2VyZSB3cml0
YWJsZSwKPiB3aGljaCBtYWtlcyB0aGUgZmxhZyB3cm9uZywgc28gdGhpcyBwYXRjaCBmaXhlcyB0
aGF0Lgo+IAo+IEknbGwgYmUgc3VyZSB0byBleHBsYWluIHRoaXMgcHJvcGVybHkuCgpJIHRoaW5r
IHRoZXJlIGFyZSBzb21lIHdlaXJkIGludGVyYWN0aW9ucyBiZXR3ZWVuIHRoaW5ncy4KCkknbSBz
d2FtcGVkIHdpdGggb3RoZXIgc3R1ZmYgcmlnaHQgbm93LCBidXQgb25jZSB5b3UgcmVzZW5kIGFu
ZCBleHBsYWluIGl0CmJldHRlciwgbWF5YmUgSSBjYW4gZmlndXJlIG91dCBob3cgdG8gZG8gdGhp
cyBjbGVhbmx5LgoKLS0gCkNoZWVycywKCkRhdmlkCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
