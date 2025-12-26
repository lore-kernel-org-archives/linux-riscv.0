Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CB3E8FDBA
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 21:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cwsqe2/rlgMMV24I4qeKBBhtzDNWuId/mEfeQmVPwIA=; b=pzCoODt8kLsFn7
	MmiuAxEg3WmHHI3kFj3G5j/3FPK/cruy7R4o2J2r9ezYKMYsQiw4aEPv/Qfg4WL6dG6IlSiwliU4Y
	4zs4atk9VEed1JYwEztfRZZn448PobM18pFW8g/CowKjlxrIe2goK/Zc88uYdAhEaJQ3yMFyYO1Qu
	p9z/Co5DNWsFmrgXNvXuiA4Af98KgCPxImQECm2S+4rnkkTSJBQxlOKDest58ppEz9Kr1jfJlwUIx
	VATugGrqvUA/Vg1enwqcL2wH52jt0R8yYbvY2npmWKD6Op91b/4hJbwEkLcYQA2YNzOU2nfgsXkKP
	v4K8CPhgGBNKVR5AgCwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZFMQ-00000001Tu2-2icx;
	Fri, 26 Dec 2025 21:28:34 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZFMM-00000001TtY-3GrH
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 21:28:33 +0000
Received: by mail-qv1-xf44.google.com with SMTP id 6a1803df08f44-88a2fe9e200so61140926d6.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Dec 2025 13:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766784509; x=1767389309; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vvoJVAmM8Wok9hbNQDBnTQeicKDI82DiXYn2ZKWTwHY=;
        b=eowHzmFQ7fLXfnL6dmA+KhaFqqNdoM0fApgG3Ctf2B3W8JLcg4ylyElHkHrjSQEqik
         tnGt+OApX3NxWugvyIxnA/samThZW7io7HJyC0mZfBKN8vNUZ3YGG5kV/ecHkeK04gB0
         ETMQ/vn3GGBdulCFQVBqWFUxP/0DouWY4qqDKGGQpQa7guGGtgINzRZkz+6Qtdi76fTY
         +WCu0WyEnH7IsmBPNlopLxHK5Z0sUWLealAUu0y7YQJxnBAE0K0SJ0Zw3G7Q10cU2GcX
         A6tyQ2tdVKGL/0ln24SHCiWaYVPL8oI+HBVNdwaPSHOANby1Ljv23LmdMtw/c8jHQKCk
         5mSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766784509; x=1767389309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvoJVAmM8Wok9hbNQDBnTQeicKDI82DiXYn2ZKWTwHY=;
        b=c1emzbZv0I2zEHxuGZWZJDz/QEdZYe0WP+O1st8yEg+oW7m+EocysgVpkorAFEh0SN
         q4oGTBb2TLhxJjCs/XkulgGlbrh9prZidiTxeKQrIgS02wb8cl1eFU6mGEQ99agnYVJK
         Aqexw1YDyV7iIsinqZdpG8hRUrBBfa9L000/y9rnajXJCIuSCFJIn/EAXpeOt4+qC1o4
         YDt66xgo/QlV+Pr2dv3MmolM225KDf5yBZ8cH5QpYJgqtR04HHMVL+EwaEe7hRnIaYdK
         oLcTRXoTID4u1X9GIx3KC3CgOWXOZPqVma3edJ2qiUoZnol4TywKZ1PCvSGJkNy23076
         BaFA==
X-Forwarded-Encrypted: i=1; AJvYcCUPViuIJpcg/FtbI/f9bJxoR6CPZ6/xuJq3M6c6K/45v1E7LI8IabRXfxW3AvOPEXwLw012cUPmspbpDg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9dIN92bKUgBAqoM426WcC4oF2+EtUfSIV+VuR1TBZe9qbhyAo
	m93yq3MUqt8pdha7PgLkjibMd3TUYBkiGhtzZhwwWCjm9oLCXczz33gACVtULCKG6T8=
X-Gm-Gg: AY/fxX5HNL9Y/+TjSCjfgAMiyn22/HgPlV9POTt5E0FErkAyBkxJBXonBet8Pr1mbkW
	sbTNjORVrdZ7AmW1kkRHHOO3lvnwkBdMjmuDYeEU6F+635mPJlEw5NdglkdM/4liAXlD98xWU8i
	p6Y62JnwwWkJ6z0JzzAgJwMFLP8rqNnnYIpOx4CUzWjK9e21rvrmxOdHIx3D7DdWgRKiiONdeQ5
	tCN3VbQO3UA+rmWQy4sBnuXtoIe1UvhBa1m3RUU/XjEWHAtQzajkkzVsVB6Wj0qHW1wCwr6VPjK
	e5f4k6D4wb1M1OsJ7WETg75zQ0J4f8HYEs7HWJJMq10OjYNrKwUKfLuRNkodrm90GPF9VXaNsig
	QcnL8pwrJJ4nuq1/d+bMk445rzBQ8m5lmj26ef9uP8p9BF7xWDcWkiaSVbwSVB77GHEuD/efwls
	FkwGLXMo7TweE1uI5MMYYwBGSRJ2288iO0ZfMPf3sB8B17SuSaHUY=
