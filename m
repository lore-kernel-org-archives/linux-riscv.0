Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9DCC83F2B
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 06:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HhJL79loMIH1R2fqdWG5s8+/HRVq/22544jxrjdamRk=; b=Q+wrJKMyGM9viM
	u0BOMzUqK4GRJRkk9cbuvsEmKtgf6gNGk9RPFZE3OcZOqAvGLEY/vQ8ugZRDhEOFSQLcgCPQTuBGT
	HFaMqFz0dVVCVshOyqnbf+RkIKy6t23zlKKmJ/3G0WQyeuzxRzdw3CS5EqOXcUO0pcpA5Mlcfawkr
	VX5Boafa8pjV4J7GY/dq6RKNezxs9qK8V4oWG+1lxOoime0jFWHaag1owDAoQgSO4gXpJWwG37+tZ
	Hng7cWXfS4HLEewRterMFmRqvofc2975SPIbBB6vkFfccuqvhmDoWl/cFKIARbiZw7nDUHcGOgAA3
	nSFqls7nnB9RShtHQyTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbbbs-00EmrP-32;
	Thu, 31 Aug 2023 06:56:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbbbr-00EmrG-0s
	for linux-riscv@bombadil.infradead.org;
	Thu, 31 Aug 2023 06:56:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=z1tSA5gWe6Wvo9lakx79B07K3B5l68QWUYXrrVmhLaw=; b=Q5Qao/rDMZiZKFFeW2MbqK4tUB
	w3XfSd0O8eO9PlD8cKUr3LS7TifhpNTd6y/QqICxcv3GCurvFsnOrMLKuVbiOEflWMD6tG9s5OjNn
	Lr9IESwrk8WZd14mTBzSVaBYqzGZ+nAlkOw84/Or+rgsc++yOZE2r5VbaG5tV88pxbFUXJ2C7Lf0S
	x+eVQLcUiFa0/YTo3vtfW0drzTdtOTLFT/CElRBjxabbwIaxGqj+VPMEYSMQaWD6tzrU2VochSRdR
	GVzr0xUvPbnWjzf9TzpleASnMnaW9WgOn0neaWT4FLE6cuYAGkodkwtg5RKeWgWBE34Sz8PHSWBfH
	FwwFTepg==;
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbbbg-00DIlV-1T
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 06:56:53 +0000
X-QQ-mid: bizesmtp79t1693464956tdecde1n
Received: from [10.4.6.71] ( [221.226.144.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 31 Aug 2023 14:55:54 +0800 (CST)
X-QQ-SSF: 00200000000000B0B000000A0000000
X-QQ-FEAT: lm7sZZPcOdZf/fpUyXb4FSBHuUW/npZsyyFuhkWADSPcz7fzI9mIBI2LDSPQ8
	7qiMc4NaSIsMG0o7EU8hmj/v31OANN92+WG8sXN7NW3tBpAxxhXl1it1Wz+QCqVfdgkc3ux
	zfVKFnhnw7+/Gf7uA7CFzPwU9vWxuIT66t7icyBwGLKxikmq+XGLxZqBsVWrKfyKLa8sUw5
	omj/MI+0sXtHn09hY/yvGUFKWdMa5aNUkAukfEiUIgyuns+7KJmFSSgpdb2JxqBI1Naa8nr
	hNaKF4eFwxc/KSyJV4HIZwhDJLmLLhJQAimyHd3+7ywHusMU1ZmXkUnZtD37dfLlOyWHh6s
	+Kt2oHCQVV27A1XomWSfkJ3XpaQbQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17274139541364043981
Message-ID: <FBD24A55B409E4DF+71a45adc-2e20-ea3c-a8ea-7341862991c6@tinylab.org>
Date: Thu, 31 Aug 2023 14:55:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] riscv: kexec: Cleanup riscv_kexec_relocate
To: Andreas Schwab <schwab@suse.de>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 mick@ics.forth.gr, alex@ghiti.fr, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230830063435.1105726-1-songshuaishuai@tinylab.org>
 <mvmmsy956xa.fsf@suse.de>
From: Song Shuai <songshuaishuai@tinylab.org>
In-Reply-To: <mvmmsy956xa.fsf@suse.de>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz4a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_075645_794558_543E0342 
X-CRM114-Status: UNSURE (   8.35  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGksIEFuZHJlYXM6CgrlnKggMjAyMy84LzMwIDE1OjI0LCBBbmRyZWFzIFNjaHdhYiDlhpnpgZM6
Cj4gT24gQXVnIDMwIDIwMjMsIFNvbmcgU2h1YWkgd3JvdGU6Cj4gCj4+IEBAIC01MiwyMSArNDIs
MjcgQEAgU1lNX0NPREVfU1RBUlQocmlzY3Zfa2V4ZWNfcmVsb2NhdGUpCj4+ICAgCSAqIHRoZSBz
dGFydCBvZiB0aGUgbG9vcCBiZWxvdyBzbyB0aGF0IHdlIGp1bXAgdGhlcmUgaW4KPj4gICAJICog
YW55IGNhc2UuCj4+ICAgCSAqLwo+PiAtCWxhCXM4LCAxZgo+PiAtCXN1YglzOCwgczgsIHM3Cj4+
IC0JY3NydwlDU1JfU1RWRUMsIHM4Cj4+ICsJbGEJczYsIDFmCj4+ICsJc3ViCXM2LCBzNiwgczQK
Pj4gKwljc3J3CUNTUl9TVFZFQywgczYKPj4gKwo+PiArCS8qCj4+ICsJICogV2l0aCBDLWV4dGVu
c2lvbiwgaGVyZSB3ZSBnZXQgNDIgQnl0ZXMgYW5kIHRoZSBuZXh0Cj4+ICsJICogLmFsaWduIGRp
cmVjdGl2ZSB3b3VsZCBwYWQgemVyb3MgaGVyZSB1cCB0byA0NCBCeXRlcy4KPj4gKwkgKiBTbyBt
YW51YWxseSBwdXQgYSBub3AgaGVyZSB0byBhdm9pZCB6ZXJvcyBwYWRkaW5nLgo+PiArCSovCj4+
ICsJbm9wCj4+ICAgCj4+ICAgCS8qIFByb2Nlc3MgZW50cmllcyBpbiBhIGxvb3AgKi8KPj4gICAu
YWxpZ24gMgo+IAo+IFdoaWxlIHlvdSBhcmUgYXQgaXQsIEknZCBzdWdnZXN0IGJlaW5nIGV4cGxp
Y2l0IGFib3V0IC5wYWxpZ24KPiB2cy4gLmJhbGlnbi4KPiAKSG93IGFib3V0IHRoaXMgY29tbWVt
dDoKCkR1ZSB0byB0aGUgc3R2ZWMuQkFTRSA0LWJ5dGUgYWxpZ25tZW50IGNvbnN0cmFpbnQsIHRo
ZSBmb2xsb3dpbmcgLmFsaWduCihhbGlhcyBvZiAucDJhbGlnbikgZGlyZWN0aXZlIHdpbGwgYWxp
Z24gdGhlIG5leHQgaW5zdHJ1Y3Rpb24gdG8KYSA0LWJ5dGUgYm91bmRhcnkgYnkgcGFkZGluZyB6
ZXJvcyBmb3IgdGhpcyAucm9kYXRhIHNlY3Rpb24uCgpXaXRoIEMtZXh0ZW5zaW9uLCBoZXJlIHdl
IGdldCA0MiBCeXRlcyBhbmQgd291bGQgYmUgcGFkZGVkIHdpdGggemVyb3MKdXAgdG8gNDQgQnl0
ZXMuIFNvIG1hbnVhbGx5IHB1dCBhIG5vcCBoZXJlIHRvIGF2b2lkIGl0LgoKLS0gClRoYW5rcwpT
b25nIFNodWFpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
