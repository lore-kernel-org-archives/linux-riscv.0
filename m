Return-Path: <SRS0=JiLF=R5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DF5C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2019 02:22:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4AF020823
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2019 02:22:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D2EQqED1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="f2wela59"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4AF020823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=r1lF2gWokiAG4Y4obXkjq6TFh55HQLHtVc9R5wpP8Zg=; b=D2EQqED1R/yMyIvOZNlexQBQk
	WTJ0/j7JNlMhz6TY4M1FGqs4YWgsINmyntIv3BivytsRDxjw/LvXlCRjNlM6hmBOKsZ6Tf7KDyjU9
	bdeR5qndzKUP2RdnnG6Of4NTOdB/ZXniCjcVrzteXpv3HtzKBPZKFfrhm2M0xKnMAH3I8tgp5Ga7r
	T8ZahDz78CHc6/g7694PqBWMEFeH6X504X485wgpPLpNXlpLHaYKWMRAxFnxdcaGkVmi7q6G5eeMF
	yAHMEY+izOx57XzUUQnHzSAASjPqEMdjfVRK621YIwU2za3xDH0/uPxSzRNhjKldxuLvAe3dcqRPQ
	+6iUOw4gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8bjb-0005He-Bj; Tue, 26 Mar 2019 02:22:39 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8bjY-0005Gh-51
 for linux-riscv@lists.infradead.org; Tue, 26 Mar 2019 02:22:37 +0000
Received: by mail-pg1-x542.google.com with SMTP id g8so7521887pgf.2
 for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2019 19:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=I8HR9DuBJhNaxmVVRl5EY43j4mASUSOtl5OE+nBW5Ds=;
 b=f2wela59lVLTnNvfKSfNFeUBfgRQQWHnhhkbAGaIxmhgl5NQValU4Wcx8YgeTYELii
 0FXxNpAeJPkZ+u7OLIOFCx+Fuuy0dnNyTDZFcS6guQZpSf3W8rm9wXEdNoXOk6/oUk98
 czgED0J56oKIWvGGebkeHHun5vjze+tz3OjqAuZ0kkKOL9l5DsD158mug1+pugVabE8S
 /OI5bwa3moncNfg/eGF8ofTAo/PEKSp/FWv1R10eAnakKq1QdiJxfed76lFAwYJ2YK+/
 Wd61JoizghCuDlPRsZ5FRwqvBAJgwKv1392BkqF1QWhwhoR3M1iNpNSjfCGVoerj5QBZ
 s8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=I8HR9DuBJhNaxmVVRl5EY43j4mASUSOtl5OE+nBW5Ds=;
 b=F1L3Urbh/cha3Xy7gj8W/udgYssjojPfKvuIq8FMY6SrpxtZPKL6oUqjY0JvcE7GUB
 cSwtC8BR//f5TEl4IJ+NFYF1q59quj1bNZdFVhz0tX76o0Yzjvr4T/6JwLF8Ku15lMt+
 ClJP/aC/tlQOWu7BIMpkg3J2a5S7q3/6sOeUKmLssb4DK73/5kI3VjbdN03GSsa2hqCr
 Szv9/T1FPFlYFntlQrIhEgVlox+INOCKVSMMTBnBibEYilWUOwX/jBLWpxt9UPeSNrPb
 lETBu/h0fmIpc+oOkDf+FRFS3Lk2J/rE2BW2Vs2n8oM2kpkO0YCgKXBGE6jQPnG1BBnD
 i/cg==
X-Gm-Message-State: APjAAAUh59N+oK+LBGYYNuRwyFiuaK5pQES+CiS3LjTntbfVMgQXKvRn
 GMW4BbSEgo0WcAVdj+Gcum9nlA==
X-Google-Smtp-Source: APXvYqxMrnzvIodlWKnYIZ52mKHuMsjndPnaMV0Ag7lvje5+8e0ztu4qEOA2Wmx2SSs4JrywXk++vQ==
X-Received: by 2002:a62:4d45:: with SMTP id a66mr1350207pfb.250.1553566951637; 
 Mon, 25 Mar 2019 19:22:31 -0700 (PDT)
Received: from localhost
 (2001-b011-7001-1270-b809-36ef-31ed-7980.dynamic-ip6.hinet.net.
 [2001:b011:7001:1270:b809:36ef:31ed:7980])
 by smtp.gmail.com with ESMTPSA id d69sm14379354pfg.26.2019.03.25.19.22.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Mar 2019 19:22:30 -0700 (PDT)
Date: Mon, 25 Mar 2019 19:22:30 -0700 (PDT)
X-Google-Original-Date: Mon, 25 Mar 2019 19:21:32 PDT (-0700)
Subject: Re: [PATCH v2] RISC-V: Always compile mm/init.c with cmodel=medany
In-Reply-To: <CAAhSdy2-CX729tVuuZzArswpFEC_OeRXhwXtCaiNe53AuzqdTw@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-8e00a3e3-5a69-4828-b7bb-2bf000199b48@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_192236_213984_BB8E8B43 
X-CRM114-Status: GOOD (  18.61  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, alankao@andestech.com,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 rppt@linux.ibm.com, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 25 Mar 2019 00:01:45 PDT (-0700), anup@brainfault.org wrote:
> On Mon, Mar 25, 2019 at 12:18 PM Christoph Hellwig <hch@infradead.org> wrote:
>>
>> On Mon, Mar 25, 2019 at 01:25:50PM +0800, Alan Kao wrote:
>> > Hi Anup,
>> >
>> > Sorry for being late to the party.  I think one more thing should
>> > move together with setup_vm():
>>
>> Ah, I wonded about that yesterday but wasn't sure.  Maybe notrace
>> is a little cleaner?  Either way we should probably document both
>> the mcmodel and notrace assumptions in source comments for the next
>> person touching this code.
>
> The setup_vm() should be allowed to call other functions within mm/init.c
> so let's go with file-level notrace (just like how it was done) for
> kernel/setup.c
>
> I certainly add comments for setup_vm() based on all our findings so far.

Sorry for being slow here, but this is the right approach: setup_vm is called
before relocate, which means the page tables won't be set up correctly for
absolute addressing.  We instead build setup_vm with medany, which causes all
addressing to be PC-relative.  This is all a bit of a hack, but it's the only
way we have to do this right now.

You should be able to add a preprocessor #error to check the code model with 
something like this

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index b379a75ac6a6..d6fde6af8d75 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -172,6 +172,9 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
        }
 }

+#ifndef __riscv_cmodel_medany
+#error "setup_vm() is called from head.S before relocate and must not make any absolute references."
+#endif
 asmlinkage void __init setup_vm(void)
 {
        extern char _start;

Marking this notrace is the right thing to do, as it can't call into any 
functions that aren't medany (there's probably other issues as well, since this 
is so early).

Sorry I missed this the first time around, I wasn't paying enough attention.

Can someone add instructions for 32-bit boots to the QEMU wiki?  It sounds like 
it's time to add that to the testing list...

Thanks for digging in to this!

>
> Regards,
> Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
