Return-Path: <SRS0=95at=7O=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102BBC433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2020 09:00:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D568A206C3
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2020 09:00:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="huMmqn+C";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNBAKb8F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D568A206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WgAfPuFYBjN7FHru2gW4qab9TJ5NnQOwxcj2jx65e30=; b=huMmqn+CQLU+Dh
	o73xPQGic8SmXjHWovnqdLJCzTwQR0KCkkqUD1ipApW9fdm5U6WjAZYcFSiXkruD3rVbf3Fj/Q2om
	JZX2agRjYfWUQ8NanuurFXwz+S1WqL7Qad15B8h5Z03M7/VWSCDQDhgP2BNMe9NyVmRCBp99oDHZP
	oxkm8Bn4BZZFcavPflKI0dVKd2rV3raVuXMgI5zBFuTNfmy29VS8Ltd3jkBobpZFed7iysctPLS/p
	qPnjuKTOcDSqicUzenPZzsi0dtGCLLIH/Ptf3lBdAOf44oMGfRvN8xeQUGsSBN0jhCod4l0PH+izs
	1D6uILDsQl+asKWYDXCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfgIe-0002xF-GM; Mon, 01 Jun 2020 09:00:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfgIb-0002Mm-DP
 for linux-riscv@lists.infradead.org; Mon, 01 Jun 2020 09:00:03 +0000
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 73C842074B
 for <linux-riscv@lists.infradead.org>; Mon,  1 Jun 2020 09:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591002000;
 bh=WgAfPuFYBjN7FHru2gW4qab9TJ5NnQOwxcj2jx65e30=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DNBAKb8FYEmA547roJCmUEHeJi/9p01W106l8Mj6KF2DIuThf0DPO9tsIZ+xI5OSa
 Qb5NaPzCxpLz4T6+ILlQSjGx+v7ngJEnBvsyaym53GD4oebU3RYnPyPpSyeXfEyNGa
 NSN25oWZZbfy3gNSsxJMj90baVe5yL+hMNaEDVog=
Received: by mail-lj1-f172.google.com with SMTP id q2so7126150ljm.10
 for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2020 02:00:00 -0700 (PDT)
X-Gm-Message-State: AOAM530gpOnMWPFUh5CcFIVjlfwhiY9EyxBQ6EMe3kBWI6+RzpNkpCR+
 Fhi/vqsvm+uFfdTN4IWvNWA+XMKqRdh5KUVwhzY=
X-Google-Smtp-Source: ABdhPJwGtg0X8mVAjFPLBTQ5dBxDhXXDDNXX89zqKO/9BIIxLL1WvuFWwpDj6JtSJBzC41WwT07o3G9sDZFcl0KOqsc=
X-Received: by 2002:a2e:a58a:: with SMTP id m10mr9871173ljp.346.1591001998792; 
 Mon, 01 Jun 2020 01:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590474856.git.greentime.hu@sifive.com>
 <fe966314eae51a5089033f7186ac86c39719e0a0.1590474856.git.greentime.hu@sifive.com>
 <CAJF2gTTnLNmNUvDwRSsmD9auaOGuqYXjuucKSyXZQKoEWEq4Ow@mail.gmail.com>
 <CAHCEeh+d+ya6+Xrh8hdWVSGo2kk_rZ8PV2eMM-2LLaOojAaBtQ@mail.gmail.com>
In-Reply-To: <CAHCEeh+d+ya6+Xrh8hdWVSGo2kk_rZ8PV2eMM-2LLaOojAaBtQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 1 Jun 2020 16:59:47 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRk3hUmqOb4dhCWhLZq6tznwVLWGe5M4jY4D+DS+P6vNQ@mail.gmail.com>
Message-ID: <CAJF2gTRk3hUmqOb4dhCWhLZq6tznwVLWGe5M4jY4D+DS+P6vNQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 05/13] riscv: Add new csr defines related to vector
 extension
To: Greentime Hu <greentime.hu@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_020001_491175_2184599B 
X-CRM114-Status: GOOD (  10.21  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 1, 2020 at 4:15 PM Greentime Hu <greentime.hu@sifive.com> wrote=
:
>
> Guo Ren <guoren@kernel.org> =E6=96=BC 2020=E5=B9=B45=E6=9C=8831=E6=97=A5 =
=E9=80=B1=E6=97=A5 =E4=B8=8A=E5=8D=889:56=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > Hi Greentime,
> >
> > Why remove vxrm and xstat ?
> >
> > > Appendix B: Calling Convention
> > > In the RISC-V psABI, the vector registers v0-v31 are all caller-saved=
. The vstart, vl, and vtype CSRs are also caller-saved.
> > > The vxrm and vxsat fields have thread storage duration.
> >
> Hi Guo,
>
> https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#vector-cont=
rol-and-status-register-vcsr
> "The vxrm and vxsat separate CSRs can also be accessed via fields in
> the vector control and status CSR, vcsr."
>
> Since vcsr will save all these information, I think it should be ok to
> save vcsr only.

Got it, it's similar with fcsr & frm & fflags.

Acked-by: Guo Ren <guoren@kernel.org>

--=20
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

