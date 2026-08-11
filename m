Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22266C5B574
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 08:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XALH6/l4Bvi66CgFuUMv9Y5SLG/W5SquJrtY0s6nSOg=; b=ae2y0rxZSzlX+N
	4pKDLKqojMEVGCbJKIvMlh/LhaIHcen9nUeDDxlD27z4Sv2leJnto+Yg7o7QtgX4BslUWxoWQh/3T
	uYn7QP3y0Htzc7U/9xaclUZNB735X0XBgYzt+kv0iiPpLG8y0tEiqd635R6BeB8ubY5yB9DqgRfDU
	dmvyaAXbc4HGVZOTzExByeccDLcSFaj1NVMcPuDg54X/X+XZCCzki9pDxTSuQ9xgFf+9oULJOXMpr
	Akku2APi8VYV6czquhE/fuEfVju22QFkClE7sLpyQ45J1mJ1dzahAW/LKNPSydCsV5vdZ+mGjlK2X
	WESYQLeu6YD2ThQ3ZBJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthnH-0000000DbD6-3BZI;
	Tue, 11 Aug 2026 08:25:08 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthnE-0000000DbCG-2i8J
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 08:25:06 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-382ef647e20so2951326a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Aug 2026 01:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786436704; x=1787041504; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZbxtcArluxLyA8miGWugZbCFD+9watkIVI9ZpOeFGK4=;
        b=KCODaqw0hOmAnNRl5z2uq53j6IiPYwl8bNkIUObjG61ORjEHnWyVzb0SgM8e4j6w2I
         +pRCL4tNpdPOMMf7dzmJBuBW3iIcAL8CjyFfHF0d/oNgf+M2UQByzuNZqkLFG07DaJ2I
         1ltzFNyfDINi3sn61wLv1qKji95By1i102rtWt7e9QyBhR3ugBncaLkWegtOCEZmLmGH
         /tLFSMzR+Fnvao1gYOcYlUWYlm86HE93poZYkLzZ9y0w6ORT9rdZ/9kjJ8gyywgni6sG
         3wf6AafbTSk97GMXQmgJT3sgi+k/5vEQpHnHB6cdFsDEkILzf3HSeaB3p/YWzU+pnd6S
         aVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786436704; x=1787041504;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZbxtcArluxLyA8miGWugZbCFD+9watkIVI9ZpOeFGK4=;
        b=Y1l60GIr8uFVtDZZnCfyMA4+Xr6E57SBl+6MsfwPkD9S7kbLSj+yxK+diV19EeDFAY
         OAPYZvOb3i/4CMpBWKLGPkS/5KtQRYsjFfyX//Bws/2ENPm4Ki8ThwthZ0U8AJg2NKqN
         LZlc88dm1vPm1y2ylfMYBgICJB3BPGPp+uswM7RMoAiKyZM0hmWDiVJ7R5MAPsbSfabV
         OQQL73N8HKSJlLNH5SZbPyNHhxEXq6DUENHaWS1Cc+ArbQXfvFhM6TeOS9e5z+khSDwN
         JZPLJ0PFZwU3/vXbdKw/vyPZSM+DOl2zgmHAT28w+ItOa/FmZgWRMGY2Ta7jxuekdqAw
         6NQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rob82kfq12RSWEKEq6oh70lOJy3g9YpY2BhXvpD9OOorzqTixsVgJ4408g+XZdWrIt6We46NEf2ixluTw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxXm8qLKz+ZGo7DCJw4HiULj9+BYb6KP9x+2GP5JkdP+c3i0aj
	0bLtUR6KgwmPjQz0M6zljTLvYyvTvy3bHzNhw5qrx4i6QWwOkclcO9Er1ZtJdPhS4TQ=
X-Gm-Gg: AR+sD105gVf24u8h/dZ4cG7CYHyLRrGN0TbInqZ1l29AB4zAQ/799U/zAPVFubzoqbk
	J+3BDInxC/WIdNpgcMkc620uvTGEGduK3KPY/j+Nm5i9x7IORAF+S6udreZ2+CHJIH42GsMXgoh
	UBBJj0iGhpOIJhEPPwyUsK+z/UopOELhUe7aq7So9UgiCxYkIcIUvkTUo8vQWibEtOID1HxPoF1
	5Qtiq02RkwTCrpCmhsk23FJpB4gzfVQqp+9LJOSCrd95E3se9QwEzFTGtJTDi9SfCnJCVfXOqCN
	BEqkSCdmesaj34e6Komd5xoU42ptn31fZlOz/4DQ/LDmNc0QX1iWwaMYw4YGzxAFA7vNbAWu85k
	arDE0zDqXP4ElwWdYHtGGhu+H2fTXvhKq+aZV/mw2jTfkyDzwl25/U41zyam3uQXikL7gW/ZN6h
	/zxN2AfIX5Uxs35IMtSqSeZuKOk6Qwxdf5xJh2EewDNdzuTqSyHmGjTyL8a1Q=
X-Received: by 2002:a17:90b:4ace:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-392ec74c9aemr1532247a91.19.1786436703800;
        Tue, 11 Aug 2026 01:25:03 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392ee1e35b2sm1038839a91.4.2026.08.11.01.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:25:02 -0700 (PDT)
Date: Tue, 11 Aug 2026 16:24:52 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	dlan@kernel.org, dfustini@oss.tenstorrent.com, michal.simek@amd.com,
	junhui.liu@pigmoral.tech, darshan.prajapati@einfochips.com,
	akpm@linux-foundation.org, zhangchunyan@iscas.ac.cn,
	luxu.kernel@bytedance.com, pincheng.plct@isrc.iscas.ac.cn,
	nick.hu@sifive.com, jim.shu@sifive.com, zong.li@sifive.com,
	greentime.hu@sifive.com, robin.randhawa@sifive.com,
	scott@riscstar.com, dave.patel@riscstar.com,
	raymond.mao@riscstar.com, anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: Add Worlds ISA extensions
Message-ID: <anrcVIoupzPVA74B@plin-1878>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-2-peter.lin@sifive.com>
 <20260810-penpal-aluminum-772319e5fc10@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260810-penpal-aluminum-772319e5fc10@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_012504_695499_CEC2CE65 
X-CRM114-Status: GOOD (  15.45  )
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

On Mon, Aug 10, 2026 at 05:25:08PM +0100, Conor Dooley wrote:
> On Thu, Jul 30, 2026 at 12:39:06AM +0800, Yu-Chien Peter Lin wrote:
> > Add DT bindings for five RISC-V Worlds ISA extensions
> > that implement World ID tagging for hardware-enforced
> > context isolation. Also, add checks for extension
> > dependency requirements.
> > 
> > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > ---
> >  .../devicetree/bindings/riscv/extensions.yaml | 53 +++++++++++++++++++
> >  1 file changed, 53 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > index 2b0a8a93bb21..7a57191a0293 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -193,12 +193,35 @@ properties:
> >              ratified at commit d70011dde6c2 ("Update to ratified state")
> >              of riscv-j-extension.
> >  
> > +        - const: smlwid
> > +          description: |
> > +            The standard Smlwid extension for M-mode control of lower
> > +            privilege World ID via the mlwid CSR as ratified at commit
> > +            TBD ("TBD") of riscv-worlds.

Also, I will follow alphabetical order in the next version.

Regards,
Peter Lin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
