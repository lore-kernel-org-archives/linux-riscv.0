Return-Path: <SRS0=YT8n=JG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE67CC433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 12:07:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63F15610A4
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 12:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63F15610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iw5IY9gWslpHBulOmzwA0wWOB5ekK+jplKwG5mmWs+s=; b=WjtUZhDjUT/fA6oafON8/6bDi
	ADU5mtnU5hSbo8mRK8duGH0SWeb+YRCZlHoHMQdUUv6tlOfDo5Oyp3oGJ6rk3UtI24cyd20YbtSbj
	+TPhNv+FUdLLN7dcW75E1p5F/2vPazVfEG+ZeabKAp8H+b11WkNj1qZ6pq50uEPdL6xS+1X/Ng9QW
	JsjcccGZLqxfANHrEgGd9kc/Bd1mUU2AS99S/T3CYGdgyzfNqeZ7BOeqyn6/Fo6oF+qF7WbPhiZ3Y
	PvpTIbttHgr87IcZnQ9WjOKfM7/iKyxe7DhP5E5vvrgdQRu5TrH8rLKV3FZwwaKpsxEHd2aes1WBS
	c7QEXttnw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUpvH-000gnl-Vr; Fri, 09 Apr 2021 12:07:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUpvG-000gnc-5t
 for linux-riscv@desiato.infradead.org; Fri, 09 Apr 2021 12:07:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References
 :Cc:To:Sender:Reply-To:Content-ID:Content-Description;
 bh=cPZ0Ie5xguOPpDLkGIOIn4xg63tOXcjWUdAtpJa2pV4=; b=0/oKQrQNG/nk8nqgjFuMKywv+A
 GcxZ1YrAm0VUxeIbdkxDCMNfuSyS/Jikyy6v/PcwOcjZZehoxk23HtSNbraISrg71jHuhRnG3LMmj
 vUO3WZvV1BdU6zlyWKmL+JrBT7haVQGQOeDkdTzAGTpEcDWpN51Jj3YZy22dOyPVGwHI7O/oEwwWz
 ozgRWa3f1SrERNzNCUfjebUPL6RGn8VeAQ00b3RWFsjCOn765piAs/qOsuWyDmNw859AatjrSHy5v
 hzTP1pqYslalSHP22eUbrOwu3SNp3Nr0jtIlbhz4Av0ofaKN/k5BRddxuTKnT93V76HewjnACYYBP
 xGYI21dg==;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUpvD-004Uhz-GC
 for linux-riscv@lists.infradead.org; Fri, 09 Apr 2021 12:07:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617970054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cPZ0Ie5xguOPpDLkGIOIn4xg63tOXcjWUdAtpJa2pV4=;
 b=FfcgZEvZByk22GCl6ZyQz0rJGzS1126aWm0fMf7DDETb/LT+O3M4DwTOPrvlqgAHpgBx5h
 8dtWRa3wmbIfGnNXd4m0gG7/RsbUx3pJjhnI4+o1hdLwZwgiyCFVYB7q8/4X1AkiTJyBNl
 r2TUG+/3+8jZb/nFBya17iQHtSIlSsg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-m71PPXm6OwGvDs3bRsxdqA-1; Fri, 09 Apr 2021 08:07:29 -0400
X-MC-Unique: m71PPXm6OwGvDs3bRsxdqA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E92AA801971;
 Fri,  9 Apr 2021 12:07:27 +0000 (UTC)
