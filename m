Return-Path: <SRS0=Yzoz=SF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 896C4C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 03:35:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5787120830
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 03:35:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lqGuTGGk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lkcl.net header.i=@lkcl.net header.b="nPrDfNln"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5787120830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lkcl.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XGYXkZvTRoCDVvb+XD8Qe1sHlDAHBG/FayQspPKo7zo=; b=lqGuTGGklSWEeM
	jVuWqY/qeM0J8R5dcaYC+JaROu3CDgsW6lJV7FII0b0hsDkcncMSShVHSQdqxrYdqEmUx564CW8Jq
	k9WpcGvtjGF+w4sH2GxDBj2Uw754ETY7S88cgdpNHXw4Ki/ognYtV2tDqcktHYtcsCJreRPbWTIn0
	OvsgY10q0ElgoHpfp8afxOdXQI3IN9TwugBM0GOkhFQUyq/j8pSQe+R++6tFoE8o6Ukx8+kka9FrI
	svuMdK93Im8o6Xbsaw7NqPrmbCLC83dhRC54uTYY9i5QTTqR467f/gbWYZ2EoBPT4MERwm1/iDUKz
	806lubJXGyUc8enKwJVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBWgR-0000G2-J3; Wed, 03 Apr 2019 03:35:27 +0000
Received: from lkcl.net ([217.147.94.29])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBWgP-0000FX-EO
 for linux-riscv@lists.infradead.org; Wed, 03 Apr 2019 03:35:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; 
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
 bh=IK6eI3x44bv7O+cKjGUu523iUWZ8u4vcO1DoMVtXrIc=; 
 b=nPrDfNlng8/jKDgf4/G9UAwAM7fQqGMjvdkH+CsUL6JLKt82EqUXXtz4BQ0AbHCKtDa0KUr0lv18xRECKh4CCPMR9iKUuaAUMfmVnOvxCsQTm+lx5t73EQLYW70UA4448Dh5C0SaKniPueH/St/i69mT5pE+MpH+6qB3aIo3CPc=;
Received: from mail-lj1-f171.google.com ([209.85.208.171])
 by lkcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lkcl@lkcl.net>) id 1hBWgM-0006g0-AE
 for linux-riscv@lists.infradead.org; Wed, 03 Apr 2019 03:35:22 +0000
Received: by mail-lj1-f171.google.com with SMTP id t4so13511569ljc.2
 for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2019 20:35:06 -0700 (PDT)
X-Gm-Message-State: APjAAAXXEnmDR1j1+PH62gFHx+32iLG6xJM3FPhpiHoMMenQenH3fSDT
 EFO+08oNtwq7UiLlthBDYrrxuMLgocNNBOCbTLA=
X-Google-Smtp-Source: APXvYqzkT8EQcgfpRp0KWuIF4vIiBSlLyANP65EPBEnCDZLsqcRdSy+CHkQNMO3u9JJQwtoTTaoDGObAjxJW2+RwLYw=
X-Received: by 2002:a2e:b01a:: with SMTP id y26mr22705363ljk.38.1554262501384; 
 Tue, 02 Apr 2019 20:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAPweEDyjP7iyoyuHVOUPpJSgQzUZkx5Zc+yC2kFKjuxYELEXSQ@mail.gmail.com>
 <mhng-a66e2566-0146-4da6-bb93-15d7feb0c1b5@palmer-si-x1c4>
In-Reply-To: <mhng-a66e2566-0146-4da6-bb93-15d7feb0c1b5@palmer-si-x1c4>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Wed, 3 Apr 2019 03:34:49 +0000
X-Gmail-Original-Message-ID: <CAPweEDy3dhEzrqtzubupSX=afaC_sAuQgo9BtQFbk9Bx4WfUmA@mail.gmail.com>
Message-ID: <CAPweEDy3dhEzrqtzubupSX=afaC_sAuQgo9BtQFbk9Bx4WfUmA@mail.gmail.com>
Subject: Re: [hw-dev] Re: [isa-dev] UNIX-Class Platform Specification Working
 Group
To: Palmer Dabbelt <palmer@sifive.com>, "Rick O'Connor" <rickoco@riscv.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_203525_633723_515FBA9C 
X-CRM114-Status: GOOD (  20.46  )
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
Cc: RISC-V ISA Dev <isa-dev@groups.riscv.org>, Gurjeet Singh <gurjeet@singh.im>,
 Atish Patra <Atish.Patra@wdc.com>, RISC-V SW Dev <sw-dev@groups.riscv.org>,
 RISC-V HW Dev <hw-dev@groups.riscv.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 3, 2019 at 3:43 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Tue, 02 Apr 2019 17:31:23 PDT (-0700), lkcl@lkcl.net wrote:
