Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EE3C636D4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 09:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V3BKuih3pJGVimQnKhnsyQCCdA6h4UkuSwv26XDnL24=; b=p6bHnBB6ojrzof
	UZ+/crRPWuPc6HiN4FYF/Kf6aoPT6QWRVJM0TYCZzcfY80i/NFlqGCPWzKkN34StCcyDJEH/XEEzA
	xG5i4hlfQUC0RnoLM05xIZI1c2f+wKqrB/9nrnv8NCZJ6HUMf9ve4ykYcsAOsyfBf9iysHdip20pK
	ur204pUmRd+BsnP46bjN/LYGPVasEGh/rxo7mCyb3QgvKbZ45+i+qfjkIQ91H9t3PBcw9Alg40ZnA
	kwufR0Ji2eFv8dUqc/03kZPDrWAm2V+TtvQ/aFYt0Ly2qKnO0l4fMFtR7qW0VKD/SdjJM8JQMfw69
	cB78VDAGcyVX69mPQptA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ3To-000tWx-Oq; Thu, 09 Feb 2023 09:44:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ3Tn-000tWc-HW
	for linux-riscv@bombadil.infradead.org; Thu, 09 Feb 2023 09:44:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cs5CY24qznMaUBdEnHttjfjL44GfTaGLejp922D6Tt4=; b=N5ASJ9pG++SCXsQtFlO3dE97JK
	A0PimZ/2xAji4SVZHlNAwNByp/CROU9f4+AUb8XsCVxtnS4tsXiGZHVjX7uKfR3IVaUNFSUrp2KLY
	9XnPEfzDugoaD3uQtrwH5EEDzaOMhIJ6Dn+3o705NIHsjchF1VPyOKjKamzpuxwUPCsL1GZxLST4A
	Ax+bSGZSjxJ6s8C0iOMr/yvcTQTURRHwlF4ojXj397yBvWPTL3SKdYCiPH0O/JtqXWCDRGHKa5Nch
	wew8bnLT7OgKgE/eVnKiX3cJY4hAJJCR5D8g2/IHkWV1ZZJrQA1VjAO3dCk/Zbdk8vVItFf3KUKUD
	stlqOyLA==;
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38] helo=formenos.hmeau.com)
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ3Th-0024kW-U6
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 09:44:33 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pQ3So-009E6l-Lt; Thu, 09 Feb 2023 17:43:35 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 09 Feb 2023 17:43:34 +0800
Date: Thu, 9 Feb 2023 17:43:34 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: JiaJie Ho <jiajie.ho@starfivetech.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 4/4] crypto: starfive - Add hash and HMAC support
Message-ID: <Y+TARjfzt2FMG6oJ@gondor.apana.org.au>
References: <20230130154242.112613-1-jiajie.ho@starfivetech.com>
 <20230130154242.112613-5-jiajie.ho@starfivetech.com>
 <Y+S5fBjZQZli9nBg@gondor.apana.org.au>
 <88a62a7a11814d629e2198583a0349b6@EXMBX168.cuchost.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88a62a7a11814d629e2198583a0349b6@EXMBX168.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_094430_445616_F43A57F9 
X-CRM114-Status: UNSURE (   6.24  )
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

On Thu, Feb 09, 2023 at 09:33:06AM +0000, JiaJie Ho wrote:
>
> The DMA can only support 32-bit addressing.
> So, I am copying everything in case kernel allocated memory region >32-bit for a user app.

Does your hardware support scatter-and-gather? If so you should
at least allocate individual pages rather than one contiguous buffer.

Then you can allocate them on-demand rather than before-hand.

It would also be nice to not do the copy if the input you were
given was in low memory (and contiguous if your hardware doesn't
do SG).

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
