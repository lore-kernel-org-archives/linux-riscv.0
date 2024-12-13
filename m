Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA25E7717F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 19:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qj1tY2XM230vobJ3fdTymcFPgBK7sKa/IsVzgerrxc8=; b=p3g1xZBrjwCzNo
	A4URqhrrTX9WaICzm2nk6CGOcc2TKeATlaj5kY4t5uEGz08RzPgtLjlILb3DbW4Mt3Efp1CyzacIs
	cqa/tKkMgK9Trb32umJk+acsZMfUNgAYUl+cRBAup6ctTxWC7cDyI8De88hxPua1diQxn8e/Ie69j
	PGDrEwjgv9VBAZtTsL9UEJ8RmVAPqFwEr15qhjuJuRQjaYlsZZsZgmciJGcSpeGW00tjobxCinTr/
	O+boL1b0XGcIxwYWdhLY1vQy6KU37I9s5+DnxBsmDqoct3IwiB3yb+jj7hn31r1IASvMqoBiwPcIY
	W+TggHWyomkauVYZHtQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBEK-00000004mJY-3Xor;
	Fri, 13 Dec 2024 19:21:40 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBEH-00000004mI4-1VsU
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 19:21:39 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-436345cc17bso3842485e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Dec 2024 11:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734117695; x=1734722495; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zAz8Dn5rlSBhTOtDk4TKpwsoyrlzs7IaDpD+Q91piS8=;
        b=JgZqXwpf8QSjczSZA4pDPw3noHEDZiqcMae+3jx6uZz+bFAP9WJ8iOifR8sK+LK7NR
         iQSFnTNZmFRB9jVem9R0+PxzGOq8sD9Byf6hS8k5x/3cpkFvX9krs39R7UyC4pxXO9f6
         U/tYH/ckXfDemCwXAxiijxHl388a8JLMWT1FnOFpI61AaP8FQ4LQDSboFL/Wa12j7f40
         hSW3bcurkZJd66pVtLgtVjJXEFypLyqNd+rOxv0xCuzaHDwk59T/FUKIqlb2sDxuurH+
         4fFP+Ed3c564gqFavqAWDlhfQ/piwWVd7fIlBZbijXtAuh8ZyCuTMGqt4s0LWtpAXaKA
         r8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734117695; x=1734722495;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zAz8Dn5rlSBhTOtDk4TKpwsoyrlzs7IaDpD+Q91piS8=;
        b=jXbgDMgwHPKDxaEUDD12d515NgWt4EeiJWMJOI5taUDGHUkHx+XWo6XF7BtDcadgTS
         W+aXSRPJgWwmABcOyMQ7xDBjeLrpkniuWCU9BwqlaNlNeO7aW972txA4yuCHiJ6hgg0g
         SlzZp0cUUcI3NLPhgDbDXkutnQh14szTV7XwY/Bh3W5dAlo7vyL7iklS78TcwbEL2a9Y
         zj5rU2BPrQYEyG6kTovS2ddvEhCFf4qiUc0OM/+xLk28xSiAzXY/aSEja74h2CzUlpkk
         7S6NXQfbuNSu6XM2Q0X4KU5b18/ySEf65opoWlUDKsRHTZlDMCwWKnhfbf5zjvuhmLXq
         wNqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0KqpYiH0WedTB/TBcO9I9XIrm09n1ydbBSMVRIZK68GIuo0s/DSVNlqlDVVb/dIVJhKIs+TZXwvnYow==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu9l+rT3yB9KHwhSCxQloNKMygdwjn/EU2733nWYw7HgmN7MIT
	N2/U+ywfwNtMXw3KgDZWgtR7E7jhLdKTsTYZsz3l+F0kypDDOrmccEdm8Lc82vg=
X-Gm-Gg: ASbGncu3TPGTVNt//X05IhW4j03vQfLNa5X+eb3fYBSIK84IaydA3Lgwdo7ukRK7bus
	ghJXXaAbNNxp31k0MTwbn8uMO2RkdIaQJHAppxIBVDrPzIszKsc7lw/94kkGiNQ/ce9/RcwGLzz
	+qW9gG3k8jjrHF2Iat7zTA71vMNNo1upy8NW4xAatQjK++sXVJ8XjgZBs5UhCG1+EWZXt/zuqO/
	jVZSu9h83xg6Fw2ogmwofE2v1miRwYCLHdeiMhIvLu+zw==
