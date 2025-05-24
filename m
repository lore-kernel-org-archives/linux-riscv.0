Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2444C54ED1
	for <linux-riscv@archiver.kernel.org>; Sat, 24 May 2025 01:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BTPKJc4FCXbdcpABjtNbSW8E1QzJJvZ3PHK2GAY39ss=; b=S1CtsYSlL0aQ6e
	yJ2uikJ0hM8AeFxL3p/od2Uduo5nq8lBjHzAVJR+rsR9LED/iIMvH7nCJ8BeJeEmJp7la+9hwNTfD
	iyD3Ddqgh+tAl/izzFyHPczfZi+hTBCxYrvUs7genQOPSIjZXrM0mXDQk9CW4ueMc5TBJVMYudDWD
	RCN773mK8u3IMIflcfX9c/iHEJQACGoWocGYVstrJY85+ySwWgueq67Uzo8V/x1rU1A6JiU1eDIJ5
	aM+ghS7A+DTByENHqFdBURO2lE4P5HnJPB5zfzppf7iai0UIS/iWfRdlZkgId+au+LnMmKMS1Bh5F
	r0ErEm2EVe2ydxZ90Y3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIdeB-00000005AEX-4AtD;
	Sat, 24 May 2025 01:25:59 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIde8-00000005ADP-3mfI
	for linux-riscv@lists.infradead.org;
	Sat, 24 May 2025 01:25:58 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso472853b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 18:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1748049955; x=1748654755; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gsJDbHj9dierw4BMguGhVwoJuBKXsLDgRKWknpTgP/w=;
        b=eQww6B99Dpxl100Do1nNZ0RLLvX222TBm5FCG8pqiQ7KRV/EJhyTOgLS8PiLxyx0Ie
         oNRhd6CvoYLNWTwbMUjH+ObuOufjOfEJozMLCfwqrBUU8obPhQVEsLuFG9XNv7K9tLuz
         lrHf82mYRb7feOLhMDwrsURSZEI4xy8NnhMADBSHVq4CTvkevFtTVu0vhP4VutD+CQ/W
         A3ppwr5Hq9lcBtSIl0hKzj0ae6sEIF6HaLJNwQCHs8vOm3DY3mSvpFPL/zV7ydr+T7VT
         E81BQAtD0+9E0boXJVDFNzP3h/RphwQl1MOuKS0EeyTGJZk1eUUozVBWg/a1IqMHOv1U
         LaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748049955; x=1748654755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsJDbHj9dierw4BMguGhVwoJuBKXsLDgRKWknpTgP/w=;
        b=f3bKkiYMHTcwO31x+8rmrJExdGX7Sujigy+/EcjM2clinG/AB8/InwpeU3aSV/auG2
         PUAV0UFyhZV1gWy5/LwJx3UOT0qwIFrJ/8kO5PQb3T9wfj6A1bIwZs+Lsec2wlDBB1P7
         NtB4KuC9Zh41xLpSeDRWa/XP8P5voFJZgwDWq30Tt/nKkSPZrkBeNxcWt6vII57rAvgy
         MZ03sDWmetJTvvOTps4Cuuke28Bsn6jFjmeyymdf+o/+bEP39swufeBSe8LOcx/Sqa9L
         s+J9zJP7lOawUVZHgN90MyZB5nqJDKcdwjuvrqyCzYVBKbTRGENM/DMUHMicxvKzo0YA
         rZrA==
X-Forwarded-Encrypted: i=1; AJvYcCU69u+OXEQFIVzy3tbIZ4o3ramIEa34WlYNmf9HvF88eO6kDPt64NIjqhvdkLclh++v4VCeF7Zi4E4qHg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2fhwO0l69tN5XhFdxhniaG+baSAh7j0rQ0juh0R7ozgqSfbY+
	6qGA0k1QkFtsi3riIwYXGLfAQdZOzClkCn8rMtbEsKwnUQJY2Qp0ZTAc1XUB5z95S3c=
X-Gm-Gg: ASbGnct6SVYtAKWx69KGMfFRQirau+nP0iQz9aq8sa0Ur3vvA4TQLmCkCvBlxbDM5b0
	qcuKFloAXt5EtDIOmq8itnqN/SZkXChgZUwx0C7dli1i9v8ximZ0LYrT6MVNcHJbFNJq+mpL4yd
	yOP6swuC7miYnvbn4c8bECpo3SrJ7+HX3KfK/41cAEtPqbYm4WBOIo56ZqcTqzYefKD/EOzBW52
	Q5Bi3XGyB51D4Oh92OAHL9KUZdtFHqTwNP/vsZxDdK84Gd3ZGQrvlwrDdGsUKcXDLFRDpEDkqe6
	+mOE5Qe0wXUJV9RKI6LgtvfSTVFWdU+zapRDKWMitjACmdGC2lDYf1+zOw0TKlg=
X-Google-Smtp-Source: AGHT+IEOGeOW+PhuQhUWHpeQcMcmiGpwG3vk6rjPFlkV6C76xF/ii0bBJjaE1/tPG81FTngDhnjmmA==
X-Received: by 2002:a05:6a21:1089:b0:216:6060:971d with SMTP id adf61e73a8af0-2188c3b49bemr2223604637.37.1748049955462;
        Fri, 23 May 2025 18:25:55 -0700 (PDT)
Received: from x1 (97-120-251-212.ptld.qwest.net. [97.120.251.212])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2c208eeeeasm195364a12.13.2025.05.23.18.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 18:25:55 -0700 (PDT)
Date: Fri, 23 May 2025 18:25:53 -0700
From: Drew Fustini <drew@pdp7.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [GIT PULL] clk: thead: Updates for v6.16
Message-ID: <aDEgIfYl2f7zcO3O@x1>
References: <aBus+Yc7kf/H2HE5@x1>
 <018214f410632eb3dc6c6bd6ab58cba1@kernel.org>
 <aC+mJ560HbscG38R@x1>
 <655ea20d-ed2a-4727-b7c1-65fd69d3c027@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <655ea20d-ed2a-4727-b7c1-65fd69d3c027@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_182557_072112_849E0667 
X-CRM114-Status: GOOD (  14.07  )
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

On Fri, May 23, 2025 at 08:25:38AM +0200, Krzysztof Kozlowski wrote:
> On 23/05/2025 00:33, Drew Fustini wrote:
> > On Thu, May 22, 2025 at 03:24:02PM -0700, Stephen Boyd wrote:
> >> Quoting Drew Fustini (2025-05-07 11:56:57)
> >>> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> >>>
> >>>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>   git@github.com:pdp7/linux.git tags/thead-clk-for-v6.16
> >>
> >> I changed this to https://github.com/pdp7/linux.git but please fix it
> >> next time.
> > 
> > Sorry about that. I'll use https in the future.
> This should be kernel.org. I remember Drew we meet few times and you
> never asked for signing your key. Just get in touch next time on a
> conference to get it signed (and bring printed fingerprints).

Good idea. I would like to get kernel.org setup. The Portland kernel
meetup is next week so hopefully I can get some signatures. And I would
definitely appreciate your signature at the next conference we are both
at - maybe ELC Europe?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
