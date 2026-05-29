Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7DCCD6E49
	for <linux-riscv@archiver.kernel.org>; Fri, 29 May 2026 17:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1E34omdCGq6LIbu2PJI8D2cv5Wm5dgdtWVV4jQY/s0=; b=QKAhdoEy0PWQeBnvWNL935yv9m
	BEN9e8oMMhZa0Rg+uh2CUCF86T7JiaD9yCQTwGHVVwlsfw1a7+Zs544z79FcDLe37EZpx/9Ig1Oa2
	noMZcsKbY1q06yOAxroh9/YitSL0mMrjBDHZkO5RNeBWVDoigEeimwXY3NjQxpOvkKhd1g38eZEfi
	ODJ/ZhyejHe6Sd/EIqx6EVIAesrhMFJbDBszDtXkkWKeCeD6Xm7cjhiG4OM4pLzwApJAbe75jayIO
	cxNRyZqdO0H6ewoJslwZsUNkoRPqsRNLY8LQChEj17/E80fpqQugZSL3VZzEqflEcV4S0LflyaDEN
	RKPB8VgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0tP-00000007zRW-3IF8;
	Fri, 29 May 2026 17:21:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0tN-00000007zQf-0Q6Q
	for linux-riscv@lists.infradead.org;
	Fri, 29 May 2026 17:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780075262;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y8xWKvxO5SSqF5Z76veqmFt7SrbWGs9L9IueFeKNqAg=;
	b=YSj3ajUlcu2YOUqOK2BLJ9NLX9Ocn/R7J/T3nL5lKI1OGeg74laAEgMFIozQUKVB/GZSap
	27LeTLyAbkX0hdXPGP9ii1M1zRRwgniKkNLRU+cVLvdBTxf0IjT40lq5nyGD3Uwa4HVMXA
	QxtXZWTDKN0EMiQ0dNb512xAc9Vx1EY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-125-xazLv_AyOZGN8s7UERz5MA-1; Fri,
 29 May 2026 13:20:56 -0400
X-MC-Unique: xazLv_AyOZGN8s7UERz5MA-1
X-Mimecast-MFC-AGG-ID: xazLv_AyOZGN8s7UERz5MA_1780075254
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 38BE118005B2;
	Fri, 29 May 2026 17:20:53 +0000 (UTC)
Received: from [10.22.65.177] (unknown [10.22.65.177])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C1DA61800465;
	Fri, 29 May 2026 17:20:48 +0000 (UTC)
Message-ID: <05290c17-d55f-4e60-a77e-c36c3f14a89a@redhat.com>
Date: Fri, 29 May 2026 13:20:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cmirabil@redhat.com
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, haxel@fzi.de,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 namcao@linutronix.de, palmer@dabbelt.com, pjw@kernel.org,
 vitaly.wool@konsulko.com, Kunwu Chan <kunwu.chan@linux.dev>,
 Zhouyi Zhou zhou <zhouyi@gmail.com>, igor.b@beldev.am,
 Jisheng Zhang <jszhang@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Frederik Haxel <haxel@fzi.de>, charlie@rivosinc.com
References: <CABe3_aH6jYyoC=Jx91qATP2kOoY42NUtesyZpGbWGoQTw75OAA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Remove support for XIP kernel
From: Jesse Taube-Perrotta <jtaubepe@redhat.com>
In-Reply-To: <CABe3_aH6jYyoC=Jx91qATP2kOoY42NUtesyZpGbWGoQTw75OAA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: DHK_bjrxKrUMMPfHDH7AIFGwPLFpdoKF_wRTJwNSiqc_1780075254
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_102105_207222_2EF84D73 
X-CRM114-Status: GOOD (  18.91  )
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
Reply-To: CABe3_aH6jYyoC=Jx91qATP2kOoY42NUtesyZpGbWGoQTw75OAA@mail.gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

