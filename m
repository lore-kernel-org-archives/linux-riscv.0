Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB85C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 17:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tkKB6cRNoF/0gkQdILr7xnNFY08hKyrPKbrHGOo3vdM=; b=cMlwsiYeZvGR1M
	tab8X6t+U+v47S80sgT2roJA6vJjBsPY7LeX04PgA0svMPqWX+9MGQADeFd7cXCFQ4OGRkQEcoBob
	X/lPfR5LQz5ocKnSfd+/vKZK3m8I1zeM3pFsml/wpTGVVhFYZzMnWOpmks9+yo3mMN7wxWy6vDwoK
	h7kg5dS2jFMfvQMUOsxh1VKyLx1S5kTUl31N8mCN1mafuVz8tr2FgJu6JJlUugA945UK4aYFtzMwK
	5Hp1ubpHnugAgF7aUb448cA7lzKWZoEUfp7TnrjCLmAmp9dUvia6K7BEyhtCofzXzQIIgsvKIWL1b
	EZNl9wmMcdTmJ0aO2jeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mgU-0036b3-Dv; Fri, 24 Jun 2022 17:01:30 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mgR-0036Ze-Fm
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 17:01:28 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 23so5473705ybe.8
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jun 2022 10:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6Jns4dsIe8eb094ZZ61J5I0GwrZpoyUPKckm9PMjM6A=;
        b=PLUzB92rTaw0yKzXR/fbqdnplZiu/04+Hcuj/qFWhBE5U7BXJBIHatMeX4obUVPbQS
         A4Bjtu0V4lRKjcan/QqiuPC4DL/T39L7jYp1vGwmbUJWDFHq4QCznjmPCi1ERCpuSmsv
         8NANYZrJIodQD6ZeyqP4fRMOU31B0gEhDwMNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6Jns4dsIe8eb094ZZ61J5I0GwrZpoyUPKckm9PMjM6A=;
        b=tTRl7r17fc5jE8o9FoMt8Fp4uA+S72op9TX5Edp4E1WVli4181wNdfax+3IR1wTaeJ
         4MwnY6w5Vs7R31a/yRB0/rlW2RB4/z9HjuyvPmldPzC9aizKZY42yU2OESk2DiEDoEmm
         I84+bM56i1a6CPr7SjE/G01aZeJjN6bmg+BJTPfGcn17DvKmjNj41AWjaj2j4VjolFmx
         lJSyCiR40Mvsl7vW9iVXsnjf3ANl59qGINjWIjv2Ydlf8x8DoMJtV0RJnTJnZ4DCsICF
         owBgPdwMcAnAGFyPFGaoMz0m342CGd+nxMsphC28SK8IRPYgQoEii8MEm4BT9sppWfmB
         yaiA==
X-Gm-Message-State: AJIora/fOqDZRYLC/l14c1ATqf/7OonC1qThntyKc+6WzQHA/zILhFoG
	TgDyp4ZLGAfhMvU99oig2T8AQ7Vg8L1iRe3FPa/E
X-Google-Smtp-Source: AGRyM1vBM6wzRqtQPsY/GBTxWhWMVAPeZO7wStS8yWUZs4AjrmBSarknA+yzpWkGvpKLGaRxqyMdQFgQtOsHyHWrBc4=
X-Received: by 2002:a5b:c4:0:b0:669:15d4:8b68 with SMTP id d4-20020a5b00c4000000b0066915d48b68mr100443ybp.473.1656090080201;
 Fri, 24 Jun 2022 10:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220624160117.3206-1-nikita.shubin@maquefel.me> <20220624160117.3206-4-nikita.shubin@maquefel.me>
In-Reply-To: <20220624160117.3206-4-nikita.shubin@maquefel.me>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 24 Jun 2022 10:01:07 -0700
Message-ID: <CAOnJCU+B+dXXhqL6CYRG7Lhr_QWwyxrDZdGZG6HphnTEE9o5Mw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] perf arch events: riscv arch std event files
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Anup Patel <anup@brainfault.org>, 
	=?UTF-8?B?Sm/Do28gTcOhcmlvIERvbWluZ29z?= <joao.mario@tecnico.ulisboa.pt>, 
	linux <linux@yadro.com>, Nikita Shubin <n.shubin@yadro.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_100127_567594_26491483 
X-CRM114-Status: GOOD (  15.55  )
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

