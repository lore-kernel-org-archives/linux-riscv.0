Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4708BC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Mar 2022 11:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tAD81Mdc8q836Hw6ARnTrsEDwq8uU6E4Bm0Qq3rMSfU=; b=HshhrVimIaX82C
	Z8lDv7dVLxU17uyKEcgM3KE7cXTJQbwJoA4VL5JB7barb4JeSEM1+gcST5SIptacViaqQrtj3PWfO
	z5q9INA+4U1XWjpRo60jZMo/BrG/XqRFltqNMWMNlNViO65/1AekKLh6gNgyhhSk7g6WvnLCgi5Pj
	86mytrNKNzPyLp3UT9lCInBUnT2Wzh/2sKjOCgKbtXKl8E2yaw+1hUk+8M9GUnJF75s02S+iA6WwX
	aJYdDq4TU21mYW6eB//mOZnAzb2QQWzvmCnRmqezSZSr5i2/fyn1SYKa56jbgNwIGE/lGY94Zu1aG
	jISymm+xS6YW5JqxG1fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRul5-008MrH-Gs; Wed, 09 Mar 2022 11:45:35 +0000
Received: from m228-4.mailgun.net ([159.135.228.4])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRuiE-008LRv-0l
 for linux-riscv@lists.infradead.org; Wed, 09 Mar 2022 11:42:43 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=michaelkloos.com;
 q=dns/txt; 
 s=k1; t=1646826161; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: From: References: Cc: To: To: Subject: Subject:
 MIME-Version: Date: Message-ID: Sender: Sender;
 bh=v8crHnu6Y+qNUrAz/zeSAvUoD0V1jbcWRdakFVXkW6c=;
 b=DY6ogFn6aO/GiCWfqOOR+teahluUoElbm+xRm4TKIg8lyeIZWoEsWhQAkrJjJFfvJCjR8fbR
 e/VhegcYe4aAYQT4mG0rnOUYYf1hvMtRqt925q3ddC3GWtgosY9KIpjLqFeUBe7N10Up/qh3
 RCgkuuyX1FFcAofY1Eq+SyhmZxA=
X-Mailgun-Sending-Ip: 159.135.228.4
X-Mailgun-Sid: WyIxOGJjMSIsICJsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnIiwgIjQ4Y2MwIl0=
Received: from drop1.michaelkloos.com (drop1.michaelkloos.com
 [67.205.190.89]) by smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 622892992f1b1e8f79b09f85 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Wed, 09 Mar 2022 11:42:17 GMT
Received: from [192.168.1.236] (cpe-173-88-115-50.columbus.res.rr.com
 [173.88.115.50])
 by drop1.michaelkloos.com (Postfix) with ESMTPSA id 8A4EB40176;
 Wed,  9 Mar 2022 11:42:16 +0000 (UTC)
Message-ID: <e936de26-95b7-1eed-008e-8d025b638265@michaelkloos.com>
Date: Wed, 9 Mar 2022 06:43:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] riscv: Work to remove kernel dependence on the M-extension
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220309052842.247031-1-michael@michaelkloos.com>
 <CAK8P3a2Mr_z6h7eg1O8ZN5_qE-o+8KFFBum3CxyuDYeF50s1dw@mail.gmail.com>
From: "Michael T. Kloos" <michael@michaelkloos.com>
In-Reply-To: <CAK8P3a2Mr_z6h7eg1O8ZN5_qE-o+8KFFBum3CxyuDYeF50s1dw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_034241_787156_6994BACD 
X-CRM114-Status: GOOD (  23.16  )
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

Thank you for your feedback.  I don't really have much of an
opinion about that right now aside from that I know where things
are in the current structure and am comfortable.  My goal with this
contribution was to keep it in-line with the current config
structure.  Hence, I put it right next to the menuconfig option
to control CONFIG_RISCV_ISA_C under Platform Type.

I wouldn't necessarily be opposed to rethinking the way platform
feature selection is presented in menuconfig.  If people feel that
most users will be looking for an rv64gc config and that it should
be made for clear, perhaps it could be done.  I would need to do
more thinking about how exactly that would look.

I do think that it is outside the scope of this patch.  Were you
working on something like that and worried about a merge conflict?

	Michael

On 3/9/22 05:02, Arnd Bergmann wrote:

> On Wed, Mar 9, 2022 at 6:28 AM Michael T. Kloos
> <michael@michaelkloos.com> wrote:
>> Added a new config symbol RISCV_ISA_M to enable the usage of the
>> multiplication, division, and remainder (modulus) instructions
>> from the M-extension.  This configures the march build flag to
>> either include or omit it.
>>
>> I didn't find any assembly using any of the instructions from
>> the M-extension.  However, the BPF JIT is a complicating factor.
>> Currently, it emits M-extension instructions to implement various
>> BPF operations.  For now, I have made HAVE_EBPF_JIT depend on
>> CONFIG_RISCV_ISA_M.
>>
>> I have added the supplementary integer arithmetic functions in
>> the file "arch/riscv/lib/ext_m_supplement.c".  All the code
>> contained in this file is wrapped in an ifndef contingent on the
>> presence of CONFIG_RISCV_ISA_M.
>>
>> Signed-off-by: Michael T. Kloos <michael@michaelkloos.com>
> The patch looks fine to me, but I increasingly get the feeling that the
> entire platform feature selection in Kconfig should be guarded with
> a global flag that switches between "fully generic" and "fully custom"
> builds, where the generic kernel assumes that all the standard
> features (64-bit, C, M, FPU, MMU, UEFI, ...) are present, the
> incompatible options (XIP, PHYS_RAM_BASE_FIXED,
> CMDLINE_FORCE, BUILTIN_DTB, ...) are force-disabled,
> and all optional features (V/B/P/H extensions, custom instructions,
> platform specific device drivers, ...) are runtime detected.
>
> At the moment, those three types are listed at the same level,
> which gives the impression that they can be freely mixed.
>
>           Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
