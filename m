Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39E4C3ABC0
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 12:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2UlSt5zBox1h86WQhr95IWZkdWsVeWCouz/TnYeeJTg=; b=AVusCzbBUFg1uX
	dl2TkvOK29I4bBFmeLKAYCz0j122o6oT44tgKuwEoDkBfKRoJCKkdBfzKisuiLKdH/LgcEtqF5rUf
	OOUvvSrc6pKwC5CKX6szJ/XDioH82mBsYFTimvJNNUlQGvQTYLPuzid74i+5POn0QmQAW1BxYL7Xs
	vEJG7x0b+7IZgeqYHOF9rsMaJFZioTCxWcsWAWQF9CD1AE45uvGNEtamflfhFsw5hjGLOIdfRQkjr
	OzLADfac//pul6m4W6VQ8jza1jrKUqOyWku+Fa/GxWnEz2pkwNKTYxw5QSkpLwxeVM6xklKj8XUiH
	jRtJ2Fq5bKSvuJGbPgKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCddk-0000000FLMF-3e3n;
	Wed, 07 May 2025 12:12:44 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCddh-0000000FLLq-33wY
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 12:12:43 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-47688ae873fso80829051cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 May 2025 05:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746619960; x=1747224760; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VPsoooWg4OqaRHlbly3mLyR5VjI9H02/rBL7wWZH720=;
        b=La8/KOG/CNdSZMys6Qf2ouw0q/V2IbTp1ot4CjyKukuVWD0OUCTBlcM2hh9LlPYIk5
         YG/OdcGm+IGVtYhR32ZnQ0KPRJOOv3aODM5s1f8a82/DLY+exwfM3uNxdmAwG9/7vEh+
         NEdzI4t50Xhsd2XalVB0LeRIKfcHeYIGMgCR6QWH82cW6yt4hTwS+V+fTlZMChm1yFxW
         WlvnwUSbO9Y4ooaj1KN1/oFXb7ZubkQeHZiYHO9D8Xb4rU8pixLBztjgI+Rb7zVtxn91
         0sBxTFE0rzuh5alHSrhQuAIfoq7MTp/fGSIlzTRaZjTJVUpV6IEmofm/NVbIo0MAkgUu
         4biQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746619960; x=1747224760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPsoooWg4OqaRHlbly3mLyR5VjI9H02/rBL7wWZH720=;
        b=T0AWTQcJGOHYka1aoBXZbdRTOs6fATpzs8uh2Mjw48Dyh07dVx1pLcwCYNvmPdKr1H
         sffzYa8tPiz29ehkxCuwOSqBHswA+uON0eywvu2pJ9Fl0njDLomqMWc38yuCIzyiqV1d
         3i/wO/l8rotKZKAn63WSqKPOMXh1MENltBicYnE5xqBRNhX9Fczc7qKGMK5Iwa+R3xcM
         iseqhbjduY7mKzHhKQJ4cvp9XGMbM5/Z/h0XFgyp/OMvVQvcaE3ekX1TpNySAaCSrGGm
         nsAAUWvDgMZD/gb2h5VrRnxdg7qxrAIiDbMrbQph+3mkWlaG/5oJnqhR6tNJXcxLaKek
         ning==
X-Forwarded-Encrypted: i=1; AJvYcCVk9oWWcWAEpc9PzZkuW/HzpepTIoiWY6Nykkf1iX+//KBzwA80XPjmycC3wFndNyiJYvo/eqOTFmFyPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHB+36QOBomNgOlQbAPZEZlftFe28D50471kfc52NznKHBlMB4
	YaGhbNPL3wd43ieU1w6Ja6f763XIEi0ADcXraA5Hk4XFTETkPRYj
