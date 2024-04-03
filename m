Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0584DCD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3XCX2L9RfoYmuRCOTdWTomL215X2whejkOcOLpWwVBA=; b=LBqIOmZ6pY8ypm
	CPexK0UfoZsXmNEzcMc72Ebz0Wn9DzPL1YIVJkuViFOOnxaqvlmVTKdh5v8S+yGTHwq1hsvvI2nHy
	dx87S7kF9hgfmxyPM5eH43I0XhAtRfi8uwCdCSsqtBblXmEbGs99K9NjIMFvpdYVbdHuP7mtvd92t
	4AxJQxsIKfx/DJbybrUsmdkAh9HS5ET04arY9F18ZoVqK3E2uSAWR8iRFye9inu9U+aE2IIAxXmwN
	obZn3v5afDh87BUQTcdW+3DGrHGWHdoRd5jYFtqSKCIIxqN8utlFUrJlaHTHhFZJl+r/wf/2JnWYh
	xAQSgLd+fIFr2wn7Vh8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsASx-00000000fvu-2slG;
	Wed, 03 Apr 2024 23:56:27 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsASu-00000000fuo-1wKu
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:56:26 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-430dcd64e58so2533981cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712188583; x=1712793383; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gtx6JsGuIZN4xE5atG77jiNDItUL3W3itZ8d1wNeS+8=;
        b=i1yisq5um5HD5yvNvTVL4rEviPLFpyWahkOgIRyeRKR7lV8Mma9Df5NqmwQe70Vwt9
         aG2AF8TfjHZ3EJnNJnaBdV3GsYP9rPvJbK+WX5d7AB+iVuOrmZKqBwOK0+GvA5AYrAfV
         fdC2F5KJx1lgyrHoOquJ3PD1+98tNTrul43xhP+ofUGJ/SCNOaFfRTBvJkPkwcGMUneV
         3eBIYa9CDq+mS32e8RmYF6XYL4KjHBuMPIkbAvx1gB3k2pv20NnDA4MbEBPZOW/cQfVs
         yw8zQ7kxLV8Qw650dVPIRflECZbbC4z+9cKidhLaTHbVP2qCeKl9W/7nayigmvb3Inck
         JeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712188583; x=1712793383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtx6JsGuIZN4xE5atG77jiNDItUL3W3itZ8d1wNeS+8=;
        b=cJdm4rQ6QtiHP5ASucNHQHvKasVshqv/T5UMH1oo3MZm5zXOe5c8GtedCctRW/MNQR
         WUIR9JjnBqpb5ZrV3ukSivTbe6+BKBUTOZVrCQHX1HI+2LBwFpKLDnK1AJSve2C0xJtZ
         y186Zm38b0584j4yCdvJCLoKPxoJ9ph8NsTzR4QPU9E7Lr5TE/b0kxjBOXqI4eCHhJUy
         s09zvHhKfv2ZCmq6q1Nt1QnuMNR3TNd28sji6j8MNStQ8L3SiVYpftoAVS0q2vsDYy1i
         gSOcCeCFLSCk0pyBRoBE48KWNqvzK/msIrQytxeWGdMoEhDY0J2tOrX2vTcD5Qa7NSoa
         gG1w==
X-Forwarded-Encrypted: i=1; AJvYcCUuK0JE1nIE3lgQaml8oqGHjXbCn2/nS0NwMQTg4rW1OUWKAYNnaUX8AzPSeUPiSiuL85uQcWbuouKm6O7XhcPe7bj4XbS1ZAck6/4heDrV
X-Gm-Message-State: AOJu0Yydp5e1Ph464Ppc5HvTToooEaLcqPIdQEvc6QRnkW94YAZQjPog
	6IMJpVZ56+uh2fF6OsfrVJ0FxC0xgGGstvwwHMqB0DKuLlljTQlwRQnd/Hx3EsCjAq7EB/MgpFy
	nNUnE56z0gYd48knl+/o6q8h0SDSDvXJRr9dwdw==
X-Google-Smtp-Source: AGHT+IFslM4TSQsZdneQcISvGVahDbSVOm65t2d3Bvync+fdqoeoqMKc9B2c1QZr1TF8qlqSyaKDNh1QY8WU0aCtyXE=
X-Received: by 2002:ac8:5786:0:b0:431:82d5:13d5 with SMTP id
 v6-20020ac85786000000b0043182d513d5mr836197qta.9.1712188582732; Wed, 03 Apr
 2024 16:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com> <20240402051154.476244-9-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-9-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 19:55:45 -0400
Message-ID: <CA+CK2bCgLrre3JYYz4MyMu+g9Zzvqnwaxd_xm0X=ORG5wkeD6w@mail.gmail.com>
Subject: Re: [PATCH v12 08/11] powerpc: mm: Add pud_pfn() stub
To: Rohan McLure <rmclure@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, 
	christophe.leroy@csgroup.eu, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_165624_524936_847A8B1B 
X-CRM114-Status: UNSURE (   7.86  )
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

T24gVHVlLCBBcHIgMiwgMjAyNCBhdCAxOjEx4oCvQU0gUm9oYW4gTWNMdXJlIDxybWNsdXJlQGxp
bnV4LmlibS5jb20+IHdyb3RlOgo+Cj4gVGhlIHBhZ2UgdGFibGUgY2hlY2sgZmVhdHVyZSByZXF1
aXJlcyB0aGF0IHB1ZF9wZm4oKSBiZSBkZWZpbmVkCj4gb24gZWFjaCBjb25zdW1pbmcgYXJjaGl0
ZWN0dXJlLiBTaW5jZSBvbmx5IDY0LWJpdCwgQm9vazNTIHBsYXRmb3Jtcwo+IGFsbG93IGZvciBo
dWdlcGFnZXMgYXQgdGhpcyB1cHBlciBsZXZlbCwgYW5kIHNpbmNlIHRoZSBjYWxsaW5nIGNvZGUg
aXMKPiBnYXRlZCBieSBhIGNhbGwgdG8gcHVkX3VzZXJfYWNjZXNzaWJsZV9wYWdlKCksIHdoaWNo
IHdpbGwgcmV0dXJuIHplcm8sCj4gaW5jbHVkZSB0aGlzIHN0dWIgYXMgYSBCVUlMRF9CVUcoKS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFJvaGFuIE1jTHVyZSA8cm1jbHVyZUBsaW51eC5pYm0uY29tPgoK
UmV2aWV3ZWQtYnk6IFBhc2hhIFRhdGFzaGluIDxwYXNoYS50YXRhc2hpbkBzb2xlZW4uY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
