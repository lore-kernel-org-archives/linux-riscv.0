Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EFBC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 17:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J0Ws9wS5/+XQDFuxhnJBaI/aCff/Qqo82Kanuuqs3xc=; b=p8iUOCvK54zSJ4
	g9gjASycB/5zf+UHw4JruWkUdoc9KVKKg3Rt4f7mWZpF3rjsr+E+qUWPAZXfTxKUzrpiIP/vvRUSZ
	mZV+F4oWJxX520QBFTnpg6MjJv966e7zuujpQtD3+xTWG0o12jMHWGlklFhnVPVmrSDERBtog7eg3
	iRsOgt3DU/v2jaHhtqd/3wyhM63rpa27e0sTChZdW7Nzqobe7+A8qBNjJ9H+HJzafZYByAm2ZXKnS
	Hxk4sLD8BDpAPof7IqPsV19j9GHEcMtQ6LoVxmltt7J3byKLc43tVlZp3li+ra9yuX+VawUSOKUg2
	Y4OtH04xWSsJLaG/VAvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfPLW-00AyL2-Jc; Fri, 15 Apr 2022 17:02:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfPLT-00AyJZ-0o
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 17:02:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650042172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZzBogzvEUo8J9TgEmB5sb1Fv1z0k0Lt5IOZ/xOeDFpw=;
 b=VHKT8r7SJXRO+anWzNwNSiBxx5JVJ+//HNWWmLQSBcV8CbRIdkf0AHWhOmybQUGoVm27W3
 KNP7ud2R6exA+lpHMb2kHhvVkrT/IRLggy8z9134lX6twR08UQ3iEg5HT5aFfN2x7rSyrd
 xS4Kw5JY29cCt55Pwnjxn+B0cbKg/no=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-7v658Eh0O260N3sQjcrLhg-1; Fri, 15 Apr 2022 13:02:48 -0400
X-MC-Unique: 7v658Eh0O260N3sQjcrLhg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E2723C18535;
 Fri, 15 Apr 2022 17:02:47 +0000 (UTC)
