Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D41C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 17:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xupch/Ewqx7vCbB+O653UqTR8r5Yz++h50+JlaweBdE=; b=W0vDivcbI5A96+
	vD5o3lfkdvBlMDyZtM8rBqm5011qzqicqajn+FzC4wNkWSQod8IHA1VuJz0w5fhLGEgC1JDDMsfqh
	r/ZsT4lKLrZsz+4Lgso7pUCQ1sws32a/JKVGaxg+NyOtbLL38nxmH2uAkHSGuqh+I1n6je/j849Qk
	hUGDCeOOpdUxjWQ9goL2x6AucTtmwO/26YCGFT+1D++dcFOSdLoBKKBp4GOJXhNQqymaJo+BGXUMd
	SoBUmroS71D3UKYG61N5Fe+766Rxt3Mc0/i8fOm2Fg3Gt2M+gruAEd1TB13Q5lTWAzptDUpaHJ8n2
	JmpNv//m9h75P4lxMTEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqe4G-0015dH-6s; Thu, 03 Nov 2022 17:31:52 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqe44-0015Zw-4l
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 17:31:49 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-13b6c1c89bdso2920375fac.13
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 10:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HvZ5+E5qu4GOYga/FqvgfxEG1c0dU8d73zf2fP+htGs=;
        b=iPqtLSq3l2qHplG860uNDrfYq9b0lZFbxHP6kSO5WcDFeNj74LgawQ3XHbriQnJzId
         91YDCFJ926vJ7L1jeQcvLnKN5IicgY26QvhLOUAx6NfuqsczuDo2+p95tiUE3Y3d3p8R
         Wb3AVYnqzTL0X7haZY7BTZ+oilwvxbeF6lVkgFNf8aMcvJgkuEefwy01BOsLK5VvAvzw
         YLeXvyd9tsE28Dp154l4LlczkE6gYboihsErhJGgG+F9jOSH92X0IzDV0rfpYNgoQqIc
         gaqjq4mqtFEpLgO3pJNfAld17zV9i0u6xe8AK0ilXIHLGax8f5r/eP0/Q0saTHwnR/aB
         J0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvZ5+E5qu4GOYga/FqvgfxEG1c0dU8d73zf2fP+htGs=;
        b=1sveC1hCJcCGY+WXr5jiWpaWm4C+PPA3GB0/UREJ3ecVlMwaNOJuUIrKswDNJu8Etr
         uY762J+W8IqcYTXTwbuy/pP1I8ZVDZSo1cgFzSJ8pH3CJa3qU+GDy/+5M7QEc2cZTQ7r
         Hvef/hBAgrZGcaMZV09mhD5VQxESn7zIYHbqocEt/J8gsWrrwQpeakA85Dg9YW29EPhe
         95UKf1cyn+OMoD9k4z1qVRmsB+sYQWswBbqAXePBQFFZbrU9Ws1StFs6+7/+FZ2v/iqB
         5OjDrn4UTqMhc1gq5zNP7kTB5irrlzwZC49SYebaCpmpAUmUj7CRoaw/63qEf0+axhdR
         ze2g==
X-Gm-Message-State: ACrzQf3Yn0DES0aTWhA1L2aKGKp9+ZVr3jt5fR6SnavGuWuNuH6MTv53
	0j3PF4XP+t8l0Pf2/d04Lp4=
X-Google-Smtp-Source: AMsMyM6fJYEOKNxJ1D+xB246uqRaGV2DX2E0qNo3z76RYRYleK2EIFTcmwXSUrFyVWM6R7buKJ49fQ==
X-Received: by 2002:a05:6870:31c5:b0:13d:a04a:6ecf with SMTP id x5-20020a05687031c500b0013da04a6ecfmr1655565oac.101.1667496692226;
        Thu, 03 Nov 2022 10:31:32 -0700 (PDT)
Received: from localhost ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id r13-20020a4a964d000000b00425806a20f5sm430333ooi.3.2022.11.03.10.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 10:31:31 -0700 (PDT)
Date: Thu, 3 Nov 2022 10:31:30 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, linux-riscv <linux-riscv@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>, openrisc@lists.librecores.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	"open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 2/2] x86: Fix /proc/cpuinfo cpumask warning
Message-ID: <Y2P68sfCJMvhKmhj@yury-laptop>
References: <Y1v+Ed6mRN9gisJS@zn.tnic>
 <20221031080604.6xei6c4e3ckhsvmy@kamzik>
 <Y1+OUawGJDjh4DOJ@zn.tnic>
 <20221031100327.r7tswmpszvs5ot5n@kamzik>
 <Y2K6clNJBn0SbWU+@zn.tnic>
 <20221103125945.lrr5oxxmylwpam53@kamzik>
 <Y2PX9GfxWYh6+XGT@zn.tnic>
 <20221103153404.uh77nrdkowrxj6cr@kamzik>
 <Y2PsvvOWVs9ZLBsp@yury-laptop>
 <Y2PxAiJ1yNzcUSgs@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2PxAiJ1yNzcUSgs@zn.tnic>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_103148_247417_CB1B4153 
X-CRM114-Status: GOOD (  15.05  )
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

On Thu, Nov 03, 2022 at 05:49:06PM +0100, Borislav Petkov wrote:
> On Thu, Nov 03, 2022 at 09:30:54AM -0700, yury.norov@gmail.com wrote:a
> > Callers should pass sane arguments into internal functions if they
> > expect sane output.
> 
> What internal function? It's in a global header.
> 
> > The API not exported to userspace shouldn't sanity-check all inputs
> > arguments.
> 
> That doesn't have anything to do with userspace at all.
> 
> APIs exported to the rest of the kernel should very well check their
> inputs. Otherwise they're not APIs - just some random functions which
> are visible to the compiler.

Let's take for example cpu_llc_shared_mask() added by you in
arch/x86/include/asm/smp.h recently:

  static inline struct cpumask *cpu_llc_shared_mask(int cpu)
  {
         return per_cpu(cpu_llc_shared_map, cpu);
  }

It's in a global header and available to the rest of the kernel, just as
well. How does it check its input? Maybe I lost something important in
per_cpu() internals, but at the first glance, there's no any protection
against -1, nr_cpu_ids, and other out-of-range arguments.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
