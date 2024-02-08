Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1341C48260
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 11:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ib4DY1086ViXfiXLEm+Rfbth4fj5r8aiBnVvlOwoVuU=; b=gSG6DSmLWf0znN
	XvKbq2KpcIUVa47xiC8cnRDgTVKrT1U7o50xO8UPFjCoBcGI5qwLqfytgzriCBYAFNfLqdh7HpfdZ
	NQ7prlhXaFrg6PeFl6HGiQXCr45tvaxGIi5Q3edifccQzwDx5Eb/xMMekZ3UtKCd5hSFdaOpRPrho
	J77VNdZ22SQkomWh1d6W/KCrb95LN0dTnkLk4R7PAEGSlUeVUn8+6MDLn7Nr7Sp1gFHujyLDC9Re0
	Qx55SkeEpLOyMss6hrlbV+fzYL4vBLj1Lz87k1bfveEemSSglYWZbDo0IB+H8fqFkgOgqHtvLNqBR
	jQzHPSD/97JPHnBGUZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY2JJ-0000000DXRy-0Vi8;
	Thu, 08 Feb 2024 11:11:17 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY2JF-0000000DXQW-29KJ
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 11:11:14 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-55fe4534e9bso2024587a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 03:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707390672; x=1707995472; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dkltV/LKNYv+rODcoWYZtA6BeNijF5We+gSy0yOyWBU=;
        b=LY988N4mXMisgAMfWariJKSm47IN3aTerk4y+QQMN65RlkVFAq/u0dAi9eJobBNZwy
         q2UPU/U/06G+gk2LtgPBcNwtGk3Yrczc5v8YIztUUuHJj/7g5dG+7T3BUzM2lMF2ueGr
         z+B4m/ApLUfecjSkG60q/0qqspJvOWXU37jqPWHW9TVaS4qjlCsTbwPo4N/9DYKbAnmU
         S5K8LEjz/aNPl81TOT0unjHoTzYvD7TbFi/8T50wy6D3s3qV4spaNnnCfZbe9ZsLZMHE
         y0z6n2T5bbabxQSW2/GkQi4Tj2wcvP1i7QPhLUrBT1b/nJnU8SA+TwDNDs7GQJdJgSWl
         KKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707390672; x=1707995472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkltV/LKNYv+rODcoWYZtA6BeNijF5We+gSy0yOyWBU=;
        b=tFcfM5BWZy7YYC6GXFHkV/UqqYGImtkakdZo89DudBGTfpPN5XKBUdKQJzi6LVabYO
         inxAumXRSmhnA+9y28mEkye9tfXi7C9UYMfSd7x5yIDI57XO0evUzHhjpWnMoc3h78n5
         Ezzp0BJ1mYjkVrja1wR6jKL1dITJ3bD+znuChn6y+QOB+D72FlVaw4fAv3sV69+vL+GG
         wRWBkVWU5mM3mPGO0+WRWOm1oIV6zzlxJAaSvH/ydFmdfkqvEc9qHfe2spXRJTQJQd6a
         4g8VHa3UZ0vEIoZbIAWgfB8M2tmnRGn+C3s2FxfqLbkf/mU1cL8ZXHIjMTXW9XYiGVPR
         Af8w==
X-Forwarded-Encrypted: i=1; AJvYcCUx1cypHHrCAAs2dqXoNHGlKBPbiCzTANgPnwWuIuqaxkwWG0dYa33pBVgVq660+skKMkis67ui5BgM9dIHpaUKZNztPbGnx6nm1nh87/j3
X-Gm-Message-State: AOJu0YxCHSiVtp8jF7QHJBSnNbNhXLxZ66m8ZIaTTEFBFFJGsIWbmtCg
	G7WOLGZ6wZiVDdmmfqzOXes84NbxmSCDXRlM+xjfTtk2yUaM05YW
