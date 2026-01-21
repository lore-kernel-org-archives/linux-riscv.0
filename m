Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F00D262B0
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 06:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tIcZKtziu1+f7gar3glWI9ROdVYek+PX+401GwQz0IY=; b=3ZiJqVBWQadZaO
	YOVmCNBqT2Zh0y2hBGWK13PbEa3Rl1adShofZmcAyAaHeyEd6B3ZCSvJ+b/A/9NPzdsQvW5sZkjjm
	eWUY/50zuW0jtFxt6tTxLs7roXR1W8OijzXtCWVYEOmbehVoOoGSswvASQhYhSU1iR+fH2GLgExkT
	tNAqF36bijWm44N5byEJtFygTLcw7hiZliADm04bYQyEg8ND4xU+/5lH1lwHssDHAenSSjwGn2+N9
	zp+4qkILT1ralRPE+4mqcB+TqKmYUCNsrclYrsHRhu6Clrgl6h55fYBLS/nKfFVXXyJJ9tdrXDD28
	i3l/mZjbs1r/UFO1CdCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSAm-00000004yaa-2eTe;
	Wed, 21 Jan 2026 06:58:36 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSAj-00000004yZn-377j;
	Wed, 21 Jan 2026 06:58:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768978714; x=1800514714;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gQ2iJQpnPdN/VjaVdp15xX/jvrsDqvjipQxnEurzx0o=;
  b=keTalmMkRLRdF4G6aEANlcgH2YcAAGb4SVDcRaRS+h5vzxCMVjNkPPqy
   MCkloiY8SDu+LXLY0Ui5TnPgEiqrFRAhZ2B7LbOLe1Wy192Qw7+vKha+R
   zm8uODdm1H4yCmVnt9PQUPJISHRAwcROCP8kBCprdkJQQl9r8UhlAmMnD
   ca9h7nT745A9WlcfR0DIeDe+T6KJnTFKVYYVdBjGNBGdvxmaA/ijPo3MY
   PSDL26OaWUxfFsS2NHMslBu8f40kga8A6Et3wwuhfbpQZIiv8F4MyPoDY
   bMPrjfWEprPrPCR+GWSdWzEH/5syxm2a8JsdG526ZxQ/GDZiZj6GeMpnD
   Q==;
X-CSE-ConnectionGUID: PvZ3oc2fRhW1f3rajkSMXA==
X-CSE-MsgGUID: GMHDkOewQXSka+5BLxRcXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87613439"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="87613439"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 22:58:32 -0800
X-CSE-ConnectionGUID: RTr0u7XLSeaTx5XBU3ytxg==
X-CSE-MsgGUID: XiL39KX7SleqSNkWfdr/mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206775947"
Received: from unknown (HELO [10.238.3.254]) ([10.238.3.254])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 22:58:25 -0800
Message-ID: <8c1fefd6-4f4c-42a7-9007-5c9df3975080@linux.intel.com>
Date: Wed, 21 Jan 2026 14:58:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/23] perf perf_regs: Switch from arch string to int
 e_machine
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
 Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark
 <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>,
 Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>,
 Athira Rajeev <atrajeev@linux.ibm.com>,
 Stephen Brennan <stephen.s.brennan@oracle.com>,
 Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>,
 Andi Kleen <ak@linux.intel.com>, "Dr. David Alan Gilbert"
 <linux@treblig.org>, Dmitry Vyukov <dvyukov@google.com>,
 =?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>,
 Chun-Tse Shao <ctshao@google.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>,
 Haibo Xu <haibo1.xu@intel.com>, Sergei Trofimovich <slyich@gmail.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org, Mark Wielaard <mark@klomp.org>
References: <20260117052849.2205545-1-irogers@google.com>
 <20260117052849.2205545-9-irogers@google.com> <aW_OV72q5rAVrgRE@x1>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <aW_OV72q5rAVrgRE@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_225833_816600_96688E8A 
X-CRM114-Status: GOOD (  16.82  )
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

