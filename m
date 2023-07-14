Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2718EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 08:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Asxrv+6M9Q1K+QJMJ7fs0ImUnNhniUviL/7Ol0L3TfY=; b=kKXs9GvvV2XQPF
	ZglpIv1RBZIvXlTU1wRhLnCxQqPpmiqt/5zJv2g+VEHQimuxxw2WjyuWm+2l31+GWteiBM0Zh1es4
	3lZSpWREJIwYGq1b7ceqvDcTz3JjoVF0YtEwxlTuj/DE/7Sits++90MqhLYcyvGlrEjW/tpV1RtDg
	d6xyk1JnMyEUx2gZ/OlFHp4V1/1a2lpiuRwrlw2nt79FgoA5zExWS4O6eRIYlKyb6Ngi75NWrDzyW
	W40p+OyzMfc7eVgulj2bde34vfWLCC9fzx90QvkVkw1hS71hw67wZ7KbNNHD54CkRb/kravdtLL40
	dlWnZ9k0P53IsBoma8cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKEWD-005aDC-2Z;
	Fri, 14 Jul 2023 08:51:17 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKEWB-005aBU-0S
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 08:51:16 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b6fbf0c0e2so24884171fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 01:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1689324671; x=1691916671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVJFUGPgUiZjejGogHmLzYwwKGbHbhdGEjYSUHSjBfo=;
        b=pYAcX4FPQitZnsDIm6cTcKdm1Ztraq4W2bv6eu94SIYUTBpXculUzJiLK05nDzIZQY
         X+ajUMzJ4+s3GZVMczZKydx+tBqLXWPIIcNeeaSKxDbOIpV+juiQrp9N9A7oMFbOy0ej
         Bev1FExTBu9b0hpfG/pxEJkztwcOKTfi7ojBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689324671; x=1691916671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVJFUGPgUiZjejGogHmLzYwwKGbHbhdGEjYSUHSjBfo=;
        b=IhfLkHFXp1lDU326dVGbRMNN+BWFDg79Sgkgnj/d4/Bhk1GUxjNZNBCu84gYwzlYzx
         8SwjR+TquDduFxlBO4FQtn+MjN/R+ghY3SUzllwEXikydpZQVmLeRIX76hEmA0IuTTsg
         qpzMttbGTQBXc4rhQBr5VgIPq1uTRIgOTLSxfxP/OpOEExQxe+sYHKASf4Wppe48Ik6y
         DgO+6EQDAfOFG11e3flIYZyRRD5rPdtfb1PNhAHADltrqXchd5818GVDtimRnjwqvjZm
         JyxIBP2RbEScbycKplPUVUisLClLxfFmRZxbOBRDCIsTjKclRz20FJi4LMIoYZDjmS5B
         Qi+w==
X-Gm-Message-State: ABy/qLa9RxutDtiToS1iXxYKf+frUZF08cZElXOdK4pD8Bh8DwSuU7sx
	+qLOzAdhexxAD+vUk+08YhwjOdJXeCrFw+HlE46b
X-Google-Smtp-Source: APBJJlHjR6JsuaMQbXZar+lmwIZWlDiqDI6I9i3Y4OuSMcqQfvuZ6VyIJunOF1Ue2HAQ0kQfJSL6fyyKFEWspQicjTo=
X-Received: by 2002:a2e:8611:0:b0:2b6:ee1c:216a with SMTP id
 a17-20020a2e8611000000b002b6ee1c216amr3436379lji.34.1689324671023; Fri, 14
 Jul 2023 01:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230703124647.215952-1-alexghiti@rivosinc.com> <20230703124647.215952-9-alexghiti@rivosinc.com>
In-Reply-To: <20230703124647.215952-9-alexghiti@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 14 Jul 2023 01:50:59 -0700
Message-ID: <CAOnJCUJGHWicrhGOGPK_aduaD9jXz7THHcbU+i+7tK-ChtQxNg@mail.gmail.com>
Subject: Re: [PATCH v4 08/10] Documentation: admin-guide: Add riscv sysctl_perf_user_access
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_015115_178658_C73C9C5D 
X-CRM114-Status: GOOD (  19.92  )
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

