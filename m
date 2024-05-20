Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B7CC25B77
	for <linux-riscv@archiver.kernel.org>; Mon, 20 May 2024 22:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SHVSKlD8ix5fP70JmkIjXqGWTlOFjWtve6N3KGOps/c=; b=h6i9ui9CPDL3Yi
	ZcDW8xPjEGneI3D/ZUEm55PC8Nr2pEtkupTVj7FCTJsM/dd1vmpJ2ryrVBRCwrFcnZQXnXtgAocIr
	M7IJm2ChEOa6yMumi0pGQeDrtevWTGtuERpFMWcKK1Ai4rNxwgxFS0RTpajXAGKqgWBGaOl5V5j64
	Y/7IJjwx/P8vc0EYqcNFV7aLCSGko6fXzA29G/7YZgWspiVRMVcxEoPZbpuTEq3MNSpqYcWwSTqUv
	R/Td28lQ/HCtYKVylsSzGlhqRtjoXmOY4p1ngtVT+rSfp6t9s1W4rBbFs2DoYzzVBSq6lJoLxSakS
	YyD13oS4/pZSZHDN4CXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9BZg-0000000FgHz-275q;
	Mon, 20 May 2024 22:33:44 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9BZc-0000000FgH6-1mMD
	for linux-riscv@lists.infradead.org;
	Mon, 20 May 2024 22:33:43 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5241b49c0daso2470846e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 May 2024 15:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716244415; x=1716849215; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NYo/N7BXec44ICtyrYVBTW0BcviRclt5lLRqjmbMHMU=;
        b=wJPV3K+ml/ii2UAuOezWj2An8YAXwy/wYi8o4fydjw1SLpdfKz3t3JOHFoqIJ44/b3
         V7QSi+dKNe43KqlwEtMhE+mU3y5aY+fxHR5sdYQ0Ibsj6j66BH3tHSpGeDMmpJRqfyVA
         uro9Be3+qBtsRAPelCV3swLzVsPHopc+tjhW1k46JIvM9cTWbN4JTzTnOavhS7kxRG0v
         AsJMZwlvrQd6Ca2fYKAu1+1WuHnne7JPYUECegNWT/J9mHOELu9G1q/u+WlfNaNBwWd1
         0nccZNsDxWjUSin9XKtPJqjJbJVpQFrrcbAH8G583mVMc7p6ptt4BaECMrl4mWo24kkm
         91oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716244416; x=1716849216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYo/N7BXec44ICtyrYVBTW0BcviRclt5lLRqjmbMHMU=;
        b=hu0pvdpn5Tetkdq8tKksk7ybQtQz1bYZ22JR/KBHwqmXAQaqnLHf5scvVa/svG3hnq
         FXp6H4xf9zQwZ/ynJfAH9gHOvc6H6b2/XyeC76EW3H6cwgQO8aDR0dKHEEv6BXv6Myxt
         v7DgrCFcxKVyXGETQDLgc/athpkqthAfaWH/E5WGcXm7QM5Yg7bbSirB6KcP3BM2Hbtg
         c90HsZCS6BkHT0+l5gy5k2bxUEuPedMetsoAryllYE19bSH7lIpWxTZ/j9H+ixco2Ya0
         Ay4jIlvnclwj1vGVQpEVqIYuhf+WO4Jkj4Xf5fGmrH0YoS/iRSqrsZh01XoJyjXiTN2R
         rXzg==
X-Gm-Message-State: AOJu0Yw595sDZINa1PU8QD2iNd5CnYveQSpt1CsM8O0qipuHmFYto8SP
	axjq9DCtX7annNO56lL3bzk/8ekCzm9xLnavqwE33ZQqHzgaK5us15zpD+YZScx49DrLpX7g/Zw
	UCDbh6SsXZ6ducTFDniVVmref5hKAkRnDxPGnyp+Tn0n0ur4a5iM=
X-Google-Smtp-Source: AGHT+IEmg9128M+eN0m3kGRQymnVHm1GcalzmPl2RQ72iRv7vCX4Uq/ZuSz/Y8IItLGvMwP7hPMh6SKsdg4hlDqGOnc=
X-Received: by 2002:ac2:5979:0:b0:519:8963:c678 with SMTP id
 2adb3069b0e04-5220fc794b5mr17825488e87.23.1716244415690; Mon, 20 May 2024
 15:33:35 -0700 (PDT)
MIME-Version: 1.0
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 20 May 2024 15:33:25 -0700
Message-ID: <CAHBxVyEaCFt+bC=bwO54n30urANy+DaffOBk2odpqjpbBgOPKQ@mail.gmail.com>
Subject: RISC - V Microconference CFP 2024 CFP
To: linux-riscv <linux-riscv@lists.infradead.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_153340_621757_D4FB5815 
X-CRM114-Status: UNSURE (   3.36  )
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

VGhlIENhbGwgZm9yIFByb3Bvc2FscyAoQ0ZQKSBmb3IgdGhlIFJJU0MtViBNaWNyb2NvbmZlcmVu
Y2UgMjAyNCBpcwpub3cgb3Blbi4gRG9u4oCZdCBtaXNzIHlvdXIgY2hhbmNlIHRvIHN1Ym1pdCBh
IHRvcGljIHByb3Bvc2FsIQoKVGhlIGRlYWRsaW5lIGZvciB0b3BpYyBzdWJtaXNzaW9ucyBpcyBK
dWx5IDE1LCAyMDI0LiBQcm9wb3NhbHMgY2FuIGJlCnN1Ym1pdHRlZCBhdDogaHR0cHM6Ly9scGMu
ZXZlbnRzL2V2ZW50LzE4L2Fic3RyYWN0cy8KCkJlIHN1cmUgdG8gc2VsZWN0IHRoZSBSSVNDLVYg
TUMgdHJhY2sgZHVyaW5nIHN1Ym1pc3Npb24uCgpEdWUgdG8gYW4gdW5wcmVjZWRlbnRlZCBudW1i
ZXIgb2Ygc3VibWlzc2lvbnMgdGhpcyB5ZWFyLCB0aGUgUklTQy1WCk1pY3JvY29uZmVyZW5jZSBt
YXkgYmUgc2hvcnRlbmVkIHRvIDEuNSBob3VycyAobmFubyBjb25mZXJlbmNlKQppbnN0ZWFkIG9m
IHRoZSB1c3VhbCAzLWhvdXIgZm9ybWF0LiBUb3BpY3Mgd2lsbCBiZSBhY2NlcHRlZCBvbiBhCnJv
bGxpbmcgYmFzaXMgZHVlIHRvIHRoZSBsaW1pdGVkIG51bWJlciBvZiBzbG90cy4KCkxQQyAyMDI0
IHdpbGwgdGFrZSBwbGFjZSBpbiBWaWVubmEsIEF1c3RyaWEsIG9uIFNlcHRlbWJlciAxOC0yMC4K
Rm9yIG1vcmUgZGV0YWlscywgdmlzaXQ6IGh0dHBzOi8vbHBjLmV2ZW50cy9ldmVudC8xOC8uCgpV
cGRhdGUgb24gdGhlIG1pY3JvY29uZmVyZW5jZSBzaXR1YXRpb246Cmh0dHBzOi8vbHBjLmV2ZW50
cy9ibG9nL2N1cnJlbnQvaW5kZXgucGhwLzIwMjQvMDUvMTMvdXBkYXRlLW9uLXRoZS1taWNyb2Nv
bmZlcmVuY2Utc2l0dWF0aW9uLwoKQmVzdCByZWdhcmRzLApBdGlzaCAmIFBhbG1lcgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