T24gRnJpLCBKdW4gMjQsIDIwMjIgYXQgOTowMSBBTSBOaWtpdGEgU2h1YmluIDxuaWtpdGEuc2h1
YmluQG1hcXVlZmVsLm1lPiB3cm90ZToKPgo+IEZyb206IE5pa2l0YSBTaHViaW4gPG4uc2h1Ymlu
QHlhZHJvLmNvbT4KPgo+IGN5Y2xlcywgdGltZSBhbmQgaW5zdHJldCBjb3VudGVycyBhcmUgZGVm
aW5lZCBieSBSSVNDLVYgcHJpdmlsZWdlZAo+IHNwZWMgYW5kIHRoZXkgc2hvdWxkIGJlIGF2YWls
YWJsZSBvbiBhbnkgUklTQy1WIGltcGxlbWVudGF0aW9uLCBlcG9zZSB0aGVtCj4gdG8gYXJjaCBz
dGQgZXZlbnQgZmlsZXMsIHNvIHRoZXkgY2FuIGJlIHJldXNlZCBieSBwYXJ0aWN1bGFyIFBNVQo+
IGJpbmRpbmdzLgo+Cj4gRGVyaXZlZC1mcm9tLWNvZGUtYnk6IEpvw6NvIE3DoXJpbyBEb21pbmdv
cyA8am9hby5tYXJpb0B0ZWNuaWNvLnVsaXNib2EucHQ+Cj4gU2lnbmVkLW9mZi1ieTogTmlraXRh
IFNodWJpbiA8bi5zaHViaW5AeWFkcm8uY29tPgoKV2h5IGRvIHdlIG5lZWQgdGhpcyA/IFRoZSBQ
TVUgZHJpdmVyIGFscmVhZHkgcGFyc2VzIHRoZSBzdGFuZGFyZCBwZXJmIGV2ZW50cy4KU28geW91
IGNhbiBwYXNzIC1lIGN5Y2xlcyAtZSBpbnN0cnVjdGlvbnMuCgpFdmVuIHRob3VnaCB0aW1lIGlz
IGRlc2NyaWJlZCBhcyBhIGNvdW50ZXIgYW5kIGFjY2Vzc2liaWxpdHkKY29udHJvbGxlZCBieSBt
Y291bnRlcmVuLCB5b3UgY2FuIG5vdCBzdGFydC9zdG9wIGl0IChubyBiaXQgaW4KbWNvdW50aW5o
aWJpdCkuClRodXMsIGl0IGNhbid0IGJlIHVzZWQgZnJvbSBwZXJmLgoKPiAtLS0KPiAgLi4uL3Bt
dS1ldmVudHMvYXJjaC9yaXNjdi9yaXNjdi1nZW5lcmljLmpzb24gIHwgMjAgKysrKysrKysrKysr
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvcmlzY3YtZ2VuZXJpYy5q
c29uCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3Yvcmlz
Y3YtZ2VuZXJpYy5qc29uIGIvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvcmlzY3Yt
Z2VuZXJpYy5qc29uCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAu
LmE3ZmZiZTg3YTBmNwo+IC0tLSAvZGV2L251bGwKPiArKysgYi90b29scy9wZXJmL3BtdS1ldmVu
dHMvYXJjaC9yaXNjdi9yaXNjdi1nZW5lcmljLmpzb24KPiBAQCAtMCwwICsxLDIwIEBACj4gK1sK
PiArICB7Cj4gKyAgICAiUHVibGljRGVzY3JpcHRpb24iOiAiQ1BVIEN5Y2xlcyIsCj4gKyAgICAi
RXZlbnRDb2RlIjogIjB4MDAiLAo+ICsgICAgIkV2ZW50TmFtZSI6ICJyaXNjdl9jeWNsZXMiLAo+
ICsgICAgIkJyaWVmRGVzY3JpcHRpb24iOiAiQ1BVIGN5Y2xlcyBSSVNDLVYgZ2VuZXJpYyBjb3Vu
dGVyIgo+ICsgIH0sCj4gKyAgewo+ICsgICAgIlB1YmxpY0Rlc2NyaXB0aW9uIjogIkNQVSBUaW1l
IiwKPiArICAgICJFdmVudENvZGUiOiAiMHgwMSIsCj4gKyAgICAiRXZlbnROYW1lIjogInJpc2N2
X3RpbWUiLAo+ICsgICAgIkJyaWVmRGVzY3JpcHRpb24iOiAiQ1BVIHRpbWUgUklTQy1WIGdlbmVy
aWMgY291bnRlciIKPiArICB9LAo+ICsgIHsKPiArICAgICJQdWJsaWNEZXNjcmlwdGlvbiI6ICJD
UFUgSW5zdHJ1Y3Rpb25zIiwKPiArICAgICJFdmVudENvZGUiOiAiMHgwMiIsCj4gKyAgICAiRXZl
bnROYW1lIjogInJpc2N2X2luc3RyZXQiLAo+ICsgICAgIkJyaWVmRGVzY3JpcHRpb24iOiAiQ1BV
IHJldGlyZWQgaW5zdHJ1Y3Rpb25zIFJJU0MtViBnZW5lcmljIGNvdW50ZXIiCj4gKyAgfQo+ICtd
Cj4gLS0KPiAyLjM1LjEKPgoKCi0tIApSZWdhcmRzLApBdGlzaAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
