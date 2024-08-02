Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB77C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 11:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X89T1PGMmozjyhEsI9lRhklNkiMcmfDauznUqxz4eZk=; b=t6YbOBdl6qdr/0
	M6t+TRXm1NBsNQLkQxgZTmPjFXYyIr+GvOECzinlY5MwplEDAxF4y1AJyPzirZbucJowHP01WoGeV
	tnEpKdDM9caoRxfKlLn/5p2lh4PZy1zBG6TKuNaenzo1ykSsZB/ykuPB0NobyNZxMXkA2WnBuA+BG
	pOCYciHT44xM6T4Gb51Ra0fAoXBUhnKPpui1rNAsQ5WbvEJUdk7syrBaFNAU7hhoPU6+JaKeIw0CN
	XtVQzy+Q8Be6Yoho4pMlUohm6D/q3vErxF3sMCzMc/vypSj6r4uTbonA/THMUdc8+WUVX3RQRDxFH
	UE4ANUkVI7a7yIHmG3gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZqHA-00000008epx-2nnq;
	Fri, 02 Aug 2024 11:16:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZqGk-00000008em2-2Ftd
	for linux-riscv@bombadil.infradead.org;
	Fri, 02 Aug 2024 11:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=h+a+YbUYnYp2O9o3vDX++ZHVr+zNy81A/L7Ak8HFY0M=; b=dioBbhPv3vYx9xVd+Rdii9bsmT
	KswL30jixcsF8uAie0mfO+VhfMHn0I5aecG/XQsgmzPMfgrPf9fDvZb5R0nW1zwucnjpYItfFkSBP
	KfkDgXzJi+x+tIADcuIVQwL0y5kkWhMyf1YsopdaWLWk2Q/rfhQCBsUXtG0o4x1S7vLqK8laKbrGq
	ZX5GSEpPj087LEHKF7s8kWD+CCkE7fnKlIfr0BMEe4U9Tq9VMQf2TsQf4wuccgmayUkQauPfwQvVD
	ZxV1mJDGd0FKACSlipeAThfuHQvJYkmv3TLtydQ0K2+yocyI+7KNCtluf9q9BSqZWhs9fyIGgZkpt
	IwhERx4A==;
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZqGe-00000005hFn-0JGK
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 11:16:19 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5af326eddb2so5439390a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 04:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722597373; x=1723202173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+a+YbUYnYp2O9o3vDX++ZHVr+zNy81A/L7Ak8HFY0M=;
        b=VDoRNTOKWDq+Gm0pGh7aomfJAtwZ4TdRCphgFD5P4W/qHC3nOB4N/dHdl++v5dwcwz
         5mIisTL2szL5Bhf2A4Yx2qYb8QOCkFwoRO0jYijQqmY1MyJM5XxAnMvn+Cw+Hp9/Sn3M
         TvkKNeZ6cvpC1knc2FCaxYwbwZ1PPb9VclNZucZWDA0w3rkPsspLrZFToAapmK/lq/io
         bTz+6eQV7xBHSRjDOg81C2T6E0epJ0IBRVYA4kNmpZpuVKLa+lBJ1WcUG/mEbsX6JHl+
         3hTiJE5EFsnoTrMW3iianX2P9bALRn7/NOApV9DhKoa+1oicl9Pc2CxaqSm7ePflRr/J
         4lpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722597373; x=1723202173;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+a+YbUYnYp2O9o3vDX++ZHVr+zNy81A/L7Ak8HFY0M=;
        b=G7ud+4HKkZP6XkP7m007HrNNa1GIQNE60JPhUxdCOwN3rFTJ/3gsTZPNEdGkXoCtyP
         WuDx6uolpjZuVQQ76ZfOPwSIwNRtx32scRmsgGBXtvfYlMqpBfSsYGMcfG9yuzTawGQM
         9oKi6njOtfmWg0uaIU/j0TwVYAd0ViLgeboNRVkCRH8WIBWVnFh5QFSbCoxIgd4RPFJu
         PAcIO9h7594vLt9akThmZmFZ9frSh2krrjFqzU0XkPSWxKU/fLlo2+DIRCJHdFzhX9kO
         02HbsM0Lz80pKc+bQeborDBsZaAFYPu8Yy9DwhWiK0zSUwoEd0AumHPkcNPaNF9XKzLJ
         A1Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUdnZdRRgRAi25w5vsNSPY4VvPP02aJPYeDCpnenDxd+DDQAIymZ2MSGybwk8/uyQ8PBx7FILBbVnnuqm7RCCfaxOvnlRVvBUGLi50IyCnR
