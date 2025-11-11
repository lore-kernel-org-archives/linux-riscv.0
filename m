Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27CFCCF9E3
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 11:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6xsscExj9XMzxv6LR9yeodPwl8KMB77IdNQSODoCBFM=; b=WNA7FYMfYfmo9m
	arBVX8akib9M/MGZjtUkeBXUf8OlRERk8+LGn6NrzRuywPl64JG3lID4b8PPTf0vh3o3fc5e9OkHC
	B99pUthVeRKrbmKUFKH02/gkX+gxmpU/jkQ2qH1RoF6w0SHo3lnAjHnspUcRN6HSC5J0LX5G/NfqR
	5iM/cz9kalN7TGM2JySdu4zNeB5z0Emsm++2hzmtHDolVoAc6f7nICECwEzlNJV2jak6AatPJWd2E
	EXfyS5rO7niK/EQ1DrZH8mvrHIiri4Gs6Ev4U+IptCNspl4ejNKEeTEvqNMQ/maq4xhKgHzhANjWi
	5fmfVAIraanAwsTIqtWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImks-00000007697-0sWc;
	Tue, 11 Nov 2025 11:41:46 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImkp-00000007686-1tb6
	for linux-riscv@lists.infradead.org;
	Tue, 11 Nov 2025 11:41:44 +0000
Received: from localhost (unknown [116.232.48.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id EF2F1340F5F;
	Tue, 11 Nov 2025 11:41:40 +0000 (UTC)
Date: Tue, 11 Nov 2025 19:41:33 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: spacemit: Add OrangePi R2S
 board
Message-ID: <20251111114133-GYA1677599@gentoo.org>
References: <20251110220641.1751392-1-michael.opdenacker@rootcommit.com>
 <20251110220641.1751392-2-michael.opdenacker@rootcommit.com>
 <20251111-inquisitive-ambrosial-chicken-861542@kuoka>
 <20251111101149-GYE1651402@gentoo.org>
 <af7bd4ab-38dd-4a5a-93e5-f457ae3460db@kernel.org>
 <1d469324-84c8-4b5d-ae68-d77e3c822656@rootcommit.com>
 <2eb5ea0b-d071-4e17-abc8-7db5c78919f2@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2eb5ea0b-d071-4e17-abc8-7db5c78919f2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_034143_519890_E2207F11 
X-CRM114-Status: GOOD (  22.84  )
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

Hi All,

On 11:34 Tue 11 Nov     , Krzysztof Kozlowski wrote:
> On 11/11/2025 11:29, Michael Opdenacker wrote:
> > Greetings
> > 
> > Thanks one more time for the reviews!
> > 
> > On 11/11/25 11:13, Krzysztof Kozlowski wrote:
> >> On 11/11/2025 11:11, Yixun Lan wrote:
> >>> Hi Krzysztof,
> >>>
> >>> On 08:43 Tue 11 Nov     , Krzysztof Kozlowski wrote:
> >>>> On Mon, Nov 10, 2025 at 10:06:48PM +0000, michael.opdenacker@rootcommit.com wrote:
> >>>>> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> >>>>>
> >>>>> Document the compatible string for the OrangePi R2S board [1], which
> >>>>> is marketed as using the Ky X1 SoC but is in fact identical to
> >>> Maybe, just say it "same" to clarify the ambiguity?
> >> What is exactly "same"? Same die? Or same blocks/pieces? Whichever you
> >> choose please make it very explicit.
> > 
> > Maybe Troy Mitchell from Spacemit can shed light on this question.
> > 
> > Anyway, I could use the same wording as in this commit introducing 
> > "OrangePi RV2":
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch?id=bab8dea259100a99e047fd11a48940b229d30031
> > 
> > "The board is described as using the Ky X1 SoC, which, based on 
> > available downstream sources and testing, appears to be identical or 
> > very closely related to the SpacemiT K1 SoC".
sorry for bringing confusion in previous series, we had no further discussion on this..

> > 
> > What do you think?
> 
> This clearly suggests they are not identical thus you should have also
> dedicated compatible. Let me then precise, I thought it is obvious, that
> except writing it more detailed in commit msg, you also need proper
> binding expressing this. If this is not the same die and they look
> compatible, then usually it means you need a compatible.
> 

to be explicit, the Xy X1 has same die, same packaging as SpacemiT K1,
so we should not introduce new compatible in the SoC level, but a new
board compatible in patch [1/2] is ok to me

I hope this clarify this issue..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
