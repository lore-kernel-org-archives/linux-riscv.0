Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46884C02183
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 09:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6NGHujS2cLIKzhmf2nA6BptOJYl7GX4J/zG/RzXV8Y=; b=WVRwroG8fbOH3D
	R+mO9uYwdkClZE4IYGyGr4QIhELN9MGHuDXqyitD9Z8iU2TLJFrLrcX2hHY4yQ1HW73Gc8TjRGUma
	SmHTl8P+1q/Hp6TtJjy3dzcXp/Zv2NYQUVFD858bApbk2f2N6xfqzEmYssspcsXca65IQIGR4w2Ky
	cKIoJIlvuTVZUGQbX9UN9BkgJqLTLaeY9sVSxCa3fj2C1hTKfRIol6TkSF7L2SdM3aYksvVqr/vDS
	ZPjIzMGa8M/3bHkLAvjfb3PPynTcrazFNGSEv8bSDzEI5KkOA7eyrRZinIHeaTTkSndYmwqzxR3bd
	Ji++u0cfaOyLc19CMNsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY08d-0000000BQCL-2Ohw;
	Wed, 15 Jan 2025 09:56:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY08c-0000000BQBd-3GsE
	for linux-riscv@bombadil.infradead.org;
	Wed, 15 Jan 2025 09:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5Ke3Xx/wtgubyAhgh9gm7HdjX/OGZn6UodYiywkGpxs=; b=AgK6z6rvAcTnmZKb9aEdLcdZzS
	+3u/hsa9rxnBGpSiFPdsDHRVipB+D2vhYkuDt8o+0mJ4XeLymgAT169tve1/PwF/7DBhCmr89VyXq
	g4ojIh7K+Fzj6YY9t3kSxqBSd54croKXPPlDlamOamCXOWcBejPp+a+Z2se28tHvDixgfP+blwbvF
	uGj9sRrlthUyta113WsqRteyYUYIDiGyskY27msxTUADfz7f6aImY6ADMGKF2bbrnhDkEHleJWndk
	Wny2MihdGyraUscaIr8wydj0azuGocJU/vKtBDGOHNchTbNubwEP0a/5YTfhfwCz2N9h/dUentL//
	YkOE3NeQ==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY08Z-0000000ApnU-2dgH
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 09:56:37 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so3380310f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 01:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736934993; x=1737539793; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ke3Xx/wtgubyAhgh9gm7HdjX/OGZn6UodYiywkGpxs=;
        b=B8esm3/U9yHtblv4J6gdSz/RA1NLnKfZnCdbGzAyxcZvqOsIItFMS1PpJxoPZYxyBG
         HntyZ+w9pWrO5PeN1XYYyvFzn/o+jnDrkPzLpU2+7joNh0T+nhlRD4BGk9UaM5XGj4Rj
         izPuS+G02wm9/gu0hxvuNjIdAKPupNHp1veIx97gbZh5pCEYVkar+biyjE5WxiNNtcQn
         F1XQZXW0lllzvxC9hSAOrxSS0tqxtCfJqltuVTDFUxhWlpMqPwCTugyX0EGHpLHoBTVW
         Kndqyjx/dlBGgvH8+ZdqXHpmWS1F5FTZorsxxaGl9RUjMpA6uM6KYN2AtilgyTk724dM
         jXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736934993; x=1737539793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ke3Xx/wtgubyAhgh9gm7HdjX/OGZn6UodYiywkGpxs=;
        b=XQze99SCXldy/vPtfH46n4XWB+7x6X0vxOwLPW6DnqHim570PJRr4/PuonsPDNxSyu
         8iHYaqmhHM7wz5FC9MMUEX54tk9aRI809wP6evh8volC6pVZ8FD/AfKSPw5XRFwVaRMe
         TvuHYoiv9hmkWG+i4Wq7J7CxdUT3aRYFbO8aS/GZxG8gODvOMl/6Mjt9r+bodB48wkzo
         iGgKhNUp7Gq5LO/QLV45E8HiSwiRq0JhmQdXMXEokaiV8gbA6VKTqF8uE6edFmL99xXw
         t+SDZQF64M00lpSbOYzscacSptjwHO7cDGvPTMd6YNpsM44c70txdAUKJ2rithrRFJ0p
         4BsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCsc/c1/cJx4b98XlSK2PBKbBeBUpKfbEWay4qlo3XsyWv2azQc37hFYYabC1TaeQ1rBDz32u6xEk5vg==@lists.infradead.org
