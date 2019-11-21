Return-Path: <SRS0=Xxsn=ZN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04A8C432C0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Nov 2019 20:29:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C279A2068F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Nov 2019 20:29:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RWLw10vn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="dNA21veh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C279A2068F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1BsYBnw2RKwa+9atru91/xicmUZlzKNjRnAGrA4VQhA=; b=RWLw10vnHBDwdJFqve8VxzdRb
	B9fqIsIJnEHwqvyhKYixsvvBOn+ZD/3l8JiMzBy1ZK7nDFktHpo5UDXj6qMmte/F14v8aOBeOmgut
	Cla45eL8X6LMR9Y0rcAfyIbXq8WN+Y+d0UD5g8KaHSSOsl+5RVbIQuse1WKOLBwbfEbq6AGLogHxo
	HMEMfivVNoNwqJ4zxSDlEaz4vMW4ggO7+cAn1EU1q6uS+mtu15Nm1//TCT9YHOqglQCpxeSynAJW8
	ilucYIBqLNqOZOUMEWvLgVwhBKcHa4s0FcK94wQ9CtUmHU/pdyaaa1i7mtJSGSwHjd0jUVKQzVoQW
	H8+Onn/7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXt4z-0005Tq-Fq; Thu, 21 Nov 2019 20:29:29 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXt4x-0005TI-Cv
 for linux-riscv@lists.infradead.org; Thu, 21 Nov 2019 20:29:28 +0000
Received: by mail-io1-xd44.google.com with SMTP id j13so5115617ioe.0
 for <linux-riscv@lists.infradead.org>; Thu, 21 Nov 2019 12:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Y5b09/xVU/bX0tD0FXTigibid+Xx/Pyvl+yYHEA5HOM=;
 b=dNA21vehi2G3nqXpgT02bv8ZVHJY0AgEralCfQ4EE70QzyV/DNPvLlYYjg0DOhUz/f
 s9M8n4qmVu/EYTh+16iFweI65kIqvrEw8gfE4Yv4edd1rzUu0KijefTxd3DvM8dtHCcz
 Fi/tGKzQMFYrFmSqR+qWtGMNRRbwc0gtvaFUxObQV0J48YwsLn2qcn2MVMppwCKCs5LF
 fWfbaQPxzy6a/xrkj09qGgcDKozfMDOtrzn0X3d6XyEIaFbyveadBp7RnKz6sTOv+3/G
 ++Ryc/0s0dKHu0af7jP2dCvPc5I7XZNyGQnnKLbuDUnxsyKiktXyV4xgfAVLlwiWAQvv
 6yrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Y5b09/xVU/bX0tD0FXTigibid+Xx/Pyvl+yYHEA5HOM=;
 b=XVdBSvwsv9Y+Izzrjz5RQA3Rmc2ks0vloy6dduOPeD8JzjV0imHVMKr58hEZpEsit9
 Cz3OyOM/GunP6u1/QwY4E1g/78BydWTzD6LM5geDtOqNzL6OX/G2MHwJygsTySjIO89L
 3G7fq5Az07zD5j7X5ehqCdYot4n0y6N4DecAbsJ3t1Uul1xe5ufmREKYZIP/ST19yI5P
 NGx+Ot9cucBdYiKYlZEQGcpKKlwjImt87+Fo612d1FxJBoG2YDbh87x2rBMPERl3sQwd
 mEDICZR/S4GTYs6dzNGtE+FEUtEPuveytC5EMUWnF7Sy+1KTGjr67WDRmfitdKVQD0wf
 pmVQ==
X-Gm-Message-State: APjAAAUHH6a+R1KXDNDy2YAj0KXUIRXJ1KzaAX67CXRZyctgKnGp0x4l
 JNmyJtaWOSUuX2onbSvEYfbzVg==
X-Google-Smtp-Source: APXvYqw3drSXlwcne9WTVvj9T2b28GIAlbvI7icmVF+n8hO8XbGAtGkeJagE0NIgxKUDmDqXEKTNJg==
X-Received: by 2002:a05:6602:187:: with SMTP id
 m7mr7413826ioo.16.1574368165052; 
 Thu, 21 Nov 2019 12:29:25 -0800 (PST)
Received: from localhost (67-0-26-4.albq.qwest.net. [67.0.26.4])
 by smtp.gmail.com with ESMTPSA id g12sm1293267ion.82.2019.11.21.12.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 12:29:21 -0800 (PST)
Date: Thu, 21 Nov 2019 12:29:19 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Vincent Chen <vincent.chen@sifive.com>, 
 =?ISO-8859-15?Q?Patrick_St=E4hlin?= <me@packi.ch>
Subject: Re: [PATCH 1/3] riscv: add required functions to enable
 HAVE_REGS_AND_STACK_ACCESS_API
In-Reply-To: <1572919114-3886-2-git-send-email-vincent.chen@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1911211225350.30580@viisi.sifive.com>
References: <1572919114-3886-1-git-send-email-vincent.chen@sifive.com>
 <1572919114-3886-2-git-send-email-vincent.chen@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-780248285-1574368159=:30580"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_122927_468851_1BC0CC06 
X-CRM114-Status: UNSURE (   9.04  )
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
Cc: linux-riscv@lists.infradead.org, mathieu.desnoyers@efficios.com,
 linux-kselftest@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-780248285-1574368159=:30580
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hi Vincent,

On Tue, 5 Nov 2019, Vincent Chen wrote:

> In order to select HAVE_REGS_AND_STACK_ACCESS_API, adding the APIs
> required by kprobes to access pt_regs and stack entries to the RISC-V
> ports.
>=20
> Signed-off-by: Patrick St=C3=A4hlin <me@packi.ch>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>

As I understand it, this patch hasn't been signed off on by Patrick.
I've sent him an E-mail asking him whether he's willing to add his=20
Signed-off-by:, but haven't heard back from it.

From=20our discussions, I understand that this patch is based partially on=
=20
some of his earlier, public, kprobes work.  In lieu of any response from=20
Patrick, could you please resend this patch and just note in the commit=20
description that it's partially based on one of his patches, add a Link:=20
line that points to the URL of the patch that it's partially based on, and=
=20
replace the Signed-off-by: with a Co-developed-by: or something similar?

thanks,


- Paul
--8323329-780248285-1574368159=:30580
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-780248285-1574368159=:30580--

