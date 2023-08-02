Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69188C001DF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 20:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wyuVpQhKopQKmrkexw9icah+lJF5JtZ3HY2+4vRqCFI=; b=nn7GqoX4X9wwt2
	CBUfM/QmhP3jud/D4FvIQULZ9/OsXp8I5Zldvisb8obh5gxJdZIrFKQR41h3FBGTgCS2LK8+/fFL5
	+45psXlIO+BD5SYzEI9ScoXOHMa4VXyIFahCCSOpSpKYRUfz5e1YhoUiQZL9/WWNzuRu2NuIgpttO
	mOLjaAI/esu2swh8TMvylkdm5EBQ3OUEfmvYXL413k2j/NuCu5m/Tk4nVQTN14IsNiV2VGTgPJr39
	WFiWJkR85dwzYQYxgQ1mdHLAT1JmigwhIpEOLyjZFoCdQLmAgvLTXh/laip2kdMQwHlPmC1/vQWTj
	Pmhl+9lj1dtX+JgAz7CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRIwM-005tDN-30;
	Wed, 02 Aug 2023 20:59:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRIwJ-005tCr-1E
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 20:59:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1C03E61B06;
	Wed,  2 Aug 2023 20:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE3AC433C8;
	Wed,  2 Aug 2023 20:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691009965;
	bh=nmkOzzBtFOlR8DFxoWtwW9LZ+hvtWnT7U9XNNbK44zs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=mq5WI9NJKx4ot/fCX8urwyDmjDYxKzJ/KxXHIauxGNMqx+Wn5E6rCeWejmb1+uvPu
	 2sXo1C7LxMcElPtGGXkI7IhP7dbMYxBd4Rbm1BOI8f+xbAPOS2669DZdz2NpgrelaL
	 OBW8EcwJlyz+Hg+099ccKwzdtQ2m8SwyZaawbdbGwdVXdHnjHWVdK+QIfKDki89yFJ
	 ePhMHIaQxen3fGEoxnjavTGdFAq2J/mI25pI3/uZbtY+1nj8le5+zUSmt3j6cdgVAI
	 IwmBY7ztrTn+6dmuZfFLVGIXJMsZcYlP9LNg9W68X9KEJF7GQ/SbQi54Pkj4C7h7AD
	 KgMPCWGiYpMwQ==
Date: Wed, 02 Aug 2023 13:59:23 -0700
From: Kees Cook <kees@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, keescook@chromium.org
CC: justinstitt@google.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, ndesaulniers@google.com,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: cpu: refactor deprecated strncpy
User-Agent: K-9 Mail for Android
In-Reply-To: <mhng-724de287-da99-4f58-af50-5d728a28d4ab@palmer-ri-x1c9>
References: <mhng-724de287-da99-4f58-af50-5d728a28d4ab@palmer-ri-x1c9>
Message-ID: <6A03714C-8C92-4E05-8FAD-D2C5A4745E7D@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_135927_487576_4EE927F8 
X-CRM114-Status: GOOD (  10.87  )
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

On August 2, 2023 1:47:14 PM PDT, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>On Wed, 02 Aug 2023 13:41:52 PDT (-0700), Palmer Dabbelt wrote:
>> On Wed, 02 Aug 2023 13:36:03 PDT (-0700), keescook@chromium.org wrote:
>>> On Wed, Aug 02, 2023 at 12:21:58AM +0000, Justin Stitt wrote:
>>>> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
>>>>
>>>> Favor not copying strings onto stack and instead use strings directly.
>>>> This avoids hard-coding sizes and buffer lengths all together.
>>>>
>>>> Link: https://github.com/KSPP/linux/issues/90
>>>> Cc: linux-hardening@vger.kernel.org
>>>> Suggested-by: Kees Cook <keescook@chromium.org>
>>>> Signed-off-by: Justin Stitt <justinstitt@google.com>
>>>
>>> I like it! ;)
>>>
>>> Reviewed-by: Kees Cook <keescook@chromium.org>
>>
>> Thanks, I just queue it up for fixes (might take a bit to build test,
>> I'm a bit backed up).
>>
>> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>> 
>> If you wanted to take it for some hardening thing, though -- otherwise
>> it'll likely end up on my fixes later today.
>
>Sorry this is for-next as it's not a fix, I was just looking at other 
>fixes.  It's queued up aimed at for-next.

Awesome; thank you! :)


-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
