Return-Path: <SRS0=Vdo/=NK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E2EC6786F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Oct 2018 15:52:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A2032081B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Oct 2018 15:52:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UTr3ocqr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KM9Ix7+u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXjD184b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A2032081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9zQZPD663TfFW8+y5Z8WaC/AdKdRKGERIOVKtQVhU3U=; b=UTr3ocqrum8y+s6nb7qGkRiPSh
	sZAM4jEemxkZH2o0tv0w0u8rHwJgauQLJ+yYh5/JfYVguxlpbXrPxPn18qtN7beRZ8CFxqkxXZqvD
	lSFpYnYqD7PNTWBGpmlNIuCkzx7HyH51xuGEWIu9VMivZg4Cag3PplCr0ygP2hrTGCcsH4NE8hRQc
	juXyl0jPYczXumhe1I5fZ75Z6Hs+jDTVd/1fRIPIaBEP6iEeivJIaQOByBTk7B+OV9XRHuO2ZTlz8
	6Mf/lSdpsBCNlk4E/CuXKt1HVKiHTdf42c2qWh5sOktR74uTK3vwS7jK4cdg/J1YfJVD0SLkjqIQR
	k/4zjulw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHWJe-0008Lf-6z; Tue, 30 Oct 2018 15:52:26 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHVhu-0000Xj-TH
 for linux-riscv@bombadil.infradead.org; Tue, 30 Oct 2018 15:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:To:Subject:Message-ID:Date
 :From:In-Reply-To:References:MIME-Version:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4DJuc2i95zXJlo6qm/8qeVQ2k/FdiYTh2vtUfqEHMF0=; b=KM9Ix7+uJlFp9ynuAH5g5A328
 r9fEkYZ1f/lJZxRYvIkFl2kJSCUZ8UZZSBzwXzBSHWhPFZB1m0DlQo5x4/FIygotbpo/HLCeTMTVt
 RIfnDlS0ZWrGU9Qkr0+ImkQiNS5EOofbIZ6ho0YCWetEQuSY/alhQdZeix+H1t+IroiCagtW/1r0H
 gkqdFUMHu6blutfY3kP3zdY40yk6kkhnkojL+ywPRhwUFA5La9mTVxhyh5qmO/oOOwLL2ITIpNvQN
 Tb3qomXX0One1L33/ug7In2wKVmlGGuw0KVSAU2HLsK8JH0uDErOLqVE+NPnDtWgSTyUnneVczcOF
 ArGpgUCiA==;
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHOVc-00019y-BX
 for linux-riscv@lists.infradead.org; Tue, 30 Oct 2018 07:32:17 +0000
Received: by mail-ot1-x341.google.com with SMTP id e9so8652056oti.1
 for <linux-riscv@lists.infradead.org>; Tue, 30 Oct 2018 00:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=4DJuc2i95zXJlo6qm/8qeVQ2k/FdiYTh2vtUfqEHMF0=;
 b=nXjD184bujdfTLhc2MD4rHMgHvxRPMtWf3zURasKYCodQys61tZz6CvyJMXtjthp89
 WxLumFErgqy+4jiGvkDbjI45UnhWFTLQVEKPiwlam2VYVZgwvA8G1gabKQCBoV0ROuYT
 LZjEPEU+WXf6trF/At2KUjOfMZX6jx8g4mRbpYXMTARPnXoDj+fWFZ7+ItHqCmNP7WON
 OzLYkBNpHdQMQHNTRBl/pERRWxqDnDq7UAwDjRXv1V2ZV+wEezXtvxA1eN2C/pP2tR8J
 D/JT9VxlB7c4nM6Yas5GxCC1NNWSlErn9uSe9Y1lFTjr5A5mzw9XPUX5UH3lfyOPbJXC
 ERBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=4DJuc2i95zXJlo6qm/8qeVQ2k/FdiYTh2vtUfqEHMF0=;
 b=IGkoAj1O6U8Bddws4noIFXGOOS5mBoU5rcShrOTPgIFzuRqqugepKI5gTsM7F79T3X
 GCo3mIfpk8SskR+neD7iBDk8cABF9T8bBGLcQLKYuQOVtYTfjuO2v5vF5QLBblg4rhat
 b1TKb5Fb4sKii2kD/E1dO1kYIkOGfPo7XDt3HmUxJW9MlgzgNukQuhfOl45g36aQ4/it
 4VuRmOjuYpvZNjOcmyF8NJi60gZkl8VOKcoYhyppndOzENhJ4EtX67TnIgqoFKd6ZUpp
 laIUvgYO89W+Dn2DqjiB5qHTWUTbz2A3hA6eHuhQBI/uZtsyCmwsBsEwkYVRbkA4pfY9
 78ow==
X-Gm-Message-State: AGRZ1gJWYtk9tOVEKR4bbyEna8gruY5QJfdXLIbBi2jOWIs/b4RP4ZaT
 HslSFRobNz+LwwB5UhSBJUYy2Z8+4gs7UeZgRaM=
X-Google-Smtp-Source: AJdET5e2r6USBRr5MQ2Qy/7+PtpnMuqXVQONVLGrjKrN7IEnjpM5vDy6fS0ezcmeclV5mYeTmOAct50v4DNoi1t6hlA=
X-Received: by 2002:a9d:7383:: with SMTP id j3mr7222828otk.117.1540884212956; 
 Tue, 30 Oct 2018 00:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20181029121516.29574-1-david.abdurachmanov@gmail.com>
In-Reply-To: <20181029121516.29574-1-david.abdurachmanov@gmail.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Tue, 30 Oct 2018 08:23:21 +0100
Message-ID:
 <CAEn-LTpaTxPmb0De=834S5G6fA_Oe+mTN0bYk+iR4Amb4Sk1wA@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix trace_sys_exit hook
To: Palmer Dabbelt <palmer@sifive.com>, aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181030_033216_400115_87037A3F 
X-CRM114-Status: UNSURE (   8.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181030072321.sWI0DWT6G72n24dbxzR_uqyp9dxWnkxJoXE_w5SR6SM@z>

On Mon, Oct 29, 2018 at 1:15 PM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
>
> Depends on:
> http://lists.infradead.org/pipermail/linux-riscv/2018-October/001931.html
>
> Why we don't have HAVE_SYSCALL_TRACEPOINTS in arch/riscv/Kconfig?
>

I looked this morning into Documentation/trace/ftrace-design.rst again.

Of all the things the document describes we are only missing
HAVE_SYSCALL_TRACEPOINTS in Kconfig, yet we already have it
implemented in ptrace.c (+ this minor fix). Reading document, I think,
we check all the boxes needed for HAVE_SYSCALL_TRACEPOINTS.

I assume it was just missed (?) and will do v2 later on.

david

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
