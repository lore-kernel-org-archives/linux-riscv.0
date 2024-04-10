Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84B3CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 21:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GDSQlgQYC8OLaLVuv5vguwewqdP8ZdYpKWqLu+SkB58=; b=FtkDWkkLO7lRDf
	iWWh6UNJv/xMjpoyv5P8Xm+QlF0wd06BsNbnZrOeB5z5GmDtJBsRrgh/VKiNA1z2ZIMYfSA8iEWBv
	zEjEvupA6LhDo8kphXij+mBF4TE/vnx+m1eItAINoK+4W2jPLZrTsRugeioOy+ybtHdLSUHlsmemQ
	O/uSn8Fb5+PZ+ZL1vqk/2z5sy2UI+GySNIAGGI/c3AZq6wC/YhT7MmClYtnDw/24936gt62lwgn+a
	ZETz+gPvigRAzhGvgeOtCfWkVoxlcdEJHe+Rp888KDjYuUqIDqds0sGOfJg1bZoIfIDCzlt4Stcpy
	d7BdRHQXHGyiiNXQNzVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rufdU-000000093Cm-3J8v;
	Wed, 10 Apr 2024 21:37:40 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rufdR-000000093BW-1jg0
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 21:37:39 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-614ec7ee902so73671087b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 14:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712785055; x=1713389855; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPYtaW73cXDTPjMujaADVZvLP6wj8QcIF+jSWGr8Oms=;
        b=hHa+BnvV/HDpk6JLemMqPAB0ik9UZV6cfOpZAqgwelHDYscjbiYSfu1eyM/hf+E6FX
         6ZY3l5DG8D7v0culq1/HKKpE/zt3FrwqX/AGMtKNlCKPVdNSiy81kQM32rBVdKiescS3
         TqxJ+f1SX68r8/6dGqDgFhUmRQ9Hhmw2HBOhLm0TsoAkYt4ydxLUO1jFJwje48EDLIQh
         mw0wNNyV//p6mEokF0ooBFp23keLyhhe+VK+uUjjRHV7ScLvv2D0U/xxURPySVYYh1KS
         Q+K35tWU2kObqaeGGh4H8SZTkyiRBMoVb3XD70DijrKTEXbtyMn3J1pPASgxF4Nck2qO
         /xwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712785055; x=1713389855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPYtaW73cXDTPjMujaADVZvLP6wj8QcIF+jSWGr8Oms=;
        b=QqAokJIyVUYGVFJrfBLVbNVa66gegmNTLC8vr0yZxr3j76/aDzWPeHfBUWSxW5pH3A
         2CvQQ9RTAm6CCE31G15JhHHeJ4Me3HdMNuG+NLhgCEvEK7lwcudEFJUvrAxKgwySPkRW
         laRVItX4KRzFm6/67cXM+j8G8iBOvknDTKlTXgtr7cQacXC7YJAjWjua7IAiFA4w7Pya
         V61eciVrvIUdwLeBq4lrSTFCKrQ+rPCAhbND97FWvb+6Nzo+kQmwJ1tdoxArWqPbe7Mu
         jdoVgXdA+Fn417ngF6wMU91At7Lh6a++yo4EtYrgFwjfgSVhMfK+/Co/6gWypn3pJMeP
         QneQ==
X-Forwarded-Encrypted: i=1; AJvYcCU09nVp7jocH0OxwVjiTHCjCEvMRt1/fxsRN0THaPWT8/VnNQ86zfi7mKmuUEdh9AVJpzakAdXFFOjoEnQDOPA/5SSwW97H3mH1ZV5vORN7
X-Gm-Message-State: AOJu0YzyKXpzaIZLH80aQTnmzE44wNHA/cehblOmTbK0pU46TbmNNQyo
	mH77AYlPap2ya7JRjvJw8o2gkCyEWqEH3AIwvY+bf41xZ16GA/4mFIq9NkTk1ZhNDggXMatnkKh
	zcMFQX808AtGfVCdQ3nAtGE47NTwO1Dl7CXjDAg==
X-Google-Smtp-Source: AGHT+IF51UvfuZW8F9SKiS3fB7NFequCpltyvy4yxCVwUJis6yJOQ1I5zvJY27CgXu6F/WYzUCxY2XbedDRG3tneEwI=
X-Received: by 2002:a0d:c306:0:b0:615:4700:94c5 with SMTP id
 f6-20020a0dc306000000b00615470094c5mr4293525ywd.22.1712785055129; Wed, 10 Apr
 2024 14:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240403234054.2020347-1-debug@rivosinc.com> <20240403234054.2020347-5-debug@rivosinc.com>
 <20240410115806.GA4044117-robh@kernel.org>
