Return-Path: <SRS0=tgI3=Q5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FB0C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 19:48:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 339752070D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 19:48:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SfuLXTeR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtuZDcJX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 339752070D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E56NlMIZhrSLHzhlHEauIQJAOQJP7SiVUn+ZoqQj800=; b=SfuLXTeRihi+7Y
	+7zbxKGeRVFXDU9CocJFCKBK6Fvj7zLchQYFOYzPrikY6pSdDYQhwolF/xniFmNO0dRRlSL3FBLug
	ufrLZ8vmEVbcfVPsdNDV7pnH20M433oSTJFzQxVRfGXLy2jKsJb/j8gads45w2KUTKgl2aSg2JSpl
	1AqY0n7zP4P/pNnD4XWAeNrgZFVT55goR9lyFfdtpFAw640E37yu449lsEelBbF23XdUFxQzOWT54
	YD/9JcUmJuJX0d9y3kBEmbbiOuOC8LKruWSJw0VmhoPct1nCwq1TOzZatufcVZf7aK1I/YOLFHDwg
	D/xOrCZpKmDNbC9abSqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxGoD-0002Nw-O8; Fri, 22 Feb 2019 19:48:33 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxGoA-0002NH-CT
 for linux-riscv@lists.infradead.org; Fri, 22 Feb 2019 19:48:31 +0000
Received: by mail-qk1-x735.google.com with SMTP id x9so1886438qkf.0
 for <linux-riscv@lists.infradead.org>; Fri, 22 Feb 2019 11:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jnqFI0x0+3IKOTMXKvRj0uOm5O5USHRiyqiqo58OOqw=;
 b=dtuZDcJX0mDsNmeUTDvzSw7SkoV6p54NeCMIFNgD6CP1I1L344FUcMkDWk+9K3rfYj
 9siwSSehTcD2H9X4/X1LCDKtMEDOLPz1UvmednSTNdWUIogZCnlHZ3ztCn0H2bg/soMP
 PuRzvzxjbDLKaSsDK1TpeYd3boh8OJT9kwjfVbVmxit0alqLpgz4ZCtZvNBlzyx51Pj3
 YDcuv3HqWm3Ey2xLDKqtkFXwEZsWf7KXi7NFdW322FkHnpZS+9OkG6kyIPi/IshBIDH5
 9q33myJKRK5d/SmHXwbf3uiFPe0tBzvcF6nQlccgIugJcEo8AXqPr5F+ZmfLurEEfnYF
 gDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jnqFI0x0+3IKOTMXKvRj0uOm5O5USHRiyqiqo58OOqw=;
 b=gmZlTqKI+QIJCdupU2tQ+Xco8e9eg/M0kkCBMi/FEWder89bPPX/ypaNZlbvR2hETs
 U4DvwFbvYjYTLyRPF0fh49YkYnc3KvsOATTn1LviJserjTa7Vb5THRpopKlZICVICfyW
 6Rdzq1mHScynkgCYroqakCrR4+B5qAekt9K3DHrj/ignNVGE9PIYTCFlvJOY2Y4iKTPw
 qvSrOVyyiLgwyRdgbs/fwnbIJ3vehBIaKwgd2XaN0ZPtxBrsLF8Sbs4wCm/WpKRdgbOj
 ORCbU3CPOuCfM6fHfpK74E8C30qXnkSmP3nOMfzc8cBtYo5T5gQ4mqJjq+MQvu/5RKIS
 GpOw==
X-Gm-Message-State: AHQUAuY+XmL3OFZoYxYP/eRsLpgZBvbOF8abn4VUVVTTWrhuRfwZCR4X
 nluZf7nFPe+2okjZFXrapIGRZYiwHMwoPJGKGNc=
X-Google-Smtp-Source: AHgI3IYTVxZHsJjv0BHMWM5POAQAAR1oOaHP4X/kJMCyPbgUyX6v0CBnOIm/c6I/5P3cRUyl5LbszFxBLymkirDVSGk=
X-Received: by 2002:a37:4350:: with SMTP id q77mr4261220qka.308.1550864909308; 
 Fri, 22 Feb 2019 11:48:29 -0800 (PST)
MIME-Version: 1.0
References: <mhng-840b0a81-50e1-4783-a784-638195b9305b@palmer-si-x1c4>
 <0100016915bc54e5-22f89b41-21e8-4133-9550-e85f4223ea32-000000@email.amazonses.com>
 <2acd8a4393d4e9c526bcfa4aca63e4cf@mailhost.ics.forth.gr>
In-Reply-To: <2acd8a4393d4e9c526bcfa4aca63e4cf@mailhost.ics.forth.gr>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Fri, 22 Feb 2019 20:48:18 +0100
Message-ID: <CAJ+HfNgKFYzSdp5Jut=rXCA0vtkwDcCnDemmgpKD59YJqkg3QQ@mail.gmail.com>
Subject: Re: per-cpu thoughts
To: Nick Kossifidis <mick@ics.forth.gr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190222_114830_435734_2ADB6AD1 
X-CRM114-Status: UNSURE (   6.03  )
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
Cc: Christopher Lameter <cl@linux.com>, Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul@pwsan.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 22 Feb 2019 at 16:36, Nick Kossifidis <mick@ics.forth.gr> wrote:
>
[...]
>
> How about the scratch registers defined on priv spec ? We already use
> sscratch on Linux for keeping per-hart kernel data structures (check out
> entry.S) and mscratch on OpenSBI for keeping per-hart state etc.

Hmm, what is the "tp" register used for in kernel space today?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
