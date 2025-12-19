Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13594D78785
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 14:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=puQyT4rHehHQvAvQ93FOrsrPAqf25WxOBglFgaHQuQg=; b=shoS0sjQFauSfL
	5sCGTp/iYNrrDWOdJzUv8fiWrxQ0BhCxRlDHGvwF1eUmEJVjgbwBm7N8Jvp1yStCnXcXSQcbBsHUG
	tdVCw6lzA7vVGUlrf/zPJ/DSfGntizj8Q5+c37pGZwLQh8RRYzOW4YAtqVkpK4C6StV4EVqhEd8Nv
	gxb+OCBrgALQTijfnB1J68dZo6vo2qFRz2Ax0BK7Co9Vgfpfy04ZJ0/hlxPWumA/oFqi5dRDO97wC
	TBK+eUepnMvKFKHR4xlfahrQpnTCTCE3hSD8uGlfoTknQXNe3GXjppI9hdPFjzTC7y+BavckgHHwS
	X86zrxNTdOMqGGzXFlHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWboY-0000000ASM9-0BsJ;
	Fri, 19 Dec 2025 14:50:42 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWboU-0000000ASKD-28Pq
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 14:50:40 +0000
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail-out.m-online.net (Postfix) with ESMTP id 4dXr7C0z6Gz1r2sG;
	Fri, 19 Dec 2025 15:50:31 +0100 (CET)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4dXr772X0Bz1r2s2;
	Fri, 19 Dec 2025 15:50:27 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4dXr770FwPz1qqlW;
	Fri, 19 Dec 2025 15:50:27 +0100 (CET)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id 92L-rQcDmWKo; Fri, 19 Dec 2025 15:50:15 +0100 (CET)
X-Auth-Info: 1X/yyBFQ/IZ2joL65/JDyiFRPFc9SosyZ5/1WT994dlm69mRhPapn5zjiUW2unij
Received: from igel.home (aftr-82-135-83-185.dynamic.mnet-online.de [82.135.83.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 19 Dec 2025 15:50:15 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
	id 761962C18F3; Fri, 19 Dec 2025 15:50:15 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: Menglong Dong <menglong.dong@linux.dev>,  ast@kernel.org,
  rostedt@goodmis.org,  daniel@iogearbox.net,  john.fastabend@gmail.com,
  andrii@kernel.org,  martin.lau@linux.dev,  eddyz87@gmail.com,
  song@kernel.org,  yonghong.song@linux.dev,  kpsingh@kernel.org,
  sdf@fomichev.me,  haoluo@google.com,  jolsa@kernel.org,
  mhiramat@kernel.org,  mark.rutland@arm.com,
  mathieu.desnoyers@efficios.com,  jiang.biao@linux.dev,
  bpf@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-trace-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org
Subject: Re: [PATCH bpf-next v3 3/6] bpf: fix the usage of
 BPF_TRAMP_F_SKIP_FRAME
In-Reply-To: <CADxym3Y098836fHHRSjeryxCp=CPB8sDU19TBBVs07VZOERJXw@mail.gmail.com>
	(Menglong Dong's message of "Fri, 19 Dec 2025 22:04:32 +0800")
References: <20251118123639.688444-1-dongml2@chinatelecom.cn>
	<875xa2g0m0.fsf@igel.home> <5070743.31r3eYUQgx@7950hx>
	<1948844.tdWV9SEqCh@7950hx> <87cy4aeg56.fsf@igel.home>
	<CADxym3Y098836fHHRSjeryxCp=CPB8sDU19TBBVs07VZOERJXw@mail.gmail.com>
Date: Fri, 19 Dec 2025 15:50:15 +0100
Message-ID: <878qeyedaw.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_065038_713287_205B6521 
X-CRM114-Status: UNSURE (   9.82  )
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

On Dez 19 2025, Menglong Dong wrote:

> @@ -1171,6 +1167,8 @@ static int __arch_prepare_bpf_trampoline(struct
> bpf_tramp_image *im,
>         }
>
>         if (flags & BPF_TRAMP_F_CALL_ORIG) {
> +               /* skip to actual body of traced function */
> +               orig_call += RV_FENTRY_NINSNS * 4;

Before this line, orig_call still contains the same value as func_addr,
with the latter being dead, so there is not much point in using a copy.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
