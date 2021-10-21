Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58770C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 01:01:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FE5B61052
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 01:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0FE5B61052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbOLEg2LbusDqsjtjZshgHmujDOWkNPZnsOWKKpLl/c=; b=VqxvQrHx3E3bBZTCFWHg98J+3e
	ktBluRFpAFpQwjmmUWnZp1Oyzz5tFqSxmbnmxAmYt9WBEu/DqIU5Q16vzQgdpWQITojz1ChWQi4tT
	/mfAiLFz5fA6f7cngTZJgt0URZwLYndXyvDX/TBv2fPKxqYMlGgyOcHSQIQsbgq7IjigaZAdyiJoT
	V6YO8Vm9kKKA4Sf6dn1Ar+5yP1bU10qayTgOKJV4PyKUYir+ydD65DZ/vVziffijlQcb1n0kHeM5p
	h1aLAorwHlqqiPTxTbLr5lgyeNWTpW+Zf1o+8+WTTg9WnSVCcEdZBtos0g7me/wodrmEaisFyALXA
	rEzgSrnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdMSe-006AfW-QY; Thu, 21 Oct 2021 01:01:36 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdMSc-006Ae1-G6
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 01:01:36 +0000
Received: by mail-ot1-x32f.google.com with SMTP id
 x27-20020a9d459b000000b0055303520cc4so10369053ote.13
 for <linux-riscv@lists.infradead.org>; Wed, 20 Oct 2021 18:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=/Anyro1utHkFdCbdStAnb8uXkCW4crr28fE7Heb+fl4=;
 b=Amtjbon3DnMOGs5EEeBpR6/lkN9fxfctIJORUjFOEw7wv2hqLfR1rU9zt4iwMBryDg
 ow+HqCTeKYqFCx12RN8FIbgdXX6tRDnBmJN7l4lyppD2TGJ4aB/Wp4Zb0fmlbwbBNaTD
 EyvVw/oQBXfa9db+xSQQXPbfjELvgUKfjLeuEOwSdl+2xPI+TCobbk0sGTzj9Itj57mS
 yplzHqLExBKFQcUYDszJckKixkrtKxsimewwAHaGs8jo2SuSZSTs7oyheYBMuT4pvKfk
 Pv6ES0MwOJXBW5Jue4Z6jGYG5Ha+voXXq5TZJuywq0pLto6Qe3OfiQR7scpSFBN0P2ZR
 ytig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=/Anyro1utHkFdCbdStAnb8uXkCW4crr28fE7Heb+fl4=;
 b=J9F55/Tf3hO8fAg71aO9ZZC/BV54VQRkAoAHdWSXZ+l/CFG81J+3ykKXEXAgUTvjfD
 mxT5usSiU41ZClmd1LswrCxL0PgUMLB9DbDV0fKt/oQonRISONDBM2UUZ/R1IDqT8nUe
 OZM5gSBSkWVjkheaBNCbVaNOP0fBd8MgaV7DOdXHGPb+JRpHyyBmsZVxdG0jYogptSM7
 lM4qp4CiUWj0qPsbkS1lQlEP7+mIZGqx0yMz3FgQm1c8SUFCUFymajF4LvVtH3c+z8X3
 NZ0hpKFbnXfEADnRbgB91QlU6o5hnVbD+31Fc456DOFkn4SVxKYn9f6KMt/zkbEoGPcm
 qsEA==
X-Gm-Message-State: AOAM533iqBapxU+z/yYtuSOyKiM0ksOJLP5qLeySv3gnFiByKZvVEfoC
 CmbxuJYIyjDfYoXqGqOeqeQQSBG7jy3dSYQN
X-Google-Smtp-Source: ABdhPJyOpc0Y/V7bNHLEaCEilxZ9yA1fSwUnP604hwHoUhi+XgICyd19Vqo6H4iUhzN1yRXLAcwYDA==
X-Received: by 2002:a9d:728d:: with SMTP id t13mr2114142otj.66.1634778092733; 
 Wed, 20 Oct 2021 18:01:32 -0700 (PDT)
Received: from localhost ([2601:8c4:0:32f::a60])
 by smtp.gmail.com with ESMTPSA id r23sm756370otg.71.2021.10.20.18.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 18:01:31 -0700 (PDT)
