Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E649BC47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 11:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J3zcX85D8C1NEmcgM/hDWhy7PFgh+iIStZbKy0xfi30=; b=zQ8RVBxOVOB+RD
	Ei42aihPxLkcFbk5eVRyXDHp6FM9+1yFzNS2QXS2/Ulz8MxSOrFVOAq+EjzCyoFBFPbT2O9H7xqPm
	3vuHZVPSCraFn3ao7vRnw+AdsGorg1Aaj6QPZfS1aJ6832RJ2UyhXAEx+ReUsUgTnMPN+ttMXJYe8
	GzL0v0JehDkXvX72cknX0Uny1f6yeNfMBUp9HF+RfG9tuVXkXw6yeuUR+BflOWjs7SQnt2CRU2kMH
	2yItrs7eU9dN4mKRzXfkdwt654MD6FemIXuUhZTWxK/7QS1wL9UosoAJZZv5+CDqyk8EB+jiWM4ge
	3lDTamtgmdaVVXbaYcMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLLmj-00Dgra-0L;
	Thu, 04 Jan 2024 11:21:13 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLLmg-00Dgq2-1i
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 11:21:11 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5570bef7cb8so321943a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 03:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704367267; x=1704972067; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qKPYdKug4jHnHkMVUhvNYsHAKauhASNUqaOoyowrxaM=;
        b=fDv8tXDAywra4lPfdERVAS4sipIUxAyew1BOFRJIB7VqOpFLXdVRAO+J4oTPyCBHBl
         8L9b/gpn94hGW4HfFCjtBvpo1XX124Gv2k2qP2boJchhmducrP2P1O5jrSrdGP1SF4VE
         1wJy4KvetKSvZenVtWKuEn547z+YZ/F7G2akQmD+Mvp94oS6vAWeP8QvHmp/ZtKmKPhC
         DmF5TDQi0D1hoG0WacMlbSIglXA3OAQ7uqpqtR1NeXCJLiZqmjFYVSoayWh1q8T7uHzs
         g24zAid4+EzkWy+hRnDobgDQ2Zzi2Yc2vH/L44elkUWl7kbJ6wrHCNQFpTV9TJoUbWRL
         oyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704367267; x=1704972067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKPYdKug4jHnHkMVUhvNYsHAKauhASNUqaOoyowrxaM=;
        b=jUZV1gi79R/VSDcfguYlCJ7H8kkbfOFwPl/92VIdg97OdmUz/GRyuc9cnuyDnak88J
         eZHfSNodrtDQUyQxrZjdEIKIRTKNSRUSbPSJ/0MFfmkdBePX0FfA9DvuNDNdMj6YX1sN
         7YsdM2JgtlsvJIDuVOk10SD/t617KalSTowIDssd3EybDIFOLuMsDp1SH94R9W8vHFnf
         Eho5cWPcuqqH9h2oktXx9U2g7VQuJoALI1YGzVH6EjIR2iHrXYo3i3CmqIWhVdzF9UfZ
         B7x5Yam/J/A3honpBdpboZp7OOduAqmQCoaOc2S1l0vJL8QKusMBbVu6NOAaL5ohZutJ
         /oZw==
X-Gm-Message-State: AOJu0YwOZFLP/y9W9NCKNBdpxBm1NWxgQQ0lt7UxZhMYvjESLj67NE6E
	AYe5DV6kyBClpwtCEpMplPWY+QZkPfbjfw==
X-Google-Smtp-Source: AGHT+IGEPF95NHKVsnpyIHKUm/KgY8I0kv9v78/s4o+1miuTMPSJaURO0LP/yv/+PD12AbmgBJL1yQ==
X-Received: by 2002:a50:bae9:0:b0:555:65c0:e72b with SMTP id x96-20020a50bae9000000b0055565c0e72bmr319888ede.62.1704367266640;
        Thu, 04 Jan 2024 03:21:06 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id w14-20020aa7d28e000000b0055306f10c28sm18642880edq.28.2024.01.04.03.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 03:21:06 -0800 (PST)
Date: Thu, 4 Jan 2024 12:21:05 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-next@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, anup@brainfault.org, 
	atishp@atishpatra.org, rdunlap@infradead.org, sfr@canb.auug.org.au, mpe@ellerman.id.au, 
	npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, pbonzini@redhat.com
Subject: Re: Re: [PATCH] RISC-V: KVM: Require HAVE_KVM
Message-ID: <20240104-6a5a59dde14adcaf3ac22a35@orel>
References: <20240104104307.16019-2-ajones@ventanamicro.com>
 <20240104-d5ebb072b91a6f7abbb2ac76@orel>
 <752c11ea-7172-40ff-a821-c78aeb6c5518@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <752c11ea-7172-40ff-a821-c78aeb6c5518@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_032110_574133_9B24F7F6 
X-CRM114-Status: GOOD (  12.64  )
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

On Thu, Jan 04, 2024 at 12:07:51PM +0100, Alexandre Ghiti wrote:
> On 04/01/2024 11:52, Andrew Jones wrote:
> > This applies to linux-next, but I forgot to append -next to the PATCH
> > prefix.
> 
> 
> Shoudn't this go to -fixes instead? With a Fixes tag?

I'm not sure how urgent it is since it's a randconfig thing, but if we
think it deserves the -fixes track then I can do that. The Fixes tag isn't
super easy to select since, while it seems like it should be 8132d887a702
("KVM: remove CONFIG_HAVE_KVM_EVENTFD"), it could also be 99cdc6c18c2d
("RISC-V: Add initial skeletal KVM support").

I'll leave both the urgency decision and the Fixes tag selection up to
the maintainers. Anup? Paolo?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
