Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE1BC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 20:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4ivWHEHqSnoum7PmmoEoZwusWdbnLXQ77didlP5DRvs=; b=qoDgGfi0nKYUUcbBOSSZ36UMrM
	Ca5fDCiX+cD2dx+R99IhdWjr8SeybnCDCOloz1wDgw7yH2zGuoVMKmZyEd6ZZCNP1Ov+PigOMAHY1
	Imp5Q+1IkbK40R7AXDRq1/ieOgW/Q7Zk4Ybeiq3pJO8vOhty7flfOPGaQ93qQdVZ97KeUeA/ci2Uw
	qQ7wHIvGyydkxEFL5ExQ1KiqltwD0WvVweYL1XSn97r0eEB6PmUhj3/yv7lr5COmzOCs5t2bymMqz
	lnWlrco/dRvaTQZwdcsFrz8aMSn9udnfY09laK/zjaPcndTuPzl6AH1AfK1iRdzfvsNBblhwivv31
	IR2M+Vew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nn52k-0052ko-LU; Fri, 06 May 2022 20:59:18 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nn52i-0052kB-2W
 for linux-riscv@lists.infradead.org; Fri, 06 May 2022 20:59:17 +0000
Received: by mail-io1-xd29.google.com with SMTP id o190so9354576iof.10
 for <linux-riscv@lists.infradead.org>; Fri, 06 May 2022 13:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding;
 bh=Nq1jhHTyUB0btWPNhxYltvYS+C1e550wDIkKCw2n7r8=;
 b=lkHY4dcyhn0aLJYJtjuECXL00hq+a5aXvIQuS07AUtCk2pp5v+kL+zQEv1IEnqjjOO
 mtbYsn1zwyFOUBBHPbiyHe+ysF5d7YabJD4V1h7rI2vrhjl8PZT8tncjWgYlcDNbgzsw
 fQquVpRC0FSG1QjbxEgS6kiYOuBEsRlzr5ViJRgYEz3ng2GKTXX/6ca+jlEFEZZ2izsV
 LvDovelBQEfAtvAkBH9OFhQv2LE7P263ta2DxvdRwfGIYj9qxD450fMUpweD7thuZUZG
 nlm9B0P+ILI+t8zpOtHrON123wiBek/ha99cInddIIQ29URp1shIyEDKAphV7Vall/0G
 8iKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding;
 bh=Nq1jhHTyUB0btWPNhxYltvYS+C1e550wDIkKCw2n7r8=;
 b=NaiV07Dhe79MyuWgb0n46fHyFDQJTavk8uQb86Yd1rcm/RdTY79zTs4yc0Gf3Y1Xiy
 7g3aGTMUn6BRXJijndMztkotWfqhchpfOvty/SHyDWV+YWoVEXBu9EH1kAtC28ZkGwr5
 pQWId2IqiCip+UGkjBjzE0wY5Cl7nSPCHgNkfe/XZ6yAhbgp9kNAhbaI9cPn+BW8DdNA
 WkTsa3Rm0/jeJkGH0beL1p7TpRWl0KlJnTJxOqg6SgYUi37VfxRH2UftHuCv8nbHoo/+
 kudBAL1yQyC4v7dyOcUH0inocNZXJ1Ju/gayPU6THl2itLEJWHO8GRj5fpC3IWW/cBFJ
 U1vw==
X-Gm-Message-State: AOAM530U6a8tUyt8EUJb17MoxpDewwjer/MHzfZJtk10PCLzReoDGZdY
 E3zKgRAQ+Hd77/2aAmyFqLs=
X-Google-Smtp-Source: ABdhPJyNAi7sSCmw+K0BxgixB4ZYe/BbE15nYIBlfT3Fjv26X5cL9B+ZFQMdx+YQ0c+0dwiyNeXZJw==
X-Received: by 2002:a05:6638:502:b0:32b:8c53:f737 with SMTP id
 i2-20020a056638050200b0032b8c53f737mr2223887jar.121.1651870754254; 
 Fri, 06 May 2022 13:59:14 -0700 (PDT)
Received: from localhost ([172.243.153.43]) by smtp.gmail.com with ESMTPSA id
 b15-20020a5ea70f000000b0065a47e16f5bsm1485608iod.45.2022.05.06.13.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 13:59:13 -0700 (PDT)
Date: Fri, 06 May 2022 13:59:06 -0700
From: John Fastabend <john.fastabend@gmail.com>
To: Pu Lehui <pulehui@huawei.com>, bpf@vger.kernel.org, 
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pu Lehui <pulehui@huawei.com>
Cc: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, 
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, 
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Message-ID: <62758c1abea39_196b72087a@john.notmuch>
In-Reply-To: <20220429014240.3434866-3-pulehui@huawei.com>
References: <20220429014240.3434866-1-pulehui@huawei.com>
 <20220429014240.3434866-3-pulehui@huawei.com>
Subject: RE: [PATCH bpf-next v2 2/2] riscv, bpf: Support riscv jit to provide
 bpf_line_info
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_135916_155843_8CD663FC 
X-CRM114-Status: UNSURE (   8.96  )
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

Pu Lehui wrote:
> Add support for riscv jit to provide bpf_line_info.
> We need to consider the prologue offset in ctx->offset,
> but unlike x86 and arm64, ctx->offset of riscv does not
> provide an extra slot for the prologue, so here we just
> calculate the len of prologue and add it to ctx->offset
> at the end. Both RV64 and RV32 have been tested.
> 
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---

Looks reasonable to me, but would be good if someone with RISC
knowledge takes a lookt hough.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
