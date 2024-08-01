Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4908DC3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 09:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bybJ7aB7bXMFEUvhU7XgRDR4r+eY0G7BIfavP5MLjvI=; b=K61XvgAKa+v2JR
	8MdvAv3i/5lHlLOAunS3CVfntfs7XvY9LyMw9b/Q2oYZp1hylFthRoJiOSGvCjmqGcWRoawqPvI07
	pKtmlZ+cB03mGoNbBcsk04xdht+8DAI5MtXElXnmWBdckOAwj8YNsc7Szl4QueYhOJtLfTiJu+TKp
	6P3AIypLwDyL+MGulJTl0OaR5k0hrCLL3jSpIwEmnz6TEWKjhVWaFgIJjLZlXpui7IJGbCeBG78wH
	JWycNleRrd+mHMSs4EI309xZFfz/PRpdKHlX0iNNbHsyJguUfFsaVxQUI1XTLAjMH9dbobpJVZGn0
	Sl5WxgogQgu/ptGf8bSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZRzp-00000004WeI-0t8T;
	Thu, 01 Aug 2024 09:21:17 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZRzd-00000004WaQ-2SUT
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 09:21:08 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5a1337cfbb5so11113067a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 02:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722504063; x=1723108863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQVA9z2jkUPxM3dqZI0KDPVXgKoffaizeXmufcNkJbk=;
        b=FMMCiRFsyAGiy58yNMop50dUhaOiaycpvDCHIubjs4YzINS8TLlAH8vvm3t5bDoFy5
         Lfo9+CKAslOe7iH47jJNN2o5XjUc/BVt3UbOJBvWzQe70cHprJ6K6D3lsW4vfzOD7bCs
         8Da4biL4gc9AzIBD/DcoPMVSdJSHWPwj6rbCgVuESUp66ox5Ag4sBC+olUE0AG8Gh2rS
         6mh0iq8i2FKGan0+GWsHELDVdCywRvPSH/LbneD2dQDcZAU/Xy+WcTFxODe3Ti9edMue
         l562K2qaWG5QoC0K6YD28d/28q7VNSIbumPyqtFck0MZx31HDmv0i6FqVBM2aeNA78mJ
         3iyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722504063; x=1723108863;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQVA9z2jkUPxM3dqZI0KDPVXgKoffaizeXmufcNkJbk=;
        b=uBsTy5axYPeiKiurB9HyH8BhiRJhxqntlXHbE0+AYNwm25QkH8M3QQnP9pFbVG/vri
         BmpM/7OMjgEcXipsQL70BfOJFOil+Mnwv/6MDywZrtWHnzMCnLPiKcURuJHjqsIAgozg
         2gg/Rr53tx/EeUuxtuNJeEQ+gbLkr0JsqnpEL22hRC/i4AsOPHBFIC8DPYKjmWPPHLsP
         9gzEWdSl3Eiug6evu8rViEchG7IAxPo6C8I259JKRRUreXBNByAhS3G8ngm8tAXi8iHi
         qQUFxFeIVaciupWyywShek4hVnRTCMFt+DLbh6NjkPSkO3AyerqfhaW/3OhpdlrPdS+a
         CeJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUxFX169OMu49gAppy9x0iLjH2MG7CrELFIf/YvxexCh9WGvaxiwHTmHdeCYH1+QdenWMPt6GDafAJFnkK3+qomXELCscABGSQW852w6KI
X-Gm-Message-State: AOJu0YwsnJ/hfBC25tZ7uPenG9Nkn+GRfhc3xZZyUOBINTaFkOew207+
	TJQWZiG2l8Qciq0Ams2J7TBVGfbS+NxWd/JLyAIO0HhNrsI7HuYxnuJ6pqdlcwE=
X-Google-Smtp-Source: AGHT+IG4an2mFFKr4wz3Z9DFgeOmmND21A8Rbh3YvwoLKrs/2dCx443xl5h3j8lRXM2FS1yhxPSg2w==
X-Received: by 2002:a50:ee82:0:b0:5a3:3062:36d6 with SMTP id 4fb4d7f45d1cf-5b6fe72ddc6mr1090738a12.1.1722504062925;
        Thu, 01 Aug 2024 02:21:02 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b017787967sm7857844a12.9.2024.08.01.02.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 02:21:01 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 51C785F80C;
	Thu,  1 Aug 2024 10:20:59 +0100 (BST)
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
Subject: Re: [PATCH v12 05/84] KVM: Add kvm_release_page_unused() API to put
 pages that KVM never consumes
