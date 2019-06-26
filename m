Return-Path: <SRS0=5cCT=UZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3061C48BD6
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2019 20:28:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C608E2085A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2019 20:28:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FIcza+y3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="OXD8lcND"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C608E2085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kzkqOrnlI1H4/Yl/gb/Brf77r7SFnJU1EYVuWTWqaQg=; b=FIcza+y3phh0iw
	hsykUKVufInvuUCdGyQPI5ebKln7GcJyZQvMnYP65x11AR1SZxtMZF1ztsTQvPrDsjF7epTi/y7aa
	aHFa1EyVQFmJU6F4DJkmazE1xjqe2aHS3PCrQYHN3B9c4xlCgMMhpjUgXympiiWlxzm0rjiByUCZr
	X5Oo+MXRhkp6nyvtt9a5XfOXI47iSfkBnNvAgypw3aaAnP4juWMoPOGfM5FEJk3rn9H7tXe1LgZjO
	RZdjtN7CU/n3Urwt7fTLv0jWubIgeT6nV9d7rVphLXZ+jBOwHx74kjEU7CeOoxv+xRi+X5BRhubkw
	MJKl2/ai3qBpmMcQrnNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgEWL-0006nL-7B; Wed, 26 Jun 2019 20:27:57 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgEWI-0006n1-GB
 for linux-riscv@lists.infradead.org; Wed, 26 Jun 2019 20:27:55 +0000
Received: by mail-io1-xd41.google.com with SMTP id s7so4994732iob.11
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2019 13:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=LgZeRxC6RQ5LdUYNQeMc+ciFdAiQ/Cfk+AzdfLEuWwo=;
 b=OXD8lcNDuVCQF0Os+37dJnhbEhLTPkAGYKnH2K/rTQrBwx0dYPUkpleQC7RAMj5qH6
 6Dvz4/TPGz9pp5LOtdWnDvwImdz3fv9wNsqK+8NfJ+K1Okp0MVweKvPjncv+11qG35Dm
 BXRbMdJxBUt/hIHhj1grg3+gaw7k29crfND37pkXQU0IPETEtomREiM2IA+VVYv4VWFY
 APcbKHDu2R72a9mxEZbn/0tUBP2BL9dZ2R0eHgDCK6tO7Ib6/eHON231w1wYainB/xg9
 xE/LV3MMhKT7qxgfmFSLdVrbWz6A98kF5ZXDqnlZdKlO7+iVTJh3VnjWjnr9hGWe39Fd
 8YNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=LgZeRxC6RQ5LdUYNQeMc+ciFdAiQ/Cfk+AzdfLEuWwo=;
 b=pSr1ulqluTJ5zI9bAf+NKS7g8Llmp0p0EKoBr5AXbpJcWNgCSeZhv5zAEPjZL72lr9
 5ih/zDjAW0Zy8i7h21+mnWLX1rUBwcLx0fhZzHtMR/F7rTpybmajhNK+/Al+0t76geD2
 r1/ZKgfCqsuPw5m7eseDgbbRX2jcrZ1ApOJwkJfdva9vvrfCj0H/0WQJPhbUw8PIyvlU
 J/gIseJcfqHAzU9/nGR/p2TrUs6vHY+gSpFp4RJiXB+ScgUmM533D5QmQ4pV9IATIpkJ
 G3txEx0a7fjHUR/ORbE/nyq/Oj2eBpiIdjzD6D9WSSjMPEWW1LXRD1lvmX384OBPtWxv
 dOlg==
X-Gm-Message-State: APjAAAV2s7QdUJHFuzIH+ObQ+JoKdOPiSTiq8grDQnjaX6pSmVYa7Prj
 ejXBGUOSr2cPZROkkHY8ygefQw==
X-Google-Smtp-Source: APXvYqwBABOk5P1lcHFrctT0fUSSr2Hv6vbQhbqcJSD5Q+1tQOnna356evEV+6djyREOBX4lf3JYkg==
X-Received: by 2002:a02:ce92:: with SMTP id y18mr7192147jaq.40.1561580873575; 
 Wed, 26 Jun 2019 13:27:53 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 h19sm16188iol.65.2019.06.26.13.27.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 13:27:52 -0700 (PDT)
Date: Wed, 26 Jun 2019 13:27:51 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: riscv: resolve 'make dt_binding_check'
 warnings
In-Reply-To: <CAL_JsqJs6MtvmuyAknsUxQymbmoV=G+=JfS1PQj9kNHV7fjC9g@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1906261325290.23534@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1906260829030.21507@viisi.sifive.com>
 <CAL_JsqJs6MtvmuyAknsUxQymbmoV=G+=JfS1PQj9kNHV7fjC9g@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190626_132754_543707_6A84F7FA 
X-CRM114-Status: GOOD (  15.77  )
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
Cc: linux-riscv@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 26 Jun 2019, Rob Herring wrote:

> On Wed, Jun 26, 2019 at 9:30 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
> >
> > Rob pointed out that one of the examples in the RISC-V 'cpus' YAML schema
> > results in warnings from 'make dt_binding_check'.  Fix these.
> >
> > While here, make the whitespace in the second example consistent with the
> > first example.
> >
> > Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> > Cc: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/riscv/cpus.yaml       | 26 ++++++++++---------
> >  1 file changed, 14 insertions(+), 12 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > index 27f02ec4bb45..f97a4ecd7b91 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -152,17 +152,19 @@ examples:
> >    - |
> >      // Example 2: Spike ISA Simulator with 1 Hart
> >      cpus {
> > -            cpu@0 {
> > -                    device_type = "cpu";
> > -                    reg = <0>;
> > -                    compatible = "riscv";
> > -                    riscv,isa = "rv64imafdc";
> > -                    mmu-type = "riscv,sv48";
> > -                    interrupt-controller {
> > -                            #interrupt-cells = <1>;
> > -                            interrupt-controller;
> > -                            compatible = "riscv,cpu-intc";
> > -                    };
> > -            };
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        cpu@0 {
> 
> This only works because you removed 'cpus' and therefore none of this
> schema is applied.

I'm not following you - could you point out where "cpus" was removed?

> > +                device_type = "cpu";
> > +                reg = <0>;
> > +                compatible = "riscv";
> 
> According to the schema, this is wrong. It should have 2 strings. Or
> the schema needs to allow this case, but 'riscv' is too vague to be
> very useful.

OK, I'll come up with something for Spike.

> Also, I noticed that there's still a riscv/cpus.txt. That should be
> removed and replaced with this file. Looks like the hart description
> at least should be copied over (into top-level 'description').

OK, will do that when I hear back from you.  


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
