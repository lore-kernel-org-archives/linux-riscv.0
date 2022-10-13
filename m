Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783F6C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 04:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=jdFdgVl7eeQAlaJi9kfRX5jNZnZyBk+FEoKMHTxDaHQ=; b=QVxVKF5nJdHV6qrmAstJo8vrgu
	PiWWyouH6Xu5ICaihJ0IwYcuZcf9j/f19gEAXh/zui/+mVFq8+eT3t0jNQSQy6eru4J0qbO1geF5z
	+pVd0R4uKhlLUImHrWRWALurdvo30KHnGMRArw5ceYvU7IVuJexKCde72yOlqK9rC1J1N8irOoQBv
	CJdOf1pUgTcT7jiuT3uyY1azm/pONjcFBdGK/pCmzhFK7X73a7XSDrb5vvSbgHTs9iNone5CqunEI
	C1v0xwoiQnjc1yiLZ//Bl83luKwkQVq1V9EbUBHJm7xVouxCYLWUHCL669GX4Z46Beu+UKHJBm6WV
	9/82o41Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqGd-00Ad5u-Vw; Thu, 13 Oct 2022 04:56:24 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqGX-00Ad0k-7r
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 04:56:19 +0000
Received: by mail-pf1-x432.google.com with SMTP id i3so922382pfc.11
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 21:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TmMbBEFL7InYrKipqWqx2Sx3NjHdxmEluVtMDp4gO+o=;
        b=MneFLaPoukqODECTE04Vz3TjIyv3mU7bvm5o888II80pWLNUisQHL90qQTejqP63ii
         Gx0PkXu8niy6vWUG5kF2iXPrkkC8M+2sbuns+yo9dLPvzheLrf7X2CQStDbUd+hMNhZv
         7FHe8OrZMqP6WXu5yVO24WNv525cObFYzttcbj3wRGHBnVBUAD3mfPZqjT2qbqEgiBZS
         DZP0s45yG0xrledLtSf14BAX5J6W57ZK2A32Y5zMXdJVAxUEhO6x9E+oRccGkPF/wj53
         B+OdMeo5kwrzxgP26M2UjeKaxDKdHb92/8NRWFkt+S5tIAQ8ZFCugRsJuAIn276Q8S7G
         8eUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmMbBEFL7InYrKipqWqx2Sx3NjHdxmEluVtMDp4gO+o=;
        b=CvA1ViSDrClhWwgp1/izvOuDStwAzfxnzhQAgkJYTM/QWoTFU+yVG2hPq3TX0FTiH7
         RDxN4NF20hoNUSdgNxQdaX3dZXhtIcXVHjCloJtGIacrK16gV7OVKlnTJCDy/OrxMdRn
         qK2I3nhd5Mr/msNrRnpzW5mqk+Qhs5kQyLJc5ndbFlBjcnHPwtybWM/KuGxNSH9VY08Q
         doaF6eYzhpJYOS0UuPsmdKfgf4i4AqkXlJsxCQw0c5VvzWP8T5QDM6FEu0hWgK/twQN9
         RNPU/Syu3iZ/uiz0J/DB4Euzix/L2EvOKsmUpY5HZG4s+LXpCE6f8NArAqiQZ79/TSBl
         bsFw==
X-Gm-Message-State: ACrzQf3nL0s69wNetyN2Dac0odBcvurKm+dRb1N5YblP34do5pc2vFW/
	dtjNdsjkcgJcVgrglsr0gLONn/D7Vh6hrg==
X-Google-Smtp-Source: AMsMyM4RRg8iAS1vV4R+ka9oc9llgPboEpDBGgb9pD035UK5StugQDBOIc4rTj8t9c0mbnUpm4iQmw==
X-Received: by 2002:a63:4283:0:b0:457:dced:8ba3 with SMTP id p125-20020a634283000000b00457dced8ba3mr28416615pga.220.1665636975341;
        Wed, 12 Oct 2022 21:56:15 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id y133-20020a62ce8b000000b0056272195028sm787874pfg.84.2022.10.12.21.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 21:56:14 -0700 (PDT)
Date: Wed, 12 Oct 2022 21:56:14 -0700 (PDT)
X-Google-Original-Date: Wed, 12 Oct 2022 20:56:30 PDT (-0700)
Subject: Re: [PATCH 1/3] Documentation: RISC-V: Fix a typo in patch-acceptance
In-Reply-To: <Yynw26jVIvHSSQ+6@spud>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-7f5eb892-9a5c-40db-9235-a6c9de89fd49@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_215617_615111_40DC1954 
X-CRM114-Status: GOOD (  17.56  )
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

On Tue, 20 Sep 2022 09:56:59 PDT (-0700), Conor Dooley wrote:
> On Tue, Sep 20, 2022 at 07:01:37AM -0700, Palmer Dabbelt wrote:
>> I just stumbled on this when modifying the docs.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>>  Documentation/riscv/patch-acceptance.rst | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
>> index dfe0ac5624fb..5da6f9b273d6 100644
>> --- a/Documentation/riscv/patch-acceptance.rst
>> +++ b/Documentation/riscv/patch-acceptance.rst
>> @@ -29,7 +29,7 @@ their own custom extensions.  These custom extensions aren't required
>>  to go through any review or ratification process by the RISC-V
>>  Foundation.  To avoid the maintenance complexity and potential
>>  performance impact of adding kernel code for implementor-specific
>
> s/implementor/implementer no? Or is this an American spelling?

I actually have no idea.  The "or" spelling seemed odd to me, but it was 
spell checking correctly.  The internet seems to be split on whether or 
not it's actually a word, which probably means it's uncommon enough it's 
worth moving over.  I'll just tack it on as a patch as there's enough 
feedback to have a v2.

>
>> -RISC-V extensions, we'll only to accept patches for extensions that
>> +RISC-V extensions, we'll only accept patches for extensions that
>>  have been officially frozen or ratified by the RISC-V Foundation.
>>  (Implementors, may, of course, maintain their own Linux kernel trees
>>  containing code for any custom extensions that they wish.)
>> --
>> 2.34.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