X-Gm-Message-State: AOJu0Yw5B1IxI26ILnWbxk2G2JLhsiwFGvgN7rI3cUuSCdW/zba37Up0
	cwGXHE6g/2XVL90ErVEjXoFBempThqnLnt6jjXh/oTL8TS4HaRNbwnX9d73Jko8=
X-Google-Smtp-Source: AGHT+IHUr2+eigMQMyKiFV2SC/+LcUpbtIeuSXGg+vhEQqD67tJuIK6amWVCFT4RRO+CzEGYIGxtXA==
X-Received: by 2002:a17:907:25c5:b0:a7a:acae:340b with SMTP id a640c23a62f3a-a7dc628bf8fmr256404766b.31.1722597372903;
        Fri, 02 Aug 2024 04:16:12 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bcb19csm87224666b.42.2024.08.02.04.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 04:16:08 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 91DEE5F8A9;
	Fri,  2 Aug 2024 12:16:04 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Marc Zyngier <maz@kernel.org>,
  Oliver Upton <oliver.upton@linux.dev>,  Tianrui Zhao
 <zhaotianrui@loongson.cn>,  Bibo Mao <maobibo@loongson.cn>,  Huacai Chen
 <chenhuacai@kernel.org>,  Michael Ellerman <mpe@ellerman.id.au>,  Anup
 Patel <anup@brainfault.org>,  Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
  Christian Borntraeger <borntraeger@linux.ibm.com>,  Janosch Frank
 <frankja@linux.ibm.com>,  Claudio Imbrenda <imbrenda@linux.ibm.com>,
  kvm@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  kvmarm@lists.linux.dev,  loongarch@lists.linux.dev,
  linux-mips@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
  kvm-riscv@lists.infradead.org,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  David Matlack <dmatlack@google.com>,
  David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v12 11/84] KVM: Rename gfn_to_page_many_atomic() to
 kvm_prefetch_pages()
In-Reply-To: <20240726235234.228822-12-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:20 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-12-seanjc@google.com>
Date: Fri, 02 Aug 2024 12:16:04 +0100
Message-ID: <87frrncgzv.fsf@draig.linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_121617_510967_84FF0887 
X-CRM114-Status: GOOD (  12.64  )
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

