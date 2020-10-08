Return-Path: <SRS0=qek1=DP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970C0C433E7
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2020 16:11:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3E69221F1
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2020 16:11:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ihm+97t2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJkgtsft"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3E69221F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ejjWbQ/QlT5zeSvgVPgFJSJq+k6lUO9CWH72V1eE2Sg=; b=Ihm+97t2v15sryXY1kBokvZim
	GokxpBnEejibiP3guf0pyBmP/SDMI5mT67rZrYujRtCVwdgCusmCVYPpoAjpDBxKfqwif+uVMMqou
	PXujsOVXe8VosDHJrHNQNlV8uy1/VFOkEGEA3OT4NWJL7SStt9LatKssITKenh3g7tGZZSX0b8Cx+
	KBVBuX2gkitH33MNrSEpu2KPXRaWf/2mZaSQHyO5FdPTyq36vlz80Ce7WYMB8c+H4XG/sq4DVzq+O
	PSgAxd7J5Av4RpN2tFZieEGenV++NBHcyhn5veMMNGRLSwVylY9FcQnNJBBu5Z3VskVSQjKGkm/G9
	2qwiJfj7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQYVX-0008L1-Sd; Thu, 08 Oct 2020 16:11:07 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQYQC-0004Nr-RA
 for linux-riscv@lists.infradead.org; Thu, 08 Oct 2020 16:05:38 +0000
Received: by mail-ed1-x543.google.com with SMTP id dn5so6374000edb.10
 for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2020 09:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=+IxddX4oBk5xd+J6oJQDzodRCbBwVMmnfDSkK4eauMY=;
 b=PJkgtsftOWBXMcghiv2N5V7s2DI4hHtos1td/PMZB5oE8VKubxXLKA28eJcV9py7uN
 uMS4163wBmkcYYsUWWD+y6kjGXgPVun3sO17VnUKpKje2Qphzp78/oQe6NOgH0NYSJwx
 tAt4/i5oD+IEvEE29PDf1WBMxJhshOsn2Nt2Vkq8QgmRlwSUP3TwJSiOapMfhS2J2ACi
 k/qYpg0rOTn4ZAvh9d/66dMoQOElNdJWN0bNiWhJEi9eWmV2HKP09iYlRzBuUkMk9PSa
 MumZxYh69Brgba/XzTLHZWtlwpOzaaEgKszQa1ZqZopa7khuV8xRYvD+9wzppU8Afqmi
 4f2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=+IxddX4oBk5xd+J6oJQDzodRCbBwVMmnfDSkK4eauMY=;
 b=D7NsmzteHm4IdOZTRMEOlsgbcetowTlCnPc8LHIN3AxzFjD9zc+/Smr6gxwLSrc/KU
 8rji4ta/Nh4ryGDgpyUCynBT9R8idF97De94oJFsn1QjQKITvKpYW4Q3L6KEopbKih3P
 Nq9G4EohJBvAqqdNJaDUbGlmRHwiwTWTGlhsCOVJajn8/8kgSdW+baAI3Fzhqv3UfLEo
 39MsdELhY9XRwE0CNx2ycSq0fIO0ajxVh6Yu15NIZN/IUDdjUgGIEft4GmRsU0go6c4k
 iBcgROBboI4bkJIMHvCrEe5iAO/Gh3G+6RBzDk2H7ra01bi3m1tqRKqWNsJVP2yAzudp
 bsEw==
X-Gm-Message-State: AOAM530c+VFs4FS8AH5k1LLh2cIiPpmP9kSovSPO5PKWGB+5UTUUjRiL
 jVAvGMcmPN9nTn4nYruVGQZ5mFYJ2PM=
X-Google-Smtp-Source: ABdhPJwuTzS32L+O61zHpVqMV/uEtrOc60vbDockApCbavsHqfioCUhtSmoVPbaRjgAo16HxjFweRw==
X-Received: by 2002:a50:f613:: with SMTP id c19mr9803727edn.81.1602173132148; 
 Thu, 08 Oct 2020 09:05:32 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 j24sm3863617edq.29.2020.10.08.09.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 09:05:31 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1kQYQ6-0007Is-Hl; Thu, 08 Oct 2020 18:05:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Sagar Kadam <sagar.kadam@openfive.com>
Subject: Re: [PATCH 1/1] i2c: ocores: fix polling mode workaround on
 FU540-C000 SoC
References: <1602006796-273724-1-git-send-email-sagar.kadam@sifive.com>
 <1602006796-273724-2-git-send-email-sagar.kadam@sifive.com>
 <87imbm4639.fsf@dell.be.48ers.dk>
 <DM6PR13MB345137AD526D0AAA6CE0DBDF970B0@DM6PR13MB3451.namprd13.prod.outlook.com>
Date: Thu, 08 Oct 2020 18:05:30 +0200
In-Reply-To: <DM6PR13MB345137AD526D0AAA6CE0DBDF970B0@DM6PR13MB3451.namprd13.prod.outlook.com>
 (Sagar Kadam's message of "Thu, 8 Oct 2020 13:53:55 +0000")
Message-ID: <87eem84sad.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_120536_927424_AFE94D41 
X-CRM114-Status: GOOD (  11.92  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

>>>>> "Sagar" == Sagar Kadam <sagar.kadam@openfive.com> writes:

 > Hello Peter,
 >> Are both affected by this issue? if not, we will need to extend the code
 >> to handle them differently.
 >> 

 > No, this issue is present in FU540-C000 SoC i.e SoC- specific, and so I can check 
 > for the soc-compatible string as follows:

 > -       match = of_match_node(ocores_i2c_match, pdev->dev.of_node);
 > -       if (match && (long)match->data == TYPE_SIFIVE_REV0)
 > +       if (of_device_is_compatible(pdev->dev.of_node,
 > +                                       "sifive,fu540-c000-i2c"))

 > Please let me know if this is okay.

Yes, that sounds sensible. Thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
