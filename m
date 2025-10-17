Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD24CCD184
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 03:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AE8uZg68LY05IqQLMiLsRT9lQ6jALfxt95UtQ+k/4wE=; b=PdZ5FeclA4DJv7
	VugU2eu8OVCI2SKe4u/Nhz4Ws0ihGauYemdJGOm5YEX7At7YDdQJlgezvfk4m1GEFzGk/nlOgAOlp
	lupw60r06OHDLyaT8M7N1mSJjpbuW9GTgCdpRLt46A7IDYieATJgdhHVsVrTIfrNGEfVja7cyFojb
	YE/9AcZB02f5DCO38wQngz6t1CmXOfOdflPTq1NSQ8NJTkRRlFNITHDoxD54slnAWe1IWMH/VxsHG
	5vDQqmYNEp9/XkK7WaKhVpwef4tPgh4ImKGJQj+gUv3k+twRmzr/Z93TWXYh9nHYwmUNa1g1lSdNd
	mnNwR991KjbCe/jhdGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9b4O-00000006SZr-24yE;
	Fri, 17 Oct 2025 03:23:56 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9b4L-00000006SZ0-4BWA
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 03:23:55 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59052926cf9so1653142e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 20:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760671431; x=1761276231; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgJbpEilKc76eN6ORe40tn9wWSRIn1nbjUiD28It3k8=;
        b=k62ld7wEV7bgX42VBkl05DVboFQnW9x+qGtTyvJZDryg9jLW/9siXN+fZ7tkh7UfL5
         Mu1bO2eW0zkBxhTKEa3V8FQPfynOzhGwj5msnMbQuHuLHk6Y76YUCHUigLF+N14s1/XH
         xKm6u7jkse6ApyT/5O3qK4Rv2XSuqLITdNGulMkqfSrPWVxT1DqSkc0V7w1tb86pa/SV
         XQZRSAwgyvac4/vzif9BzdcOfp85VUeDFOxHQaqGnbcFpL1Wl+oRDNV6TuZNXQjjyWkE
         HQsPQrGPwI7AqdxqEi9WTk8Jpu+cqtyV0fjdFZH//4738YebsjGAiUQ1NvNozSr0Dwz+
         sjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760671431; x=1761276231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgJbpEilKc76eN6ORe40tn9wWSRIn1nbjUiD28It3k8=;
        b=h07OS/JvtE6e1M8BTYg85n93f9odq7CXA3s1tvrxTlGOX7PGCT6OelX4snO1Wd33YK
         1sQ/7RdnRC18ht3KzWyY7cIYq+TWbl5Mlilakls83xq4vSvUZdoZO6x+Lv8vjO8rn1Dg
         O0JLpAgKaMTKnnPS9WLhYmMzdc1jrvnGt8GrUTNcZo7Wa8qQCRftVD926aNQgRrUzmFH
         YrrP2loo9zVZdOPPGO81+6AhqwxBQ3cVdLHGl+iPw3KgSc99cr+vR9X3JFGCJBy0yqND
         EdE+jrU0O93eyxE2+qZlpJiHur9OfxDI9VlAj87RR//5NXH02iJSQhRzPyYTHK2/kl2L
         8kCw==
X-Forwarded-Encrypted: i=1; AJvYcCVT8XagzKnany+ql1blP6yHVfFY+CzwDxh2GMqperdptS/qqvnmgWeesAR0QC2TUvYyJ14uFKWkjPJuvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjscaOmsc0AAH/CteZwRzWz0qEzQBl3CIW7q8Fnf1b4+FqYHkt
	kq3Af2+OB+Yb8+Jp06BeQL7hSsSoMsiZOOw5VxNte60iVL+kldOcsYwRP8O3rgF+KtX+UJMa0UX
	7ZnuurcFgFxVrlvavNye1xaVtPjja1qhLBlQt2Yt2Bg==
