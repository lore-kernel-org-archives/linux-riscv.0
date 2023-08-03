Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43537C0015E
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 06:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4aacWkRCnhTwbFjWAmPhIf4eLhgcxIdOrTf8AeXxB9U=; b=vtkyJAg7vMO10l
	xBJ2tj45usRQb/Ofse2b04LzPzCj9cMYZMaiRyh/KsVnWEa4AFm17eCL9LE/8dIbEKtsjpWhhJt4K
	EZT+mkHXr/M0nrWvxzlsdqTWbC6XsNqR8YSBEa+ibeHVJa0QcFIVTyTsifTs3wTBgmvpVOAJXCC50
	pKqwfZ/JtIM51qvPdinxdWuA6Ov2welsy/c+e/rkBdtiil5wa72GnAI/COp8dUAlc677HRWVoScXO
	99wS5DNNFqMcbE+Pk8H3SStdx3M0Zc+wKPtmkuU7txpKkqD+VA2418lUJwDn2jvODEgVVhIlJURc4
	yDqdCtRxhOhwij1P1M3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRS8T-006o4c-3C;
	Thu, 03 Aug 2023 06:48:37 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRS8Q-006o3X-13
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 06:48:35 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99c10ba30afso372116966b.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 23:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691045309; x=1691650109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GI2rCHeX5zc5MccUjngIC1r7zH2R/6JVHz0/D1EuPTE=;
        b=Pja0kEqdM+M84LNmDQbPg8AImAj81zLvqTljzkZz/eUQhzGbvqe/8lIxhXqbbbrg+y
         9CHc+9owF2p9LkeJumO+l0veD6xmMBCyNZLV3aj/nq4gGt/WLUL8F6kKzeX7GVEpEqyS
         EZ+BA8h/ie89u9CNUPc0KXOSEpcE2UgXWq2BW1rw5tEwA+S2hT8H1X0t/7RF+igWHD8X
         mV340XdaMmTw0Rs5D0dsOX6vGjzQuCOrIXsvXpAwCbV4SAozd4rv3bBz1wdxQEcefIYj
         E2oU2oeI0xK/H8PEVgo8zZQMiIuEu8uroPPpX7BOGA3RkyDngWkUDTAHfLycWsE85asP
         Xv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691045309; x=1691650109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GI2rCHeX5zc5MccUjngIC1r7zH2R/6JVHz0/D1EuPTE=;
        b=HlJOmdjbuhHL89e6knIr0YP6+AvRbR7EOvZdZr9CZXI+akclUY0VA9hdpRrnad5ULn
         dFqLnY2TxKGip7aO1DWry8suh55U+M6p+oJo8tUyL4lpaeh3YY3InzW/vfhi/wRI3Nlk
         p37zVChUU8xnPwdbsy5XVJPnBPHiNmtvuq6i19sploFnPoxTlOuLLvYSv24xhOkDgs9H
         aENLpE6hBKTdp0xxTnB38kzSMfsXY2aHnggm9Hc6J6hm4e+76iwNcft7o9mt+9HjV8XH
         jJh/a1wsgKuXkhui+g9zxs8ZZiN/BbT1+sK0Pu4ex/IusKBVa0y1UGj4vqkUYa7dZKgz
         IYqA==
X-Gm-Message-State: ABy/qLZtzWZ4IZnlOWPYMt6U2/+5uFmWL5Tmitfr4VIrB8H+SH1pP77q
	JulNuT0Q/3K3vMIp9061fQwf3g==
X-Google-Smtp-Source: APBJJlHRlKvbEmliM9hDPe3LdbVkkNQK+oIPp67co4wiXnNRksFAjmxreLUgmUAl+4iXfehCsskV/A==
X-Received: by 2002:a17:906:76c4:b0:993:d632:2c3 with SMTP id q4-20020a17090676c400b00993d63202c3mr9583280ejn.21.1691045308824;
        Wed, 02 Aug 2023 23:48:28 -0700 (PDT)
Received: from localhost (212-5-140-29.ip.btc-net.bg. [212.5.140.29])
        by smtp.gmail.com with ESMTPSA id v23-20020a1709067d9700b00992eabc0ad8sm9934442ejo.42.2023.08.02.23.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 23:48:28 -0700 (PDT)
Date: Thu, 3 Aug 2023 09:48:26 +0300
From: Andrew Jones <ajones@ventanamicro.com>
To: Guo Ren <guoren@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, virtualization@lists.linux-foundation.org, 
	'Paul Walmsley ' <paul.walmsley@sifive.com>, 'Albert Ou ' <aou@eecs.berkeley.edu>, 
	'Palmer Dabbelt ' <palmer@dabbelt.com>, 'Paolo Bonzini ' <pbonzini@redhat.com>, 
	'Juergen Gross ' <jgross@suse.com>, "'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>, 
	'Anup Patel ' <anup@brainfault.org>, 'Atish Patra ' <atishp@atishpatra.org>
Subject: Re: [RFC PATCH 02/14] RISC-V: Add SBI STA extension definitions
Message-ID: <20230803-12cf578826747ddb63046bff@orel>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
 <20230417103402.798596-3-ajones@ventanamicro.com>
 <20230418-elliptic-headboard-6a18fcccdf07@spud>
 <bl7i54kgkzvxzhritql4vtzpymepx7hmtio7pjnbmipv3dxwgi@dtmqpnkdlwl5>
 <ZMsCl9LaMvx38zMY@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZMsCl9LaMvx38zMY@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_234834_367509_876B2A5D 
X-CRM114-Status: GOOD (  26.21  )
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

On Wed, Aug 02, 2023 at 09:27:51PM -0400, Guo Ren wrote:
> On Wed, Apr 19, 2023 at 10:15:54AM +0200, Andrew Jones wrote:
> > On Tue, Apr 18, 2023 at 07:43:51PM +0100, Conor Dooley wrote:
> > > On Mon, Apr 17, 2023 at 12:33:50PM +0200, Andrew Jones wrote:
> > > > The SBI STA extension enables steal-time accounting. Add the
> > > > definitions it specifies.
> > > > 
> > > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > > ---
> > > >  arch/riscv/include/asm/sbi.h | 15 +++++++++++++++
> > > >  1 file changed, 15 insertions(+)
> > > > 
> > > > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > > > index 945b7be249c1..485b9ec20399 100644
> > > > --- a/arch/riscv/include/asm/sbi.h
> > > > +++ b/arch/riscv/include/asm/sbi.h
> > > > @@ -30,6 +30,7 @@ enum sbi_ext_id {
> > > >  	SBI_EXT_HSM = 0x48534D,
> > > >  	SBI_EXT_SRST = 0x53525354,
> > > >  	SBI_EXT_PMU = 0x504D55,
> > > > +	SBI_EXT_STA = 0x535441,
> > > 
> > > What is the sort order of this? Matching the spec ordering, or just
> > > append-at-the-end?
> > 
> > I don't believe there's an established order. I've been going for spec
> > order, I think.
> > 
> > > 
> > > Unrelated, but in checking that I saw that your SUSP stuff is in
> > > master - you planning on resending that series?
> > 
> > I think I need to wait until it's been ratified.
> Did you discuss the SBI_EXT_STA number of the SBI spec? Could you share
> the link to me? Thx.
>

The number is just "STA" in hex, as all SBI extensions are numbered. All
discussion of the spec was on the tech-prs mailing list[1]. Searching for
"steal" in the archives appears to pull up relevant threads.

[1] https://lists.riscv.org/g/tech-prs/messages

Thanks,
drew



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
