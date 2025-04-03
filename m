Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A04C3601A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Apr 2025 16:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5f9qOrFj9yWpvjJv2raS3EVBy0q+iZl0nvUfUopj9bg=; b=E24JW/Zoq7B4IY
	B8EVRYoYl9t/2KjOYktTMY9TGYHfJbyeVUDnY7Toli/woz+H+qHpm5VviQqR2Mify7o2GOyRQrLU1
	SwFo2OI6/g2BQqrl0X3uEyjvjm4PeYRCzOtw9DmFstZB/YII/cWTfsnDrvt8M+BHxiXMNtQTCy4x/
	/yhJoOJ0E8y6kn5oU8+BUnnjXTQXnevdlZGF3QQAXIPsWuQCzZlZam8AmE3JgKmJK64Kg3fwexbDZ
	sbby9QVTAnpmSV1Gdl4DSrE/ASUQUyVKN/xOnVJ8Iyc2Py15r/ZTuu2IPoJbdmw/kCLpw3KHjzHmI
	bKP2aY+cAmfsHPu3u6uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0NIW-00000009LF8-3Gkl;
	Thu, 03 Apr 2025 16:20:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0NIT-00000009LA6-1vwr
	for linux-riscv@lists.infradead.org;
	Thu, 03 Apr 2025 16:20:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 645245C6B85;
	Thu,  3 Apr 2025 16:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087A1C4CEE7;
	Thu,  3 Apr 2025 16:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743697198;
	bh=CSJ5SE6jBnvnws9fZbbOZ4HpZ7P/EkbcQ+DcqR42YFo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dUBbar0Tiww/F+4dR+fMOaEyfKug7ijG7BPgDL0/LMHeKsh9oWcNwpJqVpu3Bo1ot
	 AAQih9NYaVyraxZ8fny1nqWZfkZAlspXpAK7EkX5o9g/eJbxFbDVelE9WV7F8iZzKg
	 L48ButIMqc/yTZdge4nR9irwlz8Wn8wehZIKBiu1T5V23JiMgmvGfgHzHsm28LyXPn
	 WSzX61mNRHMb1apsV9Ke/rGirUeQay15agHAVg5FhSoWh4AKjZi9P3EID5lFPr3s6b
	 1bfMgd2s90ey3ZSneRDjyDt00aDbcfP24IyEqEuLhX9LvpZZd+1qqKgRj/C1Hg2Oln
	 T5kIBYTcurylg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C71380664C;
	Thu,  3 Apr 2025 16:20:36 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH fixes] riscv/purgatory: 4B align purgatory_start
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174369723499.2563936.2453990084533442499.git-patchwork-notify@kernel.org>
Date: Thu, 03 Apr 2025 16:20:34 +0000
References: <20250328085313.1193815-1-bjorn@kernel.org>
In-Reply-To: <20250328085313.1193815-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alex@ghiti.fr, bjorn@rivosinc.com,
 cyrevolt@googlemail.com, lizhengyu3@huawei.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_092005_545070_414B866F 
X-CRM114-Status: GOOD (  10.45  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZm9yLW5l
eHQpCmJ5IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT46CgpPbiBGcmks
IDI4IE1hciAyMDI1IDA5OjUzOjExICswMTAwIHlvdSB3cm90ZToKPiBGcm9tOiBCasO2cm4gVMO2
cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gCj4gV2hlbiBhIGNyYXNoa2VybmVsIGlzIGxhdW5j
aGVkIG9uIFJJU0MtViwgdGhlIGVudHJ5IHRvIHB1cmdhdG9yeSBpcwo+IGRvbmUgYnkgdHJhcHBp
bmcgdmlhIHRoZSBzdHZlYyBDU1IuIEZyb20gcmlzY3Zfa2V4ZWNfbm9yZWxvY2F0ZSgpOgo+IAo+
ICAgfCAgLi4uCj4gICB8ICAvKgo+ICAgfCAgICogU3dpdGNoIHRvIHBoeXNpY2FsIGFkZHJlc3Np
bmcKPiAgIHwgICAqIFRoaXMgd2lsbCBhbHNvIHRyaWdnZXIgYSBqdW1wIHRvIENTUl9TVFZFQwo+
ICAgfCAgICogd2hpY2ggaW4gdGhpcyBjYXNlIGlzIHRoZSBhZGRyZXNzIG9mIHRoZSBuZXcKPiAg
IHwgICAqIGtlcm5lbC4KPiAgIHwgICAqLwo+ICAgfCAgY3NydyAgICBDU1JfU1RWRUMsIGEyCj4g
ICB8ICBjc3J3ICAgIENTUl9TQVRQLCB6ZXJvCj4gCj4gWy4uLl0KCkhlcmUgaXMgdGhlIHN1bW1h
cnkgd2l0aCBsaW5rczoKICAtIFtmaXhlc10gcmlzY3YvcHVyZ2F0b3J5OiA0QiBhbGlnbiBwdXJn
YXRvcnlfc3RhcnQKICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy8zZjcwMjMxNzFk
ZjQKCllvdSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQotLSAKRGVldC1kb290LWRvdCwgSSBhbSBh
IGJvdC4KaHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRjaHdvcmsvcHdib3QuaHRtbAoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
