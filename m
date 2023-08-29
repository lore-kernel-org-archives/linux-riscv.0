Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8380EC6FA8F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 05:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LwbeOiNOwQmwWwIZGYs7B8SSj/Z26KJr2lRgbG2JiH0=; b=zyR6vbBHAJ/E7k
	ggASFb0fXnRByiMrekYdNnVKhgU+KcuguldLy8qWALpS4K970xOttKskG4fGIpBda9n+giJYCV6j8
	NHt5uSodEnRBvsWAhurJ01jlWqFr21Y/kSGmq17x57NMCI+zn96LfaSk4Wb3TZMOs83pmEFjhhg5X
	0PZwUqgqQODHl/oxROiPNW08fq7smrOvzAbyPUYtkhW+yg1n54N9zS7Y5X1MHMQ09TzjSrk+/mcLZ
	nwcajcs6ls4JK386E5tm659FzENXsageues4vrky2QUfRSKptxY6Sm+WFaACnhdxN6XXfGmA+p2bD
	k+5zQ1zYWHnQUVqW2Cvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaqu4-00AmvU-3D;
	Tue, 29 Aug 2023 05:04:36 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaqu1-00Amul-34;
	Tue, 29 Aug 2023 05:04:35 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2bcb89b4767so59736211fa.3;
        Mon, 28 Aug 2023 22:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693285470; x=1693890270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxcmj7xCzomnU3k6tUiu3yMWfFqSb6wL7/6uLA5izWE=;
        b=jgkM3PsZPP3wztXEocbp+zXIzb0LypBxBeRDKQP740f+n4AWGE7pSMiKuL9077Ghzi
         KPKAbmJhYdv4OgFamcusrYpIp+obr20y8Y7frYh2CEKFzBIo2Ga+2Q439SVxwXkd9fEs
         nTCfdJ2NrbMU6aYKDpl1pY0qc9kGeSRLYbnroGoTAesjoe5ul8tKWcEms269cAvjODmx
         wvGsq9kSTiIQTHemOG3gGvWLTdDf+caXFq9IHh/cJljQcSGJPevZjre6KMiR3DWOlt4h
         x7yeQmOeRlyjFngHEOWgCGE0+cLm/MzwOAawZWauFqZ2u+pU04xdz5/o4bzUpiC9xIv2
         zcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693285470; x=1693890270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxcmj7xCzomnU3k6tUiu3yMWfFqSb6wL7/6uLA5izWE=;
        b=Ls1abGEb41K6QwZCNP1/5mpPZWr5kxSip1r3Q3rvE49ZAtsjUqt5sY4un6KqNoIF7H
         IXmVrLDUlkA98t5sb/gnRrwAiny/66TZUcFpi+NSv4P/8STh3XJsVF+IDKdOMcYAwNkb
         e2qDdA7nOroh6X6w0V+8DPvqSQy+257S1KHFlHlLTym8hqI9B1QET8SQnTUFJhcNwN5N
         GUxrC7XiaqxjaWG0m/Fmfy64UQnjgvyZMwe83kBWUSJan0EFedhDufh8OzdpZM2KVj1C
         MyHe0jhDz2fGfdjmd3UQ1Uffi25sXsRRirDYclLEHvI8WBbBSU91+449/N1qfI8Y2TCq
         q4iA==
X-Gm-Message-State: AOJu0Ywv4+2saHTGFwOI/Msxt1VMxqj4Xt9+3Vs6gt7d+ERmpAzvUQ5s
	7IsqPkeOIGQv7exTqTXygBW/XkDCZnDwnVqrC84=
X-Google-Smtp-Source: AGHT+IFNMRSxgCv4AVg1hsluIhhbouSX6xEcacWfCeMyEZSelkwA1zKmgfTWPMugMsR1q5rWCG7dbiInjiJtz+wZjys=
X-Received: by 2002:a2e:9007:0:b0:2b9:e701:ac48 with SMTP id
 h7-20020a2e9007000000b002b9e701ac48mr23022126ljg.32.1693285469812; Mon, 28
 Aug 2023 22:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690364259.git.haibo1.xu@intel.com> <ZMrVrXlvu/FJEayx@google.com>
 <CAJve8onbxHjJoC-k-TtOm1BBtjm38moaW-Kk8siKsxt9nwZZZw@mail.gmail.com> <ZOyqRfdvxpdtSE1c@google.com>