> > On Wed, Apr 3, 2019 at 12:42 AM Gurjeet Singh <gurjeet@singh.im> wrote:
> >>
> >> Not that I'm interested in participating, but just curious
> >> as to how these officially approved groups work.
> >> Is there a mailing list for this group?
> >
> >  that's the question that i asked.  i had to ask it in the way that i
> > did, using the words that i did, due to issues related to Trademark
> > Law.
> >
> >> Is it open to public?
> >
> >  it has not been made clear, hence my question.
> >
> > (as an aside: none of the "official" RISC-V Working Group mmailing
> > lists are open access.)
>
> It's a RISC-V working group and therefor follows the same policies as the rest
> of them.  IIRC we're in a bit of a transition from workspace to groups.io, but
> either way the list (and associated meetings) will only be available to RISC-V
> members.  There's a free membership for open source projects, as well as a
> cheap membership for individuals.

 monetarily zero cost... as long as they have no conflict of interest
that prevents and prohibits joining.  and we have a clear business
case (full transparency and independent third party audit
requirements).

 to be clear: it would actually be considered to be *fraud* to have
put in a Grant Application under false pretenses (namely: to state
that we intended to develop a commercial chip in a fully transparent
fashion, then immediately on doing so join a *CLOSED* secretive
group).

> >>  How does one request to participate in these lists?
> >
> >  again: it wasn't made clear.  if however it has been expected that
> > the lists be "RISC-V Working Group Mailing lists", then  it is
> > mandatory to sign the "RISC-V Membership Agreement", which prevents
> > and prohibits all and any public discussion or release of information
> > outside of the group without the expressed and explicit consent and
> > approval of the RISC-V Foundation (Section 5).
> >
> >  this being what our team absolutely cannot do [enter into secret
> > agreements that interfere with the BUSINESS objectives], hence why i
> > requested clarification.
>
> OK, well, I'm sorry you'll be unable to contribute.

 you may be misunderstanding: we have a clear business case for
involvement in the standards development process, and have been
consistently requesting access to resources such that we may
participate in innovation.

 we have yet to receive a response.

failure of the RISC-V Foundation to accept this and take it into
account is not an option for the RISC-V Foundation if the RISC-V
Foundation wishes to continue to enjoy the benefits afforded by
Trademark Law.

 so we are being excluded from the standards development process,
despite having a clear-cut business case for being included.  given
the failure of the RISC-V Foundation to take our business case into
consideration, we are not going to just "give up", and will proceed as
best we can under the circumstances with our business objectives.

 acting in good faith as we are, we will endeavour to ensure that our
business objectives are met with the minimum disruption to the wider
RISC-V community, however given that we are clearly being
discriminated against, we cannot and will not be held responsible for
any incompatibilities or non-interoperability: that is clearly down to
the failure of the RISC-V Foundation to take our business objectives
into consideration.

 if anyone has a problem with that, particularly that the libre/open
community depends critically on good-will, PLEASE SPEAK UP.  it is
very important that you do so, as it will strengthen the case that
substantial damages have arisen to our business objectives as  direct
consequence of continued and persistent silence and abdication of
responsibility regarding Trademark Law by the RISC-V Foundation.
(Executive Director once again cc'd so that there is no possibility
that the RISC-V Foundation may claim "It Did Not Know")

> e considered different
> contribution models as part of starting the group, but decided the standard
> RISC-V arrangement was the best fit for this group as well.

 this constitutes discrimination. Trademark Law is unfortunately quite
clear: discrimination in this fashion is not permitted.  any Tradmark
owner that engages in discriminatory practices irrevocably forfeits
the Trademark.

 it is also very clear that persistent failure by a Trademark holder
to respond to communications to resolve such matters also results in
permanent forfeiture, and a consequent loss of right of enforcement.

 we're *going* to go ahead, palmer.  we *will* meet the business
objective of creating an entirely and wholly libre-licensed RISC-V
hybrid GPU/CPU/VPU that is fully transparent in its development and
manufacture, right to the bedrock, with or without the RISC-V
Foundation's cooperation.

l.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
