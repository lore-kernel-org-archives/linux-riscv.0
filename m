Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C40BCDB46F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 21:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+uhZy7+jL2856nEG8xMioWraf3yrdNI5gBtTiQv4RA=; b=vvBv/CxnIoEoYG
	cGxTHZXe9zCSUmur61wHUxfj48UctUTWNKTcpTZ8VW20PLwbVa92HlAp+LwZIjpvx8k6ZdKftj1V9
	Sig0ADzGMzpF420H/0tW4KcN1KPeZNhljlt9Iy2TfBAO1O5KD4hj71b92BsTVKrFVXlVMcR56J2QL
	l4sfpQALnOCZ1SskvR4m+S03VMMd4CkEcV3I4ZCc1TR6/ZdO+h7+4iMAmpNdQ6UhuY7R1ye7rkDO5
	z6rNiSCQVGLlXPlDYd0DC/5u7D0dtEXn3kWoxF9RQVU80o3V/LODEdY/vWivSlWhyZN7EuKBfDR5/
	p5ZIrAgY2+NE+26EFvxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbmBg-00000005PFA-2YbZ;
	Mon, 22 Jun 2026 21:28:12 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbmBe-00000005PEY-0Qhu
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 21:28:11 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso4361316b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jun 2026 14:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782163689; x=1782768489; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JuqJabFFbQmPGzhmB4FLpo8sCHROklOUvbmq7PrEhNo=;
        b=ehsvmDHJEt2ypU1wh8uVSHAwDqi91LVZmpBW2jOxCp735JLNmwPCqJhsdI+rUEScHU
         /tD+hcP1DePraq2Cgp8ig8fN+Kvy6Oqpk5PPnKv+zq6zKsfQbR8ON/Nl3mb3XWYwxknw
         U1I2ij2+HGQHqC89xouXKAZOGhUgs/iBluP0X8y+OCNEpPzDTLwU/WtBW9+R5OclZ6Og
         V9EC+ZCq01aM3LvwUYvdFg2zqsJTwbwG5jXpI1wzkCvZTNdfqS+845jawbdyGwJ4TG8Z
         fypEqSKCK8DEk4XqjiXW2IyybuFVGiowH+7BK6ZEoFQmkePWK9S4Cj7XGGJVddZrFH5B
         HnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782163689; x=1782768489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuqJabFFbQmPGzhmB4FLpo8sCHROklOUvbmq7PrEhNo=;
        b=eDo9ea0RE1Ah9SoquLgroxDgun6K81sOy9WDDAnus9Lv1JjlfeXm+WLJZ/w3rEbMnw
         40HVDA6OH8u4iDNw1vkTyWYO9Li7SDDonLZbzivJ0lf9UQ5QHWF5/e9ZV+o+ipFZlzEQ
         1NER+LvSUPVjiKPZyJhe6k479ITprrF7Bdvgay3AZghKtQChgsYCygwm9bDCWrTphXX3
         JE6wfI12WfqZHjKI5j+Wru1LG2frAClCPewoEZljPFloqQdKucEwiPOK4txka6AlYxu1
         uKcHskW42brQ4cbHQs05OsRPCljXhqOQFjQOhb1roDXznBVD5t5DV5cPXuP9FrYMFn1D
         Mj/g==
X-Forwarded-Encrypted: i=1; AFNElJ8tYtCdtruMF/Vx10JNV4b6LvzJipGsTA8hGRivXqRQDc5bB4HL8RP6aTKPQtm2uDlBxQuj8kuawea24g==@lists.infradead.org
X-Gm-Message-State: AOJu0YztlIwJYLbtoR222Pc5yuVvCP9nORYSunjyJBas8C8i2fZYsGrv
	phhmD3HwD6MKCtI7ENmC+l7BUVNg+z8DOlL1MyidtVqtPls1VN+prmgE
X-Gm-Gg: AfdE7cl4IPoHrSGEwfzXAyLqXUyz9nCyJWHmhVlvj8YLOcJtA5gKIqVmB11jQ4DXOTF
	qqlIRTbV0V7HsdOcQUozUm/E721neQA7rbF7IyLyEigwampgG8bL+y9Nj3AMYDamNd+CnXeEpYP
	hyLYcLM7zWtW5iX48RbJ4bibOQbjm4W3MclgPObDWBqqdaFESVovbNA0uzi2BYlq7ztDPNHYYDQ
	hVTChQcn60pjMVCw8tfFyyobbc23vsjjAbU7P2QLH6nXzx8RjjCspJySn+2bp4946A6m5Q9uk7c
	+S91EWO/KW7jXs0w9b3ZxzsBj+nRVVVA0/498RSYxwWTv8gJLgUyItZ3ww822XhMIyKNOm3XxcB
	0zdwJaCk4Lqf7wxIDcealZ2InnxwDbbch4dqqKKuYIW0O2T4vHPY9/9JA8Gd/A0ca+iCCG7WHNs
	w1vvfdpWFYC9kZ1Bj+x8zhvw0=
X-Received: by 2002:a05:6a00:181d:b0:82f:8e9f:bdd5 with SMTP id d2e1a72fcca58-8455075f2c1mr16724772b3a.1.1782163688727;
        Mon, 22 Jun 2026 14:28:08 -0700 (PDT)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ec335csm8459379b3a.49.2026.06.22.14.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 14:28:08 -0700 (PDT)
Date: Tue, 23 Jun 2026 05:28:01 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Pu Lehui <pulehui@huawei.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	eddyz87@gmail.com, memxor@gmail.com, luke.r.nels@gmail.com,
	xi.wang@gmail.com, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, martin.lau@linux.dev, song@kernel.org,
	yonghong.song@linux.dev, jolsa@kernel.org, alex@ghiti.fr,
	jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, marscheng@google.com,
	bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 2/3] riscv, bpf: Fix support for BPF_MOVSX in
 RV32 JIT
