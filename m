Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2109AD39008
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 19:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Wt07sfBGs/BHfDX91pVD+rrCHowy57xHak9H1ypUio=; b=dxFXW6TqHVb5+Q
	Rm4sadR/B3maUBuT/Mo2ldIy5N9BvedU/A4jSGnka8QRHEybop28ZFzjKwo3sLEuEsLewmfPN4EFr
	NpFO6MNPWL2hwiYZYf5iUPSfPm1vCm8hEBE7dHeVyKfk6SGvdPdHKy0fP+0vVul6r45J5qDcJPzt2
	xJWL+dQP5j8xEhJeOnIeQBi0o1o4PQguZXVbOAg4pzh5TYe8V8YRskc4EmxIA9V6JWAun3ptZCmLW
	JHLNUXKIrsaLlpcH0tjQcJ4FzzK6NsOIx+Kcj/twh5eb+OVuGUJnjOBw9nuQ6IV3nQLxo/Cz8PgNb
	Avz42bNThBaC45Wr0gXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg6SP-0000000ATW9-0PTi;
	Wed, 14 Jan 2026 19:23:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg6SH-0000000ATTb-2uE6
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 19:23:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D8FC40AA3;
	Wed, 14 Jan 2026 19:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1686CC4CEF7;
	Wed, 14 Jan 2026 19:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768418576;
	bh=iS35d3PWnlOuU7WvThznMhQLwXxW6GhgS5samZ6duos=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rDQpmmqFkeupsSOl12q1y9zFYHntvwGW9vMtaytYTfItSQZOdu97oWh5reeenfcVg
	 4NYUysNbZdpat832NxXVpNiv4zIcon6aRSzviOG8uqu9tiwmNeDn+T5hDSTvjClFTy
	 MtHY+zdyGx+S73i5bSWYBHCDLWs0R2dieFoiSHJnYaX/4+EJ4CR3/tCtq7M/+S4LUW
	 DIPcG8GoMEf4hsKJduLZhJ3BpXU6wLCxfuiTmL+ssY2+AaLLPKZhOPA1rjv9jG1W7G
	 n112uY6qncIDVvRv8CdsMFjwLs8dQUEK5cNjZqMeL1bwkahjn2edmQ4KM1+doJtLmA
	 98Uh2ANw0vFVg==
Date: Wed, 14 Jan 2026 12:22:54 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>, 
    Guodong Xu <guodong@riscstar.com>
cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
    Yixun Lan <dlan@gentoo.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
    Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
    spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] Documentation: riscv: uabi: Clarify ISA spec version
 for canonical order
In-Reply-To: <20260113-adding-b-dtsi-v1-1-22d6e55d19df@riscstar.com>
Message-ID: <dc610e3e-48f4-5df4-4929-fafeab9c381f@kernel.org>
References: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com> <20260113-adding-b-dtsi-v1-1-22d6e55d19df@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_112257_768738_B17AA1DD 
X-CRM114-Status: UNSURE (   9.17  )
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

On Tue, 13 Jan 2026, Guodong Xu wrote:

> Specify that chapter 27 refers to version 20191213 of the RISC-V ISA
> Unprivileged Architecture. The chapter numbering differs across
> specification versions - for example, in version 20250508, the ISA
> Extension Naming Conventions is chapter 36, not chapter 27.
> 
> Historical versions of the RISC-V specification can be found via Link [1].
> 
> Link: https://riscv.org/specifications/ratified/ [1]
> Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo")
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Conor, want to take this one if you pick up the subsequent patch?  If so,

Acked-by: Paul Walmsley <pjw@kernel.org>


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
