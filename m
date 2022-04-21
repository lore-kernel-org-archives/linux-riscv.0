Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AC0C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 15:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x3j0vF+TJgDSZneaWBYmT90QBwd+tv9hR+FT3MEcj+8=; b=NG8hq8lZYo627S
	vzonJL/qj0/uJgQCCKVeA7HEZ5mo7431n5G/C0ZkpkO4+DpbZMzTCxgJ1VobrRwz13QmC6TbvlFXf
	R9neA76WCv+CY5eOWDhrzTKaCcfA1wcHUaFyx9SpqDxqRsgAA1CSZnm8b73SePzflb3nWlWT3hSfk
	k6v1uGiIumyp0jEkEc96di2Q29dlT2nQMI3Kpto5x2n8Z2Q4t/7Wx3WT+1gRDjAbWJ8D6ktF6tA4p
	+s98RkXCaejc0nPGlyoCXg3laJnfl0fFgSq3HYVBhke1IyziUbVohpmlK8b74pFHY1SBUS56b4CsP
	RwPUbP3ngHj6+fZWBMPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhYk2-00E0Zc-F0; Thu, 21 Apr 2022 15:29:10 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhYk0-00E0Y0-66
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 15:29:09 +0000
Received: by mail-ej1-x630.google.com with SMTP id u15so10735487ejf.11
 for <linux-riscv@lists.infradead.org>; Thu, 21 Apr 2022 08:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QrA9XZmQJ3pzwkzftPloH2yboFwnXRie+CWHLphliSk=;
 b=Goof91mBcka2VgETshL668shaAzHbdRfpyNvrN5YOcp4rhboXwZMtZDVAaWyLyahuQ
 CdaDmp2jWbyV5OJCLb9mFBtn8VUpNhEqnHvKmW2rmbiU81mufV28MWCU1u7VvAeUZEd9
 2u4xZXMNL1TOKfntRmdjyFc8vFUQU+K2rPooY6bMN8zqt91QKzhS2BhSAUFJld7m2EPZ
 SNq/Kb9bmfpSLvL0klMqmIih/kL/HnekghPnIjYHA8OSyGeGTmeuiE0Bbf9JhAQLARJc
 zOgCs57NF6H9sId258Pbwyy2EVsOsG9tO9VANSYUVqeN94X01agrIHg1uGNe6d7B1uaw
 /r6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QrA9XZmQJ3pzwkzftPloH2yboFwnXRie+CWHLphliSk=;
 b=2CXrBslQzk+R8Tkl3aNS5m1eQRUEgWHSFb8SHh/rGI3cXf+xHP4zeQsZmbppmmcycY
 ZbV0L8a2D13fgtgXRcDDqhXZKq1VgFvIETlJ03pgAJ7E1EtB18HwoJ56m5Cs8pdNjYkx
 RToRqYsd7DqHFWmFxIkO4c2U97S0RwKnrc56fNB1cuB/YAO0hnwy4xOBXMvNF8ffX5zM
 BlS11Phs3EFnNRlS4z4G9LmnuFWItPoBFzQ4u3W6+e0vg2TrB6JjxWzPhClTT4gNusnC
 UWOLTwUU6PHHdpsIDlsrPyU8MHHD0AhcLauOwPDauACGWq3sTpnKwwShbNLiC0Lm/7Se
 ++Xg==
X-Gm-Message-State: AOAM530w9S3jrcp3hNG1PrNv2wsAYpiAC50sHJhDLZkj4yy/aBy1WanT
 pJTwXbh4Gkp6QLE/EOIAilxYMjp4Yir77vlb3g4bag==
X-Google-Smtp-Source: ABdhPJwdgR44vtT8cq3DFzLTy4Q7GdhPWMlulCx49QBzEtRNAYLnPLMlOP09qRIzOTf6f3uQrAGXR9/c5PPBDTovPvs=
X-Received: by 2002:a17:907:1c8a:b0:6e9:2a0d:d7b7 with SMTP id
 nb10-20020a1709071c8a00b006e92a0dd7b7mr85739ejc.572.1650554944449; Thu, 21
 Apr 2022 08:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220421082042.1167967-1-tongtiangen@huawei.com>
 <20220421082042.1167967-2-tongtiangen@huawei.com>
In-Reply-To: <20220421082042.1167967-2-tongtiangen@huawei.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 21 Apr 2022 11:28:27 -0400
Message-ID: <CA+CK2bCWRL_vXW1BUhxb-zLiywXTCQdaa+9feEwQytYW=K46-g@mail.gmail.com>
Subject: Re: [PATCH -next v5 1/5] mm: page_table_check: using PxD_SIZE instead
 of PxD_PAGE_SIZE
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, LKML <linux-kernel@vger.kernel.org>, 
 linux-mm <linux-mm@kvack.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv@lists.infradead.org, Kefeng Wang <wangkefeng.wang@huawei.com>, 
 Guohanjun <guohanjun@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_082908_318055_6614DCC4 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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

On Thu, Apr 21, 2022 at 4:02 AM Tong Tiangen <tongtiangen@huawei.com> wrote:
>
> Macro PUD_SIZE/PMD_SIZE is more general in various architectures. Using
> PUD_SIZE/PMD_SIZE instead of PUD_PAGE_SIZE/PMD_PAGE_SIZE can better
> support page table check in architectures other than x86 and it is no
> functional impact on x86.
>
> Suggested-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
