Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B5FCA5FA2
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fqvHv5yvom5iOrXca0C0/lcmWcT4PwRn+fzd8VAwkRU=; b=UKNND0ctnRBOgA
	lwxOzy1VIgBr9ejL2TAL5PIxGt2aLzFqa/w3tnk5tPNnE5I6jX0ssUSrjws3iTWiJG4ecRDWUMIhh
	XEJarKB9g0frFHRSbTDy4ZQ7H2GKdGmpgwm3IumrA1yV19j23EzAPLAyiWlslHNccg6245EnNR4Fa
	aA1bZSNkTh/I0p4Q1QQQ11ZbHibLiHPMBhF/TMJGd4ZsKEqao3CE3HlAJB5iPzGjm3fXrThk+ZCpf
	TnVzdVdWmZ54nkl21277tFbUePeh2KpPwiOqvEjHJq+UAL9EJGemIlASlMS5PPxspyf2Ouns0qDQ7
	Cy1+LZBxiYG8lg0rsCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBck-00000000gT5-3IkI;
	Mon, 28 Sep 2026 13:42:30 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBch-00000000gS0-44Va
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 13:42:29 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e66390995so17081685e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 06:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790602946; cv=none;
        d=google.com; s=arc-20260327;
        b=dygJ/onPIagNcYgHf51O6XrRdBvYAZK/7bi2lQzwayqWwbE639WRnGAlxPej1GnQtZ
         Fjmbxl4kw658GLFmXkslMEWOKEiJWvwvgk4sqriuaHWGNEMF0VoxAiIWb5FEihVl+v7m
         ycMwa6K3MhrwCH0EwoTasHjuesd1jKhxQjb9cNA2GNzgmOZpBPSud0c2J+jiAVR67N7x
         tMR53oTVBxn+Hgf+4/xwfgFk1D6PMIjB5brMirkwhnsgPz53PpDpeScMkND0eSPNWXoA
         Zhoygwm1HytRaV5weJ1Ox1OFx973xJ0saELWGFnFT7YJHaImy6390rbBlTJori0HIEfR
         PgjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BQVE+Yt78Z3pfyI+mWf7Zu1XcCvdZQxX7b3ZOkZzIX8=;
        fh=l0IiSwkAI+rEvjMCddewEWctc9Rvj6OHaMPN6Vqpxdo=;
        b=hQ/rHprzXG1WKJdDwjNm95UYUOF1An5QjMfgN+E2YLKwltArVcZWl8wcXvT4wqxEcP
         jrcEbQOp3+MN10r8Wt9dYG6xfZUxdbbzj2tNg4OjnnbHz+hbGha/DDmCVG5szbH3V67L
         xGXPj/c8f1jiCrLUg3oDDsOhtoM7Hc1tooaFjdAGMiDweEFuYKI1KvYKO1RPU1y7YJ1G
         zWEl0DrFgUupAeo3x6VBHQqNSbbOMVE/f8TZ2mn4DpQ5hk0vpJKIU+55o2/fSiiqvORS
         /xGLZsLyl4gyHfDYhUTrfsb9HHz2r0beky8FENbAarXujv6ut9zLOdd1mkD+nOvgf2MO
         m4gw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790602946; x=1791207746; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BQVE+Yt78Z3pfyI+mWf7Zu1XcCvdZQxX7b3ZOkZzIX8=;
        b=niwhbwLTuW8Vl2Sy256EmciOoUdmdCQ17JiQHi3OSWaon68nxWL5roJhjwegVt4L//
         U+bh9iCdF7Z2GFjnabTs9ObzOiTpSvbLwWjnpBtnMIrwTqIfAXMYYRyxmf6rZitYal3R
         FrvD1OR+1REkHgDefeIh3QfFFggveaEvUHuBJKyh9DF1xYZNh9oIwxVxkpoK0h/YGR4T
         bfR30p5WtEE2BUu1IGKXyRQgtNf3Em7F6OtSfWIbJxMfduiH0YcNgxfhNkQlDl2EVfjl
         sdFPZn5Zt+kLHzrfJH5a4OzQhy1awjTJZvntdvVVidqZWeDfAkfA4gs/TO5yv58fM1U3
         bjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790602946; x=1791207746;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQVE+Yt78Z3pfyI+mWf7Zu1XcCvdZQxX7b3ZOkZzIX8=;
        b=jA1fR0E+phVbYXxU3+Uvj00oJ+hjN73YBmnh0OJ7QDCx+EPon3BFseW3TAl5cos0I9
         mULHYXu/ERCY38W7B5nirn96dAMxcLVvCSrjU9A5bppyqWeUDlJNdgLaTLRmDFv+Fhcc
         qrpAltxILSZBOF2+yqVd3CcWvpPOdF84zs4nFc4UOnApVzncAOUxnH7QGv+NkzgVEcHZ
         ael0YAxpDExjcjzJUCg13FOdkZNvZol7GRHOew+GhPa5UvYCpVwlfdiNf0uA5iB4fDHI
         YqNjfegveMrxHD+gLNeEQPgpRu1VS0bzzn1x3cWsKNJ5cWI9TMKUXgRwnsk8ALdvCtOb
         +Psg==
