Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF78CCD4851
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 16:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/L4jXsWtwNuL0V9H9FDAPdv/LxvN1NtK7sVgzS+Iumc=; b=AOrud6/xBfSo1a
	J9n3Ra/+PqO9G4GD3LETX13ZFmlg+syNb21zaFohsrOpDPFZZ0M/EHl7gM51UjmXJLEu8XBdZXqqg
	VcuvKw2jvjheTTSB2N/TokP47kQPxWBNReddOV/mdovUfkLqR+Hni0Wkh944LgFT57sI8kAyk+Q8X
	mFPAOP/sH+nUX66fki/LjcAdYmJkJnGgCLnB/nCnFt1sjgs6OrO0ohox9JxQCops5IcsUxEHkwggd
	9bwql0bHfETHjur0HgNsU6eFD8yfVVuxtQkwGYRpS7aJxO0L64HvmKXB1HAtkjCOVvEsBnQu7neuv
	jPBkehbX1Ts23K7lu1PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCHr-00000003Bek-0Knh;
	Wed, 13 May 2026 16:18:19 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCHp-00000003Be3-0F8E
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 16:18:18 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ba180a022dso335ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 09:18:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778689096; cv=none;
        d=google.com; s=arc-20240605;
        b=lfb0IyXdG/5PWg334JWWXovDaK2a9+GGenfd2vbXMJn4YWvCHq2u28BE3ybZtZ5oiz
         zNmj7krOwd0jGfvi9+Bw44ijgidRyvZ+60Yiox8xQgv6Ew5dUH9EbieVBMxGLmAF0Ymj
         kj2/aO84RrZ2Nskw7VucFumtVdY6IIH4V4360mBXSqKJLOq9BHzJz3Y8cTixn0yGDkEl
         qH1vkR5jqn4EUuO8upfUYpMemDKPj3wPe5x6TVNQJDKE5yER3D6YU/RJnmCHXPlXHHfr
         pc5QgEBVtI2dnQ8vBTDRFXLUmgQBSmT68ICqJO9H3FEhPuhheFGXeYhA7V3eA7DHkd8b
         heGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ACdm50WIzOX3SBrHU64SF6l/5iKLA4zTspnqD3YT0zY=;
        fh=S9f9J+FdFxtyI4584mxFZcCSMNkcVgmFr8TC+u0rjuc=;
        b=ExzxVB/EfRZCnAWsYY0g7Y8QkkDFLzHcO+dgV6cJhWmBuCWf8g/5aSQ3qsZR2wE0si
         cWl/rE6/IvOhXduPqwuCrD9wWJmXLCiFUQz4AbY5+9e8IiP9r0OrYegXpPLVMk7RZzYH
         kdPa2IpGtDE1kJMfqk2jgN24I1tiECi9d3y9qWScvp2h+MMb1iNGpVn7fNjFMbE1byCa
         ShlyzUyb9EA+YPmKFE+5zhzuRt74Avmx7jnVLUIl47YwqO0WuYiiqdVuQyKaQF++u+7H
         UYY3TZoiIFE317E7IWtz8o2Ep+ZuTCOOO5JGZ6x2+cdc4X03QnRPAff8vH0aN6tYDx9a
         foGA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778689096; x=1779293896; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACdm50WIzOX3SBrHU64SF6l/5iKLA4zTspnqD3YT0zY=;
        b=gcoEXl9Ym8elsy/W4D6cr10cbcQXp2LPSkge55cBc7KPBOoBwuwruvkrCo84QC1gmQ
         uAajlIrc4zZz6CjVMUpcuLUKvo0k9g1OX6JjPIUx7aEUfHhQBBJLciDty5/lWSrLkAzn
         MF9M1u9xbY3OKbcVNBig8lUNMUU4O+TRYsgf/sfJH4r+J3HF+fGPWyCU3OrjtdJMxdhG
         TxxE4BpgxAlEf0GIWe3fLAp9P9ON3WYNSkJ61x+DRSRt/H4ITXIEDi583UAd8Wo0Gfmz
         kgoiTBKcZRVkZKHoiTY27FdB73AxdrVeCyY9spNdkPWmRNWtDx8zUXEMtb0JAHA7PJyZ
         EZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778689096; x=1779293896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ACdm50WIzOX3SBrHU64SF6l/5iKLA4zTspnqD3YT0zY=;
        b=XptWMnVxvShMlIGzGyP2D0HD5QrgXss6F1/jVEiiIAOvkY9TprpkV55PR9q45wAq47
         s3845988vLt6drll2UXz9mxGKATrEQ781gZ+2pYYXW3dyxn//StPXk9guuNwVKYPQvzB
         eT4rBSzRulFz6BJ1L+raGhdqdKDa9NgkqGPBdf3V+I4z5JS2ZHFvRMo96vSbIo4cr5Ch
         OByQZLiKnP8e1u8Fj1o9fARw8f8LneD6M02E3YGADMsrmYXnLG38RR7vt1hDw815PQ7h
         HHpaJwWuHMvrJqjsY7eZeTOeXVcX0uXIfBaJkbukb3iZxdIRZAnUDxaSgFRqYbR5/khB
         6k1w==
