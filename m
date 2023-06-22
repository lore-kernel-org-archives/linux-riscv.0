Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BC7EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 22:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=cgrb5PZ4Gx6tg+FRwmL/TDhmhjhUt38arOLNg2bhnmw=; b=emlos2hrSouFJvj+tn4zGuxM20
	jJUufwPBjFSJn+LJe3KfGJOPIPvaCeYyx4IHQNJ6VkhBbDNj6zwyeOAflNPtDEQXFKLnEB/3ve2H6
	Q+Y2/M8IbQhDsZeLNnnQ+oAkjyZdTYQw/AUMsW0aJyljoIhL790NBCZsijtZ8X+OKj9+3yP49GNIQ
	3FHMcVds1d+2rMPOT2jAWEy6Dv4SnIiUVKAlgf3jtI/EU39pzUmV9li+Tj45xkqlrlAYWj41JQNhH
	l3w6bFfNUrxRI2y9n3OWwhGmm+ewApgfbLkS7gl3RwV6DrDThVoLqq69LRCGVyBxZohpwSkjPJzE+
	K/X/yoyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCSbp-001wJs-2q;
	Thu, 22 Jun 2023 22:16:57 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCSbm-001wJD-0r
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 22:16:56 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-62ffb475be0so59778056d6.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jun 2023 15:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687472213; x=1690064213;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8ZqC2RcIKWzE1RcjLIH4d+Je5CLfsvEiug0JY8wdLY=;
        b=cQtriItXNiJ4pagxKqXEHN8Beu9yKDP7qXyi8/z0i500MAXA386GICymtBIvuqxZlt
         HNkztwcOoRkmmOOpCpaANaIy3nVWjHA4bzlnM8VyN17MU0wYjOhP1V+EkNOEFt2nStmK
         zko5stS09ow0hnv6o4xiQ6dWvxvvd/9PUbQmtI31ezlrJ5K/GOrIO7uTie0LUxG1e/jB
         ctM0b29oJSmUGT4hueJ9yQYWNRybOznFXHhG5xuQrinEsJi10Zke2MPHEVpqzzQQdd17
         qxxddLLBciEBk5VVM3UCzba+4/w8GKfJm0t/fOhQvb3IGO9xVfrQtU9yY7vJNPjibZoG
         l2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687472213; x=1690064213;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8ZqC2RcIKWzE1RcjLIH4d+Je5CLfsvEiug0JY8wdLY=;
        b=grFCq/RHm3jTMn5X9e2t2ImTfY1jOvJfG3SytdPJKPu65SJ2rYn1yYHugvAE4pZ4Oj
         a0++0YAM9HXF3mktDtMsfGbIPXR7BBuczpMQYXX0sw/M1s/YGA7ee0XIkcGXrbQzqh5J
         DYKbKkTAM8DHxtuwTktSjwjDqT4+KcHROSMlfOWqxjZ8SIjPAXMCT0uzl0hmVxsnYb6p
         C5blCrktjO8405TXevtdNHnpXPmm7KIndZsiXCxdt1qjQwdupvJlMtk9WVNC1E844b+B
         4r+Bg/f4IbXf3CrLTXT2xZgYrpIUhP00+mzG3tO82I5teqsciCjMDvt80cOUmhJdyjYV
         YekQ==
X-Gm-Message-State: AC+VfDynM7THZaejKtHUjWGzUd7nR45ojMOmufX4lMIBYhzR17cja7Wz
	/ftbHrWHNaHjJuIzab/gBMFMebxc6Pp934mYZ5fFIQ==
X-Google-Smtp-Source: ACHHUZ78o3J4G8akIl5xWlqpuHc0moKjGn3VopxJePyibqO3GkUL16bRdu5C0ffHAO9b/mOh8sFVzg==
X-Received: by 2002:a05:6214:4111:b0:62d:eb54:5f4d with SMTP id kc17-20020a056214411100b0062deb545f4dmr20980418qvb.38.1687472212693;
        Thu, 22 Jun 2023 15:16:52 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id o17-20020a634e51000000b0052c3f0ae381sm5266124pgl.78.2023.06.22.15.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 15:16:51 -0700 (PDT)
Date: Thu, 22 Jun 2023 15:16:51 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Jun 2023 15:16:10 PDT (-0700)
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
In-Reply-To: <20230622215327.GA1135447@dev-arch.thelio-3990X>
CC: bjorn@kernel.org, ndesaulniers@google.com, Conor Dooley <conor@kernel.org>,
  jszhang@kernel.org, llvm@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nathan@kernel.org