X-Google-Smtp-Source: AGHT+IExNxDbHcLYVVbVySRZGWORe981ejf9nZ3Tj95iByf6mv66AIx7CnDeMVaPXJhy3hlNtRREeQ==
X-Received: by 2002:a17:907:3c25:b0:a38:551d:ff1d with SMTP id gh37-20020a1709073c2500b00a38551dff1dmr3401759ejc.73.1707390671390;
        Thu, 08 Feb 2024 03:11:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXIhbezgSq5pUviM5QD+tULi2vsu2weRt7MQTg2TgJ07ngjjOJj2myeyRzken1n6fgRGqMxQuVSeWNVHbvNA4qZZkJP5O/4hMsxgB3XpN2KCcAWtD9lcTad4awznh3Xqt4ONHoYS0rDhhPaxkfjDiiDtEjZtJVj2CtihTCLpzRmfVIwJYZPl7WpZhDlfR4tsHMLVdSNVcnWuFOCxTgg7hsLE65KG1isAtpZkVVBw8unjAL3e0K2ZBE6MU/ACqLVDp9MJ10rD+ULDsaXUi0r88hfdVl4+MPZCZMXUtgMDpG3zYs0JbxO8oRf0FWuPoswdq6Xipmo3r/7f3fty7VT9jFncxgKRCGYlVTNWqsLzFZlqzk1m7G5xn7DvAfMZmhu1FmODnVJilkxhvhZq3mUJowBW2sLJXHWDXoe+P8J7ETFz6l+4D1sZOk+3Gyi8950ePUVEV3muF5wNZ0nVvgPIZJTq6pNIS5Reyzk56V/fUsBNWxlXHrpiNf45bCeS2F6QIw0wEAmqYE2TFq8d/7yvclqvlqSXL76FGWOHf2jpRCxk6d4meLQyMLl6aLrjST2FHAm9eJHC/TsIAU4pih45hZhIXSxV2I0NvzIJeZXJucnMk3nC1Kgbc1DlZDiZXo1LVZJyBvYLsotP8OqKxUWPUT+9hlgDYhZXV0G507luAa45djJWzzzRpzos8L9XpBjyIoEI/8twbxUL0XnKTyvp2mOEpDO0N32RHTH302/hDy8QTwvDaeSBCdfW2JM5+AHWONdNoT9spayByfZYKzpxUGVeqlqHZQZMImktsG2ZR8Tir1C5H1Y/Ef26R4Hpg==
Received: from andrea ([31.189.46.254])
        by smtp.gmail.com with ESMTPSA id oz14-20020a170906cd0e00b00a38620c3b3dsm1777453ejb.198.2024.02.08.03.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 03:11:10 -0800 (PST)
Date: Thu, 8 Feb 2024 12:10:52 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Christoph Muellner <christoph.muellner@vrull.eu>,
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Will Deacon <will@kernel.org>, Daniel Lustig <dlustig@nvidia.com>,
	Brendan Sweeney <turtwig@utexas.edu>,
	Hans Boehm <hboehm@google.com>, Andrew Waterman <andrew@sifive.com>
Subject: Re: [RFC PATCH 0/5] RISC-V: Add dynamic TSO support
Message-ID: <ZcS2vDZjQzDARefn@andrea>
References: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
 <20231124101519.GP3818@noisy.programming.kicks-ass.net>
 <59da3e41-abb3-405a-8f98-c74bdf26935b@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <59da3e41-abb3-405a-8f98-c74bdf26935b@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_031113_600039_013D19E5 
X-CRM114-Status: GOOD (  12.58  )
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

On Fri, Nov 24, 2023 at 12:04:09PM +0100, Jonas Oberhauser wrote:
> Unfortunately, at least last time I checked RISC-V still hadn't gotten such
> instructions.
> What they have is the *semantics* of the instructions, but no actual opcodes
> to encode them.
> I argued for them in the RISC-V memory group, but it was considered to be
> outside the scope of that group.

(Sorry for the late, late reply; just recalled this thread...)

That's right.  AFAICT, the discussion about the native load-acquire
and store-release instructions was revived somewhere last year within
the RVI community, culminating in the so called Zalasr-proposal [1];
Brendan, Hans and Andrew (+ Cc) might be able to provide more up-to-
date information about the status/plans for that proposal.

(Remark that RISC-V did introduce LR/SCs and AMOs instructions with
acquire/release semantics separately, cf. the so called A-extension.)

  Andrea

[1] https://github.com/mehnadnerd/riscv-zalasr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