Message-ID: <ajmo4VeTykr5ozBw@google.com>
References: <20260511221648.3251464-1-visitorckw@gmail.com>
 <20260511221648.3251464-3-visitorckw@gmail.com>
 <2ca2a85a-d4a9-4459-a534-6159de6e5890@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ca2a85a-d4a9-4459-a534-6159de6e5890@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_142810_151849_3E31CAB3 
X-CRM114-Status: GOOD (  23.34  )
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

Hi Lehui,

On Wed, Jun 17, 2026 at 03:30:03PM +0800, Pu Lehui wrote:
> 
> 
> On 2026/5/12 6:16, Kuan-Wei Chiu wrote:
> > The current rv32 bpf jit compiler incorrectly treats BPF_MOVSX as a
> > standard zero-extended move operation. The bpf instruction set allows
> > sign-extension moves by reusing the BPF_MOV opcode with the instruction
> > offset set to 8, 16, or 32.
> > 
> > Update the bpf_jit_emit_insn() function to check the offset field for
> > both ALU and ALU64 MOV operations. If the offset is non-zero, emit the
> > correct slli and srai instructions to perform the sign extension.
> > 
> > Before this patch:
> > [   19.549705] test_bpf: #82 ALU_MOVSX | BPF_B jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)
> > [   19.551354] test_bpf: #83 ALU_MOVSX | BPF_H jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)
> > [   19.552576] test_bpf: #84 ALU64_MOVSX | BPF_B jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)
> > [   19.553542] test_bpf: #85 ALU64_MOVSX | BPF_H jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)
> > [   19.554807] test_bpf: #86 ALU64_MOVSX | BPF_W jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)
> > 
> > After this patch:
> > [   17.931172] test_bpf: #82 ALU_MOVSX | BPF_B jited:1 125 PASS
> > [   17.932198] test_bpf: #83 ALU_MOVSX | BPF_H jited:1 124 PASS
> > [   17.933039] test_bpf: #84 ALU64_MOVSX | BPF_B jited:1 124 PASS
> > [   17.933918] test_bpf: #85 ALU64_MOVSX | BPF_H jited:1 124 PASS
> > [   17.934751] test_bpf: #86 ALU64_MOVSX | BPF_W jited:1 122 PASS
> > 
> > Fixes: 8100928c8814 ("bpf: Support new sign-extension mov insns")
> 
> not a fix, the fixes tag should remove. And the title should `Add support
> for xxx`

Thanks for the review.

I did consider using 'Add support' instead of 'Fix' for the title. I
went with 'Fix' because when the JIT doesn't support a BPF instruction,
it's supposed to return an error code to trigger a fallback to the
interpreter. Right now, it doesn't return an error code and just
executes it anyway, producing results that violate the spec and
breaking bpf_test.

Regards,
Kuan-Wei

> 
> others lgtm,
> 
> Reviewed-by: Pu Lehui <pulehui@huawei.com>
> 
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> >   arch/riscv/net/bpf_jit_comp32.c | 32 ++++++++++++++++++++++++++++++++
> >   1 file changed, 32 insertions(+)
> > 
> > diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
> > index 7396899ea276..f8509950fed4 100644
> > --- a/arch/riscv/net/bpf_jit_comp32.c
> > +++ b/arch/riscv/net/bpf_jit_comp32.c
> > @@ -974,6 +974,24 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
> >   	switch (code) {
> >   	case BPF_ALU64 | BPF_MOV | BPF_X:
> > +		if (insn->off != 0) {
> > +			const s8 *rd = bpf_get_reg64(dst, tmp1, ctx);
> > +			const s8 *rs = bpf_get_reg64(src, tmp2, ctx);
> > +
> > +			if (insn->off == 8) {
> > +				emit(rv_slli(lo(rd), lo(rs), 24), ctx);
> > +				emit(rv_srai(lo(rd), lo(rd), 24), ctx);
> > +			} else if (insn->off == 16) {
> > +				emit(rv_slli(lo(rd), lo(rs), 16), ctx);
> > +				emit(rv_srai(lo(rd), lo(rd), 16), ctx);
> > +			} else {
> > +				emit(rv_addi(lo(rd), lo(rs), 0), ctx);
> > +			}
> > +			emit(rv_srai(hi(rd), lo(rd), 31), ctx);
> > +			bpf_put_reg64(dst, rd, ctx);
> > +			break;
> > +		}
> > +		fallthrough;
> >   	case BPF_ALU64 | BPF_ADD | BPF_X:
> >   	case BPF_ALU64 | BPF_ADD | BPF_K:
> > @@ -1024,6 +1042,20 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
> >   			emit_zext64(dst, ctx);
> >   			break;
> >   		}
> > +		if (insn->off != 0) {
> > +			const s8 *rd = bpf_get_reg32(dst, tmp1, ctx);
> > +			const s8 *rs = bpf_get_reg32(src, tmp2, ctx);
> > +
> > +			if (insn->off == 8) {
> > +				emit(rv_slli(lo(rd), lo(rs), 24), ctx);
> > +				emit(rv_srai(lo(rd), lo(rd), 24), ctx);
> > +			} else if (insn->off == 16) {
> > +				emit(rv_slli(lo(rd), lo(rs), 16), ctx);
> > +				emit(rv_srai(lo(rd), lo(rd), 16), ctx);
> > +			}
> > +			bpf_put_reg32(dst, rd, ctx);
> > +			break;
> > +		}
> >   		fallthrough;
> >   	case BPF_ALU | BPF_ADD | BPF_X:

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
