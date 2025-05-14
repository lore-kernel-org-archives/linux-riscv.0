Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613F6C3ABD9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 07:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TylwdaBpKa3pP0kLOK6vduLTaOUrVsAuXI9NuWYrK7s=; b=0jAmoe50i+aFo2
	QYlLl6QA1vdjy3F+s/1HX11cC1mPROGemRAgKoqueaQPC1XBzjROLybb5cZa/6NXLdoMWWmOruLjM
	eQ6cAonZfh4EmvSZtsEy7qGQF02YxoynZjp/LKKFJ3EI/fPiGU4JwyAleZVtXtTsIfODEVHH8sQ/8
	DE1BR1A+gImy5IKzVFNGNQZJGzVBl4jglNXJ5cZRk8K7t6tKbVJsL3wpJ0Q7B9lN4/O4dZmPFbhhn
	6cStjnA9fvmxKDU6jIRSypDhAepuIfF8pH3nEAjqN4N9Dia7t7W248tCLIwYQjzFb/1meZEOSak4F
	Yq6s6bSwbIIP0TF25TLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6bc-0000000ELGI-3AfK;
	Wed, 14 May 2025 07:32:44 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6RM-0000000EI3X-3Qkq
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 07:22:10 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ad23db02350so712746766b.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 00:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747207327; x=1747812127; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcbw5sLrHE1qbiw4ucHwavhVf9qACz67c1w54poiYio=;
        b=ddGdOdK3Lw6xGPNCY2OV9xwhHqUpKxL4Yijz5CWVGON6QvM1lhg76+wiSItxoxbu8F
         jcHgd0h48nLCXWvfOrE+jVmW8qMAao9s1xhvmhguvIKJIDlTRNpYBSf4t/TgoxPgkaPR
         /AgjDj9Gm9afU3U4kNL6TO44CMzwEufVwPUfndOHmQWds9vAoRTz4DvL4ndshRN2l14Y
         qh19Nj31LqWKqG+d2UUXp2wu2f8g5XWoiry/PN2sJ/hJutdKtImcEVlVdswWqyAKqyxs
         tWq+y3RDSoMMo2zNAbSrxwWBtEEL1AiN8AzYuEiykmjAtzkavph2wNcjF784RnV0yNAx
         4RKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747207327; x=1747812127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcbw5sLrHE1qbiw4ucHwavhVf9qACz67c1w54poiYio=;
        b=mU6QXjUezXmCado4jSjCGXI9nc51pmrMpG3D24Kfws9pwMlzUqV6TkV0QttAB16jYQ
         bPriKLhaE+9H46kJRYtWU4ShS5jTeKll88vxkXCFd2hDl0czNQmx+bB5pe6G5acGK74z
         AQKW3MikQlBDd0w1YuzHnxwjhIglhnIaefGV3K21aZT4g+JE9+BO7LQIb2sFceapod/5
         LRcUSaPJKz1sfxeJgw+6uKWtWiOTuNtFvYc4ppLpfnK0RNEW2c0F4L0UyxRXG/WLl1nT
         TeOAydcZGEUDfACPaAxAbfNSqhZKqEzc+tOH1lLKiYjruZ4x8B8JFfb/aFtKfjo5udT0
         1fjA==
X-Forwarded-Encrypted: i=1; AJvYcCV6Wa95WdAr5s97ueCY1hJexsPS/ipPD0wZ70Y0e1t5/AxWMEK8y6ctrbfzJL3mLcxAM5955pq4XuTuIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJShwpIx2dcMzNYEVqJW/x4MTFTuX47jSQeeXZAEVAasQsetPO
	pL1CcN/SiIksS87V7R9ek4c8HOoNnsE5yor1JI0xyXarsXJ9GKmE89N0hwXZYZfGpvSv7lbHeM9
	/zFo1Mw/0+AS6sCt1EtQND+lljH6mqY630RdFNA==
X-Gm-Gg: ASbGnctGiCsJSWOuksJt+o8D5DwE07CKP1NmD2+JITEI7iJQKxwyC3SM0Eix9ZsoCJf
	64DI6dF6f6sYaPiBiZg3wjMRWiYCJVtxWhuxeHubsRCi/E92pZf6bYuIxHksOh8t23Ht2N1HH7n
	YKnWvblIxzLpK04P6WQmbrJExSWy5QbNM=
