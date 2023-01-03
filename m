Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F436C4708D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 19:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o3C/tP5wkpfj5JR2mUBiE7asvvhOgYVgY8397VEYRMs=; b=SMqUi299moo2SN
	455LwuXr0D8iAup5pzmsO4eQXmei/XpFa63atLiLIkNwbmq+6AQLm9VGKq9MFo/5B//unb84HFxV/
	MuG4h6TMkAmkkka9pg3fNW+t9p4kEY5LzwVSqFjpRwUQ3HvnZIH7FlJ/qtaoRzh/Yrtm2Vm02GQE+
	URNACcT1o1VPERHLAdaOzEHTEGV7lSzFiU3HQBAX2Nk5dj4UZw+N3KMzrTtjguscJaP2Wkb6Ptjwy
	th/mMnA3IsvNTf/F4MvhFUlkWHrBTHlM1/t9qWpzpT3CkeQXEdIyVOY15Dm551Qj1FkYWV3Tq+b2L
	k7T3assHUdP9HGPF/uyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCmav-004CNe-24; Tue, 03 Jan 2023 19:05:05 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pClVf-003cpj-Jv
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 17:55:39 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 81FE15C00D0;
	Tue,  3 Jan 2023 12:55:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 03 Jan 2023 12:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1672768534; x=
	1672854934; bh=m+ncvU0PECkKfb0iCZYyliBBT0Yq5v7KR+Dy4Msbui0=; b=x
	rx/0ixOmhnDn40L38hOU9Q2iT0EP837yhfdrtRzrZ4djT4pubG3n7cVj/Lp+uEWM
	fGQ0FflGIBNAVQbT7N2PhII0d5kdruDlh0W9BW5KVHbN5wlRlnuu6KfmLuQYIhT0
	DhcfbPKxhbPDAl12TvEfZcDffYK7SuBodwPjphP29V3uNP3BnJrcYX7Gv1uC8aOB
	VMD4iTxY+zC+tJSBWmwC/euk3zsovZlZwhdwcugzYzjBtzqAnxmvP/7lSsTeWIgb
	fTcLjfQhIdWLphy702tv/32rrTGDLRZaOLZ1jMmDb4x86YpklXKj7jIqzMfztfOM
	I5n+FAqkYv5badf2QOyvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672768534; x=
	1672854934; bh=m+ncvU0PECkKfb0iCZYyliBBT0Yq5v7KR+Dy4Msbui0=; b=u
	B+vuV2YiHdwWIGKDLRXn1Qul4lUt1N1wVQCiIW5+LA0I/J52ewbjKR+f2/E7rNFx
	iiFvNM/49Nb5yMMO0w9icvg/uAZ2um2fsPsvNf7cGCakhDVelcuI3+qvUqJCC32o
	Akg3mmaS5y2VHp/+a35XoGgh6tn6LoipsXPZz/M/yZ1aYooX7FM0kSqGkcQrEGxJ
	pXUUPnGTfvZBOMP/EfTX/3q65GkhzOmKaTgQupgatbn1IAgk2Xrlg3cd/Z6plXBL
	V4feSEvJUdbvJfseutnCYvO+6PeUHblUwYK3Dpy66LQ2XC5r2Xn0wyXdbtLeCJ/M
	tUXfkrUH67lyv2GCchbug==
X-ME-Sender: <xms:FWy0Ywrq4DTNnWwsVjZKOeFiSgte9HqsVzGHzKPTmS0H0QDMEgQXYQ>
    <xme:FWy0Y2q-Nkv5zjHPr-pocUB-bO5D8BiYLblhfhkGy3mb9rPMO8NeBehMv5i2jgxze
    at1SED7tjNChBjqGA>
