Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D80AC52D71
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 15:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbg4fA0tSjWqCmHpCktAtjiEfut+s4y2csxIVivIW8g=; b=G/Xpb2S13Gy0aA
	TFHh6OoEdN2WEHl/CaiJOATt3IECDWYEYCBsXPRzfy/xtDhwjh7sadkLG7AYHadMqdb5wB4oZTuMR
	rjD1DzUzqsM1In5kv6K7hDDA08OcwrD0rgwm9CgM1Ykrhfwf8uCerUkcnCedgBOe/zZoqr8O49CrW
	2JkmJ7Bddam/8jPrCXi73Cf1WJdvi9mH5kAC5QPwBosw4Z89uSp9AVaMU0R/hsEmUvQ0RlqvbvaTK
	4Nk94E0adlp+ejaydGcjBY1sNkaIojkNvXbp3cThJh74d6BSNE+vsegc5fPruV4Uj5tgOvEltxw+a
	e2bJqJZtykXUvqgP/mFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbMSq-00000002Efh-20xj;
	Tue, 06 Aug 2024 15:51:08 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbMRz-00000002ETc-22D3
	for linux-riscv@lists.infradead.org;
	Tue, 06 Aug 2024 15:50:18 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2f029e9c9cfso12337611fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Aug 2024 08:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1722959413; x=1723564213; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8F/sdfwOgYrozXSYzhW6xlVGWL5FX8sCck7YmA7e/mo=;
        b=aprYkklSG1GeOgS+Y1Re+7dj1VK8SAAwvC9CBu9XNZVctGb7igvbnnZzf1yy357jck
         9BTLCK8Jga+76Ca0qIWNPN6V3EbiKn6aKFA3naCDQoRUZd40D18JLiWEz4SYpStc/8rZ
         F2frOfxDQgQrAL7flLFql9QgGpuocSashWAtiCGam9u23WADByJ6VXGsLPdnVoyhA7zB
         DeGDvtbA20LWp11uLRr7jlWzmXnYGYgGL60oqTOj7wL6aHX/GoUsqaJIiXKEd2xbnK2T
         tYc7NiHMoWDZ3q/MDeKSjQgWLyjIdgsDO8claVVAm7GFceijDIWv8lpfnIlG24JjWfif
         YFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722959413; x=1723564213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8F/sdfwOgYrozXSYzhW6xlVGWL5FX8sCck7YmA7e/mo=;
        b=Uul52t2H2EeI0CbnQDXu0/vyjwDuRmm2hxSt6+CZZ8zhcWh/A4898GJ/EJRz5M3eql
         vjNb7gAkR4vPWUnyocNuM4PtHW+5qRYH44HCz2rdGD9mPebuhTr4yf6ByhpNkgyd97xS
         Ud4BnWoQmDbyk4Oj6u7GZhnmYbcdn2dk5h8cMgD8JFxRSWFWuZz//qUzZs7MC/+fSNdZ
         nsJvAr+an44gmT3WNQbGAgQhg1a6tZu16neeKwfou43/Z1ZTcY1cmnCbHE62q27UeohH
         VJOr8OUqF57XcOz8nbyQ1uqziDaK+iGjmj9ZXLciQCUAIWxeq+qztbSn4wGxMjbdoUa5
         7veg==
X-Forwarded-Encrypted: i=1; AJvYcCXJyiWnYH2g+shPFOW3Kaxbcf0pVpCif21myM1itNA0sthtcwGabodeyTeSX4JiUKiWS6h/EVEDj+rSoA42C3rU3gO8WoQZ5d+AH10WLha3
X-Gm-Message-State: AOJu0Yz5mw7ebzeVbI8XaK0v47Fbh1OvgEl+4D4lsXKVywp8Cag+1ld9
	iPUGUwMsTHjDJeM45ivZquuugsQ+e2wg/PQilPDe7LOPvaGydfpH6GtGC3F1D2jPrXcgYp1uOeb
	1iEnv/WNjshG1/54TN9fcqRq8V/5qnvlxmg3/2A==
X-Google-Smtp-Source: AGHT+IEKRNQL6v8yZxwZiugCHsLJCc91BgG6XIW8t6WKvKDPtqvKAcvwQ3Mf0Z6iVsyMeVqV3TUGbDZ5W+id3C9qS34=
X-Received: by 2002:a2e:9ed3:0:b0:2ef:17ee:62a2 with SMTP id
 38308e7fff4ca-2f15aaab018mr133316761fa.14.1722959412812; Tue, 06 Aug 2024
 08:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240805194424.597244-1-irogers@google.com> <20240805194424.597244-4-irogers@google.com>
 <CAPqJEFpiy307B4OBHK4WJGjgbVm_woUrdZ+Vy_LSdQ=ECqZX-Q@mail.gmail.com>
 <CAP-5=fWDmdAkJSoncedZTaSgFwG+p3--jywDj9krnXSfkhh6dQ@mail.gmail.com>
 <ZrInOywRKzRmjtKF@x1> <ZrIqR07cYJnhcTq8@x1>
