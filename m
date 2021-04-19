Return-Path: <SRS0=YGcN=JQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE34C433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 14:01:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F67561245
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 14:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F67561245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3XMK0HgudDBCk1xlbc7LTo7l3o2vhu7UvKi7HPAnn0E=; b=O0jm6n/Kh53hJtlfnZoDJw+K/
	qNyc+KzTIWntN3hlFNbAVJ91S0HlXzzx4F4g08TnKWapmgryS7NL1Ht/iVgeXw7rBINYNqx/hSe+W
	HLSkO9NwMzOAqlDHn5D4e1i9HGiO9GMHteatc4fLDDgkY+zNg+Fhlkk9+O1lVcQSBVk9iIW+BC4h/
	PkJdjuT2bBSYzdj6bsxDhKK6ol6xm+t9psvfiZadWkXhLUPe7GqeZf5PjEElHDt3zgR2tpsy2d981
	PDv26SOR7a5VIKQVl5etBF1JsGNJarjhMpk7ryEreOSXvC4R2M8M1BnJQRmvx31OEKYyhFga00plS
	pr71ex0sw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYUSH-00A2na-7C; Mon, 19 Apr 2021 14:00:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYURv-00A2kF-Co; Mon, 19 Apr 2021 14:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=o6Ml2nw5LFOzozIpvjARTTloEPX6h4Zr8ElqzvHqt+0=; b=hN7vzdU3sYCUyYTD12biXGNfar
 e6346hd0l0kXZujIEaINDW/Ut340lTaWUxnzca4eFBwPObQaB5D7QLNo4hD6plevTrhsNSlmU8xyG
 i5DTXBpOFw7b9tIxjqq9p9GJBZZv7w9+F7nkXu+GVwYCtwsZdKtJxIeQDWVQbd5iHEKPgAkr0Zcsu
 P/e3p236nntSRKWzZXBwkaXVothpR5OF/minlVRPrbSSn0HfAedjSLEQf+1Z4w7c2P8hOgFPec+/n
 /k7NIg5WPXz7tho+QvOxpiVVYbMHf350d+qV4EV9u2rIKBgFX4afgWef8YM0G67hNi3KQzkT/paZn
 ragko3rA==;
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lYURp-00BQUn-QS; Mon, 19 Apr 2021 14:00:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FCD231B;
 Mon, 19 Apr 2021 07:00:18 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FBAA3F7D7;
 Mon, 19 Apr 2021 07:00:16 -0700 (PDT)
Subject: Re: [PATCH v1 3/5] mm: ptdump: Provide page size to notepage()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 akpm@linux-foundation.org
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-mm@kvack.org
References: <cover.1618506910.git.christophe.leroy@csgroup.eu>
 <1ef6b954fb7b0f4dfc78820f1e612d2166c13227.1618506910.git.christophe.leroy@csgroup.eu>
 <41819925-3ee5-4771-e98b-0073e8f095cf@arm.com>
 <da53d2f2-b472-0c38-bdd5-99c5a098675d@csgroup.eu>
 <1102cda1-b00f-b6ef-6bf3-22068cc11510@arm.com>
 <627ee414-2f78-94e3-b77b-1013f52e77e3@csgroup.eu>
From: Steven Price <steven.price@arm.com>
Message-ID: <4a76fbda-aa9d-867b-e2eb-a1951780aeec@arm.com>
Date: Mon, 19 Apr 2021 15:00:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <627ee414-2f78-94e3-b77b-1013f52e77e3@csgroup.eu>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_070021_924898_5693629C 
X-CRM114-Status: GOOD (  20.89  )
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

