Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE75DC27C53
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 02:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vuQBJOs7H0txKJaAMxK6QrhTEAq8NuJIuPkprfzcoNI=; b=dT0FJiVgQr6Pwh
	t7PmDDPZ2nrnwGukB6SyuXjLE4CzxhaHeYLial/qcY0Y8CPWU/J4+tgro4WxO3ZBQaGRdrjF6sIgB
	daHH2/iq31M4/Qj8dbkvVV3qpOL3qiGFnsYPCEoOZvpiEBQkSewoypIxn/Yo4OmWCVPlIRcUQ9ApF
	oMUlNGI9QGOdEFC0uUGQtDX9lppQ2mQhnW5TdKxGxA1O8IKopmLHZ5QoMxhgMOs6JqPWccuQbC6YX
	YAXODdgQ825TraW8/ihmpA56yWRioPLBIYzGrid9KwQKF21wkl6Um0On7nfAQQBrQ5/0REUT4qPxk
	kMIXJLnndp46FKlnqW0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ1u4-00000008pJJ-0Mun;
	Mon, 17 Jun 2024 02:15:28 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ1u2-00000008pIT-0JhT
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 02:15:27 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7eb7a2f062cso159524439f.0
        for <linux-riscv@lists.infradead.org>; Sun, 16 Jun 2024 19:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718590523; x=1719195323; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33+gUd0BUh5twg7E+FkXYihWtxidn7jwrrmJRG8qvzY=;
        b=AmJScrkkWvjY8p+XonPU+gdgjsC4xdOqGYnN889EJXXGfPOGhsW6reu+1ULlK83gZj
         /aLwjAqOfdM8f7oaePrRYT/RFme1xEUiFoDoQt48UnyHoaRD68MT7+ViveEDlirEZoAx
         JemEsayF2FI9SDdTpoxH/uiAnjLz1zH/AmkUzUuJsiRg7543iP8OOZ3qHDu4fSmxoX8V
         2Oa0wTHQAjXuJ/y3Sary4sk2DHfaWXTNihBLCBC38u1QlQVVCSUjfApDOznUnF26sRZQ
         XAXXmvGGnymvLGTiCk7VEEiqR8OczNpBnJPOrk8vR2KykfKTv5BLT5yB57omMN4DE0SV
         RG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718590523; x=1719195323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33+gUd0BUh5twg7E+FkXYihWtxidn7jwrrmJRG8qvzY=;
        b=JlEaLCv8SZA+iW+kkTewrAPu0DYP9q//zm0HM6JyMQngTE3AHXMptIdcVqa34syRMV
         zhW3AiWzZc6JPOG4RFQzW0r0tHCbsx9r3mHnlVTHgZp12IQRDNpdjD1IX9fA2MlmDx0e
         VfnQ+JmXQ8PnKGbtcyiwrhsC6EuyCqJ+Pw0tz4EMxbAf87kX3RC/++MHUvpJALXNg5ei
         v7Nt9A79rAPvU5ByazD3SUs2GvnZ0wyDowE4GZOUvwH2kgvf5dobjbXnnP+jgDMve26E
         NQObUyfpERPFK1q4Zlj1Eh/9oozFMnR17QyDOqMwJw+IvM5/9195nU+o6kFrc5CqCAgZ
         wVvA==
X-Forwarded-Encrypted: i=1; AJvYcCWRfza+lOzvc+sUzXsN7Zdruq5T8bFzuWFAjdL2HlD0JP565JitAvY8tgAMc9eVX50vWCQpQg5ErT3BsbNAVtQN0+43Xd/H0ggt8Sq4YZxE
X-Gm-Message-State: AOJu0YwgzrT8luOrQDd08XD1yPWEx+nBrLPtELNhcSNP3nKyqRs9xCzv
	eU6A/pJQGKcN9Az3BetYvdDIt5sBD+FCV5Qb2ZuJzpEseykKOrDJeqPtHTjdU9PNoRoLKvSLU7S
	Wax138fgvve6p8T+KllrIobufgVT2f4dI801lXw==