In-Reply-To: <20240410115806.GA4044117-robh@kernel.org>
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 10 Apr 2024 14:37:21 -0700
Message-ID: <CAKC1njSsZ6wfvJtXkp4J4J6wXFtU92W9JGca-atKxBy8UvUwRg@mail.gmail.com>
Subject: Re: [PATCH v3 04/29] riscv: zicfilp / zicfiss in dt-bindings (extensions.yaml)
To: Rob Herring <robh@kernel.org>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com, broonie@kernel.org, 
	Szabolcs.Nagy@arm.com, kito.cheng@sifive.com, keescook@chromium.org, 
	ajones@ventanamicro.com, conor.dooley@microchip.com, cleger@rivosinc.com, 
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com, 
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, corbet@lwn.net, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org, 
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de, 
	ebiederm@xmission.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	lstoakes@gmail.com, shuah@kernel.org, brauner@kernel.org, 
	andy.chiu@sifive.com, jerry.shih@sifive.com, hankuan.chen@sifive.com, 
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com, 
	charlie@rivosinc.com, apatel@ventanamicro.com, mchitale@ventanamicro.com, 
	dbarboza@ventanamicro.com, sameo@rivosinc.com, shikemeng@huaweicloud.com, 
	willy@infradead.org, vincent.chen@sifive.com, guoren@kernel.org, 
	samitolvanen@google.com, songshuaishuai@tinylab.org, gerg@kernel.org, 
	heiko@sntech.de, bhe@redhat.com, jeeheng.sia@starfivetech.com, 
	cyy@cyyself.name, maskray@google.com, ancientmodern4@gmail.com, 
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com, bgray@linux.ibm.com, 
	mpe@ellerman.id.au, baruch@tkos.co.il, alx@kernel.org, david@redhat.com, 
	catalin.marinas@arm.com, revest@chromium.org, josh@joshtriplett.org, 
	shr@devkernel.io, deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org, 
	jhubbard@nvidia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_143737_609678_47ACC819 
X-CRM114-Status: GOOD (  14.37  )
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

T24gV2VkLCBBcHIgMTAsIDIwMjQgYXQgNDo1OOKAr0FNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBBcHIgMDMsIDIwMjQgYXQgMDQ6MzQ6NTJQTSAtMDcw
MCwgRGVlcGFrIEd1cHRhIHdyb3RlOgo+ID4gTWFrZSBhbiBlbnRyeSBmb3IgY2ZpIGV4dGVuc2lv
bnMgaW4gZXh0ZW5zaW9ucy55YW1sLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERlZXBhayBHdXB0
YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sICAgICAgICAgIHwgMTAgKysrKysrKysrKwo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPiBp
bmRleCA2M2Q4MWRjODk1ZTUuLjQ1Yjg3YWQ2Y2MxYyAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwK
PiA+IEBAIC0zMTcsNiArMzE3LDE2IEBAIHByb3BlcnRpZXM6Cj4gPiAgICAgICAgICAgICAgVGhl
IHN0YW5kYXJkIFppY2JveiBleHRlbnNpb24gZm9yIGNhY2hlLWJsb2NrIHplcm9pbmcgYXMgcmF0
aWZpZWQKPiA+ICAgICAgICAgICAgICBpbiBjb21taXQgM2RkNjA2ZiAoIkNyZWF0ZSBjbW9iYXNl
LXYxLjAucGRmIikgb2YgcmlzY3YtQ01Pcy4KPiA+Cj4gPiArICAgICAgICAtIGNvbnN0OiB6aWNm
aWxwCj4gPiArICAgICAgICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgICAgICAgIFRoZSBzdGFu
ZGFyZCBaaWNmaWxwIGV4dGVuc2lvbiBmb3IgZW5mb3JjaW5nIGZvcndhcmQgZWRnZSBjb250cm9s
LWZsb3cKPiA+ICsgICAgICAgICAgICBpbnRlZ3JpdHkgaW4gY29tbWl0IDNhMjBkYzkgb2Ygcmlz
Y3YtY2ZpIGFuZCBpcyBpbiBwdWJsaWMgcmV2aWV3Lgo+Cj4gRG9lcyBpbiBwdWJsaWMgcmV2aWV3
IG1lYW4gdGhlIGNvbW1pdCBzaGEgaXMgZ29pbmcgdG8gY2hhbmdlPwo+CgpMZXNzIGxpa2VseS4g
TmV4dCBzdGVwIGFmdGVyIHB1YmxpYyByZXZpZXcgaXMgdG8gZ2F0aGVyIGNvbW1lbnRzIGZyb20K
cHVibGljIHJldmlldy4KSWYgc29tZXRoaW5nIGlzIHJlYWxseSBwcmVzc2luZyBhbmQgbmVlZHMg
dG8gYmUgYWRkcmVzc2VkLCB0aGVuIHllcwp0aGlzIHdpbGwgY2hhbmdlLgpFbHNlIHRoaXMgZ2V0
cyByYXRpZmllZCBhcyBpdCBpcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
