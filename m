Return-Path: <SRS0=0jWI=WJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDB5C32750
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2019 23:51:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C00A20665
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2019 23:51:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GcBOCAAM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C00A20665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=uGnQTlLMvgMIOcHkdG7vs26DzUwKNXYJbGZSCO9Gy/k=; b=GcBOCAAMYvtw/Nkm8p/yT2aUY
	BUED4UUSYWCTHnmRNjGVkLl99eB8XAV02ovMq6sZJ4CcFpbmNiA2RqUQTaPgIg85M6EVzFl2LXDC6
	aGZTXP+stOmv4wgmSbiLLTWB+uqyTFnzl59oReypyKrqi28gRG+zHzlmpfp3COVLg1kG72T4UptfG
	Ha+0msHwDIpukLI7bOPpR6cb4pEWHkizjQo3qc4wKyKI5yFXiOlDO+uzA8M2OsEEf1XTeB06Dhek5
	HT/z2PvLJOgur9Nfh/BY9AEAoF38bgSJaS4nmCrz/JW3v7KPZb0fjrYlUmI0GEKBr8rC6J3CZK+yL
	gA2RBU5hA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxgZD-000460-Hj; Tue, 13 Aug 2019 23:51:03 +0000
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxgZA-00045f-Hi
 for linux-riscv@lists.infradead.org; Tue, 13 Aug 2019 23:51:02 +0000
Received: by mail-pg1-f196.google.com with SMTP id w10so52081538pgj.7
 for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2019 16:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=IbdE2KInyJodKUCtVAuZWET2xZ1Z2VbKwChNL5TWr0E=;
 b=tN1okLCjo93Wf2+DVNfAnVC6IROKBfbdo2dv/M0ZIMdPZi+abpRmiKDEfoRbhuUelU
 8vrLmQiaJ7TqipwOpWssE9EtUauEtNcfDL2eoc1fb2OEtTORAu7sSROGHVVSJobwnmZh
 vTrL33Svf4Slk33I1CjPaD3Y8fFWhCxTh7QfCBlLt1OOgh8Z0v6ZMyhqbRkgAsW3s56N
 YD2teIrCzzEJsCrsbC+RlARgVIAa7uI1JnauWgq+Cbur37xMi+9gF/4aycPLvli+kNBW
 o+hlxEmdBirSl2UCokP+ixKpq6rmqkYjT7svWx3fNG8iRENEnBhEZq8NmtJgNnMQvyQJ
 DWrA==
X-Gm-Message-State: APjAAAUogI4OCQpCsrhJmHa84rFCeNGS2HoBwfPqChWi2Mj+bM4zgkmw
 hq2toz5btCX5gJRTePbxYT/QBw==
X-Google-Smtp-Source: APXvYqxNATMcBumSiCPFS8wNZtu0n7swBqrFa9SgTQsdLIQjGnQbyX6u8CwOsBbSclJCrlnkebwj+w==
X-Received: by 2002:a17:90a:2c9:: with SMTP id d9mr274835pjd.134.1565740258768; 
 Tue, 13 Aug 2019 16:50:58 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 81sm163022302pfx.111.2019.08.13.16.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 16:50:58 -0700 (PDT)
Date: Tue, 13 Aug 2019 16:50:58 -0700 (PDT)
X-Google-Original-Date: Tue, 13 Aug 2019 16:49:25 PDT (-0700)
Subject: Re: [PATCH 1/2] riscv: Add memmove string operation.
In-Reply-To: <20190812150446.GI26897@infradead.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-ba92c635-7087-4783-baa5-2a111e0e2710@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_165100_738505_6FDA7F34 
X-CRM114-Status: GOOD (  14.75  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, nickhu@andestech.com, alankao@andestech.com,
 Atish Patra <Atish.Patra@wdc.com>, Greg KH <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, zong@andestech.com, alexios.zavras@intel.com,
 glider@google.com, green.hu@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aryabinin@virtuozzo.com,
 tglx@linutronix.de, deanbo422@gmail.com, linux-riscv@lists.infradead.org,
 dvyukov@google.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 12 Aug 2019 08:04:46 PDT (-0700), Christoph Hellwig wrote:
> On Wed, Aug 07, 2019 at 03:19:14PM +0800, Nick Hu wrote:
>> There are some features which need this string operation for compilation,
>> like KASAN. So the purpose of this porting is for the features like KASAN
>> which cannot be compiled without it.
>>
>> KASAN's string operations would replace the original string operations and
>> call for the architecture defined string operations. Since we don't have
>> this in current kernel, this patch provides the implementation.
>>
>> This porting refers to the 'arch/nds32/lib/memmove.S'.
>
> This looks sensible to me, although my stringop asm is rather rusty,
> so just an ack and not a real review-by:
>
> Acked-by: Christoph Hellwig <hch@lst.de>

FWIW, we just write this in C everywhere else and rely on the compiler to 
unroll the loops.  I always prefer C to assembly when possible, so I'd prefer 
if we just adopt the string code from newlib.  We have a RISC-V-specific memcpy 
in there, but just use the generic memmove.

Maybe the best bet here would be to adopt the newlib memcpy/memmove as generic 
Linux functions?  They're both in C so they should be fine, and they both look 
faster than what's in lib/string.c.  Then everyone would benefit and we don't 
need this tricky RISC-V assembly.  Also, from the look of it the newlib code is 
faster because the inner loop is unrolled.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
