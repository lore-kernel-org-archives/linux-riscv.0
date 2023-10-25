Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26702C25B6B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 21:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ppDsQrR6NaBW3B4Jc8FWZSnP90l2B5y514P7uJmaS9Y=; b=V+rLn7vB2HZfhx
	GQYsF1g2kkMycFFA2Oqlb2SKAVIf4T0/SMkBnVuOuxDjivC0DwZYz85UoFdLNFyIeuQTETodHHL0o
	lQvKyNGBhxjUpjDfBi+k1YuzeR8Jc1kz4pB0E/yntFZAwP/tGvdD7bthg37i7tMHg8qqEo4LC0J9j
	KvE7xkC4YAIEDAcRAdv/Tv26sRj0gDehXxuTtd9Kb58Z/Hj36vX+8+DF2ncvsWjLqCXXowK3vyz08
	MJCA4V0PPXeCIBI9nFM5POS9cfl11Ea2zFaJdposphUOFOZkLwmT4AFSa8JfrznSyNndcQFC1QBbq
	YOq3/uxQU6pGf2EcSzVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvlAS-00D9WN-1P;
	Wed, 25 Oct 2023 21:11:56 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvlAO-00D9Vo-2A
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 21:11:54 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6ce29d1db6eso640191a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 14:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698268309; x=1698873109; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vvbiAXR+3VKhNIamhbP5xxZpWhK78+hpTb+9JSqRlGg=;
        b=QJdiN8+KHnr7y52pf7xwSIguHY/mLuM3mocXj7GnUs6xSMN93m72P4tOwyhiwOlN/a
         pmkF5b3VNmSS1rztxUbNRrSevEAROveieKE91TuZPw6r4lOmReGwSBth7Xl3/T6MUGMJ
         POyHFYFGdy1SME76tz1w9oCdtPqH1XoFv9y4ab3Sc92q1Dz02uUQ7lBMZQ9qIK1h9r2m
         Ks6tbgrHlCCzJ1O1NwUMHsU+Hc6XQQIr87AzVzEFS+dxpZnKFbUsO61sYXBXN6bDmCg+
         Jx2+Y01DbXQdjjFbcHEflryU5yXrb+fWCiKhTxTm2Xi5YnXCOnk6SvkgXG7x5JiaA4Vg
         d6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698268309; x=1698873109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvbiAXR+3VKhNIamhbP5xxZpWhK78+hpTb+9JSqRlGg=;
        b=IQX/joq0efmlYjisJU6hZwJa/Qe19p0WCF31+NvY2Ov4v6NF7tdb3g/xl/dTjEtV9d
         yq5Yudwys54I+1MTeR7rox4kUYUc61J0QwkklOJTjY9JvYx4eX56mosRZec9UplK5kaK
         ygexHfk82yI0gINY6sZxfX3AvjrpvWShkNjsLUuzLXqWcG1fAeh8h/VJ9zH+CL8sWOQp
         2gm6DrOXNtKWMaGCHG9t1VnRH5t9POmxo8XokqWpfOeBIofiLwRbKozI9xawfByhnbfR
         SwzuOsjo4vZs36NM7wAgx6WEGaWVzeh//5EVsDy8Z8Y1Q2tk80StSuiT/xs444a3/H5T
         D1Fw==
X-Gm-Message-State: AOJu0YxzSmIMiyrycKOYLE7CHURoaPNdRSQfF8ctYyxi65ug3RUKhNgT
	bI91uXRBPpoQSVcmHQF9kzVyzSw4nYi7Ad/1wLM=
X-Google-Smtp-Source: AGHT+IFoPbLj21nNX14WA1MId9RviICvQbQvwuMrq6I5HACQKpRbIKPLDice73bnzAn5gIazBDjylQ==
X-Received: by 2002:a05:6808:10d6:b0:3af:63ac:2f96 with SMTP id s22-20020a05680810d600b003af63ac2f96mr532334ois.6.1698268309130;
        Wed, 25 Oct 2023 14:11:49 -0700 (PDT)
Received: from ghost ([208.116.208.98])
        by smtp.gmail.com with ESMTPSA id bm23-20020a0568081a9700b003af638fd8e4sm2540029oib.55.2023.10.25.14.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 14:11:48 -0700 (PDT)
Date: Wed, 25 Oct 2023 14:11:45 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Wang, Xiao W" <xiao.w.wang@intel.com>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Conor Dooley <conor@kernel.org>,
	David Laight <David.Laight@aculab.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v7 2/4] riscv: Checksum header
Message-ID: <ZTmEkYn1NcUvL58n@ghost>
References: <20230919-optimize_checksum-v7-0-06c7d0ddd5d6@rivosinc.com>
 <20230919-optimize_checksum-v7-2-06c7d0ddd5d6@rivosinc.com>
 <DM8PR11MB575134C301E7E17E72281CFAB8DEA@DM8PR11MB5751.namprd11.prod.outlook.com>
 <ZTl8gauEst2NGrw6@ghost>
 <059f17e6-e240-40fa-8742-7844ad3b3502@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <059f17e6-e240-40fa-8742-7844ad3b3502@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_141152_732272_E5667AF3 
X-CRM114-Status: GOOD (  22.65  )
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

On Wed, Oct 25, 2023 at 10:52:22PM +0200, Arnd Bergmann wrote:
> On Wed, Oct 25, 2023, at 22:37, Charlie Jenkins wrote:
> > On Wed, Oct 25, 2023 at 06:50:05AM +0000, Wang, Xiao W wrote:
> 
> >> > +
> >> > +/*
> >> > + * Quickly compute an IP checksum with the assumption that IPv4 headers
> >> > will
> >> > + * always be in multiples of 32-bits, and have an ihl of at least 5.
> >> > + * @ihl is the number of 32 bit segments and must be greater than or equal
> >> > to 5.
> >> > + * @iph is assumed to be word aligned.
> >> 
> >> Not sure if the assumption is always true. It looks the implementation in "lib/checksum.c" doesn't take this assumption.
> >> The ip header can comes after a 14-Byte ether header, which may start from a word-aligned or DMA friendly address.
> >
> > While lib/checksum.c does not make this assumption, other architectures
> > (x86, ARM, powerpc, mips, arc) do make this assumption. Architectures
> > seem to only align the header on a word boundary in do_csum. I worry
> > that the benefit of aligning iph in this "fast" csum function would
> > disproportionately impact hardware that has fast misaligned accesses.
> 
> Most architectures set NET_IP_ALIGN to '2', which is intended
> to have the IP header at a 32-bit aligned address, though
> some other targets don't bother:
> 
> arch/arm64/include/asm/processor.h:#define NET_IP_ALIGN 0
> arch/powerpc/include/asm/processor.h:#define NET_IP_ALIGN       0
> arch/x86/include/asm/processor.h:#define NET_IP_ALIGN   0
> include/linux/skbuff.h:#define NET_IP_ALIGN     2
> 
> I think it's considered a driver bug if an SKB ends up
> with a misaligned IP header, but it's also something that
> some of the more obscure drivers get wrong.
> 
>     Arnd

Thank you for pointing that out, I had not realized that macro existed.
Since riscv keeps NET_IP_ALIGN at 0 it should be expected that
ip_fast_csum is only called with 32-bit aligned addresses. I will update
the comment and refer to that macro. riscv supports misaligned accesses
but there are no guarantees of speed.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
