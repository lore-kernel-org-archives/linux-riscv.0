Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3B3606A33F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 08:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YjH8XRlE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RGBeahcB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=McoBnJ5YKvQ7LDsRSESjgFTg+NogXVF6JMP3Q6q6bl4=; b=YjH8XRlE7L6+31tlFLzFLsXXlA
	AlOPT6hVTbaGdez6nuN2fequwhe2tRFxWiH9EdaexgyN/cCVSn9h+Bw0WtoHjCT0DMfkXXAkvZqiI
	L3nZZrWyDB49AdVV1U1R7ruUk4qhG51YcYPRDdXhjgCXiQRkcgtsAGzPubVQzB4LdJtpCxB7yPIih
	9VpsD84y08JOms0naLSa/41S45CS20UUrQldVrDD8kmGQC6lN8hmLYFjd2K5xGRdzCPvCgCRHcWW5
	0aY53vNfJ3kokt0b1xQQ1+vOdK30192e+E8WVYilVuJ19bQfB5sRTHwTJMG9WcTHiX3+7Bypm7CVf
	RNnmxUOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWod-00000004nei-2xLx;
	Wed, 04 Nov 2026 08:57:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWoY-00000004nae-3t4Z
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 08:57:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 21CB960D81;
	Wed,  4 Nov 2026 08:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21BC1F00919;
	Wed,  4 Nov 2026 08:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793782669;
	bh=XrZo1d0VK3d2S4vcBDTLf8La72OwD6eeG+6dxJojOjo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=RGBeahcBoARoK21PSoLPjUX7rg1FCXcu7lcj+1caPPgrEqzURLA7z/mOPpVEfyj5w
	 MniBl2Lp1kMyVnNDbBdTWAfdXGXqWOMFFbuRrn3odE+DN9WahGMAw2PwLz8o/YYApu
	 m3hr0WVsyjQwmmKwPhhwi1z6NBu0QqK0QPSeLf8qXrXxlBjw9Y0p0atTdvr2iZff7K
	 0NXSy6+IQafNWXMwWTKUvWfbmhjX2mu4hi8128wPuNAGtvdb/S/jWJnbOcEPV3M5qR
	 iGcld4aGFbFYaDEez9eCGTCVbYiTF9qFnQpbcePtZCV0pVGRJSnWsVGbnk6GnHqm5n
	 RGbh1Q//86IlQ==
Date: Wed, 4 Nov 2026 01:57:47 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    zong.li@sifive.com, wangruikang@iscas.ac.cn, debug@rivosinc.com, 
    qirui.001@bytedance.com, guoziyi114@gmail.com, samuel.holland@sifive.com, 
    ben.dooks@codethink.co.uk, cyrilbur@tenstorrent.com, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    stable@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix SR_SUM leakage across context switches
In-Reply-To: <20261022083212.84721-1-cuiyunhui@bytedance.com>
Message-ID: <c970ab41-a425-ce36-f801-cb6af00c7cc1@kernel.org>
References: <20261022083212.84721-1-cuiyunhui@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 22 Oct 2026, Yunhui Cui wrote:

> __switch_to() saves the sstatus value of prev and restores the SR_SUM bit
> of next with csrs. However, csrs only sets bits. If prev has SR_SUM set
> and next has SR_SUM clear in its saved state, the old SR_SUM bit remains
> set in sstatus.
> 
> This lets next run with user memory access enabled even though its saved
> SR_SUM state is clear.
> 
> Use csrrc to save the sstatus value of prev and clear SR_SUM from the
> live CSR before restoring the saved SR_SUM state of next. This keeps
> prev's SR_SUM state intact, while preventing it from leaking to next.
> 
> Fixes: 788aa64c01f1 ("riscv: save the SR_SUM status over switches")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>

Thanks, queued for v7.4-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
