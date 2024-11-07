Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05E5D5AE78
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 09:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=waQ7gr3+IQbEmMHJlErLUS1CfBpAP7CVcP3pTEjxCUA=; b=Wut/CLz0lGjdBH
	c3FC9RcJzK2L9OyrfBIQ9VxJH5K/JhjBguN6LplP7RSPhFyB11EocOi/+awKwk+wh0/eV0hiMWX4a
	d0YcG2J7mQYkzRgfSZMW8Lf/iMCt5kpDzdAhDgW6Sl+blU/85ZVrGDqFUADICHksVpUHsVr/vy1Ul
	v82pQGuwXwtDZbMK7DfD27yu96ql+ZzeLJNRcc+QFRUpYZgfr3qZ9/Ka+BK6gGvg9zeIzGow1woW5
	O6fFuBcrY2f8uC/Ogd168yUx8nLRYyN+3EZl8FyO/y8vkYq7JsMR8yY7745Dka41wgxorPEPGfNVw
	Dsg8zULBijaguqAFKVBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8yZQ-00000006G5u-3J3m;
	Thu, 07 Nov 2024 09:12:52 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8yZO-00000006G51-0eSs
	for linux-riscv@lists.infradead.org;
	Thu, 07 Nov 2024 09:12:51 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-37d43a9bc03so453202f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Nov 2024 01:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730970768; x=1731575568; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CSGQrTX6RPEJ5ltwOkhPplbF6XskuwzGte6a11RVMyU=;
        b=kvP7/8yPjtn6nweAmqgaSNgDUHlBVORADrwJLWRneaZ/14uEhDDNpNudJbCxbobqCU
         FEiHh8EUKFl/4TzExPyimPf7hxmlYsTLWJlHZPwiaWcnc54ayxs2TIG+MzKlbyMW+Ujy
         cec1H7aAGq/5l+/5TFOiIxF+AxkySBfo4tgJhOMHtnWDoMrV4NLsIy4LbdMZe9j9VY5+
         yk/TdeaBji6zr+1GRwUjH1wN6asz9gMDrkElfy3xagJEpjw10ZTgBG58sprqaGilKqfH
         KO5FLSfjFbr17VUvfsGinoj03GnwK/Ek+0iYv0SbGlLge9Zcw3nB8+jpmKcCcPaFiptw
         CSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730970768; x=1731575568;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CSGQrTX6RPEJ5ltwOkhPplbF6XskuwzGte6a11RVMyU=;
        b=K/Zf+fPIJOxBTk+BvYmwbFxYGcf1Atosh7bVtNh9Mizukos4ealr8U+5IwSaH/U1sE
         nT6bYvFe+kTAosgC9YEUpaqlh0InwgGVwczXfqgOQutwNoIIg94w0GiXW22ywRVCmsNL
         wkC3qmgeTatVC3wLZyxWUe7BrUxepEtwsn0jBkWiGZoMjZvmMigYq4KUi+eofE3zYlDf
         1jxbCxnNDYo1t4WQwEW8FuBgB+REepGGupf1GrP8Cg+116BR8z/N5bX1n7AB8JFlKrWs
         P7QnUQ7FiNkvk2F9HNvPO7AIOaiXQOJN1+YRgoC/a//W7D5+sL0DYznhwKvS64aq/pdW
         7XJg==
X-Forwarded-Encrypted: i=1; AJvYcCXcBnNfGw6m7oHXeFYGIyj4Layv3tn8ccIQBfz6IqKZE4ai7T3DeKP2+YGXHeZMn6OE60aVmsKF1wzh1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgOoz5b7LxT4IZKZtNPrJH2w2+5OdYjRQo2F038+F1ouJb2S8P
	G4tgPl4ecFV8DDn/+jvg23Gja4jRrf0LgoNqoPUxJ9LL6cGpwMrT8V/2FYkFXfw=
X-Google-Smtp-Source: AGHT+IEMgszAeoujvnm+EHb15Ezxw32/wzRi/AgvpY4lG2K21v203JKIrGkQz4rMrdtjTjqkqPH+Bw==
X-Received: by 2002:a5d:64c7:0:b0:37d:4937:c9eb with SMTP id ffacd0b85a97d-381c7a5e2bfmr19441264f8f.21.1730970767795;
        Thu, 07 Nov 2024 01:12:47 -0800 (PST)
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda04ad0sm1145847f8f.100.2024.11.07.01.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 01:12:47 -0800 (PST)
Date: Thu, 7 Nov 2024 09:13:07 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: bpf@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Quentin Monnet <qmo@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Abdurachmanov <davidlt@rivosinc.com>
Subject: Re: [PATCH] tools: Override makefile ARCH variable if defined, but
 empty
Message-ID: <20241107091307.GA2016393@myrica>
References: <20241106193208.290067-1-bjorn@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241106193208.290067-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_011250_281772_F1E0E44B 
X-CRM114-Status: GOOD (  19.54  )
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

