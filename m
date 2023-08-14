Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB88C001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 16:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6OkWUJRTkQXunZvMxRQHE9zZCgyFvjX95aqwwQWCDNg=; b=Ov87mH+B7pAT+a
	S1j/kYcfRmU5owdEVKaWG6e/FU7jekjpb3j5bXi8yCDjrbYjgI/OP21Y01i76fR4GM5QCpkF6M+Oc
	1MjDG1P0F7VAZbo0En1FrNyGwUEMQK9aAeeUyNULduYz0pFRpCIiyECJRnaQ/Vcjq6FduHQPW7cTO
	KhshI2RFji4i69EFyhkzuEM05O9zP36Of7PDeoLf16QzTrwMNALQ+DorNr1Gwu5C85NeYC6abQtrK
	i5LyISSXtop8CLMk0OK8YrZdfOnScFrf0hgt1tKMqsn5xutTzkJSm9z/nqLd6WI2qG0HhSuFlf6Op
	Yn4wairGCloDMVtjYjmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVagP-00HZns-2J;
	Mon, 14 Aug 2023 16:44:45 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVagN-00HZme-0X
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 16:44:44 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3492e05be7cso2405ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 09:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692031482; x=1692636282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KXPrAStR12aDL51nwQABf9ix/0Q7n4sXO4NMniW8cc=;
        b=UGhkLfl1MElLYpBWre4N8rfcTTkCn+BCtzJP1Nf4Exoi4CGx/rVX0MaiPDqH5fjFX/
         fNBAOFxqWn5N9BkZlAGEe/DQtzNjtloHnJMSagB2iEK9nY6PjnKurmNHor1vVk5gMHCK
         63CVsWAsCMWpwIL7HrQqeEANJ4aJ3Nib/M4K6ELwA0R2d31+XJEtD/4hp5EzRzAvg/47
         VvM7xy9dz1Am+eMNLMhyHIYGbIR7wbaoMX+15xM4uBEXx0HuKUu8M7wDvV4nEanp/qOt
         CfCZy9aP54tqKIE1NH4+3mB1NPcv4tMGo6AN16O4xS4WdFAbJXY1p5getsdz1VQWCI6b
         j3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692031482; x=1692636282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KXPrAStR12aDL51nwQABf9ix/0Q7n4sXO4NMniW8cc=;
        b=mFvmQB6z5EsKdFiq4hl7hMUTQIIK5X/u0+h3gU95KrCQ+rRmLxLocoIl7jRhWAf+/s
         xRa35Zv+xfp1IysCjmm1lSMKwyT4f5KAiSzWrUEas+MZpk72McH/yqNdvQ3YUk6OV278
         8UqTi5Ruate8nxGiYeyyWyr3hIAmVuUFnd7cvthE1IX/0F/Os9jnqXU0hhISOaHoxQwi
         m5nkjuuvpu+4YvBpH+DpbhBqI58s3aekAq9pG2+BxDvOgL1Ehh7dF4vPEf3LnfdLRd2N
         ZBgCw3AT/TrOB04shlVXBQPhiP0QQvUOvxWwFQ21xyETERErR0Te+64/OrkO6WyR44gu
         2qHw==
X-Gm-Message-State: AOJu0YzXT7o+7xjkt/lacdlKS5Cp3GTMwAO5vJuTMwiZanahj1+K5EOA
	1R88ehe0DSUEOWMm/ASaYrQxlZEUAChYaImZa3anyA==
X-Google-Smtp-Source: AGHT+IFOzjGtKiWLy03OiyHrBN0kpiXV4ZOPGD8JA08f6Z8vU3wqmAQpLCW07oLHz7zD6SI66eEdSE0XZjRV20/5KQE=
X-Received: by 2002:a05:6e02:1b86:b0:349:3c79:e634 with SMTP id
 h6-20020a056e021b8600b003493c79e634mr697261ili.17.1692031481932; Mon, 14 Aug
 2023 09:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230802080328.1213905-1-alexghiti@rivosinc.com> <20230802080328.1213905-10-alexghiti@rivosinc.com>
In-Reply-To: <20230802080328.1213905-10-alexghiti@rivosinc.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 14 Aug 2023 09:44:29 -0700
Message-ID: <CAP-5=fWZ8GDBn3fUUzjwknLq4KZV4tepX03oDn092zzboC8Dgw@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] tools: lib: perf: Implement riscv mmap support
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_094443_212614_CB1AF654 
X-CRM114-Status: GOOD (  19.12  )
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

