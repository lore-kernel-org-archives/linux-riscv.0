Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E645C001DF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 03:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ifvFOBuU9bTjiQz8XYCux2KYSHWUQNjORG66XrqndZE=; b=ad3yi217rtGc/E
	Dn6xcgzvfUO77F7t7GqXz/R68gfssa0xw1T4CajKWjVYVWyCVzccGtLrO+8xabPM+u/3tnDRmo//F
	yx0JqGo/VRjt5GSsHKznNoWNrtD+++Nh67oogVYdPX+DVnecKVnalCp1nL3aZ6KRrhaQxlzi8u4FA
	ya7ugaZrC7iDC7Rd8wEn748rKLagVBBL5LonQkb4fKxegt5QI9IJv6cWqC8h7vM2FOcGab9GIK6yb
	DvnRIgYvTrk8uV2Eb0hC5MpZ5qsV5mL+YJcdl9+/KioB5m1I6GngnJ/+fjORsnNtAhdwymSiQ4JFG
	JHcRBmG4pUP9r3bJiWVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qROnd-006Wsr-0o;
	Thu, 03 Aug 2023 03:14:53 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qROnb-006WsG-0y
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 03:14:52 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99c0cb7285fso57778066b.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 20:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691032488; x=1691637288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tCmRhEn7acE0EeZXBjc4bZ+e4lkMA3dESMJ2NR80pQI=;
        b=ssFkzkPXHd8jVwKVBEtxh9iKaMto13MD/V5TbGWkQbBZ61LmdngEFvVkkTULDCXVQG
         hl/QcK4D/nJh/ZKUU6XZhZ/v1SQh4rkOYHxbilygY6jtpKnDwhCUZDGY0CvOT2ROV6yK
         Qb+0S3wDgmSwaLMNO7zJHW8w2554Hw36Ehsx44JTlAkr+RCF/hCMi9iCcFZ+8m9lBsU+
         dkop4vz/5G+SYrhkmxCiMIoLjHD7f9Npi1BUSVDVuAWGrKpZt3b4MvuJRXZe7rBq/mO1
         xETBK5iTh3v4wXwVP6vbkaFlOnOIq95ehrLXgLKJU9k52ehrAve3pu69HZXwEVA5sC9B
         5alg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691032488; x=1691637288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCmRhEn7acE0EeZXBjc4bZ+e4lkMA3dESMJ2NR80pQI=;
        b=Ql9ERdp0T3AqjLdBr4R1aJ3F+RM1ES3nadAF1B+5XM7ZlhCwt4YXHyQJ/EXcD4Z8pL
         9554t56TGx3SSWLb/wszzZ9TNAGttiPe09mrqrxPre5sqHqzjAyyHd11521lI2hFpoWh
         oMD771MfSz/Ao9WSDW/3Xhcwg+tvtQfzKRovDul4xM823PPfYxrDdlM7bdcHSjatRstV
         hA0g+q/DtpOkRSvDSu6OTzJwfZ9Vq/ziOIKonf6ACjHIHw6AslaoU4ZNmrxknmPxGsff
         1QHY/Bj0Jx1ZP2yW4h6bS/H8i6Ueg775cOBDOU/dje8u6PiRTywxoYwKcSppWYFUoVRb
         IaZA==
X-Gm-Message-State: ABy/qLaUtynm3oRnLhXRhb+y9C6Q9UC3CH7zFEuFZkyyM2unwu6mYtsr
	2yRc5RbEV9dyfBWddMoy9+4=
X-Google-Smtp-Source: APBJJlHsrCYZaYZH7ZJI99siUd6uXcZkUDZc007Y4cKhbUNk0R7LMiGKBUeM1+7N8o/DL6CetMql7A==
X-Received: by 2002:a17:906:8a75:b0:99b:4afc:7714 with SMTP id hy21-20020a1709068a7500b0099b4afc7714mr6165885ejc.44.1691032487767;
        Wed, 02 Aug 2023 20:14:47 -0700 (PDT)
Received: from andrea (host-82-57-177-142.retail.telecomitalia.it. [82.57.177.142])
        by smtp.gmail.com with ESMTPSA id dc26-20020a170906c7da00b00988e953a586sm9874967ejb.61.2023.08.02.20.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 20:14:47 -0700 (PDT)
Date: Thu, 3 Aug 2023 05:14:41 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras@redhat.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 0/2] Deduplicating RISCV cmpxchg.h macros
Message-ID: <ZMsboVmlrWhjfNJd@andrea>
References: <20230406082018.70367-1-leobras@redhat.com>
 <ZC7/LzV53KsZ/cSn@andrea>
 <2f301cd6c4009248c5eb6af00f12f36f3127ca10.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2f301cd6c4009248c5eb6af00f12f36f3127ca10.camel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_201451_341847_5F2ED6A1 
X-CRM114-Status: GOOD (  11.53  )
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

> > LGTM.  AFAICT, this would need to be rebased, cf. e.g.
> > 
> >   a8596dda1fbf7e ("arch: rename all internal names __xchg to __arch_xchg")
> > 
> > from the tip tree.
> > 
> >   Andrea
> 
> Thanks for the heads up!
> I will update this and re-send!
> 
> 
> And sorry about the delay :(
> For some weird reason neither the cover letter, nor your message reached my
> gmail, and just now looking at lore I could find your message. 

All's well that ends well.  ;-)  Thanks,

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