Received: from [10.36.115.11] (ovpn-115-11.ams2.redhat.com [10.36.115.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75E3460916;
 Fri,  9 Apr 2021 12:07:25 +0000 (UTC)
To: Alex Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org
Cc: Vitaly Wool <vitaly.wool@konsulko.com>, Mike Rapoport <rppt@linux.ibm.com>
References: <20210409065115.11054-1-alex@ghiti.fr>
 <3500f3cb-b660-5bbc-ae8d-0c9770e4a573@ghiti.fr>
 <be575094-badf-bac7-1629-36808ca530cc@redhat.com>
 <c4e78916-7e4c-76db-47f6-4dda3f09c871@ghiti.fr>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v7] RISC-V: enable XIP
Message-ID: <d4d771a8-c731-acaf-b42d-44800c61f2e6@redhat.com>
Date: Fri, 9 Apr 2021 14:07:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c4e78916-7e4c-76db-47f6-4dda3f09c871@ghiti.fr>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_050735_626919_9C5D6F6A 
X-CRM114-Status: GOOD (  29.10  )
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

T24gMDkuMDQuMjEgMTM6MzksIEFsZXggR2hpdGkgd3JvdGU6Cj4gSGkgRGF2aWQsCj4gCj4gTGUg
NC85LzIxIMOgIDQ6MjMgQU0sIERhdmlkIEhpbGRlbmJyYW5kIGEgw6ljcml0wqA6Cj4+IE9uIDA5
LjA0LjIxIDA5OjE0LCBBbGV4IEdoaXRpIHdyb3RlOgo+Pj4gTGUgNC85LzIxIMOgIDI6NTEgQU0s
IEFsZXhhbmRyZSBHaGl0aSBhIMOpY3JpdMKgOgo+Pj4+IEZyb206IFZpdGFseSBXb29sIDx2aXRh
bHkud29vbEBrb25zdWxrby5jb20+Cj4+Pj4KPj4+PiBJbnRyb2R1Y2UgWElQIChlWGVjdXRlIElu
IFBsYWNlKSBzdXBwb3J0IGZvciBSSVNDLVYgcGxhdGZvcm1zLgo+Pj4+IEl0IGFsbG93cyBjb2Rl
IHRvIGJlIGV4ZWN1dGVkIGRpcmVjdGx5IGZyb20gbm9uLXZvbGF0aWxlIHN0b3JhZ2UKPj4+PiBk
aXJlY3RseSBhZGRyZXNzYWJsZSBieSB0aGUgQ1BVLCBzdWNoIGFzIFFTUEkgTk9SIGZsYXNoIHdo
aWNoIGNhbgo+Pj4+IGJlIGZvdW5kIG9uIG1hbnkgUklTQy1WIHBsYXRmb3Jtcy4gVGhpcyBtYWtl
cyB3YXkgZm9yIHNpZ25pZmljYW50Cj4+Pj4gb3B0aW1pemF0aW9uIG9mIFJBTSBmb290cHJpbnQu
IFRoZSBYSVAga2VybmVsIGlzIG5vdCBjb21wcmVzc2VkCj4+Pj4gc2luY2UgaXQgaGFzIHRvIHJ1
biBkaXJlY3RseSBmcm9tIGZsYXNoLCBzbyBpdCB3aWxsIG9jY3VweSBtb3JlCj4+Pj4gc3BhY2Ug
b24gdGhlIG5vbi12b2xhdGlsZSBzdG9yYWdlLiBUaGUgcGh5c2ljYWwgZmxhc2ggYWRkcmVzcyB1
c2VkCj4+Pj4gdG8gbGluayB0aGUga2VybmVsIG9iamVjdCBmaWxlcyBhbmQgZm9yIHN0b3Jpbmcg
aXQgaGFzIHRvIGJlIGtub3duCj4+Pj4gYXQgY29tcGlsZSB0aW1lIGFuZCBpcyByZXByZXNlbnRl
ZCBieSBhIEtjb25maWcgb3B0aW9uLgo+Pj4+Cj4+Pj4gWElQIG9uIFJJU0MtViB3aWxsIGZvciB0
aGUgdGltZSBiZWluZyBvbmx5IHdvcmsgb24gTU1VLWVuYWJsZWQKPj4+PiBrZXJuZWxzLgo+Pj4+
Cj4+PiBJIGFkZGVkIGxpbnV4LW1tIGFuZCBsaW51eC1hcmNoIHRvIGdldCBmZWVkYmFja3MgYmVj
YXVzZSBJIG5vdGljZWQgdGhhdAo+Pj4gREVCVUdfVk1fUEdUQUJMRSBmYWlscyBmb3IgU1BBUlNF
TUVNIChpdCB3b3JrcyBmb3IgRkxBVE1FTSBidXQgSSB0aGluawo+Pj4gaXQgZG9lcyBub3QgZG8g
d2hhdCBpcyBleHBlY3RlZCk6IHRoZSBmYWN0IHRoYXQgd2UgZG9uJ3QgaGF2ZSBhbnkgc3RydWN0
Cj4+PiBwYWdlIHRvIGJhY2sgdGhlIHRleHQgYW5kIHJvZGF0YSBpbiBmbGFzaCBpcyB0aGUgcHJv
YmxlbSBidXQgdG8gd2hpY2gKPj4+IGV4dGVudCA/Cj4+Cj4+IEp1c3Qgd29uZGVyaW5nLCB3aHkg
Y2FuJ3Qgd2UgY3JlYXRlIGEgbWVtbWFwIGZvciB0aGF0IG1lbW9yeSAtLSBvciBpcyBpdAo+PiBl
dmVuIGRlc2lyZWFibGUgdG8gbm90IGRvIHRoYXQgZXhwbGljaXR5PyBUaGVyZSBtaWdodCBiZSBz
b21lIG5hc3R5IHNpZGUKPj4gZWZmZWN0cyB3aGVuIG5vdCBoYXZpbmcgYSBtZW1tYXAgZm9yIHRl
eHQgYW5kIHJvZGF0YS4KPiAKPiAKPiBEbyB5b3UgaGF2ZSBleGFtcGxlcyBvZiBzdWNoIGVmZmVj
dHMgPyBBbnkgZmVhdHVyZSB0aGF0IHdpbGwgbm90IHdvcmsKPiB3aXRob3V0IHRoYXQgPwo+IAoK
QXQgbGVhc3QgaWYgaXQncyBub3QgcGFydCBvZiAvcHJvYy9pb21lbSBpbiBhbnkgd2F5IChtYXli
ZSAiU3lzdGVtIFJBTSIgCmlzIG5vdCB3aGF0IHdlIHdhbnQgd2l0aG91dCBhIG1lbW1hcCwgVEJE
KSwga2V4ZWMtdG9vbHMgd29uJ3QgYmUgYWJsZSB0byAKaGFuZGxlIGl0IHByb3Blcmx5IGUuZy4s
IGZvciBrZHVtcC4gQnV0IG5vdCBzdXJlIGlmIHRoYXQgaXMgcmVhbGx5IApyZWxldmFudCBpbiB5
b3VyIHNldHVwLgoKUmVnYXJkaW5nIG90aGVyIGZlYXR1cmVzLCBhbnl0aGluZyB0aGF0IGRvZXMg
YSBwZm5fdmFsaWQoKSwgCnBmbl90b19wYWdlKCkgb3IgcGZuX3RvX29ubGluZV9wYWdlKCkgd291
bGQgYmVoYXZlIGRpZmZlcmVudGx5IG5vdyAtLSAKYXNzdW1pbmcgdGhlIGtlcm5lbCBkb2Vzbid0
IGZhbGwgaW50byBhIHNlY3Rpb24gd2l0aCBvdGhlciBTeXN0ZW0gUkFNIAood2hlcmVieSB3ZSB3
b3VsZCBzdGlsbCBhbGxvY2F0ZSB0aGUgbWVtbWFwIGZvciB0aGUgd2hvbGUgc2VjdGlvbikuCgpJ
IGd1ZXNzIHlvdSBtaWdodCBzdHVtYmxlIG92ZXIgc29tZSBzdXJwcmlzZXMgaW4gc29tZSBjb2Rl
IHBhdGhzLCBidXQgCm5vdGhpbmcgcmVhbGx5IGNvbWVzIHRvIG1pbmQuIE5vdCBzdXJlIGlmIHlv
dXIgemVyb3BhZ2UgaXMgcGFydCBvZiB0aGUgCmtlcm5lbCBpbWFnZSBvbiBSSVNDLVYgKEkgcmVt
ZW1iZXIgdGhhdCB3ZSBzb21ldGltZXMgbmVlZCBhIG1lbW1hcCAKdGhlcmUsIGJ1dCBJIG1pZ2h0
IGJlIHdyb25nKT8KCkkgYXNzdW1lIHlvdSBzdGlsbCBzb21laG93IGNyZWF0ZSB0aGUgZGlyZWN0
IG1hcHBpbmcgZm9yIHRoZSBrZXJuZWwsIApyaWdodD8gU28gaXQncyByZWFsbHkgc29tZSBtZW1v
cnkgcmVnaW9uIHdpdGggYSBkaXJlY3QgbWFwcGluZyBidXQgCndpdGhvdXQgYSBtZW1tYXAgKGFu
ZCByaWdodCBub3csIHdpdGhvdXQgYSByZXNvdXJjZSksIGNvcnJlY3Q/CgpbLi4uXQoKPj4KPj4g
QWxzbywgd2lsbCB0aGF0IG1lbW9yeSBwcm9wZXJseSBiZSBleHBvc2VkIGluIHRoZSByZXNvdXJj
ZSB0cmVlIGFzCj4+IFN5c3RlbSBSQU0gKGUuZy4sIC9wcm9jL2lvbWVtKSA/IE90aGVyd2lzZSBz
b21lIHRoaW5ncyAoL3Byb2Mva2NvcmUpCj4+IHdvbid0IHdvcmsgYXMgZXhwZWN0ZWQgLSB0aGUg
a2VybmVsIHdvbid0IGJlIGluY2x1ZGVkIGluIGEgZHVtcC4KPiAKPiAKPiBJIGhhdmUganVzdCBj
aGVja2VkIGFuZCBpdCBkb2VzIG5vdCBhcHBlYXIgaW4gL3Byb2MvaW9tZW0uCj4gCj4gT2sgeW91
ciBjb25jbHVzaW9uIHdvdWxkIGJlIHRvIGhhdmUgc3RydWN0IHBhZ2UsIEknbSBnb2luZyB0byBp
bXBsZW1lbnQKPiB0aGlzIHZlcnNpb24gdGhlbiB1c2luZyBtZW1ibG9jayBhcyB5b3UgZGVzY3Jp
YmVkLgoKTGV0J3MgZmlyc3QgZXZhbHVhdGUgd2hhdCB0aGUgaGFybSBjb3VsZCBiZS4gWW91IGNv
dWxkIChhbmQgc2hvdWxkPykgCmNyZWF0ZSB0aGUga2VybmVsIHJlc291cmNlIG1hbnVhbGx5IC0g
SUlSQywgdGhhdCdzIGluZGVwZW5kZW50IG9mIHRoZSAKbWVtbWFwL21lbWJsb2NrIHRoaW5nLgoK
QE1pa2UsIHdoYXQncyB5b3VyIHRha2Ugb24gbm90IGhhdmluZyBhIG1lbW1hcCBmb3Iga2VybmVs
IHRleHQgYW5kIHJvIGRhdGE/CgotLSAKVGhhbmtzLAoKRGF2aWQgLyBkaGlsZGVuYgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
