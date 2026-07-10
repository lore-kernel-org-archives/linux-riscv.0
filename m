Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890FEC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 03:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xxl0tMAmpSYHPPM2PlbA/4EzQdfqoWlAtSSCfnPBJqc=; b=sEzo/TGMuavwZ3
	f+5mcXzEdVL7GVMRIJsQ2hQi3v5Xyh/fHGKEkGO73akgZIy80w3fmRsTwHSdgqKsm8tChFaJAMupv
	Tgn9kEvQe1fk5G6UfF6psiHjvW1etM5/a9KaIwzP7nDxObTTVH55ZM1XegkCCNw8ydGFEUNFUPM+q
	bR0bSLiqNkxEcWPy5OPb8DcwKFSS5IhD6NSOVpCpLigcOUlBBBomwNZu4skmIjRZvXKC33wUxgN30
	hQ0uzOiMhxf6d4xTlwGsFe4kvqzxsj6JgfathxyDLN3f2esS+VO6+tCFa5rvYut+061BA8GU52Q26
	ixGDyD5kVezXAlibm8bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi2HE-000000043vd-3bF3;
	Fri, 10 Jul 2026 03:51:48 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi2HA-000000043um-24Ra
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 03:51:47 +0000
Received: from [192.168.0.106] (unknown [123.116.46.73])
	by APP-03 (Coremail) with SMTP id rQCowADn47o6bFBqubxUFw--.3467S2;
	Fri, 10 Jul 2026 11:51:22 +0800 (CST)
Message-ID: <c53d323c-1416-49b8-9a17-faf99604b6f6@iscas.ac.cn>
Date: Fri, 10 Jul 2026 11:51:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] mm/sparse-vmemmap: flush_cache_vmap() after
 hotplugging vmemmap
To: Paul Walmsley <pjw@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Suren Baghdasaryan <surenb@google.com>,
 Vlastimil Babka <vbabka@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 Muchun Song <muchun.song@linux.dev>
References: <20260707-mark-after-vmemmap-populate-v5-1-77d1ded3cae3@iscas.ac.cn>
 <db0de3be-a6e1-e4c7-6a1f-2f573499a2b7@kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <db0de3be-a6e1-e4c7-6a1f-2f573499a2b7@kernel.org>
X-CM-TRANSID: rQCowADn47o6bFBqubxUFw--.3467S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KrykWF1fKF15Wry7AFWfAFb_yoW8uFWrpF
	ZIk3WkJFZrZFy8K34xAw17Wry8J3sIga4Yk3Zayr15C3Z8XFW0gryvg34Uury8Xa9YqFWI
	ka4YyFy5Cws8AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU56yI5UUUUU==
X-Originating-IP: [123.116.46.73]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_205144_911383_9768A0BB 
X-CRM114-Status: GOOD (  16.38  )
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

