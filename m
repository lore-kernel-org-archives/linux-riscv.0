Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4C3C04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 07:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/9NJtAV7Xw9e73GHgFHU1Sv8dOxoshjcjpFnJ7tE9zQ=; b=cSKNdiOV9j1OeD
	Spp33EpoFi3rdqSBIUyg9DfMIRbhReKH8hfPUlmdw8EI87qs31Ep5dymmoR6pu2Y5f0CsCqxIk0hO
	hU3Fbn6YoUqmPgZ6c6lua7NtSxRztYLs3A0ZKDRXgSaC/jms297EVT9EDDCMZPi4WRLAoqxBXZgnX
	tgIY35LgzjdbQ5Tkxo5z10a7bt3pRLSzm8Hl/RVqvjt5Vr9skrBxrJLPCSmtepQbWwJir/q7LLSV0
	NmdUUwBncGO7vCKYgBJJcCzUE3Pe4kSIQH0XckpeHXmpzIlKeNCC4+uWeH1rOp765dLpppusO8TGH
	u1Qn6U5voRDFmyr7hnqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7rsq-000000072QG-0O1V;
	Fri, 17 May 2024 07:20:04 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7rsm-000000072OK-0Aw2
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 07:20:02 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-7e1c2b07507so104947139f.2
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 00:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715930398; x=1716535198; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DARwQ7xcLW9SgOpwsz1tepc/1IVi/5Qc1nde5sSyF/U=;
        b=R1sPxH0yGtye3KHOB3bqPNXz4HCqebVhMUacQB/Jj9YQBRlTs1XrkVAwUoxPppusPD
         nVNshkl6ZdE4Q+wqEr6xlVKzDkQfgWcGbJSLeJAOpPAwkxSpZv6QV2rBK5lnnrSFJxpk
         Zg18yplYbWoJceUtceGWbpKdFks6hebCJ2tfgDv10IPv3kI8i9FFxdrWRZRGjrstc5ee
         G7sNl8Z/QYTI0QJ4dQ3RY4lJsm9Aur+52SmDLp69YU8/TOkP4WKDnQZ1xe8fXQ7Y2q+0
         L0W6gdqaGE0ipv7LEj74xBbZbTVeMiRq/61H4GthghO72B8s1X0l7cYE013Y680dLppT
         EDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715930398; x=1716535198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DARwQ7xcLW9SgOpwsz1tepc/1IVi/5Qc1nde5sSyF/U=;
        b=XGh8yZbSnBEA7zjYU4tDbAW7Kjen7OMhEJZXfTSYl9BFbY7eVKWPYwbbwOQTKamwUB
         uU9IwiNKIK2yT08VgKQovpRIH0yZh7B60GnR3KftE8K8LUe4yZ76f8o38i19etGTBS/l
         Xbt+UtTp2RQZE7D5kdUylrI/QLASgzPcsdYVbgILIgsJ7GnaYvjWtqj3xF82+kTQ4C0R
         6X2AyvakF7KUzIGbcDDObm5An3/ZnwzcE8gVJazI4U/eEWY0bR0wMnKY2HEzl9ytgpoT
         puVBp/hoSjMPmmlavY+W0QunNZyqYbtZUdVTmcpAs4dgTC9gPlXEIvLFJ1zTnKSmiIbC
         tBaw==
X-Forwarded-Encrypted: i=1; AJvYcCVnff79opFHwvLRQKvUDdPFODMFilsnI5uYmriQFFCKS0jExbO2/FmGItQIFXDc1/v1XzwgFPvO74wMB8drtYUkABtpDlj9RT55ZiAEdH/T
X-Gm-Message-State: AOJu0YwLizVgtsX5CWrYS/nAjfRQkjGhI0h6dP0IPNL/pqoZ85uimxsk
	LyRrINsmIrtqV9M/bE6Ji5BFsXDKH0R7asPGh1qXrL/R4bhsNUtaZ0DDX/0p/l2ECOWFZBMLp3+
	361nObQnNLw1AWWQUhMGw7yKAjmcrKOE0PvgxLQ==
X-Google-Smtp-Source: AGHT+IG1fjp7xxbg2syelNzLcWdSnkAmZ5HEN4zUxVFk7Uehy8tOYpkomfU3wpTuk49Q+M+PRGzHlSGJOXy2iAV7KzU=
X-Received: by 2002:a6b:7f42:0:b0:7e1:839e:5ab3 with SMTP id
 ca18e2360f4ac-7e1b51ba8a6mr2350130739f.6.1715930398577; Fri, 17 May 2024
 00:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715708679.git.tjeznach@rivosinc.com> <518a4b0bf651707a9508c169fe3868e669ec2c6d.1715708679.git.tjeznach@rivosinc.com>
In-Reply-To: <518a4b0bf651707a9508c169fe3868e669ec2c6d.1715708679.git.tjeznach@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 17 May 2024 15:19:48 +0800
Message-ID: <CANXhq0q60CeN7nx7ubG580HgSOmPQZgu5oJLfcUf0wRhSj-z9g@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] iommu/riscv: Enable IOMMU registration and device probe.
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, 
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, 
	Lu Baolu <baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_002000_297554_3F18D667 
