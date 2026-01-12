Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3290D2503F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 07:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xLNbyskqBPu0+AAYIMEkfChdOTl4azs4Gkg0W48T3Qg=; b=ko8S5bf4U/OA4x
	Y2nwSshRdE8GKhke5FuixMPmRCdjVr/55GasDp1IMYc2kikej28WR1LjtnfiU7DMh6Xd6Pfm9l1NO
	iKpL6ivhkUHoUYJ0e9hqsjo9WNSYUwx/+1nC4xkbhqMwCQCseQ9kR5QxTC4+R8iJC9B6+IhYNiQAX
	VIGTqLrYhU7MBmKB/Ne5vB+51KJpzI3wer3qpN8fo1AeI+NKq3rd8QFiFgJUOcq8dc7Ptm51azPUk
	qa9n/pDajUL6YBL29g/w9DpvjEPmUyVdXU5VOrGHPxNtUwdyPEaY6+wqcVsm0elfOUQKITiOm/P0d
	u2ONzfSXM0KwDAI/SR9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCpb-00000004wjx-40wn;
	Mon, 12 Jan 2026 07:59:19 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCpX-00000004wiR-1qMy
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 07:59:18 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-78fc3572431so68025927b3.0
        for <linux-riscv@lists.infradead.org>; Sun, 11 Jan 2026 23:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768204754; x=1768809554; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSAM4RH7cy/5YTgp+Z6CFhylkii8NBgRSJLcb1PkkO8=;
        b=lCFWu9faWAUjuc8xWYmlLmBi6jAGo3Z1fvGBYO2kESZoVhMAEEsBu/qwt2Y8SXx4Sk
         Tjdjlcc41V7j/avdK7kmRePphaj+hh0zOF9DnCF1ALgWWn5pK7LDJ5cO3zoIrVPMazZC
         6wrXdx9tmSz+Hlg3RQNDchi9YYKZp1mTPRaDhLoWdu9ykI2MOvYkXrSv1bUAkmx/UbT9
         LXIlAXzEduv+OJSjWMgZZhJyyvg5iAsUQ5eIeU9z5HsuHhg8P2A1qcPDFmaGRXfxJ8tn
         cYW1V8OJ+FOWgrNXX/WVRmRNkRyb3NRimI9dMrIega4UyfB+FFWQL0hPSggPFfgnXgI7
         IYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768204754; x=1768809554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZSAM4RH7cy/5YTgp+Z6CFhylkii8NBgRSJLcb1PkkO8=;
        b=tFtRAp9nWRqg1MEL+rnKNUh2OH1LyQMDsjOBO3hOzHJcyxGylm8ZQaeeymdZCwkIu/
         tHF28N52G0ch3qrw/QExFwFV8lnifs72IjZoBlKmx/F9IlRxfBgJvvZv4ksPIuyVeH8g
         90ZC9ufmc4Ap1Ryz1dH+qSm4GecFx9HHOrn19riWLVdPy6Njx/fiej8t30H+iI7a+sZ0
         zuSVcXADFNJw6Avg2pQZ+W9SAgQuN2PsSRforIczED6hIgYjkF/lp9zYPaL7UsO9SV7r
         NOVwBPhZ0JSA+259OXZvgLrV6FMc5KutStH+pAn3rTVMgBrc9/rj6u6QUASVjLtTH+tb
         Ho3g==
X-Forwarded-Encrypted: i=1; AJvYcCXYtdDHLkwaY6ltMlH1mf4BpiIhqLNeiuZw76vaoCJvNC9zeGDdz2PyZGpXOvNJv5t1HJ322/rDqTykrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTl2cu9wv6fF0yOMqOJRDljCktDrU75uBEOL8gVwDdXjRUKcLK
	/fXNQGkRKq8r2AmYCcTZPU851Cl2jgruw3qdlMjxYXAED/WVBtTQUFv6wemKayM4J8n1YtovWf5
	w1kAX+e2k878IDZNtlyJEStXQ4ArytaXrdKfGlays3Q==
X-Gm-Gg: AY/fxX5J/0NAluZ8dSgAaaLbJa9s6cRITgQ1svsrcejKffTFwTxx6MX5+sE7gpcYelu
	rNZC1xeVbbWjFSrkwJL8jgIjYt9EHxQiUNaeiXu2fm7pmsFz2OWG5zl2x2g8uCtMK6uspqRCNg8
	JaYedkflbKH/e0OPuSrEtf/LUEDa+gCJW+hhiGMPLmOXAu7DUj7R24m0qA8Z+Tf4IV25XRDz/7t
	rFYTdA4+ZysNWsgDG33GlijFV7JbXHbcsTQj5BSSeo+7Uz2JxlSzlFamCwW5NEgEpIUlt79wS+4
	vwPHdriORd9vHAmwoL8mTvCanmQu+yHWFl64I5erxMIN
X-Google-Smtp-Source: AGHT+IHzovDi2wYX7QS5E17vTw6EfrmwMxXUMWfzaTca+VnZ75agggH0jw0Z9Nk1rpoyt6jY2b2DsuWSrr3IaSzijEA=
X-Received: by 2002:a05:690e:13cb:b0:644:ca2b:b64f with SMTP id
 956f58d0204a3-64716c0f720mr14418176d50.41.1768204753933; Sun, 11 Jan 2026
 23:59:13 -0800 (PST)
