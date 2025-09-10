Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771C7CA101F
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 21:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+tiFYn9H+35J61uyCMMBfLWG/0qn8VpfYOAz8UQssT4=; b=4L4zdVY3l6LZoJ
	F+d31/lduTqBFcQtJQmIoNumDH+T8f81KHikFh+j4RjeJTbJh2CsK2lTYH+dptGctvjMdFTxALN69
	sM683OsLzhK9Hr5J9joOOuVFlRH7qkPdy0923zTCSJBPHJ0/Ah24I8ykyibjYOz6bMcCR4I0Xry99
	MioK/CgdEkv2/r5v+piCRTqcgLMe064no3k525zl8K4ckSwBKfYm/TDX5zmdCCyRHkiqV7QTZmDeT
	UJd7qT9AayxnVl7Hheh0yV39DJVBIW+frj7xg/eK7mv5idXSPAgVKYXrmWtWbIqSN94ajAPHANwAi
	rm1x6j1dffq9o823B3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwSQk-0000000GsIT-3nil;
	Wed, 10 Sep 2025 21:32:42 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwSQh-0000000GsGu-2pfH
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 21:32:41 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so3438e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Sep 2025 14:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757539957; x=1758144757; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDgFFo1KURd80WOddqneN0YLx5E89K1CqsHmGyLdaRg=;
        b=MpK2PZ5ZKZc8WosN+DrU82qI7DQDmJGCUzPzK5iE9ppewuRS5pU3r9Nb1saYJNSDrM
         HX6l/zQuqC+TYXEXLnsxAcKcsjo9rZfNmeb0yJfa6cDe+pbs00uCglgSdGp7IwQ5sqYd
         lcr0T/poaDU5BPdEW/nWC6BFeJOlAP4WdovDEDE1rQuQ7QbHmB7lWOwjloaFwg/mkgQ/
         Nw3w54YTT1ys/b40tXn3KN/CvsrVrCyfVu32zsW5bdbR0+HZkehiiVjbY11AiPum51aO
         aV45yJsiLsMO44s9eW4RWq7w7HA3r5R8b358PwHfk/U1R2Z1mA8FOL0unCD6oOa5erER
         PEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757539957; x=1758144757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDgFFo1KURd80WOddqneN0YLx5E89K1CqsHmGyLdaRg=;
        b=Zb4TU5vb0NwCmX0wStLEZdoTSpf2QuSth1GU3b5Nn85aWpNrFiGkFODxeIU5GWZDyt
         Rz2I1YvWB9ZyfrZtSAobdGL/DVD8xqRZESfjtuVQR2fUmqyuoiZxZV2cxOwPAq97hGta
         QfP4StvNzA3VGA+b5HJ11xBCmd+MLWjVxBasfeR7Fh5IqfvOFkeoD6G1xEWMGQkxo/6f
         nDgE1i6MBCzSfEbGxq+rkTOC2UrWE7oV5fHkbJQjBIEKj4TdIWKAgc4W34N30bYnzdhl
         /NLEUMAYuVoe0fdemHH5pZhRg9d46DbeVR8+/D4b4a8ZXy8Tq9Reog7wNW2t/XU5mWKN
         ETdA==
X-Forwarded-Encrypted: i=1; AJvYcCXbJJ+MIpnOW1L6gTAW/TA9avzg1Av3mg3fQywAqjwsLuDua+Qv5qpKybHuuJB+sVZglSW2LuGM+fqEag==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnDGBzV6kzf5UFYh0yK5H2h+jDIYucYms+5WB3HT8rVMzjjiZ2
	/N/SjHG+SQO/8quvestaowB6GWPiuAjhRLMIhk7sHIDPKt4aMW55XqDY+HfhTcwjOK9IMDdK3II
	0jcKMyi2UmVvtnBZPnEeX+cpC1x99LGuTPcrwoiM8YA==
X-Gm-Gg: ASbGncs3v3mrAQPM+7zQ512ezmgvAXtx0YjGlt7gB+c78XxWVq9FMU83SOwGV/PwYEP
	J0s75Wm5ZB+d2O86Dw6A7BITgVTIWGvUyCSybFQu9oncWQ0jXO1XUGNqLkyl5qAMO5K/2YO7Kk+
	EC/AIJUex/9CTASb2tJycYq1Z2sOnA4ZjG0O/mllQFW2tbUZXK1hGH3QOWzslA0Mf/PJ7DkyCaO
	rYfBkuae9ZSHkivWQ==
