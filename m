Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AF6CD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 19:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S8WEYMNlhgGbCY93RgBRXlGqOa6CzP/Ltc0eLil53ak=; b=J8KdMbI9b4SmlD
	UlPVJx9774EE3DgY+NzKIHE350ZyINXlqNwXk+NyYbbKX/iMMjQ99NQODcpYZdo6xC7vGWLDfTGZg
	K+BxtVUJ+O/qo0qVGMtcIQ5dRIgr4YKAi85+nT9IZJOgnQhkuCpX86ORLvyDIAeIwYGQl/6+jgP4i
	/XqcVzDXEHVCvSSQn+U+s1C5QFCOV1L4Bd5TidCfS92vZfw0I9fEJJFECwhBPWlkglWU+FNYi83PD
	6rGnJztrtZBqgiCbX7jTTSwhkkAUanaNSBMZSUi96W97tm3V8waQnAOgQ9dQSXhx+4gVuhoI5vwPG
	y+e/WAKDTTU2V3KNmiaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyND-00000009EcN-2RJQ;
	Fri, 15 May 2026 19:39:03 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyNB-00000009EbE-0yIt
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 19:39:02 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ba180a022dso6475ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 May 2026 12:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778873940; cv=none;
        d=google.com; s=arc-20240605;
        b=Qk7XW9YxNd3ObH1sWG8rSKKsYI7NMJ36VW6JByFq3RQUvhwGhlh3wE+yLFoittgfeP
         zRdI4+ordDBcLVUXJb+ytZVnvFFM30P+eX76q0pNxFv4T1XiLgD9XurfccFKYL/K5rBU
         ca2Gv6h8fdd5w0OFT6GpBfU8MTiJaxDTX9coqWsx/22r+9oxyVZexCYAHuEclZ7Sm4iG
         fmbDYanxNQTydLPL22nAhXtscdj0MfneWan4L9olJV2UAHXqYVeREpqk9GKem7cILMZ+
         4u6nPo20mbD5KbLUXYrV6yrJbUJYLOh8vd/ibcLX6tJcfhKOUWoHfDEyA/srSlr4TWzO
         pFww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IYpIIZ9l/Mh5nFdtuzxg/eCZabaH9dxjddO1/8L86VA=;
        fh=FShTXkmw57C44KU51pjcpCEw3tYmXIcWcxLAkztNIOc=;
        b=Konk9Zie/qIbP/7tPUMvsqqSEAubZ2JsiTTVNBZW1NuEMjHpESILJeZqVxcfcvS2Sf
         Z55tcaXkydK1piFoetzxCA49aDNry9dGz2GCMkKEtFwHZrNylh87uts6dauybGB2n+cS
         WsQ96wKKjkTKHS/5BOCw2zcfet/maOVN9HMyVV3na5A91p4Ecgp7bNkei7wBF26ewwKD
         qcJKPrjP7kygaYYBoIHIuoCT6l9by5l2Bz8fCNG2XgcYtSIdtrUeLM1OJ0gL4BW/SYvB
         FvrymXICGMOjtaiKG2XonZskRN+Lp5Q/kp/u4A8oHDkTf83QJu3RjHTWmPsWJyj6UnpP
         Jcow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778873940; x=1779478740; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYpIIZ9l/Mh5nFdtuzxg/eCZabaH9dxjddO1/8L86VA=;
        b=N3PnoTEKObD21YKynAguLy0yF7jIP4Mg9SCglHt04GJw50wZL59Mn2octW37Q1U3On
         UgRAPLGPRK/Ymj9HREvkqxvDcW3gflQK7LmReuk6mkHYWEknzsn26bn08+65ukFI2qDT
         ni662FgVaNS7A3hA5iCyM77cejyShGUBg2+9Qmb+JYMGwEu0fnDpVOfeePUY3R+IePLK
         Fo1M5UloZqDeDXc64ZAGAlv30zU/G2nx+iMKg9lx/1q72eEV9/TuispH0/MBYXtizcU1
         KqpByMbIZoMULT4iqaREVFF6F7w/IXyRoZLwhXedLB5ysTufBpQey3OGauJwW+VoAzfk
         7FrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778873940; x=1779478740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IYpIIZ9l/Mh5nFdtuzxg/eCZabaH9dxjddO1/8L86VA=;
        b=EP1UKYEfct1btH0OTnfCz5+8QdiozU8CHl2+xuw5jVJNK6FIkDqEc/oHkD2Sj9FAAs
         vBpFgq40TL+eFD9nDkde85IbezKiET9Ysbsfo05htEHjE8BunolwLilj/sCsExnUI4jr
         7JCvTao5NF7XgvijJxnYMJw8+FBfc5r2Ga14gQ5i8Q/3mKQ1ti7MFE1tbnVBltroL+ul
         E7SbKcGiagDR1sG1kBkxRfPyoSntudDlDpEc9u/6RpIX7nb37McjYsvfBLr0pYRHT2pu
         2O+XWacWiZbm6x/ApwC+KUi0HOHaXPzI9FrYsw8D3bIL+RCqL9h8wcmhq1oYfGdYLUmJ
         nt0A==
