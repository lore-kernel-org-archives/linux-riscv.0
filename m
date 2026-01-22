Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9A3D6CFA2
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 19:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gOrCRaJnsTssj1k7Qs0/V+EkIXxTUCmLf7uR46/5Ilg=; b=bC4qZ7wmORK1GV
	Q2qfgxYU94cbRpP93KjldUvYlMmdMnggcKExFLNqn4QzJQT5n0DsNNGBAkNvUjicJUzW3WtlZlw8N
	oGGDrHwQUuOpLEe/q01xrr76WL9mOytBXGiNUURIxgJ5n6JiHoowFCD86waymGbRFRnoT1Sfs48lV
	oraqvQzHSpHVDQMtBj9Cc9E5ZtXbqaRcTVT5s5N/CRZB6SjH9ZdTz3+xQEkF2MKI1nZJkLOvmbeHt
	ZTslR756ZJGu/Aaj73wcX1Sy74Sr2xUXENEjtcvNSNZcWYscTbCR3Mz3jkkKDzSLu608rgopeEMtj
	ZZj0BYJbksdqLX6aNfTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj0EB-00000007glv-1v4c;
	Thu, 22 Jan 2026 19:20:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj0EA-00000007glX-2HNP
	for linux-riscv@bombadil.infradead.org;
	Thu, 22 Jan 2026 19:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6Od+DPMtD5to2A0BufNITjmJhKQ0ptW5p2YHxn8s3B8=; b=CD6lYF5fVE/+6VdC4K5FQVOZyn
	SkWWrSLOH1u7oO+YWhcsEmknnfgpT/sH2onc9OBZoAbTIrQxfoVwSZrYNH7WFCjRO4Fpy7U0CUrsf
	5gddbHzGy1iWzUN/25x1s5lyrfJhVJwT27WqLlYLIECJGdYpKZOoEE6ybj2aX8WC5mSoXoRFwMwpQ
	+yA6Faamu6aK+uk8j/vjhStFNRoV3tC/EFr0D7tFs2ULSQk1FFd8ZaMRu3gFoMwUvhgnq0JurFX0S
	xVpqvUaldObEYNG3nHeXnXccNeIh7XHU8fUfXAYuNKQ3VRtESo8roXHi2g7Ni9MCA0HS1F861I19V
	Tsu0H7gQ==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj0E6-0000000196v-236R
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 19:20:21 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a76b39587aso10785ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 11:20:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769109616; cv=none;
        d=google.com; s=arc-20240605;
        b=iWBNPj+roXCw56Sfe1kmZhNrVkUI+tG/dl+ocODWsYOqzWn8dpZRcp4ZKiluPvqQSn
         9ea1zR560G0WAZlUxVxzsqPBG4iDuQLOc0PCBKD8pqz3luKWt9WDIpIYJgpDc3LVZYXw
         90W13CD7v258HxMj126+T/mQmaoA8IvbdOuAtG9govWBwoS6hiPHpGrp/4J/6MiGkmhT
         hAIWXNrkZXtVFLRDR1zc+cURJdBi+/QkXzVDr4mZq8RxZ8hddcnxjfZwWCP3Gb30Jajl
         dkJcdTLDLlYLSwNn7dzQXZwErF6+lmzjOTKudJCUVuS0Vv8lVnfZ3go5mIyUkO2zdbt1
         5XNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Od+DPMtD5to2A0BufNITjmJhKQ0ptW5p2YHxn8s3B8=;
        fh=09rTOCU/3r097A7h6lU7PdxWr174rf1oEZa9NN9hIaw=;
        b=DbI46d0SL9yeZE59R0ITLf3C+S9ygCBJf7oNN3qitWQMfHR4R9uZstejyiHWzmpv9n
         6DBI0fq2yCSDetEtJd914uzUA0YzGULyxVXjpoKL+sg2LhrHMTjIYjZ9dmRr8nqVkM0i
         Sn53WDvZfATkK4Wua3LUcfn9l0NkWC7EN899E24XnlBkqVgyYJVBR5Qap0E+5N8Fq9Fh
         MmlM0fwbVivBlFaW9CDDqm/+h0uRk4ga9gv2cUJb3Jz/CBAeCwTd4xXneE+TIdMRb/rI
         Td1k577x+4KlLiyB1j/KkVMpXXd1MxUh8sodM1KEDEeeHL7ov7QpX2s+rwsNx4ILa8cE
         cqGA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769109616; x=1769714416; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Od+DPMtD5to2A0BufNITjmJhKQ0ptW5p2YHxn8s3B8=;
        b=C61WpgBFSAwo1YVCMWqDA44vhT7rfG14JHKEfP06sQ7F9OWo2H9sdYsqU1pSxjFWix
         KnXnhXxi4ESyqjVl52PIREO0XCtWWer/rM2pvlBk1Q2vmhELlDqoOvA5SPIsfF/r7z1/
         uPzL0naGfrkDi3hciALpALg7JGGOtGfCJeEPTP7PT/gQVDK1mqUPF1OrqXyhPRTcFctf
         Xwzm17MyfDUcUqa1proD+OWDm7ve5M2q5Xm8YY1yam9hWgwj0r3pB2GYpCuCtXe6uDgE
         x8d/ZCpg6P9fPAQYSQ4OKKAXWRfJR3FDGUgYWxEetqXYwH4VZX2d4P7J0635ILbMvAtm
         zrvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769109616; x=1769714416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Od+DPMtD5to2A0BufNITjmJhKQ0ptW5p2YHxn8s3B8=;
        b=uTlZznFjSTFZ56r6mGOrlf1lqOT3ZSWlkTRit0g/6e4TrXr52wmbfUXaQmyeBJf8wA
         rCdaCONCoxa6BhTgt0UPkLXGLMh8JUFxgDBt6grB+i6e+FnWeF0Nhb5BxX7ydbyXht40
         VsBA4lrBD05EXhi2pPT8gqrvLVjB78fjKeQlmvqUNUFCDeAr4lnIuIyDOgmC4MSfz8WU
         SxBoMPXkneTtY+y+wBouwGwP4SeTBvu+BXEkjnGzbtpbVYql4Em1cn3ekSswHR/sQZrB
         0XuynHB1K7+ulXufqbYHgm8tXqzh50kVKEP64FTaZNF52lU6WQ9991hBoz4P5GBqckMD
         tB1A==
