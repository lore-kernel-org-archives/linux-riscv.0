Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B7CCFB444
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 15:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vE/YoixkbpuqInyDXsyqQN8AqbHbWVPbCJoCI8/sOk=; b=pYB7gjTeYAiqAW
	FjwRA5csLMY17BZxyi2fRBhfV67rEEeHQu/o6EeiIKkekcaMfeYcR0XJZ96DJv8uImBgzHH1LPoq3
	GrZUZu3IwaHJTpzvX/hU6iCD+/PuxlR9wPWZtaTMoEUC7aBaXq6CRxH3fj7rfZ3uJLno1/Oc9+tWK
	faSaCEBc7uvJtsskciOMbxdctqGtamDXawY8kapT/9pvxWNVzMyq3hxNdxw0Rp93jzfEZx9IrLuaH
	BVnZrkGokGJTuWEzR/dibroDTxAN7mwCe6XqtSd7JEj39E2tZSDT8SEVV8fR1t4pUDpq2oC1xaaSN
	ZgQRyndYrkbDfUxuApEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxpLb-00000002sOu-3sN3;
	Mon, 07 Oct 2024 15:08:31 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxpIs-00000002rdh-4925
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 15:05:44 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3a1a662a633so792205ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2024 08:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728313540; x=1728918340; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4Ifz9XWfcAsuRFxDqc9o17TugXceR60fizX3mKXtiA=;
        b=a2ne0XR0lgtNlbTcsERkbQe644zQUg3Ypcr2BelgUT2pfmfHO03Q7FylVn2C/TwvQD
         NqV5X099ZW1R9GZUkrNxT8Kb3RnXlxuFIYWawd9xGSUsMoWn1xproEe0L4+s+NBhHPBS
         xJv7wyxRGGGsvtL6AT+sw56bD6sKxkvKgREEtH2wMxJY4KmN7NeqtBqUOm5UdYj3I76W
         XXtdKPYjZ4mcHxYV7nQRyofasD4Ea0UPwi8TKGCFN4mD2p9Qf9e9fdZqaFBBDwQ2KPQB
         I3yMCbSXoTWgBFsLH66MAc9ZnQrMYMOEKpkpDCnqBFifzofbnPAL+IEtBf4Th5ZRCYdf
         wfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728313540; x=1728918340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4Ifz9XWfcAsuRFxDqc9o17TugXceR60fizX3mKXtiA=;
        b=L3ZXIlfp3uNBmtnco9wad248A1+iVIgSMuR3jKkSpR0N20BWsQ7cEjW+uG417mI6he
         g+GslF0Bi+H5BVaee/6qpIIwZjgmhY3WzE/+5rRY6ryycE02SXGXZudZLgpm1wo7dhSp
         dUEpVmqZnciHZAUsl30eOfV1qD39SlhJ7GYjdQD8vtFOGmSLFqVgmmoO31UY7cYx996T
         pl3p+O6qYBHoL0tWkrrdwOxRaW27hcWxKrtkm/nCZS09X7p3FnENn2/AZ2MMg7EV5Mpx
         juBeT4oImd8ogQEp++xNBRj8IJe8MEHh64C08K6qK1EdGJj/n/JaXp9JCocF6/M9o5yh
         peAA==
X-Forwarded-Encrypted: i=1; AJvYcCWFLhQZHGnhifmCQ5O5Hq3dPJ7e2CpdFbj1wvZUi709UKwgHlB4iR/85den2n8TYMW2I84SlOAeCds8fQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf+eYQJFox1q5f772ZhDAydNSM7JmvN7WbYtzmWP19CrhEc0x/
	cCZyTtoq2dQfi9mYPK+iWGOrgiDmIifoHYEIsfOs/L8S3Tm1Qz2kqse96bwt5org7dGPIt3Pcta
	4H2JaCrkhJWWivu/u/1W9BviMsWd6NtWz59lv
