Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BCFEB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 08:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1RxBevnD206KgeMCdQYJ1xv2d8mNKFAHa5el+Kmc3pQ=; b=yF3JIjHK+V/3DX
	jfus/eymEt41F3a8ITqF5sb3f8e2WFergfXy58qz5j29CtqD0qYZPhXuuornO54xsVu3gQFLNAvjo
	4knFUzNbIZ0xznCzcks5ep14Iof3OX8Iy9VYWKgmMetMHUo9Jwn171mlV6iC7sAGeXVOYJvwWe+Vu
	2U96kn8E8XCRP2PAilBr16xXMkcp5Yvc1K10nY4OqkWvn5L2GYpF0EppvajlaWrMMQS+NOsyp95vn
	M4u2AVD6FsDW+k0hf34lj6h3T3csWfgLbXWKIca4ThzT8zcc+ChZspax8IPfk4UJJAm4gfg9Ttrkq
	s1wzEckR2IqK0vQtXuIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA53N-00HJ20-1o;
	Fri, 16 Jun 2023 08:43:33 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA53K-00HIzs-11
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 08:43:32 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b4274f7640so20548391fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jun 2023 01:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1686905008; x=1689497008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDKNwc2spJwBfD2I0zIbFW0EXN11ktfXXRri1gY5Wq4=;
        b=Q4BVOMxjOIj+1lvfbkrCmoferkJ4DrgoK2bY1m2+REfJQMIq1E8wARoLRu1Ucq0fch
         KW8AVDqi6q48jF0cCigWx4G9koByTKk0TO8dXqh6RQKVeUiQ5XlKID3vJ5479apMgKNj
         px0XvIXdo0H2dmHBJRA9CIMQt3MgDbcNsylek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686905008; x=1689497008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDKNwc2spJwBfD2I0zIbFW0EXN11ktfXXRri1gY5Wq4=;
        b=hDbr4DB8BEFpIYozo5cYJywN9YnOlPMvKArSoWbnZCYIywV2Em/nHrvL7t1up23Rdf
         0vGPDGAhOKdDlCy00b6c8sB/5hI6R9fbhb54WzSnXbkJLsB6fZDNd+619jxVbvHAduov
         /wszScr/3mwSShXWPYNuCAZAomajzBhG0ZdgoJJVMHS/pRItZwN416Pnmw7frjZlZkz0
         Fsd1qHD5qXGL0lFipA4dyoGn9Mldyqxc+r3ZvH2V3Brmv3j68s0CatKBcun2eG3R7hcn
         g0Hva8GF/oNct5+J6+3hSANIEIJdirshxIGs3llJ2DF7BodqqSaIVg61vj5rnaL+yl1O
         Jlzg==
X-Gm-Message-State: AC+VfDyOhCZ4M01Y6SzQbc94sL4ngwSVohgM5LmfMyVuKiVVvb0HTpP1
	mo7+8vFTlTfE/PWZUvU5tkzBxIdZTnZqgC0+1t77
X-Google-Smtp-Source: ACHHUZ588No8rZTW5BgVANgGiSevYvr7PcGyiQIzkpCtRm5EWtTsAu2/r8c06MBm/GyhWVIvHZI+/K/g+jEjYCbGYpk=
X-Received: by 2002:a05:651c:150:b0:2b0:919e:4265 with SMTP id
 c16-20020a05651c015000b002b0919e4265mr362266ljd.21.1686905008073; Fri, 16 Jun
 2023 01:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230512085321.13259-1-alexghiti@rivosinc.com> <20230512085321.13259-10-alexghiti@rivosinc.com>
In-Reply-To: <20230512085321.13259-10-alexghiti@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 16 Jun 2023 01:43:16 -0700
Message-ID: <CAOnJCU+n0O9oQmd1Vs3kimaBai7vbaf5RiMRFyvphCCLCGMB1A@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] tools: lib: perf: Implement riscv mmap support
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
X-CRM114-CacheID: sfid-20230616_014330_382961_3BCDA08D 
X-CRM114-Status: GOOD (  17.94  )
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

