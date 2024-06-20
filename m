Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAFFC27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 06:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5FFImvA/KveISVHi50mt1PP0VWrCRXjkxSHF0njfPKs=; b=YfY4UPCWId0F9m
	r9HOz34QuJMXL3nQ5BefM/usSKiQG95wBhyaW3DXaT0Duqonrx9Yam/l5bLryhkoXrxIHqjrxx0Ra
	Kz8F8YDpMlHo5DjfMjbNC9HYtQfJlU6XZtlX+85KWl1lgCOQ9zb0DVmPVcp9rvcfmmvoCm3eCkv6c
	bjXo1S7Zdg3u1El7jNoJwinVx+kH4y18zlNE3FovBVfzEGVmAJhNcAOnajxB2VgbazURpbBV2qjCc
	cn0GYevTU1jfR3Gy7sZUpEviWMZmsrUSeAVfT+NsKLOQ8JEb9wCkbyi28bLt+C8zZrDLZecI/enhO
	ICxdPtGiN2ndqsdJ07eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKBiW-00000003sae-3HX3;
	Thu, 20 Jun 2024 06:56:20 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKBiU-00000003sZk-14Iz
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 06:56:19 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-63267c30eaaso4963827b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 23:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718866576; x=1719471376; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yab6t2QuHd3qRnOjOue/gVivXnSlhEWX5CWnQjI/lMo=;
        b=YIM2F6bD4epLVUovgRnMPQ/P5KIienRsFHaLuvUjPfYPSK5zdwNfz3I7MoEQd+rZ9y
         dp7Mmmnvd01rbstw0P9Btg5IMHf+VhMyS0D4VVVgNNKeCbprlfF1RejzqpKDr+PE+vDm
         VWQxdpPvXpAIas4XXo1fEfgCBsmVdNtOFzZVLQKTjNJpRHraPnZsmjsnbH3sp13AyTFS
         mihaj1tMUVS9U/y00mW2YyTC2CHTckwBDGgcH8JOAM6og+3d9/AYlNid+rqXgxkSrGro
         /r8Qp0NLNpLuwi6VGdb0P8PBbRH8f1gagD4JKs+sW1LbIl4YuWbFZgxdw7fNKicYcVf4
         zJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718866576; x=1719471376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yab6t2QuHd3qRnOjOue/gVivXnSlhEWX5CWnQjI/lMo=;
        b=Df+Yum0S4eDvOQ6nWdaUajbTD8l/uu7M7Ob4BIg6gIzcsQG9EfDOI4sdFnsgpbhy2u
         pa/P+vAr+zmHQWxmD7XnqJvHDOCAU0D0qehIMLznD+8ADbYxxtytS3NfwHCv8ulYDaKv
         EYMsUezA9uHW9QFBSfk3wn+mU0jgKtFq0M9NFW+5hWM2P9sUj6Ph09bLskBrdViOS8JN
         dV5qCp8OF6LxWlF5Fm6HO/stC9dfjW3u1Ubyww2qGa7Vm0Su+MdgWR4/PheowTyHy/Qh
         ml8NK1zGj7M2vBc/bFP13gNoBlGBF4HgZOHlLvZqEtT1LiguAqcTpKeRq0j2NciKCtBE
         XdIw==
X-Forwarded-Encrypted: i=1; AJvYcCWjDDfyrkg3gfIi0dz3eUTSV1rNfvu7dfINF73BRQZJow17EvFudcQA3QjX62ZwrwH9ODAjB5vZCgIJfMKM2rJaAZlVteICRp6K4dxOVbGa
X-Gm-Message-State: AOJu0YwowLqQxKtF5Ed+drDN7RqUWWdcOIdPZwCo/brf+1IGyYiX3Too
	USTtHB4kfKaaVbTgmpiqTuX7Cp3xxznfetjYAEvjFlT9OUsTSc+9y1Lb6dOFumaEWPw8g8ZtuFh
	3ERn/jYUEaXSu0o81mubrNFkGicc3bNrCSe6hLg==
