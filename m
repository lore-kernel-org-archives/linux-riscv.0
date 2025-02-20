Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6ADEC021B1
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2025 18:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JK/Cgkj2UBZ5dQKr65Nhb+v/CcvkX4h5AAE2tCkQqrU=; b=S3tHWBgsK1wcuy
	uF1cW3KrdU07OEJesfvbOXMmqsExCqI6mytFne7V4JvTMDdSnQhkfW2cm+VMPyovnDQvLzrznI+Tw
	fQWg10FdziApdDFqURDeno6RpYsWDcH2xVV8PPDQcFLE179fl8zMBwtJ59nK0Tz1VD/kILMs0+otA
	rvKXpELzmFxkl3v1fPWDPzas4aFnNi1WSV9Ao05D0YBRrPsEUEcKpWv9CJRRy9qn/5ZegKrVWI2f8
	W1Jm2S76739Q4EO6EDLfZFTfA9piIucBnEggvR4iE2tzgMtW1Vk5/m2VczAA6mZjpi7zn6EVsle79
	1F+P3DKN6n+/g5cfSe/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBdz-00000002Spl-1nFM;
	Thu, 20 Feb 2025 18:51:31 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBdx-00000002Soc-1so7
	for linux-riscv@lists.infradead.org;
	Thu, 20 Feb 2025 18:51:30 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2212222d4cdso17705ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 10:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740077488; x=1740682288; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhJ69vRwG4/Ip9gplTFM8NFvquX+cS64MkbgZEIwj+E=;
        b=NXuqDUIX7dNwdW+EvRlPofbtkq7Y7lcYiIOadvJ+bM/zMZhtNPhBqbun90kqyaQPgq
         tWKMMoOwECeyaAqVNETVmLq4WMCwhuXZZgrOfLVDp4S9pwt1OcpmxnDX0T1BumQJhgBZ
         69I3/unfNWgRPhFd66Qcdd++b312kaz8Natgl1M9c2+MI/2NaD5Vh6DG7TTptZ0zUK73
         36r7A7gjgb9QARW+1QjXLr6moXti8lvfFqxl/qhx5yj3cky6nwCk6sYfA9TQQ9MyO/DY
         AB/2sZg5kr5tmZWj4ZUoan5m1W54gtQ/5F1cB6q3qOdEmMmDW2eFoWr1P6M2V5QXlDfk
         OTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740077488; x=1740682288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhJ69vRwG4/Ip9gplTFM8NFvquX+cS64MkbgZEIwj+E=;
        b=akANcUh3ebyBIObM7UKuMXB8rEFSeGJNcv0UQO9PDUnn8RioxsaHInjX2UK4WgWNsY
         NmpbecTjwsLaoe3yIdoZuFr7KKofqvui8oZ227G5zvAtT0QBd6i6srnhjVjxgJowrRu5
         sH0dQUv1eNFrEZlskpEokiwfitUNfDWVsXAsQh0UCrlZEWI3nHEPq1vaAbNOeBHJL3cm
         QPxZQtsg+Pn+moidwMa4zxtMikl8HuhSsOcmVCrqc9Jw2G6mX11/Ncs5Ka7R2AF4NiM3
         C90zSGZpBYiywWY2APB+9zot8VcPYEKi/EDK8SjzWFSYhxduHc7jKUVWHXpQJXLAahOp
         PUzA==
X-Forwarded-Encrypted: i=1; AJvYcCWzFdgO8xmy46nkRg6O0AynMGK5AK4PR+wlp350XZXfhi0NHskVG1S57Lg01W9t6zhRCDOw1GwodLeNmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZyJ8EOpVHXHbi+L9Uvm76WfrYtDhO0F9a+tZ2YtulrZBjv0p2
	nTsrxqsHmz3w6wX8rEZ4gfbqT1nSWi37O926a61VMxfX4/TxK00VVPPfMGhyPVzo1upElRiULpW
	dV6QmOGRO2d2mrvncREHJeHAizvM06zhgMrrM
X-Gm-Gg: ASbGnctC7RL1w5S8vrHSa5+LQKH2HfqdW2w/2bhH0geYmYfiwDrMKJii4HqUE+92JNi
	4V+lDUY2xvBlh/KrHS9kXa5tk6TmSjo4RAc5ksZ0P/Z9X+AozB/jqPwp9W5VxlLdKIRKtAE4KKC
	W6l7YLN1MQmC4mmtzyNRoQTuwm
X-Google-Smtp-Source: AGHT+IECDW8S7YlQj87u+f2jRjQ5P9mRH/NzvGozxEWj9dWUJDrgvBXpzR2jzfN1lFZ0KlbMW6x/Z8AGWqTHbzkEko8=
X-Received: by 2002:a17:902:d483:b0:216:6dab:8042 with SMTP id
 d9443c01a7336-221a04180f4mr119475ad.12.1740077487831; Thu, 20 Feb 2025
 10:51:27 -0800 (PST)