X-Google-Smtp-Source: AGHT+IGnVEtAO00vCITXCPwm0s3FUKY4msYOxpuQ04Ol0pYaHnJTKEoTr54hveiZ6TGX6FxH3wcrfJ/ceNrrrrwICog=
X-Received: by 2002:a05:6e02:b29:b0:3a0:a2c9:5c0b with SMTP id
 e9e14a558f8ab-3a37b879639mr7306245ab.18.1728313540246; Mon, 07 Oct 2024
 08:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20241005195541.380070-1-irogers@google.com> <20241005195541.380070-18-irogers@google.com>
 <20241007170927.f30fced63c5e777628bea311@kernel.org>
In-Reply-To: <20241007170927.f30fced63c5e777628bea311@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 7 Oct 2024 08:05:23 -0700
Message-ID: <CAP-5=fVmD-M-ZOinkWZ7AOtfRHqo89gFtDeeatwufq0TcBiZUA@mail.gmail.com>
Subject: Re: [PATCH v2 17/31] perf dwarf-regs: Pass ELF flags to get_dwarf_regstr
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nick Terrell <terrelln@fb.com>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, Guilherme Amadio <amadio@gentoo.org>, 
	Changbin Du <changbin.du@huawei.com>, Daniel Bristot de Oliveira <bristot@kernel.org>, 
	Daniel Wagner <dwagner@suse.de>, Aditya Gupta <adityag@linux.ibm.com>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Kajol Jain <kjain@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Bibo Mao <maobibo@loongson.cn>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@rivosinc.com>, Shenlin Liang <liangshenlin@eswincomputing.com>, 
	Oliver Upton <oliver.upton@linux.dev>, "Steinar H. Gunderson" <sesse@google.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Chen Pei <cp0613@linux.alibaba.com>, 
	Dima Kogan <dima@secretsauce.net>, Yury Norov <yury.norov@gmail.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_080543_102263_099D0446 
X-CRM114-Status: GOOD (  27.90  )
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

