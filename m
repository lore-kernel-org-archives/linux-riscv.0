Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51089C77B7F
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 02:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cb6zyd/8F1MiGL0yAtby2XE9fwjJHvRW6FzEOSrBz5M=; b=aY4rrtg0RlRE18
	q3s7vWvmPwEIn9DLxSEUSu1X2SRym7K2lxFUR640SjRmBJV2WZU2g4Y4s2bl4yiLAvhvgBTNqjhH9
	a1LKOl8eDvuxa+DNb6EhcdOH792E/8kYDBCrEC1WjqnTz9USkPQHMH24f0B3mr1DT8YS6bEXRUKvD
	XaMQRFNPb4LmEgBwMqx+8iJthO0i8JDU9xqRZCxBGhr5h8jHNGEwzFp0r/oLxWjsjqCFxLrhkMdtS
	QQlAuizqFTEioP3JvRqVlOrhYLAGuLmaKJaELeuif5D11010nk5ahuR8liBIZWlLkLjDVtnTBKCvh
	UQPLUHcdX/MQ4RZGXIlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvUaP-00F14J-2I;
	Sun, 07 May 2023 02:57:21 +0000
Received: from mail-yb1-f182.google.com ([209.85.219.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvUaM-00F131-2T
	for linux-riscv@lists.infradead.org;
	Sun, 07 May 2023 02:57:20 +0000
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-b9e27684b53so2924396276.0
        for <linux-riscv@lists.infradead.org>; Sat, 06 May 2023 19:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683428229; x=1686020229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y27uBZQDxoMMmtt5dKQE+mflLBajPhR2V/YDaYqpNNc=;
        b=i+8jOetpZ7qdWsrii6na7rYtdiC3MhpLOc4leCWsrXeFQbECcCQiTyU7DjNLLsVOy2
         TtLF12xrip2nTMxDFrm7yBanhlqgMMWDyMvJAQbL3/fxnNAQCa6XPCz4qWE3fPJxrQbl
         fsPP6a/N2oWTPItfMRz42Z6jq0trPOSJQzD+gsFds8m1Nfgmt1JilH7L9iB8RsPp4BiI
         ytm7k33GRS5ZCm956/ZTAf56WrFZHymzjzoTQHdLsDQe+hKgK4xZmfr1Q7rFM+pDHgb/
         bHy6kixuXIjxMAPFMO325yllYEMVTMYphii/vccfiGfO4sQLPXElTL4bqSm2HSwL6q9z
         xWaw==
X-Gm-Message-State: AC+VfDzP9nh/U59LNKb/SDQ13e4/Eeqonic5GwEouiLQDIB14IhMeOen
	Z0rDoQEbJwgtAqEvRaCsWGT75gY2O+oHPKJh4dw=
X-Google-Smtp-Source: ACHHUZ5KYd+Vp866GdYz32Yb8G1anYuwcXULbK3NRkDd6T9rO6BPZvKgFiMbj5mIdsFH380Y3SgiWsJzPH/v6x/8GkQ=
X-Received: by 2002:a25:e648:0:b0:b9e:712f:4a17 with SMTP id
 d69-20020a25e648000000b00b9e712f4a17mr6602071ybh.6.1683428229058; Sat, 06 May
 2023 19:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230506021450.3499232-1-irogers@google.com>
In-Reply-To: <20230506021450.3499232-1-irogers@google.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Sat, 6 May 2023 19:56:56 -0700
Message-ID: <CAM9d7cieo+cF9uNfgQq=R1BofNN5Ae69sjz80rV8-TxXPZFasg@mail.gmail.com>
Subject: Re: [PATCH v1] perf build: Add system include paths to BPF builds
To: Ian Rogers <irogers@google.com>
Cc: Song Liu <songliubraving@meta.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Andrii Nakryiko <andrii.nakryiko@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_195718_804634_99C81AA0 
X-CRM114-Status: GOOD (  16.97  )
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

SGkgSWFuLAoKT24gRnJpLCBNYXkgNSwgMjAyMyBhdCA3OjE14oCvUE0gSWFuIFJvZ2VycyA8aXJv
Z2Vyc0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IFRoZXJlIGFyZSBpbnN1ZmZpY2llbnQgaGVhZGVy
cyBpbiB0b29scy9pbmNsdWRlIHRvIHNhdGlzZnkgYnVpbGRpbmcKPiBCUEYgcHJvZ3JhbXMgYW5k
IHRoZWlyIGhlYWRlciBkZXBlbmRlbmNpZXMuIEFkZCB0aGUgc3lzdGVtIGluY2x1ZGUKPiBwYXRo
cyBmcm9tIHRoZSBub24tQlBGIGNsYW5nIGNvbXBpbGUgc28gdGhhdCB0aGVzZSBoZWFkZXJzIGNh
biBiZQo+IGZvdW5kLgo+Cj4gVGhpcyBjb2RlIHdhcyB0YWtlbiBmcm9tOgo+IHRvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZQo+Cj4gU2lnbmVkLW9mZi1ieTogSWFuIFJvZ2VycyA8
aXJvZ2Vyc0Bnb29nbGUuY29tPgoKVGhhbmtzLCB0aGlzIGZpeGVzIHRoZSBCUEYgYnVpbGQgZmFp
bHVyZSBvbiBteSBtYWNoaW5lLgoKVGVzdGVkLWJ5OiBOYW1oeXVuZyBLaW0gPG5hbWh5dW5nQGtl
cm5lbC5vcmc+CgpUaGFua3MsCk5hbWh5dW5nCgoKPiAtLS0KPiAgdG9vbHMvcGVyZi9NYWtlZmls
ZS5wZXJmIHwgMjAgKysrKysrKysrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL01h
a2VmaWxlLnBlcmYgYi90b29scy9wZXJmL01ha2VmaWxlLnBlcmYKPiBpbmRleCA2MWMzM2QxMDBi
MmIuLjM3YmVmZGZhOGFjOCAxMDA2NDQKPiAtLS0gYS90b29scy9wZXJmL01ha2VmaWxlLnBlcmYK
PiArKysgYi90b29scy9wZXJmL01ha2VmaWxlLnBlcmYKPiBAQCAtMTA1Nyw3ICsxMDU3LDI1IEBA
ICQoU0tFTF9UTVBfT1VUKSAkKExJQkFQSV9PVVRQVVQpICQoTElCQlBGX09VVFBVVCkgJChMSUJQ
RVJGX09VVFBVVCkgJChMSUJTVUJDTURfCj4KPiAgaWZuZGVmIE5PX0JQRl9TS0VMCj4gIEJQRlRP
T0wgOj0gJChTS0VMX1RNUF9PVVQpL2Jvb3RzdHJhcC9icGZ0b29sCj4gLUJQRl9JTkNMVURFIDo9
IC1JJChTS0VMX1RNUF9PVVQpLy4uIC1JJChMSUJCUEZfSU5DTFVERSkKPiArCj4gKyMgR2V0IENs
YW5nJ3MgZGVmYXVsdCBpbmNsdWRlcyBvbiB0aGlzIHN5c3RlbSwgYXMgb3Bwb3NlZCB0byB0aG9z
ZSBzZWVuIGJ5Cj4gKyMgJy10YXJnZXQgYnBmJy4gVGhpcyBmaXhlcyAibWlzc2luZyIgZmlsZXMg
b24gc29tZSBhcmNoaXRlY3R1cmVzL2Rpc3Ryb3MsCj4gKyMgc3VjaCBhcyBhc20vYnl0ZW9yZGVy
LmgsIGFzbS9zb2NrZXQuaCwgYXNtL3NvY2tpb3MuaCwgc3lzL2NkZWZzLmggZXRjLgo+ICsjCj4g
KyMgVXNlICctaWRpcmFmdGVyJzogRG9uJ3QgaW50ZXJmZXJlIHdpdGggaW5jbHVkZSBtZWNoYW5p
Y3MgZXhjZXB0IHdoZXJlIHRoZQo+ICsjIGJ1aWxkIHdvdWxkIGhhdmUgZmFpbGVkIGFueXdheXMu
Cj4gK2RlZmluZSBnZXRfc3lzX2luY2x1ZGVzCj4gKyQoc2hlbGwgJCgxKSAkKDIpIC12IC1FIC0g
PC9kZXYvbnVsbCAyPiYxIFwKPiArICAgICAgIHwgc2VkIC1uICcvPC4uLj4gc2VhcmNoIHN0YXJ0
cyBoZXJlOi8sL0VuZCBvZiBzZWFyY2ggbGlzdC4veyBzfCBcKC8uKlwpfC1pZGlyYWZ0ZXIgXDF8
cCB9JykgXAo+ICskKHNoZWxsICQoMSkgJCgyKSAtZE0gLUUgLSA8L2Rldi9udWxsIHwgZ3JlcCAn
X19yaXNjdl94bGVuICcgfCBhd2sgJ3twcmludGYoIi1EX19yaXNjdl94bGVuPSVkIC1EX19CSVRT
X1BFUl9MT05HPSVkIiwgJCQzLCAkJDMpfScpCj4gK2VuZGVmCj4gKwo+ICtpZm5lcSAoJChDUk9T
U19DT01QSUxFKSwpCj4gK0NMQU5HX1RBUkdFVF9BUkNIID0gLS10YXJnZXQ9JChub3RkaXIgJChD
Uk9TU19DT01QSUxFOiUtPSUpKQo+ICtlbmRpZgo+ICsKPiArQ0xBTkdfU1lTX0lOQ0xVREVTID0g
JChjYWxsIGdldF9zeXNfaW5jbHVkZXMsJChDTEFORyksJChDTEFOR19UQVJHRVRfQVJDSCkpCj4g
K0JQRl9JTkNMVURFIDo9IC1JJChTS0VMX1RNUF9PVVQpLy4uIC1JJChMSUJCUEZfSU5DTFVERSkg
JChDTEFOR19TWVNfSU5DTFVERVMpCj4KPiAgJChCUEZUT09MKTogfCAkKFNLRUxfVE1QX09VVCkK
PiAgICAgICAgICQoUSlDRkxBR1M9ICQoTUFLRSkgLUMgLi4vYnBmL2JwZnRvb2wgXAo+IC0tCj4g
Mi40MC4xLjUyMS5nZjFlMjE4ZmNkOC1nb29nCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
