Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E96CA5FE6
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 21:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D36zcTSnsLzPPj1p7O8tgG1G/qRudZgog8anA8zB9JM=; b=amqCGtKrqmXQgM
	wQIysWQI30flKSpnrkfCHiMwhxsS2GkOOSp5shqcCrakFDJyoGoYZ76fGlQKEQs390igeXxfnXyht
	w3a04WRnPSrwARIUz3K+FxZW0IQVxojsvxvY53bZJEoQ3M0EDnMNiZLJsgq+X+Jt6EywRd5fKcjdL
	7ZG+fmfdq3QLQ46pJPLVN0aT6aF40QzU0OwhY9UEW1WidRjz4aUQliAQ08flkXBb8ZyY25mL6nJ+Y
	MNG+DAO3LlpD/qQr77w6vO7zpenh+5mEjSuAoTmjM+2J1R0vLIwV+we2db0SrpXzBRN9ZagvQgkA/
	ubfv04plKgaELWIlgpug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCl6b-0000000CYW1-1s7C;
	Fri, 02 Oct 2026 21:47:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCl6Y-0000000CYVW-1nVo
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 21:47:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790977664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G9GZFvY+OivcXtxJyc9Ua27iVVl5yXvMnk0Q8270BFo=;
	b=Wt2GedY0mNvaegwdUOefcjVptXLbWQ7C8t/y8yWlAUWeT60olCQYibcQsceSgTn2gCOMoB
	LPzyPRLOKUWg9cLJMHhhnovdWnGZcCxgVlMni7Bhg1w1iKUh3lGjTJUuOk5YzXEdfCvGU1
	/lQKTpxXLbeUvaj6ZzXR/nCbK6DFnRQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-CNzDSAL-N7WpGT5DONrUDA-1; Fri, 02 Oct 2026 17:47:43 -0400
X-MC-Unique: CNzDSAL-N7WpGT5DONrUDA-1
X-Mimecast-MFC-AGG-ID: CNzDSAL-N7WpGT5DONrUDA_1790977663
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc5f70c8dso2073585a.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 14:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790977663; x=1791582463;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G9GZFvY+OivcXtxJyc9Ua27iVVl5yXvMnk0Q8270BFo=;
        b=qkBgVA4MwXxFLktlKUsXcY2UGa1vPwT2g0JOcS3CasX0SytFB8Q4/hFwcjyJO9wXWp
         HDglDbZ3NUuGOFLyHPQ50e2tgp/eWm5YCcnP235EeIvEH7EeDXpj4IusHZvHmTdkn9Dq
         Sllcu6EiElAf8ekY3tk7FlO1uwI6/ctA+r504FNmLiLosXMSV6ntwwdQ0UPhkGsnelYw
         FZsFHw9hZukCbWpdxxoe6pyIa+j1RE1UKBO8UWFwqWeItbyMW8y5g7iBNxrm+m0hiIB9
         RoFobAgMEdI88snEfIj36b+X8yguvWmJDRSC173wKbz3KXleR4jIUXnTeFZiSz4bkvBP
         2dfQ==
X-Forwarded-Encrypted: i=1; AKwUvByAx6lPQ1J1SMBO17RTZrd0a/q9bSUTKzEHTtRj7MQ8qSClJ2pIf/QW3kkfA+ii5VMmv4HJWvB/roq1ug==@lists.infradead.org
X-Gm-Message-State: AFuF++n43KqcFYWLU79sBXR2j6W65UX4dSXJoPt3ka+Eh5BCWH6hL7SY
	NUa6fWMPreeO4tLpTp8rDCYRwdmh8B/2zEumjKvkHhilmdu37NVq90LUtm4Xcg78KWpA5wkVLBD
	Ia3i/RHdCbBMm5nIRAT3i53abdKPORPh1ha4rb+ivZkIhpofynJJQF2ProwehVo69Cw3wng==
