Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F41C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 15:40:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B14EC610C8
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 15:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B14EC610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hamEjouKC1asNSPwuOUsMrNkmfgnEk3pVt69ZD0Sn5o=; b=04rAQomgnyiXvb
	ItqVonymkDf69r8GkmI3/pXjaiWQkhqTcYOZSF6DwvUH0LPhgCKOdit55C6kDaE4bmsflCXK3Rh7w
	At7clSgp9H1bZVnwclSXswe7f6pXzMdW5/o7Ud6A0qwDcTZGfWtC0/YoGQBTvajgCwKqQRZBeQ1LO
	xzzrqlA12eLUNHMFPX/LUGHqMBKTzDHAZseg1EIBFc1tOlqGSv7QmZo/W069n5FobNhP8nnEN3WN7
	GSoweXA8prxepHyjutorYhtuCEX5rE0JPavI9kvLjOa+slZx68R1NuGHb1YrTAr+uAL5564a8SG36
	jyBlLS3U5uu/VsuaYZCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg7Vk-008RDz-CG; Thu, 28 Oct 2021 15:40:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg7Vh-008RCD-DX
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 15:40:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 4FA91610C8;
 Thu, 28 Oct 2021 15:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635435608;
 bh=RhNp0ZDgNabWMlYljqrqlsicwJVv4uK8mY93cUQZpvY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=K9uEFhNkUPDkUy0Vtx9CpQsvF8Mo4SmjgrJ+ilxr7B1meYGp2JudEZD28juKUxGbX
 wzTr7jNjaBP7g8KAufQwTOSpIApfngWgnn7yJhwtxBxDqO8jzxHu5Zw6QN3Yod5tHG
 TYJtOZ632qBJXT2EAhBv2MJtW9DPHKBuHcaOv7KfMsmFEUFS3wyW4+lhDtS3Pk58lz
 ICqAew/G8KIqRQnYzQ5N8zvkdubmywG8+Rdfj7lUksrfm16qDfbM1roSZ1cnvL/BdS
 ATlfGyj+3nvOtG0U82woWNCpq5rRaQmZuyORrNsvx7Q0oTM922Dn3jv2jiWis2zmM3
 YcyaBsxhtUYTQ==
MIME-Version: 1.0
Subject: Re: [PATCH bpf] riscv, bpf: Fix potential NULL dereference
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163543560824.29178.17218180216053026996.git-patchwork-notify@kernel.org>
Date: Thu, 28 Oct 2021 15:40:08 +0000
References: <20211028125115.514587-1-bjorn@kernel.org>
In-Reply-To: <20211028125115.514587-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_084009_502582_0B9E8C64 
X-CRM114-Status: UNSURE (   6.42  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIG5ldGRldi9uZXQuZ2l0IChtYXN0ZXIp
CmJ5IEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5lbC5vcmc+OgoKT24gVGh1LCAyOCBPY3QgMjAy
MSAxNDo1MToxNSArMDIwMCB5b3Ugd3JvdGU6Cj4gVGhlIGJwZl9qaXRfYmluYXJ5X2ZyZWUoKSBm
dW5jdGlvbiByZXF1aXJlcyBhIG5vbi1OVUxMIGFyZ3VtZW50LiBXaGVuCj4gdGhlIFJJU0MtViBC
UEYgSklUIGZhaWxzIHRvIGNvbnZlcmdlIGluIE5SX0pJVF9JVEVSQVRJT05TIHN0ZXBzLAo+IGpp
dF9kYXRhLT5oZWFkZXIgd2lsbCBiZSBOVUxMLCB3aGljaCB0cmlnZ2VycyBhIE5VTEwKPiBkZXJl
ZmVyZW5jZS4gQXZvaWQgdGhpcyBieSBjaGVja2luZyB0aGUgYXJndW1lbnQsIHByaW9yIGNhbGxp
bmcgdGhlCj4gZnVuY3Rpb24uCj4gCj4gRml4ZXM6IGNhNmNiNTQ0N2NlYyAoInJpc2N2LCBicGY6
IEZhY3RvciBjb21tb24gUklTQy1WIEpJVCBjb2RlIikKPiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4g
VMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgo+IAo+IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5
IHdpdGggbGlua3M6CiAgLSBbYnBmXSByaXNjdiwgYnBmOiBGaXggcG90ZW50aWFsIE5VTEwgZGVy
ZWZlcmVuY2UKICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvbmV0ZGV2L25ldC9jLzI3ZGU4MDlh
M2Q4MwoKWW91IGFyZSBhd2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3QtZG90LCBJIGFt
IGEgYm90LgpodHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1s
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