X-Forwarded-Encrypted: i=1; AFNElJ9zkEsndUtBT3XM3RbxyHRtTel4yQygC+DPX2YtAb/QG+BQTfLL0Oo5XkhpIONGQyrTGPhmUOWldnlJvw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1/MCxGhQkwhjydd2VXFmAzj4vy5lHgy2O+b/eFk9C973O8vxg
	NOIiXaYZ6DwBfJdTjy5TylmcRHhognbhuiGfUKusULrbuhqtQSDpNonHMGE5sFaLJh5WufU5h6k
	377VM+ubmF3JDUQ/6wN6rdKd/sr33MM8tdZJ3rhan9YopOq/3iDxJfODz
X-Gm-Gg: Acq92OErn4J2dklXE10EukyP3jEA7Di7Aa/zbPy/cIZJl91UmzXYNOTmALOsbEPNAph
	G7wp9/oAIMkWqYwXHo34w3kZ0Vz2SR+Nv3hd0YQlSNdZfbpIe5FEgZQVG/sGw23H0378XytxaJu
	PDYbX1awGh3GXF143duQ2Udu7OAHSEKcHP+xlKUtJr+0fiC88FAkBVtZ5g/ME8CuldeuNCtE+Qi
	KWqwgXvZsbQLPnr1DqIvulY7l2nCCUMhp/rEEuLrWBgKD1BNfe/uNPY3t2YCKrVsCS/9dua7Hbn
	/qBfZ/Hh8pqjbNtb8RE=
X-Received: by 2002:a17:902:d502:b0:2bd:bbe:e3a3 with SMTP id
 d9443c01a7336-2bda0d8369amr548535ad.10.1778873939803; Fri, 15 May 2026
 12:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260413024805.1316480-1-irogers@google.com> <20260513233151.572332-1-irogers@google.com>
 <20260513233151.572332-5-irogers@google.com> <agdyluuau3wPQOtX@x1>
In-Reply-To: <agdyluuau3wPQOtX@x1>
From: Ian Rogers <irogers@google.com>
Date: Fri, 15 May 2026 12:38:48 -0700
X-Gm-Features: AVHnY4Lb9u9dPRlfZ_lWNCr7BMoBHYS17-9qKyqj0HY7xDzks8g3D3teRStrsVs
Message-ID: <CAP-5=fUeGOSH1LO1oSbWnpmXfv_RzxfFE+YCQ07PC19gLHDEsA@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] perf unwind-libunwind: Make libunwind register
 reading cross platform
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, namhyung@kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Li Guan <guanli.oerv@isrc.iscas.ac.cn>, 
	9erthalion6@gmail.com, alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	howardchu95@gmail.com, john.g.garry@oracle.com, jolsa@kernel.org, 
	leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org, 
	shimin.guo@skydio.com, tglozar@redhat.com, tmricht@linux.ibm.com, 
	will@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_123901_283213_14AD52E9 
X-CRM114-Status: GOOD (  20.40  )
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

