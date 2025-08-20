Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEA6CA0EF8
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 22:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/l+ym95lUxJMCSPXTL6MX4TYfKD34sCz1WnyUxAkhc=; b=avOqAtrf67AFCZ
	Zr39BPGT5EhnaEDmwG08Qk567FDPZ6cFEZllB+AlNCku8Hx1ZRMQk/nF7SHd2bSvqJ6PTn50JAjiv
	hqH6iZ4kcTgl8Id3xooOEvMpbgx6ASD2ysgr3ajFU/A/R3I2VjUbpnvvFxU58OSbHcZB//aDRp6i9
	X6QKpI0KhadsVGLEkta4r04b8+P4c5n4/XisnUwF8uOSz9wWd10frKWJeDUj6UJiK1tqqTRXkTrZQ
	3OH1716BVQ3KZV01sw5sn9lHPuX9VFigK4gtKIiQ2+5vJx+mh2eqspBz5IMF7AFjeW0ksAjC4TXR0
	NyqDkXD+3KWXOAWpgaTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uorUi-0000000F786-2GOH;
	Wed, 20 Aug 2025 22:41:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonXR-0000000EgIx-2yHd
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 18:27:59 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45a1b066b5eso986415e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Aug 2025 11:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1755714475; x=1756319275; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8NPVQBMSrrf3jhmLLcgVMSadSNRoC9cJI1+fcHorCmY=;
        b=U88zXrOseI/SQYnvt+sEmp1VwB53DcCC0YvGhi7CfcOGi3CwYSEYf8bvJUvWvj7KLY
         Et4SK9NygWlpj63cj+1SfO96FTt7T9TmtscZQiDyBnGPhZKD1IVE76E2Pyqrlc6d6O7q
         eO7/tGWEboIZnCJKvs801XrHuKAfTwozdyVxr4P+cJok0FcSdmaWwVvwxEd7FoANYUou
         nIF1uRRe+78ylTspPjaXBpf1qczfL54bMZsgKoUI6USFYzzHPqhITuveTmJW78PPzL8z
         MAGPNqVp7QYwZyVIwXXBwNOtNGOfVKJoKqhucMc3AgqbxaNlUFWiwEWZoLXJBgr17Dka
         +trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755714475; x=1756319275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8NPVQBMSrrf3jhmLLcgVMSadSNRoC9cJI1+fcHorCmY=;
        b=haU5J7k91Rc7GkP4H1fk0G1po7BWxnPdtrrx1J/BK3A3J3K6T2UfSbQI/zOTDU8kAx
         oBYg+7RozvZNLqGjbtsML7NpVVQor8Bz4EvGGSM7cYPoXp6Aecy3nO6oogcBF/Q5Tb64
         8No6RDGIJgiDQIQd3KZmewQltebZUaVc8EmUxBwc4FWNu2jitdlc7xYf6XE/2SA293YA
         iMb8ItudQDBlMWEPZtWVvQNi+E3hD+ca7iJWQzLFUtoFdTIAWDgq74Ku0ATYFQLZIuSD
         CxcYxgRQQlfAjixGKGRCHYbjUx6v0GwWP+ikWsUSscMr2KlT28n2OkBdu1U/Q3AiLRY7
         h3Og==
X-Forwarded-Encrypted: i=1; AJvYcCWCdd0nlPAGG5QnU6fzURX6i0zhqB+muNlJAa4qmXwLdBEAE+AJjoJGwzF51D4ugp+0YdojYmIYx4qtqg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnyvhDBlUEFww1J/MyE/9iGyK0oj5qjuRYR0T7Mxf+9ozaPj2k
	+Do1eobSsRXYVqP74tTuxKR4Pqfu2JEk+1wi9MNSLhRX/pRwJsZE2TPRPXf0NxSmT6M=
X-Gm-Gg: ASbGncur56pEv05LYnAWYZw3VoO22FV8o6rkp5/wqUiy+kavhphT4np5A+YOpcCKK49
	ZPRJEQXyGUbOPk6MmF/roQ2v8d+X1yEWtWKjUVL5fqr+snoHDw+HiEXiy997iqOSwDFXezWxDxq
	/PmGDn6PEtTbGIUP9Zqwlrj8pxOIHieH12AWmTRTthKNdRo0CKWgsGabigrPiAJxOHvRF7tju8A
	esbdKps3HIwXMdZoEQsuscc+2DOo+H802q2H9kOlyBYIpbLSmnbB05nierAiSaIKDBPO8YL6CJN
	15Aybdl28fFrAJw1cEzU9vqnz8fzw3oldGpgRp6c0IG/3zMRR0Y+O6GfBRGLOA8j0c5GDU/Pa/a
	J2VtjgIiWzPSmCcaWzPiFHUxG9dZKhvOMD6rAa260keRh8qhDpv9dmiBzfv7YZuDT/klTHUuuY9
	Ah7kcRbFp+GI6xpeP9dPi0cEw=
