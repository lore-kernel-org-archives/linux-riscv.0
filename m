Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D71C27C53
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 02:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i84qu5HAqCJ5BY64AXPEFCfBN2v74SW5laBnYNGBbBk=; b=Xp0wp8KyaPUvDo
	5JnKklcxILMpYk1wCJBYbkRpWBd7E6PlE2307dX62Zuix9wzyWw8i7avmjm90FVBx1Fr/vMFV12Ad
	upsR4Isnm/E9PaN6cfKT2mM3fhXH2BCzXXrJhbq8s4hHER7D5KDJgYFNVBfSpGecYtEywGK2I3Stw
	m3UOzLG+Jsl86pto23VI/Bkd6DNtkQLW10Eh4XWiZLQqG6AxYac1n98794imUkbWD+lZCbw/DlAe1
	Z1ZkFAM9QwaYrA1cqIxAYTsUrmsRvLFpv28QQOGzyy3kcJu8eAwGH83q5ib9JzLkYBMAFguWbl2Bs
	RXGzb7LFt2qADekojvQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ1rr-00000008ooM-09r2;
	Mon, 17 Jun 2024 02:13:11 +0000
Received: from out203-205-221-209.mail.qq.com ([203.205.221.209])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ1rm-00000008olX-3ovS
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 02:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1718590374; bh=N3YFzKj+aaqqodxPySrFLpDvOg2rcuHAXj9hj0AnAcM=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=iQhJR+ZZs1UGJeUuQ3E38xVEH6LOQF3Ih5Rnj8Wur9ANotrwqlR5dc8nE7hBYB73l
	 HKdfjaTd4RJ0Z/YdeCzU4QaBy+OvrfUTBHXFW0iwVaet6yf4QJ0qUhxerAksuXKBJ4
	 ZDkayAYfUxF6SXHgYgfq+AKVV+RbAEK0STzSj1Ro=
Received: from smtpclient.apple ([2409:8929:843:88d1:dc81:b668:28ec:a360])
	by newxmesmtplogicsvrszb9-1.qq.com (NewEsmtp) with SMTP
	id 30E2CC18; Mon, 17 Jun 2024 10:12:14 +0800
X-QQ-mid: xmsmtpt1718590337t3u07rrvc
Message-ID: <tencent_903C4110ED3E47425CB4989C90CE4615BE07@qq.com>
X-QQ-XMAILINFO: NX3xVHLFGis3TvSqR8RRf9YmiGRHD+fPCx6HP/o8cOfCn5mqEKRy9wZqazzJT5
	 fwmbuKEwnpiSVmTFAqqMONntw9mQapZZvZJtBABjo6hljsomONnCQBU1WZXDCanfxmbBRfqP/tzB
	 GknjakwFrYuVqHDvGtlzH6j1ogpi9wlZEt+5dC0b8tglyy4uxLEhC/hJzvfibqQwRCrUstFiQXJ3
	 KUrFFJ9vcnxZGvznlV9qbzuRDhSbPz50fWqonWRH92cM4RbSz9R9AqRUjrDDnixSi/8GoPEXObjG
	 qFyl3YjFVPotDwkU9YGNUX3aAFjVLH0prjnoyvRaBNL02+l+rF8RxgQKT4G+WF1NM0nmFx9D5lbz
	 i/4VJn9rYegqublviF2K6zuLnXYUrTu3HkLrvaXrpvYkwjwPgu/ls10ewTuUb59rKnMMwCieg7sS
	 9L/Ou+PH542vknAkFSv19ChcTw1bvtrJ0STG/Q30neq3tfTO3/zBuJM/6Pdng9ZXK4FWkyvofPOe
	 +eAn/s6nHcs0cmdDgqN7yJjrnXU04R5vlK6b2qOIiQ8yOAdYtmebtvBEvaFPFb6BaYmFfTtz6E4e
	 C/4SH6NKUu7XYIWDPMy30k65GFHfDsFg2W8l2bipOQeudIPEhFin9wcRsK2hHELQnn2b3GCoSpaO
	 dKbbjlN/vnqPjkIUImFK1m8EkCApMj0bGDr1wEuJMxIbviNgfIq5YuqxJsuX5dhyrPkQ75lIe78+
	 5PVYoU1UczSsuTnSAp3N7DGRZfKH0odGX2jfDXxaf7nUKaxouRjGCyplfFu79OeN2FZDnwimDDNC
	 bEq070X8+TbPDUVof3abWItdXRt4o/d+8Ac7qnB16hIImAwdFm1UKKzJjXiEW+1or6eX7DzzZBjn
	 yosD5UHIarTf2BOgzqVMR7wb+pW9ptZXqM7eNIonGsFeo9ifeN7n8n3oJstlpWwMKF/Ru0lO+6ZE
	 1SfII/Ykqnz8sa04Q6HEcNgu0Sxl3SO6AIrJAkdpTHkV87h5IyVg89ECC/xAtweK0dhTZas1/RUY
	 dJ9jH6A24Iw3gosFE5
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v1 6/9] riscv: add SpacemiT SOC family Kconfig support
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <20240616222636.GA3983622@ofsar>
Date: Mon, 17 Jun 2024 10:12:41 +0800
Cc: linux-riscv@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Anup Patel <anup.patel@wdc.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-OQ-MSGID: <0E6182E4-714B-4FE9-823F-955C40CB90A0@cyyself.name>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <tencent_D935633C42BE1A7BF8C80553B5571C737009@qq.com>
 <20240616222636.GA3983622@ofsar>
To: Yixun Lan <dlan@gentoo.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_191307_570850_E5903995 
X-CRM114-Status: GOOD (  12.44  )
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


> On Jun 17, 2024, at 06:26, Yixun Lan <dlan@gentoo.org> wrote:
> 
> On 01:20 Mon 17 Jun     , Yangyu Chen wrote:
>> The first SoC in the SpacemiT series is K1, which contains 8 RISC-V
>> cores with RISC-V Vector v1.0 support.
>> 
>> Link: https://www.spacemit.com/en/spacemit-key-stone-2/
>> 
>> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
>> ---
>> arch/riscv/Kconfig.socs | 5 +++++
>> 1 file changed, 5 insertions(+)
>> 
>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>> index f51bb24bc84c..8a5775586845 100644
>> --- a/arch/riscv/Kconfig.socs
>> +++ b/arch/riscv/Kconfig.socs
>> @@ -24,6 +24,11 @@ config ARCH_SOPHGO
>> help
>>  This enables support for Sophgo SoC platform hardware.
>> 
>> +config ARCH_SPACEMIT
>> + bool "Sophgo SoCs"
>              ~~~~~ is this a copy & paste typo?

Yes. I will fix them soon.

>> + help
>> +  This enables support for SpacemiT SoC platform hardware.
>> +
>> config ARCH_STARFIVE
>> def_bool SOC_STARFIVE
>> 
>> -- 
>> 2.45.1
>> 
> 
> -- 
> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
