Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE60CED25B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 03:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lP1D9ioIlVcSWVWmgpBKsWAzfTUUMQ2/51Mjn+xvJoA=; b=psUioeNnIsi1fq
	owwgOhoidyhUSZC9zVoO6n28kLKrpwW08LPmeTXF9LLmUO7jd9oFa5JS9z3aN0g7uUms1FZ5LfkWv
	PFwPFEM8uNY8+7l/D/9lnwchisrxYj9EwUnikDMoRfII29jtJ56Zl0jEaXFk8vJaJNDfHgT30dCiC
	J6fykQv+mvl2pWy8XgA9OsHdH5h50fxCVvw1T6Ny+LKa6yh0VNWL50vRTIuj8JBTqNMjGYUry+goa
	0+V5n8XuVwbH9xUAoorF41r2QkdNWcy2m9Ak3SAFxd+/LnPsOMcqlDAImaVr0ZW7YjfvGW0rTf3tz
	fWaKwr/on5NAaA8akGsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy0Vd-00000004Lxl-37dM;
	Tue, 08 Oct 2024 03:03:37 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy0Va-00000004LxM-1JNY
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 03:03:35 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3e163e2a9fdso2968939b6e.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2024 20:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728356613; x=1728961413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OPCUUbWzHp8NM5YoGoqd/0bpMAXMv05kAUGjmLeDaoY=;
        b=bahAQlwLYA2nkKPORZNczQL7FxVbyqpGmZnYQoYAGBmL6cA+l+HBtSYlrIlEux+ufI
         Go+Lzust/eCXV5odma9YurJp3eQEqBzIKVC8PAIOyeTO6ylLdZyeL6o5pfNvuHbVSAZv
         namwGwxIHNmq1oHbRD1nS6OcA1brHrtMFzrs3tBXMDXvoZVDBOuhWH+7HXXIUYxeFC2h
         m1nB4UfMueEG5I6hxjY0r6NJmjmWqtUyNI4Ty7nmrjqZmzwt28ahH14p90D9qZqlCG+8
         mijJE6INMXp3zYvPo0s12j5nRcPcQ7xNWvNSjHRd5wD1fMWgW18hM36nusLWrbMxkEv9
         JgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728356613; x=1728961413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OPCUUbWzHp8NM5YoGoqd/0bpMAXMv05kAUGjmLeDaoY=;
        b=Yt+3bbeTqZSHIt3wk+8Al547qp1rIEJq5GXhu6Gson7pKVunb1Cz6TezAOpkhr3axz
         paZSO0u20z7MpEVuHPobtdUBG+eyzpSiAJlcgJZKJvvioIECxBwZSMCz+WqmRzwFJ4dM
         xC2yEERvWdHCaVp8cex9jn8vG/K/Lj2VS2gAPivOwqc/lw2kpaI731XbIyYiumxHqsTv
         yT5WYhADd9H5HMVjkK8DZU7rR+KefkWidOlI2Ef5txSJ7Gn2u+1zndeepTV5Ewl2TLoD
         aH997RbAbI0brDTJiS3u8mVLQiU76wIc/FiyS0kS6K7klAnHnVmypYByPKITivQnTFfI
         Zzkw==
X-Forwarded-Encrypted: i=1; AJvYcCXAMtPvM2kgmbdVVvE8JUs2Vg8yUCoOig+5Co9ZXpEiFEKu+p/gxjcKOdgdlXckUN4UNp1SquiH/+3ZKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZCrDr8DmM1rgQzfAcfCShfR6PMsPJ9uSxY6AXRP8l6SnpfRmr
	v23P6eyY1qj/eTpaQiNKyqQ01w/FSBNly4ipeAskPXn6f45hX0UWsvAf2S1e
X-Google-Smtp-Source: AGHT+IGWVTgoyLRP9RgqssySKhVHhNUcveZm74CAJE7t6Iy+N3hyk4eppTUua9qNSKLjYjXO6Aoh1w==
X-Received: by 2002:a05:6808:1b8c:b0:3e2:a1fe:f0c6 with SMTP id 5614622812f47-3e3c131703bmr12102671b6e.6.1728356612835;
        Mon, 07 Oct 2024 20:03:32 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e3c9013386sm1782749b6e.13.2024.10.07.20.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 20:03:32 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com
Subject: [PATCH v3 0/3] pwm: Add pwm driver for Sophgo SG2042
Date: Tue,  8 Oct 2024 11:03:24 +0800
Message-Id: <cover.1728355974.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_200334_378713_CF80B492 
X-CRM114-Status: GOOD (  12.26  )
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

RnJvbTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+CgpBZGQgZHJpdmVyIGZv
ciBwd20gY29udHJvbGxlciBvZiBTb3BoZ28gU0cyMDQyIFNvQy4KClRoYW5rcywKQ2hlbgoKLS0t
CgpDaGFuZ2VzIGluIHYzOgogIFRoZSBwYXRjaCBzZXJpZXMgaXMgYmFzZWQgb24gdjYuMTItcmMx
LiAKCiAgQWRkIHBhdGNoICMzIGZvciBkdHMgcGFydCBjaGFuZ2UuCgpDaGFuZ2VzIGluIHYyOgoK
ICBUaGUgcGF0Y2ggc2VyaWVzIGlzIGJhc2VkIG9uIHY2LjExLXJjNi4gWW91IGNhbiBzaW1wbHkg
cmV2aWV3IG9yIHRlc3QgdGhlCiAgcGF0Y2hlcyBhdCB0aGUgbGluayBbMl0uCgogIEZpeGVkIGZv
bGxvd2luZyBpc3N1ZXMgYXMgcGVyIGNvbW1lbnRzIGZyb20gWWl4dW4gTGFuLCBLcnp5c3p0b2Yg
S296bG93c2tpCiAgYW5kIFV3ZSBLbGVpbmUtS8O2bmlnLCB0aGFua3MuCgogIC0gU29tZSBtaW5v
ciBpc3N1ZXMgaW4gZHQtYmluZGluZ3MuCiAgLSBkcml2ZXIgaXNzdWVzLCB1c2UgbWFjcm9zIHdp
dGggbmFtZSBwcmVmaXggZm9yIHJlZ2lzdGVycyBhY2Nlc3M7IGFkZAogICAgbGltaXRhdGlvbnMg
Y29tbWVudHM7IGZpeGVkIHBvdGVudGlhbCBjYWxjdWxhdGlvbiBvdmVyZmxvdyBwcm9ibGVtOwog
ICAgYWRkIC5nZXRfc3RhdGUoKSBjYWxsYmFjayBhbmQgb3RoZXIgbWlzY2VsbGFuZW91cyBjb2Rl
IGltcHJvdmVtZW50cy4KCkNoYW5nZXMgaW4gdjE6CiAgVGhlIHBhdGNoIHNlcmllcyBpcyBiYXNl
ZCBvbiB2Ni4xMS1yYzYuIFlvdSBjYW4gc2ltcGx5IHJldmlldyBvciB0ZXN0IHRoZQogIHBhdGNo
ZXMgYXQgdGhlIGxpbmsgWzFdLgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cmlzY3YvY292ZXIuMTcyNTUzNjg3MC5naXQudW5pY29ybl93YW5nQG91dGxvb2suY29tLyBbMV0K
TGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvY292ZXIuMTcyNTkzMTc5
Ni5naXQudW5pY29ybl93YW5nQG91dGxvb2suY29tLyBbMl0KLS0tCgpDaGVuIFdhbmcgKDMpOgog
IGR0LWJpbmRpbmdzOiBwd206IHNvcGhnbzogYWRkIFBXTSBjb250cm9sbGVyIGZvciBTRzIwNDIK
ICBwd206IHNvcGhnbzogYWRkIGRyaXZlciBmb3IgU29waGdvIFNHMjA0MiBQV00KICByaXNjdjog
c29waGdvOiBkdHM6IGFkZCBwd20gY29udHJvbGxlciBmb3IgU0cyMDQyIFNvQwoKIC4uLi9iaW5k
aW5ncy9wd20vc29waGdvLHNnMjA0Mi1wd20ueWFtbCAgICAgICB8ICA1MSArKysrKwogYXJjaC9y
aXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLmR0c2kgICAgICAgIHwgICA4ICsKIGRyaXZlcnMv
cHdtL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMCArCiBkcml2ZXJzL3B3
bS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9wd20v
cHdtLXNvcGhnby1zZzIwNDIuYyAgICAgICAgICAgICAgIHwgMTgwICsrKysrKysrKysrKysrKysr
KwogNSBmaWxlcyBjaGFuZ2VkLCAyNTAgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vc29waGdvLHNnMjA0Mi1wd20u
eWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcHdtL3B3bS1zb3BoZ28tc2cyMDQyLmMK
CgpiYXNlLWNvbW1pdDogOTg1MmQ4NWVjOWQ0OTJlYmVmNTZkYzVmMjI5NDE2YzkyNTc1OGVkYwot
LSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
