Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC2DC83F1B
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 17:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NLn90SKMf7PxkYOAhRZyuNFFWBCzn/l55xvnmvUKkiE=; b=oaD7UkqEbCUk8/
	lEXowSyOxzSaV2KV48zw7W89x2Qlzw6sUIJelEVwmzYnZ5fFECIsuSJtgdMBMvdDHrsQVIWNTDmn+
	cv+qDBjC88gQoYDBXjVKd84Gr1YiTDC+ceLrBUvYhsRPiTntRLdk0DkTA+xPbQn6mdpJTtt8xh+Qm
	IIv1P7vOK+7r+CpdqEyL7X8HK30ehW8ih+taF+iRmIh0KEwEB+8udkSBUptDEg2EeN7AqcYXgHCRe
	rAlkt2MUQNUIDeRPQePg2+FdlJn4mKBp9TgmKA4IoFiCeTxylpO4s7yijmyYNz8Imt4J8mXZsZJ6N
	5d8oe4yxcS1fTtSPBf9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZv52-0000000CaIq-3sD1;
	Thu, 10 Jul 2025 17:29:08 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZsHb-0000000C7Y7-0bfm
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 14:29:56 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7490acf57b9so841072b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 07:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752157794; x=1752762594; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=70T/mtOHoW67bNGMf99k1u6kIp6BUIzmEHFhVe6xe+4=;
        b=OC9EYbfrZVvK3Xz637UVWHngWspwdLuP99AyPX6vqJ9FSBw70xmg93Yqe90lEfZUgF
         aPU9qFHzyVhiekub+cgk+F+FwiR7jd7b0xx3fKS737MdczBtZ81ylLoeZwLQyETClZCy
         MsnK+dtx8e3xGdgTU1PusF08P3yfaNsUb3LE4i8uk8iq0yDSXVXZyfVLDVE1Sjt6gcC4
         GANIDINELCGhE/cXnuwim8y1UnNAdgLo8SoMWuNQ1bkbJV+4WaXiUu/yiXa7HlkI/HIc
         OlD/XlWJau0u3OxdfmIk8JOkU6CpbVVy0oVt8O0vn5n8mE8Zy8VtAQvtpWWznrNP6wz5
         lwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752157794; x=1752762594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=70T/mtOHoW67bNGMf99k1u6kIp6BUIzmEHFhVe6xe+4=;
        b=rNs+dZHiScnQPwIK48MXYMlA1kOGPnAmUCdWEBaaW4w2IL5b9A8P5YgYR5bFtxeftd
         D0wD2QpfcZOH905Ueo8Adol9XCrUE3ZeAXpJQ4MzlZf4SPaqLbOBA0uiLIEAZJ19yYjn
         TB8yyv2H+P3eE+YXb3i9nbWPwIL2sOs4x7Me76NBw3eYO94jmllJbMnyUlRlhtMoMKOz
         /7hY4gibASAyviYBKY0V9jTRpTDJ5g835Pg1DWpelWV1Z8e5oO9/7mRcTMYlTUjVReXt
         qzHxlZr3IPXNmpm/RjdoMI0Vm0jxDf/F+uAX6nJfKVZ0hz1JeELgzziYWMkEtGpwSo5H
         ZnaA==
X-Forwarded-Encrypted: i=1; AJvYcCUugv2Jw9jZxhgEte+Rnp503Pw1mIEeuv0QAzpbeHStaxLsxnDa/U2Fqz4LQmD1siRcmUHj72ZftU1nRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDmuxAegDSF5Ou9xpY83qvoq4lqGUSGKjCjXyK8XKwwZg6/KBU
	IHAVKyzphYo+bX8P+gdUUkBMtb+BxIyLUoeehf5qEqncvWNEF0evEtmvTfMnLGDzMJo=
X-Gm-Gg: ASbGncu6L+YLwYFxCEndHGQOaPvftrwsmKNgf3af5c6t9KsendrGaVHe4J49fJsCXQD
	a5PwOQhAyFrfdZxyEqu8REbo42vQ+u9LGDJ9lIy2l0BezQ8bBaLOcj7iEQ58Y/FAl3bYL3PUJ9T
	By0nibvKbLbcEvT27WxxTpebN6s75boX8GYC/iqkQkgzQZX0Sar6+qJm3FPP7mC3q/7+p9vBUYq
	jEr17sSs9Nm+o5Ecl9Fw+sm+vVsZatMYRKJ4HoulqK3rtRymmX/+sMIXA7nX+h5f3abaoMB1TwM
	cyWgv4CFI4XJnHlV1Hp+sYr+oS0pKbHGpJnZjzNpD4kYkQh3azhzJb/944Ykg1Xv7/uvuYSrd5U
	58A5gFeQX73G8dEb7UXiVtGumMwrlsxIFSKizZMOgVg==
X-Google-Smtp-Source: AGHT+IE6cvc4FDu4lXrrdeGKWhRLkK/Uxe3lGtKWtoiWILObMjxluEPeqmm80yVTtrJwg3ohULnSwA==
X-Received: by 2002:a05:6a00:a27:b0:736:54c9:df2c with SMTP id d2e1a72fcca58-74eb558edfcmr4844441b3a.15.1752157794423;
        Thu, 10 Jul 2025 07:29:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6c5660sm2390825a12.48.2025.07.10.07.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 07:29:53 -0700 (PDT)
Message-ID: <c244c1d4-fef5-439e-8dfe-12c2f8910b18@rivosinc.com>
Date: Thu, 10 Jul 2025 16:29:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] selftests: riscv: add misaligned access testing
To: Andreas Schwab <schwab@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20250710133506.994476-1-cleger@rivosinc.com>
 <mvmecuognj7.fsf@suse.de> <5db9ec69-d0e4-4113-a989-ac75d0f1e5dd@rivosinc.com>
 <mvma55cgm63.fsf@suse.de>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <mvma55cgm63.fsf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_072955_182051_E1A34A17 
