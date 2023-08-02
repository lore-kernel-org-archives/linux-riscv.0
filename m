Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9551DC001E0
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 20:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=8NxSlINwppWQzY/Kb+Jw0m1t6XJ3yDDTsdlTYmEdpWI=; b=UREELuyNkkG/E+
	Oxuoa2mZSKH+ah4Ziq9T6Stpp2ViM8to6C4p9VDZ/NsOlYA1dtLlKoJJKgEvP/Vfo4K9ohkHJ1Jys
	DPiM+d08yTDthsQk43kfRBPTpviax0OyDpCPMa6+dpHP8xkIhnV91eZW6nwM7TjpXw3waCQ/CwSeg
	ZFlmrCJGWTS3aL061kBLN477X0eAacGIHyyBjME26Wn1kXTHZ4DsWEVtqT6Zp9dX+OBKTi06XuUPP
	q+r4CYWgcEf9Q3cXkXO0lLuKAeLFmHsyPs9UMtf9v9xX4QSYh6ZkA7F4p7UcvnvhCCu8VB7EkCwgZ
	xVKFm/bejfZna/rdkDUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRIkc-005rDr-2O;
	Wed, 02 Aug 2023 20:47:22 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRIkY-005rCq-0c
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 20:47:20 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-686b9920362so171030b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 13:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1691009235; x=1691614035;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xCeI4cJM5i/F1g7PTNSHGiGltpi2DPORCAOXe5MxMI4=;
        b=4dpu5FcCNCNRIyqjOzWmgL+NQSi4gYkmtcikJLhem4DJKp7bF2as4gU6+ek8eDxshQ
         pgFoE3rV9JVD/M8in3QjCrCvkcekpvSzciVT22TjMLAE3O3wrcK/TtbL4Sh9kbqDAWba
         xpjhQ/VuZLvlfZcxte6bI9tyAtiNQ+1xq8jwNCn55eMrG4AaeKjIRRYfIVr5rF0cg6y4
         aajuwqzz/F+O/8NnTRJX+/fXOsaEbW4+tJ+u1nG2YZD79SwC7VBQZT8kOyAKJvH7tMlR
         orrDNtcbh55emdbGrx5asBu7QIxNqdhGBd4RSFkJl3fQCRIi5JuEfbOIwJWYmebYvnKy
         b86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691009235; x=1691614035;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xCeI4cJM5i/F1g7PTNSHGiGltpi2DPORCAOXe5MxMI4=;
        b=kArDFIOXsoHoy9zb3y39gIxnE1qROwrGmLxxn/bsnQROMF9yhXA+mdmpy5UgBSfpGv
         Mjw2vUnLT9ZAObkGPzBDQifULcEE6gw11GkHIHi8fOUoo7yNmKFEociCVcxXjQejJcrD
         tRUe1eUBFLoEZP6jh9mj5mvHhSKIgtYpqK8L355bcSCh2lz/OYiweNoe51a0npCLFfzh
         4aZ5FfOsnOtfjpHfLHjzw7okiFuacfYuMOv7Tfemy1Sl3waa/vitUV9ZoaQu53ZMjeyf
         SmMXqL2apynGTwoesbz0aq1MKzHzc5sMImKDCXvadqY4ZMc8ynSs3Af5ExusMsPQadul
         YyCQ==
X-Gm-Message-State: ABy/qLYq/WT/qbOOxmI5AiyKVJnd7pe2EsESquojVhUG+yRDvZ836P45
	XLWHiaKoUV2djLMsz+OgBRYduQ==
X-Google-Smtp-Source: APBJJlFjxO+AHPyhX+rLY3nb8bkP8ra4T4tKVG4BPwAGhMlm1XsJK9F47UMjzYiGC9qC+vSrulmZIA==
X-Received: by 2002:a05:6a00:1687:b0:668:83b7:fd02 with SMTP id k7-20020a056a00168700b0066883b7fd02mr20214796pfc.31.1691009234798;
        Wed, 02 Aug 2023 13:47:14 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id e7-20020aa78247000000b0066f37665a63sm5852206pfn.73.2023.08.02.13.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 13:47:14 -0700 (PDT)
Date: Wed, 02 Aug 2023 13:47:14 -0700 (PDT)
X-Google-Original-Date: Wed, 02 Aug 2023 13:47:11 PDT (-0700)
Subject: Re: [PATCH v2] RISC-V: cpu: refactor deprecated strncpy
In-Reply-To: <mhng-93dd039a-f342-4239-a0a8-f1e31f7d8b5e@palmer-ri-x1c9>
CC: justinstitt@google.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  ndesaulniers@google.com, linux-hardening@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: keescook@chromium.org
Message-ID: <mhng-724de287-da99-4f58-af50-5d728a28d4ab@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_134718_255493_B969CCA9 
X-CRM114-Status: GOOD (  12.85  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 02 Aug 2023 13:41:52 PDT (-0700), Palmer Dabbelt wrote:
> On Wed, 02 Aug 2023 13:36:03 PDT (-0700), keescook@chromium.org wrote:
>> On Wed, Aug 02, 2023 at 12:21:58AM +0000, Justin Stitt wrote:
>>> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
>>>
>>> Favor not copying strings onto stack and instead use strings directly.
>>> This avoids hard-coding sizes and buffer lengths all together.
>>>
>>> Link: https://github.com/KSPP/linux/issues/90
>>> Cc: linux-hardening@vger.kernel.org
>>> Suggested-by: Kees Cook <keescook@chromium.org>
>>> Signed-off-by: Justin Stitt <justinstitt@google.com>
>>
>> I like it! ;)
>>
>> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> Thanks, I just queue it up for fixes (might take a bit to build test,
> I'm a bit backed up).
>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> If you wanted to take it for some hardening thing, though -- otherwise
> it'll likely end up on my fixes later today.

Sorry this is for-next as it's not a fix, I was just looking at other 
fixes.  It's queued up aimed at for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
