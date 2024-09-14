Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6ECDC02197
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Sep 2024 13:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fUgcUVnG/yK4tDb1LLp40KYQr1pO/JJfgkD2Y0whjVg=; b=db3P9r9YwkLGbA
	YF7Ve2ApTzidWl1b6U/VwbB04MVnB5APZ8iohyZYD23XyOhDrP1A2KQS9kJjIPtlo3CKT0vzNlX/u
	2w7q+5EhgjmsuYiq8J5IN2GjANo/Cr7tIMldzave9Em1PuLbrskgCUdaw90SLO3V4BjcYs4/Nj7IT
	Qfm9dBVmPdu8aLBs1arwks/KnWSkROupU3/ygXzT+aRTXQ3zgD2BrykWZ0fD/aDcQbp1dHiwkJS0V
	kH6YlbR2Y5cCWLci9asBuy2/6zutQlm7CgLSqp2Ym9oMZZPSxS3KLDqVqqqi8eYVdTDjbjIvnji6N
	q3y3AjNGlhk7ruJEXIBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spSvH-00000000jWU-1NNU;
	Sat, 14 Sep 2024 13:34:47 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spSui-00000000jRJ-1CtC
	for linux-riscv@lists.infradead.org;
	Sat, 14 Sep 2024 13:34:13 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a8d2b24b7a8so749244766b.1
        for <linux-riscv@lists.infradead.org>; Sat, 14 Sep 2024 06:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1726320849; x=1726925649; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3+2dU015s4VfKO/cjS/4FGzJ+slC1woHk7WcXNqcQxI=;
        b=fBvgeeloxQFsIlDWTNTpO38pmXJpcD8JnABxlUIL+bP0LDXYl4BsQ4gptT8BILd5x4
         /N0vmi7niisDHf3WzJ6chKRv3YtkjKvlb5urvdXTiCcYfXx99QzI9NdN8nwEW0DLlOBV
         oWIAU+OWMACzp26MsoMYt/5BeSNF9MlRamGDI04Sy0BXt5Q8Qu2jx9Rk3y9YUXBwgzY3
         HRiBVBaHFinZanDceOjIaXcb8mN0E6uuDaAHzQeulc5CRf9b0RMr1BqmlgYiT8wf99Lr
         S1MP2PyfLpmtwokq3VNCWVTf4qjMr4gCuddbEG1S92JvyVPDE3a/smOM+IbJrUC2CHv/
         Yp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726320849; x=1726925649;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3+2dU015s4VfKO/cjS/4FGzJ+slC1woHk7WcXNqcQxI=;
        b=h8ytYEPd7r4pTSmM2wKcSTCi9iZ3W/U33qXS70r1rDXl/W7RQq8dsEFg2NwlA361El
         j6udl2D7i3lIMKW7oXV9qc3QwKBtYXlyTnUkBwXyD31a5MBcnAxgNJbzKWAnJkCk0aWi
         PRRY7s84nbwRxPG3mN0SLIVr95ueNpTHUnPdV+iEuO+wfwnLZYbvR99fvEcbYnaQuIpd
         bZlvNjHTdQ0y2obQ9j3vFuG+ym+ylJuZe5Ft6bR0VrveRpe690p2gwu7Mqc8bAPH2Kww
         Gd/tUHZmtMTaWZcUyKwwSsWSWnBCGUwCRoMeWaW+x9AVJJ69Ef7PxJnyCtN+3+IEb7wP
         FO8g==
X-Forwarded-Encrypted: i=1; AJvYcCWxX6mW5h/JbY8xwOxnNo8sxmUjYc83nOFomYLIlOakI/HeTajZ6NS3bEk6CVngqcrdGEmhrS0aHqgX+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyNMl07WH05daACC8RcBPW9Jq2Js5pupfJ5mx4HzPrWGo5ilWz
	rL4ETAg3d/IHhsREaKNzubeucJsxFHMjEHfSEmVIlOHMrspUPcZzMdGmqgIosGo=
X-Google-Smtp-Source: AGHT+IGaFl0glA6dTBFTVmxbFbIaPwCSt/xAX5S/b7pdrQJ5OLcNARacwq5TX82N9SY0Gwi/rQU29g==
X-Received: by 2002:a17:907:7d8a:b0:a8a:754a:e1c1 with SMTP id a640c23a62f3a-a8ffab6da9bmr1569753866b.8.1726320848434;
        Sat, 14 Sep 2024 06:34:08 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b3822sm81092066b.115.2024.09.14.06.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 06:34:08 -0700 (PDT)
Date: Sat, 14 Sep 2024 15:34:07 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Conor Dooley <conor@kernel.org>, Juhan Jin <juhan.jin@foxmail.com>, 
	linux-riscv@lists.infradead.org, peterz@infradead.org, jpoimboe@kernel.org, juhanj2@illinois.edu, 
	alexghiti@rivosinc.com, palmer@dabbelt.com
