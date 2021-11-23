Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9983BC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 01:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:
	Subject:Mime-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CsfPJeaiXxIWpmYy8Wkc1mA962y4FChWTqyMp0W58PY=; b=UpZhw+lWh5gJG1
	sDlj3gVCF0m30ZOyArbuckdkDYamWeuKjXh5ZKDtmIOr8wURnecfpvECksmmCfllLscjVV4oOfPKb
	koJY0IW6a5xIMhfp+z3YFuP/wxmes7fulUtNbftS524TUAbeow0mUnvXAtLMIpZpAtVdCq+Fck/45
	W+oe2mobK9/pC1+eCJgWxeeqePH4M8r1e3aXWNPOLK7fexJBVNWrPxxrsdP2MTTwoFhdv4ZTK6OHE
	P27hNtyt6H11v2UCrJBVWe31GB4JIzibcFYtLPTkbGNToFnisGbdjQwTBZs2DrqeL31eB/FC9A700
	dypjfDt0iaKT61eEumoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpKfw-000bDB-Fp; Tue, 23 Nov 2021 01:32:48 +0000
Received: from mail-sender-0.a4lg.com ([2401:2500:203:30b:4000:6bfe:4757:0])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpKft-000bCi-Hx
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 01:32:46 +0000
Message-ID: <2eb53e91-a036-57d7-c7a8-d4bdbe028c4e@irq.a4lg.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1637631164;
 bh=JymPBqHAqNiPgFXBA32L85GHO5ha21+uWF76jQKa/Mg=;
 h=Date:Mime-Version:Subject:To:References:Cc:From:In-Reply-To:
 Content-Type:Content-Transfer-Encoding;
 b=nWzOcHD/KNrV8rytUMmnJc0m0kXhVKos+ferphqtPBfrBAvKJUUKmarOueVPH6cea
 /+yqoK5VgVcVy7iatAepJXVny6ffzod3NlUrKbTgxWWNWnehZNfCyhhcfmULqQcY7u
 Abutna59UucI9Bqe4k5I5ajaDU+duOISSM1ZiX3w=
Date: Tue, 23 Nov 2021 10:32:43 +0900
Mime-Version: 1.0
Subject: Re: [RFC PATCH 1/3] riscv: Correctly print supported extensions
Content-Language: en-US
To: Ben Dooks <ben.dooks@codethink.co.uk>
References: <2d536b65-e6fd-873f-ed34-4aab7cca4771@irq.a4lg.com>
 <49ec8592-a91f-27e9-03ad-2f0a37ad879e@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org
From: Tsukasa OI <research_trasio@irq.a4lg.com>
In-Reply-To: <49ec8592-a91f-27e9-03ad-2f0a37ad879e@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_173245_754336_4FEB5B26 
X-CRM114-Status: UNSURE (   5.60  )
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

On 2021/11/22 21:14, Ben Dooks wrote:
> 
> Maybe add a warn on if there are bits set between 26 and BITS_PER_LONG ?
> 

I think that's not necessary  because riscv_isa[0] and elf_hwcap on the
current parser will not have higher bits.  This commit is just for future-
proofing (not to break anything when we extend feature bits) and adding
warning message now feels a bit ... too much.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
