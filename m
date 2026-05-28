Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9B5CD5BC9
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 00:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mtaIVApbpcS4jofDUV0XRzAol+vx2N60iQbLuGzq1m8=; b=z44pl5qVO67C5r
	DFw4v2442tHe7FsIZRM23Uqin/JW9tZstujkOxEhAaLsN1ApWKGBm/S3oZrRfeLF0Ixd2QnSuRZpr
	E3CM8n7p8/BmxmiSw2iZeLJQJya9dVKP77fTKXleeT0Em6bZ6aQGu1NnK4jCZTXb+YHjUpK46WFYZ
	pBFj54LWtHTaSN1E+I2f6b83yarqCPFy7xdlNf9+1D5wcX+AgcUVhqXCxAfIn/AFGb5kzKIhsEBVa
	/14IjWbeutm4vDLpGZGipnQxNbRN4SdK714k4bQWZgRy0pNz/NedAWpx12i8Q4rd0R9LDlNlyV5Hk
	Kye4jlfDqTjzjyZZIO8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSOo6-00000004ruF-1Szo;
	Thu, 28 May 2026 00:41:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSOo4-00000004rtt-1ejd
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 00:41:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6342D605C2;
	Thu, 28 May 2026 00:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D611F00A3A;
	Thu, 28 May 2026 00:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779928863;
	bh=2COLfxtVhLs1Jp/XRdn1rRO29EsGhseHkSqLPdXcZW0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=GNFpgT0IyuzJwXC+HBrIiPo6/MATlA4EjLz/Y4dzkwbZRcD6Ijf9C3MmvsZ5M50k6
	 m8ifRv4lVvoS/MxIGL5M37/UjiEmxjaImUvyank2EkmLxqjgMu+R5PuQvDmZmzzAXR
	 GF2OkdiwC/eGhzumsC9kMhneEa/m0TUYbLBNKz9tybWUdMXQMOqBkz7BqlbNxiiXGp
	 6HMq6v3i222KtiUxL5zw0B3tZ6bjsiXhNxnLsDu6sy5m5kfze1rkmJy+ErzCRcqzFI
	 K2UO1+YQjzSfDndmGhelmsWTBdyi+/SCIcimnrIRLftEAJP/57zQp8BoTZ1bn+HaEa
	 RsQkkNutC7osA==
Date: Wed, 27 May 2026 18:41:01 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Hui Wang <hui.wang@canonical.com>
cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, alex@ghiti.fr, danil.skrebenkov@cloudbear.ru, 
    ajones@ventanamicro.com, atish.patra@linux.dev
Subject: Re: [PATCH v1 1/2] riscv: cpu_ops: Change return value type of
 cpu_is_stopped() to bool
In-Reply-To: <20260413123515.48423-1-hui.wang@canonical.com>
Message-ID: <81892db4-cf4c-0a1d-d94d-460d528fa064@kernel.org>
References: <20260413123515.48423-1-hui.wang@canonical.com>
MIME-Version: 1.0
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

On Mon, 13 Apr 2026, Hui Wang wrote:

> In the original sbi_cpu_is_stopped(), if rc doesn't equal to the
> SBI_HSM_STATE_STOPPED, it will return rc to the caller directly. But
> there is a hidden problem, the rc could be SBI_HSM_STATE_STARTED, if
> so, this function will report cpu stopped while the cpu isn't really
> stopped.
> 
> Furthermore, from the name of cpu_is_stopped(), it gives a sense the
> return value is a bool type, true means the cpu is stopped, conversely
> false means the cpu is not stopped.
> 
> Here change the return value type to bool and change the callers
> accordingly. This could fix the above two issues.
> 
> Fixes: f1e58583b9c7c ("RISC-V: Support cpu hotplug")
> Signed-off-by: Hui Wang <hui.wang@canonical.com>

Thanks, queued for v7.2.

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
