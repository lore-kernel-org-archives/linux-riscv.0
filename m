Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EFDC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 03:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TrBe9Yr6hRGMVaexyjARGWh7G5fq80fZVqAriTQAcTY=; b=4EbtS+dmyS4Ad7Vv22pr/yqaB7
	Z0P2R7uzb+VYV/ZwIIHF39RJdmm1WleZzur+8FFZTKqA776Yjjma2BRAsxYNNXy4l+IwnRfW5jU48
	wLU2eF4ZzlhnqLK5pFdSBp567Nm/Z7lP7cyLMsn+1DO7amnAdnHuHSvxtXVmMOWUghiYUu47Pbiwo
	glzOaSJhgKhPWfQ1t/cGK5mmmYGQQSCF7RrtGqfvwSYmEPVgOE6mctXks97eqNELPI7sCsncxKnBg
	W+6tiS6XPtXGGGlycLaJI75TVmpE58rZa06MX3knArJFbm5f1qEMllh8Ay2uddouJgCZkZLKFWJQK
	dfHaBmLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJSFq-00DAXI-PZ; Mon, 14 Feb 2022 03:42:22 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJSFo-00DAVc-DQ
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 03:42:21 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9F15B580218;
 Sun, 13 Feb 2022 22:42:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 13 Feb 2022 22:42:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=JEibxPGvz4zlvz
 8cnCgwsSaVEcxlPUvz1ybP2YVe2lw=; b=I5wIQ5mnPRhiGXUuQ5NkhC/FzDfS0R
 8fAA0gG1hjZGSvhsgvrJeGhM3o/9QvE5RD8nLaDxIdgED9yOlpsJNv2ZKxQejCVK
 Qwp7M2YdhVPEnxbIgm8sHBq7kMNDgBKtgr8KXGgU6K5uzyR3nhwN4ZxymO1GzMSd
 OLVDLrO0fxSx4ZxqhrMI1FHABal3UQlA6RyzyvG05a3KYsHIepiysrhWOmW9SiMt
 K+pkGbgcA4MUiLWA2bZ1VT/XhMmP8sb+kypG2U06IFMyji3fNGP8q/IDD6+Dh3bV
 YOFQw7BkNrHgc5+59aSjhK6Bz+BnlkqV+w57Wa8EPmq9EltpRb829Feg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=JEibxPGvz4zlvz8cnCgwsSaVEcxlPUvz1ybP2YVe2
 lw=; b=UEJaJz8SjMfnmljMJTY+Rkas67dWAiQF88GmhwQuUEVinalhmW1pMnUDa
 rYzl90E0rWFAK1mx6VAq8G1Oh2ozQ2RhMS0i6sD32j2gtAGlRi54/R8gWJiUeF9o
 xfrNKL4gXNcpRrDyNJwoE4rGG9SA/SmttoSVAWm3LzbHM5jh0Z7z6yLj1FLL3hcU
 +2LkZEPO0OKDUd/QOu1+nVb7N17YjIF5XUo/W22/krAA5NEQEedU4ChYNbmFurD2
 TSPwptED95gwh2pn3gkdgDlbI7Zbiv4EDG+UJ7ABK0nxMHAF28NwupOtKmYnqop7
 h8DSPLv9N2/76gQvNvZnMYodNqN1Q==
X-ME-Sender: <xms:lM8JYkN5kh3nhaAOhB1TJimIF3LmXPrlpVpoMcEOPR4hGGAOlqN5Kw>
 <xme:lM8JYq_vCVxhCRkoKlkfSOBY0l548IBdpyVBqDtu5DIx3n_W4n-RouMnARnpHKu38
 FigdL29sudWQJ-O7Q>
X-ME-Received: <xmr:lM8JYrSfRszXnqyYZ0jf5bz0NgkvepYpRtlW_dXNo1cVw6Ig8dxPkULf_T36XqcRxQvPJbTURRIojSojcC4t77_jDhbf-ofYwao_rsvNgFnxU_xmC8_DcbHUIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjedugdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpefgveffteelheffjeeukedvkedviedtheevgeefkeehueeiieeuteeu
 gfettdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:lc8JYssjYQThyR8pU_bHiJfk-tsnG2muWnIl2j4u6n8GvKijTGk_Og>
 <xmx:lc8JYsdj7GgEKVoSL45LvQPDiVWsXiNlYdhC7t8yZtyj_iw6CLwGSQ>
 <xmx:lc8JYg3ipRwLyyUgAJ0Z4hJHDZJZ99_lXkKMw203rEvUHQuuZay9rQ>
 <xmx:ls8JYlMZC8CUIWe7QlfpHlGy8qd0_udfZJuldURA_j3LkPJVmNjFgQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Feb 2022 22:42:11 -0500 (EST)
Subject: Re: [PATCH v6 14/14] riscv: add memory-type errata for T-Head
To: Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, wefu@redhat.com,
 liush@allwinnertech.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, drew@beagleboard.org, hch@lst.de, arnd@arndb.de,
 wens@csie.org, maxime@cerno.tech, gfavor@ventanamicro.com,
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com,
 huffman@cadence.com, mick@ics.forth.gr, allen.baum@esperantotech.com,
 jscheid@ventanamicro.com, rtrauben@gmail.com, cmuellner@linux.com,
 philipp.tomsich@vrull.eu
References: <20220209123800.269774-1-heiko@sntech.de>
 <20220209123800.269774-15-heiko@sntech.de>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <0f5e7f77-abe9-046e-7296-2f22cb7e5b86@sholland.org>
Date: Sun, 13 Feb 2022 21:42:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20220209123800.269774-15-heiko@sntech.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_194220_558502_7D92D5C4 
X-CRM114-Status: UNSURE (   7.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/9/22 6:38 AM, Heiko Stuebner wrote:
> Some current cpus based on T-Head cores implement memory-types
> way different than described in the svpbmt spec even going
> so far as using PTE bits marked as reserved.
> 
> Add the T-Head vendor-id and necessary errata code to
> replace the affected instructions.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Samuel Holland <samuel@sholland.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
