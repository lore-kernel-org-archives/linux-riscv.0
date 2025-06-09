Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7773C5B552
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 17:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4czFoKBffXrAvz/OQ19V7H+ByxAYW5UTgQcss/PmlsE=; b=EAb+thd1sV7/cW
	ZNCV2w4H2rhgQgQMKRlxMHVBBT0k640XcCXhBw4nFkr/5KYSFcefbFe3hcO7MEWSNAcER78vEFpQa
	DanEwE136gMxH2dkY3t1iiP2qJ7Wr9iPnenV0xa83A9DqgnOpSweK8W08eGcsUAd2gOqekLNXIiqp
	2o2AfwWfkESTWtfZ1EnNn+0OJvTFOxYq8T3wDk5PgkFlFJ8I/OstM8bTTCJsB/+3JiUUIASE+JPAJ
	NHoNUU1HJUQhboIJ5jZXqN72+TILpaj0kAk/eeZhpZWMVx17mN0OfrPC64a7gzrCMhPRAkVrjgk+C
	cezXt8OK9E0Ey2Z33e/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOgfS-00000004qbe-0kCE;
	Mon, 09 Jun 2025 17:52:18 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfXE-00000004htI-3K2V
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 16:39:45 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so3766903f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 09:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749487183; x=1750091983; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b5IAyMi8bog282MCnpmIozPAGbv4atmEqp0JP+JLJVQ=;
        b=TuqfD1iSgNLzDB/B5BgumjZqZS3IC33hjd1umSH4yW7fK3SE8dQWhcbOWvSkCuZie/
         GEJ/IQOzU2bgMHJwFhwE0mNrlQMhT0QiiDa5d4DW3L0FNeFjvg2iEgZq2B+7y9R3E6tj
         41JXaSJ+PU6og8awhYbrmscyiCZBun3DThOLBH20Iqb1AYEVy/jKgXPwLiHFSZLNdeoT
         NEEUfzFA3CXgZhiRXYwAIROprnR/KbsgvJ+M59xHDPr5HejbHHBqJAlLkojKArkO4enj
         OQPjs18nJqPuSRjdgkxlW9ca/VsCu5jzJpsLpyeEedyGSO/6ABJDeqSJbRz7y1mET7Mf
         Sn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749487183; x=1750091983;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b5IAyMi8bog282MCnpmIozPAGbv4atmEqp0JP+JLJVQ=;
        b=kjbk8K0aQPhVKdoEpce0or/d53+/7Wmba5u3gHwpQeFbQ1PobX9priVYLJ5HvZD8KD
         lEu7A7rCzmqfZ3FBQ+4MYuAvUgh/gGkL9aiQ1294RbLSu00h8pKi1ypAngr7TLZLrM3M
         jZaT28I7erMlGm2YDrDTcH8vThNoEHWgwTocmcyRZ06gAl0yEGLVnZFY4SGNZKeqSaO0
         IwgL5ZMqZCEvBgzs5RD4fY4KS1RHnr076lhWOkllhTFcMRhd9Mq5LOBeKn98sDguFORW
         cB2lfHpV3MvpvHNtIxTkUJe66qUCcG6P6e/QYOJdDO2OwbiEG1icX+d+axGHWh3tGm0p
         Mabg==
X-Forwarded-Encrypted: i=1; AJvYcCXitw66lBhrlvYMNJu+QFmOWLe5+dVYd2Tgf+L7KZIfB2LuDZPi/94yWn02aEixGy5LQSwxDRc8vmq4+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaKw50GWSjWFb6M9pCgIbz00pQXiwKHR+yjJXNHxOc2JGH/mfa
	S0jhciIx/8lc8i/Jsupo4Wpzj7364QZtcFBe7nQpMmJeTOo0kb9fjIjV
X-Gm-Gg: ASbGnctDsKhFqxGYJ7e1TJPIHHlZy2KMR+oXA/pEW9waSkQ+6gW2rLCOYgZIRBeM2li
	y/H7zHyVs8TzHU2RrBi2uK5FPp1NRp5RiQtTS/GDsFdEXsgkQeNAB15a0Bu3V7NW+7awAJZaKSf
	2BjxWDMkPEGIIgU7ZeFjD1iIC6no//ex8v00SyAKraAjDfN5DRRwb8rrsGWGweR29GWltZ96+bp
	smIKffq2GjikvrQb8yoxMjccHdKLWo/a7WYariPamgUm+6XbvHpOK3FP06kW7LeKB2TDVeFrwjW
	aoYEAMKgk+cxp9Y5MvX0ZzzbCtiFa3kNNB+YWdWCrWb5KTrcIsX59FpF2SRAbfhzZg2C997I71L
	IbY5chA==
X-Google-Smtp-Source: AGHT+IE9fQxxC4zIGJ9d6F5tS1v5nb9uy1nE232lYSx4KIqFwSxQrRWo/+NPZxfe3hvsc8rcGcPv0g==
X-Received: by 2002:a05:6000:1446:b0:3a4:ebc2:d6ec with SMTP id ffacd0b85a97d-3a53189ea15mr11001381f8f.14.1749487183160;
        Mon, 09 Jun 2025 09:39:43 -0700 (PDT)
Received: from giga-mm-5.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209ce1afasm116930245e9.10.2025.06.09.09.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 09:39:42 -0700 (PDT)
Message-ID: <902db298b21cf78a2c27ed0cdc002e7f2861c428.camel@gmail.com>
Subject: Re: [PATCH v2 3/4] riscv: dts: sophgo: add reset generator for
 Sophgo CV1800 series SoC
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,  Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Chen
 Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti	 <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, Thomas
 Bonnefille	 <thomas.bonnefille@bootlin.com>, Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Date: Mon, 09 Jun 2025 18:39:43 +0200
In-Reply-To: <20250608232214.771855-4-inochiama@gmail.com>
References: <20250608232214.771855-1-inochiama@gmail.com>
	 <20250608232214.771855-4-inochiama@gmail.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_093944_827070_667A06E3 
X-CRM114-Status: UNSURE (   7.40  )
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

T24gTW9uLCAyMDI1LTA2LTA5IGF0IDA3OjIyICswODAwLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+
IEFkZCByZXNldCBnZW5lcmF0b3Igbm9kZSBmb3IgYWxsIENWMThYWCBzZXJpZXMgU29DLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBnbWFpbC5jb20+CgpSZXZp
ZXdlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5AZ21haWwuY29t
PgoKPiAtLS0KPiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgweC5kdHNpwqDCoMKg
IHzCoCA3ICsrCj4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4eHgtcmVzZXQuaCB8
IDk4ICsrKysrKysrKysrKysrKysrKysrKysrCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDEwNSBpbnNl
cnRpb25zKCspCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9zb3Bo
Z28vY3YxOHh4LXJlc2V0LmgKCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
