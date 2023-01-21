Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E938DC004D4
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Jan 2023 16:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJwijy9Rt2S1rGZWErWXg5w7H137MbDgcJPEoj4ine0=; b=tqGCYjcjczXVyh
	bkU597o05Zbj8fiCd+yjv0Y8ijIIZXI5PzNkyuMZEu2SKRBI9oCf1KyPM1ILJHAiBrUPUaeVlf3wK
	fzBP6ZsjBQjq6JeB6HK8cxf7LkiV3otc4DJ0+2UTENSqkWV/lkG9SxwP8YCQ+Ph42iYPsKy1aRQ80
	VummsYba5tKXwk6X//jIHvTiVswlUuSXGX8H8OXg2OTxqDZV3km5Bl7bLQSh440Om5KUnYHkfk5HE
	7ZsreIWkf+g2WM/kmof5wikGWQA4FKWodlwn13VsuTPOMlAcmbM0K5kE16pK4qZzzdC9pigGkHXSa
	lcWRGCRe+LgjoTeplskg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJGJZ-00E7jm-Es; Sat, 21 Jan 2023 16:01:57 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJGJW-00E7jN-Mg
	for linux-riscv@lists.infradead.org; Sat, 21 Jan 2023 16:01:56 +0000
Received: by mail-ej1-x636.google.com with SMTP id v6so20942196ejg.6
        for <linux-riscv@lists.infradead.org>; Sat, 21 Jan 2023 08:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KKVMc4XtRN4OAzpt+73YglKGdPsJWpOm2v8zLKBJfjs=;
        b=WJk+anVCx1Y/Sg1JSEPsA6EP5qY4OfjrZbKya/DMoyT9eatlLH9QGCsVLXsQcC0xPW
         M9iCRSFkCRdxaSzgCMWunIy6ALE2XtF8lP6ygNPwB1CdyC3qzSLNkC8cKN3OzSVsQGI5
         3YmLzSGy/S2DzrKYoMVhWUcwz7pYDb5vHIMJ5BrZa65jAtSLOecqR+2Rsa65Rrl/hbbH
         XUGcCvDFb5rkCtKB2XgvX557S8eiQIm80vthScgtkJpWsMxe56rlrA/Q1HQKcTWZpH6h
         jlDG1+1VYj185R3s2TJqxQIWNNOQdFitm/zT2jrK7VRWdOSJVHdwXEVTCvX15WWr7clr
         arsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKVMc4XtRN4OAzpt+73YglKGdPsJWpOm2v8zLKBJfjs=;
        b=equIYTojJ3xHLjN6S3OXE9EQnmoK8gH4B+SOGqcPVTvLWguIrUADJ2fCGpyHfri9+c
         Fxx7DgzZPimFu1PI/EkKgcYqKhPgLDa3/1P5p08GSrDqaFKrUlUWzz7OV3+VDLPSVOlr
         lL/WuCfNONkqq9eZ+vRJ4uT0CnPgcBRFHig6kavJEpCRwdom4yxcVbKL9AlhijDJdJjA
         b6OHaMJFYaxcgYtaQ2YEm4xl2+/BDw2be0Esjuv+896tRCZWnZ8ircs26OB9l4JTfc39
         RlaEJTUBfIIaEFnY5+G4CZHSv41DtUEWKuZv/O7PoOgc+c+LiUtxzKo7lUd5Mu88upGn
         E/UA==
X-Gm-Message-State: AFqh2koxyEIaCw5amTBoMHEbXZx0WNrAXyhDg/K92uhJCLkcS9v7JaDh
	dvZTSBq5/2F2zh6j5K6Vp5ifZvH8R4iFcUVV8PQ=
X-Google-Smtp-Source: AMrXdXuVIr9xRAkzYr1hQHrZmlm0grwR+l8tkvtvwunVRTMZ3YGsxVjIHqb5vS4pbm5leQ+RqxwrJC7p934GAvRsHWk=
X-Received: by 2002:a17:906:e107:b0:852:132b:2d7e with SMTP id
 gj7-20020a170906e10700b00852132b2d7emr1986545ejb.224.1674316912347; Sat, 21
 Jan 2023 08:01:52 -0800 (PST)
MIME-Version: 1.0
References: <20230111134513.2495510-1-conor.dooley@microchip.com>
In-Reply-To: <20230111134513.2495510-1-conor.dooley@microchip.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 21 Jan 2023 10:01:41 -0600
Message-ID: <CABb+yY3+83AP0B4RUGTabqjR=7rXJFMgAvXsM5Go3sz2RMJA1g@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] MPFS system controller/mailbox fixes
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230121_080154_800129_758A0477 
X-CRM114-Status: GOOD (  28.99  )
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

On Wed, Jan 11, 2023 at 7:45 AM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> In order to differentiate between the service succeeding & the system
> controller being inoperative or otherwise unable to function, I had to
> switch the controller to poll a busy bit in the system controller's
> registers to see if it has completed a service.
> This makes sense anyway, as the interrupt corresponds to "data ready"
> rather than "tx done", so I have changed the mailbox controller driver
> to do that & left the interrupt solely for signalling data ready.
> It just so happened that all of the services that I had worked with and
> tested up to this point were "infallible" & did not set a status, so the
> particular code paths were never tested.
>
> Jassi, the mailbox and soc patches depend on each other, as the change
> in what the interrupt is used for requires changing the client driver's
> behaviour too, as mbox_send_message() will now return when the system
> controller is no longer busy rather than when the data is ready.
> I'm happy to send the lot via the soc tree with your Ack and/or reivew,
> if that also works you?
>
Ok, let me review them and get back to you.

> Secondly, I have a question about what to do if a service does fail, but
> not due to a timeout - eg the above example where the "new" image for
> the FPGA is actually older than the one that currently exists.
> Ideally, if a service fails due to something other than the transaction
> timing out, I would go and read the status registers to see what the
> cause of failure was.
> I could not find a function in the mailbox framework that allows the
> client to request that sort of information from the client. Trying to
> do something with the auxiliary bus, or exporting some function to a
> device specific header seemed like a circumvention of the mailbox
> framework.
> Do you think it would be a good idea to implement something like
> mbox_client_peek_status(struct mbox_chan *chan, void *data) to allow
> clients to request this type of information?
>
.last_tx_done() is supposed to make sure everything is ok.
If the expected status bit is "sometimes not set", that means that bit
is not the complete status. You have to check multiple registers to
detect if and what caused the failure.

Cheers.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
