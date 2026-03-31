Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6468510F92E9
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 17:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yg7ZFCTvX2wCJzU0J7gOdEYAoLUeZTcc/63PmGFHsIk=; b=ti8P8xKhLefbO2
	m8R9NBqAyiMh4TLaQ3Vp132pFOBUlJ3tShgu4N8kjtuKPlv7+rJe6FEoIyFyEnR0UZxHuwahu/IH4
	+ycOvOvZEYZ6ssM/deRtpljICgO2oP9b6nAqXb3QalzLBrhhB4wXWIVkcfCqTP73vd69nHdjpzCLB
	e/BlrT2A4+pG9Eor5ioRhyYcOYu3adsl4rWWPqY4lBfcVTp5wDszPcJJCHpLnbeA622I+z322SOX7
	coBANcInBCPBv5u+WEceJSCQJNxhXSRnsdcRboWzu4b4JPM8jGrhRRgkIm39E7jAxgW5j4+dmmXVb
	l4t1+aPLB8Qp/ao6AHBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cTK-0000000DIIK-2sTz;
	Tue, 31 Mar 2026 17:01:46 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cTI-0000000DIHZ-1hbe
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 17:01:45 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-126ea4e9697so11913c88.1
        for <linux-riscv@lists.infradead.org>; Tue, 31 Mar 2026 10:01:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774976503; cv=none;
        d=google.com; s=arc-20240605;
        b=PrNRBmuCHyNp4p53oNKR6jglhAfbc6BpQILmfJIdmkFtVUZXNuFD0hMqYZ/AeuQL23
         hBZCp2k8/fvMesViJbK1Fhi+4hQQYNyW4KdxrZSbnVmx0Umu28zLfy6Mj1n78aNHCM+w
         G2NLH7vYDslpnXaJdrf0gNFxgB0HcJCm/jGPexRPtz4SsBRrrYUqajYhYSukgGJQRZfH
         WR/6iE8/3Ced+VKc3GTxl2vPmuaaETUHQs56DVCPfpiNyRWn/zi7rcA0/FjPxK8ZNiXQ
         OWLc/p812OxxzaME3nc/iks/VHS0DdV1L5s+07mU252WlyFYErpwiIH/WRvbgB6W6dFx
         +oYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l98tvJP33qg7yUNaZsXGxPv2Z0+17QhIZr8805RPT0Y=;
        fh=3szppOsfwJ0vHFg90DgPU+6kHQGZSJCSlxf5svUop2c=;
        b=iJXBpNEsmwcPBfQAw7Kt0o5pbYmLx5MvObLumWKh57gbyVyxFCOkzhL2J1qckCdG/q
         xE3+n9wMNfGcaCQqRRA9fh8SSRwzHCsEMxhsEHGvsHeo1L/YqEEvucJIZWPMDxXUQoM6
         ecga9vswC1NiGX4D0xtU8l00XPnpfCxoogYMfit5edQzCHHD1WDfxA2lVRMuu80+DYXr
         CECNfGx1jONAhuL41xdR/MMZxS8OcF9jedz3wpKHYsJv3VX5KAhk2S2X/oDVGIg0aSRw
         +jvc86LaHba/EtN7OdhTetUb1YukhLf7rr6LrQdjNwmdvmrJp8nz3haSI+1NRwvgOcC4
         ZOtQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774976503; x=1775581303; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l98tvJP33qg7yUNaZsXGxPv2Z0+17QhIZr8805RPT0Y=;
        b=dt/wgGqC7ZHEQEw+Ksy98SrbFUC1Cf6lnKdycCNFfPXHhDCgkV3G6xf/D9q3qF9G67
         iR8Poc+d10XcVc1OEfoHdgsdYT/TGRyPMbVwC1UikXmXfjRf7A54l2XPt4gGzIzipsSF
         l4PPx0H5krAHCV0M2o0XLbpwgAzw0RApJDJ/TnBsRndKjdHKRmdOwcLogxEEADgTLnAN
         gefOKMlsRBoC2sq81PZDXkWNMJOhtwPcws4yEar/4dtRoP10VIqAvWNitfu/UIjBMV3k
         NOwWAwtCIfk0ieF21wp10Kh7mOpHPNYRFFliVMeILwHrsD0IFTDq0PlA+EHBIMtSWkFI
         AVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774976503; x=1775581303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l98tvJP33qg7yUNaZsXGxPv2Z0+17QhIZr8805RPT0Y=;
        b=Dl7sapjuargKyrm6nRjwYN65brFGZLZPJHm/r152wbHT7L8/ntv3QfdYCDEaIt+Z8w
         DNZN8PSlJg/jtGG+5FG3jkUMIQa3HbFxl2hhYyMx23La6w/W7WTCqUChPxqbST+5M6id
         j5KZIgpIXEANfzMtlLnFJ6ijuObet1LI+hBq6L2IpgPrCePEeD79n9FFqTIBJt0j81Mk
         FHhwbPAM4ZCogst0FFGf7r1n/buNZFE1E2zTca8Gr5KYbbxFPyHXnIadL/kylJSzi5ZN
         fcsgGX21RVSF/5KcGzYTi7wb6Ki7rHcOdFtrsLgd+xVF/o4oHW1mkvDSO5ABAKLAptwa
         QHFg==
X-Forwarded-Encrypted: i=1; AJvYcCV8oeBPcjWQa/zLTCiVLV5Fpj8lSAb7XdqARlD3RhL5jS7LiB5ehE5kb3gS2jRTkQJ9ngiLAVg5YMRo1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4/ToLsHh3+2l4hnWWFil2kKyKKlUnfoqZvM3D8jDLOIXrddWd
	PCzhS5CSIXN4rNcYbLeI2jGZvK3b6Lfl9TIwDsu1n82Ki9dkNrb+GL2rftqIm1UxMRMx7Kv8OzO
	zTodf89Whvabi6bBB+QJQIvF6Q6wavBhHE2+CqzaV
