Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77A6C46CC5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 16:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0V+EMsqqFpnEjzYQVoUB3Qk04Ha6fnBjubpbwI358Y8=; b=yp3Kt1hQUCE0TK
	nXTN1aACDnUvPZ1JyuyToc8/bjpc6ny8JS48O0nCeK0xj02RX9xupbI1m3rC3GKTnPoEhL+bedIHj
	Bt2/6FTWO/SazS3cRG1DeQsVTymcxWLhWx4OrIgRNpdk3fKlpOlFuiU7UaknbwzQzozCEnHV/sjAF
	dcWllzlraNgxWPHKGmQQR2fDglBSO6graEsE+OhMkM+Sl1seAJsvx+gndaEqh+ZCExdcKlWhsKGUu
	Sh9jEj4eswCzHmND/dK1IbotE/NWfR7RfmC93yonN7DJpF5R7XrCgO9pLEGowxiaG8Vx9YDBjfpSx
	e8QJit0eyIz0+tKO6rpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCipc-005fDS-0d;
	Mon, 11 Dec 2023 16:08:32 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rCipZ-005fBl-02;
	Mon, 11 Dec 2023 16:08:29 +0000
Date: Mon, 11 Dec 2023 08:08:28 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, linux-arch@vger.kernel.org
Subject: Re: [RFC PATCH 07/12] powerpc: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Message-ID: <ZXcz/Bi6xP1CYK60@infradead.org>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-8-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231208055501.2916202-8-samuel.holland@sifive.com>
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

On Thu, Dec 07, 2023 at 09:54:37PM -0800, Samuel Holland wrote:
> PowerPC provides an equivalent to the common kernel-mode FPU API, but in
> a different header and using different function names. The PowerPC API
> also requires a non-preemptible context. Add a wrapper header, and
> export the CFLAGS adjustments.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
