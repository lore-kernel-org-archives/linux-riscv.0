Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B532EC27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 12:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NddWnHRdGxv0xnZxoCmJzAHC5jdCKPH0o3J2NMAfFng=; b=z2/yo1u6lVSGPV
	uqgN6lZ+YmRQmoaWNsFhgV3d4iwhtNu4lPj8ey2oLMRyWTGJAXtexWkig076QmRstteU/UP6w3IEl
	1Mt1OkqgUrX7IwIIfVGuTfUQfZK2pSrncCdRG9VncosYF4Fog3zAM/yy/bkAcWT6KP5g2QvMpX8Q9
	P5LWQBuhZWndHnEcS1GwjJXv5ioQFHQb+ct+wqpPpS1f9FN6vX4dUb5JTrA+JnCsMu6qnT51idSrb
	NPapq1okDkWuieVzZ2euDC0Pwa4txaKNz3tm9Sn5fx4m1wHffW2x6XYQInsfUsZW8sfWbGU1CN/n6
	oF7oWfptD05+wpxgMR8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKd54-0000000940x-0xGo;
	Fri, 21 Jun 2024 12:09:26 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKd50-000000093zN-2MY8
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 12:09:24 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1f9885d5c04so17319345ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 05:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718971761; x=1719576561; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3bpiTUuQIwX4Xfzvkw+JGfc81Y8IZVkUoMFi4AzcE0=;
        b=QAKa2P84XeuKtmYKXyvffo3cI+6hupFJsfqo2alhZ3YK349jolK05SRRJv32S/79cW
         fKfNTVCRi2s4biE035+ZsxR+Nm1YUCoM6g+paqkQ4jDUiQy9ZB8NEQyOQ7WAlDWiqzYP
         BtIkAtkjMkoZXpd99oQc8ZSyQT7SePx7HYvGqn44pw52hnNCKmTja19g4xzbKU1MXwlf
         rD/NFxIc2JORC37FFf87RKLzZvlrdsY741wYCBK37NZ8Kw3NXeojkdmGiH6711HvKgRP
         WFK/KNLjAFrfHK8jeQcGtaOcbosJQLfsBaMB2eu64Bynv0VujKX25c59CFVjLTgD8tgM
         l6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718971761; x=1719576561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3bpiTUuQIwX4Xfzvkw+JGfc81Y8IZVkUoMFi4AzcE0=;
        b=MGUu5oc5YLNuX723JypcO1YqQLOIGL1o/L9cuZSGdgYN0cqEErA+PLaWcY3za0yJiC
         gE5xWRi1kzp5JaTnEfviFYlVkuYubBpwgysZnzbKZhAV8wIY//kfw7VG+ivQZs6AtiD+
         fTNy6cgv7FW1HLmrsDiXMtTq9LQ52h5BQzZR4g3nmK7PtuJQsrCl7t/fnydas8IVdLs/
         dheZIdpt+Pl2KaogNJfvR/CNmmcmkwRnjgvSb5hQ1S8MvERbuPWSyKwHtJTD/NVsDwXY
         6egNtdkEElHKGFv9wmLnZBZR/9ey2mMtu+yEieUXUItptg1GYk2PhoaetdD3ZGyRSjuB
         jECw==
X-Gm-Message-State: AOJu0Yw4gCFluUtOa01ypTtij+yQhTnK5fJ5DmhdpjA+R87TWQwg0puZ
	6cfV+ezSPx0ZZ1oe5u3nhCUmxVDA6Nh8bYhuNLSgM7efkTRQureqiXixRS3k93GI5zHZKl7zQtK
	vwUR3pLb5+tn+qdPbG4AzUKm+Dop2xWc+CCURYQ==
X-Google-Smtp-Source: AGHT+IE1eWisatE54yPyogUi1nCzHuRa+Ft1MLTrDQNKgWeQZYGbOjZEa5IllYpCxPNjLDMbi3chxWaGYYUSUrI2DBM=
X-Received: by 2002:a17:90a:3044:b0:2c4:fc64:6b81 with SMTP id
 98e67ed59e1d1-2c7b5d52cb7mr8337358a91.31.1718971760877; Fri, 21 Jun 2024
 05:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240621093223.37893-1-luxu.kernel@bytedance.com> <ZnVhIi0Jre77i3RN@andrea>
In-Reply-To: <ZnVhIi0Jre77i3RN@andrea>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Fri, 21 Jun 2024 20:09:10 +0800
Message-ID: <CAPYmKFuS-wJTfZBeVo_AS9PscLC7zSiEDZnRU9NDB5+LYxjNSw@mail.gmail.com>
Subject: Re: [External] Re: [RFC v2 0/2] riscv: Idle thread using Zawrs extension
To: Andrea Parri <parri.andrea@gmail.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, conor.dooley@microchip.com, anup@brainfault.org, 
	atishp@atishpatra.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, christoph.muellner@vrull.eu, heiko@sntech.de, 
	charlie@rivosinc.com, David.Laight@aculab.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_050922_630735_E922E422 
X-CRM114-Status: GOOD (  11.83  )
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

T24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgNzoxN+KAr1BNIEFuZHJlYSBQYXJyaSA8cGFycmkuYW5k
cmVhQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+IFRoaXMgaXMgdGhlIHNlY29uZCB2ZXJzaW9uIG9m
IGlkbGUgdGhyZWFkIGJhc2VkIG9uIFphd3JzIGV4dGVuc2lvbi4gV2UKPiA+IHJlYmFzZWQgb3Vy
IGNvZGUgb24gQW5kcmV3J3MgcGF0Y2ggc2VyaWVzWzFdIHdoaWNoIHByb3ZpZGVzIGJhc2ljCj4g
PiBzdXBwb3J0IGZvciBaYXdycyBhcyB3ZWxsIGFzIG9wdGltaXphdGlvbiBmb3Igc3BpbmxvY2su
Cj4KPiBUaGVyZSdzIHNvbWUgZmVlZGJhY2sgb24gQW5kcmV3J3MgdjIgWzFdIHdoaWNoIHNlZW1z
IHRvIGVxdWFsbHkgYXBwbHkKPiB0byB0aGUgbGF0ZXIsIG1lbnRpb25lZCBzZXJpZXMvc3VibWlz
c2lvbiwgYW5kIGhlbmNlIHRvIHRoZSBzZXJpZXMgaW4KPiBxdWVzdGlvbiAoYWx0aG91Z2ggb25s
eSBpbmRpcmVjdGx5IGFkbWl0dGVkbHkpLgo+Cj4gQXMgYW4gYWRkaXRpb25hbCBjb21tZW50LCBw
bGVhc2UgZG8gYWRkICBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gKHRoZSBMS01MKSB0
byB5b3VyIENjOiAgbGlzdCBvbiBwYXRjaCBzdWJtaXNzaW9uIChhZ2FpbiwgdGhpcyBhcHBsaWVz
Cj4gdG8gYm90aCBBbmRyZXcncyBhbmQgdGhlIHByZXNlbnQgc3VibWlzc2lvbnMpLgo+Cj4gICBB
bmRyZWEKPgo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9aaVdDUDZm
NnpaM2RLWGZOQGFuZHJlYS8KSGkgQW5kcmVhLAoKVGhhbmtzIGEgbG90IGZvciB5b3VyIHJlbWlu
ZGVyLiBJIHdpbGwgY2hlY2sgdGhlIGZlZWRiYWNrIGFuZCBhZGQgdGhpcwplbWFpbCBpbiB0aGUg
bmV4dCBwYXRjaCBzZXJpZXMhCgpYdSBMdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
