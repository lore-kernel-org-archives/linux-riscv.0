Return-Path: <SRS0=S271=QN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA65BC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 07:03:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99109217F9
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 07:03:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nMKNv94t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+/UkUS0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99109217F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r0eLLjZVvt42Lnsn15287T/5kiz7VZWiplCA2+hW65c=; b=nMKNv94tur4+e9
	vRusTTWIekCS5+H5lgPT0edfABJGC6lC1bO+0Cs511zGDhWzFIUIpuUaoD5uHX9vFZjP+N8dIgrFT
	mSGKOrYvIMWRsYEGj56ihePBIHoetjxdC6KJkxUK4gZ/8yz+2NOhAhBDF28mNLpyyacK82NiQNEY8
	MvA6d2NT/gIY23Sj4qqjcyjzqpIutsXlcVS4PeQLXPrrywMkEJbtY6CkZF2/l8jaR9m5UqlMsZXt/
	Yt2pi2cl9pQEYHirPWZWBkzRO9fmIfhFXzfvGT2PlxnVKOrabzVSFQJXKxZqKe03PmPe1xEPF25Q9
	JWtg5ATLGaxF5IiaQArg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grHFL-0004gg-52; Wed, 06 Feb 2019 07:03:47 +0000
Received: from mail-it1-x129.google.com ([2607:f8b0:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grHFI-0004gA-1R
 for linux-riscv@lists.infradead.org; Wed, 06 Feb 2019 07:03:45 +0000
Received: by mail-it1-x129.google.com with SMTP id m62so3836707ith.5
 for <linux-riscv@lists.infradead.org>; Tue, 05 Feb 2019 23:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DtoV+8j5yU/6JSIegb2MjT5LJopOxId9RbO94vqiGOg=;
 b=A+/UkUS06YqD+IjFtgn8chTCaNIZxeBQmU2+KEO27JCgvXNRJm1vHZh4ekfH+pf+hO
 rdu4EFCZEeTubtjZ9Qu3XFI2MwagsXMiFHke6kjVAScu6OL6KzVfhw6MWZ6POzPB3yYa
 BYBuAGoToVcSbdpeoyHmDVc6p5WHiYB0WUbI7jjZmdQcNCvITMDMNjSxT2t4Q2mpARsk
 XpImxgwPUkJGuYbko/JpYs5MwCw7RFkkVt2WZ5Zm1clTZF/9WUH3c/a8bvb2Sh4x1Pmq
 U9i0IFzITBlHXQeD2Pcmx5aoBN+1Vw9MbnYGBsLYIq81Cm7GRQxweywqt5uEWHPBmoVi
 euqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DtoV+8j5yU/6JSIegb2MjT5LJopOxId9RbO94vqiGOg=;
 b=VQFhlYJk9B5MvnugFhDoP4AX6qOD2ZIRy3ZiUToKRqNYBNnxLj8Q4h+z8lhyINvGV9
 yH/Wtp96JLQbtYeMnzZNhYgDKuL3L/ZwgLGiGhr0QoIdcyKUy8oZPa0IIgxf9EJSyoGX
 wSWv2Y066dyrceD5y6MlPwZpsBDSoinLDgNsGObMI3jJ5ox/ADMmERXKDWnixnWJ11sh
 MU/M48kitqaCJS09Su8qYCnslQZorYYous8Kyau5it5NkTz/8MJAohegOeVBq6t7R/CV
 NlQ62MD24IzZcmUmTnsV10hP9A6bO53367O4lf5RkXkXoz4BATmkKQDV8lg/JjLtSX/0
 7pIg==
X-Gm-Message-State: AHQUAuZNGLOteQ9hYtV9TLtpg2qMZIpqsYOp4jGZqKcdQAJ+Am4WFUgj
 F84YJj6jWmP6/827rrutoKzGoJZI4ytltWnpXSg=
X-Google-Smtp-Source: AHgI3IYRV+OUUAi0OBK9zF2efoo+J6h6gn0dmO1ZkWjqfbAwsBViYPKp3oenEd4N30ZudKW1+MGg6VCG21UQgY18q2o=
X-Received: by 2002:a24:9646:: with SMTP id z67mr1467233itd.153.1549436621403; 
 Tue, 05 Feb 2019 23:03:41 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <7efecac7-17bd-5fc1-d0de-9fd498db4751@wdc.com>
 <d476c0e2b525fb0642b3155a247495cb1850c208.camel@kernel.crashing.org>
 <452be0d3-da8e-643e-9f91-c38f0af36ffd@suse.de>
 <CAPweEDwdByUTHnbKGS-LbwGzqsjjWciWOBnPOKkNqupY--vV2A@mail.gmail.com>
 <033872b8-49d5-2731-118f-967488f4763f@suse.de>
 <CAP6exYJRhw=nnhdrNQc7wOBUTYk0-LNaRQrhin7fqxeXMrEhkQ@mail.gmail.com>
 <22450f8b5b18421e486985725b1a58167662fd2d.camel@kernel.crashing.org>
 <CAPhv3nqQRC=jsLuheFPa1=qj7_rZ4D9q8nTr_yK7qeotobPbnA@mail.gmail.com>
In-Reply-To: <CAPhv3nqQRC=jsLuheFPa1=qj7_rZ4D9q8nTr_yK7qeotobPbnA@mail.gmail.com>
From: ron minnich <rminnich@gmail.com>
Date: Tue, 5 Feb 2019 23:03:30 -0800
Message-ID: <CAP6exYJNWRuW6P3BXu6XfcZOKiCECjsv3SJQ14uMxQY0Ypg1pQ@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: =?UTF-8?Q?Lu=C3=ADs_Marques?= <luismarques@lowrisc.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_230344_106841_0B069A44 
X-CRM114-Status: UNSURE (   5.40  )
X-CRM114-Notice: Please train this message.
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Christoph Hellwig <hch@infradead.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Olof Johansson <olof.johansson@gmail.com>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 "zong@andestech.com" <zong@andestech.com>, Atish Patra <atish.patra@wdc.com>,
 "sw-dev@groups.riscv.org" <sw-dev@groups.riscv.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 "mick@ics.forth.gr" <mick@ics.forth.gr>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Luke Kenneth Casson Leighton <lkcl@lkcl.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

While I respect the tremendous amount of work the OpenSBI authors have
done, I agree with Benjamin and Luis.

There is a further issue that occurred to me doing their excellent
FOSDEM talk, which is that nowhere in this has any kind of verified
boot scenario been discussed, and if you don't get that thinking in
from the start it is very hard to wedge it in later.

I think we should consider the OpenSBI in its current state a starting
point for figuring out what we need to do.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
