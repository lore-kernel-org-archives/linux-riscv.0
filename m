Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC70C02192
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 01:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fRdVzstmOND40NaiPF9ctq9JQ9Q48Kzc471S7+iVIoQ=; b=nd/UsdXmOGnY5w
	gUpnLJPzzcUe0bZ24cZkYQSx/tyUoumkttDS0xMd9mTmicJxRWSsSsJn0tXh/GLpKuv0OPDr+y4o+
	aUJE5XrzYHKtIihpXtOKmfDnFH/DIYNStGr8ERPZRbcX4oqI67Y1tKb+fGckpgDiqlSkNjs7gZOSi
	HB0krV0kfr2JRHNYJ6Bnu39iFxErZ1enIDN8elaGooKTjbomRcwXnjVRCJh9WPpmWWPyjEHB0xBUM
	tRJjb0jCcW5rw1bgSi5yE4/31jubpxA31XrFNVQ4jDPW+b46eQUeg9K2394f13Bx6sJ9Fuqtfsb0r
	UfYR4gyp/8vMQq0A3QUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfqRM-00000004yC9-1J0C;
	Thu, 06 Feb 2025 01:12:24 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfqRJ-00000004yBk-3Xyn
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 01:12:23 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-467a63f5d1cso3883051cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 17:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738804340; x=1739409140; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5pBMT0z7Wu2vduHIjcx/FLiyYRunJu9Lrm6JuBMMAwA=;
        b=BbA8AhBMAf3hCBmy5OQ4FHhVWQwU0KDlLSoD8duIRoB7/trlmaZOBvmppkDwYNQJGD
         M7Sb0/pw5Y20tsdrbpXwkdKB8zjaffXcSQ2vpsTyYm/NdYh0sh/s8Nak6MO0YSR79hK4
         3TfOBb/OrFMK4EhzGyzamOi3ZjlA1Bot++AEKMyAhBrHurvi+k7OfOLmMH6ziddBlUga
         i57DOcJZuvRp+6F/g/Y8ee1YP0eacxFtIKgw090usFvZZHZd/LTbFB35x/ksRLNkuO4m
         5FoaX7pWhl7Ir+wI1jLpMg86SyF0XiZCKmc2BmoBdE8Jh+PmXGXFVDGZkrloQCqMHyZB
         Czsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738804340; x=1739409140;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5pBMT0z7Wu2vduHIjcx/FLiyYRunJu9Lrm6JuBMMAwA=;
        b=M1xmNMYZrZZlIgojgSPViEsmB5cmRQuAgQvcFJE8792zzK/c7uqLCI96QTOwEbSIVj
         N8mFLa5chiC9Gl/PBbm6zjbQRyJpnovyqy4CKlKqa11kBL8KogjE2JFTivL734CYRgNH
         giiiCBz9pAp2gHGWtKHTLeaI62SVf5W6Kh/ZQATMVT9tLnIGZYQKeQyYEzO5LWljip+j
         XGllNfZAAcwiwoLuuM6Bq5JI1uHk5XU56CyxTL5SW47gCXF6yj/nq1VCSpzxIbmcOT1e
         Gi/7kpseT7QQ9uKufqO++QQlUSonjR07KKgUdVLJ24ywRzU5/shtZWtoeScdyULLwba7
         qB3w==
X-Forwarded-Encrypted: i=1; AJvYcCUxBUIBpjWFrFNchy/P7ntJ6XoJk5cxgCHyBHmfNSNrPGCr/60NgSuo9WZ7XJNitJyqgw/Gh7rpPtp4tA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOQDycv3zZseY5SIYawb2PE3e+SiceHrsg+ipJFrbZ6XgZouXw
	j/HuPYDuENQ2iWWvjaPtJ4lH0SYsmvfxUcAbebmaq/eGAuGtGTsh
X-Gm-Gg: ASbGncukbvi3hFkfklQCTK4wRGEdqUnFwwtDnEomGq5YptMmvTs0wWn1+QXwaxgky+J
	nBjo/MYCgp+9ET8Cib1BTrzsNjCyZNNxuVyLCzJxoDVZWNYCQ3O5ho3NTfK88moAcpslwbwDPCV
	a29WIc20ubw8Mc4Bt/qbSSsDXpc4WiYJXcHf/L8KjH2eAByjJPh9y/66TInDINBgtRl+frSJGeR
	m8ni1TTvViY1KZf+bHLG9H/VIIYRwjbZFfMwKOpuQR3vVlpCp2ehfnR7iijHtzPkm0=
X-Google-Smtp-Source: AGHT+IESyoVUGameDYJaCxkueA3j3WJ8VNCDRm28ssP4Wc7/H2APc3QV+nga2VASrKsUBbDJPJR4Cg==
X-Received: by 2002:a05:622a:588e:b0:467:57c8:ca31 with SMTP id d75a77b69052e-470282e9725mr69180751cf.46.1738804338791;
        Wed, 05 Feb 2025 17:12:18 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47153bec3aesm526501cf.72.2025.02.05.17.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 17:12:17 -0800 (PST)
Date: Thu, 6 Feb 2025 09:10:50 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, inochiama@outlook.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, 
	chunzhi.lin@sophgo.com, Sean Young <sean@mess.org>
Subject: Re: [PATCH v7 2/3] pwm: sophgo: add driver for Sophgo SG2042 PWM
Message-ID: <zz3uvb3qhbbqyf37s4eleqwxyuvftm277guuqkefv4kq5k2zal@kt3xjztfou2p>
References: <cover.1738737617.git.unicorn_wang@outlook.com>
 <ae8ea1bf0bb0a09336cd8b7f627a994630524bba.1738737617.git.unicorn_wang@outlook.com>
 <ivgsidvdx2ypntnlopww6fiwyuzj2sadt3znyofr54dsz3c5d4@3mr25vhwlwy3>
 <PNXPR01MB7488BA555BDE96E59741DBACFEF72@PNXPR01MB7488.INDPRD01.PROD.OUTLOOK.COM>
 <o4j72fdw6v6aiuvgeufugzptmfpmpws26zp5bf27hdq2i6cng5@yqmdasof3ynp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <o4j72fdw6v6aiuvgeufugzptmfpmpws26zp5bf27hdq2i6cng5@yqmdasof3ynp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_171221_884333_4CC95977 
X-CRM114-Status: GOOD (  14.95  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 05, 2025 at 05:33:38PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> On Wed, Feb 05, 2025 at 08:57:20PM +0800, Chen Wang wrote:
> > On 2025/2/5 18:06, Uwe Kleine-K=F6nig wrote:
> > > I was tempted to apply this patch while reading throug it until nearly
> > > the end ...
> > > =

> > > > +		reset_control_assert(rst);
> > > =

> > > This is wrong (well, or unneeded). With
> > > devm_reset_control_get_optional_shared_deasserted() the devm cleanup
> > > cares for reasserting the reset.
> > > =

> > > > +		return dev_err_probe(dev, ret, "Failed to register PWM chip\n");
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > =

> > > If you want I can apply and squash the following in:
> > > =

> > > [...]
> > > =

> > > ack?
> > =

> > Ack.
> =

> Great. Pushed to =

> =

> 	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/f=
or-next
> =

> with the suggested fixup.
> =


Good, I will take the dts next Monday.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