X-Gm-Message-State: AOJu0YybMYiyaA7BGYZCj+TxAVTZItcAsKIjG5FN7xp6WItuzQm1NNr1
	rczKQMZFdKMEARM/8YSSJSIcM9JQM/qVCQi/3OzhWvgwWQEinnjINes4HIe30Ew=
X-Gm-Gg: ASbGncuxFhIdBVOqupBNg5a9BxNM3TyfQaxTuhJ0H6ALb2JTBYJUTwtWh3XviLwpFok
	oI+RFiLYV76Hv01nnCMxYNraCSMgtfo9J2iEhx/tOFHnL+XXvNWe2JznV43QQOXWIANh+uJWoYp
	Fnew5YK3W3h4+7RpnTiEOLwP6/8pTF0pU2ncaDih4Es76rDK74mhqrPAdbSWecMC1kQs2CbNjBL
	Xewi2uUoWmXG2y91LR4uiVrowMHJ2vrkMYwA9OBs166PpT1EHd5jQMT7+QoVoK1IrKn/WCrhKMt
	ajt6jE+VtW6eCWqUmkMwdPr9kfHaJ1zFWv2rAXTFew==
X-Google-Smtp-Source: AGHT+IENVizyrpTDaL6AXD65KcGWw+5Em2NxzXA8Eh98pJFESDPN89Pap+1V8u237LVHxYhDj/sKOA==
X-Received: by 2002:a05:6000:184e:b0:385:f560:7911 with SMTP id ffacd0b85a97d-38a872c93e3mr25276895f8f.10.1736934993168;
        Wed, 15 Jan 2025 01:56:33 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c749989asm17783685e9.2.2025.01.15.01.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 01:56:31 -0800 (PST)
Date: Wed, 15 Jan 2025 10:56:31 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Celeste Liu <uwu@coelacanthus.name>
Cc: Oleg Nesterov <oleg@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	"Dmitry V. Levin" <ldv@strace.io>, Andrea Bolognani <abologna@redhat.com>, 
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ron Economos <re@w6rz.net>, 
	Charlie Jenkins <charlie@rivosinc.com>, Quan Zhou <zhouquan@iscas.ac.cn>, 
	Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>, Guo Ren <guoren@kernel.org>, 
	Yao Zi <ziyao@disroot.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH v5 2/2] riscv: selftests: Add a ptrace test to verify a0
 and orig_a0 access
Message-ID: <20250115-9a1a8e824977f49770a5358e@orel>
References: <20250115-riscv-new-regset-v5-0-d0e6ec031a23@coelacanthus.name>
 <20250115-riscv-new-regset-v5-2-d0e6ec031a23@coelacanthus.name>
 <20250115-28c95808502d43f84b3fe0a6@orel>
 <17dfb122-4ae3-477f-93a8-1748b819c59c@coelacanthus.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <17dfb122-4ae3-477f-93a8-1748b819c59c@coelacanthus.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_095635_965656_9DBD010A 
X-CRM114-Status: GOOD (  17.41  )
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

On Wed, Jan 15, 2025 at 05:41:57PM +0800, Celeste Liu wrote:
> On 2025-01-15 17:14, Andrew Jones wrote:
> > On Wed, Jan 15, 2025 at 04:24:59AM +0800, Celeste Liu wrote:
...
> >> +#ifndef sizeof_field
> >> +#define sizeof_field(TYPE, MEMBER) sizeof((((TYPE *)0)->MEMBER))
> >> +#endif
> >> +#ifndef offsetofend
> >> +#define offsetofend(TYPE, MEMBER) \
> >> +	(offsetof(TYPE, MEMBER) + sizeof_field(TYPE, MEMBER))
> >> +#endif
> > 
> > I think this is the sixth test to define these. We should copy
> > include/linux/stddef.h into tools/include. We already have
> > tools/include/uapi/linux/stddef.h with __struct_group and
> > __DECLARE_FLEX_ARRAY, so I think it should just work.
> 
> Agreed. But it may be better to be a separate patchset
> so we can change those definition in different selftests
> one pass.
>

I think a separate "copy stddef.h" patch could be in this series to
avoid having to add the defines here. Then, another series can be
sent with one patch for each conversion. That said, I'm OK with
adding the defines for now and doing the conversion later. I just
hope it will actually happen.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
