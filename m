Return-Path: <SRS0=v9z2=S4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BADC4321A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 08:42:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D99ED20652
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 08:42:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SinW6tWZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="n/+hgzau"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D99ED20652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+HFXW70CIkknWv7dvgPE8pvJNJwz6POcozBXiv4orW0=; b=SinW6tWZZGALCG
	eq+QBSsl3I+D2JbCN5/FVyF3TglfospzHcUKbRZwxvrwoPBdIdQrKZvobk/nbBPTuJXMSKGNCr0tE
	TaVzCejgQWBLYrQUx14Ou2C4/KeVGUKNnXSy8mD7Cyu9zS6cy47YC7IruG6/VzgKzOCZuJzGoU5EB
	VPA4cCRj6MnGkcQnVNOA/xZF6hDb5Xrjw6IMiFuhlQJE1weT5eNf2K7H5DhuRQXNGVlCyvYbIgaTs
	XN39VZcstxE+TYgunuN06ct4FigF4wljWUQPJCo77vvM6kzzmNE+TygHokZefzkoi1iEDAHxxIsQd
	+8szKjjCAAqIZ1i4bzpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJwRY-0006Ub-Tz; Fri, 26 Apr 2019 08:42:52 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJwRV-0006MF-OH
 for linux-riscv@lists.infradead.org; Fri, 26 Apr 2019 08:42:51 +0000
Received: by mail-wr1-x443.google.com with SMTP id s18so3341215wrp.0
 for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2019 01:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y9MU1IdAQeQ47a3CDcXM8eoZTJOFdkZQ9xHCLPVf5Nw=;
 b=n/+hgzauxCACf37JbCqubpc6ejARtZebct9i9I1Mt2FY8Saok6AmUEEwzfMAD3wVjP
 m7OYKBxTAi7BbqonQnJVQrQ8jQRNo8PaELaUVe6FizWzGp61N9dyHyo9MzkBuiBFs16+
 sAW0KmcYlDBDIjsQv8CagduWQIbY13uFNSRDj6uYuvaj7XLhxWRfN8qcllhxYX1RwyVT
 3Vtp3r0DX2yg8jjI7sFAVVTM6i/elxwtZTWpTdpTZLE7FtwGqVKngGxX+gH17w0q+yWg
 znrOLU0IGOQtXxMh5caRX3xzPyQCUNX7I4EcybbV6csSurhkOkROPjcLE2ccGf4FlQqk
 71Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y9MU1IdAQeQ47a3CDcXM8eoZTJOFdkZQ9xHCLPVf5Nw=;
 b=F5F7V50MTKoZ5A60JNJzI9dBIqs2oTezeDpU7V3DQ58ZAjOaEFdTqLZqVSAweFhp3c
 upeG/2gVR4dxLgFqNiJR43/dwEPceA9/laehWVPLVtl6dU/aXB4O0Kx33tGxMVywlelR
 tzjXx9siqxei/SQFFg/VPIxi2k4NoZ6Wc6eNdbfXXZGnrZEDvIxN2E2Q6vOimghTFOdO
 CR+DAZcF5oW3/7ZXyL/90MbcitfEXhW2BcJ5akjX0ydIUIBqOLJTC6U54CJp+7EDRMW8
 DXo+P7w7BlOttlpgIoSOFAaQEQXjO3quPgR/Ced696y1wU1Mlk7c5QHZXu9xxJGTlPhY
 RoGg==
X-Gm-Message-State: APjAAAWH/8B0IAYY3E0yFBD9m+nhWS5W88tyindHeS/eaysiVUVQk82d
 2CqVkNumz+KKNnclLAn24zQWUp/kNkAgw1hLpaISlA==
X-Google-Smtp-Source: APXvYqzMNhhXRFesWECwTBM7WFb1r0WtOR9RtHwmmhiGhakLC1n7xqdll33oaj9riCM93DkXikdAgfKkPd8Gme9hb1w=
X-Received: by 2002:a5d:5346:: with SMTP id t6mr9152799wrv.59.1556268165924;
 Fri, 26 Apr 2019 01:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190425133435.56065-1-anup.patel@wdc.com>
 <9a8be7ef-e62e-2a93-9170-e3dc70dfb25f@wdc.com>
 <20190426062133.GA28529@infradead.org>
In-Reply-To: <20190426062133.GA28529@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 26 Apr 2019 14:12:34 +0530
Message-ID: <CAAhSdy1nVFCwiP6vyy9i2f+S2WxLodmdwpwUKZUHYz15YfR64g@mail.gmail.com>
Subject: Re: [PATCH] tty: Don't force RISCV SBI console as preferred console
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_014249_840337_6116E6AE 
X-CRM114-Status: GOOD (  12.23  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jiri Slaby <jslaby@suse.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Apr 26, 2019 at 11:51 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Thu, Apr 25, 2019 at 09:41:21PM -0700, Atish Patra wrote:
> > Do we even need HVC_SBI console to be enabled by default? Disabling
> > CONFIG_HVC_RISCV_SBI seems to be fine while running in QEMU.
> >
> > If we don't need it, I suggest we should remove the config option from
> > defconfig in addition to this patch.
>
> I think the whole concept of the SBI console is a little dangerous.
> It means that for one piece of physical hardware (usually the uart)
> we have two entiries (the M-mode firmware and the OS) in control,
> which tends to rarely end well.

I think the SBI console is only useful for early SOC bringup and early
SOC debugging when most drivers are not available in upstream
kernel. It cannot (and should not) be used in production deployments.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