MIME-Version: 1.0
References: <20250116230955.867152-1-rkanwal@rivosinc.com> <20250116230955.867152-2-rkanwal@rivosinc.com>
In-Reply-To: <20250116230955.867152-2-rkanwal@rivosinc.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 20 Feb 2025 10:51:16 -0800
X-Gm-Features: AWEUYZmHbSjeW8HzHoyYmG869PxyzHFXRgpXexLbuZp2OsvcdU8Dmp28AKsYjrs
Message-ID: <CAP-5=fU9ovvb-JopPqQfNaj6xtL=u_WZO-b56RdhBmUw4mY0ZA@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] perf: Increase the maximum number of samples to 256.
To: Rajnesh Kanwal <rkanwal@rivosinc.com>, "Liang, Kan" <kan.liang@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, adrian.hunter@intel.com, 
	alexander.shishkin@linux.intel.com, ajones@ventanamicro.com, 
	anup@brainfault.org, acme@kernel.org, atishp@rivosinc.com, 
	beeman@rivosinc.com, brauner@kernel.org, conor@kernel.org, heiko@sntech.de, 
	mingo@redhat.com, james.clark@arm.com, renyu.zj@linux.alibaba.com, 
	jolsa@kernel.org, jisheng.teoh@starfivetech.com, palmer@dabbelt.com, 
	will@kernel.org, kaiwenxue1@gmail.com, vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_105129_488295_EBF50B5B 
X-CRM114-Status: GOOD (  20.55  )
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