X-Google-Smtp-Source: AGHT+IEizV1iRxg0/jkvz3rtCxyATJyOMlvYGHBDNYHBQHOCyh2uT+JafGkzBCvSmWX6wyzvEHDGdg==
X-Received: by 2002:a05:6214:da6:b0:880:4736:a20e with SMTP id 6a1803df08f44-88d81278ecbmr437884256d6.2.1766784508605;
        Fri, 26 Dec 2025 13:28:28 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7d5f4sm176833206d6.40.2025.12.26.13.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 13:28:28 -0800 (PST)
Message-ID: <66c0676a-7920-4825-b916-3c00b1648a08@riscstar.com>
Date: Fri, 26 Dec 2025 15:28:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] dt-bindings: riscv: Add B ISA extension
 description
To: Guodong Xu <guodong@riscstar.com>, Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>, Paul Walmsley <paul.walmsley@sifive.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-serial@vger.kernel.org
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-7-3af3f3cd0f8a@riscstar.com>
 <20251222-stitch-preachy-3fab87fd6f0f@spud>
 <CAH1PCMZ7ywZ3unLy0yHYK+fFHk0y=q2cEtPnRi=qSpf=fc75rw@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAH1PCMZ7ywZ3unLy0yHYK+fFHk0y=q2cEtPnRi=qSpf=fc75rw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_132831_121128_9DEB7ADB 
X-CRM114-Status: GOOD (  23.29  )
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

