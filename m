Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE34C25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 18:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQRWWVYCF0xVIMxPhQ5hJRtBm76qH5IaOuxuhz8g8Q8=; b=LrrKVxSIQWssXv
	zsZM9mudFNwyvNyMuinBIYhtmBLHdcXiKwvl/NeDygxPwTFEk75z8CHAqyY2ScH0czLu5T11V8LzP
	TksMVQAchXGG89l252rFt/9TAvlkngRMpEXxtnVvm+69OGRIqHNNjzLhFtjL4doePhY1A2QV438Iw
	fHbSuP7lmuHs19ze9WhMuaOqPGfA/AzfxMrEcejN74tJfBAJzmUkQ2Wu2IroTatS779oZHjpVXe+q
	o/R4+thjYj1UmCAIjjVKPzmL0tX4Yq2UDFx0nNnvPGuG48fSPYwRKKG4yZ6wnnK7+ocfvsED00DOI
	1wvPLhVXgYInXHK/E1xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAClU-00000006xfb-1J5r;
	Thu, 23 May 2024 18:02:08 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAClP-00000006xeG-2ICk
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 18:02:04 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-36da87c973cso3239015ab.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 May 2024 11:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716487321; x=1717092121; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CcmoKrno51oIESzU6CRBDsbzTPCeYv0t1iR5nNF3XwI=;
        b=Ge8KOK29IEd3lxP5RdO5I0O44HbuygyKVbc7bEmRDN6cdG+08e7hVITRvaG8Ed9oJ3
         ADUlECMtDvYIw7DXVuCQCTz5taW3QRKek3qmPYUu0UjMaXgPYtP+MX3JsOE1PxSci+oT
         WDS81EiADRp3iARKQd6h6NdvimyfRTATMxBAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716487321; x=1717092121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CcmoKrno51oIESzU6CRBDsbzTPCeYv0t1iR5nNF3XwI=;
        b=ICTuyIbooDwLr+AhFNGc8uOTeZx1UuDHjUlG/yAYpx2BeVotrkf1jzBbrS/xcnoQbO
         /U++da+XioQMtnFAFAKcGuHaKIxVpfYbc1WuTdxmEzCwxwTi1PFsmJ67xIW97sAmZjDc
         2aBYluOY34vSSYWgjpVLpJyA0MjrUH0igMUA9+cBWr0F8tLMweLsFFnZdw7Rs+mPNhMP
         s8L7rAKsx1jC+nXMYwOemOSiB4bEh0m3NJHe6Q60Ux4SBnINSyN4RsM3/QS+c7zwaSAf
         AFsYITJ9HLoGr6clurgAc0ly2FNBZ6h6Zyv4HuGEXiy6Wi0oKkdEV82LGciGuOJKzHX6
         S1gw==
X-Forwarded-Encrypted: i=1; AJvYcCWanHFNH168C1SfbBgKD6kXz16z8gLXMVfcNf8hM4QUMnubVubh0EDA0ULnEpAvuCEI4URRB6d3q0r9hTMZ0I0rC81qF+4jm56IPXI5KXCw
X-Gm-Message-State: AOJu0Yx+XfwZHIDBrn21yisTgrgo+kQH1sPnHZawn4Ok58o8dzyUHPlC
	w9fjcaFu4AMcytkYtoio/vS516aIsxGD//4g8XzgoErhMOQHkVesguTUeUcZ5xI=
X-Google-Smtp-Source: AGHT+IHFL67Z83I3o40zCsNMJ+ZoJnLtFsbE/QtO0U+1g9W23Ofor/d2rDbzaegpkLYOLJ/pxEIroQ==
X-Received: by 2002:a05:6e02:1fc1:b0:36c:3856:4386 with SMTP id e9e14a558f8ab-3737b3cad00mr209585ab.3.1716487320819;
        Thu, 23 May 2024 11:02:00 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3737a5e826bsm519205ab.73.2024.05.23.11.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 11:02:00 -0700 (PDT)
Message-ID: <d5471e30-227d-4e6d-9bbd-90a74bd9006b@linuxfoundation.org>
Date: Thu, 23 May 2024 12:01:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/68] kselftest: Desecalate reporting of missing
 _GNU_SOURCE
To: John Hubbard <jhubbard@nvidia.com>, Edward Liaw <edliaw@google.com>,
 Mark Brown <broonie@kernel.org>
Cc: shuah@kernel.org, =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Kees Cook
 <keescook@chromium.org>, Andy Lutomirski <luto@amacapital.net>,
 Will Drewry <wad@chromium.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-team@android.com,
 linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240522005913.3540131-1-edliaw@google.com>
 <20240522005913.3540131-3-edliaw@google.com>
 <94b73291-5b8a-480d-942d-cfc72971c2f5@sirena.org.uk>
 <CAG4es9WAASaSG+Xgp31-kLT3G8wpeT5vAqbCA4r=Z8G_zAF73w@mail.gmail.com>
 <9e2677ec-1d54-4969-907b-112b71ef8dd3@nvidia.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <9e2677ec-1d54-4969-907b-112b71ef8dd3@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_110203_619259_E578A59D 
X-CRM114-Status: GOOD (  10.67  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNS8yMi8yNCAyMDoyOCwgSm9obiBIdWJiYXJkIHdyb3RlOgo+IE9uIDUvMjIvMjQgMTA6NDYg
QU0sIEVkd2FyZCBMaWF3IHdyb3RlOgo+PiBPbiBXZWQsIE1heSAyMiwgMjAyNCBhdCA0OjIx4oCv
QU0gTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPiB3cm90ZToKPj4+IE9uIFdlZCwgTWF5
IDIyLCAyMDI0IGF0IDEyOjU2OjQ4QU0gKzAwMDAsIEVkd2FyZCBMaWF3IHdyb3RlOgo+IC4uLgo+
Pj4gWW91J3ZlIG5vdCBwcm92aWRlZCBhIFNpZ25lZC1vZmYtYnkgZm9yIHRoaXMgc28gcGVvcGxl
IGNhbid0IGRvIGFueXRoaW5nCj4+PiB3aXRoIGl0LCBwbGVhc2Ugc2VlIERvY3VtZW50YXRpb24v
cHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0IGZvcgo+Pj4gZGV0YWlscyBvbiB3aGF0IHRo
aXMgaXMgYW5kIHdoeSBpdCdzIGltcG9ydGFudC4KPj4KPj4gU29ycnksIG15IG1pc3Rha2UsIEkg
Zm9yZ290IHRvIGFkZCBpdCBhZnRlciBjaGVycnktcGlja2luZy7CoCBJZiBhZGRlZAo+IAo+IEFk
ZGluZyB0aGlzIHRvIHlvdXIgLmdpdGNvbmZpZyB3b3VsZCBjb3ZlciB5b3UgZm9yIGNhc2VzIGxp
a2UgdGhpcywgSSB0aGluawo+IGl0J3MgcHJldHR5IGNvbW1vbiB0byBkbyB0aGlzOgo+IAo+IFtm
b3JtYXRdCj4gIMKgwqDCoCBzaWdub2ZmID0gdHJ1ZQo+IAo+IAoKTWFyaywgRWR3YXJkLAoKSXMg
dGhpcyBwYXRjaCBzdGlsbCBuZWNlc3Nhcnkgb2YgdGhlIHNlcmllcyBpcyBkcm9wcGVkPwoKdGhh
bmtzLAotLSBTaHVhaAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
