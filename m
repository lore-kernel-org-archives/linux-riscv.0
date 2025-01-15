Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A254BC02185
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 09:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouzjTQHZp8sgWH63UoY5rAfGT3CVDUWaI68C96kdZi4=; b=4kaM7VlMCCck1D
	6OvcIcRAvXcYbjBZs2xUwoIYENNzxrJy/VcuURKA/oSYXlfVUTFWiuxhV6De4TmcF8om/b3pVyr9G
	IOlRMB4PE7EivuuYLYkGbGd66ZWmuTvB9iEL0ABdASDHODQJko9N7gJa5K/GG+tSbV+imeb+Tzjji
	Iuk7nNyV2iyJnj8CME7IGO6ZNobw5jxpwH8SjiLwdyu8Oix5SjlOAvUypvHyXKeI/2EFY1VLy7v+q
	2qBS0Wfpg3puJF4oBWNecNEBVIrn80UjYcRYZjBhRQZQMk+uwf9TQ5qRacmqtR/dahaP2pJBpiexi
	U5yORhcjZfQBPiBFDoOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzIG-0000000BCvS-22xE;
	Wed, 15 Jan 2025 09:02:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyBT-0000000B03K-18le
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 07:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736927484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=76g+ehOGqy/SEvjWWgvRWr2mJbRu3eotidTcR3l0/T0=;
	b=f2frici8pSxX4ny/2/9NknhpilSGDG8hUeUz60Tlxkcet80knDIfCVFGF9Q7h8R2OaUa4O
	oPnmdMEXftZCkTURtlErGT+aE/jPrrwaWWEcQy/s5bUfNggFzXuR52fq2nrQOEENCfQboE
	IedSAAwtiuWLRZOTu3PG0AikW0XSDsc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-197-diEROnh5NYuaXbbgtka3Kg-1; Wed,
 15 Jan 2025 02:51:22 -0500
X-MC-Unique: diEROnh5NYuaXbbgtka3Kg-1
X-Mimecast-MFC-AGG-ID: diEROnh5NYuaXbbgtka3Kg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CC0401955DB8;
	Wed, 15 Jan 2025 07:51:20 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.2.16.35])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6A340195608A;
	Wed, 15 Jan 2025 07:51:18 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Jeff Law <jeffreyalaw@gmail.com>,  linux-riscv@lists.infradead.org,
  Palmer Dabbelt <palmer@rivosinc.com>,  Xu Lu <luxu.kernel@bytedance.com>
