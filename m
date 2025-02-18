Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1B9C02198
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NP99w+PtQZquIY7R4C27verq1kLc8JEPZiGdFtdt3zY=; b=xTmvDf0EwGct7q
	ZG+gm9lvybRHtKXtoMqvmuNdKXtw2UXZYqAaP2/vUXVtiMWHaUqUEVdyqH6xIxbmaO4l5IZ2ZzRR1
	bDPdkrbUGsDEh13vO86Oj80nHKrg776umI/tDWfm4mua7BSlE864rd59iCXqFVkAVuGZwtGaC0d9Q
	X+2BeKpA6VaUs8Suvd/zU05spHDMI0OpM2yzKznolbJPFQkL/7xx8izaZIiaLIZfSmaTHw4WWQSDU
	7V9x9WfH4gqYhZ1r5uekueRuncz1kyZMO5fPVNNDPhY9B/X/NxznzyT6XQ1d+2pZQgLWby2DZutRn
	/MXk0LOZ+2P6mZJ1EkWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOTf-00000008UCh-0q57;
	Tue, 18 Feb 2025 14:21:35 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOTc-00000008UCJ-3o3g
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 14:21:34 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5debbced002so10369206a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Feb 2025 06:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739888491; x=1740493291; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=epp5Oj1kI3V0zqhBHGE/nEmzKDkVzIEDSBJvoi97Moc=;
        b=L/kBoSUxqnINzBuk2a+d2JqRgUyBx2eLvagtMwgiHP1WgDGZaT+WCjTBgBRfPSJ4cz
         qo9xeMqniJCWJHTJAycRspyGD14/nipMyqKt7dAoi3zbidglENZ8QhqxCgwOBzKaH1Ds
         cVPFPsaqdRKZkRbYiuNkhPRfVsVjPXoNMQtmMbxH1nzkS/MbYEEXyi3+oaLB3LoMGGLq
         xBcFWOYaQfjkOmOm0YgMX12o8R+uf48mRXMn94LwEpA4ocAlRPZ/qTpn48ImeR+p7sGI
         PpcdT9hF50hzfWHPDUPrUPFtvnL4nID44jjmLy/2JXU89ZvjqAosLKZk+S+YbycXWduf
         jIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739888491; x=1740493291;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=epp5Oj1kI3V0zqhBHGE/nEmzKDkVzIEDSBJvoi97Moc=;
        b=RHWKPAXPppdRxyt0HQrh3cGDT/Oz6PacusBZcrjlFTF9LTVuJSqfpWPPV7FohxRrm3
         Bo5euhW6145NTUAUUK9/opmcBLvojOqtlkZccYsyZR5Jl7qp/3ows4Viyaoj+D/PqAQW
         UAgWn/FqJLaw30XQjaqbQGaYAZ2gy2vVsQXaSF8RZDzgCgr/wZQTv2T/c9wjWJCRbBYF
         i9cjwv+wBW9HjwO7bpD97s7i8fzwc75gtUN5YMUO6CyIlbISKFKG/AWWPntxNMeUgq+9
         TvDYsCU/tNqeOQx+y9Y1lcrjff7twn/hkgFogJe74x1ZTWlK8U1GcALCHvI0LypHrzXp
         VRsg==
X-Forwarded-Encrypted: i=1; AJvYcCUQg0rnnNzq2SgDzTyOoI5ef41flx09tmE/8tAN7W68yz/jxjvBfi2qb59gvUxfkBBKbYxxEluqrkB+Vg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywel5dyO837xpqHVj+z97yCvpitovYo/7POOYR/K/2gEkMDdXuy
	VdT3NaW4ojHHK+cKKmkGNMM2XYH8mw3TdQ67pFjahSLoqtnsg3plnhVVnS+CcbU=
