Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD13CA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 18:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvqIiZ0zy1yPe8KfOiYA9xsWIqfbLEywoOLkCmahloc=; b=1VXhlwXvWD5Myb
	4nm4paPkNX8nAXd0eUQ6pDBjGiC9Bfz8f5XXqsQRbXnkQQt1rSpn1x09uZrO5k/i2xvZUori2kcf9
	vkfSoVhn9K83UpkZ0C4OvVfWlxXJD2DDCAVtR/M4+1uKB3+qOVpXcj83hC7uJeWmCZWREDcIIWwoY
	DFCc1JRbTWlBsTzz5FyD3WSxphZPQcgObIBl7n2fWmqDRwofUgIF4TGv6gR2QLh2WODH21ROjF50r
	7IAfGivbsopOYETOQuhktcg+XTzJAAxMAPlRXhv2rIG8cbpWSxFhEKDX1Vi981vTSltjEUM2dy7mk
	/Y9jWfJ61ILX63sQychA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWt7-00000008cpR-1VVx;
	Mon, 11 Aug 2025 18:04:49 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUI4-00000008AVR-2J9Q
	for linux-riscv@lists.infradead.org;
	Mon, 11 Aug 2025 15:18:25 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-4fc009e3050so3064573137.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 Aug 2025 08:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1754925503; x=1755530303; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3cN83hbz3/wbXvsSgM9D9acZ78Ipe3e/zyObUe8NXs=;
        b=Z9X7OmAHuhBwI8OVZXou2lMxbiexPQ2e3MBuZ2wUDdIDt6aVn24Sj7YQMRi5JBi93m
         oFurVcoMRsM+b3OeBJt6y6AENyLotubfbI0OTRL1Y6numJhG+1J7GTeJsBveMFdg56Rz
         2f8pQMLP0R5LGdJ5isI+GImnQx8HcPuH/kJIndZYb8+gcO+rjuQq9NQW2LOqJXL96qJ3
         BMJAq5exu5CiEusWvPAYs7HMJBFJ4/uiQvhnIviTkg3BLW4S/XkNQy7ivr1CGKPAESe8
         AP2u9rMPFQhDqNxYOlvyOih3MEQ/1HbcqnFM2aLrp9RSC1jo+a5Xr0sChJXMZvW9D5c1
         nC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754925503; x=1755530303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3cN83hbz3/wbXvsSgM9D9acZ78Ipe3e/zyObUe8NXs=;
        b=H+4R2hYIRXu2u4clX8aH8tl5+kFN7zxrg8dn9spmQXgg3b3SEEvjo0wMXQlBR/+5qn
         jKhas5WdYezxu6MhkQ7Q8COU16cnKgS02odORT5W+bOqoWPJGk+Wvxhn2p4dP9QkmTCV
         49j1IhqCsjM7YTac/Ki4eg8lrqxGUzrahaJBIoKdT5f5k2pM2Q3z+h0G+tL7OatH7Lrq
         n4gPfeo0xpzerbeOXxZ+21GqQO5a0fTFrk+AqdhYKpHYx80GsuUIMSBs/hLsHkYPyLYW
         6G8LKLDyIeBeLGOLNfcDoR4FnRRnGH0bI3L4g2qwHsxe2/4BsdAFLOFPGASS9+4xbpKJ
         f/3A==
X-Forwarded-Encrypted: i=1; AJvYcCUPet3IfiQNagqnP+OXTzt+/LrigxzuWawlk8W5Iv1ZjvzGVhBEmXpmjwaxAEX5J90nmh9ACSofR87nSA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4sWAADHwystl5zVi9DeQzWX/YnsPBxTpiIYkwmG3e6DHdUkl+
	KoNa/f7ecEJNJmAI7rJrgtbu8T6rOij9tmALFQj6cZrRZAeShxhlW/Sysmr1tckKI3+kTdjP0pv
	5tufN+BdW1HEJMFnIYbEWlAPZ7PmH4eBicbH6pItS4A==
X-Gm-Gg: ASbGncvaoIvUrCI1ZIixpjlUZPxf4HvFnZxPybaO9PBRBQLvZju+21Cl4YFhaO8IkJv
	xmItaLA34tzKFQu0TxLmodrRkCSbz1qEh64IFUV9BzAKYC4m/BPY3iYkPEZ4HdKQyhxAQIsRStC
	4DrbBRrlY2B5rNGrwXdUDTqGZlDyAIru2vBX1jIMkKfNGGy8WDmKp4nWX5/aXoI7sD90cMpYZG/
	24nTdO3
X-Google-Smtp-Source: AGHT+IEAyZ8rG3/BvdqEccF5il/zjHHBwHC2+zGGHvDSgxR6itSB9skJJt0JgvxBTy87l0X7786rmTyB8gLzGZDp05I=
X-Received: by 2002:a05:6102:5108:b0:4fb:dd4b:26cb with SMTP id
 ada2fe7eead31-5060d49ab6bmr4535085137.8.1754925503023; Mon, 11 Aug 2025
 08:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250811063352.1770-1-wangfushuai@baidu.com>
