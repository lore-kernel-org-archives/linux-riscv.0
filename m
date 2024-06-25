Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DA2C30653
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 10:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPB+7GrTn7+DX8crUD9n4Yk+2uhJyE6Ceo32K+E0P8g=; b=ADVfiH779FlATl
	ZbNtG5I4EKZ1Di9W18JsIbWcFj9JmkpEYik3SUjHidN6JMnayDf5la+zNpE9GzstwBUUj3bo1vBVm
	dgxxGTnFI2igXbotTvm8Pqn37l5d/BExMg/A7lxmKYNkiKj6w0MqA8e3CeCclD/oJEhdK6uQS2HNt
	9ukI5ag4tlxt8j0q3+K4CgxqOwsxGBPFcd3DAcbheYQM3LZoKIjvbcsPLZowBJVDrCG+yYCX13s0V
	RarrbS+h7GogbqPxRNQHMixmxr1z8cRkCjh+N6TzQ8uuCj8R9rwPOvm7FnmcstXMdGBMO7RAsScL4
	voOWQv1Bof8ahZuIKG1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM3HC-00000002Nnb-1spQ;
	Tue, 25 Jun 2024 10:19:53 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM3Gj-00000002NeO-2g1M
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 10:19:44 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2ec002caeb3so67957161fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 03:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1719310759; x=1719915559; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e4j7Av8Nq59GpAFUJYmcgApSr33u/5sSai5UJj1fYMw=;
        b=En0ivliRQYIseWoj+jRwciPxLR5O+mf518EHTNuLx+M6VBywpG89uX2XMRJoP2JbBk
         6hTDKouDriO/OqoM4KZZemLvx3TUVQVgl3TXHrFfJoDvqutH4N1j6wOwS64nLUODwftO
         0KmUu9enDujNBngwk511YotiOfP7X91dAsAv2ln5P4kl0OoQ+3dqrjTqgm2g83ENzVow
         AdsLQwF+wiBEwtqjry0ES/GpCJC2hg/VQXQgvsJ7PltZH76miidI2hrAKmCplW6qel1h
         3zU/sC6qqnMgTzz+ur1j+hABIk0cEoG5LFXzJdYzQ36AOOkMKYP6YDZ6txGKhDGNuTR7
         ASXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719310759; x=1719915559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4j7Av8Nq59GpAFUJYmcgApSr33u/5sSai5UJj1fYMw=;
        b=CXJ4/oUq4rkOdyy9rRayD7bGq5H8vqlInOEVh6eMOSwPciReIhnvYEyJUt7IwlHeM4
         QK+X81Qup63XR09TE9y3MOuL4kuRsXwbHTgI1UWeEmTxa1l/T/eG1upn8K8YDqmWyMzE
         fbx9OhSqLKfMcrJA/vKioRgsBeTZ6wxuZ13252idB/Yec5YtdWCRd+qHYlGdDQsmlTBJ
         FnHjGtpUe8KPTd2ICteBJhPcNvwHpA3W8AiX4Fef3mk2JkEPUwZmTz6bM02W87NhiSPO
         T6Af/IGsRpRcakyQiVQdV4k+/XhKuzjxpf4jbm5TUlAkAin1ctFNujq1VLPITQjl00qU
         WBNg==
X-Forwarded-Encrypted: i=1; AJvYcCXiY8CifyQhGeO/Fh3ME9gmzxSiWu/JPO3/1zcpDBMteFJ4peaTeBFwMxotzmfFykdk3Esrw/dhPkKWzjZSlNgSBdwZrBO687JqPO4io0Ep
X-Gm-Message-State: AOJu0YxKkkpw1xWhFDvBJM4N9f9q+6I6Xpc0Et961hHA+4V/QP4DomZG
	zI6PA2cdRtl4OOnrGFFVxYLVrZJKQQhl7gFn1fHwrtiAyrlav71mClzJk4JC1Us=
X-Google-Smtp-Source: AGHT+IHW4ivi9v86O85GxGwVRU8LzjOJfbe+LC73TyIg8LE7Mbff3CySVIzVfV1boeAtnfeBaCShnQ==
X-Received: by 2002:a2e:9495:0:b0:2ec:440c:4e1c with SMTP id 38308e7fff4ca-2ec57967bcemr43276741fa.11.1719310758595;
        Tue, 25 Jun 2024 03:19:18 -0700 (PDT)
