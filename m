Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E90CA0EE6
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 07:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S1OcNZm2KFo8IwhSucRqdeEmlQ0Xa8rX+B8bpKEWnQk=; b=kml6kig1qliISV
	ykW1XNMM8paT3WDmHzaZNb8h/ICtjPkPtZV+Ee6CDaIQ6wUQw6YwfVUR7xLYA/GuUMeS8B4EsUd37
	SAh2MWzqHjS3ULu3AUM5MF4SX+9VpsjJkV5js1I6yS0etLe4ulHmWuQX1Kh+eQ5VC69T/UalXzsx9
	ygjtNCAj6iSPPwh8Y3xvVRk6jzbI+n4+gN3NShHcH+P0W8Tqh50YXqoQLD89ZfeU9PoJHZHzwQ5jl
	PgZAAdAoa/vvH3hcTc96NFGjHsbJXh/8eRegLKP2wl5IkAF3paOBfnDJ3nUM58x+tgjYjRidFlQ8A
	7BdwP4LtYq/+BOZo5zqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoH3d-00000009iRa-44zb;
	Tue, 19 Aug 2025 07:47:01 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGfG-00000009elw-3oJO
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 07:21:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755588031;
	bh=1qP799HCzPVRg6CVmxhJ70r3qHFwwlZzjYjvl4iTNhU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=d3EtPcnLOUOWpUIxF1C8Sgkv5FSBNxYygnFoGdmi4P+P6GhfbmM4SBoIsAy0l/kZ+
	 tHrXm8Qn2vAyPxhKHkRE/00GpW4Www79QWRjCYRx1fvWGCQOVLeAOoSdATxqOAYjxI
	 eqmfqCBd6fN0uNsX7qhZLc7hjs1UgdaJyJr74g3c=
X-QQ-mid: esmtpgz14t1755588022ted6cad14
X-QQ-Originating-IP: CRVqxCUX8FlZvzrs7fdWOZvzYBV2M4m8nCWB082vSFU=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 19 Aug 2025 15:20:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11168661325422464048
EX-QQ-RecipientCnt: 15
Date: Tue, 19 Aug 2025 15:20:20 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Jimmy Ho <jimmy.ho@sifive.com>, linux-riscv@lists.infradead.org
Cc: troy.mitchell@linux.spacemit.com, ziyao@disroot.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, cyrilbur@tenstorrent.com, cleger@rivosinc.com,
	charlie@rivosinc.com, kees@kernel.org, ben.dooks@codethink.co.uk,
	jszhang@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: fix using wrong load type
