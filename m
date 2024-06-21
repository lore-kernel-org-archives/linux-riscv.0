Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCAAC27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 16:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30BBknAd4RimPILGmv2PJHWbF1HmN41jkzYXRBiNZKE=; b=pVTKQQAfgu23Z5
	TlssNrJuz8zJpjaW7phyrcZ1gNO+ZyJUpzhpY3+t4rkLZcLT8jZ7nnSNMeN1DeHeh1XxN9gkRjMWM
	rDt6lB77ewUvGYEGNWlDU4qSGGU+TUgFZqPHLMxtWdDjJrYT9xEt5UOzwdwRgaDEsMivyb0pIyLXo
	XUIQhUtnffU0LDEDAbF2ACsMexS9WhtAzoIeEnIun6Olo/IGF2L8B97XAt8WJ2rHsRkB6uvyKepCg
	/8QPQPKO2Nh8x0kG4ksf5+ULsAa3J+hDRRpQ2tkGyDMGYtMj4aDUsen/Dt2aNdlp70cIKigXqiRZ/
	6gY0EkHEkCStjiQd1tqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKgvz-00000009sc3-2NlI;
	Fri, 21 Jun 2024 16:16:19 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKgvx-00000009sbS-1i9w
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 16:16:19 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-57d1d45ba34so2480779a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 09:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718986576; x=1719591376; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18fpC2mmrMKTv3oRpms3UjeHVx+1bFxG7wEgjdV3K9c=;
        b=TrZiUYtUbxdGHQ3vTUuPVNhHP19IBBmnDlPv/YJmxSzqsvuAQYTEFUu60oHR4OnSQg
         yMY1TJeodHhBIM/ijful4v2RJcmacfLZzpdJNFUlR0w0DWFRcrEOhOFPHt7bEuSZi676
         OaQMnj6Uuf/jgcBDKSVvi2jfNY7gZI5shRX81m9BTW1GKmouQzIooruaWgkHf2Xl2xU5
         Ov+85jAqNLAR15qL9BPXDAaVgwmYa8LUcQf51Phf52D9PpcDDRX7I85C7n8ZnYkmipUT
         TTLRy+hA9PuaDPgZlFV7wWanYaBtZMOFvp2A0K18c+39ACVZuol5r1CubfcUoi6eWclO
         UTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718986576; x=1719591376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18fpC2mmrMKTv3oRpms3UjeHVx+1bFxG7wEgjdV3K9c=;
        b=sFPCwQc7O0Xg44sjCsiHoDFrh/GfT0clkNirxXX7GA3bwe2UQJ3qInVaBpEI2E9HYJ
         b7NZlQLSUQzVqlQ/LIJeSRErnogdj2ljnf3gT5uX6f/zowIhuzv4NXalX+H22Asfy9Ee
         xdTUnLDll50Hk/GwvOdoCtMdpufCDjN1e99hkPRb4I6Bi594TcnY0iO476AavDhMyZqT
         W1YArvee7CGiMRSIkRiwDOKZ+Xn2/S2e8sFzb+cxezR2k9FNKwrt6fVzsJPkNouA2MEH
         6vGYg6LxJdluMS+F+6baZPMhKF1RD9yjxi+TInXVHHnY3TIdk9gTtKtIk77mDMjc25zj
         EkTw==
X-Forwarded-Encrypted: i=1; AJvYcCXg5PpvQUvPJofS7gJuwdayI9EYmayiWILNMz9ZlITHDvthguc8hYYszPGDklv5B8QJe01gCuDjWfsur+xmN4wkf5d8e3gknp+Hsj7hxn3H
X-Gm-Message-State: AOJu0Yx+QBlxDvfjKk8Zo0DdICgnR8G4zUcL2Z5kqR3k7CBEVGyNoYKb
	MKE5yh7/WMgX9ffECuCrJNMclPZtV1+LwzTcIgpgZOZTgmdjaH22dZFd68ybq4wbKLO9QvU8uGU
	A1/I6iisBqs5cdSOqFJPUBCVWjF389ApByknrKg==
X-Google-Smtp-Source: AGHT+IHUgpELxXazT/rgMogScDnz0wJSG9MkwGNjNTPk3PQKUHC2IJ5DGZyMy+SWWoBd56/L9PJpn18HsbcbTyMo0Nw=
X-Received: by 2002:a17:907:c70d:b0:a6f:1045:d5e2 with SMTP id
 a640c23a62f3a-a6fab60b27amr565324066b.4.1718986575632; Fri, 21 Jun 2024
 09:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240621113143.35827-1-cuiyunhui@bytedance.com>
In-Reply-To: <20240621113143.35827-1-cuiyunhui@bytedance.com>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 21 Jun 2024 09:15:39 -0700
Message-ID: <CALs-HsuhtoBk2x-u5mqiEFsFTGO-_U1K0UC+Te5tZrH=gjY6Vw@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Provide the frequency of time CSR via hwprobe
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, cleger@rivosinc.com, conor.dooley@microchip.com, 
	costa.shul@redhat.com, andy.chiu@sifive.com, samitolvanen@google.com, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_091617_631243_B2E49547 
X-CRM114-Status: UNSURE (   6.99  )
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

T24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgNDozMeKAr0FNIFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBi
eXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IEZyb206IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2
b3NpbmMuY29tPgo+Cj4gQSBoYW5kZnVsIG9mIHVzZXItdmlzaWJsZSBiZWhhdmlvciBpcyBiYXNl
ZCBvbiB0aGUgZnJlcXVlbmN5IG9mIHRoZQo+IHRpbWUgQ1NSLgo+Cj4gU2lnbmVkLW9mZi1ieTog
UGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWXVu
aHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+CgpSZXZpZXdlZC1ieTogRXZhbiBHcmVl
biA8ZXZhbkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
