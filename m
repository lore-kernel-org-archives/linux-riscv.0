Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E26C25B0E
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 17:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rTqPDxOn3CpqiFm9Z0kuYpWRqmScJ3MtdfRaInUcKg0=; b=ha3WhdOUnJwLnO
	9tPyss8IxaaHQbXkv2o3HS5By9pZrtvM0NsU0AjgigLl6bKMOqwLtVQqai0inImav1lGIi+4waeM0
	b6cXmMbqsKI7x6t25nlU1Absoeg9qPY1+nT6GCfX2bX4+Pffio4Wsw/VINApFPfQPamssBrxv7rft
	TT/mdUODJwhYp2mdaVMpF0PaOHW5WLlzy0kAeKITqGI0+52XdG75veOeHJn5l/3MWtGM8SXurg4/7
	/pQ5/QRxswDDphM42skI7ZOjKIy4EdEfTPXlUfIPqrK6GkNqLQGx6YNe3pk5EyeTV1BXdHUHmgFeW
	chozlh+EonWo05cBt79g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNdgy-0028XQ-QC; Mon, 15 Aug 2022 17:15:56 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNcxh-001die-6u
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 16:29:10 +0000
Received: by mail-qt1-x834.google.com with SMTP id a4so5822209qto.10
        for <linux-riscv@lists.infradead.org>; Mon, 15 Aug 2022 09:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=NVdbXDDqt8OLuQLqClAaHnuBSzQXULtNPdEas2SrLJY=;
        b=gggYPfYCcZrz3KKyz6DVR+Swe51KgJItmUNgu0M9NHQfWWqXLRLoqWgNrflb24LvVq
         xcw1w86Vmq6OoZWjBE1JUPlLygkB8ijz53I/N7/8hK09levGgssM7nf3sHzC6b3NBVhW
         iA4kg5/OCyLeQxLxNUhl1MQIVyL0u9qRfrOO9qvkYhzcNWG0hc2z6LR7AQKJEL3qBiXM
         U4Ezv+avFSC7RtJhoomfXqFYpbhErgcW06VjKn2e61Xz9ceTMXsoui1OaeFTngV+5pRk
         TvMci2XKG2o6nBhkI2vewzFgGyW54cAwtZYjtYahkYFkQ4mDVLdFfsAT0ObXo/pl7Dip
         qbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=NVdbXDDqt8OLuQLqClAaHnuBSzQXULtNPdEas2SrLJY=;
        b=qeLec8ndwzus7+VH1s3XwT4wtS1OO6tehhxA235WMC3kwgY583VTUCyAPyej8nVERj
         sgoWRYcyZhyuwraNLu616hhYzSJaT/hUUKai8FnpArK292JDcc2TaC4+wyscqWyMvs0Y
         0Hk4kmlU59jjXW/nPHBWV3aRbAo9B57gJYyOp4cshlg8qog2uY4xF3i7z3AMqjiGi0v6
         ZdD7eoxnicZe3LvtYCJOHtMLEjEVbyNJHkOUcwr4/ZNBXdbHdiPj0tEJShLkJN9z6zSg
         6Bz63IxKjWM9WKAvC1OniFNwgKu2/gDT0ZyHED4z2ekLZ7+016pGKwsxxf4oND2wR1or
         s2hA==
X-Gm-Message-State: ACgBeo1t3F6Ta6i/tF3mHY72HUweXfTOxu6Q4XxfJeK7IBF32S/Dufds
	vUrXG5u4Db8ITPNm8J+H7I9yCbFZ3L0whfyCJ8vgPQ==
X-Google-Smtp-Source: AA6agR6illJXJezPnUlYRSvrzzoS5CAYf4IUEm95n/U6inIK5fOcXEH6F1mNmBMwtsRq0xclG5MWykhUOUCpEetI2Pg=
X-Received: by 2002:a05:622a:1013:b0:344:5b66:fe15 with SMTP id
 d19-20020a05622a101300b003445b66fe15mr5314154qte.66.1660580947982; Mon, 15
 Aug 2022 09:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <CABMhjYp3xUyQ9q6nXHvEA2zuzhYi0ETn6UETeH1apWf2n2eP7A@mail.gmail.com>
 <7ba0c325-bc1f-f6e4-dd8a-b5d13a04ef93@microchip.com> <CABMhjYrDyOoDusE4-y4VzM87Vg=NhPbow_dQ+1C4EcX50LrMHw@mail.gmail.com>
 <fb861221-2e9d-7d4a-dd52-b16b3b581fd6@microchip.com> <dd128dec-6092-7aeb-6e66-eb45cea3b0cd@microchip.com>
In-Reply-To: <dd128dec-6092-7aeb-6e66-eb45cea3b0cd@microchip.com>
From: Atul Khare <atulkhare@rivosinc.com>
Date: Mon, 15 Aug 2022 09:28:57 -0700
Message-ID: <CABMhjYrB+Qn9ZuJ3Lqpu0KVFGeg6avxkYqD=SQWyLjdQ3wSpjg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] dt-bindings: sifive: fix dt-schema errors
To: Conor.Dooley@microchip.com
Cc: palmer@rivosinc.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, robh@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_092909_332102_E6D465CC 
X-CRM114-Status: GOOD (  15.83  )
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

Thanks -- really appreciate the help. Dell had to come out twice to
fix my laptop, and it's finally done (hopefully), but moving back and
forth between  the different distros has been really disruptive.


On Tue, Jul 26, 2022 at 9:42 AM <Conor.Dooley@microchip.com> wrote:
>
> On 01/07/2022 21:00, Conor Dooley wrote:
> > On 01/07/2022 20:49, Atul Khare wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>
> >> Conor,
> >>
> >> Apologies for the delay, but my laptop died a couple of weeks ago, and
> >> I have been scrambling to get things up and running on the
> >> replacement. I will try and get back to it ASAP.
> >
> > Nothing you can do about your laptop dying :)
> >
> >
>
> Hey Atul,
> Been another couple weeks so I am going to send a v3 of these
> patches (although without any changes to the v2) and we can
> resume discussion about the cache binding change there.
> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
