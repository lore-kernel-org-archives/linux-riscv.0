Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9886ECCF9E5
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Oct 2025 21:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dbLYPDaYmjDkLDo60FhrQNWwj4KKokx2B6V/JFJgGA4=; b=ZFKYlqf4lCT1FA
	HamOeeuaBAV1ftZAnEP7gZET4LcnmaS2ThCHUpwW91p1V7Y6j9v1wDUwH42voj2QL7E+9dcRFZ/GK
	EvCUDcwex71LM4q1UEyoeG12V5VoA+cDGwrg7nSioCY/yj0fcaDHs2vJ48S8ho+gapxn3l/lStH/x
	FO+wcOhMIfeUYHJUVxsefZq8tHAZyHvYUrTa6Dc7WLUGcWKYV076D5gTfTRDrR+L1EoqTSqttX8wM
	LzO/L6JbDtBcMYqb1phGCObosdVxJzWyFmGzrYVxOuKuXl9DVUmRP4V4LtoU1T7b/elcp1X1ANcKm
	b+ZMg7TziDHwe9xRE3oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD8Vu-0000000Cm4p-3wnS;
	Sun, 26 Oct 2025 21:42:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD8Vu-0000000Cm4c-18Z4
	for linux-riscv@lists.infradead.org;
	Sun, 26 Oct 2025 21:42:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE8526022F;
	Sun, 26 Oct 2025 21:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92E4C4CEE7;
	Sun, 26 Oct 2025 21:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761514977;
	bh=yYlZvv2N8vUzR/Uap+bbPhqk7533omyjDNKLYfAZqlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N17r29EVziQUBIJC02k5cMN19nwO/L5GQynVwaysjxva8FJnqG6WMwsLquQbLlFuW
	 tk78PyHq8yGrfPqCX3q4TwFgAzQ6dNTu1Kiayy/1fEOm3+wvsdkocsjmYI5CDgnfuJ
	 SrDrgAQqc/BScvz3BHlBMcHnqviKz21L6kpMpv6C2VW/oSurV50FwQHA03SNqcXly8
	 XpKXIH/0u60nN2n50RjJlcj2Hkw1TAVuQiNDww+JWDhXe7c5kkjKdBX+WLT4K3Ndl0
	 +u9EfHnN2GZxdPwI8HpnVF02uWHou2BBLlXZe8U8xRn4z0n9Glvdoc+k7rYCCKnKsA
	 caKWNWyge1g4A==
Date: Sun, 26 Oct 2025 16:42:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Chen Wang <unicorn_wang@outlook.com>, sophgo@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Conor Dooley <conor@kernel.org>, linux-serial@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v3 06/13] dt-bindings: interrupt-controller: Add Anlogic
 DR1V90 ACLINT SSWI
Message-ID: <176151497232.2988011.13908967550515331584.robh@kernel.org>
References: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
 <20251021-dr1v90-basic-dt-v3-6-5478db4f664a@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251021-dr1v90-basic-dt-v3-6-5478db4f664a@pigmoral.tech>
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


On Tue, 21 Oct 2025 17:41:41 +0800, Junhui Liu wrote:
> Add SSWI support for Anlogic DR1V90 SoC, which uses Nuclei UX900 with a
> TIMER unit compliant with the ACLINT specification.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  .../bindings/interrupt-controller/thead,c900-aclint-sswi.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
