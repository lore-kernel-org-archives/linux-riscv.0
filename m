Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4DEC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Nov 2021 21:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JcoIpPy+d9Da8d0E51aME0W5dNMWk8oMpEdnx6/kkqo=; b=QXPnO+NJsuOcabMsjo/wWFSxMo
	kkN9T0Uvm2uiot1MvMuTnfi/NGX5W4m6Io7cOuuRw+dO72Ou1xW+IGYQtHltgkMUnr+7cm5+88HL5
	inD9qLmbTdXX2p0qC1KFaBsaglr3uKv1ThNRcPMs+ZHfruRPizcoGBx02yRixVvXgRdWiLBsS5hDW
	9VHizmHk7YmtrhqF0bY53hJEJTVbSwfzbSuszfHp1xk9CYkGED48+NkYnE7/LqoQQiC+lRn3DX6zZ
	mxlXUMFsooPsnaliPKHcoEwBJE/H7ApdPKlew7JLvou+ZMYBMZPgpkqhovRI3p3i9fiNgJSSNYKcC
	zYvZ1huw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrRM0-00GgkS-TZ; Sun, 28 Nov 2021 21:04:56 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrRLy-00Ggji-ID; Sun, 28 Nov 2021 21:04:55 +0000
Received: by mail-lj1-x236.google.com with SMTP id v15so30702915ljc.0;
 Sun, 28 Nov 2021 13:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n+c+fNjlqpkODMNA/7ywsu2Xpxn181Yex3QT1BC7YkM=;
 b=Tdth5Mz95ILIP2wZ5DYmwGwqL/g2a8NQfIdIuxgXXVVg6RH3yDMvHbIjMPlUPQ+Kfi
 e7TNCwLl7gW+gWhWCzY5kWF31Q6d3MXbcfyHlK5mTJBCO9B0yoazspZoQ9QauZAg4VOZ
 GU1Du/NMRetIl1HCPpoZ/wmPwFcTZx09G+/z/T3SmJwaMw6FiTLYrkBEti6ebPBTNx4P
 ztESfCaJHpZ8ANbOeJv7E8GcPhKYp2JvSlX4AwC23x/kyRaPVi2WsI1lt1XYwZg48qKe
 Ljtqv2XVdBLjgOpaFjZQzH+Idsti2zOEBowM2JGqBDzv5KQCJSPSnTBTLx3XoGX8clP3
 1rSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n+c+fNjlqpkODMNA/7ywsu2Xpxn181Yex3QT1BC7YkM=;
 b=z6oU/tDV4VdGxoPY3B+zPxvdVC15SPGm+sp1RM8VFMf+bu7Gbs2otNk49Tk0A9cxU4
 JdC0FLjfmUMs598eq06OH0cTHWsO8IJ806VfmJe27SCEh8QMU4ZXSH3dN9zF6UtbYvdI
 yZaWW8RdXtebyeHSmz+/fmcHXMjwA0dNFUii10Y8Mcn45kH3J+7w25yiC4OQvlzDMkNm
 jybo5nOTV/4APCtj6QhYHuItwhi04+RHhjEp5Rsh0Wo1xxag0E9uuZ3Nn3vptWInBunX
 GlgxJognxFxrir8Bat7R5l1MBztzbnqMmvDYOnBqvIkZ5k8qM4/BCfJGYLeGA6beJKo/
 A4tQ==
X-Gm-Message-State: AOAM533z+92iYbiYb+tWEl4tPrFcDNEW9rAiEewn0yq1C0+rkRtdW29s
 jvabJapr6+SKzUY4+kLptWo=
X-Google-Smtp-Source: ABdhPJyuVlGCEG84pwfg6BbsVNdI4G/2tvLYelnsvUn7CQTQlf25Ym3pMWyWhlfLoQNWZ9AePptWxg==
X-Received: by 2002:a2e:97cb:: with SMTP id m11mr45829799ljj.324.1638133492517; 
 Sun, 28 Nov 2021 13:04:52 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id d30sm1105908lfv.58.2021.11.28.13.04.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Nov 2021 13:04:52 -0800 (PST)
