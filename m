Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9F6C001E0
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 00:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/YV/j/Scg8wx8Hb2v0NsytsFP9rf8kH/T9Ev9fnefLA=; b=HR/ZbyvWLg9qvj
	w8vvnh8UtlSAlqJoZNRFR9V9eOMyA2isYaYypINZ/2ArAscWgKaBdRk+cKIXwPn9SVb4v0osNBJOU
	dswCvacd1+ATnf7sZ7o9wPfUOy5sh3emapaCofzRWFV+D0b/Dz2p8tlWXQhAcMVVn1WI5Tln6zzJg
	DdOG/SnQ0RJd3THCxVCR6skmb0SClIkVIlA1WQF/F76TCMlSy1MJrBYDEsdG0X7GcIp0cA7UccAPN
	CDmYo5YEbMNqabRcSezz//O80r+09/jfSIk1DsCUOI7E+bw7hDm1qHYZXvSmEmhJ0cVKHM2HIlL17
	wMw4Ql6BB1ZoKPKQsqfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOSQH-008mvC-2E;
	Wed, 26 Jul 2023 00:30:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOSQF-008mti-1Y
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 00:30:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D049F619D7;
	Wed, 26 Jul 2023 00:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A5BC433C8;
	Wed, 26 Jul 2023 00:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690331430;
	bh=4szL2Sg9ae4unN4oGxbDpSM5eGaBOgEsadtOIA9oSTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X5s/DZCrImd9xEqYfGI9efZ0UQeuoXJMqNqVH/HD+lbalPV6cihIQJoCvOmYW/H2G
	 PVfCA+5PorNlLcBuFLJQ0axNoUy0GNeYoGtV0EHvbC2RilvuPcauznuQZJGWTCj8cV
	 SUdmfNWu2kW9bxsJmk6UTRr4HhUxtyb51D+aNQydojwKNTqphBdLt7j+gIUo058m9K
	 KXMsRe5ZM0yMlCK1hC6zuJOR50TH+pbCg+eol7YGK9TN3eqSVtAmtiexbYnV9EjXbh
	 ELcy67AQrgiCZbT6uPdJGW0uFUbldpRMtSoNahJlfIi14u+8wwBJgBW9XOhj46S8Q7
	 zJWoNLMfmAPKg==
Date: Wed, 26 Jul 2023 08:18:50 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Drew Fustini <dfustini@baylibre.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Jason Kridner <jkridner@beagleboard.org>
Subject: Re: [PATCH v2 3/3] MAINTAINERS: add reviewer for T-Head RISC-V SoC
 support
Message-ID: <ZMBmalZwaRCiy2BG@xhacker>
References: <20230722-upstream-beaglev-ahead-dts-v2-0-a470ab8fe806@baylibre.com>
 <20230722-upstream-beaglev-ahead-dts-v2-3-a470ab8fe806@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230722-upstream-beaglev-ahead-dts-v2-3-a470ab8fe806@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_173035_562472_DE4D60EA 
X-CRM114-Status: GOOD (  15.98  )
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

On Mon, Jul 24, 2023 at 10:20:40AM -0700, Drew Fustini wrote:
> I will maintain support for the TH1520-based BeagleV Ahead board so
> adding myself as a reviewer for T-Head SoC patches.

Hi Drew,

Thanks for your interest in maintaining the SoC support part. However,
maintainership involves active reviewing and maintaining the whole SoC
support part and not just specific board part, although currently, the
SoC support in mainline is minimal. I'd like to see your patch
reviewing, testing and so on.

Thanks
> 
> Acked-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d516295978a4..eaec3333f2ed 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18326,6 +18326,7 @@ RISC-V THEAD SoC SUPPORT
>  M:	Jisheng Zhang <jszhang@kernel.org>
>  M:	Guo Ren <guoren@kernel.org>
>  M:	Fu Wei <wefu@redhat.com>
> +R:	Drew Fustini <dfustini@baylibre.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  F:	arch/riscv/boot/dts/thead/
> 
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