Message-ID: <mhng-6c34765c-126d-4e6c-8904-e002d49a4336@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_151654_310987_8E13E96D 
X-CRM114-Status: GOOD (  43.39  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 22 Jun 2023 14:53:27 PDT (-0700), nathan@kernel.org wrote:
> On Wed, Jun 21, 2023 at 11:19:31AM -0700, Palmer Dabbelt wrote:
>> On Wed, 21 Jun 2023 10:51:15 PDT (-0700), bjorn@kernel.org wrote:
>> > Conor Dooley <conor@kernel.org> writes:
>> >
>> > [...]
>> >
>> > > > So I'm no longer actually sure there's a hang, just something
>> > > > slow.  That's even more of a grey area, but I think it's sane to
>> > > > call a 1-hour link time a regression -- unless it's expected
>> > > > that this is just very slow to link?
>> > >
>> > > I dunno, if it was only a thing for allyesconfig, then whatever - but
>> > > it's gonna significantly increase build times for any large kernels if LLD
>> > > is this much slower than LD. Regression in my book.
>> > >
>> > > I'm gonna go and experiment with mixed toolchain builds, I'll report
>> > > back..
>> >
>> > I took palmer/for-next (1bd2963b2175 ("Merge patch series "riscv: enable
>> > HAVE_LD_DEAD_CODE_DATA_ELIMINATION"")) for a tuxmake build with llvm-16:
>> >
>> >   | ~/src/tuxmake/run -v --wrapper ccache --target-arch riscv \
>> >   |     --toolchain=llvm-16 --runtime docker --directory . -k \
>> >   |     allyesconfig
>> >
>> > Took forever, but passed after 2.5h.
>>
>> Thanks.  I just re-ran mine 17/trunk LLD under time (rather that just
>> checking top sometimes), it's at 1.5h but even that seems quite long.
>>
>> I guess this is sort of up to the LLVM folks: if it's expected that DCE
>> takes a very long time to link then I'm not opposed to allowing it, but if
>> this is probably a bug in LLD then it seems best to turn it off until we
>> sort things out over there.
>>
>> I think maybe Nick or Nathan is the best bet to know?
>
> I can confirm a regression with allyesconfig but not allmodconfig using
> LLVM 16.0.6 on my 80-core Ampere Altra system.
>
> allmodconfig: 8m 4s
> allmodconfig + CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=n: 7m 4s
> allyesconfig: 1h 58m 30s
> allyesconfig + CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=n: 12m 41s

Are those backwards?  I'm getting super slow builds after merging the 
patch set, not before -- though apologize in advance if I'm reading it 
wrong, I'm well on my way to falling asleep already ;)

> I am sure there is something that ld.lld can do better, given GNU ld
> does not have any problems as earlier established, so that should
> definitely be explored further. I see Nick already had a response about
> writing up a report (I wrote most of this before that email so I am
> still sending this one).
>
> However, allyesconfig is pretty special and not really indicative of a
> "real world" kernel build in my opinion (which will either be a fully
> modular kernel to allow use on a wide range of hardware or a monolithic
> kernel with just the drivers needed for a specific platform, which will
> be much smaller than allyesconfig); it has given us problems with large
> kernels before on other architectures.

I totally agree that allyesconfig is an oddity, but it's something that 
does get regularly build tested so a big build time hit there is going 
to cause trouble -- maybe not for users, but it'll be a problem for 
maintainers and that's way more likely to get me yelled at ;)

> CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is already marked with 'depends on
> EXPERT' and its help text mentions its perils, so it does not seem
> unreasonable to me to add an additional dependency on !COMPILE_TEST so
> that allmodconfig and allyesconfig cannot flip this on, something like
> the following perhaps?
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 32c24950c4ce..25434cbd2a6e 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1388,7 +1388,7 @@ config HAVE_LD_DEAD_CODE_DATA_ELIMINATION
>  config LD_DEAD_CODE_DATA_ELIMINATION
>  	bool "Dead code and data elimination (EXPERIMENTAL)"
>  	depends on HAVE_LD_DEAD_CODE_DATA_ELIMINATION
> -	depends on EXPERT
> +	depends on EXPERT && !COMPILE_TEST
>  	depends on $(cc-option,-ffunction-sections -fdata-sections)
>  	depends on $(ld-option,--gc-sections)
>  	help
>
> If applying that dependency to all architectures is too much, the
> selection in arch/riscv/Kconfig could be gated on the same condition.

Is the regression for all ports, or just RISC-V?  I'm fine gating this 
with some sort of Kconfig flag, if it's just impacting RISC-V then it 
seems sane to keep it over here.

> Cheers,
> Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