T24gNy8xMC8yNiAwOTo1OCwgUGF1bCBXYWxtc2xleSB3cm90ZToKCj4gSGkgVml2aWFuLAo+Cj4g
T24gVHVlLCA3IEp1bCAyMDI2LCBWaXZpYW4gV2FuZyB3cm90ZToKPgo+PiBbLi4uXQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAo+PiBpbmRleCA4Y2ZlNTk0ODNhOGYuLmU5MzVk
YjI3ZjA5ZiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNo
LmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKPj4gQEAgLTU2
LDcgKzU2LDggQEAgc3RhdGljIGlubGluZSB2b2lkIG1hcmtfbmV3X3ZhbGlkX21hcCh2b2lkKQo+
PiAgI2RlZmluZSBmbHVzaF9jYWNoZV92bWFwIGZsdXNoX2NhY2hlX3ZtYXAKPj4gIHN0YXRpYyBp
bmxpbmUgdm9pZCBmbHVzaF9jYWNoZV92bWFwKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVk
IGxvbmcgZW5kKQo+PiAgewo+PiAtCWlmIChpc192bWFsbG9jX29yX21vZHVsZV9hZGRyKCh2b2lk
ICopc3RhcnQpKQo+PiArCWlmIChpc192bWFsbG9jX29yX21vZHVsZV9hZGRyKCh2b2lkICopc3Rh
cnQpIHx8Cj4+ICsJICAgIChzdGFydCA+PSBWTUVNTUFQX1NUQVJUICYmIGVuZCA8PSBWTUVNTUFQ
X0VORCkpCj4gSXMgdGhlcmUgYW4gb2ZmLWJ5LW9uZSBlcnJvciBoZXJlPyAgVk1FTU1BUF9FTkQg
aXMgY3VycmVudGx5IHNldCB0bwo+IFZNQUxMT0NfU1RBUlQgb24gUklTQy1WLgoKSSBkbyB0aGlu
ayBlbmQgPD0gVk1FTU1BUF9FTkQgaXMgY29ycmVjdC4KRG9jdW1lbnRhdGlvbi9jb3JlLWFwaS9j
YWNoZXRsYi5yc3Qgc2F5czoKCjYpIGBgdm9pZCBmbHVzaF9jYWNoZV92bWFwKHVuc2lnbmVkIGxv
bmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKWBgCsKgIMKgYGB2b2lkIGZsdXNoX2NhY2hlX3Z1
bm1hcCh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZClgYAoKwqAgwqAgSGVy
ZSBpbiB0aGVzZSB0d28gaW50ZXJmYWNlcyB3ZSBhcmUgZmx1c2hpbmcgYSBzcGVjaWZpYyByYW5n
ZQrCoCDCoCBvZiAoa2VybmVsKSB2aXJ0dWFsIGFkZHJlc3NlcyBmcm9tIHRoZSBjYWNoZS7CoCBB
ZnRlciBydW5uaW5nLArCoCDCoCB0aGVyZSB3aWxsIGJlIG5vIGVudHJpZXMgaW4gdGhlIGNhY2hl
IGZvciB0aGUga2VybmVsIGFkZHJlc3MKwqAgwqAgc3BhY2UgZm9yIHZpcnR1YWwgYWRkcmVzc2Vz
IGluIHRoZSByYW5nZSAnc3RhcnQnIHRvICdlbmQtMScuCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KClNvIHRoaXMgaXMgb25l
IG9mIHRob3NlIGhhbGYtb3BlbiByYW5nZXMuIFdoZW4gZW5kID09IFZNRU1NQVBfRU5ELCBpdApt
ZWFucyB0aGF0IHRoZSBlbmQgb2YgdGhlIHJhbmdlIGlzIGV4YWN0bHkgYXQgdGhlIGVuZCBvZiB0
aGUgdm1lbW1hcC4KCj4gQW0gYXNzdW1pbmcgeW91J2xsIHVwZGF0ZSB0aGlzIHBhdGNoIG9uZSBt
b3JlIHRpbWU/ICBBdCB0aGF0IHBvaW50IEknbGwgCj4gcGxhbiB0byBhZGQgaXQgaW50byB2Ny4y
LXJjLCBhc3N1bWluZyBBbmRyZXcgZG9lc24ndCBvYmplY3QuCgpZZXMgSSB3aWxsLiBUaGVyZSdz
IGFuIGV4dHJhbmVvdXMgaHVuayBmb3IgYXJjaC9yaXNjdi9tbS9pbml0LmMgdGhhdCBJCmFjY2lk
ZW50YWxseSBhZGRlZCB0byB0aGlzIHBhdGNoLCB3aGljaCB3YXMgdGhlIHRoaW5nIHRoYXQgcHJv
bXB0ZWQgdGhlCiJvb3BzIEknbGwgc2VuZCBhIHY2IHRvIGZpeCIgZWFybGllci4gQW5kIHRoZXJl
J3MgYSBidWlsZCBmYWlsdXJlIGZvcgpNTVU9biwgd2hpY2ggSSB3aWxsIGFsc28gZml4IGZvciB2
Ni4gKFdoeSBpcyB0aGlzIGNvZGUgZXZlbiBjb21waWxlZCBmb3IKTU1VPW4uLi4pCgooTXVjaHVu
OiBBbHNvIHRoYW5rcyBmb3IgdGhlIGhpbnQgb24gdGhlIGxhdHRlciBwb2ludCByZXBvcnRlZCBi
eSBTYXNoaWtvLikKCkkgaGF2ZW4ndCBiZWVuIGFibGUgdG8gZ2V0IHRvIGl0IHRoaXMgd2Vlaywg
dW5mb3J0dW5hdGVseS4gSSdsbApkZWZpbml0ZWx5IGdldCB0byBpdCBuZXh0IHdlZWsgaWYgcG9z
c2libGUuCgpWaXZpYW4gImRyYW1mb3JldmVyIiBXYW5nCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
