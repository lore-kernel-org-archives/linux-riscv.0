Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A110AC021BE
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 05:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VS7Nc4f4jLsz0XVMdBVzXvTXKEAuNr82G//qIN1s5Ew=; b=n/pjAyA8kmBsTi
	PwyM/RwNH90C+Vp/t5uj0PSwsZkVFg4VqDCZIEkxZQ0EnrpIEpbqvHNku/sCIMwTKkeA1IXU7UR2n
	jcjb729yUmlT1CpFuHeuG27E7sYnfvSgPcuWG5x+YiEfPpzMiL0aM72SIRGXc8HGl7FQpfAOuH8yn
	uw8qugFnw5iMIKWWbAh8xp148uKsjKbbmxa0eFsoSq5CYKymKLrPZxqnrMYVujptfuQOUPX47YjO2
	kRUqHv44RyECiOtZWEYTqIaW+TNLkDHBlMvqq6BQMWoe1pxomULEt9EE/wDH8qQtrCMbssLDIz/7C
	p1MxAL1vM2knvGGDvhbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWNp-00000006Mma-3wNe;
	Thu, 27 Feb 2025 05:24:29 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWNn-00000006MlU-2FKu
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 05:24:29 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22342c56242so112605ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Feb 2025 21:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740633867; x=1741238667; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnEz81f237FPFDdRQFlVRCVwc99gvba5x2QOCkc+RR0=;
        b=a9+VHVnfYPkvnbCntNBNXO3bidVPjQcwkfrIr8w1yJcWnrZQK+fVnTv6VTFHdrnhWX
         eBTp0LJH5iI57YuH1GiHD8mvP1OCBEAJEF0MLsutMTwat0T6HvVE0Q7eGYmzEU70h31Y
         ceikQjm8/iPoujj8wE8PmdYAaxUAiiaIV4QMxk62a78LZmFnPhN7ObYZCNJDnHA04Gui
         1GyVfr6VYIj2VgtaWI+TLf+s++WGaKo/Vfpj+Cojs0y1oEDle2f6Ght+13WWWVZeh7S1
         8hQwoDmRxjorAESdTJgVtIOHniZGAX64Rq48P4AK505mTcLIAbnY1sJGjDTCoGR3pLxg
         AMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740633867; x=1741238667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnEz81f237FPFDdRQFlVRCVwc99gvba5x2QOCkc+RR0=;
        b=rZOuXRWOSbcv/KsMsjzkX9CZAAPitCTSeI5rbFsPfVRsDy1pKrRFrx9S94HyrhxeqL
         RCoRqQLqgx225z6LF+HfXDBobk2tTxGDHNN1CYJAvwnQwFPnQpdGQDDFva8Abx0DaBdF
         N+GdeABUP1NIY5SNSJIwDAwhQARIaTrfYRwEHGdY+nSk8o+aGG5ed0wztzwsrCC81R7C
         Nqwj4GGCJVDh3WCLPGGwULro1CGnpVZSIYeGQTGrAKoduj0e2TrIx/sNh1Cb+SCd+aSr
         ie4s5FHqn8WDhdypxRE+27ycZyyAbajLjEah6sOLBe4oxYXvixvRdDf1YD8gurGwr0ee
         79Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXU1rW8cvw6Ro2E/vGn67K+ONZpTwn2D3jsSuGgxMzB3FYjyHFDepI3fDEtXMnFpeW4lVqZEuY/oY079g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiLVj4xRWN3mrWAkYeO5UOEsuOPg5dQgJfgb4wS5r5WeTVCoGq
	FsVOXnUzKgy81kwKMUI+yFeF99RYGz9Glq1CHwJmmpi2nWGSB1olnlFKy77z9cHcDGBca+BQapl
	aO6vCiA/INQgmor4ka3CNgo8elMWBNXa1UPv6
X-Gm-Gg: ASbGncsbbXJR5kyfZazTBYwwnYGBgBX3ixr86DrfiRQT3zQ/nJGRK7/WfpRsutV7kql
	X7naw69wr34wUyaH+gDCjjCjD6rKa+rkUIN4HU8Xy7f7yYAKhI9Prd0KeeEIo2mJe7K+NdqfxXO
	MeEfaqA2FL
X-Google-Smtp-Source: AGHT+IESGHDEUIPVrjNTh39ynN60aQSgX7N+PvnUqhcTHIKp7IZB5bqsgXo3vv32FxrjQl6qmhQtj7bSXHofxTNEMow=
X-Received: by 2002:a17:902:f7cc:b0:200:97b5:dc2b with SMTP id
 d9443c01a7336-223517240a4mr1111615ad.15.1740633866391; Wed, 26 Feb 2025
 21:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20250219185657.280286-1-irogers@google.com> <Z702_CQ7nMx9fZQn@google.com>
 <CAP-5=fWYiQP84BMjm69xud4vYaRrutRG-RASKbxQaGSisRm7jA@mail.gmail.com> <Z7-rN8iGUpPe6b-1@google.com>
