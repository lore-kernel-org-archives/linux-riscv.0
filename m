Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A657C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 16:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zF/8cXgFlDRDPh3WUrmkNfJKDXrcUteG72mfNF6GT0s=; b=QAj8Op5VNXFoJu
	q/mzAQKEFEowHrT0NloZSVSkqeHubrDUvNC8WzyneJmFHERhtdj9FdbpAaw50ugmfA+nljq8MU1Yj
	W0k0uV4gcDrYxbBHK1SH5WvV5wAO5Bt9CC1UPK0WsNRHGf5bNh0x9UMwDv12AHyQz5WQN7wTP4pL+
	FbNdVsz6T9SQHt55CNy4VH9qaRsu9mfSIBjwq+TQxijmcQYCpkcoM7s5qDILmQY6z+Fdj+jO4r3V9
	6fqGBwYLGdF1vncssS+Nv5i7B4ZEarAEvsLp5AxnCwaUYpfnMNeFjyfwdchJ6tSVN6yM00BTPVa6u
	xEsiAwqak2Szo/UHQc3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXNRv-00000004MXa-32Md;
	Fri, 26 Jul 2024 16:05:43 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXNRc-00000004MTf-1cZZ
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 16:05:36 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-260f1664fdfso852195fac.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 09:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1722009922; x=1722614722; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PvbEqWL5j+GN3Ik5CL00onvHz+Bz9PXQQigu5LQIRIw=;
        b=W6KFbLO5bSWrQD1rF8oFidcPCbCU9aBlPTjK3Yuev8mQkJq3c0l7dyG1ezxvmDKtcO
         fYzammu/c7mGZGYtlbJgRZVdubdu2iIxZCFJkZvLwVClxxsqQqcx4dlhcKQ2y+rIFBdy
         uymXCPP+kCbMb3RdjF+FEviTXqX9480tqMrBsKmUAQ3BrV67uLhCHCDyXVMdJWbYvvKk
         rGlNU+qQbhm0plukHzDBuVyhHdqIq9BHDEPXv96qcbpvtwMBqNmMarIcLrrVyTYUNfxR
         dCoxiKLt54FizkaB83cEAW8TWqg3PN6kS8E/wiflBCsd7pVcOpSTT4fJyh+W+367PK3h
         1iVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722009922; x=1722614722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvbEqWL5j+GN3Ik5CL00onvHz+Bz9PXQQigu5LQIRIw=;
        b=WRed3vrJWk9gALfBz2LxpeFG4Yp/2VyTfDlfbFQ2ygX9pQ3l2Kwbmiw5tuj8rJKuvh
         srk5Ny/53JMQg8l+LQ3sX7r2n8hffOobACQvAq3Y4BmroJ9g9UHdHP1H1DXTWoPScifa
         NrIudTbaCMng2lZczlcCdja1u6HDm+9+tK3kgt21jz8Z2aEQ/+VeSh1IEx3v7I5wIjf9
         EQeiSARoqLrL4lo1xkYnwWLGTWQeKVHwM5s5QoskRXK8aTKz1Vgi1VmkbZ3vy3syYgog
         I8T3w/Hy6K3s/l8QjAWbo0OlQb2L6sUaVLLrGHJ2aVjxsdZ8DHtAZMrqP+qItFnG3Wtp
         XVIg==
X-Forwarded-Encrypted: i=1; AJvYcCUhqjrYDSwgvnUJo4BtF7gg+VyVwDRhQ82w/01jTGmPajaLqww5vRuUPD/POpsXGv0XDmrsv2CKTp8qs69j4CsKaaM/r6+Hd0FVVkbHpNLn
X-Gm-Message-State: AOJu0YzapdNxpQcy/5fqNl2l3GaiWsvmtVNdlmK2OZrxJ9se5JoOLK8t
	/ogfpEqCHtrO4E8G/Fa8mHXgsQcez0uMKxU9nV9bBMcTrXDD4qSFFbyXYrKqT/Q=
X-Google-Smtp-Source: AGHT+IFDWKbRtXGN12vbxH/YCBj69sr4LV9l4Sw5hPuRUYNe3O/XobimAvxVyMcYWga3N6RbHvbWGQ==
X-Received: by 2002:a05:6870:7a11:b0:25d:e3d:b441 with SMTP id 586e51a60fabf-267d4ef4551mr207175fac.40.1722009922555;
        Fri, 26 Jul 2024 09:05:22 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:dd1c:823c:f5e3:153f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead8215b3sm2865594b3a.121.2024.07.26.09.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 09:05:21 -0700 (PDT)
Date: Fri, 26 Jul 2024 09:05:19 -0700
From: Drew Fustini <drew@pdp7.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Kanak Shilledar <kanakshilledar@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/1] Add basic SPI support on TH1520
Message-ID: <ZqPJP+b7iqSajXI9@x1>
References: <20240705093503.215787-1-kanakshilledar@gmail.com>
 <ZqMdeTrV5GE0TVUV@x1>
 <CAJM55Z9WFZJ=vyosx8LSUxBXs-Uftr76yKuWqGi7D_L+v1cKRw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z9WFZJ=vyosx8LSUxBXs-Uftr76yKuWqGi7D_L+v1cKRw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_090524_699988_DB0D366A 
X-CRM114-Status: GOOD (  22.90  )
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

On Fri, Jul 26, 2024 at 04:19:51AM -0400, Emil Renner Berthing wrote:
> Drew Fustini wrote:
> > On Fri, Jul 05, 2024 at 03:04:58PM +0530, Kanak Shilledar wrote:
> > > Implemented basic SPI support for TH1520 SoC. There are two SPIs reserved
> > > on the LicheePi4A, one on the SPI Flash pads that are blanked out on the
> > > back, and one on the pins. I implemented the one connected to the pad.
> > >
> > > It is using a fixed clock of 396MHz. The address and clock frequency was
> > > referenced from the TH1520 System Reference Manual [1].
> > >
> > > [...]
> >
> > Applied to thead-dt-for-next, thanks!
> 
> Hi Drew,
> 
> Are you sure you want to merge this patch? It adds another dummy clock for the
> SPI, but the next kernel should have your clock driver that actually models the
> SPI clock.
> Also the clock driver says the SPI clock has a frequency of 792MHz, eg. double
> of what this dummy clock is set to.
> 
> /Emil

I am planning send updated dts patches for thead,th1520-clk-ap support
that addresses your recent comment [1]. I'll include a patch to convert
the SPI clock similar to the other dts patches in that series. Assuming
there are no issues with that new series, I will apply them to
thead-dt-for-next with enough testing time for them to be included in
the 6.12 pull request to Arnd.

Thanks,
Drew

[1] https://lore.kernel.org/linux-riscv/CAJM55Z8uo-Z_9ruyqygK1pbBCTkCxMBVoF8GD2dajhTKOYrAfA@mail.gmail.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
