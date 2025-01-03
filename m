Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B26CE77188
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jan 2025 19:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iDeg3r1gIYjoOxZABUQbNaYg5Prhb43HvbY3TJ0oJLE=; b=ht/N1CdZ2GJ7eq
	CGStM8vUUxDR3zhUL4xcMLh0Oz0/Ma74qfzZTCZZBhAleYIGmoDyhzDZxMZKCSLaxyf+qoKPHxF6Y
	MOyJAuesJrACxb7wlA6huUh7hSA9CLp05fXceqK6HAKcIwyHCDqNoRonGlPjwYGOVF6TdfC7iXcfn
	bNtAexxBslPQK4QVMG3hSc7jRpz6In4pMaVyfIC0g4n/8VRc2dvmI01ybnfUQG5YaHuGn6tjbLlZS
	sDttGNamQlKvNbHSRYBznkQaAUKrj4QzEa35reAZlqVEfP3JpRkyRrLGPp6iCkB/YJJy0D69snHl1
	W/tZTlzhoWL1zkLJ+QBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTn8s-0000000DoR4-1Lkj;
	Fri, 03 Jan 2025 19:15:30 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTn8o-0000000DoQE-3W5v
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jan 2025 19:15:29 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2166022c5caso154966235ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jan 2025 11:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1735931725; x=1736536525; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ADhotle/1TQemJtHksRH5tzPPxcFcmn+moP8E9RHhKE=;
        b=IL7PZbk60risFw4qZN7vpZJ2eNft1IGvlzIU77IrSF2sk8+UIvKGrTeCB25lZegODK
         ttAVGYl/SewcFK9MeDDiYD7nrXfdMCrbCnRd+jZqAY80FAATbM676B6BzU9SGXt9Y7/7
         N4uEi1zCL242nce9eAVKPKD+HA0vXhCNVvRxnVSfXGZ5KOwkCD8fKjpHfgPdJW0ChFvE
         JIg69EQ/6K94C3T5gc0E+lq6TP6DsOWIdrQVfjQuGCISfOmbt2f5QF6T2bYbMIKC4lEB
         B1TcYlbpaoYwo50FPrnkT0bIBZZqxWK//imO/0sRTosRlxzlOcgsR0Gc9jskeTSruM6Z
         NnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735931725; x=1736536525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADhotle/1TQemJtHksRH5tzPPxcFcmn+moP8E9RHhKE=;
        b=cyicBpUkI5UHEjFNVG+MqrGCy0Yn8vK8Dpq1eOGsma8WA44i7NQYM8TzYOyEuS7jlo
         12W+832f51jJx+Aw9lPhvBeF2/xX9MJEYKQgEhvSFhYZOC+ptQf1aNgDgzqRTwMwEJM6
         moNkw7y5AAfvQulWjB/y4CcvqyZuaJ1VpuOEtJI0Nu6FUBMyiX2GOzELJISeRxrPiDAE
         srqpH4Hb1zUiyfhfFVdah7D34iAeHFD7wKUdoC24f72ziBRw2iewwjPiSnhCukg5GUdJ
         gaI1O9ynxBm6Zbp4o9OHq7Cj1UD+cErYSTdDyH3qWGWzUU/SkDg2Yig3UeEN7oM9bJow
         9wkg==
X-Forwarded-Encrypted: i=1; AJvYcCX2iuflPzfl6bfwWKu66BvuzDymuhEXk/qEtDTvc9lnn/umPgufgVyHgdzpZaV1yfQrxXd3XtSCo3TmBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVmeZGBI9u7151Us/ZswHEmrXyPeeIvq4DO/7AxOxM+puRl9e0
	dtQ5ePujHWbom+NlSNB+6fO+TjBLlIOs4cQnEi93lsWmQkdCLpFWjyMknFrV4zU=
X-Gm-Gg: ASbGncuYXNEbPs/idf8TAQTOi53RCElATwipHI0RGAdYUM+ASZMwk8zhNDy4rtUtMEu
	KrVLK5oNlpELra1afI7H8jF/S2MVM9qssY6qOwILZqsaQ3WYH4+/j/EC60pvf8v2h4CtakWPGN2
	LJrUzV4hK49TX20WZiakbXTHNOEKp5QUg9F0t54Tt4blWA4scIIuAUvl5UFJH3iMDUDrMExm+P+
	sOpPPjKDFV97TEii+asI/AOjh9TozsbABHudGX4YvSZi4wd68w=
X-Google-Smtp-Source: AGHT+IHaGUpdPP/4NVVkV9pM3dpsY14vT8nNjSq+/lATASDlWQ+Up7g3TCX6COowkeiTogzmOyYEVw==
X-Received: by 2002:a05:6a21:9007:b0:1e0:c954:ea7c with SMTP id adf61e73a8af0-1e5e049a0b9mr71239375637.27.1735931725624;
        Fri, 03 Jan 2025 11:15:25 -0800 (PST)
Received: from ghost ([2600:1010:b0be:4797:42a0:3cad:ff5:6bb5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dba99sm26335019b3a.92.2025.01.03.11.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 11:15:24 -0800 (PST)
Date: Fri, 3 Jan 2025 11:15:22 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] tools: perf: tests: Fix code reading for riscv
Message-ID: <Z3g3SrBwQcXWdbRr@ghost>
References: <Z2IXl5cuKQJInJb0@ghost>
 <Z2MXXFhUzoQmW4xV@x1>
 <CAP-5=fXPPfHHVPh0nYgR96VM+smuZKepO+GoE4X+aZsQE4tHSw@mail.gmail.com>
 <Z2M4ZparbNRvRHpz@ghost>
 <CAP-5=fXL6YaEq1cvBh2iESmQ_kqfm5VH5thJ0zrkOCcaWv5s+Q@mail.gmail.com>
 <Z2NNcy1jCLqb62h2@ghost>
 <CAP-5=fUBcu=Kd7StJvwdM_ArnSdOjmAcgR7NzDd+Ep8LrNMhyw@mail.gmail.com>
 <Z2N8WLTmh0ojIzhF@ghost>
 <Z3dBGM5L41v0RlZf@ghost>
 <Z3gVrzFd_2cacOFD@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z3gVrzFd_2cacOFD@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_111527_083013_626116DE 
X-CRM114-Status: GOOD (  19.37  )
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

On Fri, Jan 03, 2025 at 01:51:59PM -0300, Arnaldo Carvalho de Melo wrote:
> On Thu, Jan 02, 2025 at 05:44:56PM -0800, Charlie Jenkins wrote:
> > On Wed, Dec 18, 2024 at 05:52:24PM -0800, Charlie Jenkins wrote:
> > > On Wed, Dec 18, 2024 at 05:20:15PM -0800, Ian Rogers wrote:
> > > Yeah I agree. This test case did end up being interesting though as it
> > > unconvered this change in behavior of objdump on riscv, but that's
> > > tangential to the purpose of this test case. We need this patch on riscv
> > > to stop this test from failing, but it is also reasonable to approach
> > > this differently and not use objdump at all.
>  
> > What's the next step here? Would you prefer to get rid of this test
> > entirely? I sent out a v3 that uses uname [1].
>  
> > Link
> > https://lore.kernel.org/lkml/20241219-perf_fix_riscv_obj_reading-v3-1-a7d644dcfa50@rivosinc.com/
> > [1]
> 
> I'm ok with this latest version and added it to perf-tools-next,
> changing the patch subject line to:
> 
>   perf tests code-reading: Handle change in objdump output from binutils >= 2.41 on riscv
> 
> Ok?

Yes that is perfect, thank you!

- Charlie

> 
> - Arnaldo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