In-Reply-To: <ZrIqR07cYJnhcTq8@x1>
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 6 Aug 2024 23:50:01 +0800
Message-ID: <CAPqJEFoFfCG0_fqkVqakUK7CWs_8WREpmAd+f3H26UasGRPz2Q@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] perf pmu-events: Remove duplicated riscv firmware event
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, Charles Ci-Jyun Wu <dminus@andestech.com>, 
	Locus Wei-Han Chen <locus84@andestech.com>, Atish Patra <atishp@rivosinc.com>, 
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Jing Zhang <renyu.zj@linux.alibaba.com>, Xu Yang <xu.yang_2@nxp.com>, 
	Sandipan Das <sandipan.das@amd.com>, Guilherme Amadio <amadio@gentoo.org>, 
	Changbin Du <changbin.du@huawei.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, vincent.chen@sifive.com, 
	greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_085016_211650_86977459 
X-CRM114-Status: GOOD (  18.32  )
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

SGkgQXJuYWxkbywKCk9uIFR1ZSwgQXVnIDYsIDIwMjQgYXQgOTo1MeKAr1BNIEFybmFsZG8gQ2Fy
dmFsaG8gZGUgTWVsbyA8YWNtZUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXVnIDA2
LCAyMDI0IGF0IDEwOjM4OjA3QU0gLTAzMDAsIEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbyB3cm90
ZToKPiA+IE9uIE1vbiwgQXVnIDA1LCAyMDI0IGF0IDA5OjA1OjI2UE0gLTA3MDAsIElhbiBSb2dl
cnMgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgQXVnIDUsIDIwMjQgYXQgODo1NOKAr1BNIEVyaWMgTGlu
IDxlcmljLmxpbkBzaWZpdmUuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEhpIElhbiwKPiA+
ID4gPgo+ID4gPiA+IEkndmUgc2VudCBhIHBhdGNoIHRvIGZpeCBpdCBhbmQgdGhlIHBhdGNoIGFs
cmVhZHkgbWVyZ2VkLiBUaGFua3MuCj4KPiBBbHNvLCBhbHJlYWR5IG1lcmdlZCB3aGVyZT8gVXBz
dHJlYW0/IEluIHRoZSByaXNjdiBrZXJuZWwgdHJlZT8gd2hlcmU/Cj4KClRoZSBwYXRjaCBhbHJl
YWR5IG1lcmdlZCB0byBMaW51eCB1cHN0cmVhbToKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9NjNiYTVi
MGZiNGY1NGRiMjU2ZWM0M2IzMDYyYjI2MDZiMzgzMDU1ZAoKVGhhbmtzLgoKQmVzdCByZWdhcmRz
LApFcmljIExpbgoKPiAtIEFybmFsZG8KPgo+ID4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDI0MDcxOTExNTAxOC4yNzM1Ni0xLWVyaWMubGluQHNpZml2ZS5jb20vCj4gPiA+Cj4g
PiA+IEhpIEVyaWMvQXJuYWxkbywKPiA+ID4KPiA+ID4gUmlnaHQsIEkgYWxyZWFkeSBjb21tZW50
ZWQgdGhpcyBzaG91bGQgaGF2ZSBnb25lIHRocm91Z2ggdGhlCj4gPiA+IHBlcmYtdG9vbHMtbmV4
dCB0cmVlOgo+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FQLTU9ZlYzTlhrS3ND
UDFXSDBfcUxSTnBMK1d1UDhTM2gxPWNIYVVNSDVNRmtWSFFnQG1haWwuZ21haWwuY29tLwo+ID4g
PiBBcm5hbGRvLCBwbGVhc2UgdGFrZSBFcmljJ3MgcGF0Y2ggaW4gcHJlZmVyZW5jZSB0byB0aGlz
IG9uZS4KPiA+Cj4gPiBTbyBJIHJlbW92ZWQgeW91ciB2ZXJzaW9uIGZyb20gcGVyZi10b29scy1u
ZXh0LCBldmVudHVhbGx5IHdlJ2xsIGdldAo+ID4gdGhpcyBtZXJnZWQgdXBzdHJlYW0sIEknbSBq
dXN0IGNoZWNraW5nIHRoaXMgaXNuJ3QgZ29pbmcgdG8gZ2V0IGluIG91cgo+ID4gd2F5IG9mIHRl
c3Rpbmcgd2hhdCB3ZSBoYXZlIGluIHBlcmYtdG9vbHMtbmV4dC4uLgo+ID4KPiA+Cj4gPiAtIEFy
bmFsZG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
