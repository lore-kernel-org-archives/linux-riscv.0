Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4B1C636CD
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 13:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37tsnFiw1/Flko0bwoW8SUtHG1BXCNDzEiRCd9hFN5c=; b=JjGkxvRnWlNwzv
	j+am4bPsGdPQVqSszlOpNPiMAnWQOdFMozVAWLwraZ6+MjYmNgz50nfNdbSZ1U3cru1PLAh2D8V/J
	zp/MWmwDN3P/3bntHLarqTDS568/nSI/h/lXK7xxjd9rxOOVbcqK6z6IXqJ4D0QGoRLW3fLPbfbnx
	msyvLrJrOpp24ALQy8l0DE3631mPLmKwjj1EYujHO7kcsTaJyXyCQ7iV+M983zKZslL840edoE95r
	5hD2iQ3l1wM/iIz+aQA2+W9VmAFMPwoHYuHjbvi7MZEj9rcI3TKNfmiHdd3RT3qEr1aRywzTlZyfu
	PFNCVxqr+tYf7ouk5tnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDB0-00C3y0-4w; Wed, 01 Feb 2023 13:29:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDAx-00C3wd-OW
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 13:29:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6842AB82188;
	Wed,  1 Feb 2023 13:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B988EC433EF;
	Wed,  1 Feb 2023 13:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675258160;
	bh=JAkFMc2dp9aZIGy+X9W+0UNRWy7+puxfrgWYGUKvqE4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WKU6JBJGVX831/YeO/vIYsFoeoansxJf7b8w4H9k88wixsW4a+ZvxfWZfEUPVbNhr
	 OKHeNYRnuU3FdrkiRLgpSFU0y2bw89SGaykTQdwiEl1bako/8BQEmSrEuM8zwSua9G
	 1RzCzjSQgugchSWQZ9xFwvXYCwpd+7HQK6UhCGYxrdNmcBh/YYsYxaR/vqwxsSmxBT
	 5d+6am272vW6rpWOr6bBMi++KUCfwOrN7sMrQ9/xHYPhjtjcDeDEnV2f2+SDuaqc9p
	 0MccYrRNUFLXxlltVf/1bzp/LHIRfPwU8fteA3wPgDnhfi6fgLRxsQFhvvDTKTSFNu
	 qJpHQlaYwirZQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chen Guokai <chenguokai17@mails.ucas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 liaochang1@huawei.com, Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Subject: Re: [PATCH v6 00/13] Add OPTPROBES feature on RISCV
In-Reply-To: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
References: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
Date: Wed, 01 Feb 2023 14:29:17 +0100
Message-ID: <87zg9xtsya.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_052924_107250_F8B796D2 
X-CRM114-Status: GOOD (  21.54  )
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