X-CRM114-Status: GOOD (  20.73  )
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

CgpPbiAxMC8wNy8yMDI1IDE2OjIzLCBBbmRyZWFzIFNjaHdhYiB3cm90ZToKPiBPbiBKdWwgMTAg
MjAyNSwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+IAo+PiBPbiAxMC8wNy8yMDI1IDE1OjUzLCBB
bmRyZWFzIFNjaHdhYiB3cm90ZToKPj4+IE9uIEp1bCAxMCAyMDI1LCBDbMOpbWVudCBMw6lnZXIg
d3JvdGU6Cj4+Pgo+Pj4+IFRoaXMgc2VsZnRlc3QgdGVzdHMgYWxsIHRoZSBjdXJyZW50bHkgZW11
bGF0ZWQgaW5zdHJ1Y3Rpb25zIChleGNlcHQgZm9yCj4+Pj4gdGhlIFJWMzIgY29tcHJlc3NlZCBv
bmVzIHdoaWNoIGFyZSBsZWZ0IGFzIGEgZnV0dXJlIGV4ZXJjaXNlIGZvciBhIFJWMzIKPj4+PiB1
c2VyKS4gRm9yIHRoZSBGUFUgaW5zdHJ1Y3Rpb25zLCBhbGwgdGhlIEZQVSByZWdpc3RlcnMgYXJl
IHRlc3RlZC4KPj4+Cj4+PiBJZiB0aGF0IGRpZG4ndCBjYXRjaCB0aGUgbWlzc2luZyBzaWduIGV4
dGVuc2lvbiB0aGF0IEkganVzdCBmaXhlZCBpbgo+Pj4gPGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXJpc2N2L212bWlrazBnb2lsLmZzZkBzdXNlLmRlPiwgeW91Cj4+PiBzaG91bGQgY29u
c2lkZXIgZXh0ZW5kaW5nIHRoZSB0ZXN0cy4KPj4+Cj4+Cj4+IEhpIEFuZHJlYXMsIHlvdSBsaW5r
IGRvZXNuJ3Qgd29yayBhbmQgSSBkaWRuJ3QgZmluZCBhbnl0aGluZyBhYm91dCBzaWduCj4+IGV4
dGVuc2lvbiBleGNlcHQgYSBwYXRjaCB5b3Ugd3JvdGUgZm9yIGFyY2hfY21weGcoKS4KPiAKPiBs
b3JlLmsubyBpcyBjdXJyZW50bHkgZG93biwgaGVyZSdzIHRoZSBwYXRjaCBJIGhhdmUgc2VudDoK
PiAKPiBGcm9tIDc3YzgyNTVkYTI0ZWU0ZmFjNTRlMjM3MTU5NGQ3MjEwZDFkZGVlMTkgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCj4gRnJvbTogQW5kcmVhcyBTY2h3YWIgPHNjaHdhYkBzdXNlLmRl
Pgo+IERhdGU6IFRodSwgMTAgSnVsIDIwMjUgMTM6NTI6MzUgKzAyMDAKPiBTdWJqZWN0OiBbUEFU
Q0hdIHJpc2N2OiB0cmFwc19taXNhbGlnbmVkOiBwcm9wZXJseSBzaWduIGV4dGVuZCB2YWx1ZSBp
bgo+ICBtaXNhbGlnbmVkIGxvYWQgaGFuZGxlcgo+IAo+IEFkZCBtaXNzaW5nIGNhc3QgdG8gc2ln
bmVkIGxvbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBTY2h3YWIgPHNjaHdhYkBzdXNl
LmRlPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCAyICst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPiBpbmRleCA5MzA0MzkyNGZlNmMuLmY3NjBl
NGZjYzA1MiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVk
LmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPiBAQCAtNDYx
LDcgKzQ2MSw3IEBAIHN0YXRpYyBpbnQgaGFuZGxlX3NjYWxhcl9taXNhbGlnbmVkX2xvYWQoc3Ry
dWN0IHB0X3JlZ3MgKnJlZ3MpCj4gIAl9Cj4gIAo+ICAJaWYgKCFmcCkKPiAtCQlTRVRfUkQoaW5z
biwgcmVncywgdmFsLmRhdGFfdWxvbmcgPDwgc2hpZnQgPj4gc2hpZnQpOwo+ICsJCVNFVF9SRChp
bnNuLCByZWdzLCAobG9uZykodmFsLmRhdGFfdWxvbmcgPDwgc2hpZnQpID4+IHNoaWZ0KTsKCkhp
IEFuZHJlYXMsCgpOaWNlIGNhdGNoLCBpdCBzZWVtcyBsaWtlIGl0IHdhcyBmaXhlZCBpbiBPcGVu
U0JJIGJ1dCBuZXZlciBiYWNrcG9ydGVkCmluIHRoZSBrZXJuZWwuIEFzIHlvdSBzdWdnZXN0ZWQs
IEknbGwgbW9kaWZ5IHRoZSB0ZXN0IHRvIHRlc3QgdGhlIHNpZ24KZXh0ZW5zaW9uLgoKVGhhbmtz
LAoKQ2zDqW1lbnQKCj4gIAllbHNlIGlmIChsZW4gPT0gOCkKPiAgCQlzZXRfZjY0X3JkKGluc24s
IHJlZ3MsIHZhbC5kYXRhX3U2NCk7Cj4gIAllbHNlCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
