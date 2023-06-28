Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA6BEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 12:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kcRUz+IoYlcbNT0WYkh3s6D80NqtmK+uxL6toacHdN8=; b=aEXh94A1bFBwX3
	usU49hQVHbId4UfoGo24Ftu06IaGMRV2HAP1/d++Ic4rtchXfOxtRitUab9wq4vE/6JMGk1G4UbTU
	pGJmZoyNW1zBp8S3vQ+6B8m4YNPoBhTQ1YbtpKOmmHIRLcsfqO474VDh58yOyK3tDz8C++oMzex+R
	9tvYzML+f3RvD7IOzrkrHrVZvoxGGx17EvofaIGJhNWkdTbKevDI1KfXMFoXA5NshF8vYorXFvjqo
	upWEGon5QL73ymKmo+ZUeeYx0wF8mJvDcs1k8Gwu5ZE50cwav+pm0DwBGsB2H1zNSzVZ9I/6tN2Oq
	98Io189JRfMU5vleevlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEUNv-00FeDl-23;
	Wed, 28 Jun 2023 12:34:59 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEUNt-00FeDA-0B
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 12:34:58 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51d80c5c834so1658805a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jun 2023 05:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1687955694; x=1690547694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deifRzGr11/JVry9UhGEOhSb6Ocp6b0NM1X8UOjbU6g=;
        b=0SJ73vJM/ObSup8qrZw5BiQ/vtxIX8ddoOJTfvpmdBRVnIIuUxUEMvlAc0iZt8EWe3
         5RExfOonAoqXAAdKiqtSQeAn9jm+8bPIVTEYeft/vhEFHesdfT3LiYFTxKZ83rDajWRz
         8XPBKBLigMtThmVgDUS1Pf8Miy6eX7CLBBejuWmJcukdZ9JpEW9RpLJJT8Sd7AaQJFqO
         3oATLZBZoRN+pxtyf/fZSwUnwIoR9usyJII0rI0vBPF/JIdfIS4M8NYnEiEyOvettsSw
         Ltl/VAlRjVo03an66bp3KzSgBgJHmtknjn+2lBu/G0Vp8wGvkgNgYEGoH+X25Av2lPNt
         h9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687955694; x=1690547694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=deifRzGr11/JVry9UhGEOhSb6Ocp6b0NM1X8UOjbU6g=;
        b=GJul9/HGJZ/Jk0/qPDty5LB/Rgs6HJAu4WDIHt32KwCtXTGftfG/mmVRntKDYE8zgR
         +QAdRbGOHXriw6vr2OaytYWAYPprNurmnani78HhKBrckX0OsCUUjl3OpShbJSnMCH+S
         C93Yb6G+7aO77yyEOmY5n7nKR3dyk5KAR6LwYRRjKwxl2NoRu9XgKz1fer2YWxzLIpVE
         gtMEAseHaxqLMh5q52HoyyGDj31qxgHhZN3krxrRn+QqghAuGUCTlL0pZ7rfmXC2Ofcy
         2zaCfIVgqc6tWE1cz7tTs3oi6+8u3iOhR093yulAPwGAo96+qYWVcomKHREgv2UweaFB
         /97Q==
X-Gm-Message-State: AC+VfDzbufBPb0eZPhVwn18K0UJVmlcC5qIvELFJQpDMhYAd5iWrOeeb
	g1Hot4d9W9nw4bQHw0GM4L7dO0zy2Ct7F3sVJlTOCA==
X-Google-Smtp-Source: ACHHUZ4WYvVDjePa4v/PscHrjN0+BnvFHWM/4ZCCdmWjEWEQbavYzuJMTE4M+tyhs00Ak/Fi2k5viEOJArhSPia30X8=
X-Received: by 2002:a05:6402:26ce:b0:4fc:97d9:18ec with SMTP id
 x14-20020a05640226ce00b004fc97d918ecmr1710680edd.21.1687955693998; Wed, 28
 Jun 2023 05:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230627222152.177716-1-charlie@rivosinc.com> <20230627222152.177716-2-charlie@rivosinc.com>
 <473F7474-D7AA-4C9F-95A3-320F1741EC50@jrtc27.com> <ZJtzEn9Yut3nPuw8@ghost>
In-Reply-To: <ZJtzEn9Yut3nPuw8@ghost>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 28 Jun 2023 18:04:41 +0530
Message-ID: <CAAhSdy2MVu986VUUVTaY6K+s75-MpDoQvsi_jOVZWrCZq8WE2g@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: mm: Restrict address space for sv39,sv48,sv57
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, bjorn@rivosinc.com, Evan Green <evan@rivosinc.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, konstantin@linuxfoundation.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_053457_315862_9F98D7BF 
X-CRM114-Status: UNSURE (   9.09  )
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

T24gV2VkLCBKdW4gMjgsIDIwMjMgYXQgNTowOeKAr0FNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gWWVzIGl0IGlzIHNtYWxsIHRvIGhhdmUgYSBkZWZh
dWx0IG9mIDM4LWJpdHMgb2YgdXNlcnNwYWNlLiBJIHdvdWxkIGJlCj4gaW50ZXJlc3RpbmcgaW4g
dGhlIG9waW5pb25zIG9mIG90aGVyIHBlb3BsZSBvbiB3aGV0aGVyIGl0IHdvdWxkIGJlCj4gYWNj
ZXB0YWJsZSB0byBoYXZlIHRoZSBkZWZhdWx0IGJlIHN2NDggYW5kIHJlcXVpcmUgYXBwbGljYXRp
b25zIHRoYXQKPiBwcmVmZXIgZmV3ZXIgYml0cyB0byBzcGVjaWZ5IHNvIHdpdGggdGhlIGdpdmVu
IG1tYXAgaGludGluZy4KCkkgdGhpbmsgc3Y0OCBpcyBhIHJlYXNvbmFibGUgZGVmYXVsdCBpbnN0
ZWFkIG9mIHN2MzkuIFdlIHNob3VsZCBmYWxsYmFjawp0byBzdjM5IG9ubHkgaWYgdGhlIHVuZGVy
bHlpbmcgaG9zdCBkb2VzIG5vdCBzdXBwb3J0IHN2NDguCgpSZWdhcmRzLApBbnVwCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
