Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1864DC43327
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 06:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8e1wTGgLi1Je7r6YN7rYAK2z91oP3ojYakWDPb32jlY=; b=cGfqTg+xCmqNO6
	QVaeKNeWO8O07P3HJz3DSF61+63nLvb6o2tICYSi6/D0Ejzc053FfDOAyLM91TpZIBx58JqRMcXgI
	XPbBkIH50ZAqfa+sUqiYy5FY08+so3iF207IsdlSjJ1qR5Htm5PhYIVh2JSjfMEgEM68N3hV3Idrm
	/hJZfEhNW1hjUIgw5mBxx6mTMtYHKlXLlHF1B7wnTnpofGq2TmIwKA7UtwDF0Z2dvP7sICbDLaSS0
	Ne1nKUpLGmjTWoPIV4f6ENbZvzB2TMgDCAU2/2BauDiNMRCsMsvaNNqRzTZfCUPSJ1Jy/VQAecj3z
	Kf04skxdaJSbgIS5gYzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMqA-0000000CDsQ-2TPW;
	Sat, 27 Jun 2026 06:48:34 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMq8-0000000CDrw-1yfr
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jun 2026 06:48:34 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-470174001a0so300820f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2026 23:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782542910; x=1783147710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rYfEs2pvBhx7gYc578DZEus3ro6qJzWud0f6V2w20U=;
        b=QDDOHkXsNMhYrgeM6GUiDQZtRkvOY3dNP8VQeVCQFwrpXPG3PJc4/QDk/PJysFQRWM
         RJvo/2910mrDBBx6zSecOsi0FhhwXqJJi3hJtHNgD8I6aXvlpbCVzs4XQ6TBUMTl4DHv
         sMN1pN1eJjHcmZQFqvbVInrn+xnM3dsRagiUPurVmtKI8u3tEwxrSxQw1v9pDcfUHXNx
         +veXIdpwY2PWvBtWNXx2WH7pk/Og+1MLj1hyePEH7MH4ohfRAHO4A5F9f644vH0g+pEN
         x7aIUxJVAGDjSUxXZNBtcwbW8ekeOLBVfFL4cJ1NDf2TGMXtPlsVZ8LKFbtBpwtX2ghB
         FqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782542910; x=1783147710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+rYfEs2pvBhx7gYc578DZEus3ro6qJzWud0f6V2w20U=;
        b=qiCCsMWiZICO4n7lBYawLa/76Mvx51nYGn/jC3Tx0WmPKFx9MgqfXjZFcInKcaQfc9
         ycrxZRpfoup56C49k4QaGy2x/gylN8ogK8i+elEtVaYVlipfrY5gMxnPtYBFeVbNcADG
         4gRe8rTwcFxOf4vPoCIs+E+FZ9EXBne8w8VwRpij0zFRzGXjyyhfZXawZFJKbzYSF5Cq
         QfP0Al2KSyGYFaD1Te9Fg+Jai1QPbjhkA1iRsqVtFvavoOpg1nMFHFeLWO7NVsWv61DG
         g2c3tmkfsjHsxod2sZmg3/ts7L8E2cRAFincyCUf4iJz3UOWjMHBgM9biCnJD0qI5/Oj
         0/Nw==
X-Forwarded-Encrypted: i=1; AFNElJ9WHtYMm1GnuJFMpoNKnOpJ0iE2x7wjje0MxAgB3qVO8sTAtUeDdSEp6S5kBf3YPCIbODErNigyg3MQ4g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx612FhJYRrErGB0IgWGFgXLBQNJIGDmqoAhPfFVWvIHK4VsZDp
	6xHqIqcnXBTSyB+PtNIIcCrBFfyGeoV3LyqWN6eLItlqw5dmGThRedIhPbLsZQ==
X-Gm-Gg: AfdE7cllvuOEuJbEF5p+RnFfE+NIm5I4OlloFnCa84JJqYQWf9gWNWMoq7S9FiPpTVZ
	J6NE9ORah29nZEdvaqXJM/lYHSj/mlC/gv1ud+Soni+y6deNwmHGzmVoAChxZsEJl/JfZaZbTF7
	M6A7ER/8DyV5SMiljwzmmxdBlf1ZsMmV3N7nkpAppHRdut6msv5SCXErCTnotyc2M1TvVBv2tGo
	sVSEVQplOJRop6sxOtJN05jBUjLOfh0UJkuO/U3L2h5ZDZ9q2RWCMNG698gq32yeTdguC0ek+qo
	1Khx5fAMWLy2ulJl1DEAkZwd1QNb7MCGVXTr9mPoBsh3dLmh4uRCXtmQt/sL7NhIE6+aIQlT2tM
	kV6YZvbIJEKsOA9NRAQb07rjfRDWdxZnlRLYzIgPWBCTvZu4MzenIy6OAAbJhA1glE+cxHBSlWw
	s7oA8TnRLmoBzoV1lCP8pJrOrt9E7lu21GeTS9Cmu6B/ljN0+OGDDZ2Ssy23eqKPCyFw==