In-Reply-To: <20250811063352.1770-1-wangfushuai@baidu.com>
From: Jesse Taube <jesse@rivosinc.com>
Date: Mon, 11 Aug 2025 08:18:07 -0700
X-Gm-Features: Ac12FXxXyEahCu3pp1aY4hKwnpItf8sYWxyu9pOb6rZA0mGYeIFUty9bJ1jWqhw
Message-ID: <CALSpo=b4dO3B=U5+cfc3P0NnrtMf7_FJv6+vOPHCS_ezZR2XJw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Use for_each_online_cpu() instead of for_each_cpu()
To: Fushuai Wang <wangfushuai@baidu.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, ajones@ventanamicro.com, cleger@rivosinc.com, 
	charlie@rivosinc.com, evan@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_081824_767853_7C674CD1 
X-CRM114-Status: GOOD (  14.48  )
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

T24gU3VuLCBBdWcgMTAsIDIwMjUgYXQgMTE6MzTigK9QTSBGdXNodWFpIFdhbmcgPHdhbmdmdXNo
dWFpQGJhaWR1LmNvbT4gd3JvdGU6Cj4KPiBSZXBsYWNlIHRoZSBvcGVuY29kZWQgZm9yX2VhY2hf
Y3B1KGNwdSwgY3B1X29ubGluZV9tYXNrKSBsb29wIHdpdGggdGhlCj4gbW9yZSByZWFkYWJsZSBh
bmQgZXF1aXZhbGVudCBmb3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkgbWFjcm8uCj4KPiBTaWduZWQt
b2ZmLWJ5OiBGdXNodWFpIFdhbmcgPHdhbmdmdXNodWFpQGJhaWR1LmNvbT4KPiAtLS0KPiAgYXJj
aC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jIHwgNCArKy0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jCj4gaW5kZXggYWUyMDY4NDI1ZmJjLi41
ZTExYjFiZDliMmEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2Fj
Y2Vzc19zcGVlZC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19z
cGVlZC5jCj4gQEAgLTE1MCw3ICsxNTAsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgY2hlY2tfdW5h
bGlnbmVkX2FjY2Vzc19zcGVlZF9hbGxfY3B1cyh2b2lkKQo+ICAgICAgICAgICogQWxsb2NhdGUg
c2VwYXJhdGUgYnVmZmVycyBmb3IgZWFjaCBDUFUgc28gdGhlcmUncyBubyBmaWdodGluZyBvdmVy
Cj4gICAgICAgICAgKiBjYWNoZSBsaW5lcy4KPiAgICAgICAgICAqLwo+IC0gICAgICAgZm9yX2Vh
Y2hfY3B1KGNwdSwgY3B1X29ubGluZV9tYXNrKSB7Cj4gKyAgICAgICBmb3JfZWFjaF9vbmxpbmVf
Y3B1KGNwdSkgewo+ICAgICAgICAgICAgICAgICBidWZzW2NwdV0gPSBhbGxvY19wYWdlcyhHRlBf
S0VSTkVMLCBNSVNBTElHTkVEX0JVRkZFUl9PUkRFUik7Cj4gICAgICAgICAgICAgICAgIGlmICgh
YnVmc1tjcHVdKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcHJfd2FybigiQWxsb2NhdGlv
biBmYWlsdXJlLCBub3QgbWVhc3VyaW5nIG1pc2FsaWduZWQgcGVyZm9ybWFuY2VcbiIpOwo+IEBA
IC0xNjUsNyArMTY1LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nl
c3Nfc3BlZWRfYWxsX2NwdXModm9pZCkKPiAgICAgICAgIHNtcF9jYWxsX29uX2NwdSgwLCBjaGVj
a191bmFsaWduZWRfYWNjZXNzLCBidWZzWzBdLCB0cnVlKTsKPgo+ICBvdXQ6Cj4gLSAgICAgICBm
b3JfZWFjaF9jcHUoY3B1LCBjcHVfb25saW5lX21hc2spIHsKPiArICAgICAgIGZvcl9lYWNoX29u
bGluZV9jcHUoY3B1KSB7CgpHb29kIGZpbmQuClJldmlld2VkLWJ5OiBKZXNzZSBUYXViZSA8amVz
c2VAcml2b3NpbmMuY29tPgoKPiAgICAgICAgICAgICAgICAgaWYgKGJ1ZnNbY3B1XSkKPiAgICAg
ICAgICAgICAgICAgICAgICAgICBfX2ZyZWVfcGFnZXMoYnVmc1tjcHVdLCBNSVNBTElHTkVEX0JV
RkZFUl9PUkRFUik7Cj4gICAgICAgICB9Cj4gLS0KPiAyLjM2LjEKPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
