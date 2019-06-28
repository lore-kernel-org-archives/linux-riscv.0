Return-Path: <SRS0=iP4V=U3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787FEC5B57B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2019 17:41:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56D2F20828
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2019 17:41:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dJI4Z6FV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cs.washington.edu header.i=@cs.washington.edu header.b="lOFXls3F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56D2F20828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cs.washington.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/DuPnm2AHdrBTql4mFk4si4//q2gZUCAZf6ej2dgj4=; b=dJI4Z6FVvqOetb
	rhQhJUU8vxiqFmLY9+RWPNubBSb+qSmEmd3ncd1vsIsJJv9+qfVOGqvZa6VeBJ9yxAcXxleUf6eyy
	pfZN4OFA7Qd0LG1IFy8C1jmh+BqK9TuF9UkhcFEXI8eaQSYSL6XqEiTmPZEvRWp2WHEKhmoMTnm6l
	o749tEcaZmE/tBp6qaa+Z2qZbN+R5KIbKI7RT6nMqonWDl2T+/3oHPz6rVOeidJm1YAccsRrrtlsU
	WZXTkr1TgjQRFPRo/DRClPAv4vo/mZOk0w9KyJZIT19Ja33fi3HEoJ4w1fXqWN4+DboGSVynWxdA4
	YcOIgvLH1a9V6jgCOcTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgusS-0004Aj-V5; Fri, 28 Jun 2019 17:41:36 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgusO-00049Y-UT
 for linux-riscv@lists.infradead.org; Fri, 28 Jun 2019 17:41:35 +0000
Received: by mail-io1-xd44.google.com with SMTP id j6so14237273ioa.5
 for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2019 10:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cs.washington.edu; s=goo201206;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uqJ6r1Mjakiqpd0ZD9iGpyAkpv+xSUcUqESly9SnS30=;
 b=lOFXls3FkwUg97CyPjvyXgrcjW6i3Y09TjD9O1sKjz+4VVLO0kGXwLk7Lh5Ks/8aAW
 JijWwpKYFieazAh57d6dT1oO3AO01TZnC7WoBmE1OSNdS8W3PrRrtsH2CbmHSwhjVWw+
 zeSbiFOvp9Kpu25n4n1vGhIUhGVzJdYcNha8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uqJ6r1Mjakiqpd0ZD9iGpyAkpv+xSUcUqESly9SnS30=;
 b=tAoG95uqNXDGTIHR4cOUY5I5M/O1ZfxSazZRk904i43HitQs/2rhSQ5iu6QcC68Dmc
 j3iVCJ4cwujUp4vAmbdVnKuMv4Z5sG2UyajkXxgRi+SbX466k7KPssKslnrDth5+0eMR
 7N5fBLfNgZP2btBVYDGAixGqEeGGDZFfSqg2al2gs/5H91BZE/vgxoPw20HJDxm8kF3g
 cTYD1hBA6AMrARAqvvNj3d8JNTXkxddw8T9iFKWMW9ErzHDNDEJDtO2GNZ8rMMT1kZy8
 DUKmuYM9DDiPqvDJ+Kq6B72zCiG5g1dbtS6JWCHfdwhFHmlfOyvX7zvCEIcXbTZpypxS
 lqYw==
X-Gm-Message-State: APjAAAW7m3PSFPpRAWx/HhtHq0b3HBWWuzshzCjDALp9tTyMteMGoynC
 r4Tw/tDglehVOTr5T2mo44Smw2+iI0twIjk9CeJxyQ==
X-Google-Smtp-Source: APXvYqwcltk4JmdpNvtJF1qrqeEE0+mFopXztg8enMwMB7rkn3G9Vg90wC0+Jkas2dqkKaCJf2/GoPK0tBQW9eKSXf8=
X-Received: by 2002:a6b:f90f:: with SMTP id j15mr12016235iog.43.1561743689556; 
 Fri, 28 Jun 2019 10:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190626231257.14495-1-lukenels@cs.washington.edu>
 <87y31nuspw.fsf@netronome.com>
In-Reply-To: <87y31nuspw.fsf@netronome.com>
From: Luke Nelson <lukenels@cs.washington.edu>
Date: Fri, 28 Jun 2019 10:41:18 -0700
Message-ID: <CADasFoAqjZVnMFGZNgQMhXsBC78vbb-u1PPv_aZx3fMXeHBXKg@mail.gmail.com>
Subject: Re: [PATCH v2 bpf-next] RV32G eBPF JIT
To: Jiong Wang <jiong.wang@netronome.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190628_104133_010656_206E90D5 
X-CRM114-Status: UNSURE (   6.33  )
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
 bpf <bpf@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Luke Nelson <luke.r.nels@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, Alexei Starovoitov <ast@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 Yonghong Song <yhs@fb.com>, linux-riscv@lists.infradead.org,
 Martin KaFai Lau <kafai@fb.com>, Xi Wang <xi.wang@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jun 27, 2019 at 5:18 AM Jiong Wang <jiong.wang@netronome.com> wrote:
>
> #define BPF_ZEXT_REG(DST)
>         ((struct bpf_insn) {
>                  .code  = BPF_ALU | BPF_MOV | BPF_X
>
> So it can't be BPF_ALU64. It is safe to remove this chunk of code.
>

Thanks! I'll fix this in the next revision.

- Luke

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