X-Forwarded-Encrypted: i=1; AFNElJ+VCv/gCzkerWv+2lhC4chXWtm6pLSzMl3Wk89VIV8BbM0r/SKrYibH/zXagGuwYZeUNWHnpmuss6L+FQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmpgEZfFtC6m1p3CDsEqKZ6wAlkDngUbgHM1fAD3zX1yp5V7Yh
	2ihzvHfl4uyZomjD4YooBUokZfpquD8D2lre9ojmat4PNCsQMyhcx6Zz18dEXpyg3D75CZ6IPA/
	FkmfuBrqnyd73IOwwrt3xw6Bm+xYopmE4s1KK/2Jmua2X6U8NDfKpwKE4ZAM=
X-Gm-Gg: Acq92OE94lVdYtsHpHIMbzEW373fqmMKR3kA4dscKom1xlwhRO3JbhQtvRnZRAVPPzX
	BGBsRjyRsFd6AlrNasmcB+niErKATLTLZCdH2CusYcQ3xJTiw0qsUrJFsx9lOsRqCI3Eo15ILbC
	V3C6OXdrqxouT5R/hsU1jJ6CBFlOO1dS2mtmErKyOFKpmXtnO6pesn52yqyjELlN2AbCy01O13J
	4Oxfl0ozdnntWNuZgNg5ryMoJL5SJBZ9QdbV47ChJXTeQ0eLwKwBQORzFmgaKeOaEUu1rgZbbDF
	5bd4FaDG2uauuPHjKRxDPhSeWhwYLvmc3xfU2ZkgZDmAAF/wP9zop0waHcQ=
X-Received: by 2002:a17:903:1a8b:b0:2bd:3c1b:3073 with SMTP id
 d9443c01a7336-2bd3c1b31c2mr1613155ad.16.1778689095469; Wed, 13 May 2026
 09:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260513154851.1085334-1-guanli.oerv@isrc.iscas.ac.cn> <20260513154851.1085334-3-guanli.oerv@isrc.iscas.ac.cn>
In-Reply-To: <20260513154851.1085334-3-guanli.oerv@isrc.iscas.ac.cn>
From: Ian Rogers <irogers@google.com>
Date: Wed, 13 May 2026 09:18:03 -0700
X-Gm-Features: AVHnY4I-TB_PRfRIGQslk_C8gLi_FdvZ00UFoQKUCxhZfyS3cjZomVtponH35XQ
Message-ID: <CAP-5=fUigMZD-W2ZisRtb=WAzgx9078XJs7P39Vq0oKS6BYxYw@mail.gmail.com>
Subject: Re: [PATCH 2/3] perf riscv: Fix discarded const qualifier error in _get_field()
To: Li Guan <guanli.oerv@isrc.iscas.ac.cn>
Cc: acme@kernel.org, namhyung@kernel.org, adrian.hunter@intel.com, 
	palmer@dabbelt.com, pjw@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_091817_102634_12C24F7E 
