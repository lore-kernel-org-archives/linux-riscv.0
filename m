Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4254ECA0EE9
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 17:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LK06yfRF+CjBP6YaAJHbuUg8DkUMQCRoH3hVG2UnJC4=; b=1N8XHmVyxBv4pZ
	IXNchtIoz3EWBeN7tviX2lcL2xX/vcJI7x8tmkMDKJB/FmyhhcCCB5l4iDzZbpjqNF5ambvvCbxFH
	BjtpAKrnrzTFJ1gTFFYER6BT4F15ZqrMa4oYWCZ2Jw+nCickBX9iVE9lqBz0Eg9c41ZTGbqgXPrcI
	1hk1FibZT8Gr5Nsw4lxIW6NVCOyP9QCHHNcM5GCSycbxPyYpYIoqa+71JYvvUkX6/PeeIUEAFf67i
	vaFRKKhONDkaOpbIktM8fomjWNJ4YsEC1cx8eERAU+fh3Vl1tojQTk5pxvZw5CwBU2790lVviiSY7
	1/sPrEZVp6doRqyhUfow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3i3-000000089tI-2mC2;
	Mon, 18 Aug 2025 17:31:51 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1cX-00000007tqJ-0te5
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 15:18:02 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-333f92b4072so32055221fa.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Aug 2025 08:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755530279; x=1756135079; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMr9xoaIvvzsvVDKBkZPG6cWCCooP8ZucmJRQKxCeD0=;
        b=T2Fokx7CGegHWmdIKis4BsE3YZaiL+pTp4kaPtoupt922ycaZg20JqybyIDgXRgQCV
         X5RaCqlziIffCjA7tSdrVEpgiAu4nDnsBOBLX04obFw2/wyrMbtcUwlfs2/UMbvOIfBY
         V9gMAaaaZGpm35LcrSwdPIzF18xS4n7fMT/drJwo/EYEykMRb7dAbeFJs3k2tOlgkDgf
         1Z9olQYXGt2vBxJUvBRtQ1W6a+8Num9FDn1iDwhMJCfA7mcX/eCmiKhaiDH2UiBS3IZk
         kfsK9sLbZcwCxPrYKycjsBTLCIQYcc3EFnm1WgmeMObIplULd+j/n5MPXBJNGvIEA53s
         xXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755530279; x=1756135079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMr9xoaIvvzsvVDKBkZPG6cWCCooP8ZucmJRQKxCeD0=;
        b=BmlT9fmh1vvjcrPRKi7kEzsyHh8sW+y2WGUddGuUbcWl8OIxygZ4Eusa4pDSb186KD
         1VD8kHhYoFanT+k1fF90Sorczr9zEDpatDiVR0QaiFYaFSAK5hMhsc17RDhdyuPgClmx
         Sf01JQq79EVwblasHTfFraXL3b0Wn+nitTe7Im34Gk8e/tze+6UjoC9jjiE8fiJDIACy
         FulG2/TUviy6CKI6BGeycCT63xpwVdIdgpW92OdvBdxggtW0fpK5W3OnQCyAhGZnNUfQ
         DKDxxukb1WSYVWu8SGJwTiuG9nC+oO9WzCAGjRtu0zzCSXBVCCbLP3QAEi5bFBfyhbP8
         zB7A==
X-Forwarded-Encrypted: i=1; AJvYcCUEIA+91ZGUS9cjSO3mcpAXxCCrwv8VnVPnMyAwB+QuT0vSFSNMoF6nGggKurorgnbineQeR4xhzF7Xpg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy/ndWBVddQTG0y4pxDakyQQsy+tkUkF4Yq0yUcq/GzWfbcPJz
	/s8eJtWbXhMtr4qEjYd6eeHHadFOffn96l4gVfTrSg71Qz0e+XrBsdvSCkUNjw12hkM2NCIKn2R
	tKbEtepKxaKRrS/+IaL9MIeLpHXWPVZ0TXqWqrTu6LQ==
X-Gm-Gg: ASbGncvZJbURw6R5Qa2MEBMnN+Eb9F3NlVPDLdrqRONXs9ZtG5imgz84gLfPXJu6ITe
	WselQvwmW/qtHhawNp0/TrGfGVnyCGx4I6hjy+wHzG2b5DqBXkQzHuAtIEGuvEpgulKncsLIvSD
	B3mhBriNixAvDcNKgE5SCqhgww63WL36B5twN/9m0dxH7WqB/xDSNV63JCz62TvfutQXstlLfqr
	PKyYsk=