X-Google-Smtp-Source: AGHT+IEDFgI45XU5cTVW9FtG8gM2JjDzoZENa8d1uC1g5vQQ+iix+RIzuYFh88VfTx91WSF4c7ZJi4duHEmeM7k85Mw=
X-Received: by 2002:a05:6512:6404:b0:55f:595f:9a31 with SMTP id
 2adb3069b0e04-56262f11dd2mr5910272e87.51.1757539957420; Wed, 10 Sep 2025
 14:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Sep 2025 23:32:26 +0200
X-Gm-Features: Ac12FXzHQO4QoWSTSppUbrZutew2n-HjqWu5POboMsRGiUcu6mJnWXdH0E38Eq0
Message-ID: <CACRpkdb=J+hiC5cu+g0Z-gqzpG8PgX01CXc4P98FfSSAf7PZEA@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 4
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
	Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_143239_733127_B9576CC6 
X-CRM114-Status: GOOD (  18.05  )
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

T24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgOToxMuKAr0FNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+IHdyb3RlOgoKPiBIZXJlJ3MgdGhlIGZpbmFsIHBhcnQgb2YgdGhlIGdlbmVy
aWMgR1BJTyBjaGlwIGNvbnZlcnNpb25zLiBPbmNlIGFsbCB0aGUKPiBleGlzdGluZyB1c2VycyBh
cmUgc3dpdGNoZWQgdG8gdGhlIG5ldyBBUEksIHRoZSBmaW5hbCBwYXRjaCBpbiB0aGUKPiBzZXJp
ZXMgcmVtb3ZlcyBiZ3Bpb19pbml0KCksIG1vdmVzIHRoZSBncGlvLW1taW8gZmllbGRzIG91dCBv
ZiBzdHJ1Y3QKPiBncGlvX2NoaXAgYW5kIGludG8gc3RydWN0IGdwaW9fZ2VuZXJpY19jaGlwIGFu
ZCBhZGp1c3RzIGdwaW8tbW1pby5jIHRvCj4gdGhlIG5ldyBzaXR1YXRpb24uCj4KPiBEb3duIHRo
ZSBsaW5lIHdlIGNvdWxkIHByb2JhYmx5IGltcHJvdmUgZ3Bpby1tbWlvLmMgYnkgdXNpbmcgbG9j
ayBndWFyZHMKPiBhbmQgcmVwbGFjaW5nIHRoZSAtIG5vdyBvYnNvbGV0ZSAtICJiZ3BpbyIgcHJl
Zml4IHdpdGggImdwaW9fZ2VuZXJpYyIgb3IKPiBzb21ldGhpbmcgc2ltaWxhciBidXQgdGhpcyBz
ZXJpZXMgaXMgYWxyZWFkeSBiaWcgYXMgaXMgc28gSSdtIGxlYXZpbmcKPiB0aGF0IGZvciB0aGUg
ZnV0dXJlLgo+Cj4gVGVzdGVkIGluIHFlbXUgb24gdmV4cHJlc3MtYTkuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+
CgpUaGUgcGF0Y2ggc2V0IGlzIGEgYmVhdXR5LCBoYW5kcyBkb3duLgpSZXZpZXdlZC1ieTogTGlu
dXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKSSBlc3BlY2lhbGx5IGxpa2Ug
d2hlcmUgeW91IGNhdWdodCBsb2NhbCBzcGlubG9ja3MgYmVpbmcKKGFiKXVzZWQgaW5zdGVhZCBv
ZiB0aGUgZ2VuZXJpYyBpcnFjaGlwIG9uZXMuCgpJIGRvbid0IGtub3cgYWJvdXQgbWVyZ2luZyBw
YXRjaCAxNS8xNSBpbnRvIGp1c3QgdGhlIEdQSU8KdHJlZSwgdGhhdCBjYW4gbWFrZSB0aGluZ3Mg
ZmFpbCBpbiBvdGhlciBzdWJzeXN0ZW1zIGRlcGVuZGluZwpvbiBtZXJnZSBvcmRlciBpbnRvIFRv
cnZhbGRzIHRyZWUgb3IgbGludXgtbmV4dCBpZiB5b3VyIHRyZWUgaXMKbWVyZ2VkIGZpcnN0LgoK
SSB3b3VsZCBtZXJnZSB0aGUgZmlyc3QgMTQgYW5kIGtlZXAgdGhlIGxhc3QgZm9yIHRoZSBsYXRl
ciBwYXJ0Cm9mIHRoZSBtZXJnZSB3aW5kb3cgd2hlbiBhbGwgb3RoZXIgdHJlZXMgd2l0aCBjb252
ZXJzaW9ucwphcmUgbWVyZ2VkLgoKKFlvdSBwcm9iYWJseSBhbHJlYWR5IHRob3VnaHQgb2YgdGhp
cy4pCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