In-Reply-To: <ZOyqRfdvxpdtSE1c@google.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Tue, 29 Aug 2023 13:04:18 +0800
Message-ID: <CAJve8o=rFrVKxpaLLaJ8_KKQxMvyOOgVJn8qk715ymH8dpQ3MA@mail.gmail.com>
Subject: Re: [PATCH 0/4] RISCV: Add kvm Sstc timer selftest
To: Sean Christopherson <seanjc@google.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Marc Zyngier <maz@kernel.org>, 
	Andrew Jones <andrew.jones@linux.dev>, Vishal Annapurve <vannapurve@google.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_220434_014239_F81C0768 
X-CRM114-Status: GOOD (  18.55  )
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

T24gTW9uLCBBdWcgMjgsIDIwMjMgYXQgMTA6MDjigK9QTSBTZWFuIENocmlzdG9waGVyc29uIDxz
ZWFuamNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBTdW4sIEF1ZyAyNywgMjAyMywgSGFpYm8g
WHUgd3JvdGU6Cj4gPiBPbiBUaHUsIEF1ZyAzLCAyMDIzIGF0IDY6MTbigK9BTSBTZWFuIENocmlz
dG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwg
SnVsIDI3LCAyMDIzLCBIYWlibyBYdSB3cm90ZToKPiA+ID4gPiBUaGUgc3N0Y190aW1lciBzZWxm
dGVzdCBpcyB1c2VkIHRvIHZhbGlkYXRlIFNzdGMgdGltZXIgZnVuY3Rpb25hbGl0eQo+ID4gPiA+
IGluIGEgZ3Vlc3QsIHdoaWNoIHNldHMgdXAgcGVyaW9kaWMgdGltZXIgaW50ZXJydXB0cyBhbmQg
Y2hlY2sgdGhlCj4gPiA+ID4gYmFzaWMgaW50ZXJydXB0IHN0YXR1cyB1cG9uIGl0cyByZWNlaXB0
Lgo+ID4gPiA+Cj4gPiA+ID4gVGhpcyBLVk0gc2VsZnRlc3Qgd2FzIHBvcnRlZCBmcm9tIGFhcmNo
NjQgYXJjaF90aW1lciBhbmQgdGVzdGVkCj4gPiA+ID4gd2l0aCBMaW51eCB2Ni41LXJjMyBvbiBh
IFFlbXUgcmlzY3Y2NCB2aXJ0IG1hY2hpbmUuCj4gPiA+ID4KPiA+ID4gPiBIYWlibyBYdSAoNCk6
Cj4gPiA+ID4gICB0b29sczogcmlzY3Y6IEFkZCBoZWFkZXIgZmlsZSBjc3IuaAo+ID4gPiA+ICAg
S1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgZXhjZXB0aW9uIGhhbmRsaW5nIHN1cHBvcnQKPiA+
ID4gPiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIGd1ZXN0IGhlbHBlciB0byBnZXQgdmNw
dSBpZAo+ID4gPiA+ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgc3N0Y190aW1lciB0ZXN0
Cj4gPiA+Cj4gPiA+IEZZSSwgcGF0Y2ggNCB3aWxsIGNvbmZsaWN0IHdpdGggdGhlIGluLWZsaWdo
dCBndWVzdCBwcmludGYgY2hhbmdlc1sqXSwgYXMgd2lsbAo+ID4gPiByZXdvcmtpbmcgdGhlIGV4
aXN0aW5nIGFyY2hfdGltZXIgdGVzdC4gIE15IHBsYW4gaXMgdG8gY3JlYXRlIGFuIGltbXV0YWJs
ZSB0YWcKPiA+ID4gbGF0ZXIgdGhpcyB3ZWVrICh3YWl0aW5nIHRvIG1ha2Ugc3VyZSBub3RoaW5n
IGV4cGxvZGVzKS4gIEkgaGlnaGx5IHJlY29tbWVuZCBiYXNpbmcKPiA+ID4gdjIgb24gdG9wIG9m
IHRoYXQuCj4gPiA+Cj4gPgo+ID4gSGkgU2VhbiwKPiA+Cj4gPiBDb3VsZCB5b3UgaGVscCBwb2lu
dCBtZSB0byB0aGUgaW1tdXRhYmxlIHRhZyBmb3IgdGhlIGd1ZXN0IHByaW50ZiBjaGFuZ2VzPwo+
Cj4gU29ycnksIEkgZm9yZ290IHRvIGNyZWF0ZSB0aGUgdGFnIHVudGlsIGxhc3Qgd2VlaywgcHJv
YmFibHkgbWFkZSBpdCBhIGJpdCBoYXJkIHRvCj4gZmluZC4uLgo+Cj4gICBodHRwczovL2dpdGh1
Yi5jb20va3ZtLXg4Ni9saW51eC5naXQgdGFncy9rdm0teDg2LXNlbGZ0ZXN0cy1pbW11dGFibGUt
Ni42CgpUaGFua3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
