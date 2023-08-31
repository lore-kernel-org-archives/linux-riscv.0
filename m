Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE06C83F29
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 07:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+41O5D04rN0wc3g8KOdye4kuIGYXpl5xxDBPN0Gk26s=; b=TNjYiHvWu8HDQ2
	IjwZe5Bc6jz+CDY6PgxJzsjuhMNNlnKiDG4/YEnoN4Ie+BN6+CSq6rX3oIvgrxeIN9SF1PDQ/x9O/
	M4kNuBg1Td+7ajfd2vAKLpif/gcHt/+k/pDIWTVCiBhonWlEOvFenIpAhYjfFlRC1tbF5gaje4HCQ
	EnpsVrnx08rNs3wIkusLR1zlQqhW3R4fRfZAXf8be6zEwZSrYQ29ne4z0nikh8dXDzCtSV0FACMgs
	MrUYYFELBPZPu4bxooUGJQMNA1xr9k8Vpb/6U4uuuOcIljWkcM7B0Wna4x7LYbEiJ5fIrnPQDo3hQ
	weTdeB3dZifVLqezPaDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbcGN-00EpL5-1Q;
	Thu, 31 Aug 2023 07:38:47 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbcGK-00EpKL-0q
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 07:38:45 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 67BD11F461;
	Thu, 31 Aug 2023 07:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1693467519; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ebgBG0RLwLmIMQg+1oRZIYWqmTbT4BUmYz+e+XMMGzs=;
	b=0QbxmE/kzjx494L3zHc49U3LYfBdeDSeV19g9gRQsdipWBT8+mBNZLgnXwdStzM95Kp5WR
	3J2wROppfuMqCLzGFvfUWEFjoOE42jKkqy3Ntm4hwOQ5KgWBJ2bVzDHzIbstSAQxllT+ei
	l5R/VQf7lD7tQ825RxNm5z3DOVTo4h8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693467519;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ebgBG0RLwLmIMQg+1oRZIYWqmTbT4BUmYz+e+XMMGzs=;
	b=RJrcdxvJk6qcTzk9cik1uiQ2CjFIdbMpOuFL/XPRcr41qjbjuMWH+h4QuS0KeEZHVsz2M9
	6TBzWXoAua58WOCg==
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by relay2.suse.de (Postfix) with ESMTP id EAD3C2C142;
	Thu, 31 Aug 2023 07:38:38 +0000 (UTC)
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id DB03A4A0399; Thu, 31 Aug 2023 09:38:38 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: paul.walmsley@sifive.com,  palmer@dabbelt.com,  aou@eecs.berkeley.edu,
  mick@ics.forth.gr,  alex@ghiti.fr,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: kexec: Cleanup riscv_kexec_relocate
In-Reply-To: <FBD24A55B409E4DF+71a45adc-2e20-ea3c-a8ea-7341862991c6@tinylab.org>
	(Song Shuai's message of "Thu, 31 Aug 2023 14:55:54 +0800")
References: <20230830063435.1105726-1-songshuaishuai@tinylab.org>
	<mvmmsy956xa.fsf@suse.de>
	<FBD24A55B409E4DF+71a45adc-2e20-ea3c-a8ea-7341862991c6@tinylab.org>
X-Yow: Gibble, Gobble, we ACCEPT YOU ---
Date: Thu, 31 Aug 2023 09:38:38 +0200
Message-ID: <mvmy1hr4q69.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_003844_463674_ADD379ED 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
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

T24gQXVnIDMxIDIwMjMsIFNvbmcgU2h1YWkgd3JvdGU6Cgo+IEhpLCBBbmRyZWFzOgo+Cj4g5Zyo
IDIwMjMvOC8zMCAxNToyNCwgQW5kcmVhcyBTY2h3YWIg5YaZ6YGTOgo+PiBPbiBBdWcgMzAgMjAy
MywgU29uZyBTaHVhaSB3cm90ZToKPj4gCj4+PiBAQCAtNTIsMjEgKzQyLDI3IEBAIFNZTV9DT0RF
X1NUQVJUKHJpc2N2X2tleGVjX3JlbG9jYXRlKQo+Pj4gICAJICogdGhlIHN0YXJ0IG9mIHRoZSBs
b29wIGJlbG93IHNvIHRoYXQgd2UganVtcCB0aGVyZSBpbgo+Pj4gICAJICogYW55IGNhc2UuCj4+
PiAgIAkgKi8KPj4+IC0JbGEJczgsIDFmCj4+PiAtCXN1YglzOCwgczgsIHM3Cj4+PiAtCWNzcncJ
Q1NSX1NUVkVDLCBzOAo+Pj4gKwlsYQlzNiwgMWYKPj4+ICsJc3ViCXM2LCBzNiwgczQKPj4+ICsJ
Y3NydwlDU1JfU1RWRUMsIHM2Cj4+PiArCj4+PiArCS8qCj4+PiArCSAqIFdpdGggQy1leHRlbnNp
b24sIGhlcmUgd2UgZ2V0IDQyIEJ5dGVzIGFuZCB0aGUgbmV4dAo+Pj4gKwkgKiAuYWxpZ24gZGly
ZWN0aXZlIHdvdWxkIHBhZCB6ZXJvcyBoZXJlIHVwIHRvIDQ0IEJ5dGVzLgo+Pj4gKwkgKiBTbyBt
YW51YWxseSBwdXQgYSBub3AgaGVyZSB0byBhdm9pZCB6ZXJvcyBwYWRkaW5nLgo+Pj4gKwkqLwo+
Pj4gKwlub3AKPj4+ICAgICAJLyogUHJvY2VzcyBlbnRyaWVzIGluIGEgbG9vcCAqLwo+Pj4gICAu
YWxpZ24gMgo+PiBXaGlsZSB5b3UgYXJlIGF0IGl0LCBJJ2Qgc3VnZ2VzdCBiZWluZyBleHBsaWNp
dCBhYm91dCAucGFsaWduCj4+IHZzLiAuYmFsaWduLgo+PiAKPiBIb3cgYWJvdXQgdGhpcyBjb21t
ZW10OgoKTXkgc3VnZ2VzdGlvbiBpcyB0byBjaGFuZ2UgLmFsaWduIDIgaW4gdGhlIGxhc3QgbGlu
ZSB0byAucGFsaWduIDIgYXMKcGFydCBvZiB0aGUgY2xlYW51cC4gIFRoZSBtZWFuaW5nIG9mIC5h
bGlnbiBpcyB0YXJnZXQgZGVwZW5kZW50LCBhbmQKc29tZW9uZSBub3QgZmFtaWxpYXIgd2l0aCBS
SVNDLVYgbWF5IG1pc2ludGVycHJldCBpdC4KCi0tIApBbmRyZWFzIFNjaHdhYiwgU1VTRSBMYWJz
LCBzY2h3YWJAc3VzZS5kZQpHUEcgS2V5IGZpbmdlcnByaW50ID0gMDE5NiBCQUQ4IDFDRTkgMTk3
MCBGNEJFICAxNzQ4IEU0RDQgODhFMyAwRUVBIEI5RDcKIkFuZCBub3cgZm9yIHNvbWV0aGluZyBj
b21wbGV0ZWx5IGRpZmZlcmVudC4iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
