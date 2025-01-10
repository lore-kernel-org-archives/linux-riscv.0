Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB218E77188
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 11:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Xjos2BYHfjlwxxjN1IKVoMLW+QVR6fEgXioPUa0Z3o=; b=fMTLwy9C5Hscul
	/nyYgvXLlxEMmAzk6DzP6VLtdnBjJtyfKUU0bo/sF2fu0rhB71K5Y73V99kbMu8LwQYEfHpDXWQWp
	olBihhf6w0zAlCcxSqHY1mFbHVamHkjUKyYA6WYlacBv/bBYYz01Dz2NWe5M6HlJxCUK3Kox9OUkf
	W984JYthHhxfbyJAPjqDDSpmIket4yUh9hyfd0scP60Si2Hjprs6EHTNKHiIIF4GQwebNUsBtS4Hu
	i4/aQ8bcmx87tmGPpi1qErMV1JOTDg3tBEgxxQdn99/mSaduYB8h92NxXkgXOhdcRCsJb7ID3b4d/
	MRggNXoGmqIIpoPaV/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWDC2-0000000F7O1-2N5n;
	Fri, 10 Jan 2025 11:28:46 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWDBz-0000000F7Mp-2Kct
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 11:28:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1736508520; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HOsZMRubUSsrTtq3uc4mGcMRc+Gx2Why+/bdWNpqiEgMpsP2Ew0urbMMdTEqP52S1ZsQ2nLTDF+wwmD7PDc0zPNjoUEIdYvoN4yQDOctTBguelQItIrrfPnNEFLk/tV3wvLQlhgwSzamA7jlwZneOXLgSHcHqVW0kupcbjFYNPY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736508520; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XHW0skSs3z9DAkFAXG0k1p6sJGwaFKMr+xHEcjQkUDs=; 
	b=d2Bm5Yn/FZgbUkTijCqIh5zyYFYoe+3pnRLwtsFO08fbrSJiVzNa2L3EecyBMZJC4sg7OhFCuSXRizB7cHFRQ0r02Rq5K6wqqRFUnFjpTOowIJCpNa6p+tTl7UtCbMlTPvPKuzOwx3RXrtok9vOETi9Yzrg6Dhdu44OlysbmsSM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736508520;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=XHW0skSs3z9DAkFAXG0k1p6sJGwaFKMr+xHEcjQkUDs=;
	b=JrDYpn1GZtOtp6yhVlp0v3+kEZdRX1Uhq7D4JEj4kMCnXCWulhoIi2ndiOp7qPsG
	Jp2LHWZO/WNJNhJVnJVGrV/fLbdwPd6VqXCJGXOnKrfTjFdTEtjeJTzTc+oWCUyoykG
	UdQ1342QT0A2P1H2hbTJB61o6D0lGnTTH9GLCynk=
Received: by mx.zohomail.com with SMTPS id 1736508517025335.50238890288267;
	Fri, 10 Jan 2025 03:28:37 -0800 (PST)
Message-ID: <a5f8fd53-2519-441d-8931-31cb9aa2eba0@zohomail.com>
Date: Fri, 10 Jan 2025 19:28:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Troy Mitchell <TroyMitchell988@gmail.com>
References: <20250108-b4-k230-clk-v2-0-27b30a2ca52d@zohomail.com>
 <20250108-b4-k230-clk-v2-1-27b30a2ca52d@zohomail.com>
 <nvfvyy7vajbskfn542lxbvfkxuhasmnyni2uudy3cdybzlddiu@u46fcydzgxsw>
Content-Language: en-US
From: Xukai Wang <kingxukai@zohomail.com>
In-Reply-To: <nvfvyy7vajbskfn542lxbvfkxuhasmnyni2uudy3cdybzlddiu@u46fcydzgxsw>
Feedback-ID: rr0801122709f634376509b2493cc2e97200001096a1de42159b5406b81eaba735507eb9a8d3bb1521ea2f3c:zu08011227444e24f6f4ad2d26b942796c000060cbfad896ead820a72bac243b820dd7b4ea8ff2fada4817c6:rf0801122c7f5264423e9b8c4dfdda28080000ba302a89ede9433c226f7a94c3dcf4cc1662c260caa3fa6865a3335b41cb:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_032843_652061_5ED1EAD3 
X-CRM114-Status: GOOD (  11.46  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 2025/1/9 17:02, Krzysztof Kozlowski wrote:
> On Wed, Jan 08, 2025 at 07:53:07PM +0800, Xukai Wang wrote:
>> +properties:
>> +  compatible:
>> +    const: canaan,k230-clk
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  reg:
>> +    items:
>> +      - description: PLL control registers.
>> +      - description: Sysclk control registers.
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
> 
> If there is going to be any new version, then keep the same order in
> required: as in properties:
> 
> In any case:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
Thank you for the review and your suggestions.

I will ensure that the order of `required:` matches the order in 
`properties:` in any future versions of the patch.

> Best regards,
> Krzysztof
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
