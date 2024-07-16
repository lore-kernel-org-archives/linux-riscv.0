Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8357C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 20:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/dPSg2L4wp6jsK5uqCpsz36u9Xwx9tFoaD0WFcCBg0=; b=nJ78ht7wUkze8A
	Uo9fQKhOHBuquVXotVyKqo8Kquqe48vf0uk8bPdTmvQvo9ZDVYFu+x09wcvc8UPfxc6y0kDAEyKD/
	51aajHuUTx18qWWmB/ICu/+apW+0t+wEAnYtNDIy2f6Kq0F1lrK/pZ9DSgirjwCiQYqhHkI2A+HZU
	Bp9J9mQn6FKfGTlEUnwNlOeG/tknSu8uvAChMCHsGFR6uSatICCroKe/aeqpmfSa6u4DG/Uw0QIw5
	4hRYufUMPBZHOvSRIvWRyVuzmMJTlhyMesJXJ6N58CyWmy+8q1gHqaOg8m6wSZJZUetKd6IWteYnH
	WB4CneG0rmHywR32A0xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTpBt-0000000Bk94-01AV;
	Tue, 16 Jul 2024 20:54:29 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTpBC-0000000Bjqv-1TfR
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jul 2024 20:53:48 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42679f33fefso41521215e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 13:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1721163224; x=1721768024; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzGg2bw0e+lZrua5cWNc/9j1rpXhYpnXFaTD0O3E2vU=;
        b=YPFZr6wbK3hNl5pCd/H/YeZ/ptd5mP0DjsxZrqgHCym9EqqXhseUSKchnj5uq4cWsw
         niiRDjRqRkTzmOkPceO7lPk+qSxhFxdpPCT4nB4X9CzOmUacDhizse9wZqsGcGYfNbm0
         1fgmsXO7IXMdOGFumEX+rIEQ1bIhuG6drkmS2IDyUPl81CLuVr0zfcA8un57eA37SAMH
         8mN/zgeP6NpGiwlldkWT1fNo5f7vYuK0o+0NqCjhVwmeZuD7y7AqmODW0zaquGZuJqby
         jy91gs714cAuvnjPos8b+YIV9LpXquraPfChP9Y2Mr4rH6FsJkqqS4REsELNqF1WdKCN
         gICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721163224; x=1721768024;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzGg2bw0e+lZrua5cWNc/9j1rpXhYpnXFaTD0O3E2vU=;
        b=hdZwXN0ztCLPfzvcuUqhcb/iTALIuvIUVitCfwUDNfIQ0/rJHhWuRlYgWI7PsDVFF6
         Cdy36TOPxDmaHHKzf6I4Eqkq3Mfqcca9HFh/1qK1VebKhFBFCUo+FxgOW+V/iA02aBO5
         NXl1boZ29fTBlgQBvgvyD44aAwIUV816Oj8B38CavyN+zRrmCpwAD9GsKTOwWp4kCHyZ
         6+NP2sTGIP30NiCrbPFOJhLLpEhdquaL7z+GHowjOeTnoUXCkD3wwTwvShE4NzJA/fCy
         YUvKORM0LQgsSdJ+RNUy6PGC8vpxAlH8FtjxVcyruYmeoBrf4AQod49pMwNy8h+7ewVa
         h5pg==
X-Gm-Message-State: AOJu0YzGivTRe8NTnDzUpKvQCn5ZiJvDzayjIul6U2IyA+T2bj4QnOne
	YtrGj1aOVz3aySaiJYIEBsXxcOBv8/9q6t987O9zqJYAT95wCtoHg/GTVoBFUq0=
X-Google-Smtp-Source: AGHT+IGNTm4I/9yVWHXuvPniWSD+uHOZg/qIosGIxxw0E/zijYYSadlyBmWnBFG3qR43+iILahhYFQ==
X-Received: by 2002:a05:600c:524f:b0:426:5e0b:5823 with SMTP id 5b1f17b1804b1-427ba72543bmr22417255e9.34.1721163224127;
        Tue, 16 Jul 2024 13:53:44 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2d7489sm176591505e9.44.2024.07.16.13.53.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2024 13:53:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v2] riscv/purgatory: align riscv_kernel_entry
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20240716204047.7649-1-cyrevolt@gmail.com>
Date: Tue, 16 Jul 2024 21:53:33 +0100
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Daniel Maslowski <cyrevolt@gmail.com>
Message-Id: <3886CF4A-BB8A-4450-AEFB-C413572F92CE@jrtc27.com>
References: <20240716204047.7649-1-cyrevolt@gmail.com>
To: Daniel Maslowski <cyrevolt@googlemail.com>
X-Mailer: Apple Mail (2.3774.600.62)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_135346_467610_640E8EF3 
X-CRM114-Status: GOOD (  16.10  )
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

