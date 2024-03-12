Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D64C5475B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 01:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Og6yO2i5LnsSzJ59qro8z1E0rwfLyQIuVPrIVbOg/sc=; b=pz81dPXtjKn4MN
	q9fECYNOEsVGqpIcBJPe3E6SmAC/qbeOBzjIH7m7RC0MITmgGKG1Va7WWOs0uuhEvgXkufTjRvjlN
	wSpiYMGN/Q5h2GWvUl0XuesQxRPCecxG0bBFAztt7Nj5UYm/yFs8r1j/zBViAJ7sn7dnup4cNDF2n
	ggwCPIkfX8EDVKBoNfE6Ypv57QibOEF/XEjVwFD665/9Eb48Yf/qaOZVjvfHmvBtlTVTO5woPJdel
	+NGMn0PfJ2YMVtFeCJtNg2Z10C563vYwk58+Dgy+iMVg+nNAQboGp9OPGUB2AwnVs24s1Dh40z/IJ
	CreDO7BiT5cLIebzoeiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrMr-00000003txF-2phV;
	Tue, 12 Mar 2024 01:55:49 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrMn-00000003tvn-3iQU;
	Tue, 12 Mar 2024 01:55:47 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-33e959d8bc0so1541035f8f.1;
        Mon, 11 Mar 2024 18:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710208543; x=1710813343; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUQTgV/c1LY6TxFowY3rUQdPlQN/M6/pFPRnz+ClL7I=;
        b=H77PSWV2I8+90PYMvkTe+7AtaSkleJ6yiBAqJgYrTZeKHLlR9Sci9jObEywi/TdaF5
         RJOxG0wLgiHeOpw35HB9g17dHZNkncM9dlpCpuX8wBweCA03YdrzkxrT7l5GqjOYOYW5
         HjDxnpNw2PAumXmT9lxUpIbQUWSrCBMItmqg31KfTwrnA6y4+cbXBKSZi6Vzj3MWRpnx
         r23RebQU/Lsi83gtXlp16dzML8rSS2DPCASmWsqnpq1u8X1qqe1mYVXAqkUba4maKv8o
         KQk3zLUBC0lmT6TxLediC805MihPrSiIvb0+eLatPyiGYkfjvbudspY0ua+R1CyNrTKM
         Az2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710208543; x=1710813343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUQTgV/c1LY6TxFowY3rUQdPlQN/M6/pFPRnz+ClL7I=;
        b=HtELLR8OfFaP7YgzSH/SpC2DdYrtp+2BfTJ1NzkYMgPrzEXOmkv+dLjuPF5mMo++Pm
         +aNaSyhfLJS7oaW8Vz+QacBf4TKyAqI8TYc3tMekbVQBWdOpUcmAeGgh5F3DmRscpXUu
         dVUd85FjhUKIr2wgo+0gVxzujzNsGqq/9MMScy4p6VZ4JzdRwtnl7Fov2GTGcvBXPots
         mBENM7/kkn4t+DjD4k09iS5C14Al4DsYaRe5l1TQR1B8iK/sQ7pzb2pVCuhGEzgN9mmj
         jYemfA2JfgGefUhgNrTO62mMOywhfYlJcS+Ge3AN/Ih6lIBtUcKqPhwjZE10IPUHYySW
         JQTg==
X-Forwarded-Encrypted: i=1; AJvYcCUMexl/yBCe+0S9qE04+p5q2r7gQULPnnkPMz5EOAvXv+YfuvowPr7sLhg2fN8s+NvpeuzgT3OG1M4AlE6C4OB8Rhu+Y6dBL8CLXW0yc3pLRNj5CL5Mjwlp4l2plSUw+TjTqboz/14cYP3qAkbWsixFsd42rio=
X-Gm-Message-State: AOJu0YwweJ+MM8EPVhKCMdYV965F3drKrozUfMp6f9Go9gY3ci8KOuWu
	q4RQ40ACsoWrekd28cy6EMrc3IEeyn6B3ufolt/RJO95aiVKTM9Gs4PuMithb+lSoF0+Cja0ogS
	xOvdJIo9TF8xhn4p6GNa+jtZVmwE=
