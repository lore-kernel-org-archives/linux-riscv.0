Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C80C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 09:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tqAKvhQk39SWEKewjlp5i3WjtHAmTw3/BztiyujsBtw=; b=Pz49WYAxRxba/8
	Dze1Nr/PkpLSRILhJE7Z7hhxtHtIHoI39RspiK+A9qWtp5zz87lA+imlXlnbKE224lJkSmJySAfWn
	omDEScNgc7H2wd8DZ7gFIl/mcAgdeninDZBjRsJTs8RPoYvJXC2NTH9Fsf/glxVqNTpvP1p1Jptai
	KQRJGd8tORwQsDAhGlJEdiBX+2L+8Vfe+hVzRGcKSAEWtPREdpT0OVHvGtW9jM4LQLF6W2mU6yaK0
	F/4FePXHI1vrJKNKpyfxRGJqaxX2upGNKTLWPm+HkS/ZaPDFrdgsQozrSqPHADMtfuziMj5pQ8Rut
	e11KkYfeYu2rXBWtrVfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp40r-004iiO-1E;
	Wed, 19 Apr 2023 09:22:05 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp40n-004igw-0y
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 09:22:03 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-2f40b891420so3097549f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 02:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681896116; x=1684488116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAmu28kxLfR9NTfen8lHbOqBR0jDTxdhWjN1lCSkxww=;
        b=qWvcZD73Z6cOha96J3xLud8w5LQTe6iScTpVZFAPXvGLo0CnNN2dehEAXwaBIO3eok
         XIc6PcDg9XXobUFHr9efZeKcYdlrg8srbqjND0jGsJlJAZ4dTtcIVFXTFuhz7AIBQvEg
         ZZVGkOudvVLfFTdXxb2Jd9XiDTdVZ5nVIteGKUuUYdpCgCNj8LS8NISEpRcnoW47g8Kr
         QCLnR0ufv7AaHwPv8mIHoKK8U+FeW68U43gohfAdwa905Q+NgPfEUn9v8z4Rpoc2GeZl
         VY8USDNsGy2k+wd7tEhTYxE08TvDrwrrIXfwlmNRDIG8cp5hWe1J/AaFMuAToObpTndD
         b6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681896116; x=1684488116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAmu28kxLfR9NTfen8lHbOqBR0jDTxdhWjN1lCSkxww=;
        b=jmAOeWKFdimUZXLfxzgO6pBNITveVF9n9wEW9T3V+KQORcHImjYgSXNFZ74VmNl3kD
         MJHSdnvs7Ar5TKF+Bl+dQvCeLI80LbIW/BQghqDT36BWo9St0sFqVjUIsmfh2md2q7PL
         OVCrEjs1XiM7Bhxx3bEzn7CAywjjlM3DKnWXMoKNCgjTNALPtSHwFJpKidt2QRdBmQE8
         oJiS9evsT8JAU35suv0SFd2ouqhXqUsy6Gf44jmt+GecjDsh48JzTpGlVxzpFv/AwBEC
         04rsHts7A7OUNxloFlecwnrVBVy8sxIXwEoYuEghKhao3m7ySz9kiTyXw6O9TWE9H0zP
         n0+g==
X-Gm-Message-State: AAQBX9c5HikXGRG0LyFMoeg+zf1YFSIdgmm0Jg7sX/qRFb+BUOkZ6sVe
	xOA15l9bZvMrGwgMN0BRDdy0lBOZ4Jl2Ld98I4dLzQ==
X-Google-Smtp-Source: AKy350b9MkaNChMF/AjQaCfRI1fZFovklEGmb+podkO111Slr+0lmRQslEdedi7oC6DvmLa1dCn56Gj7l/AUZ4rU7zQ=
X-Received: by 2002:a5d:4811:0:b0:2f8:2d4:74ef with SMTP id
 l17-20020a5d4811000000b002f802d474efmr4221973wrq.43.1681896116610; Wed, 19
 Apr 2023 02:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230413161725.195417-1-alexghiti@rivosinc.com>
 <CAOnJCU+72PV1=o1c_TpogkmBT36278BneVWEMr1=tqX0CZi+ag@mail.gmail.com>
 <aadca595b4a24e36932ba41e61f4e263@AcuMS.aculab.com> <CAOnJCUJ7mY+fh9VqE4dRntnVAEAc26=NnOCPUqkXk6ky__cUZQ@mail.gmail.com>
 <CAP-5=fUYJEecmhQVuvbM4ZoDP_Hj=2RKOgR4cKepU072Uy3xyw@mail.gmail.com> <CAOnJCULJfSN79MzAwhCrbVzG1rYyrPB3OraFmoZFBxuRCwq01w@mail.gmail.com>