Subject: Re: Page sizes supported by RISC-V
In-Reply-To: <alpine.DEB.2.21.2501150631330.50458@angie.orcam.me.uk> (Maciej
	W. Rozycki's message of "Wed, 15 Jan 2025 06:51:37 +0000 (GMT)")
References: <878qvbzqfx.fsf@oldenburg.str.redhat.com>
	<e55950a2-beb0-4f2a-81da-1c66724116d7@gmail.com>
	<8734lixzss.fsf@oldenburg.str.redhat.com>
	<cbbc9925-12a5-4043-a6c5-ccd1ef0997c8@gmail.com>
	<31ce4016-9420-4143-ae31-faf36a878cb4@gmail.com>
	<alpine.DEB.2.21.2501150631330.50458@angie.orcam.me.uk>
Date: Wed, 15 Jan 2025 08:51:15 +0100
Message-ID: <87msfsldl8.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rk0Ve2cD5LtperPxbsvA9vIrbgL0Opazp2oYByh7bEU_1736927481
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_235127_381109_8BA01DCB 
X-CRM114-Status: GOOD (  19.21  )
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

KiBNYWNpZWogVy4gUm96eWNraToKCj4gT24gVHVlLCAxNCBKYW4gMjAyNSwgSmVmZiBMYXcgd3Jv
dGU6Cj4KPj4gPj4gSSB1bmRlcnN0YW5kIHRoYXQgbm90IG1ha2luZyBhIGNhbGwgaW4gdGhlIHNw
ZWNpZmljYXRpb25zIGF2b2lkcyB0aGUKPj4gPj4gbmVlZCB0byByZXNvbHZlIHRoZXNlIGNvbmZs
aWN0cy7CoCBCdXQgaWYgeW91IGRvbid0IGRlZmluZSBhIG1heGltdW0gcGFnZQo+PiA+PiBzaXpl
IHRoZXJlLCBpdCBpcyBlZmZlY3RpdmVseSBzcGVjaWZpZWQgYXMgNDA5NiBieXRlcy7CoCBUaGlz
IHdpbGwgY2F1c2UKPj4gPj4gcHJvYmxlbXMgaWYgZGlzdHJpYnV0aW9ucyB0YXJnZXRpbmcgbGFy
Z2Ugc3lzdGVtcyB3YW50IGEgbGFyZ2VyIHBhZ2UKPj4gPj4gc2l6ZSBiZWNhdXNlIGl0IGJldHRl
ciBhbGlnbnMgd2l0aCB0aGUga2luZCBvZiBoYXJkd2FyZSB0aGV5IHRhcmdldC4KPj4gPj4gSXQn
cyByZWFsbHkgYmFkIGZvciBjcm9zcy1kaXN0cmlidXRpb24gYmluYXJ5IGNvbXBhdGliaWxpdHks
IHNvbWV0aGluZwo+PiA+PiB0aGF0J3MgaW1wb3J0YW50IG91dHNpZGUgdGhlIGVtYmVkZGVkIHNw
YWNlIGFuZCBwcm9iYWJseSBuZWNlc3NhcnkgZm9yCj4+ID4+IG1haW5zdHJlYW1pbmcuCj4+ID4+
Cj4+ID4+IChPZiBjb3Vyc2UgeW91IGtub3cgYWxsIHRoaXMuIDgtKQo+PiA+IFl1cC7CoCBPbmNl
IGl0J3MgYmFrZWQgaW50byBvbmUgc2lnbmlmaWNhbnQgZGlzdHJvLCBpdCdzIGRvaW5nIHRvIGJl
IAo+PiA+IGJsb29keSBoYXJkIHRvIGNoYW5nZS7CoCBJJ20gc3VyZSB3ZSBib3RoIHJlbWVtYmVy
IHRoZSBQUEMgcGFnZXNpemUgc3R1ZmYgCj4+ID4gZnJvbSBhIGZldyB5ZWFycyBiYWNrIDsoCj4+
ID4gCj4+ID4gSSBzdHJvbmdseSBzdXNwZWN0IHRoZSBsYWNrIG9mIHNwZWNpZmljYXRpb24gaGVy
ZSBpcyBtZWFuIHRvIGdpdmUgCj4+ID4gZGVncmVlcyBvZiBmcmVlZG9tIHRvIHRoZSBpbXBsZW1l
bnRvcnMsIGJ1dCBzb21ldGltZXMgdGhvc2Ugd3JpdGluZyB0aGUgCj4+ID4gc3BlY3MgZG9uJ3Qg
cmVhbGx5IHVuZGVyc3RhbmQgdGhlIGltcGxpY2F0aW9uIG9mIGxlYXZpbmcgdGhpbmdzIGxpa2Ug
Cj4+ID4gdGhpcyB1bnNwZWNpZmllZCBhbmQgaG93IG11Y2ggcGFpbiBpdCByZWFsbHkgY2F1c2Vz
IGluIHRoZSBlbmQuCj4+IFNvIHJlc3VycmVjdGluZyB0aGlzIGRpc2N1c3Npb24uCj4+IAo+PiBJ
cyB0aGVyZSBhbnkgcmVhbGlzdGljIGNoYW5jZSBvZiBidW1waW5nIHRoZSBtaW5pbXVtIHBhZ2Vz
aXplIGZvciByaXNjLXYgCj4+IGF0IHRoaXMgcG9pbnQ/ICBYdSBMdSBhbmQgaGlzIHRlYW0gaGF2
ZSBzb21lIGNvbXBlbGxpbmcgZGF0YSB0aGF0IAo+PiBpbmRpY2F0ZXMgbW92aW5nIGZvcndhcmQg
dG8gNjRrIGNvdWxkIGJlIGhpZ2hseSBwcm9maXRhYmxlLiAgVGhhdCB3b3JrIAo+PiB3YXMgZG9u
ZSBvbiBhYXJjaDY0LCBidXQgc2hvdWxkIGJlIGdlbmVyYWxseSBhcHBsaWNhYmxlIHRvIHJpc2N2
IGFzIHdlbGwuCj4KPiBDYW4ndCB3ZSBzaW1wbHkgbWFrZSBhIHJlYXNvbmFibGUgZ3Vlc3MvYXNz
dW1wdGlvbiBqdXN0IGZvciB0aGUgcHVycG9zZSAKPiBvZiB0b29saW5nPwoKVGhhdCByZWFzb25h
YmxlIGRlZmF1bHQgZXhpc3RzIHRvZGF5IGFuZCBpcyA0MDk2LiAgU29tZSBlZmZvcnQgaXMKcmVx
dWlyZWQgdG8gY2hhbmdlIHRoYXQuCgo+IEJhc2VkIG9uIHRoZSBleHBlcmllbmNlIHdpdGggTUlQ
Uy9BQXJjaDY0IHNoYXJlZCBoZXJlIHRoZXJlIHNob3VsZCBiZSBubwo+IGRpc2FncmVlbWVudCBh
cyB0byBnb2luZyBmb3IgYXQgbGVhc3QgNjRLaUIgSSBzdXBwb3NlLiAgVGhlbiBzaGFsbCB3ZSBn
byAKPiBiZXlvbmQgdG8gbGVhdmUgcm9vbSBmb3Igc29tZSBleHBhbnNpb24sIHN1Y2ggYXMgZm9y
IDI1NktpQj8KClRoZSBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBmaXggTGludXggc28gdGhhdCBp
dCBzdXBwb3J0cyBtdWx0aXBsZSBwYWdlCnNpemVzLiAgVGhlbiBmcm9tIGFuIGFwcGxpY2F0aW9u
IHBlcnNwZWN0aXZlIChhbmQgZHluYW1pYyBsaW5rZXIKcGVyc3BlY3RpdmUpLCB0aGUgcGFnZSBz
aXplIGNvdWxkIHJlbWFpbiBhdCA0MDk2IGJ5dGVzLiAgSSB1bmRlcnN0YW5kCnRoaXMgaXMgZGlm
ZmljdWx0IGJlY2F1c2Ugb25jZSB5b3UgaGF2ZSBtdWx0aXBsZSBwYWdlIHNpemVzLCB0aGVyZSBh
cmUKY29uY2VybnMgcmVnYXJkaW5nIGZyYWdtZW50YXRpb24uCgpUaGFua3MsCkZsb3JpYW4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
