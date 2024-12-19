Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B39E77188
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 01:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hIO54SQ9hjvIShCrRyeM3m+2fpYVhHatnHoXkVTNBDk=; b=xnuGV44dzcRCwZ
	Et0oB5icR7NlYKgfJfmYwcWXAoCnbpTI8/6J1b6XnwnxMJ11SHazPJKP+uLa68llhqMYNzBmso1fg
	zmm186rVW3x8/gaQZvI6vTSPeWX7dRsZ+syayfRnN14WW/nN+Dp7pcMy0LRHfEMfoGjmgWWrjkrV9
	rV3JX33gGuefbi3PlL4gXXax4GcvUDOfPUpXstphIH8UgosL0F5CrFEMRRm+UYa67djT4JbUfI08G
	CuFayizbSgfoDYI57nA9XEimgJQeCDlRoq4KuypUyNn7TydNS/BTly381COOK87JNiGUg/03/TsFk
	j4Kgpgvun2tVveB2cHJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO5kH-00000000YIb-3oLS;
	Thu, 19 Dec 2024 01:54:33 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO5iH-00000000Xwu-0VZp
	for linux-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 01:52:30 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-728e1799d95so360408b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2024 17:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734573148; x=1735177948; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0hIoYn7mPi3FgUS2MCNd0c4MX2xpkvKX7vy1y9aMeMY=;
        b=TWf8zi510ISIIH3Q5CNvpqFvkONfQqhqpO/1N3PpFot4NvxLR8qSbRf5zycRgFsLHO
         hYlWliXm2erkxur35L59sjknk1x2SZnXu7wnxS7lFqiZXo68vRNaqG34K5Efh5nanwOF
         nxDqXv/LUEfbyntn029iaVkvLHmUswwPDyFEbqvLGHiUkLnJK3HdIvovl8n/NIliy3m+
         PewtwayyBddMRqkcnsy/baFyfG9Xkm7kE5iII8Om0pAjymQKpXzCsg8Uww6H3U1BZ+0t
         pkriFdohe1LQrIRB2l119jdw9zb0LtnKuWPgvYsqocrbg+urVM23TRjnxTY77x/wtR9o
         Vl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734573148; x=1735177948;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0hIoYn7mPi3FgUS2MCNd0c4MX2xpkvKX7vy1y9aMeMY=;
        b=Kda2AxRasMF+sZHWAEP66FLYrrSrAIHk7pBza0r0j7Sn4Es6yXJtIGtRGUGXMlNBmc
         MPf3tvOKBehLdChqEecJqKzpHP/AklzZd/rizHGd+lj1Yv7QSQ3vHc33IPXW3zJDl0Tt
         SJXUKfjkg4hD+JHoeyhOX6kYBxiswfn4y09dOie/pevolE/q/UkQc7jSFCDL38uOMcOv
         QOh8nCkyzmea9+43Dayul++Xlon1Cd1V2Vm9Xhu6a7w0tD14FJZG5g3yxfkbO2LfRm1X
         1y1a6SliS2v7TJHu8nwEBuMLcRf7RutW50JGAjhoSdsVRKvHxJThiKRbfQ0d4HASGNaZ
         IX4A==
X-Forwarded-Encrypted: i=1; AJvYcCVLB18iaZkGjeUoYQmlLyTkQHBVIxLNzvCsgktPmWWSuiVgc/iNUXcNOZCqDLDq4LDcJRll95uu47Ogzg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr5X7lv0+dZN/poZELpXodEh3FDx0bgCcAhnv27KgrXrm8tSP1
	50251TGb48jNYltaegcraJsXOqdCIRutAUfu78k6PsdMeiWHbc6+GBG0I5MGpGQ=
X-Gm-Gg: ASbGncsZUYdOEieF/Qm4JGC/FDfZEu3yY/wA/CX09HYecHU3VZk5CMjss7ti7Z7O+OJ
	EFTX3KTVJkafGb1QxmO8dDt5xBGr3ukh42OdxKgs1Y018BhlwNo+v350DPsaruMCnacxKkGFtex
	DbCLA1dHadM636sSFwTpC8E/wVDvR9CsoVZhDCY084Z76c2WATe1X2hnK9jZymNgrAYOKEyw1Gm
	FPYQkGIm2/8AJH0jAFFuv/miblEOrTDGzAV8XVdHBa5q+k=
