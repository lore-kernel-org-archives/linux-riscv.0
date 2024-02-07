Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7343C4828F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 07:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CnbyxbhUEC4eZg55FaWZkX65RDu5aIl3eeVG6RrkAbU=; b=bx7IrIr9ksxEy2
	EyPOfnCPIIPvHXRLXo824mYNDTd4BX4/Lftb0s42+s17VeLqIufaBoCbN6mUD6vtKNp03gNDXJphO
	YRnYInDvt6ljnhA9/q+mM3zLZYFi0GTcYQ8CaOE8B2Szkd2gwXiGvBsuztZQp97FpHjyAOFhcKJcl
	KzPME6Bk+hL7Mo8Iq19OuMdQHIAiy4s3sIHTfKXb80RA6KJSv0aJrnnL6c8LfC365d+Yqb/oU54Sd
	SfUm/ong+NV3BT8FXgZhTLaXJ6Tp0EpXecl9uBlFJAzTQD+fz3jsSXRZtOJI6OA1HiFdRxXRa0CaW
	/w1EWmcro2c2pahD68Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXckW-00000009yZu-2JSE;
	Wed, 07 Feb 2024 07:53:40 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXckT-00000009yZN-0Pgg
	for linux-riscv@lists.infradead.org;
	Wed, 07 Feb 2024 07:53:39 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-59a27fbe832so105797eaf.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Feb 2024 23:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707292415; x=1707897215; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgX5ExE3nJYcAguyTho/pDjzA5VrWtWbQB1ZBDtuJ5k=;
        b=M05HcsIbPiJlff4qubuPK1F2NH0wp4S1qrcC1hNH2UKr0RaBJuirtXYiqICvecZHpz
         ltKlpCCdzZuJx85/2vwajH0Vlsfv3T/IzhUrYALHVjZfkesxVCmi98hmaEsEU/BBo+oY
         8HLyQf4Sg0kRyIyqssS+isZ/jyOyNZ0AqhNzawBx2/aBWdQ6ysI5F+O+EY2ctSVpxRPM
         6nAlKjLywR9ujgvBagLTuLrCpdiRlKRztdSNsncP5FVnbCFZTGVdFgrlgRa90edBvzLP
         Ru3nPgKjBrm5Zi9fSFWalSvEvB8sLlL4XU05Kcmhx15P6LPjlLLeOU0i3SdBaQEpNakC
         T5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707292415; x=1707897215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgX5ExE3nJYcAguyTho/pDjzA5VrWtWbQB1ZBDtuJ5k=;
        b=MXqgtB6IHRzNLuUCf+W5/9H7PjHDfns3mU6+nXTJ98mymt7jiR8/8k17OCK6jiQa01
         iQFfRN426zDFQIwwJMt8/5Wl3OwzPkziEq6W6+b18fXcEkEfjB5DaCRNqOa+K15FU3iv
         O2qXqelN5r0PC4MC49YB57Zs8m13f/XwIouMzuIvrb3izZx0TvHthcI051pE8KHZmRCe
         oHV9/sbSwnbgjwzCkgPS5vlPF903LKP/INr1zJ5T8hEh38ESWCRh2Kh1+6UvY1rbRFSY
         73U3KdvA+2t7RmKbbUsZqC7qG5twuF7draAMridfufANzh/tngC34bjyTb3a31PHMOce
         MQZw==
X-Gm-Message-State: AOJu0Yx0L62vus9CJueHboaFVRXV/APInNiQJElCOK7VIt75a/4+8A/Z
	ArfPBoGVvKVVPHAIoaKSihuTZG4FCs633pbeZB+VuIlBAaNbwI8xjKY1bgOwmO+TCIhYqcmgWwR
	qiH5vqlrl+E6rtSsGA91dVIhkNck=
X-Google-Smtp-Source: AGHT+IHcDukNiN88ITnMg3zYEptRe0xEyi0EmdPcpucd7Hhq7QFK1xmlcRZ5QJz+Lo1eAKT0fu+cDqYZteyjTCpArF4=
X-Received: by 2002:a4a:7452:0:b0:599:f42b:9f5d with SMTP id
 t18-20020a4a7452000000b00599f42b9f5dmr4953137ooe.2.1707292414606; Tue, 06 Feb
 2024 23:53:34 -0800 (PST)
MIME-Version: 1.0
References: <20240207055856.672184-1-qiujingbao.dlmu@gmail.com>
 <20240207055856.672184-2-qiujingbao.dlmu@gmail.com> <1b0026ff-5334-4d3f-805e-d06926ca20f4@linaro.org>
In-Reply-To: <1b0026ff-5334-4d3f-805e-d06926ca20f4@linaro.org>
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Date: Wed, 7 Feb 2024 15:53:23 +0800
Message-ID: <CAJRtX8TFLZMTxPO2Qb18j0JY+nDS3Bep0YngEozzoW4tpQS+CQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: pwm: sophgo: add pwm for Sophgo
 CV1800 series SoC.
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: u.kleine-koenig@pengutronix.de, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dlan@gentoo.org, inochiama@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_235337_160358_2526B7AD 
X-CRM114-Status: GOOD (  11.53  )
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

T24gV2VkLCBGZWIgNywgMjAyNCBhdCAzOjQ14oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraQo8a3J6
eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIDA3LzAyLzIwMjQgMDY6
NTgsIEppbmdiYW8gUWl1IHdyb3RlOgo+ID4gQWRkIGRldmljZXRyZWUgYmluZGluZyB0byBkZXNj
cmliZSB0aGUgUFdNIGZvciBTb3BoZ28gQ1YxODAwIFNvQy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBKaW5nYmFvIFFpdSA8cWl1amluZ2Jhby5kbG11QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIC4u
Li9iaW5kaW5ncy9wd20vc29waGdvLGN2MTgwMC1wd20ueWFtbCAgICAgICB8IDQ1ICsrKysrKysr
KysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKQo+ID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL3Nv
cGhnbyxjdjE4MDAtcHdtLnlhbWwKPiA+Cj4KPiBJZiB0aGVyZSBpcyBnb2luZyB0byBiZSByZXNl
bmQ6IGRyb3AgZnVsbCBzdG9wIGZyb20gc3ViamVjdCBhbmQgcmUtb3JkZXIKPiBtYWludGFpbmVy
cyBhbmQgZGVzY3JpcHRpb24gdG8gbWF0Y2ggY29udmVudGlvbiAobG9vayBhdCBvdGhlciBzY2hl
bWFzCj4gYW5kIGV4YW1wbGUtc2NoZW1hKS4KClRoYW5rIHlvdSBmb3IgeW91ciBzdWdnZXN0aW9u
LiBJIHdpbGwgZml4IGl0LgoKQmVzdCByZWdhcmRzLApKaW5nYmFvIFFpdQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
