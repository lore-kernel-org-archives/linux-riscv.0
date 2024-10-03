Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28879CF8571
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 09:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0RJZfyWG4pPW6hwahLlbVMnatEw8FV/FleR7W/+a8ro=; b=PUwOEQV3wzD8ZO
	PM08mwV6qcapKNZQsMOkY5BqF4eLdR+OyqmzcYaqxiNdpa94A6XuUgVUHqJEcq/970mcVD2klCKNs
	80c2HwN9sDvEuizhcZS9gT4IT/mvoBFcIsIoX3Tm/CfhvNVEM/JiZlhatn99PDqZ0P6okr9PVMDrL
	j+niB4K9eDAD+/1KYLXUNmvPl8UmIG0cs+lIhbzKtuyHhxrxVvCAEGrx6NK8DgZxIUXGSaKILiBO1
	epCcg4CoX4biLLJH9BKOlT8WwbCd2/9lMhJmrQw7YyEc2EHoXr/NfnOffDNTU1+6ojp7WBNELMJbu
	CVD5jAtg8RvJRUkcSfxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swIbx-00000008jZs-0R4y;
	Thu, 03 Oct 2024 09:59:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swIW5-00000008iqJ-2wMH
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 09:53:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8B2CDA43636;
	Thu,  3 Oct 2024 09:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A0EC4CEC5;
	Thu,  3 Oct 2024 09:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727949180;
	bh=r60vZJZ6L6N7kj/zd/wI6zNB6uYbLdjKz0S6lEoaP5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bkZZ4uVgWjc0N+61OfaOJSF5I8pztDIEd+CDcaXuqdEAnpBqaVh6K7Mw4Z5zJSnwS
	 Gr42seg4MFQin24dekGDSosnp4J3fztfBTlCxLMdtZ7MPcBlrEKJN+SquLS0jC9ChI
	 /FbvltcJ/V1wwdZevbZzFDqHJ0uF6suMGGD8gky030TGu0S3P4gBkPba8m791MKZil
	 BkLmD73tyZUOhWgFUkioXaEwb/MuTJJbEuXAI+b2cgg6fURIxveDRLPrl649ydxPES
	 jpy741S3hqtLWiE/0nnHg3FJTn6gxf7zzqpPi0Gn1/aw7n30g6djUiyP2yXn1PhbSG
	 tjpra4c3WbczQ==
Date: Thu, 3 Oct 2024 11:52:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andy Chiu <andybnac@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v1 5/5] dt-bindings: riscv: document vector crypto
 requirements
Message-ID: <kduc5r2nisteqax3zbxkja6qevdi2pdu6nk4sqabkap7nxtmok@sxq7yhptrvqc>
References: <20241002-defeat-pavestone-73d712895f0b@spud>
 <20241002-sincerity-urgent-acdb0e8d8a66@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241002-sincerity-urgent-acdb0e8d8a66@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_025301_828212_36A76671 
X-CRM114-Status: UNSURE (   9.13  )
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

On Wed, Oct 02, 2024 at 05:10:58PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Section 35.2. Extensions Overview of [1] says:
> | The Zvknhb and Zvbc Vector Crypto Extensions --and accordingly the composite extensions Zvkn and
> | Zvks-- (sic) require a Zve64x base, or application ("V") base Vector Extension.
> | All of the other Vector Crypto Extensions can be built on any embedded (Zve*) or application ("V") base
> | Vector Extension
> 
> Apply these rules in the binding, so that invalid combinations can be
> avoided.
> 
> Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-isa-release-698e64a-2024-09-09 [1]
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
