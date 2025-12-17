Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF19D637A5
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Dec 2025 08:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nEsIXkUxhcY1UdfRdJ5ki1aBHiowK/jAEh+THMTiwK0=; b=U2sDHfuUFD+1S7
	n7cVT4nKiXjFs9Qi1izcOxA25xjCA02tlAlwU/sb2nDxJsAz3VX3CoKNUd4M/4yNb6691olJrLwOH
	VXT4NHvwimaKQXaMchLaBxE4aBYTPNkMQQIU+hnLuaKWkCO5I8Rk/y5qMpaO6zqdU5R8QStr/Soiw
	epDM1q7K2IsyszgGtBEtFluv42CfLhBnmagMz0s56Edr4lJLTUyplgxtpJmjJsuwsiXRMveJezCP6
	1g2ODD0n8VsBp7DvnOWf1q8pnLRAOCqtVba3kZKmNvua509/NLWFVnhjjXgS8pdhsdkiDfkFi0QjB
	TNIzyecc3Dt1zmJZWWAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmZ9-00000006Jvn-3T3H;
	Wed, 17 Dec 2025 08:07:23 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmZ6-00000006JvH-23ng
	for linux-riscv@lists.infradead.org;
	Wed, 17 Dec 2025 08:07:22 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8C6C73F7BB
	for <linux-riscv@lists.infradead.org>; Wed, 17 Dec 2025 08:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1765958837;
	bh=xg/D3+GtNZwzqAPEwq0TMwZyqoVeXCC40cLNYkdUJrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=KYE9ADm1/ht4OG503aMtEdWs4UdqV694Zbq0pLcwMKY802ASoNxuQMKNHanmBWLIR
	 QjLwK9yHjVfwcQ0vx1WEbpHSTmfa4hl2adVOITqglrmj2zd/rJXpL9IcLr9kCQqxwD
	 BKsske22MmDZzlrVtyKqlcPRGfpiv2G4RvpGXMCmy/uG94kw69t6/AM05D2ovO0cBJ
	 Kp5fl/djW7K6kQp+ZU0PhzBL67ph4Hr4VysKIQ2oC8EGKTGb2IMpFVfFPxuRAkDpVj
	 /nOq8lBDtoegTQ7b6Qv33UPbROD0r9T/g/Iu8EgiULiNi9rbAdaoAtW7uhLlZv+1Au
	 l7eOYa5KQaJSVCz3wKalVI7v768ZoNt9e6awbXw1RL4cbwYXEaWP9hCk43JodP0N8c
	 AN2bSP88rMG8XfFwb0loGqHV4pW3ni/LPM6vx3YhrEPtXEUH1eoYqYwOd7EIyoBBp+
	 TwP+YaxjHobOdJ+fRZvDplO3A/wJyBAdHXJPjbhLbc5CBDg4bGR7bFkkDpTZHfoS4B
	 6Wf24/1GkW7W4Ht3tDNCPiTNsG5ol+nH5+5ZksU1t76ImZJXILpo8gUdkKKql8O3Du
	 nxZzDTeqL7Z5e0qB4/vTfYcM/WNaHsaY1D9kp+HVv3xLa70hiNYsqEvnPL7x1AJqlq
	 EzFkQrwWNcTwxOttd8C1HL9g=
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47904cdb9bbso2011105e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Dec 2025 00:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765958837; x=1766563637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xg/D3+GtNZwzqAPEwq0TMwZyqoVeXCC40cLNYkdUJrk=;
        b=IrQ0xKlj5yZvVqOE79f5upHXOzKyq6Di0aYhMYOUnltl54ucFmpgSpJam6yX5vYP7q
         S+kt52lhAIN6ZR+zIrFCRySF5neFRQ02w1GbtwGFxHpWJ94cgRDQhk8pRvSPQ2Xiefeo
         0bZV/8oBniZHZLDDHxOVXO+Brc+mw9P8+4SdUnUvD6M7GQoq7k4Ba1+3v+fjlGzVOH2T
         fdUtNO2Ia1GrqOXO3YGycKNCWzLOGFjhTYbhzNNqT+hPPFDE+HIp8HRveNlh8jnLrOGW
         88VZ7wDb1hbui5jwGelt34I39/Mix5zwT7Xmr4zMIckQG5iq+zO5qeQOSGh9ytZdBklj
         VNTA==
