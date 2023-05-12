Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D891C77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 18:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=hYnM5d3JdNgCUMrxfFH+jXRvMG4ylATLtqoowhMdj6w=; b=PPWLQGuQObvS/Fv/ss2fVLZnoT
	whbWJ5mhqxAgpmiX2dJQLAefGBGmNuQPJiAdZxVWfNCoEB23IrcMkQx9pD73PU9ybpvAZpZ+fvN7d
	7UDBX3YJxaDgLOPP7CjsB9Lk+eLkVn5GTBU0KAS6JWnnIYR3cv//yHq8GXXMTVPojvZ7eRbsY4X8X
	4u1+wkWLWUBriNdP8JKHOM8MspsQZzNkAuW6X9HzERrzJTpLoW9/BTG0T7lumCFEqkx2wfyMUpxl8
	Qk9Gigh8RjkySVxkrpTA4gqDolQxZeMetCCfY9w6ilSeitySqy8mLVc1DLdlumeHiVSx2orH3tN8+
	dNz2qsPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxXhl-00CjfZ-0n;
	Fri, 12 May 2023 18:41:25 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxXhi-00Cjey-0G
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 18:41:23 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-24df4ecdb87so7104700a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 May 2023 11:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683916880; x=1686508880;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/koMj+9kCWnn+HpYnU02beKNw32OHAll5JRoBttwWow=;
        b=UIhGNBCTmqrch9vZbwJdVHFCubylnX3lcJyBGWavwa7JY8D/CttT9kGCDbOafsAU5t
         vRGkZetPBOTBep0hAclU+TvrJrsGAcm/cmzfx87RHZxbSOm/1zOHCe1nI8Z1CWv1Ps9D
         D952EwlqaD3t3yacv+04O0gQbGqwleDPiwJAfoDvrdUT6jNeoX47UMmTa5Nhrxp9KLTu
         JlBCktj76+eSbrUIG9171EIYm1HesTFO1GehE0SGP7Zz4cud4wCc0eSKdVsUSQ1gmH6f
         qpkn9CtmJbzw5p3uYmUZ0UnZpWrgxx2rYRHTfZBYjywgnOZqECdRQJFMHKa48i7ms19Q
         y94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683916880; x=1686508880;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/koMj+9kCWnn+HpYnU02beKNw32OHAll5JRoBttwWow=;
        b=dC9AO/FQkYHgDOcON8zIMYIGGqgKQtyal6e/SGC1nNyrTpkfG/kX4QMAn38XczoxjJ
         GF5sfqR5zyxnXo0Moz+O1A6HNvKgNWbXDyVuLbRcUzn2p0Jjseisg7hwj7+eiPDkAAq9
         BdnnE59gpz4HhhjHGbclf9jlXn7oPf2OYmfSGYpwU5shK6nmZ08r34AXfwSL2WQbuMrM
         +mvRWki7TPTx/nC3w8iFChjNYQywkg/z1S18Ap+5nY+wREGF/6eejHJpNnHXiKpchvFL
         8YkfyhaHt8oOFF/I4RCRvEZ4LaQNZLRD/5z+9h8d5GzJP79n3Z4CxiDMf/IJRX6JLHbK
         0MXg==
X-Gm-Message-State: AC+VfDyz3BuCXjPOdMAUNvTnT25tHX03Lu7LeFYYvudPDxSkgdFo0xKz
	+fGYhLX2SVEd8zr//kTCJMaSEA==
X-Google-Smtp-Source: ACHHUZ7tzMVQBdyjPy08WAKw09bAKD7sofw01RBIRabRo3XqbykGfqUcjR5vOU1bPn+AEZQv0/dWSA==
X-Received: by 2002:a17:90a:ea90:b0:24d:ee3f:b682 with SMTP id h16-20020a17090aea9000b0024dee3fb682mr24863163pjz.35.1683916880378;
        Fri, 12 May 2023 11:41:20 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id c3-20020a17090a020300b00250c1392ed3sm6500634pjc.55.2023.05.12.11.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 11:41:19 -0700 (PDT)
Date: Fri, 12 May 2023 11:41:19 -0700 (PDT)
X-Google-Original-Date: Fri, 12 May 2023 11:40:58 PDT (-0700)
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
In-Reply-To: <87ttwi91g0.fsf@igel.home>
CC: alex@ghiti.fr, alexghiti@rivosinc.com, mpe@ellerman.id.au, npiggin@gmail.com,
  christophe.leroy@csgroup.eu, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@linux-m68k.org
Message-ID: <mhng-c528747d-5f47-4e42-b6db-f9db4e756ff9@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_114122_144139_4A8D279C 
X-CRM114-Status: GOOD (  14.87  )
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

On Thu, 11 May 2023 11:18:23 PDT (-0700), schwab@linux-m68k.org wrote:
> On Mai 09 2023, Alexandre Ghiti wrote:
>
>> On 5/9/23 21:07, Andreas Schwab wrote:
>>> That does not work with UEFI booting:
>>>
>>> Loading Linux 6.4.0-rc1-1.g668187d-default ...
>>> Loading initial ramdisk ...
>>> Unhandled exception: Instruction access fault
>>> EPC: ffffffff80016d56 RA: 000000008020334e TVAL: 0000007f80016d56
>>> EPC: ffffffff002d1d56 RA: 00000000004be34e reloc adjusted
>>> Unhandled exception: Load access fault
>>> EPC: 00000000fff462d4 RA: 00000000fff462d0 TVAL: ffffffff80016d56
>>> EPC: 00000000802012d4 RA: 00000000802012d0 reloc adjusted
>>>
>>> Code: c825 8e0d 05b3 40b4 d0ef 0636 7493 ffe4 (d783 0004)
>>> UEFI image [0x00000000fe65e000:0x00000000fe6e3fff] '/efi\boot\bootriscv64.efi'
>>> UEFI image [0x00000000daa82000:0x00000000dcc2afff]
>>>
>>
>> I need more details please, as I have a UEFI bootflow and it works great
>> (KASLR is based on a relocatable kernel and works fine in UEFI too).
>
> It also crashes without UEFI.  Disabling CONFIG_RELOCATABLE fixes that.
> This was tested on the HiFive Unmatched board.
> The kernel image I tested is available from
> <https://download.opensuse.org/repositories/Kernel:/HEAD/RISCV/>.  The
> same kernel with CONFIG_RELOCATABLE disabled is available from
> <https://download.opensuse.org/repositories/home:/Andreas_Schwab:/riscv:/kernel/standard/>.

Sorry I missed this earlier, there's been some other reports of boot 
failures on rc1 showing up but those were all a lot more vague.  Just 
setting CONFIG_RELOCATABLE=y doesn't manifest a boot failure on QEMU on 
my end and I don't have an UNmatched floating around.

Alex says he's going to look into it (and IIRC he has my Unmatched...).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
