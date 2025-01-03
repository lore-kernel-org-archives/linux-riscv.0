Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF93FE77197
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jan 2025 01:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5DouryArN3c53yjqsTJaEHSnjZJSl6Rg8tkMwJAPXo0=; b=FssryTc0HCBPgJ
	1eNcLWArRoNeQPmbv4Vx+PCg/vyPhgcJ7mneMYXb9stwL8SiPiz8tHzB1YH6zhD61cG9n0VUFQc61
	QuJGjA11NtZQMvOLBuoPdiSGE45FqMp+T6XwZvg9N8MUNQ4XDTx3vRe3NSZbOx6c8ceePqT2tpe4Y
	cxndfhwgF0wCufrYUZzlG3MZNIQbT7R/OV4OIfKxxkQDfj1DkdIj7JvDu7okNJWB+HqSChdUnt15R
	eZpBoiHj8LcO1UFTIE+D1lpyU5MxJVV6bSNZI/GvJRsG1eQqxyGpozmKC/3+DUnCsSTiDEn13+qIk
	Qt9IhYjE/yduiZtFsmDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTWlJ-0000000BrEm-0c4C;
	Fri, 03 Jan 2025 01:46:05 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTWkG-0000000Br7C-2vMA
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jan 2025 01:45:02 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21649a7bcdcso159096935ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jan 2025 17:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1735868700; x=1736473500; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pJ3eKF6usIayHtABB82uMYDq9+VNdHrqEKVZK5a0SvE=;
        b=fIWZeD/+29d6gOxooyYrL/pwk83hYCZsAELlar7kBYXpZ+bK1eIhJQBHnDhX51Ivfa
         Ai5J6oZjw5LiooIPwhdx/OXWoE74RmDJPHC9ry683dCCzI+z8IU0A/C4uylHKa01XIy9
         rwUZh8qPj0TgRzObYD+U/c9rpV+I+FGQZoTlAR4USLH+bRZbbhxSQsSqVAU6SXpDLAYF
         MaIMdkWQtaLAbVvkBSNReUh0KAc6SZCPxzB/EXPv8qJiEmeHL7AjpfVXBib3XgFMBRx5
         6VJs736YX0k2Nt37Eu73xYwEKUFKbRV4fVcM2uo2cgc9M0+5EIIBbALY/+505oTTPhYR
         Yb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735868700; x=1736473500;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJ3eKF6usIayHtABB82uMYDq9+VNdHrqEKVZK5a0SvE=;
        b=CT5Szyi5zKA75ynNDa2RIPpwtmNwLT6D1zr/LdWZYvHpoGiwOJnzTIgGJHxVoFXx/r
         V0CWv2YXoEn5cMSQgpwgb6fefZYQNFyb2qtp+ZU33b+seM+EG8HtOFK8KG97GhgppJeE
         g2lefOtsmS513RHFR6xC8hWLmG6Adq7p90xaIrPL2dxwa7/HTmmsUar5L2u6+xHaKyrV
         9OADEOQHccBoc45eUK/4jx6yrTproHhvFK2qRhhaOLJlMlYUuPS/YKVFLTTEIOHexHQD
         ftJlvvlPGDQedEbAynbNEYt/Md6CZzos0UQQSO7A82YtQiSWCo177w9rMYMFwhioQYWI
         lzfA==
X-Forwarded-Encrypted: i=1; AJvYcCVoRn8SBbnMuIyck07mukED5LMk1HVVawCHxsFK6JDMDpcU//PWM6pTnqlmsb6GbNzSZNTcm8sHfaiOZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpLSC9pHt0g5How12G7i6T3IDeAEPqGyEiQ/aPe/LLPn6MqmyE
	NAuSKV1llJPikKKP0DV5pAEsn48GnY7ZdfM7uRdgLoTif9dgQCas1iYnTeMmrhY=
X-Gm-Gg: ASbGncsYRqHL4E3f4Bs1kpiHbSc/+T1u5TnfAY4VZz+4Fx8j5UsfPjt5kUL5M6uHMlV
	bRPj8ZOT0HhLISlLE02KCcUUFV+viN+hagTjXD+ceubPseDwP3BWcPnXB50W4RfqLvPnEyZoq7/
	EnMNXKlg+82GK12RMjOxOGGpyzeNfRRds3rVYtIXb8bv/N2/36a0Jx7zJtrmqBxik2JCdghUcGw
	b1B7cZa1f2kWsJk77K7vJzlEMlS70vUz0+Z6x16LppG66oSUlmw
