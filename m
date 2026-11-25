Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5201606A336
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 23:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kFksaUWF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPjrtGpB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=64mbAzVY7huXyPgu9FgnOYcyCVuNx5xJodR9OpdlKwE=; b=kFksaUWF07IRKk3rlB3t/++Jt9
	lRFre/TFFKBcsfIxbVrhVaEA8sCQ/B6XCGUvFXRIJOGSb3htMQwKKU85TnRgqoCUKihV/vImEuyFu
	TCOcZ7rsOcdHq07USl7DHEiHCw1+gvSlHoKHselHrayqyZ4DWXemjNa9Zy+k0Y6/MZNHpYdZSbu4+
	4dy0U/o+LQnh/SgWzuivcOS9lnKXUjfdeJAs1mMd8Dvol35MP00JYmlBcORJrld++QvEJtYETjNt2
	UoPCb99o3WM9xoTdMOVSpDAKXi92uylU2iF9gIvHpcJ8Vj0yAZFJeF4/8QKOUJY5KrItT9cy3ShCK
	x42b/t4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMT4-0000000BZYV-1SAw;
	Wed, 25 Nov 2026 23:32:02 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMSy-0000000BZQD-0qlM
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 23:32:01 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bba5e17cbeso12067535e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 15:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649514; x=1796254314; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Np0anZjG5hAkQgXnIrOs9QHgsmNIFocrZSI/L4oANeE=;
        b=BPjrtGpBLuQNuCRhV5Nl9OUms/GAfUNWwLsg/4gabs1Qp3EcGlzraq/oaUbSHxbYpf
         FRdm4v/MouEXJBeDCHABNxApeNqjEKTaF/m/sCvRGsPc1uEbYDeLTEDmjLYa+tRH7Rkd
         6Uu4ReUdcqcBMAALbY21ubDigs/6qAwcO7ikekQpsr5DoHcXfcsXQ/0uxJOQfTuSUax2
         SNDDF0Xto/RwDk4ioiz0WMezWazRp5LKdX5ZxIVjTK8VUQOzf5ojqkNrLYVRZC4jb+lx
         bYZjZxnQ5f0tuY981MpFS2ss9I1q/LJshh69dW3RIkteqqmAAR60vGz0xo9upo5YgOUZ
         xCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649514; x=1796254314;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Np0anZjG5hAkQgXnIrOs9QHgsmNIFocrZSI/L4oANeE=;
        b=i9kHch1s9fAU/T8ARXdb1EIdnEkqIdkG/LfA8LQ08M6bNyQO3OLk+eGnyk9Yf1lYdt
         Z1Mw4gwNQxA17FG31+GoC5sMb4ohlTBXz17dZfluqOGyugPM67VVzwePY2m8AVkdaE8b
         VK4hEWgOrlc3r/fCZTL+QJiPv1xI+xqbGest0+8jjwp9PMPN5gUTrGiWgiLwX0cVir3m
         3TfIoKwkGJd+EPlXECVlODV10Se8FfYcSCtSCRKpFqvbWw29q69LJfuWkix+gwyE1qWd
         J1nJ7IiIYVZzyQ2C0OmIqfX5iK43ruGhNqP2TXJw9AN2gyxXDn8MA7+aRXtBcsfr4CaF
         ZMDA==
X-Gm-Message-State: APuU4Z/4aAFxvmaW9tmc3YXGUeKpcNLjljcW2KaKF2d5aygt3iLGWuVh
	F3G08e9W3AnWxw2zPyVljvFFoSSRSHRw0UDde6at1bZVk60bEMO7UsaksBs5EXmHws4=
X-Gm-Gg: AZFdTZeoesTJNxYpBmgwrZ0kMK+vGdTS6qZ3V7ujtCnlGXwEWy4McF61ziHEKKcgx3E
	mM6rlRzROzr8sP9hdeo3kGIKrPhhVxJcPYklkgDsvZO3d4HaCUgCYWIkfguAUei1RNg6b2mdFvA
	PovoIlBowWv3eQWz36t7+JuT4vispT/JoGhvTMWyUrKQramlCzKyyfxwR7QFkWfSxry9Vg2ERXS
	zHeZ9aQKAwN2SRhrFha+WeEqvBIXZvYQ67MI6OedZQAs3uJ1TCmAf8LaG3Mf5ae8blQXBwSfyG7
	4DBicFwq5gZr3JxqyyLyydfqcaBJ3Zpw1uf69Amrh/bOtHDLIxV8wA+bX4ZFcWoFTFhSFZUhyam
	9NlHV4EgH0TtiSj4squ/7gk009y40+9/TqDukwQVzRZQAbBgMUOcZ45I7iziQ3V6RuyXaW6wzEF
	EX4xEH6YRhreX1mHVWi7fpOtrfNYcRIwf+7DG0h1rLI5a6T31W0wb8ZGUdECzIcPtQWUITmGZfB
	gjMsWgSPB7Ws2y1sqB38n7FvVAxUi1J6q5b/rfif1YgcZpKqgU6Flntx997KRLuQNLabXbenLQU
	406ZVa+1+ftA4MMDt7HmjEUygEoNcsMM9tBfl4ATm+OJoryMvtBKLBnzXG4Sk1dK2yZjO1ntBkf
	rA+4IMXuJrQ==