X-Google-Smtp-Source: AGHT+IEsztWIjOrHRoOdBex2SrrGXuErwDUmXFDYNPuTLuXjjCKY8ezzeejJ40Z/k+WwQoHC3cHqzw==
X-Received: by 2002:a5d:64ab:0:b0:385:ef8e:a641 with SMTP id ffacd0b85a97d-38880ae0e46mr3455511f8f.28.1734117695302;
        Fri, 13 Dec 2024 11:21:35 -0800 (PST)
Received: from localhost ([152.250.153.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e5044asm1100565ad.130.2024.12.13.11.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 11:21:34 -0800 (PST)
From: "Ricardo B. Marliere" <rbm@suse.com>
Date: Fri, 13 Dec 2024 16:21:29 -0300
Subject: [PATCH v2] riscv: Make sysctl tables const
MIME-Version: 1.0
Message-Id: <20241213-sysctl_const-riscv-v2-1-7a8a499291c7@suse.com>
X-B4-Tracking: v=1; b=H4sIADiJXGcC/32NQQ6CMBBFr0JmbU2ngIgr72GIqW2RSbQ1ndpIC
 He3cgCX7yX//QXYRXIMp2qB6DIxBV9A7Sowk/Z3J8gWBiVVg0q2gmc26XE1wXMSkdhkcdN9ba2
 VHbYHKMNXdCN9tuhlKDwRpxDn7SPjz/7NZRQoZKNqNLrX3XE885vd3oQnDOu6fgFogRuPswAAA
 A==
X-Change-ID: 20241205-sysctl_const-riscv-ba93ddd07156
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2048; i=rbm@suse.com;
 h=from:subject:message-id; bh=BcaoR0lBJqGjTkLYaCtP20EXrB05RDdYL0aWjOuP9Qs=;
 b=owEBbQKS/ZANAwAIAckLinxjhlimAcsmYgBnXIk8dbgek6IiE4WI/Tw/mNYdnblYgLMhKtMsZ
 tzGzqhGUVqJAjMEAAEIAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZ1yJPAAKCRDJC4p8Y4ZY
 plTxEACe4IQ3gp2o7dtJVI65A9ab3pSeQ1X+Nxh1mQZ5qNt0fsRqP3jQdSjm4KDEKjFCoywT17H
 wb/OZ7+fqmAy3hc+42+JNF6sbklbrkwrm+dCNoTnQXMDSHrCpqOnNtgGvV1QxbDtHbo49Q9mZQQ
 QjcOR/nwB7OwUqdav9CtmI+jlemwCW8c6QzS7ERblEpRzXGf7bnESGlInFIQPx/MUCl5xs9zmmi
 poXylmZ3ZVJv9CjlcyqWoXS/eOWSSIG/WtrtUAZKjCLXJB+/vtgH7dawCekR/X8vGUkH9LSg5lc
 tdxPqF+zGVIMzvJGXbsFU2n6pURNkWoP3K0jySRBmdpngAqknfRYjP7WGHws2qrYvGuNGb9xeev
 X2vE7jpI6TLoAmZ3fGOXqEfT8NwouP8myPAFdlt5zbpX2PIKconGrk7yO/t4ieyL76oul7Y6WJR
 UvdzjafH0MQq4QwskCjopejIkADD5X5Qg3clHzvqW9vyugAdqU4URkffbCJDhYnS84CQz//parx
 sW1LVVpyK+PBvSnPM/IES5WacDk+PncytEr0RIrQ8uAMOmTWWclt0nLEvIKMN08YtYSp/bUsM52
 vOLK8zoTJuLsvPEi0xUvNnBdsh5cwgbiHEMJpCSMAj4mIJXYIfFFxVzr6bvxbHPh52uE6qTqKWa
 5xts8I6GVeRnwuQ==
X-Developer-Key: i=rbm@suse.com; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_112138_227844_811D1326 
X-CRM114-Status: GOOD (  10.26  )
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

U2luY2UgY29tbWl0IDdhYmM5YjUzYmQ1MSAoInN5c2N0bDogYWxsb3cgcmVnaXN0cmF0aW9uIG9m
IGNvbnN0IHN0cnVjdApjdGxfdGFibGUiKSwgdGhlIHN5c2N0bCByZWdpc3RyYXRpb24gQVBJIGFs
bG93cyBmb3Igc3RydWN0IGN0bF90YWJsZSB0byBiZQppbiByZWFkLW9ubHkgbWVtb3J5LiBNb3Zl
IHRhZ2dlZF9hZGRyX3N5c2N0bF90YWJsZSBhbmQKcmlzY3Zfdl9kZWZhdWx0X3ZzdGF0ZV90YWJs
ZSB0byBiZSBkZWNsYXJlZCBhdCBidWlsZCB0aW1lLCBpbnN0ZWFkIG9mCmhhdmluZyB0byBiZSBk
eW5hbWljYWxseSBhbGxvY2F0ZWQgYXQgYm9vdCB0aW1lLgoKQ2M6IFRob21hcyBXZWnDn3NjaHVo
IDxsaW51eEB3ZWlzc3NjaHVoLm5ldD4KU3VnZ2VzdGVkLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8
bGludXhAd2Vpc3NzY2h1aC5uZXQ+ClNpZ25lZC1vZmYtYnk6IFJpY2FyZG8gQi4gTWFybGllcmUg
PHJibUBzdXNlLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gQmV0dGVyIGNvbW1pdCBtZXNzYWdl
Ci0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTIwNS1zeXNjdGxf
Y29uc3QtcmlzY3YtdjEtMS0wNDIzMWNhOWE3OGZAc3VzZS5jb20KLS0tCiBhcmNoL3Jpc2N2L2tl
cm5lbC9wcm9jZXNzLmMgfCAyICstCiBhcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYyAgfCAyICst
CiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9w
cm9jZXNzLmMKaW5kZXggNThiNjQ4MmMyYmY2NjJiZjUyMjRjYTUwYzhlMjFhNjg3NjBhNmI0MS4u
Nzg5MTI5NGFiZjQ5MzdkZTNjN2U0NDA1NzM4NDQyNTNlODU2YjM5ZiAxMDA2NDQKLS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3Mu
YwpAQCAtMzY0LDcgKzM2NCw3IEBAIHN0YXRpYyBib29sIHRyeV90b19zZXRfcG1tKHVuc2lnbmVk
IGxvbmcgdmFsdWUpCiAgKiBkaXNhYmxlIGl0IGZvciB0YXNrcyB0aGF0IGFscmVhZHkgb3B0ZWQg
aW4gdG8gdGhlIHJlbGF4ZWQgQUJJLgogICovCiAKLXN0YXRpYyBzdHJ1Y3QgY3RsX3RhYmxlIHRh
Z2dlZF9hZGRyX3N5c2N0bF90YWJsZVtdID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBjdGxfdGFi
bGUgdGFnZ2VkX2FkZHJfc3lzY3RsX3RhYmxlW10gPSB7CiAJewogCQkucHJvY25hbWUJPSAidGFn
Z2VkX2FkZHJfZGlzYWJsZWQiLAogCQkubW9kZQkJPSAwNjQ0LApkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvdmVjdG9yLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwppbmRleCA4
MjE4MTg4ODZmYWIwNmFhMDU0ZTJiYTMyNjY4OTdlOWI0ZDE2MWMwLi5kMDIyYjAyOGFjM2ZmNTM3
NWY1MjI5NDdkMzQxNjYyNjZjZWI0MjRhIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92
ZWN0b3IuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwpAQCAtMjg3LDcgKzI4Nyw3
IEBAIGxvbmcgcmlzY3Zfdl92c3RhdGVfY3RybF9zZXRfY3VycmVudCh1bnNpZ25lZCBsb25nIGFy
ZykKIAogI2lmZGVmIENPTkZJR19TWVNDVEwKIAotc3RhdGljIHN0cnVjdCBjdGxfdGFibGUgcmlz
Y3Zfdl9kZWZhdWx0X3ZzdGF0ZV90YWJsZVtdID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBjdGxf
dGFibGUgcmlzY3Zfdl9kZWZhdWx0X3ZzdGF0ZV90YWJsZVtdID0gewogCXsKIAkJLnByb2NuYW1l
CT0gInJpc2N2X3ZfZGVmYXVsdF9hbGxvdyIsCiAJCS5kYXRhCQk9ICZyaXNjdl92X2ltcGxpY2l0
X3VhY2MsCgotLS0KYmFzZS1jb21taXQ6IGZhYzA0ZWZjNWM3OTNkY2NiZDA3ZTJkNTlhZjlmOTBi
N2ZjMGRjYTQKY2hhbmdlLWlkOiAyMDI0MTIwNS1zeXNjdGxfY29uc3QtcmlzY3YtYmE5M2RkZDA3
MTU2CgpCZXN0IHJlZ2FyZHMsCi0tIApSaWNhcmRvIEIuIE1hcmxpZXJlIDxyYm1Ac3VzZS5jb20+
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