Q2hlbiBHdW9rYWkgPGNoZW5ndW9rYWkxN0BtYWlscy51Y2FzLmFjLmNuPiB3cml0ZXM6Cgo+IEFk
ZCBqdW1wIG9wdGltaXphdGlvbiBzdXBwb3J0IGZvciBSSVNDLVYuCj4KPiBSZXBsYWNlcyBlYnJl
YWsgaW5zdHJ1Y3Rpb25zIHVzZWQgYnkgbm9ybWFsIGtwcm9iZXMgd2l0aCBhbiBBVUlQQy9KQUxS
Cj4gaW5zdHJ1Y3Rpb24gcGFpciB3aXRoIHRoZSBhaW0gb2Ygc3VwcHJlc3NpbmcgdGhlIHByb2Jl
LWhpdCBvdmVyaGVhZC4KPgo+IEFsbCBrbm93biBvcHRwcm9iZS1jYXBhYmxlIFJJU0MgYXJjaGl0
ZWN0dXJlcyBoYXZlIGJlZW4gdXNpbmcgYSBzaW5nbGUKPiBqdW1wIG9yIGJyYW5jaCBpbnN0cnVj
dGlvbnMgd2hpbGUgdGhpcyBwYXRjaCBjaG9vc2VzIG5vdC4gUklTQy1WIGhhcyBhCj4gcXVpdGUg
bGltaXRlZCBqdW1wIHJhbmdlICg0S0Igb3IgMk1CKSBmb3IgYm90aCBpdHMgYnJhbmNoIGFuZCBq
dW1wCj4gaW5zdHJ1Y3Rpb25zLCB3aGljaCBwcmV2ZW50IG9wdGltaXphdGlvbnMgZnJvbSBzdXBw
b3J0aW5nIHByb2JlcyB0aGF0Cj4gc3ByZWFkIGFsbCBvdmVyIHRoZSBrZXJuZWwuCj4KPiBBVUlQ
Qy9KQUxSIGluc3RydWN0aW9uIHBhaXIgaXMgaW50cm9kdWNlZCB3aXRoIGEgbXVjaCB3aWRlciBq
dW1wIHJhbmdlCj4gKDRHQiksIHdoZXJlIEFVSVBDIGxvYWRzIHRoZSB1cHBlciAxMiBiaXRzIHRv
IGEgZnJlZSByZWdpc3RlciBhbmQgSkFMUgo+IERlYWNvbmFwcGVuZHMgdGhlIGxvd2VyIDIwIGJp
dHMgdG8gZm9ybSBhIDMyIGJpdHMgaW1tZWRpYXRlLiBOb3RlIHRoYXQKPiByZXR1cm5zIGZyb20g
cHJvYmUgaGFuZGxlciByZXF1aXJlIGFub3RoZXIgZnJlZSByZWdpc3Rlci4gQXMga3Byb2Jlcwo+
IGNhbiBhcHBlYXIgYWxtb3N0IGFueXdoZXJlIGluc2lkZSB0aGUga2VybmVsLCB0aGUgZnJlZSBy
ZWdpc3RlciBzaG91bGQKPiBiZSBmb3VuZCBnZW5lcmljYWxseSwgbm90IGRlcGVuZGluZyBvbiBj
YWxsaW5nIGNvbnZlbnRpb24gb3IgYW55IG90aGVyCj4gcmVndWxhdGlvbnMuCj4KPiBUaGUgYWxn
b3JpdGhtIGZvciBmaW5kaW5nIHRoZSBmcmVlIHJlZ2lzdGVyIGlzIGluc3BpcmVkIGJ5IHRoZSBy
ZWdpc3Rlcgo+IHJlbmFtaW5nIGluIG1vZGVybiBwcm9jZXNzb3JzLiBGcm9tIHRoZSBwZXJzcGVj
dGl2ZSBvZiByZWdpc3Rlcgo+IHJlbmFtaW5nLCBhIHJlZ2lzdGVyIGNvdWxkIGJlIHJlcHJlc2Vu
dGVkIGFzIHR3byBkaWZmZXJlbnQgcmVnaXN0ZXJzIGlmCj4gdHdvIG5laWdoYm9yIGluc3RydWN0
aW9ucyBib3RoIHdyaXRlIHRvIGl0IGJ1dCBubyBvbmUgZXZlciByZWFkcyBpdC4KPiBFeHRlbmRp
bmcgdGhpcyBmYWN0LCBhIHJlZ2lzdGVyIGlzIGNvbnNpZGVyZWQgdG8gYmUgZnJlZSBpZiB0aGVy
ZSBpcyBubwo+IHJlYWQgYmVmb3JlIGl0cyBuZXh0IHdyaXRlIGluIHRoZSBleGVjdXRpb24gZmxv
dy4gV2UgYXJlIGZyZWUgdG8gY2hhbmdlCj4gaXRzIHZhbHVlIHdpdGhvdXQgaW50ZXJmZXJpbmcg
bm9ybWFsIGV4ZWN1dGlvbi4KPgo+IFN0YXRpYyBhbmFseXNpcyBzaG93cyB0aGF0IDUxJSBvZiBp
bnN0cnVjdGlvbnMgb2YgdGhlIGtlcm5lbCAoZGVmYXVsdAo+IGNvbmZpZykgaXMgY2FwYWJsZSBv
ZiBiZWluZyByZXBsYWNlZCBpLmUuIG9uZSBmcmVlIHJlZ2lzdGVyIGNhbiBiZSBmb3VuZAo+IGF0
IGJvdGggdGhlIHN0YXJ0IGFuZCBlbmQgb2YgcmVwbGFjZWQgaW5zdHJ1Y3Rpb24gcGFpcnMgd2hp
bGUgdGhlCj4gcmVwbGFjZWQgaW5zdHJ1Y3Rpb25zIGNhbiBiZSBkaXJlY3RseSBleGVjdXRlZC4g
V2UgYWxzbyBtYWRlIGFuCj4gZWZmaWNpZW5jeSB0ZXN0IG9uIEdlbSA1IFJJU0NWIHdoaWNoIHNo
b3dzIGEgbW9yZSB0aGFuIDV4IHNwZWVkdXAgb24gCj4gYnJlYWtwb2ludC1iYXNlZCBpbXBsZW1l
bnRhdGlvbi4KPgo+IENvbnRyaWJ1dGlvbjoKPiBDaGVuIEd1b2thaSBpbnZlbnRzIHRoZSBhbGdv
cml0aG0gZm9yIHNlYXJjaGluZyBmcmVlIHJlZ2lzdGVyLCBldmFsdWF0ZQo+IHRoZSByYXRpbyBv
ZiBvcHRpbWl6YXRpb24sIHRoZSBiYXNpYyBmdW5jdGlvbiBzdXBwb3J0IFJWSSBrZXJuZWwgYmlu
YXJ5Lgo+IExpYW8gQ2hhbmcgYWRkcyB0aGUgc3VwcG9ydCBmb3IgaHlicmlkIFJWSSBhbmQgUlZD
IGtlcm5lbCBiaW5hcnksIGZpeAo+IHNvbWUgYnVncyB3aXRoIGRpZmZlcmVudCBrZXJuZWwgY29u
ZmlndXJlLCByZWZhY3RvciBvdXQgdGhlIGVudGlyZQo+IGZlYXR1cmUgaW50byBzb21lIGluZGl2
aWR1YWwgcGF0Y2hlcy4KClRoYW5rIHlvdSBmb3IgY29udGludWluZyB0byB3b3JrIG9uIHRoaXMg
c2VyaWVzISBJIHRvb2sgaXQgZm9yIGEgc3BpbiwKYW5kIGl0IHdvcmtlZCBuaWNlbHkgb24gbXkg
UUVNVSBzZXR1cC4KCkl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBpdCBydW4gb24gc29tZSAqYWN0
dWFsKiBoYXJkd2FyZSBhcyB3ZWxsLiA6LSkKCkkgaGF2ZSBzb21lIGFkZGl0aW9uYWwgY29tbWVu
dHMgb24gdGhlIHNlcmllcywgYnV0IEknbGwgYWRkIHRob3NlIHRvIHRoZQpyZWxldmFudCBwYXRj
aC4gSXQncyBtb3N0bHkgbWlub3IgdGhpbmdzIQoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