T24gV2VkLCBBdWcgMiwgMjAyMyBhdCAxOjEz4oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IHJpc2N2IG5vdyBzdXBwb3J0cyBtbWFwaW5nIGhh
cmR3YXJlIGNvdW50ZXJzIHNvIGFkZCB3aGF0J3MgbmVlZGVkIHRvCj4gdGFrZSBhZHZhbnRhZ2Ug
b2YgdGhhdCBpbiBsaWJwZXJmLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxh
bGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25l
c0B2ZW50YW5hbWljcm8uY29tPgo+IFJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJp
dm9zaW5jLmNvbT4KClJldmlld2VkLWJ5OiBJYW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+
CgpUaGFua3MsCklhbgoKPiAtLS0KPiAgdG9vbHMvbGliL3BlcmYvbW1hcC5jIHwgNjYgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
NjYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYi9wZXJmL21tYXAuYyBi
L3Rvb2xzL2xpYi9wZXJmL21tYXAuYwo+IGluZGV4IDBkMTYzNGNlZGY0NC4uMjE4NDgxNGIzN2Rk
IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2xpYi9wZXJmL21tYXAuYwo+ICsrKyBiL3Rvb2xzL2xpYi9w
ZXJmL21tYXAuYwo+IEBAIC0zOTIsNiArMzkyLDcyIEBAIHN0YXRpYyB1NjQgcmVhZF9wZXJmX2Nv
dW50ZXIodW5zaWduZWQgaW50IGNvdW50ZXIpCj4KPiAgc3RhdGljIHU2NCByZWFkX3RpbWVzdGFt
cCh2b2lkKSB7IHJldHVybiByZWFkX3N5c3JlZyhjbnR2Y3RfZWwwKTsgfQo+Cj4gKy8qIF9fcmlz
Y3ZfeGxlbiBjb250YWlucyB0aGUgd2l0ZGggb2YgdGhlIG5hdGl2ZSBiYXNlIGludGVnZXIsIGhl
cmUgNjQtYml0ICovCj4gKyNlbGlmIGRlZmluZWQoX19yaXNjdikgJiYgX19yaXNjdl94bGVuID09
IDY0Cj4gKwo+ICsvKiBUT0RPOiBpbXBsZW1lbnQgcnYzMiBzdXBwb3J0ICovCj4gKwo+ICsjZGVm
aW5lIENTUl9DWUNMRSAgICAgIDB4YzAwCj4gKyNkZWZpbmUgQ1NSX1RJTUUgICAgICAgMHhjMDEK
PiArCj4gKyNkZWZpbmUgY3NyX3JlYWQoY3NyKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiArKHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgcmVnaXN0ZXIgdW5zaWduZWQgbG9u
ZyBfX3Y7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgIF9f
YXNtX18gX192b2xhdGlsZV9fICgiY3NyciAlMCwgJTEiICAgICAgICAgICAgIFwKPiArICAgICAg
ICAgICAgICAgIDogIj1yIiAoX192KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+ICsgICAgICAgICAgICAgICAgOiAiaSIgKGNzcikgOiApOyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICBfX3Y7ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiArfSkKPiArCj4gK3N0YXRpYyB1bnNpZ25lZCBsb25n
IGNzcl9yZWFkX251bShpbnQgY3NyX251bSkKPiArewo+ICsjZGVmaW5lIHN3aXRjaGNhc2VfY3Ny
X3JlYWQoX19jc3JfbnVtLCBfX3ZhbCkgICAgICAgICAgIHtcCj4gKyAgICAgICBjYXNlIF9fY3Ny
X251bTogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAg
IF9fdmFsID0gY3NyX3JlYWQoX19jc3JfbnVtKTsgICAgICAgICAgICBcCj4gKyAgICAgICAgICAg
ICAgIGJyZWFrOyB9Cj4gKyNkZWZpbmUgc3dpdGNoY2FzZV9jc3JfcmVhZF8yKF9fY3NyX251bSwg
X192YWwpICAgICAgICAge1wKPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWQoX19jc3JfbnVt
ICsgMCwgX192YWwpICAgICAgICBcCj4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkKF9fY3Ny
X251bSArIDEsIF9fdmFsKX0KPiArI2RlZmluZSBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzQoX19jc3Jf
bnVtLCBfX3ZhbCkgICAgICAgICB7XAo+ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZF8yKF9f
Y3NyX251bSArIDAsIF9fdmFsKSAgICAgIFwKPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRf
MihfX2Nzcl9udW0gKyAyLCBfX3ZhbCl9Cj4gKyNkZWZpbmUgc3dpdGNoY2FzZV9jc3JfcmVhZF84
KF9fY3NyX251bSwgX192YWwpICAgICAgICAge1wKPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3Jl
YWRfNChfX2Nzcl9udW0gKyAwLCBfX3ZhbCkgICAgICBcCj4gKyAgICAgICBzd2l0Y2hjYXNlX2Nz
cl9yZWFkXzQoX19jc3JfbnVtICsgNCwgX192YWwpfQo+ICsjZGVmaW5lIHN3aXRjaGNhc2VfY3Ny
X3JlYWRfMTYoX19jc3JfbnVtLCBfX3ZhbCkgICAgICAgIHtcCj4gKyAgICAgICBzd2l0Y2hjYXNl
X2Nzcl9yZWFkXzgoX19jc3JfbnVtICsgMCwgX192YWwpICAgICAgXAo+ICsgICAgICAgc3dpdGNo
Y2FzZV9jc3JfcmVhZF84KF9fY3NyX251bSArIDgsIF9fdmFsKX0KPiArI2RlZmluZSBzd2l0Y2hj
YXNlX2Nzcl9yZWFkXzMyKF9fY3NyX251bSwgX192YWwpICAgICAgICB7XAo+ICsgICAgICAgc3dp
dGNoY2FzZV9jc3JfcmVhZF8xNihfX2Nzcl9udW0gKyAwLCBfX3ZhbCkgICAgIFwKPiArICAgICAg
IHN3aXRjaGNhc2VfY3NyX3JlYWRfMTYoX19jc3JfbnVtICsgMTYsIF9fdmFsKX0KPiArCj4gKyAg
ICAgICB1bnNpZ25lZCBsb25nIHJldCA9IDA7Cj4gKwo+ICsgICAgICAgc3dpdGNoIChjc3JfbnVt
KSB7Cj4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzMyKENTUl9DWUNMRSwgcmV0KQo+ICsg
ICAgICAgZGVmYXVsdDoKPiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICB9Cj4gKwo+
ICsgICAgICAgcmV0dXJuIHJldDsKPiArI3VuZGVmIHN3aXRjaGNhc2VfY3NyX3JlYWRfMzIKPiAr
I3VuZGVmIHN3aXRjaGNhc2VfY3NyX3JlYWRfMTYKPiArI3VuZGVmIHN3aXRjaGNhc2VfY3NyX3Jl
YWRfOAo+ICsjdW5kZWYgc3dpdGNoY2FzZV9jc3JfcmVhZF80Cj4gKyN1bmRlZiBzd2l0Y2hjYXNl
X2Nzcl9yZWFkXzIKPiArI3VuZGVmIHN3aXRjaGNhc2VfY3NyX3JlYWQKPiArfQo+ICsKPiArc3Rh
dGljIHU2NCByZWFkX3BlcmZfY291bnRlcih1bnNpZ25lZCBpbnQgY291bnRlcikKPiArewo+ICsg
ICAgICAgcmV0dXJuIGNzcl9yZWFkX251bShDU1JfQ1lDTEUgKyBjb3VudGVyKTsKPiArfQo+ICsK
PiArc3RhdGljIHU2NCByZWFkX3RpbWVzdGFtcCh2b2lkKQo+ICt7Cj4gKyAgICAgICByZXR1cm4g
Y3NyX3JlYWRfbnVtKENTUl9USU1FKTsKPiArfQo+ICsKPiAgI2Vsc2UKPiAgc3RhdGljIHU2NCBy
ZWFkX3BlcmZfY291bnRlcih1bnNpZ25lZCBpbnQgY291bnRlciBfX21heWJlX3VudXNlZCkgeyBy
ZXR1cm4gMDsgfQo+ICBzdGF0aWMgdTY0IHJlYWRfdGltZXN0YW1wKHZvaWQpIHsgcmV0dXJuIDA7
IH0KPiAtLQo+IDIuMzkuMgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
