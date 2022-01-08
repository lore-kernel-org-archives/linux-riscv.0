Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5A8C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Jan 2022 00:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XaKfrTpX2jgvI1dn64IkPyZVMhmr22PmBsTa8oJIpLI=; b=sfjs7q7V/NsVs5
	vxvE/Z5aHDoFJ1WE+wOy/5u1sMfB0hVwgvn4/0gp2nftambgwbNAwH6GXmIlaIjJ42a8sUFPwSwvP
	27QyI/z9BZT2CYtzOyt1qAa3QuM40skgQayPGoSTVeZGAkwu6IICJa4WQqbpwfSYSWmVi4zk4SBI/
	FZ0nymmfSEOi5j/MG/PyZapGkdDgmB0Z2Fj1EsmxhVvPBRv94JrtodKK9M+2mrZexdnjtH/cphf6a
	Ba9LP5w+Z+K1eiZSlboTgCU3R/K5JO10BuQjdODp29UKM2SHiLY6Yss/US9O0IvKvhZSf5ReYAlRM
	YBDjYJTXewJtProGiWfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5zrF-005h4H-Ub; Sat, 08 Jan 2022 00:45:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5zrD-005h3a-Dc
 for linux-riscv@lists.infradead.org; Sat, 08 Jan 2022 00:45:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 26025B827C1;
 Sat,  8 Jan 2022 00:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C331AC36AE9;
 Sat,  8 Jan 2022 00:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641602714;
 bh=dUWN3mVrxOEErbJ6o4JMx/VEB9lx/aE7w+sbf0AOXtQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=hmn0TWaH7ZvGwpnXaB2vwQ+3Tf+V69zsButjd64DIO7LTsT+HHIHbAtRZOcDFbIP7
 Sf5UyYonN5WRDGpnMd5p+kgKy4J9qbivxrqiROBU7UpH9nbuEXNHn8n/m7DI9fOszO
 aF5oM9wF01STq88gVbksW4/o73YFEMH+78fMuXDX7VCA+QCY+0orUFrOkoGdhNa3WV
 /brbmmZNY6hiN8LPlydKQwIXKWyPNU3Gd4s/iMJ1tFo+nhaU6so2CpXbSjq/oQS3+Q
 rkOTk4VVX6wkXRsX5u806tSTx+JimgRj/+cn3bAgfDnek5Tycxz0KR2NcXioxT20GQ
 fjEesRdRTyKiA==
MIME-Version: 1.0
In-Reply-To: <20220107090715.2601-1-zong.li@sifive.com>
References: <20220107090715.2601-1-zong.li@sifive.com>
Subject: Re: [PATCH v3 RESEND] clk: sifive: Fix W=1 kernel build warning
From: Stephen Boyd <sboyd@kernel.org>
Cc: Zong Li <zong.li@sifive.com>
To: Zong Li <zong.li@sifive.com>, lee.jones@linaro.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com
Date: Fri, 07 Jan 2022 16:45:13 -0800
User-Agent: alot/0.9.1
Message-Id: <20220108004514.C331AC36AE9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_164519_624080_A5E1CF40 
X-CRM114-Status: UNSURE (   9.06  )
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

UXVvdGluZyBab25nIExpICgyMDIyLTAxLTA3IDAxOjA3OjE1KQo+IFRoaXMgY29tbWl0IHJldmVy
dHMgY29tbWl0IDQ4N2RjN2JiNmEwYyAoImNsazogc2lmaXZlOiBmdTU0MC1wcmNpOgo+IERlY2xh
cmUgc3RhdGljIGNvbnN0IHZhcmlhYmxlICdwcmNpX2Nsa19mdTU0MCcgd2hlcmUgaXQncyB1c2Vk
IikuCj4gRm9yIGZpeGluZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocykgYWJvdXQg4oCYcHJj
aV9jbGtfZnU1NDDigJkgZGVmaW5lZAo+IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFy
aWFibGU9XSwgdGhlIHByb2JsZW0gaXMgdGhhdCB0aGUgQyBmaWxlCj4gb2YgZnU1NDAgYW5kIGZ1
NzQwIGRvZXNuJ3QgdXNlIHRoZXNlIHZhcmlhYmxlcywgYnV0IHRoZXkgaW5jbHVkZXMgdGhlCj4g
aGVhZGVyIGZpbGVzLiBXZSBjb3VsZCByZWZpbmUgdGhlIGNvZGUgYnkgbW92aW5nIHRoZSBkZWZp
bml0aW9uIG9mIHRoZXNlCj4gdmFyaWFibGVzIGludG8gZnU1NDAgYW5kIGZ1NzQwIGltcGxlbWVu
dGF0aW9uIHJlc3BlY3RpdmVseSBpbnN0ZWFkIG9mCj4gY29tbW9uIGNvcmUgY29kZSwgdGhlbiB3
ZSBjb3VsZCBzdGlsbCBzZXBhcmF0ZSB0aGUgU29Dcy1kZXBlbmRlbnQgZGF0YQo+IGluIHRoZWly
IG93biBpbXBsZW1lbnRhdGlvbi4KPiAKPiBGaXhlczogNDg3ZGM3YmI2YTBjICgiY2xrOiBzaWZp
dmU6IGZ1NTQwLXByY2k6IERlY2xhcmUgc3RhdGljCj4gY29uc3QgdmFyaWFibGUgJ3ByY2lfY2xr
X2Z1NTQwJyB3aGVyZSBpdCdzIHVzZWQiKQoKVGhlIGZpeGVzIHRhZyBzaG91bGQgYmUgb24gb25l
IGxpbmUsIG5vdCBzcGxpdCBhY3Jvc3MgdHdvLgoKPiBTaWduZWQtb2ZmLWJ5OiBab25nIExpIDx6
b25nLmxpQHNpZml2ZS5jb20+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
