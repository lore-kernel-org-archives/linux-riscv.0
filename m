Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128E7C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jan 2022 19:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mqd88QR35eudJXxnybicvkJSBTHqXM4+Bqs5IVNrHxw=; b=Pgvl1w/XhVxQpH
	Qq2tmde9oIcH8vKnKCqGbrjC6bYq97VI4BWme0K7ZaFQgJfM1GcamuZRS3mYZd51QQVv98IHSzMlq
	E9UNdcoNp7CuC0KYdl8HhKyubvFtXwn+J1ljehdYBlJGw9aPOuHk1rPrgYWrHvYgNxd/AYkV5fSU/
	7BYzbUtCwvl9z2mpdw7S2IBL2WHYJPilHmHsSr6rNJpixhC3SEErog6Wdq1SadiTMhHrrG7gKSilT
	nizPB/CUhvmASjcW1y+hh0Zgq39V6+6MozMZ7JlfVxPgMEPngFubeIsIzEKR6aGryT/Tkvjv6yOgo
	G7xmEBPasum85XHnifaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7MNH-00HMQy-Ut; Tue, 11 Jan 2022 19:00:04 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7MNF-00HMP5-2s
 for linux-riscv@lists.infradead.org; Tue, 11 Jan 2022 19:00:02 +0000
Received: by mail-yb1-xb35.google.com with SMTP id p187so7573514ybc.0
 for <linux-riscv@lists.infradead.org>; Tue, 11 Jan 2022 11:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6mcjefM06R1tkqX7tpt74UGpOHh5gM914x34vbidQ7U=;
 b=F+gorQ0yIwFh7cUVtQjrmOBwbnBDGysGw8+cdmXVa10toj/WPbDIRBPkFkFUNYvaU2
 R26V6akf1digOv3c6ALWePu834Rjw5UmY9eF0bNp2xiNcNT170xPRYfTwSwMfM09wQAP
 eJdid4xGZJZcoPD+hlEiKMitr3f6p3h7MILz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6mcjefM06R1tkqX7tpt74UGpOHh5gM914x34vbidQ7U=;
 b=fdmKCCR0ogTfxK9cz6Tplo1S8UVLxUdB8bBvQMjy6oVUjh0pJoFhzYjHT8lSJqJvqw
 m6NzghgAI3ut/rKZhjdXKvRzKpn1Rbq8V8g3gSHGdm8Yh91J2mAHsltFpE0Wzpe0+XKQ
 TKXInD4+wbswyb0z6QXZfe3N34ejxphbvJZxgw+2fiDZ8DC2fPoQAO479WPXIJyFBMe+
 sCy6HXG43xL3dqLAaqAHMtFZfHMCPu8VRkEA8BbACBTB0twKLJR3TT53qH3RlTMZSgjP
 Gg8rvcqD1zy8jC1Arfk3W2RZ/uY9yPX8g/JNjyJ0OgPNiAtaebKnWXOxDfGtOjbk8+Ar
 mDpA==
X-Gm-Message-State: AOAM53126t4ywl5+pmsMnJIMVaVSm7syCAN+wFHWqLK2+Do/2Ctfp1aO
 T7Gh3mEtxFsl28j8Bhr8tcNc0BoZhccWSVnXQJlh
X-Google-Smtp-Source: ABdhPJw9jESqQRPziTwI+V57RAwCz2GR3tx8f8YYGG8jsyMcn7fb2lG4mMTjKh7uAkvhExbUbAkL2EbhFloRRVNtt4c=
X-Received: by 2002:a25:3890:: with SMTP id f138mr7506325yba.703.1641927593840; 
 Tue, 11 Jan 2022 10:59:53 -0800 (PST)
MIME-Version: 1.0
References: <20220111142054.18733-1-nikita.shubin@maquefel.me>
 <20220111142054.18733-2-nikita.shubin@maquefel.me>
 <4b655bf8-ce56-ffe6-78b6-1f949b8df11f@linux.intel.com>
In-Reply-To: <4b655bf8-ce56-ffe6-78b6-1f949b8df11f@linux.intel.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 11 Jan 2022 10:59:43 -0800
Message-ID: <CAOnJCUKVGZ=ixXJb3d--JKA8DqSvHq4bnV9A1z4YPiQzDjzXHQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] perf tools: Add 'm' event modifier for counting
 machine
To: Andi Kleen <ak@linux.intel.com>
Cc: Nikita Shubin <nikita.shubin@maquefel.me>,
 Atish Patra <atishp@rivosinc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux <linux@yadro.com>, 
 Nikita Shubin <n.shubin@yadro.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, 
 Namhyung Kim <namhyung@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>,
 Jin Yao <yao.jin@linux.intel.com>, Ian Rogers <irogers@google.com>, 
 John Garry <john.garry@huawei.com>, Riccardo Mancini <rickyman7@gmail.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, Song Liu <song@kernel.org>,
 linux-perf-users@vger.kernel.org, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_110001_152355_4F11ED14 
X-CRM114-Status: GOOD (  13.18  )
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

On Tue, Jan 11, 2022 at 10:53 AM Andi Kleen <ak@linux.intel.com> wrote:
>
>
> >
> >    u - user-space counting
> >    k - kernel counting
> > + m - machine counting
>
>
> You really need to explain what "machine counting" actually is, as well
> that is likely irrelevant for most CPUs.
>

Ideally, this should firmware counting instead of "machine counting"
which is a RISC-V specific terminology
(Machine mode is highest privilege mode similar to EL3 in ARM where
the firmware runs)

> I also didn't see that anywhere in the commit logs.
>
> -Andi
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
