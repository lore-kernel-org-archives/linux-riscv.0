Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A3EC04A94
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 23:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zkxZoN7GLZ4ttRYWejvEZV+hZsYiZj2BnWYB5k+xaOw=; b=aMlpykui33C5Qt
	JnuGvAEQYaeo286ZpTXrLG4UBGv3L0ddOkgmcmV4nqJNsjBYe7r/JXRwKVVuQ3GgBJIYsGe1VC9nL
	1Ce2Ojwlsh/XIbQv0ddGNwcKv0aj5i2FlQJkXasY7bm4PK2NllD+CQE5vcCQjroO01OSMSRDQfAUA
	s1VgjnWWI5DMXC16BuN+WJYjMu8tgJP3rrvVRr0YjDt0RBF2KnJr6tvL+QsghKja1kejRflcLDFY6
	i74wyS4pHd7zjqqR+aYgw3XEsrWNZ0rtYbXCjFSPMNIJjIHGc/Lg1J+/hj8etYhM8fjpDyEjXcKWC
	Zq4JTRIH3gOEeoeoDmUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUFXT-008wVw-1H;
	Thu, 10 Aug 2023 23:57:59 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUFXP-008wTZ-1g
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 23:57:56 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99bdf08860dso544575966b.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 16:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691711868; x=1692316668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhMgA7qBPuApMhQ4h1vJKFRA4DNp+2B2aFxUktI7jpQ=;
        b=fSbsTlZ9eRUEq1oc0qlT9VA71infat9B81M3qAFGPQLw+6DiL/k6IQBVuLqYpfm6zc
         JPbbQuf/OXWE0DDR3Vty3P+Ga7xRDAZJPbwv8Rh6DllYU5zj15degN0az+fa1E+ZZKui
         Zid/yQ06BXhwoDugW7aU7NJA5d/c3xUSIByYDVFEbgx0r3ZtD20CbtxCBNcFSIJefMq1
         tRA4cZrI4/sEiaraxlYyAq+sL65bMfdUmaPLsXuLObrwqiszX5v1AaY8IXbz4ltMaoUI
         FDZXJTolroDTYu55EKXzdNQ57eJWghsSQRQDYygik7m8uY2F9+yL1a51YFkAYkFi+S2u
         5sVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691711868; x=1692316668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhMgA7qBPuApMhQ4h1vJKFRA4DNp+2B2aFxUktI7jpQ=;
        b=XDM6gzTFAiDGjsbXHDR7ACssQBTdtyydazYqUQjj5AKnr3E+M6/yHuDxooMntvOgMX
         yVkda8DcR1fKgtvS5XZzHCaXloPFO/D1GAPMmCFy69Fa02NoxUEpfqKDz3zAFevMzQ6a
         UQAGKcOvv+VU3dq/N6kK9ffmKlZXCikH/5cSjywdmKxQS34k6GfUPlVfHI1tpUY+4Qdc
         2Wvw5LsncWObm79X3yald3nIcX2gZbHslqyGNPD3W2KIH5N80QSvz63H9rkzoePbk0Z5
         c7/6xHy365utsam5IpeSO3GFmHyHTG+TmXlEz6o+BJuIhXYAdJ+9ODdjp5LSW2/dbcAu
         Pz9A==
X-Gm-Message-State: AOJu0Yxq3NEfqGSwbnzB87HmQ7oGTg2qBF62Ty8P2hp8kC0brmdCnNho
	4myHVztE6PWRydnC1vT4xiWXOO2ulqKstAq6AjTWWQ==
X-Google-Smtp-Source: AGHT+IExGyX6IQpw7nkPj/Oj8ZdeERAHUNFikZIEbAqLbQU3zHzZ+Xb2mqkLRl/UdYIm3ylJUJ+cypBkqHv5r6CLu/8=
X-Received: by 2002:a17:906:1d1:b0:99c:55c5:1c6e with SMTP id
 17-20020a17090601d100b0099c55c51c6emr519636ejj.8.1691711867870; Thu, 10 Aug
 2023 16:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230718234512.1690985-13-seanjc@google.com> <diqzv8dq3116.fsf@ackerleytng-ctop.c.googlers.com>
 <ZNKv9ul2I7A4V7IF@google.com>
