Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A747C48BEB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 22:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fjaj6B6reRrdfcZuq7q8UBHiXNLvlLZzqE9UeMhQXGU=; b=eeC/F70mUD/1v1
	OcWvBQFZM7+J9WHtyZ65vPlWLz/yU2Sd8O8Fk+2IzesjodDRhtaKTJCd/eu/maHcVokttd7Q46+ge
	nnJeGM4QjKLYPMH5ALhfQ46i8ML2P6KmKHPJNNUYEMc5nv3Ms2ZIgVxQ/79EpHaEbTls9Ns/Tnxym
	VV7WAs0YXmaqRy41hYp/j0i0Y2asJsO2t/YIETrX7IOJJuNcTvHniflBVDMQZbx/i683cpGt4lH0M
	7FC4eJyFBCRyJbAqO6VaDoLNah9IQ/3QyUF5kMcJLd5Z1/8mYJl3d8n3vzoforBKt3ZpFJsmqV/Dg
	Z1/SgI36O8NOyeexDREQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raNyD-0000000ETKf-3btN;
	Wed, 14 Feb 2024 22:43:13 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raNyB-0000000ETJU-1TEN
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 22:43:13 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d5ce88b51cso33725ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Feb 2024 14:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707950590; x=1708555390; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNsPK+5tLWvdv+gYlhpHEpHeZeAqpOS89g5+h/Xob8s=;
        b=PzU7oLSc+2W/qLzVN5MctUKuWPVAbrtQj7D22q05lhtiIJhnskh2XEaQsTt2ASU83I
         7/iGhN77efOvsqY40CAMJl90nY+nFykm104xRZbzXqkCY/zLxhsj6rrUL6StK96bfa9r
         d9ezx/CwDefTYzkZcYb+RzZgWscvhp2Ep6IWo5TbZGZuNQZtPbkcjiIt0KPvPNo+Yvx2
         zNLkLhppz1dE/1PH/ei7ZFcR41+Q7nAnd5+iXNeb6r7SIbw39WzFSfWfrm79YocJR7iX
         H6bATisXZ1cPGZa8Pw196A10fMz5NyhJWCeTvO3fW7VofXWyTmYRl6VlSoPeaEWKJNWs
         iWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707950590; x=1708555390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NNsPK+5tLWvdv+gYlhpHEpHeZeAqpOS89g5+h/Xob8s=;
        b=LiPLjurChj0q3d5t5aPcJmQZjH9WvsHneNg0acA3GqOeNsiF9tOp7yot2i8XIpwy+1
         koRH+/zkgtN16Pmk7VtNZiGBU04ofdsfbnVwcYqedxPlGMt2JbCxlT2RfW0dYzjIjAt2
         KGnCvtwkjWC53iwmJVe/uQBm0Q2hr0iJu8F7gV5o2CThQm01WXVFx0FtrbOhx0NzehoI
         nLHuwR8ThJIg0cqBWwDHF8KiU9E14Gh4JO5FOCSYpZSlGHV92ZAFWFat93iUQ50yqc1J
         fxUD1kUl9Q7n/HLEMUm8rPlBMgreeRY6GQRQohmpOogq/jErvd6Ubx6XwcOTx0kF28Au
         FhgA==
X-Forwarded-Encrypted: i=1; AJvYcCXRwEbtbFOV5wIRwK+g5fS55zWTcJFOWmYQTzLp8KnlA6tP2iZQw4vl0xWXWMF6M44U5ra2Bb18uaRQEdtYaJIMckIdm5yYYHHIbFPjodCw
X-Gm-Message-State: AOJu0YxAM+XcZBpb+0HZc+naW8fNR0WAKo9eeaCl8TR1dQfBI5KX7hi9
	bw2scJAK/+JaOPlxGj0tFb7Mno3OrCS4D1RNT4eukR8U6z8lqVpmGPr0W6XFRRCi2d5l9D4sGSC
	sVI1dTygJvss1Pzg2dk1PTmrA6bhDN9790kty
