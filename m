Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613E7CA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 09:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9zbsU13p7/69T5Bb6InvYSKeqXJqm03uTIQ0yxtIlw0=; b=ogrqb+pZer2LVE
	1GwfouD2hv4cIxa7EKiwhPpkMsTnWHkJsrsSdHnzQgZbsfJjcEZdn4nztKF16zS0lU8KkvUkFxqCv
	tpgx6SJxJuwE/pYdV8Dezq7hP1UaimH6l1A52ntzPaRiuL2ibsw717wOmqK1gJymlw/lMMrNGPHGR
	jk9A49AkxIELNO+eRY1q1zA9SDzV8CzTl0MaWgMPmyXwgXG24jVuZVmN2kYkTfuMC2xCE+DP2U7hc
	0VJLBjh6QCOIXEpzcVe1a302kzP/1hoc5Wh02YTKtNMHo1Imm76znTnHwWoxbxjZartncZBcv9uct
	6JYprgz+xHwet/Je5NXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkfV-00000004Urk-0UED;
	Sat, 23 Aug 2025 09:36:13 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upVmr-00000003Fso-0kZa
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 17:42:50 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-32326e71c31so1900242a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Aug 2025 10:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755884568; x=1756489368; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eCaKntriNX9X76AtgWLOepHoJZS+qCu003aK7xkrmig=;
        b=I32tPP/k8qwy8db4DVP7jbo18cLgJtNDkLAVZPltN49t+L32gTBoxUdrEMHf1ZFXGi
         emfIFI96DFNvoVPyIwE6qFylbP8CIQBDDl5zXzL8//QAoFojpzp+2sAAlT4mUSjmkeb7
         6N4ov1RLpwN3Eze4GcEU0TyEryzYhg2ZckOz9kREmxKCDrCGvsRzPIWvn9IW5k5FqK+w
         8rztOU6lx0fZMaTasas7xX++V64HfZ+to/9sfZqIqX10LTMrkSA62CUT8H38M2inAhOI
         ky4jnGsTebH5RBotDGnrCiBbtpEiTvkNyHrQfvWb8Yp5frDRB5Q6Yi0YJLIYmgRh8aSj
         l7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755884568; x=1756489368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCaKntriNX9X76AtgWLOepHoJZS+qCu003aK7xkrmig=;
        b=HHmncL18l+6g8Ptf+zoolA6RsZSWOhpMj/d7hLU0i1z/HNiaiRzn4Bmcnew06xo/2z
         ewHz8j9ILFDuCyYYekxyK4R6T9VHM6SELPZcWdOmm7wQay0fepu53VGoVhW4Uer3V06k
         kAy550NCIn0Jhb5ipWCZHNFRoyGdpG+/KfnOcDyrE1DoX+SH743DkCWIDB7aIKylYN2V
         +Qo+gReFshNX68+j4AT2TEoq/m/AeeV9kqLFGScbPqn8w++WzRZjta9i0rMOh1xMTWXR
         wiyMkfanQ8ZVWUUaG4R6TDVOG8dkXp/1LAYznX2+uBbfPiEoFh4WT9mQInPJ3H1vFcOn
         Y8LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfMwPGyO0WgmPYvtqKW+l4RlDvni5QY2xNFdHa/l8Y5vWzLNXhdqlmR+X9teOlRGdGkfgJh4uivzRiDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzM226vp6QNkCIsSkrEOgnGArBdwhk+AzTggzqP7UZKcfYsYhi3
	p7gQ3LnPSJcd9IeBjAupByKhkONHp2WwVGjMTMSgzZ6FtDkC5bfqNc3/
X-Gm-Gg: ASbGnctf8xvn+mJ7A3zbCNkmLZF7MOxv/PwLmg9SEfDtJPXkbtfZpgiAiXgyFhkLqjY
	HWcRxji7j89S4b95oMQhp9BzVh0YK6zWALtKLU+vlcjd59bPPdQoTJI5b96tgq2KmuSqpX4B9Lp
	qcgo6BbLvTqXOB4rPjXpsU2JgdWIwPcSllJRHJRIJuT+y6OosOenhIRn/C1JrROqqA3K0KcFHGh
	XlIVwdf1Ma8bJgepY03eW7Qfi5xWYXvaKNL20+sJt45M8y0dWQQaGJNuOLNaxWCeFs5OIuaZuEI
	Bxx508NrHM/Mrp51S3mtwDKgI4FGpUw+EHAwPIl3/qeewoh5ftUBDQXnxMAcH51/BDf9NAIelyD
	AtELnCyPhKybZKmg2NPkUQACmJ9P0HAQKBH5zM5ps
