Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18BCC02181
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 14:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JVB35b7NghmwtklCeixKiiVt9KSzbBV+yekpPVktU8M=; b=z64TQnqztSd1Gs
	MwbqjIHDmXbHnY44amFxQS/KrwNSqPWKLg59W3HReaWTlu2T7V8MO0OKJQeGbvUxLDIWckINk2SnL
	rfqeACgL0HueAJf0BRn0NSOCyz1SeZwn+7z0sMIcDcHUAdxDs7s+5BCZzvzae4dhmv32uugf+NM5O
	KF8Vl4N9HNJogQ6w8jyubl6Z25TdJYM3HLbeRMB1PpJG3X9VtO8f2r1ERTX5fcW8yxBiVCjXdXOAQ
	dP8t9xubx/geFX+A/0ueRpiM/vjh67wmU3FwShh25ixmGZvC9hJ9zPk5a5du2jzMHng2Ygo4usgUg
	CjcyW41n5lC8nHh2/DUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZsoy-00000005nX4-421S;
	Mon, 20 Jan 2025 14:32:08 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZsov-00000005nWR-1txi
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 14:32:07 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-385e3621518so2068429f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jan 2025 06:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737383523; x=1737988323; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SiZ9AEMIpIBal0pgB9YcdYzwMXAZ/sY3umvSjnZjx/4=;
        b=vlHMJ6Qwzycpvddy+B5LzdN/p88dFRvbg/8Ca2eWojQCxp/PWLTOFyoUtg03DZzTp5
         I7VTmD+wkaJih3d3lEs2ButZk/z5CtcHmqJLnh7bMNW1s611kY5BHGt08+SMkx1Ammdc
         vCJufWaYmVcVESSzAQVlSqIIITKIc7/nXhiIIruP8pl70qrN3/ZGYUdYC3LFM8Cmf9lN
         6ochQNwlBb2ReDIC/Aoq1epkvgTolTjXI64S9T8f4gMlxloDIZIITb1yQ2yDZ+RuApZM
         uGLsZUWEIvMkQXSr7HcZacL1Bqj7RQxaLHMyr+9bssIy2yjgLJ1/ZGQW3cibyvwvLZA2
         UYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737383523; x=1737988323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SiZ9AEMIpIBal0pgB9YcdYzwMXAZ/sY3umvSjnZjx/4=;
        b=XDH1Co95bGIly8XpWAkttE97jaX+2AyszHhiR4X9R8wTC/wd2YXcSco0wFy0wDl7Mc
         3lfchb+csUpE0Kf3xkOkOXKXMNlFq+UJ0kJ32B8ZBda+XsOnKtmTaV7uF2EdAwzqB+NA
         eWsavyNxnOq+bB/Vr0pt6jjIA9JWpbIzWxHhd184OqvrbwoYZrOqWOqhojJsSRm7KsBq
         BQI8DVZeJRO7DyjBAkso0o/hK9eGbji1/VJB+jPO2uIq5vdDl478Nv6uj2rq+OZ/m6RS
         +aD8W17ZypolifayCCE99OuOvb7aNEluBtBooX/nENLQKNyMrL8SUtJVaC7FptobBTKp
         K79Q==
X-Forwarded-Encrypted: i=1; AJvYcCUS8ipLZdlZ1q1rlFHleCx5aC3nCn6JJVCdhkdJASk9bJoeCCJgO7E2C41PvqfPzCJeHRbQFEl0s83Amg==@lists.infradead.org
X-Gm-Message-State: AOJu0YykA7YCLOygzKbXQ1NM0DThKBzi5PvOiYAoRKzxjVN8ZfCdNOR7
	+afutbkoGHHf7IKZgHIu/Nzl4AnJS8ln0xTo362OOArjX/oHoUbwGK9Jbapbo+rpoxnLq2Q0mi3
	jnztTaMW3mTfXwqrQ+olopZVZuGTPNE+6/vXsesWqyfNMivWw
X-Gm-Gg: ASbGnctD6fxg15D8IeoCF7szNui9KU1pVhslr5gvA9yh2yRz/RbyUCpyzsEboO1sSZU
	bFg0JYlwV+2l178EMYmw73Oqzkda38h8sCBJgBGxqBxWL0vetXw==
X-Google-Smtp-Source: AGHT+IGKxzJfAaMej3lPo0df14bMbqPv00NKhWrfw8R61+wj18jHSezj1g2Ch9RDv3IkDJmq5dHO9gQpVTF15GTc4ms=
X-Received: by 2002:a5d:6da4:0:b0:38c:1362:41b5 with SMTP id
 ffacd0b85a97d-38c136244cdmr287147f8f.6.1737383523208; Mon, 20 Jan 2025
 06:32:03 -0800 (PST)
MIME-Version: 1.0
References: <20250116230955.867152-1-rkanwal@rivosinc.com> <20250116230955.867152-5-rkanwal@rivosinc.com>
 <a6b584bd-d136-4429-90af-6c5cfaf47350@kernel.org>
