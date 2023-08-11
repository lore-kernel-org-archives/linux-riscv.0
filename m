Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE63EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 15:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wx79Jv3mhfVrDJ6SRY13tll1hapBXicsNK4kc0lD3nE=; b=3qpK9QoG7LiWZ/
	qXgT//lBHQcY+ncO3HqkzSQYuwsgxQ6QniUmv4DOCJmDP/lZBMFePN8hnMCrTL0cyMP6kiEpmUghw
	C0rMN2v2H+YovmdhQLEXbKcC2pUCWOeboWwxiny4C5MZ+Wd0szsOEs2GQBMd2U+6T11mmLg4qS0zt
	h5vEy9VZKBrWY8DvGrQDMpzZeznBnRqDGst7V5IG/WY+dM8TkocnY3TIaf9MyZn7k+nR9bdVSwzCA
	D2siMfdmBNeC7rDxLbIjaAiVVuaW+dZItIUGC/CifOguHN2qVkM0IOfO4NCP3PQGLc2Y7TFwp4Ona
	8z1ZVR3tdW3HJfo51ENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUTv7-00AwAh-0Z;
	Fri, 11 Aug 2023 15:19:21 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUTv3-00Aw8d-1E
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 15:19:18 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-319559fd67dso1111201f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 08:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691767155; x=1692371955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zADELGUWpGyqS4NPi0hC5rU83b70YaTQQPW65NChPlI=;
        b=PpOJJvvoZpHsn8jNHPEvN1nxCGms1gOAeA/MFe/y/MFBJC1k+8GHowKIfl2C661sWV
         Oj4csFcuW/OF0LpQ7tVVRV5X3PfQnx11ALct0kqhzNIVb+qQ1PDy8brCBGTvCCt/6BSy
         R1BPlxoc090EhGp8CeBhDwLVfUDSzemXaw3/9w2TLLI2xTeaqY8yri4zCXDjI3se0J98
         VwRIEMn3C01rkdVmAfQsmnbW0Aib/IWD9iWEsVQPElZuyH059lYcjrJcJilPApbcz+Y9
         n/xJGgmLgJ19EuCoRfmld0AUlanWpuf01WR1vAViEsa1d0ZNXOhVrBqAScsj6ZGAd7Nr
         JRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691767155; x=1692371955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zADELGUWpGyqS4NPi0hC5rU83b70YaTQQPW65NChPlI=;
        b=NyC3ulz4SToR13AHeV0upvy5y8/+XQWB3eKkvnX5H3YQBubNXpT/eLx7AAgYfYZ9tC
         f+mgtaGQppIXACnQb+eNwLcR8mwfYJovkVntrYkDdrkVKVre2OIe+hCexmGG3sbMaWEC
         aToKOqaTn9cMdF9AqHkj2eRGdOF1pFfSDZvfhtqQr4wJJV/vwDFYkOZEyQs1QWpf/PaI
         1tcq1pHvw+RJyI6j0Gw3PwFcha9z6Qyo7QA0u7MIUAypXCIErFqeBoccdg+3Z2JZ/W+M
         vKIHUQ9bgYj1b15oiMKE+WRiVlqqQOmKA9PZSQvPFhJprk2BXelQzHN7SuTEWAWxUHMN
         3BVg==
X-Gm-Message-State: AOJu0YxtMJokoCFGFkAa9mOoyRcUXXIAuBCLL1aAcu75CuWiMVw3m5DA
	nEJ3O5Z2YDsnnrVL/a8iM/KB/nlMFspev1Y0ZGBbVQ==
X-Google-Smtp-Source: AGHT+IGFjoN11JGyqXQoLlR2unjvMbQFFXcuLgu03BXMw9TDy8mziYl5bcg3wpOPRTH/LMwE2VWfpYnTL/43MNjFeOQ=
X-Received: by 2002:a05:6000:507:b0:317:de6f:22cb with SMTP id
 a7-20020a056000050700b00317de6f22cbmr1834346wrf.2.1691767154667; Fri, 11 Aug
 2023 08:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230802080328.1213905-1-alexghiti@rivosinc.com>
 <20230802080328.1213905-10-alexghiti@rivosinc.com> <20230802-7c19a712ae071f68030ab5f2@orel>
In-Reply-To: <20230802-7c19a712ae071f68030ab5f2@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 11 Aug 2023 17:19:03 +0200
Message-ID: <CAHVXubhfbZsWx9mEFG-XMKgMY3-r=ROY=7gPK7H71WpyqXFwJQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] tools: lib: perf: Implement riscv mmap support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_081917_418512_5972E2C7 
X-CRM114-Status: GOOD (  20.47  )
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