X-CRM114-Status: GOOD (  16.72  )
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

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgODo1MOKAr0FNIExpIEd1YW4gPGd1YW5saS5vZXJ2QGlz
cmMuaXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gV2hlbiBidWlsZGluZyBwZXJmIGZvciB0aGUgUklT
Qy1WIGFyY2hpdGVjdHVyZSAoZS5nLiwgd2l0aCBHQ0MgMTQpLCB0aGUKPiBidWlsZCBmYWlscyBk
dWUgdG8gc3RyaWN0IHR5cGUgY2hlY2tpbmcgb24gcG9pbnRlciBhc3NpZ25tZW50cy4gVGhlCj4g
Y29tcGlsZXIgZmxhZ3MgdGhlIHJldHVybiB2YWx1ZSBvZiBzdHJyY2hyKCkgYmVpbmcgYXNzaWdu
ZWQgdG8gYQo+IG5vbi1jb25zdCBwb2ludGVyIHdoaWxlIHByb2Nlc3NpbmcgYSBjb25zdCBzdHJp
bmcsIHRyaWdnZXJpbmcKPiAtV2Vycm9yPWRpc2NhcmRlZC1xdWFsaWZpZXJzOgo+Cj4gICAgIGFy
Y2gvcmlzY3YvdXRpbC9oZWFkZXIuYzoyNDoxNTogZXJyb3I6IGFzc2lnbm1lbnQgZGlzY2FyZHMg
4oCYY29uc3TigJkgcXVhbGlmaWVyIGZyb20gcG9pbnRlciB0YXJnZXQgdHlwZSBbLVdlcnJvcj1k
aXNjYXJkZWQtcXVhbGlmaWVyc10KPiAgICAgICAgMjQgfCAgICAgICAgICBsaW5lMiA9IHN0cnJj
aHIobGluZSwgJyAnKTsKPiAgICAgICAgICAgfCAgICAgICAgICAgICAgICBeCj4gICAgIGFyY2gv
cmlzY3YvdXRpbC9oZWFkZXIuYzoyOToxMjogZXJyb3I6IGFzc2lnbm1lbnQgZGlzY2FyZHMg4oCY
Y29uc3TigJkgcXVhbGlmaWVyIGZyb20gcG9pbnRlciB0YXJnZXQgdHlwZSBbLVdlcnJvcj1kaXNj
YXJkZWQtcXVhbGlmaWVyc10KPiAgICAgICAgMjkgfCAgICAgICAgICBubCA9IHN0cnJjaHIobGlu
ZSwgJ1xuJyk7Cj4gICAgICAgICAgIHwgICAgICAgICAgICAgXgo+Cj4gUmVzb2x2ZSB0aGlzIGJ5
IGFkZGluZyBhbiBleHBsaWNpdCAoY2hhciAqKSBjYXN0IHRvIHRoZSBzdHJyY2hyKCkKPiByZXR1
cm4gdmFsdWVzLCB3aGljaCBzYXRpc2ZpZXMgdGhlIGNvbXBpbGVyJ3MgcXVhbGlmaWVyIGNoZWNr
cwo+IHdpdGhvdXQgYWx0ZXJpbmcgdGhlIHJ1bnRpbWUgYmVoYXZpb3IuCgpXaHkgbm90IGFkZCB0
aGUgY29uc3Q/IFRoZXJlIGhhdmUgYmVlbiBhIGZldyByb3VuZHMgb2YgdGhpcyBjbGVhbiB1cCwg
bGlrZToKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcGVyZi11c2Vycy8yMDI1MTIxMTIy
MTc1Ni45NjI5NC0zLWFjbWVAa2VybmVsLm9yZy8KRGlkIHlvdSBjaGVjayBpdCB3YXNuJ3QgYWxy
ZWFkeSBmaXhlZCBpbiBwZXJmLXRvb2xzLW5leHQ/CgpUaGFua3MsCklhbgoKPiBTaWduZWQtb2Zm
LWJ5OiBMaSBHdWFuIDxndWFubGkub2VydkBpc3JjLmlzY2FzLmFjLmNuPgo+IC0tLQo+ICB0b29s
cy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9oZWFkZXIuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L3BlcmYvYXJjaC9yaXNjdi91dGlsL2hlYWRlci5jIGIvdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3V0
aWwvaGVhZGVyLmMKPiBpbmRleCA0YjgzOTIwM2Q0Li5kMDFiYTY0YWVjIDEwMDY0NAo+IC0tLSBh
L3Rvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL2hlYWRlci5jCj4gKysrIGIvdG9vbHMvcGVyZi9h
cmNoL3Jpc2N2L3V0aWwvaGVhZGVyLmMKPiBAQCAtMjEsMTIgKzIxLDEyIEBAIHN0YXRpYyBjaGFy
ICpfZ2V0X2ZpZWxkKGNvbnN0IGNoYXIgKmxpbmUpCj4gIHsKPiAgICAgICAgIGNoYXIgKmxpbmUy
LCAqbmw7Cj4KPiAtICAgICAgIGxpbmUyID0gc3RycmNocihsaW5lLCAnICcpOwo+ICsgICAgICAg
bGluZTIgPSAoY2hhciAqKXN0cnJjaHIobGluZSwgJyAnKTsKPiAgICAgICAgIGlmICghbGluZTIp
Cj4gICAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+Cj4gICAgICAgICBsaW5lMisrOwo+IC0g
ICAgICAgbmwgPSBzdHJyY2hyKGxpbmUsICdcbicpOwo+ICsgICAgICAgbmwgPSAoY2hhciAqKXN0
cnJjaHIobGluZSwgJ1xuJyk7Cj4gICAgICAgICBpZiAoIW5sKQo+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gTlVMTDsKPgo+IC0tCj4gMi41NC4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