X-Google-Smtp-Source: AGHT+IHqsMqx3BaDCWn45qMLaOEYvPW7XUqjv7SdJvzZ3hWp+AKyoxb4KrcmHMVJwGZocnpesHw3un4CM8pfyBJnatc=
X-Received: by 2002:a17:907:7f94:b0:acb:b1be:4873 with SMTP id
 a640c23a62f3a-ad4f70f6129mr261521866b.2.1747207326486; Wed, 14 May 2025
 00:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250429085048.1310409-1-guodong@riscstar.com>
In-Reply-To: <20250429085048.1310409-1-guodong@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 14 May 2025 15:21:53 +0800
X-Gm-Features: AX0GCFscwF3i-VATg9tXixD2-TDlOGgy-oyXk_jgaiYVherKFdQgiFo0yj7WIAw
Message-ID: <CAH1PCMai91WjooaF8HzY=rJWpFT4Drnx7fcs4+NCsLT4pGEKUA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] pwm: Update PWM_PXA driver for SpacemiT K1
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, conor+dt@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, alex@ghiti.fr, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, drew@pdp7.com, Inochi Amaoto <inochiama@gmail.com>, 
	geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, 
	hal.feng@starfivetech.com, unicorn_wang@outlook.com, duje.mihanovic@skole.hr, 
	heikki.krogerus@linux.intel.com
Cc: Alex Elder <elder@riscstar.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_002209_129263_5AC29F09 
X-CRM114-Status: GOOD (  25.95  )
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

