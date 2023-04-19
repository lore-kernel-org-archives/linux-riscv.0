Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014B7C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 17:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i00dCA4NbwyMfJt2gN3rLGikNWMk71JR0MSLI0X3PWE=; b=Ou4mMJuvZM7ANq
	t0UDpaKFNszi3zjzoCrw+IzvPGoL8cypVAXHA5uadXXvQSuoIu5ZuRe+fVQLwxFdowP9Rn3rAeD19
	43GDJZjPRx6NBwOGgU39rzEX7n2U5jsxZnWgrQt0Ff0fQLb3uCqy9BJwXOpwa0GYcL8zd9LKTnp9k
	1u4f8lJxnbbypzevevBdrXvaEFqzX2EUK7CpeYdhIF3BNk9qio5JZYWkR/lFV+khvZbQBr2oCiKAv
	3f9+pcASVBsqkIF4kDMYeVsttgwAMLk6hrllDR8YelWKQPopNmKwES0jA5UxV1KZMukSDGyNIGPEY
	URX3Qd2ksEKts1EThaFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppBpy-0064Vr-1E;
	Wed, 19 Apr 2023 17:43:22 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppBpu-0064UV-15
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 17:43:20 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f048b144eeso147975e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 10:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681926195; x=1684518195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbIeXSReCQMbeb4ih3GQD4yHVI+ajegh0q6OiBbZIxg=;
        b=LHTaEdOyIBlJsLLfw3G2QpQk9naWCaRk8oWpTNM0nZZIFvxvmevcqE+gjM3vs8Z2K1
         W1/HmoG0GqrXpeu7HU4/kVSdSuIC/t20E0hmzPxn6WMRZZQJJT9iiCM2GtzumIUp4not
         A/dcKgPcYslPWtn2WW1dtqXLgWCYpMms6B975bbHGb5DeRjzAr2LuDtkz7HJxUomtpME
         VRvxUAxvB2QKGXpVagWuNojmw1PV2Ezvd6bvJp27ClTT1V9Leh50cY+ZYSQ+HQAEKD36
         kYK1SY8TPmFQuJ6BPtefi+ZeHkknOvp5/pFlQ6pW+AzeOfRl5c1IvxophtdEkpqrcV1I
         zR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681926195; x=1684518195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbIeXSReCQMbeb4ih3GQD4yHVI+ajegh0q6OiBbZIxg=;
        b=g0w3muYUNrJre2a5k7L4jf8WMfJQ+5xgxW8oTypwrqS2iMXw4q49XGeWohehNbkYx8
         4JHME9Ig/8WJuGXW0SaA3/QjCjMprvliQv8UUEQyMHlMKsJ25PL2S8/uYvJ6fZsLCfgQ
         w346dv+I0/A3TDz7RqD9RpXjm+tHTQVdusGiHcxgZzJsneaVClnMNG5wNeCCxq7hDos0
         s+d/ibeHWo/qyz1k3a0AqdtKw8cVyPZAeeSC2t7Ed5EZxyW6MmXUv/e/ADgyMQARIeny
         MmZwfUwkGAJ7aJq0wkyXFW+N8T/HTuH+5me7N+OMjS8JsjTmO3Eu4+w7cpMn9fF9GIbj
         3GoQ==
X-Gm-Message-State: AAQBX9et/LYi9x1LdKbXqFO4BgyQ2eJOWjzTdFgknEGLYzmaAwPazrxZ
	BW06Pb2W7ewGWa27RJR/N1Gzaah3HBqkxhcxo5KsJw==
X-Google-Smtp-Source: AKy350ZmpzQ1uY1BUEeMEpoys5h/UnF5v4KOvTi+J/OoxZA1ul+8Bb2MgOls4JOxVXqW2oCoz86I5D2zEW2FeB5MdWA=
X-Received: by 2002:a05:600c:4e8a:b0:3f1:73b8:b5fe with SMTP id
 f10-20020a05600c4e8a00b003f173b8b5femr4192wmq.3.1681926195026; Wed, 19 Apr
 2023 10:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230413161725.195417-1-alexghiti@rivosinc.com>
 <CAOnJCU+72PV1=o1c_TpogkmBT36278BneVWEMr1=tqX0CZi+ag@mail.gmail.com>
 <aadca595b4a24e36932ba41e61f4e263@AcuMS.aculab.com> <CAOnJCUJ7mY+fh9VqE4dRntnVAEAc26=NnOCPUqkXk6ky__cUZQ@mail.gmail.com>
 <CAP-5=fUYJEecmhQVuvbM4ZoDP_Hj=2RKOgR4cKepU072Uy3xyw@mail.gmail.com>
 <CAOnJCULJfSN79MzAwhCrbVzG1rYyrPB3OraFmoZFBxuRCwq01w@mail.gmail.com> <CAHVXubjhORBEDok_Zhq5p_Yv4Ty4Hct84dWJZXzo48+40N=CGg@mail.gmail.com>