Date: Wed, 20 Oct 2021 18:01:31 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: Darius Rad <darius@bluespec.com>
cc: Greentime Hu <greentime.hu@sifive.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Vincent Chen <vincent.chen@sifive.com>
Subject: Re: [RFC PATCH v8 09/21] riscv: Add task switch support for vector
In-Reply-To: <YVxZspMO7rAvtMBS@bruce.bluespec.com>
Message-ID: <3c9797f6-2fd3-5530-ba34-6e4c4deec984@sifive.com>
References: <cover.1631121222.git.greentime.hu@sifive.com>
 <0e65c165e3d54a38cbba01603f325dca727274de.1631121222.git.greentime.hu@sifive.com>
 <c81267bc-4c91-3978-8c1f-78925c46c78b@bluespec.com>
 <CAHCEehJ1uuSFqFWreS1kh+fR5GFfnEycdLMe+4FHXpFsHrRUvA@mail.gmail.com>
 <YVRp5uWFGQrwBpgf@bruce.bluespec.com>
 <CAHCEeh+dA9243=PwNtYvyU1Myu_E8YO2g4UNACxRogQ=6UavLQ@mail.gmail.com>
 <YVxZspMO7rAvtMBS@bruce.bluespec.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1340494379-1634778091=:93269"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_180134_576381_9CC9ADA7 
X-CRM114-Status: GOOD (  29.57  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1340494379-1634778091=:93269
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hello Darius,

On Tue, 5 Oct 2021, Darius Rad wrote:

> On Mon, Oct 04, 2021 at 08:36:30PM +0800, Greentime Hu wrote:
> > Darius Rad <darius@bluespec.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=8829=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:28=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > On Tue, Sep 28, 2021 at 10:56:52PM +0800, Greentime Hu wrote:
> > > > Darius Rad <darius@bluespec.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=881=
3=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=888:21=E5=AF=AB=E9=81=93=EF=
=BC=9A
> > > > >
> > > > > On 9/8/21 1:45 PM, Greentime Hu wrote:
> > > > > > This patch adds task switch support for vector. It supports par=
tial lazy
> > > > > > save and restore mechanism. It also supports all lengths of vle=
n.

[ ... ]

> > > > > So this will unconditionally enable vector instructions, and allo=
cate
> > > > > memory for vector state, for all processes, regardless of whether=
 vector
> > > > > instructions are used?
> > > >
> > > > Yes, it will enable vector if has_vector() is true. The reason that=
 we
> > > > choose to enable and allocate memory for user space program is beca=
use
> > > > we also implement some common functions in the glibc such as memcpy
> > > > vector version and it is called very often by every process. So tha=
t
> > > > we assume if the user program is running in a CPU with vector ISA
> > > > would like to use vector by default. If we disable it by default an=
d
> > > > make it trigger the illegal instruction, that might be a burden sin=
ce
> > > > almost every process will use vector glibc memcpy or something like
> > > > that.
> > >
> > > Do you have any evidence to support the assertion that almost every p=
rocess
> > > would use vector operations?  One could easily argue that the convers=
e is
> > > true: no existing software uses the vector extension now, so most lik=
ely a
> > > process will not be using it.
> >=20
> > Glibc ustreaming is just starting so you didn't see software using the=
=20
> > vector extension now and this patchset is testing based on those=20
> > optimized glibc too. Vincent Chen is working on the glibc vector=20
> > support upstreaming and we will also upstream the vector version glibc=
=20
> > memcpy, memcmp, memchr, memmove, memset, strcmp, strlen. Then we will=
=20
> > see platform with vector support can use vector version mem* and str*=
=20
> > functions automatically based on ifunc and platform without vector=20
> > will use the original one automatically. These could be done to select=
=20
> > the correct optimized glibc functions by ifunc mechanism.

In your reply, I noticed that you didn't address Greentime's response=20
here.  But this looks like the key issue.  If common library functions are=
=20
vector-accelerated, wouldn't it make sense that almost every process would=
=20
wind up using vector instructions?  And thus there wouldn't be much point=
=20
to skipping the vector context memory allocation?


- Paul
--8323329-1340494379-1634778091=:93269
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1340494379-1634778091=:93269--

