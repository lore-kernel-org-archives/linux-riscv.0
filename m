Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C9AC02181
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 17:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZ+U0sV8jpePDY6oHZzSb/AFj7lGdosB7jUWSYMDsSw=; b=tfytKgZKd7Q1lo
	oqEQ+RETBoM49qAyBld7H7ULzxQHuzK2zuq5H+R+l421XQhAwhV9My2nGidjr1PU2MeV/Stst4w78
	tkREv6rew5+epkouNsDvF7xeoqF6399d6V3aJVW8QIJhQ3bMSkIfnFcUiOwkRK+ZXDLPvZ/lu9Nzy
	2WNKuwwnMxb8Q5XPg0kAFrCE3XoOLKJDjUiQzubn6LR/puOCLvgQ/Yr+Ld+/DbfBvnFZz/Ar7H8D3
	zKqlEya0cOB8OwuS4zGzslrjUkUTGwKmEQCj09LsJNJmXmVgNjivQ5M9SXz61XE7vSMmORQhCo4Q4
	QUiwcg73jd8bjUsYRRCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taeQ3-0000000Aqrg-2YLl;
	Wed, 22 Jan 2025 17:21:35 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taeQ0-0000000Aqr2-2lFs
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 17:21:33 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2166360285dso139426575ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jan 2025 09:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737566491; x=1738171291; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ae3fiG65q7gFADRkugXEjBLy3kEYsGVZg1VWFTjZpLU=;
        b=g1TamYjUOd8ATfny2s4sURYeR5vk+sJcOUEyLVnNVv+Tjp1UFpLek7lBLG27VZLLuL
         5ShK6wMy6ro56dI3UP83IGP7qI+CjRgybC9ag52pCJhZDe9wfi5+RqjKMy3FfqtPalsF
         KqbKO5LFu7hFKqvkCBTZzp/zbjxrHFkzL7eKJp34TZGL5uwLsv0kpBIxHN3QDMRZLEbA
         IrIpz4BdBNw8GDEgFCep4DG0dPnQZtfKekUkxPLg3ecswfRhSEuPf2OAnYNvgXI3qFpc
         ewHM5QFDdBc/ORGdSYqa+abKn7QCBgqUH1jJgwJH68XxAMe7WfrB+YHkDGMFrDKwAlEf
         PLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737566491; x=1738171291;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ae3fiG65q7gFADRkugXEjBLy3kEYsGVZg1VWFTjZpLU=;
        b=UXJQNrf2043d6OThage5Za+Jk0njKQAaGRoZUkW3mdTjAwI4anQfwOm8peh+vNRAtC
         l2XnSXXgzf6Pj2BAlkJYrpaX4eMkjJPPMq69Wh2Y4xsxamMz7K5CJ+58BV4v05NkyqyL
         QosIwKNLNRddl+T2OFsEgJatIfFHvdOvBaRxf6dk+zdotsozhikMjRQltwQB7PoGpfdA
         gsdyiYRi1OkWpCHSYTMIsEheIktetW1CwkRtzVUUzY/AFJxcBRaYAcu1hbyG7VJ9Uk/I
         Ca59FwLhf6PMLUuSpjjt512u5V+86RE34SggWU96hV/S+ar3slyEZNsw8xevsF595Io7
         Zs2A==
X-Forwarded-Encrypted: i=1; AJvYcCUdU3hzfzOYAJyjuCNTMes+NzbuivmkWZgXGPJgJIkHQZiFLZ1gbc+g8ROI6uJXhZPh9EnveI/i3d4Rsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxF6l1BtDl/rTEgMsdJQ+bqX2ghEcRK8uIXsx7L/Vxcc5iy5z1t
	1wReeifOCpCD4M8juMeVJtQrpQ8WFupH4u8+5wjXY1acyo1CSBaFWFpLrsOyBQ==