X-Google-Smtp-Source: AGHT+IF9WvwCtzNHUsfNfLjeVXn5IKrULfW4spgTCxiFBM0s3KVbOpftBxulltD2FNgWguOKkvH7qH1ag5mO6L5+G/8=
X-Received: by 2002:adf:ec8c:0:b0:33e:1ee1:ef92 with SMTP id
 z12-20020adfec8c000000b0033e1ee1ef92mr6682508wrn.67.1710208543538; Mon, 11
 Mar 2024 18:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com> <20240311093526.1010158-8-dongmenglong.8@bytedance.com>
In-Reply-To: <20240311093526.1010158-8-dongmenglong.8@bytedance.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 11 Mar 2024 18:55:32 -0700
Message-ID: <CAADnVQK4tdefa3s=sim69Sc+ztd-hHohPEDXaUNVTU-mLNYUiw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 7/9] libbpf: don't free btf if program of
 multi-link tracing existing
To: Menglong Dong <dongmenglong.8@bytedance.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	X86 ML <x86@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Quentin Monnet <quentin@isovalent.com>, 
	bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_185545_954125_806D0F41 
X-CRM114-Status: GOOD (  23.37  )
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

T24gTW9uLCBNYXIgMTEsIDIwMjQgYXQgMjozNeKAr0FNIE1lbmdsb25nIERvbmcKPGRvbmdtZW5n
bG9uZy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gQnkgZGVmYXVsdCwgdGhlIGtlcm5lbCBi
dGYgdGhhdCB3ZSBsb2FkIGR1cmluZyBsb2FkaW5nIHByb2dyYW0gd2lsbCBiZQo+IGZyZWVkIGFm
dGVyIHRoZSBwcm9ncmFtcyBhcmUgbG9hZGVkIGluIGJwZl9vYmplY3RfbG9hZCgpLiBIb3dldmVy
LCB3ZQo+IHN0aWxsIG5lZWQgdG8gdXNlIHRoZXNlIGJ0ZiBmb3IgdHJhY2luZyBvZiBtdWx0aS1s
aW5rIGR1cmluZyBhdHRhY2hpbmcuCj4gVGhlcmVmb3JlLCB3ZSBkb24ndCBmcmVlIHRoZSBidGZz
IHVudGlsIHRoZSBicGYgb2JqZWN0IGlzIGNsb3NlZCBpZiBhbnkKPiBicGYgcHJvZ3JhbXMgb2Yg
dGhlIHR5cGUgbXVsdGktbGluayB0cmFjaW5nIGV4aXN0Lgo+Cj4gTWVhbndoaWxlLCBpbnRyb2R1
Y2UgdGhlIG5ldyBhcGkgYnBmX29iamVjdF9fZnJlZV9idGYoKSB0byBtYW51YWxseSBmcmVlCj4g
dGhlIGJ0ZnMgYWZ0ZXIgYXR0YWNoaW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWVuZ2xvbmcgRG9u
ZyA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4KPiAtLS0KPiAgdG9vbHMvbGliL2JwZi9s
aWJicGYuYyAgIHwgNDcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQo+
ICB0b29scy9saWIvYnBmL2xpYmJwZi5oICAgfCAgMiArKwo+ICB0b29scy9saWIvYnBmL2xpYmJw
Zi5tYXAgfCAgMSArCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMTIgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGliL2JwZi9saWJicGYuYyBiL3Rvb2xz
L2xpYi9icGYvbGliYnBmLmMKPiBpbmRleCA1NjdhZDM2N2U3YWEuLmZkNTQyODQ5NGE3ZSAxMDA2
NDQKPiAtLS0gYS90b29scy9saWIvYnBmL2xpYmJwZi5jCj4gKysrIGIvdG9vbHMvbGliL2JwZi9s
aWJicGYuYwo+IEBAIC04MjY3LDYgKzgyNjcsMzkgQEAgc3RhdGljIGludCBicGZfb2JqZWN0X3By
ZXBhcmVfc3RydWN0X29wcyhzdHJ1Y3QgYnBmX29iamVjdCAqb2JqKQo+ICAgICAgICAgcmV0dXJu
IDA7Cj4gIH0KPgo+ICt2b2lkIGJwZl9vYmplY3RfX2ZyZWVfYnRmcyhzdHJ1Y3QgYnBmX29iamVj
dCAqb2JqKQo+ICt7Cj4gKyAgICAgICBpbnQgaTsKPiArCj4gKyAgICAgICAvKiBjbGVhbiB1cCBt
b2R1bGUgQlRGcyAqLwo+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IG9iai0+YnRmX21vZHVsZV9j
bnQ7IGkrKykgewo+ICsgICAgICAgICAgICAgICBjbG9zZShvYmotPmJ0Zl9tb2R1bGVzW2ldLmZk
KTsKPiArICAgICAgICAgICAgICAgYnRmX19mcmVlKG9iai0+YnRmX21vZHVsZXNbaV0uYnRmKTsK
PiArICAgICAgICAgICAgICAgZnJlZShvYmotPmJ0Zl9tb2R1bGVzW2ldLm5hbWUpOwo+ICsgICAg
ICAgfQo+ICsgICAgICAgZnJlZShvYmotPmJ0Zl9tb2R1bGVzKTsKPiArICAgICAgIG9iai0+YnRm
X21vZHVsZXMgPSBOVUxMOwo+ICsgICAgICAgb2JqLT5idGZfbW9kdWxlX2NudCA9IDA7Cj4gKwo+
ICsgICAgICAgLyogY2xlYW4gdXAgdm1saW51eCBCVEYgKi8KPiArICAgICAgIGJ0Zl9fZnJlZShv
YmotPmJ0Zl92bWxpbnV4KTsKPiArICAgICAgIG9iai0+YnRmX3ZtbGludXggPSBOVUxMOwo+ICt9
Cj4gKwo+ICtzdGF0aWMgdm9pZCBicGZfb2JqZWN0X2Vhcmx5X2ZyZWVfYnRmKHN0cnVjdCBicGZf
b2JqZWN0ICpvYmopCj4gK3sKPiArICAgICAgIHN0cnVjdCBicGZfcHJvZ3JhbSAqcHJvZzsKPiAr
Cj4gKyAgICAgICBicGZfb2JqZWN0X19mb3JfZWFjaF9wcm9ncmFtKHByb2csIG9iaikgewo+ICsg
ICAgICAgICAgICAgICBpZiAocHJvZy0+ZXhwZWN0ZWRfYXR0YWNoX3R5cGUgPT0gQlBGX1RSQUNF
X0ZFTlRSWV9NVUxUSSB8fAo+ICsgICAgICAgICAgICAgICAgICAgcHJvZy0+ZXhwZWN0ZWRfYXR0
YWNoX3R5cGUgPT0gQlBGX1RSQUNFX0ZFWElUX01VTFRJIHx8Cj4gKyAgICAgICAgICAgICAgICAg
ICBwcm9nLT5leHBlY3RlZF9hdHRhY2hfdHlwZSA9PSBCUEZfTU9ESUZZX1JFVFVSTl9NVUxUSSkK
PiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAg
ICAgYnBmX29iamVjdF9fZnJlZV9idGZzKG9iaik7Cj4gK30KPiArCj4gIHN0YXRpYyBpbnQgYnBm
X29iamVjdF9sb2FkKHN0cnVjdCBicGZfb2JqZWN0ICpvYmosIGludCBleHRyYV9sb2dfbGV2ZWws
IGNvbnN0IGNoYXIgKnRhcmdldF9idGZfcGF0aCkKPiAgewo+ICAgICAgICAgaW50IGVyciwgaTsK
PiBAQCAtODMwNywxOCArODM0MCw3IEBAIHN0YXRpYyBpbnQgYnBmX29iamVjdF9sb2FkKHN0cnVj
dCBicGZfb2JqZWN0ICpvYmosIGludCBleHRyYV9sb2dfbGV2ZWwsIGNvbnN0IGNoCj4gICAgICAg
ICAvKiBjbGVhbiB1cCBmZF9hcnJheSAqLwo+ICAgICAgICAgemZyZWUoJm9iai0+ZmRfYXJyYXkp
Owo+Cj4gLSAgICAgICAvKiBjbGVhbiB1cCBtb2R1bGUgQlRGcyAqLwo+IC0gICAgICAgZm9yIChp
ID0gMDsgaSA8IG9iai0+YnRmX21vZHVsZV9jbnQ7IGkrKykgewo+IC0gICAgICAgICAgICAgICBj
bG9zZShvYmotPmJ0Zl9tb2R1bGVzW2ldLmZkKTsKPiAtICAgICAgICAgICAgICAgYnRmX19mcmVl
KG9iai0+YnRmX21vZHVsZXNbaV0uYnRmKTsKPiAtICAgICAgICAgICAgICAgZnJlZShvYmotPmJ0
Zl9tb2R1bGVzW2ldLm5hbWUpOwo+IC0gICAgICAgfQo+IC0gICAgICAgZnJlZShvYmotPmJ0Zl9t
b2R1bGVzKTsKPiAtCj4gLSAgICAgICAvKiBjbGVhbiB1cCB2bWxpbnV4IEJURiAqLwo+IC0gICAg
ICAgYnRmX19mcmVlKG9iai0+YnRmX3ZtbGludXgpOwo+IC0gICAgICAgb2JqLT5idGZfdm1saW51
eCA9IE5VTEw7Cj4gLQo+ICsgICAgICAgYnBmX29iamVjdF9lYXJseV9mcmVlX2J0ZihvYmopOwo+
ICAgICAgICAgb2JqLT5sb2FkZWQgPSB0cnVlOyAvKiBkb2Vzbid0IG1hdHRlciBpZiBzdWNjZXNz
ZnVsbHkgb3Igbm90ICovCj4KPiAgICAgICAgIGlmIChlcnIpCj4gQEAgLTg3OTEsNiArODgxMyw3
IEBAIHZvaWQgYnBmX29iamVjdF9fY2xvc2Uoc3RydWN0IGJwZl9vYmplY3QgKm9iaikKPiAgICAg
ICAgIHVzZHRfbWFuYWdlcl9mcmVlKG9iai0+dXNkdF9tYW4pOwo+ICAgICAgICAgb2JqLT51c2R0
X21hbiA9IE5VTEw7Cj4KPiArICAgICAgIGJwZl9vYmplY3RfX2ZyZWVfYnRmcyhvYmopOwo+ICAg
ICAgICAgYnBmX2dlbl9fZnJlZShvYmotPmdlbl9sb2FkZXIpOwo+ICAgICAgICAgYnBmX29iamVj
dF9fZWxmX2ZpbmlzaChvYmopOwo+ICAgICAgICAgYnBmX29iamVjdF91bmxvYWQob2JqKTsKPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvbGliL2JwZi9saWJicGYuaCBiL3Rvb2xzL2xpYi9icGYvbGliYnBm
LmgKPiBpbmRleCA1NzIzY2JiZmNjNDEuLmM0MWE5MDllYTRjMSAxMDA2NDQKPiAtLS0gYS90b29s
cy9saWIvYnBmL2xpYmJwZi5oCj4gKysrIGIvdG9vbHMvbGliL2JwZi9saWJicGYuaAo+IEBAIC0y
OTksNiArMjk5LDggQEAgTElCQlBGX0FQSSBzdHJ1Y3QgYnBmX3Byb2dyYW0gKgo+ICBicGZfb2Jq
ZWN0X19maW5kX3Byb2dyYW1fYnlfbmFtZShjb25zdCBzdHJ1Y3QgYnBmX29iamVjdCAqb2JqLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUpOwo+Cj4g
K0xJQkJQRl9BUEkgdm9pZCBicGZfb2JqZWN0X19mcmVlX2J0ZnMoc3RydWN0IGJwZl9vYmplY3Qg
Km9iaik7Cj4gKwoKSXQgc2hvdWxkbid0IGJlIGV4cG9ydGVkLgpsaWJicGYgc2hvdWxkIGNsZWFu
IGl0IHVwIHdoZW4gYnBmX29iamVjdCBpcyBmcmVlZC4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