X-Google-Smtp-Source: AGHT+IEXfvyKaGcOxkCTeIcxMYWxqVnan6HZPo3dOL51Q5uIxGPz0RzQEZinChIpjeGp349yqoA/StIWD6aWJiVwPU8=
X-Received: by 2002:a05:6602:1549:b0:7eb:c972:dee2 with SMTP id
 ca18e2360f4ac-7ebeb4923c5mr971786539f.3.1718590523416; Sun, 16 Jun 2024
 19:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240614142156.29420-1-zong.li@sifive.com> <20240614142156.29420-10-zong.li@sifive.com>
 <ZmyIASyk5pfm8hwa@Asurada-Nvidia>
In-Reply-To: <ZmyIASyk5pfm8hwa@Asurada-Nvidia>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 17 Jun 2024 10:15:12 +0800
Message-ID: <CANXhq0psbMY7B=wBL_K8b5rnsfWaBJk+Ea49BpvLO8Sfwwyz7g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 09/10] iommu/dma: Support MSIs through nested domains
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgg@ziepe.ca, kevin.tian@intel.com, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_191526_222166_40954DE5 
X-CRM114-Status: GOOD (  15.23  )
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

T24gU2F0LCBKdW4gMTUsIDIwMjQgYXQgMjoxMuKAr0FNIE5pY29saW4gQ2hlbiA8bmljb2xpbmNA
bnZpZGlhLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1biAxNCwgMjAyNCBhdCAxMDoyMTo1NVBN
ICswODAwLCBab25nIExpIHdyb3RlOgo+ID4gRnJvbTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJw
aHlAYXJtLmNvbT4KPiA+Cj4gPiBDdXJyZW50bHksIGlvbW11LWRtYSBpcyB0aGUgb25seSBwbGFj
ZSBvdXRzaWRlIG9mIElPTU1VRkQgYW5kIGRyaXZlcnMKPiA+IHdoaWNoIG1pZ2h0IG5lZWQgdG8g
YmUgYXdhcmUgb2YgdGhlIHN0YWdlIDIgZG9tYWluIGVuY2Fwc3VsYXRlZCB3aXRoaW4KPiA+IGEg
bmVzdGVkIGRvbWFpbi4gVGhpcyB3b3VsZCBiZSBpbiB0aGUgbGVnYWN5LVZGSU8tc3R5bGUgY2Fz
ZSB3aGVyZSB3ZSdyZQo+ID4gdXNpbmcgaG9zdC1tYW5hZ2VkIE1TSXMgd2l0aCBhbiBpZGVudGl0
eSBtYXBwaW5nIGF0IHN0YWdlIDEsIHdoZXJlIGl0IGlzCj4gPiB0aGUgdW5kZXJseWluZyBzdGFn
ZSAyIGRvbWFpbiB3aGljaCBvd25zIGFuIE1TSSBjb29raWUgYW5kIGhvbGRzIHRoZQo+ID4gY29y
cmVzcG9uZGluZyBkeW5hbWljIG1hcHBpbmdzLiBIb29rIHVwIHRoZSBuZXcgb3AgdG8gcmVzb2x2
ZSB3aGF0IHdlCj4gPiBuZWVkIGZyb20gYSBuZXN0ZWQgZG9tYWluLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBOaWNvbGluIENoZW4gPG5pY29saW5jQG52aWRpYS5jb20+Cj4KPiBJIHRoaW5rIHRoZXJl
IHNob3VsZCBiZSB5b3VyIFNpZ25lZC1vZmYgbGluZSBhdCB0aGUgZW5kIHNpbmNlIHlvdQo+IGFj
dCBhcyBhIHN1Ym1pdHRlciA6KQoKR290IGl0LCBhZGQgaXQgaW4gdGhlIG5leHQgdmVyc2lvbiwg
dGhhbmtzLgoKPgo+IFRoYW5rcwo+IE5pY29saW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
