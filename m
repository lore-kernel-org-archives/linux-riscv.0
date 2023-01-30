Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB446C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 07:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GeEO+UU2Iw/xzFIn54UO3lQMe2L6gommCHfgAhshpcY=; b=QuwfF1EmXocgYI
	WZGfNA4FNNj+e5Y8AOHmSDfHMZaesrLLouqspCOIVTfp0myIEp004rVkk+VDBcu7fE1mBDNePyiRV
	UlWajL/HZcHO8O/IEsJQtSwrT6gNIldsrYmZNXhu0pCKJD5atl0DZ4ldnd+C1duIOUNOHrqnuO0R7
	gu7wB81bvu39YwDWnFphj4FNFPsvJ2oL2oEruf/M9kGI48ONiBNnNUOASo2zYGrARya5XFr6OR2tn
	RnnE6NsGOIl1AvrYAjQHCZ5/TgsdGTIoR6u/KNe0Xl9r0Xe2ghQiyWRWgXcu/23FYPOrcm0/TJyZe
	6fgnNaqB3FRxTib1EqQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMOsJ-002aIP-V3; Mon, 30 Jan 2023 07:46:47 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMOsH-002aHg-1N
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 07:46:46 +0000
Received: by mail-yb1-xb34.google.com with SMTP id m199so12949409ybm.4
        for <linux-riscv@lists.infradead.org>; Sun, 29 Jan 2023 23:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TJknPwaLq9rnEYcTZh5lLSNm0HI7FpaAywxMPndbjks=;
        b=D07tZiVjzQIfHrc5CxGPzdmv/5hKD3mGUI4DyOVB+x+ifsND+QYFjOTgy6KrOgFahw
         a7XZJeYupy/uPRdyZ3XsfQcgOFnehies5fWq2PevguImeiki+AefMcMFSTNlBkEHCdes
         E0pqxwRnOz5WTmMx5lhGp/8vuJutJsBiQbVewDjJuXrPqSKRBiaVQjvASKN3s8aae0Op
         avQtbHZfwm/e8WYfhl2fDJ2jsI2idpwEgNsbkANuEOCYMInto0M20LB6B7kvYJ04RQYf
         4i1JnjWEtt3PlLw5xlqluQJG5a1HZQhppalc8/ql/xAbkB3zJMtWCSvIqfhMc7BAtheK
         Cigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJknPwaLq9rnEYcTZh5lLSNm0HI7FpaAywxMPndbjks=;
        b=EKAbueGSBniZvIWIjlrEEsz0019Rpo7gWH34pZ94WVmnAnPZaErf+zllH4bB993duO
         0kp0yud5lBUMJF0r2qp1lcEeMSgeVlk4vGGdMb0amwICz6h4gT6qtRSODYsKl+HEpcI6
         Un/NW6O1GbySbd9mSkdH2RqczpmW9FqxDfkwZ+2hKaSQmdahHMNw23BtYHa07UZXxCzM
         4EGijjykqsHBKYSuzQZ8Z/IN0pN6Puf9vKg2TT6bl6jlW08U+VgA4H9bxCrOP/0X/dk8
         p3YFNPBl/Gxb8yRI+GQWxYwwUP8w0tr1eBWFXTyoYXbGgPbLP/Jmjc+LIkbD+0tlw3hg
         oqhw==
X-Gm-Message-State: AO0yUKVT/YxF2Tpcu3IxgX5niIvNP/+suTGfdGPjTLBUYpra1a3xadGS
	X52AYZyI9u+UgSZhQU8HCPBmqzGXBSSuFHzp/0vLoQ==
X-Google-Smtp-Source: AK7set8qP1iaWhPj5PzCd2uPrhhxv+P4DFONg3Z1SUnzaPE/rUb0iYdTAhRykzDEs3VFzSE2FrQhTRjYzjwBIKiyw50=
X-Received: by 2002:a25:ac23:0:b0:80e:e950:29fc with SMTP id
 w35-20020a25ac23000000b0080ee95029fcmr1093475ybi.345.1675064803660; Sun, 29
 Jan 2023 23:46:43 -0800 (PST)
MIME-Version: 1.0
References: <20230125142056.18356-1-andy.chiu@sifive.com> <20230125142056.18356-20-andy.chiu@sifive.com>
 <Y9GZbVrZxEZAraVu@spud>
In-Reply-To: <Y9GZbVrZxEZAraVu@spud>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 30 Jan 2023 15:46:32 +0800
Message-ID: <CABgGipW430Cs0OgYO94RqfwrBFJOPV3HeS24Rv3nHgr4yOVaPQ@mail.gmail.com>
Subject: Re: [PATCH -next v13 19/19] riscv: Enable Vector code to be built
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_234645_187189_B7791D61 
X-CRM114-Status: GOOD (  11.68  )
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

On Thu, Jan 26, 2023 at 5:04 AM Conor Dooley <conor@kernel.org> wrote:
> Firstly, no-implicit-float is a CFLAG, so why add it to march?
I placed it in march because I thought we need the flag in vdso. And,
KBUILD_CFLAGS is not enough for vdso. However, I think we don't need
this flag in vdso since it is run in user space anyway.
> There is an existing patch on the list for enabling this flag, but I
> recall Palmer saying that it was not actually needed?
The flag is needed for clang builds to prevent auto-vectorization from
using V in the kernel code [1].

> Palmer, do you remember why that was?
The discussion[2] suggested that we need this flag, IIUC. But somehow
the patch did make it into the tree.
>
[1]https://lore.kernel.org/all/CAOnJCULtT-y9vo6YhW7bW9XyKRdod-hvFfr02jHVamR_LcsKdA@mail.gmail.com/
[2]https://lore.kernel.org/all/20221216185012.2342675-1-abdulras@google.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
