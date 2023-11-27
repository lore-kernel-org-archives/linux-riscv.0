Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FFBC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 14:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L+PYUgZzDzp7L/KfXWhZGzo30JCAvJmxmGmIXDPRV1Q=; b=MtZ/QQLrc1lzcF
	EFHkCP678/Y4ayjRNuJN/ritRBCYw4WPPo9rsz7StT54IdIxCyB2PDt7r+EQzb0VM0Xjb1bfhruu4
	VNM1yAGJJ4y3Qcp1Q8Dj2ltnhz9+kaxTB8KeH1aKIrSifGx5BujTEj0nOktfETW7l8vkAVz4q2o6r
	BZrDy33AIEUvbdGM5St7Esgb0BhDRx50oyKIHPM1X63AWMZ+dhl8JPW9q5NQuOxXWhAJoKwLBDInT
	GeOJNSObg7j4u3Xpma/45t3Za0g8z7cSP8beCYOQh0X1gD2KkD7I1JlzybREKVm+wlPTDpVDxhkfO
	GlxyxI7ZwADY/60Wkc6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7cfG-002hxX-0o;
	Mon, 27 Nov 2023 14:32:46 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7cfC-002hwZ-2H
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 14:32:44 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-35cb62e3905so5554895ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Nov 2023 06:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701095561; x=1701700361; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=576agieZsbz96FiroK7MxYXEH2pDI3CMW/6FzJlxhYw=;
        b=mIRlTH1YMNxELrBhhWsQnRp79USQgz24cxcBkgcUHwM/7Ww8N2hC5yYYZTuBEChqaV
         Uj9iVvTULmzv85lT4Nrr72shcJl/nTw/i2gsfg+2XFAc12zPiu/Cd5L1zyLXbPp8w0u/
         O22iFAyuFIv6mQPY0PBQYYDoiwyEbZq+WE7AbjbHgIyltIUE3yfKQjplNp72xdB2MvW9
         01Rul2CWkxU0ebXwk8CEiE4MvC+w/7Y5A5IlRrHfpjkiMEJEOTzNQ0+bWWHk6xYRUmwY
         1ZDzl08PgcQDp5r0xXCmEhmyTxK5FkB/618M8SEvJcclkK/D8gFi/+SeGGr4i1Kbc+12
         qGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701095561; x=1701700361;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=576agieZsbz96FiroK7MxYXEH2pDI3CMW/6FzJlxhYw=;
        b=EsQ/YJfamo62L36qgwW3HyuOpaOr12I64UbryacEeOy2tmXefC0V8+Vvz2PFHng77/
         QDjEKEmYm7ZbJRCFju9hqogUvTZOFsyHZkf7QA0b9UEymstOo6dU/N3F0mHzquDbjPYh
         HB4sOclyqYi7/fXsgbIa30sF7YBfS72mbadZlUPq2qtzNONKnu3BRmKf7jfg6rIeFhlU
         mD5+eh/yUpPi0rgGXu6VwqyCWLWP4dlUGi8r1+Hk4VJ5pEIk5+JQLve5FmJQauOIJc3n
         bgRMBW87k+TAV4ViF7ZV2vWX83w2xMGXJuc3eS6+5IEAWt6t7emt8ZvrmHIb8VUyRh1l
         FLZw==
X-Gm-Message-State: AOJu0YyTHYNOPkRm0TNLQhuiPHzLf/kohJWUM21GJ7Mi5Z5MYAMuC+Tu
	nGrBtoE1zE7NVZ7QkmPubGwshQ==
X-Google-Smtp-Source: AGHT+IG/WGxpvGREvrXBuOJjwOgK3X/z7+Um3ekxoELlMVLqyywHQeQ7S80IRt40ldOt+Chf9dKILA==
X-Received: by 2002:a05:6e02:388a:b0:35c:5131:cc9f with SMTP id cn10-20020a056e02388a00b0035c5131cc9fmr13225931ilb.23.1701095560675;
        Mon, 27 Nov 2023 06:32:40 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:2dd6:4d2f:2741:8d95? ([2605:a601:adae:4500:2dd6:4d2f:2741:8d95])
        by smtp.gmail.com with ESMTPSA id l15-20020a056e020e4f00b0035b0b56e0e1sm1987657ilk.53.2023.11.27.06.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 06:32:40 -0800 (PST)
Message-ID: <2de6d526-918b-44f6-b26a-a0f30c42c5b3@sifive.com>
Date: Mon, 27 Nov 2023 08:32:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] RISC-V: Expose Ssdtso via hwprobe API
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>
References: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
 <20231124072142.2786653-3-christoph.muellner@vrull.eu>
