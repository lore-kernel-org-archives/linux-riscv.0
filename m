Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE2ACE7A94
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 13:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=64jmbmsKDVpZ+8HV9r7NPrj2w6/nnhi0Lol7OJb9NHs=; b=OI8BCGGDNYBuAF
	bhimXGGlHMOfTVU3hp6S3rEUKmAZfLCvztMEhoB5QWL3udZJqvt4pM1rxCNxp7ErmjxoOSFXTUo3i
	u0ALZ32Je8DrxcxDOFa/kmW1fucbuPlJxqRytYVzBZIT6NRTTTxpdR3/xbM1PiKpBQsLpEOG/jQSf
	LwEJ9FtM1EinzSrUy9vzwqJH6kwIxB6OfRMp/F8FusP/gZh23bs14fQKNDFbD0/iHg9xqub6oC5fu
	pyfp35d9+knk0LgHdYreYhZrYnmfHk98iHV9oiO3ZDVIdlPp8MOkbGXRefoAD/vI9qzA51vtf9Ddh
	G41Kywj/7YypmaPCrTIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkleD-00EKtc-00;
	Mon, 25 Sep 2023 13:29:13 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkleA-00EKsh-2Y
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 13:29:12 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9b29186e20aso120702366b.2
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 06:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1695648547; x=1696253347; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64elMD0kcTr1ULMmOb+NYn360WhmBGuybyf3ij2d3Kw=;
        b=Ry/M3Z1MdWuHnyjWr2CqabxSgdnZKBCeOBidHZovvYyxzNcj8S7I50Prxt/5APTvgK
         6sbAOvregn+w/P6LO9L6XNZn+7U0TmdFiLgky5iIDo1v4aamamQmS9Pok1ZImynVeeIe
         I6heDPz9uZl9TP1lGF3luJ5ljUo4Spb8fNal2J/dvAUBhWSVCm1cqyerJCT/hm3WRpMf
         S9pzH8JJAFz+Ry0oyvNzLMsyuYIE1C/Kmdp+fxZcBPK4uWH0f+q7qSOT5twh76eZ0P+p
         vXEpfs8Vxqj6w+rySfRsGryRATn0iVNV3yUqs7t8ZYlq+kObKDokQwzU2tKdAig3jQZG
         6uJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695648547; x=1696253347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64elMD0kcTr1ULMmOb+NYn360WhmBGuybyf3ij2d3Kw=;
        b=A3GEgxKuWS6zwXOCXXL9HWw2Khex3WpJnB4wtWSvyk8ZNV9B4TKrbeJT78fdUpw1ur
         u7b7rlT34PKb7UmI9xg2GFKz/oQE/GhUYMig+HG5u1wQ/JR7H65035TcYDcIYL0FPGo9
         /d6yZuHocn18n4net2+rhByng3RWw5eD9DPanjBkopT7bnSNZ4B0vKorJ9fWBu20Uii+
         QPR5QhQU+67t8a1Mna9jmGUaC7fMymrfBXqNYRPisEHN2PCdBtr3in0F/qod31UdbXFS
         qSPR1kt8L1+X8RG30tIAJ/ldeKbRHUzeflgnspkvAjnJfrYe5jpWjNWCbBbYe/dFSLrx
         +upA==
X-Gm-Message-State: AOJu0Yz//KRQ21wHN3iHX0vjulDKTVxNTpkEzsMxtI+kLQ6+VsVwLlbt
	wn7P5MAH5x35x/28gLbpwjSRkVHobgU3wjjsjdpkyw==
X-Google-Smtp-Source: AGHT+IFU98BrKDY6asjaVozdipixqtBtcb5MwfU18IMVWq2Ro8VwTuWdW47AcpbskRnS+8vdaxisC/e7AIYTBapc/Kw=
X-Received: by 2002:a17:906:3015:b0:9a5:c3fe:a4ef with SMTP id
 21-20020a170906301500b009a5c3fea4efmr5102951ejz.29.1695648546912; Mon, 25 Sep
 2023 06:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230817162344.17076-4-ajones@ventanamicro.com>
In-Reply-To: <20230817162344.17076-4-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 25 Sep 2023 18:58:55 +0530
Message-ID: <CAAhSdy1DFpHWGo23zWksvQKJgsqsZ479uOHL9VRt3o1e_d=kEw@mail.gmail.com>
Subject: Re: [PATCH 0/2] RISC-V: KVM: A couple kselftests improvements
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	atishp@atishpatra.org, haibo1.xu@intel.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_062911_049480_4992DDE6 
X-CRM114-Status: UNSURE (   9.75  )
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

T24gVGh1LCBBdWcgMTcsIDIwMjMgYXQgOTo1M+KAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gQWRkIHRoZSByaXNjdiBrc2VsZnRlc3RzIHRlc3Qg
ZGlyIHRvIE1BSU5UQUlORVJTIGFuZCBpbXByb3ZlIHRoZQo+IG1haW50YWluYWJpbGl0eSBvZiB0
aGUgYXJyYXlzIGluIHRoZSBnZXQtcmVnLWxpc3QgdGVzdC4KPgo+IFRoZXNlIHRlc3RzIGFyZSBi
YXNlZCBvbiBrdm0tcmlzY3YvcmlzY3Zfa3ZtX3F1ZXVlLgo+Cj4gQW5kcmV3IEpvbmVzICgyKToK
PiAgIE1BSU5UQUlORVJTOiBSSVNDLVY6IEtWTTogQWRkIGFub3RoZXIga3NlbGZ0ZXN0cyBwYXRo
Cj4gICBLVk06IHNlbGZ0ZXN0czogQWRkIGFycmF5IG9yZGVyIGhlbHBlcnMgdG8gcmlzY3YgZ2V0
LXJlZy1saXN0CgpRdWV1ZWQgdGhpcyBzZXJpZXMgZm9yIExpbnV4LTYuNwoKVGhhbmtzLApBbnVw
Cgo+Cj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAx
ICsKPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgICAgICAgIHwgNzYg
KysrKysrKysrKy0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyks
IDM1IGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjQxLjAKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