ID4gSXQgaXMgdHJ1ZSwgdGhvdWdoIEkgd291bGQgbGlrZSBpdCB0byBjb250aW51ZSB0byBiZSBw
b3NzaWJsZQogPiB1cHN0cmVhbS4gV2hlbiBJIHdyb3RlIHRoaXMgSSBkaWRuJ3QgcmVhbGl6ZSB0
aGF0IFhJUCBpcyBjdXJyZW50bHkgbm90CiA+IGNvbXBhdGlibGUgd2l0aCBNLW1vZGUgbGludXgu
IEkgdGhpbmsgdGhhdCB3b3VsZCBiZSBhIHJlYWxseSB1c2VmdWwKID4gY29tYmluYXRpb24gdGhh
dCBtaWdodCBhY3R1YWxseSBtYWtlIFhJUCBzb21ldGhpbmcgdGhhdCBwZW9wbGUKID4gc2UvdGVz
dCBzaW5jZSBib3RoIG0tbW9kZSAvIG5vbW11IGxpbnV4IGFuZCB4aXAgYXJlIG1vcmUgY29tbW9u
IGluCiA+IGVtYmVkZGVkIHVzZWNhc2VzLgoKSUlSQyB0aGVyZSB3YXMgYSBwYXRjaCB0aGF0IG1h
ZGUgWElQIHdvcmsgb24gTS1tb2RlIG5vLW1tdSBsaW51eCBmb3IgCm9ubHkgNjRiaXQuCgpJIHVu
Zm9ydHVuYXRlbHkgbWlzc2VkIHRoaXMgZW1haWwsIGkgc2hvdWxkIGNoZWNrIHRoZSBtYWlsaW5n
IGxpc3QgCmZvbGRlciBtb3JlLAoKYnV0IEkgYW0gb25lIG9mIHRoZSBmZXcgcGVvcGxlIHRoYXQg
aXMgaW50ZXJlc3RlZCBpbiBYSVAgcmlzY3YgbGludXgsCgpxdWl0ZSBhIGZldyBvZiBteSBwZXJz
b25hbCBwcm9qZWN0cyB1c2UgaXQuIE15IGludGVyZXN0IGlzIG1vc3RseSBpbiB0aGUgCm5vLW1t
dSBydjMyIHVzZSBjYXNlLgoKSSdtIGN1cmlvdXMgaWYgcmUtYWRkaW5nIGJhY2sgWElQLMKgIG9y
IGkgZ3Vlc3MganVzdCBhZGRpbmcsCgpYSVAgdG8gbm8tbW11IHJ2MzIgd291bGQgYmUgYWNjZXB0
YWJsZSBhcyBJIGhhdmUgc29tZSBwYXRjaGVzCgp0aGF0IGhhdmUgYmVlbiBpbiB0aGUgd29ya3Mg
c2Vuc2UgMjAyNCBMTUZBTy4KCgpJIG5vdyBoYXZlIGEgam9iIGF0IHJlZGhhdCBzbyBtYWludGFp
bmluZyBYSVAgcmlzYy12IGlzIGEgZ2VudWluZSAKcG9zc2liaWxpdHkgZXNwZWNpYWxseSBhcwoK
SSBoYXZlIHF1aXRlIGEgYml0IG9mIGV4cGVyaWVuY2Ugd2l0aCBpdC4gSXJvbmljYWxseSBjaGFy
bGllIHNpdHMgbmVhciAKbWUgaW4gdGhlIG9mZmljZS4gSGkgY2hhcmxpZSEKCiA+IEkgd2FzIGhv
cGluZyB0byBkZXZlbG9wIHBhdGNoZXMgZm9yIHRoYXQgZnVuY3Rpb25hbGl0eSB0b28gYW5kIHBy
b3ZlCiA+IHRoYXQgaXQgd29ya3Mgb24gcmVhbCBoYXJkd2FyZS4gQnV0IGluIG9yZGVyIHRvIGRv
IHRoYXQgSSB3b3VsZCBuZWVkCiA+IHRvIGZpZ3VyZSBvdXQgbS1tb2RlIGxpbnV4IG9uIHVubGVh
c2hlZC9xZW11IHNpZml2ZV91IChhbG1vc3QKID4gY2VydGFpbmx5IHBvc3NpYmxlLCBidXQgSSBo
YXZlbid0IHJlYWxseSB0ZXN0ZWQgaXQpIGFuZCBhbHNvIFhJUCBsaW51eAogPiBvbiB1bmxlYXNl
ZC9zaWZpdmVfdSAod2hpY2ggYXMgSSBzYWlkIGlzIGNsb3NlLCBidXQgd2l0aCBhdCBsZWFzdCBv
bmUKID4gbW9yZSBpc3N1ZSkgYW5kIHRoZW4gY29tYmluZSB0aGVtIHNpbXVsdGFuZW91c2x5ICh1
bmNsZWFyIGhvdyBoYXJkCiA+IGxvbCkuCgpJIGFsc28gaGF2ZSBoYXJkd2FyZSBhbmQgYSBGUEdB
IHNvZnQtY29yZSBpIGNhbiB0ZXN0IHRoaXMgb24uCgpUTERSOiBJcyByZS1hZGRpbmcgWElQIHRv
IG5vLW1tdSBydjMyIGEgcG9zc2liaWxpdHkKClNvcnJ5IGlmIGkgbWVzc2VkIHVwIHRoZSByZXBs
eSBpIGp1c3Qgc2V0dXAgdGhpcyBlbWFpbCBjbGllbnQuCgpUaGFua3MsCkplc3NlIFRhdWJlCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