X-Google-Smtp-Source: AGHT+IGt+ZCDcVVFAePqIYU9RjJQ0k+diPgN8DgjguNeNHG5ckZLUG4P896wZazyc+1vhNXeSRFBkg==
X-Received: by 2002:a05:6a20:c799:b0:1e0:dc34:2e7d with SMTP id adf61e73a8af0-1e5b45ff9eamr7878142637.5.1734573147826;
        Wed, 18 Dec 2024 17:52:27 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbb70sm135039b3a.98.2024.12.18.17.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 17:52:26 -0800 (PST)
Date: Wed, 18 Dec 2024 17:52:24 -0800
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
Message-ID: <Z2N8WLTmh0ojIzhF@ghost>
References: <20241217-perf_fix_riscv_obj_reading-v2-1-58f81b7b4c7d@rivosinc.com>
 <CAP-5=fXK6HRzBKHzF=T_w9cn7ohWOdmZNRMXvJzN6QG11HE6tA@mail.gmail.com>
 <Z2IXl5cuKQJInJb0@ghost>
 <Z2MXXFhUzoQmW4xV@x1>
 <CAP-5=fXPPfHHVPh0nYgR96VM+smuZKepO+GoE4X+aZsQE4tHSw@mail.gmail.com>
 <Z2M4ZparbNRvRHpz@ghost>
 <CAP-5=fXL6YaEq1cvBh2iESmQ_kqfm5VH5thJ0zrkOCcaWv5s+Q@mail.gmail.com>
 <Z2NNcy1jCLqb62h2@ghost>
 <CAP-5=fUBcu=Kd7StJvwdM_ArnSdOjmAcgR7NzDd+Ep8LrNMhyw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fUBcu=Kd7StJvwdM_ArnSdOjmAcgR7NzDd+Ep8LrNMhyw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_175229_445728_C79CD977 
X-CRM114-Status: GOOD (  65.04  )
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