MIME-Version: 1.0
References: <20260110-k3-basic-dt-v4-10-d492f3a30ffa@riscstar.com> <AM7P189MB10095424D5EECEF98761C227E381A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <AM7P189MB10095424D5EECEF98761C227E381A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 12 Jan 2026 15:59:02 +0800
X-Gm-Features: AZwV_QjBH78ep5ci-BN1t8eHhgINXSJDHXMbo8PMNGMoYTwSPL4cPXhT6kWXYBE
Message-ID: <CAH1PCMatYTfE58-O7ftt4dmr3tvssnD4UrSGEJSbHkFYgT_afQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/11] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: ajones@ventanamicro.com, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, conor+dt@kernel.org, conor@kernel.org, 
	cyy@cyyself.name, daniel.lezcano@linaro.org, devicetree@vger.kernel.org, 
	dlan@gentoo.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, lkundrak@v3.sk, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, pjw@kernel.org, robh@kernel.org, 
	samuel.holland@sifive.com, spacemit@lists.linux.dev, tglx@linutronix.de, 
	xypron.glpk@gmx.de, zhangmeng.kevin@linux.spacemit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_235915_729036_A2AD282E 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

T24gTW9uLCBKYW4gMTIsIDIwMjYgYXQgMzo0M+KAr1BNIE1hdWQgU3BpZXJpbmdzCjxtYXVkX3Nw
aWVyaW5nc0Bob3RtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+ICsgICAgICAgICAgICAgbWltc2ljOiBp
bnRlcnJ1cHQtY29udHJvbGxlckBmMTAwMDAwMCB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJzcGFjZW1pdCxrMy1pbXNpY3MiLCAicmlzY3YsaW1zaWNzIjsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4ZjEwMDAwMDAgMHgwIDB4MTAwMDA+Owo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICNpbnRlcnJ1cHQtY2VsbHMgPSA8MD47Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgI21zaS1jZWxscyA9IDwwPjsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBpbnRlcnJ1cHQtY29udHJvbGxlcjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBpbnRl
cnJ1cHRzLWV4dGVuZGVkID0gPCZjcHUwX2ludGMgMTE+LCA8JmNwdTFfaW50YyAxMT4sCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3B1Ml9pbnRjIDEx
PiwgPCZjcHUzX2ludGMgMTE+LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA8JmNwdTRfaW50YyAxMT4sIDwmY3B1NV9pbnRjIDExPiwKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcHU2X2ludGMgMTE+LCA8JmNw
dTdfaW50YyAxMT47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgbXNpLWNvbnRyb2xsZXI7Cj4g
PiArICAgICAgICAgICAgICAgICAgICAgcmlzY3YsZ3Vlc3QtaW5kZXgtYml0cyA9IDw2PjsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICByaXNjdixoYXJ0LWluZGV4LWJpdHMgPSA8ND47Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgcmlzY3YsbnVtLWd1ZXN0LWlkcyA9IDw1MTE+Owo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIHJpc2N2LG51bS1pZHMgPSA8NTExPjsKPiA+ICsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ID4gKyAgICAgICAgICAgICB9
Owo+ID4gKwo+ID4gKyAgICAgICAgICAgICBtYXBsaWM6IGludGVycnVwdC1jb250cm9sbGVyQGYx
ODAwMDAwIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNwYWNlbWl0
LGszLWFwbGljIiwgInJpc2N2LGFwbGljIjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICByZWcg
PSA8MHgwIDB4ZjE4MDAwMDAgMHgwIDB4NDAwMD47Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
I2ludGVycnVwdC1jZWxscyA9IDwyPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1
cHQtY29udHJvbGxlcjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBtc2ktcGFyZW50ID0gPCZt
aW1zaWM+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJpc2N2LGNoaWxkcmVuID0gPCZzYXBs
aWM+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJpc2N2LGRlbGVnYXRlID0gPCZzYXBsaWMg
MSA1MTI+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJpc2N2LG51bS1zb3VyY2VzID0gPDUx
Mj47Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsK
PiA+ICsgICAgICAgICAgICAgfTsKPgo+Cj4gZnJvbSByZWFkaW5nIHRoZSBjaGF0dGVyIG9uIHYz
IEkgdGhpbmsgdGhlIHJpZ2h0IHN0YXR1cyBoZXJlIG1heSBiZQo+ICJyZXNlcnZlZCIsIGZvciBl
bGVtZW50cyB0aGF0IGFyZSByZXNlcnZlZCBieSBmaXJtd2FyZS4gQnV0IEkgY291bGQgYmUKPiBt
aXN0YWtlbi4KClRoYW5rcyBNYXVkLiBHb29kIGNhdGNoLiBJIHRoaW5rIHlvdSBhcmUgcmlnaHQs
IGJvdGggTS1tb2RlIG1hcGxpYyBhbmQgbWltc2ljCnNob3VsZCBiZSBsaXN0ZWQgYXMgInJlc2Vy
dmVkIiB0byBzaWduaWZ5IHRoYXQgdGhleSBhcmUgaW50ZW5kZWQgdG8gYmUgdXNlZAppbiBPcGVu
U0JJLCBub3QgdGhlIFMtbW9kZSBrZXJuZWwuCgpJIHdpbGwgZml4IHRoYXQgaW4gdGhlIG5leHQg
dmVyc2lvbi4KCkJSLApHdW9kb25nIFh1Cgo+Cj4gS2luZCByZWdhcmRzLAo+IE1hdWQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
