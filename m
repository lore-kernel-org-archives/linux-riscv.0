Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40584EB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 23:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vQ6a7truXt1Ca8WsiXkf/zc6ZxDnvVgYEoS7vM4gnWo=; b=w+6Z2G7iPuMTPa
	R53tagbJLPKZTDdWNFsDR9b9GKhHMC4HGfU3xYoPTLiFzS0e8uizfNLJXdjE+m5vdsoLZ5cR8bYJN
	uOtlYQ72cGMqNCJuNM5098e+VgJXZ83vre96i/tzRFV59idxm9a88+UXVbnqTOedK0i7mYHYi8L1b
	sXhTYd6EY7/p303LWEWzrAz+ziJxxmzQ1sUytel+3NwG7maN8Ffzn67Xh+mdDSpZO6EMn3J6y74C4
	jpeoiaU4zpM3exSuWiS1nIXDHoCUktaUEd5WQ9cgJMoIxw2aNSk1XMu8ojKAbQX64LLLL0GD+aJ+A
	N1dr8DhGOPuVuStR+zLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDvQP-00BCSb-0S;
	Mon, 26 Jun 2023 23:15:13 +0000
Received: from mail-yb1-f180.google.com ([209.85.219.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDvQI-00BCQf-2S
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 23:15:12 +0000
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-be30cbe88b3so3847104276.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 16:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687821297; x=1690413297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kM73dDXJJ2LQE16TI30w/dkhZfJCFiiWEY4v9vd3CAI=;
        b=UCW43Rzw4c1AztpcnCCVEg3AuRI8KYcIz771GNZ8zZR5R8rnfHw225PRIpxDUyD7pN
         AE6tCuuyQc3EIBpY4qFGKzoBbqI6DbAaR1n7bMSq0kPYmxgyEcChiDGX2HF3Hrok5pqV
         fwI4tI3gRXWBKSitSt2slkWlbPxQYL4gooBtaZBsCuOb881PQN9+8czpf7uyj44kDjAs
         orE+u6Cpnoxdg05dbQVkM5+NZIzvehGMWNmFV6uBkD+ZS3Wk7V3xv/Joczi9c6tvNFYs
         zutC4qGYhFE1S0xtdgwfylfVWhdssNzR2wc7cx0lMGOxY8FUK8Ka6aZl1KPLKcdtT2Ku
         X08A==
X-Gm-Message-State: AC+VfDzXZXeAteRwTP2bap3PHyBvfgsyHSbeSa1vv+EDHtEeMMqzggHO
	9v3IlDMHe3sNPLmeEndyt0K4YIAIFVCmdoSoKZkqwYLgvZc=
X-Google-Smtp-Source: ACHHUZ6SlNxvS+0k1RkdHbPMGvtR/zIR689flvvkM6fGCsnFYzBJ3gb7C/t8rh8Gglh4bBOZPBk7Q91WVqTWMmesHvU=
X-Received: by 2002:a25:2903:0:b0:bff:d530:f06 with SMTP id
 p3-20020a252903000000b00bffd5300f06mr14953523ybp.41.1687821296805; Mon, 26
 Jun 2023 16:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAM9d7cjtisDVPijfU=iEGxc0YF=RnAt+r18Jg+8Av-+RAO=jeg@mail.gmail.com>
 <IA1PR20MB49536C0DA47122E9E3CB7CBBBB20A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CAM9d7cis-rb0fozK+T6R8MCEcT0ZF=RRNpv1qAWsLkMfsG6KxA@mail.gmail.com> <20230624-supermom-disparity-37546ffed0a4@spud>
In-Reply-To: <20230624-supermom-disparity-37546ffed0a4@spud>
From: Namhyung Kim <namhyung@kernel.org>
Date: Mon, 26 Jun 2023 16:14:45 -0700
Message-ID: <CAM9d7cjHndHrcH95uwmYRMRpm-a0kX2BHQ1jzmyo6f48w69jbg@mail.gmail.com>
Subject: Re: [PATCH V3] perf vendor events riscv: add T-HEAD C9xx JSON file
To: Conor Dooley <conor@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nikita Shubin <n.shubin@yadro.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_161506_800843_D2C9CEAF 
X-CRM114-Status: GOOD (  17.99  )
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

SGVsbG8sCgpPbiBTYXQsIEp1biAyNCwgMjAyMyBhdCAxOjU04oCvQU0gQ29ub3IgRG9vbGV5IDxj
b25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVuIDIzLCAyMDIzIGF0IDA5OjM1
OjAxUE0gLTA3MDAsIE5hbWh5dW5nIEtpbSB3cm90ZToKPiA+IE9uIEZyaSwgSnVuIDIzLCAyMDIz
IGF0IDY6MzPigK9QTSBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAb3V0bG9vay5jb20+IHdyb3Rl
Ogo+Cj4gPiA+Cj4gPiA+IEFzIGZvciBjOXh4IHdpbGRjYXJkLCB0aGUgVC1IRUFEIHByb3ZpZGVz
IGEgYE1DUFVJRGAgdmVuZG9yIENTUiB0byBhbGxvdwo+ID4gPiBpdHMgQ0tMSU5LIHRvIGdldCB0
aGUgZGV0YWlsIENQVSBpbmZvLiBUaGUgZm9ybWF0IG9mIHRoaXMgQ1NSIGFyZToKPiA+ID4KPiA+
ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+
IHwzMSAgIDI4fDI3ICAyNnwyNSAgICAyMnwyMSAgIDE4fDE3ICAgIDh8NyAgICAwfAo+ID4gPiB8
IGluZGV4IHwgV0xSTCB8IGZhbWlseSB8IGNsYXNzIHwgbW9kZWwgfCBXTFJMIHwKPiA+ID4gLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+Cj4gPiA+
IEFuZCBmb3IgQzl4eCBzZXJpZXMgKG9ubHkgaW5kZXggMDAwMCBpcyB2YWlsZCBmb3IgdXMsIGFz
IGBNQ1BVSURgIGFsc28KPiA+ID4gcHJvdmlkZXMgb3RoZXIgaW5kZXgpLgo+ID4gPgo+ID4gPiB8
IDAwMDAgfCB4eCB8IDAxMDAgfCBjbGFzcyB8IHh4eHh4eHh4eHggfCB4eHh4eHh4eCB8Cj4gPiA+
Cj4gPiA+IFRoZSBjbGFzcyBjb2RlcyBhcmU6Cj4gPiA+Cj4gPiA+IEM5MTA6IDAwMTEKPiA+ID4g
YzkwNjogMDEwMAo+ID4gPgo+ID4gPiBUaGUgQ1NSIGlzIGEgTS1tb2RlIG9ubHkgQ1NSLCBzbyBu
b3cgSSdtIGV4cGxvcmluZyBhIGNsZWFuIHdheSB0bwo+ID4gPiBpbnRlZ3JhdGUgdGhpcyBDU1Ig
aW50byB0aGUga2VybmVsLiBBbnkgYWR2aWNlPwo+Cj4gU2VlIGZvciBleGFtcGxlIGhvdyByaXNj
dl9jcHVpbmZvX3N0YXJ0aW5nKCkgcmVhZHMgbXZlbmRvcmlkICYgQ28uCj4KPiA+IEkgZG9uJ3Qg
a25vdyBhYm91dCB0aGUgZGV0YWlscy4gIElzIHRoaXMgQ1NSIGF2YWlsYWJsZSBmcm9tIHVzZXIg
c3BhY2U/Cj4gPiBJZiBub3QsIHlvdSBjb3VsZCBhZGQgaXQgc29tZXdoZXJlIGluIHRoZSBzeXNm
cy4KPgo+IE1hY2hpbmUgbW9kZSBpcyB0aGUgaGlnaGVzdCBwcml2aWxlZ2UgbGV2ZWwsIFN1cGVy
dmlzb3IgbW9kZSBpcyBuZXh0ICYKPiBVc2VyIG1vZGUgaXMgdGhlIGxvd2VzdC4gVHlwaWNhbGx5
IHRoZSBrZXJuZWwgcnVucyBpbiBTdXBlcnZpc29yIG1vZGUuCgpNYXliZSB5b3UncmUgaW50ZXJl
c3RlZCBpbiB0aGlzIHRocmVhZCBmb3IgdXNlciB2aXNpYmxlIGlkZW50aWZpZXJzLgoKaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzE2ODcyNDUxNTYtNjEyMTUtMS1naXQtc2VuZC1lbWFpbC1y
ZW55dS56akBsaW51eC5hbGliYWJhLmNvbS8KClRoYW5rcywKTmFtaHl1bmcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