Ck9uIDEvMjEvMjAyNiAyOjQ5IEFNLCBBcm5hbGRvIENhcnZhbGhvIGRlIE1lbG8gd3JvdGU6Cj4g
T24gRnJpLCBKYW4gMTYsIDIwMjYgYXQgMDk6Mjg6MzRQTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPj4gVGhlIGFyY2ggc3RyaW5nIHJlcXVpcmVzIG11bHRpcGxlIHN0cmNtcCB0byBpZGVudGlm
eSB0aGluZ3MgbGlrZSB0aGUKPj4gSVAgYW5kIFNQLiBTd2l0Y2ggdG8gcGFzc2luZyBpbiBhbiBl
X21hY2hpbmUgdGhhdCBpbiB0aGUgYnVsayBvZiBjYXNlcwo+PiBpcyBjb21wdXRlZCB1c2luZyBh
IGN1cnJlbnQgdGhyZWFkIGxvYWQuIFRoZSBlX21hY2hpbmUgYWxzbyBhbGxvd3MKPj4gaWRlbnRp
ZmljYXRpb24gb2YgMzItYml0IHZzIDY0LWJpdCBwcm9jZXNzZXMuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IElhbiBSb2dlcnMgPGlyb2dlcnNAZ29vZ2xlLmNvbT4KPj4gLS0tCj4+ICB0b29scy9wZXJm
L2J1aWx0aW4tc2NyaXB0LmMgICAgICAgICAgICAgICAgICAgfCAgMTcgKystCj4+ICB0b29scy9w
ZXJmL3V0aWwvZXZzZWwuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgMTQgKystCj4+ICB0b29s
cy9wZXJmL3V0aWwvcGVyZl9yZWdzLmMgICAgICAgICAgICAgICAgICAgfCAxMDUgKysrKysrKysr
KystLS0tLS0tCj4gWyBJbmNsdWRlIGR3YXJmLXJlZ3MuaCB0byBnZXQgY29uZGl0aW9uYWwgZGVm
aW5lcyBmb3IgRU1fQ1NLWSBhbmQgRU1fTE9PTkdBUkNILCBub3QgYXZhaWxhYmxlIGluIG9sZCBk
aXN0cm9zIF0KPgo+IC0gQXJuYWxkbwoKU2VlbXMgdGhlIGNoYW5nZSB3b3VsZCBpbnRyb2R1Y2Ug
dGhlIGJlbG93IGJ1aWxkaW5nIGVycm9yLgoKdXRpbC9wZXJmX3JlZ3MuYzogSW4gZnVuY3Rpb24g
4oCYcGVyZl9yZWdfbmFtZeKAmToKdXRpbC9wZXJmX3JlZ3MuYzo0ODoxNDogZXJyb3I6IOKAmEVN
X0xPT05HQVJDSOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcwpmdW5jdGlvbikKwqAg
wqA0OCB8wqAgwqAgwqAgwqAgwqBjYXNlIEVNX0xPT05HQVJDSDoKwqAgwqAgwqAgfMKgIMKgIMKg
IMKgIMKgIMKgIMKgIF5+fn5+fn5+fn5+fgp1dGlsL3BlcmZfcmVncy5jOjQ4OjE0OiBub3RlOiBl
YWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5Cm9uY2UgZm9yIGVhY2gg
ZnVuY3Rpb24gaXQgYXBwZWFycyBpbgp1dGlsL3BlcmZfcmVncy5jOiBJbiBmdW5jdGlvbiDigJhw
ZXJmX2FyY2hfcmVnX2lw4oCZOgp1dGlsL3BlcmZfcmVncy5jOjExNDoxNDogZXJyb3I6IOKAmEVN
X0xPT05HQVJDSOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4KdGhpcyBmdW5jdGlvbikKwqAg
MTE0IHzCoCDCoCDCoCDCoCDCoGNhc2UgRU1fTE9PTkdBUkNIOgrCoCDCoCDCoCB8wqAgwqAgwqAg
wqAgwqAgwqAgwqAgXn5+fn5+fn5+fn5+CnV0aWwvcGVyZl9yZWdzLmM6IEluIGZ1bmN0aW9uIOKA
mHBlcmZfYXJjaF9yZWdfc3DigJk6CnV0aWwvcGVyZl9yZWdzLmM6MTQzOjE0OiBlcnJvcjog4oCY
RU1fTE9PTkdBUkNI4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbgp0aGlzIGZ1bmN0aW9uKQrC
oCAxNDMgfMKgIMKgIMKgIMKgIMKgY2FzZSBFTV9MT09OR0FSQ0g6CsKgIMKgIMKgIHzCoCDCoCDC
oCDCoCDCoCDCoCDCoCBefn5+fn5+fn5+fn4KCkl0IGxvb2tzIEVNX0xPT05HQVJDSCBpcyBub3Qg
ZGVmaW5lZCBpbiB0aGUgPGVsZi5oPiBoZWFkZXIgZmlsZSwgbm90IHN1cmUKd2hpY2ggb25lIGlz
IGJldHRlciwgaW5jbHVkZcKgIGR3YXJmLXJlZ3MuaCBzdWdnZXN0ZWQgYnkgQXJuYWxkbyBvciBk
aXJlY3QKYWRkIHRoZSBkZWZpbmUsCgpkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi91dGlsL3BlcmZf
cmVncy5jIGIvdG9vbHMvcGVyZi91dGlsL3BlcmZfcmVncy5jCmluZGV4IGI1OGQ1OWI4NGZiMS4u
Y2U4MzlkZjE5ZmEzIDEwMDY0NAotLS0gYS90b29scy9wZXJmL3V0aWwvcGVyZl9yZWdzLmMKKysr
IGIvdG9vbHMvcGVyZi91dGlsL3BlcmZfcmVncy5jCkBAIC02LDYgKzYsMTAgQEAKwqAjaW5jbHVk
ZSAidXRpbC9zYW1wbGUuaCIKwqAjaW5jbHVkZSAiZGVidWcuaCIKCisjaWZuZGVmIEVNX0xPT05H
QVJDSAorI2RlZmluZSBFTV9MT09OR0FSQ0jCoCDCoCDCoCDCoCDCoCDCoDI1OAorI2VuZGlmCisK
wqBpbnQgX193ZWFrIGFyY2hfc2R0X2FyZ19wYXJzZV9vcChjaGFyICpvbGRfb3AgX19tYXliZV91
bnVzZWQsCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y2hhciAqKm5ld19vcCBfX21heWJlX3VudXNlZCkKwqB7CgoKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
