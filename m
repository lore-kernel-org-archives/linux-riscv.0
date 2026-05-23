Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE882CD4F54
	for <linux-riscv@archiver.kernel.org>; Sat, 23 May 2026 07:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eNdcs8FIb0ZB8Kyr894kv1voY23nvXVAXxa9DXA74o0=; b=Uzk/b0coJb3h0b
	RUIFYbr0gw8dxOoK1MMkv7B0cPEM3sGQb2xaW0fJTGkiYZu5SZVCErPVtkUyvv7G/rs5UIQTIaMpe
	/NwytLYl2BzFFvJSKeZwpgUV0w2rnVlAmzQXn1HaAY1NrnQyMRzfGkubS5Zrt3aJ3nU7k+D10dZMg
	UJ2Rv7a4F8MZYyR95IVfx51a2VSaoqwJC7BC6MrqePoA91wVxgKWo/45PSx75QtNLYLRtCpOGJmnV
	1JLdQv9wHUFm0W2JQhgs7sJFUjBSRGwJJV26M5+vL/C+tbVnONgZ7bIHs5olmF3DfA6jTxH+zpXm2
	vpRo3YYwkT9aAYsKccSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQgLj-0000000Cpoi-2DqY;
	Sat, 23 May 2026 07:00:43 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQgLg-0000000CpoB-2GVx
	for linux-riscv@lists.infradead.org;
	Sat, 23 May 2026 07:00:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1779519629; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M34utHEyQKZAMeobS3B35LkIVRP25eNflVynpQ/IfP0sjWB2KDqJVg2viFgdEkprc8iLYc0R2MPi7JTfC2JbtNv7I8VtS5/Dy5M8XKjo17modpyVu76h7GIQDQcQsIp1cGjbEwl9pp1YSRNqF1v9AVmq2pID2dJGGuj1NT4pA2k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779519629; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yeWxZcjLCzcDxdHmfowF+eUIDI+tNtFTvg63nH+kw1Q=; 
	b=BXynZf7gWW8KbKvxcBGiqpK6MGGvy8LWbFWB30Pc9QndJ3Iyy6wI+JtZuHuU+vI3dh6JjuyNi1qIxQP3XawomyF/ofEWz2GCdjyCel0irsbMCWdleRu8J1ALgHbHZ13nRLGx9zou4ojBeghEiuzmX7T0UrtGelGXpfh0qM3yu7o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779519629;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=yeWxZcjLCzcDxdHmfowF+eUIDI+tNtFTvg63nH+kw1Q=;
	b=KdnDz4QtS88d7j9j2CMmRe5JttX/njeKEpc8QpMsLGFzoPUjf7YQfAt17GR9628f
	Py3fhlA4M1ZsOcvLFynRM4vpVHn7RAxPudAAerNHP8LDI9Jl35U9w7AQ3hVEJMOhWBh
	reVO7UJ4c2FzYTeIGs2KZOc1LwfHb9P/+kkHCpr0=
Received: by mx.zohomail.com with SMTPS id 1779519625819699.4345382578165;
	Sat, 23 May 2026 00:00:25 -0700 (PDT)
Message-ID: <1f74efd2-444f-4330-a1e8-62f75e85ecfa@zohomail.com>
Date: Sat, 23 May 2026 15:00:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: canaan: k230: Fix sparse warnings reported by LKP
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260522-eligible-vivacious-3ce9bc30dd53@wendy>
 <dee4605ca30f9bbd55ccb4fcce9590ceee1fa10b.1779453284.git.kingxukai@zohomail.com>
 <20260522-removed-lyricism-7c879febc3b3@spud>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <20260522-removed-lyricism-7c879febc3b3@spud>
Feedback-ID: zu080112270f3b225d59c968fc3f003e8e0000419f44ed1e2083cdf9e0d7358856c5c545f8380336d5a2d4bc:ZohoMail
X-Zoho-CM-AccountID: 2ee5dd3c83366259b2ba1e9826250ffebed1ef2dd213857d649ad25aba73b429
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_000040_638866_3C76A2DC 
X-CRM114-Status: UNSURE (   5.88  )
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


On 2026/5/23 04:39, Conor Dooley wrote:
> On Fri, May 22, 2026 at 08:59:12PM +0800, Xukai Wang wrote:
>> Fix all sparse warnings detected during LKP randconfig testing:
>> - Replace plain integer 0 with NULL.
>> - Add static modifier to k230_plls and k230_pll_divs.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202605220724.j4ZeM3KI-lkp@intel.com/
>> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> Forgot to reply earlier, but I went and squashed this in.
Thanks Conor!

-- 
Best regards,
Xukai Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