T24gVGh1LCBKYW4gMTYsIDIwMjUgYXQgMzoxMOKAr1BNIFJham5lc2ggS2Fud2FsIDxya2Fud2Fs
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBSSVNDViBDVFIgZXh0ZW5zaW9uIHN1cHBvcnQgYSBt
YXhpbXVtIGRlcHRoIG9mIDI1NiBsYXN0IGJyYW5jaCByZWNvcmRzLgo+IFRoZSAxMjcgZW50cmll
cyBsaW1pdCByZXN1bHRzIGluIGNvcnJ1cHRpbmcgQ1RSIGVudHJpZXMgZm9yIFJJU0MtViBpZgo+
IGNvbmZpZ3VyZWQgdG8gYmUgMjU2IGVudHJpZXMuIFRoaXMgd2lsbCBub3QgaW1wYWN0IGFueSBv
dGhlciBhcmNoaXRlY3R1cmVzCj4gYXMgaXQgaXMganVzdCBpbmNyZWFzaW5nIG1heGltdW0gbGlt
aXQgb2YgcG9zc2libGUgZW50cmllcy4KCkkgd29uZGVyIGlmIHJhdGhlciB0aGFuIGEgY29uc3Rh
bnQgdGhpcyBjb2RlIHNob3VsZCBqdXN0IHVzZSB0aGUgYXV0bwpyZXNpemluZyBoYXNobWFwIGNv
ZGU/Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZh
bGRzL2xpbnV4LmdpdC90cmVlL3Rvb2xzL3BlcmYvdXRpbC9oYXNobWFwLmgKCkkgYXNzdW1lIHRo
ZSB2YWx1ZSBvZiAxMjcgY29tZXMgZnJvbSBwZXJmX2V2ZW50LmgncyBQRVJGX01BWF9TVEFDS19E
RVBUSDoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9y
dmFsZHMvbGludXguZ2l0L3RyZWUvaW5jbHVkZS91YXBpL2xpbnV4L3BlcmZfZXZlbnQuaCNuMTI1
MgoKUGVyaGFwcyB0aGVzZSBjb25zdGFudHMgc2hvdWxkbid0IGV4aXN0LiBUaGUgcGVyZi1yZWNv
cmQgbWFuIHBhZ2UgbWVudGlvbnM6CnN5c2N0bC5rZXJuZWwucGVyZl9ldmVudF9tYXhfc3RhY2sK
d2hpY2ggSSBiZWxpZXZlIGdldHMgYSB2YWx1ZSBmcm9tCi9wcm9jL3N5cy9rZXJuZWwvcGVyZl9l
dmVudF9tYXhfc3RhY2ssIHNvIG1heWJlIHRoZXNlIHNob3VsZCBiZQpydW50aW1lIGRldGVybWlu
ZWQgY29uc3RhbnRzIHJhdGhlciB0aGFuIGNvbXBpbGUgdGltZS4KClRoYW5rcywKSWFuCgo+IFNp
Z25lZC1vZmYtYnk6IFJham5lc2ggS2Fud2FsIDxya2Fud2FsQHJpdm9zaW5jLmNvbT4KPiAtLS0K
PiAgdG9vbHMvcGVyZi91dGlsL21hY2hpbmUuYyB8IDIxICsrKysrKysrKysrKysrLS0tLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS90b29scy9wZXJmL3V0aWwvbWFjaGluZS5jIGIvdG9vbHMvcGVyZi91dGlsL21h
Y2hpbmUuYwo+IGluZGV4IDI3ZDUzNDVkMmIzMC4uZjJlYjNjMjAyNzRlIDEwMDY0NAo+IC0tLSBh
L3Rvb2xzL3BlcmYvdXRpbC9tYWNoaW5lLmMKPiArKysgYi90b29scy9wZXJmL3V0aWwvbWFjaGlu
ZS5jCj4gQEAgLTIxNzQsMjUgKzIxNzQsMzIgQEAgc3RhdGljIHZvaWQgc2F2ZV9pdGVyYXRpb25z
KHN0cnVjdCBpdGVyYXRpb25zICppdGVyLAo+ICAgICAgICAgICAgICAgICBpdGVyLT5jeWNsZXMg
Kz0gYmVbaV0uZmxhZ3MuY3ljbGVzOwo+ICB9Cj4KPiAtI2RlZmluZSBDSEFTSFNaIDEyNwo+IC0j
ZGVmaW5lIENIQVNIQklUUyA3Cj4gLSNkZWZpbmUgTk9fRU5UUlkgMHhmZgo+ICsjZGVmaW5lIENI
QVNIQklUUyA4Cj4gKyNkZWZpbmUgTk9fRU5UUlkgMHhmZlUKPgo+IC0jZGVmaW5lIFBFUkZfTUFY
X0JSQU5DSF9ERVBUSCAxMjcKPiArI2RlZmluZSBQRVJGX01BWF9CUkFOQ0hfREVQVEggMjU2Cj4K
PiAgLyogUmVtb3ZlIGxvb3BzLiAqLwo+ICsvKiBOb3RlOiBMYXN0IGVudHJ5IChpPT1mZikgd2ls
bCBuZXZlciBiZSBjaGVja2VkIGFnYWluc3QgTk9fRU5UUlkKPiArICogc28gaXQncyBzYWZlIHRv
IGhhdmUgYW4gdW5zaWduZWQgY2hhciBhcnJheSB0byBwcm9jZXNzIDI1NiBlbnRyaWVzCj4gKyAq
IHdpdGhvdXQgY2F1c2luZyBjbGFzaCBiZXR3ZWVuIGxhc3QgZW50cnkgYW5kIE5PX0VOVFJZIHZh
bHVlLgo+ICsgKi8KPiAgc3RhdGljIGludCByZW1vdmVfbG9vcHMoc3RydWN0IGJyYW5jaF9lbnRy
eSAqbCwgaW50IG5yLAo+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBpdGVyYXRpb25z
ICppdGVyKQo+ICB7Cj4gICAgICAgICBpbnQgaSwgaiwgb2ZmOwo+IC0gICAgICAgdW5zaWduZWQg
Y2hhciBjaGFzaFtDSEFTSFNaXTsKPiArICAgICAgIHVuc2lnbmVkIGNoYXIgY2hhc2hbUEVSRl9N
QVhfQlJBTkNIX0RFUFRIXTsKPgo+ICAgICAgICAgbWVtc2V0KGNoYXNoLCBOT19FTlRSWSwgc2l6
ZW9mKGNoYXNoKSk7Cj4KPiAtICAgICAgIEJVR19PTihQRVJGX01BWF9CUkFOQ0hfREVQVEggPiAy
NTUpOwo+ICsgICAgICAgQlVHX09OKFBFUkZfTUFYX0JSQU5DSF9ERVBUSCA+IDI1Nik7Cj4KPiAg
ICAgICAgIGZvciAoaSA9IDA7IGkgPCBucjsgaSsrKSB7Cj4gLSAgICAgICAgICAgICAgIGludCBo
ID0gaGFzaF82NChsW2ldLmZyb20sIENIQVNIQklUUykgJSBDSEFTSFNaOwo+ICsgICAgICAgICAg
ICAgICAvKiBSZW1haW5kZXIgZGl2aXNpb24gYnkgUEVSRl9NQVhfQlJBTkNIX0RFUFRIIGlzIG5v
dAo+ICsgICAgICAgICAgICAgICAgKiBuZWVkZWQgYXMgaGFzaF82NCB3aWxsIGFueXdheSBsaW1p
dCB0aGUgaGFzaAo+ICsgICAgICAgICAgICAgICAgKiB0byBDSEFTSEJJVFMKPiArICAgICAgICAg
ICAgICAgICovCj4gKyAgICAgICAgICAgICAgIGludCBoID0gaGFzaF82NChsW2ldLmZyb20sIENI
QVNIQklUUyk7Cj4KPiAgICAgICAgICAgICAgICAgLyogbm8gY29sbGlzaW9uIGhhbmRsaW5nIGZv
ciBub3cgKi8KPiAgICAgICAgICAgICAgICAgaWYgKGNoYXNoW2hdID09IE5PX0VOVFJZKSB7Cj4g
LS0KPiAyLjM0LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