X-Google-Smtp-Source: AGHT+IEalTXMRLBExjkJfhmWbKfZGlEYQ2B/07dHyNwP07FTl5MUSsyyOzKrKUj/4k/aKk0GC0EYCg==
X-Received: by 2002:a17:90b:4a47:b0:323:264f:bc42 with SMTP id 98e67ed59e1d1-32515ec2d23mr4934158a91.3.1755884568015;
        Fri, 22 Aug 2025 10:42:48 -0700 (PDT)
Received: from x1 (97-120-254-139.ptld.qwest.net. [97.120.254.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3254ae8ae9csm287059a91.11.2025.08.22.10.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:42:46 -0700 (PDT)
Date: Fri, 22 Aug 2025 10:42:44 -0700
From: Drew Fustini <pdp7pdp7@gmail.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Matt Coster <Matt.Coster@imgtec.com>, Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Binns <Frank.Binns@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Drew Fustini <fustini@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v13 1/4] drm/imagination: Use pwrseq for TH1520 GPU power
 management
Message-ID: <aKisFGwxmgV7u3XF@x1>
References: <20250822-apr_14_for_sending-v13-0-af656f7cc6c3@samsung.com>
 <CGME20250821222020eucas1p20e40b85b991da0b4d867df76e55350ed@eucas1p2.samsung.com>
 <20250822-apr_14_for_sending-v13-1-af656f7cc6c3@samsung.com>
 <aa8d4ffb-4607-4bff-9d87-8635cd37d439@imgtec.com>
 <55e606c5-9ac0-4e0b-8506-5f88a6fc540e@samsung.com>
 <daf94e44-7c37-4fa6-a31e-b043b7bf46f1@samsung.com>
 <6df6dc78-d86e-4289-bbe2-0bfe4b168c43@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6df6dc78-d86e-4289-bbe2-0bfe4b168c43@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_104249_243238_DA7281FA 
X-CRM114-Status: GOOD (  22.66  )
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

On Fri, Aug 22, 2025 at 01:49:38PM +0200, Michal Wilczynski wrote:
> 
> 
> On 8/22/25 12:26, Michal Wilczynski wrote:
> > 
> > 
> > On 8/22/25 12:04, Michal Wilczynski wrote:
> >>
> >>
> >> On 8/22/25 11:28, Matt Coster wrote:
> >>> On 21/08/2025 23:20, Michal Wilczynski wrote:
> >>>> Update the Imagination PVR DRM driver to leverage the pwrseq framework
> >>>> for managing the complex power sequence of the GPU on the T-HEAD TH1520
> >>>> SoC.
> >>>>
> >>>> To cleanly separate platform-specific logic from the generic driver,
> >>>> this patch introduces an `init` callback to the `pwr_power_sequence_ops`
> >>>> struct. This allows for different power management strategies to be
> >>>> selected at probe time based on the device's compatible string.
> >>>>
> >>>> A `pvr_device_data` struct, associated with each compatible in the
> >>>> of_device_id table, points to the appropriate ops table (manual or
> >>>> pwrseq).
> >>>>
> >>>> At probe time, the driver now calls the `->init()` op. For pwrseq-based
> >>>> platforms, this callback calls `devm_pwrseq_get("gpu-power")`, deferring
> >>>> probe if the sequencer is not yet available. For other platforms, it
> >>>> falls back to the existing manual clock and reset handling. The runtime
> >>>> PM callbacks continue to call the appropriate functions via the ops
> >>>> table.
> >>>>
> >>>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> >>>
> >>> Reviewed-by: Matt Coster <matt.coster@imgtec.com>
> >>>
> >>> Would you like me to take the non-DTS changes via drm-misc-next?
> >>
> >> Yeah I think this would be appropriate.
> >> Thanks !
> > 
> > Hi Drew,
> > 
> > Matt offered to take the non-DTS patches (1/4 and 4/4) from this series
> > through the DRM tree.
> > 
> > This leaves the DT binding and TH1520 DT patches (2/4 and 3/4). Would
> > you be able to pick them up through your tree ?
> 
> Aw,
> Sorry I think Matt also meant to take the dt-binding patch, so there would be
> only patch 3 for your tree.

Yes, that makes sense, I will the dts patch through thead-dt-for-next:

[PATCH v13 3/4] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