In-Reply-To: <CAHVXubjhORBEDok_Zhq5p_Yv4Ty4Hct84dWJZXzo48+40N=CGg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 19 Apr 2023 10:42:58 -0700
Message-ID: <CAP-5=fX6kaZt68UbMMZzW-zs0RyRWoOS-Tq5NwekWj8k9Shx6g@mail.gmail.com>
Subject: Re: [PATCH 0/4] riscv: Allow userspace to directly access perf counters
To: Alexandre Ghiti <alexghiti@rivosinc.com>, paranlee <p4ranlee@gmail.com>
Cc: Atish Patra <atishp@atishpatra.org>, David Laight <David.Laight@aculab.com>, 
	Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_104318_373067_0A5A5643 
X-CRM114-Status: GOOD (  48.99  )
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

T24gV2VkLCBBcHIgMTksIDIwMjMgYXQgMjoyMeKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBIaSBJYW4sCj4KPiBPbiBUdWUsIEFwciAxOCwg
MjAyMyBhdCAxMDozMOKAr1BNIEF0aXNoIFBhdHJhIDxhdGlzaHBAYXRpc2hwYXRyYS5vcmc+IHdy
b3RlOgo+ID4KPiA+IE9uIFR1ZSwgQXByIDE4LCAyMDIzIGF0IDExOjQ24oCvUE0gSWFuIFJvZ2Vy
cyA8aXJvZ2Vyc0Bnb29nbGUuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVHVlLCBBcHIgMTgs
IDIwMjMgYXQgOTo0M+KAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAYXRpc2hwYXRyYS5vcmc+IHdy
b3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gRnJpLCBBcHIgMTQsIDIwMjMgYXQgMjo0MOKAr0FNIERh
dmlkIExhaWdodCA8RGF2aWQuTGFpZ2h0QGFjdWxhYi5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+
ID4gPiA+IEZyb206IEF0aXNoIFBhdHJhCj4gPiA+ID4gPiA+IFNlbnQ6IDEzIEFwcmlsIDIwMjMg
MjA6MTgKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gT24gVGh1LCBBcHIgMTMsIDIwMjMgYXQgOTo0
N+KAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4g
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiByaXNjdiB1c2VkIHRvIGFsbG93IGRpcmVjdCBhY2Nl
c3MgdG8gY3ljbGUvdGltZS9pbnN0cmV0IGNvdW50ZXJzLAo+ID4gPiA+ID4gPiA+IGJ5cGFzc2lu
ZyB0aGUgcGVyZiBmcmFtZXdvcmssIHRoaXMgcGF0Y2hzZXQgaW50ZW5kcyB0byBhbGxvdyB0aGUg
dXNlciB0bwo+ID4gPiA+ID4gPiA+IG1tYXAgYW55IGNvdW50ZXIgd2hlbiBhY2Nlc3NlZCB0aHJv
dWdoIHBlcmYuIEJ1dCB3ZSBjYW4ndCBicmVhayB0aGUKPiA+ID4gPiA+ID4gPiBleGlzdGluZyBi
ZWhhdmlvdXIgc28gd2UgaW50cm9kdWNlIGEgc3lzY3RsIHBlcmZfdXNlcl9hY2Nlc3MgbGlrZSBh
cm02NAo+ID4gPiA+ID4gPiA+IGRvZXMsIHdoaWNoIGRlZmF1bHRzIHRvIHRoZSBsZWdhY3kgbW9k
ZSBkZXNjcmliZWQgYWJvdmUuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
SXQgd291bGQgYmUgZ29vZCBwcm92aWRlIGFkZGl0aW9uYWwgZGlyZWN0aW9uIGZvciB1c2VyIHNw
YWNlIHBhY2thZ2VzOgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUaGUgbGVnYWN5IGJlaGF2aW9y
IGlzIHN1cHBvcnRlZCBmb3Igbm93IGluIG9yZGVyIHRvIGF2b2lkIGJyZWFraW5nCj4gPiA+ID4g
PiA+IGV4aXN0aW5nIHNvZnR3YXJlLgo+ID4gPiA+ID4gPiBIb3dldmVyLCByZWFkaW5nIGNvdW50
ZXJzIGRpcmVjdGx5IHdpdGhvdXQgcGVyZiBpbnRlcmFjdGlvbiBtYXkKPiA+ID4gPiA+ID4gcHJv
dmlkZSBpbmNvcnJlY3QgdmFsdWVzIHdoaWNoCj4gPiA+ID4gPiA+IHRoZSB1c2Vyc3BhY2Ugc29m
dHdhcmUgbXVzdCBhdm9pZC4gV2UgYXJlIGhvcGluZyB0aGF0IHRoZSB1c2VyIHNwYWNlCj4gPiA+
ID4gPiA+IHBhY2thZ2VzIHdoaWNoCj4gPiA+ID4gPiA+IHJlYWQgdGhlIGN5Y2xlL2luc3RyZXQg
ZGlyZWN0bHksIHdpbGwgbW92ZSB0byB0aGUgcHJvcGVyIGludGVyZmFjZQo+ID4gPiA+ID4gPiBl
dmVudHVhbGx5IGlmIHRoZXkgYWN0dWFsbHkgbmVlZCBpdC4KPiA+ID4gPiA+ID4gTW9zdCBvZiB0
aGUgdXNlcnMgYXJlIHN1cHBvc2VkIHRvIHJlYWQgInRpbWUiIGluc3RlYWQgb2YgImN5Y2xlIiBp
Zgo+ID4gPiA+ID4gPiB0aGV5IGludGVuZCB0byByZWFkIHRpbWVzdGFtcHMuCj4gPiA+ID4gPgo+
ID4gPiA+ID4gSWYgeW91IGFyZSB0cnlpbmcgdG8gbWVhc3VyZSB0aGUgcGVyZm9ybWFuY2Ugb2Yg
c2hvcnQgY29kZQo+ID4gPiA+ID4gZnJhZ21lbnRzIHRoZW4geW91IG5lZWQgcHJldHR5IG11Y2gg
cmF3IGFjY2VzcyBkaXJlY3RseSB0bwo+ID4gPiA+ID4gdGhlIGN5Y2xlL2Nsb2NrIGNvdW50IHJl
Z2lzdGVyLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEkndmUgZG9uZSB0aGlzIG9uIHg4NiB0byBjb21w
YXJlIHRoZSBhY3R1YWwgY3ljbGUgdGltZXMKPiA+ID4gPiA+IG9mIGRpZmZlcmVudCBpbXBsZW1l
bnRhdGlvbnMgb2YgdGhlIElQIGNoZWNrc3VtIGxvb3AKPiA+ID4gPiA+IChhbmQgY29tcGFyZSB0
aGVtIHRvIHRoZSB0aGVvcmV0aWNhbCBsaW1pdCkuCj4gPiA+ID4gPiBUaGUgcGVyZiBmcmFtZXdv
cmsganVzdCBhZGRlZCBmYXIgdG9vIG11Y2ggbGF0ZW5jeSwKPiA+ID4gPiA+IG9ubHkgZGlyZWN0
bHkgcmVhZGluZyB0aGUgY3B1IHJlZ2lzdGVycyBnYXZlIGFueXRoaW5nCj4gPiA+ID4gPiBsaWtl
IHJlbGlhYmxlIChhbmQgY29uc2lzdGVudCkgYW5zd2Vycy4KPiA+ID4gPiA+Cj4gPiA+ID4KPiA+
ID4gPiBUaGlzIHNlcmllcyBhbGxvd3MgZGlyZWN0IGFjY2VzcyB0byB0aGUgY291bnRlcnMgb25j
ZSBjb25maWd1cmVkCj4gPiA+ID4gdGhyb3VnaCB0aGUgcGVyZi4KPiA+ID4gPiBFYXJsaWVyIHRo
ZSBjeWNsZS9pbnN0cmV0IGNvdW50ZXJzIGFyZSBkaXJlY3RseSBleHBvc2VkIHRvIHRoZQo+ID4g
PiA+IHVzZXJzcGFjZSB3aXRob3V0IGtlcm5lbC9wZXJmIGZyYW1ld29ya2luZyBrbm93aW5nCj4g
PiA+ID4gd2hlbi93aGljaCB1c2VyIHNwYWNlIGFwcGxpY2F0aW9uIGlzIHJlYWRpbmcgaXQuIFRo
YXQgaGFzIHNlY3VyaXR5IGltcGxpY2F0aW9ucy4KPiA+ID4gPgo+ID4gPiA+IFdpdGggdGhpcyBz
ZXJpZXMgYXBwbGllZCwgdGhlIHVzZXIgc3BhY2UgYXBwbGljYXRpb24ganVzdCBuZWVkcyB0bwo+
ID4gPiA+IGNvbmZpZ3VyZSB0aGUgZXZlbnQgKGN5Y2xlL2luc3RyZXQpIHRocm91Z2ggcGVyZiBz
eXNjYWxsLgo+ID4gPiA+IE9uY2UgY29uZmlndXJlZCwgdGhlIHVzZXJzcGFjZSBhcHBsaWNhdGlv
biBjYW4gZmluZCBvdXQgdGhlIGNvdW50ZXIKPiA+ID4gPiBpbmZvcm1hdGlvbiBmcm9tIHRoZSBt
bWFwICYgZGlyZWN0bHkKPiA+ID4gPiByZWFkIHRoZSBjb3VudGVyLiBUaGVyZSBpcyBubyBsYXRl
bmN5IHdoaWxlIHJlYWRpbmcgdGhlIGNvdW50ZXJzLgo+ID4gPiA+Cj4gPiA+ID4gVGhpcyBtZWNo
YW5pc20gYWxsb3dzIHN0b3AvY2xlYXIgdGhlIGNvdW50ZXJzIHdoZW4gdGhlIHJlcXVlc3Rpbmcg
dGFzawo+ID4gPiA+IGlzIG5vdCBydW5uaW5nLiBJdCBhbHNvIHRha2VzIGNhcmUgb2YgY29udGV4
dCBzd2l0Y2hpbmcKPiA+ID4gPiB3aGljaCBtYXkgcmVzdWx0IGluIGludmFsaWQgdmFsdWVzIGFz
IHlvdSBtZW50aW9uZWQgYmVsb3cuIFRoaXMgaXMKPiA+ID4gPiBub3RoaW5nIG5ldyBhbmQgYWxs
IG90aGVyIGFyY2ggKHg4NiwgQVJNNjQpIGFsbG93IHVzZXIgc3BhY2UKPiA+ID4gPiBjb3VudGVy
IHJlYWQgdGhyb3VnaCB0aGUgc2FtZSBtZWNoYW5pc20uCj4gPiA+ID4KPiA+ID4gPiBIZXJlIGlz
IHRoZSByZWxldmFudCB1cHN0cmVhbSBkaXNjdXNzaW9uOgo+ID4gPiA+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvWTd3TGE3STJobHozckt3JTJGQGhpcmV6LnByb2dyYW1taW5nLmtpY2tz
LWFzcy5uZXQvVC8KPiA+ID4gPgo+ID4gPiA+IEFSTTY0Ogo+ID4gPiA+IGh0dHBzOi8vZG9jcy5r
ZXJuZWwub3JnL2FybTY0L3BlcmYuaHRtbD9oaWdobGlnaHQ9cGVyZl91c2VyX2FjY2VzcyNwZXJm
LXVzZXJzcGFjZS1wbXUtaGFyZHdhcmUtY291bnRlci1hY2Nlc3MKPiA+ID4gPgo+ID4gPiA+IGV4
YW1wbGUgdXNhZ2UgaW4geDg2Ogo+ID4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9hbmRpa2xlZW4v
cG11LXRvb2xzL2Jsb2IvbWFzdGVyL2pldmVudHMvcmRwbWMuYwo+ID4gPgo+ID4gPiBUaGUgY2Fu
b25pY2FsIGltcGxlbWVudGF0aW9uIG9mIHRoaXMgc2hvdWxkIGJlOgo+ID4gPiBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQv
dHJlZS90b29scy9saWIvcGVyZi9tbWFwLmMjbjQwMAo+ID4KPiA+IFRoYW5rcyBmb3Igc2hhcmlu
ZyB0aGUgbGlicGVyZiBpbXBsZW1lbnRhdGlvbi4KPiA+Cj4gPiA+IHdoaWNoIGlzIHVwZGF0ZWQg
aW4gdGhlc2UgcGF0Y2hlcyBidXQgdGhlIHRlc3RzIGFyZSBub3Q6Cj4gPiA+IGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90
cmVlL3Rvb2xzL3BlcmYvdGVzdHMvbW1hcC1iYXNpYy5jI24yODcKPiA+ID4gV2hpY2ggYXBwZWFy
cyB0byBiZSBhbiBvdmVyc2lnaHQuIFRoZSB0ZXN0cyBkaXNwbGF5IHNvbWUgZGlmZmVyZW5jZXMK
PiA+Cj4gPiBZZXMuIEl0J3MgYW4gb3ZlcnNpZ2h0LiBXZSBzaG91bGQgbWFrZSBzdXJlIHRoYXQg
cGVyZiBtbWFwIHRlc3RzIHBhc3MKPiA+IGZvciBSSVNDLVYgYXMgd2VsbC4KPgo+IFllcywgdGhh
dCdzIGFuIG92ZXJzaWdodCwgSSBoYWQgYSBsb2NhbCB0ZXN0IGFkYXB0ZWQgZnJvbSB0aGlzIG9u
ZSBidXQKPiBmb3Jnb3QgdG8gdXBkYXRlIGl0IGFmdGVyd2FyZHMsIEknbGwgZG8gdGhhdCBpbiB0
aGUgbmV4dCB2ZXJzaW9uLgo+Cj4gVGhhbmtzIGZvciB5b3VyIHF1aWNrIGZlZWRiYWNrcyBhbmQg
c29ycnkgZm9yIGJlaW5nIGxhdGUsCj4KPiBBbGV4CgpUaGFua3MgQWxleCwgdGhlcmUgd2FzIGFu
IGVxdWFsbHkgbGlrZWx5IGNoYW5jZSB0aGF0IEkgd2Fzbid0CnVuZGVyc3RhbmRpbmcgdGhpbmdz
IDotKSBJcyB0aGVyZSBhbnkgaW5mb3JtYXRpb24gb24gUklTQy1WIFBNVQp0ZXN0aW5nPyBJIGtu
b3cgUGFyYW5MZWUgaXMgaW50ZXJlc3RlZC4gSXQnZCBiZSBhd2Vzb21lIHRvIGhhdmUKc29tZXRo
aW5nIHNheSBvbjoKaHR0cHM6Ly9wZXJmLndpa2kua2VybmVsLm9yZy9pbmRleC5waHAvTWFpbl9Q
YWdlCm9uIGhvdyB0byBydW4gdGVzdHMsIHBlcmhhcHMgb24gUUVNVSBvciBrbm93biB0byB3b3Jr
IGJvYXJkcy4gV2UgY2FuCmFsc28ganVzdCBkcm9wIGEgbGluayBvbiB0aGVyZSBpZiB0aGVyZSBp
cyBpbmZvcm1hdGlvbi4gV2UgY2FuIGFsc28KYWRkIHRoZSBSSVNDLVYgUE1VIGluZm9ybWF0aW9u
IHRvIHRoZSBsaW5rcyBoZXJlOgpodHRwczovL3BlcmYud2lraS5rZXJuZWwub3JnL2luZGV4LnBo
cC9Vc2VmdWxfTGlua3MKClRoYW5rcywKSWFuCgo+Cj4gPgo+ID4KPiA+ID4gYmV0d2VlbiB4ODYg
YW5kIGFhcmNoNjQgdGhhdCBoYXZlIGFzc3VtZWQgdXNlcnNwYWNlIGhhcmR3YXJlIGNvdW50ZXIK
PiA+ID4gYWNjZXNzLCBhbmQgZXZlcnl0aGluZyBlbHNlIHRoYXQgaXQgaXMgYXNzdW1lZCBkb24n
dC4KPiA+ID4KPiA+ID4gVGhhbmtzLAo+ID4gPiBJYW4KPiA+ID4KPiA+ID4gPiA+IENsZWFybHkg
cHJvY2VzcyBzd2l0Y2hlcyAoZXNwZWNpYWxseSBjcHUgbWlncmF0aW9ucykgY2F1c2UKPiA+ID4g
PiA+IHByb2JsZW1zLCBidXQgdGhleSBhcmUgb2J2aW91c2x5IGludmFsaWQgdmFsdWVzIGFuZCBj
YW4KPiA+ID4gPiA+IGJlIGlnbm9yZWQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU28gd2hpbGUgYSBs
b3Qgb2YgdXNlcyBtYXkgYmUgJ2hhcHB5JyB3aXRoIHRoZSB2YWx1ZXMgdGhlCj4gPiA+ID4gPiBw
ZXJmIGZyYW1ld29yayBnaXZlcywgc29tZXRpbWVzIHlvdSBkbyBuZWVkIHRvIGRpcmVjdGx5Cj4g
PiA+ID4gPiByZWFkIHRoZSByZWxldmFudCByZWdpc3RlcnMuCj4gPiA+ID4gPgo+ID4gPiA+ID4g
ICAgICAgICBEYXZpZAo+ID4gPiA+ID4KPiA+ID4gPiA+IC0KPiA+ID4gPiA+IFJlZ2lzdGVyZWQg
QWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVz
LCBNSzEgMVBULCBVSwo+ID4gPiA+ID4gUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykK
PiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiAtLQo+ID4gPiA+IFJlZ2FyZHMsCj4gPiA+
ID4gQXRpc2gKPiA+Cj4gPgo+ID4KPiA+IC0tCj4gPiBSZWdhcmRzLAo+ID4gQXRpc2gKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
