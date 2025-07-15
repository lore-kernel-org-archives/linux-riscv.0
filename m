Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AF1C83F27
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 22:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Flofl5BbXQE2qneID/EtbRZBXZjbu9unJ0Rdvae0F6k=; b=SI+5ugxSsH0Bdu
	hyjUTOPZ5mz8HVaJ37fOxMuKBgCJ1u+Vc7FSpMBFP7dEmo7ngEWLzkhxhMP51+zNQOagX5WPy/x7E
	PZRcdcBFmqIcpbYqnRZzOce7TdHrITpp03Q5KgV8lTXaIgY07RwDom+p8ke5P3Zp84FFdHWYBM7vM
	NNlS68DlBSTbCcPgbaDEXBU5TJFdarZhujw4Ao5t09itUIro3vknge6F3EQXd8bU6oB1UoNNkh/Nx
	PWrqVJw8GMYBu/8Ri6JfpaNdIFdNyzWL8O32o+BX8s7T4E9uFrhYagFWmVZwfv7FtC8/Qigi6qUP1
	aN1x73rck0Lg6Eo6X3iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubnxc-00000006JiQ-295v;
	Tue, 15 Jul 2025 22:17:16 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubnxZ-00000006JhG-1xJF
	for linux-riscv@lists.infradead.org;
	Tue, 15 Jul 2025 22:17:14 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so9917407a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 15 Jul 2025 15:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752617831; x=1753222631; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IlpREsArsA65Wjnvz7fR13JpUjf3JpRjm5gzm/gRDbs=;
        b=Y5ya7mApmlkyYDEJ5eeNDexnWJd72wTp6+xCwmiL/iT3SgEyx4Dr7hp2JPAdzpxx28
         dcdgpaf6lJf1lJW92rLmYldyGlsEG7BXZUd+4XUEGrLkoeDQHW66e8WMwD7oIATbo+4E
         cn0mEOC5hp9ZcaBswU9m+YBsKu4wbVfVT00CXAI2K4sWE0PzBXxV4DXSvTxZr1ttiVN9
         yxBgN5Ms4Hte6VOOyrqUjiV4N1dvNc2+/mzsZ/BkIvRt5xLfHq8SYE1L3waSpcgRl4j4
         Nf0wLb+M3FR2jcr1M+2P2NO1doUFUMag7MYl6CWK8VixgLyHKAmPUlB64o6jbR30CIwq
         /2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752617831; x=1753222631;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IlpREsArsA65Wjnvz7fR13JpUjf3JpRjm5gzm/gRDbs=;
        b=fD1YR4wwn77dS0US2B5BsXoPE2R3LX64xXHHGL9vxx4HAdw8ohyVnlxNsv9PnK5baQ
         rcnKbxL77/CIish8BogZezBvxwLpFh+hFVrPtBO2c4996YaQ4B0UvGJUhw1c1BLGQvlm
         4xRabNLumDmH51f20cJ9zZRwN6Qbn+Ld3qnnHCddS0DuQubrhyv3OcZUWUEsKSPBfNak
         0+bwxM/vdV3gvzv7FSJ5SOqyz6XA8NXcFDjYvAP921fiSxB7/UJptJKHTlh65CaxRxm+
         ZJr1iyuKBNDk4YVLGDWgzZA4hga/LphhQr1mgJFTDdtos1oH7KgWSEeB5FvAwJkiTRFs
         SVzw==
X-Forwarded-Encrypted: i=1; AJvYcCUw0zKYk2YsACfd2Qswi3nuttQhFeHG8/o93guCoufhFCwPouzC7Nv2D8b5kkuC9LVYdjfRlrSEX77Hjw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq6f6Iq4lrx8rqYvobeZbdVd5oFHGmqj0gAoK+zaSMHwfZ3JG2
	w5LqBl+yxXSkiKvqdsLk2zANINcSSV8vTuBbZhrAAToW87WtXwWq/ua7
X-Gm-Gg: ASbGncvQhF7vZe5cvxY6CI1mnci7k6LbBLxeM7oc6ndCPH4o9vSAF5VCVb7dP1nTvIF
	Fyzkp+6NX2v41T7fPlekwuelNTVr5dmLc9Mo4qcuP3enI5zcBSFH1oGcFakBGxQXGGJ62uAYlHw
	nWeIHyj3PJkhECoZ3bQz4Kg06HJX93SK78VmNTs9Z2q7l3W8cUIs1ybvsAkgGReuA8GXSs9qPkh
	NJkHZDE/H4WVG0APsIEh45HYZa/ZyG9ga1lplN3UyfUl6uHIZ7e5I+UZ3jPl4A3PDl4/MfYWAOu
	QaoxkFemSyT1NWwij3QtoS88RxYAB/bpBhPbKovua2CeMS5xyPmRw+d7wGDRo+YvekSknF2IcKI
	SOIiXzuYuuWvogZr5lrtsgWYtzDuiYK7NnJl674ap0wI=