T24gRnJpLCBNYXkgMTUsIDIwMjYgYXQgMTI6MjPigK9QTSBBcm5hbGRvIENhcnZhbGhvIGRlIE1l
bG8KPGFjbWVAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1heSAxMywgMjAyNiBhdCAw
NDozMTo0OFBNIC0wNzAwLCBJYW4gUm9nZXJzIHdyb3RlOgo+ID4gLS0tIC9kZXYvbnVsbAo+ID4g
KysrIGIvdG9vbHMvcGVyZi91dGlsL2xpYnVud2luZC1hcmNoL2xpYnVud2luZC1wcGMzMi5jCj4g
PiBAQCAtMCwwICsxLDMxIEBACj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAtb3ItbGF0ZXIKPiA+ICsjaW5jbHVkZSAibGlidW53aW5kLWFyY2guaCIKPiA+ICsjaW5jbHVk
ZSAiLi4vZGVidWcuaCIKPiA+ICsjaW5jbHVkZSAiLi4vLi4vLi4vYXJjaC9wb3dlcnBjL2luY2x1
ZGUvdWFwaS9hc20vcGVyZl9yZWdzLmgiCj4gPiArI2luY2x1ZGUgPGxpbnV4L2NvbXBpbGVyLmg+
Cj4gPiArI2luY2x1ZGUgPGVycm5vLmg+Cj4gPiArCj4gPiArI2lmZGVmIEhBVkVfTElCVU5XSU5E
X1BQQzMyX1NVUFBPUlQKPiA+ICsjaW5jbHVkZSA8bGlidW53aW5kLXBwYzMyLmg+Cj4gPiArI2Vu
ZGlmCj4gPiArCj4gPiAraW50IF9fZ2V0X3BlcmZfcmVnbnVtX2Zvcl91bndfcmVnbnVtX3BwYzMy
KGludCB1bndfcmVnbnVtIF9fbWF5YmVfdW51c2VkKQo+ID4gK3sKPiA+ICsjaWZuZGVmIEhBVkVf
TElCVU5XSU5EX1BQQzMyX1NVUFBPUlQKPiA+ICsgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gKyNl
bHNlCj4gPiArICAgICBzd2l0Y2ggKHVud19yZWdudW0pIHsKPiA+ICsgICAgIGNhc2UgVU5XX1BQ
QzMyX1IwIC4uLiBVTldfUFBDMzJfUjMxOgo+ID4gKyAgICAgICAgICAgICByZXR1cm4gdW53X3Jl
Z251bSAtIFVOV19QUEMzMl9SMCArIFBFUkZfUkVHX1BPV0VSUENfUjA7Cj4gPiArICAgICBjYXNl
IFVOV19QUEMzMl9MUjoKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIFBFUkZfUkVHX1BPV0VSUENf
TElOSzsKPiA+ICsgICAgIGNhc2UgVU5XX1BQQzMyX0NUUjoKPiA+ICsgICAgICAgICAgICAgcmV0
dXJuIFBFUkZfUkVHX1BPV0VSUENfQ1RSOwo+ID4gKyAgICAgY2FzZSBVTldfUFBDMzJfWEVSOgo+
ID4gKyAgICAgICAgICAgICByZXR1cm4gUEVSRl9SRUdfUE9XRVJQQ19YRVI7Cj4gPiArICAgICBk
ZWZhdWx0Ogo+ID4gKyAgICAgICAgICAgICBwcl9lcnIoInVud2luZDogaW52YWxpZCByZWcgaWQg
JWRcbiIsIHVud19yZWdudW0pOwo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+
ICsgICAgIH0KPiA+ICsjZW5kaWYgLy8gSEFWRV9MSUJVTldJTkRfUFBDMzJfU1VQUE9SVAo+Cj4g
VG8gYWRkcmVzcyB0aGlzIGxvY2FsIHNhc2hpa28gY29tbWVudDoKPgo+IC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IElzIHRoZSBp
bnN0cnVjdGlvbiBwb2ludGVyIChOSVApIGludGVudGlvbmFsbHkgb21pdHRlZCBmcm9tIHRoaXMg
c3dpdGNoCj4gc3RhdGVtZW50Pwo+Cj4gV2hlbiBsaWJ1bndpbmQgYXR0ZW1wdHMgdG8gcmVhZCB0
aGUgaW5zdHJ1Y3Rpb24gcG9pbnRlciwgd2lsbCBhY2Nlc3NfcmVnKCkKPiBoaXQgdGhlIGRlZmF1
bHQgY2FzZSBoZXJlIGFuZCByZXR1cm4gLUVJTlZBTCwgY2F1c2luZyBzdGFjayB1bndpbmRpbmcK
PiB0byBmYWlsIG9uIDMyLWJpdCBQb3dlclBDIGFyY2hpdGVjdHVyZXM/Cj4gRm9yIGNvbXBhcmlz
b24sIHRoZSA2NC1iaXQgaW1wbGVtZW50YXRpb24gaW4gbGlidW53aW5kLXBwYzY0LmMgY29ycmVj
dGx5Cj4gbWFwcyBVTldfUFBDNjRfTklQIHRvIFBFUkZfUkVHX1BPV0VSUENfTklQLgo+IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
Cj4gSSBhbW1lbmRlZCB0aGlzIHBhdGNoIHdpdGg6Cj4KPiDirKIgW2FjbWVAdG9vbGJ4IHBlcmYt
dG9vbHMtbmV4dF0kIHZpbSB0b29scy9wZXJmL3V0aWwvbGlidW53aW5kLWFyY2gvbGlidW53aW5k
LXBwYzMyLmMKPiDirKIgW2FjbWVAdG9vbGJ4IHBlcmYtdG9vbHMtbmV4dF0kIGdpdCBkaWZmCj4g
ZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvdXRpbC9saWJ1bndpbmQtYXJjaC9saWJ1bndpbmQtcHBj
MzIuYyBiL3Rvb2xzL3BlcmYvdXRpbC9saWJ1bndpbmQtYXJjaC9saWJ1bndpbmQtcHBjMzIuYwo+
IGluZGV4IGJjZGVlZDM0ZDBhODFiOGQuLjk3NmExNjAzMDQwNzM1ODIgMTAwNjQ0Cj4gLS0tIGEv
dG9vbHMvcGVyZi91dGlsL2xpYnVud2luZC1hcmNoL2xpYnVud2luZC1wcGMzMi5jCj4gKysrIGIv
dG9vbHMvcGVyZi91dGlsL2xpYnVud2luZC1hcmNoL2xpYnVud2luZC1wcGMzMi5jCj4gQEAgLTIz
LDYgKzIzLDggQEAgaW50IF9fZ2V0X3BlcmZfcmVnbnVtX2Zvcl91bndfcmVnbnVtX3BwYzMyKGlu
dCB1bndfcmVnbnVtIF9fbWF5YmVfdW51c2VkKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gUEVS
Rl9SRUdfUE9XRVJQQ19DVFI7Cj4gICAgICAgICBjYXNlIFVOV19QUEMzMl9YRVI6Cj4gICAgICAg
ICAgICAgICAgIHJldHVybiBQRVJGX1JFR19QT1dFUlBDX1hFUjsKPiArICAgICAgIGNhc2UgVU5X
X1BQQzMyX05JUDoKPiArICAgICAgICAgICAgICAgcmV0dXJuIFBFUkZfUkVHX1BPV0VSUENfTklQ
Owo+ICAgICAgICAgZGVmYXVsdDoKPiAgICAgICAgICAgICAgICAgcHJfZXJyKCJ1bndpbmQ6IGlu
dmFsaWQgcmVnIGlkICVkXG4iLCB1bndfcmVnbnVtKTsKPiAgICAgICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7Cj4g4qyiIFthY21lQHRvb2xieCBwZXJmLXRvb2xzLW5leHRdJAo+Cj4gT2s/IEl0
IHdhcyB0aGUgb25seSBpc3N1ZSBmb3VuZCBpbiB0aGlzIHBhdGNoLgoKTG9va3MgZ29vZCwgdGhl
IE5JUCBpcyBpbiB0aGUgb3JpZ2luYWwgY29kZSB0aGF0IEkgY29waWVkLCBzbyBJIGRvbid0CnVu
ZGVyc3RhbmQgaG93IEkgbG9zdCB0aGlzLCBidXQgZ29vZCBjYXRjaCEKClRoYW5rcywKSWFuCgo+
IC0gQXJuYWxkbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