X-Google-Smtp-Source: AGHT+IGlJOK8lsWm8Cmc19QjQZCDFg/Q+5Dom/f2Np8/qC3K9ofC60FF2YnXzD02V2GYbVMkVLFEug==
X-Received: by 2002:a05:6a00:124a:b0:725:f4c6:6b68 with SMTP id d2e1a72fcca58-72abde404e9mr65911625b3a.4.1735868699801;
        Thu, 02 Jan 2025 17:44:59 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:e7aa:b727:e049:3265])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b20b3fbbsm19449947a12.24.2025.01.02.17.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 17:44:59 -0800 (PST)
Date: Thu, 2 Jan 2025 17:44:56 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ian Rogers <irogers@google.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] tools: perf: tests: Fix code reading for riscv
Message-ID: <Z3dBGM5L41v0RlZf@ghost>
References: <20241217-perf_fix_riscv_obj_reading-v2-1-58f81b7b4c7d@rivosinc.com>
 <CAP-5=fXK6HRzBKHzF=T_w9cn7ohWOdmZNRMXvJzN6QG11HE6tA@mail.gmail.com>
 <Z2IXl5cuKQJInJb0@ghost>
 <Z2MXXFhUzoQmW4xV@x1>
 <CAP-5=fXPPfHHVPh0nYgR96VM+smuZKepO+GoE4X+aZsQE4tHSw@mail.gmail.com>
 <Z2M4ZparbNRvRHpz@ghost>
 <CAP-5=fXL6YaEq1cvBh2iESmQ_kqfm5VH5thJ0zrkOCcaWv5s+Q@mail.gmail.com>
 <Z2NNcy1jCLqb62h2@ghost>
 <CAP-5=fUBcu=Kd7StJvwdM_ArnSdOjmAcgR7NzDd+Ep8LrNMhyw@mail.gmail.com>
 <Z2N8WLTmh0ojIzhF@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z2N8WLTmh0ojIzhF@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_174501_016748_6046E881 
X-CRM114-Status: GOOD (  70.48  )
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

