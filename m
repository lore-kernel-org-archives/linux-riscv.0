Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2576C64EC7
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 03:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pjWyNim9cAfoPy3DcBSH7nOWw2fvPO+6oxE5V2+tN+8=; b=NA/K6qrzTjVA2J
	MBiTfO5aLdmKNJVvezbxHaOjbItTcaD4qje0MeJfKEgOK7DHmbguH7d+5xlZxDcv3gAf8UXQ+hlrk
	e9y7CEmZ84JkaG1gfSR8jy+i3AQhPhd69cLVvorxSvkARa9QvPRZLvXnoQJF8tWhyQgS42Ksm5Sjz
	pq5CWxzJ/IPblQwmTxfARGKmyPe1UOhxukf7uqIFSb7ZtMPNA3lRNgLdg0X40TZ07lEx8Tqo+r2kg
	L4a7XkBhDVz4zQcOpxl158NGsUy+yQILzoLD4Ye8RVUOH/Wo7byYkPGZ2e8gSmoTxbnRJKyvdPKU2
	zq2CWoqpdKOLY+OBCRkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXD0y-00F0wu-HD; Wed, 01 Mar 2023 03:20:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXD0v-00F0ve-NO
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 03:20:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6102FB80DD4;
	Wed,  1 Mar 2023 03:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4ACCC4339B;
	Wed,  1 Mar 2023 03:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677640818;
	bh=lemnk8C00AdDDtpTCou7O+/puCIbvh44VyBwWRDlehw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Z4xa3PvAKe3HB7fTZ6UCtsnz0FcFVtCBrktcm3AHLfZAoPzMUNt+1BBF2YemVEWFo
	 rPUNNOyUytgV1laLNDxGC9uPePRdRRADu78gJSsOC5A1IyudorBsiwl06xZFLozBAo
	 rVLm+f73Wh2F8xvYzojZsV4LUZbFckyaV36R+A42d31RgBqGLnhd4eTnh91O5iiE5T
	 XouumRrSoStepAeyr8pLdwejHA0NAjBZtXNrq3wtxq9IsOXk2brMYX8dtEkYAaJ5HN
	 u9NgoaEpG0DZeDqRdoF88iRlvyYRR/MYVlk5PTgYO0qPgorozu4KpezXfjg5MmspZp
	 xYlbftgldarYw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C0C15E450A5;
	Wed,  1 Mar 2023 03:20:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv, lib: Fix Zbb strncmp
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167764081777.10705.11052851950584428233.git-patchwork-notify@kernel.org>
Date: Wed, 01 Mar 2023 03:20:17 +0000
References: <20230228184211.1585641-1-bjorn@kernel.org>
In-Reply-To: <20230228184211.1585641-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, christoph.muellner@vrull.eu,
 heiko.stuebner@vrull.eu, bjorn@rivosinc.com, conor.dooley@microchip.com,
 linux@roeck-us.net, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_192021_932417_AB1402A3 
X-CRM114-Status: UNSURE (   9.82  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZm9yLW5l
eHQpCmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIFR1ZSwgMjgg
RmViIDIwMjMgMTk6NDI6MTAgKzAxMDAgeW91IHdyb3RlOgo+IEZyb206IEJqw7ZybiBUw7ZwZWwg
PGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAKPiBUaGUgWmJiIG9wdGltaXplZCBzdHJuY21wIGhhcyB0
d28gcGFydHM7IGEgZmFzdCBwYXRoIHRoYXQgZG9lcyBYTEVOLzhCCj4gcGVyIGl0ZXJhdGlvbiwg
YW5kIGEgc2xvdyB0aGF0IGRvZXMgb25lIGJ5dGUgcGVyIGl0ZXJhdGlvbi4KPiAKPiBUaGUgaWRl
YSBpcyB0byBjb21wYXJlIGFsaWduZWQgWExFTiBjaHVua3MgZm9yIG1vc3Qgb2Ygc3RyaW5ncywg
YW5kIGRvCj4gdGhlIHJlbWFpbmRlciB0YWlsIGluIHRoZSBzbG93IHBhdGguCj4gCj4gWy4uLl0K
CkhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKICAtIHJpc2N2LCBsaWI6IEZpeCBaYmIg
c3RybmNtcAogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzgxYTFkZDEwYjA3MgoK
WW91IGFyZSBhd2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90
LgpodHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1sCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
