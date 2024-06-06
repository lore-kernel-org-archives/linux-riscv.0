Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610B0C25B75
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 09:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPBXrshrqWDOysvoMwaFwWZ46vhGlPtd/BPvd3PFUTw=; b=ZTEMqpQFG4xXZE
	by9lL94r7wxqf7czl9JXQPOm8uBF73TKcuLttZNN9jPHNbR5Bn87NTs29yLvZhnVnweJTdS8yQIP2
	LC9GnYn9NwaCkoIfeEcotPWFGjCpjKBlBWLNnLjxrY3Fblo1ASSx2VGt9kRH5nmWt2FTIyj4ObkjZ
	0ZfDGbrOLeluRRH0sdoiD5CM45rS+pYKbkXBElamaQSbShh3Dg5fHRjWSuLJukrlA+S+tNrgWMvVA
	HUe+V+N2CSWGNm0NeFC68kUBBhjUYkpsmantusN2gYrehSeGBbhTfbFw5RY7xUgRGwP9HXQdHCjy0
	055kNpCRNZOhInc/pNLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9n8-00000009Hdq-21AR;
	Thu, 06 Jun 2024 09:52:18 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9n5-00000009Hbl-0Jzl
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 09:52:16 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2eaccc0979eso9178441fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jun 2024 02:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717667531; x=1718272331; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzMInXZBrq08VfXm9EodIoLXJ2qNXwWHpR/vSZpB+as=;
        b=AWCKQERlyAivjloDyznsfVXUPfzEKvNzdaf/Q0mHq6faeJX+9EuA7FTwLrjgs01/ny
         aSo9rba9c1D1dqJLux6rdibNyX7xke9SN4yEbNTptsczImMD3Njfy6HN39Wed7U/HTq5
         +NonRH/egFBzNr7OAObzTyv5ogqxn/nzC/THZYMbggM+P5cgkJOqFNfKgwuUudbgxIHp
         6QVpfFJewP/r5d+u4LPkqI0Tt+XvtH2/Q3zSEJkP9cH8nMpEliJVKGXL8QdlE7LIqNQZ
         TJtU93gItpv6PpPNo27Qw6SVV+3sSSR6XH/wTryPyUJoGmYzPaBx3U23Y7ME5powZ58z
         Fd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717667531; x=1718272331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzMInXZBrq08VfXm9EodIoLXJ2qNXwWHpR/vSZpB+as=;
        b=ObGuXhQZDPup2Vtn6zWZy/y+xTDN22GQXV+Yy6SwYh84+585ArxmdSUxTge5pKDr+H
         u9Pt7fJ8aWXCWjYxFACUwzi4MCTG7nx5vh+RJBDozV7Hg+3uIXJ1Nt7oiVLUFFdr03yJ
         iUW/sB91yagONiTvcqwDlo0mpDYpai5vLLdP5uvCWcOk7ua9KoW8/8P8L/IeVSQsya82
         n7KFAvyEhZbamcs9BGBlxHPOnY+2IaH00X/cEq9P/gbQ9rGuxgwa2yThNG91dZHTpCf6
         siyags3JMteRjJ/1R5+q1mG9YHGxCz8Qu+kjfoNybSN1SiSSywNW1najO96ow2HgqWgv
         CvJA==
X-Forwarded-Encrypted: i=1; AJvYcCUVXaLYlSEb7qSeQ2Zf1ep4EB6oEWJng8e3yxfqoR7vYI1GXqbcEovuyI4M7OCrzRx116DZVW9cOyvSNkBO9yyg+UPDsaAWnO2PWrpHZ/u0
X-Gm-Message-State: AOJu0YyQo+k12IocI0Od/tuqpg4IfL6kPj2qy8vwTHPzRSPS685/zWwd
	q5iHhNWEq44ofeZe8GF3P2Y6LTgDa88q4xppntDjBrFUITzalZCh8Rtb9+k+SwDbJzH1gaGy3S4
	w7kZORr4XPeZ3ntlEMc00L7SeCEcULenT1xPUYg==
X-Google-Smtp-Source: AGHT+IGRjxg5JxSkcZ0TIa9nvKzj+6js95PShzriLgFiyIk8WZvSEOxoci54ygHxxx3XlK6Ngc3iCOMpgDTyPLdieC0=
X-Received: by 2002:a2e:9617:0:b0:2d8:3e60:b9c9 with SMTP id
 38308e7fff4ca-2eac7a82898mr28203101fa.33.1717667530690; Thu, 06 Jun 2024
 02:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240422080833.8745-1-liangshenlin@eswincomputing.com>
 <20240422080833.8745-3-liangshenlin@eswincomputing.com> <mvmr0das93i.fsf@suse.de>
In-Reply-To: <mvmr0das93i.fsf@suse.de>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 6 Jun 2024 15:21:59 +0530
Message-ID: <CAK9=C2Ug2gcS5Rbqc9EQ6mVwrJkoeLscOm6wtgqGKHdqEdSpSA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] perf kvm/riscv: Port perf kvm stat to RISC-V
To: Andreas Schwab <schwab@suse.de>
Cc: Shenlin Liang <liangshenlin@eswincomputing.com>, anup@brainfault.org, 
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	peterz@infradead.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_025215_213041_E7BBF5DE 
X-CRM114-Status: UNSURE (   6.10  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdW4gNiwgMjAyNCBhdCAzOjEw4oCvUE0gQW5kcmVhcyBTY2h3YWIgPHNjaHdhYkBz
dXNlLmRlPiB3cm90ZToKPgo+IE9uIEFwciAyMiAyMDI0LCBTaGVubGluIExpYW5nIHdyb3RlOgo+
Cj4gPiBcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKPgo+IFBsZWFzZSBmaXggdGhhdC4KCkZp
eGVkIGluIEtWTSBSSVNDLVYgcXVldWUuCgpUaGFua3MsCkFudXAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
