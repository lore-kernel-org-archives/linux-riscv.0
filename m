Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8C3C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 23:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ooy9alDMk+r9DfId0bzf0ifl9S4KkMHFrtabMiRwe1s=; b=SeiQBeP7UmqrJ9
	KxReDE6F+Hc8VFRtXgVgFKkp/GfprurH6qsEJKrMe0OgqsvoF78wcCP/4sGjmL9hTtTFnFg4ExHHL
	/pSQ2yf3WRQYTxIcEJoyI66rIMuv4/pBZC9nZkcu715X+Y//ZAO7C7ghohhEWms3iEthoiMe6bh3n
	LPceepTGHnKyBabZfhTEh0xF4Prdnu4AqzRx0+LZTwFLkzW6g1H/30K0KjurlUcQgmGbJQrBkEKnA
	k0IpP7Ur092JyNFMqKKNojrgFYLqmByTxR1NsmWhBFOdJS7b1le8G0K8Gbgqup8Td48Avcb8JnnG1
	z/gl8i9mE5M3snCtR9+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0851-0000000AXrp-43u8;
	Thu, 25 Apr 2024 23:00:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s084w-0000000AXpd-1og6
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 23:00:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B2E36CE1B34;
	Thu, 25 Apr 2024 23:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1B12C113CE;
	Thu, 25 Apr 2024 23:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714086030;
	bh=0IGnkNdF8z2leS3iHikpEP2XzTkGqpBJAJtmSy49Z6E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=igobG6I1CIejK3yulBtwPYYuUDOux+sA3KDMxUeoo77zreXe2fsH0rwgnilrFa2kv
	 rrVQ3QDCuLHqfxWwjpiQcbO5dOcRw+iEQs5KpJyMx6uCbwvcHLkGQSDtaxx8TxOePH
	 MVcpp6xyKCqlEDichpFaY6xlVq8ZLYxBcm3hgEVseGIwG2YqKcOs7LrWr18srHhmWu
	 mYsSStSFkag+e7aqShyVpn6N7xl5nE0bUgQi8+1u+ZqpZTARJOGZ0m/bxrlONDECIH
	 1P2lSqGo8G6PAasWGvInZlaM5MvHlXoOynirIFBtRjV7mHNQIr9dMerZlJa6+CWUAa
	 rl8zJrZklWfHg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BFD58CF21C3;
	Thu, 25 Apr 2024 23:00:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH riscv/fixes] riscv: hwprobe: fix invalid sign extension for
 RISCV_HWPROBE_EXT_ZVFHMIN
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171408603078.8761.11289399768939570785.git-patchwork-notify@kernel.org>
Date: Thu, 25 Apr 2024 23:00:30 +0000
References: <20240409143839.558784-1-cleger@rivosinc.com>
In-Reply-To: <20240409143839.558784-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_160034_698490_54C33F5C 
X-CRM114-Status: UNSURE (   7.80  )
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
CmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIFR1ZSwgIDkgQXBy
IDIwMjQgMTY6Mzg6MzcgKzAyMDAgeW91IHdyb3RlOgo+IFRoZSBjdXJyZW50IGRlZmluaXRpb24g
eWllbGRzIGEgbmVnYXRpdmUgMzJiaXRzIHNpZ25lZCB2YWx1ZSB3aGljaAo+IHJlc3VsdCBpbiBh
IG1hc2sgd2l0aCBpcyBvYnZpb3VzbHkgaW5jb3JyZWN0LiBSZXBsYWNlIGl0IGJ5IHVzaW5nIGEK
PiAxVUxMIGJpdCBzaGlmdCB2YWx1ZSB0byBvYnRhaW4gYSBzaW5nbGUgc2V0IGJpdCBtYXNrLgo+
IAo+IEZpeGVzOiA1ZGFkZGE1ZTZhNTkgKCJyaXNjdjogaHdwcm9iZTogZXhwb3J0IFp2ZmhbbWlu
XSBJU0EgZXh0ZW5zaW9ucyIpCj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVn
ZXJAcml2b3NpbmMuY29tPgo+IAo+IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlu
a3M6CiAgLSBbcmlzY3YvZml4ZXNdIHJpc2N2OiBod3Byb2JlOiBmaXggaW52YWxpZCBzaWduIGV4
dGVuc2lvbiBmb3IgUklTQ1ZfSFdQUk9CRV9FWFRfWlZGSE1JTgogICAgaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9yaXNjdi9jLzVlYTY3NjRkOTA5NQoKWW91IGFyZSBhd2Vzb21lLCB0aGFuayB5b3Uh
Ci0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90LgpodHRwczovL2tvcmcuZG9jcy5rZXJuZWwu
b3JnL3BhdGNod29yay9wd2JvdC5odG1sCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