T24gMTYgSnVsIDIwMjQsIGF0IDIxOjQwLCBEYW5pZWwgTWFzbG93c2tpIDxjeXJldm9sdEBnb29n
bGVtYWlsLmNvbT4gd3JvdGU6Cj4gCj4gV2hlbiBhbGlnbm1lbnQgaGFuZGxpbmcgaXMgZGVsZWdh
dGVkIHRvIHRoZSBrZXJuZWwsIGV2ZXJ5dGhpbmcgbXVzdCBiZQo+IHdvcmQtYWxpZ25lZCBpbiBw
dXJnYXRvcnksIHNpbmNlIHRoZSB0cmFwIGhhbmRsZXIgaXMgdGhlbiBzZXQgdG8gdGhlCj4ga2V4
ZWMgb25lLiBXaXRob3V0IHRoZSBhbGlnbm1lbnQsIGhpdHRpbmcgdGhlIGV4Y2VwdGlvbiB3b3Vs
ZAo+IHVsdGltYXRlbHkgY3Jhc2guIE9uIG90aGVyIG9jY2FzaW9ucywgdGhlIGtlcm5lbCdzIGhh
bmRsZXIgd291bGQgdGFrZQo+IGNhcmUgb2YgZXhjZXB0aW9ucy4KPiBUaGlzIGhhcyBiZWVuIHRl
c3RlZCBvbiBhIEpINzExMCBTb0Mgd2l0aCBvcmVib290IGFuZCBpdHMgU0JJIGRlbGVnYXRpbmcK
PiB1bmFsaWduZWQgYWNjZXNzIGV4Y2VwdGlvbnMgYW5kIHRoZSBrZXJuZWwgY29uZmlndXJlZCB0
byBoYW5kbGUgdGhlbS4KPiAKPiBGaXhlczogNzM2ZTMwYWY1ODNmYjZlMGUyYjgyMTFiODk0ZmY5
OWRlYTBmMWVlNwo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBNYXNsb3dza2kgPGN5cmV2b2x0QGdt
YWlsLmNvbT4KPiAtLS0KPiBhcmNoL3Jpc2N2L3B1cmdhdG9yeS9lbnRyeS5TIHwgMiArKwo+IDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9wdXJnYXRvcnkvZW50cnkuUyBiL2FyY2gvcmlzY3YvcHVyZ2F0b3J5L2VudHJ5LlMKPiBpbmRl
eCA1YmNmM2FmOTAzZGEuLjBlNmNhNmQ1YWU0YiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L3B1
cmdhdG9yeS9lbnRyeS5TCj4gKysrIGIvYXJjaC9yaXNjdi9wdXJnYXRvcnkvZW50cnkuUwo+IEBA
IC03LDYgKzcsNyBAQAo+ICAqIEF1dGhvcjogTGkgWmhlbmd5dSAobGl6aGVuZ3l1M0BodWF3ZWku
Y29tKQo+ICAqCj4gICovCj4gKyNpbmNsdWRlIDxhc20vYXNtLmg+Cj4gI2luY2x1ZGUgPGxpbnV4
L2xpbmthZ2UuaD4KPiAKPiAudGV4dAo+IEBAIC0zNCw2ICszNSw3IEBAIFNZTV9DT0RFX0VORChw
dXJnYXRvcnlfc3RhcnQpCj4gCj4gLmRhdGEKPiAKPiArLmFsaWduIExHUkVHCj4gU1lNX0RBVEEo
cmlzY3Zfa2VybmVsX2VudHJ5LCAucXVhZCAwKQoKSXTigJlzIGEgYml0IHdlaXJkIHRvIHVzZSBM
R1JFRyBmb3IgYSAucXVhZC4gVGhlIGZpbGUgaXMgUlY2NC1vbmx5CmFscmVhZHksIGFueXdheS4K
Ckplc3MKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
