Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE7CC47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 11:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kpgSSeJaR4VukwXUl2KppUxm/xK4+2qYbtE3HR1A1Bs=; b=Db8nVQmk9Ekv5Y
	UwpEvCd6YeG2Hk6rJ4+F2sD35ShjtpWRfQ+obWSwohOVh+YNDAt5SgXdEThxl2sCHotxjGiYUP/R0
	U1Vl86ChZsNCH3GsVXSTp2uY6qcx7dwZ4J4zen//DjkozPhNuPPuv8sIw2kwecrKqQ3Kz8Su9S/I6
	qvJnnl0WcpK5+KoOusTNIwMc8K8sbYZ/Bb9Dz151SaJv1jqYawCiLmc3ubqL1u70f5aBsz7OfQqzb
	/bXaVYl+ePDFGqGMphy8vxTbcaGEoquVAAveKnwQjgbLjR5M92S5z62S+tNTfan3UthiOykbJSw7z
	+3nM8G8I/2Bmi7OycuBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLLUN-00Dct7-0j;
	Thu, 04 Jan 2024 11:02:15 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLLUJ-00Dcp6-2h
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 11:02:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7888E240005;
	Thu,  4 Jan 2024 11:02:07 +0000 (UTC)
Message-ID: <b402da25-74a7-4e27-8e43-623ae1599d84@ghiti.fr>
Date: Thu, 4 Jan 2024 12:02:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jan 2 (riscv: exittext undef. references)
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <20240102165725.6d18cc50@canb.auug.org.au>
 <8693bf84-b3b5-407b-871f-4add127272ee@infradead.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <8693bf84-b3b5-407b-871f-4add127272ee@infradead.org>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_030212_014324_51AD329A 
X-CRM114-Status: UNSURE (   9.79  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Randy,

On 02/01/2024 18:15, Randy Dunlap wrote:
>
> On 1/1/24 21:57, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20231222:
>>
> on riscv 64-bit:
> (gcc 13.2.0)
>
> riscv64-linux-ld: arch/riscv/kernel/patch.o: in function `.L8':
> patch.c:(.text+0x17e): undefined reference to `__exittext_begin'
> riscv64-linux-ld: patch.c:(.text+0x19c): undefined reference to `__exittext_end'
> riscv64-linux-ld: arch/riscv/kernel/patch.o: in function `.L43':
> patch.c:(.text+0x40a): undefined reference to `__exittext_begin'
> riscv64-linux-ld: arch/riscv/kernel/patch.o: in function `.L0 ':
> patch.c:(.text+0x428): undefined reference to `__exittext_end'
> riscv64-linux-ld: patch.c:(.text+0xae8): undefined reference to `__exittext_begin'
> riscv64-linux-ld: arch/riscv/kernel/patch.o: in function `.L82':
> patch.c:(.text+0xb06): undefined reference to `__exittext_end'
> riscv64-linux-ld: arch/riscv/kernel/patch.o: in function `.L118':
> patch.c:(.text+0xd6e): undefined reference to `__exittext_begin'
> riscv64-linux-ld: patch.c:(.text+0xd8c): undefined reference to `__exittext_end'


This one is already fixed by this patch: 
https://lore.kernel.org/linux-riscv/20231214091926.203439-1-alexghiti@rivosinc.com/

Thanks for the report!

Alex


>
>
> Full randconfig file is attached.
>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
