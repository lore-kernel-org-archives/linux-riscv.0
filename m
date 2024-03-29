Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544C5C6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 16:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ufj5Wxo1srcxz8AtET+UmNBYV1p6tuoQRSr7EGujVps=; b=ZWVFPwfxjez3SG
	GutcQSxScFPbloVT9R/ejyiwllxxucDIvLUqhEucJ59r7Ratyuir+dcYCsDElXDFBjqXyEQSOpbzH
	wndQsTHGf1BzKX4uMaLRXP+gV8m9mMiajx/zPFt7pizj9xmZMcNAKLdb5MpslmuJkSRpSRa7GLOVl
	b/KIhmfz8YuTvdGiOI2Fgc6bFIVvtuZaamqbol/bRtLboCMV7Rsbp8/BhlZTFubWa4sFK/h0QDQwi
	x6XJHAQuXn6uX5P1m68jFnIQzlqepK6ZYfdsExPNX7U7M4N4lkG6sFWurJZ4JVUllAtvNHCDmLOaG
	/YOfiFpJ9uyaBQQ9ga9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFPy-00000001MfI-1yQq;
	Fri, 29 Mar 2024 16:49:26 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqEKx-00000001Bds-1m0C;
	Fri, 29 Mar 2024 15:40:15 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6e709e0c123so1910534b3a.1;
        Fri, 29 Mar 2024 08:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711726808; x=1712331608; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iN31wd2vCkiTGMz1OBtEaB4JW8VyiA1XbISlyEebr3E=;
        b=M2VV8TDTxMH1x5R6eohkb7Vm+YorT3DNwba+osiJRUx/l0Fd09wRLey/V3JMwIVCoN
         wFAk6tHeCCW0wweR9G4Id5sd+MUD8nRpuqvsWYBKt1PpMRCc1ZObfb2BudK0Z62tR+1M
         bY2x8dVXCNPev3Dok0CqwdNwBI1rc1Iyce4Ar4C+3ehmJ/gQVuXLoP58FUX4wA88hK5T
         YyUdbZG0WOvDlHz86cXjVcxGCM+1MKzaQWM0POZxlu/vJWM8Jv9AAlQHnTuAeVFqkqg7
         Dl76oE2TrHXq4I7bMMwDMH+y1kYh4fjqwP1x+y1Gn74THLpwswwh9JFwIF614CQnF+5a
         ZdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711726808; x=1712331608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iN31wd2vCkiTGMz1OBtEaB4JW8VyiA1XbISlyEebr3E=;
        b=N/28Y/NFjZzUq3ZttQlV1WyAP1Ch2ff3CYWgMoXIUkbqRb5XQswtAneZ67z5YRsedL
         2Z/6WsQo/8cFfxbjaLsQOueBRZfbcqOSBIj6RwleXkJ1eetCELZEbKq265ToIBiWCnWo
         dNCbCz5F8O2kSuaNH8IPzcEhUSJuPIfEvtppcN1K5eghetZ3mO8T9JzQN5eyg86UyYZZ
         KVc/s1DUqKCpHOa3WycdyBM6eGaowzoY68F4/SjtTX735QUU+sU1L+oT/HfVLCEFIo1v
         96D42keNR4tvoac9QTFel5NtuLj1nOJEz1JxJbhPW5LFqviF6q04ny3Nh4q0ua77v5SP
         5Ang==
X-Forwarded-Encrypted: i=1; AJvYcCVuuOgGfL5FpWIENNj4dyBGwwnhIDWDMDBI8kkwinnSOCexo52Ct3tpVuwinPlFUE4mGZ+WHT+cvuTHP4hWf6SgedwPyOqR/y8tNmc7EB6X14XGGt7znmLkT9AE5VRykKvgIkFH3c6Zmkmv6h39heL+fqZjjqw=
X-Gm-Message-State: AOJu0YwTnCcsNAWpMstMBO1p/f3DcPspSHsSD+e52/iNX68qJu0Ra0o5
	udnHB+leV1R6mwKFJLx16jaG7Q2PY+ovfwEFf24jNbev9b5yhxjJ
X-Google-Smtp-Source: AGHT+IF0O7HII5MYlv2g0E+BHBSm5qRGKAR+0KxI+xwk6+g8c7fXn65jtKX0C7ci+tZdnr/ge20LGw==
X-Received: by 2002:a05:6a20:3c90:b0:1a5:6bfb:76de with SMTP id b16-20020a056a203c9000b001a56bfb76demr2694088pzj.2.1711726808383;
        Fri, 29 Mar 2024 08:40:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902db0900b001dd578121d4sm3581907plx.204.2024.03.29.08.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 08:40:07 -0700 (PDT)
Date: Fri, 29 Mar 2024 08:40:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Simon Horman <horms@kernel.org>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH v2 12/14] sh: Add support for suppressing warning
 backtraces
Message-ID: <d7663e19-74d5-478d-becc-0a080075e7d6@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
 <20240325175248.1499046-13-linux@roeck-us.net>
 <20240327144431.GL403975@kernel.org>
 <320aacc6-b7e5-4c3d-948e-d0743ab26c5d@roeck-us.net>
 <20240327193920.GV403975@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240327193920.GV403975@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_084011_493964_C6B517BC 
X-CRM114-Status: GOOD (  23.50  )
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

On Wed, Mar 27, 2024 at 07:39:20PM +0000, Simon Horman wrote:
[ ... ]
> > > 
> > > Hi Guenter,
> > > 
> > > a minor nit from my side: this change results in a Kernel doc warning.
> > > 
> > >       .../bug.h:29: warning: expecting prototype for _EMIT_BUG_ENTRY(). Prototype was for HAVE_BUG_FUNCTION() instead
> > > 
> > > Perhaps either the new code should be placed above the Kernel doc,
> > > or scripts/kernel-doc should be enhanced?
> > > 
> > 
> > Thanks a lot for the feedback.
> > 
> > The definition block needs to be inside CONFIG_DEBUG_BUGVERBOSE,
> > so it would be a bit odd to move it above the documentation
> > just to make kerneldoc happy. I am not really sure that to do
> > about it.
> 
> FWIIW, I agree that would be odd.
> But perhaps the #ifdef could also move above the Kernel doc?
> Maybe not a great idea, but the best one I've had so far.
> 

I did that for the next version of the patch series. It is a bit more
clumsy, so I left it as separate patch on top of this patch. I'd
still like to get input from others before making the change final.

Thanks,
Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