T24gV2VkLCBEZWMgMTgsIDIwMjQgYXQgMDU6MjA6MTVQTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBXZWQsIERlYyAxOCwgMjAyNCBhdCAyOjMy4oCvUE0gQ2hhcmxpZSBKZW5raW5zIDxj
aGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBEZWMgMTgsIDIwMjQg
YXQgMDI6MTM6MjBQTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90ZToKPiA+ID4gT24gV2VkLCBEZWMg
MTgsIDIwMjQgYXQgMTowMuKAr1BNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5j
b20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gV2VkLCBEZWMgMTgsIDIwMjQgYXQgMTE6MjM6
NTFBTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90ZToKPiA+ID4gPiA+IE9uIFdlZCwgRGVjIDE4LCAy
MDI0IGF0IDEwOjQx4oCvQU0gQXJuYWxkbyBDYXJ2YWxobyBkZSBNZWxvCj4gPiA+ID4gPiA8YWNt
ZUBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gT24gVHVlLCBEZWMg
MTcsIDIwMjQgYXQgMDQ6MzA6MTVQTSAtMDgwMCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+ID4g
PiA+ID4gPiA+IE9uIFR1ZSwgRGVjIDE3LCAyMDI0IGF0IDA0OjE4OjMyUE0gLTA4MDAsIElhbiBS
b2dlcnMgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiBPbiBUdWUsIERlYyAxNywgMjAyNCBhdCAzOjUy
4oCvUE0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+
ID4gPiA+ID4gPiA+IEFmdGVyIGJpbnV0aWxzIGNvbW1pdCBlNDNkODc2IHdoaWNoIHdhcyBmaXJz
dCBpbmNsdWRlZCBpbiBiaW51dGlscyAyLjQxLAo+ID4gPiA+ID4gPiA+ID4gPiByaXNjdiBubyBs
b25nZXIgc3VwcG9ydHMgZHVtcGluZyBpbiB0aGUgbWlkZGxlIG9mIGluc3RydWN0aW9ucy4gSW5j
cmVhc2UKPiA+ID4gPiA+ID4gPiA+ID4gdGhlIG9iamR1bXAgd2luZG93IGJ5IDItYnl0ZXMgdG8g
ZW5zdXJlIHRoYXQgYW55IGluc3RydWN0aW9uIHRoYXQgc2l0cwo+ID4gPiA+ID4gPiA+ID4gPiBv
biB0aGUgYm91bmRhcnkgb2YgdGhlIHNwZWNpZmllZCBzdG9wLWFkZHJlc3MgaXMgbm90IGN1dCBp
biBoYWxmLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaGFy
bGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+ID4gUmV2aWV3ZWQtYnk6IElhbiBSb2dlcnMgPGlyb2dlcnNAZ29vZ2xlLmNvbT4KPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gQSBiaW51dGlscyBwYXRjaCBoYXMgYmVlbiBzZW50IGFz
IHdlbGwgdG8gZml4IHRoaXMgaW4gb2JqZHVtcCBbMV0uCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4gPiA+IExpbms6IGh0dHBzOi8vc291cmNld2FyZS5vcmcvcGlwZXJtYWlsL2JpbnV0aWxzLzIw
MjQtRGVjZW1iZXIvMTM4MTM5Lmh0bWwgWzFdCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+
IENoYW5nZXMgaW4gdjI6Cj4gPiA+ID4gPiA+ID4gPiA+IC0gRG8gb2JqZHVtcCB2ZXJzaW9uIGRl
dGVjdGlvbiBhdCBydW50aW1lIChJYW4pCj4gPiA+ID4gPiA+ID4gPiA+IC0gTGluayB0byB2MTog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTIxNi1wZXJmX2ZpeF9yaXNjdl9vYmpfcmVh
ZGluZy12MS0wLWI3NTk2MjY2MGE5YkByaXZvc2luYy5jb20KPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiA+ID4gLS0tIGEvdG9vbHMvcGVyZi90ZXN0cy9jb2RlLXJlYWRpbmcuYwo+ID4gPiA+ID4g
PiA+ID4gPiBAQCAtMTgzLDkgKzI0NCwzMCBAQCBzdGF0aWMgaW50IHJlYWRfdmlhX29iamR1bXAo
Y29uc3QgY2hhciAqZmlsZW5hbWUsIHU2NCBhZGRyLCB2b2lkICpidWYsCj4gPiA+ID4gPiA+ID4g
PiA+ICAgICAgICAgY29uc3QgY2hhciAqZm10Owo+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgIEZJ
TEUgKmY7Cj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgaW50IHJldDsKPiA+ID4gPiA+ID4gPiA+
ID4gKyAgICAgICB1NjQgc3RvcF9hZGRyZXNzID0gYWRkciArIGxlbjsKPiA+ID4gPiA+ID4gPiA+
ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIGlmIChJU19FTkFCTEVEKF9fcmlzY3YpKSB7
Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBOb3Qgc3VyZSBpZiB0aGVyZSBpcyBhIGNvbnNp
c3RlbmN5IGlzc3VlIGhlcmUuIEVsc2V3aGVyZSB3ZSdyZSBqdXN0Cj4gPiA+ID4gPiA+ID4gPiB1
c2luZyBpZmRlZiwgc3VjaCBhczoKPiA+ID4gPiA+ID4gPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BlcmYvcGVyZi10b29scy1uZXh0LmdpdC90cmVl
L3Rvb2xzL3BlcmYvdXRpbC9pbmNsdWRlL2R3YXJmLXJlZ3MuaD9oPXBlcmYtdG9vbHMtbmV4dCNu
NjkKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBJIGRvbid0IGhhdmUgYW55IHN0cm9uZyBmZWVs
aW5ncyBhYm91dCB0aGF0LiBJIGNhbiBjaGFuZ2UgaXQgdG8gYmUgYW4KPiA+ID4gPiA+ID4gPiBp
ZmRlZi4gT24gb3RoZXIgbGlzdHMgSSBoYXZlIGJlZW4gdG9sZCB0byB1c2UgSVNfRU5BQkxFRCB3
aGVuZXZlcgo+ID4gPiA+ID4gPiA+IHBvc3NpYmxlLCBidXQgaXQncyBvbmx5IGEgc21hbGwgZGlm
ZmVyZW5jZS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gQ2FuJ3Qgd2UganVzdCB1c2UgdW5hbWUg
aGVyZT8KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gU28gdGhhdCB3ZSBkb24ndCB1c2Uga2NvbmZp
Zy5oIHNpbmNlIGl0cyBub3QgdXNlZCBpbiB0b29scy9wZXJmLyBhbmQKPiA+ID4gPiA+ID4gbWFr
ZXMgaXQgbG9va3MgbGlrZSBwZXJmIGlzIGluIGxvY2tzdGVwIHdpdGggdGhlIGtlcm5lbCBzb3Vy
Y2UgdHJlZQo+ID4gPiA+ID4gPiB2ZXJzaW9uIGl0IHdhcyBjb21waWxlZCBmcm9tPwo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiAkIGdpdCBncmVwIGtjb25maWcuaCB0b29scy9wZXJmLwo+ID4gPiA+
ID4gPiAkCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEJUVywgd2hhdCB3b3VsZCBoYXBwZW4gaWYg
SSBjb2xsZWN0ZWQgYSBwZXJmLmRhdGEgZmlsZSBvbiB4ODZfNjQgYW5kCj4gPiA+ID4gPiA+IHdv
dWxkIHJlYWQgaXQgaW4gYSBSaXNjViBtYWNoaW5lIHdpdGggc3VjaCBhIG9iamR1bXAgdmVyc2lv
bj8gVGhlIHNhbWUKPiA+ID4gPiA+ID4gcHJvYmxlbT8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlz
IGNvZGUgaXMgaW4gdGVzdHMgaGVuY2UgdGhpbmtpbmcgdGhhdCBhIHNlcGFyYXRlIGZpeCBpcyBu
ZWVkZWQgZm9yCj4gPiA+ID4gPiB0aGF0IHByb2JsZW0uIEhvcGVmdWxseSB0aGUgdXNlIG9mIGVs
ZiBtYWNoaW5lL2ZsYWdzIHRhY2tsZXMgaXQ6Cj4gPiA+ID4gPiBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wZXJmL3BlcmYtdG9vbHMtbmV4dC5naXQvdHJl
ZS90b29scy9wZXJmL3V0aWwvaW5jbHVkZS9kd2FyZi1yZWdzLmg/aD1wZXJmLXRvb2xzLW5leHQj
bjI1Cj4gPiA+ID4gPiBXZSBhcmUgZ2V0dGluZyBzb21ld2hhdCBkaXNhc3NlbWJsZXIgaGVhdnku
IFdlIGhhdmUgbGx2bSBhcyBhIGxpYnJhcnksCj4gPiA+ID4gPiBjYXBzdG9uZSBhcyBhIGxpYnJh
cnksIGJpbnV0aWxzIG9iamR1bXAgYW5kIGxsdm0gb2JqZHVtcC4gR2l2ZW4gdGhlCj4gPiA+ID4g
PiBwYWluIHdpdGggcGFyc2luZyB0ZXh0LCBjb3VsZCB3ZSBsb3NlIHRoZSBvYmpkdW1wcz8gU2lt
aWxhcmx5IGZvcgo+ID4gPiA+ID4gYWRkcjJsaW5lPwo+ID4gPiA+Cj4gPiA+ID4gQXJlIHlvdSBz
dWdnZXN0aW5nIHRvIHJlbW92ZSB0aGlzIHRlc3QgY2FzZSBlbnRpcmVseSB0byBnZXQgcmlkIG9m
IHRoZQo+ID4gPiA+IG9iamR1bXAgZGVwZW5kZW5jeT8gVGhlIGdvYWwgb2YgdGhpcyB0ZXN0IGNh
c2Ugc2VlbXMgdG8gYmUgdG8gY2hlY2sKPiA+ID4gPiBvYmpkdW1wIGFuZCBwZXJmIHJldHVybiB0
aGUgc2FtZSBkYXRhLCBzbyBpdCBkb2Vzbid0IHNlZW0gbGlrZSB0aGVyZQo+ID4gPiA+IHdvdWxk
IGJlIGFuIGFsdGVybmF0aXZlIHRvIHVzaW5nIG9iamR1bXAuCj4gPiA+Cj4gPiA+IEkgY2FuIGlt
YWdpbmUgaGF2aW5nIGFuIG9iamR1bXAgZGVwZW5kZW5jeSBmb3IgYSB0ZXN0IGJ1dCBub3QgZm9y
IHNvbWUKPiA+ID4gbW9yZSBjb3JlIGxpa2UgYHBlcmYgYW5ub3RhdGVgLiBXZSBoYXZlIHRvIGRv
IHdlaXJkIHRoaW5ncyB3aGVuCj4gPiA+IHBhcnNpbmcgdGV4dCwgbGlrZSB0aGlzIGNvZGUgSSdt
IG5vdCBwcm91ZCBvZjoKPiA+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvcGVyZi9wZXJmLXRvb2xzLW5leHQuZ2l0L3RyZWUvdG9vbHMvcGVyZi91dGls
L3NyY2xpbmUuYz9oPXBlcmYtdG9vbHMtbmV4dCNuNTIzCj4gPiA+IFRoZSBpc3N1ZSB3aXRoIHRo
YXQgY29kZSBpcyB0aGF0IExMVk0gb2JqZHVtcCBoYXMgY2hhbmdlZCBpdHMgb3V0cHV0Cj4gPiA+
IGluIG5ld2VyIHZlcnNpb25zIHRvIGJlIGNsb3NlciB0byBiaW51dGlscyBvYmpkdW1wLiBEaWQg
dGhhdCBicmVhawo+ID4gPiBwZXJmPyBNYXliZSBpdCBqdXN0IGJyb2tlIHdoYXQgb3VyIHZhcmlh
YmxlcyB0aGluayBpcyBhbiBMTFZNIG9iamR1bXAsCj4gPiA+IGJ1dCB0aGluZ3MgYXJlbid0IHJl
YWxseSBicm9rZW4uIFRoaXMga2luZCBvZiBpc3N1ZSBkb2Vzbid0IG9jY3VyIHdpdGgKPiA+ID4g
YSBsaWJyYXJ5LCBhbHRob3VnaCB0aGUgZGlmZmVyaW5nIG5lZWRzIG9mIGxpYnJhcnkgdmVyc2lv
bnMgaXMgYSByZWFsCj4gPiA+IHRoaW5nLgo+ID4KPiA+IFllYWggZG9pbmcgdGhlIHBhcnNpbmcg
b2YgdGhlIHRleHQgb3V0cHV0IGlzIG5vdCBpZGVhbC4uLiBGb3IgdGhpcyB0ZXN0Cj4gPiBjYXNl
IGl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byBkeW5hbWljYWxseSBsaW5rIGFnYWluc3QgbGliYmZk
Lgo+IAo+IEkgbmVlZCB0byB3cml0ZSB0aGUgcGF0Y2ggc2V0IHRvIGRlbGV0ZSBsaWJiZmQgZnJv
bSBwZXJmLiBJQU5BTCBidXQKPiB0aGUgaXNzdWUgaXMgdGhhdCBsaWJiZmQgaXMgcGFydCBvZiBi
aW51dGlscyBhbmQgR1BMdjMsIHdoaWxlIHBlcmYgaXMKPiBwYXJ0IG9mIHRoZSBMaW51eCBrZXJu
ZWwgYW5kIGxhcmdlbHkgR1BMdjIuIEdQTHYzIGlzIGluY29tcGF0aWJsZSB3aXRoCj4gR1BMdjI6
Cj4gaHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy9ncGwtZmFxLmh0bWwjQWxsQ29tcGF0aWJp
bGl0eQo+IFdoaWxlIHVzaW5nIGRsb3BlbiBtZWFucyB3ZSdyZSBub3QgbGlua2luZyBhZ2FpbnN0
IGxpYmJmZCwgd2UgbWF5Cj4gZWZmZWN0aXZlbHkgYmUgdXNpbmcgaXQgYXMgYSBwbHVnaW4gd2hp
Y2ggYWdhaW4gR1BMdjMgKGluIG15IElBTkFMCj4gb3Bpbmlvbikgd291bGRuJ3QgYWxsb3c6Cj4g
aHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy9ncGwtZmFxLmVuLmh0bWwjR1BMUGx1Z2lucwo+
IEN1cnJlbnRseSB0byBnZXQgbGliYmZkIHN1cHBvcnQgaW4gcGVyZiB5b3UgbmVlZCB0byBiZSBi
dWlsZGluZyB0aGUKPiBiaW5hcnkgeW91cnNlbGYgYW5kIGFkZCB0byB0aGUgYnVpbGQgQlVJTERf
Tk9ORElTVFJPPTEuIFdlIGRvIHRoaXMgYXMKPiBwYXJ0IG9mIG91ciBidWlsZCB0ZXN0aW5nIGJ1
dCBoYXZpbmcgYWxsIHRoZSAjaWZkZWYtZWQgbGliYmZkIGNvZGUgaWYKPiBub3RoaW5nIGVsc2Ug
bWFrZXMgdGhlIGNvZGUgaGFyZGVyIHRvIHVuZGVyc3RhbmQuCgpMaWNlbnNpbmcgaXMgZnVuIDsp
Cgo+IAo+ID4gSSB3b3VsZAo+ID4gZ3Vlc3Mgc29tZXRoaW5nIHNpbWlsYXIgY291bGQgYmUgZG9u
ZSB3aXRoIGxsdm0tb2JqZHVtcCBidXQgSSBhbSBsZXNzCj4gPiBmYW1pbGlhciB3aXRoIHRoYXQu
IEkgZG9uJ3Qga25vdyBpZiB0aGF0J3MgYSBnb29kIHBhdGggdG8gZ28gZG93bgo+ID4gdGhvdWdo
Lgo+IAo+IEluIHRoZSBwYXN0IEkgcGVyY2VpdmVkIHRoZXJlIHdhcyBob3N0aWxpdHkgdG93YXJk
IExMVk0gZnJvbSB0aGUgTGludXgKPiBrZXJuZWwgY29tbXVuaXR5LiBJIGd1ZXNzIEdQTCB3YXMg
Y29uc2lkZXJlZCB0aGUgc3BlY2lhbCBzYXVjZSBhcyB0bwo+IHdoeSBMaW51eCB3b24gYW5kIHRo
ZSBCU0RzIGhhZG4ndCwgc28gdGhlIHByZWZlcmVuY2Ugd2FzIHRvIGZhdm9yIGEKPiBjb21waWxl
ciB0aGF0IHVzZWQgdGhlIHNhbWUgbGljZW5zZS4gSSBkb24ndCB0aGluayB0aGF0J3MgdHJ1ZSBh
bnkKPiBtb3JlIGFuZCBJIHRoaW5rIHRoZXJlJ3MgYSBsb3Qgb2Ygc2Vuc2UgaW4gdXNpbmcgTExW
TSdzIGxpYnJhcmllcwo+IHJhdGhlciB0aGFuIHJlaW52ZW50aW5nIHRoZW0gaW4gdGhlIHBlcmYg
dG9vbCwgb3IgdXNpbmcgcGVyaGFwcyBsZXNzCj4gb3J0aG9kb3ggc291cmNlcyBsaWtlIGxpYmNh
cHN0b25lLiBJJ20gbm90IGEgZmFuIG9mIHRoZSB0ZXh0IG91dHB1dAo+IHByb2Nlc3Npbmcgc3R1
ZmYgc28gZ2V0dGluZyByaWQgb2Ygb2JqZHVtcCBhbmQgbGx2bS1vYmpkdW1wIHN1cHBvcnQKPiB3
b3VsZCBiZSBnb29kIGltby4KClllYWggSSBhZ3JlZS4gVGhpcyB0ZXN0IGNhc2UgZGlkIGVuZCB1
cCBiZWluZyBpbnRlcmVzdGluZyB0aG91Z2ggYXMgaXQKdW5jb252ZXJlZCB0aGlzIGNoYW5nZSBp
biBiZWhhdmlvciBvZiBvYmpkdW1wIG9uIHJpc2N2LCBidXQgdGhhdCdzCnRhbmdlbnRpYWwgdG8g
dGhlIHB1cnBvc2Ugb2YgdGhpcyB0ZXN0IGNhc2UuIFdlIG5lZWQgdGhpcyBwYXRjaCBvbiByaXNj
dgp0byBzdG9wIHRoaXMgdGVzdCBmcm9tIGZhaWxpbmcsIGJ1dCBpdCBpcyBhbHNvIHJlYXNvbmFi
bGUgdG8gYXBwcm9hY2gKdGhpcyBkaWZmZXJlbnRseSBhbmQgbm90IHVzZSBvYmpkdW1wIGF0IGFs
bC4KCj4gCj4gQW5vdGhlciBhcmVhIHdoZXJlIEkgdGhpbmsgd2UgY291bGQgbG9zZSBhIGxvdCBv
ZiBjb2RlIGJhZ2dhZ2UgaXMgd2l0aAo+IGxpYnVud2luZCwgYXMgQlBGIHN1cHBvcnQgcmVxdWly
ZXMgbGliZWxmIHdoaWNoIGJyaW5ncyB3aXRoIGl0Cj4gbGliZHdhcnZlcyB3aGljaCB3aGVuIHBy
ZXNlbnQgbWVhbnMgd2UgZG9uJ3QgdXNlIGxpYnVud2luZC4gSSd2ZSBoZWFyZAo+IHJlcG9ydHMg
dGhhdCBsaWJkd2FydmVzIGlzIHNsb3dlciwgYnV0IEknbSBzdXJlIHdlIGNhbiBhZGQgY2FjaGVz
IHRvCj4gc3BlZWQgaXQgdXAgd2hpY2ggd291bGQgbGlrZWx5IGJlbmVmaXQgYSByYW5nZSBvZiBw
ZW9wbGUuIEkgd2FzIGtpbmQKPiBvZiBob3Bpbmcgd2l0aCBhbGwgdGhhdCBkZWxldGVkIHdlIG1h
eSBiZSBhYmxlIHRvIGdldCByaWQgb2YgdGhlCj4gbWFqb3JpdHkgb2YgdGhlIGFyY2ggZGlyZWN0
b3J5LCBidXQgdGhlIHN5c2NhbGx0Ymwgd29yayBpcyBhZGRpbmcgdG8KPiB0aGF0IGRpcmVjdG9y
eSA6LSkKClllYWguLi4gVGhlIHN5c2NhbGx0Ymwgd29yayB3aWxsIGFkZCBzb21lIGV4dHJhIHBh
cnRzIHRvIHRoZSBhcmNoCmRpcmVjdG9yeS4gQSBsb3Qgb2YgdGhlIGFkZGl0aW9ucyBhcmUgZ2Vu
ZXJpYyBhbmQgYSBjaHVuayBvZgphcmNoLXNwZWNpZmljIGlmZGVmcyB3ZXJlIGFibGUgdG8gYmUg
cmVtb3ZlZCwgYnV0IHdlIHN0aWxsIGhhdmUgdGhlCiJwcm9ibGVtIiB0aGF0IG5vdCBldmVyeSBh
cmNoaXRlY3R1cmUgdXNlcyB0aGUgc2hhcmVkIHN5c2NhbGwgdGFibGUgYW5kCnN1cHBvcnRzIGRp
ZmZlcmVudCBzeXNjYWxscy4KCi0gQ2hhcmxpZQoKPiAKPiBUaGFua3MsCj4gSWFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