X-CRM114-Status: GOOD (  20.47  )
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

T24gV2VkLCBNYXkgMTUsIDIwMjQgYXQgMjoxN+KAr0FNIFRvbWFzeiBKZXpuYWNoIDx0amV6bmFj
aEByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gQWR2ZXJ0aXNlIElPTU1VIGRldmljZSBhbmQgaXRz
IGNvcmUgQVBJLgo+IE9ubHkgbWluaW1hbCBpbXBsZW1lbnRhdGlvbiBmb3Igc2luZ2xlIGlkZW50
aXR5IGRvbWFpbiB0eXBlLCB3aXRob3V0Cj4gcGVyLWdyb3VwIGRvbWFpbiBwcm90ZWN0aW9uLgo+
Cj4gUmV2aWV3ZWQtYnk6IEx1IEJhb2x1IDxiYW9sdS5sdUBsaW51eC5pbnRlbC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogVG9tYXN6IEplem5hY2ggPHRqZXpuYWNoQHJpdm9zaW5jLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jIHwgNjYgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYyBiL2RyaXZlcnMvaW9tbXUv
cmlzY3YvaW9tbXUuYwo+IGluZGV4IDNjNWE2YjQ5NjY5ZC4uYjhlMGU0YjYyNTg1IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYwo+ICsrKyBiL2RyaXZlcnMvaW9tbXUv
cmlzY3YvaW9tbXUuYwo+IEBAIC0xNyw2ICsxNyw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9pbml0
Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pb21tdS5oPgo+ICAjaW5jbHVkZSA8bGludXgva2VybmVs
Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9wY2kuaD4KPgo+ICAjaW5jbHVkZSAiaW9tbXUtYml0cy5o
Igo+ICAjaW5jbHVkZSAiaW9tbXUuaCIKPiBAQCAtMzYsNiArMzcsNjAgQEAgc3RhdGljIHZvaWQg
cmlzY3ZfaW9tbXVfZGlzYWJsZShzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSkKPiAg
ICAgICAgIHJpc2N2X2lvbW11X3dyaXRlbChpb21tdSwgUklTQ1ZfSU9NTVVfUkVHX1BRQ1NSLCAw
KTsKPiAgfQo+Cj4gK3N0YXRpYyBpbnQgcmlzY3ZfaW9tbXVfYXR0YWNoX2lkZW50aXR5X2RvbWFp
bihzdHJ1Y3QgaW9tbXVfZG9tYWluICppb21tdV9kb21haW4sCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldikKPiArewo+ICsg
ICAgICAgLyogR2xvYmFsIHBhc3MtdGhyb3VnaCBhbHJlYWR5IGVuYWJsZWQsIGRvIG5vdGhpbmcg
Zm9yIG5vdy4gKi8KPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgc3RydWN0
IGlvbW11X2RvbWFpbiByaXNjdl9pb21tdV9pZGVudGl0eV9kb21haW4gPSB7Cj4gKyAgICAgICAu
dHlwZSA9IElPTU1VX0RPTUFJTl9JREVOVElUWSwKPiArICAgICAgIC5vcHMgPSAmKGNvbnN0IHN0
cnVjdCBpb21tdV9kb21haW5fb3BzKSB7Cj4gKyAgICAgICAgICAgICAgIC5hdHRhY2hfZGV2ID0g
cmlzY3ZfaW9tbXVfYXR0YWNoX2lkZW50aXR5X2RvbWFpbiwKPiArICAgICAgIH0KPiArfTsKPiAr
Cj4gK3N0YXRpYyBpbnQgcmlzY3ZfaW9tbXVfZGV2aWNlX2RvbWFpbl90eXBlKHN0cnVjdCBkZXZp
Y2UgKmRldikKPiArewo+ICsgICAgICAgcmV0dXJuIElPTU1VX0RPTUFJTl9JREVOVElUWTsKPiAr
fQo+ICsKPiArc3RhdGljIHN0cnVjdCBpb21tdV9ncm91cCAqcmlzY3ZfaW9tbXVfZGV2aWNlX2dy
b3VwKHN0cnVjdCBkZXZpY2UgKmRldikKPiArewo+ICsgICAgICAgaWYgKGRldl9pc19wY2koZGV2
KSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIHBjaV9kZXZpY2VfZ3JvdXAoZGV2KTsKPiArICAg
ICAgIHJldHVybiBnZW5lcmljX2RldmljZV9ncm91cChkZXYpOwo+ICt9Cj4gKwo+ICtzdGF0aWMg
aW50IHJpc2N2X2lvbW11X29mX3hsYXRlKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3Qgc3RydWN0
IG9mX3BoYW5kbGVfYXJncyAqYXJncykKPiArewo+ICsgICAgICAgcmV0dXJuIGlvbW11X2Z3c3Bl
Y19hZGRfaWRzKGRldiwgYXJncy0+YXJncywgMSk7Cj4gK30KPiArCj4gK3N0YXRpYyBzdHJ1Y3Qg
aW9tbXVfZGV2aWNlICpyaXNjdl9pb21tdV9wcm9iZV9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2
KQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgaW9tbXVfZndzcGVjICpmd3NwZWMgPSBkZXZfaW9tbXVf
ZndzcGVjX2dldChkZXYpOwo+ICsgICAgICAgc3RydWN0IHJpc2N2X2lvbW11X2RldmljZSAqaW9t
bXU7Cj4gKwo+ICsgICAgICAgaWYgKCFmd3NwZWMgfHwgIWZ3c3BlYy0+aW9tbXVfZndub2RlLT5k
ZXYgfHwgIWZ3c3BlYy0+bnVtX2lkcykKPiArICAgICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIo
LUVOT0RFVik7Cj4gKwo+ICsgICAgICAgaW9tbXUgPSBkZXZfZ2V0X2RydmRhdGEoZndzcGVjLT5p
b21tdV9md25vZGUtPmRldik7Cj4gKyAgICAgICBpZiAoIWlvbW11KQo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKPiArCj4gKyAgICAgICByZXR1cm4gJmlvbW11LT5p
b21tdTsKPiArfQo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBpb21tdV9vcHMgcmlzY3ZfaW9t
bXVfb3BzID0gewo+ICsgICAgICAgLm9mX3hsYXRlID0gcmlzY3ZfaW9tbXVfb2ZfeGxhdGUsCj4g
KyAgICAgICAuaWRlbnRpdHlfZG9tYWluID0gJnJpc2N2X2lvbW11X2lkZW50aXR5X2RvbWFpbiwK
PiArICAgICAgIC5kZWZfZG9tYWluX3R5cGUgPSByaXNjdl9pb21tdV9kZXZpY2VfZG9tYWluX3R5
cGUsCj4gKyAgICAgICAuZGV2aWNlX2dyb3VwID0gcmlzY3ZfaW9tbXVfZGV2aWNlX2dyb3VwLAo+
ICsgICAgICAgLnByb2JlX2RldmljZSA9IHJpc2N2X2lvbW11X3Byb2JlX2RldmljZSwKPiArfTsK
PiArCj4gIHN0YXRpYyBpbnQgcmlzY3ZfaW9tbXVfaW5pdF9jaGVjayhzdHJ1Y3QgcmlzY3ZfaW9t
bXVfZGV2aWNlICppb21tdSkKPiAgewo+ICAgICAgICAgdTY0IGRkdHA7Cj4gQEAgLTcxLDYgKzEy
Niw3IEBAIHN0YXRpYyBpbnQgcmlzY3ZfaW9tbXVfaW5pdF9jaGVjayhzdHJ1Y3QgcmlzY3ZfaW9t
bXVfZGV2aWNlICppb21tdSkKPgo+ICB2b2lkIHJpc2N2X2lvbW11X3JlbW92ZShzdHJ1Y3Qgcmlz
Y3ZfaW9tbXVfZGV2aWNlICppb21tdSkKPiAgewo+ICsgICAgICAgaW9tbXVfZGV2aWNlX3VucmVn
aXN0ZXIoJmlvbW11LT5pb21tdSk7Cj4gICAgICAgICBpb21tdV9kZXZpY2Vfc3lzZnNfcmVtb3Zl
KCZpb21tdS0+aW9tbXUpOwo+ICB9Cj4KPiBAQCAtOTUsNSArMTUxLDE1IEBAIGludCByaXNjdl9p
b21tdV9pbml0KHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11KQo+ICAgICAgICAgICAg
ICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShpb21tdS0+ZGV2LCByYywKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgImNhbm5vdCByZWdpc3RlciBzeXNmcyBpbnRlcmZhY2Vc
biIpOwo+Cj4gKyAgICAgICByYyA9IGlvbW11X2RldmljZV9yZWdpc3RlcigmaW9tbXUtPmlvbW11
LCAmcmlzY3ZfaW9tbXVfb3BzLCBpb21tdS0+ZGV2KTsKPiArICAgICAgIGlmIChyYykgewo+ICsg
ICAgICAgICAgICAgICBkZXZfZXJyX3Byb2JlKGlvbW11LT5kZXYsIHJjLCAiY2Fubm90IHJlZ2lz
dGVyIGlvbW11IGludGVyZmFjZVxuIik7Cj4gKyAgICAgICAgICAgICAgIGdvdG8gZXJyX3JlbW92
ZV9zeXNmczsKPiArICAgICAgIH0KPiArCj4gICAgICAgICByZXR1cm4gMDsKPiArCj4gK2Vycl9y
ZW1vdmVfc3lzZnM6Cj4gKyAgICAgICBpb21tdV9kZXZpY2Vfc3lzZnNfcmVtb3ZlKCZpb21tdS0+
aW9tbXUpOwo+ICsgICAgICAgcmV0dXJuIHJjOwo+ICB9CgpSZXZpZXdlZC1ieTogWm9uZyBMaSA8
em9uZy5saUBzaWZpdmUuY29tPgoKVGhhbmtzCgo+IC0tCj4gMi4zNC4xCj4KPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
