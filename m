Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446CCC3600B
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 03:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nyzaZwSou3ru+p11yivNmnLIp6FElQpGr9Tas3J6sZ4=; b=1LyWSIUVyYcil+
	WEXu7kQgfW4Otas+aCb+2ZcGS/4K1+LuaMTqSqQhthqGxGUbirAFPbcVdmjnSqLOKMK4FLn6IpwYU
	SXYvfd+N2K8MJsmL4WsgRBNSCHUARFo3oKI6hgz62EKLHz1eMr5xdbFJnR5l+ZaPi+EFR0YrcE7Ex
	KszIekgxtE0CUg6kJHhEZe6yhWqiW+pkxVKONb1/h9zC4+L576eD+iJ/AVNbNQrOP3MR216r2jWda
	7Rjv0BQQPQskPpqbPaid5XnNDQQxt0I/GHhnVv0m/GZMLJhb1fZRe2ZsaZ4Tvg8d0CnW7TliuQiqu
	KT83YdZxcM+xQxKHHevA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqh-0000000A45L-1Knm;
	Thu, 27 Mar 2025 03:24:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqc-0000000A41X-2rrZ
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:24:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 008A45C6B40;
	Thu, 27 Mar 2025 03:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7346C4AF09;
	Thu, 27 Mar 2025 03:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045841;
	bh=Ws44F1JoDlIWWfehsx7arSbzUCnOt7suxWRpcnXTOTM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=d47S7G2MgUB3TUwgjQGogiSCSvhHSEG3pOlUqIAnlVYfMVrIMmoLfn6CmPInU66i2
	 vJ+uPY8H/FGx+T43GDkyrVb/HXOTMG/+XlbDhXETDtTNVVHnl355TXzpKdZczDyhhJ
	 aHR6IKgvgddwpjEL0Q0Gr9Cl/n7/SNgnd8GEHkPrC31PWoznO41x5IuOoOv/wlJwgA
	 Cm07gCrWKPj4RgWK1O13ecjS8kmFxzrZBlOfvOGP89aThKZ0I2dS0jRmEQ1zTyZhQA
	 7c7RQBkoLCeDtOdXXg75mF0XKdbTm/blnS24qsJI7llhKromsSiItpX5iGf2lIyL/v
	 F5JjP4kIO1OcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33FF1380AAFD;
	Thu, 27 Mar 2025 03:24:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/3] riscv: Add bfloat16 instruction support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304587781.1549280.17277808152876197417.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:37 +0000
References: <20250213003849.147358-1-inochiama@gmail.com>
In-Reply-To: <20250213003849.147358-1-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, cleger@rivosinc.com,
 charlie@rivosinc.com, evan@rivosinc.com, ajones@ventanamicro.com,
 jesse@rivosinc.com, andybnac@gmail.com, alexghiti@rivosinc.com,
 yongxuan.wang@sifive.com, peterlin@andestech.com, samuel.holland@sifive.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, dlan@gentoo.org, looong.bin@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_202402_768401_9CDD2FFA 
X-CRM114-Status: UNSURE (   8.08  )
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byByaXNjdi9saW51eC5naXQgKGZvci1u
ZXh0KQpieSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+OgoKT24gVGh1
LCAxMyBGZWIgMjAyNSAwODozODo0NCArMDgwMCB5b3Ugd3JvdGU6Cj4gQWRkIGRlc2NyaXB0aW9u
IGZvciB0aGUgQkZsb2F0MTYgcHJlY2lzaW9uIEZsb2F0aW5nLVBvaW50IElTQSBleHRlbnNpb24s
Cj4gKFpmYmZtaW4sIFp2ZmJmbWluLCBadmZiZndtYSkuIHdoaWNoIHdhcyByYXRpZmllZCBpbiBj
b21taXQgNGRjMjNkNjIKPiAoIkFkZGVkIENoYXB0ZXIgdGl0bGUgdG8gQkYxNiIpIG9mIHRoZSBy
aXNjdi1pc2EtbWFudWFsLgo+IAo+IENoYW5nZWQgZnJvbSB2MzoKPiAxLiByZWJhc2UgZm9yIHY2
LjE0LXJjMQo+IDIuIHBhdGNoMjogYWRkIHZhbGlkYXRlIGZvciB6ZmJmbWluLCB6dmZiZm1pbiwg
enZmYmZ3bWEKPiAzLiBwYXRjaDI6IGFwcGx5IENsw6ltZW50J3MgdGFnCj4gCj4gWy4uLl0KCkhl
cmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKICAtIFt2NCwxLzNdIGR0LWJpbmRpbmdzOiBy
aXNjdjogYWRkIGJmbG9hdDE2IElTQSBleHRlbnNpb24gZGVzY3JpcHRpb24KICAgIGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy8zNWJjMTg4MzczM2MKICAtIFt2NCwyLzNdIHJpc2N2OiBh
ZGQgSVNBIGV4dGVuc2lvbiBwYXJzaW5nIGZvciBiZmxvYXQxNiBJU0EgZXh0ZW5zaW9uCiAgICBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvZTE4NmMyOGRkYTExCiAgLSBbdjQsMy8zXSBy
aXNjdjogaHdwcm9iZTogZXhwb3J0IGJmbG9hdDE2IElTQSBleHRlbnNpb24KICAgIGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy9hNDg2M2UwMDJjZjAKCllvdSBhcmUgYXdlc29tZSwgdGhh
bmsgeW91IQotLSAKRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLmRvY3Mu
a2VybmVsLm9yZy9wYXRjaHdvcmsvcHdib3QuaHRtbAoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
