Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A132FC77B73
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 13:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oiDiCMbBuqNFTeClaelpuUVK8xMaBpU8ltT6XH4yTUE=; b=cVKN+bOcii6Lv8
	GEMA9YxIvhMdye5n1/agQ9XoZXuWjQKPVslJ0XdtC/Kc0IxXhjgeT4OeT0iaN9C6rn8GdVyMHdRFO
	qfcCnX1vJWdYuAKA+q9YkINe67mydc3pJzWZHL34hd7KrJCE6SCipcLV3HpqEPLFeA956xGaxPJfc
	JjSNl6agsLzdEyJ1FRZ9EOdX+5h/yuWQ6k9R+uohvSKX05zHxU2KxmsLhRWblTFAFUPilJh1qwwDE
	5vBtzrFgkZTKWfascjeFPs7L8QRuUEl4gaGP7jJyuSgWbLvBb+tyiEwKJnlNO1IT8WvS4OBCh9n8u
	tgBplg/z+Ts1VuVM/dJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0itT-003uq6-2T;
	Sun, 21 May 2023 13:14:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0itQ-003upH-2V
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 13:14:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7D2F66112F
	for <linux-riscv@lists.infradead.org>; Sun, 21 May 2023 13:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B777C433AF
	for <linux-riscv@lists.infradead.org>; Sun, 21 May 2023 13:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684674874;
	bh=E2d+33UYaa4xhZVYOHR7/gpjS6xOhkMZIKR/3QOHYq0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MXydhgeK9yZJQWwOWNqU/hDiQD2uy+yRHB6jrRlkO39M+qURKbz6yzagC/tj4Hz9Y
	 CTqhWmqXc/3nc9xbNrYlO0IlaC3b0K5wh6GvkWn9EEZodoRZdXw+4HLqT1IylOS9nU
	 IsEm0tA+uD5kSA7oN0l9XhmrN8dgjxk1rjTJ9SQ8FINLvTrdH0ixOB/qInNTZhnfiW
	 kKDDm2PdzYx9dKFHUnV7mVw/aT7nYdvJEw1VeUY9Ahilp+wfeFkgaE+XV0xtENCzIg
	 oKFrgE9eNZb2IQeWPQ/RkBAnFNBwZq8/DieTomnCwXnVVg2p/W1ODhl5bx6LwODqZr
	 24FXAnIomip6w==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-50db91640d3so7814864a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 21 May 2023 06:14:34 -0700 (PDT)
X-Gm-Message-State: AC+VfDyF2TtVZ6iDcm70bb55D9V7y7TEKAGKSxwu/3QKEKNh2unNmv4B
	yd16SliQswLryvx06OMLa7N9aUylQwSmCcUeV+k=
X-Google-Smtp-Source: ACHHUZ6F4bq7gnmXgk4DHliM3eXPYZGZMQeX8BHBoK09/HSSiyrFHatVn1p041ERnshQyyBbeA/rylT/aOEaT2CKw3o=
X-Received: by 2002:a05:6402:148d:b0:504:80d8:a034 with SMTP id
 e13-20020a056402148d00b0050480d8a034mr5465085edv.40.1684674872443; Sun, 21
 May 2023 06:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230518184541.2627-1-jszhang@kernel.org> <20230518184541.2627-2-jszhang@kernel.org>
In-Reply-To: <20230518184541.2627-2-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 21 May 2023 21:14:20 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTx4q1x7rhzWNO6Frw+7ggFGAKzTRpd+TcCv67AoA+xGw@mail.gmail.com>
Message-ID: <CAJF2gTTx4q1x7rhzWNO6Frw+7ggFGAKzTRpd+TcCv67AoA+xGw@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: interrupt-controller: Add T-HEAD's
 TH1520 PLIC
To: Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_061436_860315_149F0417 
X-CRM114-Status: GOOD (  14.32  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Yangtao Li <frank.li@vivo.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

UmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKT24gRnJpLCBNYXkgMTks
IDIwMjMgYXQgMjo1NuKAr0FNIEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4gd3Jv
dGU6Cj4KPiBBZGQgY29tcGF0aWJsZSBzdHJpbmcgZm9yIFQtSEVBRCBUSDE1MjAgcGxpYy4KPgo+
IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiAtLS0K
PiAgLi4uL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlh
bWwgICAgICAgICB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNv
bnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0xLjAuMC55YW1sCj4g
aW5kZXggZjc1NzM2YTA2MWFmLi4wZmE5Yjg2MmU0YTUgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGlj
LTEuMC4wLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50
ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbAo+IEBAIC02NSw2ICs2NSw3
IEBAIHByb3BlcnRpZXM6Cj4gICAgICAgIC0gaXRlbXM6Cj4gICAgICAgICAgICAtIGVudW06Cj4g
ICAgICAgICAgICAgICAgLSBhbGx3aW5uZXIsc3VuMjBpLWQxLXBsaWMKPiArICAgICAgICAgICAg
ICAtIHRoZWFkLHRoMTUyMC1wbGljCj4gICAgICAgICAgICAtIGNvbnN0OiB0aGVhZCxjOTAwLXBs
aWMKPiAgICAgICAgLSBpdGVtczoKPiAgICAgICAgICAgIC0gY29uc3Q6IHNpZml2ZSxwbGljLTEu
MC4wCj4gLS0KPiAyLjQwLjAKPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
