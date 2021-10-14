Return-Path: <SRS0=/Gqo=PC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C738EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 14:23:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9482060EDF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 14:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9482060EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ip+L37YXtz8SBNZQh0P5RvJRjJdwNNMtVcf46yItbjY=; b=rc5K5JY6nCW43V
	PWN7s7N2VakscoHsn7FmEOkkYbp0zatqI7Izkpd2HWUIgUY1uCKAjtz8d91c81cs8yAvaYzsm2KGw
	7Lv53/fB/h5e/fskoMBZHtrwl210k7E/SsrneUTQGcMrNQNSpjnDQXcpscUP/MVF8v7yPXOrRW2Jr
	VKbRCsHqgJeXKvUWnuPOwx10LWGAkg3YrVyekQ6TbwzKk7w1kELTUIbUqeeZDBbF/+kf04YToOmgG
	+scIoFCgt7gf6D59c82orDVtO2H6+bpF3Geu1Qat6/g9kzv2i+alHTix1BybFwxECWFcDTbFzFmE4
	DUtN/abRy7sm4Z3DmjKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb1dM-003QG7-Lj; Thu, 14 Oct 2021 14:23:00 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb1dK-003QDy-L7
 for linux-riscv@lists.infradead.org; Thu, 14 Oct 2021 14:22:59 +0000
Received: by mail-lf1-x12b.google.com with SMTP id r19so26989666lfe.10
 for <linux-riscv@lists.infradead.org>; Thu, 14 Oct 2021 07:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudflare.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Okqf4cnxYE2FjVdlyGWzuWegB5o4GhJUuUv5TbPoZBA=;
 b=DGrABGEtP5hjLIs/K1pNqbk2y6fYRbTTyPPSrc7s4OG9i6hCAmcTe5jL1IVGbdybNm
 n0QifbSEMlrGOg4m4tPIegguFfiIUWJvHDSXCODQQ2YBybjOAwh0WVR136yqcH7zOo2W
 De5kAU5D+EBLEhVYxyJSKgs4GEFiD3QIS417M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Okqf4cnxYE2FjVdlyGWzuWegB5o4GhJUuUv5TbPoZBA=;
 b=ymXcnicGy2RDoT0YezRw6/6IciF4yFFJ9TRScBSQyUfNAjdQYvUhmIXFG07CRhIGmN
 ur6i0jJlVvFSJQO8Y/HYx1sIRV6UH2Y19+VX3zJd+Ymm2aXRsyz30v7BCb/iGd51OkQi
 3B61t5SSF/IVIHl3b9nRnTW0AZpb+opEYn1yRCsqITedSsk/P/7hDaIVUD8ykBinqwkv
 G1pYUkiMjoIfARniQncRIQDtwQ9HgHLiurMXqNQwOfKrlSzxcNsZNWFdpqk7nhkDHTf3
 yMrITqdKzdLH7L59eQpDrBtdRokbGvzLbfYD2VlwSDrqAsi+CS5tqrbCj4nP4xsONu5D
 LrjQ==
X-Gm-Message-State: AOAM530EslvdDIgrA/NehpQZ/f9Fv8IUzhrT7jvLuie0B9F2U/G+HXWR
 IlvLp43cB5fxgVenFSdN3YBr4Q8utpHmauhEsmNZ7A==
X-Google-Smtp-Source: ABdhPJwH/KSfANj7WAISJ4X/OGGDRL8CEswJt/vSOXqtZNnUmhmfUOPmS/catGq1ZLRDado7y9BjlPPYtSlde7lnKe4=
X-Received: by 2002:a05:6512:314b:: with SMTP id
 s11mr5650906lfi.206.1634221358158; 
 Thu, 14 Oct 2021 07:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211012135935.37054-1-lmb@cloudflare.com>
 <87wnmgg0mf.fsf@cloudflare.com>
In-Reply-To: <87wnmgg0mf.fsf@cloudflare.com>
From: Lorenz Bauer <lmb@cloudflare.com>
Date: Thu, 14 Oct 2021 15:22:26 +0100
Message-ID: <CACAyw99FGc_z2zXjrjP=0k3jz0vz2u6ddiGVbzD0zuTcTU4rzg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Fix up bpf_jit_limit some more
To: Jakub Sitnicki <jakub@cloudflare.com>
Cc: Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 Luke Nelson <luke.r.nels@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 kernel-team <kernel-team@cloudflare.com>, linux-riscv@lists.infradead.org, 
 Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_072258_739741_E88C0019 
X-CRM114-Status: GOOD (  19.06  )
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

On Wed, 13 Oct 2021 at 20:56, Jakub Sitnicki <jakub@cloudflare.com> wrote:
>
> On Tue, Oct 12, 2021 at 03:59 PM CEST, Lorenz Bauer wrote:
> > Some more cleanups around bpf_jit_limit to make it readable via sysctl.
> >
> > Jakub raised the point that a sysctl toggle is UAPI and therefore
> > can't be easily changed later on. I tried to find another place to stick
> > the info, but couldn't find a good one. All the current BPF knobs are in
> > sysctl.
> >
> > There are examples of read only sysctls:
> > $ sudo find /proc/sys -perm 0444 | wc -l
> > 90
> >
> > There are no examples of sysctls with mode 0400 however:
> > $ sudo find /proc/sys -perm 0400 | wc -l
> > 0
> >
> > Thoughts?
>
> I threw this idea out there during LPC already, that it would be cool to
> use BPF iterators for that. Pinned/preloaded iterators were made for
> dumping kernel data on demand after all.
>
> What is missing is a BPF iterator type that would run the program just
> once (there is just one thing to print), and a BPF helper to lookup
> symbol's address.
>
> I thought this would require a bit of work, but actually getting a PoC
> (see below) to work was rather pleasntly straightforward.
>
> Perhaps a bit of a hack but I'd consider it as an alternative.

I spoke to Jakub, I won't have time to work on this myself. So I'll
drop this patch from the series and send a v3 with just the fixes to
bpf_jit_limit.

-- 
Lorenz Bauer  |  Systems Engineer
6th Floor, County Hall/The Riverside Building, SE1 7PB, UK

www.cloudflare.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