X-Gm-Gg: ATEYQzzgyLDiCQatispvriGPw1WuVu6Ok68eu0g1zh2BGR3qMU/fx80Fhi9gp/spKl+
	s/XKPZbgNuePaulNvUvCuSxSS3Xsz1znt9df7wfAfxw3DLSRLz6zHSayoPVeW8vDyj6xXo9nvBI
	CpTqSqM2SWfApNK4FDUPxpG1VGQfGIZWsXV4OT9uGr5HI2Gi6tUYgBgpdZ9VpfwcMRTtK7C4mLL
	yc7Tb1pIk0SVWZsgN90VRTiEJF3twADHJaQhvWalXjE4GNFV8kwvCclWDAkXWG6Lq67FZOZ8PNY
	XBlOr9+kCzG1HjRRNeh1wXnN19zL9NtiqD80hw==
X-Received: by 2002:a05:7022:6987:b0:12a:8cf4:65d8 with SMTP id
 a92af1059eb24-12be6159009mr19765c88.14.1774976502067; Tue, 31 Mar 2026
 10:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAP-5=fWVU3ktkGAnZQrjQJf+Z5AtQo73BVUhj-nr3H95GdcEJQ@mail.gmail.com>
 <20260305221927.3237145-1-irogers@google.com> <20260305221927.3237145-3-irogers@google.com>
 <acrln3IwOebvb6yj@x1>
In-Reply-To: <acrln3IwOebvb6yj@x1>
From: Ian Rogers <irogers@google.com>
Date: Tue, 31 Mar 2026 10:01:29 -0700
X-Gm-Features: AQROBzAxOb5Fj0tz8CFxXnvG80J893x9iFJ4Ie0P731uMqrcv3OK1B9SMHLInoA
Message-ID: <CAP-5=fXn+uNEfZ71a5zZ5BdKw8-LfWgpzye8+eTJH32gL1=b_Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] perf build loongarch: Remove reference to missing file
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: 9erthalion6@gmail.com, adrian.hunter@intel.com, alex@ghiti.fr, 
	alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com, 
	aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, blakejones@google.com, 
	ctshao@google.com, dapeng1.mi@linux.intel.com, howardchu95@gmail.com, 
	james.clark@linaro.org, john.g.garry@oracle.com, jolsa@kernel.org, 
	leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com, 
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com, 
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org, yuzhuo@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_100144_446389_2CC0C754 
X-CRM114-Status: GOOD (  15.44  )
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

T24gTW9uLCBNYXIgMzAsIDIwMjYgYXQgMjowNeKAr1BNIEFybmFsZG8gQ2FydmFsaG8gZGUgTWVs
bwo8YWNtZUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgTWFyIDA1LCAyMDI2IGF0IDAy
OjE5OjIxUE0gLTA4MDAsIElhbiBSb2dlcnMgd3JvdGU6Cj4gPiBUaGUgZmlsZSB3YXMgcmVtb3Zl
ZCBpbiBjb21taXQgZTYyZmFlOWQ5ZTg1ICgicGVyZiB1bndpbmQtbGliZHc6IEZpeCBhCj4gPiBj
cm9zcy1hcmNoIHVud2luZGluZyBidWciKSBidXQgdGhlIEJ1aWxkIGZpbGUgbm90IHVwZGF0ZWQu
Cj4gPgo+ID4gRml4ZXM6IGNvbW1pdCBlNjJmYWU5ZDllODUgKCJwZXJmIHVud2luZC1saWJkdzog
Rml4IGEgY3Jvc3MtYXJjaCB1bndpbmRpbmcgYnVnIikKPgo+IFJlbW92aW5nIHRoZSAnY29tbWl0
JyBwYXJ0LgoKVGhhbmtzLCBjaGVja3BhdGNoIGNhdWdodCB0aGlzIGJ1dCBzb21laG93IEkgbWlz
c2VkIGl0LgoKSWFuCgo+IC0gQXJuYWxkbwo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBJYW4gUm9nZXJz
IDxpcm9nZXJzQGdvb2dsZS5jb20+Cj4gPiAtLS0KPiA+ICB0b29scy9wZXJmL2FyY2gvbG9vbmdh
cmNoL3V0aWwvQnVpbGQgfCAxIC0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL2FyY2gvbG9vbmdhcmNoL3V0aWwvQnVpbGQg
Yi90b29scy9wZXJmL2FyY2gvbG9vbmdhcmNoL3V0aWwvQnVpbGQKPiA+IGluZGV4IDNhZDczZDAy
ODlmMy4uOGQ5MWU3OGQzMWM5IDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvcGVyZi9hcmNoL2xvb25n
YXJjaC91dGlsL0J1aWxkCj4gPiArKysgYi90b29scy9wZXJmL2FyY2gvbG9vbmdhcmNoL3V0aWwv
QnVpbGQKPiA+IEBAIC0xLDQgKzEsMyBAQAo+ID4gIHBlcmYtdXRpbC15ICs9IGhlYWRlci5vCj4g
Pgo+ID4gIHBlcmYtdXRpbC0kKENPTkZJR19MT0NBTF9MSUJVTldJTkQpICs9IHVud2luZC1saWJ1
bndpbmQubwo+ID4gLXBlcmYtdXRpbC0kKENPTkZJR19MSUJEV19EV0FSRl9VTldJTkQpICs9IHVu
d2luZC1saWJkdy5vCj4gPiAtLQo+ID4gMi41My4wLjQ3My5nNGE3OTU4Y2ExNC1nb29nCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