T24gMTkvMDQvMjAyMSAxNDoxNCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiAKPiAKPiBMZSAx
Ni8wNC8yMDIxIMOgIDEyOjUxLCBTdGV2ZW4gUHJpY2UgYSDDqWNyaXTCoDoKPj4gT24gMTYvMDQv
MjAyMSAxMTozOCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPj4+Cj4+Pgo+Pj4gTGUgMTYvMDQv
MjAyMSDDoCAxMToyOCwgU3RldmVuIFByaWNlIGEgw6ljcml0wqA6Cj4+Pj4gT24gMTUvMDQvMjAy
MSAxODoxOCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPj4+Pgo+Pj4+IFRvIGJlIGhvbmVzdCBJ
IGRvbid0IGZ1bGx5IHVuZGVyc3RhbmQgd2h5IHBvd2VycGMgcmVxdWlyZXMgdGhlIAo+Pj4+IHBh
Z2Vfc2l6ZSAtIGl0IGFwcGVhcnMgdG8gYmUgdXNpbmcgaXQgcHVyZWx5IHRvIGZpbmQgImhvbGVz
IiBpbiB0aGUgCj4+Pj4gY2FsbHMgdG8gbm90ZV9wYWdlKCksIGJ1dCBJIGhhdmVuJ3Qgd29ya2Vk
IG91dCB3aHkgc3VjaCBob2xlcyB3b3VsZCAKPj4+PiBvY2N1ci4KPj4+Cj4+PiBJIHdhcyBpbmRl
ZWQgaW50cm9kdWNlZCBmb3IgS0FTQU4uIFdlIGhhdmUgYSBmaXJzdCBjb21taXQgCj4+PiBodHRw
czovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0L2NhYmU4MTM4IHdoaWNoIHVzZXMg
cGFnZSAKPj4+IHNpemUgdG8gZGV0ZWN0IHdoZXRoZXIgaXQgaXMgYSBLQVNBTiBsaWtlIHN0dWZm
Lgo+Pj4KPj4+IFRoZW4gY2FtZSBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29t
bWl0L2IwMGZmNmQ4YyBhcyBhIAo+Pj4gZml4LiBJIGNhbid0IHJlbWVtYmVyIHdoYXQgdGhlIHBy
b2JsZW0gd2FzIGV4YWN0bHksIHNvbWV0aGluZyBhcm91bmQgCj4+PiB0aGUgdXNlIG9mIGh1Z2Vw
YWdlcyBmb3Iga2VybmVsIG1lbW9yeSwgY2FtZSBhcyBwYXJ0IG9mIHRoZSBzZXJpZXMgCj4+PiBo
dHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2L2NvdmVyL2Nv
dmVyLjE1ODk4NjY5ODQuZ2l0LmNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldS8gCj4+Cj4+Cj4+
Cj4+IEFoLCB0aGF0J3MgdXNlZnVsIGNvbnRleHQuIFNvIGl0IGxvb2tzIGxpa2UgcG93ZXJwYyB0
b29rIGEgZGlmZmVyZW50IAo+PiByb3V0ZSB0byByZWR1Y2luZyB0aGUgS0FTQU4gb3V0cHV0IHRv
IHg4Ni4KPj4KPj4gR2l2ZW4gdGhlIGdlbmVyaWMgcHRkdW1wIGNvZGUgaGFzIGhhbmRsaW5nIGZv
ciBLQVNBTiBhbHJlYWR5IGl0IHNob3VsZCAKPj4gYmUgcG9zc2libGUgdG8gZHJvcCB0aGF0IGZy
b20gdGhlIHBvd2VycGMgYXJjaCBjb2RlLCB3aGljaCBJIHRoaW5rIAo+PiBtZWFucyB3ZSBkb24n
dCBhY3R1YWxseSBuZWVkIHRvIHByb3ZpZGUgcGFnZSBzaXplIHRvIG5vdGVwYWdlKCkuIAo+PiBI
b3BlZnVsbHkgdGhhdCBtZWFucyBtb3JlIGNvZGUgdG8gZGVsZXRlIDspCj4+Cj4gCj4gTG9va2lu
ZyBhdCBob3cgdGhlIGdlbmVyaWMgcHRkdW1wIGNvZGUgaGFuZGxlcyBLQVNBTiwgSSdtIGEgYml0
IHNjZXB0aWMuCj4gCj4gSUlVQywgaXQgaXMgY2hlY2tpbmcgdGhhdCBrYXNhbl9lYXJseV9zaGFk
b3dfcHRlIGlzIGluIHRoZSBzYW1lIHBhZ2UgYXMgCj4gdGhlIHBndGFibGUgcmVmZXJyZWQgYnkg
dGhlIFBNRCBlbnRyeS4gQnV0IHdoYXQgaGFwcGVucyBpZiB0aGF0IFBNRCAKPiBlbnRyeSBpcyBy
ZWZlcnJpbmcgYW5vdGhlciBwZ3RhYmxlIHdoaWNoIGlzIGluc2lkZSB0aGUgc2FtZSBwYWdlIGFz
IAo+IGthc2FuX2Vhcmx5X3NoYWRvd19wdGUgPwo+IAo+IFNob3VsZG4ndCB0aGUgdGVzdCBiZQo+
IAo+ICDCoMKgwqDCoGlmIChwbWRfcGFnZV92YWRkcih2YWwpID09IGxtX2FsaWFzKGthc2FuX2Vh
cmx5X3NoYWRvd19wdGUpKQo+ICDCoMKgwqDCoMKgwqDCoCByZXR1cm4gbm90ZV9rYXNhbl9wYWdl
X3RhYmxlKHdhbGssIGFkZHIpOwoKTm93IEkgY29tZSB0byBsb29rIGF0IHRoaXMgY29kZSBhZ2Fp
biwgSSB0aGluayB5b3UncmUgcmlnaHQuIE9uIGFybTY0IAp0aGlzIGRvZXNuJ3QgY2F1c2UgYSBw
cm9ibGVtIC0gcGFnZSB0YWJsZXMgYXJlIHBhZ2Ugc2l6ZWQgYW5kIHBhZ2UgCmFsaWduZWQsIHNv
IHRoZXJlIGNvdWxkbid0IGJlIGFueSBub24tS0FTQU4gcGd0YWJsZXMgc2hhcmluZyB0aGUgcGFn
ZS4gCk9idmlvdXNseSB0aGF0J3Mgbm90IG5lY2Vzc2FyaWx5IHRydWUgb2Ygb3RoZXIgYXJjaGl0
ZWN0dXJlcy4KCkZlZWwgZnJlZSB0byBhZGQgYSBwYXRjaCB0byB5b3VyIHNlcmllcyA7KQoKU3Rl
dmUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