X-Gm-Gg: ASbGncvshOrYlXS7vrKHVfkIIbPOiS0Dpuqx9KHKhUacGm5LVZ1LGOKOAsX42zv9JDV
	upRQVgOGbGseTA4fFHGTq/98a6EOPo0KBjnnzq53X3Zl1Jo2i6ZgHgfDHH30/nfdM02VCfAdPvF
	vPpKSgMdgfxyoOku2CDjhvuNHQi9PaJCii6ZVuAljPIdAAizPi8+EuhNsGfl3EeiG0KO35Fe5JG
	M/+qxrgxAz6Z7Z+ird+k97Fa30HO7F3CfOtNqyq/9yOOe5P+0i/a9+o1MM7Ojc0f27KD2ty
X-Google-Smtp-Source: AGHT+IElSKtdIpALk1nSLovdiSg+YYsyRQZSurzM1kakr9yrGs4N9sEcb79hjU8qjRKyDo4eqHVmU9r98WccWB5VKkE=
X-Received: by 2002:a05:6512:3f12:b0:577:9ee:7d57 with SMTP id
 2adb3069b0e04-591d85a2146mr785397e87.46.1760671431298; Thu, 16 Oct 2025
 20:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <20251016001714.3889380-1-samuel.holland@sifive.com>
In-Reply-To: <20251016001714.3889380-1-samuel.holland@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 17 Oct 2025 08:53:39 +0530
X-Gm-Features: AS18NWAHiotLWgrvaFJ0yhxbbAeGChAh_woFA4Y002T2jSkQKffZFvzyYjf0LZs
Message-ID: <CAK9=C2W7-+UnWHZyTNkwTRy-=E5vjUNTjvq9PSCrLVZsY4b56g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix check for local interrupts on riscv32
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_202354_044685_497A90A8 
X-CRM114-Status: GOOD (  12.86  )
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

T24gVGh1LCBPY3QgMTYsIDIwMjUgYXQgNTo0N+KAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRvIHNldCBhbGwgNjQgYml0cyBpbiB0aGUg
bWFzayBvbiBhIDMyLWJpdCBzeXN0ZW0sIHRoZSBjb25zdGFudCBtdXN0Cj4gaGF2ZSB0eXBlIGB1
bnNpZ25lZCBsb25nIGxvbmdgLgo+Cj4gRml4ZXM6IDZiMWU4YmE0YmFjNCAoIlJJU0MtVjogS1ZN
OiBVc2UgYml0bWFwIGZvciBpcnFzX3BlbmRpbmcgYW5kIGlycXNfcGVuZGluZ19tYXNrIikKPiBT
aWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4K
ClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC02LjE4IGZpeGVzLgoKVGhhbmtzLApBbnVwCgo+
IC0tLQo+Cj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rdm0vdmNwdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gaW5kZXggYmNjYjkxOWNhNjE1
Li41Y2UzNWFiYTYwNjkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gKysr
IGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gQEAgLTIxMiw3ICsyMTIsNyBAQCBpbnQga3ZtX2Nw
dV9oYXNfcGVuZGluZ190aW1lcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4KPiAgaW50IGt2bV9h
cmNoX3ZjcHVfcnVubmFibGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICB7Cj4gLSAgICAgICBy
ZXR1cm4gKGt2bV9yaXNjdl92Y3B1X2hhc19pbnRlcnJ1cHRzKHZjcHUsIC0xVUwpICYmCj4gKyAg
ICAgICByZXR1cm4gKGt2bV9yaXNjdl92Y3B1X2hhc19pbnRlcnJ1cHRzKHZjcHUsIC0xVUxMKSAm
Jgo+ICAgICAgICAgICAgICAgICAha3ZtX3Jpc2N2X3ZjcHVfc3RvcHBlZCh2Y3B1KSAmJiAhdmNw
dS0+YXJjaC5wYXVzZSk7Cj4gIH0KPgo+IC0tCj4gMi40Ny4yCj4KPiBiYXNlLWNvbW1pdDogNWE2
ZjY1ZDE1MDI1NTFmODRjMTU4Nzg5ZTVkODkyOTljNzg5MDdjNwo+IGJyYW5jaDogdXAva3ZtLWFp
YS1maXgKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
