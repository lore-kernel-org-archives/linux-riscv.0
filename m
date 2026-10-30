Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C7F606A31A
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 01:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b1EOzrgy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TP066uO9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=p/rH2kgoPS8mQQVNMpURGzlLXKd765rN9QTpDdN08Zk=; b=b1EOzrgy3Y2begj1ESjnHADt6G
	TXjjeKmD5rmoK+K1C8FzXj7QkaoLFCYGYSsNwIXfSCqqWZjH/Tk79UGj6WmAzWMMcetMlmhvDnEse
	wrw4eAZC4MnoGYVMuWzOe+ondF16w6mT6/02Q3PS+ONbpC4IyoEsoFIk/iyqAcUzzLpa1m2JFynAN
	G2N8PfH6NDKdT96Y0Q0PWuoVMetkPdbJIS7WnBW+mWapS847bCXXelZmpQ+VRD82/9AtyRumMp7wU
	7P4bH0n5x+qljXgtvGB0R5OFTkI4Ksdpoy7ZJRWhjpXQBRmrc6eu1mlc61L8Cqw1G5nMw/GiuE2QE
	MB4gtE7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMbQv-0000000Aboc-1Lk8;
	Fri, 30 Oct 2026 01:29:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMbQt-0000000AboW-0h1V
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 01:29:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 806D041E53;
	Fri, 30 Oct 2026 01:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0981F000C1;
	Fri, 30 Oct 2026 01:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793323765;
	bh=4fJnUETMpqbsY8C/libV4lplZBPSHZVwnBnVZzL/9aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TP066uO9J9qysREH3m7rGEB3uEH6nAC5R5SDdk7oZ3CZaEDX5rpD8ryZizXdXzbMD
	 Py1m8h9x+fDsf5f5Q8GWrmGb2f1vJS5TvGVEzw6kp0m0umLdvolut0gqy+/29gMR1A
	 KR6skYDlcspZcv7iShbuhE2DiTpDoLdMwersx+KVCE4j96akac4VggA1RkB8lHS8E0
	 PuI8yqMusM9kZZGLu28dpA0aplF1B+Muq3kkG5zg4eEWvduRF+GYe0mlFBJmQDWaws
	 ZuYN8jceb2TxY62ubgymGw7sAB963VuHBKEcEeNq/QXmwkO+va0lTYohqPmau0Da1D
	 kPc9Fg/KfrtKg==
Date: Thu, 29 Oct 2026 18:29:24 -0700
From: Drew Fustini <fustini@kernel.org>
To: Kanak Shilledar <kanak.shilledar@axis.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] riscv: dts: thead: th1520: Cleanup with
 dt-check-style
Message-ID: <auPy9Hwg5nXDb9fR@thelio>
References: <20261002-fix-dts-th1520-v1-0-9a8810091d47@axis.com>
 <20261002-fix-dts-th1520-v1-2-9a8810091d47@axis.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002-fix-dts-th1520-v1-2-9a8810091d47@axis.com>
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

On Fri, Oct 02, 2026 at 03:43:34PM +0200, Kanak Shilledar wrote:
> Fix warnings related to "property-order" and "required-blank-lines"
> reported from krzk's recent updates to dt-check-style tool. Leave
> out reordering of the nodes as it creates a very bit diff. After this

I will change this to "very big diff" when applying.

> patch only the following warnings remain which can be fixed in future
> work:
> 
> 	thead/th1520.dtsi:221: [child-name-order] child node 'oscillator' out of name order
> 	thead/th1520.dtsi:227: [child-name-order] child node '32k-oscillator' out of name order
> 	thead/th1520.dtsi:248: [property-name] property name "snps,wr_osr_lmt" is using discouraged style
> 	thead/th1520.dtsi:249: [property-name] property name "snps,rd_osr_lmt" is using discouraged style
> 	thead/th1520.dtsi:253: [child-name-order] child node 'aon' out of name order
> 
> Fix these warnings to make the file more readable and maintainable
> along with that to make it more compliant with the devicetree
> specifications.
> 
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
