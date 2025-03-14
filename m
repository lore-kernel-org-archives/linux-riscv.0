Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF98C28B2F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 23:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yfvoURDJjhvnU+NKO46Mx9lKdBw+qKNerzDM4hf251c=; b=YIZBStKM5oo//r
	ZUf8wM+1v9dhICbDb71wT3cqAD5fV7SElrhzGmE+EAI8LCKlsnFOQnjvyg6X6nDZylfYLYe1rECcs
	42It18EgGBazXgbJyh/dPbfDBvPeKq4FLIiZySJ2HDlJMkQmF5ZiHeSWbRRkE9l4waoWOTrdNNV4t
	7XlwsjtvyoTV0s78QuKbCCnNba07DBv2PBk/5nHSna2ucmIbQNUfGV9vfmOAJvLLQ8E7gwlLPtAQZ
	8ToLHHRPkNi0icZBtw1XQHFtMEXRGYiJOiBLYaCvyOwZjt2axAEYdn6NCjNGxv/zAdOJy4qG44ZMJ
	n4SHR2HdSerRh37hR3+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEmb-0000000FXVW-0vGH;
	Fri, 14 Mar 2025 23:49:41 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEhw-0000000FXJi-2jMp
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 23:44:53 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4769f3e19a9so16901531cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 16:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741995889; x=1742600689; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+vjrDVi1XuD8YezTfvAJnDkQnfPVZJ0QiIFwJDMUcMU=;
        b=YbHfDtSjxkMbD3PZk1rNTjko/sFH2JE2HL8wuoP6C0E9u2x00+qwECzyWtKP0Siwm5
         Ko3Fq7TFaMso4f1EDlhqIIlsODbEaqy1fy0GN0UTFwCwdn6nB2s8Mkbp9PYWaQ6xemJv
         v02iH6CkN0P2/awIhD6K40NAwuAYrgb6p15adLBHPxbyQ8wLKRg6+dYi5U9SzUAgykJk
         rWmjwN4/H4I2zyTw6lYNFeB/qzbU8lAA5fVZtxOFWc6TXJ6g5kUB4oNn9thVp3Vp7vE8
         NHpfDokbxeGcFTqcJnXRC5mD5zemd7gPR9oeP/XuBqrrk+cCkHL/pKGfeiuDmL8t5gEo
         e7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741995889; x=1742600689;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vjrDVi1XuD8YezTfvAJnDkQnfPVZJ0QiIFwJDMUcMU=;
        b=CMfj3JZYtA3zzag4jQ8DvlMnVHlxp01jQQm0ExODUWow9STxBfjNw+i0aHWYAR4JLq
         tlT+esk88eBoleq7fkrQ2H9NNd5c2t3Z41noFvAYlG3boYEvQMo9GbCiZCHdrqStlURl
         RE+QYWfg46Leug59VyAF0UE4kSNO3hvsBuUY3RpfkMBSD1e9zdUVGlvElgmz2ugQkw52
         LEvgSpCj6/O8hOPktw8XI6xUOVo8+a+AWt0+Z8P+Oob9TO55ddImf2zevNdUsPryR8wG
         nRliE/0LkEmPnO7rkLRntKsJoYXa4zOunrozo1Q8KTBkIJpHj5ZR1M0aFlEryFKQnq46
         AwKw==
X-Forwarded-Encrypted: i=1; AJvYcCU5CMdShK+wrecB+UqmWD2CHKG2jOl0PrnM+XEM9GNk0aLmJ3MpMSlCC3fk5BsKkKxo+N7a3c6pFRCIqw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxh5fPRDc9lRyjQufrqHxjStGw5CYtIsYtrKFOsuh0j126T679
	sFF+WSHNN9CzHzZs/MIH5o2fW0+El8LpKbYIb9iWYv2UFqRBxzsy
