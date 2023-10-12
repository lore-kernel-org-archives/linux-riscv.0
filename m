Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C126CDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 13:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWGTl28BHJ26FibRQR+cBYvdXAlaaxJqqgt6xDJKkEI=; b=CEf0ZOPYqgza4k
	dMjfh+XZVHX6coFlqEtZLIUDf7C9OMQ1kUAVSIcuPxwibleD4fwYSdhCTLhzoLa5iayvH8k47SHuu
	PSru4Ic5ha9SNJIMhzaBVMFcHuO+h56YcjcY7h2R+8ONDppANkXJ/7mPbBcLAJd41AmOL2bIC+aYC
	avRwzzeeQzypuF93jc3AW46qJp5n3PC9/tHSgBcaNta4wgnXq6oR5QfKmdmKpaQWzIHMl78qJCG1K
	aBKz6i4/OuS0S7MKbJw1zjy/bU3wcYQbD+2L+80rE/PNPgx0iEaltsR6UzRG9AjSjRcwrP8ZkM38L
	ZgU3GHnSYJ7f1051lHZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqwCq-0018Ss-2Y;
	Thu, 12 Oct 2023 13:58:28 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqwCn-0018SP-17
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 13:58:27 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40651b22977so2503875e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Oct 2023 06:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697119102; x=1697723902; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BcZvz58OosH2lGDIuEl6DlOcic+0phQ3UfuxYsqp/eA=;
        b=mSUGhyl30hAQq3wD98c6ytuJXYKO6Z27CyXsWv+NFy72+p5SuYUIyGys7J+0FvAaMy
         T1bbeOBq/p0rUQKELqEi4o5X8VJj9a67zanKuUoc0pNHMiAyCizz60z+xF+WuFyLdApy
         toHxd7S1W4ADStDJDCWgeRt1fTxE5eO1oH8B8F+g4z4EleccQZRXY4V5EHvhbWUufHqa
         GhECEJFKrRO3Yy30iA2wimAC6L8tUcz7u3eRG1irbdQ2lgkm7gEV0sIF0EJoFjkIxY2c
         TQbMn3Q0nH7aFIVWrJCteycIilfYhxwZSH208Sj783PB8Ym+woT6DlyQW9BJNFxpPOo3
         6++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697119102; x=1697723902;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BcZvz58OosH2lGDIuEl6DlOcic+0phQ3UfuxYsqp/eA=;
        b=maYikf+h9Gf9e6h5ODDXGjmdFk05iE2PU9Vy3+aQheyPOFGZ9PwIj0lScZGhzLeafF
         BsNLYDKv4Mz+JAdpniSzn+hm6v6RKS7rj+yv0HVx199lmW2hcvq6Hrq45GBkkgFlO0VS
         Kxj+E9P3LfTFFQpne9jkNH7f91uoWXI0FRHdJb3QJ//f8W04G24/7Xklqk3auvilrTHB
         OYkthIj9IeOI5MX0/o+aG/4b2urcsSzPBQhny89yiIrAKJKhP2IwRhiSX3ZAJuPTVC3M
         5+E6K3oGCvEBhjZtDP/PrM7cYZjBTWELcHUZ9QjYkCxPQO9vBAMf7aO2G9u2/mWbEntA
         YFbQ==
X-Gm-Message-State: AOJu0Ywk76Efs+mkhhFhLxr4LV/gFpEqTtdUQ2yBg7M3wc3JKl/rZlPA
	JKleB0XYaAXF5MUmixHMUs3o0XKXHALRe2Vu88MHIA==
X-Google-Smtp-Source: AGHT+IEX4nDwJ5QBbqXM1eRAqAHPm4dDRQbr5bVhX7vDfoHgWUlVU7DOUB46kNI1sT4S5KCCp8cx2w==
X-Received: by 2002:a05:600c:1d18:b0:404:72f9:d59a with SMTP id l24-20020a05600c1d1800b0040472f9d59amr21765331wms.0.1697119101941;
        Thu, 12 Oct 2023 06:58:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:3fed:c1e5:145f:8179? ([2a01:e0a:999:a3a0:3fed:c1e5:145f:8179])
        by smtp.gmail.com with ESMTPSA id g7-20020a5d5407000000b00327df8fcbd9sm18598356wrv.9.2023.10.12.06.58.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 06:58:21 -0700 (PDT)
Message-ID: <3f4784c7-a6a6-4567-bd80-7e3e82abed16@rivosinc.com>
Date: Thu, 12 Oct 2023 15:58:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/13] dt-bindings: riscv: add Zihintntl ISA extension
 description
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>
References: <20231011111438.909552-1-cleger@rivosinc.com>
 <20231011111438.909552-11-cleger@rivosinc.com>
 <20231012-ambiguity-angular-d8c69cc01535@spud>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20231012-ambiguity-angular-d8c69cc01535@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_065825_608456_E7A6A2DF 
X-CRM114-Status: GOOD (  16.01  )
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