In-Reply-To: <ZNKv9ul2I7A4V7IF@google.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Thu, 10 Aug 2023 16:57:36 -0700
Message-ID: <CAGtprH9YE50RtqhW-U+wK0Vv6aKfqqtOPn8q4s8or=UZwPXZoA@mail.gmail.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To: Sean Christopherson <seanjc@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>, pbonzini@redhat.com, maz@kernel.org, 
	oliver.upton@linux.dev, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, willy@infradead.org, akpm@linux-foundation.org, 
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chao.p.peng@linux.intel.com, tabba@google.com, jarkko@kernel.org, 
	yu.c.zhang@linux.intel.com, mail@maciej.szmigiero.name, vbabka@suse.cz, 
	david@redhat.com, qperret@google.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_165755_557769_48859FEA 
X-CRM114-Status: GOOD (  12.07  )
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

T24gVHVlLCBBdWcgOCwgMjAyMyBhdCAyOjEz4oCvUE0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+IC4uLgoKPiA+ICsgV2hlbiBiaW5kaW5nIGEgbWVtc2xv
dCB0byB0aGUgZmlsZSwgaWYgYSBrdm0gcG9pbnRlciBleGlzdHMsIGl0IG11c3QKPiA+ICAgYmUg
dGhlIHNhbWUga3ZtIGFzIHRoZSBvbmUgaW4gdGhpcyBiaW5kaW5nCj4gPiArIFdoZW4gdGhlIGJp
bmRpbmcgdG8gdGhlIGxhc3QgbWVtc2xvdCBpcyByZW1vdmVkIGZyb20gYSBmaWxlLCBOVUxMIHRo
ZQo+ID4gICBrdm0gcG9pbnRlci4KPgo+IE51bGxpZnlpbmcgdGhlIEtWTSBwb2ludGVyIGlzbid0
IHN1ZmZpY2llbnQsIGJlY2F1c2Ugd2l0aG91dCBhZGRpdGlvbmFsIGFjdGlvbnMKPiB1c2Vyc3Bh
Y2UgY291bGQgZXh0cmFjdCBkYXRhIGZyb20gYSBWTSBieSBkZWxldGluZyBpdHMgbWVtc2xvdHMg
YW5kIHRoZW4gYmluZGluZwo+IHRoZSBndWVzdF9tZW1mZCB0byBhbiBhdHRhY2tlciBjb250cm9s
bGVkIFZNLiAgT3IgbW9yZSBsaWtlbHkgd2l0aCBURFggYW5kIFNOUCwKPiBpbmR1Y2UgYmFkbmVz
cyBieSBjb2VyY2luZyBLVk0gaW50byBtYXBwaW5nIG1lbW9yeSBpbnRvIGEgZ3Vlc3Qgd2l0aCB0
aGUgd3JvbmcKPiBBU0lEL0hLSUQuCj4KClREWC9TTlAgaGF2ZSBtZWNoYW5pc21zIGkuZS4gUEFN
VC9STVAgdGFibGVzIHRvIGVuc3VyZSB0aGF0IHRoZSBzYW1lCm1lbW9yeSBpcyBub3QgYXNzaWdu
ZWQgdG8gdHdvIGRpZmZlcmVudCBWTXMuIERlbGV0aW5nIG1lbXNsb3RzIHNob3VsZAphbHNvIGNs
ZWFyIG91dCB0aGUgY29udGVudHMgb2YgdGhlIG1lbW9yeSBhcyB0aGUgRVBUIHRhYmxlcyB3aWxs
IGJlCnphcHBlZCBpbiB0aGUgcHJvY2VzcyBhbmQgdGhlIGhvc3Qgd2lsbCByZWNsYWltIHRoZSBt
ZW1vcnkuCgpSZWdhcmRzLApWaXNoYWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