X-Google-Smtp-Source: AGHT+IEWmx9o20zsYkRXJyB8zKsCSkKFNQNuZGphQlbFdMF3zSOKzL3jAFucrutS57uN43pDOJxLmDOolU9Ayg9Z7HM=
X-Received: by 2002:a17:903:42cd:b0:1d9:aa55:e4bd with SMTP id
 jy13-20020a17090342cd00b001d9aa55e4bdmr401175plb.6.1707950589903; Wed, 14 Feb
 2024 14:43:09 -0800 (PST)
MIME-Version: 1.0
References: <20240214113947.240957-1-leo.yan@linux.dev>
In-Reply-To: <20240214113947.240957-1-leo.yan@linux.dev>
From: Ian Rogers <irogers@google.com>
Date: Wed, 14 Feb 2024 14:42:55 -0800
Message-ID: <CAP-5=fXqdFrTDY2a2dXK1ehP2AbwPfPF8vYWXgeSMcKh4mS+ow@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] perf parse-regs: Cleanup config and building
To: Leo Yan <leo.yan@linux.dev>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, 
	Ming Wang <wangming01@loongson.cn>, Kan Liang <kan.liang@linux.intel.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_144311_433696_8BD9D305 
X-CRM114-Status: GOOD (  23.86  )
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

