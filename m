Return-Path: <SRS0=f00Y=UY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1896CC48BD4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2019 08:35:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E19E52146E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2019 08:35:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R2aDFbY0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="RJvMZ0xf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E19E52146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekJ12srKIhM9eWO4PQr3JrHHm42KTMbRXRhjUj9swCI=; b=R2aDFbY0v3OxJ1
	kY4k07V6wCMgva3VNedBsgHCgWugKju+9RDsqqCsITVmkO9YiugCTK1xKKZBjthrLDtuwJkTuGOkz
	mn2tCfxcHeXhNHcIjBz87cDvJn7QoZ23gpi5MSBvl1Ee7Wyi+XK6b0F1ZK0FebNNkc+dX8C7h0M7z
	cl1D3Y3fVQowB+IzTRvoRI20PQldm0i5wLnNsLzc7JX50ThqV22SaODRhn4Vp4+Hgsay4a9HYSn7l
	RywnriVOf8e2cZNkk6MxcgAMjfO7PoeoCP+vyV1Nb04LIKCy0QwAdM3L330eXcWC1AT4w4sevWz7u
	RjXDaH+1GGENrySqP8OA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfgvT-0007v2-2I; Tue, 25 Jun 2019 08:35:39 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfgvQ-0007ps-Tq
 for linux-riscv@lists.infradead.org; Tue, 25 Jun 2019 08:35:38 +0000
Received: by mail-lf1-x142.google.com with SMTP id x144so4564074lfa.9
 for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2019 01:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dk5hrs4C1tt/nglJSF3HRfZ1Bert/xei53XsDQtZv3U=;
 b=RJvMZ0xf0FFZturrGj3s8PD+dfTywtJeBO4V1p/DJyCQhQluUkFNKj08X91XvfwrJz
 LYTzGaCoqmE8kPTb/FJMJhMTMPB1Q1j0T7j9lwCyYuGYBX6KfVSuZC9k7UjZhIQ4YUzf
 Zzpe29mDXFXQjNGSPoelt2iWqCLm6UpMYgdCeoFj15fxzCaDsX4lsBug5NKZmS8x4lkF
 /oFtdAD2gyPlgBWu5ETHYX3IVyBg/2IUZcgY9dDvxlY6Id8TKd7JvCTqHbHu5GQ7xIZI
 ShCMiXk0NN3dKb4x2CHymD/nE+NsnXo1uivxDiLAMY9dab4IM1SrDQP0F95S2Z2zhQSr
 gKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dk5hrs4C1tt/nglJSF3HRfZ1Bert/xei53XsDQtZv3U=;
 b=XACYxIrwxyZo9+uhLOGasIBf2zqtYzxAg2wG6etp2yAj9mrriQ0N2y6cG71L4D60vP
 DcOM0yDq6kGNNREqpeJsIaawX7uhTyT8QFw2Qn1UOadhUrxvb9Mx9ikcctrJ8SkN/54P
 lmO9jOHdJseY8WGPONNrL4TCYsa1DcLuZdhRNNeSg/oeODVGftUSLQsbfOl1FXAQiQnP
 ZdbOxfXBaUyvrCBSCvREAC1L7bdJy8qOcGyzgzkK3R++4xa83GxIoyCbRnFxk+MZsY52
 ZV17EB87yINJ6xWKAXX237JVcEXzUcl44t43z9MbzzzyBivcbk1vq4L9khR5TfCijIWf
 ffCQ==
X-Gm-Message-State: APjAAAVnNoUNQBrlDawi/Wc6Ly7JKfxdvuJbah8G0Lf841naIBOm34ya
 nHBHWwseu2t0SlsUJ/HELv91wv5cu0KS1f9wjJKk+w==
X-Google-Smtp-Source: APXvYqzjF2ta5Anb3SRj80V5eALP3RJBskJMY6xQfTjbjhnPfmrbwahJYk02lH0NXADJ1BXJc7sI0CSzU2xDanIpddo=
X-Received: by 2002:ac2:446b:: with SMTP id y11mr73052242lfl.158.1561451732515; 
 Tue, 25 Jun 2019 01:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <1561375453-3135-1-git-send-email-yash.shah@sifive.com>
 <alpine.DEB.2.21.9999.1906241421550.22820@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1906241421550.22820@viisi.sifive.com>
From: Yash Shah <yash.shah@sifive.com>
Date: Tue, 25 Jun 2019 14:04:56 +0530
Message-ID: <CAJ2_jOFaS4ZU4m8sE0SFM0sL32Q8fUbg9jbRoEKHU1U2Zqp3YQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: Re-organize SPI DT nodes
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190625_013536_965605_7ABDD9FF 
X-CRM114-Status: GOOD (  10.87  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Sachin Ghadi <sachin.ghadi@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jun 25, 2019 at 2:53 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> On Mon, 24 Jun 2019, Yash Shah wrote:
>
> > As per the General convention, define only device DT node in SOC DTSi
> > file with status = "disabled" and enable device in Board DTS file with
> > status = "okay"
> >
> > Reported-by: Anup Patel <anup@brainfault.org>
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
>
> This is a good start, but should also cover the other I/O devices in the
> chip DT file.  The mandatory internal devices, like the PRCI and PLIC, can
> stay the way they are.

Ok, I will send another patch which will cover the other I/O devices
as well.  Please ignore this patch.

- Yash

>
>
> - Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