T24gMTIvMjMvMjUgMTI6NTEgQU0sIEd1b2RvbmcgWHUgd3JvdGU6Cj4gSGksIENvbm9yCj4gCj4g
T24gVHVlLCBEZWMgMjMsIDIwMjUgYXQgNToxN+KAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIE1vbiwgRGVjIDIyLCAyMDI1IGF0IDA5OjA0OjE3UE0g
KzA4MDAsIEd1b2RvbmcgWHUgd3JvdGU6Cj4+PiBBZGQgZGVzY3JpcHRpb24gb2YgdGhlIHNpbmds
ZS1sZXR0ZXIgIkIiIGV4dGVubnNpb24gZm9yIEJpdCBNYW5pcHVsYXRpb24uCj4+PiBCIGlzIG1h
bmRhdG9yeSBmb3IgUlZBMjNVNjQuCj4+Pgo+Pj4gVGhlIEIgZXh0ZW5zaW9uIGlzIHJhdGlmaWVk
IGluIHRoZSAyMDI0MDQxMSB2ZXJzaW9uIG9mIHRoZSB1bnByaXZpbGVnZWQKPj4+IElTQSBzcGVj
aWZpY2F0aW9uLiBBY2NvcmRpbmcgdG8gdGhlIHJhdGlmaWVkIHNwZWMsICJ0aGUgQiBzdGFuZGFy
ZAo+Pj4gZXh0ZW5zaW9uIGNvbXByaXNlcyBpbnN0cnVjdGlvbnMgcHJvdmlkZWQgYnkgdGhlIFpi
YSwgWmJiLCBhbmQgWmJzCj4+PiBleHRlbnNpb25zLgo+Pj4KPj4+IEhlbmNlIGFkZCBhIHNjaGVt
YSBjaGVjayBydWxlIHRvIGVuZm9yY2UgdGhhdCBCIGltcGxpZXMgWmJhLCBaYmIgYW5kIFpicy4K
Pj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBHdW9kb25nIFh1IDxndW9kb25nQHJpc2NzdGFyLmNvbT4K
Pj4+IC0tLQo+Pj4gdjI6IE5ldyBwYXRjaC4KPj4+IC0tLQo+Pj4gICAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgICAgICAgICB8IDE5ICsrKysrKysrKysrKysr
KysrKysKPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lv
bnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNp
b25zLnlhbWwKPj4+IGluZGV4IDU2NWNiMmNiYjQ5YjU1Mjk1OTM5MjgxMGE5YjczMWI0MzM0NmE1
OTQuLjM4NWUxZGViMjM5OTZkMjk0ZTc2NjI2OTNmMTI1N2Y5MTBhNmUxMjkgMTAwNjQ0Cj4+PiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55
YW1sCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0
ZW5zaW9ucy55YW1sCj4+PiBAQCAtMTA5LDYgKzEwOSwxMyBAQCBwcm9wZXJ0aWVzOgo+Pj4gICAg
ICAgICAgICAgICBUaGUgc3RhbmRhcmQgQyBleHRlbnNpb24gZm9yIGNvbXByZXNzZWQgaW5zdHJ1
Y3Rpb25zLCBhcyByYXRpZmllZCBpbgo+Pj4gICAgICAgICAgICAgICB0aGUgMjAxOTEyMTMgdmVy
c2lvbiBvZiB0aGUgdW5wcml2aWxlZ2VkIElTQSBzcGVjaWZpY2F0aW9uLgo+Pj4KPj4+ICsgICAg
ICAgIC0gY29uc3Q6IGIKPj4+ICsgICAgICAgICAgZGVzY3JpcHRpb246Cj4+PiArICAgICAgICAg
ICAgVGhlIHN0YW5kYXJkIEIgZXh0ZW5zaW9uIGZvciBiaXQgbWFuaXB1bGF0aW9uIGluc3RydWN0
aW9ucywgYXMKPj4+ICsgICAgICAgICAgICByYXRpZmllZCBpbiB0aGUgMjAyNDA0MTEgdmVyc2lv
biBvZiB0aGUgdW5wcml2aWxlZ2VkIElTQQo+Pj4gKyAgICAgICAgICAgIHNwZWNpZmljYXRpb24u
IFRoZSBCIHN0YW5kYXJkIGV4dGVuc2lvbiBjb21wcmlzZXMgaW5zdHJ1Y3Rpb25zCj4+PiArICAg
ICAgICAgICAgcHJvdmlkZWQgYnkgdGhlIFpiYSwgWmJiLCBhbmQgWmJzIGV4dGVuc2lvbnMuCj4+
PiArCj4+PiAgICAgICAgICAgLSBjb25zdDogdgo+Pj4gICAgICAgICAgICAgZGVzY3JpcHRpb246
Cj4+PiAgICAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBWIGV4dGVuc2lvbiBmb3IgdmVjdG9yIG9w
ZXJhdGlvbnMsIGFzIHJhdGlmaWVkCj4+PiBAQCAtNzM1LDYgKzc0MiwxOCBAQCBwcm9wZXJ0aWVz
Ogo+Pj4gICAgICAgICAgIHRoZW46Cj4+PiAgICAgICAgICAgICBjb250YWluczoKPj4+ICAgICAg
ICAgICAgICAgY29uc3Q6IGYKPj4+ICsgICAgICAjIGIgY29tcHJpc2VzIHRoZSBmb2xsb3dpbmcg
ZXh0ZW5zaW9ucwo+Pj4gKyAgICAgIC0gaWY6Cj4+PiArICAgICAgICAgIGNvbnRhaW5zOgo+Pj4g
KyAgICAgICAgICAgIGNvbnN0OiBiCj4+Cj4+IFdoYXQncyB0aGUgdmFsdWUgaW4gYWRkaW5nIGIs
IGlmIGl0IGRlcGVuZHMgb24gaGF2aW5nIGFsbCAzIG9mIHRoZQo+PiBjb21wb25lbnRzIGRlZmlu
ZWQgaW5kaXZpZHVhbGx5IHRvbz8gQ3VycmVudGx5IGFsbCAic3VwZXJzZXQiIHR5cGVzIG9mCj4+
IGV4dGVuc2lvbnMgYXJlIHBlcm1pdHRlZCB3aXRob3V0IHRoZWlyIGNvbXBvbmVudCBwYXJ0cyBh
bHNvIGJlaW5nIGRlZmluZWQsCj4+IHRoaXMgZG9lc24ndCBmb2xsb3cgY29udmVudGlvbiBhbmQg
dGhlcmVmb3JlIG5lZWRzIHRvIGJlIGV4cGxhaW5lZC4KPj4KPj4gWW91IG9idmlvdXNseSBuZWVk
IHRoaXMgY29uc3RydWN0IGJlY2F1c2UgdGhlIGtlcm5lbCBkb2VzIG5vdCB1bmRlcnN0YW5kCj4+
ICJiIiwgYW5kIGV2ZW4gaWYgeW91IGFkZGVkIHN1cHBvcnQgZm9yIGludGVycHJldGluZyAiYiIg
dG8gdGhlIGtlcm5lbAo+PiB0aGlzIGlzIHByb2JhYmx5IHN0aWxsIG5lZWRlZCB0byBtYWtlIHN1
cmUgdGhlIEFCSSBpcyBtYWludGFpbmVkIGZvcgo+PiBhbnl0aGluZyBpbXBvcnRpbmcgYSBkZXZp
Y2V0cmVlIGZyb20gdGhlIGtlcm5lbC4KPiAKPiBZZXMsIGV4YWN0bHkuIFVubGlrZSBvdGhlciBz
aW5nbGUtbGV0dGVyIGV4dGVuc2lvbnMsICJiIiB3YXMgcmF0aWZpZWQKPiAoQXByLzIwMjQpIG11
Y2ggbGF0ZXIgdGhhbiBpdHMgY29tcG9uZW50cyB6YmEvemJiL3picyAoSnVuLzIwMjEpLgo+IEV4
aXN0aW5nIHNvZnR3YXJlIGFuZCB0aGUga2VybmVsIGFscmVhZHkgZXhwZWN0IHRoZXNlIGV4cGxp
Y2l0IGNvbXBvbmVudAo+IHN0cmluZ3MsIHNvIGVuZm9yY2luZyB0aGlzIGRlcGVuZGVuY3kgZW5z
dXJlcyBjb3JlcyBkZWNsYXJpbmcgImIiIHdpbGwKPiBhbHNvIGJlIGNvcnJlY3RseSB1bmRlcnN0
b29kIGJ5IG9sZGVyIHNvZnR3YXJlIHRoYXQgb25seSBsb29rcyBmb3IKPiB6YmEvemJiL3picy4K
CkkgbWlnaHQgYmUgbWlzdW5kZXJzdGFuZGluZyB5b3UsIGJ1dCBJIGRvbid0IHRoaW5rIGV4dGVu
c2lvbiAiYiIKc2hvdWxkICpyZXF1aXJlKiB0aGUgb3RoZXIgdGhyZWUgZXh0ZW5zaW9ucy4gIElu
c3RlYWQsIHRoZSAiYiIKZXh0ZW5zaW9uIHNob3VsZCBiZSBjb25zaWRlcmVkICplcXVpdmFsZW50
KiB0byB0aGUgb3RoZXIgdGhyZWUuClRoYXQncyB3aGF0IEkgdW5kZXJzdGFuZCBpdCB0byBtZWFu
LCBhbnl3YXkuCiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1iCgpUaGVyZSdzIG5v
IHBvaW50IGluIHN1cHBvcnRpbmcgImIiIGluIGRldmljZXRyZWUgdG8gcmVwcmVzZW50CnRoZSBv
dGhlcnMgaWYgaXQgYWxzbyByZXF1aXJlcyB0aGUgb3RoZXJzIHRvIGJlIHByZXNlbnQuCgpJIHRo
aW5rIHRoYXQsIGluc3RlYWQsICJiIiwgInpiYSIsICJ6YmIiLCBhbmQgInpicyIgc2hvdWxkIGFs
bApiZSBhbGxvd2VkLgoKSSBtaWdodCBldmVuIGdvIGZ1cnRoZXIgYW5kIGhhcmRlbiB0aGUgcmVx
dWlyZW1lbnQsIHNheWluZyB0aGF0CmlmIHlvdSBzcGVjaWZ5ICJiIiB5b3Ugc2hvdWxkICpub3Qq
IHNwZWNpZnkgInpiYSIsICJ6YmIiLCBvciAiemJzIi4KQnV0IHRoYXQgbWlnaHQgbm90IGJlIG5v
cm1hbCBwcmFjdGljZSwgYW5kIGl0J3Mgbm90IG5lY2Vzc2FyeQpiZWNhdXNlIHRoZXkgYXJlbid0
IGluIGNvbmZsaWN0LgoKCQkJCQktQWxleAoKPiBJIHdpbGwgdXBkYXRlIHRoZSBjb21taXQgbWVz
c2FnZSBpbiB2MyB0byBjbGVhcmx5IGV4cGxhaW4gdGhpcyByZWFzb25pbmcuCj4gRG9lcyBpdCBz
b3VuZCBnb29kIHRvIHlvdT8KPiAKPiBUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCj4gCj4gQlIs
Cj4gR3VvZG9uZyBYdQo+IAo+Pgo+Pj4gKyAgICAgICAgdGhlbjoKPj4+ICsgICAgICAgICAgYWxs
T2Y6Cj4+PiArICAgICAgICAgICAgLSBjb250YWluczoKPj4+ICsgICAgICAgICAgICAgICAgY29u
c3Q6IHpiYQo+Pj4gKyAgICAgICAgICAgIC0gY29udGFpbnM6Cj4+PiArICAgICAgICAgICAgICAg
IGNvbnN0OiB6YmIKPj4+ICsgICAgICAgICAgICAtIGNvbnRhaW5zOgo+Pj4gKyAgICAgICAgICAg
ICAgICBjb25zdDogemJzCj4+PiAgICAgICAgICMgWmNiIGRlcGVuZHMgb24gWmNhCj4+PiAgICAg
ICAgIC0gaWY6Cj4+PiAgICAgICAgICAgICBjb250YWluczoKPj4+Cj4+PiAtLQo+Pj4gMi40My4w
Cj4+Pgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