X-Received: by 2002:a05:600c:1c17:b0:492:7019:caca with SMTP id 5b1f17b1804b1-4927019cb17mr63681665e9.26.1782542910213;
        Fri, 26 Jun 2026 23:48:30 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46dcbac0c9dsm22289931f8f.19.2026.06.26.23.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 23:48:29 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: daniel.lezcano@kernel.org, tglx@kernel.org,
 Felix Yan <felixonmars@archlinux.org>
Cc: wens@kernel.org, samuel@sholland.org, indrek.kruusa@gmail.com,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-riscv@lists.infradead.org, Felix Yan <felixonmars@archlinux.org>,
 stable@vger.kernel.org
Subject: Re: [PATCH] clocksource/drivers/timer-sun4i: Advertise a real minimum delta
Date: Sat, 27 Jun 2026 08:48:28 +0200
Message-ID: <cyKZfOi8QVGppYlWqaO5QA@gmail.com>
In-Reply-To: <20260624220434.4183732-1-felixonmars@archlinux.org>
References: <CA+fTLhgLmTY+exGujKf8OYYQvcEW5X5NJ_5sLq2AYL6zER2c0A@mail.gmail.com>
 <20260624220434.4183732-1-felixonmars@archlinux.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_234832_526143_B7E36C40 
X-CRM114-Status: UNSURE (   8.31  )
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

RG5lIMSNZXRydGVrLCAyNS4ganVuaWogMjAyNiBvYiAwMDowNDozNCBTcmVkbmplZXZyb3Bza2kg
cG9sZXRuaSDEjWFzIGplIEZlbGl4IFlhbiBuYXBpc2FsKGEpOgo+IHN1bjRpX2Nsa2V2dF9uZXh0
X2V2ZW50KCkgY29tcGVuc2F0ZXMgZm9yIHRoZSB0aW1lciBzdG9wL3N0YXJ0Cj4gc3luY2hyb25p
emF0aW9uIGRlbGF5IGJ5IHByb2dyYW1taW5nIGV2dCAtIFRJTUVSX1NZTkNfVElDS1MgaW50byB0
aGUKPiBoYXJkd2FyZSBpbnRlcnZhbCByZWdpc3Rlci4gVGhlIGNsb2NrZXZlbnQgZGV2aWNlIGN1
cnJlbnRseSBhZHZlcnRpc2VzCj4gVElNRVJfU1lOQ19USUNLUyBhcyBtaW5fZGVsdGFfdGlja3Ms
IHNvIHRoZSBjbG9ja2V2ZW50cyBjb3JlIGlzIGFsbG93ZWQKPiB0byBjYWxsIHNldF9uZXh0X2V2
ZW50KCkgd2l0aCBldnQgPT0gVElNRVJfU1lOQ19USUNLUy4KPiAKPiBUaGF0IHByb2dyYW1zIGEg
emVyby10aWNrIGludGVydmFsLiBXaXRoIG9uZXNob3QvaGlnaHJlcy9ub2h6IHRpbWVyCj4gb3Bl
cmF0aW9uIHRoaXMgY2FuIGxlYXZlIHRoZSBuZXh0IGV2ZW50IHN0dWNrLCB3aGljaCB3YXMgb2Jz
ZXJ2ZWQgYXMgYQo+IGJvb3QgaGFuZyBvbiBBbGx3aW5uZXIgRDEgYWZ0ZXIgdGhlIGNsb2NrZXZl
bnRzIGNvcmUgc3RhcnRlZCByZXVzaW5nCj4gZm9yY2VkIG1pbmltdW0tZGVsdGEgZXZlbnRzLgo+
IAo+IEFkdmVydGlzZSBvbmUgZXh0cmEgdGljayBpbnN0ZWFkLCBzbyB0aGUgc21hbGxlc3QgZXZl
bnQgYWNjZXB0ZWQgYnkgdGhlCj4gY29yZSBzdGlsbCBwcm9ncmFtcyBhdCBsZWFzdCBvbmUgaGFy
ZHdhcmUgdGljayBhZnRlciB0aGUgc3luY2hyb25pemF0aW9uCj4gY29tcGVuc2F0aW9uLgo+IAo+
IEZpeGVzOiAxMmUxNDgwYmNiNDkgKCJjbG9ja3NvdXJjZTogc3VuNGk6IFJlcG9ydCB0aGUgbWlu
aW11bSB0aWNrIHRoYXQgd2UgY2FuIHByb2dyYW0iKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwu
b3JnCj4gUmVwb3J0ZWQtYnk6IEluZHJlayBLcnV1c2EgPGluZHJlay5rcnV1c2FAZ21haWwuY29t
Pgo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvQ0ErZlRMaGdM
bVRZK2V4R3VqS2Y4T1lZUXZjRVc1WDVOSl81c0xxMkFZTDZ6RVIyYzBBQG1haWwuZ21haWwuY29t
Lwo+IEFzc2lzdGVkLWJ5OiBDb2RleDpncHQtNS41Cj4gU2lnbmVkLW9mZi1ieTogRmVsaXggWWFu
IDxmZWxpeG9ubWFyc0BhcmNobGludXgub3JnPgoKQWNrZWQtYnk6IEplcm5laiBTa3JhYmVjIDxq
ZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+CgpCZXN0IHJlZ2FyZHMsCkplcm5lagoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