In-Reply-To: <a6b584bd-d136-4429-90af-6c5cfaf47350@kernel.org>
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Mon, 20 Jan 2025 14:31:52 +0000
X-Gm-Features: AbW1kvZInqdQyKkStOI76x1AjV5KU_we8C9l1vTVnN92-zuJ2K0hpojm3xHiJZI
Message-ID: <CAECbVCu0qmCp5fVhkWE48R8xsC7cY4EjS6Rv0tqe8GP8DeZAZw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] dt-bindings: riscv: add Sxctr ISA extension description
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, adrian.hunter@intel.com, 
	alexander.shishkin@linux.intel.com, ajones@ventanamicro.com, 
	anup@brainfault.org, acme@kernel.org, atishp@rivosinc.com, 
	beeman@rivosinc.com, brauner@kernel.org, conor@kernel.org, heiko@sntech.de, 
	irogers@google.com, mingo@redhat.com, james.clark@arm.com, 
	renyu.zj@linux.alibaba.com, jolsa@kernel.org, jisheng.teoh@starfivetech.com, 
	palmer@dabbelt.com, will@kernel.org, kaiwenxue1@gmail.com, 
	vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_063205_752494_D25CA1D0 
X-CRM114-Status: GOOD (  18.08  )
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

SGkgS3J6eXN6dG9mLAoKU29ycnkgbXkgYmFkLiBJIHdpbGwga2VlcCB0aGlzIGluIG1pbmQgbmV4
dCB0aW1lLgpUaGFua3MgZm9yIHBvaW50aW5nIGl0IG91dC4KCi0gUmFqbmVzaAoKT24gRnJpLCBK
YW4gMTcsIDIwMjUgYXQgNzoyNuKAr0FNIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiAxNy8wMS8yMDI1IDAwOjA5LCBSYWpuZXNoIEthbndhbCB3cm90
ZToKPiA+IEFkZCB0aGUgU1ttfHNdY3RyIElTQSBleHRlbnNpb24gZGVzY3JpcHRpb24uCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogUmFqbmVzaCBLYW53YWwgPHJrYW53YWxAcml2b3NpbmMuY29tPgo+
ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1s
ICAgICAgfCAxNCArKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRp
b25zKCspCj4KPiA8Zm9ybSBsZXR0ZXI+Cj4gUGxlYXNlIHVzZSBzY3JpcHRzL2dldF9tYWludGFp
bmVycy5wbCB0byBnZXQgYSBsaXN0IG9mIG5lY2Vzc2FyeSBwZW9wbGUKPiBhbmQgbGlzdHMgdG8g
Q0MuIEl0IG1pZ2h0IGhhcHBlbiwgdGhhdCBjb21tYW5kIHdoZW4gcnVuIG9uIGFuIG9sZGVyCj4g
a2VybmVsLCBnaXZlcyB5b3Ugb3V0ZGF0ZWQgZW50cmllcy4gVGhlcmVmb3JlIHBsZWFzZSBiZSBz
dXJlIHlvdSBiYXNlCj4geW91ciBwYXRjaGVzIG9uIHJlY2VudCBMaW51eCBrZXJuZWwuCj4KPiBU
b29scyBsaWtlIGI0IG9yIHNjcmlwdHMvZ2V0X21haW50YWluZXIucGwgcHJvdmlkZSB5b3UgcHJv
cGVyIGxpc3Qgb2YKPiBwZW9wbGUsIHNvIGZpeCB5b3VyIHdvcmtmbG93LiBUb29scyBtaWdodCBh
bHNvIGZhaWwgaWYgeW91IHdvcmsgb24gc29tZQo+IGFuY2llbnQgdHJlZSAoZG9uJ3QsIGluc3Rl
YWQgdXNlIG1haW5saW5lKSBvciB3b3JrIG9uIGZvcmsgb2Yga2VybmVsCj4gKGRvbid0LCBpbnN0
ZWFkIHVzZSBtYWlubGluZSkuIEp1c3QgdXNlIGI0IGFuZCBldmVyeXRoaW5nIHNob3VsZCBiZQo+
IGZpbmUsIGFsdGhvdWdoIHJlbWVtYmVyIGFib3V0IGBiNCBwcmVwIC0tYXV0by10by1jY2AgaWYg
eW91IGFkZGVkIG5ldwo+IHBhdGNoZXMgdG8gdGhlIHBhdGNoc2V0Lgo+Cj4gWW91IG1pc3NlZCBh
dCBsZWFzdCBkZXZpY2V0cmVlIGxpc3QgKG1heWJlIG1vcmUpLCBzbyB0aGlzIHdvbid0IGJlCj4g
dGVzdGVkIGJ5IGF1dG9tYXRlZCB0b29saW5nLiBQZXJmb3JtaW5nIHJldmlldyBvbiB1bnRlc3Rl
ZCBjb2RlIG1pZ2h0IGJlCj4gYSB3YXN0ZSBvZiB0aW1lLgo+Cj4gUGxlYXNlIGtpbmRseSByZXNl
bmQgYW5kIGluY2x1ZGUgYWxsIG5lY2Vzc2FyeSBUby9DYyBlbnRyaWVzLgo+IDwvZm9ybSBsZXR0
ZXI+Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
