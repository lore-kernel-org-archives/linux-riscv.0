Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E81C54ED0
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 16:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rHpBmFDSw5ExyUPHF8GoDdAz0GiEOGsPwzeAU3DxXI4=; b=GRrMpQ4fK72p3p
	lhG1ijuKbwwKr7L0EJiQBIkMbrDDNm+2/+6Ga80WcgQmUjTxLb9KQVjEwG5obGqgnPGvuKYRbx+Xi
	di8kGOu3XeNajv4YdaFZkV8mG6dtdNTt2m0ajjCRqodrsmCzvPdF2T1yh+agJoUbrnl2uIjTnqAYS
	wbnRKvi6JV4Aum8nHZAPgE1/RcsA65TeUS97kCc7nGntufcQOrO4yySOZPI6rfiB/B34jEV3Alrk2
	hC0XRUQxLOBYvLuO04m83JFGcLRS40TADXfCJn9R9OSX+JAPjt4SXv+1DIgm+R3hZNMnii99K28uN
	EYSfsm8kdxQImIacXYMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVci-00000004SQR-3Kkn;
	Fri, 23 May 2025 16:51:56 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVEj-00000004OtI-1SUP
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 16:27:10 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a367b6ad08so18588f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 09:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748017628; x=1748622428; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ia6puvfZPG5fMJM1ZRtmeD9phh8ksFStnHEcrbqR9QM=;
        b=QLTOrgAWiQK6Yq9F3JabwfTgDju05zqwVHR0RojiSznplt2DXchmrhBJf7IJT90Exp
         o+FW7y+f/i9BHrD8RmFWnXDv6zcCEuvNLE7KKIYebM+TIaqChZ9d6pvfKbfrli1I0ExW
         xiD3HA/PLkflk/ghS7V/nEYpxxNffXO8i17RxB+HIPVvkvlWNwBmix8Rd5FfNaTQzMLX
         tEY+bZzV/msoJMZjQ5szKlo7219f5IOkkeO2jpyYJ2aOGLw4yKyKUWHwyZn3Oq4DVII7
         bzA/rYQhRcdJAYlb3I+uhYwtpCyys53dGBDAZLV+CGwdBX/7+dUxOoapPisz5wIoTVPJ
         007Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748017628; x=1748622428;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ia6puvfZPG5fMJM1ZRtmeD9phh8ksFStnHEcrbqR9QM=;
        b=LNnOZTQp8AiSwicZ/NHAy5Y9gmHGffZGG98syVWFAVgBOa8W1l7/GC0fH7YXBjOaug
         QY50g/AT8Hze648ZSVcoABuLg/IpQ8CWJQY+0SDd0e48z+rVShO6jrKchtUVBUI0dF4+
         6Y73RKbI4WTdvRK0mY3uXVKOW5m/EkTis0aCp5aQt37f6YXGnf/x//FulenEQDSwq0bk
         K9xLIh0e3axTiZflNth6hxiPdEb+esXbQ/jfORb6LGsZd50wZY7I7zkoJJiaCmJj7prF
         ijzfsx+WIjYdjF12vaGpE3Q0n3dQ9VrE9ySF7RUuYgZbNwFvnEzEjHyRtYEKaEZ7Tv4s
         f04Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyaDv7Spy/2MmNoE6hRlytCPC5iafcdaC/5PzSu8SXBxG329jov/0QonwZeNcQ7+9LH8TV8QJKVZyt5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTPThgWa1T/W4s7pbmB7dUEre5hA/Lf1Obtbs61OjKZAYmaW7l
	C8t+I7lUXcvxQMoeLC9LlVLuZk9IHJyR5UotVJxabakZNb/sKHHWreU5Tk6mOP6PVjQ=
X-Gm-Gg: ASbGncsy5vJisKD1EKD12cWN3vb+Q1MXKrilBjfumHqr6FlZ8mSh0tcQySjsQtCL+WR
	00YxEmrOG/FaKN+0Yeh+CT7+SI2wJEQwcVuLCspV4zYMIfLHwHR2qsVd/pmIMSTg775mTfGVFzk
	XnVrkb6k6XJPdPTeYTdGnR0ktxrNhnPJGzaVyhSqN/xOVYCaQS6dgwpFI4QVWm6sM8OPV2GVSLB
	eAXU5t9qpgbBAIQJZrTGxkG9S0La69aSgrci+HCNX9u+b7+akSwcITLUdAXYPJRuKy5TvuRBn/v
	fL3Fpvdg5B8jz2kgQ/UTJoAFnNe7zwhXYAKL1bAvtvLG7RpyDQl1/Cr+hESPyJ1b6ZgzTg==
X-Google-Smtp-Source: AGHT+IGu5SqOXXJDnZhsvGxzP9Q90JnNNFmT1bVPxtvjIRaUq9pqy0zhm7LZZhwBJv3AkH7nFc+56w==
X-Received: by 2002:a05:6000:230e:b0:3a4:bafb:adaa with SMTP id ffacd0b85a97d-3a4c2b3b3d4mr1273822f8f.3.1748017627898;
        Fri, 23 May 2025 09:27:07 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:be84:d9ad:e5e6:f60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a368250dbbsm22377027f8f.47.2025.05.23.09.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:27:07 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 23 May 2025 18:27:07 +0200