X-Forwarded-Encrypted: i=1; AJvYcCV3HWMbu2XUWSgUJMwkFhTBPwy+gW6kpp45w49g770Gzr4T7GIETOPHCHzPuRukXn6bkjFzy4r+Kly6/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxR+uvKbYx/TFeaa/SR8Z6YWnyJypbZqQ2f7FucWX0nxOR/dIWC
	H1XQvAdH2FQX/04DPANRkqlNrIQQqpzUicxBpqmBOSC9pBfz0gSB5bazrkWpnrpOqTWQvtR1X6Q
	ERaSzO+uHGkdp4LFGyODxYoaGts9Xjy7VMnwbxdb8xRvp1hQWQzQMFocY2Fd9wEHfwSCZ4vmX+2
	P99sLXDjBf1Q==
X-Gm-Gg: AY/fxX5Aukk4S+hL1RrrYzcbJRuCcH3xopyFmWSIXfJLCq/N/d97ig+qYph6VKDwIJY
	A8tNiq3EA3AUWpkzMNKu2esB4YF6jR6SWYvtupCbMdBDTOPfV1kEeaHdEGJnTLE8ZQeDASAZcam
	N4ieOvb8Y4Ka0MGyZ9kuMMsx9K7/KU2WO09vObxnltK5saN0kv+QWVrOW8wv8CaiM88QnuEIq51
	UhnYPgvpJfXqYwtXgmkQ0e/AdwCZ4jP9DTIsV3gPVEyG+gAkhr0KfxXjKkq3mbVn4VcD5MMwAd3
	BGMiz8Lsi0BKZHNOaWVvcTv1xdpUcKkiroS5mG17VnQ2fQ/tf5d7CRkuO/Hq8ofbX+umaPTxybc
	qF7kk4xSDso9tNBJAfrXN3kTi7GzNBF/T3e+mpJO0FTEy9XhAQ/TxGN/LDh3hxFY+YOzHKliXFo
	kXHX3/8RE=
X-Received: by 2002:a05:600c:1c89:b0:479:3a8e:e490 with SMTP id 5b1f17b1804b1-47a8f2cb09dmr191147595e9.18.1765958837043;
        Wed, 17 Dec 2025 00:07:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7lkgkkTPibPOHbDFxaP2ZN+RqjAz8H8zIVMsrRtI5v9GDMT5pL8zNOJZxvsyHlbuiIA43Hg==
X-Received: by 2002:a05:600c:1c89:b0:479:3a8e:e490 with SMTP id 5b1f17b1804b1-47a8f2cb09dmr191147195e9.18.1765958836564;
        Wed, 17 Dec 2025 00:07:16 -0800 (PST)
Received: from [192.168.123.154] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc2221c4sm25403885e9.11.2025.12.17.00.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 00:07:16 -0800 (PST)
Message-ID: <f9b6b5e2-ec9e-4208-8267-77020e0a9411@canonical.com>
Date: Wed, 17 Dec 2025 09:07:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Guodong Xu <guodong@riscstar.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 linux-serial@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-7-a0d256c9dc92@riscstar.com>
 <60948ca2-ed3d-485b-9b11-15df7ef8791d@canonical.com>
 <CAH1PCMb=+TvB1w+G6a2ANDp05HUwC4r6CFBDHXFwSmoP3Mm8xw@mail.gmail.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAH1PCMb=+TvB1w+G6a2ANDp05HUwC4r6CFBDHXFwSmoP3Mm8xw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_000720_856412_1AC1BA61 
X-CRM114-Status: GOOD (  32.93  )
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

