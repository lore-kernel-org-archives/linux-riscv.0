Return-Path: <SRS0=t+eB=NN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DAF1C65C22
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 16:37:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DFD820657
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 16:37:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G3O1IFQe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MMJUVTRs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DFD820657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H+oBkiQ1tykaxZCnO7oqQlyI77V3mEf1msH9xx41Z8U=; b=G3O1IFQeh2pxvZ
	8VGYpAWzbepSjB7VKIF4MszOObzwvQhYHYUmWYQwC0S3CiVspx8pyW5KTwGnIOHLxDk9hM2oV7+Q4
	Aa/kCkGKZgCTLJC7pmdBRrMEstptt0YAWAqS1EC7ksifbq6jXiEQkhHxd1XV60+Oc7DQMhNL/NWW6
	+ph7NmzAoehMgmYb2JcfB9meNvaDpuh9bjqWMFqlf5fTkTlFRnvNyAHSXDakxx6hgUoKev5qUud6a
	aG1m4xWft/ucq3MrbrchUIc71dBUZhE9SvJ9fYnXnTK9zfQUh4IYyqBEDKsdJwu/NV7/WyxxEk8j5
	t2uT4it1HMa7HSKUYL7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIcRs-0004WW-2W; Fri, 02 Nov 2018 16:37:28 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIcRo-0004UU-SS
 for linux-riscv@lists.infradead.org; Fri, 02 Nov 2018 16:37:26 +0000
Received: by mail-lj1-x242.google.com with SMTP id z21-v6so2313441ljz.0
 for <linux-riscv@lists.infradead.org>; Fri, 02 Nov 2018 09:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PWcEFiyjbClMNHKABKV8f+u1WzFBO0mC6izv7Mf8kcY=;
 b=MMJUVTRsNhyUhJQHeDIo1xDmV2GVOY5FIz1B8vnebJ4CTVHc82WtFguIYXE3CWFSz/
 2bO8UIxvLaz+bn5DOvjHRKwz+NY+Z5vC+ywUvS5bLUo6Un+xuuKejMwMf2zBJxp00LM5
 1sFgsRUe74sBMF1Va3dg7XQYFR/Ne9EELj/E8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PWcEFiyjbClMNHKABKV8f+u1WzFBO0mC6izv7Mf8kcY=;
 b=es9JvdzOnk0rj9U6m3p9GJBUGXK1r7uXKq5UKtmi4pj9AyPi/zaOmnRyEafjxvi4RZ
 ENW6Ox0jtYofweCQry5FqrHDMaMmov5CzXeoNJ0ar99QpjwA4kX6cVZWVJ3rKY3HYHW3
 iQcyIEink1eeHbmcSMCJy+jfbJeGR2QGu6gm42n6tPALZonw/qG7CVwHTocLSqVnvk5r
 XNwpRNMWqZnmlS2J1eY/hGa5V6y0gHONLpFqthD4WsdpkkZmVqDYEWIvmhFYWGVaDzSD
 dTKdyRd66Imqof29PYLCsphnInI+jXx5UI1Ft7UunBeankVDJumbVd8YOLXjm/Wh4OPN
 NCNA==
X-Gm-Message-State: AGRZ1gKLg96qEZbLUbL6kLZ1GsXizDvUCD1x5YgxbPq8K4ctH047/LmF
 3kvuwhoNvowqPrBINYd565y1MhoNHPmSpA==
X-Google-Smtp-Source: AJdET5esagDMQSB3tthdk1ix4s24mYuv8xubIxJ3L8ALHuG92o3d0IK5ZQQ4pbeT+jcqeJbu9Tr3bg==
X-Received: by 2002:a2e:8045:: with SMTP id p5-v6mr7914636ljg.87.1541176631504; 
 Fri, 02 Nov 2018 09:37:11 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54])
 by smtp.gmail.com with ESMTPSA id a14-v6sm5369712lfb.22.2018.11.02.09.37.10
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Nov 2018 09:37:10 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id c16so1743307lfj.8
 for <linux-riscv@lists.infradead.org>; Fri, 02 Nov 2018 09:37:10 -0700 (PDT)
X-Received: by 2002:a19:3fcf:: with SMTP id m198mr7067237lfa.106.1541176630088; 
 Fri, 02 Nov 2018 09:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-cb2ea62c-8d08-467b-bea5-657b42a5acbf@palmer-si-x1c4>
In-Reply-To: <mhng-cb2ea62c-8d08-467b-bea5-657b42a5acbf@palmer-si-x1c4>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 2 Nov 2018 09:36:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi+Ky330NCjhqTfv=6daYvSXbRvFr1JcpSpSoHBCiKqYA@mail.gmail.com>
Message-ID:
 <CAHk-=wi+Ky330NCjhqTfv=6daYvSXbRvFr1JcpSpSoHBCiKqYA@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 4.20 Merge Window, Part 3
To: palmer@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181102_093724_917794_BB042863 
X-CRM114-Status: UNSURE (   6.73  )
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
Cc: linux-riscv@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181102163654.mEn37sf5p994bafistyB3RCYPQ5K78k1PKgFCwg9iYo@z>

On Thu, Nov 1, 2018 at 7:19 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
>   RISC-V: refresh defconfig

Pulled,

                  Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