In-Reply-To: <20240726235234.228822-6-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:14 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-6-seanjc@google.com>
Date: Thu, 01 Aug 2024 10:20:59 +0100
Message-ID: <87wml0egzo.fsf@draig.linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_022105_746438_5E7BC17F 
X-CRM114-Status: GOOD (  16.11  )
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

U2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+IHdyaXRlczoKCj4gQWRkIGFu
IEFQSSB0byByZWxlYXNlIGFuIHVudXNlZCBwYWdlLCBpLmUuIHRvIHB1dCBhIHBhZ2Ugd2l0aG91
dCBtYXJraW5nCj4gaXQgYWNjZXNzZWQgb3IgZGlydHkuICBUaGUgQVBJIHdpbGwgYmUgdXNlZCB3
aGVuIEtWTSBmYXVsdHMtaW4gYSBwYWdlIGJ1dAo+IGJhaWxzIGJlZm9yZSBpbnN0YWxsaW5nIHRo
ZSBndWVzdCBtYXBwaW5nIChhbmQgb3RoZXIgc2ltaWxhciBmbG93cykuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KPiAtLS0KPiAgaW5j
bHVkZS9saW51eC9rdm1faG9zdC5oIHwgOSArKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaCBi
L2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAo+IGluZGV4IDNkOTYxN2QxZGU0MS4uYzVkMzlhMzM3
YWEzIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAo+ICsrKyBiL2luY2x1
ZGUvbGludXgva3ZtX2hvc3QuaAo+IEBAIC0xMjAxLDYgKzEyMDEsMTUgQEAgdW5zaWduZWQgbG9u
ZyBnZm5fdG9faHZhX3Byb3Qoc3RydWN0IGt2bSAqa3ZtLCBnZm5fdCBnZm4sIGJvb2wgKndyaXRh
YmxlKTsKPiAgdW5zaWduZWQgbG9uZyBnZm5fdG9faHZhX21lbXNsb3Qoc3RydWN0IGt2bV9tZW1v
cnlfc2xvdCAqc2xvdCwgZ2ZuX3QgZ2ZuKTsKPiAgdW5zaWduZWQgbG9uZyBnZm5fdG9faHZhX21l
bXNsb3RfcHJvdChzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90LCBnZm5fdCBnZm4sCj4gIAkJ
CQkgICAgICBib29sICp3cml0YWJsZSk7Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHZvaWQga3ZtX3Jl
bGVhc2VfcGFnZV91bnVzZWQoc3RydWN0IHBhZ2UgKnBhZ2UpCj4gK3sKPiArCWlmICghcGFnZSkK
PiArCQlyZXR1cm47Cj4gKwo+ICsJcHV0X3BhZ2UocGFnZSk7Cj4gK30KCkkgZ3Vlc3MgaXQncyB1
bmZhbWlsaWFyaXR5IHdpdGggdGhlIG1tIGxheW91dCBidXQgSSB3YXMgdHJ5aW5nIHRvIGZpbmQK
d2hlcmUgdGhlIGdldF9wYWdlcyBjb21lIGZyb20gdG8gc2VlIHRoZSBmdWxsIHBhdHRlcm4gb2Yg
YWxsb2NhdGUgYW5kCnJldHVybi4gSSBndWVzcyBzb21ld2hlcmUgaW4gdGhlIGRlcHRocyBvZiBo
dmFfdG9fcGZuKCkgZnJvbQpodmFfdG9fcGZuX3JldHJ5KCk/IEkgdGhpbmsgdGhlIGluZGlyZWN0
aW9uIG9mIHRoZSBwYWdlIHdhbGtpbmcgY29uZnVzZXMKbWUgOy0pCgpBbnl3YXkgdGhlIEFQSSBz
ZWVtcyByZWFzb25hYmxlIGVub3VnaCBnaXZlbiB0aGUgb3RoZXIga3ZtX3JlbGVhc2VfCmZ1bmN0
aW9ucy4KClJldmlld2VkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+
CgotLSAKQWxleCBCZW5uw6llClZpcnR1YWxpc2F0aW9uIFRlY2ggTGVhZCBAIExpbmFybwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
