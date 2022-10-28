Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D99FA3741
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 14:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3srDDesgXXQMlhsTEI24accJNpiKHXNMGHTE3lae/H0=; b=m83w5gzT8tNANx
	+lw5uSBukuwSvtg1V5u5kLO/o4DwyyoEwRxtSXjqL366J06ErFeBt/9r4Y5vxJRFLjBDc/gz3lqiO
	h9h0pQdJ9n8tHcYkBMpJrR8jxX2opdxEk+924ovuVGZVaiXxwhokNsGxH0cjIECMxpE0XI9UlVn3W
	Eb8/+58MvYYRq7sVLLDlv2VpR3XZM8fQ0uCFrrDS/jg380SCaOUUFI0TyMXBQ/+oKH035DtGI21hZ
	RUKutTF+CkFEFcvkCfMBed/lfG4Pj9dfeVw1Ncc3bUlCHRNLFxq6ujMEUnRCNccgTbuxjIFpIBviz
	CWCSYYRcb0SM4vI+8KeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooQhQ-000Gi4-Ek; Fri, 28 Oct 2022 14:51:08 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooQcg-000Ehm-EE
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 14:46:19 +0000
Received: by mail-qk1-x734.google.com with SMTP id i9so758525qki.10
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 07:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Eap9vgCOo567XBoaqrJtjJTPOneofbaWXwjzfOt/ko=;
        b=U9faWpM7anfFBwf3lzGgjWdNMgzIZ5MaBAebT8n2v2OUJY1IMy0pME/pjQqGG+QCfK
         7bZUQVJbFh+CxKQQwQ9R5DDx2LWJYCh9bHvuVmZHPmCZPkMxsq4v3oJXCIxrEtU2wyRC
         xULShKwG4KVA/V/y2mm6RzTgzuuWv442t/NvFxc8iUofWRjpiTJmB9Up3DOffi9xJubj
         RR/im5wg2HXy+AthCzdp6tuonbTc2TjHap3B8Gg0F07kxqFgPa43HIxP9DkvUH0elOgY
         5p7rsu2JPPbc+4Yasp+tik93X6+d2C8f2E2ZaK63ox8JmrIPJbDeHqmIGgxLkGGsIsze
         bCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Eap9vgCOo567XBoaqrJtjJTPOneofbaWXwjzfOt/ko=;
        b=lk3ks012OKzW86BEsSPbf96+cr6nan+LbjRDKrEB9ToNRm8MfOR/NJaiE/vqGNGKpi
         +jFfdhXTyvE5vXWuEtIUxGwUIEq7LxE8RugC2A9JbJX6Uzi5PkFoWOvu6phLyHLgQQnX
         6eaAlwBtiFn4t1c7ZTIbaoN2+hZTVltnd4blu7p9OmdULTtbGe1dShWxGj0eidhWDiq1
         jS5TZ87o04WYmqsdfrCzdY4purUwuva+vSP7hO6f85GTlhrucx6jjxPqbtse75Y/9ON8
         gRF5/j9XrhcFblaRYq+kp30QNBcfJ6Aq3fw4UxZhkwzeKsrDOP0y6v6tB8FnZMck3XjX
         bdow==
X-Gm-Message-State: ACrzQf3PbvaARX+ZYIxpdBVKOR8MlRYVXzsb4KSNZCvINwTbHwD2yNZN
	0w8m1D7BIKhzUfWKt6ig4JU=
X-Google-Smtp-Source: AMsMyM57AgHD6SgkTqjWVZle9kdelFZLgih4OaFJ7oUhyOHHF+SxLTt1A5EyJr2xvmD6EBJZRyNRIw==
X-Received: by 2002:ae9:ebce:0:b0:6f9:ff07:7295 with SMTP id b197-20020ae9ebce000000b006f9ff077295mr5459491qkg.655.1666968369100;
        Fri, 28 Oct 2022 07:46:09 -0700 (PDT)
Received: from localhost ([2601:589:4102:5fd2:5b94:d8b:99bf:707a])
        by smtp.gmail.com with ESMTPSA id x3-20020a05620a448300b006bbc09af9f5sm3032932qkp.101.2022.10.28.07.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 07:46:08 -0700 (PDT)
Date: Fri, 28 Oct 2022 07:46:08 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: x86@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>, openrisc@lists.librecores.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 2/2] x86: Fix /proc/cpuinfo cpumask warning
Message-ID: <Y1vrMMtRwb0Lekl0@yury-laptop>
References: <20221014155845.1986223-1-ajones@ventanamicro.com>
 <20221014155845.1986223-3-ajones@ventanamicro.com>
 <20221028074828.b66uuqqfbrnjdtab@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028074828.b66uuqqfbrnjdtab@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_074614_553939_38DDA825 
X-CRM114-Status: GOOD (  10.06  )
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

On Fri, Oct 28, 2022 at 09:48:28AM +0200, Andrew Jones wrote:
> Hi x86 maintainers,
> 
> I realize 78e5a3399421 has now been reverted, so this fix is no longer
> urgent. I don't believe it's wrong, though, so if it's still of interest,
> then please consider this a friendly ping.
> 
> Thanks,
> drew

Hi Andrew,

I'll take it in bitmap-for-next this weekend.

Thanks,
Yury

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
