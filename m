Return-Path: <SRS0=Ue47=4N=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EA7C35DEA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2020 00:42:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 241C721927
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2020 00:42:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PyEx4gYk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWN2NQqF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 241C721927
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lA69AZrelbjB6ZozmKLqS29rj9UvPNFt448gKkt1TTU=; b=PyEx4gYkJr4aiU0sC0DHEtKrg
	QBoLA+FPeb0b19ZEUPrsjerGVplvDNoGcHVXd+6ACpk+Ctbksx+9WVVwvRgXwT0Ru8zsa/YZLGd08
	7HcTL+Eu9HuJYXVZ/w/jiXkuAGIG8OOaUFIHYPVK/ahHCk0XX6lR2kXUVFgbVwvkS75TbHgqgMenx
	sArIDY7ybDUZM6Gwgyn1c0sKhywOF36kZvvxx7yzWO/mFXDfQVDcnZtReWgqlwN9j+0DW5Eor7JIV
	o4sc4eMG8rLm2rDN4trFuKOitT46fpzHwacOKxUEW6m/1fY7tKmHRCyLo6+QNpvhIxIh1KABO/TWE
	VSbIn/T2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6OIn-0004cN-Km; Tue, 25 Feb 2020 00:42:21 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6OIl-0004bX-5e
 for linux-riscv@lists.infradead.org; Tue, 25 Feb 2020 00:42:20 +0000
Received: by mail-lj1-x244.google.com with SMTP id r19so12136960ljg.3
 for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2020 16:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lA69AZrelbjB6ZozmKLqS29rj9UvPNFt448gKkt1TTU=;
 b=eWN2NQqF8H9E8iqjqcRhAq8mfdZexJPS1qljBBJW/NanjLjXH13l3200u1FuzAjoyL
 VBbxFpMlaktno1iR8LaitoQ5SMoL8z1IKpmZGUNxFtO0xooZbzNro0XQ+pewMzZ3fpXq
 l45crp+4x0h8MHSrpEgwmtWS7DsYswQ1C5oj7YA5WT+4TOpZrcytr2Qb6H50XyWcwHeC
 rxejTHWxkmDV8kWcUMkX4lmaxyoBAk0cpIAEFYbwK19zbo3DovYMTVmm1ieixbmP1elf
 SB1pcrX2hHVCktYdG39FwrFlH+X5BFN6nTKBnnhzs1yYtyR+LCIDvCtPMavkR7G2URJf
 TQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lA69AZrelbjB6ZozmKLqS29rj9UvPNFt448gKkt1TTU=;
 b=kDohsreoQrlx+EySDerzMuVRddZdHBNQx5bTzAWDA5iQF//G8dwxYEZhZ91CnQaiar
 PTdBpTcqcomzRgNA5z6OGnZ2wmQCE5WvXevYloRtdDVd8lnxN8Dr/I2DkbF6xUEuypXY
 AZmmF/2OQMueliTUqzvpMMPwOEe9EHnmgDChMlaucLGCossHEiVcuZVSpR/sDueM5z2+
 iyrMnOvXMTGTP6644mBdOAfR8nyWfyeu5STpd2WSz31Ywcsj2x4njkApkv3YM9MMRmCM
 SXTOAEeHXq2VN3Zx4C+qCkum5CEu6waMOaZiBnjBDJiCdcsVCNcDqUUoVh63dWiBSA6P
 r1Tg==
X-Gm-Message-State: APjAAAXWAuHHo+emiapdpBmAmTBI7jG+Erv4/vHvNVorxoxUZ6dcfHai
 eiTASUGXN9JQYN6o0ETB3zGOIDYqGtt8JFS2w90=
X-Google-Smtp-Source: APXvYqzXfk38ncOBiqWLLtL3ANUuqOkZ6lI3WcgNsksE+wsyFWFQjVmFwXajjHPeQu9ShCfoYJJd1T9Z1h6M1+72y8I=
X-Received: by 2002:a2e:a404:: with SMTP id p4mr32991570ljn.234.1582591336526; 
 Mon, 24 Feb 2020 16:42:16 -0800 (PST)
MIME-Version: 1.0
References: <20200220041608.30289-1-lukenels@cs.washington.edu>
In-Reply-To: <20200220041608.30289-1-lukenels@cs.washington.edu>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 24 Feb 2020 16:42:05 -0800
Message-ID: <CAADnVQJTtNu5a2oM=8poe6FHXeQttG44S+7XvuqQtv1Cgui8tg@mail.gmail.com>
Subject: Re: [PATCH v3 bpf-next] RV32G eBPF JIT
To: Luke Nelson <lukenels@cs.washington.edu>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_164219_212357_CC7D84CA 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
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
Cc: Song Liu <songliubraving@fb.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Borkmann <daniel@iogearbox.net>, Jiong Wang <jiong.wang@netronome.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, linux-riscv@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>,
 Andrii Nakryiko <andriin@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 Xi Wang <xi.wang@gmail.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 19, 2020 at 8:20 PM Luke Nelson <lukenels@cs.washington.edu> wrote:
>
> This is an eBPF JIT for RV32G, adapted from the JIT for RV64G and
> the 32-bit ARM JIT.
...
> v2 -> v3:
>   * Added support for far jumps / branches similar to RV64 JIT.
>   * Added support for tail calls.
>   * Cleaned up code with more optimizations and comments.
>   * Removed special zero-extension instruction from BPF_ALU64
>     case, pointed out by Jiong Wang.
>
> v1 -> v2:
>   * Added support for far conditional branches.
>   * Added the zero-extension optimization pointed out by Jiong Wang.
>   * Added more optimizations for operations with an immediate operand.
>
> Cc: Jiong Wang <jiong.wang@netronome.com>
> Co-developed-by: Xi Wang <xi.wang@gmail.com>
> Signed-off-by: Xi Wang <xi.wang@gmail.com>
> Signed-off-by: Luke Nelson <lukenels@cs.washington.edu>

Bjorn,

please review.

