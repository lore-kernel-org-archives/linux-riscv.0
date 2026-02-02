Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8ABD172B3
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 01:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9mf+cTlrknM5QD2OX3Kzk0DtBsbxwcXrBcIjZ2U71ds=; b=KACW9OJx9zJtMK
	JXXSplfQBVExqP18KrqktiFkj37iSj3jwXSExYu5U1IA1Vnqu6G1cvoeHKTjVrdMwAwbPH3Zt3qCX
	zzjywgZ150og/wROsUuFpKQeRlKHpP16l1WnmzMrrbHbFdAme57/KotW366uZQZpJMfs3HcA/9uT3
	QyAk6D7CATwkvSu+WgX0VjLUT/fO58+q4J7a6wo02TsOEUKHvipW2mwG9hITc0L1Wjn2Puf5tKD/o
	A5ebfnOram2L/Q9QVC823NbrcoYX2hxIUgve0v2ikFNYwt7RdeeNNyCcVsQEO+dykBf8cE1p2vJEp
	oSVhGCkiByZt/d/N1+sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmjAW-00000004Jym-0oRt;
	Mon, 02 Feb 2026 01:56:00 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmjAS-00000004JxP-3mfw
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 01:55:58 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a76b39587aso108965ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 01 Feb 2026 17:55:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769997355; cv=none;
        d=google.com; s=arc-20240605;
        b=T6hyU170PFwQoL3bFRykVe89PRTUv8a72Ol533sIc587xdEY3Cx0U1kh0wnF5b0Dag
         g53DSeOWIbAE4m1HYDC8JhG/JY8V605GQ4NolClfgLUBqts/jBCywC3Hjg2bGeezDNNo
         Es/W7IGXgAwQI35ezBnV/KMUN0V26jQ28afyjcA2AaB5L/ikQ89pyTmb6BOMA/QVKShe
         uIZmK3jTV0EZ098RaAnCl53RIhUcmDNMNEYoyN6Br30ewIycDymeah/+bLuqGhnrLfeD
         5Afbi5iJO6rZt1gnYv1asXkl3OEd6fLizmboQm0MeXmgwVAvhUq4QOA4Bvbs11StPli6
         DHMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zKMyhwj1CFOlY+qo9L/Ll46UsMAktS3TMkFqPphW4YM=;
        fh=UYWjVr3yTtmJbWEETjsCcjuzGl51Qyc16tJA4//MMDk=;
        b=MVAFUYgXApPkoXUx2iEyEXbkpdc/FOv+dy2u05LEDNX3yIk8HltYU8f0mxI4npPVj4
         XC9fBfgeCwk2Lk3JDkE/eQVVcH9WQz7oVfYCocITH7HF8RkMF1ULHvU5ucFvHfHsC4Xg
         fpMWOPjJfJuX2Ryj7jOahDGhd5IpJgzjurlmghj8qYuf8rMA5uPKDsyr9JATDhv9pCNz
         1zHo37n3bXpYp/1G4hGmQ8CxftZOJyUy0bBDBjMpj9ReGQCqb8mQWSJjPNsB0dJeFrXj
         RxaAZuVvfoeTx3NaTwmHNRY4rH5Za+U/te30xQIpDNrTla+Qkecz2nubIf/YgogFXIZO
         yyfA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769997355; x=1770602155; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKMyhwj1CFOlY+qo9L/Ll46UsMAktS3TMkFqPphW4YM=;
        b=W7sz1F1nkoFRx+dFhb/TmJLif0cRg55RutcHCQpl8KWns2P3LMUrJTwm9dtBvaklYP
         777Q5RuhsSSznLfkJ1jWISGFIsi/R9YcVzYO3tQKmGgB+1WbUyQfWUquS2hTR9RqaY6a
         oQq6j4ysrWcyDK48JNg5snmlnCnYFjbL2THaYaQkTWYEBTu5kPBJFQV4hHTzBIOQ3B9u
         /XBCtZa52GgfGMYjkpyYjx65udI3RjCzn0S6H6HiKCyVagaqS9CnZzqQfYNBqL9GFKIj
         gMOUXPdyYm8VXgdDOuI/xuktFQVo/yuIGx3H+uOCzuz8S0LOYukgdlKZQSyw0PjIpK2n
         o+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769997355; x=1770602155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zKMyhwj1CFOlY+qo9L/Ll46UsMAktS3TMkFqPphW4YM=;
        b=Csld7NU+qbr08g348+RJ2U8bp5K+JZFeI6kUFZPHXY13fbvvWbku7UARk4uNVmC6ex
         wZcdT10LBTtN+hmUl3wL3qpaDQWX5FPjKd25hqWs1GqHCMrUppt0HH6hzOBM22hMJsUb
         AW1a8+IzY338do0GZJ+Y37YivhjCbdmZ4H7x3Sa0w5o8F6wykAuLLQ2FJmUyuaLq8PXB
         EIbkFgePuxc8V6uR+//HJ78YX/ZBwWcikv0JzC6j5o+lClaW7dynlL4FhA1xVeYAD+xF
         MCWA8U+wEE7+xAdxY4JhfXa7/y05qhYqKAaQ87EkGskBMK935aPqcLSEZJaPkwcxJwuF
         NyjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ4gSPCpHJd0cjxPMfP/RYEXxRfFufuecssDGw3pWyqIarfe2Y5lAdB1/cj5b640CBwRGrMXACEG/luw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzatgJk4TPtrBTW4r4yAmMybI4grwKWUSttUMbtXuvOR0W5tGor
	/fpyCM2LtlG99ZSFJc46QzJ/vmRzTrvl/3iNymAYT+x4tmWhBv3rPmG08sSbIg60AkfdG6q4feF
	qDnes24xr9d+StBhWtfzUjKF6QG8k5A8assCdlUJD