Message-ID: <D49B33DEEB859CD5+aKQltEZ8Ef3v6rB9@LT-Guozexi>
References: <20250819071318.21103-1-jimmy.ho@sifive.com>
 <B1669DA80470EE6A+aKQldVbfZ9rnlD9o@LT-Guozexi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <B1669DA80470EE6A+aKQldVbfZ9rnlD9o@LT-Guozexi>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NHewSLkhUEP2lcnQapy0nj/f8YvzoUJRoo9bK3cqpynQCzXqfnb4pIw2
	xA9o8cQzSpLTW6CsfywBQZItmtAISt3xr/FdmdccvTSKt8NBIjeEfmc2GM3nr9SAWLjsSs4
	t2R22fsN23w5qFdQGy8ZaMk8j8qCcc96evsVtXymk62aSKpO/XjZNNYfi9zBU/XE78vpFzQ
	Jkx/x9jv7O0dpW5nDqVPM2qgPqY6lVnFm3GMGgiUGlhrw1X0HwYpo07fGse/XyvssyWkZ4L
	GIRCvy/e0zhZwOgCycK8rHvFwCWgIzYrOpvJgBGIgiagBIXuzLRREDV9XNyqr42BobP+ap5
	M1COoQEIGwnY15RNhasqM4uT6TR3IXe5he1GZl5LZd2aSnpwGGx75b+jr81gCQQ2mHCmLgG
	szgJV1Y1SHMwx3PjHSIVMciIgJ2m3yUnf1LZli4CL6dgyJKm4iFYvW9P9hZrxUlvFK4we5T
	SVpfhgKp8jWsubDxWPU+hkrkMrG3Q6GrUEEALr1vYB7XXgEmofZQIEKRyuv/7+dPhb5jM2V
	6oOCurqDK3IuTIfOToRXPcZ1XopUjVCnxIOGmTIFJ7k6X0Ot4Wx2zBnph/pi/Rd3ZfSK709
	Knp00QCURqXpFh6e/a3K73zebqtF5edid/Z7cmfz4xIiHwiYhG9P2gemBhd0b7RHJ3IeQ3f
	HQU8pL2fyGr31TdjgqUzQ25efR+NtMN/ziCKBq/sFPYk+js+ukaGj6Clb5gRlpmRZz81+DR
	Ud+nfEPIndwXxQ2uTONNQUkVAPE8qFiTAIduhffG+JYWzIdvWAqqIFP9QlcCZhWG7ltzkX7
	up+Q4oCaLPqSn1GvpEBmlUGO60m2i7fZuFJsnaoVodlhTdRoyn41TzdYZ/iXWPoM391BKaG
	BWGsUt6mRCDmKK1E6LVBDtVXgLe6Td+OLZV92Fndqo9mcDGiJBePG0lf5BIaciTzE96DaW9
	mj/a8rUxJD02xXEfb1G+7WQQvNUFFwQVAQHEY27xdQ3ycUAPlARiAZ9j1/MvwtjYZLJJvT5
	IPVK2nmnWouFtO1Pxi7zvHRz5SIyjiFYGc5yrr5I8r7ENHHTsDRgs2GgOErrjBF6iT4z8Nq
	ooxZJtGSwN+OdwdxVyFBROoTaf00c1ODt4LDCRhmwl9J7XDY/UuvU8NkNSixEByw4/r/Ebq
	0X1W
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_002151_484102_BF82BD03 
X-CRM114-Status: GOOD (  20.58  )
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

On Tue, Aug 19, 2025 at 03:19:17PM +0800, Troy Mitchell wrote:
> On Tue, Aug 19, 2025 at 03:13:18PM +0800, Jimmy Ho wrote:
> > thread_info.cpu field is 32 bits wide,
> > but is accessed using an XLEN-bit load, which might be 64bit load, fix it
> > 
> > Changes in v3:
> > - replace space with tab to keep it aligned with code block
> > - Add "Fixes" tag
> Please add previous version link.
> 
> > 
> > Changes in v2:
> > - add a comment to explain why use lw instead of REG_L.
> > - correct commit message
> ditto.
> 
> Additionally, I see a patch here that serves the same purpose as yours,
Sry I forgot to put link:
https://lore.kernel.org/all/20250722160556.2216925-4-rkrcmar@ventanamicro.com/

                 - Troy

> but it's more comprehensive and was submitted earlier.
> 
> In any case, if you'd like to proceed, here is the:
> Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > 
> > Fixes: 503638e0babf3 ("riscv: Stop emitting preventive sfence.vma for new vmalloc mappings")
> > Signed-off-by: Jimmy Ho <jimmy.ho@sifive.com>
> > ---
> >  arch/riscv/kernel/entry.S | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index 3a0ec6fd5956..492ae936dccd 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -45,8 +45,10 @@
> >  	 * Computes:
> >  	 * a0 = &new_vmalloc[BIT_WORD(cpu)]
> >  	 * a1 = BIT_MASK(cpu)
> > +	 * 
> > +	 * using lw instead of REG_L is because the thread_info.cpu field is 32 bits wide
> >  	 */
> > -	REG_L 	a2, TASK_TI_CPU(tp)
> > +	lw	a2, TASK_TI_CPU(tp)
> >  	/*
> >  	 * Compute the new_vmalloc element position:
> >  	 * (cpu / 64) * 8 = (cpu >> 6) << 3
> > -- 
> > 2.39.3
> > 
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
