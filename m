Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1B7CCF9E3
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 07:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajtKPzhSOJstBb2UUawM/bhlGeOxMB4cQxBcZnqVDUE=; b=LWkd9n9gn2VH6w
	0R4aVLJVqk3DlN6XK4895VBDg1Pszp6grsDQJn1FAoiOoW1/hSRk159ZC2isPKmPNSKwunf/OeBAC
	T5Pic8BrhyTYJJEHuFZ+1NqDvqtRCPQBhJQek95GlULysb/FJO0kFGTKiDTYNR7EO9bsFEp8H4SBi
	PIRpXj1jCfdiPwZzIOY0RX2FIYEYDNPqK6DubNZigJZb4PKie/e2wKphsB0+mv/Ac6jyhwf4M8Q6J
	IJ6Ibnb0cuFkHsT5DA9TigL3IV/y4Y6/AIbLZmetFPzwhCL4GunRp2XsmnvRokmTe48+bT1wUqgu9
	puvXwHUZeMxr0RgzJvaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIj2g-00000006iH3-1UIr;
	Tue, 11 Nov 2025 07:43:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIj2e-00000006iGT-12xM
	for linux-riscv@lists.infradead.org;
	Tue, 11 Nov 2025 07:43:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7076C442BD;
	Tue, 11 Nov 2025 07:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD707C19424;
	Tue, 11 Nov 2025 07:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762847031;
	bh=XIv9q/YAhKheEKBaWPN6EMrhsiNlRb18dfmo/SehtNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gztyeICjwETc+OlGLVdWcmHw2w6UdifgGsZLo6PXsDC3frqxAWKLG2ui+0MXe9Jgp
	 9gD4NgzAazwYh611kkaLMEZVQ0SdlJQCECDP+Nz4O5ZdN+QZT6Szm0vn/T5h1dwy+1
	 2l1+35uXxTlSj/sEm1PGHOO48yZXiWjKwluQmfuv9Yq96uJioWWpI5putwtm69ClJJ
	 xUVhNkZs8UKN4e4y0VifVmNOTpI0uKHcMSRTzC0kbB3+cGpoiQn+8jol58tC/b6CjR
	 FWp+AvU7gNoUqebQghrhPqX51XTm/rHRcOu/3bZUujPzoymaySAzQP/2gPqqvr84uW
	 v3/dUqMptxQKQ==
Date: Tue, 11 Nov 2025 08:43:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: michael.opdenacker@rootcommit.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yangyu Chen <cyy@cyyself.name>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: spacemit: Add OrangePi R2S
 board
Message-ID: <20251111-inquisitive-ambrosial-chicken-861542@kuoka>
References: <20251110220641.1751392-1-michael.opdenacker@rootcommit.com>
 <20251110220641.1751392-2-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251110220641.1751392-2-michael.opdenacker@rootcommit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_234352_304335_B66D3F70 
X-CRM114-Status: UNSURE (   7.93  )
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

On Mon, Nov 10, 2025 at 10:06:48PM +0000, michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> Document the compatible string for the OrangePi R2S board [1], which
> is marketed as using the Ky X1 SoC but is in fact identical to
> the SpacemiT K1 SoC [2].

Different SoC means different compatible. It is very, very unlikely that
different vendor made same die, which would warrant same compatible.
Identical does not mean the same die, so your explanation is not
complete.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
