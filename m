Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1257CC05027
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 09:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QhE4G2YFQSK3rtcTlKdskp10UhC1cZwuRKDfszFqKHE=; b=vvxJ2ShmszfcyC
	jdTqSvI/y4aRRo+J0/0U4nu5uNqKJYGt04lq1+c7nisd8IxMAbv9cwrzHmLlH9valRqKew8KKvJNr
	sbZgv0dpmIe3Nw/jXsHGOCVlhJ+MZ5DuVLfdbuVxjHqFTyGxZDZVxy1ioYCxpUU0KQblwtlsRIhB8
	+HPgZoJvwbumSvjkQnSrnR+ZRPyUEjWjA9gYW+NmY2a4Mjvt+c/QqA3VX8BGsYIuX79o4H+5EG9qO
	nAvzgtTSjPA3FbFgKz+6miZY7H0iPRfuk3epFSCF9wUZ4DMRV5AwkyYN1dcpAc9cw83vLLMjWDDsd
	Df+bQb7U2KoMysXEFYqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ3Ep-000p1u-8S; Thu, 09 Feb 2023 09:29:07 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ3El-000ozK-9L
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 09:29:05 +0000
Received: by mail-ed1-x529.google.com with SMTP id l14so1591369eds.4
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 01:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iLTALZ1oNGZ62291k/DnFlVymjqqmbMKSdTxFP2GIBk=;
        b=lMuelBIsYDCyQ/RL1kGwChDTydCg2S1df4RiDZ/Eh6gJOrrz75QTjiW868FcbCsEz3
         9rCt/ROlOZmdwkwlEMj8l97RJwP+NE60y/oiUO2bAwgyeJjHi+6i//EHNpYrczriqydX
         RrRi4BzGU8MHBDVnD2b+GUe79XZNYn7sPGgD9cvL3Qg9Cwb9UoPPCkOwqtMDttQsp+nJ
         g1Q9acBy1+f1s75ZLjRuVn+V86BAiyM5t4jyggcw0OhHlI6gyOar0xUT2wwB+BXIiFB1
         o71Vm76cGHEHvlWbFBXzvptNMaEpGv0kG81Tl9KjqbZmVZUCPpcE/Wh07To6/oMoJK0b
         nVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLTALZ1oNGZ62291k/DnFlVymjqqmbMKSdTxFP2GIBk=;
        b=NZythx7rvYercy18n0F2sE+muhlHtqjvqwDcTU2/DX78pITphR9xt/ztAGNbQbYFVP
         1gxJqQeJobp6tHZ5MK5PDtlDPYEYAdeQbkooEQeJlcvKjtEH7a3RUEhD3CxXqGV2Qw/C
         hVR8sareWIIAyKTqoajPVOAF63BTto7PgmcKBqyvV2B2EmPLDY71DJ5BKxSIcHvP6DBi
         oqSlZV7mdYZEqfEdXKkEGXTTe4S2R+yZpc3SAltq5UNyNBic2d+qgSG3ZlzsTjgYR5p7
         OmgiMVkrmY+prbkttkdWxCiO5dRSLpJartKkz7zDQE0g2ptNXnfGzHTT2Bf6Ywx9SyzY
         LbLg==
X-Gm-Message-State: AO0yUKUvNLuFn82tEaaHs5nbKWeKS9LnNQvOU59CYwY8ImxcL46y485G
	GqQsa/UJCSFBZOQLCNMngQSpzhAaS7w69V5C
X-Google-Smtp-Source: AK7set/96iErnptmg6+Is99No+/owz3vP8fKYml2hChGUoV9WKozzXvgBEwVPWl2hpJfJxEgqkLrqQ==
X-Received: by 2002:a50:9b13:0:b0:4aa:a856:e2d6 with SMTP id o19-20020a509b13000000b004aaa856e2d6mr10912473edi.37.1675934940541;
        Thu, 09 Feb 2023 01:29:00 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id d15-20020aa7ce0f000000b004aaa656887esm475865edv.96.2023.02.09.01.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 01:29:00 -0800 (PST)
Date: Thu, 9 Feb 2023 10:28:59 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	palmer@rivosinc.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 1/2] RISC-V: fix ordering of Zbb extension
Message-ID: <20230209092859.5bewurwjsllmynd2@orel>
References: <20230208225328.1636017-1-heiko@sntech.de>
 <20230208225328.1636017-2-heiko@sntech.de>
 <C32D5495-F772-4887-9CAD-66206ECCFC3F@kernel.org>
 <20230209082520.solukez3jrshv3qo@orel>
 <Y+S29qPN6jmMwvi3@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+S29qPN6jmMwvi3@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_012903_365082_A05AD5B8 
X-CRM114-Status: GOOD (  18.53  )
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

On Thu, Feb 09, 2023 at 09:03:50AM +0000, Conor Dooley wrote:
> On Thu, Feb 09, 2023 at 09:25:20AM +0100, Andrew Jones wrote:
> > On Wed, Feb 08, 2023 at 11:20:10PM +0000, Conor Dooley wrote:
> > > Hey Heiko,
> > > 
> > > On 8 February 2023 22:53:27 GMT, Heiko Stuebner <heiko@sntech.de> wrote:
> > > >From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > >
> > > >As Andrew reported,
> > > >    Zb* comes after Zi* according 27.11 "Subset Naming Convention"
> > > >so fix the ordering accordingly.
> > > >
> > > >Reported-by: Andrew Jones <ajones@ventanamicro.com>
> > > >Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > 
> > > The whole "getting it wrong immediately after fixing it up" ;)
> > 
> > Hi Conor,
> > 
> > Do you know any patchwork savvy people that could whip up a check
> > for this array? :-)
> 
> Maybe that is more of a checkpatch type thing?

I think this is too specific for general checkpatch. I once proposed on
the KVM mailing list that checkpatch should gain support for plugins,
allowing specific directories to provide a .checkpatch script, or
whatever, where it puts its own checks. I never followed-up by actually
proposing that to checkpatch maintainers though.

> 
> Either way, I'll put it on the todo list I suppose!

In the absence of checkpatch plugins, I think subsystem-specific
patch management tools, like patchwork, are the next best place
to put specific checks. But, I agree it's a bit late. It'd be better
if the developers could run the checks themselves before posting.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