X-Google-Smtp-Source: AGHT+IFS1FOWt2Mu8j9kFCRNXMuFJFrO5X2nsF/JgZHo3UNGWsUzJOoz0tkKgDtKz4i/peCv+xWi9w==
X-Received: by 2002:a05:6402:2756:b0:604:e33f:e5c0 with SMTP id 4fb4d7f45d1cf-61285dfbc42mr291122a12.30.1752617831067;
        Tue, 15 Jul 2025 15:17:11 -0700 (PDT)
Received: from giga-mm-11.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61274d50d06sm1084048a12.8.2025.07.15.15.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 15:17:10 -0700 (PDT)
Message-ID: <ce6c909d9d6724dd36a2b35ff19faa93b5152a0c.camel@gmail.com>
Subject: Re: [PATCH] riscv: dts: sophgo: fix mdio node name for CV180X
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang	 <unicorn_wang@outlook.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Ze Huang
 <huangze@whut.edu.cn>, Yu Yuan <yu.yuan@sjtu.edu.cn>, Thomas Bonnefille	
 <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Yixun Lan
	 <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, kernel test robot
	 <lkp@intel.com>
Date: Wed, 16 Jul 2025 00:17:07 +0200
In-Reply-To: <20250715221349.11034-1-inochiama@gmail.com>
References: <20250715221349.11034-1-inochiama@gmail.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_151713_511193_1397FBF2 
X-CRM114-Status: GOOD (  14.65  )
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

T24gV2VkLCAyMDI1LTA3LTE2IGF0IDA2OjEzICswODAwLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+
IEFzIHRoZSBtZGlvIG11bHRpcGxlZHhlciBpcyBtYXJrZWQgYXMgbWRpbyBkZXZpY2UsIHRoZSBj
aGVjayBjb21wbGFpbnMKPiB0aGUgbWRpbyBidXMgbnVtYmVyIGV4Y2VlZCB0aGUgbWF4aW11bS4K
PiAKPiBDaGFuZ2UgdGhlIG5vZGUgbmFtZSB0byBtZGlvLW11eCB0byByZW1vdmUgdGhlIGZvbGxv
d2luZyB3YXJuaW5nczoKPiBtZGlvQDMwMDk4MDAgKG1kaW8tbXV4LW1taW9yZWcpOiBtZGlvQDgw
OnJlZzowOjA6IDEyOCBpcyBncmVhdGVyIHRoYW4KPiB0aGUgbWF4aW11bSBvZiAzMQo+IAo+IEZp
eGVzOiBiNzk0NTE0M2JjMzMgKCJyaXNjdjogZHRzOiBzb3BoZ286IEFkZCBtZGlvIG11bHRpcGxl
eGVyIGRldmljZSBmb3IgY3YxOHh4IikKPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxp
bm9jaGlhbWFAZ21haWwuY29tPgo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtw
QGludGVsLmNvbT4KPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1h
bGwvMjAyNTA3MTQwNzM4LlhSanYzRzhpLWxrcEBpbnRlbC5jb20vCj4gQ2xvc2VzOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjUwNzEyMTgzMC5QT3gyS0RWaS1sa3BA
aW50ZWwuY29tLwoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2
ZXJkbGluQGdtYWlsLmNvbT4KCj4gLS0tCj4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9j
djE4MHguZHRzaSB8IDIgKy0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9j
djE4MHguZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgweC5kdHNpCj4gaW5k
ZXggNWYwOTRjNjA4NWNiLi4yNzA1NmVmNzBjZTQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9i
b290L2R0cy9zb3BoZ28vY3YxODB4LmR0c2kKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nv
cGhnby9jdjE4MHguZHRzaQo+IEBAIC01Nyw3ICs1Nyw3IEBAIHJzdDogcmVzZXQtY29udHJvbGxl
ckAzMDAzMDAwIHsKPiDCoAkJCSNyZXNldC1jZWxscyA9IDwxPjsKPiDCoAkJfTsKPiAKPiAtCQlt
ZGlvOiBtZGlvQDMwMDk4MDAgewo+ICsJCW1kaW86IG1kaW8tbXV4QDMwMDk4MDAgewo+IMKgCQkJ
Y29tcGF0aWJsZSA9ICJtZGlvLW11eC1tbWlvcmVnIiwgIm1kaW8tbXV4IjsKPiDCoAkJCXJlZyA9
IDwweDMwMDk4MDAgMHg0PjsKPiDCoAkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoKLS0gCkFsZXhh
bmRlciBTdmVyZGxpbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