In-Reply-To: <Z7-rN8iGUpPe6b-1@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 26 Feb 2025 21:24:15 -0800
X-Gm-Features: AQ5f1JpYoEre35TWzYAHXMZBSPsriPeINrD-jPxutBzlTEFdOvLRV6EZPh8_ULw
Message-ID: <CAP-5=fVAuCF4i8HQEGYx_ApcSuBg82pXCsgk98oU9-2Gm=NOcw@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] perf: Support multiple system call tables in the build
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, guoren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	linux-mips@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_212427_618226_9E1B47EC 
X-CRM114-Status: GOOD (  45.04  )
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

T24gV2VkLCBGZWIgMjYsIDIwMjUgYXQgNDowMOKAr1BNIE5hbWh5dW5nIEtpbSA8bmFtaHl1bmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEZlYiAyNCwgMjAyNSBhdCAwODoyMjo1MFBN
IC0wODAwLCBJYW4gUm9nZXJzIHdyb3RlOgo+ID4gT24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgNzoy
MOKAr1BNIE5hbWh5dW5nIEtpbSA8bmFtaHl1bmdAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IE9uIFdlZCwgRmViIDE5LCAyMDI1IGF0IDEwOjU2OjQ5QU0gLTA4MDAsIElhbiBSb2dlcnMg
d3JvdGU6Cj4gPiA+ID4gVGhpcyB3b3JrIGJ1aWxkcyBvbiB0aGUgY2xlYW4gdXAgb2Ygc3lzdGVt
IGNhbGwgdGFibGVzIGFuZCByZW1vdmFsIG9mCj4gPiA+ID4gbGliYXVkaXQgYnkgQ2hhcmxpZSBK
ZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4uCj4gPiA+ID4KPiA+ID4gPiBUaGUgc3lzdGVt
IGNhbGwgdGFibGUgaW4gcGVyZiB0cmFjZSBpcyB1c2VkIHRvIG1hcCBzeXN0ZW0gY2FsbCBudW1i
ZXJzCj4gPiA+ID4gdG8gbmFtZXMgYW5kIHZpY2UgdmVyc2EuIFByaW9yIHRvIHRoZXNlIGNoYW5n
ZXMsIGEgc2luZ2xlIHRhYmxlCj4gPiA+ID4gbWF0Y2hpbmcgdGhlIHBlcmYgYmluYXJ5J3MgYnVp
bGQgd2FzIHByZXNlbnQuIFRoZSB0YWJsZSB3b3VsZCBiZQo+ID4gPiA+IGluY29ycmVjdCBpZiB0
cmFjaW5nIHNheSBhIDMyLWJpdCBiaW5hcnkgZnJvbSBhIDY0LWJpdCB2ZXJzaW9uIG9mCj4gPiA+
ID4gcGVyZiwgdGhlIG5hbWVzIGFuZCBudW1iZXJzIHdvdWxkbid0IG1hdGNoLgo+ID4gPiA+Cj4g
PiA+ID4gQ2hhbmdlIHRoZSBidWlsZCBzbyB0aGF0IGEgc2luZ2xlIHN5c3RlbSBjYWxsIGZpbGUg
aXMgYnVpbHQgYW5kIHRoZQo+ID4gPiA+IHBvdGVudGlhbGx5IG11bHRpcGxlIHRhYmxlcyBhcmUg
aWRlbnRpZmlhYmxlIGZyb20gdGhlIEVMRiBtYWNoaW5lIHR5cGUKPiA+ID4gPiBvZiB0aGUgcHJv
Y2VzcyBiZWluZyBleGFtaW5lZC4gVG8gZGV0ZXJtaW5lIHRoZSBFTEYgbWFjaGluZSB0eXBlLCB0
aGUKPiA+ID4gPiBleGVjdXRhYmxlJ3MgaGVhZGVyIGlzIHJlYWQgZnJvbSAvcHJvYy9waWQvZXhl
IHdpdGggZmFsbGJhY2tzIHRvIHVzaW5nCj4gPiA+ID4gdGhlIHBlcmYncyBiaW5hcnkgdHlwZSB3
aGVuIHVua25vd24uCj4gPiA+Cj4gPiA+IEhtbS4uIHRoZW4gdGhpcyBpcyBsaW1pdGVkIHRvIGxp
dmUgbW9kZSBhbmQgcG90ZW50aWFsbHkgZGV0ZWN0IHdyb25nCj4gPiA+IG1hY2hpbmUgdHlwZSBp
ZiBpdCByZWFkcyBhbiBvbGQgZGF0YSwgcmlnaHQ/Cj4gPiA+Cj4gPiA+IEFsc28gSUlVQyBmYWxs
YmFjayB0byB0aGUgcGVyZiBiaW5hcnkgbWVhbnMgaXQgY2Fubm90IHVzZSBjcm9zcy1tYWNoaW5l
Cj4gPiA+IHRhYmxlLiAgRm9yIGV4YW1wbGUsIGl0IGNhbm5vdCBwcm9jZXNzIGRhdGEgZnJvbSBB
Uk02NCBvbiB4ODYsIG5vPyAgSXQKPiA+ID4gc2VlbXMgaXQgc2hvdWxkIHVzZSBwZXJmX2Vudi5h
cmNoLgo+ID4KPiA+IFRoZSBwZXJmIGVudiBhcmNoIGlzIGtpbmQgb2YgaG9ycmlkLiBPbiB4ODYg
aXQgaGFzIHRoZSB2YWx1ZSB4ODYgYW5kCj4gPiB0aGVuIHRoZXJlIGlzIGFuIGV4dHJhIDY0Yml0
IGZsYWcsIHdobyBrbm93cyBob3cgeDMyIHNob3VsZCBiZSBlbmNvZGVkCj4gPiAtIGJ1dCB3ZSBi
YXJlbHkgc3VwcG9ydCB4MzIgYXMtaXMuIEknZCByYXRoZXIgd2UgYWRkZWQgYSBuZXcgZmVhdHVy
ZQo+ID4gZm9yIHRoZSBlX21hY2hpbmUvZV9mbGFncyBvZiB0aGUgZXhlY3V0YWJsZSBhbmQgd29y
a2VkIHdpdGggdGhvc2UsIGJ1dAo+ID4gaXQgaXMga2luZCBvZiB3ZWlyZCB3aXRoIGRvaW5nIHN5
c3RlbSB3aWRlIG1vZGUuIEkgZGlkbid0IHdhbnQgdG8gZHJhZwo+ID4gdGhhdCBpbnRvIHRoaXMg
cGF0Y2ggc2VyaWVzIGFueXdheSBhcyB0aGVyZSBpcyBhbHJlYWR5IGVub3VnaCBoZXJlLgo+Cj4g
UmlnaHQsIEkgZG9uJ3Qga25vdyBob3cgdG8gaGFuZGxlIHgzMiBwcm9wZXJseS4gIE1heWJlIHdl
IGNhbiBqdXN0Cj4gaWdub3JlIGl0IGZvciBub3cuCj4KPiBCdXQgYW55d2F5IGxvb2tpbmcgYXQg
L3Byb2MvUElEIGZvciByZWNvcmRlZCBkYXRhIGRvZXNuJ3Qgc2VlbSBjb3JyZWN0Lgo+IENhbiB5
b3UgcGxlYXNlIGFkZCBhIGZsYWcgdG8gZG8gdGhhdCBvbmx5IGZyb20gdHJhY2VfX3J1bigpIGFu
ZCBqdXN0IHVzZQo+IEVNX0hPU1QgZm9yIHRyYWNlX19yZXBsYXkoKT8KClNvIEkgd2FzIGhvcGlu
ZyBhdCBzb21lIGxhdGVyIHBvaW50IHRoZSBlX21hY2hpbmUgb24gdGhlIHRocmVhZCBjb3VsZApi
ZSBwb3B1bGF0ZWQgZnJvbSB0aGUgZGF0YSBmaWxlIC0gaGVuY2UgdGhlIGFjY2Vzc29yIGJlaW5n
IG9uIHRocmVhZAphbmQgbm90IHBhcnQgb2YgdGhlIHRyYWNlIGNvZGUuIFdlIGNvdWxkIGFkZCBh
IGdsb2JhbCBmbGFnIHRvIHRocmVhZAp0byBkaXNhYmxlIHRoZSByZWFkaW5nIGZyb20gL3Byb2Mg
YnV0IHdlIGRvIHNpbWlsYXIgcmVhZGluZyBpbgptYWNoaW5lLmMgZm9yIC9wcm9jL3ZlcnNpb24s
IC9wcm9jL2thbGxzeW1zLCAvcHJvYy9tb2R1bGVzLCBldGMuIEkKdGhpbmsgdGhlIGNoYW5jZSBh
IHBpZCBpcyByZWN5Y2xlZCBhbmQgdGhlIHByb2Nlc3MgaGFzIGEgZGlmZmVyZW50CmVfbWFjaGlu
ZSBhcmUgcmVtb3RlIGVub3VnaCB0aGF0IGl0IGlzIHNpbWlsYXIgaW4gbmF0dXJlLiBBZGRpbmcg
dGhlCmZsYWcgbWVhbnMgd2UgbmVlZCB0byBnbyBhbmQgZml4IHVwIGFsbCB1c2VzLCB3ZSBvbmx5
IG5lZWQgdG8gc2V0IHRoZQpmbGFnIGluIGJ1aWx0aW4tdHJhY2UuYyBjdXJyZW50bHksIGJ1dCB3
ZSd2ZSBiZWVuIGhpc3RvcmljYWxseSBiYWQgYXQKc2V0dGluZyB0aGVzZSBnbG9iYWxzIGFuZCBi
dWdzIGNyZWVwIGluLiBJIGFsc28gZG9uJ3QgdGhpbmsKcmVjb3JkL3JlcGxheSBpcyB3b3JraW5n
IHdlbGwgYW5kIEkgZGlkbid0IHdhbnQgdGhlIHN5c2NhbGx0YmwgY2xlYW51cAp0byB0dXJuIGlu
dG8gYSBwZXJmIHRyYWNlIHJlY29yZC9yZXBsYXkgZml4aW5nIGV4ZXJjaXNlLgoKVGhhbmtzLApJ
YW4KCj4gTGF0ZXIsIHdlIG1heSBuZWVkIHRvIGFkZCBhIG1pc2MgZmxhZyBvciBzbyB0byBQRVJG
X1JFQ09SRF9GT1JLIChhbmQKPiBQRVJGX1JFQ09SRF9DT01NIHdpdGggTUlTQ19DT01NX0VYRUMp
IHRvIGluZGljYXRlIG5vbi1zdGFuZGFyZCBBQkkgZm9yIGEKPiBuZXcgdGhyZWFkLiAgQnV0IGl0
J3Mgbm90IGNsZWFyIGhvdyB0byBtYWtlIGl0IGFyY2gtaW5kZXBlbmRlbnQuCj4KPiA+Cj4gPiA+
IE9uZSBtb3JlIGNvbmNlcm4gaXMgQlBGLiAgVGhlIEJQRiBzaG91bGQga25vdyBhYm91dCB0aGUg
QUJJIG9mIHRoZQo+ID4gPiBjdXJyZW50IHByb2Nlc3Mgc28gdGhhdCBpdCBjYW4gYXVnbWVudCB0
aGUgc3lzY2FsbCBhcmd1bWVudHMgY29ycmVjdGx5Lgo+ID4gPiBDdXJyZW50bHkgaXQgb25seSBj
aGVja3MgdGhlIHN5c2NhbGwgbnVtYmVyIGJ1dCBpdCBjYW4gYmUgZGlmZmVyZW50IG9uCj4gPiA+
IDMyLWJpdCBhbmQgNjQtYml0Lgo+ID4KPiA+IFRoYXQncyByaWdodC4gVGhpcyBjaGFuZ2UgaXMg
dHJ5aW5nIHRvIGNsZWFuIHVwCj4gPiB0b29scy9wZXJmL3V0aWwvc3lzY2FsbHRibC5jIGFuZCB0
aGUgcGVyZiB0cmFjZSB1c2FnZS4gSSBkaWRuJ3QgZ28gYXMKPiA+IGZhciBhcyBtYWtpbmcgQlBG
IHByb2dyYW1zIHBhaXIgc3lzdGVtIGNhbGwgbnVtYmVyIHdpdGggZV9tYWNoaW5lIGFuZAo+ID4g
ZV9mbGFncywgdGhlcmUgaXMgZW5vdWdoIGhlcmUgYW5kIHRoZSBiZWhhdmlvciBhZnRlciB0aGVz
ZSBwYXRjaGVzCj4gPiBtYXRjaGVzIHRoZSBiZWhhdmlvciBiZWZvcmUgLSB0aGF0IGlzIHRvIGFz
c3VtZSB0aGUgc3lzdGVtIGNhbGwgQUJJCj4gPiBtYXRjaGVzIHRoYXQgb2YgdGhlIHBlcmYgYmlu
YXJ5Lgo+Cj4gUmlnaHQsIHRoZSBuZXh0IHN0ZXAgd291bGQgYmUgYWRkaW5nIGEgQlBGIGtmdW5j
IHRvIGlkZW50aWZ5IHRoZSBjdXJyZW50Cj4gQUJJLgo+Cj4gVGhhbmtzLAo+IE5hbWh5dW5nCj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