X-Gm-Gg: AZuq6aJ86s9vFIwMFAGsh9cwGgA2QKtqv8qQNnSwzQ7XlhvSXa9u68CdbUekzHRNScg
	j0toffQOmsCb1gjpoEInwP5Hf1BVt8ZUdHzs/yaW1sndyoK0jBT9B89BrEAnJrLH2Kc658SdiXX
	XSKZA7HmoDt7f9TM7+AJFff5OaPHXkMSPfJUote+u8iFqTeL9aN76ViShczLsjsUrXXWlUfBex7
	K6zD7UyM0wQ5X2TEnC3yvC19qY5TInDMMMLPFE6Y/tgzcr0n+qS6hEzI9VhDLDKJqjX9n0vcoIl
	7vYg2lTo6Ksp0rFHNvJJ1wyClA==
X-Received: by 2002:a17:903:1b46:b0:295:3f35:a315 with SMTP id
 d9443c01a7336-2a8f508a028mr1388475ad.5.1769997354552; Sun, 01 Feb 2026
 17:55:54 -0800 (PST)
MIME-Version: 1.0
References: <20260131200224.1296136-1-irogers@google.com> <20260131200224.1296136-3-irogers@google.com>
 <20260201170459.GA584@debian-dev>
In-Reply-To: <20260201170459.GA584@debian-dev>
From: Ian Rogers <irogers@google.com>
Date: Sun, 1 Feb 2026 17:55:43 -0800
X-Gm-Features: AZwV_Qhcem8Bk7pzFsCUDa55vlzfQf_z4Xlvnl5l4tr16HwWCArY51n37Nz_Lv8
Message-ID: <CAP-5=fXedkNLSWXVRJy7SDknx3Mb+BqUHPf7Oo7JSHshgoJ0qQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] perf kvm stat: Remove use of the arch directory
To: Leo Yan <leo.yan@linux.dev>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	Mike Leach <mike.leach@linaro.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, Yunseong Kim <ysk@kzalloc.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Quan Zhou <zhouquan@iscas.ac.cn>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Blake Jones <blakejones@google.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Howard Chu <howardchu95@gmail.com>, 
	Anubhav Shelat <ashelat@redhat.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Chun-Tse Shao <ctshao@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_175556_962517_9FBE3BDC 