X-Forwarded-Encrypted: i=1; AKwUvBws5nHIHWrrJVlUKM3IfSAg/tXh6QehjApSSnjCSNWVJ5RpZdpMdiE2SNt/oel2v2zDMOWu6tLZYaQzUA==@lists.infradead.org
X-Gm-Message-State: AFuF++nlZ7V5EPfgLQ/KYewn7mlATQiVhPAc6bPE88KhQjIUwJM/3lZ9
	9Bt+9JFR5AQL50YiFQLccX5kVMlhY35fyuzu4zGKhMDi2zYR5Xfhk8LJWSyCF2xyhajkXWPhJNl
	yaJzusY8i1Bs3LgAzRbBMm1p3gHscJP+47u25fTQ72Q==
X-Gm-Gg: AYBFou0q39czV/5t+itIL27bg+PBWh49rEWFdFI8Mf1uqe0O85ogHH5t/aY6ZC2ZTHg
	CmnKQQilR3NtkF4NOjpcPSMOXawsHO+RrvskhiXKVKCXIEhOY3Kuyf/nJaWXR1CLMmlhLJQGoto
	BPdt2KNiBwLedXnnZp0d+oib/itCa87A1gjEJLGTmYpQIb8ikyQ5p5mWmWPMVjsmxJxM8tdslH1
	DI84pdYc/nba9cvPAUF5l3bMZZSHEFu29fbcJVRcs6ebUOODdVw06lqpK1zXTun/bOHwNICuSLH
	YsVzb+c7JwrsD1I/oJUNZUzv0cm6zxJ34N+Vy/aOmk9XttXFkUuZPJdpINwQASmyWlVUxNv3S7p
	m/IVZCH2WXReRUkjU2VwcXaGJfsz99huF4Q2wQAb7P3BwrYu2tSMmkNA5oP8Qpis/E5kOliP/iB
	bWQAfC1Ovm+Q==
X-Received: by 2002:a05:600c:46d4:b0:49f:ec98:f030 with SMTP id
 5b1f17b1804b1-49ff06f839dmr165880955e9.33.1790602945896; Mon, 28 Sep 2026
 06:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260928094739.2605-1-cp0613@linux.alibaba.com> <20260928094739.2605-2-cp0613@linux.alibaba.com>
In-Reply-To: <20260928094739.2605-2-cp0613@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Sep 2026 19:12:14 +0530
X-Gm-Features: AclHuK9NQvFd0dqx39FONs2gN8zrhWEmLq1wAOlPjaDEqyssj2Y5zQw81EJtk-A
Message-ID: <CAAhSdy2JhEoG2-hrtN63ZF3sj6Uyqrs8G4Gj+P3Ut2f5h+v4fg@mail.gmail.com>
Subject: Re: [PATCH 1/2] perf riscv: Implement rdtsc()
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: acme@kernel.org, peterz@infradead.org, mingo@redhat.com, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	james.clark@linaro.org, leo.yan@linux.dev, john.g.garry@oracle.com, 
	will@kernel.org, mike.leach@arm.com, pjw@kernel.org, palmer@dabbelt.com, 
	guoren@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_064228_028699_EAE1FA63 
X-CRM114-Status: GOOD (  20.09  )
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

