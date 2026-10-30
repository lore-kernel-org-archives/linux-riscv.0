Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899D0606A31A
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 01:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SPZ7VzVj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lafy3Bx/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bAPo4DuYE70nKaHnzS10CH/dyReyp/ABqHfUOIfpre8=; b=SPZ7VzVjuDc7PElQi2MvJJ3rz8
	j8hDYFb3/3Xc12GTuJMAjqt+R0mhG2GrEHKX32odI9XZi+uIpbAIBEwKS4EsqjZnU/tb2dIrEg+4c
	bcdZvVhfDDlAXQpwRICGDR19P6lQVAW+jgUxdhGCPQB4uTB83ODRQan8oGhsGTM0pB90khX2tppha
	llZf5F+tkn00iORbJkuP8WZpmjv8Acor2O2pqHgvurueFj5EvwokjNfM+quVuXhNcVXMvo78zMsvZ
	2AxBr7S4Mn+pvvhv9+Ovv9KM0aFja+A8HB60zY9ksn9kHaGUg644PO8whylSxC31KPZrNWdVH0+1p
	qebt5BhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMbPT-0000000AbjZ-2onJ;
	Fri, 30 Oct 2026 01:27:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMbPS-0000000AbjS-2IHv
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 01:27:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 96272600E4;
	Fri, 30 Oct 2026 01:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 111FD1F000C1;
	Fri, 30 Oct 2026 01:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793323675;
	bh=FUuEMEp4Sq4+y9YNfcK1/A/G/PTtLzDOc0DPIC0ZA9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lafy3Bx/zY7kgVvrbo4ZtiaAI4XfHukxMcompVEw2fX6IOYTpGmmd3NKbK2POBab1
	 XjO7VLTzkiQOMJQWc/L0Qe9NwhGrBVjHUIAEl3Nwd2EquWVQ0FKcvUz0CqO7GRH0We
	 z6aNmIHHqWzTIl0WSBD1BeKmXKXV1umK0iiVPEA7Dzh5jvJn6Q4PVtwNCBYHMs3Tw/
	 y4PD/qlqZrRWcVtqDe1Nky7ZA6vsVEo2LFajwDrIetgPH3mGblMNIqKr2lDXop0bpE
	 aUq7PN1FDVsu3XQzp3QW0m+g9zV1vRyZiZSPlofbPV0kmY8ywmUQWrEGCJYLaGTkNX
	 R1qt3B05a2Oaw==
Date: Thu, 29 Oct 2026 18:27:53 -0700
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
Subject: Re: [PATCH 1/4] riscv: dts: thead: beaglev-ahead: Cleanup with
 dt-check-style
Message-ID: <auPymWTegG8Gj1bt@thelio>
References: <20261002-fix-dts-th1520-v1-0-9a8810091d47@axis.com>
 <20261002-fix-dts-th1520-v1-1-9a8810091d47@axis.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002-fix-dts-th1520-v1-1-9a8810091d47@axis.com>
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

On Fri, Oct 02, 2026 at 03:43:33PM +0200, Kanak Shilledar wrote:
> A lot of warnings were thrown via krzk's updates to the dt-check-style
> tool. These were observed when running the tool in strict mode. Most
> of the issues were related to missing blank lines and out of order
> properties and nodes such as:
> 
> 	thead/th1520-beaglev-ahead.dts:43: [child-name-order] child node 'leds' out of name order
> 	thead/th1520-beaglev-ahead.dts:46: [property-order] property 'compatible' out of canonical order (should sort before 'pinctrl-0')
> 	thead/th1520-beaglev-ahead.dts:79: [child-name-order] child node 'hdmi-connector' out of name order
> 	thead/th1520-beaglev-ahead.dts:115: [required-blank-lines] "status" must be preceded by a blank line
> 	[...]
> 
> Fix these warnings to make the file more readable and maintainable
> along with that to make it more compliant with the devicetree
> specifications.
> 
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> ---
>  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 119 +++++++++++----------
>  1 file changed, 62 insertions(+), 57 deletions(-)

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