X-CRM114-Status: GOOD (  23.68  )
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

T24gU3VuLCBGZWIgMSwgMjAyNiBhdCA5OjA14oCvQU0gTGVvIFlhbiA8bGVvLnlhbkBsaW51eC5k
ZXY+IHdyb3RlOgo+Cj4gT24gU2F0LCBKYW4gMzEsIDIwMjYgYXQgMTI6MDI6MjBQTSAtMDgwMCwg
SWFuIFJvZ2VycyB3cm90ZToKPgo+IFsuLi5dCj4KPiA+IEBAIC0xNjY2LDcgKzE2NjEsNyBAQCBr
dm1fZXZlbnRzX3JlY29yZChzdHJ1Y3QgcGVyZl9rdm1fc3RhdCAqa3ZtLCBpbnQgYXJnYywgY29u
c3QgY2hhciAqKmFyZ3YpCj4gPiAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiAgICAgICB9
Cj4gPgo+ID4gLSAgICAgZm9yIChldmVudHNfdHAgPSBrdm1fZXZlbnRzX3RwOyAqZXZlbnRzX3Rw
OyBldmVudHNfdHArKykKPiA+ICsgICAgIGZvciAoZXZlbnRzX3RwID0ga3ZtX2V2ZW50c190cCgp
OyAqZXZlbnRzX3RwOyBldmVudHNfdHArKykKPiA+ICAgICAgICAgICAgICAgZXZlbnRzX3RwX3Np
emUrKzsKPiA+Cj4gPiAgICAgICByZWNfYXJnYyA9IEFSUkFZX1NJWkUocmVjb3JkX2FyZ3MpICsg
YXJnYyArIDIgKwo+ID4gQEAgLTE2ODEsNyArMTY3Niw3IEBAIGt2bV9ldmVudHNfcmVjb3JkKHN0
cnVjdCBwZXJmX2t2bV9zdGF0ICprdm0sIGludCBhcmdjLCBjb25zdCBjaGFyICoqYXJndikKPiA+
Cj4gPiAgICAgICBmb3IgKGogPSAwOyBqIDwgZXZlbnRzX3RwX3NpemU7IGorKykgewo+ID4gICAg
ICAgICAgICAgICByZWNfYXJndltpKytdID0gU1RSRFVQX0ZBSUxfRVhJVCgiLWUiKTsKPiA+IC0g
ICAgICAgICAgICAgcmVjX2FyZ3ZbaSsrXSA9IFNUUkRVUF9GQUlMX0VYSVQoa3ZtX2V2ZW50c190
cFtqXSk7Cj4gPiArICAgICAgICAgICAgIHJlY19hcmd2W2krK10gPSBTVFJEVVBfRkFJTF9FWElU
KGt2bV9ldmVudHNfdHAoKVtqXSk7Cj4gPiAgICAgICB9Cj4KPiBOaXRwaWNrOiB3ZSBjYW4gYXNz
aWduIHJldXNlIGV2ZW50c190cCB0aHJvdWdob3V0IHRoZQo+IGt2bV9ldmVudHNfcmVjb3JkKCku
ICBTb21ldGhpbmcgbGlrZToKPgo+ICAgZXZlbnRzX3RwID0ga3ZtX2V2ZW50c190cCgpOwo+ICAg
Zm9yIChqID0gMDsgZXZlbnRzX3RwW2pdOyBqKyspCj4gICAgICAgIGV2ZW50c190cF9zaXplKys7
Cj4KPiAgIC4uLgo+Cj4gICBmb3IgKGogPSAwOyBqIDwgZXZlbnRzX3RwX3NpemU7IGorKykgewo+
ICAgICAgICByZWNfYXJndltpKytdID0gU1RSRFVQX0ZBSUxfRVhJVCgiLWUiKTsKPiAgICAgICAg
cmVjX2FyZ3ZbaSsrXSA9IFNUUkRVUF9GQUlMX0VYSVQoZXZlbnRzX3RwW2pdKTsKPiAgIH0KPgo+
IFsuLi5dCj4KPiA+ICtpbnQgc2V0dXBfa3ZtX2V2ZW50c190cChzdHJ1Y3QgcGVyZl9rdm1fc3Rh
dCAqa3ZtKQo+ID4gK3sKPiA+ICsgICAgIHN3aXRjaCAoRU1fSE9TVCkgewo+ID4gKyAgICAgY2Fz
ZSBFTV9QUEM6Cj4gPiArICAgICBjYXNlIEVNX1BQQzY0Ogo+ID4gKyAgICAgICAgICAgICByZXR1
cm4gX19zZXR1cF9rdm1fZXZlbnRzX3RwX3Bvd2VycGMoa3ZtKTsKPiA+ICsgICAgIGRlZmF1bHQ6
Cj4gPiArICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gKyAgICAgfQo+ID4gK30KPiA+ICsKPiA+
ICtpbnQgY3B1X2lzYV9pbml0KHN0cnVjdCBwZXJmX2t2bV9zdGF0ICprdm0sIGNvbnN0IGNoYXIg
KmNwdWlkKQo+ID4gK3sKPiA+ICsgICAgIHN3aXRjaCAoRU1fSE9TVCkgewo+ID4gKyAgICAgY2Fz
ZSBFTV9BQVJDSDY0Ogo+ID4gKyAgICAgICAgICAgICByZXR1cm4gX19jcHVfaXNhX2luaXRfYXJt
NjQoa3ZtKTsKPiA+ICsgICAgIGNhc2UgRU1fTE9PTkdBUkNIOgo+ID4gKyAgICAgICAgICAgICBy
ZXR1cm4gX19jcHVfaXNhX2luaXRfbG9vbmdhcmNoKGt2bSk7Cj4gPiArICAgICBjYXNlIEVNX1BQ
QzoKPiA+ICsgICAgIGNhc2UgRU1fUFBDNjQ6Cj4gPiArICAgICAgICAgICAgIHJldHVybiBfX2Nw
dV9pc2FfaW5pdF9wb3dlcnBjKGt2bSk7Cj4gPiArICAgICBjYXNlIEVNX1JJU0NWOgo+ID4gKyAg
ICAgICAgICAgICByZXR1cm4gX19jcHVfaXNhX2luaXRfcmlzY3Yoa3ZtKTsKPiA+ICsgICAgIGNh
c2UgRU1fUzM5MDoKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIF9fY3B1X2lzYV9pbml0X3MzOTAo
a3ZtLCBjcHVpZCk7Cj4gPiArICAgICBjYXNlIEVNX1g4Nl82NDoKPiA+ICsgICAgIGNhc2UgRU1f
Mzg2Ogo+ID4gKyAgICAgICAgICAgICByZXR1cm4gX19jcHVfaXNhX2luaXRfeDg2KGt2bSwgY3B1
aWQpOwo+ID4gKyAgICAgZGVmYXVsdDoKPiA+ICsgICAgICAgICAgICAgcHJfZXJyKCJVbnN1cHBv
cnRlZCBrdm0tc3RhdCBob3N0ICVkXG4iLCBFTV9IT1NUKTsKPiA+ICsgICAgICAgICAgICAgcmV0
dXJuIC0xOwo+ID4gKyAgICAgfQo+ID4gK30KPgo+IEZvciBhIGdlbmVyYWwgc29sdXRpb24sIEkn
ZCBwcmVmZXIgdG8gdXNlICJpbnN0YWxsIiArIGNhbGxiYWNrIG1ldGhvZHMKPiByYXRoZXIgdGhh
biB0aGUgb3BlbmVkIGNvZGUuICBFLmcuLCBlYWNoIGFyY2ggaW5zdGFsbHMgYSBzdHJ1Y3R1cmUK
PiB3aXRoIGNhbGxiYWNrczoKPgo+ICAgc3RydWN0IGt2bV9zdGF0X2FyY2gga3ZtX3N0YXRfYWFy
Y2g2NCB7Cj4gICAgICAgLnNldHVwX2V2ZW50c190cCA9IE5VTEw7Cj4gICAgICAgLmNwdV9pc2Ff
aW5pdCAgICA9IF9fY3B1X2lzYV9pbml0X2FybTY0Owo+ICAgICAgIC4uLgo+ICAgfTsKPgo+IFRo
ZW4gYXQgdGhlIGluaXQgcGhhc2UsIHdlIGNhbiBpbnN0YWxsIGFyY2gncyBzdHJ1Y3R1cmU6Cj4K
PiAgIHN3aXRjaCAoRU1fSE9TVCkgewo+ICAgY2FzZSBFTV9BQVJDSDY0Ogo+ICAgICAgIGt2bV9z
dGF0X2FyY2hfaW5pdCgma3ZtX3N0YXRfYWFyY2g2NCk7Cj4gICAgICAgYnJlYWs7Cj4gICAuLi4K
PiAgIH0KPgo+IEFmdGVyd2FyZHMsIGl0IGlzIG5vIG5lZWQgdG8gY2hlY2sgRU1fSE9TVCBhbnlt
b3JlLCBpdCBjYW4gc2ltcGx5Cj4gaW52b2tlIHRoZSBhcmNoJ3MgY2FsbGJhY2s6Cj4KPiAgIGlu
dCBjcHVfaXNhX2luaXQoc3RydWN0IHBlcmZfa3ZtX3N0YXQgKmt2bSwgY29uc3QgY2hhciAqY3B1
aWQpCj4gICB7Cj4gICAgICAgaWYgKCFhcmNoX2t2bV9zdGF0IHx8ICFhcmNoX2t2bV9zdGF0LT5j
cHVfaXNhX2luaXQpCj4gICAgICAgICAgIHJldHVybiAtMTsKPgo+ICAgICAgIHJldHVybiBhcmNo
X2t2bV9zdGF0LT5jcHVfaXNhX2luaXQoa3ZtLCBjcHVpZCk7Cj4gICB9Cj4KPiBBcyBhIHJlc3Vs
dCwgd2UgY2FuIGF2b2lkIHNwcmVhZGluZyAic3dpdGNoIChFTV9IT1NUKSIgZXZlcnl3aGVyZS4K
ClNvIHRoZSB1c2Ugb2Ygc3dpdGNoKEVNX0hPU1QpIGlzIHRvIGp1c3Qgc2hvdyB0aGUgZXF1aXZh
bGVuY2UgYmV0d2Vlbgp0aGUgYmVmb3JlIGFuZCBhZnRlciBjb2RlLiBUaGUgRU1fSE9TVCBoYXMg
YmVjb21lIGFuIGVfbWFjaGluZSByZWFkCmZyb20gdGhlIHNlc3Npb24vZW52IGJ5IHRoZSBlbmQg
b2YgdGhlIHNlcmllcy4gSSBhZ3JlZSB0aGVyZSBpcyBuYW1pbmcKY2xlYW4gdXAsIGV0Yy4gdGhh
dCBjYW4gYmUgZG9uZSB0byB0aGUga3ZtX3N0YXQgY29kZSBidXQgSSBqdXN0IHdhbnRlZAp0byBm
b2N1cyB0aGUgc2VyaWVzIG9uIHRoZSByZW1vdmFsIG9mIHRoZSBhcmNoIGRpcmVjdG9yeSBieSB3
YXkgb2YKc3dpdGNoaW5nIHRvIHVzaW5nIHRoZSBlX21hY2hpbmUgdmFsdWUuCgpUaGFua3MsCklh
bgoKPiBUaGFua3MsCj4gTGVvCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