SGksIEFsbAoKT24gVHVlLCBBcHIgMjksIDIwMjUgYXQgNDo1MeKAr1BNIEd1b2RvbmcgWHUgPGd1
b2RvbmdAcmlzY3N0YXIuY29tPiB3cm90ZToKPgo+IFRoaXMgcGF0Y2hzZXQgYWRkcyBzdXBwb3J0
IGZvciB0aGUgU3BhY2VtaVQgSzEgU29DIGluIHRoZSBQV01fUFhBIGRyaXZlcgo+IGFuZCB1cGRh
dGVzIHJlbGF0ZWQgZGV2aWNlIHRyZWUgYmluZGluZ3MuIFRoZSBjaGFuZ2VzIGVuYWJsZSBQV00K
PiBmdW5jdGlvbmFsaXR5IG9uIHRoZSBLMSBwbGF0Zm9ybSB0aHJvdWdoIGRyaXZlciBlbmhhbmNl
bWVudHMsCj4gY29uZmlndXJhdGlvbiB1cGRhdGVzLCBhbmQgZGV2aWNlIHRyZWUgYWRkaXRpb25z
Lgo+CgpHZW50bGUgcGluZywgYW55IGNvbW1lbnRzIG9yIGNvbmNlcm5zIG9uIHRoaXMgcGF0Y2hz
ZXQ/CkFueSBmZWVkYmFjayB3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lhdGVkLgoKVGhhbmtzIGlu
IGFkdmFuY2UhCkJlc3QgcmVnYXJkcywKR3VvZG9uZwoKPiBGdW5jdGlvbmFsaXR5IGhhcyBiZWVu
IHZlcmlmaWVkIG9uIHRoZSBCYW5hbmEgUGkgQlBJLUYzIGJvYXJkIHVzaW5nIFBXTTE0LAo+IGNv
bmZpZ3VyZWQgYXMgYSBwd20tYmFja2xpZ2h0LiBQZXIgY29tbXVuaXR5IGZlZWRiYWNrLCB0aGUg
YWN0dWFsCj4gcHdtLWJhY2tsaWdodCBub2RlIGlzIG5vdCBpbmNsdWRlZCBpbiB0aGlzIHBhdGNo
c2V0IGJ1dCBjYW4gYmUgZm91bmQgaW4KPiBwYXRjaCA3IG9mIHRoZSB2MSBzZXJpZXMsIHdpdGgg
bW9kaWZpY2F0aW9uIG9mIHB3bXMgcHJvcGVydHkgdG8gNC1jZWxsCj4gZm9ybWF0IHRvIG1hdGNo
IHVwZGF0ZWQgYmluZGluZyAoI3B3bS1jZWxscyA9IDwzPikgc2luY2UgdjMuCj4KPiArICAgICAg
ICAgICAgICAgcHdtcyA9IDwmcHdtMTQgMCAyMDAwIDA+Owo+Cj4gVGhpcyBwYXRjaHNldCBpcyBi
YXNlZCBvbiBbc3BhY2VtaXQvZm9yLW5leHRdCj4gICBiYXNlOiBodHRwczovL2dpdGh1Yi5jb20v
c3BhY2VtaXQtY29tL2xpbnV4IGZvci1uZXh0Cj4KPiBQbHVzIHRoZSBmb2xsb3dpbmcgZGVwZW5k
ZW5jaWVzOgo+IDEuIENsb2NrIGNvbnRyb2xsZXIgZHJpdmVyLCBwb3N0ZWQgYnkgSGV5bGVuIENo
dSAodjgpLCB3aXRoIG1vc3Qgb2YgaXQgaGFzCj4gICAgYmVlbiBhY2NlcHRlZDoKPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA0MTYxMzU0MDYuMTYyODQtMS1oZXlsZW5heUA0ZDIu
b3JnLwo+IDIuIFJlc2V0IGNvbnRyb2xsZXIgZHJpdmVyLCBwb3N0ZWQgYnkgQWxleCBFbGRlciAo
djUpOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDQxODE0NTQwMS4yNjAzNjQ4
LTEtZWxkZXJAcmlzY3N0YXIuY29tLwo+Cj4gTWFqb3IgZGlmZmVyZW5jZXMgYmV0d2VlbiB2MyBh
bmQgdjI6Cj4gIC0gUGF0Y2ggMToKPiAgICAgLSBBZGRlZDogUmV2aWV3ZWQtYnk6IFJvYiBIZXJy
aW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+ICMgdjIuCj4gICAgIC0gV2hlbiBjb21wYXRpYmxl
IHN0cmluZyBjb250YWlucyAic3BhY2VtaXQsazEtcHdtIiwKPiAgICAgICAjcHdtLWNlbGxzIG11
c3QgYmUgMy4KPiAgLSBQYXRjaCAyOgo+ICAgICAtIERyb3BwZWQgdGhlIGFkZGl0aW9uIG9mIGEg
cmVzZXRfY29udHJvbCBmaWVsZCB0byBzdHJ1Y3QgcHhhX3B3bV9jaGlwLgo+ICAgICAtIFVzaW5n
IGEgbG9jYWwgdmFyaWFibGUgaW4gcHdtX3Byb2JlKCkgaW5zdGVhZC4KPiAgLSBQYXRjaCAzOgo+
ICAgICAtIEluIGsxLmR0c2ksIGNoYW5nZWQgI3B3bS1jZWxscyA9IDwxPiB0byA8Mz4uCj4KPiBN
YWpvciBkaWZmZXJlbmNlcyBiZXR3ZWVuIHYyIGFuZCB2MToKPiAgLSBEcm9wcGVkIHRoZSBhZGRp
dGlvbiBvZiBzcGFjZW1pdCxrMS1wd20gYXMgYSBjb21wYXRpYmxlIHN0cmluZyBpbiB0aGUKPiAg
ICBQV01fUFhBIGRyaXZlcjsgaW5zdGVhZCwgaXQgbm93IGZhbGxzIGJhY2sgdG8gbWFydmVsbCxw
eGE5MTAtcHdtLgo+ICAtIFJlbW92ZWQgcGluY3RybCBzZXR0aW5ncyBmb3IgYWxsIFBXTSBub2Rl
cyAocHdtMC1wd20xNCk7IG9ubHkgdGhlCj4gICAgcHdtMTRfMSBjb25maWd1cmF0aW9uIGlzIGlu
Y2x1ZGVkIGluIHRoaXMgdmVyc2lvbi4KPiAgLSBDaGFuZ2VkIFBXTV9QWEEgZnJvbSBidWlsdC1p
biB0byBhIGxvYWRhYmxlIG1vZHVsZSAoPW0pIGluIHRoZQo+ICAgIHJpc2N2IGRlZmNvbmZpZy4K
Pgo+IHYyIGNvbnNpc3RzIG9mIHRoZSBmb2xsb3dpbmcgcGF0Y2hlczoKPiBQYXRjaCAxOiBBZGQg
c3BhY2VtaXQsazEtcHdtIGNvbXBhdGlibGUgc3RyaW5nICh3aXRoIGZhbGxiYWNrIHRvCj4gICAg
ICAgICAgICBtYXJ2ZWxsLHB4YTkxMC1wd20pIGFuZCBzdXBwb3J0IG9wdGlvbmFsIHJlc2V0cyBw
cm9wZXJ0eS4KPiBQYXRjaCAyOiBBZGQgcmVzZXQgY29udHJvbGxlciBzdXBwb3J0IHRvIHRoZSBQ
V01fUFhBIGRyaXZlci4KPiBQYXRjaCAzOiBBZGQgZGV2aWNlIHRyZWUgbm9kZXMgZm9yIGFsbCAy
MCBQV00gaW5zdGFuY2VzIG9uIEsxLgo+IFBhdGNoIDQ6IEFkZCBwaW5jdHJsIHNldHRpbmdzIGZv
ciBQV00xNC4KPiBQYXRjaCA1OiBBZGQgQVJDSF9TUEFDRU1JVCBkZXBlbmRlbmN5IHRvIHRoZSBQ
V01fUFhBIEtjb25maWcgZW50cnkuCj4gUGF0Y2ggNjogRW5hYmxlIFBXTSBhbmQgUFdNX1BYQSBp
biByaXNjdiBkZWZjb25maWcgZm9yIFNwYWNlbWlUIEsxLgo+Cj4gdjI6Cj4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjUwNDIwMDcwMjUxLjM3ODk1MC0xLWd1b2RvbmdAcmlzY3N0YXIu
Y29tLwo+Cj4gdjE6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwNDExMTMxNDIz
LjM4MDI2MTEtMS1ndW9kb25nQHJpc2NzdGFyLmNvbS8KPgo+IEJlc3QgcmVnYXJkcywKPiBHdW9k
b25nIFh1Cj4KPiBHdW9kb25nIFh1ICg2KToKPiAgIGR0LWJpbmRpbmdzOiBwd206IG1hcnZlbGws
cHhhLXB3bTogQWRkIFNwYWNlbWlUIEsxIFBXTSBzdXBwb3J0Cj4gICBwd206IHB4YTogYWRkIG9w
dGlvbmFsIHJlc2V0IGNvbnRyb2wKPiAgIHJpc2N2OiBkdHM6IHNwYWNlbWl0OiBhZGQgUFdNIHN1
cHBvcnQgZm9yIEsxIFNvQwo+ICAgcmlzY3Y6IGR0czogc3BhY2VtaXQ6IGFkZCBwd20xNF8xIHBp
bmN0cmwgc2V0dGluZwo+ICAgcHdtOiBLY29uZmlnOiBhZGQgZGVwZW5kcyBvbiBBUkNIX1NQQUNF
TUlUIHRvIFBXTV9QWEEKPiAgIHJpc2N2OiBkZWZjb25maWc6IEVuYWJsZSBQV00gc3VwcG9ydCBm
b3IgU3BhY2VtaVQgSzEgU29DCj4KPiAgLi4uL2JpbmRpbmdzL3B3bS9tYXJ2ZWxsLHB4YS1wd20u
eWFtbCAgICAgICAgIHwgIDM1ICsrKy0KPiAgYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9r
MS1waW5jdHJsLmR0c2kgIHwgICA3ICsKPiAgYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9r
MS5kdHNpICAgICAgICAgIHwgMTgwICsrKysrKysrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2Nv
bmZpZ3MvZGVmY29uZmlnICAgICAgICAgICAgICAgICAgfCAgIDIgKwo+ICBkcml2ZXJzL3B3bS9L
Y29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgZHJpdmVycy9wd20v
cHdtLXB4YS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICsKPiAgNiBmaWxlcyBjaGFu
Z2VkLCAyMjUgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPgo+Cj4gYmFzZS1jb21taXQ6
IGNiOWMzYWVhZTUwOWIzNmFmYmRmNDY5NDJhN2EwYTBkZmM4NTZjZTcKPiBwcmVyZXF1aXNpdGUt
cGF0Y2gtaWQ6IGE1ZDJmYjQzZmQ4ODUyNWZhNmM4ZWU3NjdjMzFhZGZlZTg3ZjEwMTIKPiBwcmVy
ZXF1aXNpdGUtcGF0Y2gtaWQ6IDhhOGQwZWVmZDBiNDQyM2Q4N2YzYzA5M2I0NTFhMGZhNjA2MjJl
YzQKPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDMwZjkyZjkzZTViMzU3N2JkZTYxNDI0MzAzZjIx
YzcwOWE3MTVlYzUKPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IGQ3NzRiODI4MWI1YzZhODIyNDQ1
MzY1ZWU5NDkyNWUxYWI2YzdhOTMKPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDU0YTRmNWQwNjVl
YjlmMjEyZmQ5OWVmZWM2ZTdlMDZhYmJiOWJhZDgKPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDkz
OTYyYmU2MGQxYjU4YTk4ZDk0N2VkZjUxYjRhZjllZGY1MTM3ODUKPiBwcmVyZXF1aXNpdGUtcGF0
Y2gtaWQ6IDVmNTNmOGJmMTZmYjA2NzYyODA5MmRhZWJjNDgzMTI5MzI2MWFhMDEKPiAtLQo+IDIu
NDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
