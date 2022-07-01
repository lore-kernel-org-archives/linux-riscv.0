Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60E0C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 19:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=556Mtfh0C1a+bZH7iMdRX+0siUSKpVZ6oVddagwGa8Y=; b=A5gyjAZE3ORX1H
	6iukofdyNNhDerYa5Q6pXN0qGSBTvC0W1xuDiRqWIyQ2M+rS81TcLWOlfcPJ7vkxbStgP2BKVHHbz
	08uPr0i51rgGWGtQR5GNZk2j+XCKNE2MNaX9ANaRIvzOhvTUoomNsaMct6JeVRZ86Lk0yMeU8u2xL
	7bM0HvbzB0c4RqNDVFL525LkOH5S0f1Ddu2YTGrMg435DbZcQY0A+RgJBxRl8MqnlIVsk/h2KBmjg
	sFnq11koM3FCc+l9fAhOJHK6nGC0f5dwpnzPWfaO2pJx65tOK4uSqLh3aQLZ5a01qN9ss7LrxRdIg
	Nb4578XrpvNl5PN4ZVCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MeL-006h5x-Oz; Fri, 01 Jul 2022 19:49:57 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MeI-006h3r-3s
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 19:49:55 +0000
Received: by mail-qk1-x731.google.com with SMTP id b24so2589087qkn.4
        for <linux-riscv@lists.infradead.org>; Fri, 01 Jul 2022 12:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u6fPAgM8gi/RJI8YuKyRjChuGCO5jCSEWC0CBzNffV0=;
        b=ByfbfV2q6QbOnkjD39rDX3vW30bOrecwJhGvEHJzy5JQ/s934vXaj9cLQ9w0HT7ewk
         dvx4xjT5TlZTxJ8LWAUp5DJ3HZnM6sYHf/Q5nRt5bv2Uf8SiSx9odeglVNB6rjCs7cgX
         4UD6GljcU0u+QNeS8Sz4D281+08LbQJ8iUPe8a0e0GHMW+MnvDyP5SUppa9qndiB+nt2
         M/GHSOqGlEBUZYAYrT2cIuovkV/rBEI0RQ7SlQsOY6ogtJt6ygSXnsNBVLKkfVTq/gT4
         oPTL4dGhrujdy7vKT7Q07GIz5K76g7AKv/I0weag9+QqzgJeqs85YQYWu5qqAN6tIdU1
         MTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u6fPAgM8gi/RJI8YuKyRjChuGCO5jCSEWC0CBzNffV0=;
        b=IhOnsqbZIrw+RB+u5606gYr7cCZHBuPD/qv1ucnYiAQH9Ac2RVDzF7Qt/6zcrCMAPr
         3YGpg3Ja9e5iiNX+G+uOlGvc8lMOD+V57+gbmTgPs+iYX/oIxjayA++zmd48WUklJpuq
         rhHOPTSrDbP6Ny8CWyn3XVgMxLo//b0GQBHhDIpgBezAS/TUShtTUKFF78IRt08BCxbz
         FQ5ajNIxRDIQgDjb3n0OsN5R8gJ4ah6vbJbJ986684oYXtDmG3qWEiMxt5K1kLoK5geL
         eTHxXF5i9R3TIu8N+Ylu1vllwiKCcxWIu8WRPBMy1JrHWVSAMIigECZ+Nt1JC+SITX2e
         j0Lg==
X-Gm-Message-State: AJIora+9vTY062rXEWxXFcr/GrKW56mxaPaw3GGlx+Zal+gBj9LI+0mR
	eKXNA1Mzoe6ljURIrxk3+VTXmadWVI5uucnCzwQW9w==
X-Google-Smtp-Source: AGRyM1s1AY7XBEABePvu0AwdCbeRlv4PSrgMczV/kpgOfIvJvzVm2yQHPAjRjjG9DAkpsWyd7uKVstLy75J/STwM7js=
X-Received: by 2002:a05:620a:46ab:b0:6b1:6550:9062 with SMTP id
 bq43-20020a05620a46ab00b006b165509062mr10580150qkb.80.1656704991257; Fri, 01
 Jul 2022 12:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <CABMhjYp3xUyQ9q6nXHvEA2zuzhYi0ETn6UETeH1apWf2n2eP7A@mail.gmail.com>
 <7ba0c325-bc1f-f6e4-dd8a-b5d13a04ef93@microchip.com>
In-Reply-To: <7ba0c325-bc1f-f6e4-dd8a-b5d13a04ef93@microchip.com>
From: Atul Khare <atulkhare@rivosinc.com>
Date: Fri, 1 Jul 2022 12:49:40 -0700
Message-ID: <CABMhjYrDyOoDusE4-y4VzM87Vg=NhPbow_dQ+1C4EcX50LrMHw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] dt-bindings: sifive: fix dt-schema errors
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_124954_415695_FD77AB38 
X-CRM114-Status: GOOD (  18.49  )
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

Conor,

Apologies for the delay, but my laptop died a couple of weeks ago, and
I have been scrambling to get things up and running on the
replacement. I will try and get back to it ASAP.

On Sat, Jun 18, 2022 at 5:40 AM <Conor.Dooley@microchip.com> wrote:
>
> On 09/06/2022 00:39, Atul Khare wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > The patch series fixes dt-schema validation errors that can be reproduced
> > using the following: make ARCH=riscv defconfig; make ARCH=riscv
> > dt_binding_check dtbs_check
> >
> > This is a rebased version of https://tinyurl.com/yvdvmsjd, and excludes
> > two patches that are now redundant.
>
> Hey Atul,
> Any word on (an applicable) v3? Would like to get rid of this last
> couple of warnings.
> Thanks,
> Conor.
>
> >
> > Atul Khare (2):
> >   dt-bindings: sifive: add cache-set value of 2048
> >   dt-bindings: sifive: add gpio-line-names
> >
> >  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml      | 3 +++
> >  Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml | 4 +++-
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> >
> > --
> > 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