Received: from [10.22.32.72] (unknown [10.22.32.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95928202F320;
 Fri, 15 Apr 2022 17:02:42 +0000 (UTC)
Message-ID: <8f2a3903-ab49-23cc-a362-a9857dc38410@redhat.com>
Date: Fri, 15 Apr 2022 13:02:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/7] asm-generic: ticket-lock: New generic ticket-based
 spinlock
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, heiko@sntech.de, guoren@kernel.org,
 shorne@gmail.com, peterz@infradead.org, mingo@redhat.com,
 Will Deacon <will@kernel.org>, boqun.feng@gmail.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, macro@orcam.me.uk,
 Greg KH <gregkh@linuxfoundation.org>, sudipm.mukherjee@gmail.com,
 wangkefeng.wang@huawei.com, jszhang@kernel.org, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
References: <mhng-f4d144dd-b6ed-4f3f-bfc3-6dc29fab14e4@palmer-ri-x1c9>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <mhng-f4d144dd-b6ed-4f3f-bfc3-6dc29fab14e4@palmer-ri-x1c9>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_100255_457712_05B1E78C 
X-CRM114-Status: GOOD (  23.94  )
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

T24gNC8xNS8yMiAxMjo0NiwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4KPj4+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2FzbS1nZW5lcmljL3NwaW5sb2NrX3R5cGVzLmggCj4+PiBiL2luY2x1ZGUvYXNt
LWdlbmVyaWMvc3BpbmxvY2tfdHlwZXMuaAo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uZTU2ZGRiODRkMDMwCj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysg
Yi9pbmNsdWRlL2FzbS1nZW5lcmljL3NwaW5sb2NrX3R5cGVzLmgKPj4+IEBAIC0wLDAgKzEsMTcg
QEAKPj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLwo+Pj4gKwo+Pj4g
KyNpZm5kZWYgX19BU01fR0VORVJJQ19USUNLRVRfTE9DS19UWVBFU19ICj4+PiArI2RlZmluZSBf
X0FTTV9HRU5FUklDX1RJQ0tFVF9MT0NLX1RZUEVTX0gKPj4+ICsKPj4+ICsjaW5jbHVkZSA8bGlu
dXgvdHlwZXMuaD4KPj4+ICt0eXBlZGVmIGF0b21pY190IGFyY2hfc3BpbmxvY2tfdDsKPj4+ICsK
Pj4+ICsvKgo+Pj4gKyAqIHFyd2xvY2tfdHlwZXMgZGVwZW5kcyBvbiBhcmNoX3NwaW5sb2NrX3Qs
IHNvIHdlIG11c3QgdHlwZWRlZiAKPj4+IHRoYXQgYmVmb3JlIHRoZQo+Pj4gKyAqIGluY2x1ZGUu
Cj4+PiArICovCj4+PiArI2luY2x1ZGUgPGFzbS9xcndsb2NrX3R5cGVzLmg+Cj4+Cj4+IEkgYmVs
aWV2ZSB0aGF0IGlmIHlvdSBndWFyZCB0aGUgaW5jbHVkZSBsaW5lIGJ5Cj4+Cj4+ICNpZmRlZiBD
T05GSUdfUVVFVUVEX1JXTE9DSwo+PiAjaW5jbHVkZSA8YXNtL3Fyd2xvY2tfdHlwZXMuaD4KPj4g
I2VuZGlmCj4+Cj4+IFlvdSBtYXkgbm90IG5lZWQgdG8gZG8gdGhlIGhhY2sgaW4gcGF0Y2ggNS4K
Pgo+IFllcywgYW5kIHdlIGFjdHVhbGx5IGhhZCBpdCB0aGF0IHdheSB0aGUgZmlyc3QgdGltZSBh
cm91bmQgCj4gKHNwZWNpZmljYWxseSB0aGUgQVJDSF9VU0VTX1FVRVVFRF9SV0xPQ0tTLCBidXQg
SUlVQyB0aGF0J3MgdGhlIHNhbWUgCj4gaGVyZSkuwqAgVGhlIGdvYWwgd2FzIHRvIGF2b2lkIGFk
ZGluZyB0aGUgaWZkZWYgdG8gdGhlIGFzbS1nZW5lcmljIGNvZGUgCj4gYW5kIGluc3RlYWQga2Vl
cCB0aGUgb2RkbmVzcyBpbiBhcmNoL3Jpc2N2LCBpdCdzIG9ubHkgdGhlcmUgZm9yIHRoYXQgCj4g
b25lIGNvbW1pdCAoYW5kIGp1c3Qgc28gd2UgY2FuIHNwbGl0IG91dCB0aGUgc3BpbmxvY2sgY29u
dmVyc2lvbiBmcm9tIAo+IHRoZSByd2xvY2sgY29udmVyc2lvbiwgaW4gY2FzZSB0aGVyZSdzIGEg
YnVnIGFuZCB0aGVzZSBuZWVkIHRvIGJlIAo+IGJpc2VjdGVkIGxhdGVyKS4KPgo+IEknZCBhbHNv
IGNvbnNpZGVyZWQgcmVuYW1pbmcgcXJ3bG9jayogdG8gcndsb2NrKiwgd2hpY2ggd291bGQgYXZv
aWQgCj4gdGhlIGlmZGVmIGFuZCBtYWtlIGl0IGEgdG91Y2ggZWFzaWVyIHRvIG92ZXJyaWRlIHRo
ZSByd2xvY2sgCj4gaW1wbGVtZW50YXRpb24sIGJ1dCB0aGF0IGRpZG4ndCBzZWVtIHVzZWZ1bCBl
bm91Z2ggdG8gd2FycmFudCB0aGUgCj4gZGlmZi7CoCBUaGVzZSBhbGwgc2VlbSBhIGJpdCBtb3Jl
IGNvdXBsZWQgdGhhbiBJIGV4cGVjdGVkIHRoZW0gdG8gYmUgCj4gKGJvdGgge3NwaW4scXJ3fWxv
Y2t7LF90eXBlc30uaCBhbmQgdGhlIGJpdHMgaW4gbGludXgvKSwgSSBsb29rZWQgaW50byAKPiBj
bGVhbmluZyB0aGF0IHVwIGEgYml0IGJ1dCBpdCBzZWVtZWQgbGlrZSB0b28gbXVjaCBmb3IganVz
dCB0aGUgb25lIAo+IHBhdGNoIHNldC4KClRoZW4geW91IGFyZSBmb3JjaW5nIGFyY2hlcyB0aGF0
IHVzZSBhc21fZ2VuZXJpYy9zcGlubG9jay5oIHRvIHVzZSAKcXJ3bG9jayBhcyB3ZWxsLiBFdmVu
IHRob3VnaCBtb3N0IG9mIHRoZW0gcHJvYmFibHkgd2lsbCwgYnV0IGZvcmNpbmcgaXQgCnRoaXMg
d2F5IHJlbW92ZSB0aGUgZmxleGliaWxpdHkgYW4gYXJjaCBtYXkgd2FudCB0byBoYXZlLgoKVGhl
IGRpZmZlcmVuY2UgYmV0d2VlbiBDT05GSUdfUVVFVUVEX1JXTE9DSyBhbmQgQVJDSF9VU0VTX1FV
RVVFRF9SV0xPQ0tTIAppcyB0aGF0IHFyd2xvY2sgd2lsbCBub3QgYmUgY29tcGlsZWQgaW4gd2hl
biBQUkVFTVBUX1JUIHx8ICFTTVAuIFNvIApDT05GSUdfUVVFVUVEX1JXTE9DSyBpcyBhIG1vcmUg
YWNjdXJhdGUgZ3VhcmQgYXMgdG8gd2hldGhlciBxcndsb2NrIApzaG91bGQgcmVhbGx5IGJlIHVz
ZWQuCgpDaGVlcnMsCkxvbmdtYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