T24gRnJpLCBNYXkgMTIsIDIwMjMgYXQgMjowM+KAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiByaXNjdiBub3cgc3VwcG9ydCBtbWFwaW5nIGhh
cmR3YXJlIGNvdW50ZXJzIHNvIGFkZCB3aGF0J3MgbmVlZGVkIHRvCj4gdGFrZSBhZHZhbnRhZ2Ug
b2YgdGhhdCBpbiBsaWJwZXJmLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxh
bGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+IC0tLQo+ICB0b29scy9saWIvcGVyZi9tbWFwLmMgfCA2
NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGliL3BlcmYv
bW1hcC5jIGIvdG9vbHMvbGliL3BlcmYvbW1hcC5jCj4gaW5kZXggMGQxNjM0Y2VkZjQ0Li42NWYy
NTBlMGVmOTIgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGliL3BlcmYvbW1hcC5jCj4gKysrIGIvdG9v
bHMvbGliL3BlcmYvbW1hcC5jCj4gQEAgLTM5Miw2ICszOTIsNzEgQEAgc3RhdGljIHU2NCByZWFk
X3BlcmZfY291bnRlcih1bnNpZ25lZCBpbnQgY291bnRlcikKPgo+ICBzdGF0aWMgdTY0IHJlYWRf
dGltZXN0YW1wKHZvaWQpIHsgcmV0dXJuIHJlYWRfc3lzcmVnKGNudHZjdF9lbDApOyB9Cj4KPiAr
I2VsaWYgX19yaXNjdl94bGVuID09IDY0Cj4gKwoKVGhpcyBpcyBhcHBsaWNhYmxlIGZvciBSVjMy
IGFzIHdlbGwuIE5vID8Kb3RoZXJ3aXNlLCB5b3Ugd29uJ3QgbmVlZCBDU1JfQ1lDTEVICgo+ICsj
ZGVmaW5lIENTUl9DWUNMRSAgICAgIDB4YzAwCj4gKyNkZWZpbmUgQ1NSX1RJTUUgICAgICAgMHhj
MDEKPiArI2RlZmluZSBDU1JfQ1lDTEVIICAgICAweGM4MAo+ICsKPiArI2RlZmluZSBjc3JfcmVh
ZChjc3IpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsoeyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gKyAgICAgICByZWdpc3RlciB1bnNpZ25lZCBsb25nIF9fdjsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgX19hc21fXyBfX3ZvbGF0aWxlX18gKCJj
c3JyICUwLCAiICNjc3IgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAgOiAiPXIiIChfX3Yp
IDogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICA6
ICJtZW1vcnkiKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAg
ICAgICAgICAgIF9fdjsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+ICt9KQo+ICsKPiArc3RhdGljIHVuc2lnbmVkIGxvbmcgY3NyX3JlYWRfbnVtKGludCBjc3Jf
bnVtKQo+ICt7Cj4gKyNkZWZpbmUgc3dpdGNoY2FzZV9jc3JfcmVhZChfX2Nzcl9udW0sIF9fdmFs
KSAgICAgICAgICAge1wKPiArICAgICAgIGNhc2UgX19jc3JfbnVtOiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgX192YWwgPSBjc3JfcmVhZChfX2Nz
cl9udW0pOyAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgYnJlYWs7IH0KPiArI2RlZmlu
ZSBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzIoX19jc3JfbnVtLCBfX3ZhbCkgICAgICAgICB7XAo+ICsg
ICAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZChfX2Nzcl9udW0gKyAwLCBfX3ZhbCkgICAgICAgIFwK
PiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWQoX19jc3JfbnVtICsgMSwgX192YWwpfQo+ICsj
ZGVmaW5lIHN3aXRjaGNhc2VfY3NyX3JlYWRfNChfX2Nzcl9udW0sIF9fdmFsKSAgICAgICAgIHtc
Cj4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzIoX19jc3JfbnVtICsgMCwgX192YWwpICAg
ICAgXAo+ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZF8yKF9fY3NyX251bSArIDIsIF9fdmFs
KX0KPiArI2RlZmluZSBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzgoX19jc3JfbnVtLCBfX3ZhbCkgICAg
ICAgICB7XAo+ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZF80KF9fY3NyX251bSArIDAsIF9f
dmFsKSAgICAgIFwKPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRfNChfX2Nzcl9udW0gKyA0
LCBfX3ZhbCl9Cj4gKyNkZWZpbmUgc3dpdGNoY2FzZV9jc3JfcmVhZF8xNihfX2Nzcl9udW0sIF9f
dmFsKSAgICAgICAge1wKPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRfOChfX2Nzcl9udW0g
KyAwLCBfX3ZhbCkgICAgICBcCj4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzgoX19jc3Jf
bnVtICsgOCwgX192YWwpfQo+ICsjZGVmaW5lIHN3aXRjaGNhc2VfY3NyX3JlYWRfMzIoX19jc3Jf
bnVtLCBfX3ZhbCkgICAgICAgIHtcCj4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzE2KF9f
Y3NyX251bSArIDAsIF9fdmFsKSAgICAgXAo+ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZF8x
NihfX2Nzcl9udW0gKyAxNiwgX192YWwpfQo+ICsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgcmV0
ID0gMDsKPiArCj4gKyAgICAgICBzd2l0Y2ggKGNzcl9udW0pIHsKPiArICAgICAgIHN3aXRjaGNh
c2VfY3NyX3JlYWRfMzIoQ1NSX0NZQ0xFLCByZXQpCj4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9y
ZWFkXzMyKENTUl9DWUNMRUgsIHJldCkKPiArICAgICAgIGRlZmF1bHQ6Cj4gKyAgICAgICAgICAg
ICAgIGJyZWFrOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVybiByZXQ7Cj4gKyN1bmRl
ZiBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzMyCj4gKyN1bmRlZiBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzE2
Cj4gKyN1bmRlZiBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzgKPiArI3VuZGVmIHN3aXRjaGNhc2VfY3Ny
X3JlYWRfNAo+ICsjdW5kZWYgc3dpdGNoY2FzZV9jc3JfcmVhZF8yCj4gKyN1bmRlZiBzd2l0Y2hj
YXNlX2Nzcl9yZWFkCj4gK30KPiArCj4gK3N0YXRpYyB1NjQgcmVhZF9wZXJmX2NvdW50ZXIodW5z
aWduZWQgaW50IGNvdW50ZXIpCj4gK3sKPiArICAgICAgIHJldHVybiBjc3JfcmVhZF9udW0oQ1NS
X0NZQ0xFICsgY291bnRlcik7Cj4gK30KPiArCj4gK3N0YXRpYyB1NjQgcmVhZF90aW1lc3RhbXAo
dm9pZCkKPiArewo+ICsgICAgICAgcmV0dXJuIGNzcl9yZWFkX251bShDU1JfVElNRSk7Cj4gK30K
PiArCj4gICNlbHNlCj4gIHN0YXRpYyB1NjQgcmVhZF9wZXJmX2NvdW50ZXIodW5zaWduZWQgaW50
IGNvdW50ZXIgX19tYXliZV91bnVzZWQpIHsgcmV0dXJuIDA7IH0KPiAgc3RhdGljIHU2NCByZWFk
X3RpbWVzdGFtcCh2b2lkKSB7IHJldHVybiAwOyB9Cj4gLS0KPiAyLjM3LjIKPgoKCi0tIApSZWdh
cmRzLApBdGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