X-Gm-Gg: ASbGncssJsWE4RfuTLbiJw3q37wGMb9wg7t1mvQ/U0cocpNGyMrk5geIPinFV5IkcLh
	GHbUctNBFGSUzRCDmGdfe8uGqgmh6btbvmA23SHyuPLIaYbcol+j79k4rok30ddLpWktAHyX+Iw
	m6VVgvblzcghPypb1CmxEZ0hHkkeN2mZmxIUvGaAHY0ispMocNLP3GuCaFOOlmNbqmEsHnO0dY6
	wnkE7rb/FJ4VtEOsH4DMkT3wxlrS2+Jp3xxkvEtlQ932uGfkdrEK/q5Kzw3XU0zqYgtZPDjm8qk
	T2muWO48hlcyONR1He7G
X-Google-Smtp-Source: AGHT+IHRUH+t/ZNriz9AIIFDUvNwqNXSWGPqwO6hLy2CrfDloRoUEfYKSMvcUddQ0QqLGeQiqSDYOw==
X-Received: by 2002:ad4:5946:0:b0:6e8:fe60:fdeb with SMTP id 6a1803df08f44-6eaeaa08163mr56420036d6.17.1741995889275;
        Fri, 14 Mar 2025 16:44:49 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6eade254502sm29566866d6.59.2025.03.14.16.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 16:44:48 -0700 (PDT)
Date: Sat, 15 Mar 2025 07:44:37 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Chen Wang <unicorn_wang@outlook.com>, 
	soc@kernel.org, Conor Dooley <conor@kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Xiaoguang Xing <xiaoguang.xing@sophgo.com>, 
	Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
Message-ID: <ilkznijefh5haqed3hpj5mynqiqoqvmzodes6os2cccy3tdxf7@zvv3o7k2eful>
References: <PN0PR01MB1039398834809EEFB83AD25F5FED12@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
 <f65bba9b-726e-469a-8657-693bb640d75b@app.fastmail.com>
 <CACRpkdb+U7CBMByZeYmNedv8jEhNXn_w3psJSfRi62diOBhGCg@mail.gmail.com>
 <t5p5mssjmpbkwc3myfjnolzt23vo63px7zehsvwfp62mdrz7oi@qcrt3672ghxz>
 <CACRpkdarxLiyfZJisyW3F_ipiOgOP189iqUkeGtuKKttHp8F1w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdarxLiyfZJisyW3F_ipiOgOP189iqUkeGtuKKttHp8F1w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_164452_691296_E1D6E332 
X-CRM114-Status: GOOD (  13.28  )
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

T24gU2F0LCBNYXIgMTUsIDIwMjUgYXQgMTI6NDI6MTJBTSArMDEwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBTYXQsIE1hciAxNSwgMjAyNSBhdCAxMjoyMOKAr0FNIElub2NoaSBBbWFvdG8g
PGlub2NoaWFtYUBnbWFpbC5jb20+IHdyb3RlOgo+IAo+ID4gSSBndWVzcyB0aGlzIG1lYW5zIHdl
IHNob3VsZCBjaGVja291dCB0aGUgYmluZGluZyBwYXRjaCBpbiBMaW51cydzIHRyZWUKPiA+IGFu
ZCBtZXJnZSBpdCB3aXRob3V0IG90aGVyIGRyaXZlciBwYXRjaD8gT3IganVzdCB0YWtlIHRoZSBi
aW5kaW5nIHBhdGNoCj4gPiBmcm9tIHRoZSBwYXRjaCBzZXJpZSBhbmQgbGV0IHRoZSBnaXQgaWdu
b3JlIHRoZSBzYW1lIHRoaW5nPwo+IAo+IEVpdGhlciB3YXkgd29ya3MsIGl0IHdpbGwgbm90IGhh
dmUgdGhlIHNhbWUgaGFzaCBzbyBpdCB3aWxsIGFwcGVhciB0d2ljZQo+IGluIHRoZSBoaXN0b3J5
IGJ1dCBpdCB3aWxsIGJlIHRleHR1YWxseSBpZGVudGljYWwgYW5kIGdpdCB3aWxsIHNvcnQgaXQg
b3V0Lgo+IAoKQ29vbCwgd2Ugd2lsbCBoYXZlIGEgdHJ5LCBhbmQgc2VuZCBhIG5ldyBQUiBpZiBl
dmVyeXRoaW5nIGlzIApmaW5lLiBUaGFua3MuCgpSZWdhcmRzLApJbm9jaGkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
