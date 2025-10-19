Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC7DCCD195
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Oct 2025 08:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iN9rgHx0sPwPzrdimZoArhA7E+ZgU0x0c1AK1DDlVx0=; b=EClzOfgM63bKtN
	JHsmcd6beWWw7G8IV6ovcLim3pgI/gKY2WZ1rISzK6SoxZc8qu3iugEDrxS8kLlbonUVBPuahxbXZ
	jmCjD8jQMIRtRb4rWXeC2RQ9hMwpxltnzgaE324kmwUFaliBaLIaqXQx2OIMgBh844lBaMUM7aP6s
	13kJVSjH8cBTHrFfGnoybkE1B5/DEwvCq1WtCc14juzkBbiK0SGLPpWWPTM4n4aW7TArSTViF0aQx
	4edvfho8a5VBoMw4Ai0M1jXYvOsUZmg6ykG0mfoDIVEavcgL/kgOy9XhN3dJFuciY9bYTFY4f7RXF
	KosuunuK+QbTBiQhCWwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAOVP-0000000AoJd-13cR;
	Sun, 19 Oct 2025 08:11:07 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAOVK-0000000AoIq-1gNt
	for linux-riscv@lists.infradead.org;
	Sun, 19 Oct 2025 08:11:04 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-781421f5bf5so36686507b3.3
        for <linux-riscv@lists.infradead.org>; Sun, 19 Oct 2025 01:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760861461; x=1761466261; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JD5EhU3dMvt2TzDGGngYx4VWjKCENlPlTrXXievwr0=;
        b=DRbr6tJmyVy134flu/law9VA2jMwuYUc+ZCnFOoZ6LjDoXQ7Dr7NT+knztI3D/37m+
         csOEPkG3JblE5/NpCz5KFr3+Tf/91zS8dl0mG1hctcRN+DGCwiio1tldcFrqShSV2wTq
         YVZ4XmjXlbVZlwM7nFERTogm0nWaC6uI9uYI2FO67Yxn3lxRbTPPO6EIeRuE0h0FwO57
         arX0cNZgbnsmQwjBYGtlocMzMQayHcLAa7MH6A+hOhYsjltUHQGPTiEMYXerSo4ttEp9
         scba6C74MP8AsNxMtXxCJvB2Usu0Zc1/rH7SNS4tqZfHXt9zIz8/m76XDreLCbZyJnUA
         ILvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760861461; x=1761466261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0JD5EhU3dMvt2TzDGGngYx4VWjKCENlPlTrXXievwr0=;
        b=oGQ2OaYCQFeSC1PFjWL1QzHYX0ztTQDzU3G1R5BkE0Mbs6ttP0xO1ZLo9a2xUqv3tC
         1Nf7B9Dx2O5LLHcgeUGkyom/BD21hefDjtKWncFB8jDPXOUNhJ78V56aMqRtaC+v146Q
         BfwHJuh87FKGNO7bl0+bENp327HCk1Z1hoQzLb0CqFARqHx8Ivd5Y+GGMWx8VmlZOhGs
         pIhnoy+IxevFg4LroWehOLW5kCGKCn7WaTk+IZuiiiPvzqv0hhDyRkLH//s/WmigIJ3r
         Byx2ve/7tBYo+BODuFlaVkfwUIFsvf6m8jx+ZqP/jNfR0lLe8VNmxYmZWrbASQbsgmWb
         TzZw==
X-Forwarded-Encrypted: i=1; AJvYcCVHqGzjVtPYFg62n8k2Q0GfYOHx30OpVlSlsfFaEUEazaZLMCpO/LlGeEyPV0o3enu6Y7PW+SrrMv9J3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yym16e2dF81E5Kc8MEoHHAIMUPyq8NYHzytcSJcomfDr+Bfx3of
	kt4gQtVjb6AZpt81NI330MrxkIMrJtjCeEob9Es0Zme7MQLh8rxv3AA2WCnHQ14lK5J1ZEWo47y
	F4Jf5ubiH15uibqItOphDE2sjVoujMKY=
