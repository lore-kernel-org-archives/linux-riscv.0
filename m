Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BA8606A329
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 07:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XWExL3z8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zv0SkjVj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FSSBcpmDhE9gziydJ4Gk9nIPuSemYV+r0wpCBK5l3Vo=; b=XWExL3z8AcxeJynBLu3i0aQ5Y2
	9bbhs7pBKFB2kaIP37wMVjAkX+bvbKRJxKdlN8YDUAU4CoDUdIi1O2SjYcrbyPtKlEz/dYZtVl3Yq
	NJSGEvKl9U9LpkgqkOjujYN7hX2BBemAm0uMyfgLp9z8Tq6rdXMKiKU6SxLflSieByebOm9i61roc
	3l30//6xyeKJZDEXdwpEtuVrD15Vyh5WQSrNtS40qd9NdFSdU+uneca0eRY6FOK2AUAcP/OKOXAQ8
	117X+jqKDT3ciaXBVbiFJEmBVBW5bMEInVQpplhvcdf1QgrDRgAbzpLj5ReqWuigRe99LyNdpUjBO
	XNJfk8Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVBB-00000004Tds-16tk;
	Wed, 04 Nov 2026 07:13:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVB9-00000004Td4-2gdA
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 07:13:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B2454601F6;
	Wed,  4 Nov 2026 07:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B41401F000C1;
	Wed,  4 Nov 2026 07:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776382;
	bh=5g7FZObi9BlDY9v+x98lcvete0YltH6hrV6+E22NjPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zv0SkjVjKqLv6rAKP+cb4BTOzKsyO5uNH2meQNYKX9qQIawUflI0mpEUvZMW7uUQD
	 PuW83n2aWNkOaDO2Pxau8BE5HoeXQd7gnZBtJ1oFpgyL3LX8Eked4bU+RVwOMqpT89
	 GAelYu7PPrd9sFvrSLOGfyc4LK4SXIfrtj8RiCau27GtEVhZKdE2+E9zwYT8bVtyjc
	 91JI7WjiEnDvBxIKdEB3JiAfXfBmU2V+poBuKsdVIL44zVAWiiS/6Re6ZVNzPdvjXV
	 Dju2N2S0efrzm/E030PjB7N3SuxDaYN08wcpEtF0+FgK1z0Lo612maCmVvR/kZjo3/
	 frJKPWWXSgJ+w==
Date: Wed, 4 Nov 2026 08:13:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Daire McNamara <daire.mcnamara@microchip.com>, 
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] soc: microchip: mpfs-sys-controller: put the flash
 device reference
Message-ID: <20261104-foamy-toad-of-courtesy-e0907b@quoll>
References: <20261104021435.1468301-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261104021435.1468301-1-vulab@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 04 Nov 2026 02:14:35 +0000, Wentao Liang wrote:
> of_get_mtd_device_by_node() returns an mtd_info with a reference taken
> on the MTD device, which is stored in sys_controller->flash.  The
> reference is never released, neither when the last sys_controller user
> goes away nor on the probe error path that frees a freshly allocated
> controller without initialising the kref.
> 
> Balance it with put_mtd_device() in both places.
> 
> Fixes: 742aa6c563d2 ("soc: microchip: mpfs: enable access to the system controller's flash")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/soc/microchip/mpfs-sys-controller.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Multiple things here:
1. Your team ignored completely previous feedback. Multiple times.

2. You use multiple identities with this email address, thus I doubt that we
   speak with an actual person.

3. Your bot does not even bother running checkpatch, right?

4. Nothing of this was reproduced nor tested.

5. Finally, the same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document the issue discovery method and what was
or was not tested.

Best regards,
Krzysztof





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