Subject: Re: [PATCH v4 22/25] memory: emif: Use kernel_can_power_off()
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer
 <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sebastian Reichel <sre@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-23-digetx@gmail.com> <YaLaH3Yt2M/Gko//@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <98c5c3d3-1635-3a06-b57f-8facd409796a@gmail.com>
Date: Mon, 29 Nov 2021 00:04:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaLaH3Yt2M/Gko//@qmqm.qmqm.pl>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_130454_651157_768C407D 
X-CRM114-Status: GOOD (  20.78  )
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

MjguMTEuMjAyMSAwNDoyMywgTWljaGHFgiBNaXJvc8WCYXcg0L/QuNGI0LXRgjoKPiBPbiBGcmks
IE5vdiAyNiwgMjAyMSBhdCAwOTowMDo1OFBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6
Cj4+IFJlcGxhY2UgbGVnYWN5IHBtX3Bvd2VyX29mZiB3aXRoIGtlcm5lbF9jYW5fcG93ZXJfb2Zm
KCkgaGVscGVyIHRoYXQKPj4gaXMgYXdhcmUgYWJvdXQgY2hhaW5lZCBwb3dlci1vZmYgaGFuZGxl
cnMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNv
bT4KPj4gLS0tCj4+ICBkcml2ZXJzL21lbW9yeS9lbWlmLmMgfCAyICstCj4+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVtb3J5L2VtaWYuYyBiL2RyaXZlcnMvbWVtb3J5L2VtaWYuYwo+PiBpbmRleCA3NjJk
MGMwZjA3MTYuLmNhYjEwZDUyNzRhMCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tZW1vcnkvZW1p
Zi5jCj4+ICsrKyBiL2RyaXZlcnMvbWVtb3J5L2VtaWYuYwo+PiBAQCAtNjMwLDcgKzYzMCw3IEBA
IHN0YXRpYyBpcnFyZXR1cm5fdCBlbWlmX3RocmVhZGVkX2lzcihpbnQgaXJxLCB2b2lkICpkZXZf
aWQpCj4+ICAJCWRldl9lbWVyZyhlbWlmLT5kZXYsICJTRFJBTSB0ZW1wZXJhdHVyZSBleGNlZWRz
IG9wZXJhdGluZyBsaW1pdC4uIE5lZWRzIHNodXQgZG93biEhIVxuIik7Cj4+ICAKPj4gIAkJLyog
SWYgd2UgaGF2ZSBQb3dlciBPRkYgYWJpbGl0eSwgdXNlIGl0LCBlbHNlIHRyeSByZXN0YXJ0aW5n
ICovCj4+IC0JCWlmIChwbV9wb3dlcl9vZmYpIHsKPj4gKwkJaWYgKGtlcm5lbF9jYW5fcG93ZXJf
b2ZmKCkpIHsKPj4gIAkJCWtlcm5lbF9wb3dlcl9vZmYoKTsKPj4gIAkJfSBlbHNlIHsKPj4gIAkJ
CVdBUk4oMSwgIkZJWE1FOiBOTyBwbV9wb3dlcl9vZmYhISEgdHJ5aW5nIHJlc3RhcnRcbiIpOwo+
IAo+IEJUVywgdGhpcyBwYXJ0IG9mIHRoZSBjb2RlIHNlZW1zIHRvIGJlIGJldHRlciBtb3ZlZCB0
byBnZW5lcmljIGNvZGUgdGhhdAo+IGNvdWxkIHJlcGxhY2UgUE9XRVJfT0ZGIHJlcXVlc3Qgd2l0
aCBSRUJPT1QgbGlrZSBpdCBpcyBkb25lIGZvciByZWJvb3QoKQo+IHN5c2NhbGwuCgpOb3Qgc3Vy
ZSB0aGF0IGl0IGNhbiBiZSBkb25lLiBTb21lYm9keSB3aWxsIGhhdmUgdG8gdmVyaWZ5IHRoYXQg
aXQgd29uJ3QKYnJlYWsgYWxsIHRob3NlIHBsYXRmb3JtIHBvd2VyLW9mZiBoYW5kbGVycy4gQmV0
dGVyIHRvIGtlZXAgdGhpcyBjb2RlCmFzLWlzIGluIHRoZSBjb250ZXh0IG9mIHRoaXMgcGF0Y2hz
ZXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