X-Forwarded-Encrypted: i=1; AJvYcCVyuo7qcV4n34vpp4dpj4oht0I92XGPda5ZgXkJL8feuU9V4aZf7PiH7WbzEcb66gWT+18uLoe0Oh7Lpg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxW5BvSrDtdAMonlI5hlqtBoYcbGrqjB6JxMTzNWVra/0WqTSvI
	Rw5sWO17GRiS96TRl8paNHw6TETQJtBo7uQx2osWkLDEAl5nuF484+qKb4b8IOmVyQHOA71W7oI
	tm2w44pynAGLQzMzDsv5DO1OJBlrwCxMwXicML9LG
X-Gm-Gg: AZuq6aKbDjnAPZ/AzDbAU8jgljwm+zzsY2GqsFmIizcuanOiAjRrnB6UfkY1vwy+Jk3
	YFhEzi17Cu/1+Cl+uAB9TqlwVWIdJohkT9wQRqjLPLipavcKTA/ea/KRmlMqeOw6ExebkSsLR0F
	BMXvYeSrN+T+BoiofK9K+7juhEu8IEhXaDJhJjta0p6Pm7jcNLXjSzGJifiMYRXg+9rq3anv3pU
	txA3mdv02sCS84Dmrj92fVYaLUftfG6azCxmSrfcQ7YHm/wUK+DDo3z5FXH+fGIxaC0RbD/NgQ7
	jgbVzb4YwMJdplRB3jIZ3I+BdA==
X-Received: by 2002:a17:903:28c:b0:298:45b1:6ef4 with SMTP id
 d9443c01a7336-2a8024db5cdmr326815ad.12.1769109615868; Thu, 22 Jan 2026
 11:20:15 -0800 (PST)
