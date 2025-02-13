Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C0AC021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 14:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NbJeYV1tHRvNKHI0INO8TCKMj+SJ2vFtFiLu6Dxk3RY=; b=VNFDeiD7yU3TAc
	JoTh1pyQFF2UF88NMQ++zPl99e5ILj6XfxrQgwBSNWGyl6bBqY7UaefmcTU3uCBtW/EoyVksNzv3y
	YfhsCbWBC3JKhYFczdDL2sCbG/XCYZKFvm8qZulv20XP/nD7aH6Nghyma7df6XSZURvMV7xGy9Nop
	GWORGI8gXNu3tJV6VuDJeExGIZ+jugVqYITZ68kUAQd+2MLFSoZ2EvS6hOKJlnBfEFUHnEonBIsYB
	8zjSpLnr7Lo+f320fRqSo/Fmv6EClO6Nd6qZJY9RsCKQLwAvK0iecnSplR2mnOzoLQvOhUO17X8kg
	2+dOI0q3jWZar+DRoQxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaIr-0000000BM0f-2g1c;
	Thu, 13 Feb 2025 14:34:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tia4T-0000000BISC-0VAw
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 14:20:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96FB05C544F;
	Thu, 13 Feb 2025 14:19:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C572DC4CED1;
	Thu, 13 Feb 2025 14:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739456403;
	bh=V8+Clgqse8ENFo8knptwLB4lPlpVnfFwyIe+UDRqwXw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mRjV4tzVPubzdRqCe54H2nXVBR22GW9VACNGUinJFtS7vBw14jHeBcBvEMqpcgtZ9
	 oVxe5eJszmDOazva6G8ixns2nApVyzHxyF0GLDX0IKnmvVegBTWy6qe/WHI4M0w28e
	 lfDVyxv5bDRqFeHhrGull3cqXE4HiOPDk1M8k+c3FnRPYqU3Too3K1VCrAkULkjaYF
	 4yTk7dejENnrUEG1Kk4UpT4o80C0Mz5BP1KHfhomiCGR2x4y8LeRcnHp3wKjUsmHkS
	 rJH6h0fyRHyINX5hvY91eujX10hN800YsvMtTC9LkhwFd2fDYjOcqF8aRWiXXxWZZ9
	 FNeZISWJVOnTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 35E77380CEEF;
	Thu, 13 Feb 2025 14:20:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [RESEND PATCH v2] riscv: cacheinfo: Use of_property_present() for
 non-boolean properties
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173945643302.1243861.3231883828583591260.git-patchwork-notify@kernel.org>
Date: Thu, 13 Feb 2025 14:20:33 +0000
References: <20241231161400.214307-1-robh@kernel.org>
In-Reply-To: <20241231161400.214307-1-robh@kernel.org>
To: Rob Herring (Arm) <robh@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, cleger@rivosinc.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_062005_200370_AF98B3FE 
X-CRM114-Status: UNSURE (   6.62  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZml4ZXMp
CmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIFR1ZSwgMzEgRGVj
IDIwMjQgMTA6MTM6NTkgLTA2MDAgeW91IHdyb3RlOgo+IFRoZSB1c2Ugb2Ygb2ZfcHJvcGVydHlf
cmVhZF9ib29sKCkgZm9yIG5vbi1ib29sZWFuIHByb3BlcnRpZXMgaXMKPiBkZXByZWNhdGVkIGlu
IGZhdm9yIG9mIG9mX3Byb3BlcnR5X3ByZXNlbnQoKSB3aGVuIHRlc3RpbmcgZm9yIHByb3BlcnR5
Cj4gcHJlc2VuY2UuCj4gCj4gUmV2aWV3ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJu
ZWwub3JnPgo+IAo+IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSBb
UkVTRU5ELHYyXSByaXNjdjogY2FjaGVpbmZvOiBVc2Ugb2ZfcHJvcGVydHlfcHJlc2VudCgpIGZv
ciBub24tYm9vbGVhbiBwcm9wZXJ0aWVzCiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2
L2MvYjk1MjRhNzM3MjVkCgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKLS0gCkRlZXQtZG9v
dC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0Y2h3b3Jr
L3B3Ym90Lmh0bWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