X-ME-Received: <xmr:FWy0Y1OneqKId_z0eCZwJtuen2KAEU1pk3-x8zITyOVvKgC6jZxUFKEDjRYeVgVtljokseSmp-vnfF1zt8yf9g6OnYyutxBL7knGZuTsK2MMRwBCKpRjSSpY2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeeggddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeekjeelleefiedthfdtgfekgeehudefudeugeffvdfhudekleel
    fedtteejhedutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:FWy0Y3489d9Ll0bXlcvn4pYLaWy5ixqHv7HmmTIBILz77l6LTnlD8A>
    <xmx:FWy0Y_65L_SdB9KTKpQYDTHxs0nOJbuqDxce5iru7DwTKucpT3aanw>
    <xmx:FWy0Y3gBexTGAEdmROP4YW4TQ2SF929Q9d37r4mFusfSD4XJ3dGx2g>
    <xmx:Fmy0Y8vl5KZgmRXKBTmPbePTCy83NGzyPcsmQkJ6903RtjkQ78XPIA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jan 2023 12:55:33 -0500 (EST)
Message-ID: <059c87c4-9559-7bc2-4675-a243ed075c23@sholland.org>
Date: Tue, 3 Jan 2023 11:55:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2] riscv: stacktrace: Fix missing the first frame
Content-Language: en-US
To: Liu Shixin <liushixin2@huawei.com>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Changbin Du <changbin.du@intel.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221207025038.1022045-1-liushixin2@huawei.com>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20221207025038.1022045-1-liushixin2@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_095536_075579_B8CBB318 
X-CRM114-Status: GOOD (  14.04  )
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

On 12/6/22 20:50, Liu Shixin wrote:
> When running kfence_test, I found some testcases failed like this:
> 
>  # test_out_of_bounds_read: EXPECTATION FAILED at mm/kfence/kfence_test.c:346
>  Expected report_matches(&expect) to be true, but is false
>  not ok 1 - test_out_of_bounds_read
> 
> The corresponding call-trace is:
> 
>  BUG: KFENCE: out-of-bounds read in kunit_try_run_case+0x38/0x84
> 
>  Out-of-bounds read at 0x(____ptrval____) (32B right of kfence-#10):
>   kunit_try_run_case+0x38/0x84
>   kunit_generic_run_threadfn_adapter+0x12/0x1e
>   kthread+0xc8/0xde
>   ret_from_exception+0x0/0xc
> 
> The kfence_test using the first frame of call trace to check whether the
> testcase is succeed or not. Commit 6a00ef449370 ("riscv: eliminate
> unreliable __builtin_frame_address(1)") skip first frame for all
> case, which results the kfence_test failed. Indeed, we only need to skip
> the first frame for case (task==NULL || task==current).
> 
> With this patch, the call-trace will be:
> 
>  BUG: KFENCE: out-of-bounds read in test_out_of_bounds_read+0x88/0x19e
> 
>  Out-of-bounds read at 0x(____ptrval____) (1B left of kfence-#7):
>   test_out_of_bounds_read+0x88/0x19e
>   kunit_try_run_case+0x38/0x84
>   kunit_generic_run_threadfn_adapter+0x12/0x1e
>   kthread+0xc8/0xde
>   ret_from_exception+0x0/0xc
> 
> Fixes: 6a00ef449370 ("riscv: eliminate unreliable __builtin_frame_address(1)")
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---
> v1->v2: Fix the incorrect Fixes tag found by Conor.
> 
>  arch/riscv/kernel/stacktrace.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Tested-by: Samuel Holland <samuel@sholland.org>

Before:

WARNING: CPU: 0 PID: 162 at drivers/regulator/core.c:5700
regulator_unregister+0xf0/0x106
...
[<ffffffff803a0794>] devm_rdev_release+0xe/0x16
[<ffffffff80427bac>] release_nodes+0x3c/0x98
[<ffffffff80428cac>] devres_release_all+0x72/0x9e
[<ffffffff80424054>] device_unbind_cleanup+0x10/0x4a
...

After:

WARNING: CPU: 0 PID: 165 at drivers/regulator/core.c:5700
regulator_unregister+0xf0/0x106
...
[<ffffffff8039d194>] regulator_unregister+0xf0/0x106
[<ffffffff803a0798>] devm_rdev_release+0xe/0x16
[<ffffffff80427bb0>] release_nodes+0x3c/0x98
[<ffffffff80428cb0>] devres_release_all+0x72/0x9e
[<ffffffff80424058>] device_unbind_cleanup+0x10/0x4a
...


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
