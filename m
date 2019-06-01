Return-Path: <SRS0=939U=UA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28189C04AB6
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  1 Jun 2019 00:10:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF1B227061
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  1 Jun 2019 00:10:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TUpNSQKY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5/IYJMd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF1B227061
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iKy3DUvNWcaAg/gpE0hRrGQ2KPYtrKEBJiaZRC2yDUc=; b=TUpNSQKYpDXPgE
	wrN4PjQuOxztg3M/hpBpv5F+H4dl7EeepQWyFxCib6yFziHvCvU22ZiCboBr2ZBELCrF5Ww3aDpvP
	wlGLcxHAy0JqIWtsSi4WbKjkVqKu5RZUcApNOBt6pdlA1YUoGKwOAlW0+TQQ97j8tFK6ETbK8Kyox
	TfzPq75kBuGru373nq2cJQ/LCn+9Hzh5ckOD4KYC2sN5lidwkNZelMTP2g3MeCn0qQVgXf56gtjx0
	q7QZAesas7IwGn95C7dfKKv2rInn4O/fc/VLb0kgqBdUc2MmGeOsmehwei53d8RnqJ+MTcmyQioeB
	pSQN3YbXBFwuOLhdXQng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWrau-0002U9-CR; Sat, 01 Jun 2019 00:09:56 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWrar-0002Tj-7w
 for linux-riscv@lists.infradead.org; Sat, 01 Jun 2019 00:09:54 +0000
Received: by mail-lf1-x142.google.com with SMTP id m15so9259900lfh.4
 for <linux-riscv@lists.infradead.org>; Fri, 31 May 2019 17:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0O5y3zxJLjO+OFcgaKEEvfFc20FWAOhAiAEXszX5msk=;
 b=f5/IYJMd1LneyL+J8KijD7RhbM6Yv+/UjfPlJ+IyfR71JYrZTBHIcgcWhxj0ZuSFlf
 OauU4xnS3yObYtej+TYeCNAHUc0owB/GmIiqSBLtmyHob8WcFJCYzY0hQfgSN9BL2n5p
 v+lnk7bSk7FN1Qb9sPdaunp6cSpccBktCTJkRJAS+SIbDC2qXdTWi9waHRWvw2ygwVNq
 CKpkGopD9kC46BNoVHj3CrsEf3iMh6sLgkVk7DiFXGWSSRyMXnySyghedmX95SQ9bH/Y
 lIFXXm+3cSwEUKsCaPH4ApA8BwjqYp95fkGqEw0Rh4PuTj/3apztACv2b7RDKJyBN9xQ
 vt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0O5y3zxJLjO+OFcgaKEEvfFc20FWAOhAiAEXszX5msk=;
 b=WMmsQbBkiUdqlStfFihK/NfM2e4+Q8s/xpmplnDprecLGfC8NQBLIIdul5JYslZXJW
 oC7BECbPONzlvdTZvFIFVzU8XHl3BlFUcOgBFMo2XzyoWqAtMVoqNBKAK2WiYXXw0njX
 GYZJ6OuFbu43s189CqPzt6UbjWgoSZLPV3XkXJZlQTDudu1Z52BaJLjKgdef47C4vJAW
 B23cbgpXUuNQrWYLQ/qFOvnEBkXLbeL+tLfsRqRMPqTgPjfNq4hJR+9fSLtP9Dnfz/Yo
 az/p0pW6xjqnT7L5up0m+e77gJVxhyFKpRNiCFkLfHGIVbXp4zSmtMWoyX6t9HZBEQK7
 ngIg==
X-Gm-Message-State: APjAAAXFykNowQBnzK6QXDzEKbJAb5sop33B7l0XmXTL9wDq/FNlibIl
 aTdt6QdaJSfla9pPmO2ucZmtsYaUkwi3QbMdLZc=
X-Google-Smtp-Source: APXvYqyU0iW+NSklLJf3qHZtRLKPHQxuDtnO3IWUd1+SsBVtZYgctk9VnfK45znYVuqr6WdQ3tVVp0jlNS88Khwb+FQ=
X-Received: by 2002:ac2:5337:: with SMTP id f23mr7428221lfh.15.1559347790765; 
 Fri, 31 May 2019 17:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190530222922.4269-1-luke.r.nels@gmail.com>
 <mhng-b4ce883e-9ec7-4098-9acc-18eb140f93e0@palmer-si-x1c4>
In-Reply-To: <mhng-b4ce883e-9ec7-4098-9acc-18eb140f93e0@palmer-si-x1c4>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 31 May 2019 17:09:39 -0700
Message-ID: <CAADnVQJspryT=Dvkh3vyyPv1air+Gfk61=uwWwgtD1sZb5PdnA@mail.gmail.com>
Subject: Re: [PATCH bpf v2] bpf,
 riscv: clear high 32 bits for ALU32 add/sub/neg/lsh/rsh/arsh
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190531_170953_279631_196D56E5 
X-CRM114-Status: GOOD (  11.54  )
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
Cc: Song Liu <songliubraving@fb.com>, aou@eecs.berkeley.edu,
 bpf <bpf@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 luke.r.nels@gmail.com,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>, Yonghong Song <yhs@fb.com>,
 linux-riscv@lists.infradead.org, Martin KaFai Lau <kafai@fb.com>,
 Xi Wang <xi.wang@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, May 31, 2019 at 1:40 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Thu, 30 May 2019 15:29:22 PDT (-0700), luke.r.nels@gmail.com wrote:
> > In BPF, 32-bit ALU operations should zero-extend their results into
> > the 64-bit registers.
> >
> > The current BPF JIT on RISC-V emits incorrect instructions that perform
> > sign extension only (e.g., addw, subw) on 32-bit add, sub, lsh, rsh,
> > arsh, and neg. This behavior diverges from the interpreter and JITs
> > for other architectures.
> >
> > This patch fixes the bugs by performing zero extension on the destination
> > register of 32-bit ALU operations.
> >
> > Fixes: 2353ecc6f91f ("bpf, riscv: add BPF JIT for RV64G")
> > Cc: Xi Wang <xi.wang@gmail.com>
> > Signed-off-by: Luke Nelson <luke.r.nels@gmail.com>
>
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
>
> Thanks!  I'm assuming this is going in through a BPF tree and not the RISC-V
> tree, but LMK if that's not the case.

Applied to bpf tree. Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