X-Received: by 2002:a05:600c:3b88:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4bb8880789dmr443306225e9.13.1795649514424;
        Wed, 25 Nov 2026 15:31:54 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm38324142f8f.11.2026.11.25.15.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:31:54 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH RFC 15/19] riscv: Align init data to the ESP32-P4 PMP granularity
Date: Wed, 25 Nov 2026 23:30:16 +0000
Message-ID: <20261125233020.1380594-16-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_153157_315525_47B1670E 
X-CRM114-Status: GOOD (  10.98  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RVNQMzItUDQgaGFzIGEgUE1QIGdyYW51bGFyaXR5IG9mIDEyOCBieXRlcy4gVGhlIFJJU0MtViBs
aW5rZXIKc2NyaXB0IGNhbiBwbGFjZSBfX2luaXRfZGF0YV9iZWdpbiBhdCBhIHNtYWxsZXIgYWxp
Z25tZW50LCBzbyBhIGJvb3QKc3RhZ2UgdXNpbmcgdGhhdCBzeW1ib2wgdG8gc2VwYXJhdGUgZXhl
Y3V0YWJsZSBjb2RlIGZyb20gd3JpdGFibGUKZGF0YSBjYW5ub3QgYWx3YXlzIGVuY29kZSB0aGUg
Ym91bmRhcnkgZXhhY3RseS4KCkFsaWduIF9faW5pdF9kYXRhX2JlZ2luIHRvIDEyOCBieXRlcyBv
biBFU1AzMi1QNCBzbyBQTVAgY2FuIGFwcGx5CmRpc3RpbmN0IHBlcm1pc3Npb25zIHRvIHRoZSB0
d28gcmVnaW9ucy4KClZlcmlmaWVkIHRoZSBhbGlnbm1lbnQgaW4gYW4gUlYzMiBOT01NVSBrZXJu
ZWwgdGhhdCBib290ZWQgdG8gdGhlClVBUlQgc2hlbGwgb24gYSBXYXZlc2hhcmUgRVNQMzItUDQt
TW9kdWxlLURFVi1LSVQuCgpBSSBhc3Npc3RlZCB3aXRoIHByZXBhcmluZyB0aGUgcGF0Y2ggYW5k
IHZhbGlkYXRpbmcgdGhlCmxpbmtlciBsYXlvdXQuCgpMaW5rOiBodHRwczovL2dpdGh1Yi5jb20v
ZXNwcmVzc2lmL2VzcC1pZGYvYmxvYi9tYXN0ZXIvY29tcG9uZW50cy9zb2MvZXNwMzJwNC9pbmNs
dWRlL3NvYy9zb2NfY2Fwcy5oI0wxOTEKU2lnbmVkLW9mZi1ieTogVsOtdG9yIEh1Z28gU2lsdmEg
PHZpdG9yaGcyMDA4MEBnbWFpbC5jb20+Ci0tLQogYXJjaC9yaXNjdi9rZXJuZWwvdm1saW51eC5s
ZHMuUyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL3ZtbGludXgubGRzLlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC92
bWxpbnV4Lmxkcy5TCmluZGV4IDFmNGY4NDk2OTQxYS4uZTQ0OThhOWZkYzZjIDEwMDY0NAotLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC92bWxpbnV4Lmxkcy5TCisrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L3ZtbGludXgubGRzLlMKQEAgLTc3LDYgKzc3LDEwIEBAIFNFQ1RJT05TCiAjaWZkZWYgQ09ORklH
X0VGSQogCS4gPSBBTElHTihQRUNPRkZfU0VDVElPTl9BTElHTk1FTlQpOwogCV9fcGVjb2ZmX3Rl
eHRfZW5kID0gLjsKKyNlbmRpZgorI2lmZGVmIENPTkZJR19SSVNDVl9FU1AzMlA0X0NMSUMKKwkv
KiBLZWVwIGluaXQgZGF0YSBvdXRzaWRlIHRoZSBsYXN0IGV4ZWN1dGFibGUgUE1QIGdyYW51bGUu
ICovCisJLiA9IEFMSUdOKFNaXzEyOCk7CiAjZW5kaWYKIAkvKiBTdGFydCBvZiBpbml0IGRhdGEg
c2VjdGlvbiAqLwogCV9faW5pdF9kYXRhX2JlZ2luID0gLjsKLS0gCjIuNTYuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
