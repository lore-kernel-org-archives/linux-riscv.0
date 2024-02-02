Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3695C4828E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 22:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmK60dP4LQ+6nB1po2L4w+v0+n8ZOH1SuDfDZK79EX4=; b=aYqPNSdj+r3gd6
	S2mVf/8y1t/F7/oxrZehgD7iVCQN97MqH486uK6jNnmRbIGd+MDFspzZpAU9QgGdY+pECsnmNcLVq
	WHb3VWlftiQOUdYWJc5VraZzPWO+VmF1WU6UavmzVi2HPnxgKBs+8KnrG946QVhJopfyyyr7yYxLZ
	DpTjaHfSwc+WWn1l0oED7Aaj/xmiLLBP96abJqGlhnrYIrCRlTXQIza5EjwLUhQdRy4bO0wAGmpRk
	M5PGLSaxcv5jB7xCg9wiloWTjb3JfC/EoGr5d9CHKxn8ZCUjCBJxJHTtpKDi5ZWx1DHIUs1qm21fQ
	ZOET/jdPbBNjpu8EHb1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW2M0-0000000DiVC-0J0r;
	Fri, 02 Feb 2024 22:49:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW2Lx-0000000DiUn-3hFK
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 22:49:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2A436CE2236;
	Fri,  2 Feb 2024 22:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14372C433F1;
	Fri,  2 Feb 2024 22:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706914181;
	bh=XeSblRB42/YZlnp1E9dabRYvXz9IdEs8lmOUxmmzrv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=boSTt5ZfXfEhnNFa36YvwU7Nzq7lj32vsfw5RxaSyX34RDQ9ifG4x0K2YrUBqBex4
	 +NqlnDTi0OBRs9rYZu+I5xznmrg3ttkn/6WJVN9BI2iTaI+ITK91rSLnlggH8sC1mQ
	 ePWg/G8jdeEDP+LfGyRfX9AKc2SdJ5LE7PiIXR4fXdIAkK7PkuMaxJ5R3DkGGyD+Vf
	 mgMzTXzk5Vf8ZhGaoIShF40ohMmw+W5YmIBlAksq4GrZj3hMd7sWybiX/sS4OdYgYS
	 QwEV3MIYJ0VfBSpzzWgpcFZT98JLsBeYf/hw7qyTl5AL+LiHjZMnuKGVVP0FAlSO0Y
	 3zQG5wrTVBybA==
Date: Fri, 2 Feb 2024 14:49:39 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: lib: Introduce has_fast_misaligned_access
 function
Message-ID: <20240202224939.GA2055@sol.localdomain>
References: <20240201-disable_misaligned_probe_config-v2-0-77c368bed7b2@rivosinc.com>
 <20240201-disable_misaligned_probe_config-v2-1-77c368bed7b2@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240201-disable_misaligned_probe_config-v2-1-77c368bed7b2@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_144946_121342_B44A05B4 
X-CRM114-Status: UNSURE (   6.58  )
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

On Thu, Feb 01, 2024 at 03:30:45PM -0800, Charlie Jenkins wrote:
> -	if (((unsigned long)buff & OFFSET_MASK) == 0)
> +	if (has_fast_misaligned_accesses() || (((unsigned long)buff & OFFSET_MASK) == 0b101))
>  		return do_csum_no_alignment(buff, len);

Why did the 0 change into 0b101?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
