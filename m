Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9508EFF4933
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 03:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUvk4zuzjxcer+UCAoZJMmVMdwQr1zPqVOXv0py5ZJg=; b=nGc/3ZDFjm6Yrz
	vn82iirQPZUyhbbDd4YmqTSxdSB507cmUtTcX0XXBVNKaNsEuVFTi8NH/T7+hbZev4vGDrmy1XgcA
	dmEvEj6f7r9L5kLUgdcqbvo4qWr/YSwb2XRWy1xp49biMjWB2JwU2D2sM5IWAZO8MjTTmETY5V2uT
	CaLvy1MPLXJHiDVbXJpvOeSSWRMBGukh9sapiLsNeuxMbiwlkfeD6/FpHZ7niWh0ijd1/wO/8H2K3
	ydqRfAmc63K1yB0/We4JAv1CVtIZRR9WX6+cfc2V0dHXTlbYTNvy7gK2Y1QeycSJ+Uc98gICkQbVJ
	rKqetb+bLgBrSiUw0d+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w72wR-0000000AXMF-3NKr;
	Mon, 30 Mar 2026 03:05:27 +0000
Received: from mail-yx1-f54.google.com ([74.125.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w72wO-0000000AXLu-3j74
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 03:05:26 +0000
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6501d242e2fso450808d50.3
        for <linux-riscv@lists.infradead.org>; Sun, 29 Mar 2026 20:05:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774839923; cv=none;
        d=google.com; s=arc-20240605;
        b=Niwgh2JABjmOn8PujFOSciVAldmgswiTVv7w+Q7dBi1/xjrUzpbFAQrBA0T9OZ4WlY
         iRTJxgKYUPkHQTjYkPbY54SQ62CIUvUCqhWCNjTVnbE7n2MnmQWh2/ln7cvp8kxqU+/S
         ZuqxkIwXfCdhJQvFGuUi3Cfw7rlpjYbvvJT99TcOMaGGgAWDQQt7ck2a3g7Ko5NotwnO
         Wr11KRnlv0dJsqF17goaTMqIj3h0ZtK3PmLHMC9q5N9eJpNIeWBoSUG99nQB9WlFQTTS
         2EcS76dABrUIwWusjymrM79MYlPiSf+pO8mqURAOpB8mjXtbt3pfIbdgCwCfN+KSNt6c
         n8Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=sPsXSUjsjV7W7yqtkBsmcY2XBve6nk7Scrtk/LYQYDM=;
        fh=El12ugreYeCPI4qtYYyPr/c1fMwz04AzbnPOa0Awn+E=;
        b=k72zoaLU69UZq3n/tBlMw2E8ot9FvlesZ3C/9myXqhXMGKaEGjAZH+e9tsBM16KRZh
         C2IJ0dtoZRPGmchkQ+JHMWqNpkBmNCee/PJaq0cpRzamBGFKF7Nl4Gtxya5NnhxGy9DX
         hXOhGMV8A1GZljuylAea0ReOMJG2rKxtR4CCoZ4Y4EqNIzlbVJUDEOqB4hBTdUs3CA03
         KEdaDkjxSWL+VLfzUi7jvlnSo9XCYggQxvoyrmq4Ywqpb//HC2iZdRlCJpMQKy/TtkD3
         3C7W50/hHjKUe84unP/VroEhd+Dyd5N4/JsJ7OvqkjKNLLg4o0fHFWnEZ0MS1NZHBpWX
         TryA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774839923; x=1775444723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPsXSUjsjV7W7yqtkBsmcY2XBve6nk7Scrtk/LYQYDM=;
        b=bz8xKWlxp9brkFfFEl76bOSTA6nXJIhkfoI0QBR0lg6fjUngVGepc77jb0qsaCQS2F
         O2db4nXNM/CTRiSC5wMzqZf00WXeJ1XYY4rGMrZINLLybria84nZkqKuGaTmNP3rBWqy
         Wc9eUQJbO8yO+xvmqg3iQE/IjNK2JqYva2dhBrKrkp1asITBR+AbODfvmD3ZhzhRmK57
         BtTEQqvmNKSQ7I3LjhCVJD+zcTAxylgHf2RaqjMOz3DcD7xxmv7C4CQND86GKUuRbJFH
         +Rpn2libBrvCtNAA9NuC06IlJrnMqouXOthJKAdFXG4HNel/F8Smf7GPU6wbfqT3huqk
         a9JA==
X-Forwarded-Encrypted: i=1; AJvYcCVSDJ+9BIInjqC77/9fgs6y4o3zLZLkrIPUwMeU+aHL+KULg7FhDQys14YZEjPT+seFcEtA1jVcKnSuPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxaWPuvc3wE8PcLOlPVIZO+uaSShIeXuAUtSW5Qq9KrrJ0Ro7Y
	jdBcEezrfvAM4dCFB9EmDaPfshMKEOr9Zci7c44DG9lwpxlAuO1G0r3RxurgmgRwSYq2+U9aWD+
	5+K6jnP1fgreizliLu9URc92qu+/3OM8=
X-Gm-Gg: ATEYQzwMqiY97rzf+3FidrbMbw/7Xnr6e0Jwf+lXnlnN3HlidzgZCkEjqNetXIH4JLR
	D827idgtwG6Uv4NatFolM8AjkAopFee43RtM+kdaF9CT86OHVBLaCjYbKkH3/aI975QKY2yJSdd
	PvN/ZYaWJzEQK1uHKkD10O+/6d1IDNQR3oo9hHhE7c4k/b6uwh/oQmgFEeKtmjm0O7Mmi5v1THg
	m6Vszdr2vm3W58YvOoDXcKMac4GvDml6juXkzsZrjj3cf2LB/vyNrfeaYIatgf6cNhfpIugOvUB
	xWuQ/Gk7
X-Received: by 2002:a05:690e:d83:b0:64e:a737:e1a5 with SMTP id
 956f58d0204a3-64ff73cb41fmr10181399d50.42.1774839923389; Sun, 29 Mar 2026
 20:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260330024248.449292-1-mikey@neuling.org>
In-Reply-To: <20260330024248.449292-1-mikey@neuling.org>
From: Michael Neuling <mikey@neuling.org>
Date: Mon, 30 Mar 2026 14:05:12 +1100
X-Gm-Features: AQROBzDXur7oyb9I7pm-PX9o8ThE2iB2oR0ykNUeayxIBvngSwEauLqbUwzhrIw
Message-ID: <CAEjGV6xjBOfCUfuG5f7cJBFsdEVA3=X-dFT3Y6Ov6nkyabo8+g@mail.gmail.com>
Subject: Re: [PATCH] riscv: ptrace: avoid BIT() in UAPI header
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: alex@ghiti.fr, debug@rivosinc.com, thecharlesjenkins@gmail.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_200524_992341_CD030264 
X-CRM114-Status: UNSURE (   7.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Paul,

> Fixes: 98545620b0 ("riscv: ptrace: Fix BIT() compilation issues")

This is fixing a patch in queued in the for-next branch. So this could be taken
on top of that patch or merged with that patch to avoid the issue to start with
but that would need for-next to be rebased.

Mikey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