Subject: Re: Is RISC-V Static Call worth implementing ?
Message-ID: <20240914-2996cb645bae4145c0619c58@orel>
References: <tencent_24E1437DFC1D2BB7528A2A28D503C8033107@qq.com>
 <20240913-spearfish-feeble-4c0032f37484@spud>
 <54ce36a6-8be1-4ce8-b246-2255df333d00@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54ce36a6-8be1-4ce8-b246-2255df333d00@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240914_063412_355134_94D375FC 
X-CRM114-Status: GOOD (  16.60  )
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

T24gRnJpLCBTZXAgMTMsIDIwMjQgYXQgMDY6NTA6MzdQTSBHTVQsIFNhbXVlbCBIb2xsYW5kIHdy
b3RlOgo+IE9uIDIwMjQtMDktMTMgMzo1NSBQTSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gT24g
RnJpLCBTZXAgMTMsIDIwMjQgYXQgMDM6MDU6MzNBTSAtMDUwMCwgSnVoYW4gSmluIHdyb3RlOgo+
ID4+IEhpIGZvbGtzLAo+ID4+Cj4gPj4gSeKAmW0gaW50ZXJlc3RlZCBpbiBpbXBsZW1lbnRpbmcg
U3RhdGljIENhbGwgZm9yIFJJU0MtViwgYW5kIEkgd2FudCB0bwo+ID4+IGtub3cgd2hldGhlciBp
dCBpcyB3b3J0aCB0aGUgZWZmb3J0cyB0byBpbXBsZW1lbnQgU3RhdGljIENhbGwgZm9yCj4gPj4g
UklTQy1WLgo+ID4+Cj4gPj4gRG9lcyB0aGUgYWZvcmVtZW50aW9uZWQgYmVuZWZpdHMgbWVyaXQg
YSBSSVNDLVYgc3RhdGljIGNhbGwgaW1wbGVtZW50YXRpb24gCj4gPj4gKGVzcGVjaWFsbHkgaW5s
aW5lKT8gT3IgYXJlIHRoZSBiZW5lZml0cyBzbyBuZWdsaWdpYmxlIHRoYXQgaXTigJlzIHNpbXBs
eSBub3QgCj4gPj4gd29ydGggdGhlIGVmZm9ydCB0byBkbyBhIFJJU0MtViBpbXBsZW1lbnRhdGlv
bj8KPiA+IAo+ID4gUHJldHR5IHN1cmUgd2UndmUgdGFsa2VkIGFib3V0IHdhbnRpbmcgaXQgYmVm
b3JlIC0gU2FtdWVsLCBBbGV4LCBEcmV3Cj4gPiBKb25lcyBvciBQYWxtZXIgbWlnaHQgcmVtZW1i
ZXIgYmVzdCB3aGF0IGV4YWN0bHkgd2Ugd2FudGVkIGl0IGZvcgo+ID4gaG93ZXZlciwgYXMgSSBk
byBub3QuCj4gCj4gSWYgSSByZW1lbWJlciBjb3JyZWN0bHksIHdlIGhhZCBkaXNjdXNzZWQgaXQg
aW4gdGhlIGNvbnRleHQgb2Ygbm9uLWNvaGVyZW50IERNQQo+IG9wZXJhdGlvbnMsIGJ1dCB3ZSBk
ZWNpZGVkIHRoYXQgdGhlIGJlbmVmaXQgd2FzIG5lZ2xpZ2libGUgZm9yIHRoYXQgdXNlIGNhc2Uu
Cj4gCj4gVGhlcmUgYXJlIG90aGVyIHBsYWNlcyB0aGF0IGNvdWxkIGxpa2VseSBiZW5lZml0IGZy
b20gc3RhdGljIGNhbGxzLCBzdWNoIGFzCj4gU3YzOS9TdjQ4L1N2NTcgZGlmZmVyZW5jZXMsIHNv
bWUgdXNlcnMgb2YgcmlzY3ZfaGFzX2V4dGVuc2lvbl8qKCksIG9yIG1heWJlIHNvbWUKPiBob3Qg
aW5kaXJlY3QgU0JJIGZ1bmN0aW9ucyBsaWtlIHNiaV9zZXRfdGltZXIoKS4gQnV0IGl0IGRlcGVu
ZHMgb24gdGhlIG92ZXJoZWFkLgoKV2hlbiBndWVzdHMgaGF2ZSBzdGVhbCB0aW1lIGFjY291bnRp
bmcgZW5hYmxlZCB0aGVuIHVwZGF0ZV9ycV9jbG9jaygpCndvdWxkIGFsc28gbGlrZWx5IGJlbmVm
aXQuCgpUaGFua3MsCmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