In-Reply-To: <CAOnJCULJfSN79MzAwhCrbVzG1rYyrPB3OraFmoZFBxuRCwq01w@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 19 Apr 2023 11:21:45 +0200
Message-ID: <CAHVXubjhORBEDok_Zhq5p_Yv4Ty4Hct84dWJZXzo48+40N=CGg@mail.gmail.com>
Subject: Re: [PATCH 0/4] riscv: Allow userspace to directly access perf counters
To: Atish Patra <atishp@atishpatra.org>
Cc: Ian Rogers <irogers@google.com>, David Laight <David.Laight@aculab.com>, 
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
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, paranlee <p4ranlee@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_022201_550636_347EE498 
X-CRM114-Status: GOOD (  43.32  )
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

SGkgSWFuLAoKT24gVHVlLCBBcHIgMTgsIDIwMjMgYXQgMTA6MzDigK9QTSBBdGlzaCBQYXRyYSA8
YXRpc2hwQGF0aXNocGF0cmEub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXByIDE4LCAyMDIzIGF0
IDExOjQ24oCvUE0gSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPiB3cm90ZToKPiA+Cj4g
PiBPbiBUdWUsIEFwciAxOCwgMjAyMyBhdCA5OjQz4oCvQU0gQXRpc2ggUGF0cmEgPGF0aXNocEBh
dGlzaHBhdHJhLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIEZyaSwgQXByIDE0LCAyMDIzIGF0
IDI6NDDigK9BTSBEYXZpZCBMYWlnaHQgPERhdmlkLkxhaWdodEBhY3VsYWIuY29tPiB3cm90ZToK
PiA+ID4gPgo+ID4gPiA+IEZyb206IEF0aXNoIFBhdHJhCj4gPiA+ID4gPiBTZW50OiAxMyBBcHJp
bCAyMDIzIDIwOjE4Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gVGh1LCBBcHIgMTMsIDIwMjMgYXQg
OTo0N+KAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6
Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IHJpc2N2IHVzZWQgdG8gYWxsb3cgZGlyZWN0IGFjY2Vz
cyB0byBjeWNsZS90aW1lL2luc3RyZXQgY291bnRlcnMsCj4gPiA+ID4gPiA+IGJ5cGFzc2luZyB0
aGUgcGVyZiBmcmFtZXdvcmssIHRoaXMgcGF0Y2hzZXQgaW50ZW5kcyB0byBhbGxvdyB0aGUgdXNl
ciB0bwo+ID4gPiA+ID4gPiBtbWFwIGFueSBjb3VudGVyIHdoZW4gYWNjZXNzZWQgdGhyb3VnaCBw
ZXJmLiBCdXQgd2UgY2FuJ3QgYnJlYWsgdGhlCj4gPiA+ID4gPiA+IGV4aXN0aW5nIGJlaGF2aW91
ciBzbyB3ZSBpbnRyb2R1Y2UgYSBzeXNjdGwgcGVyZl91c2VyX2FjY2VzcyBsaWtlIGFybTY0Cj4g
PiA+ID4gPiA+IGRvZXMsIHdoaWNoIGRlZmF1bHRzIHRvIHRoZSBsZWdhY3kgbW9kZSBkZXNjcmli
ZWQgYWJvdmUuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSXQgd291bGQgYmUgZ29v
ZCBwcm92aWRlIGFkZGl0aW9uYWwgZGlyZWN0aW9uIGZvciB1c2VyIHNwYWNlIHBhY2thZ2VzOgo+
ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSBsZWdhY3kgYmVoYXZpb3IgaXMgc3VwcG9ydGVkIGZvciBu
b3cgaW4gb3JkZXIgdG8gYXZvaWQgYnJlYWtpbmcKPiA+ID4gPiA+IGV4aXN0aW5nIHNvZnR3YXJl
Lgo+ID4gPiA+ID4gSG93ZXZlciwgcmVhZGluZyBjb3VudGVycyBkaXJlY3RseSB3aXRob3V0IHBl
cmYgaW50ZXJhY3Rpb24gbWF5Cj4gPiA+ID4gPiBwcm92aWRlIGluY29ycmVjdCB2YWx1ZXMgd2hp
Y2gKPiA+ID4gPiA+IHRoZSB1c2Vyc3BhY2Ugc29mdHdhcmUgbXVzdCBhdm9pZC4gV2UgYXJlIGhv
cGluZyB0aGF0IHRoZSB1c2VyIHNwYWNlCj4gPiA+ID4gPiBwYWNrYWdlcyB3aGljaAo+ID4gPiA+
ID4gcmVhZCB0aGUgY3ljbGUvaW5zdHJldCBkaXJlY3RseSwgd2lsbCBtb3ZlIHRvIHRoZSBwcm9w
ZXIgaW50ZXJmYWNlCj4gPiA+ID4gPiBldmVudHVhbGx5IGlmIHRoZXkgYWN0dWFsbHkgbmVlZCBp
dC4KPiA+ID4gPiA+IE1vc3Qgb2YgdGhlIHVzZXJzIGFyZSBzdXBwb3NlZCB0byByZWFkICJ0aW1l
IiBpbnN0ZWFkIG9mICJjeWNsZSIgaWYKPiA+ID4gPiA+IHRoZXkgaW50ZW5kIHRvIHJlYWQgdGlt
ZXN0YW1wcy4KPiA+ID4gPgo+ID4gPiA+IElmIHlvdSBhcmUgdHJ5aW5nIHRvIG1lYXN1cmUgdGhl
IHBlcmZvcm1hbmNlIG9mIHNob3J0IGNvZGUKPiA+ID4gPiBmcmFnbWVudHMgdGhlbiB5b3UgbmVl
ZCBwcmV0dHkgbXVjaCByYXcgYWNjZXNzIGRpcmVjdGx5IHRvCj4gPiA+ID4gdGhlIGN5Y2xlL2Ns
b2NrIGNvdW50IHJlZ2lzdGVyLgo+ID4gPiA+Cj4gPiA+ID4gSSd2ZSBkb25lIHRoaXMgb24geDg2
IHRvIGNvbXBhcmUgdGhlIGFjdHVhbCBjeWNsZSB0aW1lcwo+ID4gPiA+IG9mIGRpZmZlcmVudCBp
bXBsZW1lbnRhdGlvbnMgb2YgdGhlIElQIGNoZWNrc3VtIGxvb3AKPiA+ID4gPiAoYW5kIGNvbXBh
cmUgdGhlbSB0byB0aGUgdGhlb3JldGljYWwgbGltaXQpLgo+ID4gPiA+IFRoZSBwZXJmIGZyYW1l
d29yayBqdXN0IGFkZGVkIGZhciB0b28gbXVjaCBsYXRlbmN5LAo+ID4gPiA+IG9ubHkgZGlyZWN0
bHkgcmVhZGluZyB0aGUgY3B1IHJlZ2lzdGVycyBnYXZlIGFueXRoaW5nCj4gPiA+ID4gbGlrZSBy
ZWxpYWJsZSAoYW5kIGNvbnNpc3RlbnQpIGFuc3dlcnMuCj4gPiA+ID4KPiA+ID4KPiA+ID4gVGhp
cyBzZXJpZXMgYWxsb3dzIGRpcmVjdCBhY2Nlc3MgdG8gdGhlIGNvdW50ZXJzIG9uY2UgY29uZmln
dXJlZAo+ID4gPiB0aHJvdWdoIHRoZSBwZXJmLgo+ID4gPiBFYXJsaWVyIHRoZSBjeWNsZS9pbnN0
cmV0IGNvdW50ZXJzIGFyZSBkaXJlY3RseSBleHBvc2VkIHRvIHRoZQo+ID4gPiB1c2Vyc3BhY2Ug
d2l0aG91dCBrZXJuZWwvcGVyZiBmcmFtZXdvcmtpbmcga25vd2luZwo+ID4gPiB3aGVuL3doaWNo
IHVzZXIgc3BhY2UgYXBwbGljYXRpb24gaXMgcmVhZGluZyBpdC4gVGhhdCBoYXMgc2VjdXJpdHkg
aW1wbGljYXRpb25zLgo+ID4gPgo+ID4gPiBXaXRoIHRoaXMgc2VyaWVzIGFwcGxpZWQsIHRoZSB1
c2VyIHNwYWNlIGFwcGxpY2F0aW9uIGp1c3QgbmVlZHMgdG8KPiA+ID4gY29uZmlndXJlIHRoZSBl
dmVudCAoY3ljbGUvaW5zdHJldCkgdGhyb3VnaCBwZXJmIHN5c2NhbGwuCj4gPiA+IE9uY2UgY29u
ZmlndXJlZCwgdGhlIHVzZXJzcGFjZSBhcHBsaWNhdGlvbiBjYW4gZmluZCBvdXQgdGhlIGNvdW50
ZXIKPiA+ID4gaW5mb3JtYXRpb24gZnJvbSB0aGUgbW1hcCAmIGRpcmVjdGx5Cj4gPiA+IHJlYWQg
dGhlIGNvdW50ZXIuIFRoZXJlIGlzIG5vIGxhdGVuY3kgd2hpbGUgcmVhZGluZyB0aGUgY291bnRl
cnMuCj4gPiA+Cj4gPiA+IFRoaXMgbWVjaGFuaXNtIGFsbG93cyBzdG9wL2NsZWFyIHRoZSBjb3Vu
dGVycyB3aGVuIHRoZSByZXF1ZXN0aW5nIHRhc2sKPiA+ID4gaXMgbm90IHJ1bm5pbmcuIEl0IGFs
c28gdGFrZXMgY2FyZSBvZiBjb250ZXh0IHN3aXRjaGluZwo+ID4gPiB3aGljaCBtYXkgcmVzdWx0
IGluIGludmFsaWQgdmFsdWVzIGFzIHlvdSBtZW50aW9uZWQgYmVsb3cuIFRoaXMgaXMKPiA+ID4g
bm90aGluZyBuZXcgYW5kIGFsbCBvdGhlciBhcmNoICh4ODYsIEFSTTY0KSBhbGxvdyB1c2VyIHNw
YWNlCj4gPiA+IGNvdW50ZXIgcmVhZCB0aHJvdWdoIHRoZSBzYW1lIG1lY2hhbmlzbS4KPiA+ID4K
PiA+ID4gSGVyZSBpcyB0aGUgcmVsZXZhbnQgdXBzdHJlYW0gZGlzY3Vzc2lvbjoKPiA+ID4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9ZN3dMYTdJMmhsejNyS3clMkZAaGlyZXoucHJvZ3Jh
bW1pbmcua2lja3MtYXNzLm5ldC9ULwo+ID4gPgo+ID4gPiBBUk02NDoKPiA+ID4gaHR0cHM6Ly9k
b2NzLmtlcm5lbC5vcmcvYXJtNjQvcGVyZi5odG1sP2hpZ2hsaWdodD1wZXJmX3VzZXJfYWNjZXNz
I3BlcmYtdXNlcnNwYWNlLXBtdS1oYXJkd2FyZS1jb3VudGVyLWFjY2Vzcwo+ID4gPgo+ID4gPiBl
eGFtcGxlIHVzYWdlIGluIHg4NjoKPiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL2FuZGlrbGVlbi9w
bXUtdG9vbHMvYmxvYi9tYXN0ZXIvamV2ZW50cy9yZHBtYy5jCj4gPgo+ID4gVGhlIGNhbm9uaWNh
bCBpbXBsZW1lbnRhdGlvbiBvZiB0aGlzIHNob3VsZCBiZToKPiA+IGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL3Rv
b2xzL2xpYi9wZXJmL21tYXAuYyNuNDAwCj4KPiBUaGFua3MgZm9yIHNoYXJpbmcgdGhlIGxpYnBl
cmYgaW1wbGVtZW50YXRpb24uCj4KPiA+IHdoaWNoIGlzIHVwZGF0ZWQgaW4gdGhlc2UgcGF0Y2hl
cyBidXQgdGhlIHRlc3RzIGFyZSBub3Q6Cj4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS90b29scy9wZXJmL3Rl
c3RzL21tYXAtYmFzaWMuYyNuMjg3Cj4gPiBXaGljaCBhcHBlYXJzIHRvIGJlIGFuIG92ZXJzaWdo
dC4gVGhlIHRlc3RzIGRpc3BsYXkgc29tZSBkaWZmZXJlbmNlcwo+Cj4gWWVzLiBJdCdzIGFuIG92
ZXJzaWdodC4gV2Ugc2hvdWxkIG1ha2Ugc3VyZSB0aGF0IHBlcmYgbW1hcCB0ZXN0cyBwYXNzCj4g
Zm9yIFJJU0MtViBhcyB3ZWxsLgoKWWVzLCB0aGF0J3MgYW4gb3ZlcnNpZ2h0LCBJIGhhZCBhIGxv
Y2FsIHRlc3QgYWRhcHRlZCBmcm9tIHRoaXMgb25lIGJ1dApmb3Jnb3QgdG8gdXBkYXRlIGl0IGFm
dGVyd2FyZHMsIEknbGwgZG8gdGhhdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKVGhhbmtzIGZvciB5
b3VyIHF1aWNrIGZlZWRiYWNrcyBhbmQgc29ycnkgZm9yIGJlaW5nIGxhdGUsCgpBbGV4CgoKPgo+
Cj4gPiBiZXR3ZWVuIHg4NiBhbmQgYWFyY2g2NCB0aGF0IGhhdmUgYXNzdW1lZCB1c2Vyc3BhY2Ug
aGFyZHdhcmUgY291bnRlcgo+ID4gYWNjZXNzLCBhbmQgZXZlcnl0aGluZyBlbHNlIHRoYXQgaXQg
aXMgYXNzdW1lZCBkb24ndC4KPiA+Cj4gPiBUaGFua3MsCj4gPiBJYW4KPiA+Cj4gPiA+ID4gQ2xl
YXJseSBwcm9jZXNzIHN3aXRjaGVzIChlc3BlY2lhbGx5IGNwdSBtaWdyYXRpb25zKSBjYXVzZQo+
ID4gPiA+IHByb2JsZW1zLCBidXQgdGhleSBhcmUgb2J2aW91c2x5IGludmFsaWQgdmFsdWVzIGFu
ZCBjYW4KPiA+ID4gPiBiZSBpZ25vcmVkLgo+ID4gPiA+Cj4gPiA+ID4gU28gd2hpbGUgYSBsb3Qg
b2YgdXNlcyBtYXkgYmUgJ2hhcHB5JyB3aXRoIHRoZSB2YWx1ZXMgdGhlCj4gPiA+ID4gcGVyZiBm
cmFtZXdvcmsgZ2l2ZXMsIHNvbWV0aW1lcyB5b3UgZG8gbmVlZCB0byBkaXJlY3RseQo+ID4gPiA+
IHJlYWQgdGhlIHJlbGV2YW50IHJlZ2lzdGVycy4KPiA+ID4gPgo+ID4gPiA+ICAgICAgICAgRGF2
aWQKPiA+ID4gPgo+ID4gPiA+IC0KPiA+ID4gPiBSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUs
IEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsKPiA+
ID4gPiBSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQo+ID4gPgo+ID4gPgo+ID4gPgo+
ID4gPiAtLQo+ID4gPiBSZWdhcmRzLAo+ID4gPiBBdGlzaAo+Cj4KPgo+IC0tCj4gUmVnYXJkcywK
PiBBdGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