X-Google-Smtp-Source: AGHT+IHpEkQH4zE8nZNumut6IyOKwzxXwXZPLXikec1wNlOm0bT1vQJ2AuF2DGHtOC/up+K5+uVQHVhxHrEqbksxztM=
X-Received: by 2002:a2e:be83:0:b0:333:7e57:67f0 with SMTP id
 38308e7fff4ca-3340996a3d6mr37277621fa.28.1755530279380; Mon, 18 Aug 2025
 08:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250805150701.129113-1-hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250805150701.129113-1-hendrik.hamerlinck@hammernet.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 17:17:47 +0200
X-Gm-Features: Ac12FXwu4f8Ac5IEmqGAiQiNmOLkl0amKoCINQhS7HVe6tsTOs7Qh5vl8eGuhWc
Message-ID: <CACRpkdYK5-Ga+TpwKSroZN_Tku7R7gwA6LrV52W8ydYOqmLk+w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: remove extra line in debug output
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: dlan@gentoo.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_081801_250717_FFDF5A09 
X-CRM114-Status: UNSURE (   9.30  )
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

T24gVHVlLCBBdWcgNSwgMjAyNSBhdCA1OjA44oCvUE0gSGVuZHJpayBIYW1lcmxpbmNrCjxoZW5k
cmlrLmhhbWVybGluY2tAaGFtbWVybmV0LmJlPiB3cm90ZToKCj4gVGhlIGRlYnVnIG91dHB1dCBm
b3Igc3BhY2VtaXRfcGluY29uZl9kYmdfc2hvdygpIHByaW50cyBhbiBleHRyYSBuZXdsaW5lCj4g
YXQgdGhlIGVuZC4gVGhpcyBpcyByZWR1bmRhbnQgYXMgcGluY29uZl9waW5zX3Nob3coKSBpbiBw
aW5jb25mLmMgYWxyZWFkeQo+IGFkZHMgYSBuZXdsaW5lIGluIGl0cyBmb3IgbG9vcC4KPgo+IFJl
bW92ZSB0aGUgbmV3bGluZSB0byBhdm9pZCB0aGUgZXh0cmEgbGluZSBpbiB0aGUgb3V0cHV0Lgo+
Cj4gRXhhbXBsZSBjdXJyZW50IG91dHB1dDoKPiAkIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9waW5j
dHJsL2Q0MDFlMDAwLnBpbmN0cmwvcGluY29uZi1waW5zCj4gUGluIGNvbmZpZyBzZXR0aW5ncyBw
ZXIgcGluCj4gRm9ybWF0OiBwaW4gKG5hbWUpOiBjb25maWdzCj4gcGluIDAgKEdQSU9fMDApOiAs
IGJpYXMgcHVsbCBkaXNhYmxlZCwgaW8gdHlwZSAoRml4ZWQvMVY4KSwgZHJpdmUgc3RyZW5ndGgg
KDMyIG1BKSwgcmVnaXN0ZXIgKDB4MTA0MSkKPgo+IHBpbiAxIChHUElPXzAxKTogc2xldyByYXRl
ICgweDApLCBiaWFzIHB1bGwgZGlzYWJsZWQsIGlvIHR5cGUgKEZpeGVkLzFWOCksIGRyaXZlIHN0
cmVuZ3RoICgzMiBtQSksIHJlZ2lzdGVyICgweDEwNDEpCj4KPiBwaW4gMiAoR1BJT18wMik6IHNs
ZXcgcmF0ZSAoMHgwKSwgYmlhcyBwdWxsIGRpc2FibGVkLCBpbyB0eXBlIChGaXhlZC8xVjgpLCBk
cml2ZSBzdHJlbmd0aCAoMzIgbUEpLCByZWdpc3RlciAoMHgxMDQxKQo+Cj4gLi4uCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBIZW5kcmlrIEhhbWVybGluY2sgPGhlbmRyaWsuaGFtZXJsaW5ja0BoYW1tZXJu
ZXQuYmU+CgpQYXRjaCBhcHBsaWVkIQoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
