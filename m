Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037FCC678DB
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 14:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cio+UQp9l1gY/p+B5yAOF5JVCP0PQDIf+MpvYvL9BmY=; b=2GnfSSaQQwuMCX
	rSqsecNkTBniZN4E9GLoC65H9V9KMgcfxEvPK4CmOygjDqKfRh6rDU2VYSMSAoeqiAUrUBXLyO0PN
	J11mUu8FBVlGTpZ6YISbcwM7RrwioJkhSckUZxVh9OfSJGLCgqvmcBfGINdg+mSQS3dnhidlTZsKY
	jWZJ5jq2yXBG/KMqzucGDBrR7JknzZw8U0vlStUyueaGtcVWP0FlShTijeFF0IAhJVbUbfSHxb2CL
	yodN9R/My4KKafNpHfb8yhTiuireQBT1WLfr92LBeGTaD1BbEBkZEyG655tRUiUuIv6sdzc1fRTCg
	GrgfHugUtEbcD+UyRAkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZCA-002mlv-Ar; Fri, 24 Feb 2023 14:37:10 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZC7-002mka-8S
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 14:37:08 +0000
Received: by mail-wr1-x434.google.com with SMTP id l25so13726787wrb.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 06:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zX/vrcCWtSvPkleAvaStM5cYJt4w+dPaI3g+F6rt3j8=;
        b=LQHkkHCx890jy2G0naCp3/iTJg8xCD/7RdzH+EY7Fard/LFReBEjzS0jqaZIo+axF+
         dq0W8Eh6fhgonwAZSeI3Ajf+ta2XfYcb0kNsfLUKBpBUjoYbEMJB2EJKVdD3efUDnvKw
         0kEz4DYaBense7NWRslHiTk5MgH9d6jO+Cl8X8KiowOVJeYyNiS84rimUM4Xpq7dcqNR
         3r5ppl0vx11OZLTdURYTSXPBbwtjjFhP1sqqurST1jZW7rlMKgg1LCPFori3QuO8YAkZ
         r/XmXcLZVjoxf0R/j3zFZyH/NZkJSi56d1Q2zxytHiSulhpJr9eqOT/+vZhqlzE8fy7J
         Vggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zX/vrcCWtSvPkleAvaStM5cYJt4w+dPaI3g+F6rt3j8=;
        b=Ziz1XplkF99VMuc3jjits2MLRUseN3LycN4f0E8plgPVeiSXqC/5VAgPUWWT+Dxj7j
         Lbx0lJb/vUXguWaLe2iWfgFZfs4wSKO3u5ICH3Nm+mo6pCGST0gDv92YdRG0sUfbJgSG
         r+RumAIBDr9AwQu1t8uWA4aydakcUzAVjlCx6w/uyzbn6rRu21o8OnANjFyjhNDqCFNQ
         tInz1Dh7yZkNLzVmEJ34LNrFql6tkKOAuKBxr7JtTKxyfKxOCrB2VjKjIwE8+k1U11/J
         7Y7ws7Qqz/x1eHZvuLr58Gu1J3Ibo7dpiM56U7Rj5cJ8cm/CWF8fkElMSxlyJ7xEJvZY
         jVGw==
X-Gm-Message-State: AO0yUKW6ueC5L8Do3nV4T1NzBukj9yUOvXw786yUNGDPZdSdhwAYWwgt
	UVVbaTpAUfjQtf+LkIZcfbDrWA==
X-Google-Smtp-Source: AK7set8xcAN5eLkL1fj65+8NoThpjh9Ic3yJgNR/wjD6Z+Qa0hu1nIgY5u/dHnWm9iJiQRdgtG3WNw==
X-Received: by 2002:adf:ea88:0:b0:2c5:5a65:79a0 with SMTP id s8-20020adfea88000000b002c55a6579a0mr10892663wrm.53.1677249417783;
        Fri, 24 Feb 2023 06:36:57 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id b15-20020a5d4b8f000000b002c561805a4csm15288994wrt.45.2023.02.24.06.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 06:36:56 -0800 (PST)
Date: Fri, 24 Feb 2023 15:36:55 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	kvm-riscv@lists.infradead.org, 'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Atish Patra ' <atishp@rivosinc.com>
Subject: Re: [PATCH v5 6/8] RISC-V: Use Zicboz in clear_page when available
Message-ID: <20230224143655.5scd7nxwunqpr3u3@orel>
References: <20230221190916.572454-1-ajones@ventanamicro.com>
 <20230221190916.572454-7-ajones@ventanamicro.com>
 <36abc02f-ef35-88a8-1fa8-ce7cebbae7ea@codethink.co.uk>
 <20230224142530.mq5qzfycvyvtnqiv@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230224142530.mq5qzfycvyvtnqiv@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_063707_339127_A2D952C3 
X-CRM114-Status: GOOD (  11.48  )
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

On Fri, Feb 24, 2023 at 03:25:30PM +0100, Andrew Jones wrote:
> On Fri, Feb 24, 2023 at 02:00:44PM +0000, Ben Dooks wrote:
> > On 21/02/2023 19:09, Andrew Jones wrote:
...
> > > +/* void clear_page(void *page) */
> > > +ENTRY(__clear_page)
> > > +WEAK(clear_page)
> > 
> > out of interest, why the __clear_page() entry and the
> > WEAK(clear_page)?
> 
> I was inspired by memset, but, in hindsight, it doesn't make sense for
> clear_page to be weak.

Of course I failed to completely follow the memset pattern, which also
has an export (in riscv_ksyms.c). I prefer the export in clear_page.S,
though, as you've done.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