T24gV2VkLCBOb3YgMDYsIDIwMjQgYXQgMDg6MzI6MDZQTSArMDEwMCwgQmrDtnJuIFTDtnBlbCB3
cm90ZToKPiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gCj4gVGhl
cmUgYXJlIGEgbnVtYmVyIG9mIHRvb2xzIChicGZ0b29sLCBzZWxmdGVzdHMpLCB0aGF0IHJlcXVp
cmUgYQo+ICJib290c3RyYXAiIGJ1aWxkLiBIZXJlLCBhIGJvb3RzdHJhcCBidWlsZCBpcyBhIGJ1
aWxkIGhvc3QgdmFyaWFudCBvZgo+IGEgdGFyZ2V0LiBFLmcuLCBhc3N1bWUgdGhhdCB5b3UncmUg
cGVyZm9ybWluZyBhIGJwZnRvb2wgY3Jvc3MtYnVpbGQgb24KPiB4ODYgdG8gcmlzY3YsIGEgYm9v
dHN0cmFwIGJ1aWxkIHdvdWxkIHRoZW4gYmUgYW4geDg2IHZhcmlhbnQgb2YKPiBicGZ0b29sLiBU
aGUgdHlwaWNhbCB3YXkgdG8gcGVyZm9ybSB0aGUgaG9zdCBidWlsZCB2YXJpYW50LCBpcyB0byBw
YXNzCj4gIkFSQ0g9IiBpbiBhIHN1Yi1tYWtlLiBIb3dldmVyLCBpZiBhIHZhcmlhYmxlIGhhcyBi
ZWVuIHNldCB3aXRoIGEKPiBjb21tYW5kIGFyZ3VtZW50LCB0aGVuIG9yZGluYXJ5IGFzc2lnbm1l
bnRzIGluIHRoZSBtYWtlZmlsZSBhcmUKPiBpZ25vcmVkLgo+IAo+IFRoaXMgc2lkZS1lZmZlY3Qg
cmVzdWx0cyBpbiB0aGF0IEFSQ0gsIGFuZCB2YXJpYWJsZXMgZGVwZW5kaW5nIG9uIEFSQ0gKPiBh
cmUgbm90IHNldC4KPiAKPiBXb3JrYXJvdW5kIGJ5IG92ZXJyaWRpbmcgQVJDSCB0byB0aGUgaG9z
dCBhcmNoLCBpZiBBUkNIIGlzIGVtcHR5Lgo+IAo+IEZpeGVzOiA4ODU5YjBkYTVhYWMgKCJ0b29s
cy9icGZ0b29sOiBGaXggY3Jvc3MtYnVpbGQiKQo+IFNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7Zw
ZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KClJldmlld2VkLWJ5OiBKZWFuLVBoaWxpcHBlIEJydWNr
ZXIgPGplYW4tcGhpbGlwcGVAbGluYXJvLm9yZz4KCj4gLS0tCj4gIHRvb2xzL3NjcmlwdHMvTWFr
ZWZpbGUuYXJjaCB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90b29scy9zY3JpcHRzL01ha2VmaWxlLmFy
Y2ggYi90b29scy9zY3JpcHRzL01ha2VmaWxlLmFyY2gKPiBpbmRleCBmNmE1MGYwNmRmYzQuLmVh
YmZlOWY0MTFkOSAxMDA2NDQKPiAtLS0gYS90b29scy9zY3JpcHRzL01ha2VmaWxlLmFyY2gKPiAr
KysgYi90b29scy9zY3JpcHRzL01ha2VmaWxlLmFyY2gKPiBAQCAtNyw4ICs3LDggQEAgSE9TVEFS
Q0ggOj0gJChzaGVsbCB1bmFtZSAtbSB8IHNlZCAtZSBzL2kuODYveDg2LyAtZSBzL3g4Nl82NC94
ODYvIFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC1lIHMvc2hbMjM0XS4q
L3NoLyAtZSBzL2FhcmNoNjQuKi9hcm02NC8gXAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLWUgcy9yaXNjdi4qL3Jpc2N2LyAtZSBzL2xvb25nYXJjaC4qL2xvb25nYXJjaC8p
Cj4gIAo+IC1pZm5kZWYgQVJDSAo+IC1BUkNIIDo9ICQoSE9TVEFSQ0gpCj4gK2lmZXEgKCQoc3Ry
aXAgJChBUkNIKSksKQo+ICtvdmVycmlkZSBBUkNIIDo9ICQoSE9TVEFSQ0gpCj4gIGVuZGlmCj4g
IAo+ICBTUkNBUkNIIDo9ICQoQVJDSCkKPiAKPiBiYXNlLWNvbW1pdDogNzc1OGIyMDYxMTdkYWI5
ODk0ZjBiY2I4MzMzZjhlNDczMWM1MDY1YQo+IC0tIAo+IDIuNDUuMgo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