MIME-Version: 1.0
References: <20260122165407.561888-1-irogers@google.com> <20260122165407.561888-12-irogers@google.com>
 <CAO9wTFjA8_YH+_VW4YHze3dUu-HisA-m_GzfpeS_L=ya7FC9uA@mail.gmail.com>
In-Reply-To: <CAO9wTFjA8_YH+_VW4YHze3dUu-HisA-m_GzfpeS_L=ya7FC9uA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 22 Jan 2026 11:20:04 -0800
X-Gm-Features: AZwV_QhOWCsKoUPsWSGYxkhbT75uIENmhM4kJsBNx_hb2S0JYW2XYOxu90HvPh0
Message-ID: <CAP-5=fVS90cUNXbs2BD-_cEBb9c=1+UN1BvGF1kvtDKy-=O0ZA@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] perf disasm: Refactor arch__find and
 initialization of arch structs
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Zecheng Li <zecheng@google.com>, Tianyou Li <tianyou.li@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Howard Chu <howardchu95@gmail.com>, 
	=?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Shimin Guo <shimin.guo@skydio.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_192018_621540_531EDAAE 
X-CRM114-Status: GOOD (  20.98  )
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

T24gVGh1LCBKYW4gMjIsIDIwMjYgYXQgMTA6NDXigK9BTSBTdWNoaXQgS2FydW5ha2FyYW4KPHN1
Y2hpdGthcnVuYWthcmFuQGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gVGh1LCAyMiBKYW4gMjAyNiBh
dCAyMjoyNCwgSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPiB3cm90ZToKW3NuaXBdCj4g
PiAtLS0gYS90b29scy9wZXJmL3V0aWwvYW5ub3RhdGUtYXJjaC9hbm5vdGF0ZS1hcm02NC5jCj4g
PiArKysgYi90b29scy9wZXJmL3V0aWwvYW5ub3RhdGUtYXJjaC9hbm5vdGF0ZS1hcm02NC5jCj4g
PiBAQCAtOCw5ICs4LDEwIEBACj4gPiAgI2luY2x1ZGUgIi4uL2Fubm90YXRlLmgiCj4gPiAgI2lu
Y2x1ZGUgIi4uL2Rpc2FzbS5oIgo+ID4KPiA+IC1zdHJ1Y3QgYXJtNjRfYW5ub3RhdGUgewo+ID4g
LSAgICAgICByZWdleF90IGNhbGxfaW5zbiwKPiA+IC0gICAgICAgICAgICAgICBqdW1wX2luc247
Cj4gPiArc3RydWN0IGFyY2hfYXJtNjQgewo+ID4gKyAgICAgICBzdHJ1Y3QgYXJjaCBhcmNoOwo+
ID4gKyAgICAgICByZWdleF90IGNhbGxfaW5zbjsKPiA+ICsgICAgICAgcmVnZXhfdCBqdW1wX2lu
c247Cj4gPiAgfTsKPiA+Cj4gPiAgc3RhdGljIGludCBhcm02NF9tb3ZfX3BhcnNlKGNvbnN0IHN0
cnVjdCBhcmNoICphcmNoIF9fbWF5YmVfdW51c2VkLAo+ID4gQEAgLTcwLDcgKzcxLDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBpbnNfb3BzIGFybTY0X21vdl9vcHMgPSB7Cj4gPgo+ID4gIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgaW5zX29wcyAqYXJtNjRfX2Fzc29jaWF0ZV9pbnN0cnVjdGlvbl9vcHMo
c3RydWN0IGFyY2ggKmFyY2gsIGNvbnN0IGNoYXIgKm5hbWUpCj4gPiAgewo+ID4gLSAgICAgICBz
dHJ1Y3QgYXJtNjRfYW5ub3RhdGUgKmFybSA9IGFyY2gtPnByaXY7Cj4gPiArICAgICAgIHN0cnVj
dCBhcmNoX2FybTY0ICphcm0gPSBjb250YWluZXJfb2YoYXJjaCwgc3RydWN0IGFyY2hfYXJtNjQs
IGFyY2gpOwo+ID4gICAgICAgICBjb25zdCBzdHJ1Y3QgaW5zX29wcyAqb3BzOwo+ID4gICAgICAg
ICByZWdtYXRjaF90IG1hdGNoWzJdOwo+ID4KPiA+IEBAIC04NywzOCArODgsNDQgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBpbnNfb3BzICphcm02NF9fYXNzb2NpYXRlX2luc3RydWN0aW9uX29wcyhz
dHJ1Y3QgYXJjaCAqYXJjaCwKPiA+ICAgICAgICAgcmV0dXJuIG9wczsKPiA+ICB9Cj4gPgo+ID4g
LWludCBhcm02NF9fYW5ub3RhdGVfaW5pdChzdHJ1Y3QgYXJjaCAqYXJjaCwgY2hhciAqY3B1aWQg
X19tYXliZV91bnVzZWQpCj4gPiArY29uc3Qgc3RydWN0IGFyY2ggKmFyY2hfX25ld19hcm02NChj
b25zdCBzdHJ1Y3QgZV9tYWNoaW5lX2FuZF9lX2ZsYWdzICppZCwKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqY3B1aWQgX19tYXliZV91bnVzZWQpCj4g
PiAgewo+ID4gLSAgICAgICBzdHJ1Y3QgYXJtNjRfYW5ub3RhdGUgKmFybTsKPiA+ICAgICAgICAg
aW50IGVycjsKPiA+ICsgICAgICAgc3RydWN0IGFyY2hfYXJtNjQgKmFybSA9IHphbGxvYyhzaXpl
b2YoKmFybSkpOwo+ID4gKyAgICAgICBzdHJ1Y3QgYXJjaCAqYXJjaDsKPiA+Cj4gPiAtICAgICAg
IGlmIChhcmNoLT5pbml0aWFsaXplZCkKPiA+IC0gICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+
ICsgICAgICAgaWYgKCFhcm0pCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gPiAr
Cj4gPiArICAgICAgIGFyY2ggPSAmYXJtLT5hcmNoOwo+ID4gKyAgICAgICBhcmNoLT5uYW1lID0g
ImFybTY0IjsKPiA+ICsgICAgICAgYXJjaC0+aWQgPSAqaWQ7Cj4gPiArICAgICAgIGFyY2gtPm9i
amR1bXAuY29tbWVudF9jaGFyICAgICAgICA9ICcvJzsKPiA+ICsgICAgICAgYXJjaC0+b2JqZHVt
cC5za2lwX2Z1bmN0aW9uc19jaGFyID0gJysnOwo+ID4gKyAgICAgICBhcmNoLT5hc3NvY2lhdGVf
aW5zdHJ1Y3Rpb25fb3BzICAgPSBhcm02NF9fYXNzb2NpYXRlX2luc3RydWN0aW9uX29wczsKPiA+
Cj4gPiAgICAgICAgIGFybSA9IHphbGxvYyhzaXplb2YoKmFybSkpOwo+ID4gICAgICAgICBpZiAo
IWFybSkKPiA+IC0gICAgICAgICAgICAgICByZXR1cm4gRU5PTUVNOwo+ID4gKyAgICAgICAgICAg
ICAgIHJldHVybiBOVUxMOwo+Cj4gUGxlYXNlIGNvcnJlY3QgbWUgaWYgSSdtIHdyb25nLCBidXQg
SSB0aGluayB0aGVyZSdzIGRvdWJsZSBhbGxvY2F0aW9uCj4gaGVyZSBmb3IgdGhlIHZhcmlhYmxl
IGFybSBzaW5jZSB3ZSd2ZSBhbHJlYWR5IGFsbG9jYXRlZCBtZW1vcnkgZm9yIGF0Cj4gdGhlIHN0
YXJ0IG9mIHRoZSBmdW5jdGlvbi4KClllcywgSSB3aWxsIGZpeCBpdCBpbiB2My4gQ2xlYXJseSBJ
IHdhcyB3b3JraW5nIHRvbyBsYXRlIDotKQoKPiA+Cj4gPiAgICAgICAgIC8qIGJsLCBibHIgKi8K
PiA+ICAgICAgICAgZXJyID0gcmVnY29tcCgmYXJtLT5jYWxsX2luc24sICJeYmxyPyQiLCBSRUdf
RVhURU5ERUQpOwo+ID4gICAgICAgICBpZiAoZXJyKQo+ID4gICAgICAgICAgICAgICAgIGdvdG8g
b3V0X2ZyZWVfYXJtOwo+ID4gKwo+ID4gICAgICAgICAvKiBiLCBiLmNvbmQsIGJyLCBjYnovY2Ju
eiwgdGJ6L3RibnogKi8KPiA+ICAgICAgICAgZXJyID0gcmVnY29tcCgmYXJtLT5qdW1wX2luc24s
ICJeW2N0XT9icj9cXC4/KGNjfGNzfGVxfGdlfGd0fGhpfGhzfGxlfGxvfGxzfGx0fG1pfG5lfHBs
fHZjfHZzKT9uP3o/JCIsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgUkVHX0VYVEVOREVEKTsK
PiA+ICAgICAgICAgaWYgKGVycikKPiA+ICAgICAgICAgICAgICAgICBnb3RvIG91dF9mcmVlX2Nh
bGw7Cj4gPgo+ID4gLSAgICAgICBhcmNoLT5pbml0aWFsaXplZCA9IHRydWU7Cj4gPiAtICAgICAg
IGFyY2gtPnByaXYgICAgICAgID0gYXJtOwo+ID4gLSAgICAgICBhcmNoLT5hc3NvY2lhdGVfaW5z
dHJ1Y3Rpb25fb3BzICAgPSBhcm02NF9fYXNzb2NpYXRlX2luc3RydWN0aW9uX29wczsKPiA+IC0g
ICAgICAgYXJjaC0+b2JqZHVtcC5jb21tZW50X2NoYXIgICAgICAgID0gJy8nOwo+ID4gLSAgICAg
ICBhcmNoLT5vYmpkdW1wLnNraXBfZnVuY3Rpb25zX2NoYXIgPSAnKyc7Cj4gPiAtICAgICAgIHJl
dHVybiAwOwo+ID4gKyAgICAgICByZXR1cm4gYXJjaDsKPiA+Cj4gPiAgb3V0X2ZyZWVfY2FsbDoK
PiA+ICAgICAgICAgcmVnZnJlZSgmYXJtLT5jYWxsX2luc24pOwo+ID4gIG91dF9mcmVlX2FybToK
PiA+ICAgICAgICAgZnJlZShhcm0pOwo+ID4gLSAgICAgICByZXR1cm4gU1lNQk9MX0FOTk9UQVRF
X0VSUk5PX19BUkNIX0lOSVRfUkVHRVhQOwo+ID4gKyAgICAgICBlcnJubyA9IFNZTUJPTF9BTk5P
VEFURV9FUlJOT19fQVJDSF9JTklUX1JFR0VYUDsKPiA+ICsgICAgICAgcmV0dXJuIE5VTEw7Cj4g
PiAgfQpbc25pcF0KPiA+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL3V0aWwvYW5ub3RhdGUtYXJj
aC9hbm5vdGF0ZS1wb3dlcnBjLmMgYi90b29scy9wZXJmL3V0aWwvYW5ub3RhdGUtYXJjaC9hbm5v
dGF0ZS1wb3dlcnBjLmMKPiA+IGluZGV4IDU5M2MxMzhjODEwNC4uMDA0ZTYxMzdhYTAzIDEwMDY0
NAo+ID4gLS0tIGEvdG9vbHMvcGVyZi91dGlsL2Fubm90YXRlLWFyY2gvYW5ub3RhdGUtcG93ZXJw
Yy5jCj4gPiArKysgYi90b29scy9wZXJmL3V0aWwvYW5ub3RhdGUtYXJjaC9hbm5vdGF0ZS1wb3dl
cnBjLmMKPiA+IEBAIC0zOTAsMTcgKzM5MCwyMSBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfaW5zbl9z
dGF0ZV9wb3dlcnBjKHN0cnVjdCB0eXBlX3N0YXRlICpzdGF0ZSwKPiA+ICB9Cj4gPiAgI2VuZGlm
IC8qIEhBVkVfTElCRFdfU1VQUE9SVCAqLwo+ID4KPiA+IC1pbnQgcG93ZXJwY19fYW5ub3RhdGVf
aW5pdChzdHJ1Y3QgYXJjaCAqYXJjaCwgY2hhciAqY3B1aWQgX19tYXliZV91bnVzZWQpCj4gPiAr
Y29uc3Qgc3RydWN0IGFyY2ggKmFyY2hfX25ld19wb3dlcnBjKGNvbnN0IHN0cnVjdCBlX21hY2hp
bmVfYW5kX2VfZmxhZ3MgKmlkLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IGNoYXIgKmNwdWlkIF9fbWF5YmVfdW51c2VkKQo+ID4gIHsKPiA+IC0gICAgICAg
aWYgKCFhcmNoLT5pbml0aWFsaXplZCkgewo+ID4gLSAgICAgICAgICAgICAgIGFyY2gtPmluaXRp
YWxpemVkID0gdHJ1ZTsKPiA+IC0gICAgICAgICAgICAgICBhcmNoLT5hc3NvY2lhdGVfaW5zdHJ1
Y3Rpb25fb3BzID0gcG93ZXJwY19fYXNzb2NpYXRlX2luc3RydWN0aW9uX29wczsKPiA+IC0gICAg
ICAgICAgICAgICBhcmNoLT5vYmpkdW1wLmNvbW1lbnRfY2hhciAgICAgID0gJyMnOwo+ID4gLSAg
ICAgICAgICAgICAgIGFubm90YXRlX29wdHMuc2hvd19hc21fcmF3ID0gdHJ1ZTsKPiA+ICsgICAg
ICAgc3RydWN0IGFyY2ggKmFyY2ggPSB6YWxsb2Moc2l6ZW9mKCphcmNoKSk7Cj4gPiArCj4gPiAr
ICAgICAgIGlmICghYXJjaCkKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA+ICsK
PiA+ICsgICAgICAgYXJjaC0+bmFtZSA9ICJwb3dlcnBjIjsKPiA+ICsgICAgICAgYXJjaC0+aWQg
PSAqaWQ7Cj4gPiArICAgICAgIGFyY2gtPm9iamR1bXAuY29tbWVudF9jaGFyID0gJyMnOwo+ID4g
KyAgICAgICBhbm5vdGF0ZV9vcHRzLnNob3dfYXNtX3JhdyA9IHRydWU7Cj4gPiArICAgICAgIGFy
Y2gtPmFzc29jaWF0ZV9pbnN0cnVjdGlvbl9vcHMgPSBwb3dlcnBjX19hc3NvY2lhdGVfaW5zdHJ1
Y3Rpb25fb3BzOwo+ID4gICNpZmRlZiBIQVZFX0xJQkRXX1NVUFBPUlQKPiA+IC0gICAgICAgICAg
ICAgICBhcmNoLT51cGRhdGVfaW5zbl9zdGF0ZSA9IHVwZGF0ZV9pbnNuX3N0YXRlX3Bvd2VycGM7
Cj4gPiArICAgICAgIGFyY2gtPnVwZGF0ZV9pbnNuX3N0YXRlID0gdXBkYXRlX2luc25fc3RhdGVf
cG93ZXJwYzsKPiA+ICAjZW5kaWYKPiA+IC0gICAgICAgfQo+ID4gLQo+ID4gICAgICAgICByZXR1
cm4gMDsKPgo+IFNob3VsZG4ndCB3ZSByZXR1cm4gYXJjaCBoZXJlPwoKQWdyZWVkLgoKPiA+ICB9
CltzbmlwXQo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvdXRpbC9hbm5vdGF0ZS1hcmNoL2Fu
bm90YXRlLXNwYXJjLmMgYi90b29scy9wZXJmL3V0aWwvYW5ub3RhdGUtYXJjaC9hbm5vdGF0ZS1z
cGFyYy5jCj4gPiBpbmRleCA2NmEwMTc0Mzc2ZGQuLmZlN2EzNzk2NjI2MSAxMDA2NDQKPiA+IC0t
LSBhL3Rvb2xzL3BlcmYvdXRpbC9hbm5vdGF0ZS1hcmNoL2Fubm90YXRlLXNwYXJjLmMKPiA+ICsr
KyBiL3Rvb2xzL3BlcmYvdXRpbC9hbm5vdGF0ZS1hcmNoL2Fubm90YXRlLXNwYXJjLmMKPiA+IEBA
IC0xLDYgKzEsNyBAQAo+ID4gIC8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4g
PiAgI2luY2x1ZGUgPHN0cmluZy5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9jb21waWxlci5oPgo+
ID4gKyNpbmNsdWRlIDxsaW51eC96YWxsb2MuaD4KPiA+ICAjaW5jbHVkZSAiLi4vLi4vdXRpbC9k
aXNhc20uaCIKPiA+Cj4gPiAgc3RhdGljIGludCBpc19icmFuY2hfY29uZChjb25zdCBjaGFyICpj
b25kKQo+ID4gQEAgLTE2MCwxMyArMTYxLDE3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW5zX29w
cyAqc3BhcmNfX2Fzc29jaWF0ZV9pbnN0cnVjdGlvbl9vcHMoc3RydWN0IGFyY2ggKmFyY2gsCj4g
PiAgICAgICAgIHJldHVybiBvcHM7Cj4gPiAgfQo+ID4KPiA+IC1pbnQgc3BhcmNfX2Fubm90YXRl
X2luaXQoc3RydWN0IGFyY2ggKmFyY2gsIGNoYXIgKmNwdWlkIF9fbWF5YmVfdW51c2VkKQo+ID4g
K2NvbnN0IHN0cnVjdCBhcmNoICphcmNoX19uZXdfc3BhcmMoY29uc3Qgc3RydWN0IGVfbWFjaGlu
ZV9hbmRfZV9mbGFncyAqaWQsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnN0IGNoYXIgKmNwdWlkIF9fbWF5YmVfdW51c2VkKQo+ID4gIHsKPiA+IC0gICAgICAgaWYg
KCFhcmNoLT5pbml0aWFsaXplZCkgewo+ID4gLSAgICAgICAgICAgICAgIGFyY2gtPmluaXRpYWxp
emVkID0gdHJ1ZTsKPiA+IC0gICAgICAgICAgICAgICBhcmNoLT5hc3NvY2lhdGVfaW5zdHJ1Y3Rp
b25fb3BzID0gc3BhcmNfX2Fzc29jaWF0ZV9pbnN0cnVjdGlvbl9vcHM7Cj4gPiAtICAgICAgICAg
ICAgICAgYXJjaC0+b2JqZHVtcC5jb21tZW50X2NoYXIgPSAnIyc7Cj4gPiAtICAgICAgIH0KPiA+
ICsgICAgICAgc3RydWN0IGFyY2ggKmFyY2ggPSB6YWxsb2Moc2l6ZW9mKCphcmNoKSk7Cj4gPiAr
Cj4gPiArICAgICAgIGlmICghYXJjaCkKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsK
PiA+Cj4gPiArICAgICAgIGFyY2gtPm5hbWUgPSAic3BhcmMiOwo+ID4gKyAgICAgICBhcmNoLT5p
ZCA9ICppZDsKPiA+ICsgICAgICAgYXJjaC0+YXNzb2NpYXRlX2luc3RydWN0aW9uX29wcyA9IHNw
YXJjX19hc3NvY2lhdGVfaW5zdHJ1Y3Rpb25fb3BzOwo+ID4gKyAgICAgICBhcmNoLT5vYmpkdW1w
LmNvbW1lbnRfY2hhciA9ICcjJzsKPiA+ICAgICAgICAgcmV0dXJuIDA7Cj4KPiBTYW1lIGhlcmUg
YXMgd2VsbCwgMCBpcyByZXR1cm5lZCBpbnN0ZWFkIG9mIHRoZSBhcmNoIHBvaW50ZXIuCgpBZ3Jl
ZWQuCgpUaGFua3MsCklhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