Cc: linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Anup Patel <apatel@ventanamicro.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Andrew Jones <ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Alan Stern <stern@rowland.harvard.edu>,
 Andrea Parri <parri.andrea@gmail.com>, Will Deacon <will@kernel.org>,
 Daniel Lustig <dlustig@nvidia.com>, Peter Zijlstra <peterz@infradead.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231124072142.2786653-3-christoph.muellner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_063242_792409_59FCA46F 
X-CRM114-Status: GOOD (  18.14  )
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

SGkgQ2hyaXN0b3BoLAoKT24gMjAyMy0xMS0yNCAxOjIxIEFNLCBDaHJpc3RvcGggTXVlbGxuZXIg
d3JvdGU6Cj4gRnJvbTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1
bGwuZXU+Cj4gCj4gVGhpcyBwYXRjaCBhZGRzIFNzZHRzbyB0byB0aGUgbGlzdCBvZiBleHRlbnNp
b25zIHdoaWNoCj4gYXJlIGFubm91bmNlZCB0byB1c2VyLXNwYWNlIHVzaW5nIHRlIGh3cHJvYmUg
QVBJLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11
ZWxsbmVyQHZydWxsLmV1Pgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9i
ZS5yc3QgIHwgMyArKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCB8
IDEgKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyAgICAgICAgIHwgMSArCj4gIDMg
ZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9o
d3Byb2JlLnJzdAo+IGluZGV4IDdiMjM4NGRlNDcxZi4uOGRlMzM0OWUwY2EyIDEwMDY0NAo+IC0t
LSBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+ICsrKyBiL0RvY3VtZW50
YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+IEBAIC04MCw2ICs4MCw5IEBAIFRoZSBmb2xs
b3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKPiAgICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VY
VF9aSUNCT1pgOiBUaGUgWmljYm96IGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQsIGFzCj4gICAgICAg
ICByYXRpZmllZCBpbiBjb21taXQgM2RkNjA2ZiAoIkNyZWF0ZSBjbW9iYXNlLXYxLjAucGRmIikg
b2YgcmlzY3YtQ01Pcy4KPiAgCj4gKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWklD
Qk9aYDogVGhlIFNzZHRzbyBleHRlbnNpb24gaXMgc3VwcG9ydGVkLCBhcwoKU2hvdWxkIGJlIFJJ
U0NWX0hXUFJPQkVfRVhUX1NTRFRTTy4KClJlZ2FyZHMsClNhbXVlbAoKPiArICAgICAgIGluIHZl
cnNpb24gdjEuMC1kcmFmdDIgb2YgdGhlIGNvcnJlc3BvbmRpbmcgZXh0ZW5zaW9uLgo+ICsKPiAg
KiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wYDogQSBiaXRtYXNrIHRoYXQg
Y29udGFpbnMgcGVyZm9ybWFuY2UKPiAgICBpbmZvcm1hdGlvbiBhYm91dCB0aGUgc2VsZWN0ZWQg
c2V0IG9mIHByb2Nlc3NvcnMuCj4gIAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
dWFwaS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUu
aAo+IGluZGV4IGI2NTlmZmNmY2RiNC4uZWQ0NTBjNjRlNmIyIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4gQEAgLTMwLDYgKzMwLDcgQEAgc3RydWN0IHJpc2N2X2h3
cHJvYmUgewo+ICAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQkIJCSgxIDw8IDQpCj4gICNk
ZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pCUwkJKDEgPDwgNSkKPiAgI2RlZmluZQkJUklTQ1Zf
SFdQUk9CRV9FWFRfWklDQk9aCSgxIDw8IDYpCj4gKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhU
X1NTRFRTTwkoMSA8PCA3KQo+ICAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMAk1
Cj4gICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9VTktOT1dOCSgwIDw8IDApCj4g
ICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9FTVVMQVRFRAkoMSA8PCAwKQo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3N5c19yaXNjdi5jCj4gaW5kZXggYzcxMjAzN2RiZTEwLi5jNjU0ZjQzYjk2OTkgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKPiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9zeXNfcmlzY3YuYwo+IEBAIC0xNjIsNiArMTYyLDcgQEAgc3RhdGljIHZvaWQgaHdw
cm9iZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKPiAgCQlFWFRfS0VZKFpC
Qik7Cj4gIAkJRVhUX0tFWShaQlMpOwo+ICAJCUVYVF9LRVkoWklDQk9aKTsKPiArCQlFWFRfS0VZ
KFNTRFRTTyk7Cj4gICN1bmRlZiBFWFRfS0VZCj4gIAl9Cj4gIAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
