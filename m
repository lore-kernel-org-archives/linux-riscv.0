Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AB8C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 01:22:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86D8F611CC
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 01:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86D8F611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=chunyAwHG06NX0imivOgYMGaPdW792o0dth3AjJ0zZ4=; b=ETgP2kZBynHew6
	amxF/mYGHWwMQCzXlFpXrpIskC6CzPqpPAaiJfztK5sXhRIobNoJX0+ZjHaN13NTNBnv+ZkttF9qm
	EXafZRuQMVSAZL2B4ck2Kv0SE012qy0PAwVLuiGKH0df90fg1wwQcPmHz3Zusmbnnif2Z5hwopjN4
	MCTETVF5WiWN5xsaQgK83biDJL2dpHhZNLNsvTsEIGbb7LLmTMcG8o4QAfzoH1nmxrR0wbmHY8zJH
	TovrUx5oNgJycMI4zEAuAW74YrGAdWwZdZxDikrDd1J/TO3DHVm8VALtbPvYRSJAL0DmTS0jU8rrx
	5ejzoJRNW4Yu+cOuNL9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdMn1-006BxB-1m; Thu, 21 Oct 2021 01:22:39 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdMmy-006Bwa-Oi
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 01:22:37 +0000
Received: by mail-pf1-x431.google.com with SMTP id d5so4480463pfu.1
 for <linux-riscv@lists.infradead.org>; Wed, 20 Oct 2021 18:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GRLMpz20W+uWjSSx3JO2MLjsrcVU2TkHeUAxLEmJB58=;
 b=R3SUN5E4mDf3iv5WJwjMQdSDM5mATS7L6fZHzSHe+IBMasEJ/Skwfld6uw08RE2dcm
 Wn4Nl6EKnHup9cBEeoC0bugXURgBysYenN2rJIb4i+hN+i2wLLuATTGkWYVTfyO7ldhO
 RHWs4d+LMbrAwKh2zhrmjsOMmN+i66Y436NntymrMczeRQLQntR4L69eWFXD2vowRncc
 0WvweQzeqCMOqOY/lhpC0b8Y9Wx3KJMmjexUZJpolM1Cm5pkG0LTzQEKPGYwVxYfSnz2
 xJibmt2ut51V0ez9w9pfNXrII/JzI8TvL1HDc81hvi6etz7eIv/NsEnVTqXWL986MobG
 Y32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GRLMpz20W+uWjSSx3JO2MLjsrcVU2TkHeUAxLEmJB58=;
 b=bBfJZNSpqs5nIz/CcZapNG7Tczy9qa/dM952+6T1h9I4IhmbtwqDiMS4/bh1xIC5M0
 sGYmhAs3V1xX8aqLXzLWn/0ZWi9SmAiEktD/E3uWJGYEvCF9w7C5x58ebJ0pjG1CYtCZ
 hemLgTKdLlr2aPTCIrB+GJSyVzJE5swScUdc4ookQkAauMN/K32H90KZt8lFxwG+vSZz
 ZpDTpMVspKd8MC1CUjSg89N9Rr3sDge0QE7Nv55B1jhgm4TvsCFsTzs17Xb5nMVhmpXG
 CuM4zWhXZDCESGccPCyKpd7DBR3IXt918JuwLU1RB/lCzyeU/Gm3CV+ewUNAVbV7FzPE
 ZSEA==
X-Gm-Message-State: AOAM531KrGdtp4JgH+2y8fzdfCLpJ1l4d0OCvLyS6nSmORfVx7iqjLXI
 HwGPECB6wkv3WplI7fHCGWBdHmfuzd+Gob0eUVM=
X-Google-Smtp-Source: ABdhPJytfbK6iVZ4JeBA2xLyuOJ57QviX7QpjPKNosl6WEl0zzOnxGXZ9AlPU1P8coSQxpPKhaH86KdqqpGYMK1x7Oo=
X-Received: by 2002:a65:4008:: with SMTP id f8mr2062629pgp.310.1634779356017; 
 Wed, 20 Oct 2021 18:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211014142554.53120-1-lmb@cloudflare.com>
In-Reply-To: <20211014142554.53120-1-lmb@cloudflare.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 20 Oct 2021 18:22:24 -0700
Message-ID: <CAADnVQJRUz81YeBqM-Kk4OM7FXAw07TNA_mOY1ZGAZ5MHpsE2A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Fix up bpf_jit_limit some more
To: Lorenz Bauer <lmb@cloudflare.com>
Cc: Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 Luke Nelson <luke.r.nels@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 kernel-team <kernel-team@cloudflare.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Network Development <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_182236_822795_DD067E83 
X-CRM114-Status: UNSURE (   7.30  )
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

On Thu, Oct 14, 2021 at 7:26 AM Lorenz Bauer <lmb@cloudflare.com> wrote:
>
> Fix some inconsistencies of bpf_jit_limit on non-x86 platforms.
> I've dropped exposing bpf_jit_current since we couldn't agree on
> file modes, correct names, etc.

Applied to bpf tree. Seems more appropriate there.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