U2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+IHdyaXRlczoKCj4gUmVuYW1l
IGdmbl90b19wYWdlX21hbnlfYXRvbWljKCkgdG8ga3ZtX3ByZWZldGNoX3BhZ2VzKCkgdG8gdHJ5
IGFuZAo+IGNvbW11bmljYXRlIGl0cyB0cnVlIHB1cnBvc2UsIGFzIHRoZSAiYXRvbWljIiBhc3Bl
Y3QgaXMgZXNzZW50aWFsbHkgYQo+IHNpZGUgZWZmZWN0IG9mIHRoZSBmYWN0IHRoYXQgeDg2IHVz
ZXMgdGhlIEFQSSB3aGlsZSBob2xkaW5nIG1tdV9sb2NrLgoKSXQncyBuZXZlciB0b28gbGF0ZSB0
byBzdGFydCBhZGRpbmcgc29tZSBrZG9jIGFubm90YXRpb25zIHRvIGEgZnVuY3Rpb24KYW5kIHJl
bmFtaW5nIGEga3ZtX2hvc3QgQVBJIGNhbGwgc2VlbXMgbGlrZSBhIGdvb2QgdGltZSB0byBkbyBp
dC4KCj4gRS5nLiBldmVuIGlmIG1tdV9sb2NrIHdlcmVuJ3QgaGVsZCwgS1ZNIHdvdWxkbid0IHdh
bnQgdG8gZmF1bHQtaW4gcGFnZXMsCj4gYXMgdGhlIGdvYWwgaXMgdG8gb3Bwb3J0dW5pc3RpY2Fs
bHkgZ3JhYiBzdXJyb3VuZGluZyBwYWdlcyB0aGF0IGhhdmUKPiBhbHJlYWR5IGJlZW4gYWNjZXNz
ZWQgYW5kL29yIGRpcnRpZWQgYnkgdGhlIGhvc3QsIGFuZCB0byBkbyBzbyBxdWlja2x5Lgo+Cj4g
U2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4g
LS0tCjxzbmlwPgoKLyoqCiAqIGt2bV9wcmVmZXRjaF9wYWdlcygpIC0gb3Bwb3J0dW5pc3RpY2Fs
bHkgZ3JhYiBwcmV2aW91c2x5IGFjY2Vzc2VkIHBhZ2VzCiAqIEBzbG90OiB3aGljaCBAa3ZtX21l
bW9yeV9zbG90IHRoZSBwYWdlcyBhcmUgaW4KICogQGdmbjogZ3Vlc3QgZnJhbWUKICogQHBhZ2Vz
OiBhcnJheSB0byByZWNlaXZlcyBwYWdlIHBvaW50ZXJzCiAqIEBucl9wYWdlczogbnVtYmVyIG9m
IHBhZ2VzCiAqCiAqIFJldHVybnMgdGhlIG51bWJlciBvZiBwYWdlcyBhY3R1YWxseSBtYXBwZWQu
CiAqLwoKPwoKPiAgCj4gLWludCBnZm5fdG9fcGFnZV9tYW55X2F0b21pYyhzdHJ1Y3Qga3ZtX21l
bW9yeV9zbG90ICpzbG90LCBnZm5fdCBnZm4sCj4gLQkJCSAgICBzdHJ1Y3QgcGFnZSAqKnBhZ2Vz
LCBpbnQgbnJfcGFnZXMpCj4gK2ludCBrdm1fcHJlZmV0Y2hfcGFnZXMoc3RydWN0IGt2bV9tZW1v
cnlfc2xvdCAqc2xvdCwgZ2ZuX3QgZ2ZuLAo+ICsJCSAgICAgICBzdHJ1Y3QgcGFnZSAqKnBhZ2Vz
LCBpbnQgbnJfcGFnZXMpCj4gIHsKPiAgCXVuc2lnbmVkIGxvbmcgYWRkcjsKPiAgCWdmbl90IGVu
dHJ5ID0gMDsKPiBAQCAtMzA3NSw3ICszMDc1LDcgQEAgaW50IGdmbl90b19wYWdlX21hbnlfYXRv
bWljKHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QsIGdmbl90IGdmbiwKPiAgCj4gIAlyZXR1
cm4gZ2V0X3VzZXJfcGFnZXNfZmFzdF9vbmx5KGFkZHIsIG5yX3BhZ2VzLCBGT0xMX1dSSVRFLCBw
YWdlcyk7Cj4gIH0KPiAtRVhQT1JUX1NZTUJPTF9HUEwoZ2ZuX3RvX3BhZ2VfbWFueV9hdG9taWMp
Owo+ICtFWFBPUlRfU1lNQk9MX0dQTChrdm1fcHJlZmV0Y2hfcGFnZXMpOwo+ICAKPiAgLyoKPiAg
ICogRG8gbm90IHVzZSB0aGlzIGhlbHBlciB1bmxlc3MgeW91IGFyZSBhYnNvbHV0ZWx5IGNlcnRh
aW4gdGhlIGdmbiBfbXVzdF8gYmUKCi0tIApBbGV4IEJlbm7DqWUKVmlydHVhbGlzYXRpb24gVGVj
aCBMZWFkIEAgTGluYXJvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