T24gTW9uLCBTZXAgMjgsIDIwMjYgYXQgMzoyMOKAr1BNIENoZW4gUGVpIDxjcDA2MTNAbGludXgu
YWxpYmFiYS5jb20+IHdyb3RlOgo+Cj4gVGhlcmUgaXMgbm8gcmlzY3YgaW1wbGVtZW50YXRpb24g
b2YgcmR0c2MoKSwgc28gcGVyZiBsaW5rcyBhZ2FpbnN0IHRoZQo+IHdlYWsgc3R1YiBpbiB1dGls
L3RzYy5jIGFuZCBldmVyeSBjYWxsZXIgcmVhZHMgYSBjb25zdGFudCAwIHRoYXQgaXMKPiBpbmRp
c3Rpbmd1aXNoYWJsZSBmcm9tIGEgcmVhbCBjb3VudGVyIHN0YW5kaW5nIHN0aWxsLgo+Cj4gSW1w
bGVtZW50IHJkdHNjKCkgb3ZlciB0aGUgdGltZSBDU1Igd2l0aCByZHRpbWUuICBUaGUgdGltZSBD
U1IgaXMgYSBUU0MKPiBlcXVpdmFsZW50IG9uIHJpc2N2OiBpdCBpcyByZWFkYWJsZSBmcm9tIHVz
ZXIgbW9kZSwgaXQgdGlja3MgYXQgYQo+IGNvbnN0YW50IGZyZXF1ZW5jeSwgYW5kIGl0IGlzIHRo
ZSBzYW1lIGNvdW50ZXIgdGhhdCByaXNjdidzCj4gYXJjaF9wZXJmX3VwZGF0ZV91c2VycGFnZSgp
IGJ1aWxkcyB0aGUgdXNlciBwYWdlIGNvbnZlcnNpb24gZmllbGRzIGZyb20sCj4gc28gdGhlIGNv
dW50ZXIgYW5kIHBlcmYgdGltZSBzaGFyZSBhIHRpbWViYXNlLgo+Cj4gU2lnbmVkLW9mZi1ieTog
Q2hlbiBQZWkgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT4KCkxHVE0gZnJvbSBSSVNDLVYgcGVy
c3BlY3RpdmUuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4K
ClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIHRvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL0J1aWxk
IHwgIDEgKwo+ICB0b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC90c2MuYyB8IDE5ICsrKysrKysr
KysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCB0b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC90c2MuYwo+Cj4gZGlmZiAt
LWdpdCBhL3Rvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL0J1aWxkIGIvdG9vbHMvcGVyZi9hcmNo
L3Jpc2N2L3V0aWwvQnVpbGQKPiBpbmRleCAyMzI4ZmI5YTMwYTMuLjUyY2Q2YTQ4MWRlOCAxMDA2
NDQKPiAtLS0gYS90b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9CdWlsZAo+ICsrKyBiL3Rvb2xz
L3BlcmYvYXJjaC9yaXNjdi91dGlsL0J1aWxkCj4gQEAgLTEgKzEsMiBAQAo+ICBwZXJmLXV0aWwt
eSArPSBoZWFkZXIubwo+ICtwZXJmLXV0aWwteSArPSB0c2Mubwo+IGRpZmYgLS1naXQgYS90b29s
cy9wZXJmL2FyY2gvcmlzY3YvdXRpbC90c2MuYyBiL3Rvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGls
L3RzYy5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjdjYzQ3
MTBhYzM4Ywo+IC0tLSAvZGV2L251bGwKPiArKysgYi90b29scy9wZXJmL2FyY2gvcmlzY3YvdXRp
bC90c2MuYwo+IEBAIC0wLDAgKzEsMTkgQEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAKPiArCj4gKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+ICsKPiArI2luY2x1ZGUg
Ii4uLy4uLy4uL3V0aWwvdHNjLmgiCj4gKwo+ICt1NjQgcmR0c2Modm9pZCkKPiArewo+ICsgICAg
ICAgdTY0IHZhbDsKPiArCj4gKyAgICAgICAvKgo+ICsgICAgICAgICogVGhlIHRpbWUgQ1NSIHRp
Y2tzIGF0IGEgY29uc3RhbnQgZnJlcXVlbmN5IGFuZCBpcyB0aGUgc2FtZSBjb3VudGVyCj4gKyAg
ICAgICAgKiB0aGUga2VybmVsIGZlZWRzIGludG8gdGhlIHVzZXIgcGFnZSBjb252ZXJzaW9uIGZp
ZWxkcyB0aHJvdWdoCj4gKyAgICAgICAgKiBzY2hlZF9jbG9jaygpLCBzbyBpdCBpcyBhIFRTQyBl
cXVpdmFsZW50IGhlcmUuCj4gKyAgICAgICAgKi8KPiArICAgICAgIGFzbSB2b2xhdGlsZSgicmR0
aW1lICUwIiA6ICI9ciIgKHZhbCkpOwo+ICsKPiArICAgICAgIHJldHVybiB2YWw7Cj4gK30KPiAt
LQo+IDIuNTAuMQo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