X-Google-Smtp-Source: AGHT+IG0lreGB6+pEOuO/acZ0C3UFNmveVZT1X0qeHrhKCfnM3oPwFhmWsMpUEJyjAhqixw1BNMGSzYp4xtyVq+feSc=
X-Received: by 2002:a05:690c:d84:b0:630:de2f:79b3 with SMTP id
 00721157ae682-63a8e1db2aemr61384957b3.25.1718866576455; Wed, 19 Jun 2024
 23:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240620033434.3778156-1-quic_zhonhan@quicinc.com>
In-Reply-To: <20240620033434.3778156-1-quic_zhonhan@quicinc.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 20 Jun 2024 14:56:05 +0800
Message-ID: <CABgGipUjwgj=vVC31zMwJL_ro_L94ouGJHMm=E-wSjyervchTw@mail.gmail.com>
Subject: Re: [PATCH] riscv: signal: Remove unlikely() from WARN_ON() condition
To: Zhongqiu Han <quic_zhonhan@quicinc.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, ancientmodern4@gmail.com, 
	ben.dooks@codethink.co.uk, bjorn@rivosinc.com, quic_bjorande@quicinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_235618_363951_5C0BCEC8 
X-CRM114-Status: GOOD (  13.06  )
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

T24gVGh1LCBKdW4gMjAsIDIwMjQgYXQgMTE6MzXigK9BTSBaaG9uZ3FpdSBIYW4gPHF1aWNfemhv
bmhhbkBxdWljaW5jLmNvbT4gd3JvdGU6Cj4KPiAiV0FSTl9PTih1bmxpa2VseSh4KSkiIGlzIGV4
Y2Vzc2l2ZS4gV0FSTl9PTigpIGFscmVhZHkgdXNlcyB1bmxpa2VseSgpCj4gaW50ZXJuYWxseS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFpob25ncWl1IEhhbiA8cXVpY196aG9uaGFuQHF1aWNpbmMuY29t
Pgo+IFJldmlld2VkLWJ5OiBCam9ybiBBbmRlcnNzb24gPHF1aWNfYmpvcmFuZGVAcXVpY2luYy5j
b20+CgpSZXZpZXdlZC1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KCj4gLS0t
Cj4gIGFyY2gvcmlzY3Yva2VybmVsL3NpZ25hbC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC9zaWduYWwuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NpZ25hbC5jCj4gaW5kZXggNWEy
ZWRkN2YwMjdlLi5kY2QyODI0MTk0NTYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
c2lnbmFsLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zaWduYWwuYwo+IEBAIC04NCw3ICs4
NCw3IEBAIHN0YXRpYyBsb25nIHNhdmVfdl9zdGF0ZShzdHJ1Y3QgcHRfcmVncyAqcmVncywgdm9p
ZCBfX3VzZXIgKipzY192ZWMpCj4gICAgICAgICBkYXRhcCA9IHN0YXRlICsgMTsKPgo+ICAgICAg
ICAgLyogZGF0YXAgaXMgZGVzaWduZWQgdG8gYmUgMTYgYnl0ZSBhbGlnbmVkIGZvciBiZXR0ZXIg
cGVyZm9ybWFuY2UgKi8KPiAtICAgICAgIFdBUk5fT04odW5saWtlbHkoIUlTX0FMSUdORUQoKHVu
c2lnbmVkIGxvbmcpZGF0YXAsIDE2KSkpOwo+ICsgICAgICAgV0FSTl9PTighSVNfQUxJR05FRCgo
dW5zaWduZWQgbG9uZylkYXRhcCwgMTYpKTsKPgo+ICAgICAgICAgZ2V0X2NwdV92ZWN0b3JfY29u
dGV4dCgpOwo+ICAgICAgICAgcmlzY3Zfdl92c3RhdGVfc2F2ZSgmY3VycmVudC0+dGhyZWFkLnZz
dGF0ZSwgcmVncyk7Cj4gLS0KPiAyLjI1LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
