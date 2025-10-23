Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C98CCD1BC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 17:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0cuU6f5kW3+3pkJsbZ8u2jPCDWzbQ6+0nYzAB4gquwA=; b=fwsR9w5e1NxkbC
	aUY7iM62vFuYo+dHU0pMww8Z5d1q6gvrZTa8W1Tr1SH8GEHoz1Zr2E9+lT5wQks0PRoXt8LlWButd
	K5xR2Wdcp8sB0gESKyn5BIw5069qfG1EFhU6DLBvMzuL85lC5x8JwB7Zq5DTmFXChgeCLOcEI1LeK
	mch1fa0u2sWh87ClvrhA/XG1vsoadBHNkbnQgo1kw0ENBPjFY6zWJAKkdk33HFPRuGMjqxPqaQ/Ch
	saIkYhW/clfmva7VXbvZjzZjp9F+S+cfBgH7Mkg+rplbAPoiMoCIUlvM6B3Zc9wzNd9VN2uBEKye/
	KT1o+JRWDBY2vk4yRSig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByrq-000000072mA-2j1z;
	Thu, 23 Oct 2025 17:12:50 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByrm-000000072lW-3OAn
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 17:12:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To; bh=7W172tWYnOiP0Spq5TsqG17r1HaULujtMxJjgWoM/p4=; b=wg16LE0R5t/2DJ1t
	uCkRDv66byP/zaaNr31i4CJXK+iGh7RvO4s5w9KRFocPhbU8cCsC4hzHkPRTpepaMblFrnbgKfwdF
	I63/PH0QHkSAHOQFWIWisR/Ry+hahMPVTkvWhWoG8mb06CgCa3QAGmUlK99KSr9gSYdAJ3R4U7KPp
	jxq8FfA//bfttaPjF9rCTh5+eT4jdKVGvMHrrJ/7bygqIwTClQ5roDscQWRBoJDLZMdEL0JHuw9yQ
	OOCXRFkXtd73hVrNtAIYYEPSFl29YfOZlo0hqj7l5jHkD7V1pz3SoP1xf94Pt/bsrb6NE9A0SK672
	g2Li/zN5FKhMl208lw==;
Received: from [63.135.74.212] (helo=[192.168.1.241])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1vByrj-00BcEE-DE; Thu, 23 Oct 2025 18:12:43 +0100
Message-ID: <f055daad-a2a1-4f2d-ad2a-4f9a2df9b6d2@codethink.co.uk>
Date: Thu, 23 Oct 2025 18:12:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: asm: use .insn for making custom instructioons
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 ajones@ventanamicro.com
References: <20251017165527.701934-1-ben.dooks@codethink.co.uk>
 <alpine.DEB.2.21.2510180543430.39634@angie.orcam.me.uk>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <alpine.DEB.2.21.2510180543430.39634@angie.orcam.me.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_101246_868816_052FEB09 
X-CRM114-Status: UNSURE (   9.77  )
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

On 18/10/2025 05:50, Maciej W. Rozycki wrote:
> On Fri, 17 Oct 2025, Ben Dooks wrote:
> 
>> diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
>> index 8bd2a11382a3..c92f0ff51ffa 100644
>> --- a/arch/riscv/include/asm/asm.h
>> +++ b/arch/riscv/include/asm/asm.h
>> @@ -12,6 +12,12 @@
>>   #define __ASM_STR(x)	#x
>>   #endif
>>   
>> +#ifndef CONFIG_AS_HAS_INSN
>> +#define ASM_INSN(__x) ".4byte " __x
>> +#else
>> +#define ASM_INSN(__x) ".insn " __x
>> +#endif
> 
>   FWIW writing code such that double negation applies to the else clause
> makes conditionals harder to parse by humans (it's !!CONFIG_AS_HAS_INSN
> effectively here).  Would you mind rewriting it as:
> 
> #ifdef CONFIG_AS_HAS_INSN
> #define ASM_INSN(__x) ".insn " __x
> #else
> #define ASM_INSN(__x) ".4byte " __x
> #endif
> 
> or has there been a particular reason you chose the proposed form?

Thanks, no idea why it was this way, fixed for v2.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