T24gV2VkLCBEZWMgMTgsIDIwMjQgYXQgMDU6NTI6MjRQTSAtMDgwMCwgQ2hhcmxpZSBKZW5raW5z
IHdyb3RlOgo+IE9uIFdlZCwgRGVjIDE4LCAyMDI0IGF0IDA1OjIwOjE1UE0gLTA4MDAsIElhbiBS
b2dlcnMgd3JvdGU6Cj4gPiBPbiBXZWQsIERlYyAxOCwgMjAyNCBhdCAyOjMy4oCvUE0gQ2hhcmxp
ZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFdl
ZCwgRGVjIDE4LCAyMDI0IGF0IDAyOjEzOjIwUE0gLTA4MDAsIElhbiBSb2dlcnMgd3JvdGU6Cj4g
PiA+ID4gT24gV2VkLCBEZWMgMTgsIDIwMjQgYXQgMTowMuKAr1BNIENoYXJsaWUgSmVua2lucyA8
Y2hhcmxpZUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIFdlZCwg
RGVjIDE4LCAyMDI0IGF0IDExOjIzOjUxQU0gLTA4MDAsIElhbiBSb2dlcnMgd3JvdGU6Cj4gPiA+
ID4gPiA+IE9uIFdlZCwgRGVjIDE4LCAyMDI0IGF0IDEwOjQx4oCvQU0gQXJuYWxkbyBDYXJ2YWxo
byBkZSBNZWxvCj4gPiA+ID4gPiA+IDxhY21lQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+ID4gT24gVHVlLCBEZWMgMTcsIDIwMjQgYXQgMDQ6MzA6MTVQTSAtMDgw
MCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gT24gVHVlLCBEZWMgMTcs
IDIwMjQgYXQgMDQ6MTg6MzJQTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90ZToKPiA+ID4gPiA+ID4g
PiA+ID4gT24gVHVlLCBEZWMgMTcsIDIwMjQgYXQgMzo1MuKAr1BNIENoYXJsaWUgSmVua2lucyA8
Y2hhcmxpZUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gPiA+IEFmdGVyIGJp
bnV0aWxzIGNvbW1pdCBlNDNkODc2IHdoaWNoIHdhcyBmaXJzdCBpbmNsdWRlZCBpbiBiaW51dGls
cyAyLjQxLAo+ID4gPiA+ID4gPiA+ID4gPiA+IHJpc2N2IG5vIGxvbmdlciBzdXBwb3J0cyBkdW1w
aW5nIGluIHRoZSBtaWRkbGUgb2YgaW5zdHJ1Y3Rpb25zLiBJbmNyZWFzZQo+ID4gPiA+ID4gPiA+
ID4gPiA+IHRoZSBvYmpkdW1wIHdpbmRvdyBieSAyLWJ5dGVzIHRvIGVuc3VyZSB0aGF0IGFueSBp
bnN0cnVjdGlvbiB0aGF0IHNpdHMKPiA+ID4gPiA+ID4gPiA+ID4gPiBvbiB0aGUgYm91bmRhcnkg
b2YgdGhlIHNwZWNpZmllZCBzdG9wLWFkZHJlc3MgaXMgbm90IGN1dCBpbiBoYWxmLgo+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5z
IDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBS
ZXZpZXdlZC1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPgo+ID4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gQSBiaW51dGlscyBwYXRjaCBoYXMgYmVlbiBzZW50IGFzIHdl
bGwgdG8gZml4IHRoaXMgaW4gb2JqZHVtcCBbMV0uCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiA+ID4gPiBMaW5rOiBodHRwczovL3NvdXJjZXdhcmUub3JnL3BpcGVybWFpbC9iaW51dGlscy8y
MDI0LURlY2VtYmVyLzEzODEzOS5odG1sIFsxXQo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4g
PiA+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ID4gPiA+ID4gPiA+ID4gPiAtIERvIG9iamR1bXAgdmVy
c2lvbiBkZXRlY3Rpb24gYXQgcnVudGltZSAoSWFuKQo+ID4gPiA+ID4gPiA+ID4gPiA+IC0gTGlu
ayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTIxNi1wZXJmX2ZpeF9yaXNj
dl9vYmpfcmVhZGluZy12MS0wLWI3NTk2MjY2MGE5YkByaXZvc2luYy5jb20KPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+ID4gPiA+IC0tLSBhL3Rvb2xzL3BlcmYvdGVzdHMvY29kZS1yZWFkaW5n
LmMKPiA+ID4gPiA+ID4gPiA+ID4gPiBAQCAtMTgzLDkgKzI0NCwzMCBAQCBzdGF0aWMgaW50IHJl
YWRfdmlhX29iamR1bXAoY29uc3QgY2hhciAqZmlsZW5hbWUsIHU2NCBhZGRyLCB2b2lkICpidWYs
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICBjb25zdCBjaGFyICpmbXQ7Cj4gPiA+ID4gPiA+
ID4gPiA+ID4gICAgICAgICBGSUxFICpmOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgaW50
IHJldDsKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIHU2NCBzdG9wX2FkZHJlc3MgPSBhZGRy
ICsgbGVuOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAg
IGlmIChJU19FTkFCTEVEKF9fcmlzY3YpKSB7Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+
ID4gTm90IHN1cmUgaWYgdGhlcmUgaXMgYSBjb25zaXN0ZW5jeSBpc3N1ZSBoZXJlLiBFbHNld2hl
cmUgd2UncmUganVzdAo+ID4gPiA+ID4gPiA+ID4gPiB1c2luZyBpZmRlZiwgc3VjaCBhczoKPiA+
ID4gPiA+ID4gPiA+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvcGVyZi9wZXJmLXRvb2xzLW5leHQuZ2l0L3RyZWUvdG9vbHMvcGVyZi91dGlsL2luY2x1
ZGUvZHdhcmYtcmVncy5oP2g9cGVyZi10b29scy1uZXh0I242OQo+ID4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+ID4gPiBJIGRvbid0IGhhdmUgYW55IHN0cm9uZyBmZWVsaW5ncyBhYm91dCB0aGF0LiBJ
IGNhbiBjaGFuZ2UgaXQgdG8gYmUgYW4KPiA+ID4gPiA+ID4gPiA+IGlmZGVmLiBPbiBvdGhlciBs
aXN0cyBJIGhhdmUgYmVlbiB0b2xkIHRvIHVzZSBJU19FTkFCTEVEIHdoZW5ldmVyCj4gPiA+ID4g
PiA+ID4gPiBwb3NzaWJsZSwgYnV0IGl0J3Mgb25seSBhIHNtYWxsIGRpZmZlcmVuY2UuCj4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBDYW4ndCB3ZSBqdXN0IHVzZSB1bmFtZSBoZXJlPwo+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gU28gdGhhdCB3ZSBkb24ndCB1c2Uga2NvbmZpZy5oIHNp
bmNlIGl0cyBub3QgdXNlZCBpbiB0b29scy9wZXJmLyBhbmQKPiA+ID4gPiA+ID4gPiBtYWtlcyBp
dCBsb29rcyBsaWtlIHBlcmYgaXMgaW4gbG9ja3N0ZXAgd2l0aCB0aGUga2VybmVsIHNvdXJjZSB0
cmVlCj4gPiA+ID4gPiA+ID4gdmVyc2lvbiBpdCB3YXMgY29tcGlsZWQgZnJvbT8KPiA+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiA+ICQgZ2l0IGdyZXAga2NvbmZpZy5oIHRvb2xzL3BlcmYvCj4gPiA+
ID4gPiA+ID4gJAo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gQlRXLCB3aGF0IHdvdWxkIGhh
cHBlbiBpZiBJIGNvbGxlY3RlZCBhIHBlcmYuZGF0YSBmaWxlIG9uIHg4Nl82NCBhbmQKPiA+ID4g
PiA+ID4gPiB3b3VsZCByZWFkIGl0IGluIGEgUmlzY1YgbWFjaGluZSB3aXRoIHN1Y2ggYSBvYmpk
dW1wIHZlcnNpb24/IFRoZSBzYW1lCj4gPiA+ID4gPiA+ID4gcHJvYmxlbT8KPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gVGhpcyBjb2RlIGlzIGluIHRlc3RzIGhlbmNlIHRoaW5raW5nIHRoYXQgYSBz
ZXBhcmF0ZSBmaXggaXMgbmVlZGVkIGZvcgo+ID4gPiA+ID4gPiB0aGF0IHByb2JsZW0uIEhvcGVm
dWxseSB0aGUgdXNlIG9mIGVsZiBtYWNoaW5lL2ZsYWdzIHRhY2tsZXMgaXQ6Cj4gPiA+ID4gPiA+
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BlcmYvcGVy
Zi10b29scy1uZXh0LmdpdC90cmVlL3Rvb2xzL3BlcmYvdXRpbC9pbmNsdWRlL2R3YXJmLXJlZ3Mu
aD9oPXBlcmYtdG9vbHMtbmV4dCNuMjUKPiA+ID4gPiA+ID4gV2UgYXJlIGdldHRpbmcgc29tZXdo
YXQgZGlzYXNzZW1ibGVyIGhlYXZ5LiBXZSBoYXZlIGxsdm0gYXMgYSBsaWJyYXJ5LAo+ID4gPiA+
ID4gPiBjYXBzdG9uZSBhcyBhIGxpYnJhcnksIGJpbnV0aWxzIG9iamR1bXAgYW5kIGxsdm0gb2Jq
ZHVtcC4gR2l2ZW4gdGhlCj4gPiA+ID4gPiA+IHBhaW4gd2l0aCBwYXJzaW5nIHRleHQsIGNvdWxk
IHdlIGxvc2UgdGhlIG9iamR1bXBzPyBTaW1pbGFybHkgZm9yCj4gPiA+ID4gPiA+IGFkZHIybGlu
ZT8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBBcmUgeW91IHN1Z2dlc3RpbmcgdG8gcmVtb3ZlIHRoaXMg
dGVzdCBjYXNlIGVudGlyZWx5IHRvIGdldCByaWQgb2YgdGhlCj4gPiA+ID4gPiBvYmpkdW1wIGRl
cGVuZGVuY3k/IFRoZSBnb2FsIG9mIHRoaXMgdGVzdCBjYXNlIHNlZW1zIHRvIGJlIHRvIGNoZWNr
Cj4gPiA+ID4gPiBvYmpkdW1wIGFuZCBwZXJmIHJldHVybiB0aGUgc2FtZSBkYXRhLCBzbyBpdCBk
b2Vzbid0IHNlZW0gbGlrZSB0aGVyZQo+ID4gPiA+ID4gd291bGQgYmUgYW4gYWx0ZXJuYXRpdmUg
dG8gdXNpbmcgb2JqZHVtcC4KPiA+ID4gPgo+ID4gPiA+IEkgY2FuIGltYWdpbmUgaGF2aW5nIGFu
IG9iamR1bXAgZGVwZW5kZW5jeSBmb3IgYSB0ZXN0IGJ1dCBub3QgZm9yIHNvbWUKPiA+ID4gPiBt
b3JlIGNvcmUgbGlrZSBgcGVyZiBhbm5vdGF0ZWAuIFdlIGhhdmUgdG8gZG8gd2VpcmQgdGhpbmdz
IHdoZW4KPiA+ID4gPiBwYXJzaW5nIHRleHQsIGxpa2UgdGhpcyBjb2RlIEknbSBub3QgcHJvdWQg
b2Y6Cj4gPiA+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvcGVyZi9wZXJmLXRvb2xzLW5leHQuZ2l0L3RyZWUvdG9vbHMvcGVyZi91dGlsL3NyY2xpbmUu
Yz9oPXBlcmYtdG9vbHMtbmV4dCNuNTIzCj4gPiA+ID4gVGhlIGlzc3VlIHdpdGggdGhhdCBjb2Rl
IGlzIHRoYXQgTExWTSBvYmpkdW1wIGhhcyBjaGFuZ2VkIGl0cyBvdXRwdXQKPiA+ID4gPiBpbiBu
ZXdlciB2ZXJzaW9ucyB0byBiZSBjbG9zZXIgdG8gYmludXRpbHMgb2JqZHVtcC4gRGlkIHRoYXQg
YnJlYWsKPiA+ID4gPiBwZXJmPyBNYXliZSBpdCBqdXN0IGJyb2tlIHdoYXQgb3VyIHZhcmlhYmxl
cyB0aGluayBpcyBhbiBMTFZNIG9iamR1bXAsCj4gPiA+ID4gYnV0IHRoaW5ncyBhcmVuJ3QgcmVh
bGx5IGJyb2tlbi4gVGhpcyBraW5kIG9mIGlzc3VlIGRvZXNuJ3Qgb2NjdXIgd2l0aAo+ID4gPiA+
IGEgbGlicmFyeSwgYWx0aG91Z2ggdGhlIGRpZmZlcmluZyBuZWVkcyBvZiBsaWJyYXJ5IHZlcnNp
b25zIGlzIGEgcmVhbAo+ID4gPiA+IHRoaW5nLgo+ID4gPgo+ID4gPiBZZWFoIGRvaW5nIHRoZSBw
YXJzaW5nIG9mIHRoZSB0ZXh0IG91dHB1dCBpcyBub3QgaWRlYWwuLi4gRm9yIHRoaXMgdGVzdAo+
ID4gPiBjYXNlIGl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byBkeW5hbWljYWxseSBsaW5rIGFnYWlu
c3QgbGliYmZkLgo+ID4gCj4gPiBJIG5lZWQgdG8gd3JpdGUgdGhlIHBhdGNoIHNldCB0byBkZWxl
dGUgbGliYmZkIGZyb20gcGVyZi4gSUFOQUwgYnV0Cj4gPiB0aGUgaXNzdWUgaXMgdGhhdCBsaWJi
ZmQgaXMgcGFydCBvZiBiaW51dGlscyBhbmQgR1BMdjMsIHdoaWxlIHBlcmYgaXMKPiA+IHBhcnQg
b2YgdGhlIExpbnV4IGtlcm5lbCBhbmQgbGFyZ2VseSBHUEx2Mi4gR1BMdjMgaXMgaW5jb21wYXRp
YmxlIHdpdGgKPiA+IEdQTHYyOgo+ID4gaHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy9ncGwt
ZmFxLmh0bWwjQWxsQ29tcGF0aWJpbGl0eQo+ID4gV2hpbGUgdXNpbmcgZGxvcGVuIG1lYW5zIHdl
J3JlIG5vdCBsaW5raW5nIGFnYWluc3QgbGliYmZkLCB3ZSBtYXkKPiA+IGVmZmVjdGl2ZWx5IGJl
IHVzaW5nIGl0IGFzIGEgcGx1Z2luIHdoaWNoIGFnYWluIEdQTHYzIChpbiBteSBJQU5BTAo+ID4g
b3Bpbmlvbikgd291bGRuJ3QgYWxsb3c6Cj4gPiBodHRwczovL3d3dy5nbnUub3JnL2xpY2Vuc2Vz
L2dwbC1mYXEuZW4uaHRtbCNHUExQbHVnaW5zCj4gPiBDdXJyZW50bHkgdG8gZ2V0IGxpYmJmZCBz
dXBwb3J0IGluIHBlcmYgeW91IG5lZWQgdG8gYmUgYnVpbGRpbmcgdGhlCj4gPiBiaW5hcnkgeW91
cnNlbGYgYW5kIGFkZCB0byB0aGUgYnVpbGQgQlVJTERfTk9ORElTVFJPPTEuIFdlIGRvIHRoaXMg
YXMKPiA+IHBhcnQgb2Ygb3VyIGJ1aWxkIHRlc3RpbmcgYnV0IGhhdmluZyBhbGwgdGhlICNpZmRl
Zi1lZCBsaWJiZmQgY29kZSBpZgo+ID4gbm90aGluZyBlbHNlIG1ha2VzIHRoZSBjb2RlIGhhcmRl
ciB0byB1bmRlcnN0YW5kLgo+IAo+IExpY2Vuc2luZyBpcyBmdW4gOykKPiAKPiA+IAo+ID4gPiBJ
IHdvdWxkCj4gPiA+IGd1ZXNzIHNvbWV0aGluZyBzaW1pbGFyIGNvdWxkIGJlIGRvbmUgd2l0aCBs
bHZtLW9iamR1bXAgYnV0IEkgYW0gbGVzcwo+ID4gPiBmYW1pbGlhciB3aXRoIHRoYXQuIEkgZG9u
J3Qga25vdyBpZiB0aGF0J3MgYSBnb29kIHBhdGggdG8gZ28gZG93bgo+ID4gPiB0aG91Z2guCj4g
PiAKPiA+IEluIHRoZSBwYXN0IEkgcGVyY2VpdmVkIHRoZXJlIHdhcyBob3N0aWxpdHkgdG93YXJk
IExMVk0gZnJvbSB0aGUgTGludXgKPiA+IGtlcm5lbCBjb21tdW5pdHkuIEkgZ3Vlc3MgR1BMIHdh
cyBjb25zaWRlcmVkIHRoZSBzcGVjaWFsIHNhdWNlIGFzIHRvCj4gPiB3aHkgTGludXggd29uIGFu
ZCB0aGUgQlNEcyBoYWRuJ3QsIHNvIHRoZSBwcmVmZXJlbmNlIHdhcyB0byBmYXZvciBhCj4gPiBj
b21waWxlciB0aGF0IHVzZWQgdGhlIHNhbWUgbGljZW5zZS4gSSBkb24ndCB0aGluayB0aGF0J3Mg
dHJ1ZSBhbnkKPiA+IG1vcmUgYW5kIEkgdGhpbmsgdGhlcmUncyBhIGxvdCBvZiBzZW5zZSBpbiB1
c2luZyBMTFZNJ3MgbGlicmFyaWVzCj4gPiByYXRoZXIgdGhhbiByZWludmVudGluZyB0aGVtIGlu
IHRoZSBwZXJmIHRvb2wsIG9yIHVzaW5nIHBlcmhhcHMgbGVzcwo+ID4gb3J0aG9kb3ggc291cmNl
cyBsaWtlIGxpYmNhcHN0b25lLiBJJ20gbm90IGEgZmFuIG9mIHRoZSB0ZXh0IG91dHB1dAo+ID4g
cHJvY2Vzc2luZyBzdHVmZiBzbyBnZXR0aW5nIHJpZCBvZiBvYmpkdW1wIGFuZCBsbHZtLW9iamR1
bXAgc3VwcG9ydAo+ID4gd291bGQgYmUgZ29vZCBpbW8uCj4gCj4gWWVhaCBJIGFncmVlLiBUaGlz
IHRlc3QgY2FzZSBkaWQgZW5kIHVwIGJlaW5nIGludGVyZXN0aW5nIHRob3VnaCBhcyBpdAo+IHVu
Y29udmVyZWQgdGhpcyBjaGFuZ2UgaW4gYmVoYXZpb3Igb2Ygb2JqZHVtcCBvbiByaXNjdiwgYnV0
IHRoYXQncwo+IHRhbmdlbnRpYWwgdG8gdGhlIHB1cnBvc2Ugb2YgdGhpcyB0ZXN0IGNhc2UuIFdl
IG5lZWQgdGhpcyBwYXRjaCBvbiByaXNjdgo+IHRvIHN0b3AgdGhpcyB0ZXN0IGZyb20gZmFpbGlu
ZywgYnV0IGl0IGlzIGFsc28gcmVhc29uYWJsZSB0byBhcHByb2FjaAo+IHRoaXMgZGlmZmVyZW50
bHkgYW5kIG5vdCB1c2Ugb2JqZHVtcCBhdCBhbGwuCgpXaGF0J3MgdGhlIG5leHQgc3RlcCBoZXJl
PyBXb3VsZCB5b3UgcHJlZmVyIHRvIGdldCByaWQgb2YgdGhpcyB0ZXN0CmVudGlyZWx5PyBJIHNl
bnQgb3V0IGEgdjMgdGhhdCB1c2VzIHVuYW1lIFsxXS4KCkxpbmsKaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGttbC8yMDI0MTIxOS1wZXJmX2ZpeF9yaXNjdl9vYmpfcmVhZGluZy12My0xLWE3ZDY0
NGRjZmE1MEByaXZvc2luYy5jb20vClsxXQoKLSBDaGFybGllCgo+IAo+ID4gCj4gPiBBbm90aGVy
IGFyZWEgd2hlcmUgSSB0aGluayB3ZSBjb3VsZCBsb3NlIGEgbG90IG9mIGNvZGUgYmFnZ2FnZSBp
cyB3aXRoCj4gPiBsaWJ1bndpbmQsIGFzIEJQRiBzdXBwb3J0IHJlcXVpcmVzIGxpYmVsZiB3aGlj
aCBicmluZ3Mgd2l0aCBpdAo+ID4gbGliZHdhcnZlcyB3aGljaCB3aGVuIHByZXNlbnQgbWVhbnMg
d2UgZG9uJ3QgdXNlIGxpYnVud2luZC4gSSd2ZSBoZWFyZAo+ID4gcmVwb3J0cyB0aGF0IGxpYmR3
YXJ2ZXMgaXMgc2xvd2VyLCBidXQgSSdtIHN1cmUgd2UgY2FuIGFkZCBjYWNoZXMgdG8KPiA+IHNw
ZWVkIGl0IHVwIHdoaWNoIHdvdWxkIGxpa2VseSBiZW5lZml0IGEgcmFuZ2Ugb2YgcGVvcGxlLiBJ
IHdhcyBraW5kCj4gPiBvZiBob3Bpbmcgd2l0aCBhbGwgdGhhdCBkZWxldGVkIHdlIG1heSBiZSBh
YmxlIHRvIGdldCByaWQgb2YgdGhlCj4gPiBtYWpvcml0eSBvZiB0aGUgYXJjaCBkaXJlY3Rvcnks
IGJ1dCB0aGUgc3lzY2FsbHRibCB3b3JrIGlzIGFkZGluZyB0bwo+ID4gdGhhdCBkaXJlY3Rvcnkg
Oi0pCj4gCj4gWWVhaC4uLiBUaGUgc3lzY2FsbHRibCB3b3JrIHdpbGwgYWRkIHNvbWUgZXh0cmEg
cGFydHMgdG8gdGhlIGFyY2gKPiBkaXJlY3RvcnkuIEEgbG90IG9mIHRoZSBhZGRpdGlvbnMgYXJl
IGdlbmVyaWMgYW5kIGEgY2h1bmsgb2YKPiBhcmNoLXNwZWNpZmljIGlmZGVmcyB3ZXJlIGFibGUg
dG8gYmUgcmVtb3ZlZCwgYnV0IHdlIHN0aWxsIGhhdmUgdGhlCj4gInByb2JsZW0iIHRoYXQgbm90
IGV2ZXJ5IGFyY2hpdGVjdHVyZSB1c2VzIHRoZSBzaGFyZWQgc3lzY2FsbCB0YWJsZSBhbmQKPiBz
dXBwb3J0cyBkaWZmZXJlbnQgc3lzY2FsbHMuCj4gCj4gLSBDaGFybGllCj4gCj4gPiAKPiA+IFRo
YW5rcywKPiA+IElhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
