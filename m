Return-Path: <SRS0=Yzoz=SF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27659C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 00:32:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E883C2146E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 00:32:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eKFCgE4H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lkcl.net header.i=@lkcl.net header.b="NdlgovGC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E883C2146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lkcl.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f70yNdPQpLbWDsgA9ilRhwjoPGNqfY4P7iEqKKmpiUg=; b=eKFCgE4HRN/d3T
	K3GrrI6fcAhmAbcaTFeF4cAJpbd7XAiHmicR+OOiPADPd44UrrYjzUrFl2aO4WbZEhmzakTXPjz6Q
	cnTnbnjpPqIHM6QLrYl0b+qLzFZXY2Su641eWjtn8PtitdR3Sr35AZJQfGDE7FiFkSAEOeQ2UI8rZ
	uvMEEkyBvoVhQQqngFBM7WxNbIC1JMsJnEKtEZ3gar4heo3f/PtgTHBFv8Kcw4vNPOX/6v7BtarOy
	x88QsoISyTu2el2AFGbgM3CSeSMqjP2QF9hi7Y2U2NYGxH0AqwQ19XZfOyXW1vRCdLUSpAemY00UG
	JfdrfhQwfba9pvwXTM2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBTox-0003Vc-LT; Wed, 03 Apr 2019 00:32:03 +0000
Received: from lkcl.net ([217.147.94.29])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBTou-0003V7-OX
 for linux-riscv@lists.infradead.org; Wed, 03 Apr 2019 00:32:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; 
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
 bh=bZZBSw5YMxqd6SivUtQ9zXgXfDIFSb2fL/KshSJ8iO0=; 
 b=NdlgovGCgYKnBKKw4mxxC+Sp8zZv9WYg2OoqD2MMZKw39vuvwNl2XDsp4Pw3O23CJe9pDWpCj8qZMV/cfKYGeg5bvD02pUms5HnZhrEGmO1N17ViQlWRd1YLdAhgCrYH6xdBkpGjbpsJOi6m2kHHBhpDkfU1KV3de7E+wkIfhJs=;
Received: from mail-lj1-f170.google.com ([209.85.208.170])
 by lkcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lkcl@lkcl.net>) id 1hBToq-0005aW-Na
 for linux-riscv@lists.infradead.org; Wed, 03 Apr 2019 00:31:56 +0000
Received: by mail-lj1-f170.google.com with SMTP id k8so4842259lja.8
 for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2019 17:31:41 -0700 (PDT)
X-Gm-Message-State: APjAAAVFRDTVd2Es6Ndblcrkwr58C7H4vPWlYoc6zwXsIvK+F0XfGBbO
 VcQV8SVRg755oQXbTmEkYdH+0TLHMTupRgZYpxY=
X-Google-Smtp-Source: APXvYqxlJcJi9wUwU+saEuffijJZneVkn5QDiumZJRvGN4E2a5eVWiIp9cshFc35f4lO4bxDg3tTV2UpXpm4HEshCX4=
X-Received: by 2002:a2e:9a91:: with SMTP id p17mr37917618lji.127.1554251495737; 
 Tue, 02 Apr 2019 17:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-99966160-5466-4cfc-b3d8-48ad48d3dc74@palmer-si-x1c4>
 <CABwTF4UW8YePYr9Ad65VSvef4-Y42VEvNUs=hPWyWcyH295zCw@mail.gmail.com>
In-Reply-To: <CABwTF4UW8YePYr9Ad65VSvef4-Y42VEvNUs=hPWyWcyH295zCw@mail.gmail.com>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Wed, 3 Apr 2019 00:31:23 +0000
X-Gmail-Original-Message-ID: <CAPweEDyjP7iyoyuHVOUPpJSgQzUZkx5Zc+yC2kFKjuxYELEXSQ@mail.gmail.com>
Message-ID: <CAPweEDyjP7iyoyuHVOUPpJSgQzUZkx5Zc+yC2kFKjuxYELEXSQ@mail.gmail.com>
Subject: Re: [hw-dev] Re: [isa-dev] UNIX-Class Platform Specification Working
 Group
To: Gurjeet Singh <gurjeet@singh.im>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_173201_075307_E77F443D 
X-CRM114-Status: GOOD (  12.32  )
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
Cc: RISC-V ISA Dev <isa-dev@groups.riscv.org>,
 Palmer Dabbelt <palmer@sifive.com>, Atish Patra <Atish.Patra@wdc.com>,
 RISCV Software Developers <sw-dev@groups.riscv.org>,
 RISC-V HW Dev <hw-dev@groups.riscv.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 3, 2019 at 12:42 AM Gurjeet Singh <gurjeet@singh.im> wrote:
>
> Not that I'm interested in participating, but just curious
> as to how these officially approved groups work.
> Is there a mailing list for this group?

 that's the question that i asked.  i had to ask it in the way that i
did, using the words that i did, due to issues related to Trademark
Law.

> Is it open to public?

 it has not been made clear, hence my question.

(as an aside: none of the "official" RISC-V Working Group mmailing
lists are open access.)

>  How does one request to participate in these lists?

 again: it wasn't made clear.  if however it has been expected that
the lists be "RISC-V Working Group Mailing lists", then  it is
mandatory to sign the "RISC-V Membership Agreement", which prevents
and prohibits all and any public discussion or release of information
outside of the group without the expressed and explicit consent and
approval of the RISC-V Foundation (Section 5).

 this being what our team absolutely cannot do [enter into secret
agreements that interfere with the BUSINESS objectives], hence why i
requested clarification.


>  How does one follow along in these conversations, that is, where are the mailing list archives for this group?

 again it was not stated (apologies, to palmer), so we do not know.

> The list [1] seems to be for this purpose, but it is not hosted @groups.riscv.org so I'm not so sure.
> [1]: linux-riscv@lists.infradead.org

  exactly: it's not clear.  so, it needs to be made clear exactly what
the Standards Development Process is to be, where discussion is to
take place, and whether there are any terms or conditions required for
participation.

 at that point, once it has been made clear, people will know what
they are getting into.

l.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