T24gV2VkLCBGZWIgMTQsIDIwMjQgYXQgMzo0MOKAr0FNIExlbyBZYW4gPGxlby55YW5AbGludXgu
ZGV2PiB3cm90ZToKPgo+IEN1cnJlbnRseSwgdGhlIHBlcmYgYnVpbGRpbmcgZW5hYmxlcyByZWdp
c3RlciBwYXJzaW5nIGJhc2VkIG9uIHRoZQo+IHRhcmdldCBhcmNoaXRlY3R1cmUgaGFzIHN1cHBv
cnRlZCByZWdpc3RlciBmZWF0dXJlLgo+Cj4gRnVydGhlcm1vcmUsIHRoZSBwZXJmIGJ1aWxkaW5n
IHN5c3RlbSBuZWVkcyB0byBtYWludGFpbiBhIHZhcmlhYmxlCj4gJ05PX1BFUkZfUkVHUycgYW5k
IGRlZmluZXMgbWFjcm8gJ0hBVkVfUEVSRl9SRUdTX1NVUFBPUlQnIGZvciBzdGF0aWNhbGx5Cj4g
Y29tcGlsaW5nIHRoZSB0b29sLgo+Cj4gQXMgYSByZXN1bHQsIHRoZSBwZXJmIGhhcyBubyBmbGV4
aWJpbHR5IGZvciBwYXJzaW5nIHJlZ2lzdGVyIGlmIGFuCj4gYXJjaGl0ZWN0dXJlIGRvZXNuJ3Qg
c3VwcG9ydCBpdC4gQW5kIHRoZSBzb3VyY2UgZmlsZXMgdXNlIHRoZSBtYWNybwo+ICdIQVZFX1BF
UkZfUkVHU19TVVBQT1JUJyB0byBzd2l0Y2ggb24gYW5kIG9mZiB0aGUgcmVnaXN0ZXIgcGFyc2lu
Zwo+IHJlbGF0ZWQgY29kZSwgd2hpY2ggaXMgbm90IGEgZ29vZCBwcmFjdGljZS4KPgo+IFRoaXMg
c2VyaWVzIGlzIHRvIHJlbW92ZSB0aGUgc3RhdGljIGJ1aWxkaW5nIGZvciByZWdpc3RlciBwYXJz
aW5nLiBJbgo+IHRoZW9yeSwgd2Ugc2hvdWxkIGNhbiBkeW5hbWljYWxseSBkZXRlY3QgaWYgYW4g
YXJjaCBoYXMgc3VwcG9ydCB0aGlzCj4gZmVhdHVyZSBhbmQgZnVuY3Rpb25zIGNhbiByZXR1cm4g
ZXJyb3JzIHdoZW4gdGhlIGZlYXR1cmUgaXMgbm90Cj4gc3VwcG9ydGVkLgo+Cj4gVGhlIGZpcnN0
IHBhdGNoIGlzIHRvIHJlbW92ZSB1bnVzZWQgYnVpbGQgY29uZmlndXJhdGlvbgo+IENPTkZJR19Q
RVJGX1JFR1MuCj4KPiBUaGUgc2Vjb25kIHBhdGNoIGlzIHRvIGJ1aWxkIHBlcmYgcmVnaXN0ZXIg
ZnVuY3Rpb25zLCB3aXRob3V0IHVzaW5nIHRoZQo+IG1hY3JvICdIQVZFX1BFUkZfUkVHU19TVVBQ
T1JUJyB0byBzdGF0aWNhbGx5IHR1cm4gb24gb3Igb2ZmIGNvZGUuCj4KPiBUaGUgdGhpcmQgcGF0
Y2ggaXMgdG8gaW50cm9kdWNlIGEgd2VhayBmdW5jdGlvbiBhcmNoX19zYW1wbGVfcmVnX21hc2tz
KCksCj4gdGhpcyBmdW5jdGlvbiBjYW4gYWxsb3cgdGhlIHRhcmdldCBhcmNoIHRvIHJldHVybiBp
dHMgc2FtcGxlIHJlZ2lzdGVyCj4gbGlzdC4gIFdpdGggdGhpcyBjaGFuZ2UsIHdlIGNhbiB0b3Rh
bGx5IHJlbW92ZSB0aGUgbWFjcm8KPiAnSEFWRV9QRVJGX1JFR1NfU1VQUE9SVCcgaW4gdGhlIHNv
dXJjZSBmaWxlLgo+Cj4gVGhlIGZvcnRoIHBhdGNoIGlzIHRvIGNsZWFuIHVwIHRoZSBNYWtlZmls
ZSBmb3IgcmVtb3ZpbmcgcmVsZXZhbnQKPiBjb25maWd1cmF0aW9uIGFuZCBtYWNybyBkZWZpbml0
aW9uLCBhcyB0aGV5IGFyZSBub3QgdXNlZnVsIGFueW1vcmUuCj4KPiBJIHRlc3RlZCB0aGlzIHBh
dGNoIHNldCBvbiBBcm02NCBhbmQgeDg2IGZvciBidWlsZGluZyBhbmQgZGlkIGEgY3Jvc3MKPiBy
ZWdpc3RlciBwYXJzaW5nICgncGVyZiByZWNvcmQnIG9uIEFybTY0IGFuZCAncGVyZiByZXBvcnQn
IG9uIHg4NikuCj4KPgo+IExlbyBZYW4gKDQpOgo+ICAgcGVyZiBidWlsZDogUmVtb3ZlIHVudXNl
ZCBDT05GSUdfUEVSRl9SRUdTCj4gICBwZXJmIHBhcnNlLXJlZ3M6IEFsd2F5cyBidWlsZCBwZXJm
IHJlZ2lzdGVyIGZ1bmN0aW9ucwo+ICAgcGVyZiBwYXJzZS1yZWdzOiBJbnRyb2R1Y2UgYSB3ZWFr
IGZ1bmN0aW9uIGFyY2hfX3NhbXBsZV9yZWdfbWFza3MoKQo+ICAgcGVyZiBidWlsZDogQ2xlYW51
cCBwZXJmIHJlZ2lzdGVyIGNvbmZpZ3VyYXRpb24KClRoYW5rcyBMZW8sIHRoaXMgaXMgZ3JlYXQg
Y2xlYW51cCEgU2VyaWVzOgpSZXZpZXdlZC1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUu
Y29tPgoKSWFuCgo+ICB0b29scy9wZXJmL01ha2VmaWxlLmNvbmZpZyAgICAgICAgICAgICAgICAg
ICAgfCAyNSAtLS0tLS0tLS0tLS0tLQo+ICB0b29scy9wZXJmL2FyY2gvYXJtL3V0aWwvcGVyZl9y
ZWdzLmMgICAgICAgICAgfCAgNyArKystCj4gIHRvb2xzL3BlcmYvYXJjaC9hcm02NC91dGlsL21h
Y2hpbmUuYyAgICAgICAgICB8ICAyICsrCj4gIHRvb2xzL3BlcmYvYXJjaC9hcm02NC91dGlsL3Bl
cmZfcmVncy5jICAgICAgICB8ICA3ICsrKy0KPiAgdG9vbHMvcGVyZi9hcmNoL2Nza3kvdXRpbC9w
ZXJmX3JlZ3MuYyAgICAgICAgIHwgIDcgKysrLQo+ICB0b29scy9wZXJmL2FyY2gvbG9vbmdhcmNo
L3V0aWwvcGVyZl9yZWdzLmMgICAgfCAgNyArKystCj4gIHRvb2xzL3BlcmYvYXJjaC9taXBzL3V0
aWwvcGVyZl9yZWdzLmMgICAgICAgICB8ICA3ICsrKy0KPiAgdG9vbHMvcGVyZi9hcmNoL3Bvd2Vy
cGMvdXRpbC9wZXJmX3JlZ3MuYyAgICAgIHwgIDcgKysrLQo+ICB0b29scy9wZXJmL2FyY2gvcmlz
Y3YvdXRpbC9wZXJmX3JlZ3MuYyAgICAgICAgfCAgNyArKystCj4gIHRvb2xzL3BlcmYvYXJjaC9z
MzkwL3V0aWwvcGVyZl9yZWdzLmMgICAgICAgICB8ICA3ICsrKy0KPiAgdG9vbHMvcGVyZi9hcmNo
L3g4Ni91dGlsL3BlcmZfcmVncy5jICAgICAgICAgIHwgIDcgKysrLQo+ICB0b29scy9wZXJmL3V0
aWwvcGFyc2UtcmVncy1vcHRpb25zLmMgICAgICAgICAgfCAgOCArKy0tLQo+ICAuLi4vdXRpbC9w
ZXJmLXJlZ3MtYXJjaC9wZXJmX3JlZ3NfYWFyY2g2NC5jICAgfCAgNCAtLS0KPiAgLi4uL3BlcmYv
dXRpbC9wZXJmLXJlZ3MtYXJjaC9wZXJmX3JlZ3NfYXJtLmMgIHwgIDQgLS0tCj4gIC4uLi9wZXJm
L3V0aWwvcGVyZi1yZWdzLWFyY2gvcGVyZl9yZWdzX2Nza3kuYyB8ICA0IC0tLQo+ICAuLi4vdXRp
bC9wZXJmLXJlZ3MtYXJjaC9wZXJmX3JlZ3NfbG9vbmdhcmNoLmMgfCAgNCAtLS0KPiAgLi4uL3Bl
cmYvdXRpbC9wZXJmLXJlZ3MtYXJjaC9wZXJmX3JlZ3NfbWlwcy5jIHwgIDQgLS0tCj4gIC4uLi91
dGlsL3BlcmYtcmVncy1hcmNoL3BlcmZfcmVnc19wb3dlcnBjLmMgICB8ICA0IC0tLQo+ICAuLi4v
dXRpbC9wZXJmLXJlZ3MtYXJjaC9wZXJmX3JlZ3NfcmlzY3YuYyAgICAgfCAgNCAtLS0KPiAgLi4u
L3BlcmYvdXRpbC9wZXJmLXJlZ3MtYXJjaC9wZXJmX3JlZ3NfczM5MC5jIHwgIDQgLS0tCj4gIC4u
Li9wZXJmL3V0aWwvcGVyZi1yZWdzLWFyY2gvcGVyZl9yZWdzX3g4Ni5jICB8ICA0IC0tLQo+ICB0
b29scy9wZXJmL3V0aWwvcGVyZl9yZWdzLmMgICAgICAgICAgICAgICAgICAgfCAxMSArKysrLS0K
PiAgdG9vbHMvcGVyZi91dGlsL3BlcmZfcmVncy5oICAgICAgICAgICAgICAgICAgIHwgMzQgKy0t
LS0tLS0tLS0tLS0tLS0tLQo+ICAyMyBmaWxlcyBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspLCAx
MTIgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