T24gTW9uLCBKdWwgMywgMjAyMyBhdCA1OjU04oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IHJpc2N2IG5vdyB1c2VzIHRoaXMgc3lzY3RsIHNv
IGRvY3VtZW50IGl0cyB1c2FnZSBmb3IgdGhpcyBhcmNoaXRlY3R1cmUuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gLS0tCj4gIERv
Y3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvc3lzY3RsL2tlcm5lbC5yc3QgfCAyNyArKysrKysrKysr
KysrKysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwv
a2VybmVsLnJzdCBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvc3lzY3RsL2tlcm5lbC5yc3QK
PiBpbmRleCBkODVkOTBmNWQwMDAuLjE5YjYyNzg4MzMxMyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2FkbWluLWd1aWRlL3N5c2N0bC9rZXJuZWwucnN0Cj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9hZG1pbi1ndWlkZS9zeXNjdGwva2VybmVsLnJzdAo+IEBAIC05NDEsMTYgKzk0MSwzNSBAQCBl
bmFibGVkLCBvdGhlcndpc2Ugd3JpdGluZyB0byB0aGlzIGZpbGUgd2lsbCByZXR1cm4gYGAtRUJV
U1lgYC4KPiAgVGhlIGRlZmF1bHQgdmFsdWUgaXMgOC4KPgo+Cj4gLXBlcmZfdXNlcl9hY2Nlc3Mg
KGFybTY0IG9ubHkpCj4gLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ICtwZXJm
X3VzZXJfYWNjZXNzIChhcm02NCBhbmQgcmlzY3Ygb25seSkKPiArPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09Cj4gKwo+ICtDb250cm9scyB1c2VyIHNwYWNlIGFjY2VzcyBm
b3IgcmVhZGluZyBwZXJmIGV2ZW50IGNvdW50ZXJzLgo+Cj4gLUNvbnRyb2xzIHVzZXIgc3BhY2Ug
YWNjZXNzIGZvciByZWFkaW5nIHBlcmYgZXZlbnQgY291bnRlcnMuIFdoZW4gc2V0IHRvIDEsCj4g
LXVzZXIgc3BhY2UgY2FuIHJlYWQgcGVyZm9ybWFuY2UgbW9uaXRvciBjb3VudGVyIHJlZ2lzdGVy
cyBkaXJlY3RseS4KPiArYXJtNjQKPiArPT09PT0KPgo+ICBUaGUgZGVmYXVsdCB2YWx1ZSBpcyAw
IChhY2Nlc3MgZGlzYWJsZWQpLgo+Cj4gK1doZW4gc2V0IHRvIDEsIHVzZXIgc3BhY2UgY2FuIHJl
YWQgcGVyZm9ybWFuY2UgbW9uaXRvciBjb3VudGVyIHJlZ2lzdGVycwo+ICtkaXJlY3RseS4KPiAr
CgpGb3IgQVJNNjQsIDEgYWxzbyBlbmFibGVzIHJlYWRpbmcgcGVyZm9ybWFuY2UgY291bnRlcnMg
dmlhIHBlcmYgaW50ZXJmYWNlIG9ubHkuCkkgZG9uJ3QgdGhpbmsgdGhlcmUgaXMgYW55IHdheSB0
byBhY2Nlc3MgdGhlIGNvdW50ZXJzIGRpcmVjdGx5IGluIEFSTTY0LgoKPiAgU2VlIERvY3VtZW50
YXRpb24vYXJtNjQvcGVyZi5yc3QgZm9yIG1vcmUgaW5mb3JtYXRpb24uCj4KPiArcmlzY3YKPiAr
PT09PT0KPiArCj4gK1doZW4gc2V0IHRvIDAsIHVzZXIgc3BhY2UgYWNjZXNzIGlzIGRpc2FibGVk
Lgo+ICsKPiArVGhlIGRlZmF1bHQgdmFsdWUgaXMgMSwgdXNlciBzcGFjZSBjYW4gcmVhZCBwZXJm
b3JtYW5jZSBtb25pdG9yIGNvdW50ZXIKPiArcmVnaXN0ZXJzIHRocm91Z2ggcGVyZiwgYW55IGRp
cmVjdCBhY2Nlc3Mgd2l0aG91dCBwZXJmIGludGVydmVudGlvbiB3aWxsIHRyaWdnZXIKPiArYW4g
aWxsZWdhbCBpbnN0cnVjdGlvbi4KPiArCj4gK1doZW4gc2V0IHRvIDIsIHdoaWNoIGVuYWJsZXMg
bGVnYWN5IG1vZGUgKHVzZXIgc3BhY2UgaGFzIGRpcmVjdCBhY2Nlc3MgdG8gY3ljbGUKPiArYW5k
IGluc3JldCBDU1JzIG9ubHkpLiBOb3RlIHRoYXQgdGhpcyBsZWdhY3kgdmFsdWUgaXMgZGVwcmVj
YXRlZCBhbmQgd2lsbCBiZQo+ICtyZW1vdmVkIG9uY2UgYWxsIHVzZXIgc3BhY2UgYXBwbGljYXRp
b25zIGFyZSBmaXhlZC4KPiArCj4gK05vdGUgdGhhdCB0aGUgdGltZSBDU1IgaXMgYWx3YXlzIGRp
cmVjdGx5IGFjY2Vzc2libGUgdG8gYWxsIG1vZGVzLgo+Cj4gIHBpZF9tYXgKPiAgPT09PT09PQo+
IC0tCj4gMi4zOS4yCj4KCgotLSAKUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
