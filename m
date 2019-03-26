Return-Path: <SRS0=JiLF=R5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A387C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2019 22:27:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C77FB2087C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2019 22:27:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gxcE6ZDR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pbw3ccyh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C77FB2087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0MVjJ57ZpV2Xw2NFckrrA8nKqNuTsFj8fjXTQSGls58=; b=gxcE6ZDRitiQLH
	pTEVaAcRnvuOOUXkHyXNeYD5J22Pqo5jRRGS7ijSR8SLXhnvysHEtmmtkyRvVc1TvdDb/FxcPpnm6
	DVBQiUGs3HrppBA4tRid3uXOJJFs2t0TPW76yGwGiwZs0iw/dVXX3JKG8UaxXB1MqxBq+d0QWNgpV
	QRp8SUQnWI+ivghfqXkwuJS6sQUyYQaLle/F5srbo0ADmcBNGQ7wZBduW+55M/5AtdVRL89qk4Wj8
	cS6rJKBiVbhgXniLvCm1OMYz+Q+F1kHIz/OsLpHCKT8CiuZArWLygQqhAMbjfBIzgZHN2jnSdkXVH
	gxXYngOKZ1bK6v9ohbPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8uXs-0004AQ-Ql; Tue, 26 Mar 2019 22:27:48 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8uXp-00049V-Bb
 for linux-riscv@lists.infradead.org; Tue, 26 Mar 2019 22:27:47 +0000
Received: by mail-lj1-x244.google.com with SMTP id r24so11547098ljg.3
 for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2019 15:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7MY6geL1C4e1zi1eCmJeExb/Ee8HRUHJ9waYR3/unZU=;
 b=Pbw3ccyh3V3o3JDVt0w7NoTp68sq1FJ9PffEoRtUfZhlOu5noOHPPinBsaRtBka1Jz
 iGe1JYKXPXLNvJa606IfQLp1kKcubeeRsu/bdVW0ZNEspB+Pz3SYL2JMlFVAxDO82VkX
 6haorFxk/nekxvaxjp8ZBmlHVTSJM+Z/AzU2S3rqMc//37qXLO0PiCpQ2EblNRLMCfCd
 t7bWzyqS3IHfGymisr+N12V5celmXhq3OBSeiU/wcHy5aNdExb3PgrT3R5PirqNO+RQl
 7wEj7yVZ10emVccmOVXWNUxYfEdDOgRZ/v6QdFe9OZ5uPI5xNaVtvmdwI1lpFjsG/PaE
 sUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7MY6geL1C4e1zi1eCmJeExb/Ee8HRUHJ9waYR3/unZU=;
 b=sGlzY+j4ftMxOb0iSwzQ9ZuPU7bxVbk/1H7+3Inr0ZY6LdpA9moibUFwM+X5Q+bo39
 zPR10ZLoUNQcKlQS/S+R6U6jhj8sVwbDSmxdEXzTM3noz3/le2lBpNagmE7u/KYdwZtV
 mhiu2WunkQtu4wC4bXJd1yv7GTocAQT5PVofEsAMtINLcb7bmTO67mSqTKPktpZMIsaj
 7MKqv2U/TeqVRihA/52Oek1hCpY9YOgFiHGUCYeQ1xLB9bzIbvibt8rKFP0fOpZS0p7Z
 KNQgpqg4zuFfRjUE9pA4S8k8zT2f2teIc/9XtUJ/64GPrtDk1fy4thxudS665WZ1xidE
 kimA==
X-Gm-Message-State: APjAAAU9oryZ20Qh+mrE//mg82dipF0kxBDDttrD/APeB5bnCnE6enA7
 FAXsw8Pyr0JINacZE18snr2cCy0TPEnDFKXrqJw=
X-Google-Smtp-Source: APXvYqzHFG3NGRGQYlGcWMPL14ZLjEt2wy8ksup8izCm8OJZoqsDyovqYQ7660IS7Tt6Oq9CqbF7xvcYnTSayvi4hBw=
X-Received: by 2002:a2e:85d2:: with SMTP id h18mr17271116ljj.128.1553639259897; 
 Tue, 26 Mar 2019 15:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190320223853.1209-1-alistair.francis@wdc.com>
 <20190320234858.GA5304@infradead.org>
 <CAKmqyKPsoi7F_NNLKcm269=VAgdvsUV7HdF3dtkpMBzaKbHhtA@mail.gmail.com>
 <20190322132748.GD19263@infradead.org>
In-Reply-To: <20190322132748.GD19263@infradead.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 Mar 2019 15:26:20 -0700
Message-ID: <CAKmqyKPipi860QSD5ZDHZa-ZOFXnYyq4cy6uYH8acMt_X5sLdw@mail.gmail.com>
Subject: Re: [PATCH] irqchip: plic: Fix priority base offset
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_152745_455595_4E97D917 
X-CRM114-Status: GOOD (  15.11  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 22, 2019 at 6:27 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, Mar 20, 2019 at 05:04:58PM -0700, Alistair Francis wrote:
> > > Well, it starts at 0x00, but the first one is reserved.  If you think
> > > that is too confusing I'd rather throw in a comment explaining this
> > > fact rather than making the calculating more complicated.
> >
> > It doesn't mention that it starts at 0 when you look here:
> > https://sifive.cdn.prismic.io/sifive%2F834354f0-08e6-423c-bf1f-0cb58ef14061_fu540-c000-v1.0.pdf
>
> It doesn't say that.  But it is completely obvious from the map,
> and from how everything else works.  In this case I think the
> documentation is simply written in a confusing way, and we need to fix
> it once we have an official riscv spec level documentation of this
> hardware.

I agree that the documentation is written in a confusing way. In
saying that we make it even more confusing by not following the
documentation and doing something different, which is what we are
doing now.

If the documentation changes in the future we can update the code to
make the new documentation but at the moment I think it makes more
sense to match the documentation. It makes it a lot easier to compare
the code and the documentation when they match. Hopefully that can
avoid and off-by-one index issues as we have seen recently.

Alistair

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