X-Gm-Gg: ASbGncs9ebKYsMoLaAXkIH1CFQC9bLP1tViZpEyPH7a1H3ZJPSQC5ytdaEsq/3HqJwc
	ZererYuAY2tvruKnR0n2T1ljySe16r50Ce9sr+bqyApDutRBDXkXmqDs/1QhpBarkhtLoYIPpv9
	Ed66OlIVUaaW0WXZaZTZNTVySyEzxUWVY4KDFL+wWQdioDmGzTKC1aZcIV48SDIpc1VgNFyCpV2
	OBPS0Q/+q7HHibgZA3KZdpSd5i8OsRzNZXtDoKLLAazpCJmm5oLv8hmP8Drzv9wJ/4Zx2mm9bAb
	6RMT
X-Google-Smtp-Source: AGHT+IEkqigOKLMCrs2YjDPNBFNeQyHN25V8kKjRdlQokTEi1k6FX4K8bd/jugJsCnORbh0uNOzVgQ==
X-Received: by 2002:a17:903:32c1:b0:216:59ed:1ab0 with SMTP id d9443c01a7336-21c3555847amr277588575ad.27.1737566490907;
        Wed, 22 Jan 2025 09:21:30 -0800 (PST)
Received: from thinkpad ([36.255.17.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3d6fbbsm97942345ad.168.2025.01.22.09.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 09:21:30 -0800 (PST)
Date: Wed, 22 Jan 2025 22:51:22 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, kw@linux.com,
	u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de,
	bhelgaas@google.com, conor+dt@kernel.org, guoren@kernel.org,
	inochiama@outlook.com, krzk+dt@kernel.org, lee@kernel.org,
	lpieralisi@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	pbrobinson@gmail.com, robh@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com,
	helgaas@kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: pci: Add Sophgo SG2042 PCIe host
Message-ID: <20250122172122.vquwlodeyjpkx6gs@thinkpad>
References: <cover.1736923025.git.unicorn_wang@outlook.com>
 <5a784afde48c44b5a8f376f02c5f30ccff8a3312.1736923025.git.unicorn_wang@outlook.com>
 <20250119114408.3ma4itsjyxki74h4@thinkpad>
 <BM1PR01MB25450B47C36ADE01F53CAFD1FEE12@BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BM1PR01MB25450B47C36ADE01F53CAFD1FEE12@BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_092132_717744_F4258C1F 
X-CRM114-Status: GOOD (  28.39  )
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

T24gV2VkLCBKYW4gMjIsIDIwMjUgYXQgMDg6NTI6MzlQTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3Rl
Ogo+IAo+IE9uIDIwMjUvMS8xOSAxOTo0NCwgTWFuaXZhbm5hbiBTYWRoYXNpdmFtIHdyb3RlOgo+
ID4gT24gV2VkLCBKYW4gMTUsIDIwMjUgYXQgMDM6MDY6MzdQTSArMDgwMCwgQ2hlbiBXYW5nIHdy
b3RlOgo+ID4gPiBGcm9tOiBDaGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPiA+
ID4gCj4gPiA+IEFkZCBiaW5kaW5nIGZvciBTb3BoZ28gU0cyMDQyIFBDSWUgaG9zdCBjb250cm9s
bGVyLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdA
b3V0bG9vay5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgIC4uLi9iaW5kaW5ncy9wY2kvc29waGdvLHNn
MjA0Mi1wY2llLWhvc3QueWFtbCB8IDE0NyArKysrKysrKysrKysrKysrKysKPiA+ID4gICAxIGZp
bGUgY2hhbmdlZCwgMTQ3IGluc2VydGlvbnMoKykKPiA+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9zb3BoZ28sc2cyMDQyLXBjaWUt
aG9zdC55YW1sCj4gCj4gWy4uLi4uLl0KPiAKPiA+ID4gK2V4YW1wbGVzOgo+ID4gPiArICAtIHwK
PiA+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJx
Lmg+Cj4gPiA+ICsKPiA+ID4gKyAgICBwY2llQDYyMDAwMDAwIHsKPiA+ID4gKyAgICAgIGNvbXBh
dGlibGUgPSAic29waGdvLHNnMjA0Mi1wY2llLWhvc3QiOwo+ID4gPiArICAgICAgZGV2aWNlX3R5
cGUgPSAicGNpIjsKPiA+ID4gKyAgICAgIHJlZyA9IDwweDYyMDAwMDAwICAweDAwODAwMDAwPiwK
PiA+ID4gKyAgICAgICAgICAgIDwweDQ4MDAwMDAwICAweDAwMDAxMDAwPjsKPiA+IFVzZSBzaW5n
bGUgc3BhY2UgYmV0d2VlbiBhZGRyZXNzIGFuZCBzaXplLgo+IG9rLCB0aGFua3MuCj4gPiA+ICsg
ICAgICByZWctbmFtZXMgPSAicmVnIiwgImNmZyI7Cj4gPiA+ICsgICAgICAjYWRkcmVzcy1jZWxs
cyA9IDwzPjsKPiA+ID4gKyAgICAgICNzaXplLWNlbGxzID0gPDI+Owo+ID4gPiArICAgICAgcmFu
Z2VzID0gPDB4ODEwMDAwMDAgMCAweDAwMDAwMDAwIDB4ZGUwMDAwMDAgMCAweDAwMDEwMDAwPiwK
PiA+ID4gKyAgICAgICAgICAgICAgIDwweDgyMDAwMDAwIDAgMHhkMDQwMDAwMCAweGQwNDAwMDAw
IDAgMHgwZDAwMDAwMD47Cj4gPiBGb3Igc3VyZSB5b3UgZG9uJ3QgbmVlZCB0byBzZXQgJ3JlbG9j
YXRhYmxlJyBmbGFnIGZvciBib3RoIHJlZ2lvbnMuCj4gb2ssIEkgd2lsbCBjb3JyZWN0IHRoaXMg
aW4gbmV4dCB2ZXJzaW9uLgo+ID4gPiArICAgICAgYnVzLXJhbmdlID0gPDB4MDAgMHhmZj47Cj4g
PiA+ICsgICAgICB2ZW5kb3ItaWQgPSA8MHgxZjFjPjsKPiA+ID4gKyAgICAgIGRldmljZS1pZCA9
IDwweDIwNDI+Owo+ID4gQXMgQmpvcm4gZXhwbGFpbmVkIGluIHYyLCB0aGVzZSBwcm9wZXJ0aWVz
IG5lZWQgdG8gYmUgbW92ZWQgdG8gUENJIHJvb3QgcG9ydAo+ID4gbm9kZS4gWW91ciBhcmd1bWVu
dCBvZiBhIHNpbmdsZSByb290IHBvcnQgbm9kZSBmb3IgYSBob3N0IGJyaWRnZSBkb2Vzbid0IGFk
ZCBhcwo+ID4gd2UgaGF2ZSBmb3VuZCB0aGF0IGRlc2NyaWJpbmcgdGhlIHJvb3QgcG9ydCBwcm9w
ZXJ0aWVzIGluIGhvc3QgYnJpZGdlIG9ubHkKPiA+IGNyZWF0ZXMgaXNzdWVzLgo+IAo+IEdvdCBp
dC4gSSB3aWxsIHRyeSB0byBjaGFuZ2UgdGhpcyBpbiBuZXh0IHZlcnNpb24uCj4gCj4gPiBCdHcs
IHdlIGFyZSBtaWdyYXRpbmcgdGhlIGV4aXN0aW5nIHNpbmdsZSBSUCBwbGF0Zm9ybXMgdG9vIHRv
IHJvb3QgcG9ydCBub2RlLgo+ID4gCj4gPiA+ICsgICAgICBjZG5zLG5vLWJhci1tYXRjaC1uYml0
cyA9IDw0OD47Cj4gPiA+ICsgICAgICBzb3BoZ28sbGluay1pZCA9IDwwPjsKPiA+ID4gKyAgICAg
IHNvcGhnbyxzeXNjb24tcGNpZS1jdHJsID0gPCZjZG5zX3BjaWUxX2N0cmw+Owo+ID4gV2hlcmUg
aXMgdGhlIG51bS1sYW5lcyBwcm9wZXJ0eT8KPiBJcyB0aGlzIG51bS1sYW5lcyBhIG11c3QtaGF2
ZSBwcm9wZXJ0eT8gVGhlIGxhbmUgbnVtYmVyIG9mIGVhY2ggbGluayBvbiB0aGUKPiBTRzIwNDIg
aXMgaGFyZC1jb2RlZCBpbiB0aGUgZmlybXdhcmUsIHNvIGl0IHNlZW1zIG1lYW5pbmdsZXNzIHRv
IGNvbmZpZ3VyZQo+IGl0LgoKSXQgaXMgbm90IGEgcmVxdWlyZW1lbnQsIGJ1dCBtb3N0IG9mIHRo
ZSBjb250cm9sbGVycyBkZWZpbmUgaXQgc28gdGhhdCB0aGUKZHJpdmVycyBjYW4gdXNlIGl0IHRv
IHNldCBNYXggTGluayBXaWR0aCwgTGluayBzcGVlZCBldGMuLi4uIFlvdSBjYW4gc2tpcCBpdCBp
Zgp5b3Ugd2FudC4KCj4gPiA+ICsgICAgICBtc2ktcGFyZW50ID0gPCZtc2lfcGNpZT47Cj4gPiA+
ICsgICAgICBtc2lfcGNpZTogbXNpIHsKPiA+ICdtc2knIGlzIG5vdCBhIHN0YW5kYXJkIG5vZGUg
bmFtZS4gJ2ludGVycnVwdC1jb250cm9sbGVyJyBpcyB3aGF0IHVzdWFsbHkgdXNlZAo+ID4gdG8g
ZGVzY3JpYmUgdGhlIE1TSSBub2RlLgo+IE9LLiBJIHdpbGwgY29ycmV0IHRoaXMuCgpUaGVyZSBp
cyBhbHNvICdtc2ktY29udHJvbGxlcicgbm9kZSBuYW1lIHVzZWQgY29tbW9ubHksIGJ1dCBpdCBp
cyBub3QKZG9jdW1lbnRlZCBpbiB0aGUgZGV2aWNldHJlZSBzcGVjLiBNYXliZSB5b3UgY2FuIHVz
ZSBpdCBpbnN0ZWFkIGFuZCBJJ2xsIGFkZCBpdAp0byB0aGUgc3BlYyBzaW5jZSBNU0kgYW5kIGlu
dGVycnVwdCBjb250cm9sbGVycyBhcmUgdHdvIGRpc3RpbmN0IGNvbnRyb2xsZXJzLgoKPiA+IEJ0
dywgaXMgdGhlIE1TSSBjb250cm9sbGVyIGEgc2VwYXJhdGUgSVAgaW5zaWRlIHRoZSBob3N0IGJy
aWRnZT8gSWYgbm90LCB0aGVyZQo+ID4gd291bGQgbm8gbmVlZCB0byBhZGQgYSBzZXBhcmF0ZSBu
b2RlLiBNb3N0IG9mIHRoZSBob3N0IGJyaWRnZSBJUHMgaW1wbGVtZW50aW5nCj4gPiBNU0kgY29u
dHJvbGxlciwgZG8gbm90IHVzZSBhIHNlcGFyYXRlIG5vZGUuCj4gCj4gWWVzLCBpdCdzIGEgc2Vw
YXJhdGVkIElQIGluc2lkZSB0aGUgaG9zdCBicmlkZ2UuCj4gCgpPay4KCi0tIArgrq7grqPgrr/g
rrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
