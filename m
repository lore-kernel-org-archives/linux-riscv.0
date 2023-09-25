Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36133CE7A81
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 10:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCSNxMSDhfXlFcVk26jCemwvWz99FSE6j0YZIKLyccg=; b=XavuY/0ieHvH8P
	YjGKRG7efIrbmSgAOxTPOa4VRrI74b0xtWnpAa9rz444qBfBvdW+FqT5Af5oF4ZOFyThL4z4FXYEl
	i8pwqjy6pBcyH2Jon/gYlYrKuiy5IGJ4rDAGDcZf1nt9lRUNyvEOZ4BcgGS1DxEASMdQGAJWnK2Mi
	WdqtlUcTcMdU8iWn2Wf1UCgI/+B3iD9PMKBcTAwTaC47bzcX7Cjy3leQqwmCDRS9BiH/++XYuZ7dc
	yjaSvFyCR7MNSJJgrbLlQ0RyvXr/WbATJ6BewA3YThXG39RJAOeibM194wNvddRZM3y0p7BZlb+yE
	J0SMxfI4sjYP+Azwav4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkiVU-00DwFQ-2F;
	Mon, 25 Sep 2023 10:08:00 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkiVR-00DwDS-2S
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 10:07:59 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qkiVI-0000OE-If; Mon, 25 Sep 2023 12:07:48 +0200
Message-ID: <f30a4d64-c265-4f6a-94bb-632b1c07f15f@leemhuis.info>
Date: Mon, 25 Sep 2023 12:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: signal: fix sigaltstack frame size checking
To: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: greentime.hu@sifive.com, bjorn@kernel.org, prashanthsw@google.com,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Mathis Salmen <mathis.salmen@matsal.de>, Guo Ren <guoren@kernel.org>,
 Andrew Bresticker <abrestic@rivosinc.com>,
 Vineet Gupta <vineetg@rivosinc.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20230822164904.21660-1-andy.chiu@sifive.com>
 <169351910642.23657.16115457219052816039.b4-ty@rivosinc.com>
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <169351910642.23657.16115457219052816039.b4-ty@rivosinc.com>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1695636477;3802d63f;
X-HE-SMSGID: 1qkiVI-0000OE-If
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_030757_973802_9DD59D9C 
X-CRM114-Status: GOOD (  10.51  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 31.08.23 23:58, Palmer Dabbelt wrote:
> 
> On Tue, 22 Aug 2023 16:49:03 +0000, Andy Chiu wrote:
>> The alternative stack checking in get_sigframe introduced by the Vector
>> support is not needed and has a problem. It is not needed as we have
>> already validate it at the beginning of the function if we are already
>> on an altstack. If not, the size of an altstack is always validated at
>> its allocation stage with sigaltstack_size_valid().
>>
>> Besides, we must only regard the size of an altstack if the handler of a
>> signal is registered with SA_ONSTACK. So, blindly checking overflow of
>> an altstack if sas_ss_size not equals to zero will check against wrong
>> signal handlers if only a subset of signals are registered with
>> SA_ONSTACK.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] riscv: signal: fix sigaltstack frame size checking
>       https://git.kernel.org/palmer/c/d77303a57c95

Just wondering: what happened to this patch, which afaics is currently
in neither mainline nor next? Because according to
https://bugzilla.kernel.org/show_bug.cgi?id=217923 it fixes rustc
userspace crashes with 6.5. Was a different approach found?

Ciao, Thorsten

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