CgpPbiAxMi8xMC8yMDIzIDE1OjUwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gV2VkLCBPY3Qg
MTEsIDIwMjMgYXQgMDE6MTQ6MzVQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBB
ZGQgZGVzY3JpcHRpb24gZm9yIFppaGludG50bCBJU0EgZXh0ZW5zaW9uWzFdIHdoaWNoIGNhbiBu
b3cgYmUKPj4gcmVwb3J0ZWQgdGhyb3VnaCBod3Byb2JlIGZvciB1c2Vyc3BhY2UgdXNhZ2UuCj4+
IAo+PiBbMV0KPj4gaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xM193c044WW1SZkg4
WVd5c0Z5VFgtRGpUa0NuQmQ5aGovdmlldwo+Cj4+IAo+IERpdHRvLiBXaG8gaXMgZXZlbiBob3N0
aW5nIHRoaXMgZ29vZ2xlIGRyaXZlIGFueXdheT8gSSdkIHJhdGhlciBzZWUgCj4gR2l0SHViIGxp
bmtzIHRvIGRvY3MgZnJvbSB0aGUgcmVsZWFzZXMsIGJ1dCBzaW5jZSB5b3VyZSBwb2ludGluZyBh
dAo+IHRoZSBJU0EgbWFudWFsIEkgc3VwcG9zZSB0aG9zZSBkbyBub3QgcmVhbGx5IGV4aXN0LgoK
QWNrZWQsIEknbGwgZml4IGFsbCB0aGVzZSBhcyAiTGlua3M6IgoKUmVnYXJkaW5nIHRoZSBwZGYg
c291cmNlcyB0aGVtc2VsdmVzLCBJIGFjdHVhbGx5IHVzZWQgdGhlIGxpbmtzIGFzCnJlZmVycmVk
IG9uIHRoZSBSSVNDLVYgd2lraSBbMV0gd2hpY2ggaXMgdGhlIHdpa2kgbWVudGlvbmVkIGZyb20g
dGhlCnJpc2N2Lm9yZyB3ZWJzaXRlIFsyXS4gSSBkbyBub3QgbGlrZSBpdCBidXQgdGhlcmUgZG9l
cyBub3Qgc2VlbXMgdG8gaGF2ZQphIHByb3BlciBzcGVjaWZpY2F0aW9uIHJlbGVhc2Ugd2Vic2l0
ZS4uLgoKTWF5YmUgcG9pbnRpbmcgb25seSB0byBhIHNwZWNpZmljIGNvbW1pdCBvbiB0aGUgZ2l0
aHViIHJlcG8gdGhhdAptZW50aW9uZWQgdGhhdCB0aGUgZXh0ZW5zaW9uIHdhcyByYXRpZmllZCBp
cyBiZXR0ZXIuCgpUaGFua3MsCgpDbMOpbWVudAoKWzFdIGh0dHBzOi8vd2lraS5yaXNjdi5vcmcv
ZGlzcGxheS9IT01FL1JlY2VudGx5K1JhdGlmaWVkK0V4dGVuc2lvbnMKWzJdIGh0dHBzOi8vcmlz
Y3Yub3JnL3RlY2huaWNhbC9zcGVjaWZpY2F0aW9ucy8KCj4gQWNrZWQtYnk6IENvbm9yIERvb2xl
eSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gCj4gVGhhbmtzLCBDb25vci4KPj4gCj4+
IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4gLS0t
IAo+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55
YW1sIHwgNiArKysrKysgCj4+IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPj4gCj4+
IGRpZmYgLS1naXQKPj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
ZXh0ZW5zaW9ucy55YW1sCj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jp
c2N2L2V4dGVuc2lvbnMueWFtbCBpbmRleAo+PiA0YzkyMzgwMGQ3NTEuLjcwYzJiMDM1MTM1NyAx
MDA2NDQgLS0tCj4+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4
dGVuc2lvbnMueWFtbCArKysKPj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3YvZXh0ZW5zaW9ucy55YW1sIEBAIC0yNDcsNgo+PiArMjQ3LDEyIEBAIHByb3BlcnRpZXM6
IFRoZSBzdGFuZGFyZCBaaWhpbnRwYXVzZSBleHRlbnNpb24gZm9yIHBhdXNlCj4+IGhpbnRzLCBh
cyByYXRpZmllZCBpbiBjb21taXQgZDhhYjVjNyAoIlppaGludHBhdXNlIGlzIHJhdGlmaWVkIikg
b2YKPj4gdGhlIHJpc2N2LWlzYS1tYW51YWwuCj4+IAo+PiArICAgICAgICAtIGNvbnN0OiB6aWhp
bnRudGwgKyAgICAgICAgICBkZXNjcmlwdGlvbjogKwo+PiBUaGUgc3RhbmRhcmQgWmloaW50bnRs
IGV4dGVuc2lvbiBmb3Igbm9uLXRlbXBvcmFsIGxvY2FsaXR5IGhpbnRzLAo+PiBhcyArICAgICAg
ICAgICAgcmF0aWZpZWQgaW4gY29tbWl0IDBkYzkxZjUgKCJaaWhpbnRudGwgaXMKPj4gcmF0aWZp
ZWQiKSBvZiB0aGUgKyAgICAgICAgICAgIHJpc2N2LWlzYS1tYW51YWwuICsgLSBjb25zdDogemlo
cG0gCj4+IGRlc2NyaXB0aW9uOiBUaGUgc3RhbmRhcmQgWmlocG0gZXh0ZW5zaW9uIGZvciBoYXJk
d2FyZSBwZXJmb3JtYW5jZQo+PiBjb3VudGVycywgYXMgLS0gMi40Mi4wCj4+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