X-Gm-Gg: ASbGncs8OuMzQfqmGUuyw5V/eI0C4TlQ3tkZiaF73P7NOVT9EHdk1GMymXeMNh6C591
	raj++cfJ4djzILTi6KzbDUGHN5lgHMabK6St3FMsCxOXV/OSU93KDcNiVeQdu4u6Z8+iHiaxKpB
	FNKdnGiHhAqgjx2XXgh5DjNO9jlkFJ6ArbByX8I1Fr24a5p7o8ZkZjxrKW0KOuTN+tAV4S+LBAS
	zwO93ftE0u8lD+knzN33Z54GfacdwEMEckLMLS/IMduyrTPtG53bhcKsWHRYsBQlJ8cblv+DR/Z
	djAR65VuQ4lT2SJDBoGi
X-Google-Smtp-Source: AGHT+IGm8Y3zgYesHPFu1v5tsyTj/+j/bH9iWtpP4bLHsu1ODM2GS9NeO/WPPPsgDryp1DtOkgMs3Q==
X-Received: by 2002:a05:6402:234a:b0:5de:a972:8c7 with SMTP id 4fb4d7f45d1cf-5e03722345amr12702547a12.5.1739888491339;
        Tue, 18 Feb 2025 06:21:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece1b5415sm8699308a12.4.2025.02.18.06.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 06:21:31 -0800 (PST)
Date: Tue, 18 Feb 2025 17:21:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philip Li <philip.li@intel.com>
Cc: David Laight <david.laight.linux@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Christoph Hellwig <hch@lst.de>,
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Carlos Maiolino <cem@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: Re: fs/xfs/xfs_buf.c:1534 xfs_buf_submit_bio() warn: unsigned '_x'
 is never less than zero.
Message-ID: <78ff844a-0fb4-42f6-b54f-4d19e14cfd05@stanley.mountain>
References: <202502171326.j4Xd3I0j-lkp@intel.com>
 <20250217092445.GA29568@lst.de>
 <a14347d2-6189-49bc-a1cc-e5959e76e6c2@ghiti.fr>
 <20250217131203.2657cc4b@pumpkin>
 <Z7PWuSA4jtZnxp5J@rli9-mobl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z7PWuSA4jtZnxp5J@rli9-mobl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_062132_945454_F6731BA4 
X-CRM114-Status: GOOD (  23.21  )
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

On Tue, Feb 18, 2025 at 08:39:21AM +0800, Philip Li wrote:
> + Dan
> =

> Hi Dan,
> =

> On Mon, Feb 17, 2025 at 01:12:03PM +0000, David Laight wrote:
> > On Mon, 17 Feb 2025 13:06:49 +0100
> > Alexandre Ghiti <alex@ghiti.fr> wrote:
> > =

> > > Hi Christoph,
> > > =

> > > On 17/02/2025 10:24, Christoph Hellwig wrote:
> > > > On Mon, Feb 17, 2025 at 01:53:08PM +0800, kernel test robot wrote:  =

> > > >> New smatch warnings:
> > > >> fs/xfs/xfs_buf.c:1534 xfs_buf_submit_bio() warn: unsigned '_x' is =
never less than zero.  =

> > > > Looks like this is an issue in the riscv virt_to_page implementation
> > > > which also shows up in various other places.  Any chance this could=
 get
> > > > fixed in the riscv code?  =

> > > =

> > > =

> > > To me, the only test that could give rise to this warning is the last =

> > > part of:
> > > =

> > > #define is_linear_mapping(x) \
> > >  =A0=A0=A0=A0=A0=A0=A0 ((x) >=3D PAGE_OFFSET && (!IS_ENABLED(CONFIG_6=
4BIT) || (x) < =

> > > PAGE_OFFSET + KERN_VIRT_SIZE))
> > > =

> > > But given that the config is a 32-bit config, it should not be evalua=
ted =

> > > at all.
> > > =

> > > Could that be a false-positive and then an issue in smatch?
> > =

> > Why is smatch even looking.
> > The equivalent check in gcc has been moved to -W2 because of all false =
positives.

The Smatch check is a bit more sophisticated than the GCC check...
I think if you removed the (!IS_ENABLED(CONFIG_64BIT) condition then
Smatch wouldn't trigger a warning here.  How would I duplicate this
warning?  The "ARCH=3Driscv make.cross" command does a 64bit build.

Screw it, I can just silence this warning based on that it's a kernel
build and the variable is called "_x".

regards,
dan carpenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