Message-Id: <DA3OJ7WWUGLT.35AVP0QQDJRZV@ventanamicro.com>
Subject: Re: [PATCH v8 13/14] RISC-V: KVM: add support for FWFT SBI
 extension
Cc: "Samuel Holland" <samuel.holland@sifive.com>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Deepak Gupta" <debug@rivosinc.com>, "Charlie
 Jenkins" <charlie@rivosinc.com>, "Atish Patra" <atishp@rivosinc.com>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Anup Patel" <anup@brainfault.org>, "Atish Patra"
 <atishp@atishpatra.org>, "Shuah Khan" <shuah@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-kselftest@vger.kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-14-cleger@rivosinc.com>
 <DA3K95ZYJ52S.1K6O3LN6WEI0N@ventanamicro.com>
 <9f9e2869-725d-4590-887a-9b0ef091472e@rivosinc.com>
In-Reply-To: <9f9e2869-725d-4590-887a-9b0ef091472e@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_092709_385822_0140CA97 
X-CRM114-Status: GOOD (  12.83  )
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

MjAyNS0wNS0yM1QxNzoyOTo0OSswMjowMCwgQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPjoKPiBPbiAyMy8wNS8yMDI1IDE1OjA1LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+
IDIwMjUtMDUtMjNUMTI6MTk6MzArMDI6MDAsIENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9z
aW5jLmNvbT46Cj4+PiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKPj4+ICtz
dGF0aWMgY29uc3QgZW51bSBzYmlfZndmdF9mZWF0dXJlX3Qga3ZtX2Z3ZnRfZGVmaW5lZF9mZWF0
dXJlc1tdID0gewo+Pj4gKwlTQklfRldGVF9NSVNBTElHTkVEX0VYQ19ERUxFRywKPj4+ICsJU0JJ
X0ZXRlRfTEFORElOR19QQUQsCj4+PiArCVNCSV9GV0ZUX1NIQURPV19TVEFDSywKPj4+ICsJU0JJ
X0ZXRlRfRE9VQkxFX1RSQVAsCj4+PiArCVNCSV9GV0ZUX1BURV9BRF9IV19VUERBVElORywKPj4+
ICsJU0JJX0ZXRlRfUE9JTlRFUl9NQVNLSU5HX1BNTEVOLAo+Pj4gK307Cj4+IAo+PiBIb3cgd2ls
bCB1c2Vyc3BhY2UgY29udHJvbCB3aGljaCBzdWJzZXQgb2YgdGhlc2UgZmVhdHVyZXMgaXMgYWxs
b3dlZCBpbgo+PiB0aGUgZ3Vlc3Q/Cj4+IAo+PiAoV2UgY2FuIHJldXNlIHRoZSBLVk0gU0JJIGV4
dGVuc2lvbiBpbnRlcmZhY2UgaWYgd2UgZG9uJ3Qgd2FudCB0byBhZGQgYQo+PiAgRldGVCBzcGVj
aWZpYyBPTkVfUkVHLikKPgo+IEhpIFJhZGltLAo+Cj4gSSBkaWRuJ3QgbG9va2VkIGF0IHRoYXQg
cGFydC4gQnV0IG1vc3QgbGlrZWx5IHVzaW5nIHRoZSBrdm0gb25lIHJlZwo+IGludGVyZmFjZSBz
ZWVtcyBvayBsaWtlIHdoYXQgaXMgZG9uZSBmb3IgU1RBID8gV2UgY291bGQgaGF2ZSBwZXIgZmVh
dHVyZQo+IG92ZXJyaWRlIHdpdGggb25lIHJlZyBwZXIgZmVhdHVyZS4KClNvdW5kcyBmaW5lLgoK
PiBJcyB0aGlzIHNvbWV0aGluZyBibG9ja2luZyB0aG91Z2ggPyBXZSdkIGxpa2UgdG8gbWVyZ2Ug
RldGVCBvbmNlIFNCSSAzLjAKPiBpcyByYXRpZmllZCBzbyB0aGF0IHdvdWxkIGJlIG5pY2Ugbm90
IGRlbGF5aW5nIGl0IHRvbyBtdWNoLiBJJ2xsIHRha2UgYQo+IGxvb2sgYXQgaXQgdG8gc2VlIGlm
IGl0IGlzbid0IHRvbyBsb25nIHRvIGltcGxlbWVudC4KCk5vdCBibG9ja2luZywgYnV0IEkgd291
bGQgYXQgbGVhc3QgZGVmYXVsdCBGV0ZUIHRvIGRpc2FibGVkLCBiZWNhdXNlCmN1cnJlbnQgdXNl
cnNwYWNlIGNhbm5vdCBoYW5kbGUgWzE0LzE0XS4gIChXZWxsLi4uIHNhdmUvcmVzdG9yZSB3YXMK
cHJvYmFibHkgYnJva2VuIGV2ZW4gYmVmb3JlLCBidXQgbGV0J3MgdHJ5IHRvIG5vdCBtYWtlIGl0
IHdvcnNlLiA6XSkKClRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
