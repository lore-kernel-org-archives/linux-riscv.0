Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6200C46CA2
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 15:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4QAOE8a68Pal8AMnHcQoJJoK5d6y5/x8It3eSbpJu2k=; b=WhNqISRQILItNq
	DjKeoMJfTVpsp3YwGUUloDmmyO0JENOZwEOlpPLfxlPYvNltCytZSOowD6HTM6me/ccO348//AvU0
	7vZP7murMt6gVC2glgV4IRNkfWyABVqbzf4+3VguOKStycImCyPznhZdUmCfFcLgj5x52p2Fng0/+
	HcXxVr7mxtJHizEQUs+DmyNdy666vYZycAGkLnLAM6a6vqZCjwgy8vOa+70gN3Q8Lv1Ddp7NQg2Sd
	qInF4BNWZjzd8+lYO2y4R11V84ozVwyOyD1km8WlsHPXpZs7XnuhNYuJkygZCwdywDgMHsUwoOrRX
	t699OQNayIVOvk3KhEYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9wf-003hmZ-1S;
	Fri, 15 Dec 2023 15:17:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9wc-003hlZ-2H;
	Fri, 15 Dec 2023 15:17:44 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40c4846847eso8355705e9.1;
        Fri, 15 Dec 2023 07:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702653461; x=1703258261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxtTXwrG/DoJdGtWMfu6YqqiGt2u0eh0tzIyDazjR9w=;
        b=BTu/b/hDQAujr5Cq6rdSaV6za0Bclvd3fFj0CjWFUT7u2QYkNUMg+N1pgxH2V+EFBM
         7tbka4riqjeyFCvkOe2knQIML8gR1zm+hpEfsxaQXyxWi7TyODBE3PRaivNL3eMkMvRh
         1shPSJnb1v7P9P7FFW2XemLDT3JTSf2mQuPmOCxWCBMgz47juEOWajzRglFTH9Nlh2u5
         q4z2HIuwEWsAPoT/kHC8A72w16Bhuc1oFVdVfxjt8Loo7KGjAOYwWLKIQ1W58/LFHqwY
         iIfo1NW85WR4uMSw/tziJKQQvUQSyK0MfdimKOeOuHERUzdBR8TF3Ed5JF3aEdAQHLDW
         FYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702653461; x=1703258261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UxtTXwrG/DoJdGtWMfu6YqqiGt2u0eh0tzIyDazjR9w=;
        b=p20VoJOntGAGGGhIQS+ff2XpbsEjx1N5/jeYwJWFOnnYEqflJR1nQJkTpMYQ1asbu1
         zM4o8KfjHnc9dVPfNbijG8z9xTqrOMlG2gtAA81XJOWRod5T0F3KaLRk7Cs0/7yI0Xb7
         imvnMNbR/JUFq/oh6XFvW0F/9J2+u0MmVvS9K+bCiSJ4++vncaDodql6vPpu6n0So7aS
         Xb2h7CgjnQpedcd9GaQYP+yKjgq28scONdUJd++cL/T12ePpssDHOagIDdug8kghBqqQ
         jQbg5r4O6+ZXs/hr8L+izH+DZTbJr7t0PyqHi5f1KWchjSqaq1PrYKo2Eb7/jtjr5KpU
         3yJw==
X-Gm-Message-State: AOJu0YwYKQLalzjngcubKzKRXzBMFsQ0E/NQpWrwBUEiCbKulKf513Lu
	1ckYvz5xCBJKZmnwAcTADdI=
X-Google-Smtp-Source: AGHT+IHCy5Jt0sNRcFT4XvhtCQgRzgiDR2kGcZzEPbaBUD2KhamdV5ExRXFs+HFRp/3YOnpYtX+4hQ==
X-Received: by 2002:a05:600c:30d2:b0:40c:4378:f117 with SMTP id h18-20020a05600c30d200b0040c4378f117mr5479693wmn.76.1702653460855;
        Fri, 15 Dec 2023 07:17:40 -0800 (PST)