X-Gm-Gg: ASbGncs/2FzqDO3EdIyz5vdG+SxvaGHxwPnRdyByGGigNreyM3nOK1WnPxjSLhAX0gI
	HeVoI66s64vGmFM93ldJimjgg5WPIRWkjIqODNpbowgnx8Ro86LIAKnLTqA1CK2B7S7v9/6NPwN
	BNvUcyg6uzWM8+BPwP2oinOEi7RlDYUCstlQJ+AvJwaDxUPtazsiQbve535y3ixSYLZMaNCveF8
	JDR+NOfS07+ayAg4XqL+CjDrwzYy9IFlQkZh+R8n70JAKybRK9ABuKI1wKs73rzFOkBRu2A0uk=
X-Google-Smtp-Source: AGHT+IEDp/usYEtVSaz10lwwm2/rh8YYcBuxag2F0nuBjSfSMoio/EijPl9t2f1PGKCDHr/mRoxnx6oC2CKJ7h3r2Ic=
X-Received: by 2002:a05:690c:31e:b0:782:9037:1491 with SMTP id
 00721157ae682-7837780ba2dmr109813007b3.42.1760861461100; Sun, 19 Oct 2025
 01:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20241202010844.144356-16-ebiggers@kernel.org> <20251019060845.553414-1-safinaskar@gmail.com>
In-Reply-To: <20251019060845.553414-1-safinaskar@gmail.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Sun, 19 Oct 2025 11:10:25 +0300
X-Gm-Features: AS18NWAhDVf2aU8hB0qWERPwO9zi-ils_dPukaoQchmqqRauvEb3B93Zz-69KFg
Message-ID: <CAPnZJGAb7AM4p=HdsDhYcANCzD8=gpGjuP4wYfr2utLp3WMSNQ@mail.gmail.com>
Subject: Re: [PATCH v4 15/19] lib/crc32: make crc32c() go directly to lib
To: ebiggers@kernel.org
Cc: ardb@kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_011102_460052_0049D0AB 
X-CRM114-Status: GOOD (  10.17  )
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

T24gU3VuLCBPY3QgMTksIDIwMjUgYXQgOTowOeKAr0FNIEFza2FyIFNhZmluIDxzYWZpbmFza2Fy
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBFcmljIEJpZ2dlcnMgPGViaWdnZXJzQGtlcm5lbC5vcmc+
Ogo+ID4gTm93IHRoYXQgdGhlIGxvd2VyIGxldmVsIF9fY3JjMzJjX2xlKCkgbGlicmFyeSBmdW5j
dGlvbiBpcyBvcHRpbWl6ZWQgZm9yCj4KPiBUaGlzIHBhdGNoIChpLiBlLiAzOGE5YTUxMjFjM2Ig
KCJsaWIvY3JjMzI6IG1ha2UgY3JjMzJjKCkgZ28gZGlyZWN0bHkgdG8gbGliIikpCj4gc29sdmVz
IGFjdHVhbCBidWcgSSBmb3VuZCBpbiBwcmFjdGljZS4gU28sIHBsZWFzZSwgYmFja3BvcnQgaXQK
PiB0byBzdGFibGUga2VybmVscy4KCk9vcHMuIEkganVzdCBub3RpY2VkIHRoYXQgdGhpcyBwYXRj
aCByZW1vdmVzIG1vZHVsZSAibGliY3JjMzJjIi4KQW5kIHRoaXMgYnJlYWtzIGJ1aWxkIGZvciBE
ZWJpYW4ga2VybmVsIHY2LjEyLjQ4LgpQcmV2aW91c2x5IEkgdGVzdGVkIG1pbmltYWwgYnVpbGQg
dXNpbmcgIm1ha2UgbG9jYWxtb2Rjb25maWciLgpOb3cgSSB0cmllZCBmdWxsIGJ1aWxkIG9mIERl
YmlhbiBrZXJuZWwgdXNpbmcgImRwa2ctYnVpbGRwYWNrYWdlIi4KQW5kIGl0IGZhaWxlZCwgYmVj
YXVzZSBzb21lIG9mIERlYmlhbiBmaWxlcyByZWZlcmVuY2UgImxpYmNyYzMyYyIsCndoaWNoIGlz
IG5vdCBhdmFpbGFibGUuCgpTbywgcGxlYXNlLCBkb24ndCBiYWNrcG9ydCB0aGlzIHBhdGNoIHRv
IHN0YWJsZSBrZXJuZWxzLgpJJ20gc29ycnkuCgoKCi0tIApBc2thciBTYWZpbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