T24gTW9uLCBPY3QgNywgMjAyNCBhdCAxOjA54oCvQU0gTWFzYW1pIEhpcmFtYXRzdSA8bWhpcmFt
YXRAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsICA1IE9jdCAyMDI0IDEyOjU1OjI3IC0w
NzAwCj4gSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPiB3cm90ZToKPgo+ID4gUGFzcyBh
IGZsYWdzIHZhbHVlIGFzIGFyY2hpdGVjdHVyZXMgbGlrZSBjc2t5IG5lZWQgdGhlIGZsYWdzIHRv
Cj4gPiBkZXRlcm1pbmUgdGhlIEFCSSB2YXJpYW50Lgo+ID4KPgo+IFNhbWUgaGVyZS4gSSBuZWVk
IHNvbWUgZXhhbXBsZXMgb2YgdGhpcyBjaGFuZWcuCgpUaGUgY29kZSBoZXJlIHdhcyBhbHJlYWR5
IHVzaW5nIHRoZSBFTEYgbWFjaGluZSwgc28gZHdhcmYtcmVncy5jCmZ1bmN0aW9ucyB3b3VsZCBh
bHJlYWR5IHN1cHBvcnQgY3Jvc3MgYnVpbGRpbmcuIFRoZXJlIGlzIHRoZSBhZGRpdGlvbgpvZiBF
TEYgZmxhZ3MgYXMgb24gY3NreSB0aGUgcmVnaXN0ZXJzIGNoYW5nZSBkZXBlbmRpbmcgb24gdGhl
IEFCSQp2ZXJzaW9uIGluIHRoZSBFTEYgZmxhZ3MuCgpUaGFua3MsCklhbgoKPiA+IFNpZ25lZC1v
ZmYtYnk6IElhbiBSb2dlcnMgPGlyb2dlcnNAZ29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4gIHRvb2xz
L3BlcmYvdXRpbC9kd2FyZi1yZWdzLmMgICAgICAgICB8ICAzICsrLQo+ID4gIHRvb2xzL3BlcmYv
dXRpbC9pbmNsdWRlL2R3YXJmLXJlZ3MuaCB8IDExICsrKysrKy0tLS0tCj4gPiAgdG9vbHMvcGVy
Zi91dGlsL3Byb2JlLWZpbmRlci5jICAgICAgIHwgMTMgKysrKysrKy0tLS0tLQo+ID4gIHRvb2xz
L3BlcmYvdXRpbC9wcm9iZS1maW5kZXIuaCAgICAgICB8ICAzICsrLQo+ID4gIDQgZmlsZXMgY2hh
bmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL3Rvb2xzL3BlcmYvdXRpbC9kd2FyZi1yZWdzLmMgYi90b29scy9wZXJmL3V0aWwvZHdhcmYt
cmVncy5jCj4gPiBpbmRleCAxMzIxMzg3ZjY5NDguLjg2YjNlZjYzOGZiYiAxMDA2NDQKPiA+IC0t
LSBhL3Rvb2xzL3BlcmYvdXRpbC9kd2FyZi1yZWdzLmMKPiA+ICsrKyBiL3Rvb2xzL3BlcmYvdXRp
bC9kd2FyZi1yZWdzLmMKPiA+IEBAIC0yOSw3ICsyOSw4IEBACj4gPiAgI2RlZmluZSBfX2dldF9k
d2FyZl9yZWdzdHIodGJsLCBuKSAoKChuKSA8IEFSUkFZX1NJWkUodGJsKSkgPyAodGJsKVsobild
IDogTlVMTCkKPiA+Cj4gPiAgLyogUmV0dXJuIGFyY2hpdGVjdHVyZSBkZXBlbmRlbnQgcmVnaXN0
ZXIgc3RyaW5nIChmb3Iga3Byb2JlLXRyYWNlcikgKi8KPiA+IC1jb25zdCBjaGFyICpnZXRfZHdh
cmZfcmVnc3RyKHVuc2lnbmVkIGludCBuLCB1bnNpZ25lZCBpbnQgbWFjaGluZSkKPiA+ICtjb25z
dCBjaGFyICpnZXRfZHdhcmZfcmVnc3RyKHVuc2lnbmVkIGludCBuLCB1bnNpZ25lZCBpbnQgbWFj
aGluZSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFncyBf
X21heWJlX3VudXNlZCkKPiA+ICB7Cj4gPiAgICAgICBzd2l0Y2ggKG1hY2hpbmUpIHsKPiA+ICAg
ICAgIGNhc2UgRU1fTk9ORTogICAvKiBHZW5lcmljIGFyY2ggLSB1c2UgaG9zdCBhcmNoICovCj4g
PiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi91dGlsL2luY2x1ZGUvZHdhcmYtcmVncy5oIGIvdG9v
bHMvcGVyZi91dGlsL2luY2x1ZGUvZHdhcmYtcmVncy5oCj4gPiBpbmRleCBlZTBhNzM0NTY0Yzcu
LjkyNTUyNTQwNWUyZCAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3BlcmYvdXRpbC9pbmNsdWRlL2R3
YXJmLXJlZ3MuaAo+ID4gKysrIGIvdG9vbHMvcGVyZi91dGlsL2luY2x1ZGUvZHdhcmYtcmVncy5o
Cj4gPiBAQCAtODAsMTIgKzgwLDEzIEBACj4gPgo+ID4gICNpZmRlZiBIQVZFX0xJQkRXX1NVUFBP
UlQKPiA+ICBjb25zdCBjaGFyICpnZXRfYXJjaF9yZWdzdHIodW5zaWduZWQgaW50IG4pOwo+ID4g
LS8qCj4gPiAtICogZ2V0X2R3YXJmX3JlZ3N0ciAtIFJldHVybnMgZnRyYWNlIHJlZ2lzdGVyIHN0
cmluZyBmcm9tIERXQVJGIHJlZ251bQo+ID4gLSAqIG46IERXQVJGIHJlZ2lzdGVyIG51bWJlcgo+
ID4gLSAqIG1hY2hpbmU6IEVMRiBtYWNoaW5lIHNpZ25hdHVyZSAoRU1fKikKPiA+ICsvKioKPiA+
ICsgKiBnZXRfZHdhcmZfcmVnc3RyKCkgLSBSZXR1cm5zIGZ0cmFjZSByZWdpc3RlciBzdHJpbmcg
ZnJvbSBEV0FSRiByZWdudW0uCj4gPiArICogQG46IERXQVJGIHJlZ2lzdGVyIG51bWJlci4KPiA+
ICsgKiBAbWFjaGluZTogRUxGIG1hY2hpbmUgc2lnbmF0dXJlIChFTV8qKS4KPiA+ICsgKiBAZmxh
Z3M6IEVMRiBmbGFncyBmb3IgdGhpbmdzIGxpa2UgQUJJIGRpZmZlcmVuY2VzLgo+ID4gICAqLwo+
ID4gLWNvbnN0IGNoYXIgKmdldF9kd2FyZl9yZWdzdHIodW5zaWduZWQgaW50IG4sIHVuc2lnbmVk
IGludCBtYWNoaW5lKTsKPiA+ICtjb25zdCBjaGFyICpnZXRfZHdhcmZfcmVnc3RyKHVuc2lnbmVk
IGludCBuLCB1bnNpZ25lZCBpbnQgbWFjaGluZSwgdW5zaWduZWQgaW50IGZsYWdzKTsKPiA+Cj4g
PiAgaW50IGdldF9hcmNoX3JlZ251bShjb25zdCBjaGFyICpuYW1lKTsKPiA+ICAvKgo+ID4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3BlcmYvdXRpbC9wcm9iZS1maW5kZXIuYyBiL3Rvb2xzL3BlcmYvdXRp
bC9wcm9iZS1maW5kZXIuYwo+ID4gaW5kZXggODAxOWQyMzJmNTE1Li4yOWVhYTliZWNhODYgMTAw
NjQ0Cj4gPiAtLS0gYS90b29scy9wZXJmL3V0aWwvcHJvYmUtZmluZGVyLmMKPiA+ICsrKyBiL3Rv
b2xzL3BlcmYvdXRpbC9wcm9iZS1maW5kZXIuYwo+ID4gQEAgLTU2LDcgKzU2LDcgQEAgc3RhdGlj
IHN0cnVjdCBwcm9iZV90cmFjZV9hcmdfcmVmICphbGxvY190cmFjZV9hcmdfcmVmKGxvbmcgb2Zm
cykKPiA+ICAgKi8KPiA+ICBzdGF0aWMgaW50IGNvbnZlcnRfdmFyaWFibGVfbG9jYXRpb24oRHdh
cmZfRGllICp2cl9kaWUsIER3YXJmX0FkZHIgYWRkciwKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgRHdhcmZfT3AgKmZiX29wcywgRHdhcmZfRGllICpzcF9kaWUsCj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBtYWNoaW5lLAo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgcHJvYmVf
ZmluZGVyICpwZiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IHByb2JlX3RyYWNlX2FyZyAqdHZhcikKPiA+ICB7Cj4gPiAgICAgICBEd2FyZl9BdHRyaWJ1dGUg
YXR0cjsKPiA+IEBAIC0xNjYsNyArMTY2LDcgQEAgc3RhdGljIGludCBjb252ZXJ0X3ZhcmlhYmxl
X2xvY2F0aW9uKER3YXJmX0RpZSAqdnJfZGllLCBEd2FyZl9BZGRyIGFkZHIsCj4gPiAgICAgICBp
ZiAoIXR2YXIpCj4gPiAgICAgICAgICAgICAgIHJldHVybiByZXQyOwo+ID4KPiA+IC0gICAgIHJl
Z3MgPSBnZXRfZHdhcmZfcmVnc3RyKHJlZ24sIG1hY2hpbmUpOwo+ID4gKyAgICAgcmVncyA9IGdl
dF9kd2FyZl9yZWdzdHIocmVnbiwgcGYtPmVfbWFjaGluZSwgcGYtPmVfZmxhZ3MpOwo+ID4gICAg
ICAgaWYgKCFyZWdzKSB7Cj4gPiAgICAgICAgICAgICAgIC8qIFRoaXMgc2hvdWxkIGJlIGEgYnVn
IGluIERXQVJGIG9yIHRoaXMgdG9vbCAqLwo+ID4gICAgICAgICAgICAgICBwcl93YXJuaW5nKCJN
YXBwaW5nIGZvciB0aGUgcmVnaXN0ZXIgbnVtYmVyICV1ICIKPiA+IEBAIC00NTEsNyArNDUxLDcg
QEAgc3RhdGljIGludCBjb252ZXJ0X3ZhcmlhYmxlKER3YXJmX0RpZSAqdnJfZGllLCBzdHJ1Y3Qg
cHJvYmVfZmluZGVyICpwZikKPiA+ICAgICAgICAgICAgICAgIGR3YXJmX2RpZW5hbWUodnJfZGll
KSk7Cj4gPgo+ID4gICAgICAgcmV0ID0gY29udmVydF92YXJpYWJsZV9sb2NhdGlvbih2cl9kaWUs
IHBmLT5hZGRyLCBwZi0+ZmJfb3BzLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAmcGYtPnNwX2RpZSwgcGYtPm1hY2hpbmUsIHBmLT50dmFyKTsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnBmLT5zcF9kaWUsIHBmLCBwZi0+dHZhcik7
Cj4gPiAgICAgICBpZiAocmV0ID09IC1FTk9FTlQgJiYgcGYtPnNraXBfZW1wdHlfYXJnKQo+ID4g
ICAgICAgICAgICAgICAvKiBUaGlzIGNhbiBiZSBmb3VuZCBpbiBvdGhlciBwbGFjZS4gc2tpcCBp
dCAqLwo+ID4gICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+IEBAIC0xMTM0LDcgKzExMzQsOCBA
QCBzdGF0aWMgaW50IGRlYnVnaW5mb19fZmluZF9wcm9iZXMoc3RydWN0IGRlYnVnaW5mbyAqZGJn
LAo+ID4gICAgICAgaWYgKGdlbGZfZ2V0ZWhkcihlbGYsICZlaGRyKSA9PSBOVUxMKQo+ID4gICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+Cj4gPiAtICAgICBwZi0+bWFjaGluZSA9IGVo
ZHIuZV9tYWNoaW5lOwo+ID4gKyAgICAgcGYtPmVfbWFjaGluZSA9IGVoZHIuZV9tYWNoaW5lOwo+
ID4gKyAgICAgcGYtPmVfZmxhZ3MgPSBlaGRyLmVfZmxhZ3M7Cj4gPgo+ID4gICAgICAgZG8gewo+
ID4gICAgICAgICAgICAgICBHRWxmX1NoZHIgc2hkcjsKPiA+IEBAIC0xMTcxLDcgKzExNzIsNyBA
QCBzdGF0aWMgaW50IGNvcHlfdmFyaWFibGVzX2NiKER3YXJmX0RpZSAqZGllX21lbSwgdm9pZCAq
ZGF0YSkKPiA+ICAgICAgICAgICAodGFnID09IERXX1RBR192YXJpYWJsZSAmJiB2Zi0+dmFycykp
IHsKPiA+ICAgICAgICAgICAgICAgaWYgKGNvbnZlcnRfdmFyaWFibGVfbG9jYXRpb24oZGllX21l
bSwgdmYtPnBmLT5hZGRyLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB2Zi0+cGYtPmZiX29wcywgJnBmLT5zcF9kaWUsCj4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBmLT5tYWNoaW5lLCBOVUxMKSA9PSAwKSB7Cj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBmLCAvKnR2YXI9
Ki9OVUxMKSA9PSAwKSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgdmYtPmFyZ3NbdmYtPm5h
cmdzXS52YXIgPSAoY2hhciAqKWR3YXJmX2RpZW5hbWUoZGllX21lbSk7Cj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKHZmLT5hcmdzW3ZmLT5uYXJnc10udmFyID09IE5VTEwpIHsKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZmLT5yZXQgPSAtRU5PTUVNOwo+ID4gQEAgLTE0
MDMsNyArMTQwNCw3IEBAIHN0YXRpYyBpbnQgY29sbGVjdF92YXJpYWJsZXNfY2IoRHdhcmZfRGll
ICpkaWVfbWVtLCB2b2lkICpkYXRhKQo+ID4gICAgICAgICAgIHRhZyA9PSBEV19UQUdfdmFyaWFi
bGUpIHsKPiA+ICAgICAgICAgICAgICAgcmV0ID0gY29udmVydF92YXJpYWJsZV9sb2NhdGlvbihk
aWVfbWVtLCBhZi0+cGYuYWRkciwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBhZi0+cGYuZmJfb3BzLCAmYWYtPnBmLnNwX2RpZSwKPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhZi0+cGYubWFjaGluZSwgTlVM
TCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmFm
LT5wZiwgLyp0dmFyPSovTlVMTCk7Cj4gPiAgICAgICAgICAgICAgIGlmIChyZXQgPT0gMCB8fCBy
ZXQgPT0gLUVSQU5HRSkgewo+ID4gICAgICAgICAgICAgICAgICAgICAgIGludCByZXQyOwo+ID4g
ICAgICAgICAgICAgICAgICAgICAgIGJvb2wgZXh0ZXJucyA9ICFhZi0+Y2hpbGQ7Cj4gPiBkaWZm
IC0tZ2l0IGEvdG9vbHMvcGVyZi91dGlsL3Byb2JlLWZpbmRlci5oIGIvdG9vbHMvcGVyZi91dGls
L3Byb2JlLWZpbmRlci5oCj4gPiBpbmRleCBiOWE1YWZjYTRjYzEuLjcxZTIxY2I0NDkyYSAxMDA2
NDQKPiA+IC0tLSBhL3Rvb2xzL3BlcmYvdXRpbC9wcm9iZS1maW5kZXIuaAo+ID4gKysrIGIvdG9v
bHMvcGVyZi91dGlsL3Byb2JlLWZpbmRlci5oCj4gPiBAQCAtNjgsNyArNjgsOCBAQCBzdHJ1Y3Qg
cHJvYmVfZmluZGVyIHsKPiA+ICAgICAgIC8qIENhbGwgRnJhbWUgSW5mb3JtYXRpb24gZnJvbSAu
ZGVidWdfZnJhbWUgKi8KPiA+ICAgICAgIER3YXJmX0NGSSAgICAgICAgICAgICAgICpjZmlfZGJn
Owo+ID4gICAgICAgRHdhcmZfT3AgICAgICAgICAgICAgICAgKmZiX29wczsgICAgICAgIC8qIEZy
YW1lIGJhc2UgYXR0cmlidXRlICovCj4gPiAtICAgICB1bnNpZ25lZCBpbnQgICAgICAgICAgICBt
YWNoaW5lOyAgICAgICAgLyogVGFyZ2V0IG1hY2hpbmUgYXJjaCAqLwo+ID4gKyAgICAgdW5zaWdu
ZWQgaW50ICAgICAgICAgICAgZV9tYWNoaW5lOyAgICAgIC8qIEVMRiB0YXJnZXQgbWFjaGluZSBh
cmNoICovCj4gPiArICAgICB1bnNpZ25lZCBpbnQgICAgICAgICAgICBlX2ZsYWdzOyAgICAgICAg
LyogRUxGIHRhcmdldCBtYWNoaW5lIGZsYWdzICovCj4gPiAgICAgICBzdHJ1Y3QgcGVyZl9wcm9i
ZV9hcmcgICAqcHZhcjsgICAgICAgICAgLyogQ3VycmVudCB0YXJnZXQgdmFyaWFibGUgKi8KPiA+
ICAgICAgIHN0cnVjdCBwcm9iZV90cmFjZV9hcmcgICp0dmFyOyAgICAgICAgICAvKiBDdXJyZW50
IHJlc3VsdCB2YXJpYWJsZSAqLwo+ID4gICAgICAgYm9vbCAgICAgICAgICAgICAgICAgICAgc2tp
cF9lbXB0eV9hcmc7IC8qIFNraXAgbm9uLWV4aXN0IGFyZ3MgKi8KPiA+IC0tCj4gPiAyLjQ3LjAu
cmMwLjE4Ny5nZTY3MGJjY2Y3ZS1nb29nCj4gPgo+Cj4KPiAtLQo+IE1hc2FtaSBIaXJhbWF0c3Ug
KEdvb2dsZSkgPG1oaXJhbWF0QGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
