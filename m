Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC81C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 05:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DMcW805vj3KD2oI1u4+iDpEkGbIaobHLzcubmpdxtpA=; b=C3XQzoK9vC22j6
	sSes9B5Hol2rvE95jGhtedQqE9/nfvZHr3+p3Cj18fDiNrQbuRalB8HNDoxOOMTBZfjy88qEVDaOZ
	FJKR4J/P6q1EmYwjwU+Gz7UZ4O30WLaxpNoGMEZ7godTOyGmr31uVuBiGlV6hI0oY/0YiQspFynVO
	EKBFoHjPlziP0PTSpZQcGgz1oM7rJs89uGBSdwvvWZdQJf7Wpvvv98/BHOzIZNsxdBG6cKx2qCMOo
	YKpVtyC0wCvycrUK+iyeQxxtI7xuJoCIhSxzphIL4qh6EqaN/sq7rWp0djbAIG56bIP8rwE7F0Jxk
	1EcTyBxlN8RjS6SfWYdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rymAv-0000000C6Ns-2QOv;
	Mon, 22 Apr 2024 05:25:09 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rymAt-0000000C6LP-07KR
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 05:25:08 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-36b309dd33bso15818885ab.1
        for <linux-riscv@lists.infradead.org>; Sun, 21 Apr 2024 22:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1713763503; x=1714368303; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dF7iMXOY4VDDCKv5qNAPNo7XCDSpEYvkOWLnZnfiQso=;
        b=cpwZdF8IRIFPHwqH2r1SOQ7UoIsmn9KlDmSNorIYdcuvQFrY+125aU+1JtuDeWBVvj
         LIJqDwRUr9oa4JhAj//R16D0B5eamtdi/UNffC3bDOBARVRzQGgR/cYwB7Fc1b/LF6G+
         wOQYzee/LqTSGqqBrf70zzZUeirdE7ZPWWhFvMQXaCy5YfN1aI1A4UTLA1V2DAoxMuOq
         yNlyWt6cxRaVDK9pYqRU9DhyLrqnzdA2vCYfj+kvnk96scLL9gyas1eq51bO6c3K2pbn
         rjLpZPhCUNeIiC2raupuNdMA2XuZ4XEPK6Z41W0462/aIc0c3mwSYt6/AQRy8Bwsw0SM
         dw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713763503; x=1714368303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dF7iMXOY4VDDCKv5qNAPNo7XCDSpEYvkOWLnZnfiQso=;
        b=A3FqjA546yFNHYGHPr67draKmnUHW3P9Nxo6JkND3hsBNf5nV3jnMXeNJYJZQl2zNm
         /FQ5ivLym4mZnsJK9hsohfNIkiTlBgdQH693jrHjzRRaycbMA7/rMInyJIdbCEcuyGSX
         yZFr5xscDdKdvnNLB/H/n9qeld7Z4KQovqV2pLnlqBij4yRkdJLqMAKJl4DTymPTP5j4
         KRLKNJEHle1YkPt3GvY5wAOSpWQGmMzLA4PZlCaR4bNWRZlyqReNoOlbxLwOMNwyOhhW
         17Te0oKSvqFn4B/pfcktOiIDNYxu60Io8Ubx3yrM3YA/axnkGdb9cjfIOaXUtpCyPr+G
         e5GA==
X-Forwarded-Encrypted: i=1; AJvYcCWhCX6rI4iNd1thLOgZdYCiSJY7Fkj3P0d8xTuQftI5TP6/6WLPhuI7sgK/ZnKiLT4ThS6oFJpbTzr66dS9rGABxQTuMd7tAlhm7qYEWTL0
X-Gm-Message-State: AOJu0YwBCPwHgaBMTRziMbOewdbH+wTcAp7n5MxMogFYA9Yvtf5gxd7f
	pn7nueqRIEjzGww6foFTzWNFG/gFbNdawBiiJcPGqzV1DDiBihek5X8WyaDXiF2cLgRTpjNW5YW
	6TRkIp/VV6qe9JzOntdN4ZtY8z3XMOfOmnamh+Q==
X-Google-Smtp-Source: AGHT+IHdn2npWqT6eXE8OXOJ8aeE+1uvyLE2k3jLpLR2kMrW4luyMtoF2cYuLh1aaMn2GPPBLemb20goD4jLZbNz7Kk=
X-Received: by 2002:a05:6e02:152e:b0:36c:a46:e018 with SMTP id
 i14-20020a056e02152e00b0036c0a46e018mr5159166ilu.24.1713763503545; Sun, 21
 Apr 2024 22:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240420151741.962500-1-atishp@rivosinc.com> <20240420151741.962500-11-atishp@rivosinc.com>
In-Reply-To: <20240420151741.962500-11-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Apr 2024 10:54:52 +0530
Message-ID: <CAAhSdy34VhGY3v9h3cw167MafKHOF1dL6zqB7Wi6A9Z4fo7ZNg@mail.gmail.com>
Subject: Re: [PATCH v8 10/24] RISC-V: KVM: Fix the initial sample period value
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, samuel.holland@sifive.com, 
	Conor Dooley <conor.dooley@microchip.com>, Juergen Gross <jgross@suse.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	Will Deacon <will@kernel.org>, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_222507_090218_695551D8 
X-CRM114-Status: GOOD (  14.48  )
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

T24gU2F0LCBBcHIgMjAsIDIwMjQgYXQgNToxOOKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoZSBpbml0aWFsIHNhbXBsZSBwZXJpb2QgdmFsdWUgd2hl
biBjb3VudGVyIHZhbHVlIGlzIG5vdCBhc3NpZ25lZAo+IHNob3VsZCBiZSBzZXQgdG8gbWF4aW11
bSB2YWx1ZSBzdXBwb3J0ZWQgYnkgdGhlIGNvdW50ZXIgd2lkdGguCj4gT3RoZXJ3aXNlLCBpdCBt
YXkgcmVzdWx0IGluIHNwdXJpb3VzIGludGVycnVwdHMuCj4KPiBSZXZpZXdlZC1ieTogQW5kcmV3
IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQ
YXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlz
Y3Yva3ZtL3ZjcHVfcG11LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11
LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4gaW5kZXggODYzOTFhNTA2MWRkLi5jZWUx
YjljYTRlYzQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYwo+ICsrKyBi
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiBAQCAtMzksNyArMzksNyBAQCBzdGF0aWMgdTY0
IGt2bV9wbXVfZ2V0X3NhbXBsZV9wZXJpb2Qoc3RydWN0IGt2bV9wbWMgKnBtYykKPiAgICAgICAg
IHU2NCBzYW1wbGVfcGVyaW9kOwo+Cj4gICAgICAgICBpZiAoIXBtYy0+Y291bnRlcl92YWwpCj4g
LSAgICAgICAgICAgICAgIHNhbXBsZV9wZXJpb2QgPSBjb3VudGVyX3ZhbF9tYXNrICsgMTsKPiAr
ICAgICAgICAgICAgICAgc2FtcGxlX3BlcmlvZCA9IGNvdW50ZXJfdmFsX21hc2s7Cj4gICAgICAg
ICBlbHNlCj4gICAgICAgICAgICAgICAgIHNhbXBsZV9wZXJpb2QgPSAoLXBtYy0+Y291bnRlcl92
YWwpICYgY291bnRlcl92YWxfbWFzazsKPgo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