SGkgQW5kcmV3LAoKT24gV2VkLCBBdWcgMiwgMjAyMyBhdCAxMTozMuKAr0FNIEFuZHJldyBKb25l
cyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBBdWcgMDIsIDIw
MjMgYXQgMTA6MDM6MjdBTSArMDIwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gcmlzY3Yg
bm93IHN1cHBvcnRzIG1tYXBpbmcgaGFyZHdhcmUgY291bnRlcnMgc28gYWRkIHdoYXQncyBuZWVk
ZWQgdG8KPiA+IHRha2UgYWR2YW50YWdlIG9mIHRoYXQgaW4gbGlicGVyZi4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gPiBS
ZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+IFJl
dmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+ID4g
IHRvb2xzL2xpYi9wZXJmL21tYXAuYyB8IDY2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS90b29scy9saWIvcGVyZi9tbWFwLmMgYi90b29scy9saWIvcGVyZi9t
bWFwLmMKPiA+IGluZGV4IDBkMTYzNGNlZGY0NC4uMjE4NDgxNGIzN2RkIDEwMDY0NAo+ID4gLS0t
IGEvdG9vbHMvbGliL3BlcmYvbW1hcC5jCj4gPiArKysgYi90b29scy9saWIvcGVyZi9tbWFwLmMK
PiA+IEBAIC0zOTIsNiArMzkyLDcyIEBAIHN0YXRpYyB1NjQgcmVhZF9wZXJmX2NvdW50ZXIodW5z
aWduZWQgaW50IGNvdW50ZXIpCj4gPgo+ID4gIHN0YXRpYyB1NjQgcmVhZF90aW1lc3RhbXAodm9p
ZCkgeyByZXR1cm4gcmVhZF9zeXNyZWcoY250dmN0X2VsMCk7IH0KPiA+Cj4gPiArLyogX19yaXNj
dl94bGVuIGNvbnRhaW5zIHRoZSB3aXRkaCBvZiB0aGUgbmF0aXZlIGJhc2UgaW50ZWdlciwgaGVy
ZSA2NC1iaXQgKi8KPiA+ICsjZWxpZiBkZWZpbmVkKF9fcmlzY3YpICYmIF9fcmlzY3ZfeGxlbiA9
PSA2NAo+ID4gKwo+ID4gKy8qIFRPRE86IGltcGxlbWVudCBydjMyIHN1cHBvcnQgKi8KPiA+ICsK
PiA+ICsjZGVmaW5lIENTUl9DWUNMRSAgICAweGMwMAo+ID4gKyNkZWZpbmUgQ1NSX1RJTUUgICAg
IDB4YzAxCj4gPiArCj4gPiArI2RlZmluZSBjc3JfcmVhZChjc3IpICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyh7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICByZWdp
c3RlciB1bnNpZ25lZCBsb25nIF9fdjsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+
ICsgICAgICAgICAgICAgX19hc21fXyBfX3ZvbGF0aWxlX18gKCJjc3JyICUwLCAlMSIgICAgICAg
ICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgOiAiPXIiIChfX3YpICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICA6ICJpIiAoY3NyKSA6ICk7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgIF9fdjsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+Cj4gbml0OiBubyBuZWVk
IGZvciB0aGUgaW5kZW50YXRpb24gb3IgbGluZSB3cmFwLAo+Cj4gKHsKPiAgICAgICAgIHJlZ2lz
dGVyIHVuc2lnbmVkIGxvbmcgX192Owo+ICAgICAgICAgX19hc21fXyBfX3ZvbGF0aWxlX18gKCJj
c3JyICUwLCAlMSIgOiAiPXIiIChfX3YpIDogImkiIChjc3IpKTsKPiAgICAgICAgIF9fdjsKPiB9
KQo+Cj4gVGhhbmtzLAo+IGRyZXcKClNvcnJ5IEkgZGlkbid0IGFuc3dlciBzb29uZXIsIEkgd2Fz
IGJ1c3kgZmluaXNoaW5nIGV2ZXJ5dGhpbmcgYmVmb3JlCm15IGhvbGlkYXlzIDopIEkgd29uJ3Qg
aGF2ZSB0aW1lIHRvIGltcGxlbWVudCB3aGF0IHlvdSBwcm9wb3NlZCwgYW5kCm1vcmUgaW1wb3J0
YW50bHkgSSBkb24ndCBoYXZlIGEgc2V0dXAgZm9yIHJ2MzIgdG8gdGVzdCBxdWlja2x5LiBJJ2xs
CmxldCBQYWxtZXIgZGVjaWRlIGlmIHdlIGNhbiBrZWVwIHRoZSBUT0RPIHNvIHRoYXQgc29tZW9u
ZSBjYW4gZG8gdGhhdApsYXRlciBvbiB0b3Agb2YgdGhpcyBzZXJpZXMuCgpUaGFua3MgYW55d2F5
IGZvciB5b3VyIHJldmlld3MhCgpBbGV4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
