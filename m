Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000F5C761A6
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 11:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dPDJIjUsoZzqw7PmB+kMk762ZtlO3k+dXGpqFCnrqTs=; b=XaiL0kx0CvB5ww
	TVOWLbFztNnwQXKy8QdQNuIu1cOUXQJUofxJu4BK4Gpo70rUaICo9p3l+FMIUhIBLEk1Ef7lIC82L
	LQujuwCvdM4bcMO8zM2IAuDDx27rwGmgCataILvDDPMr6N7rrdfMAE5aPrOeZwjWFn7hoNSbZGw4d
	emWQgW4cgPy0eOXT61l5mpzAwRK4TspnckWy5EF5bKG/6ll7yfPE8ofwW3htqlFGj4AW9cUcronmr
	5GyEgAAUek7SHV4O/JZh2qm/legeRdW0OPAd/oQczcVJLxdTqvnZR06EnXgyv6o4Qx1FdfPjSo7up
	2F7AQ8E6s6YciGaun5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk1KZ-004H4I-0z;
	Wed, 05 Apr 2023 11:29:35 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk1KV-004H3C-33
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 11:29:33 +0000
Received: by mail-pj1-x102a.google.com with SMTP id r7-20020a17090b050700b002404be7920aso35163535pjz.5
        for <linux-riscv@lists.infradead.org>; Wed, 05 Apr 2023 04:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680694171;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D4c1T5yq9j98I4xqzpkXy98H9NvOxhgZzRxqtRXXoJ8=;
        b=gEdmzXz0VIfLxJ35ejE+hqigBd3ZlAebMNBtkV6vu61mKZHcpX9p2jnF1isA21YZIM
         3kDnX+jNcaPCNXXmKITQmBn/dZKyUNwjEqTd/EwtALeGgF/kSEnRpv+ERLYe1z/Sfq4G
         u4HXyAkV0wvl89N1Pjd6gFnwZvqzskXqusycuN4RQZWWBu3GWsrLGlxlt/kmUslAQhzo
         LZDC0KFmqiBC7ClzCjU/BA5Meb1jEsNvGHJNi6UCZe/+6l7JHXYHv+W4reUxuL9NXVYv
         QZq4/aMSdFAAiIXiYz/5PEJ0TZ2UhjoODy4m3WsAztl7rAOs2Wo2M77aSaZtWBQpSM6T
         zQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680694171;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4c1T5yq9j98I4xqzpkXy98H9NvOxhgZzRxqtRXXoJ8=;
        b=jNp/67pdEUUErkAPnkYzzyn89xfQJRzziOu1r1HwlXJG54S64WQoL8f1HmKuaB1GnG
         SL1IrblRGIBSfc9Bkjzi6CsZ0YmsMwnN8HXkE0gxiIt56qYCYuCEuyOQ/2WbeKRwiPoE
         OkbrVEc0xV/K9wPUPiBY3nv4kF8hAPFfNOR4ZhkDmJL7P+KmU3ESSpy4Waq8ce78n+Vo
         bqurzSQyo7Tv7Sms1AFctDguIt721IJEN22JwQmcna5+8XVcZQMxYrnjNm0kIzPXKHVx
         Cd046uRijUaZnp7Me2Xl72U+7ywfI9qsuXfFzKeldfdQLZ5aKhNm5KsBXFdC+PIUTUhR
         KCgw==
X-Gm-Message-State: AAQBX9eNOk25ns70k5YoWOzAg2ZIlpaabYVRkIK+KbqQMCW56PdpSkeY
	OyJVlByquZdw1c83kz6f0wkm/A==
X-Google-Smtp-Source: AKy350aEX+UO+F4lAIjzoSB5aZthgg5fu+oXk5GINgl1jGRsgPHII856swqYeTDojSQysuvDeoDPdQ==
X-Received: by 2002:a17:903:244b:b0:1a0:7425:4b73 with SMTP id l11-20020a170903244b00b001a074254b73mr2119520pls.4.1680694170755;
        Wed, 05 Apr 2023 04:29:30 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id m10-20020a170902bb8a00b001a1d553de0fsm9852768pls.271.2023.04.05.04.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 04:29:30 -0700 (PDT)