Received: from localhost.localdomain ([154.72.162.212])
        by smtp.gmail.com with ESMTPSA id bd19-20020a05600c1f1300b0040839fcb217sm29806121wmb.8.2023.12.15.07.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 07:17:40 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: viresh.kumar@linaro.org
Cc: aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	fusibrandon13@gmail.com,
	jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	rafael@kernel.org,
	robh+dt@kernel.org,
	samuel@sholland.org,
	tiny.windzz@gmail.com,
	wens@csie.org
Subject: Re: [PATCH 4/5] cpufreq: Add support for RISC-V CPU Frequency scaling drivers
Date: Fri, 15 Dec 2023 16:17:23 +0100
Message-Id: <20231215151723.46409-1-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231214111702.xdd7qlcrpqh74i3j@vireshk-i7>
References: <20231214111702.xdd7qlcrpqh74i3j@vireshk-i7>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_071742_744319_0B3816EA 
X-CRM114-Status: GOOD (  17.83  )
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

T24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgMTI6MTfigK9QTSBWaXJlc2ggS3VtYXIgPHZpcmVzaC5r
dW1hckBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIDE0LTEyLTIzLCAxMTozMywgQnJhbmRvbiBD
aGVvIEZ1c2kgd3JvdGU6Cj4gPiBBZGQgS2NvbmZpZyBmaWxlIGZvciBjcHVmcmVxIHNjYWxpbmcg
ZHJpdmVycyB0aGF0IGNhbiBoYW5kbGUgUklTQy1WCj4gPiBDUFVzLiBBbiBlbnRyeSBpcyBpbmNs
dWRlZCBmb3IgdGhlIEFsbHdpbm5lciBINiBjcHVmcmVxIGRyaXZlciB0aGF0Cj4gPiB3b3JrcyB3
aXRoIEQxLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEJyYW5kb24gQ2hlbyBGdXNpIDxmdXNpYnJh
bmRvbjEzQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvY3B1ZnJlcS9LY29uZmlnICAg
ICAgIHwgIDQgKysrKwo+ID4gIGRyaXZlcnMvY3B1ZnJlcS9LY29uZmlnLnJpc2N2IHwgMTYgKysr
KysrKysrKysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQo+ID4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2NwdWZyZXEvS2NvbmZpZy5yaXNjdgo+Cj4gV2Ug
ZG9uJ3QgaGF2ZSBhIHNlcGFyYXRlIGtjb25maWcgZmlsZSBmb3IgZWFjaCBhcmNoaXRlY3R1cmUu
IE9ubHkgaWYKPiB0aGVyZSBhcmUgdG9vIG1hbnkgZW50cmllcyBmb3IgYW4gYXJjaGl0ZWN0dXJl
LCB3ZSBhZGQgYSBuZXcgZmlsZS4KPgo+IC0tCj4gdmlyZXNoCgpUaGUgc3VuNTBpIGNwdWZyZXEg
ZHJpdmVyIGlzIGN1cnJlbnRseSBvbmx5IGF2YWlsYWJsZSB3aGVuIENPTkZJR19BUk0gb3IKQ09O
RklHX0FSTTY0IGlzIHNlbGVjdGVkLCBzbyB0aGlzIHdhcyB0aGUgb25seSBkZWNlbnQgd2F5IEkg
Y291bGQgdGhpbmsKb2YgbWFraW5nIGl0IGFjY2Vzc2libGUgb24gZWl0aGVyIG9uZSBvZiBDT05G
SUdfKEFSTSB8IEFSTTY0IHwgUklTQy1WKS4KQW55IHN1Z2dlc3Rpb25zIGZvciBhIGJldHRlciB3
b3JrYXJvdW5kID8KCkFsc28gSSB0aGluayBmdXR1cmUgY3B1ZnJlcSBkcml2ZXJzIGZvciBSSVND
LVYgYXJlIGdvaW5nIHRvIGhhcHBlbiwgc28gd2UKbWlnaHQgYXMgd2VsbCBoYXZlIHRoZSBLY29u
ZmlnIGZpbGUuCgpLaW5kIFJlZ2FyZHMsCkJyYW5kb24uCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
