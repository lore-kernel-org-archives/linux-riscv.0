Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689CBC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 18:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=0M8u/L74M5KBle7LOLVHKNrGgFIA4h/kNLkKnciD+c8=; b=F8zRb7j7UoxY7CcPUNumV5RlRW
	0lgQBq4eFHzbf5MH90YKeHpjYkR6N+TgDujO4edAhnRm/4ODDXOKufvB6Nbzl8KkuRQvXakXuBh6l
	NOO27dNL+imsfetJt5hf7D39tqRrpcpHr6/QgikGACuThdC6iubj++PpdFvIkwejIHPykoZdxMKmd
	TT/gre1Xs0gND4Pj49H/NXJF3A4GW6WrghDEjkcHuTXOlReEXAqWzhWWOtB4F8l9WTh05+McjMsxT
	jxKO9Lm8rCYjVwdeIu5JMIFC4QtAeTT7GzDh4rpKTp8aAazWUjZEcu1Kf+xtmOWv1jFOmGL6zAGKS
	9mld61jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQByk-002tku-4l; Thu, 09 Feb 2023 18:49:06 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQByf-002tiC-Qe
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 18:49:03 +0000
Received: by mail-pg1-x529.google.com with SMTP id 141so2230119pgc.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 10:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBCCRT/9+pLKu5FymkoHc9xf4Gc9hpzzFtrQnNwvTxw=;
        b=bKF5d5Nd8lyHPOWWI1AwfhtshWiysfT7QgeZlxRG/tNrLtNbT2neFQwDH4LoqWpldT
         +CbG8L2bzmr0hfZ8gavYm2gU3AWV4Oz+K5vZA/JcGJh760dQpCMnNNYJO1c5lIT2TZj9
         xtMd6E8wyOvler1mJnGXghGbzu7HpGyKgAcctGAz/+MmyOycRlyCkzDPp3ZvUZJLZy3j
         rd8Q2mcXIffUDGpm/H8Lw/ExWODfC/8w+00KTreqJidGP4srGgEMTeju68DRk44aLOZZ
         zoJUCFicRoyniTDTrgujH1Wwq98xBVJsn8WaS6TNUTXU4Zu2BBMVMUYsRnZuwIvHXIs9
         7esA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBCCRT/9+pLKu5FymkoHc9xf4Gc9hpzzFtrQnNwvTxw=;
        b=VFdWiqhAzjqGi7bC1L4VVD5Qa6QEUL9PeAGCcNAOlHUx5lCsNjj2KHRd2oGdUDoG+j
         SKVyJUNyUpTupnoDz8jk3h79biO9Mc5xkJO0ZjYCArZUqgc5BziLmeH2CLmTBiuikOAS
         jRW+QxYM8vOzNoPQu8FbGM1c6cjiOq8cusPFWjnR5ZYTfvQsJSiP6S5rQZc/p9O+QXIo
         FK1PAkuIk2qpJDm6+oPCfbzZ04pYPfBFU+YH38f2qJ57U0a5Ke+gRAHeretWX3hcFeQz
         +bktPHjl2grVCLtpGJduWpgyfbUzu5KDWaicn0hkyOmbYPWmjPJLUqhHVqUl9UFkfH0l
         x35w==
X-Gm-Message-State: AO0yUKUGFa/nNZsdlqBYuw6hjJVecEG7QQfjeYyztxj6Gl0DHDGwWmm6
	ugZmKRpBJkAZ9Bk3wIbctRyaEdk6xsGB9vU5
X-Google-Smtp-Source: AK7set+8uRYm02PUJG2CI1RNNKf0Dv8QTlWW8X4JW7B0f5RBh37dYdguHZpdEr6DnQO8aegWmvmpXg==
X-Received: by 2002:a62:164b:0:b0:5a8:5247:2593 with SMTP id 72-20020a62164b000000b005a852472593mr3046770pfw.28.1675968538638;
        Thu, 09 Feb 2023 10:48:58 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id n12-20020aa78a4c000000b005a7e9d0c419sm1767046pfa.58.2023.02.09.10.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:48:58 -0800 (PST)
Date: Thu, 09 Feb 2023 10:48:58 -0800 (PST)
X-Google-Original-Date: Thu, 09 Feb 2023 10:46:25 PST (-0800)
Subject: Re: [PATCH] Documentation: riscv: fix insufficient list item indent
In-Reply-To: <Y9c0EU5epWCeoPB8@debian.me>
CC: Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
  linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, corbet@lwn.net, lkp@intel.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bagasdotme@gmail.com
Message-ID: <mhng-4defd1c9-ee2a-4f95-89f9-7c47ee6b97e9@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_104901_885740_BCDF91D1 
X-CRM114-Status: GOOD (  20.81  )
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

On Sun, 29 Jan 2023 19:05:53 PST (-0800), bagasdotme@gmail.com wrote:
> On Sun, Jan 29, 2023 at 11:57:01PM +0000, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>> 
>> When adding the ISA string ordering rules, I didn't sufficiently indent
>> one of the list items.
>> 
>> Reported-by: kernel test robot <lkp@intel.com>
>> Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo")
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>
> Seems like you forget to add link to the report:
>
> Link: https://lore.kernel.org/linux-doc/202301300743.bp7Dpazv-lkp@intel.com/

Is that the normal way to do it?  I've only been adding the Reported-by 
like the bot suggests, but I guess it's kind of nice information to have 
the bug report as well.  From looking at git history it's kind of a mix.

Maybe the bot should suggest this in the bug report, right next to the other
tag?

>> ---
>>  Documentation/riscv/uabi.rst | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>> 
>> diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
>> index 2ebec4c52230..8960fac42c40 100644
>> --- a/Documentation/riscv/uabi.rst
>> +++ b/Documentation/riscv/uabi.rst
>> @@ -21,10 +21,10 @@ so for our purposes the following rules apply:
>>     single-letter extensions and before any higher-privileged extensions.
>>  
>>  #. For additional standard extensions, the first letter following the 'Z'
>> -  conventionally indicates the most closely related alphabetical
>> -  extension category. If multiple 'Z' extensions are named, they will be ordered
>> -  first by category, in canonical order, as listed above, then alphabetically
>> -  within a category.
>> +   conventionally indicates the most closely related alphabetical
>> +   extension category. If multiple 'Z' extensions are named, they will be
>> +   ordered first by category, in canonical order, as listed above, then
>> +   alphabetically within a category.
>>  
>>  #. Standard supervisor-level extensions (starting with 'S') will be listed
>>     after standard unprivileged extensions.  If multiple supervisor-level
>
> The warning is fixed, thanks!
>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
>
> -- 
> An old man doll... just what I always wanted! - Clara

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
