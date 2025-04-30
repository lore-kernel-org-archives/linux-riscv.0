Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D135DC369DC
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 06:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRAggb++i5hD3fxPbg6fhmxoA6guRaX2vL6MP1yP8uQ=; b=WzwNfqDwZii0Bv
	GUfGW2GgJ2i9s2X3+dNApw7BZZc54/ZKEiO13UITfG1kr5rNJic2A30vO2LnQerr4H1RrLlzHgxCP
	hisf560rGIwWpdRkswbvTpsB1egOFbOCX1HI67vDK441IXgo1Wz5AuACFkstUkj3AEeOK1m3w1riz
	PJVEb6FGJnDrmwT/3AvqJ7+hrZ3jkYAeJDf1jzKvXPo+yqlIBTrqpUyyN07G0H+99Bskc4nXmlFhc
	eNjReDTC9TV5i1WubLHkbbObPgG0gUyGXu2zg+Ilo2H5ROlF8igJTf0iDIk+d/aLaMTWS00RmtiX2
	cVkVHpRlX3rGrBQ7Aw+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0fV-0000000Bpkp-2k16;
	Wed, 30 Apr 2025 06:11:41 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0fS-0000000BpjJ-3QdS
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 06:11:40 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-476b89782c3so88909571cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 23:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745993497; x=1746598297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7Sx1WcG8f/lEhG1xD4WO6e65BUg4XMEnaaFpCgdP74=;
        b=VD2SPIlqZfcJ0t9fnAH4SKqeuz4CNgWVXhLGt5HLCRcPAcgJss89mKcMmfgSHL8k72
         RbDE/YyO6jfbrZX1OGM4SBmFRFsjJnmI+Uk7CYw0UsPoKbd3vQeXfq3x6Q4gWFtYjyf0
         1F8jpUG1dP2CR0bx6A5Gz4bIz9k/5GiwWYPAleG2raXMg6p3m5ATG1mLqX5eZnVYOvQW
         6/J0I7ZRU4BflfrBPt5XOZBHjd0PjuDg/XeUChxz/vWbOPeLsNhBn2OunKwAP0aT0fZ/
         2MCkXboDwzpKjT6dHZOoEvLet1RKve+4eukD+vrfPscYdVNQIl7qfUPlgRsOaiMpT5ml
         2xoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745993497; x=1746598297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7Sx1WcG8f/lEhG1xD4WO6e65BUg4XMEnaaFpCgdP74=;
        b=AGZ2dPYo8EWhIdn6+7QniJpy7T6ebcxm5iDlT5wUem5zA1qaAvi6PXhAlw/CRU7fk6
         oPcEG69UKZX8Oub0eqrId70QIQT0rUw2JW/eSPhwNpjhOeM5Kl0G/xlBeLApDmX1KfbQ
         CmRGtRIAHeHnJkB3ecGzUa4QSDmWBA3CeH8UODMgsSR+zCUvqzSjNMbqs/+yI8Z+buHM
         MPqD1nA750R8+YPP01ZoaoibtxEHFJcFxm2KBjBr/X/ppsp9kLMzvmFvm8F3DOUcOyBF
         LtvbVCXnBaKpsGc0SaAz8IlQMTMjJbCFwcOE6FGUn9Y/1wj0XCSarsIqUlGoA1E0d4SB
         o+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXMkC/7rOrNEbxeXzZjq/rg+6PxLenVefbxGc/cAWPL1nm+ilxb8lNa4h6oJ/4SEQzO5UiJWW3lYNB6IQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUd+VRiGJYUqj3Zsg236fqVteSQ8LZ6YeN90yoxMLl2ipiW9Ht
	8l4173alBOsakF7aEAE0oQ3qZlWVtc7eI8IQvIz5UpOfD0CHRElF
X-Gm-Gg: ASbGnctBt0oD2kYAr58M2/3hkPSbsoaciy0+hDHigb2qWUJ8z//c3wAKQ0H1n8hObFu
	U7YyleIido/QI82OFgnxfHJtslJmANsMPfmQUfct41UvQIIJEVIJN1CJgoM5/JyNyOedCM4G+14
	ljoy6atqT1nmi4U9iu6LYgdzytfMvGxewok+1CB6N8x+Z3zuwgfVKjZaYObgUH3jgKRi3dpJttA
	gGUPyRlLiJACrYF8Xlm0UJP5LBtEBEQQfNSzrZzOSfZSZSWYFZTIecA2yCzBQQJvzUfqV56IIsz
	iRLnTbca5J689MUy
X-Google-Smtp-Source: AGHT+IGs1P+XfC/zsF9LCXLoh8Go5qSMxvWRH8PVyfFT1zFItCSZlKafKUoX4M940mVzPotcHqa3cQ==
X-Received: by 2002:ac8:6f09:0:b0:476:63e5:eb96 with SMTP id d75a77b69052e-489c4169351mr35148251cf.28.1745993497561;
        Tue, 29 Apr 2025 23:11:37 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47e9f5b4f0asm88406361cf.33.2025.04.29.23.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 23:11:37 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huange@whut.edu.cn>
Subject: Re: [PATCH] riscv: dts: sophgo: fix DMA data-width configuration for CV18xx
Date: Wed, 30 Apr 2025 14:11:19 +0800
Message-ID: <174599347430.640588.3561713391476977843.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428-duo-dma-config-v1-1-eb6ad836ca42@whut.edu.cn>
References: <20250428-duo-dma-config-v1-1-eb6ad836ca42@whut.edu.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_231138_857510_E9812A97 
X-CRM114-Status: UNSURE (   7.22  )
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

T24gTW9uLCAyOCBBcHIgMjAyNSAxNzoyNDozNiArMDgwMCwgWmUgSHVhbmcgd3JvdGU6Cj4gVGhl
ICJzbnBzLGRhdGEtd2lkdGgiIHByb3BlcnR5WzFdIGRlZmluZXMgdGhlIEFYSSBkYXRhIHdpZHRo
IG9mIHRoZSBETUEKPiBjb250cm9sbGVyIGFzOgo+IAo+ICAgICB3aWR0aCA9IDggw5cgKDJebikg
Yml0cwo+IAo+ICgwID0gOCBiaXRzLCAxID0gMTYgYml0cywgMiA9IDMyIGJpdHMsIC4uLiwgNiA9
IDUxMiBiaXRzKQo+IHdoZXJlICJuIiBpcyB0aGUgdmFsdWUgb2YgInNucHMsZGF0YS13aWR0aCIu
Cj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gZml4ZXMsIHRoYW5rcyEKClsxLzFdIHJpc2N2OiBkdHM6
IHNvcGhnbzogZml4IERNQSBkYXRhLXdpZHRoIGNvbmZpZ3VyYXRpb24gZm9yIENWMTh4eAogICAg
ICBodHRwczovL2dpdGh1Yi5jb20vc29waGdvL2xpbnV4L2NvbW1pdC8zMmIzZjlkM2U1N2JiNGJk
MjIwNGE2YTQzMDViOWY4OTlmNzI1ODU5CgpUaGFua3MsCklub2NoaQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