Received: from localhost ([185.71.170.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817a9f11sm164326695e9.18.2024.06.25.03.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 03:19:18 -0700 (PDT)
Date: Tue, 25 Jun 2024 12:19:16 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <apatel@ventanamicro.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
Message-ID: <20240625-6fb62d7ea4b9f6106e27e149@orel>
References: <CAK9=C2XH7-RdVpojX8GNW-WFTyChW=sTOWs8_kHgsjiFYwzg+g@mail.gmail.com>
 <40a7d568-3855-48fb-a73c-339e1790f12f@ghiti.fr>
 <20240621-viewless-mural-f5992a247992@wendy>
 <edcd3957-0720-4ab4-bdda-58752304a53a@ghiti.fr>
 <20240621-9bf9365533a2f8f97cbf1f5e@orel>
 <20240621-glutton-platonic-2ec41021b81b@spud>
 <20240621-a56e848050ebbf1f7394e51f@orel>
 <20240621-surging-flounder-58a653747e1d@spud>
 <20240621-8422c24612ae40600f349f7c@orel>
 <20240622-stride-unworn-6e3270a326e5@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240622-stride-unworn-6e3270a326e5@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_031922_424402_43926B6B 
X-CRM114-Status: GOOD (  40.76  )
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

On Sat, Jun 22, 2024 at 01:01:30PM GMT, Conor Dooley wrote:
> On Fri, Jun 21, 2024 at 05:08:01PM +0200, Andrew Jones wrote:
> > On Fri, Jun 21, 2024 at 03:58:18PM GMT, Conor Dooley wrote:
> > > On Fri, Jun 21, 2024 at 04:52:09PM +0200, Andrew Jones wrote:
> > > > On Fri, Jun 21, 2024 at 03:04:47PM GMT, Conor Dooley wrote:
> > > > > On Fri, Jun 21, 2024 at 03:15:10PM +0200, Andrew Jones wrote:
> > > > > > On Fri, Jun 21, 2024 at 02:42:15PM GMT, Alexandre Ghiti wrote:
> > > 
> > > > > > I understand the concern; old SBI implementations will leave svadu in the
> > > > > > DT but not actually enable it. Then, since svade may not be in the DT if
> > > > > > the platform doesn't support it or it was left out on purpose, Linux will
> > > > > > only see svadu and get unexpected exceptions. This is something we could
> > > > > > force easily with QEMU and an SBI implementation which doesn't do anything
> > > > > > for svadu. I hope vendors of real platforms, which typically provide their
> > > > > > own firmware and DTs, would get this right, though, especially since Linux
> > > > > > should fail fast in their testing when they get it wrong.
> > > > > 
> > > > > I'll admit, I wasn't really thinking here about something like QEMU that
> > > > > puts extensions into the dtb before their exact meanings are decided
> > > > > upon. I almost only ever think about "real" systems, and in those cases
> > > > > I would expect that if you can update the representation of the hardware
> > > > > provided to (or by the firmware to Linux) with new properties, then updating
> > > > > the firmware itself should be possible.
> > > > > 
> > > > > Does QEMU have the this exact problem at the moment? I know it puts
> > > > > Svadu in the max cpu, but does it enable the behaviour by default, even
> > > > > without the SBI implementation asking for it?
> > > > 
> > > > Yes, because QEMU has done hardware A/D updating since it first started
> > > > supporting riscv, which means it did svadu when neither svadu nor svade
> > > > were in the DT. The "fix" for that was to ensure we have svadu and !svade
> > > > by default, which means we've perfectly realized Alexandre's concern...
> > > > We should be able to change the named cpu types that don't support svadu
> > > > to only have svade in their DTs, since that would actually be fixing those
> > > > cpu types, but we'll need to discuss how to proceed with the generic cpu
> > > > types like 'max'.
> > > 
> > > Correct me please, since I think I am misunderstanding: At the moment
> > > QEMU does A/D updating whether or not the SBI implantation asks for it,
> > > with the max CPU. The SBI implementation doesn't understand Svadu and
> > > won't strip it. The kernel will get a DT with Svadu in it, but Svadu will
> > > be enabled, so it is not a problem.
> > 
> > Oh, of course you're right! I managed to reverse things some odd number of
> > times (more than once!) in my head and ended up backwards...
> 
> I mean, I've been really confused about this whole thing the entire
> time, so ye..
> 
> Speaking of QEMU, what happens if I try to turn on svade and svadu in
> QEMU? It looks like there's some handling of it that does things
> conditionally based !svade && svade, but I couldn't tell if it would do
> what we are describing in this thread.

It'll use exception mode, but {m,h}envcfg.ADUE is still provided to allow
software to switch to hardware updating when FWFT exists. So I think we're
good to go.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