Date: Wed, 5 Apr 2023 16:59:18 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-doc@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-acpi@vger.kernel.org, linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, llvm@lists.linux.dev,
	Weili Qian <qianweili@huawei.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Herbert Xu <herbert@gondor.apana.org.au>, Tom Rix <trix@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Mark Gross <markgross@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Len Brown <lenb@kernel.org>
Subject: Re: [PATCH V4 22/23] platform/surface: Disable for RISC-V
Message-ID: <ZC1bjmdMqYqSnIHP@sunil-laptop>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-23-sunilvl@ventanamicro.com>
 <EAC85F14-B1DA-4358-9042-A607436D582A@jrtc27.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <EAC85F14-B1DA-4358-9042-A607436D582A@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_042931_990895_7EF4C26F 
X-CRM114-Status: GOOD (  27.65  )
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

SGkgSmVzcywKCk9uIFdlZCwgQXByIDA1LCAyMDIzIGF0IDA1OjE5OjM1QU0gKzAxMDAsIEplc3Np
Y2EgQ2xhcmtlIHdyb3RlOgo+IE9uIDQgQXByIDIwMjMsIGF0IDE5OjIwLCBTdW5pbCBWIEwgPHN1
bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPiAKPiA+IFdpdGggQ09ORklHX0FDUEkg
ZW5hYmxlZCBmb3IgUklTQy1WLCB0aGlzIGRyaXZlciBnZXRzIGVuYWJsZWQKPiA+IGluIGFsbG1v
ZGNvbmZpZyBidWlsZC4gSG93ZXZlciwgUklTQy1WIGRvZXNuJ3Qgc3VwcG9ydCBzdWItd29yZAo+
ID4gYXRvbWljcyB3aGljaCBpcyB1c2VkIGJ5IHRoaXMgZHJpdmVyLgo+IAo+IFdoeSBub3Q/IENv
bXBpbGVycyBhbmQgbGliYXRvbWljIGRvLCBzbyBzdXJlbHkgdGhlIExpbnV4IGtlcm5lbCBzaG91
bGQKPiB0b28uCj4KSSB0aGluayB5b3UgYXJlIHByb2JhYmx5IHJpZ2h0LiBCdXQgSSBkb24ndCB3
YW50IHRvIGNvbWJpbmUgdGhhdAphY3Rpdml0eSB3aXRoIHRoaXMgc2VyaWVzLiBJTU8sIHRoYXQg
c2hvdWxkIGJlIHNlcGFyYXRlIGFjdGl2aXR5LgogCj4gPiBEdWUgdG8gdGhpcywgdGhlIGJ1aWxk
IGZhaWxzCj4gPiB3aXRoIGJlbG93IGVycm9yLgo+ID4gCj4gPiBJbiBmdW5jdGlvbiDDouKCrMuc
c3NoX3NlcV9uZXh0w6LigqzihKIsCj4gPiAgICBpbmxpbmVkIGZyb20gw6LigqzLnHNzYW1fcmVx
dWVzdF93cml0ZV9kYXRhw6LigqzihKIgYXQgZHJpdmVycy9wbGF0Zm9ybS9zdXJmYWNlL2FnZ3Jl
Z2F0b3IvY29udHJvbGxlci5jOjE0ODM6ODoKPiA+IC4vLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVy
X3R5cGVzLmg6Mzk5OjQ1OiBlcnJvcjogY2FsbCB0byDDouKCrMucX19jb21waWxldGltZV9hc3Nl
cnRfMzM1w6LigqzihKIgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUgZXJyb3I6IEJVSUxEX0JVRyBm
YWlsZWQKPiA+ICAzOTkgfCAgICAgICAgIF9jb21waWxldGltZV9hc3NlcnQoY29uZGl0aW9uLCBt
c2csIF9fY29tcGlsZXRpbWVfYXNzZXJ0XywgX19DT1VOVEVSX18pCj4gPiAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gPiAuL2luY2x1ZGUvbGlu
dXgvY29tcGlsZXIuaDo3ODo0NTogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyDDouKCrMuc
dW5saWtlbHnDouKCrOKEogo+ID4gICA3OCB8ICMgZGVmaW5lIHVubGlrZWx5KHgpICAgIF9fYnVp
bHRpbl9leHBlY3QoISEoeCksIDApCj4gPiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBeCj4gPiAuLy4vaW5jbHVkZS9saW51eC9jb21waWxlcl90eXBl
cy5oOjM4Nzo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gw6LigqzLnF9fY29tcGlsZXRp
bWVfYXNzZXJ0w6LigqzihKIKPiA+ICAzODcgfCAgICAgICAgIF9fY29tcGlsZXRpbWVfYXNzZXJ0
KGNvbmRpdGlvbiwgbXNnLCBwcmVmaXgsIHN1ZmZpeCkKPiA+ICAgICAgfCAgICAgICAgIF5+fn5+
fn5+fn5+fn5+fn5+fn5+Cj4gPiAuLy4vaW5jbHVkZS9saW51eC9jb21waWxlcl90eXBlcy5oOjM5
OTo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gw6LigqzLnF9jb21waWxldGltZV9hc3Nl
cnTDouKCrOKEogo+ID4gIDM5OSB8ICAgICAgICAgX2NvbXBpbGV0aW1lX2Fzc2VydChjb25kaXRp
b24sIG1zZywgX19jb21waWxldGltZV9hc3NlcnRfLCBfX0NPVU5URVJfXykKPiA+ICAgICAgfCAg
ICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KPiA+IC4vaW5jbHVkZS9saW51eC9idWlsZF9idWcu
aDozOTozNzogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIMOi4oKsy5xjb21waWxldGltZV9h
c3NlcnTDouKCrOKEogo+ID4gICAzOSB8ICNkZWZpbmUgQlVJTERfQlVHX09OX01TRyhjb25kLCBt
c2cpIGNvbXBpbGV0aW1lX2Fzc2VydCghKGNvbmQpLCBtc2cpCj4gPiAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiAuL2luY2x1
ZGUvbGludXgvYnVpbGRfYnVnLmg6NTk6MjE6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDD
ouKCrMucQlVJTERfQlVHX09OX01TR8Oi4oKs4oSiCj4gPiAgIDU5IHwgI2RlZmluZSBCVUlMRF9C
VUcoKSBCVUlMRF9CVUdfT05fTVNHKDEsICJCVUlMRF9CVUcgZmFpbGVkIikKPiA+ICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4KPiA+IC4vYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9jbXB4Y2hnLmg6MzM1OjE3OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gw6Li
gqzLnEJVSUxEX0JVR8Oi4oKs4oSiCj4gPiAgMzM1IHwgICAgICAgICAgICAgICAgIEJVSUxEX0JV
RygpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAg
ICB8ICAgICAgICAgICAgICAgICBefn5+fn5+fn4KPiA+IC4vYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9jbXB4Y2hnLmg6MzQ0OjMwOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gw6LigqzLnF9f
Y21weGNoZ8Oi4oKs4oSiCj4gPiAgMzQ0IHwgICAgICAgICAoX190eXBlb2ZfXygqKHB0cikpKSBf
X2NtcHhjaGcoKHB0ciksICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+Cj4gPiAuL2luY2x1ZGUvbGludXgv
YXRvbWljL2F0b21pYy1pbnN0cnVtZW50ZWQuaDoxOTE2Ojk6IG5vdGU6IGluIGV4cGFuc2lvbiBv
ZiBtYWNybyDDouKCrMucYXJjaF9jbXB4Y2hnw6LigqzihKIKPiA+IDE5MTYgfCAgICAgICAgIGFy
Y2hfY21weGNoZyhfX2FpX3B0ciwgX19WQV9BUkdTX18pOyBcCj4gPiAgICAgIHwgICAgICAgICBe
fn5+fn5+fn5+fn4KPiA+IGRyaXZlcnMvcGxhdGZvcm0vc3VyZmFjZS9hZ2dyZWdhdG9yL2NvbnRy
b2xsZXIuYzo2MTozMjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIMOi4oKsy5xjbXB4Y2hn
w6LigqzihKIKPiA+ICAgNjEgfCAgICAgICAgIHdoaWxlICh1bmxpa2VseSgocmV0ID0gY21weGNo
ZygmYy0+dmFsdWUsIG9sZCwgbmV3KSkgIT0gb2xkKSkgewo+ID4gICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBefn5+fn5+Cj4gPiAKPiA+IFNvLCBkaXNhYmxlIHRoaXMgZHJp
dmVyIGZvciBSSVNDLVYgZXZlbiB3aGVuIEFDUEkgaXMgZW5hYmxlZCBmb3Igbm93Lgo+ID4gCj4g
PiBTaWduZWQtb2ZmLWJ5OiBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4KPiA+
IC0tLQo+ID4gZHJpdmVycy9wbGF0Zm9ybS9zdXJmYWNlL2FnZ3JlZ2F0b3IvS2NvbmZpZyB8IDIg
Ky0KPiA+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4g
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS9zdXJmYWNlL2FnZ3JlZ2F0b3IvS2Nv
bmZpZyBiL2RyaXZlcnMvcGxhdGZvcm0vc3VyZmFjZS9hZ2dyZWdhdG9yL0tjb25maWcKPiA+IGlu
ZGV4IGMxMTRmOWRkNWZlMS4uODhhZmMzOGZmZGM1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9w
bGF0Zm9ybS9zdXJmYWNlL2FnZ3JlZ2F0b3IvS2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy9wbGF0
Zm9ybS9zdXJmYWNlL2FnZ3JlZ2F0b3IvS2NvbmZpZwo+ID4gQEAgLTQsNyArNCw3IEBACj4gPiBt
ZW51Y29uZmlnIFNVUkZBQ0VfQUdHUkVHQVRPUgo+ID4gCXRyaXN0YXRlICJNaWNyb3NvZnQgU3Vy
ZmFjZSBTeXN0ZW0gQWdncmVnYXRvciBNb2R1bGUgU3Vic3lzdGVtIGFuZCBEcml2ZXJzIgo+ID4g
CWRlcGVuZHMgb24gU0VSSUFMX0RFVl9CVVMKPiA+IC0JZGVwZW5kcyBvbiBBQ1BJCj4gPiArCWRl
cGVuZHMgb24gQUNQSSAmJiAhUklTQ1YKPiAKPiBJZiB5b3UgaW5zaXN0IG9uIGRvaW5nIHRoaXMs
IGF0IGxlYXN0IG1ha2UgaXQgc29tZSBuZXcgY29uZmlnIHZhcmlhYmxlCj4gdGhhdOKAmXMgc2Vs
Zi1kb2N1bWVudGluZyBhbmQgbWVhbnMgdGhpcyBhdXRvbWF0aWNhbGx5IGdldHMgcmUtZW5hYmxl
ZAo+IHdoZW4gYXJjaC9yaXNjdiBmaXhlcyB0aGlzIGRlZmljaWVuY3k/IEhhcmQtY29kaW5nIGFy
Y2ggbGlzdHMgbGlrZSB0aGlzCj4gc2VlbXMgbGlrZSBhIHRlcnJpYmxlIGFudGktcGF0dGVybi4K
PiAKSSB1bmRlcnN0YW5kIHlvdXIgcG9pbnQuIEJ1dCBnaXZlbiB0aGF0IHRoaXMgaXMgY3VycmVu
dGx5IG9ubHkgaXNzdWUgd2l0aAphIHNpbmdsZSBkcml2ZXIgZnJvbSBNaWNyb3NvZnQgYW5kIHRo
YXQgdG9vIG9ubHkgaW4gQ09NUElMRV9URVNUIGJ1aWxkcywKSSB0aGluayBpbnRyb2R1Y2luZyBh
IG5ldyBjb25maWcgdmFyaWFibGUgaXMgb3ZlcmtpbGwuIElmIHdlIHN1cHBvcnQKc3ViLXdvcmQg
YXRvbWljcyBpbiBrZXJuZWwsIHRoZSBvcHRpb24gbWF5IG5vdCBiZSB1c2VmdWwgbXVjaCBhbnl3
YXkuCgpUaGVyZSBhcmUgcGF0dGVybnMgdG8gZGlzYWJsZSBhbiBhcmNoaXRlY3R1cmUgZm9yIENP
TVBJTEVfVEVTVCBidWlsZHMuCgpUaGFua3MsClN1bmlsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
