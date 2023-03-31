Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B7DC76196
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 10:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4gOuaZw/Nq8dnFCKZ0VsA7F8ViqPy1NzDQa5h4UmiyM=; b=tWPlIU8nZydp/p
	Pm3Lmecmj3xfbj8w45V2wGhlqGiVj3A2JQwZ/7+4LwKgbr781yMJbskp1I/NwozxCKD+QnAN0O4e6
	GbjLbRQzDHoNGkjz0E8qdDztELO1Tw+45EzR8WWCyEMY59peBgeJ3CJdCzQtX3NIWJVcrPoCtrfN7
	PjWEiux5fVcdRiH7tgtWO6Lu69ZHT6MsAwFLCUGEFllpyn7CkHrs0IDZnmJgTCqH3TTiXMujoGniI
	vWHbyOeSIGdJrqbChNVq8PCHaj4gj74kZQ+bwMWHzE8csewR4G9oUHyElT1tr5yVfbsPFlECFw7FE
	0lwsoDbGftbPZnWIaVVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piCIg-006zi6-2Z;
	Fri, 31 Mar 2023 10:48:08 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piCIe-006zgV-2V
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 10:48:05 +0000
Received: by mail-io1-xd2b.google.com with SMTP id q6so9554935iot.2
        for <linux-riscv@lists.infradead.org>; Fri, 31 Mar 2023 03:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680259681; x=1682851681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53gTPt8VQ/4Gvnr9FAjZvKj8QW8MyiL9p5lRK46Vbpg=;
        b=cDykQG6zQN1kOmUCE4mEeMUDdWK22oSgIrT0IulqoumymiixOHQn+HkOfSBnqkbFmM
         9O2tJJx89o4bd2g2zGiYhkI0ZYkXYoz+EX1FOssnaWRbsIgfaUUG/m2aQIRPCCoTEynk
         QJ7fB4G1gIrNbOKXK1frPQT+siglpgYyCPvkLmPOnVGsQHKhUptf+3+TQetqou8AxRAI
         ibQ84U1ictGxs/FRFRvSlgATvRVfYaDJSPjxWIA3AvQmAXUtIoSClWAUvfBJ5Mi59AKa
         wFgpaF+vbqJZUCMEbWi1PU+Wc9N/1WpnHRn13i6UH5NfacltrnTLV9XZAAFdzFh/Iwuj
         lT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680259681; x=1682851681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53gTPt8VQ/4Gvnr9FAjZvKj8QW8MyiL9p5lRK46Vbpg=;
        b=BUy3t2Qbn7WoN1wQMGFqocaa3zbGCn+Fnd6eNDqonWnCJyzAlslFJSkWW0EqOQfV0N
         sBvjHZmbnvWkCqvYYMs3daSRRlMPEP3geJX9h++Ep/932cfzk6k/6jMLv3OybnimOhT4
         iN4zpmAXzv16HjiwFMIIGcb/o1B91LmmWNLnzomp3D2lZXdbhaCAGiCgZaVcKG0b71KR
         Uy10H9ApxvbI5QnpvOWbJZl0R21/B2+LZbut6bkQIaNNgbWSl3mpxOT1sY7hha5GBn4b
         7NoCu7J1GeNsBlm22bh1ej4xR/SkWV577RsBzfTC/1KRH1xwj+niDuWk+cjR2YuwgDwa
         /ClA==
X-Gm-Message-State: AAQBX9cWd1CigloFZxz4/pLMXtGQZAywJG952VL+v0FZvBUI/RnYKagT
	AjGxk37YqRxIPdxj+/kNzN/TWUX0hrO297vNJ4o=
X-Google-Smtp-Source: AKy350ZtL7vr9o2g770/omLnpYq8CDrreihCksCi2KsRwDpBo8Dx7uLpj0IC5ao3g4zNJvNjshpf+WQ1GAeQruT3vJg=
X-Received: by 2002:a05:6638:4989:b0:3c2:c1c9:8bca with SMTP id
 cv9-20020a056638498900b003c2c1c98bcamr4627126jab.2.1680259680676; Fri, 31 Mar
 2023 03:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <65394572-33ae-4241-8936-0ccc8353d1a2@spud>
In-Reply-To: <65394572-33ae-4241-8936-0ccc8353d1a2@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 31 Mar 2023 11:47:34 +0100
Message-ID: <CA+V-a8u_rc=5Bv--Ong72CDC_CNvt6xfALUWLDYJo36yBUpAqA@mail.gmail.com>
Subject: Re: [PATCH v7 4/6] dt-bindings: cache: r9a07g043f-l2-cache: Add DT
 binding documentation for L2 cache controller
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel@sholland.org>, linux-riscv@lists.infradead.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_034804_816191_7F4E31F2 
X-CRM114-Status: UNSURE (   8.28  )
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

SGkgQ29ub3IsCgpUSGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiBGcmksIE1hciAzMSwgMjAy
MyBhdCAxMToyMuKAr0FNIENvbm9yIERvb2xleQo8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+
IHdyb3RlOgo+Cj4gJHN1YmplY3Q6IHQtYmluZGluZ3M6IGNhY2hlOiByOWEwN2cwNDNmLWwyLWNh
Y2hlOiBBZGQgRFQgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciBMMiBjYWNoZSBjb250cm9sbGVy
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eCj4gSSBh
c3N1bWUgdGhpcyBzaG91bGQgYmUgdXBkYXRlZCB0byBiZSBheDQ1bXAtZm9vIGluc3RlYWQ/Cj4K
QWdyZWVkLCBJJ2xsIGZpeCB0aGlzIGluIHRoZSBuZXh0IHZlcnNpb24uCgpDaGVlcnMsClByYWJo
YWthcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