X-Gm-Gg: ASbGncvGWgPdGouwDoeUOIvGrCJ8LU2mYdpXNs/dJW2Bmj3ui7icrS604x9+nGttfPT
	UqQNmweJGy/BZZ65QGOLjJO1wXU/nN3lZ3+NRyqytjn6u/WoOBfADIghdkVnlc6VosNHe9j+8Dt
	nfNwOcOIrv2c0b8Hcwfywakz5mDaBx3xuosrYt898ESjd4RH+FzLEyYadI/3SHNVPR+7Yvo5ZGz
	0DKfr5WAIcaEhe4uJEs7GN7mwmMIgLevJRGPr3Bl5MDz4phGzrnPRHZTaep3dpmea/HEwsddNVr
	Ok9pOl+k+EVUNtk0k4FVPUGz4UU=
X-Google-Smtp-Source: AGHT+IF+xAR2WQjzDO+vIUWI8jjxec8uqpCsBLzZkg9sR/PWtFFsNdHWPV68BfWwfEFlP9RAJp6xDQ==
X-Received: by 2002:a05:622a:5c0b:b0:476:7e6b:d297 with SMTP id d75a77b69052e-4922795dce9mr48650121cf.41.1746619960390;
        Wed, 07 May 2025 05:12:40 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-49222d9eaa5sm13514401cf.49.2025.05.07.05.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:12:39 -0700 (PDT)
Date: Wed, 7 May 2025 20:12:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, Conor Dooley <conor@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Yuntao Dai <d1581209858@live.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/3] riscv: dts: add mailbox for Sophgo CV18XX series
 SoC
Message-ID: <myug24f2rnscxracipkv2ghsjlv32qcyui6u4ckpwtaij6bw3x@yesvbm6vh5ls>
References: <20250428-water-sermon-eefdfa511f8d@spud>
 <183aa9ef25290278.6bcb31a17e34dfae.e6a8b825df767676@Jude-Air.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <183aa9ef25290278.6bcb31a17e34dfae.e6a8b825df767676@Jude-Air.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_051241_769398_5DBEC2CD 
X-CRM114-Status: GOOD (  27.33  )
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

On Tue, Apr 29, 2025 at 02:44:10AM +0000, Junhui Liu wrote:
> Hi Conor,
> Thanks for you review.
> 
> The previous email accidentally lost some Cc lists :(, I'm sorry to
> harass you.
> 
> On 28/04/2025 17:55, Conor Dooley wrote:
> > On Mon, Apr 28, 2025 at 08:39:45PM +0800, Junhui Liu wrote:
> >> From: Yuntao Dai <d1581209858@live.com>
> >> 
> >> Add mailbox node for Sophgo CV18XX series SoC.
> >> 
> >> Signed-off-by: Yuntao Dai <d1581209858@live.com>
> >> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> >> ---
> >>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >> 
> >> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> >> index c18822ec849f353bc296965d2d600a3df314cff6..f7277288f03c024039054bdc4176fc95c2c8be52 100644
> >> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> >> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> >> @@ -55,6 +55,13 @@ soc {
> >>  		dma-noncoherent;
> >>  		ranges;
> >>  
> >> +		mailbox: mailbox@1900000 {
> >> +			compatible = "sophgo,cv1800b-mailbox";
> >> +			reg = <0x01900000 0x1000>;
> >> +			interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
> >> +			#mbox-cells = <2>;
> >> +		};
> > 
> > No user added here, is there another series in the works that adds a
> > user of the mailbox?
> > 
> 
> There isn't an actual user node in this specific patch. I used a
> `mailbox-test` node to verify the functionality in this patch series.
> 

I am happy to see the way you test it. Can you add it to the cover?

> The intended user for this mailbox is the `remoteproc` node. I plan to
> submit the `remoteproc` driver patches once the corresponding reset
> driver [1] is ready and merged.
> 
> link: https://lore.kernel.org/linux-riscv/20250209122936.2338821-1-inochiama@gmail.com/ [1]
> 

I will submit a version for this in the next rc1. I think you can submit
you remoteproc patch in RFC to get it reviewed.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