X-Google-Smtp-Source: AGHT+IGQKS3XqM+4Wd++Np9yalKPfzEFkK54upvYWtNTNYRTddwvhBFV5n3bYbpZpN+GCnzAAC724g==
X-Received: by 2002:a05:600c:4a06:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-45b47ab2420mr21491235e9.8.1755714475079;
        Wed, 20 Aug 2025 11:27:55 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:7e73:cf38:ddee:2b1d? ([2a02:1807:2a00:3400:7e73:cf38:ddee:2b1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c310efsm46093025e9.7.2025.08.20.11.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 11:27:54 -0700 (PDT)
Message-ID: <1a4a25d2-25a1-4d06-bba6-50f51cfbb619@hammernet.be>
Date: Wed, 20 Aug 2025 20:27:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: spacemit: add UART resets for Soc K1
To: dlan@gentoo.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, elder@riscstar.com
References: <20250807191817.157494-1-hendrik.hamerlinck@hammernet.be>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250807191817.157494-1-hendrik.hamerlinck@hammernet.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_112757_857875_D4AE6D40 
X-CRM114-Status: GOOD (  15.31  )
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

SGVsbG8sCgpPbiA4LzcvMjUgMjE6MTgsIEhlbmRyaWsgSGFtZXJsaW5jayB3cm90ZToKPiBBZGQg
cmVzZXQgY29udHJvbCBlbnRyaWVzIGZvciBhbGwgVUFSVHMgaW4gdGhlIFNwYWNlTUlUIEsxIFNv
QyBEZXZpY2UgVHJlZS4KPiBVQVJUMCB3YXMgZnVuY3Rpb25hbCBhcyBpdCBkaWQgbm90IG5lZWQg
YSByZXNldC4gQnV0IHRoZSBvdGhlciBVQVJUcyB3ZXJlCj4gdW5hYmxlIHRvIGFjY2VzcyB0aGVp
ciByZWdpc3RlcnMgd2l0aG91dCB0aGUgcmVzZXQgYmVpbmcgYXBwbGllZC4KPgo+IEFsdGhvdWdo
IHBlcmhhcHMgbm90IG5lZWRlZCBJIGRpZCBhZGQgdGhlIHJlc2V0IGZvciBVQVJUMCBhcyB3ZWxs
LAo+IHRvIGVuc3VyZSBjb25zaXN0ZW5jeSBhY3Jvc3MgYWxsIFVBUlRzLiBXaXRoIHRoZSBjdXJy
ZW50LXNwZWVkIHNldCB0bwo+IDExMjUwMCBiYXVkIHJhdGUsIGl0IG1hdGNoZXMgdGhlIGZhY3Rv
cnkgVS1Cb290IHNldHRpbmdzLgo+IFRoaXMgc2hvdWxkIG5vdCBnaXZlIGlzc3VlcyB3aXRoIGVh
cmx5IGNvbnNvbGUgdXNhZ2UuIEJ1dCBwZXJoYXBzIGl0IGNvdWxkCj4gYmUgYSBnb29kIGlkZWEg
dG8gbGV0IHNvbWVib2R5IGVsc2UgY29uZmlybSB0aGlzIGFzIHdlbGwuCkkgaGF2ZSB0ZXN0ZWQg
dGhpcyB2ZXJzaW9uIGZvciBhIHdoaWxlIGFuZCBubyBsb25nZXIgc2VlIHRoZSBuZWVkIGZvcgph
ZGRpdGlvbmFsIGNvbmZpcm1hdGlvbi4KCj4KPiBUZXN0ZWQgdGhpcyBsb2NhbGx5IG9uIGJvdGgg
T3JhbmdlIFBpIFJWMiBhbmQgQmFuYW5hIFBpIEJQSS1GMyBib2FyZHMuIAo+IEkgZW5hYmxlZCB0
aGUgVUFSVDkgYW5kIHdhcyBhYmxlIHRvIHVzZSBpdCBzdWNjZXNzZnVsbHkuCj4KSnVzdCBhIGdl
bnRsZSByZW1pbmRlciBhYm91dCB0aGlzIHBhdGNoLgoKQWxsIFVBUlRzIGFyZSBsaXN0ZWQgaW4g
dGhlIEsxIGRldmljZSB0cmVlIGFuZCBwcm9iZWQgYnkgdGhlIDgyNTBfb2YgZHJpdmVyLApidXQg
d2l0aG91dCByZXNldCBsaW5lcyBtb3N0IG9mIHRoZW0gYXJlIG5vbi1mdW5jdGlvbmFsLiBBZGRp
bmcgdGhlIHJlc2V0cwptYWtlcyB0aGVtIHVzYWJsZSB3aGVuIG1hcHBlZCB0byBkZXZpY2VzLgoK
VGhpcyBwYXRjaCBpcyBsaW1pdGVkIHRvIERUUyByZXNldCBoYW5kbGluZywgc28gVUFSVHMgYXJl
IHVzYWJsZSBpbiB0aGUKY3VycmVudCBzdGF0ZS4gSeKAmW0gYXdhcmUgQWxleCBFbGRlciBpcyBh
c3NpZ25lZCB0byB0aGUgVUFSVCBwZXJpcGhlcmFsIG9uCnRoZSB3aWtpIGFuZCB3aWxsIGxpa2Vs
eSBoYW5kbGUgdGhlIGJyb2FkZXIgZHJpdmVyIGltcHJvdmVtZW50cyAoRE1BLApjbG9jayB1cGRh
dGVzLCBmdWxsIGJhdWQtcmF0ZSBzdXBwb3J0KSwgc28gdGhpcyBzaG91bGQgbm90IGludGVyZmVy
ZSB3aXRoCnRoYXQgd29yay4KClRoYW5rcyBmb3IgdGFraW5nIGEgbG9vayEKCktpbmQgcmVnYXJk
cywKSGVuZHJpawoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
