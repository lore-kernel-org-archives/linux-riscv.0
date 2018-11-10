Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29343C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 19:34:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECCC1208E3
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 19:34:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pfxiYQW+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NDhaOFv/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lkcl.net header.i=@lkcl.net header.b="SMIw+2tG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECCC1208E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lkcl.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVKNguw2d4GgvUAE1sIloB4AJtioZS++0LkaUOhffd8=; b=pfxiYQW+jIc99+
	8t1Vnk+imcIOzjs7me2n3p9uDpcXRUze87c5uQpbTgTBHNPWAbuU65f6UxXEBBBcSp0576BZvmWWo
	bjkGDGMGR8DgZoX7O1KT5MKRvvmqYIL7fBuvZenWLZOR/rCBianouVNk2bjgvgUYTRtZtxTHC3DrA
	svCBYeRMze9LM+XnaShLI41lpcOuZ6u2Y6LlC/34bxbSBoCifzMXIDnXaRQuujy7GEuyqfr0FKsqb
	AekVr/CF2/KZ7zLY8J1o+rXsZnBdPjpht6ot0ITDiV/3Z1HYpWZr2gPzoyzQ0w6q/z41xO8NMwzaD
	drD2yA0ZCM/CDnUMnr4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLZ1P-0007fv-JA; Sat, 10 Nov 2018 19:34:19 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLZ1O-0007fb-AC
 for linux-riscv@bombadil.infradead.org; Sat, 10 Nov 2018 19:34:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eEl4TATWuomhyxSDEnMHP7FODh9/HDbwnWChA9jT2Z8=; b=NDhaOFv/rumvwgSNrQMnD8aB6
 s1IGRsxJSMeV16CxN7aTiPUKMu/IHlFNcUGG/xwDfQ9MzkNVY02w6cshtcZcf2U9D92h60/Z8sf8M
 QWB91hkwCOG3J+uLCHiy9u1pYfwQ20EGms2uFEf1s5TSpi9eZ5ofVTjlzu4JW8DAAlCpiK8KCmSdP
 dPyEKp933mSo+T5/9cKiCpruNwP2/0NUAat9OtRS165vgObebOP+OXrb3B5aXLezTDkDD/T5wVf2Z
 XuKw3VC+9rivG9NUekvf8lUQ+vH76C+6JkZBrcFoj/AoGOsnM8XxKkcA/FbnApTJG+9+yCkUEN8fG
 mR5/BfwPw==;
Received: from lkcl.net ([217.147.94.29])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLZ1L-0007ZH-Jx
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 19:34:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; 
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
 bh=eEl4TATWuomhyxSDEnMHP7FODh9/HDbwnWChA9jT2Z8=; 
 b=SMIw+2tGxV+aandcxrCNoLKxKiiVaIBJ/W+sKG4nG5CyvVnJpO8izD6iLkARQDBo4wDdYafbTUsAzgxRZDdYKRPr/sErrbAgLCnh+hOYoPDX7Vj1Xg45sBlZaomah209iqd+1HOHYLa3sCDsQea9ONXBTc6agwDLBfsndqqXtGw=;
Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by lkcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lkcl@lkcl.net>) id 1gLZ15-0008Ko-Ha
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 19:33:59 +0000
Received: by mail-lf1-f44.google.com with SMTP id v5so3606109lfe.7
 for <linux-riscv@lists.infradead.org>; Sat, 10 Nov 2018 11:33:38 -0800 (PST)
X-Gm-Message-State: AGRZ1gJMCeLyEtEj8AP5rD6ZgDHMA3PTDFRtuUbDNnBDam7CQcPc4ofs
 vJCarh+308/GPfXqrdFVePOGrsoWxZ/7V+sraqc=
X-Google-Smtp-Source: AJdET5fXvZZ4OP8irzcZ7G3Tqd/wbogqswyJcdEohoaR5G+AeYKcuNW91+veL4b84uWlmDq4eTU1VEFdfz6o7XQZwis=
X-Received: by 2002:a19:7d42:: with SMTP id y63mr7779129lfc.47.1541878413026; 
 Sat, 10 Nov 2018 11:33:33 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
 <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
 <84838217ee26d70634368ef63d43427d@mailhost.ics.forth.gr>
 <CAP6exYLbZ5yBKJduU468MwXSqA+Nm6dYKj9ig=yM9e0d64nK0g@mail.gmail.com>
In-Reply-To: <CAP6exYLbZ5yBKJduU468MwXSqA+Nm6dYKj9ig=yM9e0d64nK0g@mail.gmail.com>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Sat, 10 Nov 2018 19:33:21 +0000
X-Gmail-Original-Message-ID: <CAPweEDy0804DsQeXt0qHBvwxGQ=gbfb+x+Hz7duXQ+_uA=u=5w@mail.gmail.com>
Message-ID:
 <CAPweEDy0804DsQeXt0qHBvwxGQ=gbfb+x+Hz7duXQ+_uA=u=5w@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: ron minnich <rminnich@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_143415_773144_18AE94B4 
X-CRM114-Status: UNSURE (   8.15  )
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
Cc: mark.rutland@arm.com, hch@infradead.org, Damien.LeMoal@wdc.com,
 Olof Johansson <olof.johansson@gmail.com>, alankao@andestech.com,
 abner.chang@hpe.com, atish.patra@wdc.com, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 zong@andestech.com, Olof Johansson <olof@lixom.net>, sw-dev@groups.riscv.org,
 paul.walmsley@sifive.com, mick@ics.forth.gr, Alistair.Francis@wdc.com,
 linux-riscv@lists.infradead.org, Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110193321.x6wv4DKX3MnuBWS9QZJMIa0oRnD3u7fzKx17-VOBOzQ@z>

On Sat, Nov 10, 2018 at 6:02 PM ron minnich <rminnich@gmail.com> wrote:

> Actually, as long as the option remains to let the kernel replace the
> SBI with something else, I'm not that worried about what vendors put
> in it. But that option needs to remain there.

 i remember you saying, when the boot discussion came up a couple
weeks ago, and agree absolutely: the option in real hardware to shut
off and replace whatever's got you up and running is critical.

 there's a huge range of uses to which SBI is (and can be) put: i
threw some ideas out there, i feel it's important to bear that in
mind.  it's not just used for booting, it's also got simulation,
debugging, development and critical first silicon bring-up potential,
out-of-band remote power management potential uses, virtual management
potential, and shed-loads more.

l.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