X-Gm-Gg: AYBFou3KnAHH827DwVoicdiFNJAhq3cu/l4GvbDLlt+JNF1DjgAjDit3SST6zXhtgEf
	byRf7p/PXTyS3SbJESn6UPnEC2XUb/duBzpaMGBpbJOE9JCxOISr6iX+tYog1vxOwjYNlzIMc4Z
	zlyqd7OM9/ZudSAu1uVTxjiwUCF4MJG7Dx3W0NzrPFLVKObnBJbmc6WF3N5sQ4QYflvFZSxQqbr
	uXqpW9dsVaE24eh3NHWdNFEjLbFtrj6eLUQNrwX3CMC46l8agNOLUDP/QI1X3gC6q5ygYTrQQyp
	MU3g0KVwlsB5J/mVIXKqB84LAU2HGWwx40oG/Lxy9NMoYAENVDvSYqMFVXndu1U6XjUo/ikmAVc
	WanmUYQ==
X-Received: by 2002:a05:620a:700c:b0:939:fd0e:9fd7 with SMTP id af79cd13be357-93e510819ccmr112759785a.43.1790977662676;
        Fri, 02 Oct 2026 14:47:42 -0700 (PDT)
X-Received: by 2002:a05:620a:700c:b0:939:fd0e:9fd7 with SMTP id af79cd13be357-93e510819ccmr112754785a.43.1790977661924;
        Fri, 02 Oct 2026 14:47:41 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e4e96acebsm97276885a.21.2026.10.02.14.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 14:47:40 -0700 (PDT)
Date: Fri, 2 Oct 2026 17:47:38 -0400
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>, Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-hardening@vger.kernel.org, netdev@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 00/23] Add basic clocks and resets for JHB100 SoC
Message-ID: <asAmejPowNLKnmto@redhat.com>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
 <20260930-grafting-undertake-ff3e01060284@spud>
 <ar_4NBLHrq2W7_vc@redhat.com>
 <20261002-amigo-joyfully-6894bdfa17e3@spud>
 <20261002-doorbell-recycler-f386e3b8d5a4@spud>
MIME-Version: 1.0
In-Reply-To: <20261002-doorbell-recycler-f386e3b8d5a4@spud>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0wo3PONdmbMGPy-7RUKrLkzK8w9JtKZ2DZl_AEl1PcM_1790977663
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_144746_566565_78E33024 
X-CRM114-Status: GOOD (  18.94  )
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

Hi Conor,

On Fri, Oct 02, 2026 at 09:26:34PM +0100, Conor Dooley wrote:
> > btw, will you be at LPC or OSSEU?

Yes, I'll be at LPC. I'm giving a clk talk the second day, so you can
find me there if we don't cross paths before then.

> ... As I went about aligning more ducks, I recalled that the syscon/pll
> series also depends on some of the binding header files in this series.
> 
> I've made another tag with an additional binding that you'll need to
> apply the clock patches in this series:
> https://lore.kernel.org/all/20260828095608.19955-2-changhuang.liang@starfivetech.com/
> 
> This tag will actually appear in linux-next as of the next iteration,
> because the socinfo driver I will definitely submit as 7.4 material.
> 
> Thanks,
> Conor.
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ clk-starfive-jhb100-plus-soc-header
> 
> for you to fetch changes up to c4a545d3e428e9600d670fa8a08098b7bc82d5ec:
> 
>   dt-bindings: soc: starfive: Add StarFive JHB100 syscon modules (2026-10-02 21:17:31 +0100)
> 
> ----------------------------------------------------------------
> jhb100 clock binding + syscon binding shared tag
> 
> This is a second shared tag for the Starfive jhb100 clock bindings, between
> the riscv soc tree and clock tree.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> ----------------------------------------------------------------
> Changhuang Liang (8):
>       dt-bindings: clock: Add StarFive JHB100 System-0 clock and reset generator
>       dt-bindings: clock: Add StarFive JHB100 System-1 clock and reset generator
>       dt-bindings: clock: Add StarFive JHB100 System-2 clock and reset generator
>       dt-bindings: clock: Add StarFive JHB100 Peripheral-0 clock and reset generator
>       dt-bindings: clock: Add StarFive JHB100 Peripheral-1 clock and reset generator
>       dt-bindings: clock: Add StarFive JHB100 Peripheral-2 clock and reset generator
>       dt-bindings: clock: Add StarFive JHB100 Peripheral-3 clock and reset generator
>       dt-bindings: soc: starfive: Add StarFive JHB100 syscon modules

Pulled into clk-next.

Brian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