T24gMTIvMTcvMjUgMDg6MTEsIEd1b2RvbmcgWHUgd3JvdGU6Cj4gT24gVHVlLCBEZWMgMTYsIDIw
MjUgYXQgMTA6MjTigK9QTSBIZWlucmljaCBTY2h1Y2hhcmR0Cj4gPGhlaW5yaWNoLnNjaHVjaGFy
ZHRAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIDEyLzE2LzI1IDE0OjMyLCBHdW9kb25n
IFh1IHdyb3RlOgo+Pj4gU3BhY2VtaVQgSzMgaXMgZXF1aXBwZWQgd2l0aCA4IFgxMDAgY29yZXMs
IHdoaWNoIGFyZSBSVkEyMyBjb21wbGlhbnQuCj4+PiBBZGQgbm9kZXMgb2YgdWFydHMsIHRpbWVy
IGFuZCBpbnRlcnJ1cHQtY29udHJvbGxlcnMuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogR3VvZG9u
ZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4+PiAtLS0KPj4+ICAgIGFyY2gvcmlzY3YvYm9v
dC9kdHMvc3BhY2VtaXQvazMuZHRzaSB8IDUyOSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDUyOSBpbnNlcnRpb25zKCspCj4+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMuZHRzaSBiL2FyY2gv
cmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMuZHRzaQo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
Pj4+IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLmNiMjdi
NzkwNzE2ZmRkNmRjMmJjODljMjhkZDI1ODhhNTk2YTVhZjkKPj4+IC0tLSAvZGV2L251bGwKPj4+
ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMuZHRzaQo+Pj4gQEAgLTAsMCAr
MSw1MjkgQEAKPj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgTUlU
KQo+Pj4gKy8qCj4+PiArICogQ29weXJpZ2h0IChjKSAyMDI1IFNwYWNlbWlUIChIYW5nemhvdSkg
VGVjaG5vbG9neSBDby4gTHRkCj4+PiArICogQ29weXJpZ2h0IChjKSAyMDI1IEd1b2RvbmcgWHUg
PGd1b2RvbmdAcmlzY3N0YXIuY29tPgo+Pj4gKyAqLwo+Pj4gKwo+Pj4gKyNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4KPj4+ICsKPj4+ICsvZHRzLXYxLzsK
Pj4+ICsKPj4+ICsvIHsKPj4+ICsgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Owo+Pj4gKyAgICAg
I3NpemUtY2VsbHMgPSA8Mj47Cj4+PiArICAgICBtb2RlbCA9ICJTcGFjZW1pVCBLMyI7Cj4+PiAr
ICAgICBjb21wYXRpYmxlID0gInNwYWNlbWl0LGszIjsKPj4+ICsKPj4+ICsgICAgIGFsaWFzZXMg
ewo+Pj4gKyAgICAgICAgICAgICBzZXJpYWwwID0gJnVhcnQwOwo+Pj4gKyAgICAgICAgICAgICBz
ZXJpYWwyID0gJnVhcnQyOwo+Pj4gKyAgICAgICAgICAgICBzZXJpYWwzID0gJnVhcnQzOwo+Pj4g
KyAgICAgICAgICAgICBzZXJpYWw0ID0gJnVhcnQ0Owo+Pj4gKyAgICAgICAgICAgICBzZXJpYWw1
ID0gJnVhcnQ1Owo+Pj4gKyAgICAgICAgICAgICBzZXJpYWw2ID0gJnVhcnQ2Owo+Pj4gKyAgICAg
ICAgICAgICBzZXJpYWw3ID0gJnVhcnQ3Owo+Pj4gKyAgICAgICAgICAgICBzZXJpYWw4ID0gJnVh
cnQ4Owo+Pj4gKyAgICAgICAgICAgICBzZXJpYWw5ID0gJnVhcnQ5Owo+Pj4gKyAgICAgICAgICAg
ICBzZXJpYWwxMCA9ICZ1YXJ0MTA7Cj4+PiArICAgICB9Owo+Pj4gKwo+Pj4gKyAgICAgY3B1czog
Y3B1cyB7Cj4+PiArICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+Pj4gKyAgICAg
ICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPj4+ICsgICAgICAgICAgICAgdGltZWJhc2UtZnJl
cXVlbmN5ID0gPDI0MDAwMDAwPjsKPj4+ICsKPj4+ICsgICAgICAgICAgICAgY3B1XzA6IGNwdUAw
IHsKPj4+ICsgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNwYWNlbWl0LHgxMDAi
LCAicmlzY3YiOwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGRldmljZV90eXBlID0gImNwdSI7
Cj4+PiArICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDA+Owo+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgIHJpc2N2LGlzYS1iYXNlID0gInJ2NjRpIjsKPj4+ICsgICAgICAgICAgICAgICAgICAg
ICByaXNjdixpc2EtZXh0ZW5zaW9ucyA9ICJpIiwgIm0iLCAiYSIsICJmIiwgImQiLCAiYyIsICJ2
IiwgImgiLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
InNtYWlhIiwgInNtc3RhdGVlbiIsICJzc2FpYSIsICJzc2NvZnBtZiIsCj4+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAic3NucG0iLCAic3N0YyIsICJzdmFk
ZSIsICJzdmludmFsIiwgInN2bmFwb3QiLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgInN2cGJtdCIsICJ6YXdycyIsICJ6YmEiLCAiemJiIiwgInpiYyIs
ICJ6YnMiLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
InpjYSIsICJ6Y2IiLCAiemNkIiwgInpjbW9wIiwgInpmYSIsICJ6ZmJmbWluIiwKPj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ6ZmgiLCAiemZobWluIiwg
InppY2JvbSIsICJ6aWNib3AiLCAiemljYm96IiwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJ6aWNudHIiLCAiemljb25kIiwgInppY3NyIiwgInppZmVu
Y2VpIiwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ6
aWhpbnRudGwiLCAiemloaW50cGF1c2UiLCAiemlocG0iLCAiemltb3AiLAo+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInprdCIsICJ6dmJiIiwgInp2YmMi
LCAienZmYmZtaW4iLCAienZmYmZ3bWEiLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgInp2ZmgiLCAienZmaG1pbiIsICJ6dmtiIiwgInp2a2ciLCAienZr
biIsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAienZr
bmMiLCAienZrbmVkIiwgInp2a25nIiwgInp2a25oYSIsCj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAienZrbmhiIiwgInp2a3MiLCAienZrc2MiLCAienZr
c2VkIiwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ6
dmtzZyIsICJ6dmtzaCIsICJ6dmt0IjsKPj4KPj4gVGhpcyBub3QgdGhlIGRlc2NyaXB0aW9uIG9m
IGFuIFJWQTIzUzY0IGNwdS4gSXQgaXMgbm90IGV2ZW4gUlZBMjNVNjQsCj4+IGUuZy4gYHN1cG1g
IGlzIG1pc3NpbmcuCj4+Cj4+IElzIHRoZSBkZXNjcmlwdGlvbiBpbmNvbXBsZXRlIG9yIGlzIHRo
ZSBDUFUgbm90IGNvbXBsaWFudD8KPiAKPiBIaSBIZWlucmljaCwKPiAKPiBUaGUgU3BhY2VtaVQg
SzMgc3VwcG9ydHMgdGhlIG1hbmRhdG9yeSBleHRlbnNpb25zIGRlZmluZWQgaW4gdGhlIFJWQTIz
Cj4gUHJvZmlsZSAocmF0aWZpZWQgT2N0IDIwMjQpLiBUaGUgbGlzdCBhcHBlYXJzIGluY29tcGxl
dGUgaGVyZSBvbmx5IGJlY2F1c2UKPiBJIGFtIHJlc3RyaWN0aW5nIHRoZSBlbnRyaWVzIHRvIHRo
b3NlIGN1cnJlbnRseSBzdXBwb3J0ZWQgYnkgdGhlIExpbnV4Cj4ga2VybmVsIERldmljZSBUcmVl
IGJpbmRpbmdzLgo+IAo+IFNwZWNpZmljYWxseSwgSSBtdXN0IGFkaGVyZSB0bwo+IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgKGFuZCBjcHVz
LnlhbWwgZm9yCj4gcHJvcGVydGllcyBsaWtlICdyaXNjdixzdjM5JyB3aGljaCBzdGFuZHMgZm9y
IHRoZSBleHRlbnNpb24gU3YzOSkuIElmIEkKPiBhZGQgZXh0ZW5zaW9uIHN0cmluZ3MgdGhhdCBh
cmUgbm90IHlldCBkZWZpbmVkIGluIHRoZXNlIHNjaGVtYXMsIHN1Y2ggYXMKPiBzdXBtLCBydW5u
aW5nICdtYWtlIGR0YnNfY2hlY2sgVz0zJyBmYWlscyB3aXRoOiAnc3VwbScgaXMgbm90IG9uZSBv
Zgo+IFsnaScsICdtJywgJ2EnLCAuLi5dLCBmb2xsb3dlZCBieSAiVW5ldmFsdWF0ZWQgcHJvcGVy
dGllcyBhcmUgbm90IGFsbG93ZWQuIgoKSWYgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCBpcyBpbmNvbXBsZXRlIAp3aXRoIHJlc3BlY3QgdG8g
cmF0aWZpZWQgZXh0ZW5zaW9ucywgSSBndWVzcyB0aGUgcmlnaHQgYXBwcm9hY2ggaXMgdG8gCmFt
ZW5kIGl0IGFuZCBub3QgdG8gY3VydGFpbCB0aGUgQ1BVIGRlc2NyaXB0aW9uLgoKQmVzdCByZWdh
cmRzCgpIZWlucmljaAoKPiAKPiBBbm90aGVyIGFuZ2xlLCBJIGZvdW5kIHRoZXJlIGFyZSBvdGhl
ciByZWFzb25zIHdoeSBMaW51eCBrZXJuZWwgY2hvc2UgdG8KPiAnb21pdCcgc29tZSBzcGVjaWZp
YyBleHRlbnNpb24gc3RyaW5ncy4gRm9yIGV4YW1wbGUsIGhlcmUgYXJlIHdoYXQgSSBub3RpY2Vk
Cj4gc28gZmFyLCBpbmNsdWRpbmcgdGhlICdzdXBtJyB5b3UgbWVudGlvbmVkOgo+IAo+IHN1cG06
IFRoZXJlIGlzIG5vIGJpbmRpbmcgc3RyaW5nIGZvciB0aGlzIHlldC4gSG93ZXZlciwgaW4gdGhl
IGtlcm5lbCBjb25maWcKPiAocmVmZXIgdG8gYXJjaC9yaXNjdi9LY29uZmlnKSwgUklTQ1ZfSVNB
X1NVUE0gZGVwZW5kcyBvbiB0aGUgZGV0ZWN0aW9uIG9mIHRoZQo+IHVuZGVybHlpbmcgJ3NtbnBt
JyBvciAnc3NucG0nIGhhcmR3YXJlIGV4dGVuc2lvbnMuIFNpbmNlICdzc25wbScgaXMKPiBwcmVz
ZW50IGluIG15IGxpc3QsIGl0IGNhbiBiZSBjb25zaWRlcmVkIGFzIHN1cHBvcnRlZCBhbmQgdGhl
IGtlcm5lbAo+IHdpbGwgZW5hYmxlIHBvaW50ZXIgbWFza2luZyBzdXBwb3J0IGF1dG9tYXRpY2Fs
bHkuCj4gCj4gT3RoZXIgZXhhbXBsZXM6Cj4gc3NzdGF0ZWVuOiBUaGUga2VybmVsIHNjaGVtYSBj
dXJyZW50bHkgdXNlcyB0aGUgc21zdGF0ZWVuIHN0cmluZyB0bwo+IGNvdmVyIENTUiBhY2Nlc3Mg
Y29udHJvbCBpbiBhbGwgbW9kZXMgKEgvUy9WUy9VL1ZVKS4gSSBoYXZlIGluY2x1ZGVkCj4gJ3Nt
c3RhdGVlbicgdG8gc2F0aXNmeSB0aGlzLCBhcyB0aGVyZSBpcyBubyBzZXBhcmF0ZSAnc3NzdGF0
ZWVuJyBiaW5kaW5nCj4gaW4gdGhlIGV4dGVuc2lvbnMueWFtbC4KPiAKPiB6aWNjaWY6IFRoaXMg
ZXh0ZW5zaW9uIGlzIGFsc28gYWJzZW50IGZyb20gdGhlIGJpbmRpbmdzLCBkZXNwaXRlIGJlaW5n
Cj4gaW1wbGllZCBieSBmdHJhY2UgZHluYW1pYyBjb2RlIHdvcmsuIFJlZmVyZW5jZToKPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA0MDcxODA4MzguNDI4NzctMTItYW5keWJuYWNA
Z21haWwuY29tLwo+IEkgaW50ZW5kIHRvIHN1Ym1pdCBhIHNlcGFyYXRlIHBhdGNoIHNlcmllcyB0
byBmb3JtYWxseSBhZGQgemljY2lmIHRvCj4gZXh0ZW5zaW9ucy55YW1sLgo+IAo+IEFueXdheSwg
SSBoYXZlIGxpbWl0ZWQgdGhlIHgxMDAgcmlzY3YsaXNhLWV4dGVuc2lvbnMgbGlzdCB0byBzdHJp
Y3RseQo+IHZhbGlkYXRlIGFnYWluc3QgdGhlIGN1cnJlbnQga2VybmVsIHNjaGVtYSB3aGlsZSBl
eHBvc2luZyBhbGwgZmVhdHVyZXMKPiB0aGUga2VybmVsIGlzIGN1cnJlbnRseSBjYXBhYmxlIG9m
IHBhcnNpbmcuCj4gCj4gSSBob3BlIHRoaXMgZXhwbGFuYXRpb24gY2xhcmlmaWVzIHRoZSBzaXR1
YXRpb24uIFBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3UKPiBhZ3JlZSB3aXRoIHRoaXMgYXBwcm9h
Y2guCj4gCj4gQmVzdCBSZWdhcmRzLAo+IEd1b2RvbmcgWHUKPiAKPj4KPj4gQmVzdCByZWdhcmRz
Cj4+Cj4+IEhlaW5yaWNoCj4+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
